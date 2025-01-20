@interface IMDSpotlightIndexerTimingProfiler
- (IMTimingCollection)timingCollection;
- (NSArray)abortedTimers;
- (NSMutableArray)runTimers;
- (NSMutableSet)runningTimers;
- (double)timeout;
- (void)abortCurrentTimers;
- (void)logResults:(BOOL)a3;
- (void)setAbortedTimers:(id)a3;
- (void)setRunTimers:(id)a3;
- (void)setRunningTimers:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimingCollection:(id)a3;
- (void)startMainTimerWithExpectedTimeoutInterval:(double)a3;
- (void)startTimingForKey:(id)a3;
- (void)startTimingForKey:(id)a3 iteration:(int64_t)a4;
- (void)stopMainTimerAndLogAfterFailure;
- (void)stopMainTimerAndLogAfterSuccess;
- (void)stopProfilingAfterIndexersBailed;
- (void)stopTimingForKey:(id)a3;
- (void)stopTimingForKey:(id)a3 iteration:(int64_t)a4;
@end

@implementation IMDSpotlightIndexerTimingProfiler

- (void)startMainTimerWithExpectedTimeoutInterval:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(IMDSpotlightIndexerTimingProfiler *)self setTimeout:a3];
  if (self->_timingCollection)
  {
    v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AD2C();
    }
  }
  else
  {
    v5 = (IMTimingCollection *)objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    timingCollection = self->_timingCollection;
    self->_timingCollection = v5;

    v7 = [MEMORY[0x1E4F1CA80] set];
    runningTimers = self->_runningTimers;
    self->_runningTimers = v7;

    v9 = [MEMORY[0x1E4F1CA48] array];
    runTimers = self->_runTimers;
    self->_runTimers = v9;

    abortedTimers = self->_abortedTimers;
    self->_abortedTimers = 0;

    v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      [(IMDSpotlightIndexerTimingProfiler *)self timeout];
      int v14 = 134217984;
      uint64_t v15 = (uint64_t)v13;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Starting profiling -- we have %ld seconds to finish", (uint8_t *)&v14, 0xCu);
    }

    [(IMTimingCollection *)self->_timingCollection startTimingForKey:@"All Indexers"];
  }
}

- (void)startTimingForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_timingCollection)
    {
      if (![(NSMutableSet *)self->_runningTimers containsObject:v4])
      {
        [(NSMutableSet *)self->_runningTimers addObject:v4];
        [(NSMutableArray *)self->_runTimers addObject:v4];
        [(IMTimingCollection *)self->_timingCollection startTimingForKey:v4];
        goto LABEL_11;
      }
      v5 = IMLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1AFC6ADFC();
      }
    }
    else
    {
      v5 = IMLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1AFC6AD94();
      }
    }
  }
  else
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AD60();
    }
  }

LABEL_11:
}

- (void)startTimingForKey:(id)a3 iteration:(int64_t)a4
{
  if (a3)
  {
    id v6 = [NSString stringWithFormat:@"%@-%ld", a3, a4];
    [(IMDSpotlightIndexerTimingProfiler *)self startTimingForKey:v6];
  }
  else
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AD60();
    }
  }
}

- (void)stopTimingForKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AD60();
    }
    goto LABEL_11;
  }
  if (!self->_timingCollection)
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AE64();
    }
    goto LABEL_11;
  }
  if (![(NSMutableSet *)self->_runningTimers containsObject:v4])
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AECC();
    }
LABEL_11:

    goto LABEL_12;
  }
  [(IMTimingCollection *)self->_timingCollection stopTimingForKey:v4];
  [(NSMutableSet *)self->_runningTimers removeObject:v4];
LABEL_12:
}

- (void)stopTimingForKey:(id)a3 iteration:(int64_t)a4
{
  if (a3)
  {
    id v6 = [NSString stringWithFormat:@"%@-%ld", a3, a4];
    [(IMDSpotlightIndexerTimingProfiler *)self stopTimingForKey:v6];
  }
  else
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AD60();
    }
  }
}

- (void)logResults:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v5 = self->_runTimers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (!v6)
  {
    v9 = 0;
    double v11 = 0.0;
    goto LABEL_29;
  }
  uint64_t v8 = v6;
  v9 = 0;
  uint64_t v10 = *(void *)v38;
  double v11 = 0.0;
  *(void *)&long long v7 = 138412290;
  long long v36 = v7;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v38 != v10) {
        objc_enumerationMutation(v5);
      }
      double v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
      -[IMTimingCollection totalTimeForKey:](self->_timingCollection, "totalTimeForKey:", v13, v36);
      double v15 = v14;
      if (v14 > v11)
      {
        id v16 = v13;

        double v11 = v15;
        v9 = v16;
      }
      abortedTimers = self->_abortedTimers;
      if (abortedTimers && [(NSArray *)abortedTimers containsObject:v13])
      {
        v18 = IMLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = (uint64_t)v13;
          __int16 v43 = 2048;
          double v44 = v15;
          v19 = v18;
          v20 = "Timing '%@' was ABORTED after %fs";
          uint32_t v21 = 22;
LABEL_25:
          _os_log_error_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_ERROR, v20, buf, v21);
        }
      }
      else
      {
        if (v15 == 0.0 && v3)
        {
          v18 = IMLogHandleForCategory();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = v36;
          uint64_t v42 = (uint64_t)v13;
          v19 = v18;
          v20 = "Timing '%@' was never run";
          uint32_t v21 = 12;
          goto LABEL_25;
        }
        if (!v3) {
          goto LABEL_22;
        }
        v18 = IMLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = (uint64_t)v13;
          __int16 v43 = 2048;
          double v44 = v15;
          _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Timing '%@' ran ok in %fs", buf, 0x16u);
        }
      }
