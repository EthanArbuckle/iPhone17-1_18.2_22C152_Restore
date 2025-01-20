@interface AFSetAudioSessionActiveContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSetAudioSessionActiveContext)init;
- (AFSetAudioSessionActiveContext)initWithBuilder:(id)a3;
- (AFSetAudioSessionActiveContext)initWithCoder:(id)a3;
- (AFSetAudioSessionActiveContext)initWithOptions:(unint64_t)a3 reason:(int64_t)a4 speechRequestOptions:(id)a5;
- (AFSpeechRequestOptions)speechRequestOptions;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (id)redactedDescription;
- (int64_t)reason;
- (unint64_t)hash;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSetAudioSessionActiveContext

- (void).cxx_destruct
{
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return self->_speechRequestOptions;
}

- (int64_t)reason
{
  return self->_reason;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t options = self->_options;
  id v8 = a3;
  v6 = [v4 numberWithUnsignedInteger:options];
  [v8 encodeObject:v6 forKey:@"AFSetAudioSessionActiveContext::options"];

  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_reason];
  [v8 encodeObject:v7 forKey:@"AFSetAudioSessionActiveContext::reason"];

  [v8 encodeObject:self->_speechRequestOptions forKey:@"AFSetAudioSessionActiveContext::speechRequestOptions"];
}

- (AFSetAudioSessionActiveContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSetAudioSessionActiveContext::options"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSetAudioSessionActiveContext::reason"];
  uint64_t v8 = [v7 integerValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSetAudioSessionActiveContext::speechRequestOptions"];

  v10 = [(AFSetAudioSessionActiveContext *)self initWithOptions:v6 reason:v8 speechRequestOptions:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSetAudioSessionActiveContext *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t options = self->_options;
      if (options == [(AFSetAudioSessionActiveContext *)v5 options]
        && (int64_t reason = self->_reason, reason == [(AFSetAudioSessionActiveContext *)v5 reason]))
      {
        uint64_t v8 = [(AFSetAudioSessionActiveContext *)v5 speechRequestOptions];
        speechRequestOptions = self->_speechRequestOptions;
        BOOL v10 = speechRequestOptions == v8
           || [(AFSpeechRequestOptions *)speechRequestOptions isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_options];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_reason];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(AFSpeechRequestOptions *)self->_speechRequestOptions hash];

  return v7;
}

- (id)redactedDescription
{
  id v3 = [NSString alloc];
  unint64_t reason = self->_reason;
  if (reason > 3) {
    v5 = @"(unknown)";
  }
  else {
    v5 = off_1E5928FD8[reason];
  }
  uint64_t v6 = v5;
  v7 = (void *)[v3 initWithFormat:@"unint64_t reason = %@", v6];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)AFSetAudioSessionActiveContext;
  v5 = [(AFSetAudioSessionActiveContext *)&v13 description];
  uint64_t v6 = AFSetAudioSessionActiveOptionsGetNames(self->_options);
  unint64_t v7 = [v6 componentsJoinedByString:@"|"];
  unint64_t reason = self->_reason;
  if (reason > 3) {
    v9 = @"(unknown)";
  }
  else {
    v9 = off_1E5928FD8[reason];
  }
  BOOL v10 = v9;
  v11 = (void *)[v4 initWithFormat:@"%@ {unint64_t options = %@, reason = %@, speechRequestOptions = %@}", v5, v7, v10, self->_speechRequestOptions];

  return v11;
}

- (id)description
{
  return [(AFSetAudioSessionActiveContext *)self _descriptionWithIndent:0];
}

- (AFSetAudioSessionActiveContext)initWithOptions:(unint64_t)a3 reason:(int64_t)a4 speechRequestOptions:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__AFSetAudioSessionActiveContext_initWithOptions_reason_speechRequestOptions___block_invoke;
  v12[3] = &unk_1E59252D8;
  unint64_t v14 = a3;
  int64_t v15 = a4;
  id v13 = v8;
  id v9 = v8;
  BOOL v10 = [(AFSetAudioSessionActiveContext *)self initWithBuilder:v12];

  return v10;
}

void __78__AFSetAudioSessionActiveContext_initWithOptions_reason_speechRequestOptions___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = a2;
  [v4 setOptions:v3];
  [v4 setReason:a1[6]];
  [v4 setSpeechRequestOptions:a1[4]];
}

- (AFSetAudioSessionActiveContext)init
{
  return [(AFSetAudioSessionActiveContext *)self initWithBuilder:0];
}

- (AFSetAudioSessionActiveContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSetAudioSessionActiveContextMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSetAudioSessionActiveContext;
  v5 = [(AFSetAudioSessionActiveContext *)&v12 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_AFSetAudioSessionActiveContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSetAudioSessionActiveContextMutation *)v7 isDirty])
    {
      v6->_unint64_t options = [(_AFSetAudioSessionActiveContextMutation *)v7 getOptions];
      v6->_unint64_t reason = [(_AFSetAudioSessionActiveContextMutation *)v7 getReason];
      id v8 = [(_AFSetAudioSessionActiveContextMutation *)v7 getSpeechRequestOptions];
      uint64_t v9 = [v8 copy];
      speechRequestOptions = v6->_speechRequestOptions;
      v6->_speechRequestOptions = (AFSpeechRequestOptions *)v9;
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
  id v4 = (void (**)(id, _AFSetAudioSessionActiveContextMutation *))a3;
  if (v4)
  {
    v5 = [[_AFSetAudioSessionActiveContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSetAudioSessionActiveContextMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFSetAudioSessionActiveContext);
      v6->_unint64_t options = [(_AFSetAudioSessionActiveContextMutation *)v5 getOptions];
      v6->_unint64_t reason = [(_AFSetAudioSessionActiveContextMutation *)v5 getReason];
      unint64_t v7 = [(_AFSetAudioSessionActiveContextMutation *)v5 getSpeechRequestOptions];
      uint64_t v8 = [v7 copy];
      speechRequestOptions = v6->_speechRequestOptions;
      v6->_speechRequestOptions = (AFSpeechRequestOptions *)v8;
    }
    else
    {
      uint64_t v6 = (AFSetAudioSessionActiveContext *)[(AFSetAudioSessionActiveContext *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFSetAudioSessionActiveContext *)[(AFSetAudioSessionActiveContext *)self copy];
  }

  return v6;
}

@end