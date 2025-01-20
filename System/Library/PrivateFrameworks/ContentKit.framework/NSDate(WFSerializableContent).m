@interface NSDate(WFSerializableContent)
+ (id)objectWithWFSerializedRepresentation:()WFSerializableContent;
- (id)wfSerializedRepresentation;
@end

@implementation NSDate(WFSerializableContent)

- (id)wfSerializedRepresentation
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"link.contentkit.date";
  v4[0] = a1;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  return v1;
}

+ (id)objectWithWFSerializedRepresentation:()WFSerializableContent
{
  id v3 = a3;
  v4 = [v3 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.date"];

  return v4;
}

@end