@interface AFSiriActivationResult
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSiriActivationResult)init;
- (AFSiriActivationResult)initWithActionType:(int64_t)a3 error:(id)a4;
- (AFSiriActivationResult)initWithBuilder:(id)a3;
- (AFSiriActivationResult)initWithCoder:(id)a3;
- (AFSiriActivationResult)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)actionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSiriActivationResult

- (void).cxx_destruct
{
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t actionType = self->_actionType;
  if (actionType > 6) {
    v5 = @"(unknown)";
  }
  else {
    v5 = off_1E5926530[actionType];
  }
  v6 = v5;
  [v3 setObject:v6 forKey:@"actionType"];

  error = self->_error;
  if (error) {
    [v3 setObject:error forKey:@"error"];
  }
  v8 = (void *)[v3 copy];

  return v8;
}

- (AFSiriActivationResult)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKey:@"actionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = AFSiriActivationActionTypeGetFromName(v5);
    }
    else {
      uint64_t v6 = 0;
    }

    v8 = [v4 objectForKey:@"error"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    self = [(AFSiriActivationResult *)self initWithActionType:v6 error:v9];
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
  int64_t actionType = self->_actionType;
  id v7 = a3;
  uint64_t v6 = [v4 numberWithInteger:actionType];
  [v7 encodeObject:v6 forKey:@"AFSiriActivationResult::actionType"];

  [v7 encodeObject:self->_error forKey:@"AFSiriActivationResult::error"];
}

- (AFSiriActivationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSiriActivationResult::actionType"];
  uint64_t v6 = [v5 integerValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSiriActivationResult::error"];

  v8 = [(AFSiriActivationResult *)self initWithActionType:v6 error:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSiriActivationResult *)a3;
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
      int64_t actionType = self->_actionType;
      if (actionType == [(AFSiriActivationResult *)v5 actionType])
      {
        id v7 = [(AFSiriActivationResult *)v5 error];
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
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_actionType];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NSError *)self->_error hash] ^ v4;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)AFSiriActivationResult;
  unint64_t v5 = [(AFSiriActivationResult *)&v11 description];
  unint64_t actionType = self->_actionType;
  if (actionType > 6) {
    id v7 = @"(unknown)";
  }
  else {
    id v7 = off_1E5926530[actionType];
  }
  v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t actionType = %@, error = %@}", v5, v8, self->_error];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(AFSiriActivationResult *)self _descriptionWithIndent:0];
}

- (AFSiriActivationResult)initWithActionType:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__AFSiriActivationResult_initWithActionType_error___block_invoke;
  v10[3] = &unk_1E592BD40;
  id v11 = v6;
  int64_t v12 = a3;
  id v7 = v6;
  v8 = [(AFSiriActivationResult *)self initWithBuilder:v10];

  return v8;
}

void __51__AFSiriActivationResult_initWithActionType_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setActionType:v3];
  [v4 setError:*(void *)(a1 + 32)];
}

- (AFSiriActivationResult)init
{
  return [(AFSiriActivationResult *)self initWithBuilder:0];
}

- (AFSiriActivationResult)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSiriActivationResultMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSiriActivationResult;
  unint64_t v5 = [(AFSiriActivationResult *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFSiriActivationResultMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSiriActivationResultMutation *)v7 isDirty])
    {
      v6->_unint64_t actionType = [(_AFSiriActivationResultMutation *)v7 getActionType];
      v8 = [(_AFSiriActivationResultMutation *)v7 getError];
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
  id v4 = (void (**)(id, _AFSiriActivationResultMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_AFSiriActivationResultMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSiriActivationResultMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFSiriActivationResult);
      v6->_unint64_t actionType = [(_AFSiriActivationResultMutation *)v5 getActionType];
      id v7 = [(_AFSiriActivationResultMutation *)v5 getError];
      uint64_t v8 = [v7 copy];
      error = v6->_error;
      v6->_error = (NSError *)v8;
    }
    else
    {
      id v6 = (AFSiriActivationResult *)[(AFSiriActivationResult *)self copy];
    }
  }
  else
  {
    id v6 = (AFSiriActivationResult *)[(AFSiriActivationResult *)self copy];
  }

  return v6;
}

@end