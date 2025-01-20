@interface CKTranscriptPrintPageRenderer
+ (void)renderViewWithText:(id)a3 withOffsetVertical:(double)a4;
- (CGRect)currentPrintableRect;
- (CKPrintTranscriptCollectionViewController)transcriptCollectionViewController;
- (CKTranscriptPrintPageRenderer)initWithTranscriptCollectionViewController:(id)a3;
- (UIScrollView)scrollView;
- (int64_t)__computedNumberOfPagesForPrintableRect:(CGRect)a3;
- (int64_t)numberOfPages;
- (int64_t)numberOfPagesForCurrentConfiguration;
- (void)_determineNumberOfPages;
- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)drawScrollViewAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)setCurrentPrintableRect:(CGRect)a3;
- (void)setNumberOfPagesForCurrentConfiguration:(int64_t)a3;
- (void)setScrollView:(id)a3;
- (void)setTranscriptCollectionViewController:(id)a3;
@end

@implementation CKTranscriptPrintPageRenderer

- (CKTranscriptPrintPageRenderer)initWithTranscriptCollectionViewController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptPrintPageRenderer;
  v6 = [(CKTranscriptPrintPageRenderer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transcriptCollectionViewController, a3);
    uint64_t v8 = [v5 collectionView];
    scrollView = v7->_scrollView;
    v7->_scrollView = (UIScrollView *)v8;

    -[CKTranscriptPrintPageRenderer setCurrentPrintableRect:](v7, "setCurrentPrintableRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKTranscriptPrintPageRenderer *)v7 setNumberOfPagesForCurrentConfiguration:0];
  }

  return v7;
}

- (void)_determineNumberOfPages
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(UIPrintPageRenderer *)self printableRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CKTranscriptPrintPageRenderer *)self currentPrintableRect];
  v23.origin.x = v11;
  v23.origin.y = v12;
  v23.size.width = v13;
  v23.size.height = v14;
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  if (!CGRectEqualToRect(v22, v23))
  {
    [(UIPrintPageRenderer *)self printableRect];
    -[CKTranscriptPrintPageRenderer setNumberOfPagesForCurrentConfiguration:](self, "setNumberOfPagesForCurrentConfiguration:", -[CKTranscriptPrintPageRenderer __computedNumberOfPagesForPrintableRect:](self, "__computedNumberOfPagesForPrintableRect:"));
    [(UIPrintPageRenderer *)self printableRect];
    -[CKTranscriptPrintPageRenderer setCurrentPrintableRect:](self, "setCurrentPrintableRect:");
    id v20 = [(CKTranscriptPrintPageRenderer *)self scrollView];
    [v20 contentSize];
    double v16 = v15;
    double v18 = v17;
    v19 = [(CKTranscriptPrintPageRenderer *)self scrollView];
    objc_msgSend(v19, "setFrame:", 0.0, 0.0, v16, v18);
  }
}

- (int64_t)__computedNumberOfPagesForPrintableRect:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat rect = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v8 = +[CKPrintController sharedInstance];
  [v8 setPrinting:1];

  double v9 = [(CKTranscriptPrintPageRenderer *)self scrollView];
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  CGFloat v10 = [(CKTranscriptPrintPageRenderer *)self scrollView];
  uint64_t v11 = [v10 effectiveUserInterfaceLayoutDirection];
  double v12 = *MEMORY[0x1E4F424F0];
  double v13 = *(double *)(MEMORY[0x1E4F424F0] + 16);
  if (v11) {
    double v14 = *(double *)(MEMORY[0x1E4F424F0] + 24);
  }
  else {
    double v14 = *(double *)(MEMORY[0x1E4F424F0] + 8);
  }
  if (v11) {
    double v15 = *(double *)(MEMORY[0x1E4F424F0] + 8);
  }
  else {
    double v15 = *(double *)(MEMORY[0x1E4F424F0] + 24);
  }

  double v16 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v16, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", 0, 0, 0, 0, width, v12, v14, v13, v15);
  double v18 = v17;

  v19 = [(CKTranscriptPrintPageRenderer *)self transcriptCollectionViewController];
  id v20 = [(CKTranscriptPrintPageRenderer *)self transcriptCollectionViewController];
  v21 = [v20 traitCollection];
  objc_msgSend(v19, "invalidateChatItemLayoutWithNewBalloonMaxWidth:marginInsets:traitCollection:", v21, v18, v12, v14, v13, v15);

  [v9 layoutIfNeeded];
  [v9 contentSize];
  double v23 = v22;
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = rect;
  int64_t v24 = vcvtpd_s64_f64(v23 / CGRectGetHeight(v28));
  v25 = +[CKPrintController sharedInstance];
  [v25 setPrinting:0];

  return v24;
}

