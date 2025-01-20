@interface IDSSOSLogger
+ (id)logger;
+ (id)loggerWithURLString:(id)a3;
- (IDSRateLimiter)rateLimiter;
- (IDSSOSLogger)initWithSOSURLString:(id)a3;
- (NSString)sosURLString;
- (void)logMetric:(id)a3;
- (void)setRateLimiter:(id)a3;
- (void)setSosURLString:(id)a3;
@end

@implementation IDSSOSLogger

+ (id)logger
{
  return (id)((uint64_t (*)(id, char *, __CFString *))MEMORY[0x1F4181798])(a1, sel_loggerWithURLString_, @"https://messaging.metrics.icloud.com/sos");
}

+ (id)loggerWithURLString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v8 = objc_msgSend_initWithSOSURLString_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (IDSSOSLogger)initWithSOSURLString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSSOSLogger;
  v6 = [(IDSSOSLogger *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sosURLString, a3);
  }

  return v7;
}

- (IDSRateLimiter)rateLimiter
{
  rateLimiter = self->_rateLimiter;
  if (!rateLimiter)
  {
    id v4 = [IDSRateLimiter alloc];
    v6 = (IDSRateLimiter *)objc_msgSend_initWithLimit_timeLimit_(v4, v5, 1, 300.0);
    double v7 = self->_rateLimiter;
    self->_rateLimiter = v6;

    rateLimiter = self->_rateLimiter;
  }
  return rateLimiter;
}

- (void)logMetric:(id)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6
    || (objc_msgSend_operationID(0, v4, v5, v7),
        v46 = objc_claimAutoreleasedReturnValue(),
        v46,
        !v46))
  {
    v8 = objc_msgSend_rateLimiter(self, v4, v5, v7);
    int v11 = objc_msgSend_underLimitForItem_(v8, v9, @"SOSRateLimitItem", v10);

    if (v11)
    {
      id v12 = v6;
      uint64_t v16 = objc_msgSend_sosType(v12, v13, v14, v15);
      unint64_t v17 = v16;
      v18 = @"warn";
      if (v16 != 1) {
        v18 = 0;
      }
      if (!v16) {
        v18 = @"fatal";
      }
      v19 = v18;
      unint64_t v23 = objc_msgSend_sosDomain(v12, v20, v21, v22);
      id v24 = 0;
      if (v23 <= 2)
      {
        if (v17 > 1)
        {
          id v24 = 0;
        }
        else
        {
          uint64_t v25 = (uint64_t)*(&off_1E5974F80 + v23);
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          objc_msgSend_setObject_forKeyedSubscript_(v24, v26, (uint64_t)v19, v27, @"errorType");
          objc_msgSend_setObject_forKeyedSubscript_(v24, v28, v25, v29, @"domain");
          v33 = objc_msgSend_operationID(v12, v30, v31, v32);
          objc_msgSend_setObject_forKeyedSubscript_(v24, v34, (uint64_t)v33, v35, @"operationId");

          v36 = NSString;
          uint64_t v40 = objc_msgSend_sosError(v12, v37, v38, v39);
          v43 = objc_msgSend_stringWithFormat_(v36, v41, @"%lld", v42, v40);
          objc_msgSend_setObject_forKeyedSubscript_(v24, v44, (uint64_t)v43, v45, @"errorCode");
        }
      }

      if (v24)
      {
        v50 = NSString;
        v51 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v47, v48, v49);
        v55 = objc_msgSend_productName(v51, v52, v53, v54);
        v59 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v56, v57, v58);
        v63 = objc_msgSend_productVersion(v59, v60, v61, v62);
        v67 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v64, v65, v66);
        v71 = objc_msgSend_productBuildVersion(v67, v68, v69, v70);
        v74 = objc_msgSend_stringWithFormat_(v50, v72, @"%@,%@,%@", v73, v55, v63, v71);
        objc_msgSend_setObject_forKeyedSubscript_(v24, v75, (uint64_t)v74, v76, @"osv");

        v80 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v77, v78, v79);
        v84 = objc_msgSend_model(v80, v81, v82, v83);

        if (v84) {
          objc_msgSend_setObject_forKeyedSubscript_(v24, v85, (uint64_t)v84, v87, @"hwv");
        }
        v88 = (void *)MEMORY[0x1E4F290E0];
        v89 = objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x1E4F290F0], v85, v86, v87);
        v92 = objc_msgSend_sessionWithConfiguration_(v88, v90, (uint64_t)v89, v91);

        v93 = (void *)MEMORY[0x1E4F28E88];
        v96 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v94, (uint64_t)self->_sosURLString, v95);
        v99 = objc_msgSend_requestWithURL_(v93, v97, (uint64_t)v96, v98);

        objc_msgSend_setHTTPMethod_(v99, v100, @"POST", v101);
        id v120 = 0;
        v104 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v102, (uint64_t)v24, v103, 0, &v120);
        id v106 = v120;
        if (v104)
        {
          objc_msgSend_setHTTPBody_(v99, v105, (uint64_t)v104, v107);
          v111 = objc_msgSend_serverBag(MEMORY[0x1E4F6C3B8], v108, v109, v110);
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v122 = v24;
            __int16 v123 = 2112;
            v124 = v99;
            _os_log_impl(&dword_19D9BE000, v111, OS_LOG_TYPE_DEFAULT, "Posting SOS! {payload: %@, request: %@}", buf, 0x16u);
          }

          v118[0] = MEMORY[0x1E4F143A8];
          v118[1] = 3221225472;
          v118[2] = sub_19DADDF64;
          v118[3] = &unk_1E5974F60;
          v118[4] = self;
          id v119 = v92;
          v114 = objc_msgSend_dataTaskWithRequest_completionHandler_(v119, v112, (uint64_t)v99, v113, v118);
          objc_msgSend_resume(v114, v115, v116, v117);
        }
      }
    }
  }
}

- (NSString)sosURLString
{
  return self->_sosURLString;
}

- (void)setSosURLString:(id)a3
{
}

- (void)setRateLimiter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_sosURLString, 0);
}

@end