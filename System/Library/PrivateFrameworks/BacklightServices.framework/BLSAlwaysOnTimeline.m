@interface BLSAlwaysOnTimeline
+ (_NSRange)rangeOfEntries:(id)a3 forDateInterval:(id)a4 shouldIncludePrevious:(BOOL)a5;
+ (id)constructFrameSpecifiersForTimelines:(id)a3 dateInterval:(id)a4 shouldConstructStartSpecifier:(BOOL)a5 framesPerSecond:(double)a6 previousSpecifier:(id)a7;
+ (id)emptyTimelineWithIdentifier:(id)a3;
+ (id)everyMinuteTimelineWithIdentifier:(id)a3 configure:(id)a4;
+ (id)timelineWithEntries:(id)a3 identifier:(id)a4 configure:(id)a5;
+ (id)timelineWithPerMinuteUpdateFrequency:(int64_t)a3 identifier:(id)a4 configure:(id)a5;
+ (id)timelineWithUpdateInterval:(double)a3 startDate:(id)a4 identifier:(id)a5 configure:(id)a6;
+ (int64_t)requestedFidelityForTimelines:(id)a3 inDateInterval:(id)a4;
+ (void)entriesCombinerForTimelines:(char)a3@<W3> dateInterval:(void *)a4@<X4> shouldConstructStartSpecifier:(uint64_t)a5@<X8> framesPerSecond:(double)a6@<D0> previousSpecifier:;
- (BLSAlwaysOnTimeline)initWithIdentifier:(id)a3 configure:(id)a4;
- (NSObject)identifier;
- (id)configureEntries:(id)a3 previousEntry:(id)a4;
- (id)configureEntry:(id)a3 previousEntry:(id)a4;
- (id)description;
- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4;
- (int64_t)estimatedFidelityForPresentationTime:(id)a3 nextPresentationTime:(id)a4;
- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4;
- (void)entryBookkeepersForDateInterval:(char)a3@<W2> shouldConstructStartEntry:(void *)a4@<X3> framesPerSecond:(uint64_t *)a5@<X8> previousSpecifier:(double)a6@<D0>;
- (void)entryBookkeepersForDateInterval:shouldConstructStartEntry:framesPerSecond:previousSpecifier:;
@end

@implementation BLSAlwaysOnTimeline

- (BLSAlwaysOnTimeline)initWithIdentifier:(id)a3 configure:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLSAlwaysOnTimeline;
  v9 = [(BLSAlwaysOnTimeline *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    uint64_t v11 = [v8 copy];
    id configureEntryBlock = v10->_configureEntryBlock;
    v10->_id configureEntryBlock = (id)v11;
  }
  return v10;
}

+ (id)emptyTimelineWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[BLSAlwaysOnTimeline alloc] initWithIdentifier:v3 configure:0];

  return v4;
}

+ (id)timelineWithPerMinuteUpdateFrequency:(int64_t)a3 identifier:(id)a4 configure:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [[BLSAlwaysOnFrequencyPerMinuteTimeline alloc] initWithPerMinuteUpdateFrequency:a3 identifier:v7 configure:v8];

  return v9;
}

+ (id)everyMinuteTimelineWithIdentifier:(id)a3 configure:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[BLSAlwaysOnFrequencyPerMinuteTimeline alloc] initWithPerMinuteUpdateFrequency:1 identifier:v5 configure:v6];

  return v7;
}

+ (id)timelineWithUpdateInterval:(double)a3 startDate:(id)a4 identifier:(id)a5 configure:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [[BLSAlwaysOnPeriodicTimeline alloc] initWithUpdateInterval:v9 startDate:v10 identifier:v11 configure:a3];

  return v12;
}

+ (id)timelineWithEntries:(id)a3 identifier:(id)a4 configure:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[BLSAlwaysOnExplicitEntriesTimeline alloc] initWithEntries:v7 identifier:v8 configure:v9];

  return v10;
}

- (id)description
{
  id v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __34__BLSAlwaysOnTimeline_description__block_invoke;
  id v10 = &unk_1E6107450;
  id v4 = v3;
  id v11 = v4;
  v12 = self;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

id __34__BLSAlwaysOnTimeline_description__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"id"];
}

