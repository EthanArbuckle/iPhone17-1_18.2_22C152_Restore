@interface DTMFEventHandler
- (BOOL)insertStartBlockWithEvent:(unsigned __int8)a3 volume:(unsigned __int8)a4 timestamp:(unsigned int)a5;
- (BOOL)insertStopBlockWithEndTimestamp:(unsigned int)a3 withPauseCompleteTimestamp:(unsigned int)a4;
- (BOOL)shouldAdjustForLastPauseCompleteTimestamp:(unsigned int *)a3;
- (BOOL)shouldTransmitDTMFWithTimestamp:(unsigned int)a3;
- (DTMFEventHandler)init;
- (int)constructDTMFEventPacketWithEvent:(unsigned __int8)a3 volume:(unsigned __int8)a4 durationCounter:(unsigned int)a5 dataBuffer:(char *)a6 isEnd:(BOOL)a7;
- (void)dealloc;
- (void)sendDTMFEvent:(id)a3 atTimestamp:(unsigned int)a4 withSampleRate:(unsigned int)a5;
- (void)sendingDTMFEventWithTimeStamp:(unsigned int)a3 interval:(unsigned int)a4 RTPHandle:(tagHANDLE *)a5;
- (void)setDTMFRTPEventDurationForPayload:(int)a3;
- (void)stopDTMFEventAtTimestamp:(unsigned int)a3 withSampleRate:(unsigned int)a4;
@end

@implementation DTMFEventHandler

- (DTMFEventHandler)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)DTMFEventHandler;
  v2 = [(DTMFEventHandler *)&v5 init];
  if (v2)
  {
    v2->dtmfEventQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->dtmfQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCDTMFEventHandler.dtmfQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  dispatch_release((dispatch_object_t)self->dtmfQueue);
  v3.receiver = self;
  v3.super_class = (Class)DTMFEventHandler;
  [(DTMFEventHandler *)&v3 dealloc];
}

- (void)setDTMFRTPEventDurationForPayload:(int)a3
{
  if ((a3 - 97) > 0xE) {
    goto LABEL_6;
  }
  if (((1 << (a3 - 97)) & 0x4C02) == 0)
  {
    if (a3 == 97)
    {
      unsigned int v3 = 160;
      goto LABEL_7;
    }
LABEL_6:
    unsigned int v3 = 0;
    goto LABEL_7;
  }
  unsigned int v3 = 320;
LABEL_7:
  self->_rtpEventDuration = v3;
}

- (BOOL)insertStartBlockWithEvent:(unsigned __int8)a3 volume:(unsigned __int8)a4 timestamp:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  v13[3] = *MEMORY[0x1E4F143B8];
  v9 = (void *)MEMORY[0x1E4E589F0](self, a2);
  dtmfEventQueue = self->dtmfEventQueue;
  v12[0] = @"event";
  v13[0] = [NSNumber numberWithUnsignedChar:v7];
  v12[1] = @"volume";
  v13[1] = [NSNumber numberWithUnsignedChar:v6];
  v12[2] = @"startTimestamp";
  v13[2] = [NSNumber numberWithUnsignedInt:v5];
  -[NSMutableArray addObject:](dtmfEventQueue, "addObject:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3]);
  return 1;
}

- (BOOL)insertStopBlockWithEndTimestamp:(unsigned int)a3 withPauseCompleteTimestamp:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1E4E589F0](self, a2);
  dtmfEventQueue = self->dtmfEventQueue;
  v10[0] = @"endTimestamp";
  v10[1] = @"pauseCompleteTimestamp";
  v11[0] = [NSNumber numberWithUnsignedInt:v5];
  v11[1] = [NSNumber numberWithUnsignedInt:v4];
  -[NSMutableArray addObject:](dtmfEventQueue, "addObject:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2]);
  return 1;
}

