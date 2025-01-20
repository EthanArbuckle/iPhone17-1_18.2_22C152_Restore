@interface CKMediaObjectAssetCollection
- (BOOL)isAggregation;
- (BOOL)isEnriched;
- (BOOL)isEnrichmentComplete;
- (BOOL)isRecent;
- (NSArray)localizedLocationNames;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)localizedDateDescription;
- (NSString)localizedDebugDescription;
- (NSString)localizedShortDateDescription;
- (NSString)localizedSmartDescription;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)uuid;
- (double)promotionScore;
- (id)localizedDateDescriptionWithOptions:(unint64_t)a3;
- (int64_t)px_highlightKind;
- (unint64_t)estimatedAssetCount;
- (unsigned)px_highlightEnrichmentState;
@end

@implementation CKMediaObjectAssetCollection

- (BOOL)isEnriched
{
  return 0;
}

- (BOOL)isEnrichmentComplete
{
  return 0;
}

- (unsigned)px_highlightEnrichmentState
{
  return 0;
}

- (int64_t)px_highlightKind
{
  return -1;
}

- (double)promotionScore
{
  return 0.0;
}

- (NSString)localizedTitle
{
  return 0;
}

- (NSString)localizedSubtitle
{
  return 0;
}

- (NSString)localizedDebugDescription
{
  return 0;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (NSString)localizedDateDescription
{
  return 0;
}

- (NSString)localizedShortDateDescription
{
  return 0;
}

- (id)localizedDateDescriptionWithOptions:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"CKMediaObjectAssetDataSource.m" lineNumber:64 description:@"not implemented yet"];

  abort();
}

- (NSString)localizedSmartDescription
{
  return 0;
}

- (NSDate)startDate
{
  return 0;
}

- (NSDate)endDate
{
  return 0;
}

- (BOOL)isAggregation
{
  return 0;
}

- (BOOL)isRecent
{
  return 0;
}

- (unint64_t)estimatedAssetCount
{
  return 0;
}

- (NSString)uuid
{
  return 0;
}

@end