- (id)configureEntry:(id)a3 previousEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BLSAlwaysOnTimeline *)self identifier];
  if (!v8)
  {
    id v9 = bls_timelines_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BLSAlwaysOnTimeline configureEntry:previousEntry:]((uint64_t)self, v9);
    }
  }
  [v6 setTimelineIdentifier:v8];
  id configureEntryBlock = (void (**)(id, id, id))self->_configureEntryBlock;
  if (configureEntryBlock) {
    configureEntryBlock[2](configureEntryBlock, v6, v7);
  }
  id v11 = (void *)[v6 copy];

  return v11;
}

- (id)configureEntries:(id)a3 previousEntry:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      v13 = v7;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        -[BLSAlwaysOnTimeline configureEntry:previousEntry:](self, "configureEntry:previousEntry:", *(void *)(*((void *)&v16 + 1) + 8 * v12), v13, (void)v16);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v7];

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  objc_super v14 = (void *)[v8 copy];

  return v14;
}

+ (_NSRange)rangeOfEntries:(id)a3 forDateInterval:(id)a4 shouldIncludePrevious:(BOOL)a5
{
  BOOL v32 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v35 = a4;
  uint64_t v6 = [v34 count];
  uint64_t v7 = 0;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v34)
  {
    uint64_t v9 = v6;
    if (v6)
    {
      uint64_t v10 = [v35 startDate];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v11 = v34;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v12)
      {
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v41;
        while (2)
        {
          uint64_t v15 = 0;
          uint64_t v16 = v13 + v12;
          do
          {
            if (*(void *)v41 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v17 = [*(id *)(*((void *)&v40 + 1) + 8 * v15) presentationTime];
            uint64_t v18 = [v17 compare:v10];

            if (v18 != -1)
            {
              LODWORD(v19) = v32;
              if (!v18) {
                LODWORD(v19) = 0;
              }
              if (v13 + v15) {
                uint64_t v19 = v19;
              }
              else {
                uint64_t v19 = 0;
              }
              uint64_t v8 = v13 + v15 - v19;
              goto LABEL_18;
            }
            ++v15;
          }
          while (v12 != v15);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
          uint64_t v13 = v16;
          if (v12) {
            continue;
          }
          break;
        }
      }
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

      if (v32 && v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = v9 - 1;
        uint64_t v7 = 1;
      }
      else if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v7 = 0;
        uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v20 = [v35 endDate];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v21 = [v11 reverseObjectEnumerator];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
        uint64_t v7 = v9 - v8;
        if (v22)
        {
          uint64_t v23 = *(void *)v37;
          unint64_t v31 = v9 - v8;
          uint64_t v24 = v9 - v8;
          while (2)
          {
            uint64_t v25 = 0;
            uint64_t v33 = v24;
            uint64_t v7 = v24 - v22;
            do
            {
              if (*(void *)v37 != v23) {
                objc_enumerationMutation(v21);
              }
              v26 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v25), "presentationTime", v31);
              BOOL v27 = [v20 compare:v26] == -1;

              if (!v27)
              {
                if (v33 - v25 >= v31) {
                  uint64_t v28 = v33;
                }
                else {
                  uint64_t v28 = v33 + 1;
                }
                uint64_t v7 = v28 - v25;
                goto LABEL_36;
              }
              ++v25;
            }
            while (v22 != v25);
            uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
            uint64_t v24 = v7;
            if (v22) {
              continue;
            }
            break;
          }
        }
LABEL_36:
      }
    }
  }

  NSUInteger v29 = v8;
  NSUInteger v30 = v7;
  result.length = v30;
  result.location = v29;
  return result;
}

- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    int64_t v14 = 0;
  }
  else
  {
    uint64_t v9 = bls_timelines_log();
    uint64_t v10 = v9;
    if (-[BLSAlwaysOnTimeline requestedFidelityForStartEntryInDateInterval:withPreviousEntry:]::didFaultOnce) {
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    }
    else {
      os_log_type_t v11 = OS_LOG_TYPE_FAULT;
    }
    if (os_log_type_enabled(v9, v11))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      int v22 = 134218498;
      uint64_t v23 = self;
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      BOOL v27 = self;
      _os_log_impl(&dword_1B55DE000, v10, v11, "%p class:%{public}@ should override requestedFidelityForStartEntryInDateInterval:withPreviousEntry: to avoid brute force method for timeline:%{public}@", (uint8_t *)&v22, 0x20u);
    }
    -[BLSAlwaysOnTimeline requestedFidelityForStartEntryInDateInterval:withPreviousEntry:]::didFaultOnce = 1;
    if (v7)
    {
      int64_t v14 = [v7 requestedFidelity];
    }
    else
    {
      uint64_t v15 = [(BLSAlwaysOnTimeline *)self unconfiguredEntriesForDateInterval:v6 previousEntry:0];
      unint64_t v16 = [v15 count];
      if (v16)
      {
        long long v17 = [v15 firstObject];
        int64_t v14 = [v17 requestedFidelity];
        if (v14 == -1)
        {
          if (v16 < 2)
          {
            int64_t v14 = 0;
          }
          else
          {
            uint64_t v18 = [v15 objectAtIndexedSubscript:1];
            uint64_t v19 = [v17 presentationTime];
            v20 = [v18 presentationTime];
            int64_t v14 = [(BLSAlwaysOnTimeline *)self estimatedFidelityForPresentationTime:v19 nextPresentationTime:v20];
          }
        }
      }
      else
      {
        int64_t v14 = 0;
      }
    }
  }

  return v14;
}

- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4
{
  return 0;
}

- (int64_t)estimatedFidelityForPresentationTime:(id)a3 nextPresentationTime:(id)a4
{
  [a4 timeIntervalSinceDate:a3];
  int64_t result = +[BLSFidelityThreshold fidelityForUpdateInterval:](BLSFidelityThreshold, "fidelityForUpdateInterval:");
  if (result == 3) {
    return 2;
  }
  return result;
}

- (void)entryBookkeepersForDateInterval:(char)a3@<W2> shouldConstructStartEntry:(void *)a4@<X3> framesPerSecond:(uint64_t *)a5@<X8> previousSpecifier:(double)a6@<D0>
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v52 = a1;
  id v51 = a2;
  char v50 = a3;
  double v49 = a6;
  id v11 = a4;
  uint64_t v12 = v11;
  a5[1] = 0;
  a5[2] = 0;
  *a5 = 0;
  if (a1)
  {
    v47 = &v49;
    v48 = a5;
    if (v11)
    {
      uint64_t v13 = [a1 identifier];
      int64_t v14 = [v12 entrySpecifierForTimelineIdentifier:v13];
    }
    else
    {
      int64_t v14 = 0;
    }
    uint64_t v46 = [(BLSAlwaysOnTimelineEntrySpecifier *)v14 timelineEntry];
    uint64_t v15 = [v52 unconfiguredEntriesForDateInterval:v51 previousEntry:v46];
    unint64_t v16 = v15;
    if (!v46) {
      goto LABEL_9;
    }
    if (![v15 count]) {
      goto LABEL_9;
    }
    long long v17 = [v16 firstObject];
    uint64_t v18 = [v17 presentationTime];
    uint64_t v19 = [(BLSAlwaysOnTimelineEntry *)v46 presentationTime];
    int v20 = [v18 isEqualToDate:v19];

    if (v20)
    {
      uint64_t v21 = [(BLSAlwaysOnTimelineEntrySpecifier *)v14 previousTimelineEntry];
      int v22 = v46;
      uint64_t v46 = v21;

      BLSTimelineEntryBookkeeper::BLSTimelineEntryBookkeeper((BLSTimelineEntryBookkeeper *)&v53, v46, 0, *v47);
      std::vector<BLSTimelineEntryBookkeeper>::push_back[abi:ne180100](v48, (uint64_t)&v53);
    }
    else
    {
LABEL_9:
      if (v14)
      {
        BLSTimelineEntryBookkeeper::BLSTimelineEntryBookkeeper((BLSTimelineEntryBookkeeper *)&v53, v14);
      }
      else
      {
        memset(v55, 0, sizeof(v55));
        long long v53 = 0u;
        long long v54 = 0u;
      }
      unint64_t v23 = a5[1];
      if (v23 >= a5[2])
      {
        uint64_t v28 = std::vector<BLSTimelineEntryBookkeeper>::__push_back_slow_path<BLSTimelineEntryBookkeeper>(a5, &v53);
      }
      else
      {
        long long v24 = v53;
        long long v53 = 0u;
        *(_OWORD *)unint64_t v23 = v24;
        long long v25 = v54;
        long long v54 = 0u;
        *(_OWORD *)(v23 + 16) = v25;
        uint64_t v26 = *(void *)v55;
        *(void *)v55 = 0;
        *(void *)(v23 + 32) = v26;
        long long v27 = *(_OWORD *)&v55[8];
        *(_OWORD *)(v23 + 49) = *(_OWORD *)&v55[17];
        *(_OWORD *)(v23 + 40) = v27;
        uint64_t v28 = v23 + 72;
      }
      a5[1] = v28;
    }
    id v44 = 0;
    v45 = &v52;
    v42[0] = &v43;
    v42[1] = (void **)&v45;
    v42[2] = &v52;
    v42[3] = &v44;
    v42[4] = (void **)&v50;
    v42[5] = &v51;
    v42[6] = (void **)&v49;
    v42[7] = (void **)&v47;
    v42[8] = (void **)&v46;
    id v43 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v29 = v16;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v56 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(v29);
          }
          -[BLSAlwaysOnTimeline entryBookkeepersForDateInterval:shouldConstructStartEntry:framesPerSecond:previousSpecifier:]::$_2::operator()(v42, *(void **)(*((void *)&v38 + 1) + 8 * i));
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v56 count:16];
      }
      while (v30);
    }

    if (v43)
    {
      -[BLSAlwaysOnTimeline entryBookkeepersForDateInterval:shouldConstructStartEntry:framesPerSecond:previousSpecifier:]::$_2::operator()(v42, 0);
    }
    else if (v50)
    {
      uint64_t v33 = objc_msgSend(v52, "requestedFidelityForStartEntryInDateInterval:withPreviousEntry:", v51, v46, (void)v38);
      id v34 = v52;
      id v35 = [v51 startDate];
      long long v36 = +[BLSAlwaysOnTimelineUnconfiguredEntry entryForPresentationTime:v35 withRequestedFidelity:v33];
      long long v37 = [v34 configureEntry:v36 previousEntry:v46];

      BLSTimelineEntryBookkeeper::BLSTimelineEntryBookkeeper((BLSTimelineEntryBookkeeper *)&v53, v37, v46, *v47);
      std::vector<BLSTimelineEntryBookkeeper>::push_back[abi:ne180100](v48, (uint64_t)&v53);
    }
  }
}

