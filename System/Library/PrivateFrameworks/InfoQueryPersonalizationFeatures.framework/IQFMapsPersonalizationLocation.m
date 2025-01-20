@interface IQFMapsPersonalizationLocation
- (IQFMapsPersonalizationLocation)initWithMUID:(id)a3 name:(id)a4;
- (NSString)muid;
- (NSString)name;
- (void)setMuid:(id)a3;
- (void)setName:(id)a3;
@end

@implementation IQFMapsPersonalizationLocation

- (IQFMapsPersonalizationLocation)initWithMUID:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IQFMapsPersonalizationLocation;
  v9 = [(IQFMapsPersonalizationLocation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_muid, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (NSString)muid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMuid:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_muid, 0);
}

@end