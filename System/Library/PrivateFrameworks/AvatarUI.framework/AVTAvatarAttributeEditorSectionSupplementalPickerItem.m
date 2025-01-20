@interface AVTAvatarAttributeEditorSectionSupplementalPickerItem
- (AVTAvatarAttributeEditorSectionSupplementalPickerItem)initWithLocalizedName:(id)a3 localizedDescription:(id)a4 avatarUpdater:(id)a5 editorUpdater:(id)a6 selected:(BOOL)a7;
- (BOOL)isSelected;
- (NSString)localizedDescription;
- (NSString)localizedName;
- (id)avatarUpdater;
- (id)editorUpdater;
- (void)setSelected:(BOOL)a3;
@end

@implementation AVTAvatarAttributeEditorSectionSupplementalPickerItem

- (AVTAvatarAttributeEditorSectionSupplementalPickerItem)initWithLocalizedName:(id)a3 localizedDescription:(id)a4 avatarUpdater:(id)a5 editorUpdater:(id)a6 selected:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)AVTAvatarAttributeEditorSectionSupplementalPickerItem;
  v17 = [(AVTAvatarAttributeEditorSectionSupplementalPickerItem *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_localizedName, a3);
    uint64_t v19 = MEMORY[0x210530210](v15);
    id avatarUpdater = v18->_avatarUpdater;
    v18->_id avatarUpdater = (id)v19;

    uint64_t v21 = MEMORY[0x210530210](v16);
    id editorUpdater = v18->_editorUpdater;
    v18->_id editorUpdater = (id)v21;

    objc_storeStrong((id *)&v18->_localizedDescription, a4);
    v18->_selected = a7;
  }

  return v18;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)avatarUpdater
{
  return self->_avatarUpdater;
}

- (id)editorUpdater
{
  return self->_editorUpdater;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong(&self->_editorUpdater, 0);
  objc_storeStrong(&self->_avatarUpdater, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end