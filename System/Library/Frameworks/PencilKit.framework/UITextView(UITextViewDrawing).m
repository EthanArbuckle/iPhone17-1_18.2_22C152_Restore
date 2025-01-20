@interface UITextView(UITextViewDrawing)
- (BOOL)_canInsertDrawingInRange:()UITextViewDrawing;
- (BOOL)_growView:()UITextViewDrawing textAttachment:atCharacterIndex:step:stop:;
- (BOOL)isPaperEnabled;
- (BOOL)isStylusDrawingEnabled;
- (double)_boundsForDrawingTextAttachment:()UITextViewDrawing characterIndex:layoutManager:;
- (double)_pk_boundsForDrawingTextAttachment:()UITextViewDrawing characterIndex:;
- (double)_pk_lineFragmentRectForGlyphAtCharacterIndex:()UITextViewDrawing;
- (id)_cacheIdentifierForTextAttachment:()UITextViewDrawing;
- (id)_cachedViewProviderForTextAttachment:()UITextViewDrawing;
- (id)_drawingInfo;
- (id)_drawingInfoCreateIfNecessary;
- (id)_insertDrawing:()UITextViewDrawing;
- (id)_insertEmptyDrawingAttachmentAtLocation:()UITextViewDrawing;
- (id)_pk_textRangeFromCharacterRange:()UITextViewDrawing textLayoutManager:;
- (id)_pk_viewProviderForAttachment:()UITextViewDrawing atCharacterIndex:createIfNeeded:;
- (id)_textRangeFromRange:()UITextViewDrawing;
- (id)_tool;
- (id)drawingDelegate;
- (id)ink;
- (id)linedPaper;
- (id)paperTexture;
- (uint64_t)_canAddDrawingAtIndex:()UITextViewDrawing;
- (uint64_t)_canAddStroke;
- (uint64_t)_canInsertDrawing;
- (uint64_t)_canSelectDrawing;
- (uint64_t)_cropDrawingAttachmentsWhenViewIsSmaller;
- (uint64_t)_isHandwritingToolSelected;
- (uint64_t)isFingerDrawingEnabled;
- (uint64_t)isRulerEnabled;
- (uint64_t)setPaperEnabled:()UITextViewDrawing;
- (uint64_t)setStylusDrawingEnabled:()UITextViewDrawing;
- (void)_canvasViewWillCreateSnapshot;
- (void)_cleanupStaleCachedViewProviders;
- (void)_clearDrawingInfo;
- (void)_didEndInteractiveResize;
- (void)_didEndStroke;
- (void)_pkTiledViewIfEnabled;
- (void)_pk_checkForTK2LostViewProviderInAttachment:()UITextViewDrawing atCharacterIndex:;
- (void)_pk_ensureLayoutForCharacterRange:()UITextViewDrawing;
- (void)_pk_invalidateLayoutForCharacterRange:()UITextViewDrawing invalidateDisplay:ensureLayout:;
- (void)_removeDrawingAttachment:()UITextViewDrawing withView:forDeletion:;
- (void)_setCachedViewProvider:()UITextViewDrawing textAttachment:;
- (void)_setCropDrawingAttachmentsWhenViewIsSmaller:()UITextViewDrawing;
- (void)_setSelectedInkColor:()UITextViewDrawing;
- (void)_setTool:()UITextViewDrawing;
- (void)_undoDrawingBounds:()UITextViewDrawing viewBounds:ofAttachmentUUID:;
- (void)_updateDrawingBackgroundColor;
- (void)_upgradeDrawingAtCharacterIndex:()UITextViewDrawing itemProviders:insertionLocationInDrawing:;
- (void)_willBeginInteractiveResize;
- (void)_willBeginNewStrokeForTouch:()UITextViewDrawing;
- (void)setDrawingDelegate:()UITextViewDrawing;
- (void)setInk:()UITextViewDrawing;
- (void)setLinedPaper:()UITextViewDrawing;
- (void)setPaperTexture:()UITextViewDrawing;
- (void)setRulerEnabled:()UITextViewDrawing;
- (void)setStylusDrawingEnabled:()UITextViewDrawing drawingClass:sixChannelBlending:;
@end

