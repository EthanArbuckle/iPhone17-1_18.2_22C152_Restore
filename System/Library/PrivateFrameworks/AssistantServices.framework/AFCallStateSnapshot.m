@interface AFCallStateSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFCallStateSnapshot)init;
- (AFCallStateSnapshot)initWithBuilder:(id)a3;
- (AFCallStateSnapshot)initWithCallState:(unint64_t)a3 onSpeaker:(BOOL)a4 isDropInCall:(BOOL)a5;
- (AFCallStateSnapshot)initWithCoder:(id)a3;
- (AFCallStateSnapshot)initWithDictionaryRepresentation:(id)a3;
- (AFCallStateSnapshot)initWithSerializedBackingStore:(id)a3;
- (BOOL)isDropInCall;
- (BOOL)isEqual:(id)a3;
- (BOOL)onSpeaker;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)ad_shortDescription;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)callState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFCallStateSnapshot

- (BOOL)isDropInCall
{
  return self->_isDropInCall;
}

- (BOOL)onSpeaker
{
  return self->_onSpeaker;
}

- (unint64_t)callState
{
  return self->_callState;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = AFCallStateGetNames(self->_callState);
  [v3 setObject:v4 forKey:@"callState"];

  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_onSpeaker];
  [v3 setObject:v5 forKey:@"onSpeaker"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDropInCall];
  [v3 setObject:v6 forKey:@"isDropInCall"];

  v7 = (void *)[v3 copy];
  return v7;
}

- (AFCallStateSnapshot)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"callState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = AFCallStateGetFromNames(v6);
    }
    else {
      uint64_t v7 = 0;
    }

    v9 = [v5 objectForKey:@"onSpeaker"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    uint64_t v11 = [v10 BOOLValue];
    v12 = [v5 objectForKey:@"isDropInCall"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    uint64_t v14 = [v13 BOOLValue];
    self = [(AFCallStateSnapshot *)self initWithCallState:v7 onSpeaker:v11 isDropInCall:v14];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t callState = self->_callState;
  id v6 = a3;
  uint64_t v7 = [v4 numberWithUnsignedInteger:callState];
  [v6 encodeObject:v7 forKey:@"AFCallStateSnapshot::callState"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_onSpeaker];
  [v6 encodeObject:v8 forKey:@"AFCallStateSnapshot::onSpeaker"];

  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDropInCall];
  [v6 encodeObject:v9 forKey:@"AFCallStateSnapshot::isDropInCall"];
}

- (AFCallStateSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFCallStateSnapshot::callState"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFCallStateSnapshot::onSpeaker"];
  uint64_t v8 = [v7 BOOLValue];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFCallStateSnapshot::isDropInCall"];

  uint64_t v10 = [v9 BOOLValue];
  return [(AFCallStateSnapshot *)self initWithCallState:v6 onSpeaker:v8 isDropInCall:v10];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFCallStateSnapshot *)a3;
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
      unint64_t callState = self->_callState;
      if (callState == [(AFCallStateSnapshot *)v5 callState]
        && (BOOL onSpeaker = self->_onSpeaker, onSpeaker == [(AFCallStateSnapshot *)v5 onSpeaker]))
      {
        BOOL isDropInCall = self->_isDropInCall;
        BOOL v9 = isDropInCall == [(AFCallStateSnapshot *)v5 isDropInCall];
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
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_callState];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_onSpeaker];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDropInCall];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)AFCallStateSnapshot;
  v5 = [(AFCallStateSnapshot *)&v13 description];
  uint64_t v6 = AFCallStateGetNames(self->_callState);
  uint64_t v7 = [v6 componentsJoinedByString:@"|"];
  unint64_t v8 = (void *)v7;
  BOOL v9 = @"YES";
  if (self->_onSpeaker) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (!self->_isDropInCall) {
    BOOL v9 = @"NO";
  }
  uint64_t v11 = (void *)[v4 initWithFormat:@"%@ {callState = %@, onSpeaker = %@, isDropInCall = %@}", v5, v7, v10, v9];

  return v11;
}

- (NSString)description
{
  return (NSString *)[(AFCallStateSnapshot *)self _descriptionWithIndent:0];
}

- (AFCallStateSnapshot)initWithCallState:(unint64_t)a3 onSpeaker:(BOOL)a4 isDropInCall:(BOOL)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__AFCallStateSnapshot_initWithCallState_onSpeaker_isDropInCall___block_invoke;
  v6[3] = &__block_descriptor_42_e39_v16__0___AFCallStateSnapshotMutating__8l;
  v6[4] = a3;
  BOOL v7 = a4;
  BOOL v8 = a5;
  return [(AFCallStateSnapshot *)self initWithBuilder:v6];
}

void __64__AFCallStateSnapshot_initWithCallState_onSpeaker_isDropInCall___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setCallState:v3];
  [v4 setOnSpeaker:*(unsigned __int8 *)(a1 + 40)];
  [v4 setIsDropInCall:*(unsigned __int8 *)(a1 + 41)];
}

- (AFCallStateSnapshot)init
{
  return [(AFCallStateSnapshot *)self initWithBuilder:0];
}

- (AFCallStateSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFCallStateSnapshotMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFCallStateSnapshot;
  v5 = [(AFCallStateSnapshot *)&v9 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_AFCallStateSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFCallStateSnapshotMutation *)v7 isDirty])
    {
      v6->_unint64_t callState = [(_AFCallStateSnapshotMutation *)v7 getCallState];
      v6->_BOOL onSpeaker = [(_AFCallStateSnapshotMutation *)v7 getOnSpeaker];
      v6->_BOOL isDropInCall = [(_AFCallStateSnapshotMutation *)v7 getIsDropInCall];
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
  id v4 = (void (**)(id, _AFCallStateSnapshotMutation *))a3;
  if (v4)
  {
    v5 = [[_AFCallStateSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFCallStateSnapshotMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFCallStateSnapshot);
      v6->_unint64_t callState = [(_AFCallStateSnapshotMutation *)v5 getCallState];
      v6->_BOOL onSpeaker = [(_AFCallStateSnapshotMutation *)v5 getOnSpeaker];
      v6->_BOOL isDropInCall = [(_AFCallStateSnapshotMutation *)v5 getIsDropInCall];
    }
    else
    {
      uint64_t v6 = (AFCallStateSnapshot *)[(AFCallStateSnapshot *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFCallStateSnapshot *)[(AFCallStateSnapshot *)self copy];
  }

  return v6;
}

- (id)ad_shortDescription
{
  v2 = NSString;
  id v3 = AFCallStateGetNames([(AFCallStateSnapshot *)self callState]);
  id v4 = [v3 componentsJoinedByString:@"|"];
  v5 = [v2 stringWithFormat:@"(unint64_t callState = %@)", v4];

  return v5;
}

- (AFCallStateSnapshot)initWithSerializedBackingStore:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(AFCallStateSnapshot *)self initWithDictionaryRepresentation:v4];
    v5 = self;
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315394;
        objc_super v9 = "-[AFCallStateSnapshot(ContextSnapshot) initWithSerializedBackingStore:]";
        __int16 v10 = 2112;
        id v11 = v4;
        _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s #hal serializedBackingStore is of unexpected type: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    v5 = 0;
  }

  return v5;
}

@end