@interface MEMessageActionDestination
+ (BOOL)supportsSecureCoding;
+ (MEMessageActionDestination)archive;
+ (MEMessageActionDestination)inbox;
+ (MEMessageActionDestination)junk;
+ (MEMessageActionDestination)trash;
+ (id)allowedMailboxTypes;
- (BOOL)isEqual:(id)a3;
- (MEMessageActionDestination)initWithCoder:(id)a3;
- (MEMessageActionDestination)initWithDefaultMailboxType:(int64_t)a3;
- (id)description;
- (int64_t)mailboxType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEMessageActionDestination

+ (id)allowedMailboxTypes
{
  return &unk_26C719598;
}

+ (MEMessageActionDestination)inbox
{
  v2 = [[MEMessageActionDestination alloc] initWithDefaultMailboxType:7];
  return v2;
}

+ (MEMessageActionDestination)trash
{
  v2 = [[MEMessageActionDestination alloc] initWithDefaultMailboxType:3];
  return v2;
}

+ (MEMessageActionDestination)archive
{
  v2 = [[MEMessageActionDestination alloc] initWithDefaultMailboxType:2];
  return v2;
}

+ (MEMessageActionDestination)junk
{
  v2 = [[MEMessageActionDestination alloc] initWithDefaultMailboxType:1];
  return v2;
}

- (MEMessageActionDestination)initWithDefaultMailboxType:(int64_t)a3
{
  v5 = +[MEMessageActionDestination allowedMailboxTypes];
  v6 = [NSNumber numberWithInteger:a3];
  char v7 = [v5 containsObject:v6];

  if (v7)
  {
    v11.receiver = self;
    v11.super_class = (Class)MEMessageActionDestination;
    v8 = [(MEMessageActionDestination *)&v11 init];
    if (v8) {
      v8->_mailboxType = a3;
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageActionDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MEMessageActionDestination initWithDefaultMailboxType:](self, "initWithDefaultMailboxType:", [v4 decodeIntegerForKey:@"EFPropertyKey_mailboxType"]);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MEMessageActionDestination mailboxType](self, "mailboxType"), @"EFPropertyKey_mailboxType");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    int64_t v7 = [(MEMessageActionDestination *)self mailboxType];
    BOOL v8 = v7 == [v6 mailboxType];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Destination: %ld", -[MEMessageActionDestination mailboxType](self, "mailboxType"));
}

- (int64_t)mailboxType
{
  return self->_mailboxType;
}

@end