- (void)sendDTMFEvent:(id)a3 atTimestamp:(unsigned int)a4 withSampleRate:(unsigned int)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKeyedSubscript:@"event"])
  {
    dtmfQueue = self->dtmfQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __61__DTMFEventHandler_sendDTMFEvent_atTimestamp_withSampleRate___block_invoke;
    v10[3] = &unk_1E6DB5450;
    v10[4] = a3;
    v10[5] = self;
    unsigned int v11 = a4;
    unsigned int v12 = a5;
    dispatch_async(dtmfQueue, v10);
  }
}

void __61__DTMFEventHandler_sendDTMFEvent_atTimestamp_withSampleRate___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"volume"), "unsignedIntegerValue");
  unsigned __int16 v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"duration"), "unsignedIntegerValue");
  unsigned __int16 v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"interval"), "unsignedIntegerValue");
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithArray:", objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"event"));
  int v6 = [v5 count];
  uint64_t v7 = *(unsigned int *)(a1 + 48);
  HIDWORD(v16[0]) = -1431655766;
  if ([*(id *)(a1 + 40) shouldAdjustForLastPauseCompleteTimestamp:(char *)v16 + 4])
  {
    if ((HIDWORD(v16[0]) - v7) >= 0x7FFFFFFF || HIDWORD(v16[0]) == v7) {
      uint64_t v7 = v7;
    }
    else {
      uint64_t v7 = HIDWORD(v16[0]);
    }
  }
  if (v6 >= 1)
  {
    uint64_t v9 = 0;
    BOOL v11 = v3 == 0xFFFF && v6 == 1;
    LODWORD(v16[0]) = v3 - 20;
    while (1)
    {
      unsigned __int8 v12 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", v9, v16[0]), "unsignedIntegerValue");
      int v13 = v12;
      if (v12 >= 0x11u) {
        break;
      }
      [*(id *)(a1 + 40) insertStartBlockWithEvent:v12 volume:v2 timestamp:v7];
      if (!v11)
      {
        uint64_t v7 = *(_DWORD *)(a1 + 52) * LODWORD(v16[0]) / 0x3E8u
           + v7
           + *(_DWORD *)(a1 + 52) * v4 / 0x3E8;
        objc_msgSend(*(id *)(a1 + 40), "insertStopBlockWithEndTimestamp:withPauseCompleteTimestamp:");
      }
      if (v6 == ++v9) {
        goto LABEL_24;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __61__DTMFEventHandler_sendDTMFEvent_atTimestamp_withSampleRate___block_invoke_cold_1(v14, v13, v15);
      }
    }
  }
LABEL_24:
}

