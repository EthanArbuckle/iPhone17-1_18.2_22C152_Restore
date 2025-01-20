@interface PUSRemotePasscodeViewController
- (PUSRemotePasscodeInstructionViewController)instructionController;
- (PUSRemotePasscodeViewController)initWithAction:(int64_t)a3;
- (PUSRemotePasscodeViewControllerDelegate)passcodeDelegate;
- (void)setInstructionController:(id)a3;
- (void)setPasscodeDelegate:(id)a3;
@end

@implementation PUSRemotePasscodeViewController

- (PUSRemotePasscodeViewController)initWithAction:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUSRemotePasscodeViewController;
  v4 = [(PUSRemotePasscodeViewController *)&v10 init];
  if (v4)
  {
    v5 = [[PUSRemotePasscodeInstructionViewController alloc] initWithAction:a3];
    instructionController = v4->_instructionController;
    v4->_instructionController = v5;

    v11 = v4->_instructionController;
    v7 = +[NSArray arrayWithObjects:&v11 count:1];
    [(PUSRemotePasscodeViewController *)v4 setViewControllers:v7];

    v8 = [(PUSRemotePasscodeViewController *)v4 navigationBar];
    BPSApplyStyleToNavBar();
  }
  return v4;
}

- (void)setPasscodeDelegate:(id)a3
{
  instructionController = self->_instructionController;
  id obj = a3;
  [(PUSRemotePasscodeInstructionViewController *)instructionController setDelegate:obj];
  objc_storeWeak((id *)&self->_passcodeDelegate, obj);
}

- (PUSRemotePasscodeViewControllerDelegate)passcodeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeDelegate);

  return (PUSRemotePasscodeViewControllerDelegate *)WeakRetained;
}

- (PUSRemotePasscodeInstructionViewController)instructionController
{
  return self->_instructionController;
}

- (void)setInstructionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionController, 0);

  objc_destroyWeak((id *)&self->_passcodeDelegate);
}

@end