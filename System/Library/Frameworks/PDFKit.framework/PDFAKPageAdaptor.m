@interface PDFAKPageAdaptor
- (AKPageModelController)akPageModelController;
- (PDFAKPageAdaptor)initWithPDFPage:(id)a3;
- (PDFAKPageAdaptor)initWithPDFPage:(id)a3 pageModelController:(id)a4;
- (PDFPage)pdfPage;
- (void)_annotationsWereAdded:(id)a3;
- (void)_annotationsWereRemoved:(id)a3;
- (void)_startObservingPageModel;
- (void)_stopObservingPageModel;
- (void)_teardown;
- (void)dealloc;
- (void)initializeExifAndScaleOnAnnotation:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pdfPage:(id)a3 didAddAnnotation:(id)a4;
- (void)pdfPage:(id)a3 didRemoveAnnotation:(id)a4;
- (void)pdfPageWasRotated:(id)a3;
- (void)teardown;
@end

@implementation PDFAKPageAdaptor

- (PDFAKPageAdaptor)initWithPDFPage:(id)a3
{
  id v4 = a3;
  if (GetDefaultsWriteAKEnabled())
  {
    id v5 = objc_alloc_init((Class)AKPageModelControllerClass());
    [v5 setRepresentedObject:v4];
    self = [(PDFAKPageAdaptor *)self initWithPDFPage:v4 pageModelController:v5];

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PDFAKPageAdaptor)initWithPDFPage:(id)a3 pageModelController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (GetDefaultsWriteAKEnabled())
  {
    v13.receiver = self;
    v13.super_class = (Class)PDFAKPageAdaptor;
    v8 = [(PDFAKPageAdaptor *)&v13 init];
    if (v8)
    {
      uint64_t v9 = objc_opt_new();
      v10 = v8->_private;
      v8->_private = (PDFAKPageAdaptorPrivate *)v9;

      objc_storeWeak((id *)&v8->_private->pdfPage, v6);
      objc_storeStrong((id *)&v8->_private->akPageModelController, a4);
      [(PDFAKPageAdaptor *)v8 _startObservingPageModel];
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  if (!self->_private->isTornDown)
  {
    if ([MEMORY[0x263F08B88] isMainThread]) {
      [(PDFAKPageAdaptor *)self _teardown];
    }
    else {
      NSLog(&cfstr_SCalledFromABa.isa, "-[PDFAKPageAdaptor dealloc]");
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)PDFAKPageAdaptor;
  [(PDFAKPageAdaptor *)&v3 dealloc];
}

- (void)teardown
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(PDFAKPageAdaptor *)self _teardown];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__PDFAKPageAdaptor_teardown__block_invoke;
    block[3] = &unk_264203940;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __28__PDFAKPageAdaptor_teardown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _teardown];
}

- (void)_teardown
{
  v2 = self->_private;
  if (v2 && !v2->isTornDown)
  {
    v2->isTornDown = 1;
    [(PDFAKPageAdaptor *)self _stopObservingPageModel];
    id v4 = self->_private;
    akPageModelController = v4->akPageModelController;
    v4->akPageModelController = 0;

    p_pdfPage = &self->_private->pdfPage;
    objc_storeWeak((id *)p_pdfPage, 0);
  }
}

- (PDFPage)pdfPage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfPage);

  return (PDFPage *)WeakRetained;
}

- (AKPageModelController)akPageModelController
{
  return self->_private->akPageModelController;
}

- (void)pdfPage:(id)a3 didAddAnnotation:(id)a4
{
  id v4 = self->_private;
  if (!v4->isSyncingFromAKPageModel)
  {
    BOOL isSyncingFromPDFPage = v4->isSyncingFromPDFPage;
    v4->BOOL isSyncingFromPDFPage = 1;
    objc_msgSend(a4, "akAnnotationAdaptor", a3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v9 akAnnotation];
    if (v7)
    {
      [(PDFAKPageAdaptor *)self initializeExifAndScaleOnAnnotation:v7];
      v8 = [(AKPageModelController *)self->_private->akPageModelController mutableArrayValueForKey:@"annotations"];
      [v8 addObject:v7];
    }
    self->_private->BOOL isSyncingFromPDFPage = isSyncingFromPDFPage;
  }
}

- (void)pdfPage:(id)a3 didRemoveAnnotation:(id)a4
{
  id v4 = self->_private;
  if (!v4->isSyncingFromAKPageModel)
  {
    BOOL isSyncingFromPDFPage = v4->isSyncingFromPDFPage;
    v4->BOOL isSyncingFromPDFPage = 1;
    objc_msgSend(a4, "akAnnotationAdaptor", a3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v9 akAnnotation];
    if (v7)
    {
      v8 = [(AKPageModelController *)self->_private->akPageModelController mutableArrayValueForKey:@"annotations"];
      [v8 removeObject:v7];
    }
    self->_private->BOOL isSyncingFromPDFPage = isSyncingFromPDFPage;
  }
}

