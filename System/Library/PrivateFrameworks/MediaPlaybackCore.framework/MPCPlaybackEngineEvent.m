@interface MPCPlaybackEngineEvent
+ (MPCPlaybackEngineEvent)eventFromRowResult:(uint64_t)a1;
- ($C192BC3A89177E9F9906E5732115C753)monotonicTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPayload:(id)a3;
- (MPCPlaybackEngineEvent)initWithType:(id)a3 payload:(id)a4 monotonicTime:(id *)a5 threadPriority:(int)a6 identifier:(id)a7;
- (NSDate)date;
- (NSDate)monotonicDate;
- (NSDictionary)payload;
- (NSString)type;
- (NSUUID)identifier;
- (double)durationSinceEvent:(id)a3;
- (double)timeIntervalSinceEvent:(id)a3;
- (id)description;
- (id)earlierEvent:(id)a3;
- (id)previousItemEventWithCursor:(id)a3 type:(id)a4;
- (int)threadPriority;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)machAbsoluteTime;
- (unint64_t)monotonicTimeNanoSeconds;
@end

@implementation MPCPlaybackEngineEvent

- (int)threadPriority
{
  return self->_threadPriority;
}

- (NSString)type
{
  return self->_type;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (int64_t)compare:(id)a3
{
  unint64_t rawNanoSeconds = self->_monotonicTime.rawNanoSeconds;
  unint64_t timebase = self->_monotonicTime.timebase;
  if (a3)
  {
    id v5 = a3;
    [v5 monotonicTime];
    uint64_t v6 = v12;
    [v5 monotonicTime];

    unint64_t v7 = v11 + v6;
  }
  else
  {
    unint64_t v7 = 0;
  }
  BOOL v8 = rawNanoSeconds + timebase >= v7;
  int64_t v9 = rawNanoSeconds + timebase > v7;
  if (v8) {
    return v9;
  }
  else {
    return -1;
  }
}

- ($C192BC3A89177E9F9906E5732115C753)monotonicTime
{
  long long v3 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var2 = v3;
  *(void *)&retstr->var4 = self[2].var0;
  return self;
}

+ (MPCPlaybackEngineEvent)eventFromRowResult:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = a2;
  self;
  long long v3 = (void *)MEMORY[0x263F08C38];
  v4 = [v2 dataValueAtColumnIndex:0];
  id v5 = objc_msgSend(v3, "msv_UUIDWithData:", v4);

  uint64_t v6 = [v2 stringValueAtColumnIndex:1];
  uint64_t v7 = [v2 uint64ValueAtColumnIndex:2];
  uint64_t v8 = [v2 uint64ValueAtColumnIndex:3];
  unint64_t v9 = [v2 uint64ValueAtColumnIndex:4];
  unint64_t v10 = [v2 uint64ValueAtColumnIndex:5];
  MSVGetKernelBootTime();
  double v12 = v11;
  uint64_t v13 = [v2 uint64ValueAtColumnIndex:6];
  id v28 = 0;
  v14 = [v2 jsonValueAtColumnIndex:7 error:&v28];
  id v15 = v28;
  if (v15)
  {
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17 = [v2 stringValueAtColumnIndex:6];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_FAULT, "[EVS:…] eventFromRowResult:… | failed to build event [json decode failure] error=%{public}@ payload=%{public}@", buf, 0x16u);
    }
    v18 = 0;
  }
  else
  {
    uint64_t v27 = v13;
    uint64_t v19 = v8;
    uint64_t v20 = v7;
    v21 = v6;
    v22 = v5;
    if (v12 * 1000000000.0 == (double)v9) {
      uint64_t v23 = 3;
    }
    else {
      uint64_t v23 = 1;
    }
    double v24 = (double)v10 / 1000000000.0;
    v16 = MPCPlaybackEngineEventPayloadFromPayloadJSON(v14);
    v25 = [MPCPlaybackEngineEvent alloc];
    *(void *)buf = v23;
    *(void *)&buf[8] = v20;
    id v5 = v22;
    uint64_t v6 = v21;
    *(void *)&buf[16] = v19;
    unint64_t v30 = v9;
    double v31 = v24;
    v18 = [(MPCPlaybackEngineEvent *)v25 initWithType:v21 payload:v16 monotonicTime:buf threadPriority:v27 identifier:v5];
  }

  return v18;
}

