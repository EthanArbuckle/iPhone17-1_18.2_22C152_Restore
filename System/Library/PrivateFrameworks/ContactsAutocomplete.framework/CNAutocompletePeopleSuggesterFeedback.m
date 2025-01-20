@interface CNAutocompletePeopleSuggesterFeedback
+ (id)bundleIdentifier;
+ (id)sharedInstance;
+ (void)didReceiveSuggestions:(id)a3;
+ (void)provideFeedback:(id)a3;
+ (void)userEnteredContact:(id)a3;
+ (void)userEnteredExistingSession;
+ (void)userEnteredNewSession;
+ (void)userNavigatedAwayFromSession;
+ (void)userRemovedContact:(id)a3;
+ (void)userSelectedFromContactPicker:(id)a3;
+ (void)userSelectedSuggestion:(id)a3;
+ (void)userTerminatedSession;
- (CNAutocompletePeopleSuggesterFeedback)init;
- (NSString)bundleIdentifier;
- (_PSSuggester)psSuggester;
@end

@implementation CNAutocompletePeopleSuggesterFeedback

- (CNAutocompletePeopleSuggesterFeedback)init
{
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompletePeopleSuggesterFeedback;
  v2 = [(CNAutocompletePeopleSuggesterFeedback *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v3 bundleIdentifier];
    bundleIdentifier = v2->_bundleIdentifier;
    v2->_bundleIdentifier = (NSString *)v4;

    v6 = (_PSSuggester *)objc_alloc_init(get_PSSuggesterClass_0());
    psSuggester = v2->_psSuggester;
    v2->_psSuggester = v6;

    v8 = v2;
  }

  return v2;
}

+ (void)didReceiveSuggestions:(id)a3
{
  uint64_t v4 = (Class (__cdecl *)())get_PSCNAutocompleteFeedbackClass;
  id v5 = a3;
  Class v6 = v4();
  v7 = [a1 bundleIdentifier];
  id v8 = [(objc_class *)v6 createVendedSuggestionsFeedbackWithBundleIdentifier:v7 suggestions:v5];

  [a1 provideFeedback:v8];
}

+ (void)userSelectedSuggestion:(id)a3
{
  uint64_t v4 = (Class (__cdecl *)())get_PSCNAutocompleteFeedbackClass;
  id v5 = a3;
  Class v6 = v4();
  v7 = [a1 bundleIdentifier];
  id v8 = [(objc_class *)v6 createTappedSuggestionFeedbackWithBundleIdentifier:v7 suggestion:v5];

  [a1 provideFeedback:v8];
}

+ (void)userEnteredNewSession
{
  Class PSCNAutocompleteFeedbackClass = get_PSCNAutocompleteFeedbackClass();
  uint64_t v4 = [a1 bundleIdentifier];
  id v5 = [(objc_class *)PSCNAutocompleteFeedbackClass createEnteredFeedbackWithBundleIdentifier:v4 status:0];

  [a1 provideFeedback:v5];
}

+ (void)userEnteredExistingSession
{
  Class PSCNAutocompleteFeedbackClass = get_PSCNAutocompleteFeedbackClass();
  uint64_t v4 = [a1 bundleIdentifier];
  id v5 = [(objc_class *)PSCNAutocompleteFeedbackClass createEnteredFeedbackWithBundleIdentifier:v4 status:1];

  [a1 provideFeedback:v5];
}

+ (void)userNavigatedAwayFromSession
{
  Class PSCNAutocompleteFeedbackClass = get_PSCNAutocompleteFeedbackClass();
  uint64_t v4 = [a1 bundleIdentifier];
  id v5 = [(objc_class *)PSCNAutocompleteFeedbackClass createExitedFeedbackWithBundleIdentifier:v4 status:1];

  [a1 provideFeedback:v5];
}

+ (void)userTerminatedSession
{
  Class PSCNAutocompleteFeedbackClass = get_PSCNAutocompleteFeedbackClass();
  uint64_t v4 = [a1 bundleIdentifier];
  id v5 = [(objc_class *)PSCNAutocompleteFeedbackClass createExitedFeedbackWithBundleIdentifier:v4 status:0];

  [a1 provideFeedback:v5];
}

+ (void)userEnteredContact:(id)a3
{
  uint64_t v4 = get_PSCNAutocompleteFeedbackClass;
  id v5 = a3;
  Class v6 = v4();
  v7 = [a1 bundleIdentifier];
  id v8 = [(objc_class *)v6 createTypedHandleFeedbackWithBundleIdentifier:v7 contact:v5 viaContactPicker:0];

  [a1 provideFeedback:v8];
}

+ (void)userSelectedFromContactPicker:(id)a3
{
  uint64_t v4 = get_PSCNAutocompleteFeedbackClass;
  id v5 = a3;
  Class v6 = v4();
  v7 = [a1 bundleIdentifier];
  id v8 = [(objc_class *)v6 createTypedHandleFeedbackWithBundleIdentifier:v7 contact:v5 viaContactPicker:1];

  [a1 provideFeedback:v8];
}

+ (void)userRemovedContact:(id)a3
{
  uint64_t v4 = get_PSCNAutocompleteFeedbackClass;
  id v5 = a3;
  Class v6 = v4();
  v7 = [a1 bundleIdentifier];
  id v8 = [(objc_class *)v6 createErasedHandleFeedbackWithBundleIdentifier:v7 contact:v5];

  [a1 provideFeedback:v8];
}

+ (id)sharedInstance
{
  if (sharedInstance_cn_once_token_1 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_1, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_cn_once_object_1;
  return v2;
}

uint64_t __55__CNAutocompletePeopleSuggesterFeedback_sharedInstance__block_invoke()
{
  sharedInstance_cn_once_object_1 = objc_alloc_init(CNAutocompletePeopleSuggesterFeedback);
  return MEMORY[0x1F41817F8]();
}

+ (id)bundleIdentifier
{
  v2 = [(id)objc_opt_class() sharedInstance];
  v3 = [v2 bundleIdentifier];

  return v3;
}

+ (void)provideFeedback:(id)a3
{
  id v3 = a3;
  id v5 = [(id)objc_opt_class() sharedInstance];
  uint64_t v4 = [v5 psSuggester];
  [v4 provideFeedbackForContactsAutocompleteSuggestions:v3];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (_PSSuggester)psSuggester
{
  return self->_psSuggester;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psSuggester, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end