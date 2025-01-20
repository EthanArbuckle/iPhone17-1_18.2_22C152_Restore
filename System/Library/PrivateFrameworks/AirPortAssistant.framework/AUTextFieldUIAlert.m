@interface AUTextFieldUIAlert
- (id)textField;
- (id)textFieldAtIndex:(unint64_t)a3;
- (void)addTextField;
- (void)prepareToShow;
@end

@implementation AUTextFieldUIAlert

- (void)prepareToShow
{
  v5.receiver = self;
  v5.super_class = (Class)AUTextFieldUIAlert;
  [(AUUIAlert *)&v5 prepareToShow];
  objc_msgSend_addTextField(self, v3, v4);
}

- (void)addTextField
{
}

- (id)textField
{
  return (id)MEMORY[0x270F9A6D0](self, sel_textFieldAtIndex_, 0);
}

- (id)textFieldAtIndex:(unint64_t)a3
{
  uint64_t v4 = objc_msgSend_textFields(self->super.alert, a2, a3);
  if (objc_msgSend_count(v4, v5, v6) <= a3) {
    return 0;
  }

  return (id)objc_msgSend_objectAtIndexedSubscript_(v4, v7, a3);
}

@end