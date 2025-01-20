@interface MPStoreModelRequestConfiguration
- (MPStoreModelRequestConfiguration)initWithRequestedItemIdentifiers:(id)a3 reason:(unint64_t)a4;
- (MPStoreModelRequestConfiguration)initWithURLRequest:(id)a3;
- (MPStoreModelRequestConfiguration)initWithURLRequests:(id)a3;
- (NSArray)URLRequests;
- (NSArray)requestedItemIdentifiers;
- (NSURLRequest)URLRequest;
- (int64_t)type;
- (unint64_t)itemMetadataRequestReason;
@end

@implementation MPStoreModelRequestConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedItemIdentifiers, 0);

  objc_storeStrong((id *)&self->_URLRequests, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)itemMetadataRequestReason
{
  return self->_itemMetadataRequestReason;
}

- (NSArray)requestedItemIdentifiers
{
  return self->_requestedItemIdentifiers;
}

- (NSArray)URLRequests
{
  return self->_URLRequests;
}

- (MPStoreModelRequestConfiguration)initWithRequestedItemIdentifiers:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPStoreModelRequestConfiguration;
  v7 = [(MPStoreModelRequestConfiguration *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    requestedItemIdentifiers = v7->_requestedItemIdentifiers;
    v7->_requestedItemIdentifiers = (NSArray *)v8;

    v7->_itemMetadataRequestReason = a4;
    v7->_type = 1;
  }

  return v7;
}

- (NSURLRequest)URLRequest
{
  return (NSURLRequest *)[(NSArray *)self->_URLRequests firstObject];
}

- (MPStoreModelRequestConfiguration)initWithURLRequests:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreModelRequestConfiguration;
  v5 = [(MPStoreModelRequestConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    URLRequests = v5->_URLRequests;
    v5->_URLRequests = (NSArray *)v6;

    v5->_type = 2 * ((unint64_t)[v4 count] > 1);
  }

  return v5;
}

- (MPStoreModelRequestConfiguration)initWithURLRequest:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPStoreModelRequestConfiguration;
  v5 = [(MPStoreModelRequestConfiguration *)&v10 init];
  if (v5)
  {
    uint64_t v6 = (void *)[v4 copy];
    v11[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    URLRequests = v5->_URLRequests;
    v5->_URLRequests = (NSArray *)v7;

    v5->_type = 0;
  }

  return v5;
}

@end