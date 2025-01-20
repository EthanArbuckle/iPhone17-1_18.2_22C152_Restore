@interface ECMessageBodyParser
+ (BOOL)cacheRetainsNodes;
+ (BOOL)isLinebreakImpliedAfterTagName:(id)a3;
+ (BOOL)isLinebreakImpliedBeforeTagName:(id)a3;
- (BOOL)isLandmarkTagName:(id)a3;
- (BOOL)parse;
- (BOOL)shouldIgnoreTagWithTagName:(id)a3;
- (BOOL)shouldProceedParsing;
- (Class)messageBodyElementClass;
- (Class)messageBodyStringAccumulatorClass;
- (ECMessageBodyParser)init;
- (NSError)parserError;
- (id)getAvailableMessageBodyElement;
- (id)newStringAccumulatorWithOptions:(unint64_t)a3 lengthLimit:(unint64_t)a4;
- (unint64_t)messageBodyStringAccumulatorDefaultOptions;
- (unint64_t)options;
- (unint64_t)quoteLevelForBodyNode:(id)a3;
- (void)addSubparser:(id)a3;
- (void)dealloc;
- (void)didFindBodyElement:(id)a3;
- (void)didFindError:(id)a3;
- (void)didFinishParsing;
- (void)enqueueParagraphNode:(id)a3 withTagName:(id)a4;
- (void)flushParagraphNodes;
- (void)getLevel:(int64_t *)a3 quoteLevel:(int64_t *)a4 forBodyNode:(id)a5;
- (void)removeSubparser:(id)a3;
- (void)setFoundMessageBodyElementBlock:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)willBeginParsing;
@end

@implementation ECMessageBodyParser

os_log_t ___ef_log_ECMessageBodyParser_block_invoke()
{
  os_log_t result = os_log_create("com.apple.email", "ECMessageBodyParser");
  _ef_log_ECMessageBodyParser_log = (uint64_t)result;
  return result;
}

+ (BOOL)cacheRetainsNodes
{
  return 0;
}

- (ECMessageBodyParser)init
{
  v4.receiver = self;
  v4.super_class = (Class)ECMessageBodyParser;
  v2 = [(ECMessageBodyParser *)&v4 init];
  if (v2) {
    v2->_elementPool = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  elementPool = self->_elementPool;
  uint64_t v4 = [(NSMutableArray *)elementPool countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(elementPool);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) setParser:0];
      }
      uint64_t v5 = [(NSMutableArray *)elementPool countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  nodesStackCache = self->_nodesStackCache;
  if (nodesStackCache) {
    CFRelease(nodesStackCache);
  }
  nodesLevelCache = self->_nodesLevelCache;
  if (nodesLevelCache) {
    CFRelease(nodesLevelCache);
  }
  nodesQuoteLevelCache = self->_nodesQuoteLevelCache;
  if (nodesQuoteLevelCache) {
    CFRelease(nodesQuoteLevelCache);
  }
  v11.receiver = self;
  v11.super_class = (Class)ECMessageBodyParser;
  [(ECMessageBodyParser *)&v11 dealloc];
}

- (BOOL)parse
{
  return 0;
}

- (BOOL)shouldProceedParsing
{
  v5.receiver = self;
  v5.super_class = (Class)ECMessageBodyParser;
  BOOL v3 = [(ECMessageBodyParserObject *)&v5 shouldProceedParsing];
  if (v3) {
    LOBYTE(v3) = self->_parserError == 0;
  }
  return v3;
}

- (NSError)parserError
{
  v2 = self->_parserError;
  return v2;
}

- (id)newStringAccumulatorWithOptions:(unint64_t)a3 lengthLimit:(unint64_t)a4
{
  id v7 = objc_alloc([(ECMessageBodyParser *)self messageBodyStringAccumulatorClass]);
  unint64_t v8 = [(ECMessageBodyParser *)self messageBodyStringAccumulatorDefaultOptions] | a3;
  return (id)[v7 initWithOptions:v8 lengthLimit:a4];
}

- (void)setFoundMessageBodyElementBlock:(id)a3
{
  id foundMessageBodyElementBlock = self->_foundMessageBodyElementBlock;
  if (foundMessageBodyElementBlock != a3)
  {

    self->_id foundMessageBodyElementBlock = (id)[a3 copy];
  }
}

- (void)addSubparser:(id)a3
{
  subparsers = self->_subparsers;
  if (!subparsers)
  {
    subparsers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_subparsers = subparsers;
  }
  [(NSMutableArray *)subparsers addObject:a3];
}

