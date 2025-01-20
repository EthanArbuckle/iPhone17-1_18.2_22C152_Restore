@interface MKLocalSearchCompletion
- (BOOL)_alreadySentFeedback;
- (BOOL)_hasDisambiguationRadiusMeters;
- (BOOL)_supportsOfflineDownload;
- (BOOL)getCoordinate:(CLLocationCoordinate2D *)a3;
- (BOOL)hasQueryAcceleratorAffordanceEnabled;
- (BOOL)hasSortPriority;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (GEOCollectionResult)collectionResult;
- (GEOCompletionItem)geoCompletionItem;
- (GEODirectionIntent)directionIntent;
- (GEOPublisherResult)publisherResult;
- (GEOResolvedItem)clientResolved;
- (GEORetainedSearchMetadata)retainedSearchMetadata;
- (GEOSearchCategory)category;
- (GEOServerResultScoreMetadata)serverResultScoreMetadata;
- (GEOStyleAttributes)iconStyleAttributes;
- (MKLocalSearchCompletion)directionIntentDestination;
- (MKLocalSearchCompletion)directionIntentOrigin;
- (MKLocalSearchCompletion)initWithGeoCompletionItem:(id)a3 serverSectionIndex:(unint64_t)a4 serverItemIndexInSection:(unint64_t)a5;
- (MKMapItem)mapItem;
- (NSArray)childItems;
- (NSArray)displayLines;
- (NSArray)resultRefinements;
- (NSArray)subtitleHighlightRanges;
- (NSArray)titleHighlightRanges;
- (NSString)localizedSectionHeader;
- (NSString)queryAcceleratorCompletionString;
- (NSString)sourceID;
- (NSString)subtitle;
- (NSString)title;
- (float)_disambiguationRadiusMeters;
- (id)_geoCompletionItem;
- (id)calloutTitle;
- (id)copyStorage;
- (id)description;
- (id)highlightsForLine:(unint64_t)a3;
- (id)iconWithScale:(double)a3;
- (id)queryLine;
- (int)_placeType;
- (int64_t)_type;
- (int64_t)autocompleteCellType;
- (int64_t)entryTapBehavior;
- (int64_t)sortPriority;
- (unint64_t)hash;
- (unint64_t)serverItemIndexInSection;
- (unint64_t)serverSectionIndex;
- (void)sendFeedback;
- (void)setDirectionIntentDestination:(id)a3;
- (void)setDirectionIntentOrigin:(id)a3;
- (void)setLocalizedSectionHeader:(id)a3;
- (void)setSourceID:(id)a3;
@end

@implementation MKLocalSearchCompletion

- (MKLocalSearchCompletion)initWithGeoCompletionItem:(id)a3 serverSectionIndex:(unint64_t)a4 serverItemIndexInSection:(unint64_t)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MKLocalSearchCompletion;
  v10 = [(MKLocalSearchCompletion *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_item, a3);
    v11->_serverSectionIndex = a4;
    v11->_serverItemIndexInSection = a5;
    v12 = [(GEOCompletionItem *)v11->_item geoMapItem];
    if (v12)
    {
      uint64_t v13 = +[MKMapItem _itemWithGeoMapItem:v12];
      mapItem = v11->_mapItem;
      v11->_mapItem = (MKMapItem *)v13;
    }
    v15 = v11;
  }
  return v11;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MKLocalSearchCompletion;
  return [(MKLocalSearchCompletion *)&v6 isKindOfClass:a3];
}

- (NSString)title
{
  v2 = [(GEOCompletionItem *)self->_item displayLines];
  if ([v2 count])
  {
    v3 = [v2 objectAtIndexedSubscript:0];
  }
  else
  {
    v3 = &stru_1ED919588;
  }

  return (NSString *)v3;
}

- (NSArray)titleHighlightRanges
{
  v3 = [(GEOCompletionItem *)self->_item displayLines];
  if ([v3 count])
  {
    v4 = [(GEOCompletionItem *)self->_item highlightsForLine:0];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (NSString)subtitle
{
  v2 = [(GEOCompletionItem *)self->_item displayLines];
  if ((unint64_t)[v2 count] < 2)
  {
    v3 = &stru_1ED919588;
  }
  else
  {
    v3 = [v2 objectAtIndexedSubscript:1];
  }

  return (NSString *)v3;
}

- (NSArray)subtitleHighlightRanges
{
  v3 = [(GEOCompletionItem *)self->_item displayLines];
  if ((unint64_t)[v3 count] < 2)
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v4 = [(GEOCompletionItem *)self->_item highlightsForLine:1];
  }

  return (NSArray *)v4;
}

- (BOOL)getCoordinate:(CLLocationCoordinate2D *)a3
{
  if (!a3) {
    return 0;
  }
  long long v5 = xmmword_18BD1B7B0;
  if (![(GEOCompletionItem *)self->_item getCoordinate:&v5]
    || fabs(*((double *)&v5 + 1) + 180.0) < 0.00000001 && fabs(*(double *)&v5 + 180.0) < 0.00000001)
  {
    return 0;
  }
  *a3 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)&v5, *((CLLocationDegrees *)&v5 + 1));
  return 1;
}

- (id)queryLine
{
  return (id)[(GEOCompletionItem *)self->_item queryLine];
}

- (id)calloutTitle
{
  return (id)[(GEOCompletionItem *)self->_item calloutTitle];
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEOSearchCategory)category
{
  return (GEOSearchCategory *)[(GEOCompletionItem *)self->_item searchCategory];
}

- (GEOResolvedItem)clientResolved
{
  return (GEOResolvedItem *)[(GEOCompletionItem *)self->_item clientResolved];
}

