@interface AWAttentionEvent
+ (BOOL)supportsSecureCoding;
- (AWAttentionEvent)initWithCoder:(id)a3;
- (AWAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 eventMask:(unint64_t)a5;
- (double)timestamp;
- (id)description;
- (id)tag;
- (unint64_t)eventMask;
- (unint64_t)tagIndex;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithConfig:(id)a3;
- (void)validateMask;
@end

@implementation AWAttentionEvent

- (void).cxx_destruct
{
}

- (AWAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 eventMask:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AWAttentionEvent;
  v8 = [(AWAttentionEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a3;
    v8->_tagIndex = a4;
    v8->_eventMask = a5;
    [(AWAttentionEvent *)v8 validateMask];
  }
  return v9;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (void)updateWithConfig:(id)a3
{
  id v6 = +[AWAttentionAwarenessClientConfig sharedClientConfig];
  v4 = [v6 tagForIndex:self->_tagIndex];
  id tag = self->_tag;
  self->_id tag = v4;
}

- (id)tag
{
  return self->_tag;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unint64_t)tagIndex
{
  return self->_tagIndex;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  double timestamp = self->_timestamp;
  v7 = getEventMaskDescription(self->_eventMask);
  v8 = tagDescription(self->_tagIndex, self->_tag);
  v9 = [v3 stringWithFormat:@"<%@: %p> (timestamp: %13.5f mask %@ %@)", v5, self, *(void *)&timestamp, v7, v8];

  return v9;
}

- (void)validateMask
{
  unint64_t eventMask = self->_eventMask;
  BOOL v3 = eventMask == 32 || eventMask == 1;
  if (v3 || eventMask == 128) {
    __assert_rtn("-[AWAttentionEvent validateMask]", "SimpleFrameworkTypes.m", 726, "_eventMask != AWAttentionEventMaskAttentionLost && _eventMask != AWAttentionEventMaskFaceDetect && _eventMask != AWAttentionEventMaskRemote");
  }
}

- (AWAttentionEvent)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v15 = 0;
  v14.receiver = self;
  v14.super_class = (Class)AWAttentionEvent;
  v5 = [(AWAttentionEvent *)&v14 init];
  if (!v5
    || ((v5->_unint64_t eventMask = decodeUInt64(v4, &v15, @"eventMask"),
         v5->_double timestamp = decodeDouble(v4, &v15, @"timestamp"),
         v5->_tagIndex = decodeUInt64(v4, &v15, @"tagIndex"),
         v5->_eventMask != 1)
      ? (BOOL v6 = v15 == 0)
      : (BOOL v6 = 0),
        v6))
  {
    v8 = v5;
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      v7 = _AALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        unint64_t v10 = absTimeNS();
        if (v10 == -1) {
          double v11 = INFINITY;
        }
        else {
          double v11 = (double)v10 / 1000000000.0;
        }
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 134218242;
        double v17 = v11;
        __int16 v18 = 2112;
        v19 = v13;
        _os_log_error_impl(&dword_1B3B4B000, v7, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", buf, 0x16u);
      }
    }
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t eventMask = self->_eventMask;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLongLong:eventMask];
  [v6 encodeObject:v7 forKey:@"eventMask"];

  [v6 encodeDouble:@"timestamp" forKey:self->_timestamp];
  id v8 = [NSNumber numberWithUnsignedLongLong:self->_tagIndex];
  [v6 encodeObject:v8 forKey:@"tagIndex"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end