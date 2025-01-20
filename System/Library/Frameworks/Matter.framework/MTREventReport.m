@interface MTREventReport
- (MTREventPath)path;
- (MTREventReport)initWithPath:(const ConcreteEventPath *)a3 error:(id)a4;
- (MTREventReport)initWithPath:(const ConcreteEventPath *)a3 eventNumber:(id)a4 priority:(unsigned __int8)a5 timestamp:(const Timestamp *)a6 value:(id)a7;
- (MTREventReport)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (MTREventTimeType)eventTimeType;
- (NSDate)timestampDate;
- (NSError)error;
- (NSNumber)eventNumber;
- (NSNumber)priority;
- (NSNumber)timestamp;
- (NSTimeInterval)systemUpTime;
- (id)value;
@end

@implementation MTREventReport

- (MTREventReport)initWithPath:(const ConcreteEventPath *)a3 eventNumber:(id)a4 priority:(unsigned __int8)a5 timestamp:(const Timestamp *)a6 value:(id)a7
{
  unsigned int v9 = a5;
  id v13 = a4;
  id v14 = a7;
  v34.receiver = self;
  v34.super_class = (Class)MTREventReport;
  v15 = [(MTREventReport *)&v34 init];
  if (!v15) {
    goto LABEL_14;
  }
  v16 = [MTREventPath alloc];
  uint64_t v18 = objc_msgSend_initWithPath_(v16, v17, (uint64_t)a3);
  path = v15->_path;
  v15->_path = (MTREventPath *)v18;

  objc_storeStrong((id *)&v15->_eventNumber, a4);
  if (v9 < 3)
  {
    uint64_t v21 = 1;
    if (v9 != 1) {
      uint64_t v21 = 2;
    }
    if (v9) {
      objc_msgSend_numberWithUnsignedInteger_(NSNumber, v20, v21);
    }
    else {
    uint64_t v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v20, 0);
    }
    priority = v15->_priority;
    v15->_priority = (NSNumber *)v22;

    uint64_t v25 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v24, a6->var1);
    timestampValue = v15->_timestampValue;
    v15->_timestampValue = (NSNumber *)v25;

    if (a6->var0 == 1)
    {
      v15->_eventTimeType = 1;
      uint64_t v30 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x263EFF910], v27, v28, (double)(a6->var1 % 0x3E8) / 1000.0 + (double)(a6->var1 / 0x3E8));
      timestampDate = v15->_timestampDate;
      v15->_timestampDate = (NSDate *)v30;

      goto LABEL_13;
    }
    if (!a6->var0)
    {
      v15->_eventTimeType = 0;
      v15->_systemUpTime = (double)(a6->var1 % 0x3E8) / 1000.0 + (double)(a6->var1 / 0x3E8);
LABEL_13:
      objc_storeStrong(&v15->_value, a7);
      error = v15->_error;
      v15->_error = 0;

LABEL_14:
      v29 = v15;
      goto LABEL_15;
    }
  }
  v29 = 0;
LABEL_15:

  return v29;
}

