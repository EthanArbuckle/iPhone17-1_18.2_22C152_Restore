@interface AFApplicationContextSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFApplicationContextSnapshot)init;
- (AFApplicationContextSnapshot)initWithApplicationContexts:(id)a3;
- (AFApplicationContextSnapshot)initWithBuilder:(id)a3;
- (AFApplicationContextSnapshot)initWithCoder:(id)a3;
- (AFApplicationContextSnapshot)initWithSerializedBackingStore:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)applicationContexts;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)mutatedCopyWithMutator:(id)a3;
- (id)serializedBackingStore;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFApplicationContextSnapshot

- (AFApplicationContextSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
    v6 = [v5 applicationContexts];
    self = [(AFApplicationContextSnapshot *)self initWithApplicationContexts:v6];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)serializedBackingStore
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (void).cxx_destruct
{
}

- (NSArray)applicationContexts
{
  return self->_applicationContexts;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AFApplicationContextSnapshot)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"AFApplicationContextSnapshot::applicationContexts"];

  v9 = [(AFApplicationContextSnapshot *)self initWithApplicationContexts:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFApplicationContextSnapshot *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(AFApplicationContextSnapshot *)v4 applicationContexts];
      applicationContexts = self->_applicationContexts;
      BOOL v7 = applicationContexts == v5 || [(NSArray *)applicationContexts isEqual:v5];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_applicationContexts hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFApplicationContextSnapshot;
  id v5 = [(AFApplicationContextSnapshot *)&v8 description];
  uint64_t v6 = (void *)[v4 initWithFormat:@"%@ {applicationContexts = %@}", v5, self->_applicationContexts];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFApplicationContextSnapshot *)self _descriptionWithIndent:0];
}

- (AFApplicationContextSnapshot)initWithApplicationContexts:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__AFApplicationContextSnapshot_initWithApplicationContexts___block_invoke;
  v8[3] = &unk_1E592B2C8;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(AFApplicationContextSnapshot *)self initWithBuilder:v8];

  return v6;
}

uint64_t __60__AFApplicationContextSnapshot_initWithApplicationContexts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setApplicationContexts:*(void *)(a1 + 32)];
}

- (AFApplicationContextSnapshot)init
{
  return [(AFApplicationContextSnapshot *)self initWithBuilder:0];
}

- (AFApplicationContextSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFApplicationContextSnapshotMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFApplicationContextSnapshot;
  id v5 = [(AFApplicationContextSnapshot *)&v12 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_AFApplicationContextSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFApplicationContextSnapshotMutation *)v7 isDirty])
    {
      objc_super v8 = [(_AFApplicationContextSnapshotMutation *)v7 getApplicationContexts];
      uint64_t v9 = [v8 copy];
      applicationContexts = v6->_applicationContexts;
      v6->_applicationContexts = (NSArray *)v9;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFApplicationContextSnapshotMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFApplicationContextSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFApplicationContextSnapshotMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFApplicationContextSnapshot);
      BOOL v7 = [(_AFApplicationContextSnapshotMutation *)v5 getApplicationContexts];
      uint64_t v8 = [v7 copy];
      applicationContexts = v6->_applicationContexts;
      v6->_applicationContexts = (NSArray *)v8;
    }
    else
    {
      uint64_t v6 = (AFApplicationContextSnapshot *)[(AFApplicationContextSnapshot *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFApplicationContextSnapshot *)[(AFApplicationContextSnapshot *)self copy];
  }

  return v6;
}

@end