- (void)entryBookkeepersForDateInterval:shouldConstructStartEntry:framesPerSecond:previousSpecifier:
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 requestedFidelity] == -1)
  {
    id v6 = **a1;
    id v7 = [v9 presentationTime];
    uint64_t v8 = v5[2](v5);
    objc_msgSend(v9, "setRequestedFidelity:", objc_msgSend(v6, "estimatedFidelityForPresentationTime:nextPresentationTime:", v7, v8));
  }
}

+ (void)entriesCombinerForTimelines:(char)a3@<W3> dateInterval:(void *)a4@<X4> shouldConstructStartSpecifier:(uint64_t)a5@<X8> framesPerSecond:(double)a6@<D0> previousSpecifier:
{
  v44[16] = *(void ***)MEMORY[0x1E4F143B8];
  id v29 = a1;
  id v11 = a2;
  id v12 = a4;
  self;
  id v13 = v11;
  int64_t v14 = v13;
  if (v12)
  {
    uint64_t v15 = objc_msgSend(v12, "presentationInterval", v11);
    unint64_t v16 = [v15 startDate];

    long long v17 = [v13 startDate];
    uint64_t v18 = [v17 compare:v16];

    int64_t v14 = v13;
    if (v18 == -1)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F28C18]);
      int v20 = [v13 endDate];
      uint64_t v21 = [v20 laterDate:v16];
      int64_t v14 = (void *)[v19 initWithStartDate:v16 endDate:v21];
    }
  }
  uint64_t v28 = a5;
  uint64_t v31 = 0;
  unint64_t v32 = 0;
  uint64_t v30 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v22 = v29;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(v22);
        }
        [(BLSAlwaysOnTimeline *)*(void **)(*((void *)&v39 + 1) + 8 * i) entryBookkeepersForDateInterval:a3 shouldConstructStartEntry:v12 framesPerSecond:(uint64_t *)&v33 previousSpecifier:a6];
        long long v36 = v33;
        uint64_t v37 = v34;
        uint64_t v34 = 0;
        long long v33 = 0uLL;
        uint64_t v38 = v36;
        uint64_t v26 = v31;
        if ((unint64_t)v31 >= v32)
        {
          uint64_t v27 = std::vector<BLSTimelineEntryIterator>::__push_back_slow_path<BLSTimelineEntryIterator>(&v30, (uint64_t)v35);
        }
        else
        {
          *uint64_t v31 = v35[0];
          v26[2] = 0;
          v26[3] = 0;
          v26[1] = 0;
          *(_OWORD *)(v26 + 1) = v36;
          v26[3] = v37;
          long long v36 = 0uLL;
          uint64_t v37 = 0;
          v26[4] = v38;
          uint64_t v27 = (uint64_t)(v26 + 5);
        }
        uint64_t v31 = (unsigned char *)v27;
        id v43 = (void **)&v36;
        std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&v43);
        id v43 = (void **)&v33;
        std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&v43);
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v23);
  }

  BLSTimelineEntriesCombiner::BLSTimelineEntriesCombiner(v28, (uint64_t)&v30, v14, a6);
  v44[0] = (void **)&v30;
  std::vector<BLSTimelineEntryIterator>::__destroy_vector::operator()[abi:ne180100](v44);
}

