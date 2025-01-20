@interface PKTextInputGestureFeedbackView
- (PKTextInputGestureFeedbackView)initWithFrame:(CGRect)a3;
- (id)dataSourceController;
- (void)beginShowingReserveSpaceIntro;
- (void)cancelShowingReserveSpaceIntro;
- (void)layoutSubviews;
- (void)setNeedsRefreshFeedbackViews;
@end

@implementation PKTextInputGestureFeedbackView

- (PKTextInputGestureFeedbackView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKTextInputGestureFeedbackView;
  v3 = -[PKTextInputGestureFeedbackView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKTextInputGestureFeedbackView *)v3 setUserInteractionEnabled:0];
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKTextInputGestureFeedbackView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (void)setNeedsRefreshFeedbackViews
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 408))
    {
      *(unsigned char *)(a1 + 408) = 1;
      [(id)a1 setNeedsLayout];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 416));
      uint64_t v3 = [WeakRetained feedbackType];

      if (v3 != 3)
      {
        -[PKTextInputGestureFeedbackView cancelShowingReserveSpaceIntro]((id *)a1);
      }
    }
  }
}

- (id)dataSourceController
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 52);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)cancelShowingReserveSpaceIntro
{
  if (a1)
  {
    id v2 = a1[54];
    uint64_t v3 = [v2 superview];
    if (v3 == a1)
    {
      v4 = [v2 layer];
      v5 = [v4 animationKeys];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        objc_super v7 = (void *)MEMORY[0x1E4FB1EB0];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __64__PKTextInputGestureFeedbackView_cancelShowingReserveSpaceIntro__block_invoke;
        v10[3] = &unk_1E64C5F60;
        id v11 = v2;
        v12 = a1;
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __64__PKTextInputGestureFeedbackView_cancelShowingReserveSpaceIntro__block_invoke_2;
        v8[3] = &unk_1E64C6730;
        id v9 = v11;
        [v7 animateWithDuration:131076 delay:v10 options:v8 animations:0.15 completion:0.0];
      }
    }
    else
    {
    }
  }
}

