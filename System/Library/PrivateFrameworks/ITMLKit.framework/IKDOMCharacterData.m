@interface IKDOMCharacterData
- (NSString)data;
- (unint64_t)length;
- (void)setData:(id)a3;
@end

@implementation IKDOMCharacterData

- (NSString)data
{
  v2 = [(IKDOMNode *)self nodePtr];
  if (v2 && (Content = xmlNodeGetContent(v2)) != 0)
  {
    v4 = Content;
    v5 = [NSString stringWithUTF8String:Content];
    ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setData:(id)a3
{
  id v6 = a3;
  v4 = [(IKDOMNode *)self nodePtr];
  if (v4)
  {
    v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      xmlNodeSetContent(v5, (const xmlChar *)[v6 UTF8String]);
      [(IKDOMNode *)self updatedAndMark:1 notify:1];
    }
  }
}

- (unint64_t)length
{
  v2 = [(IKDOMCharacterData *)self data];
  unint64_t v3 = [v2 length];

  return v3;
}

@end