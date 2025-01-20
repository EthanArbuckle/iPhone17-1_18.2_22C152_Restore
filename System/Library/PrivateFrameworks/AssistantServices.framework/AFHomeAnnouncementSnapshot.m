@interface AFHomeAnnouncementSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFHomeAnnouncement)lastPlayedAnnouncement;
- (AFHomeAnnouncementSnapshot)init;
- (AFHomeAnnouncementSnapshot)initWithBuilder:(id)a3;
- (AFHomeAnnouncementSnapshot)initWithCoder:(id)a3;
- (AFHomeAnnouncementSnapshot)initWithDictionaryRepresentation:(id)a3;
- (AFHomeAnnouncementSnapshot)initWithSerializedBackingStore:(id)a3;
- (AFHomeAnnouncementSnapshot)initWithState:(unint64_t)a3 lastPlayedAnnouncement:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)ad_shortDescription;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFHomeAnnouncementSnapshot

- (void).cxx_destruct
{
}

- (AFHomeAnnouncement)lastPlayedAnnouncement
{
  return self->_lastPlayedAnnouncement;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = AFHomeAnnouncementStateGetNames(self->_state);
  [v3 setObject:v4 forKey:@"state"];

  lastPlayedAnnouncement = self->_lastPlayedAnnouncement;
  if (lastPlayedAnnouncement)
  {
    v6 = [(AFHomeAnnouncement *)lastPlayedAnnouncement buildDictionaryRepresentation];
    [v3 setObject:v6 forKey:@"lastPlayedAnnouncement"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (AFHomeAnnouncementSnapshot)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKey:@"state"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = AFHomeAnnouncementStateGetFromNames(v5);
    }
    else {
      uint64_t v6 = 0;
    }

    v8 = [v4 objectForKey:@"lastPlayedAnnouncement"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = [[AFHomeAnnouncement alloc] initWithDictionaryRepresentation:v8];
    }
    else {
      v9 = 0;
    }

    self = [(AFHomeAnnouncementSnapshot *)self initWithState:v6 lastPlayedAnnouncement:v9];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t state = self->_state;
  id v7 = a3;
  uint64_t v6 = [v4 numberWithUnsignedInteger:state];
  [v7 encodeObject:v6 forKey:@"AFHomeAnnouncementSnapshot::state"];

  [v7 encodeObject:self->_lastPlayedAnnouncement forKey:@"AFHomeAnnouncementSnapshot::lastPlayedAnnouncement"];
}

- (AFHomeAnnouncementSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAnnouncementSnapshot::state"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAnnouncementSnapshot::lastPlayedAnnouncement"];

  v8 = [(AFHomeAnnouncementSnapshot *)self initWithState:v6 lastPlayedAnnouncement:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFHomeAnnouncementSnapshot *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t state = self->_state;
      if (state == [(AFHomeAnnouncementSnapshot *)v5 state])
      {
        id v7 = [(AFHomeAnnouncementSnapshot *)v5 lastPlayedAnnouncement];
        lastPlayedAnnouncement = self->_lastPlayedAnnouncement;
        BOOL v9 = lastPlayedAnnouncement == v7 || [(AFHomeAnnouncement *)lastPlayedAnnouncement isEqual:v7];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_state];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(AFHomeAnnouncement *)self->_lastPlayedAnnouncement hash] ^ v4;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)AFHomeAnnouncementSnapshot;
  unint64_t v5 = [(AFHomeAnnouncementSnapshot *)&v10 description];
  uint64_t v6 = AFHomeAnnouncementStateGetNames(self->_state);
  id v7 = [v6 componentsJoinedByString:@"|"];
  v8 = (void *)[v4 initWithFormat:@"%@ {unint64_t state = %@, lastPlayedAnnouncement = %@}", v5, v7, self->_lastPlayedAnnouncement];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(AFHomeAnnouncementSnapshot *)self _descriptionWithIndent:0];
}

- (AFHomeAnnouncementSnapshot)initWithState:(unint64_t)a3 lastPlayedAnnouncement:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__AFHomeAnnouncementSnapshot_initWithState_lastPlayedAnnouncement___block_invoke;
  v10[3] = &unk_1E5928FB8;
  id v11 = v6;
  unint64_t v12 = a3;
  id v7 = v6;
  v8 = [(AFHomeAnnouncementSnapshot *)self initWithBuilder:v10];

  return v8;
}

void __67__AFHomeAnnouncementSnapshot_initWithState_lastPlayedAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setState:v3];
  [v4 setLastPlayedAnnouncement:*(void *)(a1 + 32)];
}

- (AFHomeAnnouncementSnapshot)init
{
  return [(AFHomeAnnouncementSnapshot *)self initWithBuilder:0];
}

- (AFHomeAnnouncementSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFHomeAnnouncementSnapshotMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFHomeAnnouncementSnapshot;
  unint64_t v5 = [(AFHomeAnnouncementSnapshot *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFHomeAnnouncementSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFHomeAnnouncementSnapshotMutation *)v7 isDirty])
    {
      v6->_unint64_t state = [(_AFHomeAnnouncementSnapshotMutation *)v7 getState];
      v8 = [(_AFHomeAnnouncementSnapshotMutation *)v7 getLastPlayedAnnouncement];
      uint64_t v9 = [v8 copy];
      lastPlayedAnnouncement = v6->_lastPlayedAnnouncement;
      v6->_lastPlayedAnnouncement = (AFHomeAnnouncement *)v9;
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
  id v4 = (void (**)(id, _AFHomeAnnouncementSnapshotMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_AFHomeAnnouncementSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFHomeAnnouncementSnapshotMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFHomeAnnouncementSnapshot);
      v6->_unint64_t state = [(_AFHomeAnnouncementSnapshotMutation *)v5 getState];
      id v7 = [(_AFHomeAnnouncementSnapshotMutation *)v5 getLastPlayedAnnouncement];
      uint64_t v8 = [v7 copy];
      lastPlayedAnnouncement = v6->_lastPlayedAnnouncement;
      v6->_lastPlayedAnnouncement = (AFHomeAnnouncement *)v8;
    }
    else
    {
      id v6 = (AFHomeAnnouncementSnapshot *)[(AFHomeAnnouncementSnapshot *)self copy];
    }
  }
  else
  {
    id v6 = (AFHomeAnnouncementSnapshot *)[(AFHomeAnnouncementSnapshot *)self copy];
  }

  return v6;
}

- (id)ad_shortDescription
{
  v2 = NSString;
  id v3 = AFHomeAnnouncementStateGetNames([(AFHomeAnnouncementSnapshot *)self state]);
  id v4 = [v2 stringWithFormat:@"(state: %@)", v3];

  return v4;
}

- (AFHomeAnnouncementSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(AFHomeAnnouncementSnapshot *)self initWithDictionaryRepresentation:v4];
    unint64_t v5 = self;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

@end