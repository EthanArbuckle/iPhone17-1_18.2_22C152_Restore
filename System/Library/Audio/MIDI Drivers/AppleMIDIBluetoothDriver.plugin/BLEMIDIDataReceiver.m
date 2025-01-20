@interface BLEMIDIDataReceiver
- (BLEMIDIDataReceiver)init;
- (BLEMIDIDataReceiver)initWithEndpoint:(unsigned int)a3 owner:(MIDIDriverInterface *)a4;
- (const)nextMIDIEventFrom:(const char *)a3 to:(const char *)a4;
- (id).cxx_construct;
- (unint64_t)nowInMS;
- (void)dealloc;
- (void)unpackValue:(id)a3;
@end

@implementation BLEMIDIDataReceiver

- (BLEMIDIDataReceiver)init
{
  sub_C7C0();
  v2 = qword_1DDE8;
  if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "BTLEMIDIDataReceiver.mm";
    __int16 v6 = 1024;
    int v7 = 24;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d Do not call init. Instead call initWithEndpoint.", (uint8_t *)&v4, 0x12u);
  }
  return 0;
}

- (BLEMIDIDataReceiver)initWithEndpoint:(unsigned int)a3 owner:(MIDIDriverInterface *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BLEMIDIDataReceiver;
  __int16 v6 = [(BLEMIDIDataReceiver *)&v9 init];
  int v7 = v6;
  if (v6)
  {
    v6->endpoint = a3;
    v6->driver = a4;
    v6->packetEmitter.mEP = a3;
    v6->timeStamper = objc_alloc_init(BLEMIDITimeStamper);
    v7->logBuffer[0] = 0;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BLEMIDIDataReceiver;
  [(BLEMIDIDataReceiver *)&v3 dealloc];
}

- (unint64_t)nowInMS
{
  return __udivti3() / 0xF4240uLL;
}

- (const)nextMIDIEventFrom:(const char *)a3 to:(const char *)a4
{
  unsigned int v4 = *(unsigned __int8 *)a3 >> 4;
  if (v4 > 0xF) {
    goto LABEL_11;
  }
  if (((1 << v4) & 0x4F00) != 0)
  {
LABEL_3:
    v5 = a3 + 3;
    goto LABEL_6;
  }
  if (((1 << v4) & 0x3000) != 0)
  {
LABEL_5:
    v5 = a3 + 2;
    goto LABEL_6;
  }
  if (v4 == 15)
  {
    switch(*a3)
    {
      case 0xF0:
        goto LABEL_11;
      case 0xF1:
      case 0xF3:
        goto LABEL_5;
      case 0xF2:
        goto LABEL_3;
      default:
        v5 = a3 + 1;
        break;
    }
  }
  else
  {
LABEL_11:
    int v7 = a3 + 1;
    do
    {
      v5 = v7;
      if (v7 >= a4) {
        break;
      }
      ++v7;
    }
    while ((*v5 & 0x80000000) == 0);
  }
LABEL_6:
  if (v5 >= a4) {
    return a4;
  }
  else {
    return v5;
  }
}

- (void)unpackValue:(id)a3
{
  driver = self->driver;
  uint64_t v6 = (uint64_t)[a3 length];
  int v7 = (char *)[a3 bytes];
  if (*((unsigned char *)driver + 88)) {
    return;
  }
  v8 = v7;
  unint64_t v9 = [(BLEMIDIDataReceiver *)self nowInMS];
  [(BLEMIDITimeStamper *)self->timeStamper setConnectionIntervalNanos:driver[32]];
  [(BLEMIDITimeStamper *)self->timeStamper setReceiveTime:v9];
  int v10 = *v8;
  if ((*v8 & 0x80000000) == 0)
  {
    sub_C7C0();
    uint64_t v11 = qword_1DDE8;
    if (!os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_58;
    }
    *(_DWORD *)buf = 136315650;
    v52 = "BTLEMIDIDataReceiver.mm";
    __int16 v53 = 1024;
    int v54 = 128;
    __int16 v55 = 1024;
    LODWORD(v56[0]) = v10;
    v12 = "%25s:%-5d ERROR: Bad header received (0x%0X). Discarding.";
    v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 24;
LABEL_57:
    _os_log_impl(&dword_0, v13, v14, v12, buf, v15);
    goto LABEL_58;
  }
  if ((v10 & 0x40) != 0) {
    int v16 = v10 & 0x3F;
  }
  else {
    int v16 = v10 & 0x7F;
  }
  unsigned int v47 = v16;
  if ((v10 & 0x7Fu) > 0x3F)
  {
    sub_C7C0();
    uint64_t v17 = qword_1DDE8;
    if ((v10 & 0x3F) != 0)
    {
      if (!os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_58;
      }
      *(_DWORD *)buf = 136315394;
      v52 = "BTLEMIDIDataReceiver.mm";
      __int16 v53 = 1024;
      int v54 = 146;
      v12 = "%25s:%-5d Invalid control message received. Discarding packet.";
      v13 = v17;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_58;
      }
      *(_DWORD *)buf = 136315394;
      v52 = "BTLEMIDIDataReceiver.mm";
      __int16 v53 = 1024;
      int v54 = 142;
      v12 = "%25s:%-5d Ignoring packet due to kBLEMIDIControlMessageIgnorePayload message.";
      v13 = v17;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
    }
    uint32_t v15 = 18;
    goto LABEL_57;
  }
  if (v6 < 2)
  {
    unsigned __int16 v46 = 0;
LABEL_51:
    if (self->packetEmitter.mIsDirty) {
      sub_D118((MIDIPacketList *)&self->packetEmitter);
    }
    -[BLEMIDITimeStamper addOffset:](self->timeStamper, "addOffset:", v46, v43);
    return;
  }
  id v43 = a3;
  unint64_t v44 = v9;
  int v49 = 0;
  int v18 = 0;
  uint64_t v19 = 0;
  unsigned __int16 v46 = 0;
  MIDITimeStamp time = 0;
  v20 = &v8[v6];
  v21 = (char *)(v6 - 1);
  v22 = (unsigned __int8 *)(v8 + 1);
  v45 = (unsigned __int8 *)&v8[v6];
  while (1)
  {
    int v23 = (char)*v22;
    if ((v23 & 0x80000000) == 0)
    {
      if (v22 == (unsigned __int8 *)(v8 + 1))
      {
        MIDITimeStamp time = self->lastSysExTimeStamp;
        if (v22 >= (unsigned __int8 *)v20)
        {
LABEL_43:
          LOWORD(v29) = (_WORD)v21;
        }
        else
        {
          uint64_t v29 = 0;
          while (((char)v22[v29] & 0x80000000) == 0)
          {
            if (v45 - v22 == ++v29) {
              goto LABEL_43;
            }
          }
          int v18 = 0;
        }
        goto LABEL_35;
      }
      if (!v18)
      {
        sub_C7C0();
        v39 = qword_1DDE8;
        if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v52 = "BTLEMIDIDataReceiver.mm";
          __int16 v53 = 1024;
          int v54 = 162;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: Expected a timestamp byte, concurrent running status, or SysEx continuation. The full packet will be logged below.", buf, 0x12u);
        }
        +[BLEMIDIAccessor logEvent:length:timeStamp:intoBuffer:](BLEMIDIAccessor, "logEvent:length:timeStamp:intoBuffer:", objc_msgSend(v43, "bytes", v43), (unsigned __int16)objc_msgSend(v43, "length"), v44, self->logBuffer);
        sub_C7C0();
        uint64_t v41 = qword_1DDE8;
        if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v52 = "BTLEMIDIDataReceiver.mm";
          __int16 v53 = 1024;
          int v54 = 164;
          __int16 v55 = 2080;
          v56[0] = self->logBuffer;
          v12 = "%25s:%-5d %s";
LABEL_68:
          v13 = v41;
          os_log_type_t v14 = OS_LOG_TYPE_ERROR;
          uint32_t v15 = 28;
          goto LABEL_57;
        }
        goto LABEL_58;
      }
      goto LABEL_20;
    }
    int v48 = v18;
    v24 = v20;
    v26 = (char *)(v22 + 1);
    int v25 = (char)v22[1];
    uint64_t v27 = v23 & 0x7F;
    v28 = v21 - 1;
    v49 |= v27 < v19;
    unsigned __int16 v46 = (unsigned __int16)+[BLEMIDIAccessor reconstructWithHighByte:v47 lowByte:v27 overflow:v49 & 1] & 0x1FFF;
    -[BLEMIDITimeStamper generateTimeStampForOffset:](self->timeStamper, "generateTimeStampForOffset:");
    MIDITimeStamp time = __udivti3();
    self->lastSysExTimeStamp = time;
    if (v25 < 0)
    {
      v20 = v24;
      if (*v26 == 245)
      {
        sub_C7C0();
        v36 = qword_1DDE8;
        int v18 = v48;
        if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_DEBUG))
        {
          int v37 = v22[1];
          int v38 = v22[2];
          *(_DWORD *)buf = 136315906;
          v52 = "BTLEMIDIDataReceiver.mm";
          __int16 v53 = 1024;
          int v54 = 213;
          __int16 v55 = 1024;
          LODWORD(v56[0]) = v37;
          WORD2(v56[0]) = 1024;
          *(_DWORD *)((char *)v56 + 6) = v38;
          _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: Discarding 2-byte message: 0x%0X 0x%0X", buf, 0x1Eu);
        }
        v26 = (char *)(v22 + 3);
        v28 = v21 - 3;
      }
      else
      {
        int v18 = v48;
      }
      goto LABEL_21;
    }
    --v21;
    uint64_t v19 = v27;
    ++v22;
    v20 = v24;
    int v18 = v48;
    if (!v48) {
      break;
    }
