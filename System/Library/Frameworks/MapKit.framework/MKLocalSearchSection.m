@interface MKLocalSearchSection
- (BOOL)enableMapsSuggestServerReranking;
- (BOOL)enforceServerResultsOrder;
- (BOOL)isSectionForClientOnlyResults;
- (BOOL)shouldInterleaveClientResults;
- (MKLocalSearchSection)initWithResults:(id)a3 title:(id)a4 shouldInterleaveClientResults:(BOOL)a5 enforceServerResultsOrder:(BOOL)a6 enableMapsSuggestServerReranking:(BOOL)a7 isSectionForClientOnlyResults:(BOOL)a8 includedClientResultTypes:(id)a9 excludedClientResultTypes:(id)a10;
- (NSArray)excludedClientResultTypes;
- (NSArray)includedClientResultTypes;
- (NSArray)results;
- (NSString)title;
@end

@implementation MKLocalSearchSection

- (MKLocalSearchSection)initWithResults:(id)a3 title:(id)a4 shouldInterleaveClientResults:(BOOL)a5 enforceServerResultsOrder:(BOOL)a6 enableMapsSuggestServerReranking:(BOOL)a7 isSectionForClientOnlyResults:(BOOL)a8 includedClientResultTypes:(id)a9 excludedClientResultTypes:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  id v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)MKLocalSearchSection;
  v19 = [(MKLocalSearchSection *)&v26 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    results = v19->_results;
    v19->_results = (NSArray *)v20;

    uint64_t v22 = [v16 copy];
    title = v19->_title;
    v19->_title = (NSString *)v22;

    v19->_shouldInterleaveClientResults = a5;
    v19->_enforceServerResultsOrder = a6;
    v19->_enableMapsSuggestServerReranking = a7;
    v19->_isSectionForClientOnlyResults = a8;
    objc_storeStrong((id *)&v19->_includedClientResultTypes, a9);
    objc_storeStrong((id *)&v19->_excludedClientResultTypes, a10);
  }

  return v19;
}

- (NSArray)results
{
  return self->_results;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)shouldInterleaveClientResults
{
  return self->_shouldInterleaveClientResults;
}

- (BOOL)enforceServerResultsOrder
{
  return self->_enforceServerResultsOrder;
}

- (BOOL)enableMapsSuggestServerReranking
{
  return self->_enableMapsSuggestServerReranking;
}

- (BOOL)isSectionForClientOnlyResults
{
  return self->_isSectionForClientOnlyResults;
}

- (NSArray)includedClientResultTypes
{
  return self->_includedClientResultTypes;
}

- (NSArray)excludedClientResultTypes
{
  return self->_excludedClientResultTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedClientResultTypes, 0);
  objc_storeStrong((id *)&self->_includedClientResultTypes, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

@end