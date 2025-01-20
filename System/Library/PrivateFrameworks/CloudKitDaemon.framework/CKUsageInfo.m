@interface CKUsageInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKUsageInfo)initWithCoder:(id)a3;
- (CKUsageInfo)initWithLastUsed:(id)a3;
- (CKUsageInfo)initWithLastUsed:(id)a3 lastSent:(id)a4 sending:(id)a5 failureCount:(unint64_t)a6;
- (CKUsageInfo)initWithUsageInfoEntry:(id)a3;
- (NSDate)lastSent;
- (NSDate)lastUsed;
- (NSDate)sending;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (id)startSendingWithResendingRefreshInterval:(double)a3 maxFailureCount:(unint64_t)a4;
- (unint64_t)failureCount;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)completeSendingForDate:(id)a3 withSuccess:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setFailureCount:(unint64_t)a3;
- (void)setLastSent:(id)a3;
- (void)setLastUsed:(id)a3;
- (void)setSending:(id)a3;
@end

@implementation CKUsageInfo

- (CKUsageInfo)initWithUsageInfoEntry:(id)a3
{
  id v4 = a3;
  objc_msgSend_lastUsed(v4, v5, v6);
  v7 = (CKUsageInfo *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v10 = objc_msgSend_lastUsed(v4, v8, v9);
    v13 = objc_msgSend_lastSent(v4, v11, v12);
    v16 = objc_msgSend_sending(v4, v14, v15);
    uint64_t v19 = objc_msgSend_failureCount(v4, v17, v18);
    Used_lastSent_sending_failureCount = objc_msgSend_initWithLastUsed_lastSent_sending_failureCount_(self, v20, (uint64_t)v10, v13, v16, v19);

    self = Used_lastSent_sending_failureCount;
    v7 = self;
  }

  return v7;
}

- (CKUsageInfo)initWithLastUsed:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKUsageInfo;
  v7 = [(CKUsageInfo *)&v11 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_copy(v4, v5, v6);
    lastUsed = v7->_lastUsed;
    v7->_lastUsed = (NSDate *)v8;
  }
  return v7;
}

- (CKUsageInfo)initWithLastUsed:(id)a3 lastSent:(id)a4 sending:(id)a5 failureCount:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CKUsageInfo;
  uint64_t v15 = [(CKUsageInfo *)&v27 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v11, v13, v14);
    lastSent = v15->_lastSent;
    v15->_lastSent = (NSDate *)v16;

    uint64_t v20 = objc_msgSend_copy(v10, v18, v19);
    lastUsed = v15->_lastUsed;
    v15->_lastUsed = (NSDate *)v20;

    uint64_t v24 = objc_msgSend_copy(v12, v22, v23);
    sending = v15->_sending;
    v15->_sending = (NSDate *)v24;

    v15->_failureCount = a6;
  }

  return v15;
}

- (id)startSendingWithResendingRefreshInterval:(double)a3 maxFailureCount:(unint64_t)a4
{
  v7 = objc_msgSend_sending(self, a2, a4);

  if (v7)
  {
    id v10 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v8, v9);
    v13 = objc_msgSend_sending(self, v11, v12);
    objc_msgSend_timeIntervalSinceDate_(v10, v14, (uint64_t)v13);
    double v16 = v15;

    if (v16 <= a3)
    {

LABEL_6:
      uint64_t v24 = 0;
      goto LABEL_8;
    }
    uint64_t v19 = objc_msgSend_failureCount(self, v17, v18);
    objc_msgSend_setFailureCount_(self, v20, v19 + 1);
    objc_msgSend_setSending_(self, v21, 0);
  }
  if (objc_msgSend_failureCount(self, v8, v9) > a4) {
    goto LABEL_6;
  }
  v25 = objc_msgSend_lastUsed(self, v22, v23);
  objc_msgSend_setSending_(self, v26, (uint64_t)v25);

  uint64_t v24 = objc_msgSend_sending(self, v27, v28);
LABEL_8:
  return v24;
}

