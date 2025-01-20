@interface DSFileOperation
+ (BOOL)dateIsBusyFolderDate:(double)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DSFileOperation)init;
- (DSFileOperation)initWithCoder:(id)a3;
- (DSFileOperationID)operationID;
- (NSDate)dateStarted;
- (NSProgress)progress;
- (UTType)utType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateStarted:(id)a3;
- (void)setOperationID:(id)a3;
- (void)setProgress:(id)a3;
- (void)setUtType:(id)a3;
@end

@implementation DSFileOperation

+ (BOOL)dateIsBusyFolderDate:(double)a3
{
  return a3 == -3061152000.0 || a3 == -534528000.0;
}

- (DSFileOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)DSFileOperation;
  v2 = [(DSFileOperation *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(DSFileOperationID);
    operationID = v2->_operationID;
    v2->_operationID = v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  operationID = self->_operationID;
  v5 = NSStringFromSelector(sel_operationID);
  [v10 encodeObject:operationID forKey:v5];

  dateStarted = self->_dateStarted;
  v7 = NSStringFromSelector(sel_dateStarted);
  [v10 encodeObject:dateStarted forKey:v7];

  utType = self->_utType;
  v9 = NSStringFromSelector(sel_utType);
  [v10 encodeObject:utType forKey:v9];
}

- (DSFileOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DSFileOperation;
  v5 = [(DSFileOperation *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_operationID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    operationID = v5->_operationID;
    v5->_operationID = (DSFileOperationID *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_dateStarted);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    dateStarted = v5->_dateStarted;
    v5->_dateStarted = (NSDate *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_utType);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    utType = v5->_utType;
    v5->_utType = (UTType *)v16;
  }
  return v5;
}

- (unint64_t)hash
{
  return [(DSFileOperationID *)self->_operationID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v5 = [v4[1] isEqual:self->_operationID];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (UTType)utType
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  utType = self->_utType;
  if (!utType)
  {
    id v4 = LogObj(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      char v5 = [(DSFileOperationID *)self->_operationID uuid];
      int v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1D343E000, v4, OS_LOG_TYPE_ERROR, "Operation %{public}@ missing UTType, using generic type instead", (uint8_t *)&v8, 0xCu);
    }
    utType = (UTType *)*MEMORY[0x1E4F44408];
  }
  uint64_t v6 = utType;
  return v6;
}

- (DSFileOperationID)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSDate)dateStarted
{
  return self->_dateStarted;
}

- (void)setDateStarted:(id)a3
{
}

- (void)setUtType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utType, 0);
  objc_storeStrong((id *)&self->_dateStarted, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

@end