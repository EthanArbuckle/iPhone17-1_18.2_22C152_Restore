@interface CMSUpdateActivityRequest
- (CMSContentFailure)contentFailure;
- (CMSPlayerContext)nowPlaying;
- (CMSPlayerContext)previouslyPlaying;
- (NSDate)timestamp;
- (NSDictionary)constraints;
- (NSDictionary)userActivityDictionary;
- (NSString)description;
- (NSString)sessionIdentifier;
- (id)cmsCoded;
- (id)initForActivity:(id)a3 failure:(id)a4 whilePlaying:(id)a5;
- (id)initForActivity:(id)a3 report:(unint64_t)a4 nowPlaying:(id)a5 previouslyPlaying:(id)a6;
- (unint64_t)report;
- (void)setConstraints:(id)a3;
- (void)setContentFailure:(id)a3;
- (void)setNowPlaying:(id)a3;
- (void)setPreviouslyPlaying:(id)a3;
- (void)setReport:(unint64_t)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUserActivityDictionary:(id)a3;
@end

@implementation CMSUpdateActivityRequest

- (id)initForActivity:(id)a3 report:(unint64_t)a4 nowPlaying:(id)a5 previouslyPlaying:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CMSUpdateActivityRequest;
  v14 = [(CMSUpdateActivityRequest *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userActivityDictionary, a3);
    uint64_t v16 = [MEMORY[0x263EFF910] date];
    timestamp = v15->_timestamp;
    v15->_timestamp = (NSDate *)v16;

    v15->_report = a4;
    objc_storeStrong((id *)&v15->_nowPlaying, a5);
    objc_storeStrong((id *)&v15->_previouslyPlaying, a6);
  }

  return v15;
}

- (id)initForActivity:(id)a3 failure:(id)a4 whilePlaying:(id)a5
{
  id v9 = a4;
  if (self)
  {
    v10 = [(CMSUpdateActivityRequest *)self initForActivity:a3 report:13 nowPlaying:0 previouslyPlaying:a5];
    objc_storeStrong(v10 + 8, a4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)cmsCoded
{
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:9];
  v4 = CMSCloudExtensionSpecVersion();
  [v3 setObject:v4 forKey:@"version"];

  [v3 cmsSetOptionalCodedObject:self->_timestamp forKey:@"timestamp"];
  v5 = CMSActivityReportTypeToString(self->_report);
  [v3 setObject:v5 forKey:@"report"];

  [v3 cmsSetOptionalCodedObject:self->_nowPlaying forKey:@"nowPlaying"];
  [v3 cmsSetOptionalCodedObject:self->_previouslyPlaying forKey:@"previouslyPlaying"];
  [v3 cmsSetOptionalCodedObject:self->_contentFailure forKey:@"contentFailure"];
  [v3 cmsSetOptionalObject:self->_constraints forKey:@"constraints"];
  [v3 cmsSetNullableObject:self->_userActivityDictionary forKey:@"userActivity"];
  [v3 cmsSetOptionalObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
  return v3;
}

- (NSString)description
{
  v2 = [(CMSUpdateActivityRequest *)self cmsCoded];
  v3 = [v2 description];

  return (NSString *)v3;
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

- (unint64_t)report
{
  return self->_report;
}

- (void)setReport:(unint64_t)a3
{
  self->_report = a3;
}

- (CMSPlayerContext)nowPlaying
{
  return self->_nowPlaying;
}

- (void)setNowPlaying:(id)a3
{
}

- (CMSPlayerContext)previouslyPlaying
{
  return self->_previouslyPlaying;
}

- (void)setPreviouslyPlaying:(id)a3
{
}

- (CMSContentFailure)contentFailure
{
  return self->_contentFailure;
}

- (void)setContentFailure:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFailure, 0);
  objc_storeStrong((id *)&self->_previouslyPlaying, 0);
  objc_storeStrong((id *)&self->_nowPlaying, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_userActivityDictionary, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end