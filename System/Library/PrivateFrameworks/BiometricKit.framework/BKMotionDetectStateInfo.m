@interface BKMotionDetectStateInfo
- (BKMotionDetectStateInfo)initWithMotionMatrix:(id)a3 motionDetectState:(id)a4;
- (NSArray)motionMatrix;
- (unint64_t)motionDetectState;
- (void)setMotionMatrix:(id)a3;
@end

@implementation BKMotionDetectStateInfo

- (BKMotionDetectStateInfo)initWithMotionMatrix:(id)a3 motionDetectState:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BKMotionDetectStateInfo;
  v9 = [(BKMotionDetectStateInfo *)&v15 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v9->_motionMatrix, a3);
  v10->_motionDetectState = 0;
  int v11 = [v8 unsignedIntValue];
  if (v11 == 2)
  {
    uint64_t v12 = 2;
LABEL_8:
    v10->_motionDetectState = v12;
    goto LABEL_9;
  }
  if (v11 == 1)
  {
    uint64_t v12 = 1;
    goto LABEL_8;
  }
  if (v11)
  {
    if (__osLog) {
      v14 = __osLog;
    }
    else {
      v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "0";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v24 = 1024;
      int v25 = 326;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v10->_motionDetectState = 0;
  }
LABEL_9:

  return v10;
}

- (NSArray)motionMatrix
{
  return self->_motionMatrix;
}

- (void)setMotionMatrix:(id)a3
{
}

- (unint64_t)motionDetectState
{
  return self->_motionDetectState;
}

- (void).cxx_destruct
{
}

@end