@interface HMDRecordChangedLogEvent
+ (id)legacyRecordChanged:(id)a3;
+ (id)recordChanged:(id)a3;
- (HMDRecordChangedLogEvent)initWithChangedRecord:(id)a3 isLegacy:(BOOL)a4;
@end

@implementation HMDRecordChangedLogEvent

- (HMDRecordChangedLogEvent)initWithChangedRecord:(id)a3 isLegacy:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HMDRecordChangedLogEvent;
  return -[HMDRecordOperationLogEvent initWithSize:isLegacy:](&v5, sel_initWithSize_isLegacy_, [a3 size], a4);
}

+ (id)legacyRecordChanged:(id)a3
{
  id v3 = a3;
  v4 = [[HMDRecordChangedLogEvent alloc] initWithChangedRecord:v3 isLegacy:1];

  return v4;
}

+ (id)recordChanged:(id)a3
{
  id v3 = a3;
  v4 = [[HMDRecordChangedLogEvent alloc] initWithChangedRecord:v3 isLegacy:0];

  return v4;
}

@end