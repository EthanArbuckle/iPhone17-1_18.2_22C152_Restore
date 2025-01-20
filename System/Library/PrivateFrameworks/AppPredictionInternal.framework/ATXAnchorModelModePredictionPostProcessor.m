@interface ATXAnchorModelModePredictionPostProcessor
- (ATXAnchorModelModePredictionPostProcessor)initWithAnchorModelPrediction:(id)a3;
- (BOOL)shouldPredictAnchorModelModePrediction;
- (NSArray)serializedTriggers;
- (id)_triggerForAnchorType;
- (void)setSerializedTriggers:(id)a3;
@end

@implementation ATXAnchorModelModePredictionPostProcessor

- (ATXAnchorModelModePredictionPostProcessor)initWithAnchorModelPrediction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAnchorModelModePredictionPostProcessor;
  v6 = [(ATXAnchorModelModePredictionPostProcessor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_anchorModelPrediction, a3);
  }

  return v7;
}

- (BOOL)shouldPredictAnchorModelModePrediction
{
  v3 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateType];
  int v4 = [v3 isEqualToString:@"mode"];

  if (v4)
  {
    id v5 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateId];
    v6 = +[ATXAnchorModelDataStoreWrapper modeDetailsFromModeCandidateId:v5];

    if (!self->_modeStream)
    {
      v7 = BiomeLibrary();
      v8 = [v7 UserFocus];
      objc_super v9 = [v8 ComputedMode];
      modeStream = self->_modeStream;
      self->_modeStream = v9;
    }
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F93650]) initWithStream:self->_modeStream];
    v12 = [v11 currentModeUUID];
    v13 = [v12 UUIDString];

    if ([v6 isStart])
    {
      if (v13)
      {
        v14 = [v6 modeUUID];
        char v15 = [v14 isEqualToString:v13];

        if (v15)
        {
LABEL_11:
          LOBYTE(v4) = 0;
          goto LABEL_12;
        }
      }
    }
    else if (v13)
    {
      v16 = [v6 modeUUID];
      int v17 = [v16 isEqualToString:v13];

      if (!v17) {
        goto LABEL_11;
      }
    }
    LOBYTE(v4) = 1;
LABEL_12:
  }
  return v4;
}

- (NSArray)serializedTriggers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateClassifier];
  uint64_t v4 = [v3 classifierType];

  if (v4 == 3)
  {
    id v5 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateClassifier];
    v6 = [v5 tree];

    if (v6)
    {
      v7 = __atxlog_handle_modes();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "ATXAnchorModelModePredictionPostProcessor: GamePlayKitDecisionTree is not empty, not creating any triggers";
LABEL_11:
        _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      }
    }
    else
    {
      v10 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction offsetFromAnchorToShowPrediction];
      [v10 startSecondsAfterAnchor];
      double v12 = v11;

      if (v12 <= 900.0)
      {
        uint64_t v14 = [(ATXAnchorModelModePredictionPostProcessor *)self _triggerForAnchorType];
        v7 = v14;
        if (v14)
        {
          uint64_t v17 = v14;
          char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
          objc_super v9 = ATXSerializeTriggers();
        }
        else
        {
          char v15 = __atxlog_handle_modes();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction anchorType];
            *(_DWORD *)buf = 138412290;
            v19 = v16;
            _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "ATXAnchorModelModePredictionPostProcessor: No valid trigger for anchor type: %@", buf, 0xCu);
          }
          objc_super v9 = 0;
        }

        goto LABEL_13;
      }
      v7 = __atxlog_handle_modes();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "ATXAnchorModelModePredictionPostProcessor: AnchorModelPrediction offset startSecondsAfterAnchor is too long"
             " after anchor, not creating any triggers";
        goto LABEL_11;
      }
    }
    objc_super v9 = 0;
LABEL_13:

    goto LABEL_14;
  }
  id v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXAnchorModelModePredictionPostProcessor: classifier is not of type GamePlayKitDecisionTree, not creating any triggers", buf, 2u);
  }
  objc_super v9 = 0;
LABEL_14:

  return (NSArray *)v9;
}

- (id)_triggerForAnchorType
{
  v3 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction anchorType];
  int64_t v4 = +[ATXAnchor stringToAnchorType:v3];

  id v5 = 0;
  switch(v4)
  {
    case 1:
      v6 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction anchorEvent];
      v7 = (objc_class *)MEMORY[0x1E4F93568];
      goto LABEL_4;
    case 2:
      v6 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction anchorEvent];
      v7 = (objc_class *)MEMORY[0x1E4F93570];
LABEL_4:
      id v8 = [v7 alloc];
      objc_super v9 = [v6 deviceIdentifier];
      v10 = [v6 deviceName];
      uint64_t v11 = [v8 initWithDeviceIdentifier:v9 deviceName:v10];
      goto LABEL_14;
    case 3:
    case 4:
    case 5:
    case 6:
    case 9:
    case 18:
      id v5 = objc_opt_new();
      break;
    case 7:
      v6 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction anchorEvent];
      double v12 = (objc_class *)MEMORY[0x1E4F935C0];
      goto LABEL_7;
    case 8:
      v6 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction anchorEvent];
      double v12 = (objc_class *)MEMORY[0x1E4F935C8];
LABEL_7:
      id v13 = [v12 alloc];
      objc_super v9 = [v6 identifier];
      uint64_t v14 = [v13 initWithLocationIdentifier:v9 namedLOI:0];
      goto LABEL_11;
    case 16:
      v6 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction anchorEvent];
      char v15 = (objc_class *)MEMORY[0x1E4F93668];
      goto LABEL_10;
    case 17:
      v6 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction anchorEvent];
      char v15 = (objc_class *)MEMORY[0x1E4F93670];
LABEL_10:
      id v16 = [v15 alloc];
      objc_super v9 = [v6 deviceIdentifier];
      uint64_t v14 = [v16 initWithDeviceIdentifier:v9];
LABEL_11:
      id v5 = (void *)v14;
      goto LABEL_15;
    case 19:
      v6 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction anchorEvent];
      id v17 = objc_alloc(MEMORY[0x1E4F935F8]);
      objc_super v9 = [v6 dominantMicrolocationUUID];
      v10 = [v9 UUIDString];
      uint64_t v11 = [v17 initWithLocationUUID:v10];
LABEL_14:
      id v5 = (void *)v11;

LABEL_15:
      break;
    default:
      break;
  }
  return v5;
}

- (void)setSerializedTriggers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_modeStream, 0);
  objc_storeStrong((id *)&self->_anchorModelPrediction, 0);
}

@end