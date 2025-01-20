@interface AVTPresetResources
- (AVTPreset)preset;
- (AVTPresetResources)initWithPreset:(id)a3;
- (BOOL)requiresEncryption;
- (NSString)presetIdentifier;
- (id)resources;
- (id)volatileIdentifierForScope:(id)a3;
- (unint64_t)costForScope:(id)a3;
@end

@implementation AVTPresetResources

- (AVTPresetResources)initWithPreset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTPresetResources;
  v6 = [(AVTPresetResources *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_preset, a3);
  }

  return v7;
}

- (NSString)presetIdentifier
{
  v2 = [(AVTPresetResources *)self preset];
  v3 = [v2 identifier];
  v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (id)resources
{
  v2 = [(AVTPresetResources *)self preset];
  v3 = (void *)[v2 cache];

  return v3;
}

- (id)volatileIdentifierForScope:(id)a3
{
  v4 = NSString;
  id v5 = [(AVTPresetResources *)self preset];
  uint64_t v6 = [v5 category];
  v7 = [(AVTPresetResources *)self preset];
  v8 = [v7 identifier];
  objc_super v9 = [v4 stringWithFormat:@"%ld_%@", v6, v8];

  return v9;
}

- (unint64_t)costForScope:(id)a3
{
  return 1;
}

- (BOOL)requiresEncryption
{
  return 1;
}

- (AVTPreset)preset
{
  return self->_preset;
}

- (void).cxx_destruct
{
}

@end