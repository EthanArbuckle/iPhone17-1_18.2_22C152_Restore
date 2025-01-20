@interface PDFAKPageOverlayViewProvider
- (BOOL)shouldVerticallyFlipOverlayViews;
- (PDFAKPageOverlayViewProvider)initWithPDFDocument:(id)a3 pdfView:(id)a4 andAKController:(id)a5;
- (id)pdfView:(id)a3 overlayViewForPage:(id)a4;
- (void)overlayViewInstalledForPage:(id)a3;
- (void)overlayViewWillBeUninstalledForPage:(id)a3;
- (void)pdfView:(id)a3 willEndDisplayingOverlayView:(id)a4 forPage:(id)a5;
- (void)setupGestureRecognizersForView:(id)a3;
- (void)teardownGestureRecognizersForView:(id)a3;
@end

@implementation PDFAKPageOverlayViewProvider

- (PDFAKPageOverlayViewProvider)initWithPDFDocument:(id)a3 pdfView:(id)a4 andAKController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PDFAKPageOverlayViewProvider;
  v11 = [(PDFAKPageOverlayViewProvider *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_pdfDocument, v8);
    objc_storeWeak((id *)&v12->_pdfView, v9);
    objc_storeWeak((id *)&v12->_akController, v10);
  }

  return v12;
}

- (id)pdfView:(id)a3 overlayViewForPage:(id)a4
{
  p_pdfDocument = &self->_pdfDocument;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pdfDocument);
  uint64_t v8 = [WeakRetained indexForPage:v6];

  id v9 = objc_loadWeakRetained((id *)&self->_akController);
  if (([v9 isOverlayViewLoadedAtIndex:v8] & 1) == 0) {
    [v9 prepareOverlayAtIndex:v8];
  }
  id v10 = [v9 overlayViewAtIndex:v8];

  return v10;
}

- (void)pdfView:(id)a3 willEndDisplayingOverlayView:(id)a4 forPage:(id)a5
{
  p_pdfDocument = &self->_pdfDocument;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_pdfDocument);
  uint64_t v9 = [WeakRetained indexForPage:v7];

  id v10 = objc_loadWeakRetained((id *)&self->_akController);
  [v10 relinquishOverlayAtIndex:v9];
}

- (BOOL)shouldVerticallyFlipOverlayViews
{
  return 1;
}

- (void)setupGestureRecognizersForView:(id)a3
{
  v45[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_akController);
  id v6 = WeakRetained;
  if (v4 && WeakRetained)
  {
    id v7 = [WeakRetained tapGestureRecognizer];
    v45[0] = v7;
    uint64_t v8 = [v6 doubleTapGestureRecognizer];
    v45[1] = v8;
    uint64_t v9 = [v6 pressGestureRecognizer];
    v45[2] = v9;
    id v10 = [v6 panGestureRecognizer];
    v45[3] = v10;
    v11 = [v6 rotationGestureRecognizer];
    v45[4] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:5];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v41;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v4, "addGestureRecognizer:", *(void *)(*((void *)&v40 + 1) + 8 * v17++), (void)v40);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v15);
    }

    v18 = [v4 tapGestureRecognizer];
    v19 = [v6 tapGestureRecognizer];
    [v18 requireGestureRecognizerToFail:v19];

    v20 = [v4 longPressGestureRecognizer];
    v21 = [v6 tapGestureRecognizer];
    [v20 requireGestureRecognizerToFail:v21];

    v22 = [v4 longPressGestureRecognizer];
    v23 = [v6 pressGestureRecognizer];
    [v22 requireGestureRecognizerToFail:v23];

    v24 = [v4 longPressGestureRecognizer];
    v25 = [v6 panGestureRecognizer];
    [v24 requireGestureRecognizerToFail:v25];

    v26 = [v4 longPressGestureRecognizer];
    v27 = [v6 rotationGestureRecognizer];
    [v26 requireGestureRecognizerToFail:v27];

    if ([v4 isUsingPageViewController])
    {
      v28 = [v4 documentViewController];
      v29 = [v28 scrollView];
    }
    else
    {
      v29 = [v4 documentScrollView];
    }
    v30 = objc_msgSend(v29, "panGestureRecognizer", (void)v40);
    v31 = [v6 panGestureRecognizer];
    [v30 requireGestureRecognizerToFail:v31];

    v32 = [v29 panGestureRecognizer];
    v33 = [v6 rotationGestureRecognizer];
    [v32 requireGestureRecognizerToFail:v33];

    v34 = [v29 pinchGestureRecognizer];
    v35 = [v6 panGestureRecognizer];
    [v34 requireGestureRecognizerToFail:v35];

    v36 = [v29 pinchGestureRecognizer];
    v37 = [v6 rotationGestureRecognizer];
    [v36 requireGestureRecognizerToFail:v37];

    uint64_t v38 = [v4 scrollViewMinimumNumberOfTouches];
    v39 = [v29 panGestureRecognizer];
    [v39 setMinimumNumberOfTouches:v38];
  }
}

