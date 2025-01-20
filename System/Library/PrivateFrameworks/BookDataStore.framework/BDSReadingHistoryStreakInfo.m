@interface BDSReadingHistoryStreakInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryStreakInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryStreakInfo)initWithEndDate:(id)a3 length:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)length;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setLength:(int64_t)a3;
@end

@implementation BDSReadingHistoryStreakInfo

- (BDSReadingHistoryStreakInfo)initWithEndDate:(id)a3 length:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BDSReadingHistoryStreakInfo;
  v8 = [(BDSReadingHistoryStreakInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endDate, a3);
    v9->_length = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = BUDynamicCast();

    BOOL v13 = 0;
    if (!self || !v5) {
      goto LABEL_10;
    }
    v14 = objc_msgSend_endDate(self, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v22 = objc_msgSend_endDate(v5, v15, v16, v17, v18, v19, v20, v21);
    if (v14 == (void *)v22)
    {
    }
    else
    {
      v30 = (void *)v22;
      v31 = objc_msgSend_endDate(self, v23, v24, v25, v26, v27, v28, v29);
      v39 = objc_msgSend_endDate(v5, v32, v33, v34, v35, v36, v37, v38);
      int isEqual = objc_msgSend_isEqual_(v31, v40, (uint64_t)v39, v41, v42, v43, v44, v45);

      if (!isEqual)
      {
        BOOL v13 = 0;
LABEL_10:

        return v13;
      }
    }
    uint64_t v54 = objc_msgSend_length(self, v47, v48, v49, v50, v51, v52, v53);
    BOOL v13 = v54 == objc_msgSend_length(v5, v55, v56, v57, v58, v59, v60, v61);
    goto LABEL_10;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryStreakInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = (BDSReadingHistoryStreakInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"endDate", v15, v16, v17, v18);
    endDate = v12->_endDate;
    v12->_endDate = (NSDate *)v19;

    v12->_length = objc_msgSend_decodeIntegerForKey_(v4, v21, @"length", v22, v23, v24, v25, v26);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  uint64_t v11 = objc_msgSend_endDate(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v30, v12, (uint64_t)v11, @"endDate", v13, v14, v15, v16);

  uint64_t v24 = objc_msgSend_length(self, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_encodeInteger_forKey_(v30, v25, v24, @"length", v26, v27, v28, v29);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSReadingHistoryStreakInfo);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_endDate(self, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setEndDate_(v11, v13, (uint64_t)v12, v14, v15, v16, v17, v18);

    uint64_t v26 = objc_msgSend_length(self, v19, v20, v21, v22, v23, v24, v25);
    objc_msgSend_setLength_(v11, v27, v26, v28, v29, v30, v31, v32);
  }
  return v11;
}

- (id)description
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_endDate(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_length(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_stringWithFormat_(v9, v19, @"{endDate:%@, length:%ld}", v20, v21, v22, v23, v24, v10, v18);

  return v25;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (void).cxx_destruct
{
}

@end