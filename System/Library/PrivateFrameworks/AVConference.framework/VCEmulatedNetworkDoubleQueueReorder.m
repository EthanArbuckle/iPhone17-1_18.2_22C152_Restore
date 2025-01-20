@interface VCEmulatedNetworkDoubleQueueReorder
- (BOOL)shouldSendPacketImmediatelyMM;
- (VCEmulatedNetworkDoubleQueueReorder)initWithPolicies:(id)a3;
- (void)dealloc;
- (void)push:(id)a3;
@end

@implementation VCEmulatedNetworkDoubleQueueReorder

- (VCEmulatedNetworkDoubleQueueReorder)initWithPolicies:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCEmulatedNetworkDoubleQueueReorder;
  v4 = -[VCEmulatedNetworkDoubleQueue initWithPolicies:](&v14, sel_initWithPolicies_);
  if (v4)
  {
    v5 = (void *)[a3 objectForKeyedSubscript:@"DoubleQueueImpairments"];
    objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"ReorderProbability"), "doubleValue");
    v4->_double probability = v6;
    if ([v5 objectForKeyedSubscript:@"ReorderCorrelation"]
      && [v5 objectForKeyedSubscript:@"ReorderGap"])
    {
      v4->_useMarkovModel = 1;
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"ReorderCorrelation"), "doubleValue");
      v4->_double correlation = v7;
      v4->_int reorderGap = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"ReorderGap"), "integerValue");
      v4->_state = 0;
      v4->_gap = 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double probability = v4->_probability;
        double correlation = v4->_correlation;
        int reorderGap = v4->_reorderGap;
        *(_DWORD *)buf = 136316418;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        v18 = "-[VCEmulatedNetworkDoubleQueueReorder initWithPolicies:]";
        __int16 v19 = 1024;
        int v20 = 26;
        __int16 v21 = 2048;
        double v22 = probability;
        __int16 v23 = 2048;
        double v24 = correlation;
        __int16 v25 = 1024;
        int v26 = reorderGap;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reorder profile probability: %2.2f correlation: %2.2f gap: %d", buf, 0x36u);
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCEmulatedNetworkDoubleQueueReorder;
  [(VCEmulatedNetworkDoubleQueue *)&v2 dealloc];
}

- (BOOL)shouldSendPacketImmediatelyMM
{
  switch(self->_state)
  {
    case 0xFFFFFFFF:
      NSLog(&cfstr_InvalidStateD.isa, a2, 0xFFFFFFFFLL);
      goto LABEL_3;
    case 0:
      int gap = self->_gap;
      int reorderGap = self->_reorderGap;
      char v3 = gap >= reorderGap;
      if (gap < reorderGap)
      {
        self->_state = 0;
        int gap = self->_gap + 1;
        self->_int gap = gap;
        int reorderGap = self->_reorderGap;
      }
      if (gap == reorderGap - 1)
      {
        self->_int gap = 1;
        self->_state = 1;
      }
      return v3 & 1;
    case 1:
      uint64_t v6 = 64;
      goto LABEL_10;
    case 2:
      uint64_t v6 = 72;
LABEL_10:
      double v7 = *(double *)((char *)&self->super.super.super.isa + v6);
      int v8 = 2;
      if (v7 <= *(double *)"")
      {
        char v3 = 1;
      }
      else
      {
        BOOL v9 = (double)(unsigned __int16)arc4random_uniform(0xFFFFu) / 65535.0 <= v7;
        char v3 = !v9;
        if (v9) {
          int v8 = 3;
        }
        else {
          int v8 = 2;
        }
      }
      self->_state = v8;
      break;
    case 3:
      char v3 = 0;
      self->_state = 0;
      break;
    default:
LABEL_3:
      char v3 = 1;
      break;
  }
  return v3 & 1;
}

- (void)push:(id)a3
{
  if (!self->_useMarkovModel)
  {
    double probability = self->_probability;
    if (probability > *(double *)"" && (double)(unsigned __int16)arc4random_uniform(0xFFFFu) / 65535.0 <= probability) {
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v6 = &OBJC_IVAR___VCEmulatedNetworkDoubleQueue__networkQueueA;
    goto LABEL_8;
  }
  if ([(VCEmulatedNetworkDoubleQueueReorder *)self shouldSendPacketImmediatelyMM]) {
    goto LABEL_6;
  }
LABEL_7:
  uint64_t v6 = &OBJC_IVAR___VCEmulatedNetworkDoubleQueue__networkQueueB;
LABEL_8:
  if ([*(id *)((char *)&self->super.super.super.isa + *v6) write:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        [(VCEmulatedNetworkDoubleQueueReorder *)v7 push:v8];
      }
    }
  }
  else
  {
    id pushCompletionHandler = self->super.super._pushCompletionHandler;
    if (pushCompletionHandler)
    {
      v10 = (void (*)(void))*((void *)pushCompletionHandler + 2);
      v10();
    }
  }
}

- (void)push:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = 136315906;
  if ([a2 packetID]) {
    int v5 = 65;
  }
  else {
    int v5 = 66;
  }
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  BOOL v9 = "-[VCEmulatedNetworkDoubleQueueReorder push:]";
  __int16 v10 = 1024;
  int v11 = 90;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to write to network queue %c", (uint8_t *)&v6, 0x22u);
}

@end