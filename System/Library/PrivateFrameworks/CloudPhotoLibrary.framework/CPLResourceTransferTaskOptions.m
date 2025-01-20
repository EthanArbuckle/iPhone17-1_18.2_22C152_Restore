@interface CPLResourceTransferTaskOptions
+ (BOOL)isForegroundOperationForIntent:(unint64_t)a3 priority:(unint64_t)a4;
+ (BOOL)isHighPriorityForIntent:(unint64_t)a3 priority:(unint64_t)a4;
+ (BOOL)supportsSecureCoding;
+ (id)defaultOptions;
+ (id)descriptionForIntent:(unint64_t)a3;
+ (id)descriptionForIntentPriority:(unint64_t)a3;
+ (id)intentsToBackgroundDownload;
+ (id)optionsForLegacyIntent:(unint64_t)a3;
- ($0E4A422D128941990FD19C13E5416F99)timeRange;
- (BOOL)hasValidTimeRange;
- (BOOL)isForeground;
- (BOOL)isHighPriority;
- (BOOL)shouldKeepPower;
- (CPLResourceTransferTaskOptions)init;
- (CPLResourceTransferTaskOptions)initWithCoder:(id)a3;
- (CPLResourceTransferTaskOptions)initWithHighPriority:(BOOL)a3;
- (CPLResourceTransferTaskOptions)initWithIntent:(unint64_t)a3 priority:(unint64_t)a4;
- (CPLResourceTransferTaskOptions)initWithIntent:(unint64_t)a3 priority:(unint64_t)a4 timeRange:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)intent;
- (unint64_t)legacyIntent;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation CPLResourceTransferTaskOptions

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- ($0E4A422D128941990FD19C13E5416F99)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *((void *)result + 1) = self->_intent;
  *((void *)result + 2) = self->_priority;
  long long v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  long long v6 = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_timeRange.duration.timescale;
  *(_OWORD *)((char *)result + 24) = v6;
  *(_OWORD *)((char *)result + 40) = v5;
  return result;
}

- (CPLResourceTransferTaskOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = [(CPLResourceTransferTaskOptions *)self init];
  if (v5)
  {
    v5->_intent = [v4 decodeInt64ForKey:@"intent"];
    v5->_priority = [v4 decodeInt64ForKey:@"priority"];
    if (v4)
    {
      [v4 decodeCMTimeRangeForKey:@"timeRange"];
    }
    else
    {
      long long v8 = 0u;
      long long v9 = 0u;
      long long v7 = 0u;
    }
    *(_OWORD *)&v5->_timeRange.start.value = v7;
    *(_OWORD *)&v5->_timeRange.start.epoch = v8;
    *(_OWORD *)&v5->_timeRange.duration.timescale = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t intent = self->_intent;
  id v5 = a3;
  [v5 encodeInt64:intent forKey:@"intent"];
  [v5 encodeInt64:self->_priority forKey:@"priority"];
  long long v6 = *(_OWORD *)&self->_timeRange.start.epoch;
  v7[0] = *(_OWORD *)&self->_timeRange.start.value;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  [v5 encodeCMTimeRange:v7 forKey:@"timeRange"];
}

- (unint64_t)legacyIntent
{
  unint64_t intent = self->_intent;
  unint64_t result = 1;
  switch(intent)
  {
    case 0uLL:
      unint64_t priority = self->_priority;
      if (priority >= 3) {
        goto LABEL_2;
      }
      long long v6 = &unk_1B4E488D8;
      goto LABEL_12;
    case 1uLL:
    case 5uLL:
      return result;
    case 2uLL:
    case 8uLL:
    case 9uLL:
      return intent;
    case 3uLL:
      unint64_t priority = self->_priority;
      if (priority >= 3) {
        return 4;
      }
      long long v6 = &unk_1B4E488F0;
      goto LABEL_12;
    case 4uLL:
      return 4;
    case 6uLL:
      unint64_t priority = self->_priority;
      if (priority >= 3) {
        goto LABEL_9;
      }
      long long v6 = &unk_1B4E48908;
LABEL_12:
      unint64_t result = v6[priority];
      break;
    case 7uLL:
LABEL_9:
      unint64_t result = 7;
      break;
    default:
LABEL_2:
      unint64_t result = 0;
      break;
  }
  return result;
}

- (id)description
{
  long long v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(id)objc_opt_class() descriptionForIntent:self->_intent];
  id v5 = [(id)objc_opt_class() descriptionForIntentPriority:self->_priority];
  long long v6 = [v3 stringWithFormat:@"intent %@ priority %@", v4, v5];

  if ([(CPLResourceTransferTaskOptions *)self hasValidTimeRange])
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    long long v8 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    long long v9 = (__CFString *)CMTimeRangeCopyDescription(v7, &range);
    [v6 appendFormat:@" timeRange %@", v9];
  }
  return v6;
}