@implementation UITextView(UITextViewDrawing)

- (uint64_t)setPaperEnabled:()UITextViewDrawing
{
  uint64_t v5 = PKIsSixChannelBlendEnabledInPaper() & a3;
  v6 = +[PKDrawing drawingClassForPaper];

  return [a1 setStylusDrawingEnabled:a3 drawingClass:v6 sixChannelBlending:v5];
}

- (id)drawingDelegate
{
  uint64_t v1 = [a1 _drawingInfo];
  v2 = (void *)v1;
  if (v1) {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
  }
  else {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (void)setDrawingDelegate:()UITextViewDrawing
{
  id obj = a3;
  uint64_t v4 = [a1 _drawingInfo];
  uint64_t v5 = (void *)v4;
  if (v4) {
    objc_storeWeak((id *)(v4 + 32), obj);
  }
}

- (void)setLinedPaper:()UITextViewDrawing
{
  id v4 = a3;
  id v5 = [a1 _pkTiledViewIfEnabled];
  [v5 setLinedPaper:v4];
}

- (void)setStylusDrawingEnabled:()UITextViewDrawing drawingClass:sixChannelBlending:
{
  if (a3)
  {
    v8 = [a1 _drawingInfo];
    uint64_t v9 = objc_opt_class();

    if ((void *)v9 == a4)
    {
      v10 = 0;
      id obj = 0;
    }
    else
    {
      v10 = [a1 _pkTiledViewIfEnabled];
      id obj = [a1 drawingDelegate];
      v11 = [a1 _pkTiledViewIfEnabled];
      [v11 removeFromSuperview];

      [a1 _clearDrawingInfo];
    }
    if (objc_msgSend(a1, "isStylusDrawingEnabled", obj))
    {
      [a1 isStylusDrawingEnabled];
    }
    else
    {
      v13 = [a1 window];
      v14 = [v13 screen];
      v15 = [v14 displayIdentity];
      char v16 = [v15 expectsSecureRendering];

      v17 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89__UITextView_UITextViewDrawing__setStylusDrawingEnabled_drawingClass_sixChannelBlending___block_invoke;
      block[3] = &__block_descriptor_33_e5_v8__0l;
      char v36 = v16;
      dispatch_async(v17, block);

      +[PKTextAttachmentDrawingViewProvider registerViewProviderClassIfNecessary];
      uint64_t v18 = [a1 _drawingInfoCreateIfNecessary];
      v19 = objc_msgSend(objc_alloc(+[PKTextAttachmentDrawingViewProvider tiledViewClassForDrawingClass:](PKTextAttachmentDrawingViewProvider, "tiledViewClassForDrawingClass:", a4)), "initInScrollView:sixChannelBlending:defaultDrawingClass:", a1, a5, a4);
      if (v18)
      {
        objc_storeStrong((id *)(v18 + 24), v19);

        id v20 = a4;
        v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v20;
      }

      if (v10)
      {
        v21 = [v10 ink];
        v22 = v18 ? *(void **)(v18 + 24) : 0;
        [v22 setInk:v21];

        uint64_t v23 = [v10 cropDrawingAttachmentsWhenViewIsSmaller];
        v24 = v18 ? *(void **)(v18 + 24) : 0;
        [v24 setCropDrawingAttachmentsWhenViewIsSmaller:v23];
        v25 = [v10 linedPaper];
        v26 = v18 ? *(void **)(v18 + 24) : 0;
        [v26 setLinedPaper:v25];

        uint64_t v27 = [v10 rulerEnabled];
        if (v18)
        {
          [*(id *)(v18 + 24) setRulerEnabled:v27];
          objc_storeWeak((id *)(v18 + 32), obja);
        }
        else
        {
          [0 setRulerEnabled:v27];
        }
        if ([v10 overrideUserInterfaceStyle])
        {
          uint64_t v28 = [v10 overrideUserInterfaceStyle];
          if (v18) {
            v29 = *(void **)(v18 + 24);
          }
          else {
            v29 = 0;
          }
          [v29 setOverrideUserInterfaceStyle:v28];
        }
      }
      [a1 _updateDrawingBackgroundColor];
      if ([a1 isPaperEnabled])
      {
        if (v18)
        {
          v30 = [*(id *)(v18 + 24) canvasView];
          [v30 setOpaque:0];

          v31 = *(void **)(v18 + 24);
        }
        else
        {
          v32 = [0 canvasView];
          [v32 setOpaque:0];

          v31 = 0;
        }
        [v31 setCanvasViewZOrderPolicy:1];
      }
    }
  }
  else
  {
    [a1 isStylusDrawingEnabled];
    if ([a1 isStylusDrawingEnabled])
    {
      objc_msgSend(a1, "_setContentScrollInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      v12 = [a1 _pkTiledViewIfEnabled];
      [v12 removeFromSuperview];

      [a1 _clearDrawingInfo];
    }
  }
}

- (BOOL)isPaperEnabled
{
  if (![a1 isStylusDrawingEnabled]) {
    return 0;
  }
  uint64_t v2 = [a1 _drawingInfo];
  v3 = (void *)v2;
  if (v2) {
    id v4 = *(objc_class **)(v2 + 40);
  }
  else {
    id v4 = 0;
  }
  BOOL v5 = v4 == +[PKDrawing drawingClassForPaper];

  return v5;
}

- (BOOL)isStylusDrawingEnabled
{
  uint64_t v1 = [a1 _pkTiledViewIfEnabled];
  BOOL v2 = v1 != 0;

  return v2;
}

- (void)_pkTiledViewIfEnabled
{
  uint64_t v1 = [a1 _drawingInfo];
  BOOL v2 = v1;
  if (v1) {
    uint64_t v1 = (void *)v1[3];
  }
  v3 = v1;

  return v3;
}

- (id)_drawingInfo
{
  return objc_getAssociatedObject(a1, "/Library/Caches/com.apple.xbs/Sources/PencilKit/PencilKit/Text/UITextView_PencilKit.m");
}

- (void)_updateDrawingBackgroundColor
{
  BOOL v2 = [a1 paperTexture];
  if (!v2)
  {
    if ([a1 isPaperEnabled]) {
      return;
    }
    id v8 = [a1 backgroundColor];
    [v8 alphaComponent];
    double v4 = v3;
    BOOL v5 = [a1 _pkTiledViewIfEnabled];
    v6 = [v5 canvasView];
    if (v4 <= 0.0) {
      id v7 = 0;
    }
    else {
      id v7 = v8;
    }
    [v6 setCanvasBackgroundColor:v7];

    BOOL v2 = v8;
  }
}

- (id)paperTexture
{
  uint64_t v1 = [a1 _pkTiledViewIfEnabled];
  BOOL v2 = [v1 paperTexture];

  return v2;
}

- (id)_drawingInfoCreateIfNecessary
{
  uint64_t v2 = objc_getAssociatedObject(a1, "/Library/Caches/com.apple.xbs/Sources/PencilKit/PencilKit/Text/UITextView_PencilKit.m");
  if (!v2)
  {
    double v3 = [UITextViewDrawingInfo alloc];
    if (v3)
    {
      v8.receiver = v3;
      v8.super_class = (Class)UITextViewDrawingInfo;
      id v4 = a1;
      uint64_t v2 = (uint64_t)objc_msgSendSuper2(&v8, sel_init);
      objc_storeWeak((id *)(v2 + 16), v4);

      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v8.receiver, v8.super_class);
      v6 = *(void **)(v2 + 48);
      *(void *)(v2 + 48) = v5;
    }
    else
    {
      uint64_t v2 = 0;
    }
    objc_setAssociatedObject(a1, "/Library/Caches/com.apple.xbs/Sources/PencilKit/PencilKit/Text/UITextView_PencilKit.m", (id)v2, (void *)1);
  }

  return (id)v2;
}

- (void)_clearDrawingInfo
{
}

- (id)ink
{
  uint64_t v1 = [a1 _pkTiledViewIfEnabled];
  uint64_t v2 = [v1 ink];

  return v2;
}

- (void)setInk:()UITextViewDrawing
{
  id v4 = a3;
  id v5 = [a1 _pkTiledViewIfEnabled];
  [v5 setInk:v4];
}

- (id)_tool
{
  uint64_t v1 = [a1 ink];
  if (v1)
  {
    uint64_t v2 = +[PKTool _toolWithInk:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)_setTool:()UITextViewDrawing
{
  id v5 = [a3 ink];
  id v4 = [a1 _pkTiledViewIfEnabled];
  [v4 setInk:v5];
}

- (void)_setSelectedInkColor:()UITextViewDrawing
{
  id v5 = a3;
  id v4 = [a1 _pkTiledViewIfEnabled];
  if ([v4 _hasSelection]) {
    [v4 setSelectedStrokesColor:v5];
  }
}

- (uint64_t)_isHandwritingToolSelected
{
  uint64_t v1 = [a1 ink];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 _isHandwritingInk];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)setRulerEnabled:()UITextViewDrawing
{
  id v4 = [a1 _pkTiledViewIfEnabled];
  [v4 setRulerEnabled:a3];
}

- (uint64_t)isRulerEnabled
{
  uint64_t v1 = [a1 _pkTiledViewIfEnabled];
  uint64_t v2 = [v1 rulerEnabled];

  return v2;
}

- (id)linedPaper
{
  uint64_t v1 = [a1 _pkTiledViewIfEnabled];
  uint64_t v2 = [v1 linedPaper];

  return v2;
}

- (uint64_t)_cropDrawingAttachmentsWhenViewIsSmaller
{
  uint64_t v1 = [a1 _pkTiledViewIfEnabled];
  uint64_t v2 = [v1 cropDrawingAttachmentsWhenViewIsSmaller];

  return v2;
}

- (void)_setCropDrawingAttachmentsWhenViewIsSmaller:()UITextViewDrawing
{
  id v4 = [a1 _pkTiledViewIfEnabled];
  [v4 setCropDrawingAttachmentsWhenViewIsSmaller:a3];
}

- (void)setPaperTexture:()UITextViewDrawing
{
  id v4 = a3;
  id v5 = [a1 _pkTiledViewIfEnabled];
  [v5 setPaperTexture:v4];
}

- (uint64_t)setStylusDrawingEnabled:()UITextViewDrawing
{
  uint64_t v5 = objc_opt_class();

  return [a1 setStylusDrawingEnabled:a3 drawingClass:v5 sixChannelBlending:0];
}

- (uint64_t)isFingerDrawingEnabled
{
  uint64_t result = [a1 isStylusDrawingEnabled];
  if (result)
  {
    uint64_t v3 = [a1 _pkTiledViewIfEnabled];
    uint64_t v4 = [v3 allowsFingerDrawing];

    return v4;
  }
  return result;
}

- (void)_willBeginInteractiveResize
{
  id v1 = [a1 _pkTiledViewIfEnabled];
  [v1 _willBeginInteractiveResize];
}

- (void)_didEndInteractiveResize
{
  id v1 = [a1 _pkTiledViewIfEnabled];
  [v1 _didEndInteractiveResize];
}

- (double)_boundsForDrawingTextAttachment:()UITextViewDrawing characterIndex:layoutManager:
{
  uint64_t v3 = objc_msgSend(a3, "viewProviderForParentView:characterIndex:layoutManager:", a1);
  uint64_t v4 = [v3 view];
  if (objc_opt_respondsToSelector())
  {
    [v4 drawingTextAttachmentBounds];
    double v6 = v5;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
  }

  return v6;
}

- (double)_pk_boundsForDrawingTextAttachment:()UITextViewDrawing characterIndex:
{
  id v6 = a3;
  if (![v6 pkInserting]
    || ([a1 textLayoutManager], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_super v8 = objc_msgSend(a1, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v6, a4, 1);
    uint64_t v9 = [v8 view];
    if (objc_opt_respondsToSelector())
    {
      [v9 drawingTextAttachmentBoundsForContainerView:a1];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        double v11 = *MEMORY[0x1E4F1DB20];
        goto LABEL_10;
      }
      [v9 drawingTextAttachmentBounds];
    }
    double v11 = v10;
LABEL_10:

    goto LABEL_11;
  }
  double v11 = *MEMORY[0x1E4F1DB20];
LABEL_11:

  return v11;
}

- (id)_textRangeFromRange:()UITextViewDrawing
{
  id v7 = [a1 beginningOfDocument];
  objc_super v8 = [a1 positionFromPosition:v7 offset:a3];

  uint64_t v9 = [a1 positionFromPosition:v8 offset:a4];
  double v10 = [a1 textRangeFromPosition:v8 toPosition:v9];

  return v10;
}

- (id)_insertEmptyDrawingAttachmentAtLocation:()UITextViewDrawing
{
  if (objc_msgSend(a1, "_canAddDrawingAtIndex:")
    && ([a1 textStorage], double v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [a1 _drawingInfo];
    id v7 = v6;
    if (v6) {
      id v6 = (void *)v6[5];
    }
    objc_super v8 = [v6 fileType];

    uint64_t v9 = [a1 drawingDelegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      double v11 = [a1 drawingDelegate];
      [v11 textView:a1 willAddDrawingAtIndex:a3];
    }
    v12 = [a1 drawingDelegate];
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0
      || ([a1 drawingDelegate],
          v14 = objc_claimAutoreleasedReturnValue(),
          [v14 textView:a1 newAttachmentForFileType:v8],
          v15 = objc_claimAutoreleasedReturnValue(),
          v14,
          !v15))
    {
      char v16 = (objc_class *)[MEMORY[0x1E4FB0870] textAttachmentClassForFileType:v8];
      if (!v16) {
        char v16 = (objc_class *)objc_opt_class();
      }
      id v17 = [v16 alloc];
      uint64_t v18 = [MEMORY[0x1E4F1C9B8] data];
      v15 = (void *)[v17 initWithData:v18 ofType:v8];
    }
    [a1 contentOffset];
    objc_msgSend(a1, "setContentOffset:");
    [a1 resignFirstResponder];
    [a1 bounds];
    objc_msgSend(v15, "setBounds:", 0.0, 0.0);
    [v15 setPkInserting:1];
    v19 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v15];
    uint64_t v20 = [a1 selectedRange];
    uint64_t v22 = v21;
    objc_msgSend(a1, "setSelectedRange:", a3, 0);
    [a1 _pasteAttributedString:v19 pasteAsRichText:1];
    objc_msgSend(a1, "setSelectedRange:", v20, v22);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_removeDrawingAttachment:()UITextViewDrawing withView:forDeletion:
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [a1 textStorage];
  uint64_t v11 = *MEMORY[0x1E4FB06B8];
  v12 = [a1 textStorage];
  uint64_t v13 = [v12 length];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke;
  v16[3] = &unk_1E64CB068;
  char v20 = a5;
  id v17 = v8;
  uint64_t v18 = a1;
  id v19 = v9;
  id v14 = v9;
  id v15 = v8;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v13, 0, v16);
}

- (BOOL)_growView:()UITextViewDrawing textAttachment:atCharacterIndex:step:stop:
{
  id v11 = a4;
  id v12 = a7;
  uint64_t v13 = objc_opt_class();
  id v14 = PKDynamicCast(v13, v11);
  id v15 = v14;
  if (v14)
  {
    [v14 beginLiveResize];
    char v16 = (void *)MEMORY[0x1E4F1CB00];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__UITextView_UITextViewDrawing___growView_textAttachment_atCharacterIndex_step_stop___block_invoke;
    v19[3] = &unk_1E64CB090;
    double v24 = a2;
    id v20 = v11;
    uint64_t v21 = a1;
    id v22 = v15;
    uint64_t v25 = a6;
    id v23 = v12;
    id v17 = (id)[v16 scheduledTimerWithTimeInterval:1 repeats:v19 block:0.0166666667];
  }
  return v15 != 0;
}

- (void)_undoDrawingBounds:()UITextViewDrawing viewBounds:ofAttachmentUUID:
{
  id v20 = a11;
  uint64_t v21 = [a1 textContainer];
  id v22 = [v21 textLayoutManager];
  if (v22)
  {
    id v23 = 0;
  }
  else
  {
    id v23 = [a1 layoutManager];
  }
  double v24 = [a1 textStorage];
  uint64_t v25 = *MEMORY[0x1E4FB06B8];
  v26 = [a1 textStorage];
  uint64_t v27 = [v26 length];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __80__UITextView_UITextViewDrawing___undoDrawingBounds_viewBounds_ofAttachmentUUID___block_invoke;
  v31[3] = &unk_1E64CB0B8;
  id v32 = v23;
  v33 = a1;
  id v34 = v22;
  id v35 = v20;
  double v36 = a2;
  double v37 = a3;
  double v38 = a4;
  double v39 = a5;
  double v40 = a6;
  double v41 = a7;
  double v42 = a8;
  double v43 = a9;
  id v28 = v20;
  id v29 = v22;
  id v30 = v23;
  objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v25, 0, v27, 0, v31);
}

- (void)_upgradeDrawingAtCharacterIndex:()UITextViewDrawing itemProviders:insertionLocationInDrawing:
{
  id v13 = a6;
  char v10 = [a1 drawingDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [a1 drawingDelegate];
    objc_msgSend(v12, "textView:upgradeDrawingAtIndex:itemProviders:insertionLocationInDrawing:", a1, a5, v13, a2, a3);
  }
}

- (void)_canvasViewWillCreateSnapshot
{
  id v3 = [a1 superview];
  uint64_t v2 = [a1 _pkTiledViewIfEnabled];
  [v2 setContentSnapshottingView:v3];
}

- (void)_willBeginNewStrokeForTouch:()UITextViewDrawing
{
  id v10 = a3;
  [a1 _updateDrawingBackgroundColor];
  uint64_t v4 = [a1 drawingDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [a1 drawingDelegate];
    [v6 textViewWillBeginStroke:a1];
  }
  id v7 = [a1 drawingDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [a1 drawingDelegate];
    [v9 textViewWillBeginStroke:a1 forTouch:v10];
  }
}

- (void)_didEndStroke
{
  uint64_t v2 = [a1 drawingDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [a1 drawingDelegate];
    [v4 textViewDidEndStroke:a1];
  }
}

- (uint64_t)_canAddStroke
{
  uint64_t v2 = [a1 drawingDelegate];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 1;
  }
  id v4 = [a1 drawingDelegate];
  uint64_t v5 = [v4 textViewCanAddStroke:a1];

  return v5;
}

