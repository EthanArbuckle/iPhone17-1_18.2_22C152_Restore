@interface EREyeReliefEngine
+ (float)_countReductionForInactiveTime:(double)a3 forSamplingInterval:(double)a4;
- (BOOL)cancelWithError:(id *)a3;
- (BOOL)invalidateWithError:(id *)a3;
- (ERAttentionAwarenessClient)attentionAwarenessClient;
- (EREyeReliefEngine)init;
- (NSUserDefaults)userDefaults;
- (float)tooCloseCount;
- (id)_initFromUserDefaults:(BOOL)a3;
- (int64_t)interventionType;
- (int64_t)tooCloseDistanceThreshold;
- (void)_processDistanceEvent:(id)a3;
- (void)processInactivity:(double)a3 forSamplingInterval:(double)a4;
- (void)processInterventionOutcome:(int64_t)a3;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)setInterventionType:(int64_t)a3;
- (void)setTooCloseCount:(float)a3;
- (void)setTooCloseDistanceThreshold:(int64_t)a3;
- (void)setUserDefaults:(id)a3;
- (void)takeDistanceSampleWithCompletion:(id)a3;
@end

@implementation EREyeReliefEngine

- (EREyeReliefEngine)init
{
  return (EREyeReliefEngine *)[(EREyeReliefEngine *)self _initFromUserDefaults:1];
}

- (id)_initFromUserDefaults:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)EREyeReliefEngine;
  v4 = [(EREyeReliefEngine *)&v13 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    attentionAwarenessClient = v4->_attentionAwarenessClient;
    v4->_attentionAwarenessClient = (ERAttentionAwarenessClient *)v5;

    if (a3)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.EyeRelief"];
      userDefaults = v4->_userDefaults;
      v4->_userDefaults = (NSUserDefaults *)v7;

      [(NSUserDefaults *)v4->_userDefaults floatForKey:@"TooCloseCount"];
    }
    else
    {
      v10 = v4->_userDefaults;
      v4->_userDefaults = 0;

      float v9 = 0.0;
    }
    v4->_tooCloseCount = v9;
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"Initializing EyeRelief with too close count of %f", v9);
    +[ERLogging log:v11 withType:0];

    v4->_tooCloseDistanceThreshold = [(ERAttentionAwarenessClient *)v4->_attentionAwarenessClient tooCloseDistanceThreshold];
  }
  return v4;
}

- (void)processInterventionOutcome:(int64_t)a3
{
  if (a3 == 2)
  {
    [(EREyeReliefEngine *)self tooCloseCount];
    *(float *)&double v6 = fmaxf(v5 + -1.0, 0.0);
    [(EREyeReliefEngine *)self setTooCloseCount:v6];
    [(EREyeReliefEngine *)self setInterventionType:0];
    uint64_t v7 = NSString;
    [(EREyeReliefEngine *)self tooCloseCount];
    float v9 = [v7 stringWithFormat:@"User moved device back, reduced count to %f", v8];
    +[ERLogging log:v9 withType:0];

    id v10 = [(EREyeReliefEngine *)self userDefaults];
    [(EREyeReliefEngine *)self tooCloseCount];
    objc_msgSend(v10, "setFloat:forKey:", @"TooCloseCount");
  }
}

- (void)processInactivity:(double)a3 forSamplingInterval:(double)a4
{
  [(id)objc_opt_class() _countReductionForInactiveTime:a3 forSamplingInterval:a4];
  float v7 = v6;
  float v8 = [NSString stringWithFormat:@"Sampling was inactive for %f, will reduce count by %f", *(void *)&a3, v6];
  +[ERLogging log:v8 withType:0];

  [(EREyeReliefEngine *)self tooCloseCount];
  *(float *)&double v10 = fmaxf(v9 - v7, 0.0);
  [(EREyeReliefEngine *)self setTooCloseCount:v10];
  [(EREyeReliefEngine *)self setInterventionType:0];
  id v11 = [(EREyeReliefEngine *)self userDefaults];
  [(EREyeReliefEngine *)self tooCloseCount];
  objc_msgSend(v11, "setFloat:forKey:", @"TooCloseCount");
}

