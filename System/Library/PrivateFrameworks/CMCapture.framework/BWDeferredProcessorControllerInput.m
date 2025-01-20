@interface BWDeferredProcessorControllerInput
- (BWDeferredProcessingContainer)container;
- (BWDeferredProcessorController)processorController;
- (NSString)photoIdentifier;
- (void)dealloc;
- (void)setContainer:(id)a3 photoIdentifier:(id)a4;
- (void)setProcessorController:(id)a3;
@end

@implementation BWDeferredProcessorControllerInput

- (void)setContainer:(id)a3 photoIdentifier:(id)a4
{
  self->_container = (BWDeferredProcessingContainer *)a3;
  self->_photoIdentifier = (NSString *)[a4 copy];
  processorController = self->_processorController;
  [(BWStillImageProcessorController *)processorController currentRequestChanged];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredProcessorControllerInput;
  [(BWStillImageProcessorControllerInput *)&v3 dealloc];
}

- (BWDeferredProcessorController)processorController
{
  return self->_processorController;
}

- (void)setProcessorController:(id)a3
{
  self->_processorController = (BWDeferredProcessorController *)a3;
}

- (BWDeferredProcessingContainer)container
{
  return self->_container;
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

@end