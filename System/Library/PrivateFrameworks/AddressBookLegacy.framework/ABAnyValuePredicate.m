@interface ABAnyValuePredicate
- (ABAnyValuePredicate)init;
- (BOOL)isValid;
- (id)queryGroupByProperties;
- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4;
- (id)queryWhereStringForPredicateIdentifier:(int)a3;
- (int)property;
- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5;
- (void)setProperty:(int)a3;
@end

@implementation ABAnyValuePredicate

- (ABAnyValuePredicate)init
{
  v3.receiver = self;
  v3.super_class = (Class)ABAnyValuePredicate;
  result = [(ABPredicate *)&v3 init];
  if (result) {
    result->_property = -1;
  }
  return result;
}

- (BOOL)isValid
{
  return self->_property != -1;
}

- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4
{
  if ((ABPersonGetTypeOfProperty(self->_property) & 0x100) == 0) {
    return 0;
  }
  v5 = (void *)MEMORY[0x1E4F1C978];
  return (id)[v5 arrayWithObject:@"JOIN ABMultiValue abv ON abp.ROWID = abv.record_id"];
}

- (id)queryGroupByProperties
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"abp.ROWID"];
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  if ((ABPersonGetTypeOfProperty(self->_property) & 0x100) != 0) {
    return @"abv.property = ?";
  }
  v4 = ABPersonNameForProperty(self->_property);
  return (id)[(__CFString *)v4 stringByAppendingString:@" is not NULL"];
}

- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  if ((ABPersonGetTypeOfProperty(self->_property) & 0x100) != 0)
  {
    sqlite3_bind_int(a3->var1, *a4, self->_property);
    ++*a4;
  }
}

- (int)property
{
  return self->_property;
}

- (void)setProperty:(int)a3
{
  self->_property = a3;
}

@end