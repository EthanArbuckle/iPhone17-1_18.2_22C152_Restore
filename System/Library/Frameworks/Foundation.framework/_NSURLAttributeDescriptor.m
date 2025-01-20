@interface _NSURLAttributeDescriptor
- (id)attributeValueFromValue:(id)a3;
- (unint64_t)retainCount;
@end

@implementation _NSURLAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (!_NSIsNSString()) {
    return 0;
  }
  v4 = (void *)MEMORY[0x1E4F1CB10];

  return (id)[v4 URLWithString:a3];
}

@end