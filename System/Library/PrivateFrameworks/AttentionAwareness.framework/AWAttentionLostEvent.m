@interface AWAttentionLostEvent
+ (BOOL)supportsSecureCoding;
- (AWAttentionLostEvent)initWithCoder:(id)a3;
- (AWAttentionLostEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 attentionLostTimeout:(double)a5;
- (double)attentionLostTimeout;
- (id)associatedObject;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithConfig:(id)a3;
- (void)validateMask;
@end

@implementation AWAttentionLostEvent

- (void).cxx_destruct
{
}

- (void)validateMask
{
  if ([(AWAttentionEvent *)self eventMask] != 1) {
    __assert_rtn("-[AWAttentionLostEvent validateMask]", "SimpleFrameworkTypes.m", 799, "self.eventMask == AWAttentionEventMaskAttentionLost");
  }
}

- (double)attentionLostTimeout
{
  return self->_attentionLostTimeout;
}

- (void)updateWithConfig:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AWAttentionLostEvent;
  id v4 = a3;
  [(AWAttentionEvent *)&v9 updateWithConfig:v4];
  v5 = objc_msgSend(v4, "attentionLostTimeoutDictionary", v9.receiver, v9.super_class);

  v6 = [NSNumber numberWithDouble:self->_attentionLostTimeout];
  v7 = [v5 objectForKeyedSubscript:v6];
  id associatedObject = self->_associatedObject;
  self->_id associatedObject = v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(AWAttentionEvent *)self timestamp];
  uint64_t v7 = v6;
  double attentionLostTimeout = self->_attentionLostTimeout;
  uint64_t v9 = [(AWAttentionEvent *)self tagIndex];
  v10 = [(AWAttentionEvent *)self tag];
  v11 = tagDescription(v9, v10);
  v12 = [v3 stringWithFormat:@"<%@: %p> (timestamp: %13.5f attentionLostTimeout %13.5f %@)", v5, self, v7, *(void *)&attentionLostTimeout, v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AWAttentionEvent *)self timestamp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timestamp");
  [v4 encodeDouble:@"attentionLostTimeout" forKey:self->_attentionLostTimeout];
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AWAttentionEvent tagIndex](self, "tagIndex"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"tagIndex"];
}

- (AWAttentionLostEvent)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v15 = 0;
  id v4 = a3;
  double v5 = decodeDouble(v4, &v15, @"timestamp");
  double v6 = decodeDouble(v4, &v15, @"attentionLostTimeout");
  uint64_t v7 = decodeUInt64(v4, &v15, @"tagIndex");

  if (v15)
  {
    if (currentLogLevel >= 3)
    {
      v8 = _AALog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v11 = absTimeNS();
        if (v11 == -1) {
          double v12 = INFINITY;
        }
        else {
          double v12 = (double)v11 / 1000000000.0;
        }
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 134218242;
        double v17 = v12;
        __int16 v18 = 2112;
        v19 = v14;
        _os_log_error_impl(&dword_1B3B4B000, v8, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", buf, 0x16u);
      }
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [[AWAttentionLostEvent alloc] initWithTimestamp:v7 tagIndex:v5 attentionLostTimeout:v6];
  }

  return v9;
}

- (AWAttentionLostEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 attentionLostTimeout:(double)a5
{
  v7.receiver = self;
  v7.super_class = (Class)AWAttentionLostEvent;
  result = [(AWAttentionEvent *)&v7 initWithTimestamp:a4 tagIndex:1 eventMask:a3];
  if (result) {
    result->_double attentionLostTimeout = a5;
  }
  return result;
}

- (id)associatedObject
{
  return self->_associatedObject;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end