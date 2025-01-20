@interface BLSAlwaysOnPeriodicTimeline
- (BLSAlwaysOnPeriodicTimeline)initWithUpdateInterval:(double)a3 startDate:(id)a4 identifier:(id)a5 configure:(id)a6;
- (id)description;
- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4;
- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4;
@end

@implementation BLSAlwaysOnPeriodicTimeline

- (BLSAlwaysOnPeriodicTimeline)initWithUpdateInterval:(double)a3 startDate:(id)a4 identifier:(id)a5 configure:(id)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BLSAlwaysOnPeriodicTimeline;
  v12 = [(BLSAlwaysOnTimeline *)&v15 initWithIdentifier:a5 configure:a6];
  v13 = v12;
  if (v12)
  {
    v12->_periodicInterval = a3;
    objc_storeStrong((id *)&v12->_periodicStart, a4);
  }

  return v13;
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __42__BLSAlwaysOnPeriodicTimeline_description__block_invoke;
  v10 = &unk_1E6107450;
  id v4 = v3;
  id v11 = v4;
  v12 = self;
  [v4 appendProem:self block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

id __42__BLSAlwaysOnPeriodicTimeline_description__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) identifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"id"];

  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "bls_shortLoggingString");
  id v7 = (id)[v5 appendObject:v6 withName:@"start"];

  return (id)[*(id *)(a1 + 32) appendDouble:@"period" withName:4 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 24)];
}

- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4
{
  if (self) {
    return +[BLSFidelityThreshold fidelityForUpdateInterval:](BLSFidelityThreshold, "fidelityForUpdateInterval:", a3, a4, *(double *)(self + 24));
  }
  return self;
}

- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_periodicStart;
  if (!v8)
  {
    v17 = 0;
    goto LABEL_15;
  }
  v9 = [v6 startDate];
  if (v7)
  {
    v10 = [v7 presentationTime];
    uint64_t v11 = [v9 laterDate:v10];

    v9 = (void *)v11;
  }
  v12 = [v6 endDate];
  [v9 timeIntervalSinceDate:v8];
  double periodicInterval = self->_periodicInterval;
  if (v13 > periodicInterval)
  {
    id v29 = v7;
    unint64_t v15 = (unint64_t)(v13 / periodicInterval);
    double v16 = self->_periodicInterval;
    goto LABEL_9;
  }
  if ([v12 compare:v8] != -1)
  {
    id v29 = v7;
    unint64_t v15 = 0;
    double v16 = self->_periodicInterval;
LABEL_9:
    uint64_t v18 = +[BLSFidelityThreshold fidelityForUpdateInterval:v16];
    v17 = [MEMORY[0x1E4F1CA48] array];
    do
    {
      v19 = [(NSDate *)v8 dateByAddingTimeInterval:periodicInterval * (double)v15];
      v20 = +[BLSAlwaysOnTimelineUnconfiguredEntry entryForPresentationTime:v19 withRequestedFidelity:v18];
      [v17 addObject:v20];

      uint64_t v21 = [v19 compare:v12];
      ++v15;
    }
    while (v21 != 1);
    v22 = bls_timelines_log();
    id v7 = v29;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v27 = [(BLSAlwaysOnTimeline *)self identifier];
      int v26 = [v17 count];
      NSStringFromBLSUpdateFidelity(v18);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v6, "bls_shortLoggingString");
      v25 = objc_msgSend(v17, "bls_boundedDescriptionWithMax:transformer:", 8, &__block_literal_global_79);
      *(_DWORD *)buf = 134219522;
      v31 = self;
      __int16 v32 = 2114;
      id v33 = v27;
      __int16 v34 = 1024;
      int v35 = v26;
      __int16 v36 = 2112;
      id v37 = v24;
      __int16 v38 = 2048;
      double v39 = periodicInterval;
      __int16 v40 = 2114;
      v41 = v28;
      __int16 v42 = 2112;
      v43 = v25;
      _os_log_debug_impl(&dword_1B55DE000, v22, OS_LOG_TYPE_DEBUG, "%p:%{public}@ -> %d entries(%@) @ %lfs for %{public}@ : %@", buf, 0x44u);
    }
    goto LABEL_14;
  }
  v17 = 0;
LABEL_14:

LABEL_15:

  return v17;
}

id __80__BLSAlwaysOnPeriodicTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 presentationTime];
  v3 = objc_msgSend(v2, "bls_shortLoggingString");

  return v3;
}

- (void).cxx_destruct
{
}

@end