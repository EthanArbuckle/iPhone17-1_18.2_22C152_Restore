@interface _NSNumberFormattingAttributeDescriptor
- (id)attributeValueFromValue:(id)a3;
- (unint64_t)retainCount;
@end

@implementation _NSNumberFormattingAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (!_NSIsNSNumber() || ![a3 BOOLValue]) {
    return 0;
  }

  return +[NSLocalizedNumberFormatRule automatic];
}

@end