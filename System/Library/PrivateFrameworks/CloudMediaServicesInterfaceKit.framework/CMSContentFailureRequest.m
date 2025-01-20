@interface CMSContentFailureRequest
- (CMSContentFailure)contentFailure;
- (CMSContentFailureRequest)initWithContentFailure:(id)a3 whilePlaying:(id)a4 previousContentURL:(id)a5 nextContentURL:(id)a6 userActivityDictionary:(id)a7;
- (CMSPlayerContext)whilePlaying;
- (NSDate)timestamp;
- (NSDictionary)constraints;
- (NSDictionary)userActivityDictionary;
- (NSString)description;
- (NSString)sessionIdentifier;
- (NSURL)nextContentURL;
- (NSURL)previousContentURL;
- (id)cmsCoded;
- (void)setConstraints:(id)a3;
- (void)setContentFailure:(id)a3;
- (void)setNextContentURL:(id)a3;
- (void)setPreviousContentURL:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUserActivityDictionary:(id)a3;
- (void)setWhilePlaying:(id)a3;
@end

@implementation CMSContentFailureRequest

- (CMSContentFailureRequest)initWithContentFailure:(id)a3 whilePlaying:(id)a4 previousContentURL:(id)a5 nextContentURL:(id)a6 userActivityDictionary:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CMSContentFailureRequest;
  v17 = [(CMSContentFailureRequest *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contentFailure, a3);
    objc_storeStrong((id *)&v18->_whilePlaying, a4);
    objc_storeStrong((id *)&v18->_previousContentURL, a5);
    objc_storeStrong((id *)&v18->_nextContentURL, a6);
    objc_storeStrong((id *)&v18->_userActivityDictionary, a7);
    uint64_t v19 = [MEMORY[0x263EFF910] date];
    timestamp = v18->_timestamp;
    v18->_timestamp = (NSDate *)v19;
  }
  return v18;
}

- (id)cmsCoded
{
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:9];
  v4 = CMSCloudExtensionSpecVersion();
  [v3 setObject:v4 forKey:@"version"];

  v5 = [(CMSContentFailure *)self->_contentFailure cmsCoded];
  [v3 setObject:v5 forKey:@"contentFailure"];

  [v3 cmsSetOptionalCodedObject:self->_whilePlaying forKey:@"whilePlaying"];
  v6 = [(NSURL *)self->_previousContentURL absoluteString];
  [v3 cmsSetNullableObject:v6 forKey:@"previousContentUrl"];

  v7 = [(NSURL *)self->_nextContentURL absoluteString];
  [v3 cmsSetNullableObject:v7 forKey:@"nextContentUrl"];

  v8 = [(NSDate *)self->_timestamp cmsCoded];
  [v3 setObject:v8 forKey:@"timestamp"];

  [v3 cmsSetNullableObject:self->_userActivityDictionary forKey:@"userActivity"];
  [v3 cmsSetOptionalObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
  [v3 cmsSetOptionalObject:self->_constraints forKey:@"constraints"];
  return v3;
}

- (NSString)description
{
  v2 = [(CMSContentFailureRequest *)self cmsCoded];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (CMSContentFailure)contentFailure
{
  return self->_contentFailure;
}

- (void)setContentFailure:(id)a3
{
}

- (CMSPlayerContext)whilePlaying
{
  return self->_whilePlaying;
}

- (void)setWhilePlaying:(id)a3
{
}

- (NSURL)previousContentURL
{
  return self->_previousContentURL;
}

- (void)setPreviousContentURL:(id)a3
{
}

- (NSURL)nextContentURL
{
  return self->_nextContentURL;
}

- (void)setNextContentURL:(id)a3
{
}

- (NSDictionary)userActivityDictionary
{
  return self->_userActivityDictionary;
}

- (void)setUserActivityDictionary:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSDictionary)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_userActivityDictionary, 0);
  objc_storeStrong((id *)&self->_nextContentURL, 0);
  objc_storeStrong((id *)&self->_previousContentURL, 0);
  objc_storeStrong((id *)&self->_whilePlaying, 0);
  objc_storeStrong((id *)&self->_contentFailure, 0);
}

@end