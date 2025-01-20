@interface HDObjectAuthorizationRequestContext
- (BOOL)persistSession;
- (BOOL)promptWithAllSamples;
- (BOOL)promptWithNoSamples;
- (HDObjectAuthorizationRequestContext)initWithSamples:(id)a3 metadata:(id)a4;
- (HKObjectAuthorizationPromptSessionMetadata)metadata;
- (NSArray)samples;
- (void)setPersistSession:(BOOL)a3;
- (void)setPromptWithAllSamples:(BOOL)a3;
- (void)setPromptWithNoSamples:(BOOL)a3;
@end

@implementation HDObjectAuthorizationRequestContext

- (HDObjectAuthorizationRequestContext)initWithSamples:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDObjectAuthorizationRequestContext;
  v8 = [(HDObjectAuthorizationRequestContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    samples = v8->_samples;
    v8->_samples = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    metadata = v8->_metadata;
    v8->_metadata = (HKObjectAuthorizationPromptSessionMetadata *)v11;
  }
  return v8;
}

- (BOOL)persistSession
{
  return self->_persistSession;
}

- (void)setPersistSession:(BOOL)a3
{
  self->_persistSession = a3;
}

- (BOOL)promptWithNoSamples
{
  return self->_promptWithNoSamples;
}

- (void)setPromptWithNoSamples:(BOOL)a3
{
  self->_promptWithNoSamples = a3;
}

- (BOOL)promptWithAllSamples
{
  return self->_promptWithAllSamples;
}

- (void)setPromptWithAllSamples:(BOOL)a3
{
  self->_promptWithAllSamples = a3;
}

- (NSArray)samples
{
  return self->_samples;
}

- (HKObjectAuthorizationPromptSessionMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_samples, 0);
}

@end