@interface EKAutocompleteSearch
+ (id)searchWithEventStore:(id)a3 searchString:(id)a4 maximumResultCount:(unint64_t)a5 ignoreScheduledEvents:(BOOL)a6 initialEvent:(id)a7 pasteboardItemProvider:(id)a8 completionHandler:(id)a9;
- (unint64_t)maximumResultCount;
- (void)setMaximumResultCount:(unint64_t)a3;
@end

@implementation EKAutocompleteSearch

+ (id)searchWithEventStore:(id)a3 searchString:(id)a4 maximumResultCount:(unint64_t)a5 ignoreScheduledEvents:(BOOL)a6 initialEvent:(id)a7 pasteboardItemProvider:(id)a8 completionHandler:(id)a9
{
  BOOL v11 = a6;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  id v19 = a3;
  v20 = [[EKAutocompletePendingSearch alloc] initWithEventStore:v19 searchString:v18 maximumResultCount:a5 ignoreScheduledEvents:v11 initialEvent:v17 pasteboardItemProvider:v16 completionHandler:v15];

  return v20;
}

- (unint64_t)maximumResultCount
{
  return self->_maximumResultCount;
}

- (void)setMaximumResultCount:(unint64_t)a3
{
  self->_maximumResultCount = a3;
}

@end