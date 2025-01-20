@interface IKDOMText
- (id)nodeName;
- (int64_t)nodeType;
- (void)setTextContent:(id)a3;
@end

@implementation IKDOMText

- (id)nodeName
{
  return @"#text";
}

- (int64_t)nodeType
{
  return 3;
}

- (void)setTextContent:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IKDOMText;
  [(IKDOMCharacterData *)&v3 setData:a3];
}

@end