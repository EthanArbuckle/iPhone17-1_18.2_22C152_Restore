@interface _HKRemoteDisplayTypeConfiguration
- (HKDisplayType)remoteDisplayType;
- (_HKRemoteDisplayTypeConfiguration)initWithInitialTimeScope:(int64_t)a3 remoteDisplayType:(id)a4;
- (int64_t)initialTimeScope;
@end

@implementation _HKRemoteDisplayTypeConfiguration

- (_HKRemoteDisplayTypeConfiguration)initWithInitialTimeScope:(int64_t)a3 remoteDisplayType:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HKRemoteDisplayTypeConfiguration;
  v8 = [(_HKRemoteDisplayTypeConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_initialTimeScope = a3;
    objc_storeStrong((id *)&v8->_remoteDisplayType, a4);
  }

  return v9;
}

- (int64_t)initialTimeScope
{
  return self->_initialTimeScope;
}

- (HKDisplayType)remoteDisplayType
{
  return self->_remoteDisplayType;
}

- (void).cxx_destruct
{
}

@end