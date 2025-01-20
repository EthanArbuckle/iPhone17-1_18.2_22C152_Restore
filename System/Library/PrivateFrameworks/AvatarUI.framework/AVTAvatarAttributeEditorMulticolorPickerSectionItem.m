@interface AVTAvatarAttributeEditorMulticolorPickerSectionItem
- (AVTAvatarAttributeEditorMulticolorPickerSectionItem)initWithIdentifier:(id)a3 localizedName:(id)a4 isPlaceholder:(BOOL)a5 isRemovable:(BOOL)a6 colorItem:(id)a7 variationStore:(id)a8 avatarUpdater:(id)a9 editorStateUpdater:(id)a10 removalUpdater:(id)a11;
- (AVTAvatarAttributeEditorSectionColorItem)colorItem;
- (AVTAvatarColorVariationStore)variationStore;
- (BOOL)isPlaceholder;
- (BOOL)isRemovable;
- (BOOL)isSelected;
- (NSString)identifier;
- (NSString)localizedName;
- (id)avatarUpdater;
- (id)editorStateUpdater;
- (id)removalUpdater;
- (void)setSelected:(BOOL)a3;
@end

@implementation AVTAvatarAttributeEditorMulticolorPickerSectionItem

- (AVTAvatarAttributeEditorMulticolorPickerSectionItem)initWithIdentifier:(id)a3 localizedName:(id)a4 isPlaceholder:(BOOL)a5 isRemovable:(BOOL)a6 colorItem:(id)a7 variationStore:(id)a8 avatarUpdater:(id)a9 editorStateUpdater:(id)a10 removalUpdater:(id)a11
{
  id v35 = a3;
  id v18 = a4;
  id v34 = a7;
  id v33 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  v36.receiver = self;
  v36.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerSectionItem;
  v22 = [(AVTAvatarAttributeEditorMulticolorPickerSectionItem *)&v36 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_identifier, a3);
    uint64_t v24 = [v18 copy];
    localizedName = v23->_localizedName;
    v23->_localizedName = (NSString *)v24;

    v23->_isPlaceholder = a5;
    v23->_isRemovable = a6;
    objc_storeStrong((id *)&v23->_colorItem, a7);
    objc_storeStrong((id *)&v23->_variationStore, a8);
    uint64_t v26 = [v19 copy];
    id avatarUpdater = v23->_avatarUpdater;
    v23->_id avatarUpdater = (id)v26;

    uint64_t v28 = [v20 copy];
    id editorStateUpdater = v23->_editorStateUpdater;
    v23->_id editorStateUpdater = (id)v28;

    uint64_t v30 = [v21 copy];
    id removalUpdater = v23->_removalUpdater;
    v23->_id removalUpdater = (id)v30;
  }
  return v23;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (id)editorStateUpdater
{
  return self->_editorStateUpdater;
}

- (id)avatarUpdater
{
  return self->_avatarUpdater;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isRemovable
{
  return self->_isRemovable;
}

- (id)removalUpdater
{
  return self->_removalUpdater;
}

- (AVTAvatarAttributeEditorSectionColorItem)colorItem
{
  return self->_colorItem;
}

- (AVTAvatarColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationStore, 0);
  objc_storeStrong((id *)&self->_colorItem, 0);
  objc_storeStrong(&self->_removalUpdater, 0);
  objc_storeStrong(&self->_avatarUpdater, 0);
  objc_storeStrong(&self->_editorStateUpdater, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end