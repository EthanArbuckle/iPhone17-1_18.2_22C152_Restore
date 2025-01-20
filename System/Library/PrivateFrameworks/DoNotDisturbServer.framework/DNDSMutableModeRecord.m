@interface DNDSMutableModeRecord
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIdentifier:(id)a3;
- (void)setModeIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSemanticType:(int64_t)a3;
- (void)setSymbolDescriptorImageName:(id)a3;
- (void)setSymbolDescriptorTintColorNames:(id)a3;
- (void)setSymbolDescriptorTintStyle:(unint64_t)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setTintColorName:(id)a3;
- (void)setVisibility:(unint64_t)a3;
@end

@implementation DNDSMutableModeRecord

- (void)setSymbolImageName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  symbolImageName = self->super._symbolImageName;
  self->super._symbolImageName = v4;
  MEMORY[0x1F41817F8](v4, symbolImageName);
}

- (void)setTintColorName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  tintColorName = self->super._tintColorName;
  self->super._tintColorName = v4;
  MEMORY[0x1F41817F8](v4, tintColorName);
}

- (void)setSymbolDescriptorTintStyle:(unint64_t)a3
{
  self->super._symbolDescriptorTintStyle = a3;
}

- (void)setSymbolDescriptorTintColorNames:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  symbolDescriptorTintColorNames = self->super._symbolDescriptorTintColorNames;
  self->super._symbolDescriptorTintColorNames = v4;
  MEMORY[0x1F41817F8](v4, symbolDescriptorTintColorNames);
}

- (void)setSymbolDescriptorImageName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  symbolDescriptorImageName = self->super._symbolDescriptorImageName;
  self->super._symbolDescriptorImageName = v4;
  MEMORY[0x1F41817F8](v4, symbolDescriptorImageName);
}

- (void)setName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  name = self->super._name;
  self->super._name = v4;
  MEMORY[0x1F41817F8](v4, name);
}

- (void)setModeIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  modeIdentifier = self->super._modeIdentifier;
  self->super._modeIdentifier = v4;
  MEMORY[0x1F41817F8](v4, modeIdentifier);
}

- (void)setSemanticType:(int64_t)a3
{
  self->super._semanticType = a3;
}

- (void)setVisibility:(unint64_t)a3
{
  self->super._visibility = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v17 = +[DNDSModeRecord allocWithZone:a3];
  v16 = [(DNDSModeRecord *)self symbolImageName];
  v4 = [(DNDSModeRecord *)self tintColorName];
  unint64_t v5 = [(DNDSModeRecord *)self symbolDescriptorTintStyle];
  v6 = [(DNDSModeRecord *)self symbolDescriptorTintColorNames];
  v7 = [(DNDSModeRecord *)self symbolDescriptorImageName];
  v8 = [(DNDSModeRecord *)self name];
  v9 = [(DNDSModeRecord *)self modeIdentifier];
  int64_t v10 = [(DNDSModeRecord *)self semanticType];
  unint64_t v11 = [(DNDSModeRecord *)self visibility];
  v12 = [(DNDSModeRecord *)self identifier];
  v13 = [(DNDSModeRecord *)self placeholderExcludedPlatforms];
  id v14 = [(DNDSModeRecord *)v17 _initWithSymbolImageName:v16 tintColorName:v4 symbolDescriptorTintStyle:v5 symbolDescriptorTintColorNames:v6 symbolDescriptorImageName:v7 name:v8 modeIdentifier:v9 semanticType:v10 visibility:v11 identifier:v12 placeholderExcludedPlatforms:v13];

  return v14;
}

@end