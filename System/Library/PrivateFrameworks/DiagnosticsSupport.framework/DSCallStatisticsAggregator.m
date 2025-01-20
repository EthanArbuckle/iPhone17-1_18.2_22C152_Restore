@interface DSCallStatisticsAggregator
- (BOOL)_isDateInRange:(id)a3;
- (BOOL)futureDateDetected;
- (BOOL)generationComplete;
- (BOOL)isCancelled;
- (BOOL)outOfOrderDateDetected;
- (DSCallStatisticsAggregator)init;
- (NSCondition)generationLock;
- (NSDate)referenceDate;
- (NSMutableArray)callLog;
- (id)_getAndValidateDateFromLogLine:(id)a3;
- (id)getSynchronousResult;
- (int64_t)_getDaysBetween:(id)a3 and:(id)a4;
- (int64_t)missingDaysRemaining;
- (void)_fillCallLogWithMissingDays:(int64_t)a3 fromDate:(id)a4;
- (void)_flushAccumulatedLogDataWithDate:(id)a3;
- (void)_resetAccumulator;
- (void)beginAggregation;
- (void)cancel;
- (void)setCallLog:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setFutureDateDetected:(BOOL)a3;
- (void)setGenerationComplete:(BOOL)a3;
- (void)setGenerationLock:(id)a3;
- (void)setMissingDaysRemaining:(int64_t)a3;
- (void)setOutOfOrderDateDetected:(BOOL)a3;
@end

@implementation DSCallStatisticsAggregator

- (DSCallStatisticsAggregator)init
{
  if (+[DSEntitlementUtilities currentProcessHasEntitlement:@"com.apple.DiagnosticsSupport.CallStatsAccess"])
  {
    v13.receiver = self;
    v13.super_class = (Class)DSCallStatisticsAggregator;
    v3 = [(DSCallStatisticsAggregator *)&v13 init];
    v4 = v3;
    if (v3)
    {
      *(_WORD *)&v3->_futureDateDetected = 0;
      uint64_t v5 = [MEMORY[0x263EFF910] date];
      referenceDate = v4->_referenceDate;
      v4->_referenceDate = (NSDate *)v5;

      uint64_t v7 = objc_opt_new();
      generationLock = v4->_generationLock;
      v4->_generationLock = (NSCondition *)v7;

      v4->_generationComplete = 0;
      uint64_t v9 = [MEMORY[0x263EFF980] arrayWithCapacity:14];
      callLog = v4->_callLog;
      v4->_callLog = (NSMutableArray *)v9;

      v4->_missingDaysRemaining = 14;
      *(void *)&v4->_totals.droppedCallCount = 0;
      *(void *)&v4->_totals.droppedVoLTECallCount = 0;
      v4->_totals.deviceDroppedCallCount = 0;
      *(void *)&v4->_accumulated.droppedVoLTECallCount = 0;
      *(void *)&v4->_accumulated.droppedCallCount = 0;
      v4->_accumulated.deviceDroppedCallCount = 0;
    }
    self = v4;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)beginAggregation
{
  v3 = [(DSCallStatisticsAggregator *)self generationLock];
  [v3 lock];

  [(DSCallStatisticsAggregator *)self setGenerationComplete:0];
  v4 = [(DSCallStatisticsAggregator *)self generationLock];
  [v4 unlock];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v5 = [[DSGeneralLogCollector alloc] initWithLogIDs:&unk_26E030720];
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __46__DSCallStatisticsAggregator_beginAggregation__block_invoke;
  v12 = &unk_264930AE8;
  objc_super v13 = self;
  v14 = &v17;
  objc_copyWeak(&v15, &location);
  [(DSGeneralLogCollector *)v5 enumerateLogLinesWithBlock:&v9];
  -[DSCallStatisticsAggregator _flushAccumulatedLogDataWithDate:](self, "_flushAccumulatedLogDataWithDate:", v18[5], v9, v10, v11, v12, v13, v14);
  v6 = [(DSCallStatisticsAggregator *)self generationLock];
  [v6 lock];

  [(DSCallStatisticsAggregator *)self setGenerationComplete:1];
  uint64_t v7 = [(DSCallStatisticsAggregator *)self generationLock];
  [v7 signal];

  v8 = [(DSCallStatisticsAggregator *)self generationLock];
  [v8 unlock];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v17, 8);
}

