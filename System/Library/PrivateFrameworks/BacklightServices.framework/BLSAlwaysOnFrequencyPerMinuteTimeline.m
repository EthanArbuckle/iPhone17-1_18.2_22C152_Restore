@interface BLSAlwaysOnFrequencyPerMinuteTimeline
- (BLSAlwaysOnFrequencyPerMinuteTimeline)initWithPerMinuteUpdateFrequency:(int64_t)a3 identifier:(id)a4 configure:(id)a5;
- (id)description;
- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4;
- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4;
@end

@implementation BLSAlwaysOnFrequencyPerMinuteTimeline

- (BLSAlwaysOnFrequencyPerMinuteTimeline)initWithPerMinuteUpdateFrequency:(int64_t)a3 identifier:(id)a4 configure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSAlwaysOnFrequencyPerMinuteTimeline;
  v10 = [(BLSAlwaysOnTimeline *)&v15 initWithIdentifier:v8 configure:v9];
  if (v10)
  {
    if (a3 <= 0)
    {
      v11 = bls_timelines_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BLSAlwaysOnFrequencyPerMinuteTimeline initWithPerMinuteUpdateFrequency:identifier:configure:](a3, (uint64_t)v8, v11);
      }

      a3 = 1;
    }
    v10->_frequencyPerMinute = a3;
    uint64_t v12 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    calendar = v10->_calendar;
    v10->_calendar = (NSCalendar *)v12;
  }
  return v10;
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __52__BLSAlwaysOnFrequencyPerMinuteTimeline_description__block_invoke;
  v10 = &unk_1E6107450;
  id v4 = v3;
  id v11 = v4;
  uint64_t v12 = self;
  [v4 appendProem:self block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

id __52__BLSAlwaysOnFrequencyPerMinuteTimeline_description__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) identifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"id"];

  return (id)[*(id *)(a1 + 32) appendDouble:@"freq" withName:4 decimalPrecision:(double)*(uint64_t *)(*(void *)(a1 + 40) + 32)];
}

- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4
{
  if (self) {
    return +[BLSFidelityThreshold fidelityForUpdateInterval:](BLSFidelityThreshold, "fidelityForUpdateInterval:", a3, a4, 60.0 / (double)*(uint64_t *)(self + 32));
  }
  return self;
}

- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v38 = a4;
  v6 = [v42 startDate];
  uint64_t v7 = [v38 presentationTime];
  v39 = v7;
  if (v7 && [v6 compare:v7] != 1)
  {
    id v9 = v7;

    char v8 = 1;
    v6 = v9;
  }
  else
  {
    char v8 = 0;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  v41 = v10;
  [v10 setSecond:0];
  id v11 = [(NSCalendar *)self->_calendar components:32896 fromDate:v6];
  v37 = v11;
  if ([v11 second]) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = [v11 nanosecond] == 0;
  }
  v40 = [MEMORY[0x1E4F1CA48] array];
  if (v12)
  {
    id v13 = v6;
  }
  else
  {
    id v13 = [(NSCalendar *)self->_calendar nextDateAfterDate:v6 matchingComponents:v10 options:5124];
  }
  v14 = v13;
  objc_super v15 = self->_calendar;
  int64_t frequencyPerMinute = self->_frequencyPerMinute;
  v17 = [v42 endDate];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke;
  v49[3] = &unk_1E6107478;
  int64_t v55 = frequencyPerMinute;
  v18 = v15;
  v50 = v18;
  id v19 = v14;
  id v51 = v19;
  id v20 = v6;
  id v52 = v20;
  char v56 = v8;
  id v21 = v40;
  id v53 = v21;
  id v36 = v17;
  id v54 = v36;
  v22 = (void (**)(void, void, void))MEMORY[0x1BA99C630](v49);
  char v48 = 0;
  ((void (**)(void, id, char *))v22)[2](v22, v19, &v48);
  if (!v48)
  {
    calendar = self->_calendar;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_2;
    v46[3] = &unk_1E61074A0;
    v47 = v22;
    [(NSCalendar *)calendar enumerateDatesStartingAfterDate:v19 matchingComponents:v10 options:5120 usingBlock:v46];
  }
  unint64_t v24 = [v21 count];
  if (v24 >= 2)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_3;
    v44[3] = &unk_1E61074C8;
    id v45 = v20;
    unint64_t v25 = [v21 indexOfObjectPassingTest:v44];
    if (v25 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v24 = v25, v25 > 1)) {
      objc_msgSend(v21, "removeObjectsInRange:", 0, v24 - 1);
    }
  }
  uint64_t v26 = +[BLSFidelityThreshold fidelityForUpdateInterval:60.0 / (double)self->_frequencyPerMinute];
  v27 = bls_timelines_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    id v35 = [(BLSAlwaysOnTimeline *)self identifier];
    int v32 = [v21 count];
    NSStringFromBLSUpdateFidelity(v26);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v42, "bls_shortLoggingString");
    uint64_t v30 = objc_msgSend(v21, "bls_boundedDescriptionWithMax:transformer:", 8, &__block_literal_global_5);
    *(_DWORD *)buf = 134219522;
    v58 = self;
    __int16 v59 = 2114;
    id v60 = v35;
    __int16 v61 = 1024;
    int v62 = v32;
    __int16 v63 = 2112;
    id v64 = v34;
    __int16 v65 = 1024;
    int v66 = frequencyPerMinute;
    __int16 v67 = 2114;
    v68 = v31;
    __int16 v69 = 2112;
    v33 = (void *)v30;
    uint64_t v70 = v30;
    _os_log_debug_impl(&dword_1B55DE000, v27, OS_LOG_TYPE_DEBUG, "%p:%{public}@ -> %d entries(%@) @ %d/m for %{public}@ : %@", buf, 0x40u);
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_59;
  v43[3] = &__block_descriptor_40_e16__16__0__NSDate_8l;
  v43[4] = v26;
  v28 = objc_msgSend(v21, "bs_map:", v43);

  return v28;
}

void __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)(a1 + 72);
  id v13 = v5;
  id v8 = v5;
  while (1)
  {
    id v9 = [*(id *)(a1 + 32) dateByAddingUnit:128 value:(uint64_t)((double)++v6 * (60.0 / (double)v7) + 0.5) toDate:v13 options:0];
    if (*(id *)(a1 + 40) != v13
      || ((uint64_t v10 = [*(id *)(a1 + 48) compare:v9], *(unsigned char *)(a1 + 80))
        ? (BOOL v11 = v10 == -1)
        : (BOOL v11 = v10 != 1),
          v11))
    {
      [*(id *)(a1 + 56) addObject:v8];
    }
    id v12 = v9;

    if ([v12 compare:*(void *)(a1 + 64)] == 1) {
      break;
    }

    uint64_t v7 = *(void *)(a1 + 72);
    id v8 = v12;
    if (v6 >= v7) {
      goto LABEL_12;
    }
  }
  *a3 = 1;

LABEL_12:
}

uint64_t __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 compare:*(void *)(a1 + 32)] != -1;
}

id __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "bls_shortLoggingString");

  return v2;
}

id __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_59(uint64_t a1, uint64_t a2)
{
  v2 = +[BLSAlwaysOnTimelineUnconfiguredEntry entryForPresentationTime:a2 withRequestedFidelity:*(void *)(a1 + 32)];

  return v2;
}

- (void).cxx_destruct
{
}

- (void)initWithPerMinuteUpdateFrequency:(int)a1 identifier:(uint64_t)a2 configure:(os_log_t)log .cold.1(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_fault_impl(&dword_1B55DE000, log, OS_LOG_TYPE_FAULT, "frequency:%d for identifier:%@ must be > 0, using 1 instead", (uint8_t *)v3, 0x12u);
}

@end