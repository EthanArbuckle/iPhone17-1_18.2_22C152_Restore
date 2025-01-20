@interface ECMessageBodyElement
- (BOOL)_hasValueForAttributes:(unint64_t)a3;
- (BOOL)isExternallyRetained;
- (ECMessageBodyElement)init;
- (ECMessageBodyParser)parser;
- (NSArray)nodes;
- (NSString)description;
- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3;
- (id)retainExternally;
- (unint64_t)getQuoteLevel;
- (unint64_t)quoteLevel;
- (unint64_t)valueForAttributes:(unint64_t)a3;
- (void)_setValue:(unint64_t)a3 forAttributes:(unint64_t)a4;
- (void)dealloc;
- (void)releaseExternally;
- (void)reset;
- (void)setNodes:(id)a3;
- (void)setParser:(id)a3;
@end

@implementation ECMessageBodyElement

- (ECMessageBodyElement)init
{
  v5.receiver = self;
  v5.super_class = (Class)ECMessageBodyElement;
  v2 = [(ECMessageBodyElement *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ECMessageBodyElement *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(ECMessageBodyElement *)self setParser:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  nodes = self->_nodes;
  uint64_t v4 = [(NSArray *)nodes countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(nodes);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          if (!v6) {
            id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v9 collectDescendanceIntoArray:v6];
        }
      }
      uint64_t v5 = [(NSArray *)nodes countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  v10.receiver = self;
  v10.super_class = (Class)ECMessageBodyElement;
  [(ECMessageBodyElement *)&v10 dealloc];
}

- (void)reset
{
  self->_validAttributes = 0;
  self->_attributes = 0;
  self->_nodes = 0;
  self->_quoteLevel = 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)getQuoteLevel
{
  return 0;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  [(ECMessageBodyElement *)self reset];
  nodes = self->_nodes;
  if (nodes != a3)
  {

    self->_nodes = (NSArray *)a3;
  }
}

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  return 0;
}

- (BOOL)_hasValueForAttributes:(unint64_t)a3
{
  return (a3 & ~self->_validAttributes) == 0;
}

- (void)_setValue:(unint64_t)a3 forAttributes:(unint64_t)a4
{
  unint64_t v4 = self->_attributes & ~a4 | a4 & a3;
  self->_validAttributes |= a4;
  self->_attributes = v4;
}

- (unint64_t)valueForAttributes:(unint64_t)a3
{
  if ((a3 & 7) != 0 && ![(ECMessageBodyElement *)self _hasValueForAttributes:7])
  {
    id v6 = [(ECMessageBodyParser *)[(ECMessageBodyElement *)self parser] newStringAccumulatorWithOptions:8 lengthLimit:0x7FFFFFFFFFFFFFFFLL];
    [v6 appendInnerTextWithConsumableNode:self];
    uint64_t v7 = (void *)[v6 accumulatedString];
    if ([v7 length])
    {
      if (!objc_msgSend(v7, "ec_isWhitespace"))
      {
        v8 = self;
        uint64_t v9 = 2;
        uint64_t v10 = 7;
        goto LABEL_9;
      }
      v8 = self;
      uint64_t v9 = 6;
    }
    else
    {
      v8 = self;
      uint64_t v9 = 1;
    }
    uint64_t v10 = 127;
LABEL_9:
    [(ECMessageBodyElement *)v8 _setValue:v9 forAttributes:v10];
  }
  if ((a3 & 8) != 0 && ![(ECMessageBodyElement *)self _hasValueForAttributes:8])
  {
    id v11 = [(ECMessageBodyParser *)[(ECMessageBodyElement *)self parser] newStringAccumulatorWithOptions:20 lengthLimit:0x7FFFFFFFFFFFFFFFLL];
    [v11 appendInnerTextWithConsumableNode:self];
    if (objc_msgSend((id)objc_msgSend(v11, "accumulatedString"), "ec_isAttribution"))
    {
      long long v12 = self;
      uint64_t v13 = 10;
      uint64_t v14 = 127;
    }
    else
    {
      long long v12 = self;
      uint64_t v13 = 0;
      uint64_t v14 = 8;
    }
    [(ECMessageBodyElement *)v12 _setValue:v13 forAttributes:v14];
  }
  if ((a3 & 0x80) != 0 && ![(ECMessageBodyElement *)self _hasValueForAttributes:128])
  {
    id v15 = [(ECMessageBodyParser *)[(ECMessageBodyElement *)self parser] newStringAccumulatorWithOptions:20 lengthLimit:0x7FFFFFFFFFFFFFFFLL];
    [v15 appendInnerTextWithConsumableNode:self];
    if (objc_msgSend((id)objc_msgSend(v15, "accumulatedString"), "ec_isAttributionPrefix"))
    {
      uint64_t v16 = self;
      uint64_t v17 = 130;
      uint64_t v18 = 131;
    }
    else
    {
      uint64_t v16 = self;
      uint64_t v17 = 0;
      uint64_t v18 = 128;
    }
    [(ECMessageBodyElement *)v16 _setValue:v17 forAttributes:v18];
  }
  if ((a3 & 0x10) != 0 && ![(ECMessageBodyElement *)self _hasValueForAttributes:16])
  {
    id v19 = [(ECMessageBodyParser *)[(ECMessageBodyElement *)self parser] newStringAccumulatorWithOptions:20 lengthLimit:0x7FFFFFFFFFFFFFFFLL];
    [v19 appendInnerTextWithConsumableNode:self];
    if (objc_msgSend((id)objc_msgSend(v19, "accumulatedString"), "ec_isForwardSeparator"))
    {
      v20 = self;
      uint64_t v21 = 18;
      uint64_t v22 = 31;
    }
    else
    {
      v20 = self;
      uint64_t v21 = 0;
      uint64_t v22 = 16;
    }
    [(ECMessageBodyElement *)v20 _setValue:v21 forAttributes:v22];
  }
  if ((a3 & 0x20) != 0 && ![(ECMessageBodyElement *)self _hasValueForAttributes:32])
  {
    id v23 = [(ECMessageBodyParser *)[(ECMessageBodyElement *)self parser] newStringAccumulatorWithOptions:20 lengthLimit:0x7FFFFFFFFFFFFFFFLL];
    [v23 appendInnerTextWithConsumableNode:self];
    if (objc_msgSend((id)objc_msgSend(v23, "accumulatedString"), "ec_isSignature"))
    {
      v24 = self;
      uint64_t v25 = 34;
      uint64_t v26 = 63;
    }
    else
    {
      v24 = self;
      uint64_t v25 = 0;
      uint64_t v26 = 32;
    }
    [(ECMessageBodyElement *)v24 _setValue:v25 forAttributes:v26];
  }
  if ((a3 & 0x40) != 0 && ![(ECMessageBodyElement *)self _hasValueForAttributes:64])
  {
    id v27 = [(ECMessageBodyParser *)[(ECMessageBodyElement *)self parser] newStringAccumulatorWithOptions:0 lengthLimit:0x7FFFFFFFFFFFFFFFLL];
    [v27 appendInnerTextWithConsumableNode:self];
    if (objc_msgSend((id)objc_msgSend(v27, "accumulatedString"), "ec_isHorizontalSeparator"))
    {
      v28 = self;
      uint64_t v29 = 66;
      uint64_t v30 = 127;
    }
    else
    {
      v28 = self;
      uint64_t v29 = 0;
      uint64_t v30 = 64;
    }
    [(ECMessageBodyElement *)v28 _setValue:v29 forAttributes:v30];
  }
  if (![(ECMessageBodyElement *)self _hasValueForAttributes:a3]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ECMessageBodyParser.m", 499, @"Not all requested attributes have a valid values");
  }
  return self->_attributes & a3;
}

- (unint64_t)quoteLevel
{
  unint64_t result = self->_quoteLevel;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = [(ECMessageBodyElement *)self nodes];
    unint64_t result = [(NSArray *)v4 count];
    if (result) {
      unint64_t result = objc_msgSend(objc_loadWeak((id *)&self->_parser), "quoteLevelForBodyNode:", -[NSArray objectAtIndex:](v4, "objectAtIndex:", 0));
    }
    self->_quoteLevel = result;
  }
  return result;
}

- (id)retainExternally
{
  ++self->_externalRetainCount;
  v2 = (NSArray *)[(NSArray *)self->_nodes copy];
  nodes = self->_nodes;
  if (v2 == nodes)
  {

    unint64_t v4 = self;
  }
  else
  {

    unint64_t v4 = self;
    self->_nodes = v2;
  }
  return v4;
}

- (void)releaseExternally
{
}

- (BOOL)isExternallyRetained
{
  return self->_externalRetainCount != 0;
}

- (NSString)description
{
  v3 = [[ECMessageBodyStringAccumulator alloc] initWithOptions:0 lengthLimit:81];
  [(ECMessageBodyStringAccumulator *)v3 appendInnerTextWithConsumableNode:self];
  uint64_t v4 = [(ECMessageBodyStringAccumulator *)v3 accumulatedString];
  uint64_t v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = (NSString *)objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; text=\"%@\">",
                     NSStringFromClass(v6),
                     self,
                     v4);

  return v7;
}

- (ECMessageBodyParser)parser
{
  return (ECMessageBodyParser *)objc_loadWeak((id *)&self->_parser);
}

- (void)setParser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end