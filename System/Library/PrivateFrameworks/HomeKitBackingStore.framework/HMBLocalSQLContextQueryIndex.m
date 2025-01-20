@interface HMBLocalSQLContextQueryIndex
- (HMBLocalSQLContextQueryIndex)initWithColumns:(id)a3;
- (NSArray)columns;
- (id)description;
@end

@implementation HMBLocalSQLContextQueryIndex

- (void).cxx_destruct
{
}

- (NSArray)columns
{
  return self->_columns;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMBLocalSQLContextQueryIndex *)self columns];
  v4 = [v2 stringWithFormat:@"[%@]", v3];

  return v4;
}

- (HMBLocalSQLContextQueryIndex)initWithColumns:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMBLocalSQLContextQueryIndex;
  v6 = [(HMBLocalSQLContextQueryIndex *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_columns, a3);
  }

  return v7;
}

@end