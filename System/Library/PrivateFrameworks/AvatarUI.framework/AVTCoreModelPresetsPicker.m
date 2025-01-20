@interface AVTCoreModelPresetsPicker
- (AVTCoreModelPairing)pairing;
- (AVTCoreModelPickerOptions)options;
- (AVTCoreModelPresetsPicker)initWithTitle:(id)a3 representedTags:(id)a4 pairing:(id)a5 options:(id)a6;
- (AVTCoreModelPresetsPicker)initWithTitle:(id)a3 representedTags:(id)a4 pairing:(id)a5 options:(id)a6 identifier:(id)a7;
- (NSOrderedSet)representedTags;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
@end

@implementation AVTCoreModelPresetsPicker

- (AVTCoreModelPresetsPicker)initWithTitle:(id)a3 representedTags:(id)a4 pairing:(id)a5 options:(id)a6
{
  v10 = (void *)MEMORY[0x263F08C38];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v10 UUID];
  v16 = [v15 UUIDString];
  v17 = [(AVTCoreModelPresetsPicker *)self initWithTitle:v14 representedTags:v13 pairing:v12 options:v11 identifier:v16];

  return v17;
}

- (AVTCoreModelPresetsPicker)initWithTitle:(id)a3 representedTags:(id)a4 pairing:(id)a5 options:(id)a6 identifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)AVTCoreModelPresetsPicker;
  v17 = [(AVTCoreModelPresetsPicker *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    title = v17->_title;
    v17->_title = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    representedTags = v17->_representedTags;
    v17->_representedTags = (NSOrderedSet *)v20;

    objc_storeStrong((id *)&v17->_pairing, a5);
    objc_storeStrong((id *)&v17->_options, a6);
    uint64_t v22 = [v16 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v22;
  }
  return v17;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)AVTCoreModelPresetsPicker;
  v3 = [(AVTCoreModelPresetsPicker *)&v10 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTCoreModelPresetsPicker *)self identifier];
  [v4 appendFormat:@" identifier: %@\n", v5];

  v6 = [(AVTCoreModelPresetsPicker *)self title];
  [v4 appendFormat:@" title: %@\n", v6];

  v7 = [(AVTCoreModelPresetsPicker *)self representedTags];
  [v4 appendFormat:@" tags: %@\n", v7];

  v8 = (void *)[v4 copy];
  return (NSString *)v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (AVTCoreModelPickerOptions)options
{
  return self->_options;
}

- (AVTCoreModelPairing)pairing
{
  return self->_pairing;
}

- (NSOrderedSet)representedTags
{
  return self->_representedTags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedTags, 0);
  objc_storeStrong((id *)&self->_pairing, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end