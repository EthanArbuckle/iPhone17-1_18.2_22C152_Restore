@interface AWRemoteAttentionEvent
+ (BOOL)supportsSecureCoding;
- (AWRemoteAttentionEvent)initWithCoder:(id)a3;
- (AWRemoteAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 remoteMetadata:(AWRemoteMetadata *)a5;
- (BOOL)buttonPressed;
- (id)description;
- (int64_t)usage;
- (int64_t)usagePage;
- (unint64_t)senderID;
- (void)encodeWithCoder:(id)a3;
- (void)validateMask;
@end

@implementation AWRemoteAttentionEvent

- (BOOL)buttonPressed
{
  return self->_buttonPressed;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (int64_t)usage
{
  return self->_usage;
}

- (int64_t)usagePage
{
  return self->_usagePage;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(AWAttentionEvent *)self timestamp];
  uint64_t v7 = v6;
  int64_t usagePage = self->_usagePage;
  int64_t usage = self->_usage;
  unint64_t senderID = self->_senderID;
  BOOL buttonPressed = self->_buttonPressed;
  uint64_t v12 = [(AWAttentionEvent *)self tagIndex];
  v13 = [(AWAttentionEvent *)self tag];
  v14 = tagDescription(v12, v13);
  v15 = [v3 stringWithFormat:@"<%@: %p> (timestamp: %13.5f usagePage %ld usage %ld senderID: %llu buttonPressed: %d %@)", v5, self, v7, usagePage, usage, senderID, buttonPressed, v14];

  return v15;
}

- (AWRemoteAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 remoteMetadata:(AWRemoteMetadata *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)AWRemoteAttentionEvent;
  result = [(AWAttentionEvent *)&v8 initWithTimestamp:a4 tagIndex:32 eventMask:a3];
  if (a5)
  {
    if (result)
    {
      result->_int64_t usagePage = a5->var0;
      unint64_t var2 = a5->var2;
      result->_int64_t usage = a5->var1;
      result->_unint64_t senderID = var2;
      result->_BOOL buttonPressed = a5->var3;
    }
  }
  return result;
}

- (void)validateMask
{
  if ([(AWAttentionEvent *)self eventMask] != 32) {
    __assert_rtn("-[AWRemoteAttentionEvent validateMask]", "SimpleFrameworkTypes.m", 1065, "self.eventMask == AWAttentionEventMaskRemote");
  }
}

- (AWRemoteAttentionEvent)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v18 = 0;
  id v4 = a3;
  double v5 = decodeDouble(v4, &v18, @"timestamp");
  uint64_t v6 = decodeUInt64(v4, &v18, @"usagePage");
  uint64_t v7 = decodeUInt64(v4, &v18, @"usage");
  uint64_t v8 = decodeUInt64(v4, &v18, @"senderID");
  uint64_t v9 = decodeUInt64(v4, &v18, @"buttonPressed");
  uint64_t v10 = decodeUInt64(v4, &v18, @"tagIndex");

  if (v18)
  {
    if (currentLogLevel >= 3)
    {
      v11 = _AALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        unint64_t v14 = absTimeNS();
        if (v14 == -1) {
          double v15 = INFINITY;
        }
        else {
          double v15 = (double)v14 / 1000000000.0;
        }
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 134218242;
        *(double *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v17;
        _os_log_error_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", buf, 0x16u);
      }
    }
    uint64_t v12 = 0;
  }
  else
  {
    *(void *)buf = v6;
    *(void *)&buf[8] = v7;
    *(void *)&buf[16] = v8;
    BOOL v20 = v9 != 0;
    uint64_t v12 = [[AWRemoteAttentionEvent alloc] initWithTimestamp:v10 tagIndex:buf remoteMetadata:v5];
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AWAttentionEvent *)self timestamp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timestamp");
  double v5 = [NSNumber numberWithLong:self->_usagePage];
  [v4 encodeObject:v5 forKey:@"usagePage"];

  uint64_t v6 = [NSNumber numberWithLong:self->_usage];
  [v4 encodeObject:v6 forKey:@"usage"];

  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:self->_senderID];
  [v4 encodeObject:v7 forKey:@"senderID"];

  [v4 encodeBool:self->_buttonPressed forKey:@"buttonPressed"];
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AWAttentionEvent tagIndex](self, "tagIndex"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"tagIndex"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end