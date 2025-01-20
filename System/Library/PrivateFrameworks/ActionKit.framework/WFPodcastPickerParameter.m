@interface WFPodcastPickerParameter
- (BOOL)preferParameterValuePicker;
- (Class)singleStateClass;
- (WFPodcastPickerParameter)initWithDefinition:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)localizedLabelForPossibleState:(id)a3;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
@end

@implementation WFPodcastPickerParameter

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  v4 = objc_msgSend(a4, "value", a3);
  v5 = [v4 name];

  return v5;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v5 = a5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__WFPodcastPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v7[3] = &unk_264E5CE88;
  id v8 = v5;
  id v6 = v5;
  +[WFPodcastUtilities getPodcastsFromLibraryFetchingDetailsFromServer:0 withCompletion:v7];
}

void __90__WFPodcastPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __90__WFPodcastPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
  v5[3] = &unk_264E5EE18;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __90__WFPodcastPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "if_compactMap:", &__block_literal_global_9557);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_alloc(MEMORY[0x263F0FCB8]);
  if (v5) {
    id v3 = v5;
  }
  else {
    id v3 = (id)MEMORY[0x263EFFA68];
  }
  id v4 = (void *)[v2 initWithItems:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __90__WFPodcastPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F86DB0];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = [a3 value];
  id v4 = [v3 name];

  return v4;
}

- (WFPodcastPickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFPodcastPickerParameter;
  id v3 = [(WFPodcastPickerParameter *)&v7 initWithDefinition:a3];
  id v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    id v5 = v4;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end