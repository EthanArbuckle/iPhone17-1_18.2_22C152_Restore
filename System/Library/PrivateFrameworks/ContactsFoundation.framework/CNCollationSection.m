@interface CNCollationSection
- (CNCollationSection)initWithKey:(id)a3 localizedName:(id)a4;
- (NSString)key;
- (NSString)localizedName;
@end

@implementation CNCollationSection

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (CNCollationSection)initWithKey:(id)a3 localizedName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNCollationSection;
  v8 = [(CNCollationSection *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    key = v8->_key;
    v8->_key = (NSString *)v9;

    if (v7) {
      v11 = v7;
    }
    else {
      v11 = v6;
    }
    uint64_t v12 = [v11 copy];
    localizedName = v8->_localizedName;
    v8->_localizedName = (NSString *)v12;

    v14 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end