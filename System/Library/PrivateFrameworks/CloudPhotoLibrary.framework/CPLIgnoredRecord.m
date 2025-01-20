@interface CPLIgnoredRecord
- (CPLIgnoredRecord)initWithRecord:(id)a3 ignoredDate:(id)a4;
- (CPLRecordChange)record;
- (NSDate)ignoredDate;
@end

@implementation CPLIgnoredRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredDate, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

- (NSDate)ignoredDate
{
  return self->_ignoredDate;
}

- (CPLRecordChange)record
{
  return self->_record;
}

- (CPLIgnoredRecord)initWithRecord:(id)a3 ignoredDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLIgnoredRecord;
  v9 = [(CPLIgnoredRecord *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    objc_storeStrong((id *)&v10->_ignoredDate, a4);
  }

  return v10;
}

@end