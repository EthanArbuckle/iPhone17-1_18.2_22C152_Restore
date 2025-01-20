@interface HKClinicalDocumentIndexingRequestHandler
- (void)fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4;
- (void)indexClinicalDocumentsWithRequest:(id)a3 completion:(id)a4;
@end

@implementation HKClinicalDocumentIndexingRequestHandler

- (void)indexClinicalDocumentsWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(HKHealthRecordAttachmentsIndexerHandler);
  [(HKHealthRecordAttachmentsIndexerHandler *)v7 indexWithRequest:v6 completion:v5];
}

- (void)fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(HKHealthRecordAttachmentsIndexerHandler);
  [(HKHealthRecordAttachmentsIndexerHandler *)v7 fetchSpotlightSearchResultsForQueryString:v6 completion:v5];
}

@end