uint64_t __46__DSCallStatisticsAggregator_beginAggregation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) isCancelled];
  if (v4)
  {
    uint64_t v5 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) _getAndValidateDateFromLogLine:v3];
    if (v5)
    {
      uint64_t v13 = [*(id *)(a1 + 32) _getDaysBetween:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) and:v5];
      if (v13 < 0)
      {
        [*(id *)(a1 + 32) setOutOfOrderDateDetected:1];
        uint64_t WeakRetained = DiagnosticLogHandleForCategory(3);
        if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR)) {
          __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_3(WeakRetained, v27, v28, v29, v30, v31, v32, v33);
        }
      }
      else
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v16 = DiagnosticLogHandleForCategory(3);
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if (v14) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = v15 == 0;
        }
        if (v18)
        {
          if (v17)
          {
            int v35 = 134217984;
            uint64_t v36 = v14;
            _os_log_impl(&dword_22CA94000, v16, OS_LOG_TYPE_DEFAULT, "date change, flushing new log entry; daysElapsed=%ld",
              (uint8_t *)&v35,
              0xCu);
          }

          [*(id *)(a1 + 32) _flushAccumulatedLogDataWithDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
          [*(id *)(a1 + 32) _fillCallLogWithMissingDays:v14 - 1 fromDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        }
        else
        {
          if (v17)
          {
            LOWORD(v35) = 0;
            _os_log_impl(&dword_22CA94000, v16, OS_LOG_TYPE_DEFAULT, "new log line contains the same date as a previous one, accumulating", (uint8_t *)&v35, 2u);
          }
        }
        uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 48));
        if (WeakRetained)
        {
          *(_DWORD *)(WeakRetained + 28) += [v3 integerFromFieldAtIndex:12];
          *(_DWORD *)(WeakRetained + 32) += [v3 integerFromFieldAtIndex:14];
          *(_DWORD *)(WeakRetained + 36) += [v3 integerFromFieldAtIndex:15];
          *(_DWORD *)(WeakRetained + 40) += [v3 integerFromFieldAtIndex:4];
          *(_DWORD *)(WeakRetained + 44) += [v3 integerFromFieldAtIndex:5];
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
      }
    }
    else
    {
      uint64_t WeakRetained = DiagnosticLogHandleForCategory(3);
      if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR)) {
        __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_2(WeakRetained, v20, v21, v22, v23, v24, v25, v26);
      }
    }
  }
  return v4;
}

- (void)cancel
{
}

- (id)getSynchronousResult
{
  v18[7] = *MEMORY[0x263EF8340];
  id v3 = [(DSCallStatisticsAggregator *)self generationLock];
  [v3 lock];

  if (![(DSCallStatisticsAggregator *)self generationComplete])
  {
    do
    {
      uint64_t v4 = [(DSCallStatisticsAggregator *)self generationLock];
      [v4 wait];
    }
    while (![(DSCallStatisticsAggregator *)self generationComplete]);
  }
  uint64_t v5 = [(DSCallStatisticsAggregator *)self generationLock];
  [v5 unlock];

  if ([(DSCallStatisticsAggregator *)self isCancelled])
  {
    uint64_t v6 = 0;
  }
  else
  {
    v17[0] = @"futureDateDetected";
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[DSCallStatisticsAggregator futureDateDetected](self, "futureDateDetected"));
    v18[0] = v7;
    v17[1] = @"outOfOrderDateDetected";
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[DSCallStatisticsAggregator outOfOrderDateDetected](self, "outOfOrderDateDetected"));
    v18[1] = v8;
    v17[2] = @"totalLoggedDayCount";
    uint64_t v9 = NSNumber;
    uint64_t v10 = [(DSCallStatisticsAggregator *)self callLog];
    uint64_t v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v18[2] = v11;
    v17[3] = @"totalPlacedCallCount";
    uint64_t v12 = [NSNumber numberWithInt:self->_totals.placedCallCount];
    v18[3] = v12;
    v17[4] = @"totalDroppedCallCount";
    uint64_t v13 = [NSNumber numberWithInt:self->_totals.droppedCallCount];
    v18[4] = v13;
    v17[5] = @"totalDeviceDroppedCallCount";
    uint64_t v14 = [NSNumber numberWithInt:self->_totals.deviceDroppedCallCount];
    v18[5] = v14;
    v17[6] = @"callLog";
    uint64_t v15 = [(DSCallStatisticsAggregator *)self callLog];
    v18[6] = v15;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:7];
  }
  return v6;
}

- (BOOL)_isDateInRange:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DSCallStatisticsAggregator *)self referenceDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  uint64_t v8 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = v7;
    _os_log_impl(&dword_22CA94000, v8, OS_LOG_TYPE_DEFAULT, "interval since now: %f", (uint8_t *)&v10, 0xCu);
  }

  if (v7 <= 86400.0) {
    return v7 > -1209600.0;
  }
  [(DSCallStatisticsAggregator *)self setFutureDateDetected:1];
  return 0;
}

- (id)_getAndValidateDateFromLogLine:(id)a3
{
  id v4 = [a3 stringFromFieldAtIndex:10];
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = +[DSDateFormatter sharedFormatter];
  double v6 = [v5 formatterWithType:3];
  double v7 = [v6 dateFromString:v4];

  if (v7 && ![(DSCallStatisticsAggregator *)self _isDateInRange:v7])
  {

LABEL_5:
    double v7 = 0;
  }

  return v7;
}

- (void)_resetAccumulator
{
  *(void *)&self->_accumulated.droppedVoLTECallCount = 0;
  *(void *)&self->_accumulated.droppedCallCount = 0;
  self->_accumulated.deviceDroppedCallCount = 0;
}