- (void)teardownGestureRecognizersForView:(id)a3
{
  v23[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_akController);
  id v6 = WeakRetained;
  if (v4 && WeakRetained)
  {
    id v7 = [WeakRetained tapGestureRecognizer];
    v23[0] = v7;
    uint64_t v8 = [v6 doubleTapGestureRecognizer];
    v23[1] = v8;
    uint64_t v9 = [v6 pressGestureRecognizer];
    v23[2] = v9;
    id v10 = [v6 panGestureRecognizer];
    v23[3] = v10;
    v11 = [v6 rotationGestureRecognizer];
    v23[4] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v4, "removeGestureRecognizer:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }
  }
}

- (void)overlayViewInstalledForPage:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_akController);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_pdfView);
    id v7 = objc_loadWeakRetained((id *)&self->_pdfDocument);
    uint64_t v8 = [v7 indexForPage:v4];

    if ([v6 isUsingPageViewController])
    {
      uint64_t v9 = [v6 documentViewController];
      id v10 = [v9 findPageViewControllerForPageIndex:v8];
      v11 = v10;
      if (v10)
      {
        v12 = [v10 scrollView];
        id v13 = [v12 panGestureRecognizer];
        uint64_t v14 = [WeakRetained panGestureRecognizer];
        [v13 requireGestureRecognizerToFail:v14];

        uint64_t v15 = [v12 panGestureRecognizer];
        uint64_t v16 = [WeakRetained rotationGestureRecognizer];
        [v15 requireGestureRecognizerToFail:v16];

        uint64_t v17 = [v12 pinchGestureRecognizer];
        long long v18 = [WeakRetained panGestureRecognizer];
        [v17 requireGestureRecognizerToFail:v18];

        long long v19 = [v12 pinchGestureRecognizer];
        long long v20 = [WeakRetained rotationGestureRecognizer];
        [v19 requireGestureRecognizerToFail:v20];

        uint64_t v21 = [v6 scrollViewMinimumNumberOfTouches];
        v22 = [v12 panGestureRecognizer];
        [v22 setMinimumNumberOfTouches:v21];
      }
    }
    v23 = [v6 pageViewForPageAtIndex:v8];
    if (v23)
    {
      id v35 = v6;
      v24 = [WeakRetained tapGestureRecognizer];
      id v36 = WeakRetained;
      v25 = [WeakRetained panGestureRecognizer];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v34 = v23;
      obuint64_t j = [v23 subviews];
      uint64_t v39 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v39)
      {
        uint64_t v38 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v45 != v38) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      continue;
                    }
                  }
                }
              }
            }
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            v28 = [v27 gestureRecognizers];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v41;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v41 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v33 requireGestureRecognizerToFail:v24];
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v33 requireGestureRecognizerToFail:v25];
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v40 objects:v48 count:16];
              }
              while (v30);
            }
          }
          uint64_t v39 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v39);
      }

      id WeakRetained = v36;
      v23 = v34;
      id v6 = v35;
    }
  }
}

- (void)overlayViewWillBeUninstalledForPage:(id)a3
{
  id v19 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  if ([WeakRetained isUsingPageViewController])
  {
    id v5 = objc_loadWeakRetained((id *)&self->_pdfDocument);
    uint64_t v6 = [v5 indexForPage:v19];

    id v7 = [WeakRetained documentViewController];
    uint64_t v8 = [v7 findPageViewControllerForPageIndex:v6];
    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_akController);
      if (v9)
      {
        id v10 = [v8 scrollView];
        v11 = [v10 panGestureRecognizer];
        v12 = [v9 panGestureRecognizer];
        [v11 removeFailureRequirement:v12];

        id v13 = [v10 panGestureRecognizer];
        uint64_t v14 = [v9 rotationGestureRecognizer];
        [v13 removeFailureRequirement:v14];

        uint64_t v15 = [v10 pinchGestureRecognizer];
        uint64_t v16 = [v9 panGestureRecognizer];
        [v15 removeFailureRequirement:v16];

        uint64_t v17 = [v10 pinchGestureRecognizer];
        long long v18 = [v9 rotationGestureRecognizer];
        [v17 removeFailureRequirement:v18];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pdfView);
  objc_destroyWeak((id *)&self->_akController);

  objc_destroyWeak((id *)&self->_pdfDocument);
}

@end