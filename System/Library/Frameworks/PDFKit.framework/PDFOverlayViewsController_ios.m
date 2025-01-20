@interface PDFOverlayViewsController_ios
- (PDFOverlayViewsController_ios)initWithPDFView:(id)a3;
- (void)_installOverlayForPageView:(id)a3 ofPage:(id)a4 atIndex:(unint64_t)a5;
- (void)_uninstallOverlayForPageView:(id)a3 ofPage:(id)a4 atIndex:(unint64_t)a5;
@end

@implementation PDFOverlayViewsController_ios

- (PDFOverlayViewsController_ios)initWithPDFView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDFOverlayViewsController_ios;
  return [(PDFOverlayViewsController *)&v4 initWithPDFView:a3];
}

- (void)_installOverlayForPageView:(id)a3 ofPage:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9 && a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [(PDFOverlayViewsController *)self viewProvider];
    v12 = [(PDFOverlayViewsController *)self pdfView];
    v13 = [(PDFOverlayViewsController *)self _callOverlayViewForPage:v10];
    if (v13)
    {
      id v14 = v8;
      id v15 = [v13 superview];

      if (v15 != v14)
      {
        [v10 boundsForBox:1];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        uint64_t v24 = [v10 rotation];
        double v25 = PDFDegToRad((double)v24);
        objc_msgSend(v12, "convertRect:fromPage:", v10, v17, v19, v21, v23);
        objc_msgSend(v14, "convertRect:fromView:", v12);
        double x = v58.origin.x;
        double y = v58.origin.y;
        double width = v58.size.width;
        double height = v58.size.height;
        if (!CGRectIsEmpty(v58))
        {
          long long v49 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
          long long v50 = *MEMORY[0x263F000D0];
          *(_OWORD *)&v57.a = *MEMORY[0x263F000D0];
          *(_OWORD *)&v57.c = v49;
          long long v48 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
          *(_OWORD *)&v57.tdouble x = v48;
          id v30 = v11;
          if ((objc_opt_respondsToSelector() & 1) != 0
            && [v30 shouldVerticallyFlipOverlayViews])
          {
            CGAffineTransformMakeScale(&t2, 1.0, -1.0);
            *(_OWORD *)&t1.a = v50;
            *(_OWORD *)&t1.c = v49;
            *(_OWORD *)&t1.tdouble x = v48;
            CGAffineTransformConcat(&v57, &t1, &t2);
          }
          v51 = v30;
          if (v24)
          {
            CGAffineTransformMakeRotation(&v54, v25);
            CGAffineTransform v53 = v57;
            CGAffineTransformConcat(&t1, &v53, &v54);
            CGAffineTransform v57 = t1;
          }
          v31 = objc_msgSend(v13, "layer", v48, v49);
          objc_msgSend(v31, "setAnchorPoint:", 0.5, 0.5);

          CGAffineTransform v52 = v57;
          [v13 setTransform:&v52];
          objc_msgSend(v13, "setFrame:", x, y, width, height);
          [v14 addSubview:v13];
          [v14 setOverlayViewInstalled:1];
          [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
          v32 = [v13 centerXAnchor];
          v33 = [v14 centerXAnchor];
          v34 = [v32 constraintEqualToAnchor:v33];
          [v34 setActive:1];

          v35 = [v13 centerYAnchor];
          v36 = [v14 centerYAnchor];
          v37 = [v35 constraintEqualToAnchor:v36];
          [v37 setActive:1];

          if (v24 == 270 || v24 == 90)
          {
            v38 = [v13 widthAnchor];
            v39 = [v14 heightAnchor];
            v40 = [v38 constraintEqualToAnchor:v39];
            [v40 setActive:1];

            v41 = [v13 heightAnchor];
            uint64_t v42 = [v14 widthAnchor];
          }
          else
          {
            v43 = [v13 widthAnchor];
            v44 = [v14 widthAnchor];
            v45 = [v43 constraintEqualToAnchor:v44];
            [v45 setActive:1];

            v41 = [v13 heightAnchor];
            uint64_t v42 = [v14 heightAnchor];
          }
          v46 = (void *)v42;
          v47 = [v41 constraintEqualToAnchor:v42];
          [v47 setActive:1];

          if (objc_opt_respondsToSelector()) {
            [v51 pdfView:v12 willDisplayOverlayView:v13 forPage:v10];
          }
        }
      }
    }
  }
}

- (void)_uninstallOverlayForPageView:(id)a3 ofPage:(id)a4 atIndex:(unint64_t)a5
{
  id v13 = a3;
  id v7 = a4;
  if ([v13 isOverlayViewInstalled])
  {
    id v8 = [(PDFOverlayViewsController *)self _cachedOverlayViewForPage:v7];
    [(PDFOverlayViewsController *)self _callWillEndDisplayingOverlayViewForPage:v7];
    if ([v8 isFirstResponder])
    {
      id v9 = [(PDFOverlayViewsController *)self pdfDocument];
      v10 = [v9 akDocumentAdaptor];

      v11 = [v10 akMainController];
      v12 = [v11 modernToolbarView];
      [v12 becomeFirstResponder];
    }
    else
    {
      v10 = [v8 superview];
      [v10 becomeFirstResponder];
    }

    [v13 setOverlayViewInstalled:0];
    [v8 removeFromSuperview];
  }
}

@end