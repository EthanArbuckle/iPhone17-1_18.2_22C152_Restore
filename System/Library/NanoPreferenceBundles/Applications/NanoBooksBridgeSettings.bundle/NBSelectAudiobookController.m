@interface NBSelectAudiobookController
- (NBSelectAudiobookDelegate)delegate;
- (UINavigationController)navigationController;
- (void)setDelegate:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)viewDidLoad;
@end

@implementation NBSelectAudiobookController

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)NBSelectAudiobookController;
  [(NBSelectAudiobookController *)&v14 viewDidLoad];
  v3 = objc_alloc_init(NBSelectAudiobookViewController);
  v4 = [(NBSelectAudiobookController *)self delegate];
  [(NBSelectAudiobookViewController *)v3 setDelegate:v4];

  v5 = v3;
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];

  [(NBSelectAudiobookController *)self setNavigationController:v6];
  v7 = [(NBSelectAudiobookController *)self navigationController];
  v8 = [v7 navigationBar];
  BPSApplyStyleToNavBarOptions();

  v9 = [(NBSelectAudiobookController *)self navigationController];
  [(NBSelectAudiobookController *)self addChildViewController:v9];

  v10 = [(NBSelectAudiobookController *)self view];
  v11 = [(NBSelectAudiobookController *)self navigationController];
  v12 = [v11 view];
  [v10 addSubview:v12];

  v13 = [(NBSelectAudiobookController *)self navigationController];
  [v13 didMoveToParentViewController:self];
}

- (NBSelectAudiobookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NBSelectAudiobookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end