LABEL_21:

LABEL_22:
      ++v12;
    }
    while (v8 != v12);
    uint64_t v24 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v51 count:16];
    uint64_t v8 = v24;
  }
  while (v24);
LABEL_29:

  [(IMTimingCollection *)self->_timingCollection totalTimeForKey:@"All Indexers"];
  double v26 = v25;
  v27 = self->_abortedTimers;
  if (v27 && [(NSArray *)v27 count])
  {
    v28 = IMLogHandleForCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [(NSMutableArray *)self->_runTimers count];
      [(IMDSpotlightIndexerTimingProfiler *)self timeout];
      *(_DWORD *)buf = 134218496;
      uint64_t v42 = v29;
      __int16 v43 = 2048;
      double v44 = v26;
      __int16 v45 = 2048;
      double v46 = v30 - v26;
      _os_log_error_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_ERROR, "ABORTED -- %ld timings ran in %fs (%fs remaining before timeout).", buf, 0x20u);
    }
  }
  else
  {
    v28 = IMLogHandleForCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = [(NSMutableArray *)self->_runTimers count];
      [(IMDSpotlightIndexerTimingProfiler *)self timeout];
      *(_DWORD *)buf = 134219010;
      uint64_t v42 = v31;
      __int16 v43 = 2048;
      double v44 = v26;
      __int16 v45 = 2048;
      double v46 = v32 - v26;
      __int16 v47 = 2112;
      v48 = v9;
      __int16 v49 = 2048;
      double v50 = v11;
      _os_log_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_INFO, "Finished %ld timings in %fs (%fs remaining before timeout). Slowest timing: %@ at %fs", buf, 0x34u);
    }
  }

  runningTimers = self->_runningTimers;
  self->_runningTimers = 0;

  v34 = self->_abortedTimers;
  self->_abortedTimers = 0;

  runTimers = self->_runTimers;
  self->_runTimers = 0;
}

- (void)stopProfilingAfterIndexersBailed
{
  if (self->_timingCollection)
  {
    runningTimers = self->_runningTimers;
    self->_runningTimers = 0;

    abortedTimers = self->_abortedTimers;
    self->_abortedTimers = 0;

    runTimers = self->_runTimers;
    self->_runTimers = 0;

    timingCollection = self->_timingCollection;
    self->_timingCollection = 0;

    long long v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Bailed on profiling (not an error)", v8, 2u);
    }
  }
  else
  {
    long long v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AF34();
    }
  }
}

- (void)abortCurrentTimers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_runningTimers)
  {
    [(IMTimingCollection *)self->_timingCollection stopTimingForKey:@"All Indexers"];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v3 = self->_runningTimers;
    uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          -[IMTimingCollection stopTimingForKey:](self->_timingCollection, "stopTimingForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v7++), (void)v11);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    uint64_t v8 = [(NSMutableSet *)self->_runningTimers allObjects];
    abortedTimers = self->_abortedTimers;
    self->_abortedTimers = v8;

    runningTimers = self->_runningTimers;
    self->_runningTimers = 0;
  }
}

- (void)stopMainTimerAndLogAfterFailure
{
  if (self->_timingCollection)
  {
    [(IMDSpotlightIndexerTimingProfiler *)self abortCurrentTimers];
    BOOL v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AF9C();
    }

    [(IMDSpotlightIndexerTimingProfiler *)self logResults:1];
  }
  else
  {
    uint64_t v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AF68();
    }
  }
}

- (void)stopMainTimerAndLogAfterSuccess
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  timingCollection = self->_timingCollection;
  if (timingCollection)
  {
    [(IMTimingCollection *)timingCollection stopTimingForKey:@"All Indexers"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = self->_runningTimers;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
          uint64_t v10 = IMLogHandleForCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v18 = v9;
            _os_log_error_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_ERROR, "Timing '%@' was still running after profiler was stopped", buf, 0xCu);
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v6);
    }

    runningTimers = self->_runningTimers;
    self->_runningTimers = 0;

    [(IMDSpotlightIndexerTimingProfiler *)self logResults:0];
  }
  else
  {
    long long v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6AF68();
    }
  }
}

- (IMTimingCollection)timingCollection
{
  return self->_timingCollection;
}

- (void)setTimingCollection:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSMutableSet)runningTimers
{
  return self->_runningTimers;
}

- (void)setRunningTimers:(id)a3
{
}

- (NSMutableArray)runTimers
{
  return self->_runTimers;
}

- (void)setRunTimers:(id)a3
{
}

- (NSArray)abortedTimers
{
  return self->_abortedTimers;
}

- (void)setAbortedTimers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abortedTimers, 0);
  objc_storeStrong((id *)&self->_runTimers, 0);
  objc_storeStrong((id *)&self->_runningTimers, 0);
  objc_storeStrong((id *)&self->_timingCollection, 0);
}

@end