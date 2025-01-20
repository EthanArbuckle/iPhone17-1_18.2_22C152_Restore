@interface EMRenameMailboxChangeAction
+ (BOOL)supportsSecureCoding;
- (EMRenameMailboxChangeAction)initWithCoder:(id)a3;
- (EMRenameMailboxChangeAction)initWithMailbox:(id)a3 newName:(id)a4;
- (EMRenameMailboxChangeAction)initWithMailboxObjectID:(id)a3 newName:(id)a4;
- (NSString)name;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMRenameMailboxChangeAction

- (EMRenameMailboxChangeAction)initWithMailbox:(id)a3 newName:(id)a4
{
  id v6 = a4;
  v7 = [a3 objectID];
  v8 = [(EMRenameMailboxChangeAction *)self initWithMailboxObjectID:v7 newName:v6];

  return v8;
}

- (EMRenameMailboxChangeAction)initWithMailboxObjectID:(id)a3 newName:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EMRenameMailboxChangeAction;
  v8 = [(EMMailboxChangeAction *)&v11 initWithMailboxObjectID:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_name, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMRenameMailboxChangeAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMRenameMailboxChangeAction;
  v5 = [(EMMailboxChangeAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMRenameMailboxChangeAction;
  [(EMMailboxChangeAction *)&v6 encodeWithCoder:v4];
  v5 = [(EMRenameMailboxChangeAction *)self name];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_name"];
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end