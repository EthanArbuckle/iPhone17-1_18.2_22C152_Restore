@interface ATXActionValuation
- (ATXActionValuation)init;
- (ATXActionValuation)initWithIntentCache:(id)a3;
- (BOOL)shouldPredictCreateEventIntent:(id)a3;
- (BOOL)shouldPredictIntent:(id)a3;
- (BOOL)shouldPredictRequestRideIntent:(id)a3;
- (BOOL)shouldPredictSendMessageIntent:(id)a3;
- (id)getCurrentLocation;
- (void)scoreActions:(id)a3 scoreLogger:(id)a4 consumerSubType:(unsigned __int8)a5;
- (void)setFeatureValuesAndFilterPredictableActions:(id)a3 actionStatistics:(id)a4;
@end

@implementation ATXActionValuation

- (ATXActionValuation)init
{
  v3 = +[ATXIntentMetadataCache sharedInstance];
  v4 = [(ATXActionValuation *)self initWithIntentCache:v3];

  return v4;
}

- (ATXActionValuation)initWithIntentCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActionValuation;
  v6 = [(ATXActionValuation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_intentCache, a3);
  }

  return v7;
}

- (BOOL)shouldPredictSendMessageIntent:(id)a3
{
  id v3 = a3;
  v4 = +[_ATXActionUtils recipientFromMessageIntent:v3];
  if (v4)
  {
    id v5 = [v3 content];
    if (!v5)
    {
      BOOL v10 = 1;
LABEL_11:

      goto LABEL_12;
    }
    v6 = +[_ATXDataStore sharedInstance];
    v7 = [v6 lastMessageToRecipient:v4];

    v8 = objc_opt_new();
    if (+[_ATXActionUtils shouldPredictRecipient:v4 withDate:v8 andRecipientDate:v7])
    {
      char v9 = [v5 isEqualToString:&stru_1F2740B58];

      if ((v9 & 1) == 0)
      {
        BOOL v10 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
    }
    BOOL v10 = 0;
    goto LABEL_10;
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)shouldPredictCreateEventIntent:(id)a3
{
  id v3 = objc_msgSend(a3, "atx_nonNilParametersByName");
  uint64_t v4 = [v3 objectForKey:@"startDate"];
  uint64_t v5 = [v3 objectForKey:@"endDate"];
  BOOL v6 = (v4 | v5) == 0;

  return v6;
}

- (id)getCurrentLocation
{
  v2 = [MEMORY[0x1E4F935D0] sharedInstance];
  id v3 = [v2 getCurrentLocation];

  return v3;
}

- (BOOL)shouldPredictRequestRideIntent:(id)a3
{
  uint64_t v4 = [a3 dropOffLocation];
  uint64_t v5 = [v4 location];

  if (v5)
  {
    BOOL v6 = [(ATXActionValuation *)self getCurrentLocation];
    v7 = v6;
    if (v6)
    {
      [v6 distanceFromLocation:v5];
      double v9 = v8;
      BOOL v10 = +[_ATXGlobals sharedInstance];
      BOOL v11 = v9 >= (double)(int)[v10 minDistanceToDropOffLocationInMetersForRequestRideIntent]
         && v9 <= (double)(int)[v10 maxDistanceToDropOffLocationInMetersForRequestRideIntent];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)shouldPredictIntent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(ATXActionValuation *)self shouldPredictSendMessageIntent:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(ATXActionValuation *)self shouldPredictRequestRideIntent:v4];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v6 = 1;
        goto LABEL_8;
      }
      BOOL v5 = [(ATXActionValuation *)self shouldPredictCreateEventIntent:v4];
    }
  }
  BOOL v6 = v5;
LABEL_8:

  return v6;
}