- (GEODirectionIntent)directionIntent
{
  return (GEODirectionIntent *)[(GEOCompletionItem *)self->_item directionIntent];
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return (GEORetainedSearchMetadata *)[(GEOCompletionItem *)self->_item retainedSearchMetadata];
}

- (BOOL)hasSortPriority
{
  return [(GEOCompletionItem *)self->_item hasSortPriority];
}

- (int64_t)sortPriority
{
  return [(GEOCompletionItem *)self->_item sortPriority];
}

- (int64_t)entryTapBehavior
{
  return [(GEOCompletionItem *)self->_item entryTapBehavior] != 0;
}

- (int64_t)autocompleteCellType
{
  int64_t result = [(GEOCompletionItem *)self->_item autocompleteCellType];
  if ((unint64_t)(result - 1) >= 4) {
    return 0;
  }
  return result;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  return (GEOServerResultScoreMetadata *)[(GEOCompletionItem *)self->_item serverResultScoreMetadata];
}

- (BOOL)hasQueryAcceleratorAffordanceEnabled
{
  return [(GEOCompletionItem *)self->_item hasQueryAcceleratorAffordanceEnabled];
}

- (NSString)queryAcceleratorCompletionString
{
  return (NSString *)[(GEOCompletionItem *)self->_item queryAcceleratorCompletionString];
}

- (id)_geoCompletionItem
{
  return self->_item;
}

- (GEOCollectionResult)collectionResult
{
  return (GEOCollectionResult *)[(GEOCompletionItem *)self->_item collectionResult];
}

- (GEOPublisherResult)publisherResult
{
  return (GEOPublisherResult *)[(GEOCompletionItem *)self->_item publisherResult];
}

- (NSArray)childItems
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MKLocalSearchCompletion *)self publisherResult];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F646A0]);
    long long v5 = [(MKLocalSearchCompletion *)self publisherResult];
    objc_super v6 = (void *)[v4 initWithPublisherResult:v5];
    v11[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    v8 = [(MKLocalSearchCompletion *)self mapItem];
    id v9 = [v8 _geoMapItem];
    v7 = [v9 _childItems];
  }

  return (NSArray *)v7;
}

- (NSArray)resultRefinements
{
  return (NSArray *)[(GEOCompletionItem *)self->_item resultRefinements];
}

- (GEOStyleAttributes)iconStyleAttributes
{
  return (GEOStyleAttributes *)[(GEOCompletionItem *)self->_item iconStyleAttributes];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  objc_super v6 = [(MKLocalSearchCompletion *)self title];
  v7 = [v3 stringWithFormat:@"<%@ %p> %@", v5, self, v6];

  v8 = [(MKLocalSearchCompletion *)self subtitle];
  if ([v8 length]) {
    [v7 appendFormat:@" (%@)", v8];
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(GEOCompletionItem *)self->_item isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(GEOCompletionItem *)self->_item hash];
}

- (id)copyStorage
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendFeedback
{
  if (!self->_alreadySentFeedback)
  {
    self->_alreadySentFeedback = 1;
    [(GEOCompletionItem *)self->_item sendFeedback];
  }
}

- (int64_t)_type
{
  int64_t result = [(GEOCompletionItem *)self->_item type];
  if ((unint64_t)(result - 1) >= 5) {
    return 0;
  }
  return result;
}

- (int)_placeType
{
  if ([(GEOCompletionItem *)self->_item placeType])
  {
    item = self->_item;
    return [(GEOCompletionItem *)item placeType];
  }
  else
  {
    char v5 = [(MKMapItem *)self->_mapItem _geoMapItem];

    if (v5)
    {
      objc_super v6 = [(MKMapItem *)self->_mapItem _geoMapItem];
      int v7 = [v6 _placeType];

      return v7;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)_supportsOfflineDownload
{
  return [(GEOCompletionItem *)self->_item supportsOfflineDownload];
}

- (float)_disambiguationRadiusMeters
{
  if (![(GEOCompletionItem *)self->_item hasDisambiguationRadiusMeters]) {
    return 0.0;
  }
  item = self->_item;

  [(GEOCompletionItem *)item disambiguationRadiusMeters];
  return result;
}

- (BOOL)_hasDisambiguationRadiusMeters
{
  return [(GEOCompletionItem *)self->_item hasDisambiguationRadiusMeters];
}

- (NSArray)displayLines
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(MKLocalSearchCompletion *)self title];
  v7[0] = v3;
  id v4 = [(MKLocalSearchCompletion *)self subtitle];
  v7[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- (id)highlightsForLine:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(MKLocalSearchCompletion *)self subtitleHighlightRanges];
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(MKLocalSearchCompletion *)self titleHighlightRanges];
  }

  return v3;
}

- (id)iconWithScale:(double)a3
{
  return 0;
}

- (unint64_t)serverSectionIndex
{
  return self->_serverSectionIndex;
}

- (unint64_t)serverItemIndexInSection
{
  return self->_serverItemIndexInSection;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
}

- (NSString)localizedSectionHeader
{
  return self->_localizedSectionHeader;
}

- (void)setLocalizedSectionHeader:(id)a3
{
}

- (BOOL)_alreadySentFeedback
{
  return self->_alreadySentFeedback;
}

- (MKLocalSearchCompletion)directionIntentOrigin
{
  return self->_directionIntentOrigin;
}

- (void)setDirectionIntentOrigin:(id)a3
{
}

- (MKLocalSearchCompletion)directionIntentDestination
{
  return self->_directionIntentDestination;
}

- (void)setDirectionIntentDestination:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionIntentDestination, 0);
  objc_storeStrong((id *)&self->_directionIntentOrigin, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_localizedSectionHeader, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (GEOCompletionItem)geoCompletionItem
{
  return self->_item;
}

@end