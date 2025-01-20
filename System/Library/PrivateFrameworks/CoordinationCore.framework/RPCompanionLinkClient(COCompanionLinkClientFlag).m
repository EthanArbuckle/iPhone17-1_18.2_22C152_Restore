@interface RPCompanionLinkClient(COCompanionLinkClientFlag)
- (uint64_t)co_CompanionLinkClientFlags;
- (void)co_SetCompanionLinkClientFlags:()COCompanionLinkClientFlag;
@end

@implementation RPCompanionLinkClient(COCompanionLinkClientFlag)

- (uint64_t)co_CompanionLinkClientFlags
{
  v1 = objc_getAssociatedObject(a1, sel_co_CompanionLinkClientFlags);
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)co_SetCompanionLinkClientFlags:()COCompanionLinkClientFlag
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_co_CompanionLinkClientFlags, v2, (void *)0x303);
}

@end