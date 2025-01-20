@interface CPAccNavInfoType
+ (id)stringForUpdateClass:(Class)a3 infoType:(unsigned __int16)a4;
@end

@implementation CPAccNavInfoType

+ (id)stringForUpdateClass:(Class)a3 infoType:(unsigned __int16)a4
{
  int v4 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    LOWORD(v7) = v4 - 1;
    if ((v4 - 1) >= 3)
    {
      v6 = @"DisplayComponentID";
      goto LABEL_15;
    }
    uint64_t v7 = (__int16)v7;
    v8 = off_26430A568;
    goto LABEL_10;
  }
  if ((Class)objc_opt_class() == a3)
  {
    LOWORD(v7) = v4 - 1;
    if ((v4 - 1) >= 3)
    {
      v6 = @"Index";
      goto LABEL_15;
    }
    uint64_t v7 = (__int16)v7;
    v8 = off_26430A580;
LABEL_10:
    v6 = v8[v7];
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a3)
  {
    NSStringFromAccNavManeuverInfoUpdateInfoType(v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if ((Class)objc_opt_class() == a3)
  {
    NSStringFromAccNavRouteGuidanceUpdateInfoType(v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = @"<ERROR>";
  }
LABEL_15:

  return v6;
}

@end