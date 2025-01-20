@interface BDSReadingHistoryDayInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryDayInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryDayInfo)initWithReadingTime:(int64_t)a3 goal:(int64_t)a4 isStreakDay:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStreakDay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)goal;
- (int64_t)readingTime;
- (void)encodeWithCoder:(id)a3;
- (void)setGoal:(int64_t)a3;
- (void)setIsStreakDay:(BOOL)a3;
- (void)setReadingTime:(int64_t)a3;
@end

@implementation BDSReadingHistoryDayInfo

- (BDSReadingHistoryDayInfo)initWithReadingTime:(int64_t)a3 goal:(int64_t)a4 isStreakDay:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)BDSReadingHistoryDayInfo;
  result = [(BDSReadingHistoryDayInfo *)&v9 init];
  if (result)
  {
    result->_readingTime = a3;
    result->_goal = a4;
    result->_isStreakDay = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    id v12 = a3;
    objc_opt_class();
    v4 = BUDynamicCast();

    LOBYTE(v12) = 0;
    if (self && v4)
    {
      uint64_t v13 = objc_msgSend_readingTime(self, v5, v6, v7, v8, v9, v10, v11);
      if (v13 == objc_msgSend_readingTime(v4, v14, v15, v16, v17, v18, v19, v20)
        && (uint64_t v28 = objc_msgSend_goal(self, v21, v22, v23, v24, v25, v26, v27),
            v28 == objc_msgSend_goal(v4, v29, v30, v31, v32, v33, v34, v35)))
      {
        int isStreakDay = objc_msgSend_isStreakDay(self, v36, v37, v38, v39, v40, v41, v42);
        LODWORD(v12) = isStreakDay ^ objc_msgSend_isStreakDay(v4, v44, v45, v46, v47, v48, v49, v50) ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
  }
  return (char)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryDayInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v18 = (BDSReadingHistoryDayInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v18)
  {
    v18->_readingTime = objc_msgSend_decodeIntegerForKey_(v4, v12, @"readingTime", v13, v14, v15, v16, v17);
    v18->_goal = objc_msgSend_decodeIntegerForKey_(v4, v19, @"goal", v20, v21, v22, v23, v24);
    v18->_int isStreakDay = objc_msgSend_decodeBoolForKey_(v4, v25, @"isStreakDay", v26, v27, v28, v29, v30);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v43 = a3;
  uint64_t v11 = objc_msgSend_readingTime(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeInteger_forKey_(v43, v12, v11, @"readingTime", v13, v14, v15, v16);
  uint64_t v24 = objc_msgSend_goal(self, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_encodeInteger_forKey_(v43, v25, v24, @"goal", v26, v27, v28, v29);
  uint64_t isStreakDay = objc_msgSend_isStreakDay(self, v30, v31, v32, v33, v34, v35, v36);
  objc_msgSend_encodeBool_forKey_(v43, v38, isStreakDay, @"isStreakDay", v39, v40, v41, v42);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSReadingHistoryDayInfo);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_readingTime(self, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setReadingTime_(v11, v13, v12, v14, v15, v16, v17, v18);
    uint64_t v26 = objc_msgSend_goal(self, v19, v20, v21, v22, v23, v24, v25);
    objc_msgSend_setGoal_(v11, v27, v26, v28, v29, v30, v31, v32);
    uint64_t isStreakDay = objc_msgSend_isStreakDay(self, v33, v34, v35, v36, v37, v38, v39);
    objc_msgSend_setIsStreakDay_(v11, v41, isStreakDay, v42, v43, v44, v45, v46);
  }
  return v11;
}

- (id)description
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_readingTime(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_goal(self, v11, v12, v13, v14, v15, v16, v17);
  unsigned int isStreakDay = objc_msgSend_isStreakDay(self, v19, v20, v21, v22, v23, v24, v25);
  return (id)objc_msgSend_stringWithFormat_(v9, v27, @"{readingTime:%ld, goal:%ld, isStreakDay:%d}", v28, v29, v30, v31, v32, v10, v18, isStreakDay);
}

- (int64_t)readingTime
{
  return self->_readingTime;
}

- (void)setReadingTime:(int64_t)a3
{
  self->_readingTime = a3;
}

- (int64_t)goal
{
  return self->_goal;
}

- (void)setGoal:(int64_t)a3
{
  self->_goal = a3;
}

- (BOOL)isStreakDay
{
  return self->_isStreakDay;
}

- (void)setIsStreakDay:(BOOL)a3
{
  self->_unsigned int isStreakDay = a3;
}

@end