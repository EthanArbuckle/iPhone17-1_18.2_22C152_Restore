@interface BLEMIDITimeStamper
- (BLEMIDITimeStamper)init;
- (BOOL)offsetIsUsable:(unsigned __int16)a3 numberOfWraps:(unsigned __int16 *)a4;
- (int)modsignWithTimeDifference:(int64_t)a3 range:(unsigned __int16)a4;
- (unint64_t)generateTimeStampForOffset:(unsigned __int16)a3;
- (void)addOffset:(unsigned __int16)a3;
- (void)reset;
- (void)setConnectionIntervalNanos:(unint64_t)a3;
- (void)setReceiveTime:(unint64_t)a3;
@end

@implementation BLEMIDITimeStamper

- (BLEMIDITimeStamper)init
{
  v3.receiver = self;
  v3.super_class = (Class)BLEMIDITimeStamper;
  result = [(BLEMIDITimeStamper *)&v3 init];
  if (result) {
    result->hasBeenReset = 1;
  }
  return result;
}

- (void)reset
{
  self->lastReceivedOffset = 0;
  self->lastGeneratedTimestamp = 0;
  self->lastReceivedOffsetTimestamp = 0;
  self->lastReceivedTime = 0;
  self->hasBeenReset = 1;
}

- (void)setConnectionIntervalNanos:(unint64_t)a3
{
  self->averageWaitTime_ns = (3 * a3) >> 1;
  self->connectionInterval_ns = a3;
}

- (void)setReceiveTime:(unint64_t)a3
{
  unint64_t receivedTime = self->receivedTime;
  unint64_t connectionInterval_ns = self->connectionInterval_ns;
  if (a3 - receivedTime <= connectionInterval_ns / 0xF4240) {
    unint64_t v6 = self->connectionInterval_ns;
  }
  else {
    unint64_t v6 = 3 * connectionInterval_ns;
  }
  self->unint64_t receivedTime = a3;
  self->unint64_t lastReceivedTime = receivedTime;
  self->lastReceivedOffsetTimestamp = self->lastGeneratedTimestamp;
  self->averageWaitTime_ns = v6 >> 1;
  self->firstOffset = -1;
  sub_BFCC();
  v7 = qword_1DDD8;
  if (os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v8 = self->receivedTime;
    unint64_t lastReceivedTime = self->lastReceivedTime;
    int v10 = 136316162;
    v11 = "BTLEMIDITimeStamper.mm";
    __int16 v12 = 1024;
    int v13 = 62;
    __int16 v14 = 2048;
    unint64_t v15 = v8;
    __int16 v16 = 2048;
    unint64_t v17 = lastReceivedTime;
    __int16 v18 = 2048;
    unint64_t v19 = v8 - lastReceivedTime;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d receiveTime = %llu, unint64_t lastReceivedTime = %llu (delta = %llu)", (uint8_t *)&v10, 0x30u);
  }
}

- (void)addOffset:(unsigned __int16)a3
{
  int v3 = a3;
  if (!self->hasBeenReset)
  {
    sub_BFCC();
    v5 = qword_1DDD8;
    if (os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_DEBUG))
    {
      int lastReceivedOffset = self->lastReceivedOffset;
      int v7 = 136316162;
      unint64_t v8 = "BTLEMIDITimeStamper.mm";
      __int16 v9 = 1024;
      int v10 = 68;
      __int16 v11 = 1024;
      int v12 = v3;
      __int16 v13 = 1024;
      int v14 = lastReceivedOffset;
      __int16 v15 = 1024;
      int v16 = v3 - lastReceivedOffset;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d this offset = %d, int lastReceivedOffset = %d (delta = %d)", (uint8_t *)&v7, 0x24u);
    }
  }
  self->hasBeenReset = 0;
  self->int lastReceivedOffset = v3;
}

