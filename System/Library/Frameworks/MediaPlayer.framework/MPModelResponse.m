@interface MPModelResponse
- (BOOL)isEmpty;
- (BOOL)isValid;
- (MPModelRequest)request;
- (MPModelResponse)init;
- (MPModelResponse)initWithRequest:(id)a3;
- (MPPropertySet)deferredItemProperties;
- (MPPropertySet)deferredSectionProperties;
- (MPSectionedCollection)results;
- (id)debugDescription;
- (id)description;
- (void)_invalidate;
- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4;
- (void)setDeferredItemProperties:(id)a3;
- (void)setDeferredSectionProperties:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation MPModelResponse

- (MPSectionedCollection)results
{
  return self->_results;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_deferredItemProperties, 0);
  objc_storeStrong((id *)&self->_deferredSectionProperties, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setResults:(id)a3
{
}

- (MPModelResponse)initWithRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MPModelResponse.m", 28, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)MPModelResponse;
  v6 = [(MPModelResponse *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    request = v6->_request;
    v6->_request = (MPModelRequest *)v7;

    v6->_valid = 1;
  }

  return v6;
}

- (MPModelRequest)request
{
  return self->_request;
}

- (void)setDeferredItemProperties:(id)a3
{
}

- (MPPropertySet)deferredItemProperties
{
  return self->_deferredItemProperties;
}

- (void)setDeferredSectionProperties:(id)a3
{
}

- (MPPropertySet)deferredSectionProperties
{
  return self->_deferredSectionProperties;
}

- (void)_invalidate
{
  if (self->_valid)
  {
    self->_valid = 0;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"MPModelResponseDidInvalidateNotification" object:self];
  }
}

- (BOOL)isEmpty
{
  v2 = [(MPModelResponse *)self results];
  BOOL v3 = [v2 totalItemCount] == 0;

  return v3;
}

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  v4 = (void (**)(id, void))a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v4[2](v4, 0);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__MPModelResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke;
    block[3] = &unk_1E57FA198;
    v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __67__MPModelResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (!self->_valid) {
    [v6 appendString:@"; isValid = NO"];
  }
  deferredItemProperties = self->_deferredItemProperties;
  if (deferredItemProperties)
  {
    v8 = [(MPPropertySet *)deferredItemProperties description];
    [v6 appendFormat:@"; deferredItemProperties = %@", v8];
  }
  deferredSectionProperties = self->_deferredSectionProperties;
  if (deferredSectionProperties)
  {
    v10 = [(MPPropertySet *)deferredSectionProperties description];
    [v6 appendFormat:@"; deferredSectionProperties = %@", v10];
  }
  results = self->_results;
  if (results)
  {
    v12 = [(MPSectionedCollection *)results description];
    [v6 appendFormat:@"; results = %@", v12];
  }
  [v6 appendString:@">"];

  return v6;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (!self->_valid) {
    [v6 appendString:@"; isValid = NO"];
  }
  deferredItemProperties = self->_deferredItemProperties;
  if (deferredItemProperties)
  {
    v8 = [(MPPropertySet *)deferredItemProperties debugDescription];
    [v6 appendFormat:@"; deferredItemProperties = %@", v8];
  }
  deferredSectionProperties = self->_deferredSectionProperties;
  if (deferredSectionProperties)
  {
    v10 = [(MPPropertySet *)deferredSectionProperties debugDescription];
    [v6 appendFormat:@"; deferredSectionProperties = %@", v10];
  }
  results = self->_results;
  if (results)
  {
    v12 = [(MPSectionedCollection *)results debugDescription];
    [v6 appendFormat:@"; results = %@", v12];
  }
  [v6 appendString:@">"];

  return v6;
}

- (MPModelResponse)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MPModelResponse.m" lineNumber:23 description:@"-initWithRequest: must be used."];

  id v5 = objc_alloc_init(MPModelRequest);
  v6 = [(MPModelResponse *)self initWithRequest:v5];

  return v6;
}

@end