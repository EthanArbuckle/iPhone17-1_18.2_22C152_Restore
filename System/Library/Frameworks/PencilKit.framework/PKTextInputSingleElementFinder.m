@interface PKTextInputSingleElementFinder
- (BOOL)isFinished;
- (NSSet)candidateElements;
- (PKTextInputElement)foundElement;
- (void)_finishSingleElementSearchIfReadyAtPosition:(CGPoint)a3 coordinateSpace:(id)a4 candidates:(id)a5 completion:(id)a6;
- (void)findSingleElementAtPosition:(CGPoint)a3 coordinateSpace:(id)a4 completion:(id)a5;
- (void)findSingleElementCloseToPosition:(CGPoint)a3 coordinateSpace:(id)a4 completion:(id)a5;
@end

@implementation PKTextInputSingleElementFinder

- (void)findSingleElementCloseToPosition:(CGPoint)a3 coordinateSpace:(id)a4 completion:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  id v10 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__PKTextInputSingleElementFinder_findSingleElementCloseToPosition_coordinateSpace_completion___block_invoke;
  v18[3] = &unk_1E64C6C08;
  CGFloat v21 = x;
  CGFloat v22 = y;
  v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  CGFloat v11 = *MEMORY[0x1E4F1DB20];
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id v15 = v10;
  id v16 = v9;
  -[PKTextInputElementsFinder _findAvailableTextInputElementsWithReusableElements:referenceHitPoint:referenceSearchArea:referenceCoordSpace:nearPointOnly:completion:]((uint64_t)self, 0, v16, 1u, v18, x, y, v11, v12, v13, v14);
  if (self) {
    foundElements = self->super.__foundElements;
  }
  else {
    foundElements = 0;
  }
  -[PKTextInputSingleElementFinder _finishSingleElementSearchIfReadyAtPosition:coordinateSpace:candidates:completion:](self, "_finishSingleElementSearchIfReadyAtPosition:coordinateSpace:candidates:completion:", v16, foundElements, v15, x, y);
}

unsigned char *__94__PKTextInputSingleElementFinder_findSingleElementCloseToPosition_coordinateSpace_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[64]) {
    return (unsigned char *)objc_msgSend(result, "_finishSingleElementSearchIfReadyAtPosition:coordinateSpace:candidates:completion:", *(void *)(a1 + 40), a2, *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  return result;
}

- (void)findSingleElementAtPosition:(CGPoint)a3 coordinateSpace:(id)a4 completion:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__PKTextInputSingleElementFinder_findSingleElementAtPosition_coordinateSpace_completion___block_invoke;
  v13[3] = &unk_1E64C6C30;
  double v16 = x;
  double v17 = y;
  v13[4] = self;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  -[PKTextInputSingleElementFinder findSingleElementCloseToPosition:coordinateSpace:completion:](self, "findSingleElementCloseToPosition:coordinateSpace:completion:", v12, v13, x, y);
}

void __89__PKTextInputSingleElementFinder_findSingleElementAtPosition_coordinateSpace_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) foundElement];
  v3 = v2;
  id v19 = v2;
  if (v2)
  {
    v4 = -[PKTextInputElement referenceView](v2);
    v5 = [v4 window];

    if (v5)
    {
      double v6 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(*(void **)(a1 + 40), v5, *(double *)(a1 + 56), *(double *)(a1 + 64), *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v8 = v7;
      if ([(PKTextInputElement *)(BOOL)v19 containsPoint:v6 inCoordinateSpace:v7])
      {
        uint64_t v9 = objc_msgSend(v5, "hitTest:withEvent:", 0, v6, v8);
        if (!v9)
        {
LABEL_11:

          v3 = v19;
          goto LABEL_12;
        }
        id v10 = (void *)v9;
        uint64_t v11 = -[PKTextInputElement referenceView](v19);
        if (v10 == (void *)v11)
        {

          goto LABEL_10;
        }
        id v12 = (void *)v11;
        CGFloat v13 = -[PKTextInputElement referenceView](v19);
        if ([v10 isDescendantOfView:v13]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          int v18 = +[PKTextInputElementsFinder shouldAvoidElementWithHitView:]((uint64_t)PKTextInputElementsFinder, v10);

          if (!v18) {
            goto LABEL_11;
          }
        }
        else
        {
        }
      }
    }
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 72);
    *(void *)(v14 + 72) = 0;

    uint64_t v16 = *(void *)(a1 + 32);
    id v10 = *(void **)(v16 + 80);
    *(void *)(v16 + 80) = 0;
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17)
  {
    (*(void (**)(uint64_t, id *))(v17 + 16))(v17, v3);
    v3 = v19;
  }
}

