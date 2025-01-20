@interface HKSleepStageDurationSeries
- (BOOL)hideAsleepData;
- (BOOL)hideInBedData;
- (HKSleepStageDurationSeries)init;
- (NSArray)sleepStageFillStyles;
- (NSArray)sleepStageFillStylesStorage;
- (NSLock)seriesMutableStateLock;
- (NSNumber)highlightedSleepStage;
- (NSNumber)highlightedSleepStageStorage;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (void)_rebuildFillStyles;
- (void)setHighlightedSleepStage:(id)a3;
- (void)setHighlightedSleepStageStorage:(id)a3;
- (void)setSleepStageFillStyles:(id)a3;
- (void)setSleepStageFillStylesStorage:(id)a3;
@end

@implementation HKSleepStageDurationSeries

- (HKSleepStageDurationSeries)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKSleepStageDurationSeries;
  v2 = [(HKSleepDurationSeries *)&v8 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKSleepStageDurationSeriesLock"];
    highlightedSleepStageStorage = v2->_highlightedSleepStageStorage;
    v2->_highlightedSleepStageStorage = 0;

    sleepStageFillStylesStorage = v2->_sleepStageFillStylesStorage;
    v2->_sleepStageFillStylesStorage = 0;
  }
  return v2;
}

- (NSNumber)highlightedSleepStage
{
  v3 = [(HKSleepStageDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_highlightedSleepStageStorage;
  v5 = [(HKSleepStageDurationSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setHighlightedSleepStage:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = [(HKSleepStageDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  highlightedSleepStageStorage = self->_highlightedSleepStageStorage;
  self->_highlightedSleepStageStorage = v4;

  v7 = [(HKSleepStageDurationSeries *)self seriesMutableStateLock];
  [v7 unlock];

  [(HKSleepStageDurationSeries *)self _rebuildFillStyles];
}

- (NSArray)sleepStageFillStyles
{
  v3 = [(HKSleepStageDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_sleepStageFillStylesStorage;
  v5 = [(HKSleepStageDurationSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSleepStageFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepStageDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  sleepStageFillStylesStorage = self->_sleepStageFillStylesStorage;
  self->_sleepStageFillStylesStorage = v6;

  objc_super v8 = [(HKSleepStageDurationSeries *)self seriesMutableStateLock];
  [v8 unlock];

  [(HKSleepStageDurationSeries *)self _rebuildFillStyles];
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  v12 = [a3 chartPoints];
  if (!v12)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"HKSleepStageDurationSeries.m", 84, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  v48 = v10;
  v53 = [v10 transform];
  v47 = v11;
  v13 = [v11 transform];
  v51 = self;
  v14 = [(HKSleepStageDurationSeries *)self highlightedSleepStage];
  v52 = [MEMORY[0x1E4F1CA48] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v12;
  uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v50 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v57 != v50) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v19 = [v18 xValueAsGenericType];
        [v53 coordinateForValue:v19];
        double v21 = v20;

        double v22 = v21 + -0.25;
        [v13 coordinateForValue:&unk_1F3C20AA0];
        double v24 = v23;
        v25 = [MEMORY[0x1E4F1CA48] array];
        v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v22, v24);
        [v25 addObject:v26];

        if (v14)
        {
          switch([v14 intValue])
          {
            case 0u:
            case 1u:
              _HKInitializeLogging();
              v27 = (void *)*MEMORY[0x1E4F29FA0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_ERROR)) {
                -[HKSleepStageDurationSeries coordinatesForBlock:blockPath:xAxis:yAxis:](v60, v27, (uint64_t)v51, &v61);
              }
              break;
            case 2u:
              v28 = NSNumber;
              [v18 awakeValue];
              goto LABEL_16;
            case 3u:
              v28 = NSNumber;
              [v18 asleepCoreValue];
              goto LABEL_16;
            case 4u:
              v28 = NSNumber;
              [v18 asleepDeepValue];
              goto LABEL_16;
            case 5u:
              v28 = NSNumber;
              [v18 asleepRemValue];
LABEL_16:
              v29 = objc_msgSend(v28, "numberWithDouble:");
              [v13 coordinateForValue:v29];
              double v24 = v30;

              break;
            default:
              break;
          }
        }
        v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v22, v24);
        [v25 addObject:v31];

        v32 = NSNumber;
        [v18 totalDurationValue];
        v33 = objc_msgSend(v32, "numberWithDouble:");
        [v13 coordinateForValue:v33];
        double v35 = v34;

        v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v22, v35);
        [v25 addObject:v36];

        v37 = [(HKSleepStageDurationSeries *)v51 highlightedSleepStage];
        uint64_t v38 = HKSleepChartPointFormatterOptionsForSleepAnalysis(v37);
        v39 = [v18 userInfo];
        [v39 setAnnotationOptions:v38];

        v40 = [HKSleepDurationCoordinate alloc];
        v41 = [v18 userInfo];
        v42 = [(HKSleepDurationCoordinate *)v40 initWithStackPoints:v25 goalLineYValue:0 highlighted:1 userInfo:v41];

        [v52 addObject:v42];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v16);
  }

  long long v54 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v43 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v52 blockPath:&v54];

  return v43;
}

- (BOOL)hideInBedData
{
  return 0;
}

- (BOOL)hideAsleepData
{
  return 0;
}

- (void)_rebuildFillStyles
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1E0B26000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Asked to create fill style for unsupported sleep category value", (uint8_t *)&v4, 0xCu);
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (NSNumber)highlightedSleepStageStorage
{
  return self->_highlightedSleepStageStorage;
}

- (void)setHighlightedSleepStageStorage:(id)a3
{
}

- (NSArray)sleepStageFillStylesStorage
{
  return self->_sleepStageFillStylesStorage;
}

- (void)setSleepStageFillStylesStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStageFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_highlightedSleepStageStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

- (void)coordinatesForBlock:(uint8_t *)a1 blockPath:(void *)a2 xAxis:(uint64_t)a3 yAxis:(void *)a4 .cold.1(uint8_t *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = a2;
  v7 = (objc_class *)objc_opt_class();
  objc_super v8 = NSStringFromClass(v7);
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Asked to create coordinate for unsupported sleep category value", a1, 0xCu);
}

@end