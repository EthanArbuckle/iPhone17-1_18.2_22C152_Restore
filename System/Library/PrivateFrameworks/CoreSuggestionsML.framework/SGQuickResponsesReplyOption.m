@interface SGQuickResponsesReplyOption
+ (double)totalDisplayedCountForRecords:(id)a3;
+ (double)ucbCombinedForSelected:(double)a3 displayed:(double)a4 actualOptionsDisplayed:(double)a5 matched:(double)a6 imputedDisplayed:(double)a7 imputedOptionsDisplayed:(double)a8 explorationFactor:(double)a9;
+ (double)ucbCombinedWithMeanA:(double)a3 meanB:(double)a4 varianceA:(double)a5 varianceB:(double)a6 explorationFactor:(double)a7;
+ (double)ucbTunedVarianceForMean:(double)a3 displayed:(double)a4 totalDisplayed:(double)a5;
+ (double)ucbWithMean:(double)a3 varianceOfMean:(double)a4 explorationFactor:(double)a5;
+ (id)imputedDisplayedForRecords:(id)a3 config:(id)a4;
+ (id)sortedReplyOptionsForRecords:(id)a3 config:(id)a4;
- (NSNumber)position;
- (NSNumber)ucb;
- (SGQuickResponsesReplyOption)initWithPosition:(unint64_t)a3 records:(id)a4 actualOptionsDisplayedCount:(double)a5 imputedOptionsDisplayedCount:(double)a6 imputedOptionsDisplayed:(id)a7 config:(id)a8;
- (int64_t)compare:(id)a3;
@end

@implementation SGQuickResponsesReplyOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ucb, 0);
  objc_storeStrong((id *)&self->_position, 0);
}

- (NSNumber)ucb
{
  return self->_ucb;
}

- (NSNumber)position
{
  return self->_position;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(SGQuickResponsesReplyOption *)self ucb];
  v6 = [v4 ucb];
  int v7 = [v5 isEqualToNumber:v6];

  if (v7)
  {
    v8 = [(SGQuickResponsesReplyOption *)self position];
    [v4 position];
  }
  else
  {
    v8 = [v4 ucb];
    [(SGQuickResponsesReplyOption *)self ucb];
  v9 = };
  int64_t v10 = [v8 compare:v9];

  return v10;
}

- (SGQuickResponsesReplyOption)initWithPosition:(unint64_t)a3 records:(id)a4 actualOptionsDisplayedCount:(double)a5 imputedOptionsDisplayedCount:(double)a6 imputedOptionsDisplayed:(id)a7 config:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  v38.receiver = self;
  v38.super_class = (Class)SGQuickResponsesReplyOption;
  v17 = [(SGQuickResponsesReplyOption *)&v38 init];
  if (v17)
  {
    v18 = [v14 replyRecords];
    v19 = [v18 objectAtIndexedSubscript:a3];

    [v19 selected];
    double v21 = v20;
    [v19 displayed];
    double v23 = v22;
    [v19 matched];
    double v25 = v24;
    v26 = [v15 objectAtIndexedSubscript:a3];
    [v26 doubleValue];
    double v28 = v27;
    v29 = [v16 predictionParams];
    [v29 personalizationExplorationFactor];
    +[SGQuickResponsesReplyOption ucbCombinedForSelected:v21 displayed:v23 actualOptionsDisplayed:a5 matched:v25 imputedDisplayed:v28 imputedOptionsDisplayed:a6 explorationFactor:v30];
    double v32 = v31;

    uint64_t v33 = [objc_alloc(NSNumber) initWithUnsignedInteger:a3];
    position = v17->_position;
    v17->_position = (NSNumber *)v33;

    uint64_t v35 = [objc_alloc(NSNumber) initWithDouble:v32];
    ucb = v17->_ucb;
    v17->_ucb = (NSNumber *)v35;
  }
  return v17;
}

