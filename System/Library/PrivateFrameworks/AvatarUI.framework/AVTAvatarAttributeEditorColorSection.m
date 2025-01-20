@interface AVTAvatarAttributeEditorColorSection
- (AVTAvatarAttributeEditorColorSection)initWithPrimaryItems:(id)a3 extendedItems:(id)a4 colorVariationStore:(id)a5 localizedName:(id)a6 identifier:(id)a7 intendedDestination:(unint64_t)a8 alwaysShowExtended:(BOOL)a9 options:(id)a10;
- (AVTAvatarAttributeEditorSectionOptions)options;
- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker;
- (AVTAvatarColorVariationStore)colorVariationStore;
- (BOOL)alwaysShowExtended;
- (BOOL)shouldDisplaySeparatorBeforeSection:(id)a3;
- (BOOL)shouldDisplayTitle;
- (NSArray)extendedItems;
- (NSArray)primaryItems;
- (NSArray)sections;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedName;
- (UIEdgeInsets)separatorInsets;
- (id)copyWithoutTitle;
- (unint64_t)intendedDestination;
- (void)setIntendedDestination:(unint64_t)a3;
- (void)setLocalizedName:(id)a3;
- (void)setSupplementalPicker:(id)a3;
@end

@implementation AVTAvatarAttributeEditorColorSection

- (AVTAvatarAttributeEditorColorSection)initWithPrimaryItems:(id)a3 extendedItems:(id)a4 colorVariationStore:(id)a5 localizedName:(id)a6 identifier:(id)a7 intendedDestination:(unint64_t)a8 alwaysShowExtended:(BOOL)a9 options:(id)a10
{
  id v31 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  v32.receiver = self;
  v32.super_class = (Class)AVTAvatarAttributeEditorColorSection;
  v21 = [(AVTAvatarAttributeEditorColorSection *)&v32 init];
  if (v21)
  {
    uint64_t v22 = [v31 copy];
    primaryItems = v21->_primaryItems;
    v21->_primaryItems = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    extendedItems = v21->_extendedItems;
    v21->_extendedItems = (NSArray *)v24;

    objc_storeStrong((id *)&v21->_colorVariationStore, a5);
    uint64_t v26 = [v18 copy];
    localizedName = v21->_localizedName;
    v21->_localizedName = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v28;

    v21->_intendedDestination = a8;
    v21->_alwaysShowExtended = a9;
    objc_storeStrong((id *)&v21->_options, a10);
  }

  return v21;
}

- (id)copyWithoutTitle
{
  v3 = [AVTAvatarAttributeEditorColorSection alloc];
  v4 = [(AVTAvatarAttributeEditorColorSection *)self primaryItems];
  v5 = [(AVTAvatarAttributeEditorColorSection *)self extendedItems];
  v6 = [(AVTAvatarAttributeEditorColorSection *)self colorVariationStore];
  v7 = [(AVTAvatarAttributeEditorColorSection *)self identifier];
  unint64_t v8 = [(AVTAvatarAttributeEditorColorSection *)self intendedDestination];
  BOOL v9 = [(AVTAvatarAttributeEditorColorSection *)self alwaysShowExtended];
  v10 = [(AVTAvatarAttributeEditorColorSection *)self options];
  LOBYTE(v13) = v9;
  v11 = [(AVTAvatarAttributeEditorColorSection *)v3 initWithPrimaryItems:v4 extendedItems:v5 colorVariationStore:v6 localizedName:&stru_26BF058D0 identifier:v7 intendedDestination:v8 alwaysShowExtended:v13 options:v10];

  return v11;
}

- (NSString)description
{
  v16.receiver = self;
  v16.super_class = (Class)AVTAvatarAttributeEditorColorSection;
  v3 = [(AVTAvatarAttributeEditorColorSection *)&v16 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTAvatarAttributeEditorColorSection *)self localizedName];
  v6 = [(AVTAvatarAttributeEditorColorSection *)self identifier];
  v7 = [(AVTAvatarAttributeEditorColorSection *)self primaryItems];
  unint64_t v8 = objc_msgSend(v7, "avt_description");
  [v4 appendFormat:@" name: %@, identifier: %@, sectionItems: %@", v5, v6, v8];

  BOOL v9 = [(AVTAvatarAttributeEditorColorSection *)self supplementalPicker];

  if (v9)
  {
    v10 = [(AVTAvatarAttributeEditorColorSection *)self supplementalPicker];
    v11 = [v10 localizedTitle];
    [v4 appendFormat:@", supplemental picker: %@", v11];
  }
  v12 = [(AVTAvatarAttributeEditorColorSection *)self options];

  if (v12)
  {
    uint64_t v13 = [(AVTAvatarAttributeEditorColorSection *)self options];
    [v4 appendFormat:@", options: %@", v13];
  }
  v14 = (void *)[v4 copy];

  return (NSString *)v14;
}

- (BOOL)shouldDisplayTitle
{
  v3 = [(AVTAvatarAttributeEditorColorSection *)self localizedName];
  if (v3)
  {
    v4 = [(AVTAvatarAttributeEditorColorSection *)self localizedName];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldDisplaySeparatorBeforeSection:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && ([v3 conformsToProtocol:&unk_26BF7A790] & 1) == 0) {
    char v5 = [v4 shouldDisplayTitle];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)separatorInsets
{
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NSArray)sections
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self;
  double v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker
{
  return self->_supplementalPicker;
}

- (void)setSupplementalPicker:(id)a3
{
}

- (AVTAvatarAttributeEditorSectionOptions)options
{
  return self->_options;
}

- (unint64_t)intendedDestination
{
  return self->_intendedDestination;
}

- (void)setIntendedDestination:(unint64_t)a3
{
  self->_intendedDestination = a3;
}

- (NSArray)primaryItems
{
  return self->_primaryItems;
}

- (NSArray)extendedItems
{
  return self->_extendedItems;
}

- (AVTAvatarColorVariationStore)colorVariationStore
{
  return self->_colorVariationStore;
}

- (BOOL)alwaysShowExtended
{
  return self->_alwaysShowExtended;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorVariationStore, 0);
  objc_storeStrong((id *)&self->_extendedItems, 0);
  objc_storeStrong((id *)&self->_primaryItems, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_supplementalPicker, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end