@interface VCIDRScheduler
+ (unsigned)computeGcdForX:(unsigned int)a3 y:(unsigned int)a4;
- (BOOL)computeCaptureFramerate;
- (VCIDRScheduler)initWithStreams:(id)a3 captureFramerate:(unsigned int)a4;
- (id)description;
- (unsigned)basePeriodMs;
- (unsigned)captureFramerate;
- (void)computeBasePeriod;
- (void)computeCaptureFramerate;
- (void)computeGroupList;
- (void)computeSchedulerItemList;
- (void)computeSchedulerItemsBudget;
- (void)computeSchedulerItemsPosition;
- (void)computeStreamsIDRPosition;
- (void)dealloc;
- (void)placeRemainingItems:(id)a3 placedItems:(id)a4 leftItem:(id)a5 rightItem:(id)a6;
- (void)realignStreams;
@end

@implementation VCIDRScheduler

- (VCIDRScheduler)initWithStreams:(id)a3 captureFramerate:(unsigned int)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCIDRScheduler;
  v6 = [(VCIDRScheduler *)&v10 init];
  if (v6)
  {
    v6->_streams = (NSArray *)a3;
    v6->_captureFramerate = a4;
    v6->_schedulerGroups = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6->_schedulerItems = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(VCIDRScheduler *)v6 computeBasePeriod];
    if (![(VCIDRScheduler *)v6 computeCaptureFramerate])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCIDRScheduler initWithStreams:captureFramerate:](v7, v8);
        }
      }

      v6 = 0;
    }
    [(VCIDRScheduler *)v6 computeGroupList];
    [(VCIDRScheduler *)v6 computeSchedulerItemList];
    [(VCIDRScheduler *)v6 computeSchedulerItemsBudget];
    [(VCIDRScheduler *)v6 computeSchedulerItemsPosition];
    [(VCIDRScheduler *)v6 computeStreamsIDRPosition];
    [(VCIDRScheduler *)v6 realignStreams];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCIDRScheduler;
  [(VCIDRScheduler *)&v3 dealloc];
}

+ (unsigned)computeGcdForX:(unsigned int)a3 y:(unsigned int)a4
{
  if (!a3) {
    return a4;
  }
  do
  {
    unsigned int result = a3;
    a3 = a4 % a3;
    a4 = result;
  }
  while (a3);
  return result;
}

- (void)computeBasePeriod
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  int v4 = 80;
  __int16 v5 = v0;
  int v6 = v1;
  _os_log_debug_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Computed base period: %d frames", v3, 0x22u);
}

- (BOOL)computeCaptureFramerate
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  p_captureFramerate = &self->_captureFramerate;
  HIDWORD(v3) = 652835029 * self->_captureFramerate * self->_basePeriodMs;
  LODWORD(v3) = HIDWORD(v3);
  if ((v3 >> 3) < 0x418938)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    streams = self->_streams;
    uint64_t v6 = [(NSArray *)streams countByEnumeratingWithState:&v30 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
LABEL_7:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(streams);
        }
        objc_super v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        unsigned int v11 = *p_captureFramerate;
        if (v11 % [v10 framerate]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSArray *)streams countByEnumeratingWithState:&v30 objects:v29 count:16];
          if (v7) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_20;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v4)
      {
        unsigned int v17 = *p_captureFramerate;
        int v19 = 136316162;
        uint64_t v20 = v15;
        __int16 v21 = 2080;
        v22 = "-[VCIDRScheduler computeCaptureFramerate]";
        __int16 v23 = 1024;
        int v24 = 90;
        __int16 v25 = 1024;
        unsigned int v26 = v17;
        __int16 v27 = 1024;
        int v28 = [v10 framerate];
        _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Configured max capture frame _captureFramerate=%d is incompatible with streamInfo.framerate=%d", (uint8_t *)&v19, 0x28u);
        goto LABEL_20;
      }
    }
    else
    {
LABEL_13:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v14 = *p_captureFramerate;
          int v19 = 136315906;
          uint64_t v20 = v12;
          __int16 v21 = 2080;
          v22 = "-[VCIDRScheduler computeCaptureFramerate]";
          __int16 v23 = 1024;
          int v24 = 94;
          __int16 v25 = 1024;
          unsigned int v26 = v14;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Computed capture frame rate: %d", (uint8_t *)&v19, 0x22u);
        }
      }
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_20:
      LOBYTE(v4) = 0;
      return v4;
    }
    VRTraceErrorLogLevelToCSTR();
    BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v4)
    {
      -[VCIDRScheduler computeCaptureFramerate]();
      goto LABEL_20;
    }
  }
  return v4;
}

