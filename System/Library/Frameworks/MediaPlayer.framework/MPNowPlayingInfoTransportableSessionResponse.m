@interface MPNowPlayingInfoTransportableSessionResponse
+ (id)responseWithIdentifier:(id)a3 sessionType:(id)a4 data:(id)a5;
- (NSData)data;
- (NSString)identifier;
- (NSString)sessionType;
- (id)_init;
@end

@implementation MPNowPlayingInfoTransportableSessionResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSData)data
{
  return self->_data;
}

- (NSString)sessionType
{
  return self->_sessionType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MPNowPlayingInfoTransportableSessionResponse;
  return [(MPNowPlayingInfoTransportableSessionResponse *)&v3 init];
}

+ (id)responseWithIdentifier:(id)a3 sessionType:(id)a4 data:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) _init];
  uint64_t v12 = [v10 copy];

  v13 = (void *)v11[1];
  v11[1] = v12;

  uint64_t v14 = [v9 copy];
  v15 = (void *)v11[2];
  v11[2] = v14;

  v16 = (void *)v11[3];
  v11[3] = v8;

  return v11;
}

@end