- (int64_t)numberOfPages
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(CKTranscriptPrintPageRenderer *)self _determineNumberOfPages];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__CKTranscriptPrintPageRenderer_numberOfPages__block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  return [(CKTranscriptPrintPageRenderer *)self numberOfPagesForCurrentConfiguration];
}

uint64_t __46__CKTranscriptPrintPageRenderer_numberOfPages__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineNumberOfPages];
}

+ (void)renderViewWithText:(id)a3 withOffsetVertical:(double)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_opt_class();
  v84 = v5;
  if (objc_opt_isKindOfClass()) {
    CGContextTranslateCTM(CurrentContext, 0.0, -a4);
  }
  [v5 layoutIfNeeded];
  double v7 = [MEMORY[0x1E4F1CA48] array];
  CGFloat v8 = [MEMORY[0x1E4F1CA48] array];
  [v5 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __71__CKTranscriptPrintPageRenderer_renderViewWithText_withOffsetVertical___block_invoke;
  v108[3] = &unk_1E5621C88;
  id v80 = v7;
  id v109 = v80;
  id v17 = v8;
  id v110 = v17;
  _DFSVisibleSubviewsInRect(v5, v108, v10, v12, v14, v16);
  double v18 = [v5 layer];
  [v18 renderInContext:CurrentContext];

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  obuint64_t j = v17;
  uint64_t v19 = [obj countByEnumeratingWithState:&v104 objects:v114 count:16];
  if (v19)
  {
    id v82 = *(id *)v105;
    uint64_t v20 = *MEMORY[0x1E4F1DAD8];
    uint64_t v21 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(id *)v105 != v82) {
          objc_enumerationMutation(obj);
        }
        double v23 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        if (([v23 isHidden] & 1) == 0)
        {
          long long v99 = xmmword_1E5621CA8;
          long long v100 = *(_OWORD *)off_1E5621CB8;
          *(void *)&long long v101 = 262;
          int64_t v24 = NSString;
          uint64_t v25 = IMFileLocationTrimFileName();
          uint64_t v26 = v101;
          v27 = [NSString stringWithFormat:@"Unexpectedly visible view during printing"];
          CGRect v28 = [v24 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"contentView.hidden", "+[CKTranscriptPrintPageRenderer renderViewWithText:withOffsetVertical:]", v25, v26, v27, v80];

          v29 = (void (*)(void *))IMGetAssertionFailureHandler();
          if (v29)
          {
            v29(v28);
          }
          else if (IMOSLoggingEnabled())
          {
            v30 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v113 = v28;
              _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
            }
          }
        }
        CGContextSaveGState(CurrentContext);
        [v23 frame];
        objc_msgSend(v84, "convertPoint:fromView:", v23);
        double v32 = v31;
        [v23 frame];
        double v34 = v33;
        uint64_t v35 = [v23 suppressMask];
        [v23 setSuppressMask:1];
        [v23 setAlpha:1.0];
        [v23 frame];
        double v37 = v36;
        double v39 = v38;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v99 = 0u;
        if (v23) {
          [v23 balloonDescriptor];
        }
        +[CKPrintController printBalloonDescriptor:&v99];
        v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", v37, v39);
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __71__CKTranscriptPrintPageRenderer_renderViewWithText_withOffsetVertical___block_invoke_112;
        v89[3] = &unk_1E5621CD8;
        v89[4] = v23;
        long long v92 = v101;
        long long v93 = v102;
        long long v94 = v103;
        long long v90 = v99;
        long long v91 = v100;
        uint64_t v95 = v20;
        uint64_t v96 = v21;
        double v97 = v37;
        double v98 = v39;
        v41 = [v40 imageWithActions:v89];
        objc_msgSend(v41, "drawInRect:", v34, v32, v37, v39);
        [v23 setSuppressMask:v35];
        CGContextRestoreGState(CurrentContext);
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v104 objects:v114 count:16];
    }
    while (v19);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v83 = v80;
  uint64_t v42 = [v83 countByEnumeratingWithState:&v85 objects:v111 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v86;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v86 != v43) {
          objc_enumerationMutation(v83);
        }
        v45 = *(void **)(*((void *)&v85 + 1) + 8 * j);
        if (([v45 isHidden] & 1) == 0)
        {
          long long v99 = xmmword_1E5621CF8;
          long long v100 = *(_OWORD *)off_1E5621D08;
          *(void *)&long long v101 = 300;
          v46 = NSString;
          uint64_t v47 = IMFileLocationTrimFileName();
          uint64_t v48 = v101;
          v49 = [NSString stringWithFormat:@"Unexpectedly visible text view during printing"];
          v50 = [v46 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"textContainingView.hidden", "+[CKTranscriptPrintPageRenderer renderViewWithText:withOffsetVertical:]", v47, v48, v49];

          v51 = (void (*)(void *))IMGetAssertionFailureHandler();
          if (v51)
          {
            v51(v50);
          }
          else if (IMOSLoggingEnabled())
          {
            v52 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v113 = v50;
              _os_log_impl(&dword_18EF18000, v52, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
            }
          }
        }
        [v45 bounds];
        double v54 = v53;
        double v56 = v55;
        double v58 = v57;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v59 = v45;
          [v59 setAlpha:1.0];
          objc_msgSend(v84, "convertPoint:fromView:", v59, v54, v56);
          CGFloat v61 = v60;
          double v63 = v62;
          [v59 bounds];
          objc_msgSend(v59, "textRectForBounds:");
          double v65 = v64;
          double v67 = v66;
          double v69 = v68;
          double v71 = v70;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            double v72 = v58 * 0.5 - v71 * 0.5;
          }
          else {
            double v72 = -0.0;
          }
          CGContextSaveGState(CurrentContext);
          CGContextTranslateCTM(CurrentContext, v61, v63 + v72);
          objc_msgSend(v59, "drawTextInRect:", v65, v67, v69, v71);
          CGContextRestoreGState(CurrentContext);
          [v59 setAlpha:0.0];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v45, "ck_drawVisibleTextInCurrentContextWithContainerView:", v84);
          }
          else
          {
            long long v99 = xmmword_1E5621D20;
            long long v100 = *(_OWORD *)off_1E5621D30;
            *(void *)&long long v101 = 321;
            v73 = NSString;
            uint64_t v74 = IMFileLocationTrimFileName();
            uint64_t v75 = v101;
            v76 = [NSString stringWithFormat:@"Unexpected object of class %@ in textContainingViews", objc_opt_class()];
            v77 = [v73 stringWithFormat:@"Failure in %s at %s:%d. %@", "+[CKTranscriptPrintPageRenderer renderViewWithText:withOffsetVertical:]", v74, v75, v76];

            v78 = (void (*)(void *))IMGetAssertionFailureHandler();
            if (v78)
            {
              v78(v77);
            }
            else if (IMOSLoggingEnabled())
            {
              v79 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v113 = v77;
                _os_log_impl(&dword_18EF18000, v79, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
              }
            }
          }
        }
        [v45 setAlpha:1.0];
      }
      uint64_t v42 = [v83 countByEnumeratingWithState:&v85 objects:v111 count:16];
    }
    while (v42);
  }

  CGContextRestoreGState(CurrentContext);
}