- (void)computeGroupList
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Computed group list: %@");
}

- (void)computeSchedulerItemList
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Computed scheduler item list: %@");
}

- (void)computeSchedulerItemsBudget
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  unsigned int framesPerBasePeriod = self->_framesPerBasePeriod;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  schedulerItems = self->_schedulerItems;
  uint64_t v5 = [(NSMutableArray *)schedulerItems countByEnumeratingWithState:&v49 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(schedulerItems);
        }
        v7 += [*(id *)(*((void *)&v49 + 1) + 8 * i) weightFactor];
      }
      uint64_t v6 = [(NSMutableArray *)schedulerItems countByEnumeratingWithState:&v49 objects:v48 count:16];
    }
    while (v6);
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    unsigned int v11 = *MEMORY[0x1E4F47A50];
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int basePeriodMs = self->_basePeriodMs;
        unsigned int v14 = self->_framesPerBasePeriod;
        *(_DWORD *)buf = 136316418;
        uint64_t v39 = v10;
        __int16 v40 = 2080;
        v41 = "-[VCIDRScheduler computeSchedulerItemsBudget]";
        __int16 v42 = 1024;
        int v43 = 128;
        __int16 v44 = 1024;
        *(_DWORD *)v45 = basePeriodMs;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = v7;
        __int16 v46 = 1024;
        unsigned int v47 = v14;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Total budget: time:%dms weight:%d frames:%d", buf, 0x2Eu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v29 = self->_basePeriodMs;
      unsigned int v30 = self->_framesPerBasePeriod;
      *(_DWORD *)buf = 136316418;
      uint64_t v39 = v10;
      __int16 v40 = 2080;
      v41 = "-[VCIDRScheduler computeSchedulerItemsBudget]";
      __int16 v42 = 1024;
      int v43 = 128;
      __int16 v44 = 1024;
      *(_DWORD *)v45 = v29;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v7;
      __int16 v46 = 1024;
      unsigned int v47 = v30;
      _os_log_debug_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Total budget: time:%dms weight:%d frames:%d", buf, 0x2Eu);
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = self->_schedulerItems;
  uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v35;
    *(void *)&long long v16 = 136315906;
    long long v31 = v16;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(obj);
        }
        __int16 v21 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        unsigned int v22 = self->_basePeriodMs;
        if (v7) {
          unsigned int v22 = [*(id *)(*((void *)&v34 + 1) + 8 * j) weightFactor] * v22 / v7;
        }
        LODWORD(v17) = self->_captureFramerate;
        int v23 = llround((double)v22 * (double)v17 / 1000.0);
        if (v23 <= 1) {
          int v23 = 1;
        }
        if (v23 >= framesPerBasePeriod) {
          uint64_t v24 = framesPerBasePeriod;
        }
        else {
          uint64_t v24 = v23;
        }
        objc_msgSend(v21, "setBudgetInCaptureFrames:", v24, v31);
        int v25 = [v21 budgetInCaptureFrames];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v26 = VRTraceErrorLogLevelToCSTR();
          __int16 v27 = *MEMORY[0x1E4F47A50];
          int v28 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v31;
              uint64_t v39 = v26;
              __int16 v40 = 2080;
              v41 = "-[VCIDRScheduler computeSchedulerItemsBudget]";
              __int16 v42 = 1024;
              int v43 = 135;
              __int16 v44 = 2112;
              *(void *)v45 = v21;
              _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Bugdet computed for item: %@", buf, 0x26u);
            }
          }
          else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v31;
            uint64_t v39 = v26;
            __int16 v40 = 2080;
            v41 = "-[VCIDRScheduler computeSchedulerItemsBudget]";
            __int16 v42 = 1024;
            int v43 = 135;
            __int16 v44 = 2112;
            *(void *)v45 = v21;
            _os_log_debug_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Bugdet computed for item: %@", buf, 0x26u);
          }
        }
        framesPerBasePeriod -= v25;
      }
      uint64_t v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void)placeRemainingItems:(id)a3 placedItems:(id)a4 leftItem:(id)a5 rightItem:(id)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[a3 objectAtIndexedSubscript:0];
  int v9 = [a5 framePosition];
  unsigned int v50 = [a5 budgetInCaptureFrames] + v9;
  [a3 removeObject:v8];
  v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  obuint64_t j = a3;
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  id v46 = a5;
  unsigned int v11 = [a5 budgetInCaptureFrames];
  unsigned int v12 = [v8 budgetInCaptureFrames];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    unsigned int v14 = *MEMORY[0x1E4F47A50];
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v57 = v13;
        __int16 v58 = 2080;
        v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
        __int16 v60 = 1024;
        int v61 = 156;
        __int16 v62 = 1024;
        *(_DWORD *)v63 = v50;
        *(_WORD *)&v63[4] = 1024;
        *(_DWORD *)&v63[6] = v11;
        __int16 v64 = 1024;
        unsigned int v65 = v12;
        __int16 v66 = 2112;
        v67 = v8;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Position next item (start position=%d leftDist=%d rightDist=%d): %@", buf, 0x38u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v57 = v13;
      __int16 v58 = 2080;
      v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
      __int16 v60 = 1024;
      int v61 = 156;
      __int16 v62 = 1024;
      *(_DWORD *)v63 = v50;
      *(_WORD *)&v63[4] = 1024;
      *(_DWORD *)&v63[6] = v11;
      __int16 v64 = 1024;
      unsigned int v65 = v12;
      __int16 v66 = 2112;
      v67 = v8;
      _os_log_debug_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Position next item (start position=%d leftDist=%d rightDist=%d): %@", buf, 0x38u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    unint64_t v17 = *MEMORY[0x1E4F47A50];
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v57 = v16;
        __int16 v58 = 2080;
        v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
        __int16 v60 = 1024;
        int v61 = 157;
        __int16 v62 = 2112;
        *(void *)v63 = v46;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Left item: %@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      -[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    __int16 v21 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v57 = v19;
        __int16 v58 = 2080;
        v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
        __int16 v60 = 1024;
        int v61 = 158;
        __int16 v62 = 2112;
        *(void *)v63 = a6;
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Right item: %@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      -[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    int v23 = *MEMORY[0x1E4F47A50];
    uint64_t v24 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v57 = v22;
        __int16 v58 = 2080;
        v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
        __int16 v60 = 1024;
        int v61 = 159;
        __int16 v62 = 2112;
        *(void *)v63 = a3;
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remaining items: %@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]();
    }
  }
  int v43 = v8;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v25 = [a3 countByEnumeratingWithState:&v52 objects:v51 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v53;
    int v28 = v10;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v53 != v27) {
          objc_enumerationMutation(obj);
        }
        unsigned int v30 = *(void **)(*((void *)&v52 + 1) + 8 * v29);
        if (v11 > v12
          || v11 == v12
          && (unsigned int v36 = [a6 weightFactor], v36 < objc_msgSend(v46, "weightFactor")))
        {
          [v10 addObject:v30];
          v12 += [v30 budgetInCaptureFrames];
          if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
            goto LABEL_46;
          }
          uint64_t v31 = VRTraceErrorLogLevelToCSTR();
          long long v32 = *MEMORY[0x1E4F47A50];
          long long v33 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316674;
              uint64_t v57 = v31;
              __int16 v58 = 2080;
              v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
              __int16 v60 = 1024;
              int v61 = 165;
              __int16 v62 = 1024;
              *(_DWORD *)v63 = v50;
              *(_WORD *)&v63[4] = 1024;
              *(_DWORD *)&v63[6] = v11;
              __int16 v64 = 1024;
              unsigned int v65 = v12;
              __int16 v66 = 2112;
              v67 = v30;
              long long v34 = v32;
              long long v35 = " [%s] %s:%d Place item in the right bucket (position=%d leftDist=%d rightDist=%d): %@ ";
