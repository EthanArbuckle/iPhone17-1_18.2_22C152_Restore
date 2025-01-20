@interface MPModelShimResponse
+ (id)builderProtocol;
- (MPModelResponse)modelResponse;
- (MPModelShimResponse)initWithRequest:(id)a3 middleware:(id)a4;
- (void)setModelResponse:(id)a3;
@end

@implementation MPModelShimResponse

+ (id)builderProtocol
{
  return &unk_1EE78DE68;
}

- (MPModelResponse)modelResponse
{
  return self->_modelResponse;
}

- (MPModelShimResponse)initWithRequest:(id)a3 middleware:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPModelShimResponse;
  v7 = [(MPResponse *)&v12 initWithRequest:a3 middleware:v6];
  if (v7)
  {
    v8 = [v6 firstObject];
    uint64_t v9 = [v8 modelResponse];
    modelResponse = v7->_modelResponse;
    v7->_modelResponse = (MPModelResponse *)v9;
  }
  return v7;
}

- (void).cxx_destruct
{
}

- (void)setModelResponse:(id)a3
{
}

@end