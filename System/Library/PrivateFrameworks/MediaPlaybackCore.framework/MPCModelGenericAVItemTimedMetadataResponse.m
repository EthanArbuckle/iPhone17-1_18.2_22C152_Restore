@interface MPCModelGenericAVItemTimedMetadataResponse
- (BOOL)isFinalResponse;
- (BOOL)isFirstResponse;
- (MPCModelGenericAVItemTimedMetadataResponse)initWithRequest:(id)a3 personalizationResponse:(id)a4 firstResponse:(BOOL)a5 finalResponse:(BOOL)a6;
- (MPCModelGenericAVItemTimedMetadataStreamFields)streamFields;
- (MPSectionedCollection)unpersonalizedContentDescriptors;
- (NSData)adamIDData;
- (void)dealloc;
- (void)setAdamIDData:(id)a3;
- (void)setFinalResponse:(BOOL)a3;
- (void)setFirstResponse:(BOOL)a3;
- (void)setStreamFields:(id)a3;
- (void)setUnpersonalizedContentDescriptors:(id)a3;
@end

@implementation MPCModelGenericAVItemTimedMetadataResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpersonalizedContentDescriptors, 0);
  objc_storeStrong((id *)&self->_streamFields, 0);
  objc_storeStrong((id *)&self->_adamIDData, 0);

  objc_storeStrong((id *)&self->_personalizationResponse, 0);
}

- (void)setUnpersonalizedContentDescriptors:(id)a3
{
}

- (MPSectionedCollection)unpersonalizedContentDescriptors
{
  return self->_unpersonalizedContentDescriptors;
}

- (void)setStreamFields:(id)a3
{
}

- (MPCModelGenericAVItemTimedMetadataStreamFields)streamFields
{
  return self->_streamFields;
}

- (void)setAdamIDData:(id)a3
{
}

- (NSData)adamIDData
{
  return self->_adamIDData;
}

- (void)setFinalResponse:(BOOL)a3
{
  self->_finalResponse = a3;
}

- (BOOL)isFinalResponse
{
  return self->_finalResponse;
}

- (void)setFirstResponse:(BOOL)a3
{
  self->_firstResponse = a3;
}

- (BOOL)isFirstResponse
{
  return self->_firstResponse;
}

- (void)dealloc
{
  if (self->_personalizationResponse)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_personalizationResponse name:*MEMORY[0x263F11B18] object:self->_personalizationResponse];
  }
  v4.receiver = self;
  v4.super_class = (Class)MPCModelGenericAVItemTimedMetadataResponse;
  [(MPCModelGenericAVItemTimedMetadataResponse *)&v4 dealloc];
}

- (MPCModelGenericAVItemTimedMetadataResponse)initWithRequest:(id)a3 personalizationResponse:(id)a4 firstResponse:(BOOL)a5 finalResponse:(BOOL)a6
{
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MPCModelGenericAVItemTimedMetadataResponse;
  v12 = [(MPModelResponse *)&v18 initWithRequest:a3];
  v13 = v12;
  if (v12)
  {
    p_personalizationResponse = (id *)&v12->_personalizationResponse;
    objc_storeStrong((id *)&v12->_personalizationResponse, a4);
    v13->_firstResponse = a5;
    v13->_finalResponse = a6;
    if (*p_personalizationResponse)
    {
      v15 = [*p_personalizationResponse results];
      [(MPModelResponse *)v13 setResults:v15];

      v16 = [MEMORY[0x263F08A00] defaultCenter];
      [v16 addObserver:v13 selector:sel__personalizationResponseDidInvalidateNotification_ name:*MEMORY[0x263F11B18] object:*p_personalizationResponse];
      if (([*p_personalizationResponse isValid] & 1) == 0) {
        [(MPModelResponse *)v13 _invalidate];
      }
    }
  }

  return v13;
}

@end