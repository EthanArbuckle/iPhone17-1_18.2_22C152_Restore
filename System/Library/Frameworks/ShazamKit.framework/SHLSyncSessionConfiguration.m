@interface SHLSyncSessionConfiguration
- (NSString)callingProcessIdentifier;
- (NSUUID)sessionIdentifier;
- (SHLSyncSessionConfiguration)initWithType:(int64_t)a3 scope:(int64_t)a4 callingProcessIdentifier:(id)a5 sessionIdentifier:(id)a6;
- (int64_t)sessionScope;
- (int64_t)sessionType;
@end

@implementation SHLSyncSessionConfiguration

- (SHLSyncSessionConfiguration)initWithType:(int64_t)a3 scope:(int64_t)a4 callingProcessIdentifier:(id)a5 sessionIdentifier:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SHLSyncSessionConfiguration;
  v13 = [(SHLSyncSessionConfiguration *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_sessionType = a3;
    v13->_sessionScope = a4;
    objc_storeStrong((id *)&v13->_callingProcessIdentifier, a5);
    objc_storeStrong((id *)&v14->_sessionIdentifier, a6);
  }

  return v14;
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (int64_t)sessionScope
{
  return self->_sessionScope;
}

- (NSString)callingProcessIdentifier
{
  return self->_callingProcessIdentifier;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_storeStrong((id *)&self->_callingProcessIdentifier, 0);
}

@end