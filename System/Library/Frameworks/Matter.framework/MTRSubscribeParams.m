@interface MTRSubscribeParams
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldReplaceExistingSubscriptions;
- (BOOL)shouldReportEventsUrgently;
- (BOOL)shouldResubscribeAutomatically;
- (MTRSubscribeParams)init;
- (MTRSubscribeParams)initWithCoder:(id)a3;
- (MTRSubscribeParams)initWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval;
- (NSNumber)autoResubscribe;
- (NSNumber)keepPreviousSubscriptions;
- (NSNumber)maxInterval;
- (NSNumber)minInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoResubscribe:(NSNumber *)autoResubscribe;
- (void)setKeepPreviousSubscriptions:(NSNumber *)keepPreviousSubscriptions;
- (void)setMaxInterval:(NSNumber *)maxInterval;
- (void)setMinInterval:(NSNumber *)minInterval;
- (void)setReplaceExistingSubscriptions:(BOOL)replaceExistingSubscriptions;
- (void)setReportEventsUrgently:(BOOL)reportEventsUrgently;
- (void)setResubscribeAutomatically:(BOOL)resubscribeAutomatically;
- (void)toReadPrepareParams:(void *)a3;
@end

@implementation MTRSubscribeParams

- (MTRSubscribeParams)initWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval
{
  v6 = minInterval;
  v7 = maxInterval;
  v19.receiver = self;
  v19.super_class = (Class)MTRSubscribeParams;
  v8 = [(MTRReadParams *)&v19 init];
  v11 = v8;
  if (v8)
  {
    v8->_reportEventsUrgently = 1;
    v8->_replaceExistingSubscriptions = 1;
    v8->_resubscribeAutomatically = 1;
    uint64_t v12 = objc_msgSend_copy(v6, v9, v10);
    v13 = v11->_minInterval;
    v11->_minInterval = (NSNumber *)v12;

    uint64_t v16 = objc_msgSend_copy(v7, v14, v15);
    v17 = v11->_maxInterval;
    v11->_maxInterval = (NSNumber *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MTRSubscribeParams alloc];
  v7 = objc_msgSend_minInterval(self, v5, v6);
  uint64_t v10 = objc_msgSend_maxInterval(self, v8, v9);
  uint64_t v12 = objc_msgSend_initWithMinInterval_maxInterval_(v4, v11, (uint64_t)v7, v10);

  uint64_t shouldFilterByFabric = objc_msgSend_shouldFilterByFabric(self, v13, v14);
  objc_msgSend_setFilterByFabric_(v12, v16, shouldFilterByFabric);
  objc_super v19 = objc_msgSend_minEventNumber(self, v17, v18);
  objc_msgSend_setMinEventNumber_(v12, v20, (uint64_t)v19);

  uint64_t shouldAssumeUnknownAttributesReportable = objc_msgSend_shouldAssumeUnknownAttributesReportable(self, v21, v22);
  objc_msgSend_setAssumeUnknownAttributesReportable_(v12, v24, shouldAssumeUnknownAttributesReportable);
  uint64_t shouldReplaceExistingSubscriptions = objc_msgSend_shouldReplaceExistingSubscriptions(self, v25, v26);
  objc_msgSend_setReplaceExistingSubscriptions_(v12, v28, shouldReplaceExistingSubscriptions);
  uint64_t shouldReportEventsUrgently = objc_msgSend_shouldReportEventsUrgently(self, v29, v30);
  objc_msgSend_setReportEventsUrgently_(v12, v32, shouldReportEventsUrgently);
  uint64_t shouldResubscribeAutomatically = objc_msgSend_shouldResubscribeAutomatically(self, v33, v34);
  objc_msgSend_setResubscribeAutomatically_(v12, v36, shouldResubscribeAutomatically);
  v39 = objc_msgSend_minInterval(self, v37, v38);
  objc_msgSend_setMinInterval_(v12, v40, (uint64_t)v39);

  v43 = objc_msgSend_maxInterval(self, v41, v42);
  objc_msgSend_setMaxInterval_(v12, v44, (uint64_t)v43);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTRSubscribeParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MTRSubscribeParams;
  uint64_t v6 = [(MTRReadParams *)&v25 initWithCoder:v4];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_decodeBoolForKey_(v4, v5, @"sFilterByFabricKey");
    objc_msgSend_setReplaceExistingSubscriptions_(v6, v8, v7);
    uint64_t v10 = objc_msgSend_decodeBoolForKey_(v4, v9, @"sMinEventNumberKey");
    objc_msgSend_setReportEventsUrgently_(v6, v11, v10);
    uint64_t v13 = objc_msgSend_decodeBoolForKey_(v4, v12, @"sAssumeUnknownAttributesReportableKey");
    objc_msgSend_setResubscribeAutomatically_(v6, v14, v13);
    uint64_t v15 = objc_opt_class();
    v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"sMinIntervalKeyKey");
    objc_msgSend_setMinInterval_(v6, v18, (uint64_t)v17);

    uint64_t v19 = objc_opt_class();
    v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"sMaxIntervalKeyKey");
    objc_msgSend_setMaxInterval_(v6, v22, (uint64_t)v21);

    v23 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MTRSubscribeParams;
  [(MTRReadParams *)&v29 encodeWithCoder:v4];
  uint64_t shouldReplaceExistingSubscriptions = objc_msgSend_shouldReplaceExistingSubscriptions(self, v5, v6);
  objc_msgSend_encodeBool_forKey_(v4, v8, shouldReplaceExistingSubscriptions, @"sFilterByFabricKey");
  uint64_t shouldReportEventsUrgently = objc_msgSend_shouldReportEventsUrgently(self, v9, v10);
  objc_msgSend_encodeBool_forKey_(v4, v12, shouldReportEventsUrgently, @"sMinEventNumberKey");
  uint64_t shouldResubscribeAutomatically = objc_msgSend_shouldResubscribeAutomatically(self, v13, v14);
  objc_msgSend_encodeBool_forKey_(v4, v16, shouldResubscribeAutomatically, @"sAssumeUnknownAttributesReportableKey");
  uint64_t v19 = objc_msgSend_minInterval(self, v17, v18);

  if (v19)
  {
    uint64_t v22 = objc_msgSend_minInterval(self, v20, v21);
    objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, @"sMinIntervalKeyKey");
  }
  v24 = objc_msgSend_maxInterval(self, v20, v21);

  if (v24)
  {
    v27 = objc_msgSend_maxInterval(self, v25, v26);
    objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v27, @"sMaxIntervalKeyKey");
  }
}

