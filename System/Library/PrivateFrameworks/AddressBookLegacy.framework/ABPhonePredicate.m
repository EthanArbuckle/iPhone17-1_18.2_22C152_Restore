@interface ABPhonePredicate
- (BOOL)hasCallback;
- (BOOL)isValid;
- (NSString)country;
- (NSString)phoneNumber;
- (id)homeCountryCode;
- (id)predicateFormat;
- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4;
- (id)queryWhereStringForPredicateIdentifier:(int)a3;
- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5;
- (void)dealloc;
- (void)evaluateCallbackWithSqliteContext:(sqlite3_context *)a3 predicateContext:(id)a4 values:(sqlite3_value *)a5 count:(int)a6;
- (void)setCountry:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation ABPhonePredicate

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ABPhonePredicate;
  [(ABPredicate *)&v3 dealloc];
}

- (id)homeCountryCode
{
  id result = self->_homeCountryCode;
  if (!result)
  {
    id result = (id)CPPhoneNumberCopyHomeCountryCode();
    self->_homeCountryCode = (NSString *)result;
  }
  return result;
}

- (BOOL)isValid
{
  return [(NSString *)[(ABPhonePredicate *)self phoneNumber] length] != 0;
}

- (id)predicateFormat
{
  return (id)[NSString stringWithFormat:@"ABPredicate %p - Phone matching <%@> (%@)", self, -[ABPhonePredicate phoneNumber](self, "phoneNumber"), -[ABPhonePredicate country](self, "country")];
}

- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4
{
  return 0;
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  return @"((SELECT COUNT() FROM ABMultiValue WHERE (abp.ROWID = record_id AND abPredicateEval(?, ?, value) AND property+0 = ?) LIMIT 1) > 0)";
}

- (BOOL)hasCallback
{
  return 1;
}

- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
}

- (void)evaluateCallbackWithSqliteContext:(sqlite3_context *)a3 predicateContext:(id)a4 values:(sqlite3_value *)a5 count:(int)a6
{
  if (a6 == 3)
  {
    v9 = sqlite3_value_text(a5[1]);
    v10 = sqlite3_value_text(a5[2]);
    if (v9) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      int v12 = 0;
    }
    else
    {
      if ([(ABPhonePredicate *)self country]) {
        [(ABPhonePredicate *)self country];
      }
      else {
        [(ABPhonePredicate *)self homeCountryCode];
      }
      [(ABPhonePredicate *)self homeCountryCode];
      int v12 = CPPhoneNumbersEqualWithCountries();
    }
    sqlite3_result_int(a3, v12);
  }
  else
  {
    sqlite3_result_error(a3, "CPSqlitePhoneNumberContainsAlphaCharacters: wrong number of arguments", -1);
  }
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

@end