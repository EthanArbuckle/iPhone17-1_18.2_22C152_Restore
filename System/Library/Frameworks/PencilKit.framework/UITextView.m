@interface UITextView
@end

@implementation UITextView

uint64_t __89__UITextView_UITextViewDrawing__setStylusDrawingEnabled_drawingClass_sixChannelBlending___block_invoke(uint64_t a1)
{
  return +[PKTiledCanvasView prewarmFutureCanvasesIfNecessarySecureRendering:*(unsigned __int8 *)(a1 + 32) prewarmSharedResourceHandler:1];
}

void __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  if (*(id *)(a1 + 32) == v9)
  {
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_5;
    }
    v10 = [*(id *)(a1 + 40) drawingDelegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0
      || ([*(id *)(a1 + 40) drawingDelegate],
          v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 textView:*(void *)(a1 + 40) shouldDeleteDrawingAtIndex:a3],
          v12,
          v13))
    {
LABEL_5:
      v14 = [*(id *)(a1 + 40) textStorage];
      uint64_t v15 = [v14 length];

      if (a3 == v15)
      {
        uint64_t v16 = [*(id *)(a1 + 40) textStorage];
        objc_msgSend((id)v16, "replaceCharactersInRange:withString:", a3, a4, &stru_1F1FB2C00);

        v17 = [*(id *)(a1 + 40) drawingDelegate];
        LOBYTE(v16) = objc_opt_respondsToSelector();

        if (v16)
        {
          v18 = [*(id *)(a1 + 40) drawingDelegate];
          [v18 textView:*(void *)(a1 + 40) didRemoveDrawingAtIndex:a3];
        }
        objc_msgSend(*(id *)(a1 + 40), "_pk_invalidateLayoutForCharacterRange:invalidateDisplay:ensureLayout:", a3 - 1, 1, 1, 0);
      }
      else
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke_2;
        aBlock[3] = &unk_1E64C9A10;
        id v19 = *(id *)(a1 + 48);
        uint64_t v20 = *(void *)(a1 + 40);
        id v31 = v19;
        uint64_t v32 = v20;
        uint64_t v33 = a3;
        uint64_t v34 = a4;
        v21 = _Block_copy(aBlock);
        v23 = *(void **)(a1 + 40);
        v22 = *(void **)(a1 + 48);
        uint64_t v24 = *(void *)(a1 + 32);
        [v22 bounds];
        double v26 = v25 * -0.0166666667 / 0.3;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke_3;
        v28[3] = &unk_1E64CB040;
        v27 = v21;
        id v29 = v27;
        if (([v23 _growView:v22 textAttachment:v24 atCharacterIndex:a3 step:v28 stop:v26] & 1) == 0) {
          v27[2](v27);
        }
      }
    }
    *a5 = 1;
  }
}

void __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) resignFirstResponder];
  v2 = [*(id *)(a1 + 40) textStorage];
  objc_msgSend(v2, "replaceCharactersInRange:withString:", *(void *)(a1 + 48), *(void *)(a1 + 56), &stru_1F1FB2C00);

  v3 = [*(id *)(a1 + 40) drawingDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) drawingDelegate];
    [v5 textView:*(void *)(a1 + 40) didRemoveDrawingAtIndex:*(void *)(a1 + 48)];
  }
}

BOOL __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke_3(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (a5 <= 10.0) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return a5 <= 10.0;
}

void __85__UITextView_UITextViewDrawing___growView_textAttachment_atCharacterIndex_step_stop___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  [*(id *)(a1 + 32) frame];
  CGRect v18 = CGRectInset(v17, 0.0, *(double *)(a1 + 64) * -0.5);
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  CGRectGetMinY(v18);
  [*(id *)(a1 + 40) bounds];
  CGRectGetMinY(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGRectGetMaxY(v20);
  [*(id *)(a1 + 40) bounds];
  CGRectGetMaxY(v21);
  [*(id *)(a1 + 40) contentOffset];
  objc_msgSend(*(id *)(a1 + 40), "setContentOffset:");
  [*(id *)(a1 + 32) bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = *(double *)(a1 + 64) + v13;
  [*(id *)(a1 + 32) setBounds:v7];
  objc_msgSend(*(id *)(a1 + 48), "setLiveResizeAttachmentBounds:", v8, v10, v12, v14);
  objc_msgSend(*(id *)(a1 + 40), "_pk_invalidateLayoutForCharacterRange:invalidateDisplay:ensureLayout:", *(void *)(a1 + 72), 1, 1, 0);
  if ((*(unsigned int (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(v8, v10, v12, v14))
  {
    [v15 invalidate];
    [*(id *)(a1 + 48) endLiveResize];
  }
}

void __80__UITextView_UITextViewDrawing___undoDrawingBounds_viewBounds_ofAttachmentUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v39 = a2;
  if (PKIsInlineDrawingOrPaperAttachment(v39))
  {
    if (*(void *)(a1 + 32))
    {
      double v8 = objc_msgSend(v39, "viewProviderForParentView:characterIndex:layoutManager:", *(void *)(a1 + 40), a3);
    }
    else
    {
      double v9 = *(void **)(a1 + 48);
      double v10 = [v9 documentRange];
      double v11 = [v10 location];
      double v12 = [v9 locationFromLocation:v11 withOffset:a3];

      double v8 = [*(id *)(a1 + 48) viewProviderForTextAttachment:v39 location:v12];
    }
    uint64_t v13 = objc_opt_class();
    double v14 = [v8 view];
    id v15 = PKDynamicCast(v13, v14);

    uint64_t v16 = [v15 drawing];
    CGRect v17 = [v16 uuid];
    int v18 = [v17 isEqual:*(void *)(a1 + 56)];

    if (v18)
    {
      CGRect v19 = [*(id *)(a1 + 40) undoManager];
      CGRect v20 = [v19 prepareWithInvocationTarget:*(void *)(a1 + 40)];
      CGRect v21 = [v15 drawing];
      [v21 _canvasBounds];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      [v15 bounds];
      objc_msgSend(v20, "_undoDrawingBounds:viewBounds:ofAttachmentUUID:", *(void *)(a1 + 56), v23, v25, v27, v29, v30, v31, v32, v33);

      double v34 = *(double *)(a1 + 64);
      double v35 = *(double *)(a1 + 72);
      double v36 = *(double *)(a1 + 80);
      double v37 = *(double *)(a1 + 88);
      v38 = [v15 drawing];
      objc_msgSend(v38, "set_canvasBounds:", v34, v35, v36, v37);

      objc_msgSend(v15, "setBounds:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
      [v15 updateFrameForTextContainer];
      [v15 drawingDidChange];
      *a5 = 1;
    }
  }
}

void __65__UITextView_UITextViewDrawing___cleanupStaleCachedViewProviders__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _cacheIdentifierForTextAttachment:a2];
  if (v3)
  {
    char v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    v3 = v4;
  }
}

uint64_t __94__UITextView_UITextViewDrawing___pk_checkForTK2LostViewProviderInAttachment_atCharacterIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 3)
  {
    char v4 = [v3 textAttachmentViewProviders];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 count] == 0;
  }
  return 0;
}

@end