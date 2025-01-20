@interface BRCItemDBRowIDJobIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemDBRowIDIdentifier:(id)a3;
- (BRCItemDBRowIDJobIdentifier)initWithItemDBRowID:(int64_t)a3;
- (NSString)description;
- (id)columns;
- (id)columnsValues;
- (id)matchingJobsWhereSQLClause;
- (int64_t)itemDBRowID;
- (unint64_t)hash;
@end

@implementation BRCItemDBRowIDJobIdentifier

- (BRCItemDBRowIDJobIdentifier)initWithItemDBRowID:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCItemDBRowIDJobIdentifier;
  result = [(BRCItemDBRowIDJobIdentifier *)&v5 init];
  if (result) {
    result->_itemDBRowID = a3;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%lld", self->_itemDBRowID);
}

- (id)matchingJobsWhereSQLClause
{
  return (id)objc_msgSend(MEMORY[0x1E4FBA8F8], "formatInjection:", @"throttle_id = %lld", self->_itemDBRowID);
}

- (id)columns
{
  return (id)[MEMORY[0x1E4FBA908] rawInjection:"throttle_id" length:11];
}

- (id)columnsValues
{
  return (id)objc_msgSend(MEMORY[0x1E4FBA8F8], "formatInjection:", @"%lld", self->_itemDBRowID);
}

- (unint64_t)hash
{
  return self->_itemDBRowID;
}

- (BOOL)isEqualToItemDBRowIDIdentifier:(id)a3
{
  return a3 && self->_itemDBRowID == *((void *)a3 + 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BRCItemDBRowIDJobIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BRCItemDBRowIDJobIdentifier *)self isEqualToItemDBRowIDIdentifier:v4];
  }

  return v5;
}

- (int64_t)itemDBRowID
{
  return self->_itemDBRowID;
}

@end