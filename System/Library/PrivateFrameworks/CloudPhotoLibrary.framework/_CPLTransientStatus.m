@interface _CPLTransientStatus
- (CPLRecordChange)record;
- (CPLRecordStatus)status;
- (NSDate)date;
- (_CPLTransientStatus)initWithRecord:(id)a3 generation:(unint64_t)a4 date:(id)a5;
- (unint64_t)generation;
@end

@implementation _CPLTransientStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (unint64_t)generation
{
  return self->_generation;
}

- (CPLRecordChange)record
{
  return self->_record;
}

- (NSDate)date
{
  return self->_date;
}

- (CPLRecordStatus)status
{
  v2 = [[CPLRecordStatus alloc] initWithRecord:self->_record generation:self->_generation];
  return v2;
}

- (_CPLTransientStatus)initWithRecord:(id)a3 generation:(unint64_t)a4 date:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CPLTransientStatus;
  v11 = [(_CPLTransientStatus *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_record, a3);
    v12->_generation = a4;
    objc_storeStrong((id *)&v12->_date, a5);
  }

  return v12;
}

@end