- (uint64_t)_canAddDrawingAtIndex:()UITextViewDrawing
{
  uint64_t v5 = [a1 drawingDelegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 1;
  }
  id v7 = [a1 drawingDelegate];
  uint64_t v8 = [v7 textView:a1 canAddDrawingAtIndex:a3];

  return v8;
}

- (uint64_t)_canInsertDrawing
{
  uint64_t v3 = [a1 selectedRange];

  return objc_msgSend(a1, "_canInsertDrawingInRange:", v3, v2);
}

- (BOOL)_canInsertDrawingInRange:()UITextViewDrawing
{
  BOOL v7 = 0;
  if ([a1 isStylusDrawingEnabled] && !a4)
  {
    uint64_t v8 = [a1 textStorage];
    if ([v8 length])
    {
      id v9 = [a1 textStorage];
      BOOL v7 = a3 < [v9 length] - 1;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (id)_insertDrawing:()UITextViewDrawing
{
  id result = (id)[a1 selectedRange];
  if (result != (id)0x7FFFFFFFFFFFFFFFLL) {
    return (id)[a1 _insertEmptyDrawingAttachmentAtLocation:result];
  }
  return result;
}

- (uint64_t)_canSelectDrawing
{
  uint64_t v2 = [a1 drawingDelegate];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 1;
  }
  id v4 = [a1 drawingDelegate];
  uint64_t v5 = [v4 textViewCanSelectDrawing:a1];

  return v5;
}

- (id)_pk_textRangeFromCharacterRange:()UITextViewDrawing textLayoutManager:
{
  id v7 = a5;
  uint64_t v8 = [v7 documentRange];
  id v9 = [v8 location];
  id v10 = [v7 locationFromLocation:v9 withOffset:a3];

  char v11 = [v7 locationFromLocation:v10 withOffset:a4];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB08B0]) initWithLocation:v10 endLocation:v11];

  return v12;
}

