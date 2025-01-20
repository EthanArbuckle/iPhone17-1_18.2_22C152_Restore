@interface ISImageStyleDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)defaultStyleDescriptor;
- (BOOL)selectedVariant;
- (BOOL)templateVariant;
- (IFColor)tintColor;
- (ISImageStyleDescriptor)initWithCoder:(id)a3;
- (NSUUID)digest;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedVariant:(BOOL)a3;
- (void)setTemplateVariant:(BOOL)a3;
- (void)setTintColor:(id)a3;
@end

@implementation ISImageStyleDescriptor

+ (id)defaultStyleDescriptor
{
  if (defaultStyleDescriptor_onceToken != -1) {
    dispatch_once(&defaultStyleDescriptor_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)defaultStyleDescriptor_defaultStyleDescriptor;
  return v2;
}

uint64_t __48__ISImageStyleDescriptor_defaultStyleDescriptor__block_invoke()
{
  defaultStyleDescriptor_defaultStyleDescriptor = objc_alloc_init(ISImageStyleDescriptor);
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISImageStyleDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISImageStyleDescriptor;
  v5 = [(ISImageStyleDescriptor *)&v9 init];
  if (v5)
  {
    v5->_templateVariant = [v4 decodeBoolForKey:@"templateVariant"];
    v5->_selectedVariant = [v4 decodeBoolForKey:@"selectedVariant"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    tintColor = v5->_tintColor;
    v5->_tintColor = (IFColor *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL selectedVariant = self->_selectedVariant;
  id v5 = a3;
  [v5 encodeBool:selectedVariant forKey:@"selectedVariant"];
  [v5 encodeBool:self->_templateVariant forKey:@"templateVariant"];
  [v5 encodeObject:self->_tintColor forKey:@"tintColor"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setSelectedVariant:self->_selectedVariant];
  [v4 setTemplateVariant:self->_templateVariant];
  return v4;
}

- (NSUUID)digest
{
  v11[2] = *MEMORY[0x1E4F143B8];
  __int16 v10 = *(_WORD *)&self->_templateVariant;
  v3 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithBytes:size:", &v10, 2);
  tintColor = self->_tintColor;
  if (tintColor)
  {
    id v5 = (void *)MEMORY[0x1E4F29128];
    uint64_t v6 = [(IFColor *)tintColor digest];
    v11[0] = v6;
    v11[1] = v3;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    uint64_t v8 = objc_msgSend(v5, "_IF_UUIDByXORingUUIDs:", v7);

    v3 = (void *)v8;
  }
  return (NSUUID *)v3;
}

- (BOOL)templateVariant
{
  return self->_templateVariant;
}

- (void)setTemplateVariant:(BOOL)a3
{
  self->_templateVariant = a3;
}

- (BOOL)selectedVariant
{
  return self->_selectedVariant;
}

- (void)setSelectedVariant:(BOOL)a3
{
  self->_BOOL selectedVariant = a3;
}

- (IFColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end