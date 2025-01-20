@interface CNCollationHeaderSection
- (CNCollationHeaderSection)initWithKey:(id)a3 localizedName:(id)a4 ICUSortKey:(id)a5;
- (NSString)ICUSortKey;
@end

@implementation CNCollationHeaderSection

- (NSString)ICUSortKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (CNCollationHeaderSection)initWithKey:(id)a3 localizedName:(id)a4 ICUSortKey:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CNCollationHeaderSection;
  v9 = [(CNCollationSection *)&v14 initWithKey:a3 localizedName:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    ICUSortKey = v9->_ICUSortKey;
    v9->_ICUSortKey = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end