- (void)setFeatureValuesAndFilterPredictableActions:(id)a3 actionStatistics:(id)a4
{
  MEMORY[0x1F4188790](self, a2);
  BOOL v5 = v4;
  v61 = v6;
  buf[412] = *(id *)MEMORY[0x1E4F143B8];
  id v64 = v7;
  id v8 = v5;
  double v9 = objc_opt_new();
  unint64_t v10 = 0;
  *(void *)&long long v11 = 138412290;
  long long v60 = v11;
  while (v10 < objc_msgSend(v64, "count", v60))
  {
    v12 = (void *)MEMORY[0x1D25F6CC0]();
    v13 = [v64 objectAtIndexedSubscript:v10];
    v14 = [v13 scoredAction];
    v15 = [v14 predictedItem];

    if (!v15)
    {
      v20 = __atxlog_handle_default();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[ATXActionValuation setFeatureValuesAndFilterPredictableActions:actionStatistics:](&v69, v70, v20);
      }
      goto LABEL_14;
    }
    if (([v15 hasActionTitle] & 1) == 0)
    {
      v20 = __atxlog_handle_default();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[ATXActionValuation setFeatureValuesAndFilterPredictableActions:actionStatistics:](&v67, v68, v20);
      }
LABEL_14:

      [v9 addIndex:v10];
      goto LABEL_36;
    }
    v63 = [v15 intent];
    if (v63 && ([v61 shouldPredictIntent:v63] & 1) == 0)
    {
      v21 = __atxlog_handle_default();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = [v63 _className];
        LODWORD(buf[0]) = v60;
        *(id *)((char *)buf + 4) = v22;
        _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_INFO, "Removed intent of class %@ because of special logic for the intent class", (uint8_t *)buf, 0xCu);
      }
      [v9 addIndex:v10];
      goto LABEL_35;
    }
    v16 = [ATXMinimalSlotResolutionParameters alloc];
    v17 = [v13 slotSet];
    v62 = [(ATXMinimalSlotResolutionParameters *)v16 initWithAction:v15 slots:v17];

    v18 = [*((id *)v8 + 1) objectForKeyedSubscript:v62];
    if (v13)
    {
      [v13 predictionItem];
      if (!v18) {
        goto LABEL_20;
      }
LABEL_19:
      ATXProbability(v18[29], *((double *)v8 + 2));
      ATXSetInput((uint64_t)buf, 0x13CuLL, v23);
      ATXProbability(v18[46], *((double *)v8 + 3));
      ATXSetInput((uint64_t)buf, 0x13DuLL, v24);
      ATXProbability(v18[47], *((double *)v8 + 4));
      ATXSetInput((uint64_t)buf, 0x13EuLL, v25);
      ATXProbability(v18[48], *((double *)v8 + 5));
      ATXSetInput((uint64_t)buf, 0x13FuLL, v26);
      ATXProbability(v18[49], *((double *)v8 + 6));
      ATXSetInput((uint64_t)buf, 0x140uLL, v27);
      ATXProbability(v18[50], *((double *)v8 + 7));
      ATXSetInput((uint64_t)buf, 0x141uLL, v28);
      ATXProbability(v18[51], *((double *)v8 + 8));
      ATXSetInput((uint64_t)buf, 0x142uLL, v29);
      ATXProbability(v18[52], *((double *)v8 + 9));
      ATXSetInput((uint64_t)buf, 0x143uLL, v30);
      ATXProbability(v18[53], *((double *)v8 + 21));
      ATXSetInput((uint64_t)buf, 0x144uLL, v31);
      ATXProbability(v18[54], *((double *)v8 + 10));
      ATXSetInput((uint64_t)buf, 0x145uLL, v32);
      ATXProbability(v18[55], *((double *)v8 + 11));
      ATXSetInput((uint64_t)buf, 0x146uLL, v33);
      ATXProbability(v18[56], *((double *)v8 + 12));
      ATXSetInput((uint64_t)buf, 0x147uLL, v34);
      ATXProbability(v18[61], *((double *)v8 + 17));
      ATXSetInput((uint64_t)buf, 0x148uLL, v35);
      ATXProbability(v18[62], *((double *)v8 + 18));
      ATXSetInput((uint64_t)buf, 0x149uLL, v36);
      ATXProbability(v18[63], *((double *)v8 + 19));
      ATXSetInput((uint64_t)buf, 0x14AuLL, v37);
      ATXProbability(v18[64], *((double *)v8 + 20));
      ATXSetInput((uint64_t)buf, 0x14BuLL, v38);
      ATXProbability(v18[58], *((double *)v8 + 14));
      ATXSetInput((uint64_t)buf, 0x14CuLL, v39);
      ATXProbability(v18[57], *((double *)v8 + 13));
      ATXSetInput((uint64_t)buf, 0x14DuLL, v40);
      ATXProbability(v18[59], *((double *)v8 + 15));
      ATXSetInput((uint64_t)buf, 0x14EuLL, v41);
      ATXProbability(v18[60], *((double *)v8 + 16));
      ATXSetInput((uint64_t)buf, 0x14FuLL, v42);
      ATXProbability(v18[65], *((double *)v8 + 22));
      ATXSetInput((uint64_t)buf, 0x150uLL, v43);
      ATXSetInput((uint64_t)buf, 0x151uLL, *((double *)v8 + 23));
      ATXSetInput((uint64_t)buf, 0x152uLL, *((double *)v8 + 24));
      ATXSetInput((uint64_t)buf, 0x153uLL, *((double *)v8 + 25));
      ATXSetInput((uint64_t)buf, 0x154uLL, *((double *)v8 + 26));
      ATXSetInput((uint64_t)buf, 0x155uLL, *((double *)v8 + 27));
      ATXSetInput((uint64_t)buf, 0x156uLL, *((double *)v8 + 28));
      ATXSetInput((uint64_t)buf, 0x15BuLL, *((double *)v8 + 29));
      ATXSetInput((uint64_t)buf, 0x15CuLL, *((double *)v8 + 30));
      ATXSetInput((uint64_t)buf, 0x15DuLL, *((double *)v8 + 31));
      ATXSetInput((uint64_t)buf, 0x15EuLL, *((double *)v8 + 32));
      ATXSetInput((uint64_t)buf, 0x158uLL, *((double *)v8 + 33));
      ATXSetInput((uint64_t)buf, 0x157uLL, *((double *)v8 + 34));
      ATXSetInput((uint64_t)buf, 0x159uLL, *((double *)v8 + 35));
      ATXSetInput((uint64_t)buf, 0x15AuLL, *((double *)v8 + 36));
      ATXSetInput((uint64_t)buf, 0x15FuLL, *((double *)v8 + 37));
      ATXSetInput((uint64_t)buf, 0x160uLL, *((double *)v8 + 38));
      ATXSetInput((uint64_t)buf, 0x163uLL, *((double *)v8 + 39));
      ATXSetInput((uint64_t)buf, 0x164uLL, *((double *)v8 + 40));
      ATXSetInput((uint64_t)buf, 0x165uLL, *((double *)v8 + 41));
      ATXSetInput((uint64_t)buf, 0x134uLL, *((double *)v8 + 42));
      ATXSetInput((uint64_t)buf, 0x135uLL, *((double *)v8 + 43));
      ATXSetInput((uint64_t)buf, 0x136uLL, *((double *)v8 + 47));
      ATXSetInput((uint64_t)buf, 0x137uLL, *((double *)v8 + 48));
      ATXSetInput((uint64_t)buf, 0x138uLL, *((double *)v8 + 49));
      *(float *)&double v44 = ATXSetInput((uint64_t)buf, 0x139uLL, *((double *)v8 + 50));
      double v45 = ATXRatio(*((double *)v8 + 45) + *((double *)v8 + 44), (double)(unint64_t)objc_msgSend(*((id *)v8 + 46), "count", v44));
      *(float *)&double v46 = ATXSetInput((uint64_t)buf, 0x13AuLL, v45);
      double v47 = ATXRatio(*((double *)v8 + 44), (double)(unint64_t)objc_msgSend(*((id *)v8 + 46), "count", v46));
      ATXSetInput((uint64_t)buf, 0x13BuLL, v47);
      ATXSetInput((uint64_t)buf, 0x1A6uLL, *((double *)v8 + 51));
      ATXSetInput((uint64_t)buf, 0x1A8uLL, *((double *)v8 + 52));
      ATXSetInput((uint64_t)buf, 0x1AAuLL, *((double *)v8 + 53));
      ATXSetInput((uint64_t)buf, 0x1ACuLL, *((double *)v8 + 54));
      ATXSetInput((uint64_t)buf, 0x1AEuLL, *((double *)v8 + 55));
      ATXSetInput((uint64_t)buf, 0x1B0uLL, *((double *)v8 + 56));
      ATXSetInput((uint64_t)buf, 0x1B2uLL, *((double *)v8 + 57));
      ATXSetInput((uint64_t)buf, 0x1B4uLL, *((double *)v8 + 58));
      ATXSetInput((uint64_t)buf, 0x1B6uLL, *((double *)v8 + 59));
      ATXSetInput((uint64_t)buf, 0x1B8uLL, *((double *)v8 + 60));
      ATXSetInput((uint64_t)buf, 0x1BAuLL, *((double *)v8 + 61));
      ATXSetInput((uint64_t)buf, 0x1BCuLL, *((double *)v8 + 62));
      ATXSetInput((uint64_t)buf, 0x22AuLL, *((double *)v8 + 63));
      ATXSetInput((uint64_t)buf, 0x22DuLL, *((double *)v8 + 64));
      ATXSetInput((uint64_t)buf, 0x230uLL, *((double *)v8 + 65));
      ATXSetInput((uint64_t)buf, 0x233uLL, *((double *)v8 + 66));
      ATXSetInput((uint64_t)buf, 0x236uLL, *((double *)v8 + 67));
      ATXSetInput((uint64_t)buf, 0x239uLL, *((double *)v8 + 68));
      ATXSetInput((uint64_t)buf, 0x23CuLL, *((double *)v8 + 69));
      ATXSetInput((uint64_t)buf, 0x23FuLL, *((double *)v8 + 70));
      ATXSetInput((uint64_t)buf, 0x242uLL, *((double *)v8 + 71));
      ATXSetInput((uint64_t)buf, 0x245uLL, *((double *)v8 + 72));
      ATXSetInput((uint64_t)buf, 0x248uLL, *((double *)v8 + 73));
      ATXSetInput((uint64_t)buf, 0x24BuLL, *((double *)v8 + 74));
      ATXSetInput((uint64_t)buf, 0x303uLL, *((double *)v8 + 75));
      ATXSetInput((uint64_t)buf, 0x306uLL, *((double *)v8 + 77));
      ATXSetInput((uint64_t)buf, 0x309uLL, *((double *)v8 + 79));
      ATXSetInput((uint64_t)buf, 0x30CuLL, *((double *)v8 + 81));
      ATXSetInput((uint64_t)buf, 0x30FuLL, *((double *)v8 + 83));
      ATXSetInput((uint64_t)buf, 0x312uLL, *((double *)v8 + 85));
      ATXSetInput((uint64_t)buf, 0x315uLL, *((double *)v8 + 76));
      ATXSetInput((uint64_t)buf, 0x318uLL, *((double *)v8 + 78));
      ATXSetInput((uint64_t)buf, 0x31BuLL, *((double *)v8 + 80));
      ATXSetInput((uint64_t)buf, 0x31EuLL, *((double *)v8 + 82));
      ATXSetInput((uint64_t)buf, 0x321uLL, *((double *)v8 + 84));
      *(float *)&double v19 = ATXSetInput((uint64_t)buf, 0x324uLL, *((double *)v8 + 86));
      goto LABEL_20;
    }
    bzero(buf, 0xCE0uLL);
    if (v18) {
      goto LABEL_19;
    }
