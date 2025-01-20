@interface StepByStepUIViewController_ExtendWired_Config
- (StepByStepUIViewController_ExtendWired_Config)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation StepByStepUIViewController_ExtendWired_Config

- (StepByStepUIViewController_ExtendWired_Config)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)StepByStepUIViewController_ExtendWired_Config;
  result = [(StepByStepUIViewController_ExtendWireless_Config *)&v5 initWithNibName:a3 bundle:a4];
  if (result)
  {
    result->super.connectionType = &off_268147F70[0]->isa;
    result->super.unlocalizedStatusString = (NSString *)@"StepByStepStatus_ExtendWired%@";
  }
  return result;
}

@end