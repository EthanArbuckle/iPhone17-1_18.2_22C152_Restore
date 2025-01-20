@interface IDSMissingMessageMetric
- (BOOL)_shouldReportMetricForExternal;
- (BOOL)_shouldReportReason;
- (BOOL)_shouldReportReasonForExternal;
- (BOOL)shouldReportMetric;
- (IDSMissingMessageMetric)initWithReason:(int64_t)a3 guid:(id)a4 service:(id)a5 additionalInformation:(id)a6;
- (NSDictionary)additionalInfo;
- (NSDictionary)payload;
- (NSNumber)command;
- (NSString)guid;
- (NSString)service;
- (int64_t)reason;
@end

@implementation IDSMissingMessageMetric

- (IDSMissingMessageMetric)initWithReason:(int64_t)a3 guid:(id)a4 service:(id)a5 additionalInformation:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IDSMissingMessageMetric;
  v14 = [(IDSMissingMessageMetric *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_reason = a3;
    objc_storeStrong((id *)&v14->_guid, a4);
    objc_storeStrong((id *)&v15->_service, a5);
    objc_storeStrong((id *)&v15->_additionalInfo, a6);
  }

  return v15;
}

- (NSDictionary)payload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_msgSend__shouldReportReason(self, v4, v5, v6))
  {
    v9 = objc_msgSend_numberWithInteger_(NSNumber, v7, self->_reason, v8);
    objc_msgSend_setObject_forKey_(v3, v10, (uint64_t)v9, v11, @"fR");
  }
  id v13 = IDSGetUUIDData(self->_guid);
  if (v13) {
    objc_msgSend_setObject_forKey_(v3, v12, (uint64_t)v13, v14, @"fU");
  }
  additionalInfo = self->_additionalInfo;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_19DB60060;
  v20[3] = &unk_1E59734F8;
  id v16 = v3;
  id v21 = v16;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(additionalInfo, v17, (uint64_t)v20, v18);

  return (NSDictionary *)v16;
}

- (NSNumber)command
{
  return (NSNumber *)&unk_1EF029470;
}

- (BOOL)shouldReportMetric
{
  uint64_t v5 = objc_msgSend_sharedInstance(IDSServerBag, a2, v2, v3);
  double v8 = objc_msgSend_objectForKey_(v5, v6, @"ids-send-missing-metric-message", v7);

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v12 = objc_msgSend_BOOLValue(v8, v9, v10, v11);
  }
  else {
    int v12 = 1;
  }
  if (objc_msgSend__isInternal(self, v9, v10, v11))
  {
    BOOL v16 = 1;
  }
  else
  {
    char shouldReportMetricForExternal = objc_msgSend__shouldReportMetricForExternal(self, v13, v14, v15);
    if (v12) {
      BOOL v16 = shouldReportMetricForExternal;
    }
    else {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (BOOL)_shouldReportReason
{
  if (objc_msgSend__isInternal(self, a2, v2, v3)) {
    return 1;
  }
  return objc_msgSend__shouldReportReasonForExternal(self, v5, v6, v7);
}

- (BOOL)_shouldReportMetricForExternal
{
  uint64_t v5 = objc_msgSend_sharedInstance(IDSServerBag, a2, v2, v3);
  double v8 = objc_msgSend_objectForKey_(v5, v6, @"ids-send-missing-metric-message-without-reason", v7);

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v12 = objc_msgSend_BOOLValue(v8, v9, v10, v11);
  }
  else {
    int v12 = 0;
  }
  int64_t reason = self->_reason;
  BOOL v14 = (unint64_t)(reason - 702) > 0xA || ((1 << (reason + 66)) & 0x5A7) == 0;
  if (!v14 || reason == 801) {
    int v15 = objc_msgSend__shouldReportReasonForExternal(self, v9, v10, v11) | v12;
  }
  else {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)_shouldReportReasonForExternal
{
  int64_t reason = self->_reason;
  return reason == 710 || reason == 801 || reason == 712;
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)service
{
  return self->_service;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end