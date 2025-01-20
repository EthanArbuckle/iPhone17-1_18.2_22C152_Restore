@interface CLFindMyAccessoryUserStats
+ (BOOL)supportsSecureCoding;
- (CLFindMyAccessoryUserStats)init;
- (CLFindMyAccessoryUserStats)initWithCoder:(id)a3;
- (CLFindMyAccessoryUserStats)initWithOverflowFlag:(int64_t)a3 crashCount:(int64_t)a4 multiTime:(double)a5 nearOwnerTime:(double)a6 wildTime:(double)a7 soundCount:(int64_t)a8 soundTime:(double)a9 rangingCount:(int64_t)a10 rangingTime:(double)a11 multiLeashedTime:(double)a12 multiTimeV2:(double)a13 nearOwnerTimeV2:(double)a14 leashedTime:(double)a15 singleConnTime:(double)a16 dualConnTime:(double)a17 dualLeashedTime:(double)a18 utAccelCount:(int64_t)a19 lastClear:(double)a20 bootR1Time:(double)a21 ownerLongSoundCount:(int64_t)a22 ownerShortSoundCount:(int64_t)a23 utLongSoundCount:(int64_t)a24 utShortSoundCount:(int64_t)a25 bomSoundCount:(int64_t)a26 version:(unint64_t)a27;
- (CLFindMyAccessoryUserStats)initWithPayloadV1:(id)a3;
- (CLFindMyAccessoryUserStats)initWithPayloadV2:(id)a3;
- (double)bootR1Time;
- (double)dualConnTime;
- (double)dualLeashedTime;
- (double)lastClear;
- (double)leashedTime;
- (double)multiLeashedTime;
- (double)multiTime;
- (double)multiTimeV2;
- (double)nearOwnerTime;
- (double)nearOwnerTimeV2;
- (double)rangingTime;
- (double)singleConnTime;
- (double)soundTime;
- (double)wildTime;
- (int64_t)bomSoundCount;
- (int64_t)crashCount;
- (int64_t)overflowFlag;
- (int64_t)ownerLongSoundCount;
- (int64_t)ownerShortSoundCount;
- (int64_t)rangingCount;
- (int64_t)soundCount;
- (int64_t)utAccelCount;
- (int64_t)utLongSoundCount;
- (int64_t)utShortSoundCount;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation CLFindMyAccessoryUserStats

- (CLFindMyAccessoryUserStats)init
{
  return 0;
}

- (CLFindMyAccessoryUserStats)initWithPayloadV1:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([a3 length] == 19)
  {
    v5 = (unsigned __int8 *)[a3 bytes];
    LOWORD(v6) = *(_WORD *)(v5 + 13);
    LOWORD(v7) = *(_WORD *)(v5 + 17);
    return -[CLFindMyAccessoryUserStats initWithOverflowFlag:crashCount:multiTime:nearOwnerTime:wildTime:soundCount:soundTime:rangingCount:rangingTime:multiLeashedTime:multiTimeV2:nearOwnerTimeV2:leashedTime:singleConnTime:dualConnTime:dualLeashedTime:utAccelCount:lastClear:bootR1Time:ownerLongSoundCount:ownerShortSoundCount:utLongSoundCount:utShortSoundCount:bomSoundCount:version:](self, "initWithOverflowFlag:crashCount:multiTime:nearOwnerTime:wildTime:soundCount:soundTime:rangingCount:rangingTime:multiLeashedTime:multiTimeV2:nearOwnerTimeV2:leashedTime:singleConnTime:dualConnTime:dualLeashedTime:utAccelCount:lastClear:bootR1Time:ownerLongSoundCount:ownerShortSoundCount:utLongSoundCount:utShortSoundCount:bomSoundCount:version:", *v5, v5[1], *(unsigned __int16 *)(v5 + 11), *(unsigned __int16 *)(v5 + 15), 0, 0, (double)(*((unsigned __int16 *)v5 + 1) | (v5[4] << 16)), (double)(*(unsigned __int16 *)(v5 + 5) | (v5[7] << 16)), (double)(*((unsigned __int16 *)v5 + 4) | (v5[10] << 16)), (double)v6, (double)v7, 0.0, 0.0, 0.0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             1);
  }
  else
  {
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005DE0);
    }
    v9 = qword_1E929F688;
    if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "Payload size does not match userstats version 1 response size", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F680 != -1) {
        dispatch_once(&qword_1E929F680, &unk_1EE005DE0);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLFindMyAccessoryUserStats initWithPayloadV1:]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    return 0;
  }
}

