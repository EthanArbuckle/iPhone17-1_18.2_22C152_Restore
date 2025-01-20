@interface IKDOMDocumentFragment
- (IKDOMElement)firstElementChild;
- (IKDOMElement)lastElementChild;
- (IKDOMHTMLCollection)children;
- (id)nodeName;
- (int64_t)nodeType;
- (unint64_t)childElementCount;
@end

@implementation IKDOMDocumentFragment

- (id)nodeName
{
  return @"#document-fragment";
}

- (int64_t)nodeType
{
  return 11;
}

- (IKDOMHTMLCollection)children
{
  v4.receiver = self;
  v4.super_class = (Class)IKDOMDocumentFragment;
  v2 = [(IKDOMNode *)&v4 children];
  return (IKDOMHTMLCollection *)v2;
}

- (IKDOMElement)firstElementChild
{
  v4.receiver = self;
  v4.super_class = (Class)IKDOMDocumentFragment;
  v2 = [(IKDOMNode *)&v4 firstElementChild];
  return (IKDOMElement *)v2;
}

- (IKDOMElement)lastElementChild
{
  v4.receiver = self;
  v4.super_class = (Class)IKDOMDocumentFragment;
  v2 = [(IKDOMNode *)&v4 lastElementChild];
  return (IKDOMElement *)v2;
}

- (unint64_t)childElementCount
{
  v3.receiver = self;
  v3.super_class = (Class)IKDOMDocumentFragment;
  return [(IKDOMNode *)&v3 childElementCount];
}

@end