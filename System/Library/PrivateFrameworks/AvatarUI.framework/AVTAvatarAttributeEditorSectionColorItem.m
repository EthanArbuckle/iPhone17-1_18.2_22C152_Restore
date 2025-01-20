@interface AVTAvatarAttributeEditorSectionColorItem
- (AVTAvatarAttributeEditorSectionColorItem)initWithColor:(id)a3 imageProvider:(id)a4 colorLayerProvider:(id)a5 avatarUpdater:(id)a6 derivedColorDependent:(BOOL)a7 selected:(BOOL)a8;
- (AVTAvatarAttributeEditorSectionColorItem)initWithColor:(id)a3 skinColor:(id)a4 imageProvider:(id)a5 colorLayerProvider:(id)a6 avatarUpdater:(id)a7 derivedColorDependent:(BOOL)a8 selected:(BOOL)a9;
- (AVTColorPreset)skinColor;
- (AVTCoreModelColor)color;
- (BOOL)hasDerivedColorDependency;
- (BOOL)isSelected;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedName;
- (id)avatarUpdater;
- (id)colorPreset;
- (id)gradientProvider;
- (id)layerContentProvider;
- (void)setHasDerivedColorDependency:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation AVTAvatarAttributeEditorSectionColorItem

- (AVTAvatarAttributeEditorSectionColorItem)initWithColor:(id)a3 imageProvider:(id)a4 colorLayerProvider:(id)a5 avatarUpdater:(id)a6 derivedColorDependent:(BOOL)a7 selected:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(AVTAvatarAttributeEditorSectionColorItem *)self initWithColor:a3 skinColor:0 imageProvider:a4 colorLayerProvider:a5 avatarUpdater:a6 derivedColorDependent:a7 selected:v9];
}

- (AVTAvatarAttributeEditorSectionColorItem)initWithColor:(id)a3 skinColor:(id)a4 imageProvider:(id)a5 colorLayerProvider:(id)a6 avatarUpdater:(id)a7 derivedColorDependent:(BOOL)a8 selected:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a6;
  v19 = [v18 providerForColorIntoLayer];
  v20 = [v18 providerForGradientFromColor];

  v34.receiver = self;
  v34.super_class = (Class)AVTAvatarAttributeEditorSectionColorItem;
  v21 = [(AVTAvatarAttributeEditorSectionColorItem *)&v34 init];
  if (v21)
  {
    uint64_t v22 = [v15 identifier];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v24 = [v15 localizedName];
    uint64_t v25 = [v24 copy];
    localizedName = v21->_localizedName;
    v21->_localizedName = (NSString *)v25;

    uint64_t v27 = [v19 copy];
    id layerContentProvider = v21->_layerContentProvider;
    v21->_id layerContentProvider = (id)v27;

    uint64_t v29 = [v20 copy];
    id gradientProvider = v21->_gradientProvider;
    v21->_id gradientProvider = (id)v29;

    objc_storeStrong((id *)&v21->_color, a3);
    objc_storeStrong((id *)&v21->_skinColor, a4);
    uint64_t v31 = [v17 copy];
    id avatarUpdater = v21->_avatarUpdater;
    v21->_id avatarUpdater = (id)v31;

    v21->_hasDerivedColorDependency = a8;
    v21->_selected = a9;
  }

  return v21;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarAttributeEditorSectionColorItem;
  v3 = [(AVTAvatarAttributeEditorSectionColorItem *)&v8 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTAvatarAttributeEditorSectionColorItem *)self localizedName];
  [v4 appendFormat:@" color name: %@", v5];

  if ([(AVTAvatarAttributeEditorSectionColorItem *)self isSelected]) {
    [v4 appendString:@" SELECTED"];
  }
  v6 = (void *)[v4 copy];

  return (NSString *)v6;
}

- (id)colorPreset
{
  v2 = [(AVTAvatarAttributeEditorSectionColorItem *)self color];
  v3 = [v2 baseColorPreset];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)avatarUpdater
{
  return self->_avatarUpdater;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (AVTCoreModelColor)color
{
  return self->_color;
}

- (id)layerContentProvider
{
  return self->_layerContentProvider;
}

- (id)gradientProvider
{
  return self->_gradientProvider;
}

- (AVTColorPreset)skinColor
{
  return self->_skinColor;
}

- (BOOL)hasDerivedColorDependency
{
  return self->_hasDerivedColorDependency;
}

- (void)setHasDerivedColorDependency:(BOOL)a3
{
  self->_hasDerivedColorDependency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skinColor, 0);
  objc_storeStrong(&self->_gradientProvider, 0);
  objc_storeStrong(&self->_layerContentProvider, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong(&self->_avatarUpdater, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end