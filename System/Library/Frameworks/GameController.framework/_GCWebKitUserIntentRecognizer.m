@interface _GCWebKitUserIntentRecognizer
- (_GCWebKitUserIntentRecognizer)initWithPhysicalInputProfile:(id)a3 thumbstickUserIntentHandler:(id)a4;
- (_GCWebKitUserIntentRecognizer)initWithPhysicalInputProfile:(id)a3 thumbstickUserIntentHandler:(id)a4 slidingWindowTotalDuration:(double)a5 slidingWindowSegmentDuration:(double)a6 deadzone:(double)a7 sensitivity:(int)a8;
- (id)thumbstickUserIntentHandler;
- (void)processChangedElements:(id)a3 atTimestamp:(unint64_t)a4;
@end

@implementation _GCWebKitUserIntentRecognizer

- (_GCWebKitUserIntentRecognizer)initWithPhysicalInputProfile:(id)a3 thumbstickUserIntentHandler:(id)a4
{
  return [(_GCWebKitUserIntentRecognizer *)self initWithPhysicalInputProfile:a3 thumbstickUserIntentHandler:a4 slidingWindowTotalDuration:1 slidingWindowSegmentDuration:1.0 deadzone:0.0500000007 sensitivity:0.0222999994];
}

- (_GCWebKitUserIntentRecognizer)initWithPhysicalInputProfile:(id)a3 thumbstickUserIntentHandler:(id)a4 slidingWindowTotalDuration:(double)a5 slidingWindowSegmentDuration:(double)a6 deadzone:(double)a7 sensitivity:(int)a8
{
  id v14 = a3;
  id v15 = a4;
  v28.receiver = self;
  v28.super_class = (Class)_GCWebKitUserIntentRecognizer;
  v16 = [(_GCWebKitUserIntentRecognizer *)&v28 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_physicalInputProfile, v14);
    uint64_t v18 = [v15 copy];
    id thumbstickUserIntentHandler = v17->_thumbstickUserIntentHandler;
    v17->_id thumbstickUserIntentHandler = (id)v18;

    uint64_t v20 = objc_opt_new();
    trackedInputs = v17->_trackedInputs;
    v17->_trackedInputs = (NSMutableDictionary *)v20;

    v17->_double slidingWindowTotalDuration = a5;
    v17->_double slidingWindowSegmentDuration = a6;
    v17->_double deadzoneSquared = a7 * a7;
    v17->_int distanceThreshold = (int)(float)((float)(1.0 / (float)a8) * 6.0);
    if (gc_isInternalBuild())
    {
      v23 = getGCLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        double slidingWindowTotalDuration = v17->_slidingWindowTotalDuration;
        double slidingWindowSegmentDuration = v17->_slidingWindowSegmentDuration;
        double deadzoneSquared = v17->_deadzoneSquared;
        int distanceThreshold = v17->_distanceThreshold;
        *(_DWORD *)buf = 138413314;
        id v30 = v14;
        __int16 v31 = 2048;
        double v32 = slidingWindowTotalDuration;
        __int16 v33 = 2048;
        double v34 = slidingWindowSegmentDuration;
        __int16 v35 = 2048;
        double v36 = deadzoneSquared;
        __int16 v37 = 1024;
        int v38 = distanceThreshold;
        _os_log_impl(&dword_220998000, v23, OS_LOG_TYPE_INFO, "Registering _GCWebKitUserIntentRecognizer for %@\n\tdouble slidingWindowTotalDuration = %f\n\tslidingWindowSegmentDuration = %f\n\tdeadzoneSquared = %f\n\tdistanceThreshold = %d", buf, 0x30u);
      }
    }
  }

  return v17;
}

