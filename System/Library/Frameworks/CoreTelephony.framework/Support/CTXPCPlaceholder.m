@interface CTXPCPlaceholder
+ (id)cfUuid:(__CFUUID *)a3;
+ (id)simSlot:(int)a3;
@end

@implementation CTXPCPlaceholder

+ (id)simSlot:(int)a3
{
  v3 = [[CTXPCSlotIDPlaceholder alloc] initWithSlot:*(void *)&a3];

  return v3;
}

+ (id)cfUuid:(__CFUUID *)a3
{
  v4 = [CTXPCUuidPlaceholder alloc];
  v5 = sub_1005B0A4C(a3);
  v6 = [(CTXPCUuidPlaceholder *)v4 initWithUUID:v5];

  return v6;
}

@end