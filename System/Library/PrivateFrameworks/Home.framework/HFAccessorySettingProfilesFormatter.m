@interface HFAccessorySettingProfilesFormatter
- (id)stringForObjectValue:(id)a3;
- (unint64_t)numberOfProfiles;
- (void)setNumberOfProfiles:(unint64_t)a3;
@end

@implementation HFAccessorySettingProfilesFormatter

- (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v6, "count"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)numberOfProfiles
{
  return self->_numberOfProfiles;
}

- (void)setNumberOfProfiles:(unint64_t)a3
{
  self->_numberOfProfiles = a3;
}

@end