- (void)processChangedElements:(id)a3 atTimestamp:(unint64_t)a4
{
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = a3;
  uint64_t v57 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v63;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v63 != v56) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v62 + 1) + 8 * v5);
        v7 = [v6 primaryAlias];
        if ([v7 isEqualToString:@"Left Thumbstick"])
        {
        }
        else
        {
          v8 = [v6 primaryAlias];
          int v9 = [v8 isEqualToString:@"Right Thumbstick"];

          if (!v9) {
            goto LABEL_46;
          }
        }
        id v10 = v6;
        trackedInputs = self->_trackedInputs;
        v12 = [v10 primaryAlias];
        v13 = [(NSMutableDictionary *)trackedInputs objectForKey:v12];
        LODWORD(trackedInputs) = v13 == 0;

        if (trackedInputs)
        {
          id v14 = objc_opt_new();
          id v15 = self->_trackedInputs;
          v16 = [v10 primaryAlias];
          [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v16];
        }
        v17 = self->_trackedInputs;
        uint64_t v18 = [v10 primaryAlias];
        v19 = [(NSMutableDictionary *)v17 objectForKeyedSubscript:v18];

        uint64_t v20 = mach_absolute_time();
        if (timestampToSecondsMultiplier_onceToken != -1) {
          dispatch_once(&timestampToSecondsMultiplier_onceToken, &__block_literal_global_30);
        }
        double v21 = *(double *)&timestampToSecondsMultiplier_multiplier * (double)v20;
        for (unint64_t i = 0; [v19 count] > i; ++i)
        {
          v23 = [v19 objectAtIndexedSubscript:i];
          [v23 timestampInSeconds];
          double v25 = v24;

          float v26 = v21 - v25;
          if (self->_slidingWindowTotalDuration >= v26) {
            break;
          }
        }
        objc_msgSend(v19, "removeObjectsInRange:", 0, i);
        v27 = [v19 lastObject];
        [v27 timestampInSeconds];
        double v29 = v28;
        if (![v19 count] || (double v30 = v21 - v29, v21 - v29 >= self->_slidingWindowSegmentDuration))
        {
          __int16 v31 = [_GCUserIntentInputEvent alloc];
          double v32 = [v10 xAxis];
          [v32 value];
          int v34 = v33;
          __int16 v35 = [v10 yAxis];
          [v35 value];
          LODWORD(v37) = v36;
          LODWORD(v38) = v34;
          v39 = [(_GCUserIntentInputEvent *)v31 initWithXValue:a4 yValue:v38 timestamp:v37 deadzoneSquared:self->_deadzoneSquared];

          if ([(_GCUserIntentInputEvent *)v39 octant] != -1)
          {
            if (![v19 count]
              || v27 && (uint64_t v40 = [v27 octant], v40 != -[_GCUserIntentInputEvent octant](v39, "octant")))
            {
              [v19 addObject:v39];
            }
          }
        }
        if ((unint64_t)objc_msgSend(v19, "count", v30) >= 2)
        {
          if ([v19 count] == 1)
          {
            int v41 = 0;
          }
          else
          {
            unint64_t v42 = 0;
            int v41 = 0;
            do
            {
              v43 = [v19 objectAtIndexedSubscript:v42];
              v44 = [v19 objectAtIndexedSubscript:++v42];
              uint64_t v45 = [v43 octant];
              uint64_t v46 = [v44 octant];
              if (v46 <= v45) {
                uint64_t v47 = v45;
              }
              else {
                uint64_t v47 = v46;
              }
              if (v46 >= v45) {
                uint64_t v48 = v45;
              }
              else {
                uint64_t v48 = v46;
              }
              if (v47 - v48 >= 5) {
                int v49 = v48 + 8;
              }
              else {
                int v49 = v47;
              }
              if (v47 - v48 < 5) {
                LODWORD(v47) = v48;
              }
              int v50 = v49 - v47;
              if (v50 >= 0) {
                int v51 = v50;
              }
              else {
                int v51 = -v50;
              }

              v41 += v51;
            }
            while ([v19 count] - 1 > v42);
          }
          if (v41 >= self->_distanceThreshold)
          {
            objc_initWeak(&location, self);
            id WeakRetained = objc_loadWeakRetained((id *)&self->_physicalInputProfile);
            v53 = [WeakRetained handlerQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = __68___GCWebKitUserIntentRecognizer_processChangedElements_atTimestamp___block_invoke;
            block[3] = &unk_26D22B668;
            objc_copyWeak(&v60, &location);
            block[4] = v10;
            id v59 = v19;
            dispatch_async(v53, block);

            objc_destroyWeak(&v60);
            objc_destroyWeak(&location);
          }
        }

LABEL_46:
        ++v5;
      }
      while (v5 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v57);
  }
}

- (id)thumbstickUserIntentHandler
{
  return self->_thumbstickUserIntentHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_thumbstickUserIntentHandler, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_trackedInputs, 0);

  objc_destroyWeak((id *)&self->_physicalInputProfile);
}

@end