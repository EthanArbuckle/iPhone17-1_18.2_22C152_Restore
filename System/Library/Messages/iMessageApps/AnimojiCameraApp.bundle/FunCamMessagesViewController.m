@interface FunCamMessagesViewController
- (AVTAvatarPicker)forwardingPicker;
- (AVTAvatarPickerDelegate)avatarPickerDelegate;
- (BOOL)automaticallyDisplaysLandscapeRotationOverlay;
- (BOOL)waitingOnPresentationStyleChange;
- (id)defaultMessagesChildViewControllerForPresentationContext:(unint64_t)a3;
- (id)landscapeOverlayMessage;
- (id)overlayMessageBackgroundColor;
- (id)overlayMessageTextColor;
- (int64_t)preferredUserInterfaceStyle;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)requestExpandedPresentation;
- (void)selectAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)setAvatarPickerDelegate:(id)a3;
- (void)setForwardingPicker:(id)a3;
- (void)setWaitingOnPresentationStyleChange:(BOOL)a3;
@end

@implementation FunCamMessagesViewController

- (void)requestExpandedPresentation
{
  [(FunCamMessagesViewController *)self setWaitingOnPresentationStyleChange:1];
  [(FunCamMessagesViewController *)self requestPresentationStyle:1];
  objc_initWeak(&location, self);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_36F8;
  v12 = sub_3724;
  id v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_372C;
  v6[3] = &unk_C338;
  objc_copyWeak(&v7, &location);
  v6[4] = &v8;
  v3 = objc_retainBlock(v6);
  v4 = (void *)v9[5];
  v9[5] = (uint64_t)v3;

  dispatch_time_t v5 = dispatch_time(0, 500000000);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, (dispatch_block_t)v9[5]);
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FunCamMessagesViewController;
  [(BaseMessagesViewController *)&v4 didTransitionToPresentationStyle:a3];
  [(FunCamMessagesViewController *)self setWaitingOnPresentationStyleChange:0];
}

- (id)defaultMessagesChildViewControllerForPresentationContext:(unint64_t)a3
{
  objc_super v4 = objc_alloc_init(MessagesViewController);
  [(FunCamMessagesViewController *)self setForwardingPicker:v4];
  dispatch_time_t v5 = [(FunCamMessagesViewController *)self avatarPickerDelegate];
  [(MessagesViewController *)v4 setAvatarPickerDelegate:v5];

  return v4;
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (void)setAvatarPickerDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avatarPickerDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_avatarPickerDelegate, obj);
    dispatch_time_t v5 = [(FunCamMessagesViewController *)self forwardingPicker];

    if (v5)
    {
      v6 = [(FunCamMessagesViewController *)self forwardingPicker];
      [v6 setAvatarPickerDelegate:obj];
    }
  }
}

- (BOOL)automaticallyDisplaysLandscapeRotationOverlay
{
  return 0;
}

- (id)landscapeOverlayMessage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"sJFLandscapeTrapMessage" value:&stru_C498 table:@"JFStrings"];

  return v3;
}

- (AVTAvatarPickerDelegate)avatarPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avatarPickerDelegate);

  return (AVTAvatarPickerDelegate *)WeakRetained;
}

- (void)selectAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(FunCamMessagesViewController *)self forwardingPicker];
  [v7 selectAvatarRecordWithIdentifier:v6 animated:v4];
}

- (id)overlayMessageTextColor
{
  return +[UIColor _externalSystemMidGrayColor];
}

- (id)overlayMessageBackgroundColor
{
  return +[UIColor clearColor];
}

- (AVTAvatarPicker)forwardingPicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingPicker);

  return (AVTAvatarPicker *)WeakRetained;
}

- (void)setForwardingPicker:(id)a3
{
}

- (BOOL)waitingOnPresentationStyleChange
{
  return self->_waitingOnPresentationStyleChange;
}

- (void)setWaitingOnPresentationStyleChange:(BOOL)a3
{
  self->_waitingOnPresentationStyleChange = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_forwardingPicker);

  objc_destroyWeak((id *)&self->_avatarPickerDelegate);
}

@end