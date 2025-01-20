@interface TUIFeedbackSurveyMetadata
- (BOOL)finalPreferenceValue;
- (BOOL)initialPreferenceValue;
- (NSArray)finalInputModes;
- (NSArray)initialInputModes;
- (NSDate)finalTimestamp;
- (NSDate)initialTimestamp;
- (NSString)build;
- (NSString)language;
- (NSString)model;
- (NSString)region;
- (TUIFeedbackSurveyMetadata)initWithBuild:(id)a3 model:(id)a4 language:(id)a5 region:(id)a6 initialPreferenceValue:(BOOL)a7 initialInputModes:(id)a8 initialTimestamp:(id)a9 finalPreferenceValue:(BOOL)a10 finalInputModes:(id)a11 finalTimestamp:(id)a12;
- (int64_t)duration;
- (void)setBuild:(id)a3;
- (void)setFinalInputModes:(id)a3;
- (void)setFinalPreferenceValue:(BOOL)a3;
- (void)setFinalTimestamp:(id)a3;
- (void)setInitialInputModes:(id)a3;
- (void)setInitialPreferenceValue:(BOOL)a3;
- (void)setInitialTimestamp:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setModel:(id)a3;
- (void)setRegion:(id)a3;
@end

@implementation TUIFeedbackSurveyMetadata

- (TUIFeedbackSurveyMetadata)initWithBuild:(id)a3 model:(id)a4 language:(id)a5 region:(id)a6 initialPreferenceValue:(BOOL)a7 initialInputModes:(id)a8 initialTimestamp:(id)a9 finalPreferenceValue:(BOOL)a10 finalInputModes:(id)a11 finalTimestamp:(id)a12
{
  BOOL v28 = a7;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  id v23 = a11;
  id v24 = a12;
  v29.receiver = self;
  v29.super_class = (Class)TUIFeedbackSurveyMetadata;
  v25 = [(TUIFeedbackSurveyMetadata *)&v29 init];
  v26 = v25;
  if (v25)
  {
    [(TUIFeedbackSurveyMetadata *)v25 setBuild:v17];
    [(TUIFeedbackSurveyMetadata *)v26 setModel:v18];
    [(TUIFeedbackSurveyMetadata *)v26 setLanguage:v19];
    [(TUIFeedbackSurveyMetadata *)v26 setRegion:v20];
    [(TUIFeedbackSurveyMetadata *)v26 setInitialPreferenceValue:v28];
    [(TUIFeedbackSurveyMetadata *)v26 setInitialInputModes:v21];
    [(TUIFeedbackSurveyMetadata *)v26 setInitialTimestamp:v22];
    [(TUIFeedbackSurveyMetadata *)v26 setFinalPreferenceValue:a10];
    [(TUIFeedbackSurveyMetadata *)v26 setFinalInputModes:v23];
    [(TUIFeedbackSurveyMetadata *)v26 setFinalTimestamp:v24];
  }

  return v26;
}

- (int64_t)duration
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  finalTimestamp = self->_finalTimestamp;
  v3 = [(TUIFeedbackSurveyMetadata *)self initialTimestamp];
  [(NSDate *)finalTimestamp timeIntervalSinceDate:v3];
  double v5 = v4;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [&unk_2703CF370 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      int v11 = v8 + v7;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(&unk_2703CF370);
        }
        if (v5 < (double)(int)[*(id *)(*((void *)&v13 + 1) + 8 * v10) intValue]) {
          return v8 + (int)v10;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [&unk_2703CF370 countByEnumeratingWithState:&v13 objects:v17 count:16];
      int v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    return 0;
  }
  return v11;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (BOOL)initialPreferenceValue
{
  return self->_initialPreferenceValue;
}

- (void)setInitialPreferenceValue:(BOOL)a3
{
  self->_initialPreferenceValue = a3;
}

- (NSArray)initialInputModes
{
  return self->_initialInputModes;
}

- (void)setInitialInputModes:(id)a3
{
}

- (NSDate)initialTimestamp
{
  return self->_initialTimestamp;
}

- (void)setInitialTimestamp:(id)a3
{
}

- (BOOL)finalPreferenceValue
{
  return self->_finalPreferenceValue;
}

- (void)setFinalPreferenceValue:(BOOL)a3
{
  self->_finalPreferenceValue = a3;
}

- (NSArray)finalInputModes
{
  return self->_finalInputModes;
}

- (void)setFinalInputModes:(id)a3
{
}

- (NSDate)finalTimestamp
{
  return self->_finalTimestamp;
}

- (void)setFinalTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalTimestamp, 0);
  objc_storeStrong((id *)&self->_finalInputModes, 0);
  objc_storeStrong((id *)&self->_initialTimestamp, 0);
  objc_storeStrong((id *)&self->_initialInputModes, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end