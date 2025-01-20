@interface ISRegion
+ (id)regionWithName:(id)a3 code:(id)a4;
- (NSString)regionCode;
- (NSString)regionName;
- (void)setRegionCode:(id)a3;
- (void)setRegionName:(id)a3;
@end

@implementation ISRegion

+ (id)regionWithName:(id)a3 code:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(ISRegion);
  v8 = v7;
  if (v7)
  {
    [(ISRegion *)v7 setRegionName:v5];
    [(ISRegion *)v8 setRegionCode:v6];
  }

  return v8;
}

- (NSString)regionName
{
  return self->_regionName;
}

- (void)setRegionName:(id)a3
{
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);

  objc_storeStrong((id *)&self->_regionName, 0);
}

@end