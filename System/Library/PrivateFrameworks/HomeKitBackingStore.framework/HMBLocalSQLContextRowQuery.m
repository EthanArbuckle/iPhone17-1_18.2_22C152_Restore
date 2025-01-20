@interface HMBLocalSQLContextRowQuery
- (HMBLocalSQLContextRowQuery)initWithRecordRow:(unint64_t)a3 tuples:(id)a4;
- (NSDictionary)tuples;
- (unint64_t)recordRow;
@end

@implementation HMBLocalSQLContextRowQuery

- (void).cxx_destruct
{
}

- (NSDictionary)tuples
{
  return self->_tuples;
}

- (unint64_t)recordRow
{
  return self->_recordRow;
}

- (HMBLocalSQLContextRowQuery)initWithRecordRow:(unint64_t)a3 tuples:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMBLocalSQLContextRowQuery;
  v8 = [(HMBLocalSQLContextRowQuery *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_recordRow = a3;
    objc_storeStrong((id *)&v8->_tuples, a4);
  }

  return v9;
}

@end