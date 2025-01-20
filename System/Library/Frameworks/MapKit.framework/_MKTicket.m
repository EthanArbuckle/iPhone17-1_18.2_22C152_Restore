@interface _MKTicket
- (BOOL)disableAdditionalViewportPadding;
- (BOOL)enableStructuredRAPAffordance;
- (BOOL)isChainResultSet;
- (BOOL)shouldAllowManualRedoButton;
- (BOOL)shouldEnableRedoSearch;
- (BOOL)showDymSuggestionCloseButton;
- (GEOCategorySearchResultSection)categorySearchResultSection;
- (GEODirectionIntent)directionIntent;
- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata;
- (GEOMapRegion)boundingRegion;
- (GEOMapServiceTraits)traits;
- (GEOPDPlaceSummaryLayoutMetadata)placeSummaryLayoutMetadata;
- (GEORelatedSearchSuggestion)defaultRelatedSuggestion;
- (GEOResolvedItem)clientResolvedResult;
- (GEOResultRefinementGroup)resultRefinementGroup;
- (GEOSearchAutoRedoThreshold)searchAutoRedoThreshold;
- (GEOSearchRedoButtonThreshold)searchRedoButtonThreshold;
- (GEOSearchSectionList)searchSectionList;
- (GEOSearchSessionData)searchSessionData;
- (MKMapItemIdentifier)mapItemIdentifierForSpotlight;
- (NSArray)browseCategories;
- (NSArray)collectionResults;
- (NSArray)displayHeaderSubstitutes;
- (NSArray)dotPlaces;
- (NSArray)exactMapItems;
- (NSArray)publisherResults;
- (NSArray)refinedMapItems;
- (NSArray)relatedEntitySections;
- (NSArray)relatedSearchSuggestions;
- (NSArray)retainedSearchMetadata;
- (NSArray)searchResultSections;
- (NSError)error;
- (NSString)description;
- (NSString)resultDisplayHeader;
- (NSString)sectionHeader;
- (_MKTicket)initWithTicket:(id)a3;
- (int)mapDisplayType;
- (int)searchResultType;
- (int)searchResultViewType;
- (unsigned)dymSuggestionVisibleTime;
- (void)applyToCorrectedSearch:(id)a3;
- (void)applyToPlaceInfo:(id)a3;
- (void)cancel;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
- (void)submitWithHandler:(id)a3 queue:(id)a4 networkActivity:(id)a5;
- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5;
- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 queue:(id)a5 networkActivity:(id)a6;
- (void)submitWithRefinedHandler:(id)a3 networkActivity:(id)a4;
- (void)submitWithRefinedHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5;
@end

@implementation _MKTicket

- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 queue:(id)a5 networkActivity:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    ticket = self->_ticket;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke;
    v14[3] = &unk_1E54BAF48;
    v14[4] = self;
    id v15 = v11;
    id v16 = v10;
    [(GEOMapServiceTicket *)ticket submitWithHandler:v14 timeout:a4 networkActivity:a6];
  }
}

- (void)submitWithHandler:(id)a3 queue:(id)a4 networkActivity:(id)a5
{
}

- (_MKTicket)initWithTicket:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKTicket;
  v6 = [(_MKTicket *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ticket, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOMapRegion)boundingRegion
{
  return (GEOMapRegion *)[(GEOMapServiceTicket *)self->_ticket resultBoundingRegion];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_refinedMapItems, 0);
  objc_storeStrong((id *)&self->_exactMapItems, 0);

  objc_storeStrong((id *)&self->_ticket, 0);
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_MKTicket;
  v4 = [(_MKTicket *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@: %@", v4, self->_ticket];

  return (NSString *)v5;
}

- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5
{
}

- (void)submitWithRefinedHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5
{
  id v8 = a3;
  v9 = v8;
  if (v8)
  {
    ticket = self->_ticket;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke;
    v11[3] = &unk_1E54BAF20;
    v11[4] = self;
    id v12 = v8;
    [(GEOMapServiceTicket *)ticket submitWithRefinedHandler:v11 timeout:a4 networkActivity:a5];
  }
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)submitWithRefinedHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)cancel
{
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)[(GEOMapServiceTicket *)self->_ticket traits];
}

- (void)applyToCorrectedSearch:(id)a3
{
}

- (void)applyToPlaceInfo:(id)a3
{
}

- (NSArray)exactMapItems
{
  return self->_exactMapItems;
}

- (NSArray)refinedMapItems
{
  return self->_refinedMapItems;
}

- (BOOL)isChainResultSet
{
  return [(GEOMapServiceTicket *)self->_ticket isChainResultSet];
}

- (NSArray)relatedSearchSuggestions
{
  return (NSArray *)[(GEOMapServiceTicket *)self->_ticket relatedSearchSuggestions];
}

- (GEORelatedSearchSuggestion)defaultRelatedSuggestion
{
  return (GEORelatedSearchSuggestion *)[(GEOMapServiceTicket *)self->_ticket defaultRelatedSuggestion];
}

