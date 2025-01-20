@interface MPCSharedListeningPlaybackIntentTracklistToken
+ (BOOL)supportsSecureCoding;
+ (id)payloadValueFromJSONValue:(id)a3;
- (ICLiveLinkIdentity)identity;
- (MPCPlaybackSharedListeningProperties)sharedListeningProperties;
- (MPCSharedListeningPlaybackIntentTracklistToken)initWithCoder:(id)a3;
- (id)mpc_jsonValue;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setSharedListeningProperties:(id)a3;
@end

@implementation MPCSharedListeningPlaybackIntentTracklistToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_sharedListeningProperties, 0);
}

- (void)setIdentity:(id)a3
{
}

- (ICLiveLinkIdentity)identity
{
  return self->_identity;
}

- (void)setSharedListeningProperties:(id)a3
{
}

- (MPCPlaybackSharedListeningProperties)sharedListeningProperties
{
  return self->_sharedListeningProperties;
}

- (void)encodeWithCoder:(id)a3
{
  sharedListeningProperties = self->_sharedListeningProperties;
  id v5 = a3;
  [v5 encodeObject:sharedListeningProperties forKey:@"tshlp"];
  [v5 encodeObject:self->_identity forKey:@"tid"];
}

- (MPCSharedListeningPlaybackIntentTracklistToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCSharedListeningPlaybackIntentTracklistToken *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tshlp"];
    sharedListeningProperties = v5->_sharedListeningProperties;
    v5->_sharedListeningProperties = (MPCPlaybackSharedListeningProperties *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tid"];
    identity = v5->_identity;
    v5->_identity = (ICLiveLinkIdentity *)v8;
  }
  return v5;
}

- (id)mpc_jsonValue
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"props";
  v3 = [(MPCSharedListeningPlaybackIntentTracklistToken *)self sharedListeningProperties];
  id v4 = objc_msgSend(v3, "mpc_jsonValue");
  v9[1] = @"identity";
  v10[0] = v4;
  id v5 = [(MPCSharedListeningPlaybackIntentTracklistToken *)self identity];
  uint64_t v6 = objc_msgSend(v5, "mpc_jsonValue");
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MPCSharedListeningPlaybackIntentTracklistToken);
  id v5 = [v3 objectForKeyedSubscript:@"props"];
  uint64_t v6 = +[MPCPlaybackSharedListeningProperties payloadValueFromJSONValue:v5];
  [(MPCSharedListeningPlaybackIntentTracklistToken *)v4 setSharedListeningProperties:v6];

  v7 = (void *)MEMORY[0x263F89188];
  uint64_t v8 = [v3 objectForKeyedSubscript:@"identity"];

  v9 = [v7 payloadValueFromJSONValue:v8];
  [(MPCSharedListeningPlaybackIntentTracklistToken *)v4 setIdentity:v9];

  return v4;
}

@end