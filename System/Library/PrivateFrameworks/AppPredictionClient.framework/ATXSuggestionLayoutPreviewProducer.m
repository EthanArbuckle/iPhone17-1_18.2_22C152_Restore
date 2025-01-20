@interface ATXSuggestionLayoutPreviewProducer
+ (id)_clientModelSpecForPreview;
+ (id)_executableSpecForAppPredictionWithBundleId:(id)a3;
+ (id)_proactiveSuggestionWithBundleId:(id)a3 layoutType:(int64_t)a4 title:(id)a5;
+ (id)_scoreSpecForPreview;
+ (id)_uiSpecForPreviewWithLayoutType:(int64_t)a3 title:(id)a4 subtitle:(id)a5;
+ (id)previewLayoutFor2x2SuggestionWidget;
+ (id)previewLayoutFor2x4SuggestionWidget;
+ (id)previewLayoutFor4x4SuggestionWidget;
+ (id)previewLayoutForAppPredictionPanel;
@end

@implementation ATXSuggestionLayoutPreviewProducer

+ (id)previewLayoutFor2x2SuggestionWidget
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:@"com.apple.mobilesafari" layoutType:3 title:@"Browse the Internet with Safari"];
  id v3 = objc_alloc(MEMORY[0x1E4F939C8]);
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = (void *)[v3 initWithLayoutType:5 oneByOneSuggestions:0 oneByTwoSuggestions:0 twoByTwoSuggestions:v4 oneByFourSuggestions:0 twoByFourSuggestions:0 fourByFourSuggestions:0 fourByEightSuggestions:0];

  [v5 setIsValidForSuggestionsWidget:1];

  return v5;
}

+ (id)previewLayoutFor2x4SuggestionWidget
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:@"com.apple.mobilesafari" layoutType:5 title:@"Browse the Internet with Safari"];
  id v3 = +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:@"com.apple.AppStore" layoutType:5 title:@"Read about today's App picks"];
  id v4 = objc_alloc(MEMORY[0x1E4F939C8]);
  v8[0] = v2;
  v8[1] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = (void *)[v4 initWithLayoutType:9 oneByOneSuggestions:0 oneByTwoSuggestions:0 twoByTwoSuggestions:0 oneByFourSuggestions:v5 twoByFourSuggestions:0 fourByFourSuggestions:0 fourByEightSuggestions:0];

  [v6 setIsValidForSuggestionsWidget:1];

  return v6;
}

+ (id)previewLayoutFor4x4SuggestionWidget
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v2 = +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:@"com.apple.mobilesafari" layoutType:5 title:@"Browse the Internet with Safari"];
  id v3 = +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:@"com.apple.AppStore" layoutType:5 title:@"Read about today's App picks"];
  id v4 = +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:@"com.apple.mobileslideshow" layoutType:5 title:@"View Photos"];
  v5 = +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:@"com.apple.camera" layoutType:5 title:@"Take a photo"];
  id v6 = objc_alloc(MEMORY[0x1E4F939C8]);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  v8 = (void *)[v6 initWithLayoutType:11 oneByOneSuggestions:0 oneByTwoSuggestions:0 twoByTwoSuggestions:0 oneByFourSuggestions:v7 twoByFourSuggestions:0 fourByFourSuggestions:0 fourByEightSuggestions:0];

  [v8 setIsValidForSuggestionsWidget:1];

  return v8;
}

+ (id)previewLayoutForAppPredictionPanel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(&unk_1EFDF4EA8, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [&unk_1EFDF4EA8 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&unk_1EFDF4EA8);
        }
        v7 = +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:*(void *)(*((void *)&v10 + 1) + 8 * i) layoutType:1 title:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        [v2 addObject:v7];
      }
      uint64_t v4 = [&unk_1EFDF4EA8 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F939C8]) initWithLayoutType:0 oneByOneSuggestions:v2 oneByTwoSuggestions:0 twoByTwoSuggestions:0 oneByFourSuggestions:0 twoByFourSuggestions:0 fourByFourSuggestions:0 fourByEightSuggestions:0];
  [v8 setIsValidForSuggestionsWidget:1];

  return v8;
}

+ (id)_clientModelSpecForPreview
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:@"Hardcoded Preview" clientModelVersion:@"1.0"];

  return v2;
}

+ (id)_executableSpecForAppPredictionWithBundleId:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F93950];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithExecutableObject:v4 executableDescription:v4 executableIdentifier:v4 suggestionExecutableType:1];

  return v5;
}

+ (id)_uiSpecForPreviewWithLayoutType:(int64_t)a3 title:(id)a4 subtitle:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v7 = (objc_class *)MEMORY[0x1E4F93960];
  id v8 = a5;
  id v9 = a4;
  long long v10 = (void *)[[v7 alloc] initWithApplicableSuggestionLayout:a3];
  v15[0] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  LOWORD(v14) = 0;
  long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93978]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v9, v8, @"Preview Suggestion", v11, 0, 1, v14);

  return v12;
}

+ (id)_scoreSpecForPreview
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:1 suggestedConfidenceCategory:1.0];

  return v2;
}

+ (id)_proactiveSuggestionWithBundleId:(id)a3 layoutType:(int64_t)a4 title:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[ATXSuggestionLayoutPreviewProducer _clientModelSpecForPreview];
  long long v10 = +[ATXSuggestionLayoutPreviewProducer _executableSpecForAppPredictionWithBundleId:v8];

  long long v11 = +[ATXSuggestionLayoutPreviewProducer _uiSpecForPreviewWithLayoutType:a4 title:v7 subtitle:0];

  long long v12 = +[ATXSuggestionLayoutPreviewProducer _scoreSpecForPreview];
  long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v9 executableSpecification:v10 uiSpecification:v11 scoreSpecification:v12];

  return v13;
}

@end