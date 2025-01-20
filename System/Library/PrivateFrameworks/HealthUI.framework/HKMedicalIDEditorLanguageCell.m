@interface HKMedicalIDEditorLanguageCell
- (id)editAction;
- (void)beginEditing;
- (void)setEditAction:(id)a3;
- (void)setValueLanguageText:(id)a3;
@end

@implementation HKMedicalIDEditorLanguageCell

- (void)beginEditing
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicalIDEditorLanguageCell;
  [(HKMedicalIDEditorCell *)&v5 beginEditing];
  v3 = [(HKMedicalIDEditorLanguageCell *)self editAction];

  if (v3)
  {
    v4 = [(HKMedicalIDEditorLanguageCell *)self editAction];
    v4[2]();
  }
}

- (void)setValueLanguageText:(id)a3
{
  id v8 = a3;
  v4 = [v8 identifier];

  if (v4)
  {
    objc_super v5 = [v8 localizedStringForDisplay];
    v6 = [(HKMedicalIDEditorCell *)self inputTextField];
    [v6 setText:v5];

    v7 = [(HKMedicalIDEditorCell *)self editDelegate];
    [v7 medicalIDEditorCellDidChangeValue:self];
  }
}

- (id)editAction
{
  return self->_editAction;
}

- (void)setEditAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end