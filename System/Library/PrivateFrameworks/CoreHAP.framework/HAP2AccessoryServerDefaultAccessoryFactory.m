@interface HAP2AccessoryServerDefaultAccessoryFactory
- (id)accessoryWithAccessoryServer:(id)a3 instanceID:(unint64_t)a4 discoveredServices:(id)a5;
@end

@implementation HAP2AccessoryServerDefaultAccessoryFactory

- (id)accessoryWithAccessoryServer:(id)a3 instanceID:(unint64_t)a4 discoveredServices:(id)a5
{
  return +[HAP2Accessory accessoryWithAccessoryServer:a3 instanceID:a4 discoveredServices:a5];
}

@end