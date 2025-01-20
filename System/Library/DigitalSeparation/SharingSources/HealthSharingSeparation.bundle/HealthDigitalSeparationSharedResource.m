@interface HealthDigitalSeparationSharedResource
- (HealthDigitalSeparationSharedResource)initWithDigitalSeparationEntries:(id)a3;
- (NSArray)digitalEntries;
- (NSArray)participants;
- (NSString)displayDetail;
- (NSString)displayName;
- (int64_t)visibility;
- (void)setDigitalEntries:(id)a3;
@end

@implementation HealthDigitalSeparationSharedResource

- (HealthDigitalSeparationSharedResource)initWithDigitalSeparationEntries:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HealthDigitalSeparationSharedResource;
  v5 = [(HealthDigitalSeparationSharedResource *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    digitalEntries = v5->_digitalEntries;
    v5->_digitalEntries = v6;
  }
  return v5;
}

- (NSString)displayName
{
  return 0;
}

- (NSString)displayDetail
{
  return 0;
}

- (NSArray)participants
{
  return self->_digitalEntries;
}

- (int64_t)visibility
{
  return 1;
}

- (NSArray)digitalEntries
{
  return self->_digitalEntries;
}

- (void)setDigitalEntries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end