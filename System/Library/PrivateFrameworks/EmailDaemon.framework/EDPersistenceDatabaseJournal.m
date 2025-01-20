@interface EDPersistenceDatabaseJournal
- (EDPersistenceDatabaseJournal)initWithJournalManager:(id)a3 number:(unint64_t)a4;
- (EDPersistenceDatabaseJournalManager)journalManager;
- (NSString)path;
- (id)description;
- (unint64_t)number;
- (unint64_t)referenceCount;
- (void)checkIn;
- (void)checkOut;
@end

@implementation EDPersistenceDatabaseJournal

- (EDPersistenceDatabaseJournal)initWithJournalManager:(id)a3 number:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDPersistenceDatabaseJournal;
  v8 = [(EDPersistenceDatabaseJournal *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_journalManager, a3);
    v9->_number = a4;
    v9->_referenceCountLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)EDPersistenceDatabaseJournal;
  v4 = [(EDPersistenceDatabaseJournal *)&v7 description];
  v5 = (void *)[v3 initWithFormat:@"%@ number: %lu, referenceCount: %lu", v4, -[EDPersistenceDatabaseJournal number](self, "number"), -[EDPersistenceDatabaseJournal referenceCount](self, "referenceCount")];

  return v5;
}

- (NSString)path
{
  id v3 = [(EDPersistenceDatabaseJournal *)self journalManager];
  v4 = [v3 journalDirectoryPath];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EDPersistenceDatabaseJournal number](self, "number"));
  v6 = [v5 stringValue];
  objc_super v7 = [v4 stringByAppendingPathComponent:v6];

  return (NSString *)v7;
}

- (void)checkOut
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = +[EDPersistenceDatabaseJournalManager log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Checking out %@", (uint8_t *)&v4, 0xCu);
  }

  os_unfair_lock_lock(&self->_referenceCountLock);
  ++self->_referenceCount;
  os_unfair_lock_unlock(&self->_referenceCountLock);
}

- (void)checkIn
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = +[EDPersistenceDatabaseJournalManager log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Checking in %@", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock(&self->_referenceCountLock);
  unint64_t referenceCount = self->_referenceCount;
  if (!referenceCount)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabaseJournal.m" lineNumber:72 description:@"reference count should be non-zero"];

    unint64_t referenceCount = self->_referenceCount;
  }
  unint64_t v6 = referenceCount - 1;
  self->_unint64_t referenceCount = referenceCount - 1;
  os_unfair_lock_unlock(&self->_referenceCountLock);
  if (!v6)
  {
    objc_super v7 = [(EDPersistenceDatabaseJournal *)self journalManager];
    [v7 _journalNoLongerReferenced:self];
  }
}

- (unint64_t)referenceCount
{
  p_referenceCountLock = &self->_referenceCountLock;
  os_unfair_lock_lock(&self->_referenceCountLock);
  unint64_t referenceCount = self->_referenceCount;
  os_unfair_lock_unlock(p_referenceCountLock);
  return referenceCount;
}

- (unint64_t)number
{
  return self->_number;
}

- (EDPersistenceDatabaseJournalManager)journalManager
{
  return self->_journalManager;
}

- (void).cxx_destruct
{
}

@end