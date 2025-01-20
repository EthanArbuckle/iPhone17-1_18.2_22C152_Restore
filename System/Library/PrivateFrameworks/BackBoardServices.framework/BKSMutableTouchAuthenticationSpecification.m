@interface BKSMutableTouchAuthenticationSpecification
- (void)setAuthenticationMessageContext:(unint64_t)a3;
- (void)setBackgroundStatisticsFailingContrast:(float)a3;
- (void)setBackgroundStatisticsForeground:(float)a3;
- (void)setBackgroundStatisticsPassingContrast:(float)a3;
- (void)setBackgroundStatisticsRegion:(id)a3;
- (void)setDisplays:(id)a3;
- (void)setHitTestInformationMask:(unint64_t)a3;
- (void)setInitialSampleEvent:(int64_t)a3;
- (void)setSecureName:(unsigned int)a3;
- (void)setSlotID:(unsigned int)a3;
@end

@implementation BKSMutableTouchAuthenticationSpecification

- (void)setInitialSampleEvent:(int64_t)a3
{
  self->super._initialSampleEvent = a3;
}

- (void)setHitTestInformationMask:(unint64_t)a3
{
  self->super._hitTestInformationMask = a3;
}

- (void)setBackgroundStatisticsFailingContrast:(float)a3
{
  self->super._backgroundStatisticsFailingContrast = a3;
}

- (void)setBackgroundStatisticsPassingContrast:(float)a3
{
  self->super._backgroundStatisticsPassingContrast = a3;
}

- (void)setBackgroundStatisticsForeground:(float)a3
{
  self->super._backgroundStatisticsForeground = a3;
}

- (void)setBackgroundStatisticsRegion:(id)a3
{
  *($BEA516A46C1BA1F84587E5D243A711F7 *)&self->super._backgroundStatisticsTopEdgeInset = a3;
}

- (void)setSecureName:(unsigned int)a3
{
  self->super._secureName = a3;
}

- (void)setAuthenticationMessageContext:(unint64_t)a3
{
  self->super._authenticationMessageContext = a3;
}

- (void)setSlotID:(unsigned int)a3
{
  self->super._slotID = a3;
}

- (void)setDisplays:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = NSString;
      v36 = (objc_class *)[v5 classForCoder];
      if (!v36) {
        v36 = (objc_class *)objc_opt_class();
      }
      v37 = NSStringFromClass(v36);
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      v40 = [v35 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"displays", v37, v39];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v41 = NSStringFromSelector(a2);
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        *(_DWORD *)buf = 138544642;
        v50 = v41;
        __int16 v51 = 2114;
        v52 = v43;
        __int16 v53 = 2048;
        v54 = self;
        __int16 v55 = 2114;
        v56 = @"BKSTouchAuthenticationSpecification.m";
        __int16 v57 = 1024;
        int v58 = 298;
        __int16 v59 = 2114;
        v60 = v40;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v40 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA464B4);
    }
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v44 + 1) + 8 * v10);
        if (!v11)
        {
          v19 = NSString;
          v20 = (objc_class *)objc_opt_class();
          v21 = NSStringFromClass(v20);
          v22 = [v19 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v21];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v23 = NSStringFromSelector(a2);
            v24 = (objc_class *)objc_opt_class();
            v25 = NSStringFromClass(v24);
            *(_DWORD *)buf = 138544642;
            v50 = v23;
            __int16 v51 = 2114;
            v52 = v25;
            __int16 v53 = 2048;
            v54 = self;
            __int16 v55 = 2114;
            v56 = @"BKSTouchAuthenticationSpecification.m";
            __int16 v57 = 1024;
            int v58 = 301;
            __int16 v59 = 2114;
            v60 = v22;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v22 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA4623CLL);
        }
        v12 = v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = NSString;
          v27 = (objc_class *)[v12 classForCoder];
          if (!v27) {
            v27 = (objc_class *)objc_opt_class();
          }
          v28 = NSStringFromClass(v27);
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          v31 = [v26 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v28, v30];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v32 = NSStringFromSelector(a2);
            v33 = (objc_class *)objc_opt_class();
            v34 = NSStringFromClass(v33);
            *(_DWORD *)buf = 138544642;
            v50 = v32;
            __int16 v51 = 2114;
            v52 = v34;
            __int16 v53 = 2048;
            v54 = self;
            __int16 v55 = 2114;
            v56 = @"BKSTouchAuthenticationSpecification.m";
            __int16 v57 = 1024;
            int v58 = 301;
            __int16 v59 = 2114;
            v60 = v31;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v31 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA46378);
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v8);
  }

  uint64_t v13 = objc_opt_class();
  id v14 = v6;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  id v16 = v15;

  v17 = (NSSet *)[v16 copy];
  displays = self->super._displays;
  self->super._displays = v17;
}

@end