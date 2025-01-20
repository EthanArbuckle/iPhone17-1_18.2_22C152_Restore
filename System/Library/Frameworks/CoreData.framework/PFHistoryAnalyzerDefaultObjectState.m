@interface PFHistoryAnalyzerDefaultObjectState
- (NSDictionary)tombstone;
- (NSManagedObjectID)analyzedObjectID;
- (NSNumber)finalTransactionNumber;
- (NSNumber)originalTransactionNumber;
- (NSString)finalChangeAuthor;
- (PFHistoryAnalyzerDefaultObjectState)initWithOriginalChange:(id)a3;
- (id)description;
- (int64_t)finalChangeType;
- (int64_t)originalChangeType;
- (void)dealloc;
- (void)updateWithChange:(id)a3;
@end

@implementation PFHistoryAnalyzerDefaultObjectState

- (PFHistoryAnalyzerDefaultObjectState)initWithOriginalChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PFHistoryAnalyzerDefaultObjectState;
  v4 = [(PFHistoryAnalyzerDefaultObjectState *)&v7 init];
  if (v4)
  {
    v4->_analyzedObjectID = (NSManagedObjectID *)(id)[a3 changedObjectID];
    v4->_originalTransactionNumber = (NSNumber *)(id)objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend((id)objc_msgSend(a3, "transaction"), "transactionNumber"));
    uint64_t v5 = [a3 changeType];
    v4->_originalChangeType = v5;
    v4->_finalChangeType = v5;
    v4->_finalTransactionNumber = v4->_originalTransactionNumber;
    v4->_tombstone = (NSDictionary *)(id)[a3 tombstone];
    v4->_finalChangeAuthor = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "author");
  }
  return v4;
}

- (void)dealloc
{
  self->_originalTransactionNumber = 0;
  self->_tombstone = 0;

  self->_finalChangeAuthor = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFHistoryAnalyzerDefaultObjectState;
  [(PFHistoryAnalyzerDefaultObjectState *)&v3 dealloc];
}

- (void)updateWithChange:(id)a3
{
  self->_finalTransactionNumber = (NSNumber *)(id)objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend((id)objc_msgSend(a3, "transaction"), "transactionNumber"));
  self->_finalChangeType = [a3 changeType];

  self->_tombstone = (NSDictionary *)(id)[a3 tombstone];
  self->_finalChangeAuthor = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "author");
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)PFHistoryAnalyzerDefaultObjectState;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", -[PFHistoryAnalyzerDefaultObjectState description](&v5, sel_description));
  [v3 appendFormat:@" (%@, %@:%@ -> %@:%@, %@)", self->_analyzedObjectID, self->_originalTransactionNumber, +[NSPersistentHistoryChange stringForChangeType:](NSPersistentHistoryChange, "stringForChangeType:", self->_originalChangeType), self->_finalTransactionNumber, +[NSPersistentHistoryChange stringForChangeType:](NSPersistentHistoryChange, "stringForChangeType:", self->_finalChangeType), self->_finalChangeAuthor];
  return v3;
}

- (NSManagedObjectID)analyzedObjectID
{
  return self->_analyzedObjectID;
}

- (NSNumber)originalTransactionNumber
{
  return self->_originalTransactionNumber;
}

- (int64_t)originalChangeType
{
  return self->_originalChangeType;
}

- (NSNumber)finalTransactionNumber
{
  return self->_finalTransactionNumber;
}

- (int64_t)finalChangeType
{
  return self->_finalChangeType;
}

- (NSDictionary)tombstone
{
  return self->_tombstone;
}

- (NSString)finalChangeAuthor
{
  return self->_finalChangeAuthor;
}

@end