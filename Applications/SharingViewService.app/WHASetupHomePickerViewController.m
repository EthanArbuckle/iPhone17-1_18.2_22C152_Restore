@interface WHASetupHomePickerViewController
- (NSArray)homes;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)defaultHomeIndex;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)handleChooseButton:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)setDefaultHomeIndex:(int64_t)a3;
- (void)setHomes:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WHASetupHomePickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_defaultHomeIndex + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressSpinner + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)(&self->_homeChosen + 1), 0);
  objc_storeStrong((id *)((char *)&self->_homePickerView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setHomes:(id)a3
{
}

- (NSArray)homes
{
  return *(NSArray **)((char *)&self->_defaultHomeIndex + 1);
}

- (void)setDefaultHomeIndex:(int64_t)a3
{
  *(UILabel **)((char *)&self->_progressLabel + 1) = (UILabel *)a3;
}

- (int64_t)defaultHomeIndex
{
  return *(int64_t *)((char *)&self->_progressLabel + 1);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  if (objc_msgSend(self->super._mainController, "testMode", a3, a4, a5))
  {
    v7 = [&off_1001A72E0 objectAtIndexedSubscript:a4];
  }
  else if (a4 < 0 || (uint64_t)[*(id *)((char *)&self->_defaultHomeIndex + 1) count] <= a4)
  {
    v7 = 0;
  }
  else
  {
    v8 = [*(id *)((char *)&self->_defaultHomeIndex + 1) objectAtIndexedSubscript:a4];
    v7 = [v8 name];
  }

  return v7;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  if (objc_msgSend(self->super._mainController, "testMode", a3, a4)) {
    v5 = &off_1001A72C8;
  }
  else {
    v5 = *(_UNKNOWN ***)((char *)&self->_defaultHomeIndex + 1);
  }

  return (int64_t)[v5 count];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (void)handleChooseButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!BYTE1(self->_chooseButton))
  {
    BYTE1(self->_chooseButton) = 1;
    [*(id *)((char *)&self->_homePickerView + 1) setHidden:1];
    [*(id *)(&self->_homeChosen + 1) setHidden:0];
    [*(id *)((char *)&self->_progressView + 1) startAnimating];
    [*(id *)((char *)&self->_progressSpinner + 1) setHidden:0];
    if ([self->super._mainController testMode])
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1001432D4;
      v9[3] = &unk_1001A1B88;
      dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      v11 = self;
      v5 = v10;
      dispatch_source_set_event_handler(v5, v9);
      SFDispatchTimerSet();
      dispatch_resume(v5);
    }
    else
    {
      uint64_t v6 = (uint64_t)[*(id *)((char *)&self->_titleLabel + 1) selectedRowInComponent:0];
      if ((v6 & 0x8000000000000000) == 0)
      {
        uint64_t v7 = v6;
        if (v6 <= (uint64_t)[*(id *)((char *)&self->_defaultHomeIndex + 1) count])
        {
          v8 = [*(id *)((char *)&self->_defaultHomeIndex + 1) objectAtIndexedSubscript:v7];
          [self->super._mainController chooseHome:v8];
        }
      }
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)WHASetupHomePickerViewController;
  [(WHASetupHomePickerViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)WHASetupHomePickerViewController;
  [(SVSBaseViewController *)&v5 viewWillAppear:v3];
  if (sub_1001385F8()) {
    [*(id *)((char *)&self->_titleLabel + 1) _setUsesDynamicRowHeight:1];
  }
}

@end