- (MTREventReport)initWithPath:(const ConcreteEventPath *)a3 error:(id)a4
{
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MTREventReport;
  v8 = [(MTREventReport *)&v18 init];
  if (v8)
  {
    unsigned int v9 = [MTREventPath alloc];
    uint64_t v11 = objc_msgSend_initWithPath_(v9, v10, (uint64_t)a3);
    path = v8->_path;
    v8->_path = (MTREventPath *)v11;

    eventNumber = v8->_eventNumber;
    v8->_eventNumber = (NSNumber *)&unk_26F9C8638;

    priority = v8->_priority;
    v8->_priority = (NSNumber *)&unk_26F9C86B0;

    v8->_eventTimeType = 0;
    v8->_systemUpTime = 0.0;
    timestampDate = v8->_timestampDate;
    v8->_timestampDate = 0;

    id value = v8->_value;
    v8->_id value = 0;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

- (MTREventReport)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  v6 = responseValue;
  v70.receiver = self;
  v70.super_class = (Class)MTREventReport;
  id v7 = [(MTREventReport *)&v70 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    if (sub_2447DE310(v6, @"eventPath", v8, @"response-value event path is not an MTREventPath.", error))
    {
      v10 = objc_msgSend_objectForKeyedSubscript_(v6, v9, @"eventPath");
      v12 = objc_msgSend_objectForKeyedSubscript_(v6, v11, @"error");
      if (v12)
      {
        uint64_t v13 = objc_opt_class();
        if (sub_2447DE310(v6, @"error", v13, @"response-value error is not an NSError.", error))
        {
          uint64_t v66 = objc_msgSend__asConcretePath(v10, v14, v15);
          int v67 = (int)v16;
          id v7 = (MTREventReport *)(id)objc_msgSend_initWithPath_error_(v7, v16, (uint64_t)&v66, v12);
          v17 = v7;
LABEL_26:

          goto LABEL_27;
        }
LABEL_18:
        v17 = 0;
        goto LABEL_26;
      }
      uint64_t v18 = objc_opt_class();
      if (!sub_2447DE310(v6, @"data", v18, @"response-value data is not a data-value dictionary.", error))goto LABEL_18; {
      v20 = objc_msgSend_objectForKeyedSubscript_(v6, v19, @"data");
      }
      v68 = 0;
      v69 = 0;
      sub_244CB3988((uint64_t)&v66);
      if ((sub_2447E2870(&v69, &v68, v20, (uint64_t)&v66, error) & 1) == 0)
      {
        v17 = 0;
LABEL_25:
        sub_2446D7EC0(&v68);
        sub_244794634(&v69);

        goto LABEL_26;
      }
      uint64_t v23 = objc_msgSend__asConcretePath(v10, v21, v22);
      int v65 = v24;
      long long v62 = xmmword_2651951F8;
      uint64_t v63 = 3320;
      uint64_t v64 = v23;
      uint64_t v25 = sub_244BCED98((uint64_t)&v64, (uint64_t)&v66, (uint64_t)&v62);
      if (v62 == 182)
      {
        v47 = @"No known schema for decoding event payload.";
        uint64_t v48 = 12;
      }
      else
      {
        if (!v62)
        {
          uint64_t v26 = objc_opt_class();
          if (sub_2447DE310(v6, @"eventNumber", v26, @"response-value event number is not an NSNumber", error))
          {
            uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v6, v27, @"eventNumber");
            eventNumber = v7->_eventNumber;
            v7->_eventNumber = (NSNumber *)v28;

            uint64_t v30 = objc_opt_class();
            if (sub_2447DE310(v6, @"eventPriority", v30, @"response-value event priority is not an NSNumber", error))
            {
              uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v6, v31, @"eventPriority");
              priority = v7->_priority;
              v7->_priority = (NSNumber *)v32;

              uint64_t v34 = objc_opt_class();
              if (sub_2447DE310(v6, @"eventTimeType", v34, @"response-value event time type is not an NSNumber", error))
              {
                v36 = objc_msgSend_objectForKeyedSubscript_(v6, v35, @"eventTimeType");
                if (objc_msgSend_unsignedIntegerValue(v36, v37, v38))
                {
                  if (objc_msgSend_unsignedIntegerValue(v36, v39, v40) == 1)
                  {
                    uint64_t v43 = objc_opt_class();
                    if (sub_2447DE310(v6, @"eventTimestampDate", v43, @"response-value event timestampe is not an NSDate", error))
                    {
                      uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(v6, v44, @"eventTimestampDate");
                      timestampDate = v7->_timestampDate;
                      v7->_timestampDate = (NSDate *)v45;
LABEL_30:

                      v7->_eventTimeType = objc_msgSend_unsignedIntegerValue(v36, v55, v56);
                      objc_storeStrong((id *)&v7->_path, v10);
                      objc_storeStrong(&v7->_value, v25);
                      v57 = v7->_error;
                      v7->_error = 0;

                      v17 = v7;
LABEL_33:

                      goto LABEL_24;
                    }
                  }
                  else
                  {
                    v58 = NSString;
                    uint64_t v59 = objc_msgSend_unsignedLongValue(v36, v41, v42);
                    v61 = objc_msgSend_stringWithFormat_(v58, v60, @"Invalid event time type: %lu", v59);
                    sub_2447DE428(v61, 4, error);
                  }
                }
                else
                {
                  uint64_t v50 = objc_opt_class();
                  if (sub_2447DE310(v6, @"eventSystemUpTime", v50, @"response-value event system uptime time is not an NSNumber", error))
                  {
                    timestampDate = objc_msgSend_objectForKeyedSubscript_(v6, v51, @"eventSystemUpTime");
                    objc_msgSend_doubleValue(timestampDate, v52, v53);
                    v7->_systemUpTime = v54;
                    goto LABEL_30;
                  }
                }
                v17 = 0;
                goto LABEL_33;
              }
            }
          }
LABEL_23:
          v17 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v47 = @"Event payload decoding failed schema check.";
        uint64_t v48 = 13;
      }
      sub_2447DE428(v47, v48, error);
      goto LABEL_23;
    }
  }
  v17 = 0;
LABEL_27:

  return v17;
}

- (MTREventPath)path
{
  return self->_path;
}

- (NSNumber)eventNumber
{
  return self->_eventNumber;
}

- (NSNumber)priority
{
  return self->_priority;
}

- (MTREventTimeType)eventTimeType
{
  return self->_eventTimeType;
}

- (NSTimeInterval)systemUpTime
{
  return self->_systemUpTime;
}

- (NSDate)timestampDate
{
  return self->_timestampDate;
}

- (id)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_timestampDate, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_eventNumber, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_timestampValue, 0);
}

- (NSNumber)timestamp
{
  return self->_timestampValue;
}

@end