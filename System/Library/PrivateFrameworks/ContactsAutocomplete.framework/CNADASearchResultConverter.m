@interface CNADASearchResultConverter
+ (BOOL)shouldIncludeEmailAddressesForRequest:(id)a3;
+ (BOOL)shouldIncludePhoneNumbersForRequest:(id)a3;
+ (id)autocompleteResultsForDASearchResultElement:(id)a3 request:(id)a4 factory:(id)a5;
+ (id)displayNameForElement:(id)a3;
+ (id)nameComponentsForElement:(id)a3;
+ (id)resultTransformForRequest:(id)a3 factory:(id)a4;
- (CNADASearchResultConverter)initWithFactory:(id)a3;
- (CNAutocompleteNameComponents)nameComponents;
- (NSString)displayName;
- (id)build;
- (void)addEmailAddress:(id)a3;
- (void)addPhoneNumber:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setNameComponents:(id)a3;
@end

@implementation CNADASearchResultConverter

+ (id)autocompleteResultsForDASearchResultElement:(id)a3 request:(id)a4 factory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithFactory:v10];

  v12 = [a1 displayNameForElement:v8];
  [v11 setDisplayName:v12];

  v13 = [a1 nameComponentsForElement:v8];
  [v11 setNameComponents:v13];

  if ([a1 shouldIncludeEmailAddressesForRequest:v9])
  {
    v14 = [v8 emailAddress];
    [v11 addEmailAddress:v14];
  }
  if ([a1 shouldIncludePhoneNumbersForRequest:v9])
  {
    v15 = [v8 homePhone];
    [v11 addPhoneNumber:v15];

    v16 = [v8 workPhone];
    [v11 addPhoneNumber:v16];

    v17 = [v8 mobilePhone];
    [v11 addPhoneNumber:v17];

    v18 = [v8 iPhone];
    [v11 addPhoneNumber:v18];

    v19 = [v8 mainPhone];
    [v11 addPhoneNumber:v19];
  }
  v20 = [v11 build];

  return v20;
}

+ (id)resultTransformForRequest:(id)a3 factory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__CNADASearchResultConverter_resultTransformForRequest_factory___block_invoke;
  aBlock[3] = &unk_1E63DE068;
  id v14 = v7;
  id v15 = a1;
  id v13 = v6;
  id v8 = v7;
  id v9 = v6;
  id v10 = _Block_copy(aBlock);

  return v10;
}

uint64_t __64__CNADASearchResultConverter_resultTransformForRequest_factory___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) autocompleteResultsForDASearchResultElement:a2 request:*(void *)(a1 + 32) factory:*(void *)(a1 + 40)];
}

+ (id)displayNameForElement:(id)a3
{
  return (id)[a3 displayName];
}

+ (id)nameComponentsForElement:(id)a3
{
  return 0;
}

+ (BOOL)shouldIncludeEmailAddressesForRequest:(id)a3
{
  return 1;
}

+ (BOOL)shouldIncludePhoneNumbersForRequest:(id)a3
{
  return [a3 searchType] != 0;
}

- (CNADASearchResultConverter)initWithFactory:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNADASearchResultConverter;
  id v6 = [(CNADASearchResultConverter *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_factory, a3);
    uint64_t v8 = objc_opt_new();
    results = v7->_results;
    v7->_results = (NSMutableArray *)v8;

    id v10 = v7;
  }

  return v7;
}

- (id)build
{
  return self->_results;
}

- (void)addEmailAddress:(id)a3
{
  id v6 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    v4 = objc_alloc_init(CNAutocompleteResultValue);
    [(CNAutocompleteResultValue *)v4 setAddress:v6];
    [(CNAutocompleteResultValue *)v4 setAddressType:1];
    id v5 = [(CNAutocompleteResultFactory *)self->_factory directoryServerResultWithDisplayName:self->_displayName value:v4 nameComponents:self->_nameComponents];
    [(NSMutableArray *)self->_results addObject:v5];
  }
}

- (void)addPhoneNumber:(id)a3
{
  id v6 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    v4 = objc_alloc_init(CNAutocompleteResultValue);
    [(CNAutocompleteResultValue *)v4 setAddress:v6];
    [(CNAutocompleteResultValue *)v4 setAddressType:2];
    id v5 = [(CNAutocompleteResultFactory *)self->_factory directoryServerResultWithDisplayName:self->_displayName value:v4 nameComponents:self->_nameComponents];
    [(NSMutableArray *)self->_results addObject:v5];
  }
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (CNAutocompleteNameComponents)nameComponents
{
  return (CNAutocompleteNameComponents *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNameComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_factory, 0);
}

@end