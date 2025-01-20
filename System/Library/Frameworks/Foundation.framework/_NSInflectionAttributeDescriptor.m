@interface _NSInflectionAttributeDescriptor
- (id)attributeValueFromValue:(id)a3;
- (unint64_t)retainCount;
@end

@implementation _NSInflectionAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSNumber())
  {
    if ([a3 BOOLValue]) {
      return a3;
    }
    else {
      return 0;
    }
  }
  else if (_NSIsNSDictionary())
  {
    v5 = [[NSInflectionRuleExplicit alloc] initWithMorphology:[[NSMorphology alloc] _initWithExternalRepresentationDictionary:a3]];
    return v5;
  }
  else
  {
    return 0;
  }
}

@end