- (unint64_t)generateTimeStampForOffset:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  unint64_t v5 = a3;
  unsigned __int16 v22 = 0;
  unint64_t lastReceivedTime = self->lastReceivedTime;
  if (lastReceivedTime)
  {
    if ([(BLEMIDITimeStamper *)self offsetIsUsable:a3 numberOfWraps:&v22])
    {
      if (self->lastReceivedOffset <= v3) {
        unint64_t lastReceivedTime = v3;
      }
      else {
        unint64_t lastReceivedTime = v3 + 0x2000;
      }
      unint64_t v5 = lastReceivedTime + ((unint64_t)v22 << 13);
      LOBYTE(lastReceivedTime) = 1;
    }
    else
    {
      sub_BFCC();
      int v7 = qword_1DDD8;
      if (os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "BTLEMIDITimeStamper.mm";
        __int16 v25 = 1024;
        int v26 = 88;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%25s:%-5d Offset not usable. Resetting ...", buf, 0x12u);
      }
      [(BLEMIDITimeStamper *)self reset];
      LOBYTE(lastReceivedTime) = 0;
    }
  }
  int firstOffset = self->firstOffset;
  if (firstOffset != -1)
  {
    uint64_t v9 = (int)(v5 - firstOffset + ((int)v5 - firstOffset < 0 ? 0x2000 : 0));
    if (lastReceivedTime) {
      goto LABEL_12;
    }
LABEL_17:
    unint64_t receivedTime = self->receivedTime;
    unint64_t lastGeneratedTimestamp = receivedTime + v9 - self->averageWaitTime_ns / 0xF4240;
    goto LABEL_18;
  }
  uint64_t v9 = 0;
  self->int firstOffset = v3;
  if ((lastReceivedTime & 1) == 0) {
    goto LABEL_17;
  }
LABEL_12:
  unint64_t lastGeneratedTimestamp = v5 - self->lastReceivedOffset + self->lastReceivedOffsetTimestamp;
  unint64_t receivedTime = self->receivedTime;
  if (lastGeneratedTimestamp > receivedTime)
  {
    sub_BFCC();
    int v12 = qword_1DDD8;
    if (os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_INFO))
    {
      unint64_t v13 = lastGeneratedTimestamp - self->receivedTime;
      *(_DWORD *)buf = 136315650;
      v24 = "BTLEMIDITimeStamper.mm";
      __int16 v25 = 1024;
      int v26 = 115;
      __int16 v27 = 2048;
      *(void *)v28 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "%25s:%-5d Timestamp not allowed to jump into the future %llu ms.", buf, 0x1Cu);
    }
    unint64_t receivedTime = self->receivedTime;
    unint64_t lastGeneratedTimestamp = receivedTime;
  }
LABEL_18:
  if (lastGeneratedTimestamp >= self->lastGeneratedTimestamp)
  {
    if (lastGeneratedTimestamp < receivedTime - self->averageWaitTime_ns)
    {
      sub_BFCC();
      int v16 = qword_1DDD8;
      if (os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_INFO))
      {
        unint64_t v17 = self->receivedTime - lastGeneratedTimestamp;
        *(_DWORD *)buf = 136315906;
        v24 = "BTLEMIDITimeStamper.mm";
        __int16 v25 = 1024;
        int v26 = 125;
        __int16 v27 = 2048;
        *(void *)v28 = lastGeneratedTimestamp;
        *(_WORD *)&v28[8] = 2048;
        unint64_t v29 = v17;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%25s:%-5d Late timestamp %llu being applied (%llu ms in the past)", buf, 0x26u);
      }
    }
  }
  else
  {
    sub_BFCC();
    int v14 = qword_1DDD8;
    if (os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_INFO))
    {
      unint64_t v15 = self->lastGeneratedTimestamp - lastGeneratedTimestamp;
      *(_DWORD *)buf = 136315650;
      v24 = "BTLEMIDITimeStamper.mm";
      __int16 v25 = 1024;
      int v26 = 122;
      __int16 v27 = 2048;
      *(void *)v28 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%25s:%-5d Timestamp not allowed to jump backwards %llu ms.", buf, 0x1Cu);
    }
    unint64_t lastGeneratedTimestamp = self->lastGeneratedTimestamp;
  }
  sub_BFCC();
  __int16 v18 = qword_1DDD8;
  if (os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_DEBUG))
  {
    int lastReceivedOffset = self->lastReceivedOffset;
    unint64_t v20 = lastGeneratedTimestamp - self->lastReceivedOffsetTimestamp;
    *(_DWORD *)buf = 136316674;
    v24 = "BTLEMIDITimeStamper.mm";
    __int16 v25 = 1024;
    int v26 = 128;
    __int16 v27 = 1024;
    *(_DWORD *)v28 = v3;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = lastReceivedOffset;
    LOWORD(v29) = 1024;
    *(_DWORD *)((char *)&v29 + 2) = v3 - lastReceivedOffset;
    HIWORD(v29) = 2048;
    unint64_t v30 = lastGeneratedTimestamp;
    __int16 v31 = 2048;
    unint64_t v32 = v20;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d Generated timestamp for offset %d (int lastReceivedOffset = %d, delta = %d) => %llu (delta = %llu)", buf, 0x38u);
  }
  self->unint64_t lastGeneratedTimestamp = lastGeneratedTimestamp;
  return lastGeneratedTimestamp;
}

