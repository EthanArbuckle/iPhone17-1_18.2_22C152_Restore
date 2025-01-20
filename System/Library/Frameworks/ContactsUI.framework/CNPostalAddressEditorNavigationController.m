@interface CNPostalAddressEditorNavigationController
- (CNPostalAddressEditorDelegate)addressEditorDelegate;
- (CNPostalAddressEditorNavigationController)initWithContact:(id)a3 propertyKey:(id)a4 editNames:(BOOL)a5;
- (CNPostalAddressEditorNavigationController)initWithFirstName:(id)a3 lastName:(id)a4 addressDictionary:(id)a5 label:(id)a6;
- (CNPostalAddressEditorNavigationController)initWithPropertyKey:(id)a3 label:(id)a4;
- (void)doneWithContact:(id)a3 propertyKey:(id)a4;
- (void)setAddressEditorDelegate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CNPostalAddressEditorNavigationController

- (void).cxx_destruct
{
}

- (void)setAddressEditorDelegate:(id)a3
{
}

- (CNPostalAddressEditorDelegate)addressEditorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addressEditorDelegate);

  return (CNPostalAddressEditorDelegate *)WeakRetained;
}

- (void)doneWithContact:(id)a3 propertyKey:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [(CNPostalAddressEditorNavigationController *)self addressEditorDelegate];
  if (objc_opt_respondsToSelector())
  {
    v8 = [MEMORY[0x1E4F1B898] contactPropertiesByKey];
    v9 = [v8 objectForKeyedSubscript:v6];

    if ([v9 isMultiValue])
    {
      v10 = [v9 CNValueForContact:v14];
      v11 = [v10 lastObject];

      v12 = [v11 identifier];
    }
    else
    {
      v12 = 0;
    }
    v13 = [MEMORY[0x1E4F1B970] contactPropertyWithContact:v14 propertyKey:v6 identifier:v12];
    [v7 postalAddressEditor:self finishedEditingProperty:v13];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v7 postalAddressEditor:self finishedEditingContact:v14];
  }
}

- (void)setTitle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNPostalAddressEditorNavigationController;
  id v4 = a3;
  [(CNPostalAddressEditorNavigationController *)&v6 setTitle:v4];
  v5 = [(CNPostalAddressEditorNavigationController *)self topViewController];
  [v5 setTitle:v4];
}

- (CNPostalAddressEditorNavigationController)initWithFirstName:(id)a3 lastName:(id)a4 addressDictionary:(id)a5 label:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v10 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v10);
  [v15 setGivenName:v14];

  [v15 setFamilyName:v13];
  v16 = [MEMORY[0x1E4F1BA80] postalAddressWithDictionaryRepresentation:v12];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:v11 value:v16];
  v21[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v15 setPostalAddresses:v18];

  v19 = [(CNPostalAddressEditorNavigationController *)self initWithContact:v15 propertyKey:*MEMORY[0x1E4F1AF10] editNames:1];
  return v19;
}

- (CNPostalAddressEditorNavigationController)initWithPropertyKey:(id)a3 label:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  if ([v6 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:v7 value:&stru_1ED8AC728];
    v17[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v8 setEmailAddresses:v10];
LABEL_5:

    goto LABEL_6;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1BA20]);
    id v12 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:&stru_1ED8AC728];
    v9 = (void *)[v11 initWithLabel:v7 value:v12];

    v16 = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [v8 setPhoneNumbers:v10];
    goto LABEL_5;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F1ADE0]])
  {
    [v8 setFamilyName:&stru_1ED8AC728];
    uint64_t v13 = 1;
    goto LABEL_7;
  }
LABEL_6:
  uint64_t v13 = 0;
LABEL_7:
  id v14 = [(CNPostalAddressEditorNavigationController *)self initWithContact:v8 propertyKey:v6 editNames:v13];

  return v14;
}

- (CNPostalAddressEditorNavigationController)initWithContact:(id)a3 propertyKey:(id)a4 editNames:(BOOL)a5
{
  BOOL v5 = a5;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNPostalAddressEditorNavigationController;
  v10 = [(CNPostalAddressEditorNavigationController *)&v14 initWithNibName:0 bundle:0];
  if (v10)
  {
    id v11 = [[CNPostalAddressEditorViewController alloc] initWithContact:v8 propertyKey:v9 editNames:v5];
    v15[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(CNPostalAddressEditorNavigationController *)v10 setViewControllers:v12];
  }
  return v10;
}

@end