@interface ATXBiomeSuggestedHomePageStream
- (ATXBiomeSuggestedHomePageStream)init;
- (ATXBiomeSuggestedHomePageStream)initWithStoreConfig:(id)a3;
- (BMStoreStream)inner;
- (NSString)identifier;
- (id)publisherFromStartTime:(double)a3;
- (id)source;
- (void)sendEvent:(id)a3;
- (void)setInner:(id)a3;
@end

@implementation ATXBiomeSuggestedHomePageStream

- (NSString)identifier
{
  return (NSString *)@"ATXBiomeSuggestedHomePageStream";
}

- (ATXBiomeSuggestedHomePageStream)init
{
  return [(ATXBiomeSuggestedHomePageStream *)self initWithStoreConfig:0];
}

- (ATXBiomeSuggestedHomePageStream)initWithStoreConfig:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXBiomeSuggestedHomePageStream;
  v5 = [(ATXBiomeSuggestedHomePageStream *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F50278], "atx_storeConfig");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"ATXBiomeSuggestedHomePageStream" storeConfig:v6 eventDataClass:objc_opt_class()];
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;
  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)[(BMStoreStream *)self->_inner publisherFromStartTime:a3];
}

- (id)source
{
  return (id)[(BMStoreStream *)self->_inner source];
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXBiomeSuggestedHomePageStream *)self source];
  [v5 sendEvent:v4];
}

- (BMStoreStream)inner
{
  return self->_inner;
}

- (void)setInner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end