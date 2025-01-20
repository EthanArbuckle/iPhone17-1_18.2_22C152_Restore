@interface AFSpeechRecordingAlertPolicy
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSpeechRecordingAlertBehavior)startingAlertBehavior;
- (AFSpeechRecordingAlertBehavior)stoppedAlertBehavior;
- (AFSpeechRecordingAlertBehavior)stoppedWithErrorAlertBehavior;
- (AFSpeechRecordingAlertPolicy)init;
- (AFSpeechRecordingAlertPolicy)initWithBuilder:(id)a3;
- (AFSpeechRecordingAlertPolicy)initWithCoder:(id)a3;
- (AFSpeechRecordingAlertPolicy)initWithStartingAlertBehavior:(id)a3 stoppedAlertBehavior:(id)a4 stoppedWithErrorAlertBehavior:(id)a5;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechRecordingAlertPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stoppedWithErrorAlertBehavior, 0);
  objc_storeStrong((id *)&self->_stoppedAlertBehavior, 0);
  objc_storeStrong((id *)&self->_startingAlertBehavior, 0);
}

- (AFSpeechRecordingAlertBehavior)stoppedWithErrorAlertBehavior
{
  return self->_stoppedWithErrorAlertBehavior;
}

- (AFSpeechRecordingAlertBehavior)stoppedAlertBehavior
{
  return self->_stoppedAlertBehavior;
}

- (AFSpeechRecordingAlertBehavior)startingAlertBehavior
{
  return self->_startingAlertBehavior;
}

- (void)encodeWithCoder:(id)a3
{
  startingAlertBehavior = self->_startingAlertBehavior;
  id v5 = a3;
  [v5 encodeObject:startingAlertBehavior forKey:@"AFSpeechRecordingAlertPolicy::startingAlertBehavior"];
  [v5 encodeObject:self->_stoppedAlertBehavior forKey:@"AFSpeechRecordingAlertPolicy::stoppedAlertBehavior"];
  [v5 encodeObject:self->_stoppedWithErrorAlertBehavior forKey:@"AFSpeechRecordingAlertPolicy::stoppedWithErrorAlertBehavior"];
}

- (AFSpeechRecordingAlertPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechRecordingAlertPolicy::startingAlertBehavior"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechRecordingAlertPolicy::stoppedAlertBehavior"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechRecordingAlertPolicy::stoppedWithErrorAlertBehavior"];

  v8 = [(AFSpeechRecordingAlertPolicy *)self initWithStartingAlertBehavior:v5 stoppedAlertBehavior:v6 stoppedWithErrorAlertBehavior:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSpeechRecordingAlertPolicy *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(AFSpeechRecordingAlertPolicy *)v5 startingAlertBehavior];
      startingAlertBehavior = self->_startingAlertBehavior;
      if (startingAlertBehavior == v6
        || [(AFSpeechRecordingAlertBehavior *)startingAlertBehavior isEqual:v6])
      {
        v8 = [(AFSpeechRecordingAlertPolicy *)v5 stoppedAlertBehavior];
        stoppedAlertBehavior = self->_stoppedAlertBehavior;
        if (stoppedAlertBehavior == v8
          || [(AFSpeechRecordingAlertBehavior *)stoppedAlertBehavior isEqual:v8])
        {
          v10 = [(AFSpeechRecordingAlertPolicy *)v5 stoppedWithErrorAlertBehavior];
          stoppedWithErrorAlertBehavior = self->_stoppedWithErrorAlertBehavior;
          BOOL v12 = stoppedWithErrorAlertBehavior == v10
             || [(AFSpeechRecordingAlertBehavior *)stoppedWithErrorAlertBehavior isEqual:v10];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(AFSpeechRecordingAlertBehavior *)self->_startingAlertBehavior hash];
  unint64_t v4 = [(AFSpeechRecordingAlertBehavior *)self->_stoppedAlertBehavior hash] ^ v3;
  return v4 ^ [(AFSpeechRecordingAlertBehavior *)self->_stoppedWithErrorAlertBehavior hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFSpeechRecordingAlertPolicy;
  id v5 = [(AFSpeechRecordingAlertPolicy *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {startingAlertBehavior = %@, stoppedAlertBehavior = %@, stoppedWithErrorAlertBehavior = %@}", v5, self->_startingAlertBehavior, self->_stoppedAlertBehavior, self->_stoppedWithErrorAlertBehavior];

  return v6;
}

- (id)description
{
  return [(AFSpeechRecordingAlertPolicy *)self _descriptionWithIndent:0];
}

- (AFSpeechRecordingAlertPolicy)initWithStartingAlertBehavior:(id)a3 stoppedAlertBehavior:(id)a4 stoppedWithErrorAlertBehavior:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __113__AFSpeechRecordingAlertPolicy_initWithStartingAlertBehavior_stoppedAlertBehavior_stoppedWithErrorAlertBehavior___block_invoke;
  v16[3] = &unk_1E5927620;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  v14 = [(AFSpeechRecordingAlertPolicy *)self initWithBuilder:v16];

  return v14;
}

void __113__AFSpeechRecordingAlertPolicy_initWithStartingAlertBehavior_stoppedAlertBehavior_stoppedWithErrorAlertBehavior___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setStartingAlertBehavior:v3];
  [v4 setStoppedAlertBehavior:a1[5]];
  [v4 setStoppedWithErrorAlertBehavior:a1[6]];
}

- (AFSpeechRecordingAlertPolicy)init
{
  return [(AFSpeechRecordingAlertPolicy *)self initWithBuilder:0];
}

- (AFSpeechRecordingAlertPolicy)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSpeechRecordingAlertPolicyMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFSpeechRecordingAlertPolicy;
  id v5 = [(AFSpeechRecordingAlertPolicy *)&v18 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFSpeechRecordingAlertPolicyMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSpeechRecordingAlertPolicyMutation *)v7 isDirty])
    {
      id v8 = [(_AFSpeechRecordingAlertPolicyMutation *)v7 getStartingAlertBehavior];
      uint64_t v9 = [v8 copy];
      startingAlertBehavior = v6->_startingAlertBehavior;
      v6->_startingAlertBehavior = (AFSpeechRecordingAlertBehavior *)v9;

      id v11 = [(_AFSpeechRecordingAlertPolicyMutation *)v7 getStoppedAlertBehavior];
      uint64_t v12 = [v11 copy];
      stoppedAlertBehavior = v6->_stoppedAlertBehavior;
      v6->_stoppedAlertBehavior = (AFSpeechRecordingAlertBehavior *)v12;

      v14 = [(_AFSpeechRecordingAlertPolicyMutation *)v7 getStoppedWithErrorAlertBehavior];
      uint64_t v15 = [v14 copy];
      stoppedWithErrorAlertBehavior = v6->_stoppedWithErrorAlertBehavior;
      v6->_stoppedWithErrorAlertBehavior = (AFSpeechRecordingAlertBehavior *)v15;
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
  id v4 = (void (**)(id, _AFSpeechRecordingAlertPolicyMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFSpeechRecordingAlertPolicyMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSpeechRecordingAlertPolicyMutation *)v5 isDirty])
    {
      v6 = objc_alloc_init(AFSpeechRecordingAlertPolicy);
      v7 = [(_AFSpeechRecordingAlertPolicyMutation *)v5 getStartingAlertBehavior];
      uint64_t v8 = [v7 copy];
      startingAlertBehavior = v6->_startingAlertBehavior;
      v6->_startingAlertBehavior = (AFSpeechRecordingAlertBehavior *)v8;

      id v10 = [(_AFSpeechRecordingAlertPolicyMutation *)v5 getStoppedAlertBehavior];
      uint64_t v11 = [v10 copy];
      stoppedAlertBehavior = v6->_stoppedAlertBehavior;
      v6->_stoppedAlertBehavior = (AFSpeechRecordingAlertBehavior *)v11;

      id v13 = [(_AFSpeechRecordingAlertPolicyMutation *)v5 getStoppedWithErrorAlertBehavior];
      uint64_t v14 = [v13 copy];
      stoppedWithErrorAlertBehavior = v6->_stoppedWithErrorAlertBehavior;
      v6->_stoppedWithErrorAlertBehavior = (AFSpeechRecordingAlertBehavior *)v14;
    }
    else
    {
      v6 = (AFSpeechRecordingAlertPolicy *)[(AFSpeechRecordingAlertPolicy *)self copy];
    }
  }
  else
  {
    v6 = (AFSpeechRecordingAlertPolicy *)[(AFSpeechRecordingAlertPolicy *)self copy];
  }

  return v6;
}

@end