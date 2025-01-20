@interface _ECParsedHTMLNode
- (BOOL)hasChildNodes;
- (NSString)htmlString;
- (NSString)tagName;
- (_ECParsedHTMLNode)firstChild;
- (_ECParsedHTMLNode)init;
- (_ECParsedHTMLNode)lastChild;
- (_ECParsedHTMLNode)nextSibling;
- (_ECParsedHTMLNode)parentNode;
- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3;
- (id)copyMutableConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3;
- (id)recursiveDescription;
- (unint64_t)endLocation;
- (unint64_t)startLocation;
- (void)addRecursiveDescriptionWithLevel:(unint64_t)a3 toString:(id)a4;
- (void)appendChild:(id)a3;
- (void)collectDescendanceIntoArray:(id)a3;
- (void)dealloc;
- (void)setEndLocation:(unint64_t)a3;
- (void)setHtmlString:(id)a3;
- (void)setNextSibling:(id)a3;
- (void)setParentNode:(id)a3;
- (void)setStartLocation:(unint64_t)a3;
@end

@implementation _ECParsedHTMLNode

- (_ECParsedHTMLNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)_ECParsedHTMLNode;
  v2 = [(_ECParsedHTMLNode *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(_ECParsedHTMLNode *)v2 setStartLocation:0x7FFFFFFFFFFFFFFFLL];
    [(_ECParsedHTMLNode *)v3 setEndLocation:0x7FFFFFFFFFFFFFFFLL];
  }
  return v3;
}

- (void)dealloc
{
  [(_ECParsedHTMLNode *)self setParentNode:0];
  [(_ECParsedHTMLNode *)self setNextSibling:0];
  [(_ECParsedHTMLNode *)self setHtmlString:0];
  v3.receiver = self;
  v3.super_class = (Class)_ECParsedHTMLNode;
  [(_ECParsedHTMLNode *)&v3 dealloc];
}

- (void)appendChild:(id)a3
{
  childNodes = self->_childNodes;
  if (childNodes)
  {
    objc_msgSend((id)-[NSMutableArray lastObject](childNodes, "lastObject"), "setNextSibling:", a3);
    v6 = self->_childNodes;
  }
  else
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_childNodes = v6;
  }
  [(NSMutableArray *)v6 addObject:a3];
  [a3 setParentNode:self];
}

- (BOOL)hasChildNodes
{
  return [(NSMutableArray *)self->_childNodes count] != 0;
}

- (_ECParsedHTMLNode)firstChild
{
  return (_ECParsedHTMLNode *)[(NSMutableArray *)self->_childNodes firstObject];
}

- (_ECParsedHTMLNode)lastChild
{
  return (_ECParsedHTMLNode *)[(NSMutableArray *)self->_childNodes lastObject];
}

- (NSString)tagName
{
  return 0;
}

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  return (id)[(NSMutableArray *)self->_childNodes copy];
}

- (id)copyMutableConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  return (id)[(NSMutableArray *)self->_childNodes mutableCopy];
}

- (void)collectDescendanceIntoArray:(id)a3
{
  v4 = (void *)[(NSMutableArray *)self->_childNodes mutableCopy];
  id v6 = v4;
  while ([v4 count])
  {
    uint64_t v5 = [v6 firstObject];
    [a3 addObject:v5];
    [v6 addObjectsFromArray:*(void *)(v5 + 8)];
    [v6 removeObjectAtIndex:0];
    v4 = v6;
  }
}

- (void)addRecursiveDescriptionWithLevel:(unint64_t)a3 toString:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v7 = a3;
    do
    {
      [a4 appendString:@"| "];
      --v7;
    }
    while (v7);
  }
  [a4 appendFormat:@"%@\n", -[_ECParsedHTMLNode description](self, "description")];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  childNodes = self->_childNodes;
  uint64_t v9 = [(NSMutableArray *)childNodes countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    unint64_t v12 = a3 + 1;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(childNodes);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) addRecursiveDescriptionWithLevel:v12 toString:a4];
      }
      while (v10 != v13);
      uint64_t v10 = [(NSMutableArray *)childNodes countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)recursiveDescription
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  [(_ECParsedHTMLNode *)self addRecursiveDescriptionWithLevel:0 toString:v3];
  return v3;
}

- (_ECParsedHTMLNode)parentNode
{
  return (_ECParsedHTMLNode *)objc_loadWeak((id *)&self->_parentNode);
}

- (void)setParentNode:(id)a3
{
}

- (_ECParsedHTMLNode)nextSibling
{
  return (_ECParsedHTMLNode *)objc_loadWeak((id *)&self->_nextSibling);
}

- (void)setNextSibling:(id)a3
{
}

- (NSString)htmlString
{
  return self->_htmlString;
}

- (void)setHtmlString:(id)a3
{
}

- (unint64_t)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(unint64_t)a3
{
  self->_startLocation = a3;
}

- (unint64_t)endLocation
{
  return self->_endLocation;
}

- (void)setEndLocation:(unint64_t)a3
{
  self->_endLocation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextSibling);
  objc_destroyWeak((id *)&self->_parentNode);
}

@end