- (void)layoutSubviews
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  v111.receiver = self;
  v111.super_class = (Class)PKTextInputGestureFeedbackView;
  [(PKTextInputGestureFeedbackView *)&v111 layoutSubviews];
  uint64_t v3 = -[PKTextInputGestureFeedbackView dataSourceController]((id *)&self->super.super.super.isa);
  v4 = [v3 referenceElementContent];

  v5 = -[PKTextInputGestureFeedbackView dataSourceController]((id *)&self->super.super.super.isa);
  uint64_t v6 = [v5 referenceTextRange];
  uint64_t v8 = v7;

  id v9 = -[PKTextInputGestureFeedbackView dataSourceController]((id *)&self->super.super.super.isa);
  uint64_t v10 = [v9 feedbackType];

  v108 = v4;
  if (!self)
  {
    v103 = v4;
    v15 = 0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    goto LABEL_57;
  }
  if (v10 == 5)
  {
    double v11 = 1.0;
    if (!v4)
    {
      v15 = 0;
      double v12 = 1.0;
      double v13 = 1.0;
      double v14 = 1.0;
      goto LABEL_57;
    }
    double v12 = 1.0;
    double v13 = 1.0;
    double v14 = 1.0;
  }
  else
  {
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v11 = *MEMORY[0x1E4FB2848];
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    v15 = 0;
    if (!v4 || v6 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_57;
    }
  }
  id v16 = v4[1];
  v17 = -[PKTextInputElement coordinateSpace]((uint64_t)v16);

  if (v17)
  {
    if (v10 == 5)
    {
      double v104 = v14;
      double v18 = v13;
      double x = self->__reserveSpaceCaretRect.origin.x;
      double y = self->__reserveSpaceCaretRect.origin.y;
      double width = self->__reserveSpaceCaretRect.size.width;
      double height = self->__reserveSpaceCaretRect.size.height;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceController);
      v24 = [WeakRetained referenceElementContent];

      double v109 = y;
      double v110 = x;
      v118.origin.double x = x;
      v118.origin.double y = y;
      double v25 = width;
      v118.size.double width = width;
      v118.size.double height = height;
      if (!CGRectIsNull(v118))
      {
        v26 = v24 ? (void *)v24[1] : 0;
        id v27 = v26;
        v28 = -[PKTextInputElement coordinateSpace]((uint64_t)v27);

        if (v28)
        {
          if (v24) {
            v29 = (void *)v24[1];
          }
          else {
            v29 = 0;
          }
          id v30 = v29;
          v31 = -[PKTextInputElement coordinateSpace]((uint64_t)v30);
          double v32 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(self, v31, x, y, width, height);
          double v109 = v33;
          double v110 = v32;
          double v25 = v34;
          double height = v35;
        }
      }
      double v105 = v18;
      double v106 = v12;
      double v107 = v11;
      v36 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      id v37 = objc_loadWeakRetained((id *)&self->_dataSourceController);
      v38 = [v37 reserveSpacePlaceholder];

      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      v39 = [v38 rects];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v112 objects:v116 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v113;
        double v43 = height * 0.6;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v113 != v42) {
              objc_enumerationMutation(v39);
            }
            v45 = *(void **)(*((void *)&v112 + 1) + 8 * i);
            [v45 rect];
            double v46 = v119.origin.x;
            double v47 = v119.origin.y;
            double v48 = v119.size.width;
            double v49 = v119.size.height;
            if (!CGRectIsNull(v119))
            {
              int v50 = [v38 shouldIgnoreOrigin];
              if (v50) {
                CGFloat v51 = v110;
              }
              else {
                CGFloat v51 = v46;
              }
              if (v50) {
                CGFloat v52 = v109;
              }
              else {
                CGFloat v52 = v47;
              }
              if (v48 <= v25)
              {
                if (v49 >= v43) {
                  double v54 = -0.0;
                }
                else {
                  double v54 = v49;
                }
                uint64_t v55 = [v45 writingDirection];
                CGFloat v56 = 0.0;
                if (v55 != 1)
                {
                  [(PKTextInputGestureFeedbackView *)self bounds];
                  CGFloat v56 = v51;
                  CGFloat v51 = v57;
                }
                v58 = +[PKTextInputFeedbackRect rectWithFrame:](v56, v52, v51, height + v54);
                [v36 addObject:v58];

                double v59 = height + v52;
                do
                {
                  if (height >= v49) {
                    double v60 = v49;
                  }
                  else {
                    double v60 = height;
                  }
                  if (v49 - v60 >= v43) {
                    CGFloat v61 = v60;
                  }
                  else {
                    CGFloat v61 = v49;
                  }
                  if (v61 >= v43)
                  {
                    [(PKTextInputGestureFeedbackView *)self bounds];
                    v63 = +[PKTextInputFeedbackRect rectWithFrame:](0.0, v59, v62, v61);
                    [v36 addObject:v63];
                  }
                  double v49 = v49 - v61;
                  double v59 = v59 + v61;
                }
                while (v49 > 0.0);
              }
              else if (v49 >= height)
              {
                [v36 addObject:v45];
              }
              else
              {
                if ([v45 writingDirection] == 1) {
                  double v53 = v51 - v48;
                }
                else {
                  double v53 = v51;
                }
                v64 = +[PKTextInputFeedbackRect rectWithFrame:](v53, v52, v48, height);
                [v36 addObject:v64];
              }
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v112 objects:v116 count:16];
        }
        while (v41);
      }

      v4 = v108;
      v15 = -[PKTextInputElementContent rectValuesForSelectionRects:inCoordinateSpace:visibleOnly:](v108, v36, self, 1);

      double v12 = v106;
      double v11 = v107;
      double v14 = v104;
      double v13 = v105;
      uint64_t v10 = 5;
    }
    else
    {
      v15 = [(PKTextInputElementContent *)(uint64_t)v4 selectionRectsForRange:v8 inCoordinateSpace:self visibleOnly:1];
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_57:

  uint64_t v65 = [v15 count];
  if (self)
  {
    unint64_t v66 = v65;
    highlightViews = self->__highlightViews;
    if (highlightViews)
    {
      v68 = highlightViews;
      v69 = (NSArray *)[(NSArray *)v68 mutableCopy];
    }
    else
    {
      v69 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v65];
    }

    while ([(NSArray *)v69 count] > v66)
    {
      v70 = [(NSArray *)v69 lastObject];
      [v70 removeFromSuperview];

      [(NSArray *)v69 removeLastObject];
    }
    if ([(NSArray *)v69 count] < v66)
    {
      double v71 = *MEMORY[0x1E4F1DB28];
      double v72 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v73 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v74 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        v75 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v71, v72, v73, v74);
        [(PKTextInputGestureFeedbackView *)self addSubview:v75];
        [(NSArray *)v69 addObject:v75];
      }
      while ([(NSArray *)v69 count] < v66);
    }
    v76 = self->__highlightViews;
    self->__highlightViews = v69;
  }
  if (v4) {
    id v77 = v4[1];
  }
  else {
    id v77 = 0;
  }
  id v78 = v77;
  v79 = v78;
  if (self)
  {
    if (v10 == 5)
    {
      v82 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_textInputReserveSpaceColor");
      double v80 = 5.0;
    }
    else
    {
      double v80 = 0.0;
      if (v10 == 2)
      {
        uint64_t v81 = [v78 selectionHighlightColor];
      }
      else
      {
        if (v10 != 1)
        {
          v82 = 0;
          goto LABEL_79;
        }
        uint64_t v81 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_textInputDeletionPreviewColor");
      }
      v82 = (void *)v81;
    }
LABEL_79:
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v83 = self->__highlightViews;
    uint64_t v84 = [(NSArray *)v83 countByEnumeratingWithState:&v112 objects:v116 count:16];
    if (v84)
    {
      uint64_t v85 = v84;
      uint64_t v86 = *(void *)v113;
      do
      {
        for (uint64_t j = 0; j != v85; ++j)
        {
          if (*(void *)v113 != v86) {
            objc_enumerationMutation(v83);
          }
          v88 = *(void **)(*((void *)&v112 + 1) + 8 * j);
          [v88 setBackgroundColor:v82];
          [v88 _setCornerRadius:v80];
        }
        uint64_t v85 = [(NSArray *)v83 countByEnumeratingWithState:&v112 objects:v116 count:16];
      }
      while (v85);
    }

    v4 = v108;
  }

  if ([v15 count])
  {
    unint64_t v89 = 0;
    double v90 = v12 + v14;
    double v91 = v11 + v13;
    do
    {
      v92 = [v15 objectAtIndexedSubscript:v89];
      [v92 CGRectValue];
      double v94 = v93;
      double v96 = v95;
      double v98 = v97;
      double v100 = v99;

      if (self) {
        v101 = self->__highlightViews;
      }
      else {
        v101 = 0;
      }
      v102 = [(NSArray *)v101 objectAtIndexedSubscript:v89];
      objc_msgSend(v102, "setFrame:", v12 + v94, v11 + v96, v98 - v90, v100 - v91);

      ++v89;
    }
    while (v89 < [v15 count]);
  }
  if (self) {
    self->__needsRefresh = 0;
  }
}