- (void)toReadPrepareParams:(void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MTRSubscribeParams;
  -[MTRReadParams toReadPrepareParams:](&v17, sel_toReadPrepareParams_);
  uint64_t v7 = objc_msgSend_minInterval(self, v5, v6);
  *((_WORD *)a3 + 54) = objc_msgSend_unsignedShortValue(v7, v8, v9);

  uint64_t v12 = objc_msgSend_maxInterval(self, v10, v11);
  *((_WORD *)a3 + 55) = objc_msgSend_unsignedShortValue(v12, v13, v14);

  *((unsigned char *)a3 + 112) = objc_msgSend_shouldReplaceExistingSubscriptions(self, v15, v16) ^ 1;
}

- (BOOL)shouldReplaceExistingSubscriptions
{
  return self->_replaceExistingSubscriptions;
}

- (void)setReplaceExistingSubscriptions:(BOOL)replaceExistingSubscriptions
{
  self->_replaceExistingSubscriptions = replaceExistingSubscriptions;
}

- (BOOL)shouldResubscribeAutomatically
{
  return self->_resubscribeAutomatically;
}

- (void)setResubscribeAutomatically:(BOOL)resubscribeAutomatically
{
  self->_resubscribeAutomatically = resubscribeAutomatically;
}

- (NSNumber)minInterval
{
  return self->_minInterval;
}

- (void)setMinInterval:(NSNumber *)minInterval
{
}

- (NSNumber)maxInterval
{
  return self->_maxInterval;
}

- (void)setMaxInterval:(NSNumber *)maxInterval
{
}

- (BOOL)shouldReportEventsUrgently
{
  return self->_reportEventsUrgently;
}

- (void)setReportEventsUrgently:(BOOL)reportEventsUrgently
{
  self->_reportEventsUrgently = reportEventsUrgently;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxInterval, 0);

  objc_storeStrong((id *)&self->_minInterval, 0);
}

- (MTRSubscribeParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRSubscribeParams;
  v2 = [(MTRReadParams *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_replaceExistingSubscriptions = 1;
    v2->_resubscribeAutomatically = 1;
    minInterval = v2->_minInterval;
    v2->_minInterval = (NSNumber *)&unk_26F9CA570;

    maxInterval = v3->_maxInterval;
    v3->_maxInterval = (NSNumber *)&unk_26F9CA588;
  }
  return v3;
}

- (void)setKeepPreviousSubscriptions:(NSNumber *)keepPreviousSubscriptions
{
  id v4 = keepPreviousSubscriptions;
  uint64_t v9 = v4;
  if (v4)
  {
    uint64_t v7 = objc_msgSend_BOOLValue(v4, v5, v6) ^ 1;
    objc_msgSend_setReplaceExistingSubscriptions_(self, v8, v7);
  }
  else
  {
    objc_msgSend_setReplaceExistingSubscriptions_(self, v5, 1);
  }
}

- (NSNumber)keepPreviousSubscriptions
{
  v3 = NSNumber;
  uint64_t v5 = objc_msgSend_shouldReplaceExistingSubscriptions(self, a2, v2) ^ 1;

  return (NSNumber *)objc_msgSend_numberWithBool_(v3, v4, v5);
}

- (void)setAutoResubscribe:(NSNumber *)autoResubscribe
{
  id v4 = autoResubscribe;
  uint64_t v9 = v4;
  if (v4)
  {
    uint64_t v7 = objc_msgSend_BOOLValue(v4, v5, v6);
    objc_msgSend_setResubscribeAutomatically_(self, v8, v7);
  }
  else
  {
    objc_msgSend_setResubscribeAutomatically_(self, v5, 1);
  }
}

- (NSNumber)autoResubscribe
{
  v3 = NSNumber;
  uint64_t shouldResubscribeAutomatically = objc_msgSend_shouldResubscribeAutomatically(self, a2, v2);

  return (NSNumber *)objc_msgSend_numberWithBool_(v3, v4, shouldResubscribeAutomatically);
}

@end