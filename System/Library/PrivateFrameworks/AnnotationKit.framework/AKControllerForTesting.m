@interface AKControllerForTesting
+ (void)renderAnnotation:(id)a3 inContext:(CGContext *)a4;
- (AKActionController)testingActionController;
- (AKAttributeController)testingAttributeController;
- (AKControllerDelegateProtocol)testingDelegate;
- (AKControllerForTesting)init;
- (AKLegacyDoodleController)testingIntelligentSketchController;
- (AKMainEventHandler)testingMainEventHandler;
- (AKModelController)testingModelController;
- (AKSignatureModelController)testingSignatureModelController;
- (AKToolController)testingToolController;
- (AKUndoController)testingUndoController;
- (BOOL)validateSender:(id)a3;
- (UIView)testingOverlayView;
- (UIView)testingToolbarView;
- (id)actionController;
- (id)attributeController;
- (id)delegate;
- (id)legacyDoodleController;
- (id)mainEventHandler;
- (id)modelController;
- (id)overlayView;
- (id)signatureModelController;
- (id)toolController;
- (id)toolbarView;
- (id)undoController;
- (void)performActionForSender:(id)a3;
- (void)reloadVisibleToolbarItemIdentifiers;
- (void)setOverlayShouldPixelate:(BOOL)a3;
- (void)setTestingActionController:(id)a3;
- (void)setTestingAttributeController:(id)a3;
- (void)setTestingDelegate:(id)a3;
- (void)setTestingIntelligentSketchController:(id)a3;
- (void)setTestingMainEventHandler:(id)a3;
- (void)setTestingModelController:(id)a3;
- (void)setTestingOverlayView:(id)a3;
- (void)setTestingSignatureModelController:(id)a3;
- (void)setTestingToolController:(id)a3;
- (void)setTestingToolbarView:(id)a3;
- (void)setTestingUndoController:(id)a3;
- (void)updateOverlayViewAtIndex:(unint64_t)a3;
@end

@implementation AKControllerForTesting

- (AKControllerForTesting)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKControllerForTesting;
  return (AKControllerForTesting *)[(AKController *)&v3 initForTesting];
}

- (void)updateOverlayViewAtIndex:(unint64_t)a3
{
  NSLog(&cfstr_SCalledDuringT.isa, a2, "-[AKControllerForTesting updateOverlayViewAtIndex:]");
  v5.receiver = self;
  v5.super_class = (Class)AKControllerForTesting;
  [(AKController *)&v5 updateOverlayViewAtIndex:a3];
}

- (void)setOverlayShouldPixelate:(BOOL)a3
{
  BOOL v3 = a3;
  NSLog(&cfstr_SCalledDuringT.isa, a2, "-[AKControllerForTesting setOverlayShouldPixelate:]");
  v5.receiver = self;
  v5.super_class = (Class)AKControllerForTesting;
  [(AKController *)&v5 setOverlayShouldPixelate:v3];
}

- (void)performActionForSender:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_SCalledDuringT.isa, "-[AKControllerForTesting performActionForSender:]");
  v5.receiver = self;
  v5.super_class = (Class)AKControllerForTesting;
  [(AKController *)&v5 performActionForSender:v4];
}

- (BOOL)validateSender:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_SCalledDuringT.isa, "-[AKControllerForTesting validateSender:]");
  v6.receiver = self;
  v6.super_class = (Class)AKControllerForTesting;
  LOBYTE(self) = [(AKController *)&v6 validateSender:v4];

  return (char)self;
}

+ (void)renderAnnotation:(id)a3 inContext:(CGContext *)a4
{
  id v6 = a3;
  NSLog(&cfstr_SCalledDuringT.isa, "+[AKControllerForTesting renderAnnotation:inContext:]");
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AKControllerForTesting;
  objc_msgSendSuper2(&v7, sel_renderAnnotation_inContext_, v6, a4);
}

- (void)reloadVisibleToolbarItemIdentifiers
{
  NSLog(&cfstr_SCalledDuringT.isa, a2, "-[AKControllerForTesting reloadVisibleToolbarItemIdentifiers]");
  v3.receiver = self;
  v3.super_class = (Class)AKControllerForTesting;
  [(AKController *)&v3 reloadVisibleToolbarItemIdentifiers];
}

- (id)delegate
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingDelegate);
}

- (id)modelController
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingModelController);
}

- (id)toolbarView
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingToolbarView);
}

- (id)overlayView
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingOverlayView);
}

- (id)actionController
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingActionController);
}

- (id)toolController
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingToolController);
}

- (id)attributeController
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingAttributeController);
}

- (id)undoController
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingUndoController);
}

- (id)mainEventHandler
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingMainEventHandler);
}

- (id)legacyDoodleController
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingIntelligentSketchController);
}

- (id)signatureModelController
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingSignatureModelController);
}

- (AKControllerDelegateProtocol)testingDelegate
{
  return (AKControllerDelegateProtocol *)objc_getProperty(self, a2, 288, 1);
}

- (void)setTestingDelegate:(id)a3
{
}

- (AKModelController)testingModelController
{
  return (AKModelController *)objc_getProperty(self, a2, 296, 1);
}

- (void)setTestingModelController:(id)a3
{
}

- (AKActionController)testingActionController
{
  return (AKActionController *)objc_getProperty(self, a2, 304, 1);
}

- (void)setTestingActionController:(id)a3
{
}

- (AKToolController)testingToolController
{
  return (AKToolController *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTestingToolController:(id)a3
{
}

- (AKAttributeController)testingAttributeController
{
  return (AKAttributeController *)objc_getProperty(self, a2, 320, 1);
}

- (void)setTestingAttributeController:(id)a3
{
}

- (AKUndoController)testingUndoController
{
  return (AKUndoController *)objc_getProperty(self, a2, 328, 1);
}

- (void)setTestingUndoController:(id)a3
{
}

- (AKMainEventHandler)testingMainEventHandler
{
  return (AKMainEventHandler *)objc_getProperty(self, a2, 336, 1);
}

- (void)setTestingMainEventHandler:(id)a3
{
}

- (UIView)testingToolbarView
{
  return (UIView *)objc_getProperty(self, a2, 344, 1);
}

- (void)setTestingToolbarView:(id)a3
{
}

- (UIView)testingOverlayView
{
  return (UIView *)objc_getProperty(self, a2, 352, 1);
}

- (void)setTestingOverlayView:(id)a3
{
}

- (AKLegacyDoodleController)testingIntelligentSketchController
{
  return (AKLegacyDoodleController *)objc_getProperty(self, a2, 360, 1);
}

- (void)setTestingIntelligentSketchController:(id)a3
{
}

- (AKSignatureModelController)testingSignatureModelController
{
  return (AKSignatureModelController *)objc_getProperty(self, a2, 368, 1);
}

- (void)setTestingSignatureModelController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingSignatureModelController, 0);
  objc_storeStrong((id *)&self->_testingIntelligentSketchController, 0);
  objc_storeStrong((id *)&self->_testingOverlayView, 0);
  objc_storeStrong((id *)&self->_testingToolbarView, 0);
  objc_storeStrong((id *)&self->_testingMainEventHandler, 0);
  objc_storeStrong((id *)&self->_testingUndoController, 0);
  objc_storeStrong((id *)&self->_testingAttributeController, 0);
  objc_storeStrong((id *)&self->_testingToolController, 0);
  objc_storeStrong((id *)&self->_testingActionController, 0);
  objc_storeStrong((id *)&self->_testingModelController, 0);

  objc_storeStrong((id *)&self->_testingDelegate, 0);
}

@end