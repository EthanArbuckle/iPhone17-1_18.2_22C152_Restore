@interface _MKMapItemReviewsAttribution
- (NSArray)addReviewURLs;
- (_MKMapItemReviewsAttribution)initWithGEOMapItemAttribution:(id)a3;
- (id)urlsForReview:(id)a3;
- (id)urlsForSelectedItemWithItems:(id)a3;
@end

@implementation _MKMapItemReviewsAttribution

- (_MKMapItemReviewsAttribution)initWithGEOMapItemAttribution:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKMapItemReviewsAttribution;
  v6 = [(_MKMapItemAttribution *)&v10 initWithGEOMapItemAttribution:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geoReviewsAttribution, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)addReviewURLs
{
  return (NSArray *)[(GEOMapItemReviewsAttribution *)self->_geoReviewsAttribution addReviewURLs];
}

- (id)urlsForReview:(id)a3
{
  geoReviewsAttribution = self->_geoReviewsAttribution;
  v4 = [a3 _geoReview];
  id v5 = [(GEOMapItemReviewsAttribution *)geoReviewsAttribution urlsForReview:v4];

  return v5;
}

- (id)urlsForSelectedItemWithItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "_geoMapItem", (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [(GEOMapItemReviewsAttribution *)self->_geoReviewsAttribution urlsForSelectedItemWithItems:v5];

  return v12;
}

- (void).cxx_destruct
{
}

@end