LABEL_20:
    switch(objc_msgSend(v15, "actionType", v19))
    {
      case 0:
        double v50 = 0.0;
        ATXSetInput((uint64_t)buf, 0x17AuLL, 1.0);
        goto LABEL_24;
      case 1:
      case 5:
        ATXSetInput((uint64_t)buf, 0x17AuLL, 0.0);
        double v49 = 1.0;
        ATXSetInput((uint64_t)buf, 0x17BuLL, 0.0);
        goto LABEL_25;
      case 2:
        double v50 = 1.0;
        ATXSetInput((uint64_t)buf, 0x17AuLL, 0.0);
LABEL_24:
        double v49 = 0.0;
        ATXSetInput((uint64_t)buf, 0x17BuLL, v50);
LABEL_25:
        *(float *)&double v48 = ATXSetInput((uint64_t)buf, 0x17CuLL, v49);
        break;
      default:
        break;
    }
    *(float *)&double v51 = ATXSetInput((uint64_t)buf, 0x176uLL, (double)objc_msgSend(v15, "isFutureMedia", v48));
    v52 = objc_msgSend(v15, "intent", v51);
    ATXSetInput((uint64_t)buf, 0x87uLL, (double)[v52 _intentCategory]);

    v53 = (void *)MEMORY[0x1D25F6CC0]();
    v54 = [v15 intent];
    if (v54)
    {
      v55 = (void *)v61[1];
      uint64_t v56 = [v15 intent];
      v57 = v55;
      BOOL v5 = (void *)v56;
      unsigned int v58 = objc_msgSend(v57, "supportsBackgroundExecutionForIntent:");
    }
    else
    {
      unsigned int v58 = 0;
    }
    ATXSetInput((uint64_t)buf, 0x177uLL, (double)v58);
    if (v54) {

    }
    id v59 = buf[0];
    id v65 = v59;
    memcpy(v66, &buf[1], sizeof(v66));
    if (v13) {
      [v13 setPredictionItem:&v65];
    }
    else {

    }
