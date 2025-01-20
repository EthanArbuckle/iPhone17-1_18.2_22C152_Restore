@interface SFReaderTextSizeStepperController
- (SFReaderTextSizeStepperController)initWithReaderContext:(id)a3;
- (void)_updateStepperControls:(id)a3;
- (void)decrementValue:(id)a3;
- (void)incrementValue:(id)a3;
- (void)prepareStepper:(id)a3;
@end

@implementation SFReaderTextSizeStepperController

- (SFReaderTextSizeStepperController)initWithReaderContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFReaderTextSizeStepperController;
  v6 = [(SFReaderTextSizeStepperController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readerContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)prepareStepper:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1818];
  id v7 = a3;
  id v5 = [v4 systemImageNamed:@"textformat.size.smaller"];
  [v7 setImage:v5 forButton:1];

  v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"textformat.size.larger"];
  [v7 setImage:v6 forButton:0];

  [(SFReaderTextSizeStepperController *)self _updateStepperControls:v7];
}

- (void)incrementValue:(id)a3
{
  readerContext = self->_readerContext;
  id v5 = a3;
  [(SFReaderContext *)readerContext increaseReaderTextSize];
  [(SFReaderTextSizeStepperController *)self _updateStepperControls:v5];
}

- (void)decrementValue:(id)a3
{
  readerContext = self->_readerContext;
  id v5 = a3;
  [(SFReaderContext *)readerContext decreaseReaderTextSize];
  [(SFReaderTextSizeStepperController *)self _updateStepperControls:v5];
}

- (void)_updateStepperControls:(id)a3
{
  readerContext = self->_readerContext;
  id v5 = a3;
  objc_msgSend(v5, "setEnabled:forButton:", -[SFReaderContext canDecreaseReaderTextSize](readerContext, "canDecreaseReaderTextSize"), 1);
  objc_msgSend(v5, "setEnabled:forButton:", -[SFReaderContext canIncreaseReaderTextSize](self->_readerContext, "canIncreaseReaderTextSize"), 0);
}

- (void).cxx_destruct
{
}

@end