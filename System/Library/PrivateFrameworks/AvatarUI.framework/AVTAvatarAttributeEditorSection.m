@interface AVTAvatarAttributeEditorSection
- (AVTAvatarAttributeEditorSection)initWithSectionItems:(id)a3 localizedName:(id)a4 identifier:(id)a5 intendedDestination:(unint64_t)a6 options:(id)a7;
- (AVTAvatarAttributeEditorSectionOptions)options;
- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker;
- (BOOL)shouldDisplayInsetSeparatorAfterSection;
- (BOOL)shouldDisplaySeparatorBeforeSection:(id)a3;
- (BOOL)shouldDisplayTitle;
- (NSArray)sectionItems;
- (NSArray)sections;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedName;
- (UIEdgeInsets)separatorInsets;
- (unint64_t)intendedDestination;
- (void)setIntendedDestination:(unint64_t)a3;
- (void)setLocalizedName:(id)a3;
- (void)setShouldDisplayInsetSeparatorAfterSection:(BOOL)a3;
- (void)setSupplementalPicker:(id)a3;
@end

@implementation AVTAvatarAttributeEditorSection

- (AVTAvatarAttributeEditorSection)initWithSectionItems:(id)a3 localizedName:(id)a4 identifier:(id)a5 intendedDestination:(unint64_t)a6 options:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AVTAvatarAttributeEditorSection;
  v16 = [(AVTAvatarAttributeEditorSection *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    sectionItems = v16->_sectionItems;
    v16->_sectionItems = (NSArray *)v17;

    uint64_t v19 = [v13 copy];
    localizedName = v16->_localizedName;
    v16->_localizedName = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v21;

    objc_storeStrong((id *)&v16->_options, a7);
    v16->_intendedDestination = a6;
  }

  return v16;
}

- (NSString)description
{
  v16.receiver = self;
  v16.super_class = (Class)AVTAvatarAttributeEditorSection;
  v3 = [(AVTAvatarAttributeEditorSection *)&v16 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTAvatarAttributeEditorSection *)self localizedName];
  v6 = [(AVTAvatarAttributeEditorSection *)self identifier];
  v7 = [(AVTAvatarAttributeEditorSection *)self sectionItems];
  v8 = objc_msgSend(v7, "avt_description");
  [v4 appendFormat:@" name: %@, identifier: %@, sectionItems: %@", v5, v6, v8];

  v9 = [(AVTAvatarAttributeEditorSection *)self supplementalPicker];

  if (v9)
  {
    v10 = [(AVTAvatarAttributeEditorSection *)self supplementalPicker];
    v11 = [v10 localizedTitle];
    [v4 appendFormat:@", supplemental picker: %@", v11];
  }
  id v12 = [(AVTAvatarAttributeEditorSection *)self options];

  if (v12)
  {
    id v13 = [(AVTAvatarAttributeEditorSection *)self options];
    [v4 appendFormat:@", options: %@", v13];
  }
  id v14 = (void *)[v4 copy];

  return (NSString *)v14;
}

- (BOOL)shouldDisplayTitle
{
  v3 = [(AVTAvatarAttributeEditorSection *)self localizedName];
  if (v3)
  {
    v4 = [(AVTAvatarAttributeEditorSection *)self localizedName];
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
  id v4 = a3;
  if ([(AVTAvatarAttributeEditorSection *)self shouldDisplayInsetSeparatorAfterSection])
  {
    char v5 = 1;
  }
  else if (v4)
  {
    char v5 = [v4 shouldDisplayTitle];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)separatorInsets
{
  if ([(AVTAvatarAttributeEditorSection *)self shouldDisplayInsetSeparatorAfterSection])
  {
    double v2 = 0.0;
    double v3 = 20.0;
    double v4 = 0.0;
    double v5 = 20.0;
  }
  else
  {
    double v2 = *MEMORY[0x263F1D1C0];
    double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
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

- (NSArray)sectionItems
{
  return self->_sectionItems;
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

- (BOOL)shouldDisplayInsetSeparatorAfterSection
{
  return self->_shouldDisplayInsetSeparatorAfterSection;
}

- (void)setShouldDisplayInsetSeparatorAfterSection:(BOOL)a3
{
  self->_shouldDisplayInsetSeparatorAfterSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_supplementalPicker, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_sectionItems, 0);
}

@end