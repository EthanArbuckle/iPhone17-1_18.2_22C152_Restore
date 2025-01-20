@interface TIProactiveQuickTypeManagerMock
- (BOOL)isAutoCompleteEnabled;
- (BOOL)isAutoPopupEnabled;
- (BOOL)isEnabled;
- (BOOL)usePQT2Flow;
- (NSDictionary)metrics;
- (TIProactiveQuickTypeManagerMock)init;
- (id)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6;
- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14;
- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14;
- (id)getMeCardEmailAddresses;
- (id)searchForMeCardEmailAddresses;
- (id)searchForMeCardRegions;
- (void)generateAndRenderProactiveSuggestionsForInput:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withIsResponseDenyListed:(BOOL)a13 withShouldDisableAutoCaps:(BOOL)a14 withAvailableApps:(id)a15 logBlock:(id)a16 async:(BOOL)a17 completion:(id)a18;
- (void)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6 async:(BOOL)a7 completion:(id)a8;
- (void)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14 async:(BOOL)a15 completion:(id)a16;
- (void)propogateMetrics:(id)a3 data:(id)a4;
- (void)setMetrics:(id)a3;
@end

@implementation TIProactiveQuickTypeManagerMock

- (TIProactiveQuickTypeManagerMock)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIProactiveQuickTypeManagerMock;
  v2 = [(TIProactiveQuickTypeManagerMock *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    metrics = v2->_metrics;
    v2->_metrics = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v33 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a13;
  id v28 = a14;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_2C564;
  v41 = sub_2C574;
  id v42 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_2C57C;
  v36[3] = &unk_8D1F8;
  v36[4] = &v37;
  LOBYTE(v32) = 0;
  LOBYTE(v31) = a12;
  v34 = v20;
  [(TIProactiveQuickTypeManagerMock *)self generateAndRenderProactiveSuggestionsWithTriggers:v19 withKeyboardState:v20 withAdditionalPredictions:v21 withSecureCandidateRenderer:v22 withRenderTraits:v23 withInput:v33 withRecipient:v24 withApplication:v25 withLocale:v26 isContinuousPath:v31 withAvailableApps:v27 logBlock:v28 async:v32 completion:v36];
  id v29 = (id)v38[5];
  _Block_object_dispose(&v37, 8);

  return v29;
}

- (void)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14 async:(BOOL)a15 completion:(id)a16
{
  id v21 = (void (**)(id, id))a16;
  v17 = (char *)[a3 count];
  if (v17)
  {
    v18 = v17;
    id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v17];
    do
    {
      id v20 = +[TIKeyboardCandidateSingle secureCandidateForInput:&stru_8DEF0 slotID:100];
      [v19 addObject:v20];

      --v18;
    }
    while (v18);
  }
  else
  {
    id v19 = 0;
  }
  v21[2](v21, v19);
}

- (id)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6
{
  return 0;
}

- (void)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6 async:(BOOL)a7 completion:(id)a8
{
}

- (void)generateAndRenderProactiveSuggestionsForInput:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withIsResponseDenyListed:(BOOL)a13 withShouldDisableAutoCaps:(BOOL)a14 withAvailableApps:(id)a15 logBlock:(id)a16 async:(BOOL)a17 completion:(id)a18
{
  id v19 = (void (**)(id, void *))a18;
  id v20 = a8;
  id v21 = +[NSDictionary dictionaryWithObjects:&off_944A0 forKeys:&off_944B8];
  id v22 = +[NSCharacterSet newlineCharacterSet];
  id v23 = [v20 componentsSeparatedByCharactersInSet:v22];

  id v27 = [v23 lastObject];

  id v24 = [v21 objectForKey:v27];
  if (v24)
  {
    id v25 = +[TIKeyboardCandidateSingle secureCandidateForInput:v24 slotID:100];
    id v26 = +[NSMutableArray array];
    [v26 addObject:v25];
  }
  else
  {
    id v26 = 0;
  }
  v19[2](v19, v26);
}

- (BOOL)isEnabled
{
  return 1;
}

- (BOOL)isAutoPopupEnabled
{
  return 1;
}

- (BOOL)isAutoCompleteEnabled
{
  return 1;
}

- (BOOL)usePQT2Flow
{
  return 1;
}

- (id)getMeCardEmailAddresses
{
  return &__NSArray0__struct;
}

- (void)propogateMetrics:(id)a3 data:(id)a4
{
}

- (id)searchForMeCardEmailAddresses
{
  return &__NSArray0__struct;
}

- (id)searchForMeCardRegions
{
  return &__NSArray0__struct;
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14
{
  return &__NSArray0__struct;
}

- (NSDictionary)metrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end