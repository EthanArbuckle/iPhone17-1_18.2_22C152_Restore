@interface AKPageControllerForTesting
- (AKController)testingController;
- (AKGeometryHelper)testingGeometryHelper;
- (AKLayerPresentationManager)testingLayerPresentationManager;
- (AKPageControllerForTesting)init;
- (AKPageModelController)testingPageModelController;
- (CGRect)maxPageRect;
- (UIView)testingOverlayView;
- (double)modelBaseScaleFactor;
- (id)controller;
- (id)geometryHelper;
- (id)layerPresentationManager;
- (id)overlayView;
- (id)pageModelController;
- (unint64_t)pageIndex;
- (unint64_t)testingPageIndex;
- (void)setTestingController:(id)a3;
- (void)setTestingGeometryHelper:(id)a3;
- (void)setTestingLayerPresentationManager:(id)a3;
- (void)setTestingOverlayView:(id)a3;
- (void)setTestingPageIndex:(unint64_t)a3;
- (void)setTestingPageModelController:(id)a3;
@end

@implementation AKPageControllerForTesting

- (AKPageControllerForTesting)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKPageControllerForTesting;
  return (AKPageControllerForTesting *)[(AKPageController *)&v3 initForTesting];
}

- (id)controller
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingController);
}

- (unint64_t)pageIndex
{
  return MEMORY[0x270F9A6D0](self, sel_testingPageIndex);
}

- (id)pageModelController
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingPageModelController);
}

- (id)layerPresentationManager
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingLayerPresentationManager);
}

- (id)geometryHelper
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingGeometryHelper);
}

- (id)overlayView
{
  return (id)MEMORY[0x270F9A6D0](self, sel_testingOverlayView);
}

- (CGRect)maxPageRect
{
  double v2 = 100.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 100.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)modelBaseScaleFactor
{
  return 1.0;
}

- (AKController)testingController
{
  return (AKController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTestingController:(id)a3
{
}

- (unint64_t)testingPageIndex
{
  return self->_testingPageIndex;
}

- (void)setTestingPageIndex:(unint64_t)a3
{
  self->_testingPageIndex = a3;
}

- (AKPageModelController)testingPageModelController
{
  return (AKPageModelController *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTestingPageModelController:(id)a3
{
}

- (AKLayerPresentationManager)testingLayerPresentationManager
{
  return (AKLayerPresentationManager *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTestingLayerPresentationManager:(id)a3
{
}

- (AKGeometryHelper)testingGeometryHelper
{
  return (AKGeometryHelper *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTestingGeometryHelper:(id)a3
{
}

- (UIView)testingOverlayView
{
  return (UIView *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTestingOverlayView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingOverlayView, 0);
  objc_storeStrong((id *)&self->_testingGeometryHelper, 0);
  objc_storeStrong((id *)&self->_testingLayerPresentationManager, 0);
  objc_storeStrong((id *)&self->_testingPageModelController, 0);

  objc_storeStrong((id *)&self->_testingController, 0);
}

@end