+ (id)imputedDisplayedForRecords:(id)a3 config:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 totalDisplayed];
  double v6 = v5;
  [v4 totalSelected];
  double v8 = v7;
  [v4 totalUnmatched];
  double v10 = v9;
  v11 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v12 = objc_msgSend(v4, "replyRecords", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    double v15 = fmax(v6 - v8, 0.0);
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v18 displayed];
        double v20 = v19;
        [v18 selected];
        double v22 = v21;
        [v18 matched];
        double v24 = (void *)[objc_alloc(NSNumber) initWithDouble:v23 + v10 * ((v20 - v22) / v15)];
        [v11 addObject:v24];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (double)totalDisplayedCountForRecords:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "replyRecords", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) displayed];
        double v7 = v7 + v9;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (id)sortedReplyOptionsForRecords:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[SGQuickResponsesReplyOption totalDisplayedCountForRecords:v5];
  double v8 = v7;
  double v9 = +[SGQuickResponsesReplyOption imputedDisplayedForRecords:v5 config:v6];
  double v10 = [v9 valueForKeyPath:@"@sum.self"];
  [v10 doubleValue];
  double v12 = v11;

  long long v13 = objc_opt_new();
  long long v14 = [v5 replyRecords];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    unint64_t v16 = 0;
    do
    {
      v17 = [[SGQuickResponsesReplyOption alloc] initWithPosition:v16 records:v5 actualOptionsDisplayedCount:v9 imputedOptionsDisplayedCount:v6 imputedOptionsDisplayed:v8 config:v12];
      [v13 addObject:v17];

      ++v16;
      v18 = [v5 replyRecords];
      unint64_t v19 = [v18 count];
    }
    while (v16 < v19);
  }
  [v13 sortUsingSelector:sel_compare_];

  return v13;
}

+ (double)ucbCombinedForSelected:(double)a3 displayed:(double)a4 actualOptionsDisplayed:(double)a5 matched:(double)a6 imputedDisplayed:(double)a7 imputedOptionsDisplayed:(double)a8 explorationFactor:(double)a9
{
  double v12 = a3 / a4;
  if (v12 <= 1.0) {
    double v13 = v12;
  }
  else {
    double v13 = 1.0;
  }
  if (a6 / a7 <= 1.0) {
    double v14 = a6 / a7;
  }
  else {
    double v14 = 1.0;
  }
  +[SGQuickResponsesReplyOption ucbTunedVarianceForMean:displayed:totalDisplayed:](SGQuickResponsesReplyOption, "ucbTunedVarianceForMean:displayed:totalDisplayed:", v13);
  double v16 = v15;
  +[SGQuickResponsesReplyOption ucbTunedVarianceForMean:v14 displayed:a7 totalDisplayed:a8];
  +[SGQuickResponsesReplyOption ucbCombinedWithMeanA:v13 meanB:v14 varianceA:v16 varianceB:v17 explorationFactor:a9];
  return result;
}

+ (double)ucbCombinedWithMeanA:(double)a3 meanB:(double)a4 varianceA:(double)a5 varianceB:(double)a6 explorationFactor:(double)a7
{
  double v7 = 1.0 / a5 / (1.0 / a5 + 1.0 / a6);
  +[SGQuickResponsesReplyOption ucbWithMean:(1.0 - v7) * a4 + v7 * a3 varianceOfMean:(1.0 - v7) * a6 + v7 * a5 + v7 * (1.0 - v7) * ((a3 - a4) * (a3 - a4)) explorationFactor:a7];
  return result;
}

+ (double)ucbWithMean:(double)a3 varianceOfMean:(double)a4 explorationFactor:(double)a5
{
  double result = sqrt(a4) * a5 + a3;
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

+ (double)ucbTunedVarianceForMean:(double)a3 displayed:(double)a4 totalDisplayed:(double)a5
{
  double v5 = (1.0 - a3) * a3;
  double v6 = log(a5) / a4;
  double v7 = v5 + sqrt(v6 + v6);
  if (v7 > 0.25) {
    double v7 = 0.25;
  }
  return v6 * v7;
}

@end