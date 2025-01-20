@interface GEOPlaceCollection
- (BOOL)isBlocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuppressed;
- (GEOCollectionPublisherAttribution)publisherAttribution;
- (GEOMapItemIdentifier)collectionIdentifier;
- (GEOMapItemPhoto)authorPhoto;
- (GEOPlaceCollection)initWithCollection:(id)a3 usingAttribution:(id)a4;
- (GEOPlaceCollectionPullQuote)publisherBlockQuote;
- (GEOPublisher)publisher;
- (NSArray)itemIds;
- (NSArray)mediaLinks;
- (NSArray)photos;
- (NSDate)lastModifiedDate;
- (NSString)authorName;
- (NSString)collectionDescription;
- (NSString)collectionHTMLDescription;
- (NSString)collectionLongTitle;
- (NSString)collectionTitle;
- (NSString)publisherAttributionIdentifierString;
- (NSURL)collectionURL;
- (NSURL)publisherCollectionURL;
- (id)description;
- (unint64_t)hash;
- (unint64_t)numberOfItems;
@end

@implementation GEOPlaceCollection

- (NSString)collectionTitle
{
  return (NSString *)[(GEOPDPlaceCollection *)self->_collection collectionTitle];
}

- (GEOCollectionPublisherAttribution)publisherAttribution
{
  publisherAttribution = self->_publisherAttribution;
  if (!publisherAttribution)
  {
    v4 = +[GEOCollectionPublisherAttributionManager sharedInstance];
    v5 = [v4 bestAttributionForPublisher:self->_publisherAttributionIdentifierString];
    v6 = self->_publisherAttribution;
    self->_publisherAttribution = v5;

    publisherAttribution = self->_publisherAttribution;
  }

  return publisherAttribution;
}

- (GEOPlaceCollection)initWithCollection:(id)a3 usingAttribution:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  v8 = (id *)a4;
  if (v7)
  {
    -[GEOPDPlaceCollection _readCollectionId]((uint64_t)v7);
    BOOL v9 = v7[10] != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  v10 = [v7 collectionTitle];
  uint64_t v11 = [v10 length];

  v12 = -[GEOPDPlaceCollection photos]((id *)v7);
  uint64_t v13 = [v12 count];

  v14 = -[GEOPDAttribution vendorId](v8);
  uint64_t v15 = [v14 length];

  if (v9 && v11 && v13 && v15)
  {
    v36.receiver = self;
    v36.super_class = (Class)GEOPlaceCollection;
    v16 = [(GEOPlaceCollection *)&v36 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_collection, a3);
      v18 = -[GEOPDPlaceCollection publisher]((id *)&v17->_collection->super.super.isa);
      if (v18)
      {
        v19 = [GEOPublisher alloc];
        v20 = -[GEOPDPlaceCollection publisher]((id *)&v17->_collection->super.super.isa);
        uint64_t v21 = [(GEOPublisher *)v19 initWithPublisher:v20 usingAttribution:v8];
        publisher = v17->_publisher;
        v17->_publisher = (GEOPublisher *)v21;
      }
      else
      {
        v20 = v17->_publisher;
        v17->_publisher = 0;
      }

      uint64_t v29 = -[GEOPDAttribution vendorId](v8);
      publisherAttributionIdentifierString = v17->_publisherAttributionIdentifierString;
      v17->_publisherAttributionIdentifierString = (NSString *)v29;

      if (!v7 || !*((_DWORD *)v7 + 58))
      {
        v31 = GEOGetCuratedCollectionsLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_INFO, "Warning. Place Collection number of items is 0.", buf, 2u);
        }
      }
    }
    v32 = GEOGetCuratedCollectionsLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      -[GEOPDPlaceCollection collectionId]((id *)v7);
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      v34 = [v7 collectionTitle];
      *(_DWORD *)buf = 138412546;
      v38 = v33;
      __int16 v39 = 2112;
      v40 = v34;
      _os_log_impl(&dword_188D96000, v32, OS_LOG_TYPE_DEBUG, "Succesfully initialized Place Collection with Id: %@, Title: %@", buf, 0x16u);
    }
    self = v17;
    v28 = self;
  }
  else
  {
    v23 = GEOGetCuratedCollectionsLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = "NO";
      if (v9) {
        v25 = "YES";
      }
      else {
        v25 = "NO";
      }
      if (v11) {
        v26 = "YES";
      }
      else {
        v26 = "NO";
      }
      *(_DWORD *)buf = 136315906;
      v38 = v25;
      if (v13) {
        v27 = "YES";
      }
      else {
        v27 = "NO";
      }
      __int16 v39 = 2080;
      v40 = v26;
      __int16 v41 = 2080;
      v42 = v27;
      if (v15) {
        v24 = "YES";
      }
      __int16 v43 = 2080;
      v44 = v24;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "Place Collection could not be initialized because some data is missing.\nPlace Collection hasId: %s, hasTitle: %s, hasPhotos: %s, hasVendorID: %s", buf, 0x2Au);
    }

    v28 = 0;
  }

  return v28;
}

