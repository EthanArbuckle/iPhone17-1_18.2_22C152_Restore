@interface CWFAutoJoinThrottle
+ (id)autoJoinThrottleWithTrigger:(int64_t)a3 intervals:(id)a4;
- (NSDictionary)intervals;
- (NSDictionary)intervalsBasedOnTriggerTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)trigger;
- (void)setIntervals:(id)a3;
- (void)setIntervalsBasedOnTriggerTimestamp:(id)a3;
- (void)setTrigger:(int64_t)a3;
@end

@implementation CWFAutoJoinThrottle

- (NSDictionary)intervals
{
  return self->_intervals;
}

- (NSDictionary)intervalsBasedOnTriggerTimestamp
{
  return self->_intervalsBasedOnTriggerTimestamp;
}

+ (id)autoJoinThrottleWithTrigger:(int64_t)a3 intervals:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(CWFAutoJoinThrottle);
  objc_msgSend_setTrigger_(v6, v7, a3, v8, v9);
  objc_msgSend_setIntervals_(v6, v10, (uint64_t)v5, v11, v12);

  return v6;
}

- (id)description
{
  v6 = NSString;
  v7 = sub_1B4F520D4(self->_trigger, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v6, v8, @"trigger=%@, intervals=(%@), intervalsBasedOnTriggerTimestamp=(%@)", v9, v10, v7, self->_intervals, self->_intervalsBasedOnTriggerTimestamp);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = objc_msgSend_allocWithZone_(CWFAutoJoinThrottle, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setTrigger_(v11, v12, self->_trigger, v13, v14);
  objc_msgSend_setIntervals_(v11, v15, (uint64_t)self->_intervals, v16, v17);
  objc_msgSend_setIntervalsBasedOnTriggerTimestamp_(v11, v18, (uint64_t)self->_intervalsBasedOnTriggerTimestamp, v19, v20);
  return v11;
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(int64_t)a3
{
  self->_trigger = a3;
}

- (void)setIntervals:(id)a3
{
}

- (void)setIntervalsBasedOnTriggerTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalsBasedOnTriggerTimestamp, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
}

@end