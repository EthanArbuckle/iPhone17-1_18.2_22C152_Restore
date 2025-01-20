@interface VCIDRSchedulerPeriodGroup
- (VCIDRSchedulerPeriodGroup)initWithPeriodCount:(unsigned int)a3 framesPerBasePeriod:(unsigned int)a4;
- (id)computeScheduleItemList;
- (id)description;
- (unsigned)basePeriodCount;
- (void)addStream:(id)a3;
- (void)computeStreamsIDRPosition;
- (void)dealloc;
@end

@implementation VCIDRSchedulerPeriodGroup

- (VCIDRSchedulerPeriodGroup)initWithPeriodCount:(unsigned int)a3 framesPerBasePeriod:(unsigned int)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCIDRSchedulerPeriodGroup;
  v6 = [(VCIDRSchedulerPeriodGroup *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_basePeriodCount = a3;
    v6->_framesPerBasePeriod = a4;
    v6->_streams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCIDRSchedulerPeriodGroup;
  [(VCIDRSchedulerPeriodGroup *)&v3 dealloc];
}

- (void)addStream:(id)a3
{
}

- (id)computeScheduleItemList
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[(NSMutableArray *)self->_streams sortedArrayUsingSelector:sel_compareWeightFactor_];

  self->_schedulerItems = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", (objc_msgSend(v3, "count") + (unint64_t)self->_basePeriodCount - 1)/ self->_basePeriodCount);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        if (!v6)
        {
          v6 = objc_alloc_init(VCIDRSchedulerItem);
          [(NSMutableArray *)self->_schedulerItems addObject:v6];
        }
        [(VCIDRSchedulerItem *)v6 addStream:v9];
        if ([(NSArray *)[(VCIDRSchedulerItem *)v6 streams] count] == self->_basePeriodCount) {
          v6 = 0;
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v5);
  }
  return self->_schedulerItems;
}

- (void)computeStreamsIDRPosition
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obj = self->_schedulerItems;
  uint64_t v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v40;
    int v3 = 1;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v39 + 1) + 8 * v4);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          uint64_t v7 = *MEMORY[0x1E4F47A50];
          uint64_t v8 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v31 = v6;
              __int16 v32 = 2080;
              v33 = "-[VCIDRSchedulerPeriodGroup computeStreamsIDRPosition]";
              __int16 v34 = 1024;
              int v35 = 62;
              __int16 v36 = 2112;
              v37 = v5;
              _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Assign IDR slot for streams in item: %@", buf, 0x26u);
            }
          }
          else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v31 = v6;
            __int16 v32 = 2080;
            v33 = "-[VCIDRSchedulerPeriodGroup computeStreamsIDRPosition]";
            __int16 v34 = 1024;
            int v35 = 62;
            __int16 v36 = 2112;
            v37 = v5;
            _os_log_debug_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Assign IDR slot for streams in item: %@", buf, 0x26u);
          }
        }
        int v23 = v3;
        uint64_t v22 = v4;
        if (v3) {
          unsigned int v9 = 0;
        }
        else {
          unsigned int v9 = self->_basePeriodCount - 1;
        }
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v24 = (id)[v5 streams];
        uint64_t v10 = [v24 countByEnumeratingWithState:&v26 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v27;
          if (v3) {
            int v13 = 1;
          }
          else {
            int v13 = -1;
          }
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(v24);
              }
              long long v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
              objc_msgSend(v15, "setFramePosition:", objc_msgSend(v5, "framePosition") + self->_framesPerBasePeriod * v9);
              [v15 setFramesPerIdrPeriod:self->_basePeriodCount * self->_framesPerBasePeriod];
              if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
              {
                uint64_t v16 = VRTraceErrorLogLevelToCSTR();
                v17 = *MEMORY[0x1E4F47A50];
                v18 = *MEMORY[0x1E4F47A50];
                if (*MEMORY[0x1E4F47A40])
                {
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315906;
                    uint64_t v31 = v16;
                    __int16 v32 = 2080;
                    v33 = "-[VCIDRSchedulerPeriodGroup computeStreamsIDRPosition]";
                    __int16 v34 = 1024;
                    int v35 = 67;
                    __int16 v36 = 2112;
                    v37 = v15;
                    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting position and period: %@", buf, 0x26u);
                  }
                }
                else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315906;
                  uint64_t v31 = v16;
                  __int16 v32 = 2080;
                  v33 = "-[VCIDRSchedulerPeriodGroup computeStreamsIDRPosition]";
                  __int16 v34 = 1024;
                  int v35 = 67;
                  __int16 v36 = 2112;
                  v37 = v15;
                  _os_log_debug_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Setting position and period: %@", buf, 0x26u);
                }
              }
              v9 += v13;
              ++v14;
            }
            while (v11 != v14);
            uint64_t v11 = [v24 countByEnumeratingWithState:&v26 objects:v25 count:16];
          }
          while (v11);
        }
        int v3 = v23 ^ 1;
        uint64_t v4 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v38 count:16];
    }
    while (v21);
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"IDR Period Group: BasePeriodCount=%d frames:%d streams:%@", self->_basePeriodCount, self->_framesPerBasePeriod * self->_basePeriodCount, self->_streams];
}

- (unsigned)basePeriodCount
{
  return self->_basePeriodCount;
}

@end