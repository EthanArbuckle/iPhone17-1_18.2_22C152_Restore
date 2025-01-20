@interface EDSearchableIndexDataSample
- (NSArray)toEmailAddresses;
- (NSDate)dateReceived;
- (NSDictionary)userInfo;
- (NSNumber)flags;
- (NSNumber)indexedAsEmptySubject;
- (NSNumber)transactionID;
- (NSString)deleted;
- (NSString)subject;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDateReceived:(id)a3;
- (void)setDeleted:(id)a3;
- (void)setFlags:(id)a3;
- (void)setIndexedAsEmptySubject:(id)a3;
- (void)setSubject:(id)a3;
- (void)setToEmailAddresses:(id)a3;
- (void)setTransactionID:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation EDSearchableIndexDataSample

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(EDSearchableIndexDataSample *)self subject];
  [v4 setSubject:v5];

  v6 = [(EDSearchableIndexDataSample *)self toEmailAddresses];
  [v4 setToEmailAddresses:v6];

  v7 = [(EDSearchableIndexDataSample *)self deleted];
  [v4 setDeleted:v7];

  v8 = [(EDSearchableIndexDataSample *)self transactionID];
  [v4 setTransactionID:v8];

  v9 = [(EDSearchableIndexDataSample *)self flags];
  [v4 setFlags:v9];

  v10 = [(EDSearchableIndexDataSample *)self indexedAsEmptySubject];
  [v4 setIndexedAsEmptySubject:v10];

  v11 = [(EDSearchableIndexDataSample *)self dateReceived];
  [v4 setDateReceived:v11];

  v12 = [(EDSearchableIndexDataSample *)self userInfo];
  [v4 setUserInfo:v12];

  return v4;
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSArray)toEmailAddresses
{
  return self->_toEmailAddresses;
}

- (void)setToEmailAddresses:(id)a3
{
}

- (NSString)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(id)a3
{
}

- (NSNumber)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
}

- (NSNumber)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
}

- (NSNumber)indexedAsEmptySubject
{
  return self->_indexedAsEmptySubject;
}

- (void)setIndexedAsEmptySubject:(id)a3
{
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (void)setDateReceived:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_indexedAsEmptySubject, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_toEmailAddresses, 0);

  objc_storeStrong((id *)&self->_subject, 0);
}

@end