- (void)_pk_invalidateLayoutForCharacterRange:()UITextViewDrawing invalidateDisplay:ensureLayout:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v11 = [a1 textContainer];
  id v12 = [v11 textLayoutManager];
  if (v12 || ([a1 layoutManager], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v13 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v24.location = a3;
      v24.length = a4;
      id v14 = NSStringFromRange(v24);
      int v19 = 138412546;
      id v20 = v14;
      __int16 v21 = 1024;
      int v22 = a6;
      _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "invalidateLayoutFor: %@, ensureLayout: %{BOOL}d", (uint8_t *)&v19, 0x12u);
    }
    id v15 = objc_msgSend(a1, "_pk_textRangeFromCharacterRange:textLayoutManager:", a3, a4, v12);
    [v12 invalidateLayoutForRange:v15];
    if (a6)
    {
      char v16 = [v12 textViewportLayoutController];
      [v16 layoutViewport];
    }
    id v17 = 0;
  }
  else
  {
    id v17 = v18;
    objc_msgSend(v18, "invalidateLayoutForCharacterRange:actualCharacterRange:", a3, a4, 0);
    if (a5) {
      objc_msgSend(v17, "invalidateDisplayForCharacterRange:", a3, a4);
    }
    if (a6) {
      objc_msgSend(v17, "ensureLayoutForCharacterRange:", a3, a4);
    }
  }
}

