@interface AXEntityControllerElement
- (AXEntityControllerElement)initWithAccessibilityContainer:(id)a3 entityController:(id)a4 previewViewController:(id)a5;
- (id)_accessibilityScrollStatus;
- (id)entityController;
- (id)previewViewController;
- (void)setEntityController:(id)a3;
- (void)setPreviewViewController:(id)a3;
@end

@implementation AXEntityControllerElement

- (AXEntityControllerElement)initWithAccessibilityContainer:(id)a3 entityController:(id)a4 previewViewController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AXEntityControllerElement;
  v10 = [(AXEntityControllerElement *)&v13 initWithAccessibilityContainer:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(&v10->_entityController, v8);
    objc_storeWeak(&v11->_previewViewController, v9);
  }

  return v11;
}

- (id)_accessibilityScrollStatus
{
  v3 = [(AXEntityControllerElement *)self previewViewController];
  v4 = [(AXEntityControllerElement *)self entityController];
  uint64_t v5 = [v3 _axEmitterMode];
  v6 = 0;
  if (v4 && v3 && v5 == 2)
  {
    if ([v3 _axIsOffScreenForEntityController:v4])
    {
      v6 = 0;
    }
    else
    {
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2020000000;
      int v32 = 0;
      id v27 = v3;
      id v28 = v4;
      AXPerformSafeBlock();
      int v26 = *((_DWORD *)v30 + 6);

      _Block_object_dispose(&v29, 8);
      [v27 _axBoundingRectForEntityController:v28];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      v15 = [(AXEntityControllerElement *)self _arView];
      [v15 bounds];
      uint64_t v17 = v16;
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      uint64_t v23 = v22;

      LODWORD(v24) = v26;
      v6 = objc_msgSend(MEMORY[0x263F227F0], "descriptionForDistance:objectFrame:viewBounds:", v24, v8, v10, v12, v14, v17, v19, v21, v23);
    }
  }

  return v6;
}

uint64_t __55__AXEntityControllerElement__accessibilityScrollStatus__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accessibilityDistanceInMetersFromEntityController:*(void *)(a1 + 40)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (id)entityController
{
  id WeakRetained = objc_loadWeakRetained(&self->_entityController);

  return WeakRetained;
}

- (void)setEntityController:(id)a3
{
}

- (id)previewViewController
{
  id WeakRetained = objc_loadWeakRetained(&self->_previewViewController);

  return WeakRetained;
}

- (void)setPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_previewViewController);

  objc_destroyWeak(&self->_entityController);
}

@end