@interface CLRegion(HomeLocation)
- (id)hm_description;
@end

@implementation CLRegion(HomeLocation)

- (id)hm_description
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  if (v3)
  {
    v4 = NSString;
    [v3 radius];
    objc_msgSend(v4, "stringWithFormat:", @"(Radius:%f)", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1EEE9DD88;
  }
  v7 = NSString;
  [v1 notifyOnEntry];
  v8 = HMFBooleanToString();
  [v1 notifyOnExit];
  v9 = HMFBooleanToString();
  unsigned int v10 = [v1 referenceFrame];
  if (v10 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown reference frame: %ld", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E5943D20[v10];
  }
  v12 = [v7 stringWithFormat:@"%@-(notifyOnEntry:%@)-(notifyOnExit:%@)-(Ref:%@)-%@", v1, v8, v9, v11, v6];

  return v12;
}

@end