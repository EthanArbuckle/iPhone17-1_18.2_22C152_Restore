@interface IMRecentItem
- (BOOL)isEqual:(id)a3;
- (IMRecentItem)initWithGUID:(id)a3 data:(id)a4 messageItemInfo:(id)a5;
- (NSData)payloadData;
- (NSDictionary)messageItemInfo;
- (NSNumber)timestamp;
- (NSString)GUID;
- (NSString)accessibilityString;
- (NSURL)fileURL;
- (id)asJSONObject;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAccessibilityString:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setGUID:(id)a3;
- (void)setMessageItemInfo:(id)a3;
- (void)setPayloadData:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation IMRecentItem

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMRecentItem;
  [(IMRecentItem *)&v3 dealloc];
}

- (IMRecentItem)initWithGUID:(id)a3 data:(id)a4 messageItemInfo:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)IMRecentItem;
  v8 = [(IMRecentItem *)&v12 init];
  if (v8)
  {
    v8->_payloadData = (NSData *)[a4 copy];
    v8->_messageItemInfo = (NSDictionary *)[a5 copy];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceReferenceDate");
    v8->_timestamp = (NSNumber *)(id)[NSNumber numberWithInt:(int)v9];
    if (a3) {
      id v10 = a3;
    }
    else {
      id v10 = (id)[NSString stringGUID];
    }
    v8->_GUID = (NSString *)[v10 copy];
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(IMRecentItem *)self GUID];
  uint64_t v6 = [a3 GUID];

  return [(NSString *)v5 isEqualToString:v6];
}

- (unint64_t)hash
{
  v2 = [(IMRecentItem *)self GUID];

  return [(NSString *)v2 hash];
}

- (id)asJSONObject
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3[0] = @"guid";
  v3[1] = @"timestamp";
  int8x16_t v4 = vextq_s8(*(int8x16_t *)&self->_timestamp, *(int8x16_t *)&self->_timestamp, 8uLL);
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v4 forKeys:v3 count:2];
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (void)setPayloadData:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDictionary)messageItemInfo
{
  return self->_messageItemInfo;
}

- (void)setMessageItemInfo:(id)a3
{
}

- (NSString)accessibilityString
{
  return self->_accessibilityString;
}

- (void)setAccessibilityString:(id)a3
{
}

@end