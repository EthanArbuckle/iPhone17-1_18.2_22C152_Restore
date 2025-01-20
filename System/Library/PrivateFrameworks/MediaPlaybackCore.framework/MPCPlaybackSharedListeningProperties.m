@interface MPCPlaybackSharedListeningProperties
+ (BOOL)supportsSecureCoding;
+ (MPCPlaybackSharedListeningProperties)propertiesWithSessionIdentifier:(id)a3 sessionKey:(id)a4;
+ (id)payloadValueFromJSONValue:(id)a3;
- (ICLiveLink)liveLink;
- (MPCPlaybackSharedListeningProperties)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)sessionIdentifier;
- (NSString)sessionKey;
- (id)mpc_jsonValue;
- (void)encodeWithCoder:(id)a3;
- (void)setLiveLink:(id)a3;
@end

@implementation MPCPlaybackSharedListeningProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveLink, 0);
  objc_storeStrong((id *)&self->_sessionKey, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

- (void)setLiveLink:(id)a3
{
}

- (ICLiveLink)liveLink
{
  return self->_liveLink;
}

- (NSString)sessionKey
{
  return self->_sessionKey;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p: sessionID=%@>", objc_opt_class(), self, self->_sessionIdentifier];
}

- (void)encodeWithCoder:(id)a3
{
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:sessionIdentifier forKey:@"sid"];
  [v5 encodeObject:self->_sessionKey forKey:@"skey"];
}

- (MPCPlaybackSharedListeningProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlaybackSharedListeningProperties *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"skey"];
    sessionKey = v5->_sessionKey;
    v5->_sessionKey = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MPCPlaybackSharedListeningProperties)propertiesWithSessionIdentifier:(id)a3 sessionKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MPCPlaybackSharedListeningProperties);
  uint64_t v8 = [v6 copy];

  sessionIdentifier = v7->_sessionIdentifier;
  v7->_sessionIdentifier = (NSString *)v8;

  uint64_t v10 = [v5 copy];
  sessionKey = v7->_sessionKey;
  v7->_sessionKey = (NSString *)v10;

  return v7;
}

- (id)mpc_jsonValue
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"sessionID";
  v3 = [(MPCPlaybackSharedListeningProperties *)self sessionIdentifier];
  v9[1] = @"sessionKey";
  v10[0] = v3;
  uint64_t v4 = [(MPCPlaybackSharedListeningProperties *)self sessionKey];
  id v5 = (void *)v4;
  id v6 = &stru_26CBCA930;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"sessionID"];
  id v5 = [v3 objectForKeyedSubscript:@"sessionKey"];

  id v6 = +[MPCPlaybackSharedListeningProperties propertiesWithSessionIdentifier:v4 sessionKey:v5];

  return v6;
}

@end