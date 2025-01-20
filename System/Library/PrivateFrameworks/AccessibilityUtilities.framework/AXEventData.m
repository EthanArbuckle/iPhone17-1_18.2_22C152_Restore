@interface AXEventData
+ (AXEventData)dataWithBytes:(char *)a3 length:(int64_t)a4;
+ (AXEventData)dataWithSender:(int64_t)a3;
+ (AXEventData)dataWithSender:(int64_t)a3 page:(int64_t)a4 usage:(int64_t)a5 modifierFlags:(int64_t)a6 eventValue1:(float)a7 eventValue2:(float)a8;
- (AXEventData)init;
- (BOOL)wasPostedByAccessibility;
- (char)dataBytes;
- (float)eventValue1;
- (float)eventValue2;
- (id)description;
- (int64_t)dataLength;
- (int64_t)eventSenderIdentifier;
- (int64_t)modifierFlags;
- (int64_t)page;
- (int64_t)usage;
@end

@implementation AXEventData

+ (AXEventData)dataWithSender:(int64_t)a3
{
  v4 = objc_alloc_init(AXEventData);
  v4->_storage.eventSenderIdentifier = a3;

  return v4;
}

+ (AXEventData)dataWithSender:(int64_t)a3 page:(int64_t)a4 usage:(int64_t)a5 modifierFlags:(int64_t)a6 eventValue1:(float)a7 eventValue2:(float)a8
{
  v14 = objc_alloc_init(AXEventData);
  v14->_storage.eventSenderIdentifier = a3;
  v14->_storage.page = a4;
  v14->_storage.usage = a5;
  v14->_storage.modifierFlags = a6;
  v14->_storage.eventValue1 = a7;
  v14->_storage.eventValue2 = a8;

  return v14;
}

+ (AXEventData)dataWithBytes:(char *)a3 length:(int64_t)a4
{
  if (a4 == 40)
  {
    if (a3)
    {
      v5 = objc_alloc_init(AXEventData);
      uint64_t v6 = *((void *)a3 + 4);
      long long v7 = *((_OWORD *)a3 + 1);
      *(_OWORD *)&v5->_storage.eventSenderIdentifier = *(_OWORD *)a3;
      *(_OWORD *)&v5->_storage.usage = v7;
      *(void *)&v5->_storage.eventValue1 = v6;
      goto LABEL_8;
    }
  }
  else
  {
    v9 = AXLogEventTap();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[AXEventData dataWithBytes:length:](a4, v9);
    }
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (AXEventData)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXEventData;
  result = [(AXEventData *)&v3 init];
  if (result) {
    result->_storage.eventSenderIdentifier = 0;
  }
  return result;
}

- (id)description
{
  unint64_t v2 = [(AXEventData *)self eventSenderIdentifier];
  if (v2 > 8) {
    objc_super v3 = 0;
  }
  else {
    objc_super v3 = off_1E5588828[v2];
  }
  return (id)[NSString stringWithFormat:@"AXEventData. Sender:%@", v3];
}

- (int64_t)eventSenderIdentifier
{
  return self->_storage.eventSenderIdentifier;
}

- (int64_t)page
{
  return self->_storage.page;
}

- (int64_t)usage
{
  return self->_storage.usage;
}

- (int64_t)modifierFlags
{
  return self->_storage.modifierFlags;
}

- (float)eventValue1
{
  return self->_storage.eventValue1;
}

- (float)eventValue2
{
  return self->_storage.eventValue2;
}

- (BOOL)wasPostedByAccessibility
{
  return [(AXEventData *)self eventSenderIdentifier] != 0;
}

- (char)dataBytes
{
  return (char *)&self->_storage;
}

- (int64_t)dataLength
{
  return 40;
}

+ (void)dataWithBytes:(uint64_t)a1 length:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [NSNumber numberWithLong:a1];
  int v4 = 138412546;
  v5 = v3;
  __int16 v6 = 2112;
  long long v7 = &unk_1EDC62C88;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Expected length:(%@) to be size of AXEventDataStorage: (%@)", (uint8_t *)&v4, 0x16u);
}

@end