@interface AWDigitizerButtonKeyboardAttentionEvent
+ (BOOL)supportsSecureCoding;
- (AWDigitizerButtonKeyboardAttentionEvent)initWithCoder:(id)a3;
- (AWDigitizerButtonKeyboardAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 eventMask:(unint64_t)a5 digitizerButtonKeyboardMetadata:(AWDigitizerButtonKeyboardMetadata *)a6;
- (NSString)displayUUID;
- (id)description;
- (unint64_t)senderID;
- (void)encodeWithCoder:(id)a3;
- (void)validateMask;
@end

@implementation AWDigitizerButtonKeyboardAttentionEvent

- (void).cxx_destruct
{
}

- (AWDigitizerButtonKeyboardAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 eventMask:(unint64_t)a5 digitizerButtonKeyboardMetadata:(AWDigitizerButtonKeyboardMetadata *)a6
{
  v11.receiver = self;
  v11.super_class = (Class)AWDigitizerButtonKeyboardAttentionEvent;
  v7 = [(AWAttentionEvent *)&v11 initWithTimestamp:a4 tagIndex:a5 eventMask:a3];
  v8 = v7;
  if (a6 && v7)
  {
    var1 = a6->var1;
    v7->_senderID = a6->var0;
    objc_storeStrong((id *)&v7->_displayUUID, var1);
  }
  return v8;
}

- (void)validateMask
{
  if ([(AWAttentionEvent *)self eventMask] != 8
    && [(AWAttentionEvent *)self eventMask] != 2
    && [(AWAttentionEvent *)self eventMask] != 4)
  {
    __assert_rtn("-[AWDigitizerButtonKeyboardAttentionEvent validateMask]", "SimpleFrameworkTypes.m", 1312, "self.eventMask == AWAttentionEventMaskDigitizer || self.eventMask == AWAttentionEventMaskButton || self.eventMask == AWAttentionEventMaskKeyboard");
  }
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", -[AWAttentionEvent eventMask](self, "eventMask"));
  [v5 encodeObject:v6 forKey:@"eventMask"];

  [(AWAttentionEvent *)self timestamp];
  objc_msgSend(v5, "encodeDouble:forKey:", @"timestamp");
  v7 = [NSNumber numberWithUnsignedLongLong:self->_senderID];
  [v5 encodeObject:v7 forKey:@"senderID"];

  [v5 encodeObject:self->_displayUUID forKey:@"displayUUID"];
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AWAttentionEvent tagIndex](self, "tagIndex"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v8 forKey:@"tagIndex"];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(AWAttentionEvent *)self timestamp];
  uint64_t v7 = v6;
  unint64_t senderID = self->_senderID;
  displayUUID = self->_displayUUID;
  uint64_t v10 = [(AWAttentionEvent *)self tagIndex];
  objc_super v11 = [(AWAttentionEvent *)self tag];
  v12 = tagDescription(v10, v11);
  v13 = [v3 stringWithFormat:@"<%@: %p> (timestamp: %13.5f sender %llu displayUUID %@ %@)", v5, self, v7, senderID, displayUUID, v12];

  return v13;
}

- (AWDigitizerButtonKeyboardAttentionEvent)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v17 = 0;
  id v4 = a3;
  double v5 = decodeDouble(v4, &v17, @"timestamp");
  uint64_t v6 = decodeUInt64(v4, &v17, @"senderID");
  uint64_t v7 = decodeString(v4, &v17, @"displayUUID");
  uint64_t v8 = decodeUInt64(v4, &v17, @"tagIndex");
  uint64_t v9 = decodeUInt64(v4, &v17, @"eventMask");

  if (v17)
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v10 = _AALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unint64_t v13 = absTimeNS();
        if (v13 == -1) {
          double v14 = INFINITY;
        }
        else {
          double v14 = (double)v13 / 1000000000.0;
        }
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 134218242;
        *(double *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        _os_log_error_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", buf, 0x16u);
      }
    }
    objc_super v11 = 0;
  }
  else
  {
    *(void *)buf = v6;
    *(void *)&buf[8] = v7;
    objc_super v11 = [[AWDigitizerButtonKeyboardAttentionEvent alloc] initWithTimestamp:v8 tagIndex:v9 eventMask:buf digitizerButtonKeyboardMetadata:v5];
  }

  return v11;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end