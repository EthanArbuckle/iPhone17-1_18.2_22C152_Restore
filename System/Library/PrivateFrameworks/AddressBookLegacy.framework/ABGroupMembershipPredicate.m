@interface ABGroupMembershipPredicate
- (BOOL)isValid;
- (NSString)accountIdentifier;
- (id)description;
- (id)queryWhereStringForPredicateIdentifier:(int)a3;
- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5;
- (void)dealloc;
- (void)group;
- (void)setAccountIdentifier:(id)a3;
- (void)setGroup:(void *)a3;
- (void)setStore:(void *)a3;
- (void)store;
@end

@implementation ABGroupMembershipPredicate

- (void)dealloc
{
  group = self->_group;
  if (group) {
    CFRelease(group);
  }
  store = self->_store;
  if (store) {
    CFRelease(store);
  }

  v5.receiver = self;
  v5.super_class = (Class)ABGroupMembershipPredicate;
  [(ABPredicate *)&v5 dealloc];
}

- (void)setGroup:(void *)a3
{
  group = self->_group;
  if (group != a3)
  {
    if (group) {
      CFRelease(group);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_group = a3;
  }
}

- (void)group
{
  return self->_group;
}

- (void)setStore:(void *)a3
{
  store = self->_store;
  if (store != a3)
  {
    if (store) {
      CFRelease(store);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_store = a3;
  }
}

- (void)store
{
  return self->_store;
}

- (BOOL)isValid
{
  return [(ABGroupMembershipPredicate *)self group]
      || [(ABGroupMembershipPredicate *)self store]
      || [(ABGroupMembershipPredicate *)self accountIdentifier] != 0;
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  if ([(ABGroupMembershipPredicate *)self group]) {
    ABRecordID RecordID = ABRecordGetRecordID([(ABGroupMembershipPredicate *)self group]);
  }
  else {
    ABRecordID RecordID = -1;
  }
  if ([(ABGroupMembershipPredicate *)self store]) {
    ABRecordID v5 = ABRecordGetRecordID([(ABGroupMembershipPredicate *)self store]);
  }
  else {
    ABRecordID v5 = -1;
  }
  v6 = (__CFString *)objc_opt_new();
  v7 = v6;
  if (RecordID != -1)
  {
    CFStringAppend(v6, @" abp.ROWID IN (select member_id FROM ABGroupMembers WHERE group_id = ? AND member_type = 0)");
    if (v5 == -1)
    {
LABEL_12:
      if (!self->_accountIdentifier) {
        goto LABEL_15;
      }
      CFStringAppend(v7, @" AND");
      goto LABEL_14;
    }
    CFStringAppend(v7, @" AND");
LABEL_11:
    CFStringAppend(v7, @" StoreID = ?");
    goto LABEL_12;
  }
  if (v5 != -1) {
    goto LABEL_11;
  }
  if (self->_accountIdentifier) {
LABEL_14:
  }
    CFStringAppend(v7, @" StoreID IN (SELECT abs.RowID FROM ABStore abs, ABAccount aba WHERE abs.AccountID = aba.ROWID AND aba.AccountIdentifier = ?)");
LABEL_15:
  return v7;
}

- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  if ([(ABGroupMembershipPredicate *)self group]) {
    ABRecordID RecordID = ABRecordGetRecordID([(ABGroupMembershipPredicate *)self group]);
  }
  else {
    ABRecordID RecordID = -1;
  }
  if ([(ABGroupMembershipPredicate *)self store]) {
    ABRecordID v9 = ABRecordGetRecordID([(ABGroupMembershipPredicate *)self store]);
  }
  else {
    ABRecordID v9 = -1;
  }
  if (RecordID != -1)
  {
    sqlite3_bind_int(a3->var1, *a4, RecordID);
    ++*a4;
  }
  if (v9 != -1)
  {
    sqlite3_bind_int(a3->var1, *a4, v9);
    ++*a4;
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    v11.receiver = self;
    v11.super_class = (Class)ABGroupMembershipPredicate;
    [(ABPredicate *)&v11 bindString:accountIdentifier toStatement:a3 withBindingOffset:a4];
  }
}

- (id)description
{
  if ([(ABGroupMembershipPredicate *)self group]) {
    uint64_t RecordID = ABRecordGetRecordID([(ABGroupMembershipPredicate *)self group]);
  }
  else {
    uint64_t RecordID = 0xFFFFFFFFLL;
  }
  if ([(ABGroupMembershipPredicate *)self store]) {
    uint64_t v4 = ABRecordGetRecordID([(ABGroupMembershipPredicate *)self store]);
  }
  else {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  if ([(ABGroupMembershipPredicate *)self group]) {
    ABRecordID v5 = (void *)ABRecordCopyValue([(ABGroupMembershipPredicate *)self group], kABGroupNameProperty);
  }
  else {
    ABRecordID v5 = 0;
  }
  if ([(ABGroupMembershipPredicate *)self store]) {
    v6 = (void *)ABRecordCopyValue([(ABGroupMembershipPredicate *)self store], kABSourceNameProperty);
  }
  else {
    v6 = 0;
  }
  v7 = (void *)[NSString stringWithFormat:@"ABPredicate %p - person in group (%i %@), store (%i %@), account (%@)", self, RecordID, v5, v4, v6, self->_accountIdentifier];

  return v7;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

@end