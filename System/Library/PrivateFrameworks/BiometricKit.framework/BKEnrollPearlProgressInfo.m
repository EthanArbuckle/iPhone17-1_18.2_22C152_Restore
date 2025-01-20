@interface BKEnrollPearlProgressInfo
- (BKEnrollPearlProgressInfo)initWithPercents:(int64_t)a3;
- (NSArray)enrolledPoses;
- (id)dictionary;
- (id)initFromDictionary:(id)a3;
- (id)initFromEnrollInfo:(id *)a3;
- (int64_t)percentageCompleted;
- (void)setEnrolledPoses:(id)a3;
- (void)setPercentageCompleted:(int64_t)a3;
@end

@implementation BKEnrollPearlProgressInfo

- (BKEnrollPearlProgressInfo)initWithPercents:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKEnrollPearlProgressInfo;
  v4 = [(BKEnrollPearlProgressInfo *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_percentageCompleted = a3;
    uint64_t v6 = [MEMORY[0x1E4F1C978] array];
    enrolledPoses = v5->_enrolledPoses;
    v5->_enrolledPoses = (NSArray *)v6;
  }
  return v5;
}

- (id)initFromEnrollInfo:(id *)a3
{
  v3 = self;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)BKEnrollPearlProgressInfo;
    v3 = [(BKEnrollPearlProgressInfo *)&v16 init];
    if (v3)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (*((_WORD *)&a3->var2.var12 + 1))
      {
        uint64_t v6 = 0;
        do
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          unsigned int var13_low = LOWORD(a3->var2.var13);
          if (LOWORD(a3->var2.var13))
          {
            uint64_t v9 = 0;
            do
            {
              v10 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)&a3->var2.var13 + v6 * var13_low + v9 + 2)];
              [v7 addObject:v10];

              unsigned int var13_low = LOWORD(a3->var2.var13);
              ++v9;
            }
            while (v9 < var13_low);
          }
          v11 = (void *)[v7 copy];
          [v5 addObject:v11];

          ++v6;
        }
        while (v6 < *((unsigned __int16 *)&a3->var2.var12 + 1));
      }
      v3->_percentageCompleted = a3->var1;
      uint64_t v12 = [v5 copy];
      enrolledPoses = v3->_enrolledPoses;
      v3->_enrolledPoses = (NSArray *)v12;
    }
  }
  else
  {
    if (__osLog) {
      v15 = __osLog;
    }
    else {
      v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "info";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v25 = 1024;
      int v26 = 615;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v3;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKEnrollPearlProgressInfo;
  id v5 = [(BKEnrollPearlProgressInfo *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"percentageCompleted"];
    v5->_percentageCompleted = [v6 integerValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"enrollPoses"];
    enrolledPoses = v5->_enrolledPoses;
    v5->_enrolledPoses = (NSArray *)v7;
  }
  return v5;
}

- (id)dictionary
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"BKEnrollPearlProgressInfo";
  v7[0] = @"class";
  v7[1] = @"percentageCompleted";
  v3 = [NSNumber numberWithInteger:self->_percentageCompleted];
  v7[2] = @"enrollPoses";
  enrolledPoses = self->_enrolledPoses;
  v8[1] = v3;
  v8[2] = enrolledPoses;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (int64_t)percentageCompleted
{
  return self->_percentageCompleted;
}

- (void)setPercentageCompleted:(int64_t)a3
{
  self->_percentageCompleted = a3;
}

- (NSArray)enrolledPoses
{
  return self->_enrolledPoses;
}

- (void)setEnrolledPoses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end