- (void)sendingDTMFEventWithTimeStamp:(unsigned int)a3 interval:(unsigned int)a4 RTPHandle:(tagHANDLE *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v27 = -1431655766;
  int v28 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  dtmfQueue = self->dtmfQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__DTMFEventHandler_sendingDTMFEventWithTimeStamp_interval_RTPHandle___block_invoke;
  block[3] = &unk_1E6DB8E88;
  block[4] = self;
  block[5] = &v23;
  unsigned int v18 = a3;
  block[6] = &v19;
  dispatch_sync(dtmfQueue, block);
  if (*((unsigned char *)v24 + 24))
  {
    if (self->currentEventNeedsEndBlock)
    {
      uint64_t v10 = 0;
    }
    else
    {
      unsigned int v11 = self->currentEndTimestamp - a3;
      if (v11) {
        BOOL v12 = v11 > 0x7FFFFFFE;
      }
      else {
        BOOL v12 = 1;
      }
      uint64_t v10 = v12;
    }
    if ([(DTMFEventHandler *)self constructDTMFEventPacketWithEvent:self->currentEvent volume:self->currentVolume durationCounter:self->currentDurationCounter dataBuffer:&v28 isEnd:v10] == 1)++self->currentEventRetransmitFinalPacketCount; {
    int v13 = *((unsigned __int8 *)v20 + 24);
    }
    unsigned int currentStartTimestamp = self->currentStartTimestamp;
    double v15 = micro();
    RTPSendRTP((uint64_t)a5, 117, v13, currentStartTimestamp, &v28, 4u, &v27, 0, v15, (float)a4, 0, 0, 0, 0, 0, 0);
    unint64_t currentEventRetransmitFinalPacketCount = self->currentEventRetransmitFinalPacketCount;
    if (v10)
    {
      if (currentEventRetransmitFinalPacketCount >= 3) {
        self->_currentEventState = 2;
      }
    }
    else if (currentEventRetransmitFinalPacketCount >= 3)
    {
      self->unsigned int currentStartTimestamp = a3;
      self->currentDurationCounter = 1;
      self->unint64_t currentEventRetransmitFinalPacketCount = 0;
    }
    else
    {
      ++self->currentDurationCounter;
    }
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

uint64_t __69__DTMFEventHandler_sendingDTMFEventWithTimeStamp_interval_RTPHandle___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(result + 32);
  if (!*(_DWORD *)(v2 + 24))
  {
    unsigned __int16 v4 = (void *)[*(id *)(v2 + 16) objectAtIndexedSubscript:0];
    if ([v4 objectForKeyedSubscript:@"event"])
    {
      *(_DWORD *)(*(void *)(v1 + 32) + 24) = 1;
      *(unsigned char *)(*(void *)(v1 + 32) + 28) = 1;
      *(void *)(*(void *)(v1 + 32) + 32) = 0;
      *(unsigned char *)(*(void *)(v1 + 32) + 40) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"event"), "unsignedIntegerValue");
      *(unsigned char *)(*(void *)(v1 + 32) + 41) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"volume"), "unsignedIntegerValue");
      *(_DWORD *)(*(void *)(v1 + 32) + 44) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"startTimestamp"), "unsignedIntegerValue");
      *(_DWORD *)(*(void *)(v1 + 32) + 64) = *(_DWORD *)(v1 + 56) - *(_DWORD *)(*(void *)(v1 + 32) + 44);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        int v6 = *MEMORY[0x1E4F47A50];
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v8 = *(void *)(v1 + 32);
            int v9 = *(_DWORD *)(v8 + 64);
            int v10 = *(unsigned __int8 *)(v8 + 40);
            int v11 = *(_DWORD *)(v1 + 56);
            LODWORD(v8) = *(_DWORD *)(v8 + 44);
            *(_DWORD *)v20 = 136316674;
            *(void *)&v20[4] = v5;
            *(_WORD *)&v20[12] = 2080;
            *(void *)&v20[14] = "-[DTMFEventHandler sendingDTMFEventWithTimeStamp:interval:RTPHandle:]_block_invoke";
            *(_WORD *)&v20[22] = 1024;
            *(_DWORD *)uint64_t v21 = 181;
            *(_WORD *)&v21[4] = 1024;
            *(_DWORD *)&v21[6] = v9;
            __int16 v22 = 1024;
            int v23 = v10;
            __int16 v24 = 1024;
            int v25 = v11;
            __int16 v26 = 1024;
            int v27 = v8;
            _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Timestamp delta between the current packet timestamp and the timestamp when the DTMF event was originated from IPT=%d, current event=%d, timestamp=%d, currentStartTimestamp=%d", v20, 0x34u);
          }
        }
        else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = *(void *)(v1 + 32);
          int v17 = *(_DWORD *)(v16 + 64);
          int v18 = *(unsigned __int8 *)(v16 + 40);
          int v19 = *(_DWORD *)(v1 + 56);
          LODWORD(v16) = *(_DWORD *)(v16 + 44);
          *(_DWORD *)v20 = 136316674;
          *(void *)&v20[4] = v5;
          *(_WORD *)&v20[12] = 2080;
          *(void *)&v20[14] = "-[DTMFEventHandler sendingDTMFEventWithTimeStamp:interval:RTPHandle:]_block_invoke";
          *(_WORD *)&v20[22] = 1024;
          *(_DWORD *)uint64_t v21 = 181;
          *(_WORD *)&v21[4] = 1024;
          *(_DWORD *)&v21[6] = v17;
          __int16 v22 = 1024;
          int v23 = v18;
          __int16 v24 = 1024;
          int v25 = v19;
          __int16 v26 = 1024;
          int v27 = v16;
          _os_log_debug_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Timestamp delta between the current packet timestamp and the timestamp when the DTMF event was originated from IPT=%d, current event=%d, timestamp=%d, currentStartTimestamp=%d", v20, 0x34u);
        }
      }
      *(_DWORD *)(*(void *)(v1 + 32) + 44) += *(_DWORD *)(*(void *)(v1 + 32) + 64);
      *(void *)(*(void *)(v1 + 32) + 48) = 1;
      *(_DWORD *)(*(void *)(v1 + 32) + 56) = 0;
      *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
      return objc_msgSend(*(id *)(*(void *)(v1 + 32) + 16), "removeObjectAtIndex:", 0, *(_OWORD *)v20, *(void *)&v20[16], *(void *)v21);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_19;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)v20 = 136315650;
    *(void *)&v20[4] = v15;
    *(_WORD *)&v20[12] = 2080;
    *(void *)&v20[14] = "-[DTMFEventHandler sendingDTMFEventWithTimeStamp:interval:RTPHandle:]_block_invoke";
    *(_WORD *)&v20[22] = 1024;
    *(_DWORD *)uint64_t v21 = 170;
    uint64_t v14 = " [%s] %s:%d DTMF: error, not a start block";
    goto LABEL_18;
  }
  if (*(unsigned char *)(v2 + 28))
  {
    result = [*(id *)(v2 + 16) count];
    if (result)
    {
      unsigned __int16 v3 = (void *)[*(id *)(*(void *)(v1 + 32) + 16) objectAtIndexedSubscript:0];
      if ([v3 objectForKeyedSubscript:@"endTimestamp"]
        && [v3 objectForKeyedSubscript:@"pauseCompleteTimestamp"])
      {
        *(_DWORD *)(*(void *)(v1 + 32) + 52) = *(_DWORD *)(*(void *)(v1 + 32) + 64)
                                                 + objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"endTimestamp"), "unsignedIntegerValue");
        *(_DWORD *)(*(void *)(v1 + 32) + 56) = *(_DWORD *)(*(void *)(v1 + 32) + 64)
                                                 + objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"pauseCompleteTimestamp"), "unsignedIntegerValue");
        *(unsigned char *)(*(void *)(v1 + 32) + 28) = 0;
        return objc_msgSend(*(id *)(*(void *)(v1 + 32) + 16), "removeObjectAtIndex:", 0, *(_OWORD *)v20, *(void *)&v20[16], *(void *)v21);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v12 = VRTraceErrorLogLevelToCSTR(),
            int v13 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_19:
        *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 0;
        return objc_msgSend(*(id *)(*(void *)(v1 + 32) + 16), "removeObjectAtIndex:", 0, *(_OWORD *)v20, *(void *)&v20[16], *(void *)v21);
      }
      *(_DWORD *)v20 = 136315650;
      *(void *)&v20[4] = v12;
      *(_WORD *)&v20[12] = 2080;
      *(void *)&v20[14] = "-[DTMFEventHandler sendingDTMFEventWithTimeStamp:interval:RTPHandle:]_block_invoke";
      *(_WORD *)&v20[22] = 1024;
      *(_DWORD *)uint64_t v21 = 196;
      uint64_t v14 = " [%s] %s:%d DTMF: error, not a stop block";