- (void)removeSubparser:(id)a3
{
}

- (id)getAvailableMessageBodyElement
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  elementPool = self->_elementPool;
  uint64_t v4 = [(NSMutableArray *)elementPool countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(elementPool);
      }
      id v8 = *(id *)(*((void *)&v10 + 1) + 8 * v7);
      if (![v8 isExternallyRetained]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSMutableArray *)elementPool countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    if (v8) {
      return v8;
    }
  }
LABEL_11:
  id v8 = objc_alloc_init([(ECMessageBodyParser *)self messageBodyElementClass]);
  [v8 setParser:self];
  [(NSMutableArray *)self->_elementPool addObject:v8];

  return v8;
}

- (BOOL)isLandmarkTagName:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 compare:@"div" options:3]
    && [a3 compare:@"p" options:3]
    && [a3 compare:@"br" options:3])
  {
    return [a3 compare:@"blockquote" options:3] == 0;
  }
  return 1;
}

- (BOOL)shouldIgnoreTagWithTagName:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 compare:@"title" options:3]
    && [a3 compare:@"script" options:3])
  {
    return [a3 compare:@"style" options:3] == 0;
  }
  return 1;
}

+ (BOOL)isLinebreakImpliedBeforeTagName:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 compare:@"div" options:3]
    && [a3 compare:@"p" options:3]
    && [a3 compare:@"h1" options:3]
    && [a3 compare:@"h2" options:3]
    && [a3 compare:@"h3" options:3]
    && [a3 compare:@"h4" options:3]
    && [a3 compare:@"h5" options:3]
    && [a3 compare:@"h6" options:3])
  {
    return [a3 compare:@"li" options:3] == 0;
  }
  return 1;
}

+ (BOOL)isLinebreakImpliedAfterTagName:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 compare:@"div" options:3]
    && [a3 compare:@"br" options:3]
    && [a3 compare:@"p" options:3])
  {
    return [a3 compare:@"blockquote" options:3] == 0;
  }
  return 1;
}

- (Class)messageBodyStringAccumulatorClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)messageBodyStringAccumulatorDefaultOptions
{
  return 0;
}

- (Class)messageBodyElementClass
{
}

- (void)enqueueParagraphNode:(id)a3 withTagName:(id)a4
{
  if ([(id)objc_opt_class() isLinebreakImpliedBeforeTagName:a4]) {
    [(ECMessageBodyParser *)self flushParagraphNodes];
  }
  paragraphNodes = self->_paragraphNodes;
  if (!paragraphNodes)
  {
    paragraphNodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_paragraphNodes = paragraphNodes;
  }
  [(NSMutableArray *)paragraphNodes addObject:a3];
  if ([(id)objc_opt_class() isLinebreakImpliedAfterTagName:a4])
  {
    [(ECMessageBodyParser *)self flushParagraphNodes];
  }
}

- (void)flushParagraphNodes
{
  if ([(NSMutableArray *)self->_paragraphNodes count])
  {
    id v3 = [(ECMessageBodyParser *)self getAvailableMessageBodyElement];
    [v3 setNodes:self->_paragraphNodes];
    [(ECMessageBodyParser *)self didFindBodyElement:v3];
    paragraphNodes = self->_paragraphNodes;
    [(NSMutableArray *)paragraphNodes removeAllObjects];
  }
}

- (void)didFindBodyElement:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id foundMessageBodyElementBlock = (void (**)(id, id))self->_foundMessageBodyElementBlock;
  if (foundMessageBodyElementBlock) {
    foundMessageBodyElementBlock[2](foundMessageBodyElementBlock, a3);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  subparsers = self->_subparsers;
  uint64_t v7 = [(NSMutableArray *)subparsers countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(subparsers);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 shouldProceedParsing]) {
          [v11 messageBodyParser:self foundMessageBodyElement:a3];
        }
      }
      uint64_t v8 = [(NSMutableArray *)subparsers countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)willBeginParsing
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(ECMessageBodyParserObject *)self messageBodyParserWillBeginParsing:self];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  subparsers = self->_subparsers;
  uint64_t v4 = [(NSMutableArray *)subparsers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(subparsers);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) messageBodyParserWillBeginParsing:self];
      }
      uint64_t v5 = [(NSMutableArray *)subparsers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)didFinishParsing
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  subparsers = self->_subparsers;
  uint64_t v4 = [(NSMutableArray *)subparsers countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(subparsers);
        }
        long long v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v8 shouldProceedParsing]) {
          [v8 messageBodyParserDidFinishParsing:self];
        }
      }
      uint64_t v5 = [(NSMutableArray *)subparsers countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  elementPool = self->_elementPool;
  uint64_t v10 = [(NSMutableArray *)elementPool countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(elementPool);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * j) setParser:0];
      }
      uint64_t v11 = [(NSMutableArray *)elementPool countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
  [(NSMutableArray *)self->_elementPool removeAllObjects];
}

