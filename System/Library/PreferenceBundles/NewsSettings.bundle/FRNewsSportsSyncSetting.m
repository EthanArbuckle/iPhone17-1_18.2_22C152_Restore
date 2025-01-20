@interface FRNewsSportsSyncSetting
+ (id)userDefaultSyncSetting;
+ (void)updateUserDefaultsSyncSetting:(id)a3;
- (BOOL)isEnabled;
- (FRNewsSportsSyncSetting)initWithSource:(unint64_t)a3 enabled:(BOOL)a4 dateModified:(id)a5;
- (NSDate)dateModified;
- (id)description;
- (unint64_t)source;
- (void)setDateModified:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation FRNewsSportsSyncSetting

- (FRNewsSportsSyncSetting)initWithSource:(unint64_t)a3 enabled:(BOOL)a4 dateModified:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FRNewsSportsSyncSetting;
  v10 = [(FRNewsSportsSyncSetting *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_source = a3;
    v10->_enabled = a4;
    objc_storeStrong((id *)&v10->_dateModified, a5);
  }

  return v11;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  unint64_t v4 = [(FRNewsSportsSyncSetting *)self source];
  v5 = @"userDefaults";
  if (v4 == 1) {
    v5 = @"watchlist";
  }
  v6 = v5;
  unsigned int v7 = [(FRNewsSportsSyncSetting *)self isEnabled];
  v8 = [(FRNewsSportsSyncSetting *)self dateModified];
  id v9 = [v3 initWithFormat:@"{source=%@, enabled=%d, date=%@}", v6, v7, v8];

  return v9;
}

+ (id)userDefaultSyncSetting
{
  v2 = NewsCoreUserDefaults();
  id v3 = [v2 BOOLForKey:FCSportsFavoritesSyncSettingPreferenceKey];
  objc_opt_class();
  unint64_t v4 = [v2 objectForKey:FCSportsFavoritesSyncSettingPreferenceDateModifiedKey];
  v5 = FCDynamicCast();

  v6 = [[FRNewsSportsSyncSetting alloc] initWithSource:0 enabled:v3 dateModified:v5];

  return v6;
}

+ (void)updateUserDefaultsSyncSetting:(id)a3
{
  id v3 = a3;
  NewsCoreUserDefaults();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 isEnabled];
  [v6 setBool:v4 forKey:FCSportsFavoritesSyncSettingPreferenceKey];
  v5 = [v3 dateModified];

  [v6 setObject:v5 forKey:FCSportsFavoritesSyncSettingPreferenceDateModifiedKey];
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (void)setDateModified:(id)a3
{
}

- (void).cxx_destruct
{
}

@end