@interface ECMessageBodyOriginalTextSubparser
- (BOOL)_isElementQuotedForwardSeparator:(id)a3;
- (void)_consumeAnyLastTextElementAsAttribution:(BOOL)a3;
- (void)_consumeTextElement:(id)a3 isAttribution:(BOOL)a4;
- (void)dealloc;
- (void)messageBodyParser:(id)a3 foundMessageBodyElement:(id)a4;
- (void)messageBodyParserDidFinishParsing:(id)a3;
- (void)setFoundTextBlock:(id)a3;
- (void)setFoundWhitespaceBlock:(id)a3;
@end

@implementation ECMessageBodyOriginalTextSubparser

- (void)dealloc
{
  [(NSMutableArray *)self->_lastTextElements makeObjectsPerformSelector:sel_releaseExternally];

  [(ECMessageBodyElement_Private *)self->_lastNonWhitespaceTextElement releaseExternally];
  v3.receiver = self;
  v3.super_class = (Class)ECMessageBodyOriginalTextSubparser;
  [(ECMessageBodyOriginalTextSubparser *)&v3 dealloc];
}

- (void)setFoundTextBlock:(id)a3
{
  id foundTextBlock = self->_foundTextBlock;
  if (foundTextBlock != a3)
  {

    self->_id foundTextBlock = (id)[a3 copy];
  }
}

- (void)setFoundWhitespaceBlock:(id)a3
{
  id foundWhitespaceBlock = self->_foundWhitespaceBlock;
  if (foundWhitespaceBlock != a3)
  {

    self->_id foundWhitespaceBlock = (id)[a3 copy];
  }
}

- (void)_consumeTextElement:(id)a3 isAttribution:(BOOL)a4
{
  if ([a3 valueForAttributes:4])
  {
    id foundWhitespaceBlock = self->_foundWhitespaceBlock;
    if (foundWhitespaceBlock)
    {
      v8 = (void (*)(void))*((void *)foundWhitespaceBlock + 2);
      v8();
    }
  }
  else
  {
    if (self->_foundTextBlock)
    {
      uint64_t v9 = [a3 quoteLevel];
      if (v9) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = a4;
      }
      if ((self->_foundForwardSeparator || !v10)
        && (self->_foundText || ![a3 valueForAttributes:32])
        && v9)
      {
        [(ECMessageBodyOriginalTextSubparser *)self _isElementQuotedForwardSeparator:a3];
      }
      (*((void (**)(void))self->_foundTextBlock + 2))();
    }
    self->_foundText = 1;
  }
}

- (void)_consumeAnyLastTextElementAsAttribution:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  lastTextElements = self->_lastTextElements;
  uint64_t v6 = [(NSMutableArray *)lastTextElements countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(lastTextElements);
        }
        BOOL v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [(ECMessageBodyOriginalTextSubparser *)self _consumeTextElement:v10 isAttribution:v3];
        [v10 releaseExternally];
      }
      uint64_t v7 = [(NSMutableArray *)lastTextElements countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(NSMutableArray *)self->_lastTextElements removeAllObjects];
  [(ECMessageBodyElement_Private *)self->_lastNonWhitespaceTextElement releaseExternally];
  self->_lastNonWhitespaceTextElement = 0;
}

- (void)messageBodyParser:(id)a3 foundMessageBodyElement:(id)a4
{
  if (self->_lastNonWhitespaceTextElement)
  {
    unint64_t v6 = objc_msgSend(a4, "quoteLevel", a3);
    if (v6 > [(ECMessageBodyElement_Private *)self->_lastNonWhitespaceTextElement quoteLevel])
    {
      uint64_t v7 = [(ECMessageBodyElement_Private *)self->_lastNonWhitespaceTextElement valueForAttributes:8];
      if (!v7
        && ![(ECMessageBodyElement_Private *)self->_lastNonWhitespaceTextElement quoteLevel]
        && [(ECMessageBodyElement_Private *)self->_lastNonWhitespaceTextElement valueForAttributes:16])
      {
        self->_foundForwardSeparator = 1;
      }
      [(ECMessageBodyOriginalTextSubparser *)self _consumeAnyLastTextElementAsAttribution:v7 != 0];
    }
  }
  if ([(ECMessageBodyOriginalTextSubparser *)self _isElementQuotedForwardSeparator:a4])
  {
    uint64_t v8 = [(ECMessageBodyElement_Private *)self->_lastNonWhitespaceTextElement valueForAttributes:8];
    if (!v8) {
      self->_foundForwardSeparator = 1;
    }
    [(ECMessageBodyOriginalTextSubparser *)self _consumeAnyLastTextElementAsAttribution:v8 != 0];
    self->_lastNonWhitespaceTextElement = (ECMessageBodyElement_Private *)[a4 retainExternally];
  }
  if (self->_foundForwardSeparator)
  {
    [(ECMessageBodyOriginalTextSubparser *)self _consumeTextElement:a4 isAttribution:0];
  }
  else if ([a4 valueForAttributes:2])
  {
    if (![a4 valueForAttributes:4])
    {
      [(ECMessageBodyOriginalTextSubparser *)self _consumeAnyLastTextElementAsAttribution:0];
      self->_lastNonWhitespaceTextElement = (ECMessageBodyElement_Private *)[a4 retainExternally];
    }
    if (!self->_lastTextElements) {
      self->_lastTextElements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    [a4 retainExternally];
    lastTextElements = self->_lastTextElements;
    [(NSMutableArray *)lastTextElements addObject:a4];
  }
}

- (void)messageBodyParserDidFinishParsing:(id)a3
{
}

- (BOOL)_isElementQuotedForwardSeparator:(id)a3
{
  uint64_t v4 = [a3 valueForAttributes:16];
  if (v4) {
    LOBYTE(v4) = [a3 quoteLevel] == 1;
  }
  return v4;
}

@end