- (NSArray)browseCategories
{
  return (NSArray *)[(GEOMapServiceTicket *)self->_ticket browseCategories];
}

- (int)searchResultType
{
  return [(GEOMapServiceTicket *)self->_ticket searchResultType];
}

- (GEOResolvedItem)clientResolvedResult
{
  return (GEOResolvedItem *)[(GEOMapServiceTicket *)self->_ticket clientResolvedResult];
}

- (NSArray)retainedSearchMetadata
{
  return (NSArray *)[(GEOMapServiceTicket *)self->_ticket retainedSearchMetadata];
}

- (GEODirectionIntent)directionIntent
{
  return (GEODirectionIntent *)[(GEOMapServiceTicket *)self->_ticket directionIntent];
}

- (NSString)resultDisplayHeader
{
  return (NSString *)[(GEOMapServiceTicket *)self->_ticket resultDisplayHeader];
}

- (NSArray)displayHeaderSubstitutes
{
  return (NSArray *)[(GEOMapServiceTicket *)self->_ticket displayHeaderSubstitutes];
}

- (BOOL)shouldEnableRedoSearch
{
  return [(GEOMapServiceTicket *)self->_ticket shouldEnableRedoSearch];
}

- (BOOL)shouldAllowManualRedoButton
{
  return [(GEOMapServiceTicket *)self->_ticket shouldAllowManualRedoSearch];
}

- (NSError)error
{
  return self->_error;
}

- (unsigned)dymSuggestionVisibleTime
{
  return [(GEOMapServiceTicket *)self->_ticket dymSuggestionVisibleTime];
}

- (BOOL)showDymSuggestionCloseButton
{
  return [(GEOMapServiceTicket *)self->_ticket showDymSuggestionCloseButton];
}

- (NSString)sectionHeader
{
  return (NSString *)[(GEOMapServiceTicket *)self->_ticket resultSectionHeader];
}

- (NSArray)searchResultSections
{
  return (NSArray *)[(GEOMapServiceTicket *)self->_ticket searchResultSections];
}

- (GEOCategorySearchResultSection)categorySearchResultSection
{
  return (GEOCategorySearchResultSection *)[(GEOMapServiceTicket *)self->_ticket categorySearchResultSection];
}

- (NSArray)relatedEntitySections
{
  return (NSArray *)[(GEOMapServiceTicket *)self->_ticket relatedEntitySections];
}

- (NSArray)collectionResults
{
  return (NSArray *)[(GEOMapServiceTicket *)self->_ticket collectionResults];
}

- (NSArray)publisherResults
{
  return (NSArray *)[(GEOMapServiceTicket *)self->_ticket publisherResults];
}

- (NSArray)dotPlaces
{
  return (NSArray *)[(GEOMapServiceTicket *)self->_ticket dotPlaces];
}

- (GEOSearchAutoRedoThreshold)searchAutoRedoThreshold
{
  return (GEOSearchAutoRedoThreshold *)[(GEOMapServiceTicket *)self->_ticket searchAutoRedoThreshold];
}

- (GEOSearchRedoButtonThreshold)searchRedoButtonThreshold
{
  return (GEOSearchRedoButtonThreshold *)[(GEOMapServiceTicket *)self->_ticket searchRedoButtonThreshold];
}

- (GEOPDPlaceSummaryLayoutMetadata)placeSummaryLayoutMetadata
{
  return (GEOPDPlaceSummaryLayoutMetadata *)[(GEOMapServiceTicket *)self->_ticket placeSummaryLayoutMetadata];
}

- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata
{
  return (GEOGuideSummaryLayoutMetadata *)[(GEOMapServiceTicket *)self->_ticket guideSummaryLayoutMetadata];
}

- (GEOResultRefinementGroup)resultRefinementGroup
{
  return (GEOResultRefinementGroup *)[(GEOMapServiceTicket *)self->_ticket resultRefinementGroup];
}

- (GEOSearchSectionList)searchSectionList
{
  return (GEOSearchSectionList *)[(GEOMapServiceTicket *)self->_ticket searchSectionList];
}

- (BOOL)disableAdditionalViewportPadding
{
  return [(GEOMapServiceTicket *)self->_ticket disableAdditionalViewportPadding];
}

- (int)searchResultViewType
{
  return [(GEOMapServiceTicket *)self->_ticket searchResultViewType];
}

- (BOOL)enableStructuredRAPAffordance
{
  return [(GEOMapServiceTicket *)self->_ticket enableStructuredRAPAffordance];
}

- (MKMapItemIdentifier)mapItemIdentifierForSpotlight
{
  v2 = [(GEOMapServiceTicket *)self->_ticket geoMapItemIdentifierForSpotlight];
  if (v2) {
    v3 = [[MKMapItemIdentifier alloc] initWithGEOMapItemIdentifier:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (GEOSearchSessionData)searchSessionData
{
  return (GEOSearchSessionData *)[(GEOMapServiceTicket *)self->_ticket searchSessionData];
}

- (int)mapDisplayType
{
  return [(GEOMapServiceTicket *)self->_ticket mapDisplayType];
}

@end