LABEL_35:
LABEL_36:

    ++v10;
  }
  [v64 removeObjectsAtIndexes:v9];
}

- (void)scoreActions:(id)a3 scoreLogger:(id)a4 consumerSubType:(unsigned __int8)a5
{
  MEMORY[0x1F4188790](self, a2);
  uint64_t v6 = v5;
  id v8 = v7;
  id v10 = v9;
  id v50 = v8;
  long long v11 = +[ATXScoreInterpreterCache sharedInstance];
  double v47 = [v11 scoreInterpreterForConsumerSubType:v6];

  unint64_t v12 = 0;
  uint64_t v45 = *MEMORY[0x1E4F4B688];
  id v46 = v10;
  while (v12 < [v10 count])
  {
    uint64_t v13 = MEMORY[0x1D25F6CC0]();
    v14 = [v10 objectAtIndexedSubscript:v12];
    v15 = [v14 scoredAction];
    v16 = [v15 predictedItem];

    v17 = [ATXMinimalSlotResolutionParameters alloc];
    v18 = [v14 slotSet];
    context = (void *)v13;
    double v49 = [(ATXMinimalSlotResolutionParameters *)v17 initWithAction:v16 slots:v18];

    double v19 = [v16 actionKey];
    if (!v50) {
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = NSString;
      v21 = [v16 actionKey];
      v22 = [v14 slotSet];
      double v23 = [v22 description];
      double v24 = [v16 description];
      uint64_t v25 = [v20 stringWithFormat:@"ActionKey: %@\nSlotSet: %@\n%@", v21, v23, v24];

      double v19 = (void *)v25;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_9;
      }
      double v26 = NSString;
      v21 = [v16 actionKey];
      [v26 stringWithFormat:@"%@:%tu", v21, -[ATXMinimalSlotResolutionParameters hash](v49, "hash")];
      double v19 = v22 = v19;
    }

LABEL_9:
    if (v14) {
      [v14 predictionItem];
    }
    else {
      bzero(&location, 0xCE0uLL);
    }
    objc_storeStrong(&location, v19);
    v54[0] = [(ATXMinimalSlotResolutionParameters *)v49 hash];
    double v27 = +[_ATXAppPredictor sharedInstance];
    [v27 setupScoreLogger:v50 forConsumerSubType:v6];

    double v28 = +[_ATXAppPredictor sharedInstance];
    [v28 _predictionScoreAndUpdateConfidenceForItem:&location interpreter:v47 consumerSubType:v6 scoreLogger:v50 intentType:0];
    double v30 = v29;

    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      id v31 = [NSString alloc];
      double v32 = [v16 bundleId];
      double v33 = (void *)[v31 initWithFormat:@"ActionValuationScoreOverride-%@", v32];

      double v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v45];
      double v35 = [v34 objectForKey:v33];
      Class v36 = NSClassFromString(&cfstr_Nsnumber.isa);
      id v37 = v35;
      if (v36)
      {
        if (objc_opt_isKindOfClass()) {
          double v38 = v37;
        }
        else {
          double v38 = 0;
        }
      }
      else
      {
        double v38 = 0;
      }
      id v39 = v38;

      if (v39)
      {
        [v39 doubleValue];
        double v30 = v40;
      }
    }
    float v41 = v30;
    *((float *)&v54[409] + 1) = v41;
    double v42 = [v14 scoredAction];
    *(float *)&double v43 = v41;
    [v42 setScore:v43];

    id v44 = location;
    id v51 = v44;
    memcpy(v52, v54, sizeof(v52));
    if (v14) {
      [v14 setPredictionItem:&v51];
    }
    else {

    }
    if (v50)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v50 storeMetaDataFromActionContainerForKey:v19 actionContainer:v14];
      }
    }

    id v10 = v46;
    ++v12;
  }
}

- (void).cxx_destruct
{
}

- (void)setFeatureValuesAndFilterPredictableActions:(os_log_t)log actionStatistics:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Action not found during Action Valuation", buf, 2u);
}

- (void)setFeatureValuesAndFilterPredictableActions:(os_log_t)log actionStatistics:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Action without title found during Action Valuation", buf, 2u);
}

@end