- (void)takeDistanceSampleWithCompletion:(id)a3
{
  id v4 = a3;
  float v5 = (void *)os_transaction_create();
  objc_initWeak(&location, self);
  float v6 = [(EREyeReliefEngine *)self attentionAwarenessClient];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__EREyeReliefEngine_takeDistanceSampleWithCompletion___block_invoke;
  v16[3] = &unk_265303970;
  id v7 = v4;
  id v18 = v7;
  objc_copyWeak(&v19, &location);
  id v8 = v5;
  id v17 = v8;
  [v6 setInterruptHandler:v16];

  float v9 = [(EREyeReliefEngine *)self attentionAwarenessClient];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__EREyeReliefEngine_takeDistanceSampleWithCompletion___block_invoke_2;
  v12[3] = &unk_265303998;
  objc_copyWeak(&v15, &location);
  id v10 = v7;
  id v14 = v10;
  id v11 = v8;
  id v13 = v11;
  [v9 pollWithCompletion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __54__EREyeReliefEngine_takeDistanceSampleWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v1, 0, [WeakRetained interventionType]);
  }
}

void __54__EREyeReliefEngine_takeDistanceSampleWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _processDistanceEvent:v10];

  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  float v6 = [v5 userDefaults];
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  [v7 tooCloseCount];
  objc_msgSend(v6, "setFloat:forKey:", @"TooCloseCount");

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    id v9 = objc_loadWeakRetained(v3);
    (*(void (**)(uint64_t, id, uint64_t))(v8 + 16))(v8, v10, [v9 interventionType]);
  }
}

- (BOOL)invalidateWithError:(id *)a3
{
  id v4 = [(EREyeReliefEngine *)self attentionAwarenessClient];
  LOBYTE(a3) = [v4 invalidateWithError:a3];

  return (char)a3;
}

- (BOOL)cancelWithError:(id *)a3
{
  id v4 = [(EREyeReliefEngine *)self attentionAwarenessClient];
  LOBYTE(a3) = [v4 cancelWithError:a3];

  return (char)a3;
}

- (void)_processDistanceEvent:(id)a3
{
  id v4 = a3;
  id v5 = NSString;
  id v20 = v4;
  if (v4)
  {
    float v6 = [NSString stringWithFormat:@"Processing distance sample"];
    +[ERLogging log:v6 withType:0];

    [(EREyeReliefEngine *)self tooCloseCount];
    float v8 = v7;
    if ([v20 distanceCategory])
    {
      if ([v20 distanceCategory] == 1)
      {
        float v10 = v8 + -1.0;
LABEL_11:
        float v8 = fmaxf(v10, 0.0);
        goto LABEL_12;
      }
      if ([v20 distanceCategory] == 2)
      {
        float v10 = v8 - *(float *)&EREyeReliefCountReductionForUnknownDistance;
        goto LABEL_11;
      }
    }
    else if ((float)(v8 + 1.0) <= 4.0)
    {
      float v8 = v8 + 1.0;
    }
    else
    {
      float v8 = 4.0;
    }
LABEL_12:
    *(float *)&double v9 = v8;
    [(EREyeReliefEngine *)self setTooCloseCount:v9];
    id v13 = NSString;
    [(EREyeReliefEngine *)self tooCloseCount];
    id v15 = objc_msgSend(v13, "stringWithFormat:", @"Too close count: %f", v14);
    +[ERLogging log:v15 withType:0];

    [(EREyeReliefEngine *)self tooCloseCount];
    if (v16 >= 4.0)
    {
      id v19 = [NSString stringWithFormat:@"Shield intervention threshold reached"];
      +[ERLogging log:v19 withType:0];

      id v17 = self;
      uint64_t v18 = 1;
    }
    else
    {
      id v17 = self;
      uint64_t v18 = 0;
    }
    [(EREyeReliefEngine *)v17 setInterventionType:v18];
    goto LABEL_16;
  }
  [(EREyeReliefEngine *)self tooCloseCount];
  v12 = [v5 stringWithFormat:@"Distance sample was nil, will not process it. Count is still %f", v11];
  +[ERLogging log:v12 withType:0];

LABEL_16:
}

+ (float)_countReductionForInactiveTime:(double)a3 forSamplingInterval:(double)a4
{
  float result = 0.0;
  if (a3 >= a4)
  {
    float v6 = a3 / a4;
    float result = floorf(v6);
    if (result > 4.0) {
      return 4.0;
    }
  }
  return result;
}

- (int64_t)tooCloseDistanceThreshold
{
  return self->_tooCloseDistanceThreshold;
}

- (void)setTooCloseDistanceThreshold:(int64_t)a3
{
  self->_tooCloseDistanceThreshold = a3;
}

- (ERAttentionAwarenessClient)attentionAwarenessClient
{
  return (ERAttentionAwarenessClient *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttentionAwarenessClient:(id)a3
{
}

- (float)tooCloseCount
{
  return self->_tooCloseCount;
}

- (void)setTooCloseCount:(float)a3
{
  self->_tooCloseCount = a3;
}

- (int64_t)interventionType
{
  return self->_interventionType;
}

- (void)setInterventionType:(int64_t)a3
{
  self->_interventionType = a3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
}

@end