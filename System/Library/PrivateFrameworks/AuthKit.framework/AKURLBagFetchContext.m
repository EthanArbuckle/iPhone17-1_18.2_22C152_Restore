@interface AKURLBagFetchContext
+ (id)contextWithAltDSID:(id)a3;
- (NSString)altDSID;
- (void)setAltDSID:(id)a3;
@end

@implementation AKURLBagFetchContext

+ (id)contextWithAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setAltDSID:v3];

  return v4;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end