LABEL_18:
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v14, v20, 0x1Cu);
      goto LABEL_19;
    }
  }
  return result;
}

- (void)stopDTMFEventAtTimestamp:(unsigned int)a3 withSampleRate:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dtmfQueue = self->dtmfQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__DTMFEventHandler_stopDTMFEventAtTimestamp_withSampleRate___block_invoke;
  block[3] = &unk_1E6DB4568;
  unsigned int v6 = a3;
  unsigned int v7 = a4;
  block[4] = self;
  dispatch_async(dtmfQueue, block);
}

uint64_t __60__DTMFEventHandler_stopDTMFEventAtTimestamp_withSampleRate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertStopBlockWithEndTimestamp:*(unsigned int *)(a1 + 40) withPauseCompleteTimestamp:120 * *(_DWORD *)(a1 + 44) / 0x3E8u + *(_DWORD *)(a1 + 40)];
}

- (BOOL)shouldTransmitDTMFWithTimestamp:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = -86;
  dtmfQueue = self->dtmfQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__DTMFEventHandler_shouldTransmitDTMFWithTimestamp___block_invoke;
  v6[3] = &unk_1E6DB6790;
  unsigned int v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(dtmfQueue, v6);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __52__DTMFEventHandler_shouldTransmitDTMFWithTimestamp___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (result
    && (uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectAtIndexedSubscript:", 0), "objectForKey:", @"startTimestamp")) != 0)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectAtIndexedSubscript:", 0), "objectForKey:", @"startTimestamp"), "unsignedIntegerValue");
    unsigned int v3 = result - *(_DWORD *)(a1 + 48);
    if (v3) {
      BOOL v4 = v3 > 0x7FFFFFFE;
    }
    else {
      BOOL v4 = 1;
    }
    char v5 = v4;
  }
  else
  {
    char v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(_DWORD *)(v6 + 24);
  if (v7 == 2)
  {
    unsigned int v8 = *(_DWORD *)(v6 + 56) - *(_DWORD *)(a1 + 48);
    if (v8) {
      BOOL v9 = v8 >= 0x7FFFFFFF;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      return result;
    }
    *(_DWORD *)(v6 + 24) = 0;
  }
  else if (v7 == 1)
  {
    char v5 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  return result;
}

- (int)constructDTMFEventPacketWithEvent:(unsigned __int8)a3 volume:(unsigned __int8)a4 durationCounter:(unsigned int)a5 dataBuffer:(char *)a6 isEnd:(BOOL)a7
{
  *a6 = a3;
  if (a7) {
    char v7 = 0x80;
  }
  else {
    char v7 = 0;
  }
  a6[1] = v7 & 0xC0 | a4 & 0x3F;
  unsigned int v8 = self->_rtpEventDuration * a5;
  if (v8 >= 0xFFFF) {
    unsigned int v9 = 0xFFFF;
  }
  else {
    unsigned int v9 = self->_rtpEventDuration * a5;
  }
  *((_WORD *)a6 + 1) = bswap32(v9) >> 16;
  return v8 > 0xFFFE || a7;
}

- (BOOL)shouldAdjustForLastPauseCompleteTimestamp:(unsigned int *)a3
{
  if ([(NSMutableArray *)self->dtmfEventQueue count]
    && (char v5 = objc_msgSend((id)-[NSMutableArray lastObject](self->dtmfEventQueue, "lastObject"), "objectForKeyedSubscript:", @"pauseCompleteTimestamp")) != 0)
  {
    unsigned int currentPauseCompleteTimestamp = [v5 unsignedIntegerValue];
  }
  else
  {
    if (!self->_currentEventState || self->currentEventNeedsEndBlock) {
      return 0;
    }
    unsigned int currentPauseCompleteTimestamp = self->_currentPauseCompleteTimestamp;
  }
  *a3 = currentPauseCompleteTimestamp;
  return 1;
}

void __61__DTMFEventHandler_sendDTMFEvent_atTimestamp_withSampleRate___block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = "-[DTMFEventHandler sendDTMFEvent:atTimestamp:withSampleRate:]_block_invoke";
  __int16 v7 = 1024;
  int v8 = 139;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d DTMF: error, unsupported event %u", (uint8_t *)&v3, 0x22u);
}

@end