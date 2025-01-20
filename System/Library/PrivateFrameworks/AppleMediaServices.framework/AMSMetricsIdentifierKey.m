@interface AMSMetricsIdentifierKey
+ (id)keyWithName:(id)a3 crossDeviceSync:(BOOL)a4;
+ (id)keyWithName:(id)a3 crossDeviceSync:(BOOL)a4 isActiveITunesAccountRequired:(BOOL)a5;
- (BOOL)crossDeviceSync;
- (BOOL)isActiveITunesAccountRequired;
- (NSString)name;
- (id)description;
- (void)setCrossDeviceSync:(BOOL)a3;
- (void)setIsActiveITunesAccountRequired:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation AMSMetricsIdentifierKey

- (void).cxx_destruct
{
}

- (BOOL)crossDeviceSync
{
  return self->_crossDeviceSync;
}

- (BOOL)isActiveITunesAccountRequired
{
  return self->_isActiveITunesAccountRequired;
}

- (NSString)name
{
  return self->_name;
}

+ (id)keyWithName:(id)a3 crossDeviceSync:(BOOL)a4 isActiveITunesAccountRequired:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setName:v7];

  [v8 setCrossDeviceSync:v6];
  [v8 setIsActiveITunesAccountRequired:v5];
  return v8;
}

- (void)setIsActiveITunesAccountRequired:(BOOL)a3
{
  self->_isActiveITunesAccountRequired = a3;
}

- (void)setName:(id)a3
{
}

- (void)setCrossDeviceSync:(BOOL)a3
{
  self->_crossDeviceSync = a3;
}

+ (id)keyWithName:(id)a3 crossDeviceSync:(BOOL)a4
{
  return (id)[a1 keyWithName:a3 crossDeviceSync:a4 isActiveITunesAccountRequired:0];
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)AMSMetricsIdentifierKey;
  v3 = [(AMSMetricsIdentifierKey *)&v9 description];
  name = self->_name;
  BOOL v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_crossDeviceSync];
  BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isActiveITunesAccountRequired];
  id v7 = [v3 stringByAppendingFormat:@" (name: %@, crossDeviceSync: %@, isActiveITunesAccountRequired: %@)", name, v5, v6];

  return v7;
}

@end