- (void)completeSendingForDate:(id)a3 withSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v9 = objc_msgSend_sending(self, v7, v8);

  if (!v9)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "completeSendingForDate called when sending is nil", v24, 2u);
    }
  }
  v13 = objc_msgSend_sending(self, v10, v11);
  int isEqualToDate = objc_msgSend_isEqualToDate_(v13, v14, (uint64_t)v6);

  if (isEqualToDate)
  {
    if (v4)
    {
      uint64_t v18 = objc_msgSend_sending(self, v16, v17);
      objc_msgSend_setLastSent_(self, v19, (uint64_t)v18);

      objc_msgSend_setFailureCount_(self, v20, 0);
    }
    else
    {
      uint64_t v22 = objc_msgSend_failureCount(self, v16, v17) + 1;
      objc_msgSend_setFailureCount_(self, v23, v22);
    }
    objc_msgSend_setSending_(self, v21, 0);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v8 = objc_msgSend_lastUsed(self, v6, v7);
    uint64_t v11 = objc_msgSend_lastUsed(v5, v9, v10);
    if (CKObjectsAreBothNilOrEqual())
    {
      uint64_t v14 = objc_msgSend_lastSent(self, v12, v13);
      uint64_t v17 = objc_msgSend_lastSent(v5, v15, v16);
      if (CKObjectsAreBothNilOrEqual())
      {
        uint64_t v20 = objc_msgSend_sending(self, v18, v19);
        uint64_t v23 = objc_msgSend_sending(v5, v21, v22);
        if (CKObjectsAreBothNilOrEqual())
        {
          uint64_t v26 = objc_msgSend_failureCount(self, v24, v25);
          BOOL v29 = v26 == objc_msgSend_failureCount(v5, v27, v28);
        }
        else
        {
          BOOL v29 = 0;
        }
      }
      else
      {
        BOOL v29 = 0;
      }
    }
    else
    {
      BOOL v29 = 0;
    }
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  id v4 = (void *)MEMORY[0x1C8789E70]();
  uint64_t v7 = objc_msgSend_lastSent(self, v5, v6);
  objc_msgSend_encodeObject_forKey_(v21, v8, (uint64_t)v7, @"LastSent");

  uint64_t v11 = objc_msgSend_lastUsed(self, v9, v10);
  objc_msgSend_encodeObject_forKey_(v21, v12, (uint64_t)v11, @"LastUsed");

  double v15 = objc_msgSend_sending(self, v13, v14);
  objc_msgSend_encodeObject_forKey_(v21, v16, (uint64_t)v15, @"Sending");

  uint64_t v19 = objc_msgSend_failureCount(self, v17, v18);
  objc_msgSend_encodeInteger_forKey_(v21, v20, v19, @"FailureCount");
}

- (CKUsageInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKUsageInfo;
  id v5 = [(CKUsageInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"LastSent");
    lastSent = v5->_lastSent;
    v5->_lastSent = (NSDate *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"LastUsed");
    lastUsed = v5->_lastUsed;
    v5->_lastUsed = (NSDate *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"Sending");
    sending = v5->_sending;
    v5->_sending = (NSDate *)v17;

    v5->_failureCount = objc_msgSend_decodeIntegerForKey_(v4, v19, @"FailureCount");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CKUsageInfo alloc];
  uint64_t v7 = objc_msgSend_lastUsed(self, v5, v6);
  Used = objc_msgSend_initWithLastUsed_(v4, v8, (uint64_t)v7);

  uint64_t v12 = objc_msgSend_lastSent(self, v10, v11);
  objc_msgSend_setLastSent_(Used, v13, (uint64_t)v12);

  uint64_t v16 = objc_msgSend_failureCount(self, v14, v15);
  objc_msgSend_setFailureCount_(Used, v17, v16);
  uint64_t v20 = objc_msgSend_sending(self, v18, v19);
  objc_msgSend_setSending_(Used, v21, (uint64_t)v20);

  return Used;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_lastSent(self, v5, v6);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v8, @"lastSent", v7, 0);

  uint64_t v11 = objc_msgSend_lastUsed(self, v9, v10);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v12, @"lastUsed", v11, 0);

  uint64_t v15 = objc_msgSend_sending(self, v13, v14);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v16, @"sending", v15, 0);

  uint64_t v17 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v20 = objc_msgSend_failureCount(self, v18, v19);
  objc_msgSend_numberWithUnsignedInteger_(v17, v21, v20);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v22, @"failureCount", v23, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKUsageInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKUsageInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (NSDate)lastSent
{
  return self->_lastSent;
}

- (void)setLastSent:(id)a3
{
}

- (NSDate)sending
{
  return self->_sending;
}

- (void)setSending:(id)a3
{
}

- (unint64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(unint64_t)a3
{
  self->_failureCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sending, 0);
  objc_storeStrong((id *)&self->_lastSent, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
}

@end