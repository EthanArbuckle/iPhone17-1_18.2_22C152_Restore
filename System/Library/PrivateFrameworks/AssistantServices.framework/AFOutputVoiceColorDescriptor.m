@interface AFOutputVoiceColorDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFOutputVoiceColorDescriptor)initWithCoder:(id)a3;
- (AFOutputVoiceColorDescriptor)initWithHexColor:(id)a3 colorName:(id)a4 alpha:(float)a5 localizedOutputVoiceColor:(id)a6 localizedOutputVoice:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSString)colorName;
- (NSString)hexColor;
- (NSString)localizedOutputVoice;
- (NSString)localizedOutputVoiceColor;
- (float)alpha;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFOutputVoiceColorDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedOutputVoice, 0);
  objc_storeStrong((id *)&self->_localizedOutputVoiceColor, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_hexColor, 0);
}

- (NSString)localizedOutputVoice
{
  return self->_localizedOutputVoice;
}

- (NSString)localizedOutputVoiceColor
{
  return self->_localizedOutputVoiceColor;
}

- (float)alpha
{
  return self->_alpha;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSString)hexColor
{
  return self->_hexColor;
}

- (void)encodeWithCoder:(id)a3
{
  hexColor = self->_hexColor;
  id v7 = a3;
  [v7 encodeObject:hexColor forKey:@"AFOutputVoiceColorDescriptor::hexColor"];
  [v7 encodeObject:self->_colorName forKey:@"AFOutputVoiceColorDescriptor::colorName"];
  *(float *)&double v5 = self->_alpha;
  v6 = [MEMORY[0x1E4F28ED0] numberWithFloat:v5];
  [v7 encodeObject:v6 forKey:@"AFOutputVoiceColorDescriptor::alpha"];

  [v7 encodeObject:self->_localizedOutputVoiceColor forKey:@"AFOutputVoiceColorDescriptor::localizedOutputVoiceColor"];
  [v7 encodeObject:self->_localizedOutputVoice forKey:@"AFOutputVoiceColorDescriptor::localizedOutputVoice"];
}

- (AFOutputVoiceColorDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFOutputVoiceColorDescriptor::hexColor"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFOutputVoiceColorDescriptor::colorName"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFOutputVoiceColorDescriptor::alpha"];
  [v7 floatValue];
  int v9 = v8;

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFOutputVoiceColorDescriptor::localizedOutputVoiceColor"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFOutputVoiceColorDescriptor::localizedOutputVoice"];

  LODWORD(v12) = v9;
  v13 = [(AFOutputVoiceColorDescriptor *)self initWithHexColor:v5 colorName:v6 alpha:v10 localizedOutputVoiceColor:v11 localizedOutputVoice:v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFOutputVoiceColorDescriptor *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      float alpha = self->_alpha;
      [(AFOutputVoiceColorDescriptor *)v5 alpha];
      if (alpha == v7)
      {
        int v9 = [(AFOutputVoiceColorDescriptor *)v5 hexColor];
        hexColor = self->_hexColor;
        if (hexColor == v9 || [(NSString *)hexColor isEqual:v9])
        {
          v11 = [(AFOutputVoiceColorDescriptor *)v5 colorName];
          colorName = self->_colorName;
          if (colorName == v11 || [(NSString *)colorName isEqual:v11])
          {
            v13 = [(AFOutputVoiceColorDescriptor *)v5 localizedOutputVoiceColor];
            localizedOutputVoiceColor = self->_localizedOutputVoiceColor;
            if (localizedOutputVoiceColor == v13
              || [(NSString *)localizedOutputVoiceColor isEqual:v13])
            {
              v15 = [(AFOutputVoiceColorDescriptor *)v5 localizedOutputVoice];
              localizedOutputVoice = self->_localizedOutputVoice;
              BOOL v8 = localizedOutputVoice == v15
                || [(NSString *)localizedOutputVoice isEqual:v15];
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
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_hexColor hash];
  NSUInteger v4 = [(NSString *)self->_colorName hash] ^ v3;
  *(float *)&double v5 = self->_alpha;
  v6 = [MEMORY[0x1E4F28ED0] numberWithFloat:v5];
  uint64_t v7 = [v6 hash];
  NSUInteger v8 = v4 ^ [(NSString *)self->_localizedOutputVoiceColor hash] ^ v7;
  NSUInteger v9 = v8 ^ [(NSString *)self->_localizedOutputVoice hash];

  return v9;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v27[5] = *MEMORY[0x1E4F143B8];
  id v23 = [NSString alloc];
  v26.receiver = self;
  v26.super_class = (Class)AFOutputVoiceColorDescriptor;
  NSUInteger v4 = [(AFOutputVoiceColorDescriptor *)&v26 description];
  id v5 = [NSString alloc];
  v25 = [(NSString *)self->_hexColor description];
  v24 = (void *)[v5 initWithFormat:@"hexColor = %@", v25];
  v27[0] = v24;
  id v6 = [NSString alloc];
  v22 = [(NSString *)self->_colorName description];
  v21 = (void *)[v6 initWithFormat:@"colorName = %@", v22];
  v27[1] = v21;
  id v7 = [NSString alloc];
  *(float *)&double v8 = self->_alpha;
  NSUInteger v9 = [MEMORY[0x1E4F28ED0] numberWithFloat:v8];
  v10 = (void *)[v7 initWithFormat:@"float alpha = %@", v9];
  v27[2] = v10;
  id v11 = [NSString alloc];
  double v12 = [(NSString *)self->_localizedOutputVoiceColor description];
  v13 = (void *)[v11 initWithFormat:@"localizedOutputVoiceColor = %@", v12];
  v27[3] = v13;
  id v14 = [NSString alloc];
  v15 = [(NSString *)self->_localizedOutputVoice description];
  v16 = (void *)[v14 initWithFormat:@"localizedOutputVoice = %@", v15];
  v27[4] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
  v18 = [v17 componentsJoinedByString:@", "];
  v19 = (void *)[v23 initWithFormat:@"%@ {%@}", v4, v18];

  return v19;
}

- (id)description
{
  return [(AFOutputVoiceColorDescriptor *)self _descriptionWithIndent:0];
}

- (AFOutputVoiceColorDescriptor)initWithHexColor:(id)a3 colorName:(id)a4 alpha:(float)a5 localizedOutputVoiceColor:(id)a6 localizedOutputVoice:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)AFOutputVoiceColorDescriptor;
  v16 = [(AFOutputVoiceColorDescriptor *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    hexColor = v16->_hexColor;
    v16->_hexColor = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    colorName = v16->_colorName;
    v16->_colorName = (NSString *)v19;

    v16->_float alpha = a5;
    uint64_t v21 = [v14 copy];
    localizedOutputVoiceColor = v16->_localizedOutputVoiceColor;
    v16->_localizedOutputVoiceColor = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    localizedOutputVoice = v16->_localizedOutputVoice;
    v16->_localizedOutputVoice = (NSString *)v23;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  NSUInteger v4 = (void (**)(id, _AFOutputVoiceColorDescriptorMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFOutputVoiceColorDescriptorMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    id v6 = [(_AFOutputVoiceColorDescriptorMutation *)v5 generate];
  }
  else
  {
    id v6 = (void *)[(AFOutputVoiceColorDescriptor *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  NSUInteger v3 = (void (**)(id, _AFOutputVoiceColorDescriptorMutation *))a3;
  NSUInteger v4 = objc_alloc_init(_AFOutputVoiceColorDescriptorMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = [(_AFOutputVoiceColorDescriptorMutation *)v4 generate];

  return v5;
}

@end