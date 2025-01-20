@interface AFMyriadContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFMyriadContext)init;
- (AFMyriadContext)initWithBuilder:(id)a3;
- (AFMyriadContext)initWithCoder:(id)a3;
- (AFMyriadContext)initWithTimestamp:(unint64_t)a3 perceptualAudioHash:(id)a4 overrideState:(id)a5 activationSource:(int64_t)a6 activationExpirationTime:(unint64_t)a7;
- (AFMyriadGoodnessScoreOverrideState)overrideState;
- (AFMyriadPerceptualAudioHash)perceptualAudioHash;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)activationSource;
- (unint64_t)activationExpirationTime;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFMyriadContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideState, 0);
  objc_storeStrong((id *)&self->_perceptualAudioHash, 0);
}

- (unint64_t)activationExpirationTime
{
  return self->_activationExpirationTime;
}

- (int64_t)activationSource
{
  return self->_activationSource;
}

- (AFMyriadGoodnessScoreOverrideState)overrideState
{
  return self->_overrideState;
}

- (AFMyriadPerceptualAudioHash)perceptualAudioHash
{
  return self->_perceptualAudioHash;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t timestamp = self->_timestamp;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLongLong:timestamp];
  [v6 encodeObject:v7 forKey:@"AFMyriadContext::timestamp"];

  [v6 encodeObject:self->_perceptualAudioHash forKey:@"AFMyriadContext::perceptualAudioHash"];
  [v6 encodeObject:self->_overrideState forKey:@"AFMyriadContext::overrideState"];
  v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_activationSource];
  [v6 encodeObject:v8 forKey:@"AFMyriadContext::activationSource"];

  id v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_activationExpirationTime];
  [v6 encodeObject:v9 forKey:@"AFMyriadContext::activationExpirationTime"];
}

- (AFMyriadContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMyriadContext::timestamp"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMyriadContext::perceptualAudioHash"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMyriadContext::overrideState"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMyriadContext::activationSource"];
  uint64_t v10 = [v9 integerValue];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMyriadContext::activationExpirationTime"];

  uint64_t v12 = [v11 unsignedLongLongValue];
  v13 = [(AFMyriadContext *)self initWithTimestamp:v6 perceptualAudioHash:v7 overrideState:v8 activationSource:v10 activationExpirationTime:v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFMyriadContext *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t timestamp = self->_timestamp;
      if (timestamp == [(AFMyriadContext *)v5 timestamp]
        && (int64_t activationSource = self->_activationSource,
            activationSource == [(AFMyriadContext *)v5 activationSource])
        && (unint64_t activationExpirationTime = self->_activationExpirationTime,
            activationExpirationTime == [(AFMyriadContext *)v5 activationExpirationTime]))
      {
        id v9 = [(AFMyriadContext *)v5 perceptualAudioHash];
        perceptualAudioHash = self->_perceptualAudioHash;
        if (perceptualAudioHash == v9 || [(AFMyriadPerceptualAudioHash *)perceptualAudioHash isEqual:v9])
        {
          v11 = [(AFMyriadContext *)v5 overrideState];
          overrideState = self->_overrideState;
          BOOL v13 = overrideState == v11 || [(AFMyriadGoodnessScoreOverrideState *)overrideState isEqual:v11];
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_timestamp];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(AFMyriadPerceptualAudioHash *)self->_perceptualAudioHash hash];
  unint64_t v6 = v5 ^ [(AFMyriadGoodnessScoreOverrideState *)self->_overrideState hash] ^ v4;
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_activationSource];
  uint64_t v8 = [v7 hash];
  id v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_activationExpirationTime];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v14.receiver = self;
  v14.super_class = (Class)AFMyriadContext;
  unint64_t v5 = [(AFMyriadContext *)&v14 description];
  unint64_t timestamp = self->_timestamp;
  perceptualAudioHash = self->_perceptualAudioHash;
  overrideState = self->_overrideState;
  unint64_t activationSource = self->_activationSource;
  if (activationSource > 0xF) {
    unint64_t v10 = @"(unknown)";
  }
  else {
    unint64_t v10 = off_1E5924E08[activationSource];
  }
  v11 = v10;
  v12 = (void *)[v4 initWithFormat:@"%@ {unint64_t timestamp = %llu, perceptualAudioHash = %@, overrideState = %@, activationSource = %@, activationExpirationTime = %llu}", v5, timestamp, perceptualAudioHash, overrideState, v11, self->_activationExpirationTime];

  return v12;
}