LABEL_41:
              _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0x38u);
            }
          }
          else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316674;
            uint64_t v57 = v31;
            __int16 v58 = 2080;
            v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
            __int16 v60 = 1024;
            int v61 = 165;
            __int16 v62 = 1024;
            *(_DWORD *)v63 = v50;
            *(_WORD *)&v63[4] = 1024;
            *(_DWORD *)&v63[6] = v11;
            __int16 v64 = 1024;
            unsigned int v65 = v12;
            __int16 v66 = 2112;
            v67 = v30;
            __int16 v40 = v32;
            v41 = " [%s] %s:%d Place item in the right bucket (position=%d leftDist=%d rightDist=%d): %@ ";
LABEL_49:
            _os_log_debug_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEBUG, v41, buf, 0x38u);
          }
        }
        else
        {
          [v48 addObject:v30];
          v11 += [v30 budgetInCaptureFrames];
          v50 += [v30 budgetInCaptureFrames];
          if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
            goto LABEL_46;
          }
          uint64_t v37 = VRTraceErrorLogLevelToCSTR();
          v38 = *MEMORY[0x1E4F47A50];
          uint64_t v39 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316674;
              uint64_t v57 = v37;
              __int16 v58 = 2080;
              v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
              __int16 v60 = 1024;
              int v61 = 170;
              __int16 v62 = 1024;
              *(_DWORD *)v63 = v50;
              *(_WORD *)&v63[4] = 1024;
              *(_DWORD *)&v63[6] = v11;
              __int16 v64 = 1024;
              unsigned int v65 = v12;
              __int16 v66 = 2112;
              v67 = v30;
              long long v34 = v38;
              long long v35 = " [%s] %s:%d Place item in the left bucket (position=%d leftDist=%d rightDist=%d): %@ ";
              goto LABEL_41;
            }
          }
          else if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316674;
            uint64_t v57 = v37;
            __int16 v58 = 2080;
            v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
            __int16 v60 = 1024;
            int v61 = 170;
            __int16 v62 = 1024;
            *(_DWORD *)v63 = v50;
            *(_WORD *)&v63[4] = 1024;
            *(_DWORD *)&v63[6] = v11;
            __int16 v64 = 1024;
            unsigned int v65 = v12;
            __int16 v66 = 2112;
            v67 = v30;
            __int16 v40 = v38;
            v41 = " [%s] %s:%d Place item in the left bucket (position=%d leftDist=%d rightDist=%d): %@ ";
            goto LABEL_49;
          }
        }
        uint64_t v10 = v28;
