@interface HDDismissedRemoteScheduleUnavailableRecordInsertOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDDismissedRemoteScheduleUnavailableRecordInsertOperation)initWithCoder:(id)a3;
- (HDDismissedRemoteScheduleUnavailableRecordInsertOperation)initWithRemoteScheduleUnavailableRecords:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDDismissedRemoteScheduleUnavailableRecordInsertOperation

- (HDDismissedRemoteScheduleUnavailableRecordInsertOperation)initWithRemoteScheduleUnavailableRecords:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDismissedRemoteScheduleUnavailableRecordInsertOperation;
  v5 = [(HDDismissedRemoteScheduleUnavailableRecordInsertOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dismissedRecords = v5->_dismissedRecords;
    v5->_dismissedRecords = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([(NSArray *)self->_dismissedRecords count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = self->_dismissedRecords;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (!+[HDDismissedRemoteScheduleUnavailableRecordEntity _insertRemoteScheduleUnavailableRecord:transaction:error:]((uint64_t)HDDismissedRemoteScheduleUnavailableRecordEntity, *(void **)(*((void *)&v15 + 1) + 8 * i), v7, (uint64_t)a5))
          {
            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_12:
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HDDismissedRemoteScheduleUnavailableRecordInsertOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDDismissedRemoteScheduleUnavailableRecordInsertOperation;
  v5 = [(HDDismissedRemoteScheduleUnavailableRecordInsertOperation *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"dismissed_remote_schedule_unavailable_records"];
    dismissedRecords = v5->_dismissedRecords;
    v5->_dismissedRecords = (NSArray *)v7;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end