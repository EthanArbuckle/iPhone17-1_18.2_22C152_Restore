@interface AFSetAudioSessionActiveResult
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSetAudioSessionActiveResult)init;
- (AFSetAudioSessionActiveResult)initWithAudioSessionID:(unsigned int)a3 error:(id)a4;
- (AFSetAudioSessionActiveResult)initWithBuilder:(id)a3;
- (AFSetAudioSessionActiveResult)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unsigned)audioSessionID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSetAudioSessionActiveResult

- (void).cxx_destruct
{
}

- (NSError)error
{
  return self->_error;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t audioSessionID = self->_audioSessionID;
  id v7 = a3;
  v6 = [v4 numberWithUnsignedInt:audioSessionID];
  [v7 encodeObject:v6 forKey:@"AFSetAudioSessionActiveResult::audioSessionID"];

  [v7 encodeObject:self->_error forKey:@"AFSetAudioSessionActiveResult::error"];
}

- (AFSetAudioSessionActiveResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSetAudioSessionActiveResult::audioSessionID"];
  uint64_t v6 = [v5 unsignedIntValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSetAudioSessionActiveResult::error"];

  v8 = [(AFSetAudioSessionActiveResult *)self initWithAudioSessionID:v6 error:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSetAudioSessionActiveResult *)a3;
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
      unsigned int audioSessionID = self->_audioSessionID;
      if (audioSessionID == [(AFSetAudioSessionActiveResult *)v5 audioSessionID])
      {
        id v7 = [(AFSetAudioSessionActiveResult *)v5 error];
        error = self->_error;
        BOOL v9 = error == v7 || [(NSError *)error isEqual:v7];
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
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_audioSessionID];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NSError *)self->_error hash] ^ v4;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFSetAudioSessionActiveResult;
  unint64_t v5 = [(AFSetAudioSessionActiveResult *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {unsigned int audioSessionID = %u, error = %@}", v5, self->_audioSessionID, self->_error];

  return v6;
}

- (id)description
{
  return [(AFSetAudioSessionActiveResult *)self _descriptionWithIndent:0];
}

- (AFSetAudioSessionActiveResult)initWithAudioSessionID:(unsigned int)a3 error:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__AFSetAudioSessionActiveResult_initWithAudioSessionID_error___block_invoke;
  v10[3] = &unk_1E592C310;
  unsigned int v12 = a3;
  id v11 = v6;
  id v7 = v6;
  objc_super v8 = [(AFSetAudioSessionActiveResult *)self initWithBuilder:v10];

  return v8;
}

void __62__AFSetAudioSessionActiveResult_initWithAudioSessionID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = a2;
  [v4 setAudioSessionID:v3];
  [v4 setError:*(void *)(a1 + 32)];
}

- (AFSetAudioSessionActiveResult)init
{
  return [(AFSetAudioSessionActiveResult *)self initWithBuilder:0];
}

- (AFSetAudioSessionActiveResult)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSetAudioSessionActiveResultMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSetAudioSessionActiveResult;
  unint64_t v5 = [(AFSetAudioSessionActiveResult *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFSetAudioSessionActiveResultMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSetAudioSessionActiveResultMutation *)v7 isDirty])
    {
      v6->_unsigned int audioSessionID = [(_AFSetAudioSessionActiveResultMutation *)v7 getAudioSessionID];
      objc_super v8 = [(_AFSetAudioSessionActiveResultMutation *)v7 getError];
      uint64_t v9 = [v8 copy];
      error = v6->_error;
      v6->_error = (NSError *)v9;
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
  id v4 = (void (**)(id, _AFSetAudioSessionActiveResultMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_AFSetAudioSessionActiveResultMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSetAudioSessionActiveResultMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFSetAudioSessionActiveResult);
      v6->_unsigned int audioSessionID = [(_AFSetAudioSessionActiveResultMutation *)v5 getAudioSessionID];
      id v7 = [(_AFSetAudioSessionActiveResultMutation *)v5 getError];
      uint64_t v8 = [v7 copy];
      error = v6->_error;
      v6->_error = (NSError *)v8;
    }
    else
    {
      id v6 = (AFSetAudioSessionActiveResult *)[(AFSetAudioSessionActiveResult *)self copy];
    }
  }
  else
  {
    id v6 = (AFSetAudioSessionActiveResult *)[(AFSetAudioSessionActiveResult *)self copy];
  }

  return v6;
}

@end