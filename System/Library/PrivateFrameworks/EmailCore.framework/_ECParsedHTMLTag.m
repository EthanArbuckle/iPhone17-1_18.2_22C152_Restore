@interface _ECParsedHTMLTag
- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3;
- (id)description;
- (id)tagName;
- (void)dealloc;
- (void)setTagName:(id)a3;
@end

@implementation _ECParsedHTMLTag

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_ECParsedHTMLTag;
  [(_ECParsedHTMLNode *)&v3 dealloc];
}

- (id)tagName
{
  return self->_tagName;
}

- (void)setTagName:(id)a3
{
  tagName = self->_tagName;
  if (tagName != a3)
  {

    self->_tagName = (NSString *)a3;
  }
}

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  id v5 = [(_ECParsedHTMLTag *)self tagName];
  if ([a3 isFull]) {
    return 0;
  }
  if (+[ECMessageBodyParser isLinebreakImpliedBeforeTagName:v5])
  {
    [a3 appendNewline];
  }
  v10.receiver = self;
  v10.super_class = (Class)_ECParsedHTMLTag;
  id v7 = [(_ECParsedHTMLNode *)&v10 copyMutableConsumableNodesAndAppendInnerTextToStringAccumulator:a3];
  if (+[ECMessageBodyParser isLinebreakImpliedAfterTagName:v5])
  {
    v8 = objc_alloc_init(_ECMessageBodyConsumableNewline);
    if (v7)
    {
      [v7 addObject:v8];
      v9 = 0;
    }
    else
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v8, 0);
    }
  }
  else
  {
    v9 = 0;
  }
  if (v7) {
    return v7;
  }
  else {
    return v9;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@>", -[_ECParsedHTMLTag tagName](self, "tagName")];
}

@end