- (void)pdfPageWasRotated:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = self->_private;
  BOOL isSyncingFromPDFPage = v4->isSyncingFromPDFPage;
  v4->BOOL isSyncingFromPDFPage = 1;
  id v6 = [a3 annotations];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) akAnnotationAdaptor];
        [v11 invalidateAppearanceStream];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  self->_private->BOOL isSyncingFromPDFPage = isSyncingFromPDFPage;
}

- (void)initializeExifAndScaleOnAnnotation:(id)a3
{
  id v21 = a3;
  [v21 originalModelBaseScaleFactor];
  if (v4 == 0.0 || ![v21 originalExifOrientation])
  {
    id v5 = [(PDFAKPageAdaptor *)self pdfPage];
    id v6 = [v5 view];
    uint64_t v7 = v6;
    double v8 = 1.0;
    if (v6 && ([v6 window], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      uint64_t v10 = [v5 document];
      v11 = v10;
      if (v10)
      {
        long long v12 = [v10 akDocumentAdaptor];
        long long v13 = [v12 akMainController];
        long long v14 = v13;
        if (v13)
        {
          long long v15 = [v13 modelController];
          v16 = [v15 pageModelControllers];
          uint64_t v17 = [v16 indexOfObjectIdenticalTo:self->_private->akPageModelController];

          if (v17 == 0x7FFFFFFFFFFFFFFFLL || ![v14 isOverlayViewLoadedAtIndex:v17])
          {
            uint64_t v19 = 1;
          }
          else
          {
            [v14 currentModelBaseScaleFactorForPageAtIndex:v17];
            double v8 = v18;
            uint64_t v19 = [v14 currentExifOrientationForPageAtIndex:v17];
          }
        }
        else
        {
          uint64_t v19 = 1;
        }
      }
      else
      {
        uint64_t v19 = 1;
      }
    }
    else
    {
      uint64_t v19 = 1;
    }
    [v21 originalModelBaseScaleFactor];
    if (v20 == 0.0) {
      [v21 setOriginalModelBaseScaleFactor:v8];
    }
    if (![v21 originalExifOrientation]) {
      [v21 setOriginalExifOrientation:v19];
    }
  }
}

- (void)_startObservingPageModel
{
  v2 = self->_private;
  if (!v2->isObservingPageModel)
  {
    v2->isObservingPageModel = 1;
    double v4 = self->_private->akPageModelController;
    [(AKPageModelController *)v4 addObserver:self forKeyPath:@"annotations" options:3 context:@"PDFAKPageAdaptor.modelAnnotationsObservationContext"];
    [(AKPageModelController *)v4 addObserver:self forKeyPath:@"selectedAnnotations" options:3 context:@"PDFAKPageAdaptor.modelSelectedAnnotationsObservationContext"];
  }
}

- (void)_stopObservingPageModel
{
  v2 = self->_private;
  if (v2->isObservingPageModel)
  {
    double v4 = v2->akPageModelController;
    [(AKPageModelController *)v4 removeObserver:self forKeyPath:@"annotations" context:@"PDFAKPageAdaptor.modelAnnotationsObservationContext"];
    [(AKPageModelController *)v4 removeObserver:self forKeyPath:@"selectedAnnotations" context:@"PDFAKPageAdaptor.modelSelectedAnnotationsObservationContext"];
    self->_private->isObservingPageModel = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == @"PDFAKPageAdaptor.modelAnnotationsObservationContext")
  {
    long long v13 = self->_private;
    if (!v13->isSyncingFromPDFPage)
    {
      BOOL isSyncingFromAKPageModel = v13->isSyncingFromAKPageModel;
      v13->BOOL isSyncingFromAKPageModel = 1;
      long long v15 = self->_private->akPageModelController;
      v16 = [v12 objectForKey:*MEMORY[0x263F081C8]];
      uint64_t v17 = [v12 objectForKey:*MEMORY[0x263F081B8]];
      if (v16) {
        [(PDFAKPageAdaptor *)self _annotationsWereRemoved:v16];
      }
      if (v17) {
        [(PDFAKPageAdaptor *)self _annotationsWereAdded:v17];
      }
      self->_private->BOOL isSyncingFromAKPageModel = isSyncingFromAKPageModel;
    }
  }
  else if (a6 == @"PDFAKPageAdaptor.modelSelectedAnnotationsObservationContext")
  {
    id v33 = v11;
    id v34 = v10;
    double v18 = [(AKPageModelController *)self->_private->akPageModelController selectedAnnotations];
    uint64_t v19 = [v18 allObjects];

    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    v32 = [(PDFAKPageAdaptor *)self pdfPage];
    id v21 = [v32 annotations];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v27 = [v26 akAnnotationAdaptor];
          v28 = [v27 akAnnotation];
          if (v28 && [v19 containsObject:v28]) {
            [v20 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v23);
    }
    v29 = [MEMORY[0x263F08A00] defaultCenter];
    v30 = [v32 view];
    v40 = @"PDFAnnotationsHit";
    id v41 = v20;
    v31 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    [v29 postNotificationName:@"PDFViewAnnotationHit" object:v30 userInfo:v31];

    id v11 = v33;
    id v10 = v34;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)PDFAKPageAdaptor;
    [(PDFAKPageAdaptor *)&v35 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_annotationsWereRemoved:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  double v4 = [MEMORY[0x263EFFA08] setWithArray:a3];
  id v5 = objc_opt_new();
  id v6 = [(PDFAKPageAdaptor *)self pdfPage];
  uint64_t v7 = [v6 annotations];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v13 = [v12 akAnnotationAdaptor];
        long long v14 = [v13 akAnnotation];
        if (v14 && [v4 containsObject:v14]) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(v6, "removeAnnotation:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (void)_annotationsWereAdded:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PDFAKPageAdaptor *)self pdfPage];
  v31 = [v5 annotations];
  v28 = self->_private->akPageModelController;
  id v6 = [(AKPageModelController *)v28 annotations];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v4;
  uint64_t v33 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v33)
  {
    uint64_t v8 = *(void *)v40;
    unint64_t v9 = 0x26B4A1000uLL;
    uint64_t v29 = *(void *)v40;
    uint64_t v30 = v5;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * v10);
        uint64_t v12 = [(id)(v9 + 4024) newPDFAnnotationFromAKAnnotation:v11];
        long long v13 = (void *)v12;
        if (v12)
        {
          id v34 = (void *)v12;
          uint64_t v14 = [v6 indexOfObjectIdenticalTo:v11];
          for (unint64_t i = v14 + 1; ; ++i)
          {
            if (i >= [v6 count]) {
              goto LABEL_14;
            }
            uint64_t v16 = [v6 objectAtIndex:i];
            if (([v7 containsObject:v16] & 1) == 0)
            {
              AKCropAnnotationClass();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
            }
          }
          if (v16)
          {
            uint64_t v32 = 0;
            goto LABEL_25;
          }
LABEL_14:
          if (v14 - 1 < 1)
          {
LABEL_18:
            uint64_t v16 = 0;
            goto LABEL_19;
          }
          while (1)
          {
            uint64_t v16 = [v6 objectAtIndex:--v14];
            if (([v7 containsObject:v16] & 1) == 0)
            {
              AKCropAnnotationClass();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
            }

            if (v14 <= 1) {
              goto LABEL_18;
            }
          }
          if (v16)
          {
            uint64_t v32 = 1;
LABEL_25:
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v17 = v31;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v36;
LABEL_27:
              uint64_t v21 = 0;
              while (1)
              {
                if (*(void *)v36 != v20) {
                  objc_enumerationMutation(v17);
                }
                long long v22 = *(void **)(*((void *)&v35 + 1) + 8 * v21);
                long long v23 = [v22 akAnnotationAdaptor];
                long long v24 = [v23 akAnnotation];
                if (v24 == v16) {
                  break;
                }

                if (v19 == ++v21)
                {
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
                  unint64_t v9 = 0x26B4A1000;
                  if (v19) {
                    goto LABEL_27;
                  }
                  goto LABEL_33;
                }
              }
              id v25 = v22;

              if (v25)
              {
                uint64_t v26 = [v17 indexOfObjectIdenticalTo:v25];
                id v5 = v30;
                long long v13 = v34;
                [v30 insertAnnotation:v34 atIndex:v26 + v32];

                uint64_t v8 = v29;
                unint64_t v9 = 0x26B4A1000;
                goto LABEL_20;
              }
              uint64_t v8 = v29;
              id v5 = v30;
              unint64_t v9 = 0x26B4A1000;
            }
            else
            {
LABEL_33:

              uint64_t v8 = v29;
              id v5 = v30;
            }
          }
LABEL_19:
          long long v13 = v34;
          [v5 addAnnotation:v34];
LABEL_20:
        }
        ++v10;
      }
      while (v10 != v33);
      uint64_t v27 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
      uint64_t v33 = v27;
    }
    while (v27);
  }
}

- (void).cxx_destruct
{
}

@end