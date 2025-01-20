@interface TTRISettingsDefaultListPickerViewModel_List
- (NSString)name;
- (NSString)subtitle;
- (REMObjectID)listID;
- (TTRISettingsDefaultListPickerViewModel_List)initWithList:(id)a3;
- (void)setListID:(id)a3;
- (void)setName:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation TTRISettingsDefaultListPickerViewModel_List

- (TTRISettingsDefaultListPickerViewModel_List)initWithList:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TTRISettingsDefaultListPickerViewModel_List;
  v5 = [(TTRISettingsDefaultListPickerViewModel_List *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectID];
    [(TTRISettingsDefaultListPickerViewModel_List *)v5 setListID:v6];

    v7 = [v4 sharingStatusText];
    [(TTRISettingsDefaultListPickerViewModel_List *)v5 setSubtitle:v7];

    v8 = [v4 displayName];
    [(TTRISettingsDefaultListPickerViewModel_List *)v5 setName:v8];
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void)setListID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listID, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end