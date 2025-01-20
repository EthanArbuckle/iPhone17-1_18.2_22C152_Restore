@interface StoreOnServerSettings
- (NSString)key;
- (NSString)mailboxNameKey;
- (StoreOnServerSettings)initWithType:(int64_t)a3 key:(id)a4 mailboxNameKey:(id)a5;
- (int64_t)type;
- (void)setKey:(id)a3;
- (void)setMailboxNameKey:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation StoreOnServerSettings

- (StoreOnServerSettings)initWithType:(int64_t)a3 key:(id)a4 mailboxNameKey:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)StoreOnServerSettings;
  v10 = [(StoreOnServerSettings *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = (NSString *)[v8 copy];
    key = v11->_key;
    v11->_key = v12;

    v14 = (NSString *)[v9 copy];
    mailboxNameKey = v11->_mailboxNameKey;
    v11->_mailboxNameKey = v14;
  }
  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)mailboxNameKey
{
  return self->_mailboxNameKey;
}

- (void)setMailboxNameKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxNameKey, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end