- (void)_pk_ensureLayoutForCharacterRange:()UITextViewDrawing
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = [a1 textContainer];
  uint64_t v8 = [v7 textLayoutManager];
  if (v8 || ([a1 layoutManager], (id v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17.location = a3;
      v17.length = a4;
      id v10 = NSStringFromRange(v17);
      int v14 = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "ensureLayoutFor: %@", (uint8_t *)&v14, 0xCu);
    }
    char v11 = objc_msgSend(a1, "_pk_textRangeFromCharacterRange:textLayoutManager:", a3, a4, v8);
    [v8 invalidateLayoutForRange:v11];
    id v12 = [v8 textViewportLayoutController];
    [v12 layoutViewport];
  }
  else
  {
    char v11 = v13;
    objc_msgSend(v13, "ensureLayoutForCharacterRange:", a3, a4);
  }
}

- (double)_pk_lineFragmentRectForGlyphAtCharacterIndex:()UITextViewDrawing
{
  uint64_t v5 = [a1 textContainer];
  char v6 = [v5 textLayoutManager];
  if (v6 || ([a1 layoutManager], (id v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v7 = [v6 documentRange];
    uint64_t v8 = [v7 location];
    id v9 = [v6 locationFromLocation:v8 withOffset:a3];

    id v10 = [v6 textLayoutFragmentForLocation:v9];
    [v10 layoutFragmentFrame];
    double v12 = v11;
  }
  else
  {
    id v9 = v13;
    objc_msgSend(v13, "lineFragmentRectForGlyphAtIndex:effectiveRange:", objc_msgSend(v13, "glyphIndexForCharacterAtIndex:", a3), 0);
    double v12 = v14;
  }

  return v12;
}

- (id)_pk_viewProviderForAttachment:()UITextViewDrawing atCharacterIndex:createIfNeeded:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [a1 textContainer];
  id v10 = [v9 textLayoutManager];
  if (!v10)
  {
    uint64_t v17 = [a1 layoutManager];
    if (v17)
    {
      id v13 = (void *)v17;
      double v14 = [v8 viewProviderForParentView:a1 characterIndex:a4 layoutManager:v17];
      goto LABEL_11;
    }
  }
  double v11 = [v10 documentRange];
  double v12 = [v11 location];
  id v13 = [v10 locationFromLocation:v12 withOffset:a4];

  double v14 = [v10 viewProviderForTextAttachment:v8 location:v13];
  if (v14 || !a5)
  {
LABEL_11:

    if (!v14) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  id v15 = [a1 _cachedViewProviderForTextAttachment:v8];
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v16 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134218240;
      int v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = a4;
      _os_log_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEFAULT, "Update location for cached view provider (%p) at %lu", (uint8_t *)&v21, 0x16u);
    }

    [v15 setUpdatedLocationForRecycledViewProvider:v13];
    double v14 = v15;
  }
  else
  {
    double v14 = [v8 viewProviderForParentView:a1 location:v13 textContainer:v9];

    uint64_t v18 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134218240;
      int v22 = v14;
      __int16 v23 = 2048;
      uint64_t v24 = a4;
      _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "Created view provider (%p) at: %lu", (uint8_t *)&v21, 0x16u);
    }

    if (!v14)
    {

      goto LABEL_22;
    }
  }
  int v19 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134218240;
    int v22 = v14;
    __int16 v23 = 2048;
    uint64_t v24 = a4;
    _os_log_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_DEFAULT, "Set viewProvider (%p) at %lu", (uint8_t *)&v21, 0x16u);
  }

  [v10 setViewProvider:v14 forTextAttachment:v8 location:v13];