LABEL_20:
    *(v22 - 1) = v18;
    v28 = v21 + 1;
    uint64_t v27 = v19;
    v26 = (char *)(v22 - 1);
LABEL_21:
    LOWORD(v29) = (unsigned __int16)-[BLEMIDIDataReceiver nextMIDIEventFrom:to:](self, "nextMIDIEventFrom:to:", v26, v20, v43)- (_WORD)v26;
    unsigned int v30 = *v26;
    int v31 = v30 & 0xF8;
    if (v30 <= 0xF7) {
      v32 = v8;
    }
    else {
      v32 = v26;
    }
    BOOL v33 = v31 == 240;
    if (v31 == 240) {
      int v34 = 0;
    }
    else {
      int v34 = v18;
    }
    if (v33) {
      v32 = v8;
    }
    if ((char)v30 >= -16) {
      int v18 = v34;
    }
    else {
      int v18 = *v26;
    }
    if ((char)v30 >= -16) {
      v8 = v32;
    }
    uint64_t v19 = v27;
    v21 = v28;
    v22 = (unsigned __int8 *)v26;
LABEL_35:
    uint64_t v35 = (unsigned __int16)v29;
    if ((_WORD)v29)
    {
      self->packetEmitter.mIsDirty = 1;
      sub_1798((uint64_t)&self->packetEmitter, time, (unsigned __int16)v29, v22);
    }
    v21 -= v35;
    v22 += v35;
    if (v22 >= (unsigned __int8 *)v20) {
      goto LABEL_51;
    }
  }
  sub_C7C0();
  v42 = qword_1DDE8;
  if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "BTLEMIDIDataReceiver.mm";
    __int16 v53 = 1024;
    int v54 = 204;
    _os_log_impl(&dword_0, v42, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: Discarding malformed packet. The full packet will be logged below.", buf, 0x12u);
  }
  +[BLEMIDIAccessor logEvent:length:timeStamp:intoBuffer:](BLEMIDIAccessor, "logEvent:length:timeStamp:intoBuffer:", objc_msgSend(v43, "bytes", v43), (unsigned __int16)objc_msgSend(v43, "length"), v44, self->logBuffer);
  sub_C7C0();
  uint64_t v41 = qword_1DDE8;
  if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v52 = "BTLEMIDIDataReceiver.mm";
    __int16 v53 = 1024;
    int v54 = 206;
    __int16 v55 = 2080;
    v56[0] = self->logBuffer;
    v12 = "%25s:%-5d %s";
    goto LABEL_68;
  }
LABEL_58:
  self->packetEmitter.mCurPacket = MIDIPacketListInit((MIDIPacketList *)self->packetEmitter.mBuf);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end