- (BOOL)hasValidTimeRange
{
  return (self->_timeRange.start.flags & 1) != 0
      && (self->_timeRange.duration.flags & 1) != 0
      && !self->_timeRange.duration.epoch
      && self->_timeRange.duration.value >= 0;
}

- (BOOL)shouldKeepPower
{
  return +[CPLResourceTransferTaskOptions isForegroundOperationForIntent:self->_intent priority:self->_priority];
}

- (BOOL)isForeground
{
  long long v3 = objc_opt_class();
  unint64_t intent = self->_intent;
  unint64_t priority = self->_priority;
  return [v3 isForegroundOperationForIntent:intent priority:priority];
}

- (BOOL)isHighPriority
{
  long long v3 = objc_opt_class();
  unint64_t intent = self->_intent;
  unint64_t priority = self->_priority;
  return [v3 isHighPriorityForIntent:intent priority:priority];
}

- (CPLResourceTransferTaskOptions)init
{
  return [(CPLResourceTransferTaskOptions *)self initWithIntent:0 priority:0];
}

- (CPLResourceTransferTaskOptions)initWithHighPriority:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  return [(CPLResourceTransferTaskOptions *)self initWithIntent:0 priority:v3];
}

- (CPLResourceTransferTaskOptions)initWithIntent:(unint64_t)a3 priority:(unint64_t)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v6[0] = *MEMORY[0x1E4F1FA20];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  return [(CPLResourceTransferTaskOptions *)self initWithIntent:a3 priority:a4 timeRange:v6];
}

- (CPLResourceTransferTaskOptions)initWithIntent:(unint64_t)a3 priority:(unint64_t)a4 timeRange:(id *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CPLResourceTransferTaskOptions;
  unint64_t result = [(CPLResourceTransferTaskOptions *)&v11 init];
  if (result)
  {
    result->_unint64_t intent = a3;
    result->_unint64_t priority = a4;
    long long v9 = *(_OWORD *)&a5->var0.var0;
    long long v10 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&result->_timeRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&result->_timeRange.start.epoch = v10;
    *(_OWORD *)&result->_timeRange.start.value = v9;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)optionsForLegacyIntent:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  if (a3 - 1 > 9)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v4 = qword_1B4E48838[v3];
    uint64_t v5 = qword_1B4E48888[v3];
  }
  long long v6 = [[CPLResourceTransferTaskOptions alloc] initWithIntent:v5 priority:v4];
  return v6;
}

+ (BOOL)isForegroundOperationForIntent:(unint64_t)a3 priority:(unint64_t)a4
{
  BOOL v4 = ((1 << a3) & 9) == 0 || a4 != 2;
  BOOL v5 = ((1 << a3) & 0x1DC76) == 0 && v4;
  return a3 > 0x10 || v5;
}

+ (BOOL)isHighPriorityForIntent:(unint64_t)a3 priority:(unint64_t)a4
{
  BOOL v4 = ((1 << a3) & 0x41) == 0 || a4 != 2;
  BOOL v5 = ((1 << a3) & 0x36) == 0 && v4;
  return a3 > 6 || v5;
}

+ (id)descriptionForIntentPriority:(unint64_t)a3
{
  if (a3 >= 3) {
    unint64_t v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"CPLResourceTransferTaskIntentPriority-%lu", a3);
  }
  else {
    unint64_t v3 = off_1E60A8D50[a3];
  }
  return v3;
}

+ (id)descriptionForIntent:(unint64_t)a3
{
  if (a3 >= 0x11) {
    unint64_t v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"CPLResourceTransferTaskIntent-%lu", a3);
  }
  else {
    unint64_t v3 = off_1E60A8CC8[a3];
  }
  return v3;
}

+ (id)intentsToBackgroundDownload
{
  return &unk_1F0D91640;
}

+ (id)defaultOptions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end