- (void)_fillCallLogWithMissingDays:(int64_t)a3 fromDate:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int64_t v7 = [(DSCallStatisticsAggregator *)self missingDaysRemaining];
  if (v7 >= a3) {
    int64_t v8 = a3;
  }
  else {
    int64_t v8 = v7;
  }
  uint64_t v9 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_22CA94000, v9, OS_LOG_TYPE_DEFAULT, "filling call log with empty data for %ld days starting from [%@]", buf, 0x16u);
  }

  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      double v11 = [v6 dateByAddingTimeInterval:(double)++v10 * 86400.0];
      uint64_t v12 = +[DSDateFormatter sharedFormatter];
      uint64_t v13 = [v12 formatterWithType:4];
      uint64_t v14 = [v13 stringFromDate:v11];

      if (v14)
      {
        v17[0] = @"date";
        v17[1] = @"placedCallCount";
        v18[0] = v14;
        v18[1] = &unk_26E0306E0;
        v17[2] = @"droppedCallCount";
        v17[3] = @"deviceDroppedCallCount";
        v18[2] = &unk_26E0306E0;
        v18[3] = &unk_26E0306E0;
        v17[4] = @"droppedWiFiCallCount";
        v17[5] = @"droppedVoLTECallCount";
        v18[4] = &unk_26E0306E0;
        v18[5] = &unk_26E0306E0;
        uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:6];
        v16 = [(DSCallStatisticsAggregator *)self callLog];
        [v16 addObject:v15];
      }
    }
    while (v8 != v10);
  }
  [(DSCallStatisticsAggregator *)self setMissingDaysRemaining:[(DSCallStatisticsAggregator *)self missingDaysRemaining] - v8];
}

- (int64_t)_getDaysBetween:(id)a3 and:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = v6;
  int64_t v8 = 0;
  if (v5 && v6)
  {
    [v6 timeIntervalSinceDate:v5];
    int64_t v8 = (uint64_t)(v9 / 86400.0);
  }
  uint64_t v10 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    int64_t v17 = v8;
    _os_log_impl(&dword_22CA94000, v10, OS_LOG_TYPE_DEFAULT, "days between [%@] and [%@]: %ld", (uint8_t *)&v12, 0x20u);
  }

  return v8;
}

- (void)_flushAccumulatedLogDataWithDate:(id)a3
{
  v16[6] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    id v5 = +[DSDateFormatter sharedFormatter];
    id v6 = [v5 formatterWithType:4];
    int64_t v7 = [v6 stringFromDate:v4];

    if (v7)
    {
      v16[0] = v7;
      v15[0] = @"date";
      v15[1] = @"placedCallCount";
      int64_t v8 = [NSNumber numberWithInt:self->_accumulated.placedCallCount];
      v16[1] = v8;
      v15[2] = @"droppedCallCount";
      double v9 = [NSNumber numberWithInt:self->_accumulated.droppedCallCount];
      v16[2] = v9;
      v15[3] = @"deviceDroppedCallCount";
      uint64_t v10 = [NSNumber numberWithInt:self->_accumulated.deviceDroppedCallCount];
      v16[3] = v10;
      v15[4] = @"droppedWiFiCallCount";
      double v11 = [NSNumber numberWithInt:self->_accumulated.droppedWiFiCallCount];
      v16[4] = v11;
      v15[5] = @"droppedVoLTECallCount";
      int v12 = [NSNumber numberWithInt:self->_accumulated.droppedVoLTECallCount];
      v16[5] = v12;
      id v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];

      __int16 v14 = [(DSCallStatisticsAggregator *)self callLog];
      [v14 addObject:v13];

      self->_totals.deviceDroppedCallCount += self->_accumulated.deviceDroppedCallCount;
      *(int32x4_t *)&self->_totals.droppedCallCount = vaddq_s32(*(int32x4_t *)&self->_totals.droppedCallCount, *(int32x4_t *)&self->_accumulated.droppedCallCount);
    }
  }
  [(DSCallStatisticsAggregator *)self _resetAccumulator];
}

- (BOOL)futureDateDetected
{
  return self->_futureDateDetected;
}

- (void)setFutureDateDetected:(BOOL)a3
{
  self->_futureDateDetected = a3;
}

- (BOOL)outOfOrderDateDetected
{
  return self->_outOfOrderDateDetected;
}

- (void)setOutOfOrderDateDetected:(BOOL)a3
{
  self->_outOfOrderDateDetected = a3;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (NSMutableArray)callLog
{
  return self->_callLog;
}

- (void)setCallLog:(id)a3
{
}

- (NSCondition)generationLock
{
  return self->_generationLock;
}

- (void)setGenerationLock:(id)a3
{
}

- (BOOL)generationComplete
{
  return self->_generationComplete;
}

- (void)setGenerationComplete:(BOOL)a3
{
  self->_generationComplete = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (int64_t)missingDaysRemaining
{
  return self->_missingDaysRemaining;
}

- (void)setMissingDaysRemaining:(int64_t)a3
{
  self->_missingDaysRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationLock, 0);
  objc_storeStrong((id *)&self->_callLog, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

void __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end