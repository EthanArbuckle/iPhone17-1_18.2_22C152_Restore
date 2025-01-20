@interface AFOutputVoiceDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFOutputVoiceDescriptor)init;
- (AFOutputVoiceDescriptor)initWithBuilder:(id)a3;
- (AFOutputVoiceDescriptor)initWithCoder:(id)a3;
- (AFOutputVoiceDescriptor)initWithLocalizedDisplay:(id)a3 localizedDisplayWithRegion:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)localizedDisplay;
- (NSString)localizedDisplayWithRegion;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFOutputVoiceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayWithRegion, 0);
  objc_storeStrong((id *)&self->_localizedDisplay, 0);
}

- (NSString)localizedDisplayWithRegion
{
  return self->_localizedDisplayWithRegion;
}

- (NSString)localizedDisplay
{
  return self->_localizedDisplay;
}

- (void)encodeWithCoder:(id)a3
{
  localizedDisplay = self->_localizedDisplay;
  id v5 = a3;
  [v5 encodeObject:localizedDisplay forKey:@"AFOutputVoiceDescriptor::localizedDisplay"];
  [v5 encodeObject:self->_localizedDisplayWithRegion forKey:@"AFOutputVoiceDescriptor::localizedDisplayWithRegion"];
}

- (AFOutputVoiceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFOutputVoiceDescriptor::localizedDisplay"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFOutputVoiceDescriptor::localizedDisplayWithRegion"];

  v7 = [(AFOutputVoiceDescriptor *)self initWithLocalizedDisplay:v5 localizedDisplayWithRegion:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFOutputVoiceDescriptor *)a3;
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
      v6 = [(AFOutputVoiceDescriptor *)v5 localizedDisplay];
      localizedDisplay = self->_localizedDisplay;
      if (localizedDisplay == v6 || [(NSString *)localizedDisplay isEqual:v6])
      {
        v8 = [(AFOutputVoiceDescriptor *)v5 localizedDisplayWithRegion];
        localizedDisplayWithRegion = self->_localizedDisplayWithRegion;
        BOOL v10 = localizedDisplayWithRegion == v8
           || [(NSString *)localizedDisplayWithRegion isEqual:v8];
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
  NSUInteger v3 = [(NSString *)self->_localizedDisplay hash];
  return [(NSString *)self->_localizedDisplayWithRegion hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFOutputVoiceDescriptor;
  id v5 = [(AFOutputVoiceDescriptor *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {localizedDisplay = %@, localizedDisplayWithRegion = %@}", v5, self->_localizedDisplay, self->_localizedDisplayWithRegion];

  return v6;
}

- (id)description
{
  return [(AFOutputVoiceDescriptor *)self _descriptionWithIndent:0];
}

- (AFOutputVoiceDescriptor)initWithLocalizedDisplay:(id)a3 localizedDisplayWithRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__AFOutputVoiceDescriptor_initWithLocalizedDisplay_localizedDisplayWithRegion___block_invoke;
  v12[3] = &unk_1E59251D8;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  BOOL v10 = [(AFOutputVoiceDescriptor *)self initWithBuilder:v12];

  return v10;
}

void __79__AFOutputVoiceDescriptor_initWithLocalizedDisplay_localizedDisplayWithRegion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLocalizedDisplay:v3];
  [v4 setLocalizedDisplayWithRegion:*(void *)(a1 + 40)];
}

- (AFOutputVoiceDescriptor)init
{
  return [(AFOutputVoiceDescriptor *)self initWithBuilder:0];
}

- (AFOutputVoiceDescriptor)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFOutputVoiceDescriptorMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFOutputVoiceDescriptor;
  id v5 = [(AFOutputVoiceDescriptor *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFOutputVoiceDescriptorMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFOutputVoiceDescriptorMutation *)v7 isDirty])
    {
      id v8 = [(_AFOutputVoiceDescriptorMutation *)v7 getLocalizedDisplay];
      uint64_t v9 = [v8 copy];
      localizedDisplay = v6->_localizedDisplay;
      v6->_localizedDisplay = (NSString *)v9;

      v11 = [(_AFOutputVoiceDescriptorMutation *)v7 getLocalizedDisplayWithRegion];
      uint64_t v12 = [v11 copy];
      localizedDisplayWithRegion = v6->_localizedDisplayWithRegion;
      v6->_localizedDisplayWithRegion = (NSString *)v12;
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
  id v4 = (void (**)(id, _AFOutputVoiceDescriptorMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFOutputVoiceDescriptorMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFOutputVoiceDescriptorMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFOutputVoiceDescriptor);
      id v7 = [(_AFOutputVoiceDescriptorMutation *)v5 getLocalizedDisplay];
      uint64_t v8 = [v7 copy];
      localizedDisplay = v6->_localizedDisplay;
      v6->_localizedDisplay = (NSString *)v8;

      BOOL v10 = [(_AFOutputVoiceDescriptorMutation *)v5 getLocalizedDisplayWithRegion];
      uint64_t v11 = [v10 copy];
      localizedDisplayWithRegion = v6->_localizedDisplayWithRegion;
      v6->_localizedDisplayWithRegion = (NSString *)v11;
    }
    else
    {
      id v6 = (AFOutputVoiceDescriptor *)[(AFOutputVoiceDescriptor *)self copy];
    }
  }
  else
  {
    id v6 = (AFOutputVoiceDescriptor *)[(AFOutputVoiceDescriptor *)self copy];
  }

  return v6;
}

@end