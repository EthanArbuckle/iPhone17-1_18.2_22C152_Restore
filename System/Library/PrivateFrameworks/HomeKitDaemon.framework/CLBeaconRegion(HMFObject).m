@interface CLBeaconRegion(HMFObject)
- (id)attributeDescriptions;
- (id)description;
@end

@implementation CLBeaconRegion(HMFObject)

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F42610] defaultFormatter];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [a1 proximityUUID];
  v5 = (void *)[v3 initWithName:@"ProximityUUID" value:v4 options:0 formatter:v2];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = objc_msgSend(a1, "major", v5);
  v8 = (void *)[v6 initWithName:@"Major" value:v7 options:0 formatter:v2];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [a1 minor];
  v11 = (void *)[v9 initWithName:@"Minor" value:v10 options:0 formatter:v2];
  v14[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

- (id)description
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_26E5E5EF8;
  v1 = objc_msgSendSuper2(&v3, sel_description);
  return v1;
}

@end