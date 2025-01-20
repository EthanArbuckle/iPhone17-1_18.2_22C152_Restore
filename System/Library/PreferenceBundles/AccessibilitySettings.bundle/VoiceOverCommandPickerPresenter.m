@interface VoiceOverCommandPickerPresenter
+ (VoiceOverCommandPickerPresenter)presenterWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5;
- (id)_initWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5;
- (id)userCanceledCommandSelectionBlock;
- (id)userSelectedCommandBlock;
- (void)_cancelButtonTapped:(id)a3;
- (void)presentWithController:(id)a3;
- (void)setUserCanceledCommandSelectionBlock:(id)a3;
- (void)setUserSelectedCommandBlock:(id)a3;
@end

@implementation VoiceOverCommandPickerPresenter

+ (VoiceOverCommandPickerPresenter)presenterWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[VoiceOverCommandPickerPresenter alloc] _initWithSpecifier:v9 selectionBlock:v8 cancelBlock:v7];

  return (VoiceOverCommandPickerPresenter *)v10;
}

- (id)_initWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VoiceOverCommandPickerPresenter;
  v12 = [(VoiceOverCommandPickerPresenter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_specifier, a3);
    [(VoiceOverCommandPickerPresenter *)v13 setUserSelectedCommandBlock:v10];
    [(VoiceOverCommandPickerPresenter *)v13 setUserCanceledCommandSelectionBlock:v11];
  }

  return v13;
}

- (void)presentWithController:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(VoiceOverCommandPickerController);
  commandPickerViewController = self->_commandPickerViewController;
  self->_commandPickerViewController = v5;

  [(VoiceOverCommandPickerController *)self->_commandPickerViewController setSpecifier:self->_specifier];
  [(VoiceOverCommandPickerController *)self->_commandPickerViewController setPresenter:self];
  id v13 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_commandPickerViewController];
  [v13 setModalPresentationStyle:2];
  id v7 = [v13 navigationBar];
  id v8 = [v7 topItem];

  id v9 = settingsLocString(@"vo.commands", @"VoiceOverSettings");
  [v8 setTitle:v9];

  id v10 = objc_alloc((Class)UIBarButtonItem);
  id v11 = settingsLocString(@"vo.cancel", @"VoiceOverSettings");
  id v12 = [v10 initWithTitle:v11 style:2 target:self action:"_cancelButtonTapped:"];
  [v8 setLeftBarButtonItem:v12];

  [v4 presentViewController:v13 animated:1 completion:0];
}

- (void)_cancelButtonTapped:(id)a3
{
  id v4 = [(VoiceOverCommandPickerPresenter *)self userCanceledCommandSelectionBlock];

  if (v4)
  {
    v5 = [(VoiceOverCommandPickerPresenter *)self userCanceledCommandSelectionBlock];
    v5[2]();
  }
}

- (id)userSelectedCommandBlock
{
  return self->_userSelectedCommandBlock;
}

- (void)setUserSelectedCommandBlock:(id)a3
{
}

- (id)userCanceledCommandSelectionBlock
{
  return self->_userCanceledCommandSelectionBlock;
}

- (void)setUserCanceledCommandSelectionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userCanceledCommandSelectionBlock, 0);
  objc_storeStrong(&self->_userSelectedCommandBlock, 0);
  objc_storeStrong((id *)&self->_commandPickerViewController, 0);

  objc_storeStrong((id *)&self->_specifier, 0);
}

@end