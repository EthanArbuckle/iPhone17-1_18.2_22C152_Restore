@interface _CPIndexStateForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPIndexStateForFeedback)initWithFacade:(id)a3;
- (int)indexedMessageCount;
- (int)percentAttachmentsIndexed;
- (int)percentMessagesIndexed;
- (int)searchIndex;
- (int)totalMessageCount;
- (unint64_t)hash;
- (void)setIndexedMessageCount:(int)a3;
- (void)setPercentAttachmentsIndexed:(int)a3;
- (void)setPercentMessagesIndexed:(int)a3;
- (void)setSearchIndex:(int)a3;
- (void)setTotalMessageCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPIndexStateForFeedback

- (void)setIndexedMessageCount:(int)a3
{
  self->_indexedMessageCount = a3;
}

- (int)indexedMessageCount
{
  return self->_indexedMessageCount;
}

- (void)setTotalMessageCount:(int)a3
{
  self->_totalMessageCount = a3;
}

- (int)totalMessageCount
{
  return self->_totalMessageCount;
}

- (void)setSearchIndex:(int)a3
{
  self->_searchIndex = a3;
}

- (int)searchIndex
{
  return self->_searchIndex;
}

- (void)setPercentAttachmentsIndexed:(int)a3
{
  self->_percentAttachmentsIndexed = a3;
}

- (int)percentAttachmentsIndexed
{
  return self->_percentAttachmentsIndexed;
}

- (void)setPercentMessagesIndexed:(int)a3
{
  self->_percentMessagesIndexed = a3;
}

- (int)percentMessagesIndexed
{
  return self->_percentMessagesIndexed;
}

- (unint64_t)hash
{
  return (2654435761 * self->_percentAttachmentsIndexed) ^ (2654435761 * self->_percentMessagesIndexed) ^ (2654435761 * self->_searchIndex) ^ (2654435761 * self->_totalMessageCount) ^ (2654435761 * self->_indexedMessageCount);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int percentMessagesIndexed = self->_percentMessagesIndexed,
        percentMessagesIndexed == [v4 percentMessagesIndexed])
    && (int percentAttachmentsIndexed = self->_percentAttachmentsIndexed,
        percentAttachmentsIndexed == [v4 percentAttachmentsIndexed])
    && (int searchIndex = self->_searchIndex, searchIndex == [v4 searchIndex])
    && (int totalMessageCount = self->_totalMessageCount,
        totalMessageCount == [v4 totalMessageCount]))
  {
    int indexedMessageCount = self->_indexedMessageCount;
    BOOL v10 = indexedMessageCount == [v4 indexedMessageCount];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPIndexStateForFeedback *)self percentMessagesIndexed]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPIndexStateForFeedback *)self percentAttachmentsIndexed]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPIndexStateForFeedback *)self searchIndex]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPIndexStateForFeedback *)self totalMessageCount]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPIndexStateForFeedback *)self indexedMessageCount]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPIndexStateForFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPIndexStateForFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_CPIndexStateForFeedback;
  v5 = [(_CPIndexStateForFeedback *)&v18 init];
  if (v5)
  {
    v6 = [v4 percentMessagesIndexed];

    if (v6)
    {
      v7 = [v4 percentMessagesIndexed];
      -[_CPIndexStateForFeedback setPercentMessagesIndexed:](v5, "setPercentMessagesIndexed:", [v7 intValue]);
    }
    v8 = [v4 percentAttachmentsIndexed];

    if (v8)
    {
      v9 = [v4 percentAttachmentsIndexed];
      -[_CPIndexStateForFeedback setPercentAttachmentsIndexed:](v5, "setPercentAttachmentsIndexed:", [v9 intValue]);
    }
    BOOL v10 = [v4 searchIndex];

    if (v10)
    {
      v11 = [v4 searchIndex];
      -[_CPIndexStateForFeedback setSearchIndex:](v5, "setSearchIndex:", [v11 intValue]);
    }
    v12 = [v4 totalMessageCount];

    if (v12)
    {
      v13 = [v4 totalMessageCount];
      -[_CPIndexStateForFeedback setTotalMessageCount:](v5, "setTotalMessageCount:", [v13 intValue]);
    }
    v14 = [v4 indexedMessageCount];

    if (v14)
    {
      v15 = [v4 indexedMessageCount];
      -[_CPIndexStateForFeedback setIndexedMessageCount:](v5, "setIndexedMessageCount:", [v15 intValue]);
    }
    v16 = v5;
  }

  return v5;
}

@end