void __67__PKTextInputGestureFeedbackView__prepareForReserveSpaceAnimations__block_invoke(uint64_t a1)
{
  id v2 = *(double **)(a1 + 32);
  if (v2)
  {
    double v3 = v2[55];
    double v4 = v2[56];
    double v5 = v2[57];
    double v6 = v2[58];
    uint64_t v7 = (void *)*((void *)v2 + 54);
  }
  else
  {
    uint64_t v7 = 0;
    double v6 = 0.0;
    double v5 = 0.0;
    double v4 = 0.0;
    double v3 = 0.0;
  }
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    id v9 = *(void **)(v8 + 432);
  }
  else {
    id v9 = 0;
  }
  [v9 _setCornerRadius:0.0];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    double v11 = *(void **)(v10 + 432);
  }
  else {
    double v11 = 0;
  }
  [v11 setAlpha:1.0];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_textInputReserveSpaceColor");
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    double v14 = *(void **)(v13 + 432);
  }
  else {
    double v14 = 0;
  }
  id v15 = (id)v12;
  [v14 setBackgroundColor:v12];
}

- (void)beginShowingReserveSpaceIntro
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = *(void **)(a1 + 432);
    if (!v2)
    {
      id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      uint64_t v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v5 = *(void **)(a1 + 432);
      *(void *)(a1 + 432) = v4;

      id v2 = *(void **)(a1 + 432);
    }
    id v6 = v2;
    uint64_t v7 = [v6 superview];

    if (v7 != (void *)a1) {
      [(id)a1 addSubview:*(void *)(a1 + 432)];
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v8 = *(id *)(a1 + 424);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v71 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v70 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v70 objects:v74 count:16];
      }
      while (v10);
    }

    uint64_t v13 = [*(id *)(a1 + 432) layer];
    [v13 removeAllAnimations];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 416));
    id v15 = [WeakRetained referenceElementContent];

    id v16 = objc_loadWeakRetained((id *)(a1 + 416));
    uint64_t v17 = [v16 referenceTextRange];

    CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v19 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    CGFloat v20 = v19;
    CGFloat v21 = *MEMORY[0x1E4F1DB20];
    CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v23 = v18;
    CGFloat v24 = v22;
    double v25 = *MEMORY[0x1E4F1DB20];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v26 = v15 ? (void *)v15[1] : 0;
      id v27 = v26;
      v28 = -[PKTextInputElement coordinateSpace]((uint64_t)v27);

      CGFloat v20 = v19;
      CGFloat v23 = v18;
      CGFloat v24 = v22;
      double v25 = v21;
      if (v28) {
        double v25 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:]((uint64_t)v15, v17, (void *)a1);
      }
    }
    *(double *)(a1 + 440) = v25;
    *(CGFloat *)(a1 + 448) = v24;
    *(CGFloat *)(a1 + 456) = v23;
    *(CGFloat *)(a1 + 464) = v20;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __67__PKTextInputGestureFeedbackView__prepareForReserveSpaceAnimations__block_invoke;
    v69[3] = &unk_1E64C61C0;
    v69[4] = a1;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v69];

    id v29 = *(id *)(a1 + 432);
    [v29 frame];
    UIRectInset();
    CGFloat x = v30;
    CGFloat y = v32;
    CGFloat width = v34;
    CGFloat height = v36;
    id v38 = objc_loadWeakRetained((id *)(a1 + 416));
    v39 = [v38 referenceElementContent];

    if (v39) {
      uint64_t v40 = (void *)v39[1];
    }
    else {
      uint64_t v40 = 0;
    }
    id v41 = v40;
    uint64_t v42 = v41;
    if (v41)
    {
      [v41 selectionClipRectInCoordinateSpace:a1];
      CGFloat v21 = v43;
      CGFloat v22 = v44;
      CGFloat v18 = v45;
      CGFloat v19 = v46;
    }

    v76.origin.CGFloat x = v21;
    v76.origin.CGFloat y = v22;
    v76.size.CGFloat width = v18;
    v76.size.CGFloat height = v19;
    if (!CGRectIsNull(v76))
    {
      v77.origin.CGFloat x = x;
      v77.origin.CGFloat y = y;
      v77.size.CGFloat width = width;
      v77.size.CGFloat height = height;
      v79.origin.CGFloat x = v21;
      v79.origin.CGFloat y = v22;
      v79.size.CGFloat width = v18;
      v79.size.CGFloat height = v19;
      CGRect v78 = CGRectIntersection(v77, v79);
      CGFloat x = v78.origin.x;
      CGFloat y = v78.origin.y;
      CGFloat width = v78.size.width;
      CGFloat height = v78.size.height;
    }
    UIRectInset();
    uint64_t v56 = v47;
    uint64_t v49 = v48;
    uint64_t v51 = v50;
    uint64_t v53 = v52;
    double v54 = (void *)MEMORY[0x1E4FB1EB0];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke;
    v63[3] = &unk_1E64CA840;
    id v64 = v29;
    CGFloat v65 = x;
    CGFloat v66 = y;
    CGFloat v67 = width;
    CGFloat v68 = height;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_2;
    v57[3] = &unk_1E64CB430;
    id v58 = v64;
    uint64_t v59 = v56;
    uint64_t v60 = v49;
    uint64_t v61 = v51;
    uint64_t v62 = v53;
    id v55 = v64;
    [v54 animateWithDuration:0x20000 delay:v63 options:v57 animations:0.4 completion:0.0];
  }
}

