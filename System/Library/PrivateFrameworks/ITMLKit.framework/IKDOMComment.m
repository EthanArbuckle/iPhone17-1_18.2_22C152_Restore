@interface IKDOMComment
- (id)nodeName;
- (int64_t)nodeType;
- (void)setTextContent:(id)a3;
@end

@implementation IKDOMComment

- (id)nodeName
{
  return @"#comment";
}

- (int64_t)nodeType
{
  return 8;
}

- (void)setTextContent:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IKDOMComment;
  [(IKDOMCharacterData *)&v3 setData:a3];
}

@end