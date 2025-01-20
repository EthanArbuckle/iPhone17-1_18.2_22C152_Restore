@interface AFMyriadAdvertisementContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFMyriadAdvertisementContext)init;
- (AFMyriadAdvertisementContext)initWithBuilder:(id)a3;
- (AFMyriadAdvertisementContext)initWithCoder:(id)a3;
- (AFMyriadAdvertisementContext)initWithGeneration:(unint64_t)a3 contextData:(id)a4 contextFetchDelay:(double)a5;
- (BOOL)isEqual:(id)a3;
- (NSData)contextData;
- (double)contextFetchDelay;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFMyriadAdvertisementContext

- (void).cxx_destruct
{
}

- (double)contextFetchDelay
{
  return self->_contextFetchDelay;
}

- (NSData)contextData
{
  return self->_contextData;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t generation = self->_generation;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLongLong:generation];
  [v6 encodeObject:v7 forKey:@"AFMyriadAdvertisementContext::generation"];

  [v6 encodeObject:self->_contextData forKey:@"AFMyriadAdvertisementContext::contextData"];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_contextFetchDelay];
  [v6 encodeObject:v8 forKey:@"AFMyriadAdvertisementContext::contextFetchDelay"];
}

- (AFMyriadAdvertisementContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMyriadAdvertisementContext::generation"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMyriadAdvertisementContext::contextData"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMyriadAdvertisementContext::contextFetchDelay"];

  [v8 doubleValue];
  double v10 = v9;

  v11 = [(AFMyriadAdvertisementContext *)self initWithGeneration:v6 contextData:v7 contextFetchDelay:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFMyriadAdvertisementContext *)a3;
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
      unint64_t generation = self->_generation;
      if (generation == [(AFMyriadAdvertisementContext *)v5 generation]
        && (double contextFetchDelay = self->_contextFetchDelay,
            [(AFMyriadAdvertisementContext *)v5 contextFetchDelay],
            contextFetchDelay == v8))
      {
        v11 = [(AFMyriadAdvertisementContext *)v5 contextData];
        contextData = self->_contextData;
        BOOL v9 = contextData == v11 || [(NSData *)contextData isEqual:v11];
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
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_generation];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NSData *)self->_contextData hash] ^ v4;
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_contextFetchDelay];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFMyriadAdvertisementContext;
  uint64_t v5 = [(AFMyriadAdvertisementContext *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {unint64_t generation = %llu, contextData = (%llu bytes), contextFetchDelay = %f}", v5, self->_generation, -[NSData length](self->_contextData, "length"), *(void *)&self->_contextFetchDelay];

  return v6;
}

- (id)description
{
  return [(AFMyriadAdvertisementContext *)self _descriptionWithIndent:0];
}

- (AFMyriadAdvertisementContext)initWithGeneration:(unint64_t)a3 contextData:(id)a4 contextFetchDelay:(double)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__AFMyriadAdvertisementContext_initWithGeneration_contextData_contextFetchDelay___block_invoke;
  v12[3] = &unk_1E5926D68;
  id v13 = v8;
  unint64_t v14 = a3;
  double v15 = a5;
  id v9 = v8;
  double v10 = [(AFMyriadAdvertisementContext *)self initWithBuilder:v12];

  return v10;
}

void __81__AFMyriadAdvertisementContext_initWithGeneration_contextData_contextFetchDelay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setGeneration:v3];
  [v4 setContextData:*(void *)(a1 + 32)];
  [v4 setContextFetchDelay:*(double *)(a1 + 48)];
}

- (AFMyriadAdvertisementContext)init
{
  return [(AFMyriadAdvertisementContext *)self initWithBuilder:0];
}

- (AFMyriadAdvertisementContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFMyriadAdvertisementContextMutation *))a3;
  v13.receiver = self;
  v13.super_class = (Class)AFMyriadAdvertisementContext;
  uint64_t v5 = [(AFMyriadAdvertisementContext *)&v13 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_AFMyriadAdvertisementContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFMyriadAdvertisementContextMutation *)v7 isDirty])
    {
      v6->_unint64_t generation = [(_AFMyriadAdvertisementContextMutation *)v7 getGeneration];
      id v8 = [(_AFMyriadAdvertisementContextMutation *)v7 getContextData];
      uint64_t v9 = [v8 copy];
      contextData = v6->_contextData;
      v6->_contextData = (NSData *)v9;

      [(_AFMyriadAdvertisementContextMutation *)v7 getContextFetchDelay];
      v6->_double contextFetchDelay = v11;
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
  id v4 = (void (**)(id, _AFMyriadAdvertisementContextMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFMyriadAdvertisementContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFMyriadAdvertisementContextMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFMyriadAdvertisementContext);
      v6->_unint64_t generation = [(_AFMyriadAdvertisementContextMutation *)v5 getGeneration];
      unint64_t v7 = [(_AFMyriadAdvertisementContextMutation *)v5 getContextData];
      uint64_t v8 = [v7 copy];
      contextData = v6->_contextData;
      v6->_contextData = (NSData *)v8;

      [(_AFMyriadAdvertisementContextMutation *)v5 getContextFetchDelay];
      v6->_double contextFetchDelay = v10;
    }
    else
    {
      uint64_t v6 = (AFMyriadAdvertisementContext *)[(AFMyriadAdvertisementContext *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFMyriadAdvertisementContext *)[(AFMyriadAdvertisementContext *)self copy];
  }

  return v6;
}

@end