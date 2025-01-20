@interface HMIMemorySampler
+ (id)sharedInstance;
- (HMFTimer)tick;
- (HMIMemorySampler)init;
- (MovingAverage)average;
- (int64_t)highWaterMark;
- (void)setHighWaterMark:(int64_t)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMIMemorySampler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_48 != -1) {
    dispatch_once(&sharedInstance_onceToken_48, &__block_literal_global_50);
  }
  v2 = (void *)sharedInstance_sharedInstance_47;
  return v2;
}

uint64_t __34__HMIMemorySampler_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_47 = objc_alloc_init(HMIMemorySampler);
  return MEMORY[0x270F9A758]();
}

- (HMIMemorySampler)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMIMemorySampler;
  v2 = [(HMIMemorySampler *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:28 options:0.25];
    tick = v2->_tick;
    v2->_tick = (HMFTimer *)v3;

    [(HMFTimer *)v2->_tick setDelegate:v2];
    v5 = [[MovingAverage alloc] initWithWindowSize:128];
    average = v2->_average;
    v2->_average = v5;
  }
  return v2;
}

- (void)start
{
  id v2 = [(HMIMemorySampler *)self tick];
  [v2 resume];
}

- (void)stop
{
  id v2 = [(HMIMemorySampler *)self tick];
  [v2 suspend];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x22A641C70]();
  pid_t v6 = getpid();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  memset(buffer, 0, sizeof(buffer));
  if (!proc_pid_rusage(v6, 6, buffer))
  {
    unint64_t v7 = *((void *)&v30 + 1);
    uint64_t v25 = v41;
    average = self->_average;
    v9 = [NSNumber numberWithUnsignedLongLong:*((void *)&v30 + 1)];
    [(MovingAverage *)average addNumber:v9];

    [(MovingAverage *)self->_average movingAverage];
    unint64_t v11 = (unint64_t)v10;
    id v12 = objc_alloc_init(MEMORY[0x263F086F0]);
    [v12 setZeroPadsFractionDigits:1];
    [v12 setAllowedUnits:4];
    [v12 setCountStyle:1];
    [v12 setAllowsNonnumericFormatting:0];
    v13 = NSString;
    id v14 = [v12 stringFromByteCount:v7];
    v26 = objc_msgSend(v13, "stringWithFormat:", @"%9s", objc_msgSend(v14, "UTF8String"));

    v15 = NSString;
    id v16 = [v12 stringFromByteCount:v11];
    v17 = objc_msgSend(v15, "stringWithFormat:", @"%9s", objc_msgSend(v16, "UTF8String"));

    v18 = NSString;
    id v19 = [v12 stringFromByteCount:v25];
    v20 = objc_msgSend(v18, "stringWithFormat:", @"%9s", objc_msgSend(v19, "UTF8String"));

    v21 = (void *)MEMORY[0x22A641C70]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = HMFGetLogIdentifier();
      LODWORD(buffer[0]) = 138544130;
      *(rusage_info_t *)((char *)buffer + 4) = v24;
      WORD2(buffer[1]) = 2112;
      *(rusage_info_t *)((char *)&buffer[1] + 6) = v26;
      HIWORD(buffer[2]) = 2112;
      buffer[3] = v17;
      LOWORD(v28) = 2112;
      *(void *)((char *)&v28 + 2) = v20;
      _os_log_impl(&dword_225DC6000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Footprint: %@, Average: %@, Peak: %@", (uint8_t *)buffer, 0x2Au);
    }
    if (([(HMIMemorySampler *)v22 highWaterMark] & 0x8000000000000000) == 0
      && v7 > [(HMIMemorySampler *)v22 highWaterMark])
    {
      objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"OutOfMemory" reason:@"Reached high water mark." userInfo:0]);
    }
  }
}

- (int64_t)highWaterMark
{
  return self->_highWaterMark;
}

- (void)setHighWaterMark:(int64_t)a3
{
  self->_highWaterMark = a3;
}

- (HMFTimer)tick
{
  return (HMFTimer *)objc_getProperty(self, a2, 16, 1);
}

- (MovingAverage)average
{
  return (MovingAverage *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_average, 0);
  objc_storeStrong((id *)&self->_tick, 0);
}

@end