@interface HMBLocalSQLContextRowQueryTuple
- (HMBLocalSQLContextRowQueryTuple)initWithQueryRow:(unint64_t)a3 data:(id)a4;
- (NSData)queryData;
- (unint64_t)queryRow;
@end

@implementation HMBLocalSQLContextRowQueryTuple

- (void).cxx_destruct
{
}

- (NSData)queryData
{
  return self->_queryData;
}

- (unint64_t)queryRow
{
  return self->_queryRow;
}

- (HMBLocalSQLContextRowQueryTuple)initWithQueryRow:(unint64_t)a3 data:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMBLocalSQLContextRowQueryTuple;
  v8 = [(HMBLocalSQLContextRowQueryTuple *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_queryRow = a3;
    objc_storeStrong((id *)&v8->_queryData, a4);
  }

  return v9;
}

@end