@interface DMFControlGroupIdentifier(CRKASMAdditions)
+ (id)crk_identifierWithOpaqueString:()CRKASMAdditions;
+ (uint64_t)crk_groupIDWithOpaqueString:()CRKASMAdditions;
@end

@implementation DMFControlGroupIdentifier(CRKASMAdditions)

+ (id)crk_identifierWithOpaqueString:()CRKASMAdditions
{
  v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  v6 = objc_msgSend(v4, "crk_UUIDWithOpaqueString:", v5);
  uint64_t v7 = objc_msgSend(a1, "crk_groupIDWithOpaqueString:", v5);

  v8 = (void *)[objc_alloc((Class)a1) initWithOrganizationUUID:v6 groupID:v7];

  return v8;
}

+ (uint64_t)crk_groupIDWithOpaqueString:()CRKASMAdditions
{
  id v3 = a3;
  if ([v3 length])
  {
    unint64_t v4 = 0;
    int v5 = 0;
    do
      v5 += [v3 characterAtIndex:v4++];
    while (v4 < [v3 length]);
  }
  else
  {
    LOWORD(v5) = 0;
  }

  return (unsigned __int16)v5;
}

@end