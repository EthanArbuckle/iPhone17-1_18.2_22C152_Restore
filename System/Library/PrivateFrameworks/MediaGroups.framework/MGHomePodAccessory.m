@interface MGHomePodAccessory
+ (BOOL)supportsSecureCoding;
+ (id)type;
+ (void)HomePodAccessoryWithConnectionProvider:(id)a3 HomeKitAccessory:(id)a4 completion:(id)a5;
+ (void)HomePodAccessoryWithHomeKitAccessory:(id)a3 completion:(id)a4;
+ (void)HomePodWithClientService:(void *)a3 HomeKitAccessory:(void *)a4 completion:;
- (NSNumber)HomePodVariant;
- (NSNumber)productColor;
- (id)HomeKitAccesoryIdentifier;
- (id)HomeKitAccessoryWithHomeManager:(id)a3;
- (id)deviceIdentifier;
@end

@implementation MGHomePodAccessory

- (NSNumber)HomePodVariant
{
  v2 = [(MGGroup *)self properties];
  v3 = [v2 objectForKey:@"HomePodVariant"];

  return (NSNumber *)v3;
}

- (NSNumber)productColor
{
  v2 = [(MGGroup *)self properties];
  v3 = [v2 objectForKey:@"productColor"];

  return (NSNumber *)v3;
}

- (id)deviceIdentifier
{
  v2 = [(MGGroup *)self properties];
  v3 = [v2 objectForKey:@"deviceIdentifier"];

  return v3;
}

+ (id)type
{
  return @"com.apple.media-group.solo-HomePodAccessory";
}

- (id)HomeKitAccesoryIdentifier
{
  v2 = [(MGGroup *)self identifier];
  v3 = MGAccessoryIdentifierForGroupIdentifier(v2);

  return v3;
}

- (id)HomeKitAccessoryWithHomeManager:(id)a3
{
  id v4 = a3;
  v5 = [(MGGroup *)self identifier];
  v6 = MGAccessoryFromHomeManagerForGroupIdentifier(v4, v5);

  return v6;
}

+ (void)HomePodWithClientService:(void *)a3 HomeKitAccessory:(void *)a4 completion:
{
  v21[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  v9 = self;
  v20[0] = @"deviceIdentifier";
  v10 = MGHomeUniqueIdentifierForAccessory(v7);
  v11 = [v10 UUIDString];
  v21[0] = v11;
  v20[1] = @"HomePodVariant";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "homePodVariant"));
  v21[1] = v12;
  v20[2] = @"productColor";
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "productColor"));
  v21[2] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

  v15 = [v9 type];
  v16 = [v7 uniqueIdentifier];
  v17 = MGHomeUniqueIdentifierForAccessory(v7);
  v18 = MGAccessoryCategoryTypeForAccessory(v7);
  v19 = [v7 name];

  objc_msgSend(v8, "HomeKitAccessoryOfType:accessoryIdentifier:homeIdentifier:categoryType:name:properties:completion:", v15, v16, v17, v18, v19, v14, v6, v20[0]);
}

+ (void)HomePodAccessoryWithConnectionProvider:(id)a3 HomeKitAccessory:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() clientServiceWithConnectionProvider:v10];

  +[MGHomePodAccessory HomePodWithClientService:HomeKitAccessory:completion:]((uint64_t)a1, v11, v9, v8);
}

+ (void)HomePodAccessoryWithHomeKitAccessory:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(MGClientService);
  +[MGHomePodAccessory HomePodWithClientService:HomeKitAccessory:completion:]((uint64_t)a1, v8, v7, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end