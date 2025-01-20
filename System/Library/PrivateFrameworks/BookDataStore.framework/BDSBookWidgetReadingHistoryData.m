@interface BDSBookWidgetReadingHistoryData
+ (BOOL)supportsSecureCoding;
- (BDSBookWidgetReadingHistoryData)initWithCoder:(id)a3;
- (BDSBookWidgetReadingHistoryData)initWithStateInfo:(id)a3 readingGoalsEnabled:(BOOL)a4;
- (BDSReadingHistoryStateInfo)stateInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readingGoalsEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setReadingGoalsEnabled:(BOOL)a3;
- (void)setStateInfo:(id)a3;
@end

@implementation BDSBookWidgetReadingHistoryData

- (BDSBookWidgetReadingHistoryData)initWithStateInfo:(id)a3 readingGoalsEnabled:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BDSBookWidgetReadingHistoryData;
  v8 = [(BDSBookWidgetReadingHistoryData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_stateInfo, a3);
    v9->_readingGoalsEnabled = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v12 = a3;
    objc_opt_class();
    v4 = BUDynamicCast();

    LOBYTE(v12) = 0;
    if (!self || !v4) {
      goto LABEL_10;
    }
    v13 = objc_msgSend_stateInfo(self, v5, v6, v7, v8, v9, v10, v11);
    uint64_t v21 = objc_msgSend_stateInfo(v4, v14, v15, v16, v17, v18, v19, v20);
    if (v13 == (void *)v21)
    {
    }
    else
    {
      v29 = (void *)v21;
      v30 = objc_msgSend_stateInfo(self, v22, v23, v24, v25, v26, v27, v28);
      v38 = objc_msgSend_stateInfo(v4, v31, v32, v33, v34, v35, v36, v37);
      int isEqual = objc_msgSend_isEqual_(v30, v39, (uint64_t)v38, v40, v41, v42, v43, v44);

      if (!isEqual)
      {
        LOBYTE(v12) = 0;
LABEL_10:

        return (char)v12;
      }
    }
    int v53 = objc_msgSend_readingGoalsEnabled(self, v46, v47, v48, v49, v50, v51, v52);
    LODWORD(v12) = v53 ^ objc_msgSend_readingGoalsEnabled(v4, v54, v55, v56, v57, v58, v59, v60) ^ 1;
    goto LABEL_10;
  }
  LOBYTE(v12) = 1;
  return (char)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSBookWidgetReadingHistoryData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v12 = (BDSBookWidgetReadingHistoryData *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"stateInfo", v15, v16, v17, v18);
    stateInfo = v12->_stateInfo;
    v12->_stateInfo = (BDSReadingHistoryStateInfo *)v19;

    v12->_readingGoalsEnabled = objc_msgSend_decodeBoolForKey_(v4, v21, @"readingGoalsEnabled", v22, v23, v24, v25, v26);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  uint64_t v11 = objc_msgSend_stateInfo(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v30, v12, (uint64_t)v11, @"stateInfo", v13, v14, v15, v16);

  uint64_t v24 = objc_msgSend_readingGoalsEnabled(self, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_encodeBool_forKey_(v30, v25, v24, @"readingGoalsEnabled", v26, v27, v28, v29);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSBookWidgetReadingHistoryData);
  if (v11)
  {
    id v12 = objc_msgSend_stateInfo(self, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setStateInfo_(v11, v13, (uint64_t)v12, v14, v15, v16, v17, v18);

    uint64_t v26 = objc_msgSend_readingGoalsEnabled(self, v19, v20, v21, v22, v23, v24, v25);
    objc_msgSend_setReadingGoalsEnabled_(v11, v27, v26, v28, v29, v30, v31, v32);
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v12 = objc_msgSend_stateInfo(self, v5, v6, v7, v8, v9, v10, v11);
  unsigned int v20 = objc_msgSend_readingGoalsEnabled(self, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v27 = objc_msgSend_stringWithFormat_(v3, v21, @"<%@: %p stateInfo:%@, readingGoalsEnabled:%d>", v22, v23, v24, v25, v26, v4, self, v12, v20);

  return v27;
}

- (BDSReadingHistoryStateInfo)stateInfo
{
  return self->_stateInfo;
}

- (void)setStateInfo:(id)a3
{
}

- (BOOL)readingGoalsEnabled
{
  return self->_readingGoalsEnabled;
}

- (void)setReadingGoalsEnabled:(BOOL)a3
{
  self->_readingGoalsEnabled = a3;
}

- (void).cxx_destruct
{
}

@end