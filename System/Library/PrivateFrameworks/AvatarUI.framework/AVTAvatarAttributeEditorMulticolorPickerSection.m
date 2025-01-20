@interface AVTAvatarAttributeEditorMulticolorPickerSection
- (AVTAvatarAttributeEditorMulticolorPickerSection)initWithIdentifier:(id)a3 localizedName:(id)a4 items:(id)a5;
- (AVTAvatarAttributeEditorSectionOptions)options;
- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker;
- (BOOL)shouldDisplaySeparatorBeforeSection:(id)a3;
- (BOOL)shouldDisplayTitle;
- (NSArray)items;
- (NSArray)sectionItems;
- (NSArray)sections;
- (NSString)identifier;
- (NSString)localizedName;
- (UIEdgeInsets)separatorInsets;
- (unint64_t)intendedDestination;
- (void)setIntendedDestination:(unint64_t)a3;
- (void)setLocalizedName:(id)a3;
- (void)setSupplementalPicker:(id)a3;
@end

@implementation AVTAvatarAttributeEditorMulticolorPickerSection

- (AVTAvatarAttributeEditorMulticolorPickerSection)initWithIdentifier:(id)a3 localizedName:(id)a4 items:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerSection;
  v12 = [(AVTAvatarAttributeEditorMulticolorPickerSection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_items, a5);
    objc_storeStrong((id *)&v13->_localizedName, a4);
    objc_storeStrong((id *)&v13->_sectionItems, a5);
    objc_storeStrong((id *)&v13->_identifier, a3);
    v13->_intendedDestination = 0;
  }

  return v13;
}

- (BOOL)shouldDisplayTitle
{
  v3 = [(AVTAvatarAttributeEditorMulticolorPickerSection *)self localizedName];
  if (v3)
  {
    v4 = [(AVTAvatarAttributeEditorMulticolorPickerSection *)self localizedName];
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
  return 0;
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

- (NSArray)sectionItems
{
  return self->_sectionItems;
}

- (NSString)identifier
{
  return self->_identifier;
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

- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker
{
  return self->_supplementalPicker;
}

- (void)setSupplementalPicker:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_supplementalPicker, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sectionItems, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end