- (CLFindMyAccessoryUserStats)initWithPayloadV2:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a3 length] == 60)
  {
    uint64_t v5 = [a3 bytes];
    __int16 v6 = *(_WORD *)(v5 + 50);
    int v7 = *(unsigned __int16 *)(v5 + 52);
    unsigned int v8 = *(_DWORD *)(v5 + 4);
    unsigned int v9 = *(_DWORD *)(v5 + 8);
    LODWORD(v10) = *(_DWORD *)(v5 + 12);
    LODWORD(v12) = *(_DWORD *)(v5 + 40);
    LODWORD(v11) = *(_DWORD *)(v5 + 44);
    LODWORD(v13) = *(_DWORD *)(v5 + 24);
    LODWORD(v14) = *(_DWORD *)(v5 + 28);
    LODWORD(v15) = *(_DWORD *)(v5 + 36);
    return -[CLFindMyAccessoryUserStats initWithOverflowFlag:crashCount:multiTime:nearOwnerTime:wildTime:soundCount:soundTime:rangingCount:rangingTime:multiLeashedTime:multiTimeV2:nearOwnerTimeV2:leashedTime:singleConnTime:dualConnTime:dualLeashedTime:utAccelCount:lastClear:bootR1Time:ownerLongSoundCount:ownerShortSoundCount:utLongSoundCount:utShortSoundCount:bomSoundCount:version:](self, "initWithOverflowFlag:crashCount:multiTime:nearOwnerTime:wildTime:soundCount:soundTime:rangingCount:rangingTime:multiLeashedTime:multiTimeV2:nearOwnerTimeV2:leashedTime:singleConnTime:dualConnTime:dualLeashedTime:utAccelCount:lastClear:bootR1Time:ownerLongSoundCount:ownerShortSoundCount:utLongSoundCount:utShortSoundCount:bomSoundCount:version:", 0, 0, (unsigned __int16)(v7 + v6 + *(_WORD *)(v5 + 56)), *(unsigned __int16 *)(v5 + 48), *(unsigned int *)(v5 + 32), (double)(v8 + *(_DWORD *)v5), (double)(*(_DWORD *)(v5 + 16) + v9 + *(_DWORD *)(v5 + 20)), (double)v10, (double)(3 * v7- (unsigned __int16)(*(_WORD *)(v5 + 54) + v6)+ 8 * (unsigned __int16)(*(_WORD *)(v5 + 54) + v6)), (double)v11, (double)*(unsigned int *)v5, (double)v8,
             (double)v9,
             (double)*(unsigned int *)(v5 + 16),
             (double)*(unsigned int *)(v5 + 20),
             (double)v13,
             (double)v14,
             (double)v15,
             (double)v12,
             *(unsigned __int16 *)(v5 + 52),
             *(unsigned __int16 *)(v5 + 54),
             *(unsigned __int16 *)(v5 + 56),
             *(unsigned __int16 *)(v5 + 58),
             2);
  }
  else
  {
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005DE0);
    }
    v17 = qword_1E929F688;
    if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_ERROR, "Payload size does not match userstats version 2 response size", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F680 != -1) {
        dispatch_once(&qword_1E929F680, &unk_1EE005DE0);
      }
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLFindMyAccessoryUserStats initWithPayloadV2:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    return 0;
  }
}

