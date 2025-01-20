@interface AFAccessibilityState
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFAccessibilityState)init;
- (AFAccessibilityState)initWithBuilder:(id)a3;
- (AFAccessibilityState)initWithCoder:(id)a3;
- (AFAccessibilityState)initWithIsVoiceOverTouchEnabled:(int64_t)a3 isVibrationDisabled:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)isVibrationDisabled;
- (int64_t)isVoiceOverTouchEnabled;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFAccessibilityState

- (int64_t)isVibrationDisabled
{
  return self->_isVibrationDisabled;
}

- (int64_t)isVoiceOverTouchEnabled
{
  return self->_isVoiceOverTouchEnabled;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  int64_t isVoiceOverTouchEnabled = self->_isVoiceOverTouchEnabled;
  id v6 = a3;
  v7 = [v4 numberWithInteger:isVoiceOverTouchEnabled];
  [v6 encodeObject:v7 forKey:@"AFAccessibilityState::isVoiceOverTouchEnabled"];

  id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isVibrationDisabled];
  [v6 encodeObject:v8 forKey:@"AFAccessibilityState::isVibrationDisabled"];
}

- (AFAccessibilityState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAccessibilityState::isVoiceOverTouchEnabled"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAccessibilityState::isVibrationDisabled"];

  uint64_t v8 = [v7 integerValue];
  return [(AFAccessibilityState *)self initWithIsVoiceOverTouchEnabled:v6 isVibrationDisabled:v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFAccessibilityState *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t isVoiceOverTouchEnabled = self->_isVoiceOverTouchEnabled;
      if (isVoiceOverTouchEnabled == [(AFAccessibilityState *)v5 isVoiceOverTouchEnabled])
      {
        int64_t isVibrationDisabled = self->_isVibrationDisabled;
        BOOL v8 = isVibrationDisabled == [(AFAccessibilityState *)v5 isVibrationDisabled];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isVoiceOverTouchEnabled];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isVibrationDisabled];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v14.receiver = self;
  v14.super_class = (Class)AFAccessibilityState;
  v5 = [(AFAccessibilityState *)&v14 description];
  unint64_t isVoiceOverTouchEnabled = self->_isVoiceOverTouchEnabled;
  if (isVoiceOverTouchEnabled > 2) {
    v7 = @"(unknown)";
  }
  else {
    v7 = off_1E592A860[isVoiceOverTouchEnabled];
  }
  BOOL v8 = v7;
  unint64_t isVibrationDisabled = self->_isVibrationDisabled;
  if (isVibrationDisabled > 2) {
    v10 = @"(unknown)";
  }
  else {
    v10 = off_1E592A860[isVibrationDisabled];
  }
  v11 = v10;
  v12 = (void *)[v4 initWithFormat:@"%@ {unint64_t isVoiceOverTouchEnabled = %@, isVibrationDisabled = %@}", v5, v8, v11];

  return v12;
}

- (id)description
{
  return [(AFAccessibilityState *)self _descriptionWithIndent:0];
}

- (AFAccessibilityState)initWithIsVoiceOverTouchEnabled:(int64_t)a3 isVibrationDisabled:(int64_t)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__AFAccessibilityState_initWithIsVoiceOverTouchEnabled_isVibrationDisabled___block_invoke;
  v5[3] = &__block_descriptor_48_e40_v16__0___AFAccessibilityStateMutating__8l;
  v5[4] = a3;
  v5[5] = a4;
  return [(AFAccessibilityState *)self initWithBuilder:v5];
}

void __76__AFAccessibilityState_initWithIsVoiceOverTouchEnabled_isVibrationDisabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setIsVoiceOverTouchEnabled:v3];
  [v4 setIsVibrationDisabled:*(void *)(a1 + 40)];
}

- (AFAccessibilityState)init
{
  return [(AFAccessibilityState *)self initWithBuilder:0];
}

- (AFAccessibilityState)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFAccessibilityStateMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFAccessibilityState;
  v5 = [(AFAccessibilityState *)&v9 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFAccessibilityStateMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFAccessibilityStateMutation *)v7 isDirty])
    {
      v6->_unint64_t isVoiceOverTouchEnabled = [(_AFAccessibilityStateMutation *)v7 getIsVoiceOverTouchEnabled];
      v6->_unint64_t isVibrationDisabled = [(_AFAccessibilityStateMutation *)v7 getIsVibrationDisabled];
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
  id v4 = (void (**)(id, _AFAccessibilityStateMutation *))a3;
  if (v4)
  {
    v5 = [[_AFAccessibilityStateMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFAccessibilityStateMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(AFAccessibilityState);
      v6->_unint64_t isVoiceOverTouchEnabled = [(_AFAccessibilityStateMutation *)v5 getIsVoiceOverTouchEnabled];
      v6->_unint64_t isVibrationDisabled = [(_AFAccessibilityStateMutation *)v5 getIsVibrationDisabled];
    }
    else
    {
      unint64_t v6 = (AFAccessibilityState *)[(AFAccessibilityState *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (AFAccessibilityState *)[(AFAccessibilityState *)self copy];
  }

  return v6;
}

@end