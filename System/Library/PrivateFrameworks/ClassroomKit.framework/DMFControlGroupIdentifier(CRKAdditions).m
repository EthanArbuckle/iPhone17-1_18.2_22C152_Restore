@interface DMFControlGroupIdentifier(CRKAdditions)
+ (id)crk_adHocXPCGroupIdentifier;
+ (id)crk_asmXPCGroupIdentifier;
+ (id)crk_managedXPCGroupIdentifier;
@end

@implementation DMFControlGroupIdentifier(CRKAdditions)

+ (id)crk_managedXPCGroupIdentifier
{
  id v0 = objc_alloc(MEMORY[0x263F39D20]);
  v1 = objc_msgSend(MEMORY[0x263F08C38], "crk_zerosUUID");
  v2 = (void *)[v0 initWithOrganizationUUID:v1 groupID:0];

  return v2;
}

+ (id)crk_adHocXPCGroupIdentifier
{
  id v0 = objc_alloc(MEMORY[0x263F39D20]);
  v1 = objc_msgSend(MEMORY[0x263F08C38], "crk_zerosUUID");
  v2 = (void *)[v0 initWithOrganizationUUID:v1 groupID:1];

  return v2;
}

+ (id)crk_asmXPCGroupIdentifier
{
  id v0 = objc_alloc(MEMORY[0x263F39D20]);
  v1 = objc_msgSend(MEMORY[0x263F08C38], "crk_zerosUUID");
  v2 = (void *)[v0 initWithOrganizationUUID:v1 groupID:2];

  return v2;
}

@end