LABEL_19:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a1 _setCachedViewProvider:v14 textAttachment:v8];
  }
LABEL_22:

  return v14;
}

- (id)_cacheIdentifierForTextAttachment:()UITextViewDrawing
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 _paperIdentifier];
LABEL_6:
    id v7 = (void *)v4;
    goto LABEL_9;
  }
  uint64_t v5 = [v3 fileType];
  if ([v5 isEqualToString:@"com.apple.drawing"])
  {
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v4 = [v3 viewIdentifier];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (void)_setCachedViewProvider:()UITextViewDrawing textAttachment:
{
  id v9 = a3;
  char v6 = [a1 _cacheIdentifierForTextAttachment:a4];
  if (v6)
  {
    uint64_t v7 = [a1 _drawingInfo];
    id v8 = (void *)v7;
    if (v7) {
      [*(id *)(v7 + 48) setObject:v9 forKeyedSubscript:v6];
    }
  }
}

- (id)_cachedViewProviderForTextAttachment:()UITextViewDrawing
{
  uint64_t v2 = objc_msgSend(a1, "_cacheIdentifierForTextAttachment:");
  if (v2 && ([a1 _drawingInfo], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [*(id *)(v3 + 48) objectForKeyedSubscript:v2];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_cleanupStaleCachedViewProviders
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 _drawingInfo];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v4 = [a1 textStorage];
    uint64_t v5 = *MEMORY[0x1E4FB06B8];
    uint64_t v6 = [v4 length];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__UITextView_UITextViewDrawing___cleanupStaleCachedViewProviders__block_invoke;
    v18[3] = &unk_1E64CB0E0;
    v18[4] = a1;
    id v7 = v3;
    id v19 = v7;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v18);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = objc_msgSend(v2[6], "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (([v7 containsObject:v13] & 1) == 0) {
            [v2[6] removeObjectForKey:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (void)_pk_checkForTK2LostViewProviderInAttachment:()UITextViewDrawing atCharacterIndex:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 textContainer];
  id v8 = [v7 textLayoutManager];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(a1, "_pk_textRangeFromCharacterRange:textLayoutManager:", a4, 1, v8);
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    uint64_t v10 = [v9 location];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __94__UITextView_UITextViewDrawing___pk_checkForTK2LostViewProviderInAttachment_atCharacterIndex___block_invoke;
    v14[3] = &unk_1E64CB108;
    v14[4] = &v15;
    id v11 = (id)[v8 enumerateTextLayoutFragmentsFromLocation:v10 options:0 usingBlock:v14];

    if (*((unsigned char *)v16 + 24))
    {
      double v12 = [a1 _cachedViewProviderForTextAttachment:v6];
      uint64_t v13 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v20 = a4;
        __int16 v21 = 2048;
        int v22 = v12;
        _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Lost view provider at: %lu, cached: %p", buf, 0x16u);
      }
    }
    else
    {
      double v12 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEFAULT, "Did not detect a lost view provider", buf, 2u);
      }
    }

    _Block_object_dispose(&v15, 8);
  }
}

@end