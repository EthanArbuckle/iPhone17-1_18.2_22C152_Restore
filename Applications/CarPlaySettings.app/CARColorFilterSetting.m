@interface CARColorFilterSetting
+ (id)filterPreference:(int64_t)a3 name:(id)a4;
- (NSString)name;
- (id)description;
- (int64_t)preference;
- (void)setName:(id)a3;
- (void)setPreference:(int64_t)a3;
@end

@implementation CARColorFilterSetting

+ (id)filterPreference:(int64_t)a3 name:(id)a4
{
  id v5 = a4;
  v6 = objc_opt_new();
  [v6 setPreference:a3];
  [v6 setName:v5];

  return v6;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CARColorFilterSetting;
  v3 = [(CARColorFilterSetting *)&v8 description];
  int64_t v4 = [(CARColorFilterSetting *)self preference];
  id v5 = [(CARColorFilterSetting *)self name];
  v6 = +[NSString stringWithFormat:@"%@ [preference: %ld, name: %@]", v3, v4, v5];

  return v6;
}

- (int64_t)preference
{
  return self->_preference;
}

- (void)setPreference:(int64_t)a3
{
  self->_preference = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end