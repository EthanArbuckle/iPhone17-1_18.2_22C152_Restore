@interface AFSystemStateSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSystemStateSnapshot)init;
- (AFSystemStateSnapshot)initWithBuilder:(id)a3;
- (AFSystemStateSnapshot)initWithCoder:(id)a3;
- (AFSystemStateSnapshot)initWithDictionaryRepresentation:(id)a3;
- (AFSystemStateSnapshot)initWithSerializedBackingStore:(id)a3;
- (AFSystemStateSnapshot)initWithSleepState:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)ad_shortDescription;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)sleepState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSystemStateSnapshot

- (id)ad_shortDescription
{
  v2 = NSString;
  unint64_t v3 = [(AFSystemStateSnapshot *)self sleepState];
  if (v3 > 2) {
    v4 = @"(unknown)";
  }
  else {
    v4 = off_1E592B138[v3];
  }
  v5 = v4;
  v6 = [v2 stringWithFormat:@"(attention = %@)", v5];

  return v6;
}

- (AFSystemStateSnapshot)initWithSerializedBackingStore:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(AFSystemStateSnapshot *)self initWithDictionaryRepresentation:v4];
    v5 = self;
  }
  else
  {
    if (v4)
    {
      v6 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315394;
        v9 = "-[AFSystemStateSnapshot(ContextSnapshot) initWithSerializedBackingStore:]";
        __int16 v10 = 2112;
        id v11 = v4;
        _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s #hal serializedBackingStore is of unexpected type: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    v5 = 0;
  }

  return v5;
}

- (int64_t)sleepState
{
  return self->_sleepState;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t sleepState = self->_sleepState;
  if (sleepState > 2) {
    v5 = @"(unknown)";
  }
  else {
    v5 = off_1E592B138[sleepState];
  }
  v6 = v5;
  [v3 setObject:v6 forKey:@"sleepState"];

  v7 = (void *)[v3 copy];
  return v7;
}

- (AFSystemStateSnapshot)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = [a3 objectForKey:@"sleepState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = AFSleepStateGetFromName(v4);
    }
    else {
      uint64_t v5 = 0;
    }

    self = [(AFSystemStateSnapshot *)self initWithSleepState:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  int64_t sleepState = self->_sleepState;
  id v5 = a3;
  id v6 = [v3 numberWithInteger:sleepState];
  [v5 encodeObject:v6 forKey:@"AFSystemStateSnapshot::sleepState"];
}

- (AFSystemStateSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSystemStateSnapshot::sleepState"];

  uint64_t v6 = [v5 integerValue];
  return [(AFSystemStateSnapshot *)self initWithSleepState:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSystemStateSnapshot *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t sleepState = self->_sleepState;
      BOOL v6 = sleepState == [(AFSystemStateSnapshot *)v4 sleepState];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_sleepState];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)AFSystemStateSnapshot;
  id v5 = [(AFSystemStateSnapshot *)&v11 description];
  unint64_t sleepState = self->_sleepState;
  if (sleepState > 2) {
    v7 = @"(unknown)";
  }
  else {
    v7 = off_1E592B138[sleepState];
  }
  int v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t sleepState = %@}", v5, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(AFSystemStateSnapshot *)self _descriptionWithIndent:0];
}

- (AFSystemStateSnapshot)initWithSleepState:(int64_t)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AFSystemStateSnapshot_initWithSleepState___block_invoke;
  v4[3] = &__block_descriptor_40_e41_v16__0___AFSystemStateSnapshotMutating__8l;
  v4[4] = a3;
  return [(AFSystemStateSnapshot *)self initWithBuilder:v4];
}

uint64_t __44__AFSystemStateSnapshot_initWithSleepState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSleepState:*(void *)(a1 + 32)];
}

- (AFSystemStateSnapshot)init
{
  return [(AFSystemStateSnapshot *)self initWithBuilder:0];
}

- (AFSystemStateSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSystemStateSnapshotMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSystemStateSnapshot;
  id v5 = [(AFSystemStateSnapshot *)&v9 init];
  BOOL v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFSystemStateSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSystemStateSnapshotMutation *)v7 isDirty]) {
      v6->_unint64_t sleepState = [(_AFSystemStateSnapshotMutation *)v7 getSleepState];
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
  id v4 = (void (**)(id, _AFSystemStateSnapshotMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFSystemStateSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSystemStateSnapshotMutation *)v5 isDirty])
    {
      BOOL v6 = objc_alloc_init(AFSystemStateSnapshot);
      v6->_unint64_t sleepState = [(_AFSystemStateSnapshotMutation *)v5 getSleepState];
    }
    else
    {
      BOOL v6 = (AFSystemStateSnapshot *)[(AFSystemStateSnapshot *)self copy];
    }
  }
  else
  {
    BOOL v6 = (AFSystemStateSnapshot *)[(AFSystemStateSnapshot *)self copy];
  }

  return v6;
}

@end