- (BOOL)offsetIsUsable:(unsigned __int16)a3 numberOfWraps:(unsigned __int16 *)a4
{
  unint64_t v4 = self->receivedTime - self->lastReceivedTime;
  int lastReceivedOffset = self->lastReceivedOffset;
  BOOL v6 = __OFSUB__(a3, lastReceivedOffset);
  int v7 = a3 - lastReceivedOffset;
  if (v7 < 0 != v6) {
    int v8 = v7 + 0x2000;
  }
  else {
    int v8 = v7;
  }
  uint64_t v9 = v4 - v8;
  if (v9 > -4097)
  {
    int v16 = [(BLEMIDITimeStamper *)self modsignWithTimeDifference:v4 - v8 range:0x2000];
    if (v16 >= 0) {
      unsigned int v17 = v16;
    }
    else {
      unsigned int v17 = -v16;
    }
    if (v17 < 0xC78)
    {
      *a4 = ((v9 + 12288) >> 13) - 1;
      LOBYTE(v11) = 1;
      return v11;
    }
    int v18 = v16;
    sub_BFCC();
    uint64_t v19 = qword_1DDD8;
    BOOL v11 = os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_INFO);
    if (v11)
    {
      int v21 = 136316162;
      unsigned __int16 v22 = "BTLEMIDITimeStamper.mm";
      __int16 v23 = 1024;
      int v24 = 157;
      __int16 v25 = 2048;
      unint64_t v26 = v4;
      __int16 v27 = 1024;
      int v28 = v8;
      __int16 v29 = 1024;
      LODWORD(v30) = v18;
      int v12 = "%25s:%-5d Bluetooth timestamp is too far away from center line. ltd = %llu, od = %d, m = %d";
      unint64_t v13 = v19;
      uint32_t v14 = 40;
      goto LABEL_13;
    }
  }
  else
  {
    sub_BFCC();
    uint64_t v10 = qword_1DDD8;
    BOOL v11 = os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_INFO);
    if (v11)
    {
      int v21 = 136316162;
      unsigned __int16 v22 = "BTLEMIDITimeStamper.mm";
      __int16 v23 = 1024;
      int v24 = 149;
      __int16 v25 = 2048;
      unint64_t v26 = v4;
      __int16 v27 = 1024;
      int v28 = v8;
      __int16 v29 = 2048;
      unint64_t v30 = v4 - v8;
      int v12 = "%25s:%-5d Bluetooth timestamp is in ambiguous territory. ltd = %llu, od = %d, diff = %lld";
      unint64_t v13 = v10;
      uint32_t v14 = 44;
LABEL_13:
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v21, v14);
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

- (int)modsignWithTimeDifference:(int64_t)a3 range:(unsigned __int16)a4
{
  int v4 = a3 % a4;
  if (v4 >= a4 >> 1) {
    int v5 = a4;
  }
  else {
    int v5 = 0;
  }
  if (v4 >= -(a4 >> 1)) {
    int v6 = -v5;
  }
  else {
    int v6 = a4;
  }
  return v6 + v4;
}

@end