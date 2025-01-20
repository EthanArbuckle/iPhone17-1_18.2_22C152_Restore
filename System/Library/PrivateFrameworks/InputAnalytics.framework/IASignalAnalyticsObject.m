@interface IASignalAnalyticsObject
+ (BOOL)supportsSecureCoding;
- (IASignalAnalyticsObject)initWithChannel:(id)a3 signal:(id)a4 sessionIdString:(id)a5 payload:(id)a6;
- (IASignalAnalyticsObject)initWithCoder:(id)a3;
- (NSDictionary)payload;
- (NSString)analyticsSessionIdString;
- (NSString)channelName;
- (NSString)signalName;
- (id)description;
- (id)obtainPayloadValueSafelyForKey:(id)a3 expectedClass:(Class)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalyticsSessionIdString:(id)a3;
- (void)setChannelName:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSignalName:(id)a3;
@end

@implementation IASignalAnalyticsObject

- (IASignalAnalyticsObject)initWithChannel:(id)a3 signal:(id)a4 sessionIdString:(id)a5 payload:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)IASignalAnalyticsObject;
  v14 = [(IAXPCObject *)&v25 init];
  v17 = v14;
  if (v14)
  {
    objc_msgSend_setChannelName_(v14, v15, (uint64_t)v10, v16);
    objc_msgSend_setSignalName_(v17, v18, (uint64_t)v11, v19);
    objc_msgSend_setAnalyticsSessionIdString_(v17, v20, (uint64_t)v12, v21);
    objc_msgSend_setPayload_(v17, v22, (uint64_t)v13, v23);
  }

  return v17;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v8 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6, v7);
  v66.receiver = self;
  v66.super_class = (Class)IASignalAnalyticsObject;
  v9 = [(IAXPCObject *)&v66 description];
  objc_msgSend_addObject_(v8, v10, (uint64_t)v9, v11);

  id v12 = NSString;
  uint64_t v16 = objc_msgSend_channelName(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v12, v17, @"channelName=%@", v18, v16);
  objc_msgSend_addObject_(v8, v20, (uint64_t)v19, v21);

  v22 = NSString;
  v26 = objc_msgSend_signalName(self, v23, v24, v25);
  v29 = objc_msgSend_stringWithFormat_(v22, v27, @"signalName=%@", v28, v26);
  objc_msgSend_addObject_(v8, v30, (uint64_t)v29, v31);

  v35 = objc_msgSend_analyticsSessionIdString(self, v32, v33, v34);

  if (v35)
  {
    v39 = NSString;
    v40 = objc_msgSend_analyticsSessionIdString(self, v36, v37, v38);
    v43 = objc_msgSend_stringWithFormat_(v39, v41, @"analyticsSessionIdString=%@", v42, v40);
    objc_msgSend_addObject_(v8, v44, (uint64_t)v43, v45);
  }
  v46 = objc_msgSend_payload(self, v36, v37, v38);

  if (v46)
  {
    v50 = NSString;
    v51 = objc_msgSend_payload(self, v47, v48, v49);
    v55 = objc_msgSend_description(v51, v52, v53, v54);
    v58 = objc_msgSend_stringWithFormat_(v50, v56, @"payload=%@", v57, v55);
    objc_msgSend_addObject_(v8, v59, (uint64_t)v58, v60);
  }
  v61 = objc_msgSend_componentsJoinedByString_(v8, v47, @", ", v49);
  v64 = objc_msgSend_stringByAppendingFormat_(v4, v62, @": %@", v63, v61);

  return v64;
}

- (id)obtainPayloadValueSafelyForKey:(id)a3 expectedClass:(Class)a4
{
  if (a3)
  {
    id v5 = a3;
    v9 = objc_msgSend_payload(self, v6, v7, v8);
    id v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v5, v11);

    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (NSString)channelName
{
  return self->_channelName;
}

- (void)setChannelName:(id)a3
{
}

- (NSString)signalName
{
  return self->_signalName;
}

- (void)setSignalName:(id)a3
{
}

- (NSString)analyticsSessionIdString
{
  return self->_analyticsSessionIdString;
}

- (void)setAnalyticsSessionIdString:(id)a3
{
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_analyticsSessionIdString, 0);
  objc_storeStrong((id *)&self->_signalName, 0);
  objc_storeStrong((id *)&self->_channelName, 0);
}

- (IASignalAnalyticsObject)initWithCoder:(id)a3
{
  v29[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IASignalAnalyticsObject;
  id v5 = [(IAXPCObject *)&v28 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"channelName");
    channelName = v5->_channelName;
    v5->_channelName = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"signalName");
    signalName = v5->_signalName;
    v5->_signalName = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"analyticsSessionIdString");
    analyticsSessionIdString = v5->_analyticsSessionIdString;
    v5->_analyticsSessionIdString = (NSString *)v16;

    id v18 = objc_alloc(MEMORY[0x263EFFA08]);
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v29[3] = objc_opt_class();
    v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)v29, 4);
    uint64_t v23 = objc_msgSend_initWithArray_(v18, v21, (uint64_t)v20, v22);
    uint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, @"payload");
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IASignalAnalyticsObject;
  id v4 = a3;
  [(IAXPCObject *)&v9 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_channelName, @"channelName", v9.receiver, v9.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_signalName, @"signalName");
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_analyticsSessionIdString, @"analyticsSessionIdString");
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_payload, @"payload");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end