- (CLFindMyAccessoryUserStats)initWithOverflowFlag:(int64_t)a3 crashCount:(int64_t)a4 multiTime:(double)a5 nearOwnerTime:(double)a6 wildTime:(double)a7 soundCount:(int64_t)a8 soundTime:(double)a9 rangingCount:(int64_t)a10 rangingTime:(double)a11 multiLeashedTime:(double)a12 multiTimeV2:(double)a13 nearOwnerTimeV2:(double)a14 leashedTime:(double)a15 singleConnTime:(double)a16 dualConnTime:(double)a17 dualLeashedTime:(double)a18 utAccelCount:(int64_t)a19 lastClear:(double)a20 bootR1Time:(double)a21 ownerLongSoundCount:(int64_t)a22 ownerShortSoundCount:(int64_t)a23 utLongSoundCount:(int64_t)a24 utShortSoundCount:(int64_t)a25 bomSoundCount:(int64_t)a26 version:(unint64_t)a27
{
  v42.receiver = self;
  v42.super_class = (Class)CLFindMyAccessoryUserStats;
  result = [(CLFindMyAccessoryUserStats *)&v42 init];
  if (result)
  {
    result->_version = a27;
    result->_overflowFlag = a3;
    result->_crashCount = a4;
    result->_multiTime = a5;
    result->_nearOwnerTime = a6;
    result->_wildTime = a7;
    result->_soundCount = a8;
    result->_soundTime = a9;
    result->_rangingCount = a10;
    result->_rangingTime = a11;
    result->_multiLeashedTime = a12;
    result->_multiTimeV2 = a13;
    result->_nearOwnerTimeV2 = a14;
    result->_leashedTime = a15;
    result->_singleConnTime = a16;
    result->_dualConnTime = a17;
    result->_dualLeashedTime = a18;
    result->_utAccelCount = a19;
    result->_lastClear = a20;
    result->_bootR1Time = a21;
    result->_ownerLongSoundCount = a22;
    result->_ownerShortSoundCount = a23;
    result->_utLongSoundCount = a24;
    result->_utShortSoundCount = a25;
    result->_bomSoundCount = a26;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryUserStats)initWithCoder:(id)a3
{
  uint64_t v36 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"overflowFlag"), "integerValue");
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"crashCount"), "integerValue");
  [a3 decodeDoubleForKey:@"multiTime"];
  double v35 = v5;
  [a3 decodeDoubleForKey:@"nearOwnerTime"];
  double v34 = v6;
  [a3 decodeDoubleForKey:@"wildTime"];
  double v33 = v7;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"soundCount"), "integerValue");
  [a3 decodeDoubleForKey:@"soundTime"];
  double v32 = v9;
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"rangingCount"), "integerValue");
  [a3 decodeDoubleForKey:@"rangingTime"];
  double v31 = v11;
  [a3 decodeDoubleForKey:@"multiLeashedTime"];
  double v30 = v12;
  [a3 decodeDoubleForKey:@"multiTimeV2"];
  double v14 = v13;
  [a3 decodeDoubleForKey:@"nearOwnerTimeV2"];
  double v16 = v15;
  [a3 decodeDoubleForKey:@"leashedTime"];
  uint64_t v18 = v17;
  [a3 decodeDoubleForKey:@"singleConnTime"];
  uint64_t v20 = v19;
  [a3 decodeDoubleForKey:@"dualConnTime"];
  uint64_t v22 = v21;
  [a3 decodeDoubleForKey:@"dualLeashedTime"];
  uint64_t v24 = v23;
  uint64_t v25 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"utAccelCount"), "integerValue");
  [a3 decodeDoubleForKey:@"lastClear"];
  uint64_t v27 = v26;
  [a3 decodeDoubleForKey:@"bootR1Time"];
  return -[CLFindMyAccessoryUserStats initWithOverflowFlag:crashCount:multiTime:nearOwnerTime:wildTime:soundCount:soundTime:rangingCount:rangingTime:multiLeashedTime:multiTimeV2:nearOwnerTimeV2:leashedTime:singleConnTime:dualConnTime:dualLeashedTime:utAccelCount:lastClear:bootR1Time:ownerLongSoundCount:ownerShortSoundCount:utLongSoundCount:utShortSoundCount:bomSoundCount:version:](self, "initWithOverflowFlag:crashCount:multiTime:nearOwnerTime:wildTime:soundCount:soundTime:rangingCount:rangingTime:multiLeashedTime:multiTimeV2:nearOwnerTimeV2:leashedTime:singleConnTime:dualConnTime:dualLeashedTime:utAccelCount:lastClear:bootR1Time:ownerLongSoundCount:ownerShortSoundCount:utLongSoundCount:utShortSoundCount:bomSoundCount:version:", v36, v4, v8, v10, v25, objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"ownerLongSoundCount"), "integerValue"), v35, v34, v33, v32, v31, v30, v14, v16,
           v18,
           v20,
           v22,
           v24,
           v27,
           v28,
           objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"ownerShortSoundCount"), "integerValue"),
           objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"utLongSoundCount"), "integerValue"),
           objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"utShortSoundCount"), "integerValue"),
           objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"bomSoundCount"), "integerValue"),
           objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"version"), "unsignedIntegerValue"));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_overflowFlag), @"overflowFlag");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_crashCount), @"crashCount");
  [a3 encodeDouble:@"multiTime" forKey:self->_multiTime];
  [a3 encodeDouble:@"nearOwnerTime" forKey:self->_nearOwnerTime];
  [a3 encodeDouble:@"wildTime" forKey:self->_wildTime];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_soundCount), @"soundCount");
  [a3 encodeDouble:@"soundTime" forKey:self->_soundTime];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_rangingCount), @"rangingCount");
  [a3 encodeDouble:@"rangingTime" forKey:self->_rangingTime];
  [a3 encodeDouble:@"multiLeashedTime" forKey:self->_multiLeashedTime];
  [a3 encodeDouble:@"multiTimeV2" forKey:self->_multiTimeV2];
  [a3 encodeDouble:@"nearOwnerTimeV2" forKey:self->_nearOwnerTimeV2];
  [a3 encodeDouble:@"leashedTime" forKey:self->_leashedTime];
  [a3 encodeDouble:@"singleConnTime" forKey:self->_singleConnTime];
  [a3 encodeDouble:@"dualConnTime" forKey:self->_dualConnTime];
  [a3 encodeDouble:@"dualLeashedTime" forKey:self->_dualLeashedTime];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_utAccelCount), @"utAccelCount");
  [a3 encodeDouble:@"lastClear" forKey:self->_lastClear];
  [a3 encodeDouble:@"bootR1Time" forKey:self->_bootR1Time];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_ownerLongSoundCount), @"ownerLongSoundCount");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_ownerShortSoundCount), @"ownerShortSoundCount");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_utLongSoundCount), @"utLongSoundCount");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_utShortSoundCount), @"utShortSoundCount");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_bomSoundCount), @"bomSoundCount");
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_version];

  [a3 encodeObject:v5 forKey:@"version"];
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (int64_t)overflowFlag
{
  return self->_overflowFlag;
}