LABEL_46:
        ++v29;
      }
      while (v26 != v29);
      uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v51 count:16];
      uint64_t v26 = v42;
    }
    while (v42);
  }
  [v43 setFramePosition:v50];
  [a4 addObject:v43];
  if ([v48 count]) {
    [(VCIDRScheduler *)self placeRemainingItems:v48 placedItems:a4 leftItem:v46 rightItem:v43];
  }
  if ([v10 count]) {
    [(VCIDRScheduler *)self placeRemainingItems:v10 placedItems:a4 leftItem:v43 rightItem:a6];
  }
}

- (void)computeSchedulerItemsPosition
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Placing first item: %@");
}

- (void)computeStreamsIDRPosition
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  os_log_t v2 = (void *)[(NSMutableDictionary *)self->_schedulerGroups allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) computeStreamsIDRPosition];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v4);
  }
}

- (void)realignStreams
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  streams = self->_streams;
  uint64_t v4 = [(NSArray *)streams countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned int v6 = 0;
    uint64_t v7 = *(void *)v27;
    unsigned int v8 = -1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(streams);
        }
        long long v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v10 weightFactor] < v8)
        {
          unsigned int v8 = [v10 weightFactor];
          unsigned int v6 = [v10 framePosition];
        }
      }
      uint64_t v5 = [(NSArray *)streams countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    unsigned int v6 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v11 = self->_streams;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        unsigned int v17 = [v16 framePosition];
        int v18 = [v16 framePosition];
        if (v17 >= v6) {
          uint64_t v19 = v18 - v6;
        }
        else {
          uint64_t v19 = v18 - v6 + [v16 framesPerIdrPeriod];
        }
        [v16 setFramePosition:v19];
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v20 count:16];
    }
    while (v13);
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"IDR Scheduler: framerate:%d, basePeriod:%dms framesPerBasePeriod:%d groups:%@", self->_captureFramerate, self->_basePeriodMs, self->_framesPerBasePeriod, self->_schedulerGroups];
}

- (unsigned)basePeriodMs
{
  return self->_basePeriodMs;
}

- (unsigned)captureFramerate
{
  return self->_captureFramerate;
}

- (void)initWithStreams:(uint64_t)a1 captureFramerate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCIDRScheduler initWithStreams:captureFramerate:]";
  __int16 v6 = 1024;
  int v7 = 39;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to compute a valid capture framerate", (uint8_t *)&v2, 0x1Cu);
}

- (void)computeCaptureFramerate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  int v4 = 85;
  __int16 v5 = v0;
  int v6 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Computed capture frame rate is not a valid _captureFramerate=%d", v3, 0x22u);
}

- (void)placeRemainingItems:placedItems:leftItem:rightItem:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Remaining items: %@");
}

- (void)placeRemainingItems:placedItems:leftItem:rightItem:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Right item: %@");
}

- (void)placeRemainingItems:placedItems:leftItem:rightItem:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Left item: %@");
}

@end