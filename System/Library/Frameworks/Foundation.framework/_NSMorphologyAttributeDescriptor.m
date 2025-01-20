@interface _NSMorphologyAttributeDescriptor
- (id)attributeValueFromValue:(id)a3;
- (unint64_t)retainCount;
@end

@implementation _NSMorphologyAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSDictionary())
  {
    id v4 = [[NSMorphology alloc] _initWithExternalRepresentationDictionary:a3];
    return v4;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return a3;
    }
    else {
      return 0;
    }
  }
}

@end