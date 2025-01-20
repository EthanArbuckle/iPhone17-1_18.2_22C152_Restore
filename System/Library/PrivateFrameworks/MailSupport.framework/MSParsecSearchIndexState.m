@interface MSParsecSearchIndexState
+ (id)indexStateForMessagesIndexed:(id)a3 indexableMessages:(id)a4 attachmentsIndexed:(id)a5 indexableAttachments:(id)a6;
- (MSParsecSearchIndexState)initWithPercentMessagesIndexed:(int64_t)a3 percentAttachmentsIndexed:(int64_t)a4 totalMessageCount:(int64_t)a5 indexedMessageCount:(int64_t)a6 indexType:(int64_t)a7;
- (id)description;
- (int64_t)indexType;
- (int64_t)indexedMessageCount;
- (int64_t)percentAttachmentsIndexed;
- (int64_t)percentMessagesIndexed;
- (int64_t)totalMessageCount;
@end

@implementation MSParsecSearchIndexState

+ (id)indexStateForMessagesIndexed:(id)a3 indexableMessages:(id)a4 attachmentsIndexed:(id)a5 indexableAttachments:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v11 doubleValue];
  double v15 = v14;
  if (v14 <= 0.0)
  {
    uint64_t v18 = -1;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F60E00];
    [v10 doubleValue];
    uint64_t v18 = [v16 bucketedNumber:(int)(v17 / v15 * 100.0) leadingDigits:2];
  }
  [v13 doubleValue];
  double v20 = v19;
  if (v19 <= 0.0)
  {
    uint64_t v23 = -1;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F60E00];
    [v12 doubleValue];
    uint64_t v23 = [v21 bucketedNumber:(int)(v22 / v20 * 100.0) leadingDigits:2];
  }
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F60E00], "roundedInteger:placeValueDigits:", objc_msgSend(v11, "integerValue"), 2);
  v25 = objc_msgSend(objc_alloc((Class)a1), "initWithPercentMessagesIndexed:percentAttachmentsIndexed:totalMessageCount:indexedMessageCount:indexType:", v18, v23, v24, objc_msgSend(MEMORY[0x1E4F60E00], "roundedInteger:placeValueDigits:", objc_msgSend(v10, "integerValue"), 2), 0);

  return v25;
}

- (MSParsecSearchIndexState)initWithPercentMessagesIndexed:(int64_t)a3 percentAttachmentsIndexed:(int64_t)a4 totalMessageCount:(int64_t)a5 indexedMessageCount:(int64_t)a6 indexType:(int64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)MSParsecSearchIndexState;
  result = [(MSParsecSearchIndexState *)&v13 init];
  if (result)
  {
    result->_percentAttachmentsIndexed = a4;
    result->_totalMessageCount = a5;
    result->_indexedMessageCount = a6;
    result->_indexType = a7;
    result->_percentMessagesIndexed = a3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"indexType: %ld percentMessagesIndexed: %ld percentAttachmentsIndexed: %ld totalMessageCount: %ld indexedMessageCount: %ld ", -[MSParsecSearchIndexState indexType](self, "indexType"), -[MSParsecSearchIndexState percentMessagesIndexed](self, "percentMessagesIndexed"), -[MSParsecSearchIndexState percentAttachmentsIndexed](self, "percentAttachmentsIndexed"), -[MSParsecSearchIndexState totalMessageCount](self, "totalMessageCount"), -[MSParsecSearchIndexState indexedMessageCount](self, "indexedMessageCount"));
}

- (int64_t)indexType
{
  return self->_indexType;
}

- (int64_t)percentMessagesIndexed
{
  return self->_percentMessagesIndexed;
}

- (int64_t)percentAttachmentsIndexed
{
  return self->_percentAttachmentsIndexed;
}

- (int64_t)totalMessageCount
{
  return self->_totalMessageCount;
}

- (int64_t)indexedMessageCount
{
  return self->_indexedMessageCount;
}

@end