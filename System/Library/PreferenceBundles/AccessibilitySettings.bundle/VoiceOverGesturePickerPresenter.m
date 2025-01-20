@interface VoiceOverGesturePickerPresenter
+ (VoiceOverGesturePickerPresenter)presenterWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5;
- (id)_initWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5;
- (id)userCanceledGestureSelectionBlock;
- (id)userSelectedGestureBlock;
- (void)_cancelButtonTapped:(id)a3;
- (void)presentWithController:(id)a3;
- (void)setUserCanceledGestureSelectionBlock:(id)a3;
- (void)setUserSelectedGestureBlock:(id)a3;
@end

@implementation VoiceOverGesturePickerPresenter

+ (VoiceOverGesturePickerPresenter)presenterWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[VoiceOverGesturePickerPresenter alloc] _initWithSpecifier:v9 selectionBlock:v8 cancelBlock:v7];

  return (VoiceOverGesturePickerPresenter *)v10;
}

- (id)_initWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VoiceOverGesturePickerPresenter;
  v12 = [(VoiceOverGesturePickerPresenter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_specifier, a3);
    [(VoiceOverGesturePickerPresenter *)v13 setUserSelectedGestureBlock:v10];
    [(VoiceOverGesturePickerPresenter *)v13 setUserCanceledGestureSelectionBlock:v11];
  }

  return v13;
}

- (void)presentWithController:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(VoiceOverGesturePickerController);
  gesturePickerViewController = self->_gesturePickerViewController;
  self->_gesturePickerViewController = v5;

  [(VoiceOverGesturePickerController *)self->_gesturePickerViewController setSpecifier:self->_specifier];
  [(VoiceOverGesturePickerController *)self->_gesturePickerViewController setPresenter:self];
  id v13 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_gesturePickerViewController];
  [v13 setModalPresentationStyle:2];
  id v7 = [v13 navigationBar];
  id v8 = [v7 topItem];

  id v9 = settingsLocString(@"vo.touch.gestures", @"VoiceOverSettings");
  [v8 setTitle:v9];

  id v10 = objc_alloc((Class)UIBarButtonItem);
  id v11 = settingsLocString(@"vo.cancel", @"VoiceOverSettings");
  id v12 = [v10 initWithTitle:v11 style:2 target:self action:"_cancelButtonTapped:"];
  [v8 setLeftBarButtonItem:v12];

  [v4 presentViewController:v13 animated:1 completion:0];
}

- (void)_cancelButtonTapped:(id)a3
{
  id v4 = [(VoiceOverGesturePickerPresenter *)self userCanceledGestureSelectionBlock];

  if (v4)
  {
    v5 = [(VoiceOverGesturePickerPresenter *)self userCanceledGestureSelectionBlock];
    v5[2]();
  }
}

- (id)userSelectedGestureBlock
{
  return self->_userSelectedGestureBlock;
}

- (void)setUserSelectedGestureBlock:(id)a3
{
}

- (id)userCanceledGestureSelectionBlock
{
  return self->_userCanceledGestureSelectionBlock;
}

- (void)setUserCanceledGestureSelectionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userCanceledGestureSelectionBlock, 0);
  objc_storeStrong(&self->_userSelectedGestureBlock, 0);
  objc_storeStrong((id *)&self->_gesturePickerViewController, 0);

  objc_storeStrong((id *)&self->_specifier, 0);
}

@end