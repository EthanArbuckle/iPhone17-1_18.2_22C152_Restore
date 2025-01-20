@interface _AFOutputVoiceColorDescriptorMutation
- (_AFOutputVoiceColorDescriptorMutation)init;
- (_AFOutputVoiceColorDescriptorMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setAlpha:(float)a3;
- (void)setColorName:(id)a3;
- (void)setHexColor:(id)a3;
- (void)setLocalizedOutputVoice:(id)a3;
- (void)setLocalizedOutputVoiceColor:(id)a3;
@end

@implementation _AFOutputVoiceColorDescriptorMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedOutputVoice, 0);
  objc_storeStrong((id *)&self->_localizedOutputVoiceColor, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_hexColor, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = [AFOutputVoiceColorDescriptor alloc];
    *(float *)&double v6 = self->_alpha;
    uint64_t v4 = [(AFOutputVoiceColorDescriptor *)v5 initWithHexColor:self->_hexColor colorName:self->_colorName alpha:self->_localizedOutputVoiceColor localizedOutputVoiceColor:self->_localizedOutputVoice localizedOutputVoice:v6];
    goto LABEL_5;
  }
  if (*(unsigned char *)&self->_mutationFlags)
  {
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      v8 = self->_hexColor;
    }
    else
    {
      v8 = [(AFOutputVoiceColorDescriptor *)baseModel hexColor];
    }
    v9 = v8;
    if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
    {
      v10 = self->_colorName;
    }
    else
    {
      v10 = [(AFOutputVoiceColorDescriptor *)self->_baseModel colorName];
    }
    v11 = v10;
    if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
    {
      float alpha = self->_alpha;
      if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
        goto LABEL_14;
      }
    }
    else
    {
      [(AFOutputVoiceColorDescriptor *)self->_baseModel alpha];
      float alpha = v12;
      if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
      {
LABEL_14:
        v14 = self->_localizedOutputVoiceColor;
LABEL_17:
        v15 = v14;
        if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
        {
          v16 = self->_localizedOutputVoice;
        }
        else
        {
          v16 = [(AFOutputVoiceColorDescriptor *)self->_baseModel localizedOutputVoice];
        }
        v17 = v16;
        v18 = [AFOutputVoiceColorDescriptor alloc];
        *(float *)&double v19 = alpha;
        v7 = [(AFOutputVoiceColorDescriptor *)v18 initWithHexColor:v9 colorName:v11 alpha:v15 localizedOutputVoiceColor:v17 localizedOutputVoice:v19];

        goto LABEL_21;
      }
    }
    v14 = [(AFOutputVoiceColorDescriptor *)self->_baseModel localizedOutputVoiceColor];
    goto LABEL_17;
  }
  uint64_t v4 = [(AFOutputVoiceColorDescriptor *)baseModel copy];
LABEL_5:
  v7 = (AFOutputVoiceColorDescriptor *)v4;
LABEL_21:
  return v7;
}

- (void)setLocalizedOutputVoice:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (void)setLocalizedOutputVoiceColor:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (void)setAlpha:(float)a3
{
  self->_float alpha = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setColorName:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setHexColor:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_AFOutputVoiceColorDescriptorMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFOutputVoiceColorDescriptorMutation;
  double v6 = [(_AFOutputVoiceColorDescriptorMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_AFOutputVoiceColorDescriptorMutation)init
{
  return [(_AFOutputVoiceColorDescriptorMutation *)self initWithBaseModel:0];
}

@end