- (void)didFindError:(id)a3
{
  if (_ef_log_ECMessageBodyParser_onceToken != -1) {
    dispatch_once(&_ef_log_ECMessageBodyParser_onceToken, &__block_literal_global_13);
  }
  uint64_t v5 = _ef_log_ECMessageBodyParser_log;
  if (os_log_type_enabled((os_log_t)_ef_log_ECMessageBodyParser_log, OS_LOG_TYPE_ERROR)) {
    -[ECMessageBodyParser didFindError:](a3, v5);
  }
  if (!self->_parserError) {
    self->_parserError = (NSError *)a3;
  }
}

- (unint64_t)quoteLevelForBodyNode:(id)a3
{
  unint64_t v4 = 0;
  [(ECMessageBodyParser *)self getLevel:0 quoteLevel:&v4 forBodyNode:a3];
  return v4;
}

- (void)getLevel:(int64_t *)a3 quoteLevel:(int64_t *)a4 forBodyNode:(id)a5
{
  long long v14 = 0;
  value = 0;
  if (a5)
  {
    if (!self->_nodesStackCache)
    {
      if ([(id)objc_opt_class() cacheRetainsNodes]) {
        long long v9 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      }
      else {
        long long v9 = 0;
      }
      self->_nodesStackCache = CFArrayCreateMutable(0, 50, v9);
    }
    nodesLevelCache = self->_nodesLevelCache;
    if (!nodesLevelCache)
    {
      nodesLevelCache = CFDictionaryCreateMutable(0, 50, 0, 0);
      self->_nodesLevelCache = nodesLevelCache;
    }
    if (!self->_nodesQuoteLevelCache)
    {
      self->_nodesQuoteLevelCache = CFDictionaryCreateMutable(0, 50, 0, 0);
      nodesLevelCache = self->_nodesLevelCache;
    }
    if (!CFDictionaryGetValueIfPresent(nodesLevelCache, a5, (const void **)&value)
      || !CFDictionaryGetValueIfPresent(self->_nodesQuoteLevelCache, a5, (const void **)&v14))
    {
      -[ECMessageBodyParser getLevel:quoteLevel:forBodyNode:](self, "getLevel:quoteLevel:forBodyNode:", &value, &v14, objc_msgSend(a5, "parentNode", v14));
      value = (char *)value + 1;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && !objc_msgSend(@"blockquote", "compare:options:", objc_msgSend(a5, "tagName"), 1)
        && ((objc_opt_respondsToSelector() & 1) == 0
         || !objc_msgSend(@"cite", "compare:options:", objc_msgSend(a5, "getAttribute:", @"type"), 1)
         || !objc_msgSend(@"gmail_quote", "compare:options:", objc_msgSend(a5, "getAttribute:", @"class"), 1)))
      {
        long long v14 = (char *)v14 + 1;
      }
      CFIndex Count = CFArrayGetCount(self->_nodesStackCache);
      if (Count >= (uint64_t)value)
      {
        uint64_t v12 = Count + 1;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(self->_nodesStackCache, v12 - 2);
          CFDictionaryRemoveValue(self->_nodesLevelCache, ValueAtIndex);
          CFDictionaryRemoveValue(self->_nodesQuoteLevelCache, ValueAtIndex);
          CFArrayRemoveValueAtIndex(self->_nodesStackCache, v12 - 2);
          --v12;
        }
        while (v12 > (uint64_t)value);
      }
      CFArrayAppendValue(self->_nodesStackCache, a5);
      CFDictionarySetValue(self->_nodesLevelCache, a5, value);
      CFDictionarySetValue(self->_nodesQuoteLevelCache, a5, v14);
    }
  }
  if (a3) {
    *a3 = (int64_t)value;
  }
  if (a4) {
    *a4 = (int64_t)v14;
  }
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)didFindError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = objc_msgSend(a1, "ef_publicDescription");
  _os_log_error_impl(&dword_1BF11D000, a2, OS_LOG_TYPE_ERROR, "Did find error: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end