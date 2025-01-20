@interface AFSpeechTestRequestOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSpeechTestRequestOptions)init;
- (AFSpeechTestRequestOptions)initWithBuilder:(id)a3;
- (AFSpeechTestRequestOptions)initWithCoder:(id)a3;
- (AFSpeechTestRequestOptions)initWithJitContext:(id)a3 overrideModelPath:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)jitContext;
- (NSString)overrideModelPath;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechTestRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideModelPath, 0);
  objc_storeStrong((id *)&self->_jitContext, 0);
}

- (NSString)overrideModelPath
{
  return self->_overrideModelPath;
}

- (NSArray)jitContext
{
  return self->_jitContext;
}

- (void)encodeWithCoder:(id)a3
{
  jitContext = self->_jitContext;
  id v5 = a3;
  [v5 encodeObject:jitContext forKey:@"AFSpeechTestRequestOptions::jitContext"];
  [v5 encodeObject:self->_overrideModelPath forKey:@"AFSpeechTestRequestOptions::overrideModelPath"];
}

- (AFSpeechTestRequestOptions)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"AFSpeechTestRequestOptions::jitContext"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechTestRequestOptions::overrideModelPath"];

  v10 = [(AFSpeechTestRequestOptions *)self initWithJitContext:v8 overrideModelPath:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFSpeechTestRequestOptions *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(AFSpeechTestRequestOptions *)v5 jitContext];
      jitContext = self->_jitContext;
      if (jitContext == v6 || [(NSArray *)jitContext isEqual:v6])
      {
        v8 = [(AFSpeechTestRequestOptions *)v5 overrideModelPath];
        overrideModelPath = self->_overrideModelPath;
        BOOL v10 = overrideModelPath == v8 || [(NSString *)overrideModelPath isEqual:v8];
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
  uint64_t v3 = [(NSArray *)self->_jitContext hash];
  return [(NSString *)self->_overrideModelPath hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFSpeechTestRequestOptions;
  id v5 = [(AFSpeechTestRequestOptions *)&v8 description];
  uint64_t v6 = (void *)[v4 initWithFormat:@"%@ {jitContext = %@, overrideModelPath = %@}", v5, self->_jitContext, self->_overrideModelPath];

  return v6;
}

- (id)description
{
  return [(AFSpeechTestRequestOptions *)self _descriptionWithIndent:0];
}

- (AFSpeechTestRequestOptions)initWithJitContext:(id)a3 overrideModelPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__AFSpeechTestRequestOptions_initWithJitContext_overrideModelPath___block_invoke;
  v12[3] = &unk_1E5925CE8;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  BOOL v10 = [(AFSpeechTestRequestOptions *)self initWithBuilder:v12];

  return v10;
}

void __67__AFSpeechTestRequestOptions_initWithJitContext_overrideModelPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setJitContext:v3];
  [v4 setOverrideModelPath:*(void *)(a1 + 40)];
}

- (AFSpeechTestRequestOptions)init
{
  return [(AFSpeechTestRequestOptions *)self initWithBuilder:0];
}

- (AFSpeechTestRequestOptions)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSpeechTestRequestOptionsMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSpeechTestRequestOptions;
  id v5 = [(AFSpeechTestRequestOptions *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFSpeechTestRequestOptionsMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSpeechTestRequestOptionsMutation *)v7 isDirty])
    {
      id v8 = [(_AFSpeechTestRequestOptionsMutation *)v7 getJitContext];
      uint64_t v9 = [v8 copy];
      jitContext = v6->_jitContext;
      v6->_jitContext = (NSArray *)v9;

      v11 = [(_AFSpeechTestRequestOptionsMutation *)v7 getOverrideModelPath];
      uint64_t v12 = [v11 copy];
      overrideModelPath = v6->_overrideModelPath;
      v6->_overrideModelPath = (NSString *)v12;
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
  id v4 = (void (**)(id, _AFSpeechTestRequestOptionsMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFSpeechTestRequestOptionsMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSpeechTestRequestOptionsMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFSpeechTestRequestOptions);
      id v7 = [(_AFSpeechTestRequestOptionsMutation *)v5 getJitContext];
      uint64_t v8 = [v7 copy];
      jitContext = v6->_jitContext;
      v6->_jitContext = (NSArray *)v8;

      BOOL v10 = [(_AFSpeechTestRequestOptionsMutation *)v5 getOverrideModelPath];
      uint64_t v11 = [v10 copy];
      overrideModelPath = v6->_overrideModelPath;
      v6->_overrideModelPath = (NSString *)v11;
    }
    else
    {
      id v6 = (AFSpeechTestRequestOptions *)[(AFSpeechTestRequestOptions *)self copy];
    }
  }
  else
  {
    id v6 = (AFSpeechTestRequestOptions *)[(AFSpeechTestRequestOptions *)self copy];
  }

  return v6;
}

@end