@interface CNTonePickerController
- (CNTonePickerController)initWithAlertType:(int64_t)a3 activityAlert:(id)a4;
- (TKTonePickerViewController)tonePicker;
- (void)cancelButton:(id)a3;
- (void)doneButton:(id)a3;
- (void)setTonePicker:(id)a3;
@end

@implementation CNTonePickerController

- (void).cxx_destruct
{
}

- (void)setTonePicker:(id)a3
{
}

- (TKTonePickerViewController)tonePicker
{
  return self->_tonePicker;
}

- (void)cancelButton:(id)a3
{
  v4 = [(CNTonePickerController *)self delegate];
  [v4 pickerDidCancel:self];

  [(CNTonePickerController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)doneButton:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1B8B0]);
  v5 = [(CNTonePickerController *)self tonePicker];
  v6 = [v5 selectedToneIdentifier];
  v7 = [(CNTonePickerController *)self tonePicker];
  v8 = [v7 selectedVibrationIdentifier];
  v9 = [(CNTonePickerController *)self tonePicker];
  id v11 = (id)objc_msgSend(v4, "initWithSound:vibration:ignoreMute:", v6, v8, objc_msgSend(v9, "ignoreMute"));

  v10 = [(CNTonePickerController *)self delegate];
  [v10 picker:self didPickItem:v11];

  [(CNTonePickerController *)self dismissViewControllerAnimated:1 completion:0];
}

- (CNTonePickerController)initWithAlertType:(int64_t)a3 activityAlert:(id)a4
{
  id v7 = a4;
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"CNTonePickerController.m" lineNumber:29 description:@"Only call and text alerts are allowed"];
  }
  v29.receiver = self;
  v29.super_class = (Class)CNTonePickerController;
  v8 = [(CNTonePickerController *)&v29 initWithNibName:0 bundle:0];
  if (v8)
  {
    uint64_t v9 = [objc_alloc((Class)getTKTonePickerViewControllerClass[0]()) initWithAlertType:a3];
    tonePicker = v8->_tonePicker;
    v8->_tonePicker = (TKTonePickerViewController *)v9;

    id v11 = CNContactsUIBundle();
    v12 = v11;
    if (a3 == 1)
    {
      v13 = [v11 localizedStringForKey:@"EDIT_RINGTONE" value:&stru_1ED8AC728 table:@"Localized"];
      v14 = [(TKTonePickerViewController *)v8->_tonePicker navigationItem];
      [v14 setTitle:v13];

      [(TKTonePickerViewController *)v8->_tonePicker setShowsNone:0];
    }
    else
    {
      v15 = [v11 localizedStringForKey:@"EDIT_TEXTTONE" value:&stru_1ED8AC728 table:@"Localized"];
      v16 = [(TKTonePickerViewController *)v8->_tonePicker navigationItem];
      [v16 setTitle:v15];

      [(TKTonePickerViewController *)v8->_tonePicker setShowsNone:1];
      [(TKTonePickerViewController *)v8->_tonePicker setNoneAtTop:1];
    }
    [(TKTonePickerViewController *)v8->_tonePicker setShowsIgnoreMute:1];
    -[TKTonePickerViewController setIgnoreMute:](v8->_tonePicker, "setIgnoreMute:", [v7 ignoreMute]);
    v17 = +[CNCapabilitiesManager defaultCapabilitiesManager];
    -[TKTonePickerViewController setShowsVibrations:](v8->_tonePicker, "setShowsVibrations:", [v17 hasVibratorCapability]);

    [(TKTonePickerViewController *)v8->_tonePicker setShowsDefault:1];
    v18 = [v7 sound];
    [(TKTonePickerViewController *)v8->_tonePicker setSelectedToneIdentifier:v18];

    v19 = [v7 vibration];
    [(TKTonePickerViewController *)v8->_tonePicker setSelectedVibrationIdentifier:v19];

    v20 = objc_alloc_init(CNToneKitPickerStyleProvider);
    [(TKTonePickerViewController *)v8->_tonePicker setStyleProvider:v20];

    v21 = [(CNTonePickerController *)v8 navigationBar];
    objc_msgSend(v21, "_cnui_applyContactStyle");

    v22 = [(TKTonePickerViewController *)v8->_tonePicker tableView];
    objc_msgSend(v22, "_cnui_applyContactStyle");

    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v8 action:sel_doneButton_];
    v24 = [(TKTonePickerViewController *)v8->_tonePicker navigationItem];
    [v24 setRightBarButtonItem:v23];

    v25 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v8 action:sel_cancelButton_];
    v26 = [(TKTonePickerViewController *)v8->_tonePicker navigationItem];
    [v26 setLeftBarButtonItem:v25];

    [(CNTonePickerController *)v8 pushViewController:v8->_tonePicker animated:0];
  }

  return v8;
}

@end