- (MPCPlaybackEngineEvent)initWithType:(id)a3 payload:(id)a4 monotonicTime:(id *)a5 threadPriority:(int)a6 identifier:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"MPCPlaybackEngineEvent.m", 116, @"Invalid parameter not satisfying: %@", @"payload" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"MPCPlaybackEngineEvent.m", 115, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  double v24 = [MEMORY[0x263F08690] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"MPCPlaybackEngineEvent.m", 117, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)MPCPlaybackEngineEvent;
  v17 = [(MPCPlaybackEngineEvent *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_type, a3);
    objc_storeStrong((id *)&v18->_payload, a4);
    objc_storeStrong((id *)&v18->_identifier, a7);
    long long v19 = *(_OWORD *)&a5->var0;
    long long v20 = *(_OWORD *)&a5->var2;
    v18->_monotonicTime.userSecondsSinceReferenceDate = a5->var4;
    *(_OWORD *)&v18->_monotonicTime.flags = v19;
    *(_OWORD *)&v18->_monotonicTime.unint64_t rawNanoSeconds = v20;
    v18->_threadPriority = a6;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDate)date
{
  return (NSDate *)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_monotonicTime.userSecondsSinceReferenceDate];
}

- (double)durationSinceEvent:(id)a3
{
  unint64_t rawNanoSeconds = self->_monotonicTime.rawNanoSeconds;
  if (a3)
  {
    [a3 monotonicTime];
    uint64_t v4 = v6;
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (double)(uint64_t)(rawNanoSeconds - v4) / 1000000000.0;
}

- (BOOL)matchesPayload:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__MPCPlaybackEngineEvent_MPCRTCEventConsumer__matchesPayload___block_invoke;
  v8[3] = &unk_2643C09A0;
  unint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  char v6 = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __62__MPCPlaybackEngineEvent_MPCRTCEventConsumer__matchesPayload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a2;
    id v9 = [v4 payload];
    char v6 = [v9 objectForKeyedSubscript:v5];
    uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

    if (v6 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 isEqual:v7];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 0;
  }
}

- (id)previousItemEventWithCursor:(id)a3 type:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(MPCPlaybackEngineEvent *)self payload];
  id v9 = [v8 objectForKeyedSubscript:@"queue-item-id"];

  if (v9)
  {
    id v15 = @"queue-item-id";
    unint64_t v10 = [(MPCPlaybackEngineEvent *)self payload];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];
    v16[0] = v11;
    double v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v13 = [v6 findPreviousEventWithType:v7 matchingPayload:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (unint64_t)machAbsoluteTime
{
  return self->_machAbsoluteTime;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)timeIntervalSinceEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  unint64_t v6 = self->_monotonicTime.rawNanoSeconds + self->_monotonicTime.timebase;
  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  [v4 monotonicTime];
  [v5 monotonicTime];
  uint64_t v7 = v11 + v12;
  if (v11 + v12 <= v6)
  {
LABEL_5:
    double v8 = (double)(v6 - v7);
    goto LABEL_6;
  }
  double v8 = -(double)(v11 + v12 - v6);
LABEL_6:
  double v9 = v8 / 1000000000.0;

  return v9;
}

- (id)earlierEvent:(id)a3
{
  id v4 = (MPCPlaybackEngineEvent *)a3;
  if ([(MPCPlaybackEngineEvent *)self compare:v4] == 1) {
    id v5 = v4;
  }
  else {
    id v5 = self;
  }
  unint64_t v6 = v5;

  return v6;
}

- (unint64_t)monotonicTimeNanoSeconds
{
  return self->_monotonicTime.rawNanoSeconds;
}

- (NSDate)monotonicDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", vaddvq_f64(vdivq_f64(vcvtq_f64_u64(*(uint64x2_t *)&self->_monotonicTime.rawNanoSeconds), (float64x2_t)vdupq_n_s64(0x41CDCD6500000000uLL))));
}

- (id)description
{
  long long v3 = (void *)MEMORY[0x263F088C0];
  id v4 = [(MPCPlaybackEngineEvent *)self date];
  id v5 = [MEMORY[0x263EFFA18] defaultTimeZone];
  unint64_t v6 = [v3 stringFromDate:v4 timeZone:v5 formatOptions:3955];

  uint64_t v7 = NSString;
  double v8 = [(NSUUID *)self->_identifier MSVBase64UUIDString];
  double v9 = [v7 stringWithFormat:@"<MPCPlaybackEngineEvent: %@ %@ [%llu] %@>", v8, v6, self->_monotonicTime.rawNanoSeconds + self->_monotonicTime.timebase, self->_type];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    identifier = self->_identifier;
    double v8 = (NSUUID *)v4[2];
    double v9 = identifier;
    unint64_t v10 = v9;
    if (v9 == v8) {
      char v6 = 1;
    }
    else {
      char v6 = [(NSUUID *)v9 isEqual:v8];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

@end