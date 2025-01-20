@interface URLBag
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (URLBag)init;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)URLForKey:(id)a3 account:(id)a4;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
@end

@implementation URLBag

- (URLBag)init
{
  return (URLBag *)sub_10030B24C(self, 0);
}

- (BOOL)isExpired
{
  return [(AMSBag *)self->_bag isExpired];
}

- (NSDate)expirationDate
{
  return (NSDate *)[(AMSBag *)self->_bag expirationDate];
}

- (NSString)profile
{
  return (NSString *)@"appstored";
}

- (NSString)profileVersion
{
  return (NSString *)@"1";
}

- (void)createSnapshotWithCompletion:(id)a3
{
}

- (id)arrayForKey:(id)a3
{
  return [(AMSBag *)self->_bag arrayForKey:a3];
}

- (id)BOOLForKey:(id)a3
{
  return [(AMSBag *)self->_bag BOOLForKey:a3];
}

- (id)dictionaryForKey:(id)a3
{
  return [(AMSBag *)self->_bag dictionaryForKey:a3];
}

- (id)doubleForKey:(id)a3
{
  return [(AMSBag *)self->_bag doubleForKey:a3];
}

- (id)integerForKey:(id)a3
{
  return [(AMSBag *)self->_bag integerForKey:a3];
}

- (id)stringForKey:(id)a3
{
  return [(AMSBag *)self->_bag stringForKey:a3];
}

- (id)URLForKey:(id)a3
{
  return [(AMSBag *)self->_bag URLForKey:a3];
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  return [(AMSBag *)self->_bag URLForKey:a3 account:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncLock_snapshotBag, 0);
  objc_storeStrong((id *)&self->_asyncLock_completionHandlers, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end