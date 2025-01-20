@interface IRStatisticsMO
+ (id)fetchRequest;
+ (void)setPropertiesOfStatisticsMO:(id)a3 withStatisticsDO:(id)a4;
- (id)convert;
@end

@implementation IRStatisticsMO

+ (void)setPropertiesOfStatisticsMO:(id)a3 withStatisticsDO:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend(v6, "setNumberOfContextChanges:", objc_msgSend(v5, "numberOfContextChanges"));
  objc_msgSend(v6, "setNumberOfMiLoPredictions:", objc_msgSend(v5, "numberOfMiLoPredictions"));
  objc_msgSend(v6, "setNumberOfMiLoPredictionsInUpdatesMode:", objc_msgSend(v5, "numberOfMiLoPredictionsInUpdatesMode"));
  objc_msgSend(v6, "setLastMiLoLSLItems:", objc_msgSend(v5, "lastMiLoLSLItems"));
  objc_msgSend(v6, "setLastMiLoQualityReasonBitmap:", objc_msgSend(v5, "lastMiLoQualityReasonBitmap"));
  objc_msgSend(v6, "setLastMiLoQuality:", objc_msgSend(v5, "lastMiLoQuality"));
  objc_msgSend(v6, "setLastMiLoModels:", objc_msgSend(v5, "lastMiLoModels"));
  objc_msgSend(v6, "setTimeInUpdatesModeInSeconds:", objc_msgSend(v5, "timeInUpdatesModeInSeconds"));
  objc_msgSend(v6, "setNumberOfPickerChoiceEvents:", objc_msgSend(v5, "numberOfPickerChoiceEvents"));
  objc_msgSend(v6, "setNumberOfCorrectPickerChoiceEvents:", objc_msgSend(v5, "numberOfCorrectPickerChoiceEvents"));
  id v7 = [v5 lastClearDate];

  [v6 setLastClearDate:v7];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRStatisticsMO"];
}

- (id)convert
{
  uint64_t v15 = [(IRStatisticsMO *)self numberOfContextChanges];
  uint64_t v3 = [(IRStatisticsMO *)self numberOfMiLoPredictions];
  uint64_t v4 = [(IRStatisticsMO *)self numberOfMiLoPredictionsInUpdatesMode];
  uint64_t v5 = [(IRStatisticsMO *)self lastMiLoLSLItems];
  uint64_t v6 = [(IRStatisticsMO *)self lastMiLoQualityReasonBitmap];
  uint64_t v7 = [(IRStatisticsMO *)self lastMiLoQuality];
  uint64_t v8 = [(IRStatisticsMO *)self lastMiLoModels];
  uint64_t v9 = [(IRStatisticsMO *)self timeInUpdatesModeInSeconds];
  uint64_t v10 = [(IRStatisticsMO *)self numberOfPickerChoiceEvents];
  uint64_t v11 = [(IRStatisticsMO *)self numberOfCorrectPickerChoiceEvents];
  v12 = [(IRStatisticsMO *)self lastClearDate];
  v13 = +[IRStatisticsDO statisticsDOWithNumberOfContextChanges:v15 numberOfMiLoPredictions:v3 numberOfMiLoPredictionsInUpdatesMode:v4 lastMiLoLSLItems:v5 lastMiLoQualityReasonBitmap:v6 lastMiLoQuality:v7 lastMiLoModels:v8 timeInUpdatesModeInSeconds:v9 numberOfPickerChoiceEvents:v10 numberOfCorrectPickerChoiceEvents:v11 lastClearDate:v12];

  return v13;
}

@end