uint64_t __71__CKTranscriptPrintPageRenderer_renderViewWithText_withOffsetVertical___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isHidden])
  {
    uint64_t v4 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v3 setAlpha:0.0];
      uint64_t v4 = 0;
      id v5 = (id *)(a1 + 32);
    }
    else
    {
      if (![v3 conformsToProtocol:&unk_1EDF6AF98])
      {
        uint64_t v4 = 1;
        goto LABEL_7;
      }
      [v3 setAlpha:0.0];
      id v5 = (id *)(a1 + 40);
      uint64_t v4 = 1;
    }
    [*v5 addObject:v3];
  }
LABEL_7:

  return v4;
}

void __71__CKTranscriptPrintPageRenderer_renderViewWithText_withOffsetVertical___block_invoke_112(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  [v2 renderInContext:UIGraphicsGetCurrentContext()];

  long long v3 = *(_OWORD *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 88);
  v6[2] = *(_OWORD *)(a1 + 72);
  v6[3] = v4;
  v6[4] = *(_OWORD *)(a1 + 104);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v3;
  id v5 = CKResizableBalloonImage((uint64_t)v6);
  objc_msgSend(v5, "drawInRect:blendMode:alpha:", 22, *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), 1.0);
}

- (void)drawScrollViewAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  CGFloat v6 = +[CKPrintController sharedInstance];
  [v6 setPrinting:1];

  [(UIPrintPageRenderer *)self printableRect];
  double v8 = v7;
  id v10 = [(CKTranscriptPrintPageRenderer *)self scrollView];
  +[CKTranscriptPrintPageRenderer renderViewWithText:v10 withOffsetVertical:v8 * (double)a3];
  double v9 = +[CKPrintController sharedInstance];
  [v9 setPrinting:0];
}

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CKTranscriptPrintPageRenderer_drawPageAtIndex_inRect___block_invoke;
  aBlock[3] = &unk_1E5621D50;
  *(CGFloat *)&aBlock[6] = x;
  *(CGFloat *)&aBlock[7] = y;
  *(CGFloat *)&aBlock[8] = width;
  *(CGFloat *)&aBlock[9] = height;
  aBlock[4] = self;
  aBlock[5] = CurrentContext;
  aBlock[10] = a3;
  double v11 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v11[2](v11);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__CKTranscriptPrintPageRenderer_drawPageAtIndex_inRect___block_invoke_2;
    v12[3] = &unk_1E5620F48;
    double v13 = v11;
    dispatch_sync(MEMORY[0x1E4F14428], v12);
  }
}

void __56__CKTranscriptPrintPageRenderer_drawPageAtIndex_inRect___block_invoke(uint64_t a1)
{
  UIGraphicsPushContext(*(CGContextRef *)(a1 + 40));
  CGContextSaveGState(*(CGContextRef *)(a1 + 40));
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "drawScrollViewAtIndex:inRect:", *(void *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  CGContextRestoreGState(*(CGContextRef *)(a1 + 40));

  UIGraphicsPopContext();
}

uint64_t __56__CKTranscriptPrintPageRenderer_drawPageAtIndex_inRect___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (CKPrintTranscriptCollectionViewController)transcriptCollectionViewController
{
  return self->_transcriptCollectionViewController;
}

- (void)setTranscriptCollectionViewController:(id)a3
{
}

- (int64_t)numberOfPagesForCurrentConfiguration
{
  return self->_numberOfPagesForCurrentConfiguration;
}

- (void)setNumberOfPagesForCurrentConfiguration:(int64_t)a3
{
  self->_numberOfPagesForCurrentConfiguration = a3;
}

- (CGRect)currentPrintableRect
{
  objc_copyStruct(v6, &self->_currentPrintableRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setCurrentPrintableRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_currentPrintableRect, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptCollectionViewController, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end