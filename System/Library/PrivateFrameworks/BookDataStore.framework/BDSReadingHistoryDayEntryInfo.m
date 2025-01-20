@interface BDSReadingHistoryDayEntryInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryDayEntryInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryDayEntryInfo)initWithDate:(id)a3 day:(id)a4;
- (BDSReadingHistoryDayInfo)day;
- (BOOL)isEqual:(id)a3;
- (NSString)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setDay:(id)a3;
@end

@implementation BDSReadingHistoryDayEntryInfo

- (BDSReadingHistoryDayEntryInfo)initWithDate:(id)a3 day:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BDSReadingHistoryDayEntryInfo;
  v9 = [(BDSReadingHistoryDayEntryInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    objc_storeStrong((id *)&v10->_day, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = BUDynamicCast();

    char v13 = 0;
    if (!self || !v5) {
      goto LABEL_13;
    }
    v14 = objc_msgSend_date(self, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v22 = objc_msgSend_date(v5, v15, v16, v17, v18, v19, v20, v21);
    if (v14 == (void *)v22)
    {
    }
    else
    {
      v30 = (void *)v22;
      v31 = objc_msgSend_date(self, v23, v24, v25, v26, v27, v28, v29);
      v39 = objc_msgSend_date(v5, v32, v33, v34, v35, v36, v37, v38);
      int isEqual = objc_msgSend_isEqual_(v31, v40, (uint64_t)v39, v41, v42, v43, v44, v45);

      if (!isEqual)
      {
        char v13 = 0;
LABEL_13:

        return v13;
      }
    }
    v54 = objc_msgSend_day(self, v47, v48, v49, v50, v51, v52, v53);
    v69 = objc_msgSend_day(v5, v55, v56, v57, v58, v59, v60, v61);
    if (v54 == v69)
    {
      char v13 = 1;
    }
    else
    {
      v70 = objc_msgSend_day(self, v62, v63, v64, v65, v66, v67, v68);
      v78 = objc_msgSend_day(v5, v71, v72, v73, v74, v75, v76, v77);
      char v13 = objc_msgSend_isEqual_(v70, v79, (uint64_t)v78, v80, v81, v82, v83, v84);
    }
    goto LABEL_13;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryDayEntryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = (BDSReadingHistoryDayEntryInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"date", v15, v16, v17, v18);
    date = v12->_date;
    v12->_date = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"day", v23, v24, v25, v26);
    day = v12->_day;
    v12->_day = (BDSReadingHistoryDayInfo *)v27;
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_date(self, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"date", v14, v15, v16, v17);

  objc_msgSend_day(self, v18, v19, v20, v21, v22, v23, v24);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v30, @"day", v26, v27, v28, v29);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSReadingHistoryDayEntryInfo);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_date(self, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setDate_(v11, v13, (uint64_t)v12, v14, v15, v16, v17, v18);

    uint64_t v26 = objc_msgSend_day(self, v19, v20, v21, v22, v23, v24, v25);
    objc_msgSend_setDay_(v11, v27, (uint64_t)v26, v28, v29, v30, v31, v32);
  }
  return v11;
}

- (id)description
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_date(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_day(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_stringWithFormat_(v9, v19, @"{%@: %@}", v20, v21, v22, v23, v24, v10, v18);

  return v25;
}

- (NSString)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BDSReadingHistoryDayInfo)day
{
  return self->_day;
}

- (void)setDay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_day, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end