@interface CNAutocompleteCalendarServerOperationFactory
- (id)eventKitDirectorySearchOperationForSource:(id)a3 query:(id)a4 resultsBlock:(id)a5;
@end

@implementation CNAutocompleteCalendarServerOperationFactory

- (id)eventKitDirectorySearchOperationForSource:(id)a3 query:(id)a4 resultsBlock:(id)a5
{
  v7 = (Class (__cdecl *)())getEKDirectorySearchOperationClass;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc(v7()) initWithSource:v10 query:v9 resultsBlock:v8];

  return v11;
}

@end