@interface _MPNowPlayingInfoTransportableSessionRequest
+ (id)requestWithIdentifier:(id)a3 preferredSessionType:(id)a4;
- (NSString)identifier;
- (NSString)preferredSessionType;
@end

@implementation _MPNowPlayingInfoTransportableSessionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSessionType, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)preferredSessionType
{
  return self->_preferredSessionType;
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)requestWithIdentifier:(id)a3 preferredSessionType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  uint64_t v9 = [v7 copy];

  v10 = (void *)v8[1];
  v8[1] = v9;

  uint64_t v11 = [v6 copy];
  v12 = (void *)v8[2];
  v8[2] = v11;

  return v8;
}

@end