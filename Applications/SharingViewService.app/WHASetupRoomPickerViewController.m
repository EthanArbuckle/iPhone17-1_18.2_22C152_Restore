@interface WHASetupRoomPickerViewController
- (NSArray)rooms;
- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)firstSuggestedIndex;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)handleChooseButton:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)setFirstSuggestedIndex:(int64_t)a3;
- (void)setRooms:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WHASetupRoomPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_firstSuggestedIndex + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressSpinner + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)(&self->_roomChosen + 1), 0);
  objc_storeStrong((id *)((char *)&self->_roomPickerView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setRooms:(id)a3
{
}

- (NSArray)rooms
{
  return *(NSArray **)((char *)&self->_firstSuggestedIndex + 1);
}

- (void)setFirstSuggestedIndex:(int64_t)a3
{
  *(UILabel **)((char *)&self->_progressLabel + 1) = (UILabel *)a3;
}

- (int64_t)firstSuggestedIndex
{
  return *(int64_t *)((char *)&self->_progressLabel + 1);
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  if (a4 < 0 || (uint64_t)objc_msgSend(*(id *)((char *)&self->_firstSuggestedIndex + 1), "count", a3) <= a4)
  {
    id v12 = 0;
  }
  else
  {
    v7 = [*(id *)((char *)&self->_firstSuggestedIndex + 1) objectAtIndexedSubscript:a4];
    if (*(uint64_t *)((char *)&self->_progressLabel + 1) <= a4) {
      double v8 = 0.2;
    }
    else {
      double v8 = 0.0;
    }
    id v9 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v14 = NSObliquenessAttributeName;
    v10 = +[NSNumber numberWithDouble:v8];
    v15 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v12 = [v9 initWithString:v7 attributes:v11];
  }

  return v12;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return (int64_t)[*(id *)((char *)&self->_firstSuggestedIndex + 1) count:a3, a4];
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
    [*(id *)((char *)&self->_roomPickerView + 1) setHidden:1];
    [*(id *)(&self->_roomChosen + 1) setHidden:0];
    [*(id *)((char *)&self->_progressView + 1) startAnimating];
    [*(id *)((char *)&self->_progressSpinner + 1) setHidden:0];
    if ([self->super._mainController testMode])
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100143A80;
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
        if (v6 <= (uint64_t)[*(id *)((char *)&self->_firstSuggestedIndex + 1) count])
        {
          double v8 = [*(id *)((char *)&self->_firstSuggestedIndex + 1) objectAtIndexedSubscript:v7];
          [self->super._mainController chooseRoom:v8];
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
  v5.super_class = (Class)WHASetupRoomPickerViewController;
  [(WHASetupRoomPickerViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)WHASetupRoomPickerViewController;
  [(SVSBaseViewController *)&v5 viewWillAppear:v3];
  if (sub_1001385F8()) {
    [*(id *)((char *)&self->_titleLabel + 1) _setUsesDynamicRowHeight:1];
  }
}

@end