- (int64_t)crashCount
{
  return self->_crashCount;
}

- (double)multiTime
{
  return self->_multiTime;
}

- (double)nearOwnerTime
{
  return self->_nearOwnerTime;
}

- (double)wildTime
{
  return self->_wildTime;
}

- (int64_t)soundCount
{
  return self->_soundCount;
}

- (double)soundTime
{
  return self->_soundTime;
}

- (int64_t)rangingCount
{
  return self->_rangingCount;
}

- (double)rangingTime
{
  return self->_rangingTime;
}

- (double)multiLeashedTime
{
  return self->_multiLeashedTime;
}

- (double)multiTimeV2
{
  return self->_multiTimeV2;
}

- (double)nearOwnerTimeV2
{
  return self->_nearOwnerTimeV2;
}

- (double)leashedTime
{
  return self->_leashedTime;
}

- (double)singleConnTime
{
  return self->_singleConnTime;
}

- (double)dualConnTime
{
  return self->_dualConnTime;
}

- (double)dualLeashedTime
{
  return self->_dualLeashedTime;
}

- (int64_t)utAccelCount
{
  return self->_utAccelCount;
}

- (double)lastClear
{
  return self->_lastClear;
}

- (double)bootR1Time
{
  return self->_bootR1Time;
}

- (int64_t)ownerLongSoundCount
{
  return self->_ownerLongSoundCount;
}

- (int64_t)ownerShortSoundCount
{
  return self->_ownerShortSoundCount;
}

- (int64_t)utLongSoundCount
{
  return self->_utLongSoundCount;
}

- (int64_t)utShortSoundCount
{
  return self->_utShortSoundCount;
}

- (int64_t)bomSoundCount
{
  return self->_bomSoundCount;
}

@end