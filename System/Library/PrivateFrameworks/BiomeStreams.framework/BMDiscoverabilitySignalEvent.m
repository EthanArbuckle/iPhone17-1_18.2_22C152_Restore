@interface BMDiscoverabilitySignalEvent
- (BMDiscoverabilitySignalEvent)initWithIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5;
- (BMDiscoverabilitySignalEvent)initWithIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 userInfo:(id)a6;
- (NSDictionary)userInfo;
- (NSString)bundleID;
- (NSString)context;
- (NSString)identifier;
- (id)description;
@end

@implementation BMDiscoverabilitySignalEvent

- (BMDiscoverabilitySignalEvent)initWithIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5
{
  return [(BMDiscoverabilitySignalEvent *)self initWithIdentifier:a3 bundleID:a4 context:a5 userInfo:0];
}

- (BMDiscoverabilitySignalEvent)initWithIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 userInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)BMDiscoverabilitySignalEvent;
  v14 = [(BMDiscoverabilitySignalEvent *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    bundleID = v14->_bundleID;
    v14->_bundleID = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    context = v14->_context;
    v14->_context = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    userInfo = v14->_userInfo;
    v14->_userInfo = (NSDictionary *)v21;
  }
  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(BMDiscoverabilitySignalEvent *)self identifier];
  v6 = [(BMDiscoverabilitySignalEvent *)self bundleID];
  v7 = [(BMDiscoverabilitySignalEvent *)self context];
  v8 = [(BMDiscoverabilitySignalEvent *)self userInfo];
  v9 = [v3 stringWithFormat:@"<%@ %p> identifier: %@, bundleID: %@, context: %@ userInfo: %@", v4, self, v5, v6, v7, v8];

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)context
{
  return self->_context;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end