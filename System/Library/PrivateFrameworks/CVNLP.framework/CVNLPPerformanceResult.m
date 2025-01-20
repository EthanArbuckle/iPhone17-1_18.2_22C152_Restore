@interface CVNLPPerformanceResult
- (CVNLPPerformanceResult)initWithName:(id)a3;
- (NSString)name;
- (id)description;
- (id)dict;
@end

@implementation CVNLPPerformanceResult

- (CVNLPPerformanceResult)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CVNLPPerformanceResult;
  v6 = [(CVNLPPerformanceResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (id)description
{
  id v5 = NSString;
  v6 = objc_msgSend_name(self, a2, v2, v3);
  objc_super v9 = objc_msgSend_stringWithFormat_(v5, v7, @"[%@: Peak-Delta: %lf, CPU-Time: %lf, Interval: %lf]", v8, v6, *(void *)&self->peakdelta, *(void *)&self->cpuTime, *(void *)&self->timeInterval);

  return v9;
}

- (id)dict
{
  v26[5] = *MEMORY[0x1E4F143B8];
  v25[0] = @"maxpeak";
  id v5 = objc_msgSend_numberWithDouble_(NSNumber, a2, v2, v3, self->maxpeak);
  v26[0] = v5;
  v25[1] = @"peakdelta";
  objc_super v9 = objc_msgSend_numberWithDouble_(NSNumber, v6, v7, v8, self->peakdelta);
  v26[1] = v9;
  v25[2] = @"recentpeak";
  v13 = objc_msgSend_numberWithDouble_(NSNumber, v10, v11, v12, self->recentpeak);
  v26[2] = v13;
  v25[3] = @"current";
  v17 = objc_msgSend_numberWithDouble_(NSNumber, v14, v15, v16, self->current);
  v26[3] = v17;
  v25[4] = @"timeInterval";
  v21 = objc_msgSend_numberWithDouble_(NSNumber, v18, v19, v20, self->timeInterval);
  v26[4] = v21;
  v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v26, (uint64_t)v25, 5);

  return v23;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end