- (void)_finishSingleElementSearchIfReadyAtPosition:(CGPoint)a3 coordinateSpace:(id)a4 candidates:(id)a5 completion:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id obj = a5;
  id v12 = a5;
  v50 = (void (**)(void))a6;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v16 = *(void *)v54;
    double v51 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v52 = *MEMORY[0x1E4F1DB30];
    double v17 = 1.79769313e308;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v54 != v16) {
          objc_enumerationMutation(v12);
        }
        id v19 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v20 = -[PKTextInputElement coordinateSpace]((uint64_t)v19);
        if (v20)
        {
          double v21 = -[PKTextInputElement frame]((uint64_t)v19);
          double v25 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v20, v11, v21, v22, v23, v24);
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;
          v60.origin.double x = -[PKTextInputElement hitToleranceFrameFromElementFrame:](v19, v25, v26, v28, v30);
          v59.double x = x;
          v59.double y = y;
          if (CGRectContainsPoint(v60, v59))
          {
            if (x >= v25)
            {
              double v32 = v25 + v29;
              BOOL v33 = x <= v25 + v29;
              double v25 = x;
              if (!v33) {
                double v25 = v32;
              }
            }
            if (y >= v27)
            {
              double v34 = v27 + v31;
              BOOL v33 = y <= v27 + v31;
              double v27 = y;
              if (!v33) {
                double v27 = v34;
              }
            }
            double v35 = (y - v27) * (y - v27) + (x - v25) * (x - v25);
            if (v15)
            {
              double v36 = vabdd_f64(v35, v17);
              BOOL v37 = v36 < 0.00999999978;
              if (v35 >= v17 && v36 >= 0.00999999978) {
                goto LABEL_26;
              }
            }
            else
            {
              BOOL v37 = 0;
            }
            double v38 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v11, v20, x, y, v52, v51);
            int v40 = [(PKTextInputElement *)v19 shouldBeginAtLocation:v39];
            if (!v15 || !v40 || !v37)
            {
              if (!v40) {
                goto LABEL_26;
              }
LABEL_25:
              v41 = v19;

              id v15 = v41;
              double v17 = v35;
              goto LABEL_26;
            }
            if (-[PKTextInputElement isInFrontOfElement:]((uint64_t)v19, v15)) {
              goto LABEL_25;
            }
          }
        }
LABEL_26:
      }
      uint64_t v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v57, 16, obj);
      if (!v14)
      {
        if (self) {
          goto LABEL_29;
        }
LABEL_40:
        pendingElementContainerReplies = 0;
        goto LABEL_30;
      }
    }
  }
  id v15 = 0;
  if (!self) {
    goto LABEL_40;
  }
LABEL_29:
  pendingElementContainerReplies = self->super.__pendingElementContainerReplies;
LABEL_30:
  uint64_t v43 = [(NSMutableSet *)pendingElementContainerReplies count];
  v44 = -[PKTextInputElement referenceView]((id *)v15);
  v45 = [v44 window];

  if (!v43 && v15 && v45)
  {
    double v46 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v11, v45, x, y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    if (+[PKTextInputElementsFinder _anyOtherWindowAboveWindow:(uint64_t)PKTextInputElementsFinder position:v45])
    {

      id v15 = 0;
    }
  }
  else if (v43)
  {
    goto LABEL_38;
  }
  objc_storeStrong((id *)&self->_candidateElements, obja);
  objc_storeStrong((id *)&self->_foundElement, v15);
  self->_finished = 1;
  if (v50) {
    v50[2](v50);
  }
LABEL_38:
}

- (PKTextInputElement)foundElement
{
  return self->_foundElement;
}

- (NSSet)candidateElements
{
  return self->_candidateElements;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateElements, 0);

  objc_storeStrong((id *)&self->_foundElement, 0);
}

@end