- (id)description
{
  return [(AFMyriadContext *)self _descriptionWithIndent:0];
}

- (AFMyriadContext)initWithTimestamp:(unint64_t)a3 perceptualAudioHash:(id)a4 overrideState:(id)a5 activationSource:(int64_t)a6 activationExpirationTime:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__AFMyriadContext_initWithTimestamp_perceptualAudioHash_overrideState_activationSource_activationExpirationTime___block_invoke;
  v18[3] = &unk_1E5925570;
  id v19 = v12;
  id v20 = v13;
  unint64_t v21 = a3;
  int64_t v22 = a6;
  unint64_t v23 = a7;
  id v14 = v13;
  id v15 = v12;
  v16 = [(AFMyriadContext *)self initWithBuilder:v18];

  return v16;
}

void __113__AFMyriadContext_initWithTimestamp_perceptualAudioHash_overrideState_activationSource_activationExpirationTime___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  id v4 = a2;
  [v4 setTimestamp:v3];
  [v4 setPerceptualAudioHash:a1[4]];
  [v4 setOverrideState:a1[5]];
  [v4 setActivationSource:a1[7]];
  [v4 setActivationExpirationTime:a1[8]];
}

- (AFMyriadContext)init
{
  return [(AFMyriadContext *)self initWithBuilder:0];
}

- (AFMyriadContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFMyriadContextMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFMyriadContext;
  unint64_t v5 = [(AFMyriadContext *)&v15 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFMyriadContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFMyriadContextMutation *)v7 isDirty])
    {
      v6->_unint64_t timestamp = [(_AFMyriadContextMutation *)v7 getTimestamp];
      uint64_t v8 = [(_AFMyriadContextMutation *)v7 getPerceptualAudioHash];
      uint64_t v9 = [v8 copy];
      perceptualAudioHash = v6->_perceptualAudioHash;
      v6->_perceptualAudioHash = (AFMyriadPerceptualAudioHash *)v9;

      v11 = [(_AFMyriadContextMutation *)v7 getOverrideState];
      uint64_t v12 = [v11 copy];
      overrideState = v6->_overrideState;
      v6->_overrideState = (AFMyriadGoodnessScoreOverrideState *)v12;

      v6->_unint64_t activationSource = [(_AFMyriadContextMutation *)v7 getActivationSource];
      v6->_unint64_t activationExpirationTime = [(_AFMyriadContextMutation *)v7 getActivationExpirationTime];
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
  id v4 = (void (**)(id, _AFMyriadContextMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_AFMyriadContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFMyriadContextMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(AFMyriadContext);
      v6->_unint64_t timestamp = [(_AFMyriadContextMutation *)v5 getTimestamp];
      v7 = [(_AFMyriadContextMutation *)v5 getPerceptualAudioHash];
      uint64_t v8 = [v7 copy];
      perceptualAudioHash = v6->_perceptualAudioHash;
      v6->_perceptualAudioHash = (AFMyriadPerceptualAudioHash *)v8;

      unint64_t v10 = [(_AFMyriadContextMutation *)v5 getOverrideState];
      uint64_t v11 = [v10 copy];
      overrideState = v6->_overrideState;
      v6->_overrideState = (AFMyriadGoodnessScoreOverrideState *)v11;

      v6->_unint64_t activationSource = [(_AFMyriadContextMutation *)v5 getActivationSource];
      v6->_unint64_t activationExpirationTime = [(_AFMyriadContextMutation *)v5 getActivationExpirationTime];
    }
    else
    {
      unint64_t v6 = (AFMyriadContext *)[(AFMyriadContext *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (AFMyriadContext *)[(AFMyriadContext *)self copy];
  }

  return v6;
}

@end