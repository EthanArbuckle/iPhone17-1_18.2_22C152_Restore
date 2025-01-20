@interface EMMailboxCollection
+ (BOOL)supportsSecureCoding;
- (EMMailboxCollection)initWithAccount:(id)a3 topLevelOnly:(BOOL)a4;
- (EMMailboxCollection)initWithAccount:(id)a3 topLevelOnly:(BOOL)a4 repository:(id)a5;
- (EMMailboxCollection)initWithCoder:(id)a3;
- (EMMailboxCollection)initWithMailbox:(id)a3;
- (EMMailboxCollection)initWithMailbox:(id)a3 repository:(id)a4;
- (EMMailboxCollection)initWithObjectID:(id)a3 query:(id)a4;
- (EMMailboxRepository)repository;
- (void)encodeWithCoder:(id)a3;
- (void)setRepository:(id)a3;
@end

@implementation EMMailboxCollection

- (EMMailboxCollection)initWithMailbox:(id)a3 repository:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [EMQuery alloc];
  uint64_t v9 = objc_opt_class();
  v10 = +[EMMailbox predicateForMailboxChildren:v6];
  v11 = [(EMQuery *)v8 initWithTargetClass:v9 predicate:v10 sortDescriptors:MEMORY[0x1E4F1CBF0]];

  v15.receiver = self;
  v15.super_class = (Class)EMMailboxCollection;
  v12 = [(EMQueryingCollection *)&v15 initWithObjectID:0 query:v11];
  v13 = v12;
  if (v12) {
    [(EMMailboxCollection *)v12 setRepository:v7];
  }

  return v13;
}

- (void)setRepository:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EMMailboxCollection.m" lineNumber:18 description:@"Wrong repository type"];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)EMMailboxCollection;
  [(EMRepositoryObject *)&v7 setRepository:v5];
}

- (EMMailboxCollection)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EMMailboxCollection;
  return [(EMQueryingCollection *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EMMailboxCollection;
  [(EMQueryingCollection *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMailboxRepository)repository
{
  v7.receiver = self;
  v7.super_class = (Class)EMMailboxCollection;
  objc_super v4 = [(EMRepositoryObject *)&v7 repository];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EMMailboxCollection.m" lineNumber:18 description:@"Wrong repository type"];
    }
  }
  return (EMMailboxRepository *)v4;
}

- (EMMailboxCollection)initWithObjectID:(id)a3 query:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EMMailboxCollection *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMMailboxCollection initWithObjectID:query:]", "EMMailboxCollection.m", 25, "0");
}

- (EMMailboxCollection)initWithAccount:(id)a3 topLevelOnly:(BOOL)a4
{
  return [(EMMailboxCollection *)self initWithAccount:a3 topLevelOnly:a4 repository:0];
}

- (EMMailboxCollection)initWithAccount:(id)a3 topLevelOnly:(BOOL)a4 repository:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [EMQuery alloc];
  uint64_t v11 = objc_opt_class();
  v12 = +[EMMailbox predicateForMailboxAccount:v8 topLevelOnly:v6];
  v13 = [(EMQuery *)v10 initWithTargetClass:v11 predicate:v12 sortDescriptors:MEMORY[0x1E4F1CBF0]];

  v17.receiver = self;
  v17.super_class = (Class)EMMailboxCollection;
  v14 = [(EMQueryingCollection *)&v17 initWithObjectID:0 query:v13];
  objc_super v15 = v14;
  if (v14) {
    [(EMMailboxCollection *)v14 setRepository:v9];
  }

  return v15;
}

- (EMMailboxCollection)initWithMailbox:(id)a3
{
  return [(EMMailboxCollection *)self initWithMailbox:a3 repository:0];
}

@end