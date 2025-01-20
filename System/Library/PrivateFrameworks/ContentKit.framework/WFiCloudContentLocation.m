@interface WFiCloudContentLocation
+ (id)objectWithWFSerializedRepresentation:(id)a3;
@end

@implementation WFiCloudContentLocation

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithIdentifier:@"com.apple.shortcuts.publicICloudDestination" promptingBehaviour:0];
  return v3;
}

@end