uint64_t __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(a1 + 32);

  return [v2 _setCornerRadius:5.0];
}

void __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)MEMORY[0x1E4FB1EB0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_3;
    v7[3] = &unk_1E64CA840;
    id v8 = *(id *)(a1 + 32);
    long long v4 = *(_OWORD *)(a1 + 56);
    long long v9 = *(_OWORD *)(a1 + 40);
    long long v10 = v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_4;
    v5[3] = &unk_1E64C6730;
    id v6 = *(id *)(a1 + 32);
    [v3 animateWithDuration:0x20000 delay:v7 options:v5 animations:0.1 completion:0.0];
  }
}

uint64_t __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:0.0];
}

uint64_t __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_4(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) _setCornerRadius:0.0];
    [*(id *)(v2 + 32) setAlpha:1.0];
    id v3 = *(void **)(v2 + 32);
    return [v3 removeFromSuperview];
  }
  return result;
}

uint64_t __64__PKTextInputGestureFeedbackView_cancelShowingReserveSpaceIntro__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = (double *)(v2 + 440);
    double v4 = *v3;
    double v5 = v3[1];
    double v6 = v3[2];
    double v7 = v3[3];
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    double v4 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v4, v5, v6, v7);
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v8 = *(void **)(a1 + 32);

  return [v8 _setCornerRadius:0.0];
}

uint64_t __64__PKTextInputGestureFeedbackView_cancelShowingReserveSpaceIntro__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) setAlpha:1.0];
    [*(id *)(v2 + 32) _setCornerRadius:0.0];
    id v3 = *(void **)(v2 + 32);
    return [v3 removeFromSuperview];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reserveSpaceView, 0);
  objc_storeStrong((id *)&self->__highlightViews, 0);

  objc_destroyWeak((id *)&self->_dataSourceController);
}

@end