@interface EDServerMessagePersistenceFactory
- (EDGmailLabelPersistence)gmailLabelPersistence;
- (EDPersistenceDatabase)database;
- (EDServerMessagePersistenceFactory)init;
- (EDServerMessagePersistenceFactory)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4;
- (id)serverMessagePersistenceForMailboxURL:(id)a3;
@end

@implementation EDServerMessagePersistenceFactory

- (EDServerMessagePersistenceFactory)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDServerMessagePersistenceFactory;
  v9 = [(EDServerMessagePersistenceFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_gmailLabelPersistence, a4);
  }

  return v10;
}

- (EDServerMessagePersistenceFactory)init
{
}

- (id)serverMessagePersistenceForMailboxURL:(id)a3
{
  id v5 = a3;
  __int16 v14 = 0;
  uint64_t v6 = [(EDServerMessagePersistenceFactory *)self mailboxIDForMailboxURL:v5 useNumericSearch:(char *)&v14 + 1 supportsLabels:&v14];
  if (v6 == *MEMORY[0x1E4F5FCC8])
  {
    id v7 = [NSString stringWithFormat:@"Couldn't get mailboxID for URL %@", v5];
    qword_1EA917128 = [v7 UTF8String];
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EDServerMessagePersistence.m" lineNumber:78 description:@"EDServerMessagePersistenceFactory couldn't map mailboxURL"];
  }
  v9 = [EDServerMessagePersistence alloc];
  v10 = [(EDServerMessagePersistenceFactory *)self database];
  v11 = [(EDServerMessagePersistenceFactory *)self gmailLabelPersistence];
  objc_super v12 = [(EDServerMessagePersistence *)v9 initWithDatabase:v10 gmailLabelPersistence:v11 mailboxID:v6 useNumericSearch:HIBYTE(v14) supportsLabels:v14];

  return v12;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDGmailLabelPersistence)gmailLabelPersistence
{
  return self->_gmailLabelPersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmailLabelPersistence, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end