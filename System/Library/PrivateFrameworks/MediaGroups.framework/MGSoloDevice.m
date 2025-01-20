@interface MGSoloDevice
+ (id)predicateForCurrentDevice;
+ (id)predicateForType;
+ (id)type;
@end

@implementation MGSoloDevice

+ (id)type
{
  return @"com.apple.media-group.solo";
}

+ (id)predicateForType
{
  v2 = (void *)MEMORY[0x263F08A98];
  v3 = [a1 type];
  v4 = [v2 predicateWithFormat:@"SELF.type BEGINSWITH %@", v3];

  return v4;
}

+ (id)predicateForCurrentDevice
{
  v10[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08730];
  v4 = [a1 predicateForType];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___MGSoloDevice;
  v10[0] = v4;
  v5 = objc_msgSendSuper2(&v9, sel_predicateForCurrentDevice);
  v10[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v7 = [v3 andPredicateWithSubpredicates:v6];

  return v7;
}

@end