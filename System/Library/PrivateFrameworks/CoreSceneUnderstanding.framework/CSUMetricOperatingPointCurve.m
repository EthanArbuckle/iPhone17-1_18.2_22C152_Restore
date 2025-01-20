@interface CSUMetricOperatingPointCurve
- (CSUMetricOperatingPointCurve)initWithOperatingPointsData:(id)a3 metricPattern:(int)a4 error:(id *)a5;
- (int64_t)count;
- (void)enumerateUsingBlock:(id)a3;
@end

@implementation CSUMetricOperatingPointCurve

- (CSUMetricOperatingPointCurve)initWithOperatingPointsData:(id)a3 metricPattern:(int)a4 error:(id *)a5
{
  id v8 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CSUMetricOperatingPointCurve;
  v13 = [(CSUMetricOperatingPointCurve *)&v49 init];
  if (!v13)
  {
    if (a5)
    {
      v32 = objc_msgSend_errorWithCode_message_(CSUError, v9, 4, @"Failed to allocate memory", v12);
LABEL_7:
      v33 = 0;
      *a5 = v32;
      goto LABEL_19;
    }
LABEL_18:
    v33 = 0;
    goto LABEL_19;
  }
  uint64_t v14 = objc_msgSend_copy(v8, v9, v10, v11, v12);
  operatingPoints = v13->_operatingPoints;
  v13->_operatingPoints = (NSData *)v14;

  v13->_int metricPattern = a4;
  if ((objc_msgSend_length(v13->_operatingPoints, v16, v17, v18, v19) & 3) != 0)
  {
    if (a5)
    {
      v24 = NSString;
      uint64_t v25 = objc_msgSend_length(v13->_operatingPoints, v20, v21, v22, v23);
      v29 = objc_msgSend_stringWithFormat_(v24, v26, @"Invalid byte buffer length %lu for metric-operating curve initialization from operating points", v27, v28, v25);
      objc_msgSend_errorWithCode_message_(CSUError, v30, 6, (uint64_t)v29, v31);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_18;
  }
  unint64_t v34 = objc_msgSend_length(v13->_operatingPoints, v20, v21, v22, v23);
  unint64_t v39 = v34;
  int metricPattern = v13->_metricPattern;
  if (!metricPattern)
  {
    uint64_t v41 = 9;
    unint64_t v42 = v34 >> 2;
    if (v34 >> 2 != 9)
    {
LABEL_11:
      if (a5)
      {
        v43 = objc_msgSend_stringWithFormat_(NSString, v35, @"Invalid number %lu of operating points for metric-operating point curve with %lu expected points", v37, v38, v42, v41);
        objc_msgSend_errorWithCode_message_(CSUError, v44, 6, (uint64_t)v43, v45);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (metricPattern != 1)
  {
    if (a5)
    {
      v32 = objc_msgSend_errorWithCode_message_(CSUError, v35, 2, @"Unhandled metric pattern in initialization of metric-operating point curve", v38);
      goto LABEL_7;
    }
    goto LABEL_18;
  }
  uint64_t v41 = 3;
  unint64_t v42 = v34 >> 2;
  if (v34 >> 2 != 3) {
    goto LABEL_11;
  }
LABEL_14:
  uint64_t v46 = objc_msgSend_bytes(v13->_operatingPoints, v35, v36, v37, v38);
  v13->_nanCount = 0;
  if (v39 >= 4)
  {
    uint64_t v48 = 4 * v42;
    do
    {
      v46 += 4;
      v48 -= 4;
    }
    while (v48);
  }
  v33 = v13;
LABEL_19:

  return v33;
}

- (int64_t)count
{
  return ((unint64_t)objc_msgSend_length(self->_operatingPoints, a2, v2, v3, v4) >> 2) - self->_nanCount;
}

- (void)enumerateUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, unsigned char *, float, float))a3;
  v9 = (float *)objc_msgSend_bytes(self->_operatingPoints, v5, v6, v7, v8);
  objc_msgSend_length(self->_operatingPoints, v10, v11, v12, v13);
  int metricPattern = self->_metricPattern;
  if (metricPattern)
  {
    if (metricPattern == 1)
    {
      char v28 = 0;
      uint64_t v17 = (float *)&dword_24C7303A4;
      do
      {
        float v18 = *v9++;
        v4[2](v4, &v28, *v17++, v18);
        if (v28) {
          BOOL v19 = 1;
        }
        else {
          BOOL v19 = v17 == (float *)&xmmword_24C7303B0;
        }
      }
      while (!v19);
    }
    else
    {
      uint64_t v23 = objc_msgSend_errorWithCode_message_(CSUError, v14, 2, @"Unhandled metric pattern", v15);
      objc_msgSend_logInternalError_(CSUError, v24, (uint64_t)v23, v25, v26);
    }
  }
  else
  {
    char v27 = 0;
    v20 = &dword_24C730380;
    do
    {
      float v21 = *v9++;
      v4[2](v4, &v27, *(float *)v20++, v21);
      if (v27) {
        BOOL v22 = 1;
      }
      else {
        BOOL v22 = v20 == &dword_24C7303A4;
      }
    }
    while (!v22);
  }
}

- (void).cxx_destruct
{
}

@end