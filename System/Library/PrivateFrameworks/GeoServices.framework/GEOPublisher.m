@interface GEOPublisher
- (BOOL)isBlocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuppressed;
- (GEOCollectionPublisherAttribution)publisherAttribution;
- (GEOMapItemIdentifier)identifier;
- (GEOPublisher)initWithPublisher:(id)a3 usingAttribution:(id)a4;
- (NSString)publisherDescription;
- (NSURL)publisherURL;
- (int64_t)totalCollectionCount;
- (unint64_t)hash;
@end

@implementation GEOPublisher

- (GEOPublisher)initWithPublisher:(id)a3 usingAttribution:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v7 = (id *)a3;
  id v8 = a4;
  uint64_t v9 = (uint64_t)v8;
  if (v7)
  {
    -[GEOPDPublisher _readPublisherId]((uint64_t)v7);
    BOOL v10 = v7[7] != 0;
    if (v9) {
      goto LABEL_3;
    }
LABEL_13:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  BOOL v10 = 0;
  if (!v8) {
    goto LABEL_13;
  }
LABEL_3:
  -[GEOPDAttribution _readVendorId](v9);
  uint64_t v11 = *(void *)(v9 + 56);
  BOOL v12 = v11 != 0;
  if (v11) {
    BOOL v13 = v10;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    v26.receiver = self;
    v26.super_class = (Class)GEOPublisher;
    v14 = [(GEOPublisher *)&v26 init];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_publisher, a3);
      uint64_t v16 = -[GEOPDAttribution vendorId]((id *)v9);
      publisherAttributionIdentifierString = v15->_publisherAttributionIdentifierString;
      v15->_publisherAttributionIdentifierString = (NSString *)v16;
    }
    v18 = GEOGetCuratedCollectionsLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      -[GEOPDPublisher publisherId](v7);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      -[GEOPDAttribution vendorId]((id *)v9);
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      __int16 v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_DEBUG, "Succesfully initialized Publisher with Id: %@, vendorId: %@", buf, 0x16u);
    }
    self = v15;
    v21 = self;
    goto LABEL_22;
  }
LABEL_14:
  v22 = GEOGetCuratedCollectionsLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = "NO";
    if (v10) {
      v24 = "YES";
    }
    else {
      v24 = "NO";
    }
    if (v12) {
      v23 = "YES";
    }
    *(_DWORD *)buf = 136315394;
    v28 = v24;
    __int16 v29 = 2080;
    v30 = v23;
    _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_ERROR, "Place Collection could not be initialized because some data is missing.\n Publisher hasPublisherId: %s, hasVendorId: %s", buf, 0x16u);
  }

  v21 = 0;
LABEL_22:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GEOPublisher *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(GEOPDPublisher *)self->_publisher isEqual:v4->_publisher];
  }

  return v5;
}

- (GEOCollectionPublisherAttribution)publisherAttribution
{
  publisherAttribution = self->_publisherAttribution;
  if (!publisherAttribution)
  {
    v4 = +[GEOCollectionPublisherAttributionManager sharedInstance];
    BOOL v5 = [v4 bestAttributionForPublisher:self->_publisherAttributionIdentifierString];
    v6 = self->_publisherAttribution;
    self->_publisherAttribution = v5;

    publisherAttribution = self->_publisherAttribution;
  }

  return publisherAttribution;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GEOPDPublisher *)self->_publisher hash];
  v4 = [(GEOPublisher *)self identifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (int64_t)totalCollectionCount
{
  publisher = self->_publisher;
  if (publisher) {
    return publisher->_numCollections;
  }
  else {
    return 0;
  }
}

- (GEOMapItemIdentifier)identifier
{
  unint64_t v3 = [GEOMapItemIdentifier alloc];
  v4 = -[GEOPDPublisher publisherId]((id *)&self->_publisher->super.super.isa);
  unint64_t v5 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v4];

  return v5;
}

- (NSString)publisherDescription
{
  return (NSString *)[(GEOPDPublisher *)self->_publisher publisherDescription];
}

- (NSURL)publisherURL
{
  unint64_t v3 = [(GEOPublisher *)self identifier];
  uint64_t v4 = [v3 muid];
  unint64_t v5 = [(GEOPublisher *)self identifier];
  v6 = +[GEOMapURLBuilder URLForPublisher:provider:](GEOMapURLBuilder, "URLForPublisher:provider:", v4, [v5 resultProviderID]);

  return (NSURL *)v6;
}

- (BOOL)isSuppressed
{
  return -[GEOPDPublisher errorState]((uint64_t)self->_publisher) == 1;
}

- (BOOL)isBlocked
{
  return -[GEOPDPublisher errorState]((uint64_t)self->_publisher) == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherAttribution, 0);
  objc_storeStrong((id *)&self->_publisherAttributionIdentifierString, 0);

  objc_storeStrong((id *)&self->_publisher, 0);
}

@end