@interface IKDOMCDATASection
- (id)nodeName;
- (int64_t)nodeType;
@end

@implementation IKDOMCDATASection

- (id)nodeName
{
  return @"#cdata-section";
}

- (int64_t)nodeType
{
  return 4;
}

@end