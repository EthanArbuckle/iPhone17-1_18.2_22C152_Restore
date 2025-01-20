@interface BLSHDisableFlipbookPowerSavingAttribute
+ (id)disablePowerSavingForReason:(unint64_t)a3;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
- (unint64_t)reason;
@end

@implementation BLSHDisableFlipbookPowerSavingAttribute

+ (id)disablePowerSavingForReason:(unint64_t)a3
{
  v4 = objc_alloc((Class)a1);
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)BLSHDisableFlipbookPowerSavingAttribute;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    if (v4) {
      v4[1] = a3;
    }
  }

  return v4;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:@"com.apple.backlight.disableFlipbookPowerSaving" error:a4];
}

- (unint64_t)reason
{
  return self->_reason;
}

@end