+ (id)constructFrameSpecifiersForTimelines:(id)a3 dateInterval:(id)a4 shouldConstructStartSpecifier:(BOOL)a5 framesPerSecond:(double)a6 previousSpecifier:(id)a7
{
  BOOL v9 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  int64_t v14 = bls_timelines_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = objc_msgSend(v11, "bls_boundedDescriptionWithMax:", 10);
    +[BLSAlwaysOnTimeline constructFrameSpecifiersForTimelines:dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:](v15, buf, v14);
  }

  if ([v11 count])
  {
    +[BLSAlwaysOnTimeline entriesCombinerForTimelines:dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:](v11, v12, v9, v13, (uint64_t)v26, a6);
    unint64_t v16 = BLSTimelineEntriesCombiner::constructFrameSpecifiers((BLSTimelineEntriesCombiner *)v26);

    id v29 = (void **)v26;
    std::vector<BLSTimelineEntryIterator>::__destroy_vector::operator()[abi:ne180100](&v29);
  }
  else if (v9)
  {
    long long v17 = [BLSAlwaysOnFrameSpecifier alloc];
    uint64_t v18 = [BLSAlwaysOnTimelineEntrySpecifier alloc];
    id v19 = [BLSAlwaysOnTimelineEntry alloc];
    int v20 = [v12 startDate];
    [v12 duration];
    uint64_t v21 = -[BLSAlwaysOnTimelineEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:](v19, "initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:", v20, 0, 0, 0, 0);
    id v22 = [(BLSAlwaysOnTimelineEntrySpecifier *)v18 initWithTimelineEntry:v21 percentComplete:0 previousTimelineEntry:1 didChange:1.0];
    uint64_t v30 = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    uint64_t v24 = [(BLSAlwaysOnFrameSpecifier *)v17 initWithTimelineEntrySpecifiers:v23 presentationInterval:v12];
    uint64_t v31 = v24;
    unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  }
  else
  {
    unint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

+ (int64_t)requestedFidelityForTimelines:(id)a3 inDateInterval:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v8)
  {

LABEL_13:
    int64_t v10 = 1;
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)v15;
  int64_t v10 = -1;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "requestedFidelityForStartEntryInDateInterval:withPreviousEntry:", v6, 0, (void)v14);
      if (v12 > v10) {
        int64_t v10 = v12;
      }
    }
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v8);

  if (v10 == -1) {
    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configureEntryBlock, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)configureEntry:(uint64_t)a1 previousEntry:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218242;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_FAULT, "%p nil identifier for timeline:%{public}@", (uint8_t *)&v2, 0x16u);
}

+ (void)constructFrameSpecifiersForTimelines:(os_log_t)log dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B55DE000, log, OS_LOG_TYPE_DEBUG, "constructFrameSpecifiersForTimelines:%{public}@", buf, 0xCu);
}

@end