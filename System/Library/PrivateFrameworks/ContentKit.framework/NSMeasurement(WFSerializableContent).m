@interface NSMeasurement(WFSerializableContent)
+ (id)objectWithWFSerializedRepresentation:()WFSerializableContent;
@end

@implementation NSMeasurement(WFSerializableContent)

+ (id)objectWithWFSerializedRepresentation:()WFSerializableContent
{
  return WFDeserializeNSMeasurement(a3);
}

@end