- (NSArray)photos
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = -[GEOPDPlaceCollection photos]((id *)&self->_collection->super.super.isa);
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = -[GEOPDPlaceCollection photos]((id *)&self->_collection->super.super.isa);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = [_GEOPlaceDataPhoto alloc];
        uint64_t v13 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v12, "initWithCaptionedPhoto:", v11, (void)v16);
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];

  return (NSArray *)v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GEOPlaceCollection *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(GEOPDPlaceCollection *)self->_collection isEqual:v4->_collection];
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GEOPDPlaceCollection *)self->_collection hash];
  v4 = [(GEOPlaceCollection *)self collectionIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (GEOMapItemIdentifier)collectionIdentifier
{
  unint64_t v3 = [GEOMapItemIdentifier alloc];
  v4 = -[GEOPDPlaceCollection collectionId]((id *)&self->_collection->super.super.isa);
  unint64_t v5 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v4];

  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(GEOPDPlaceCollection *)self->_collection collectionLongTitle];
  unint64_t v5 = v4;
  if (!v4)
  {
    unint64_t v5 = [(GEOPDPlaceCollection *)self->_collection collectionTitle];
  }
  v6 = -[GEOPDPlaceCollection collectionId]((id *)&self->_collection->super.super.isa);
  uint64_t v7 = [v3 stringWithFormat:@"Collection: %@, MUID: %@", v5, v6];

  if (!v4) {

  }
  return v7;
}

- (NSString)collectionLongTitle
{
  return (NSString *)[(GEOPDPlaceCollection *)self->_collection collectionLongTitle];
}

- (NSString)collectionDescription
{
  return (NSString *)[(GEOPDPlaceCollection *)self->_collection collectionDescription];
}

- (NSString)collectionHTMLDescription
{
  return (NSString *)[(GEOPDPlaceCollection *)self->_collection collectionHTMLDescription];
}

- (NSArray)itemIds
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = -[GEOPDPlaceCollection itemIds]((id *)&self->_collection->super.super.isa);
  unint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = -[GEOPDPlaceCollection itemIds]((id *)&self->_collection->super.super.isa);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = [GEOMapItemIdentifier alloc];
        uint64_t v13 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v12, "initWithMapsIdentifier:", v11, (void)v16);
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];

  return (NSArray *)v14;
}

- (unint64_t)numberOfItems
{
  collection = self->_collection;
  if (collection && (*(unsigned char *)&collection->_flags & 4) != 0) {
    return collection->_numItems;
  }
  id v3 = -[GEOPDPlaceCollection itemIds]((id *)&collection->super.super.isa);
  unint64_t v4 = [v3 count];

  return v4;
}

- (NSDate)lastModifiedDate
{
  collection = self->_collection;
  if (collection) {
    double modifiedTime = collection->_modifiedTime;
  }
  else {
    double modifiedTime = 0.0;
  }
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:modifiedTime];
}

- (NSString)authorName
{
  return -[GEOPDPlaceCollection authorName]((id *)&self->_collection->super.super.isa);
}

- (GEOMapItemPhoto)authorPhoto
{
  collection = self->_collection;
  if (collection && (-[GEOPDPlaceCollection _readAuthorPhoto]((uint64_t)self->_collection), collection->_authorPhoto))
  {
    unint64_t v4 = [_GEOPlaceDataPhoto alloc];
    unint64_t v5 = -[GEOPDPlaceCollection authorPhoto]((id *)&self->_collection->super.super.isa);
    v6 = [(_GEOPlaceDataPhoto *)v4 initWithCaptionedPhoto:v5];
  }
  else
  {
    v6 = 0;
  }

  return (GEOMapItemPhoto *)v6;
}

- (NSURL)collectionURL
{
  id v3 = [(GEOPlaceCollection *)self collectionIdentifier];
  uint64_t v4 = [v3 muid];
  unint64_t v5 = [(GEOPlaceCollection *)self collectionIdentifier];
  v6 = +[GEOMapURLBuilder URLForCuratedCollection:provider:](GEOMapURLBuilder, "URLForCuratedCollection:provider:", v4, [v5 resultProviderID]);

  return (NSURL *)v6;
}

- (NSURL)publisherCollectionURL
{
  collection = self->_collection;
  if (collection && (-[GEOPDPlaceCollection _readUrl]((uint64_t)self->_collection), collection->_url))
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
    unint64_t v5 = -[GEOPDPlaceCollection url]((id *)&self->_collection->super.super.isa);
    v6 = [v4 URLWithString:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSURL *)v6;
}

- (BOOL)isSuppressed
{
  unsigned int v3 = -[GEOPDPlaceCollection errorState]((os_unfair_lock_s *)self->_collection);
  if (v3 != 1)
  {
    publisher = self->_publisher;
    LOBYTE(v3) = [(GEOPublisher *)publisher isSuppressed];
  }
  return v3;
}

- (BOOL)isBlocked
{
  if (-[GEOPDPlaceCollection errorState]((os_unfair_lock_s *)self->_collection) == 2) {
    return 1;
  }
  publisher = self->_publisher;

  return [(GEOPublisher *)publisher isBlocked];
}

- (GEOPlaceCollectionPullQuote)publisherBlockQuote
{
  unsigned int v3 = [GEOPlaceCollectionPullQuote alloc];
  uint64_t v4 = [(GEOPDPlaceCollection *)self->_collection publisherDescriptionOfCollectionItem];
  unint64_t v5 = [(GEOPDPlaceCollection *)self->_collection publisherHTMLDescriptionOfCollectionItem];
  v6 = [(GEOPlaceCollectionPullQuote *)v3 initWithPlainText:v4 htmlText:v5];

  return v6;
}

- (NSArray)mediaLinks
{
  v2 = -[GEOPDPlaceCollection mediaLinks]((id *)&self->_collection->super.super.isa);
  unsigned int v3 = objc_msgSend(v2, "_geo_compactMap:", &__block_literal_global_3);

  return (NSArray *)v3;
}

id __32__GEOPlaceCollection_mediaLinks__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GEOMediaLink mediaLinkFromProto:a2];
}

- (GEOPublisher)publisher
{
  return self->_publisher;
}

- (NSString)publisherAttributionIdentifierString
{
  return self->_publisherAttributionIdentifierString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherAttributionIdentifierString, 0);
  objc_storeStrong((id *)&self->_publisherAttribution, 0);
  objc_storeStrong((id *)&self->_publisher, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end