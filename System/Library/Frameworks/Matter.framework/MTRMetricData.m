@interface MTRMetricData
- (MTRMetricData)init;
- (MTRMetricData)initWithMetricEvent:(const MetricEvent *)a3;
- (NSNumber)duration;
- (NSNumber)errorCode;
- (NSNumber)value;
- (id)description;
- (void)setDurationFromMetricData:(id)a3;
@end

@implementation MTRMetricData

- (MTRMetricData)init
{
  int v3 = 2;
  v4 = "";
  char v5 = 0;
  return (MTRMetricData *)objc_msgSend_initWithMetricEvent_(self, a2, (uint64_t)&v3);
}

- (MTRMetricData)initWithMetricEvent:(const MetricEvent *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MTRMetricData;
  v4 = [(MTRMetricData *)&v23 init];
  char v5 = v4;
  if (v4)
  {
    unsigned int var0 = a3->var0;
    v4->_type = a3->var0;
    if (var0 >= 2)
    {
      if (var0 != 2) {
        goto LABEL_7;
      }
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = (*((uint64_t (**)(_UNKNOWN **))*off_268EBD1B0 + 3))(off_268EBD1B0);
    }
    v5->_timePoint.__rep_ = v7;
LABEL_7:
    int v8 = *((unsigned __int8 *)&a3->var2 + 4);
    if (v8 == 3)
    {
      v17 = NSNumber;
      unsigned int v18 = sub_244C991AC((uint64_t)a3);
      uint64_t v20 = objc_msgSend_numberWithUnsignedInteger_(v17, v19, v18);
      errorCode = v5->_errorCode;
      v5->_errorCode = (NSNumber *)v20;
    }
    else
    {
      if (v8 == 2)
      {
        v13 = NSNumber;
        unsigned int v14 = sub_244C99184((uint64_t)a3);
        uint64_t v12 = objc_msgSend_numberWithUnsignedInteger_(v13, v15, v14);
      }
      else
      {
        if (v8 != 1)
        {
LABEL_15:
          v21 = v5;
          goto LABEL_16;
        }
        v9 = NSNumber;
        int v10 = sub_244C9915C((uint64_t)a3);
        uint64_t v12 = objc_msgSend_numberWithInteger_(v9, v11, v10);
      }
      errorCode = v5->_value;
      v5->_value = (NSNumber *)v12;
    }

    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (void)setDurationFromMetricData:(id)a3
{
  int v8 = a3;
  objc_msgSend_numberWithDouble_(NSNumber, v4, v5, (double)(self->_timePoint.__rep_ - v8[1]) / 1000000.0);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  duration = self->_duration;
  self->_duration = v6;
}

- (id)description
{
  v4 = NSString;
  uint64_t type = self->_type;
  v6 = objc_msgSend_value(self, a2, v2);
  v9 = objc_msgSend_errorCode(self, v7, v8);
  uint64_t v12 = objc_msgSend_duration(self, v10, v11);
  unsigned int v14 = objc_msgSend_stringWithFormat_(v4, v13, @"<MTRMetricData: Type %d, Value = %@, Error Code = %@, Duration = %@ us>", type, v6, v9, v12);

  return v14;
}

- (NSNumber)value
{
  return self->_value;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end