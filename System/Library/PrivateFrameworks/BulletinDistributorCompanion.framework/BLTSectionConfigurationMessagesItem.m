@interface BLTSectionConfigurationMessagesItem
- (unint64_t)coordinationTypeWithSubtype:(int64_t)a3;
@end

@implementation BLTSectionConfigurationMessagesItem

- (unint64_t)coordinationTypeWithSubtype:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BLTSectionConfigurationMessagesItem;
  unint64_t result = -[BLTSectionConfigurationItem coordinationTypeWithSubtype:](&v7, sel_coordinationTypeWithSubtype_);
  if (!result)
  {
    if (a3 == 5)
    {
      v5 = objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
      BOOL v6 = (unint64_t)[v5 bltVersion] < 6;

      return 2 * v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end