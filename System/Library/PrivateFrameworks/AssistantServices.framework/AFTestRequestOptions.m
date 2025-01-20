@interface AFTestRequestOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFTestRequestOptions)init;
- (AFTestRequestOptions)initWithBuilder:(id)a3;
- (AFTestRequestOptions)initWithCoder:(id)a3;
- (AFTestRequestOptions)initWithRequestPath:(int64_t)a3 inputOrigin:(id)a4 isEyesFree:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSNumber)isEyesFree;
- (NSString)inputOrigin;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)requestPath;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFTestRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEyesFree, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
}

- (NSNumber)isEyesFree
{
  return self->_isEyesFree;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (int64_t)requestPath
{
  return self->_requestPath;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  int64_t requestPath = self->_requestPath;
  id v7 = a3;
  v6 = [v4 numberWithInteger:requestPath];
  [v7 encodeObject:v6 forKey:@"AFTestRequestOptions::requestPath"];

  [v7 encodeObject:self->_inputOrigin forKey:@"AFTestRequestOptions::inputOrigin"];
  [v7 encodeObject:self->_isEyesFree forKey:@"AFTestRequestOptions::isEyesFree"];
}

- (AFTestRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFTestRequestOptions::requestPath"];
  uint64_t v6 = [v5 integerValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFTestRequestOptions::inputOrigin"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFTestRequestOptions::isEyesFree"];

  v9 = [(AFTestRequestOptions *)self initWithRequestPath:v6 inputOrigin:v7 isEyesFree:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFTestRequestOptions *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t requestPath = self->_requestPath;
      if (requestPath == [(AFTestRequestOptions *)v5 requestPath])
      {
        id v7 = [(AFTestRequestOptions *)v5 inputOrigin];
        inputOrigin = self->_inputOrigin;
        if (inputOrigin == v7 || [(NSString *)inputOrigin isEqual:v7])
        {
          v9 = [(AFTestRequestOptions *)v5 isEyesFree];
          isEyesFree = self->_isEyesFree;
          BOOL v11 = isEyesFree == v9 || [(NSNumber *)isEyesFree isEqual:v9];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_requestPath];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_inputOrigin hash];
  unint64_t v6 = v5 ^ [(NSNumber *)self->_isEyesFree hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)AFTestRequestOptions;
  NSUInteger v5 = [(AFTestRequestOptions *)&v11 description];
  unint64_t requestPath = self->_requestPath;
  if (requestPath > 2) {
    id v7 = @"(unknown)";
  }
  else {
    id v7 = off_1E5925DD8[requestPath];
  }
  v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t requestPath = %@, inputOrigin = %@, isEyesFree = %@}", v5, v8, self->_inputOrigin, self->_isEyesFree];

  return v9;
}

- (id)description
{
  return [(AFTestRequestOptions *)self _descriptionWithIndent:0];
}

- (AFTestRequestOptions)initWithRequestPath:(int64_t)a3 inputOrigin:(id)a4 isEyesFree:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__AFTestRequestOptions_initWithRequestPath_inputOrigin_isEyesFree___block_invoke;
  v14[3] = &unk_1E5924B08;
  id v16 = v9;
  int64_t v17 = a3;
  id v15 = v8;
  id v10 = v9;
  id v11 = v8;
  v12 = [(AFTestRequestOptions *)self initWithBuilder:v14];

  return v12;
}

void __67__AFTestRequestOptions_initWithRequestPath_inputOrigin_isEyesFree___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  id v4 = a2;
  [v4 setRequestPath:v3];
  [v4 setInputOrigin:a1[4]];
  [v4 setIsEyesFree:a1[5]];
}

- (AFTestRequestOptions)init
{
  return [(AFTestRequestOptions *)self initWithBuilder:0];
}

- (AFTestRequestOptions)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFTestRequestOptionsMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFTestRequestOptions;
  NSUInteger v5 = [(AFTestRequestOptions *)&v15 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFTestRequestOptionsMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFTestRequestOptionsMutation *)v7 isDirty])
    {
      v6->_unint64_t requestPath = [(_AFTestRequestOptionsMutation *)v7 getRequestPath];
      id v8 = [(_AFTestRequestOptionsMutation *)v7 getInputOrigin];
      uint64_t v9 = [v8 copy];
      inputOrigin = v6->_inputOrigin;
      v6->_inputOrigin = (NSString *)v9;

      id v11 = [(_AFTestRequestOptionsMutation *)v7 getIsEyesFree];
      uint64_t v12 = [v11 copy];
      isEyesFree = v6->_isEyesFree;
      v6->_isEyesFree = (NSNumber *)v12;
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
  id v4 = (void (**)(id, _AFTestRequestOptionsMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_AFTestRequestOptionsMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFTestRequestOptionsMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(AFTestRequestOptions);
      v6->_unint64_t requestPath = [(_AFTestRequestOptionsMutation *)v5 getRequestPath];
      id v7 = [(_AFTestRequestOptionsMutation *)v5 getInputOrigin];
      uint64_t v8 = [v7 copy];
      inputOrigin = v6->_inputOrigin;
      v6->_inputOrigin = (NSString *)v8;

      id v10 = [(_AFTestRequestOptionsMutation *)v5 getIsEyesFree];
      uint64_t v11 = [v10 copy];
      isEyesFree = v6->_isEyesFree;
      v6->_isEyesFree = (NSNumber *)v11;
    }
    else
    {
      unint64_t v6 = (AFTestRequestOptions *)[(AFTestRequestOptions *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (AFTestRequestOptions *)[(AFTestRequestOptions *)self copy];
  }

  return v6;
}

@end