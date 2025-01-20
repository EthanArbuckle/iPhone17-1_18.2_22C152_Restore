@interface ContactFolderItemsSyncContext
- (BOOL)isChangeHistoryTruncated;
- (CNChangeHistoryAnchor)cnChangeAnchor;
- (ContactFolderItemsSyncContext)init;
- (int)abGroupChangeId;
- (int)abPersonChangeId;
- (unint64_t)latestSequenceNumber;
- (void)setAbGroupChangeId:(int)a3;
- (void)setAbPersonChangeId:(int)a3;
- (void)setChangeHistoryTruncated:(BOOL)a3;
- (void)setCnChangeAnchor:(id)a3;
- (void)setLatestSequenceNumber:(unint64_t)a3;
@end

@implementation ContactFolderItemsSyncContext

- (ContactFolderItemsSyncContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)ContactFolderItemsSyncContext;
  result = [(ContactFolderItemsSyncContext *)&v3 init];
  if (result) {
    *(void *)&result->_abPersonChangeId = -1;
  }
  return result;
}

- (int)abPersonChangeId
{
  return self->_abPersonChangeId;
}

- (void)setAbPersonChangeId:(int)a3
{
  self->_abPersonChangeId = a3;
}

- (int)abGroupChangeId
{
  return self->_abGroupChangeId;
}

- (void)setAbGroupChangeId:(int)a3
{
  self->_abGroupChangeId = a3;
}

- (BOOL)isChangeHistoryTruncated
{
  return self->_changeHistoryTruncated;
}

- (void)setChangeHistoryTruncated:(BOOL)a3
{
  self->_changeHistoryTruncated = a3;
}

- (unint64_t)latestSequenceNumber
{
  return self->_latestSequenceNumber;
}

- (void)setLatestSequenceNumber:(unint64_t)a3
{
  self->_latestSequenceNumber = a3;
}

- (CNChangeHistoryAnchor)cnChangeAnchor
{
  return self->_cnChangeAnchor;
}

- (void)setCnChangeAnchor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end