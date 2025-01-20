@interface PKTextInputElementContent
- (BOOL)_webInsertTextsToCommitPhase2:(void *)a3 withAlternatives:(void *)a4 activePreviewText:(uint64_t)a5 replacingRange:(uint64_t)a6 committedLength:(void *)a7;
- (BOOL)configureSelectionStyleForDeletionPreview;
- (BOOL)configureSelectionStyleForHighlight;
- (BOOL)configureSelectionStyleForNormalSelection;
- (BOOL)hasLinkAtCharacterIndex:(void *)a3 location:(double)a4 coordinateSpace:(double)a5;
- (BOOL)isValidRange:(uint64_t)a3;
- (double)caretRectForCharacterIndex:(void *)a3 inCoordinateSpace:;
- (double)caretRectForStartOfLineFromCharacterIndex:(void *)a3 coordinateSpace:(uint64_t *)a4 outCharacterIndex:;
- (double)caretRectInCoordinateSpace:(uint64_t)a1;
- (double)frameForTextPlaceholder:(void *)a3 inCoordinateSpace:;
- (id)description;
- (id)initWithElement:(id *)a1;
- (id)protectedCharacterIndexesInRange:(uint64_t)a3;
- (id)rectValuesForSelectionRects:(void *)a3 inCoordinateSpace:(int)a4 visibleOnly:;
- (id)selectionRectsForRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 visibleOnly:(int)a5;
- (id)stringInRange:(uint64_t)a3;
- (id)textContentType;
- (uint64_t)_isLastCharacterNewline;
- (uint64_t)characterIndexClosestToPoint:(uint64_t)a3 inCoordinateSpace:(uint64_t)a4 forInsertingText:(double)a5 adjustForLastCharacter:(double)a6;
- (uint64_t)contentLength;
- (uint64_t)indexOfLastNonWhitespaceCharacter;
- (uint64_t)isSingleLineDocumentContent;
- (uint64_t)rangeOfCharacterAtIndex:(uint64_t)a1;
- (uint64_t)selectedRange;
- (uint64_t)supportsAutoLineBreaks;
- (void)_insertTextPlaceholderWithSize:(double)a3 completionHandler:(double)a4;
- (void)_removeTextPlaceholder:(uint64_t)a3 willInsertText:(void *)a4 completionHandler:;
- (void)_textInput_enumerateBoundsForCharactersInRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 reverse:(char)a5 block:(void *)a6;
- (void)_webDocumentContext_enumerateBoundsForCharactersInRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 reverse:(int)a5 block:(void *)a6;
- (void)_webInsertCommittedTextPhase3:(void *)a3 withAlternatives:(uint64_t)a4 activePreviewText:(uint64_t)a5 replacingRange:(void *)a6 webTextInput:;
- (void)deleteTextInRange:(uint64_t)a3 completion:(void *)a4;
- (void)enumerateBoundsForCharactersInRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 reverse:(int)a5 block:(void *)a6;
- (void)firstRectForRange:(unint64_t)a3 inCoordinateSpace:(void *)a4;
- (void)insertTextsToCommit:(void *)a3 withAlternatives:(void *)a4 activePreviewText:(uint64_t)a5 replacingRange:(uint64_t)a6 completion:(void *)a7;
- (void)loadDataIfNeededWithTextInput:(uint64_t)a1;
- (void)loadDataIfNeededWithWebDocumentSourceView:(void *)a3 textInput:(void *)a4 rectOfInterest:(CGFloat)a5 completion:(CGFloat)a6;
- (void)requestUpdatedApproximateCaretRectInCoordinateSpace:(void *)a3 completion:;
- (void)requestUpdatedLastSelectionRectForCommittedTextLength:(void *)a3 targetCoordinateSpace:(void *)a4 completion:;
- (void)selectTextInRange:(uint64_t)a3 completion:(void *)a4;
- (void)setSelectionWithReferencePoint:(double)a3 completionHandler:(double)a4;
@end

@implementation PKTextInputElementContent

- (id)initWithElement:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PKTextInputElementContent;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)description
{
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__textInput);

    if (WeakRetained)
    {
      id v4 = NSString;
      v5 = objc_loadWeakRetained((id *)&self->__textInput);
      PKDebugStringRepresentation(v5);
      v6 = (UIWKDocumentContext *)objc_claimAutoreleasedReturnValue();
      [v4 stringWithFormat:@"type: UITextInput, textInput: %@", v6, v16];
      v9 = LABEL_6:;

      goto LABEL_7;
    }
    id v7 = objc_loadWeakRetained((id *)&self->__webDocumentSourceView);

    if (v7)
    {
      v8 = NSString;
      v6 = self->__webDocumentContext;
      v19.location = [(UIWKDocumentContext *)v6 selectedTextRange];
      v5 = NSStringFromRange(v19);
      [v8 stringWithFormat:@"type: WebInput, selectedRange: %@, webDocumentContext: (%@)", v5, self->__webDocumentContext];
      goto LABEL_6;
    }
  }
  v9 = [NSString stringWithFormat:@"type: NoData"];
  if (!self)
  {
LABEL_8:
    v10 = @"None";
    goto LABEL_13;
  }
LABEL_7:
  switch(self->_dataLoadedState)
  {
    case 0:
      goto LABEL_8;
    case 1:
      v10 = @"Requesting";
      break;
    case 2:
      v10 = @"Ready";
      break;
    case 3:
      v10 = @"Failed";
      break;
    default:
      v10 = 0;
      break;
  }
LABEL_13:
  v17.receiver = self;
  v17.super_class = (Class)PKTextInputElementContent;
  v11 = [(PKTextInputElementContent *)&v17 description];
  v12 = v11;
  if (self) {
    element = self->_element;
  }
  else {
    element = 0;
  }
  v14 = [v11 stringByAppendingFormat:@" %@, loadedState: %@, element: (%@)", v9, v10, element];

  return v14;
}

- (void)loadDataIfNeededWithTextInput:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 24);
    if (v4 == 3 || v4 == 0)
    {
      id v9 = v3;
      id v6 = objc_storeWeak((id *)(a1 + 32), v3);
      uint64_t v7 = +[PKTextInputUtilities textInputTraitsFromTextInput:v9];
      v8 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v7;

      id v3 = v9;
      *(void *)(a1 + 24) = 2;
    }
  }
}

- (void)loadDataIfNeededWithWebDocumentSourceView:(void *)a3 textInput:(void *)a4 rectOfInterest:(CGFloat)a5 completion:(CGFloat)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  objc_super v17 = a4;
  if (a1)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4FB1F08]);
    [v18 setSurroundingGranularity:4];
    [v18 setGranularityCount:1];
    [v18 setFlags:1];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke;
    v31[3] = &unk_1E64C7A40;
    v31[4] = a1;
    +[PKTextInputUtilities requestDocumentContext:v18 forWebDocumentSourceView:v15 completionHandler:v31];
    uint64_t v19 = *(void *)(a1 + 24);
    if (v19 && v19 != 3)
    {
      v17[2](v17, 1);
    }
    else
    {
      v20 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 134218242;
        uint64_t v33 = a1;
        __int16 v34 = 2112;
        id v35 = v21;
        _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEFAULT, "ElementContent %p: Will load content for web element %@", buf, 0x16u);
      }

      objc_storeWeak((id *)(a1 + 56), v15);
      objc_storeWeak((id *)(a1 + 40), v16);
      *(void *)(a1 + 24) = 1;
      id v22 = objc_alloc_init(MEMORY[0x1E4FB1F08]);
      [v22 setSurroundingGranularity:0];
      [v22 setGranularityCount:200];
      v37.origin.x = a5;
      v37.origin.y = a6;
      v37.size.width = a7;
      v37.size.height = a8;
      if (CGRectIsNull(v37))
      {
        uint64_t v23 = 5;
      }
      else
      {
        objc_msgSend(v22, "setDocumentRect:", a5, a6, a7, a8);
        v24 = *(void **)(a1 + 8);
        if (v24) {
          v24 = (void *)v24[15];
        }
        v25 = v24;
        [v22 setInputElementIdentifier:v25];

        uint64_t v23 = 69;
      }
      [v22 setFlags:v23];
      v26 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v33 = a1;
        __int16 v34 = 2112;
        id v35 = v15;
        _os_log_impl(&dword_1C44F8000, v26, OS_LOG_TYPE_DEFAULT, "ElementContent %p: Sending web document context request to view %@", buf, 0x16u);
      }

      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_19;
      v28[3] = &unk_1E64C7A90;
      uint64_t v30 = v27;
      v28[4] = a1;
      v29 = v17;
      +[PKTextInputUtilities requestDocumentContext:v22 forWebDocumentSourceView:v15 completionHandler:v28];
    }
  }
}

void __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_2;
  v5[3] = &unk_1E64C5F60;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    objc_storeStrong((id *)(v1 + 72), *(id *)(a1 + 40));
  }
}

void __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 sortTextRectsByCharacterRange];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4 - *(double *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_2_20;
  v8[3] = &unk_1E64C7A68;
  double v11 = v5;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_2_20(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(double *)(a1 + 56) * 1000.0;
    if (v3) {
      uint64_t v5 = *(void *)(v3 + 8);
    }
    else {
      uint64_t v5 = 0;
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = v3;
    __int16 v27 = 2048;
    double v28 = v4;
    __int16 v29 = 2112;
    uint64_t v30 = v5;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "ElementContent %p: Web document context request finished after %0.2fms for element %@", buf, 0x20u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if (v6 && (objc_storeStrong((id *)(v6 + 64), *(id *)(a1 + 40)), (uint64_t v8 = *(void *)(a1 + 32)) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v8 + 40));
    uint64_t v10 = +[PKTextInputUtilities textInputTraitsFromTextInput:WeakRetained];
    double v11 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v10;
  }
  else
  {
    id WeakRetained = 0;
  }

  v12 = [*(id *)(a1 + 40) contextBefore];
  v13 = [*(id *)(a1 + 40) selectedText];
  v14 = [*(id *)(a1 + 40) contextAfter];
  id v15 = &stru_1F1FB2C00;
  if (v12) {
    id v16 = v12;
  }
  else {
    id v16 = &stru_1F1FB2C00;
  }
  if (v13) {
    objc_super v17 = v13;
  }
  else {
    objc_super v17 = &stru_1F1FB2C00;
  }
  if (v14) {
    id v15 = v14;
  }
  id v18 = [NSString stringWithFormat:@"%@%@%@", v16, v17, v15];
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    objc_storeStrong((id *)(v19 + 48), v18);
  }

  if (v7)
  {
    uint64_t v20 = *(void *)(a1 + 32);
    if (v20)
    {
      uint64_t v21 = 2;
LABEL_24:
      *(void *)(v20 + 24) = v21;
    }
  }
  else
  {
    id v22 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      if (v23) {
        double v24 = *(double *)(v23 + 8);
      }
      else {
        double v24 = 0.0;
      }
      *(_DWORD *)buf = 134218242;
      uint64_t v26 = v23;
      __int16 v27 = 2112;
      double v28 = v24;
      _os_log_error_impl(&dword_1C44F8000, v22, OS_LOG_TYPE_ERROR, "ElementContent %p: Failed to load web document context for element %@", buf, 0x16u);
    }

    uint64_t v20 = *(void *)(a1 + 32);
    if (v20)
    {
      uint64_t v21 = 3;
      goto LABEL_24;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)textContentType
{
  if (a1)
  {
    a1 = [a1[2] textContentType];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)contentLength
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = *(id *)(a1 + 64);
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));

    if (WeakRetained)
    {
      id v4 = objc_loadWeakRetained((id *)(v1 + 32));
      uint64_t v1 = +[PKTextInputUITextInputInterface contentLengthForTextInput:v4];
    }
    else if (v2)
    {
      uint64_t v1 = [*(id *)(v1 + 48) length];
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (id)stringInRange:(uint64_t)a3
{
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained(v6);
    id v9 = +[PKTextInputUITextInputInterface stringInRange:inTextInput:](PKTextInputUITextInputInterface, "stringInRange:inTextInput:", a2, a3, v8);

    goto LABEL_7;
  }
  if (*(void *)(a1 + 64))
  {
    id v9 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", a2, a3);
  }
  else
  {
LABEL_6:
    id v9 = 0;
  }
LABEL_7:

  return v9;
}

- (id)protectedCharacterIndexesInRange:(uint64_t)a3
{
  if (a1
    && (v6 = (id *)(a1 + 32), (id v7 = objc_loadWeakRetained((id *)(a1 + 32))) != 0)
    && (v8 = v7, char v9 = -[PKTextInputElementContent isSingleLineDocumentContent](a1), v8, (v9 & 1) == 0))
  {
    id WeakRetained = objc_loadWeakRetained(v6);
    uint64_t v10 = +[PKTextInputUITextInputInterface protectedCharacterIndexesInRange:inTextInput:](PKTextInputUITextInputInterface, "protectedCharacterIndexesInRange:inTextInput:", a2, a3, WeakRetained);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)isSingleLineDocumentContent
{
  if (!a1) {
    return 0;
  }
  id v2 = *(void **)(a1 + 16);
  if (!v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v5 = WeakRetained;
    if (WeakRetained) {
      id v6 = WeakRetained;
    }
    else {
      id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    }
    id v7 = v6;

    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [v7 isSingleLineDocument];
    }
    else {
      uint64_t v8 = 1;
    }

    return v8;
  }

  return [v2 isSingleLineDocument];
}

- (uint64_t)rangeOfCharacterAtIndex:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v4);
    a2 = +[PKTextInputUITextInputInterface rangeOfCharacterAtIndex:a2 inTextInput:v6];
  }
  else if (*(void *)(a1 + 64))
  {
    return [*(id *)(a1 + 48) rangeOfComposedCharacterSequenceAtIndex:a2];
  }
  return a2;
}

- (BOOL)isValidRange:(uint64_t)a3
{
  if (result)
  {
    if (a2 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    uint64_t v5 = result;
    id v6 = (id *)(result + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 32));

    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained(v6);
      BOOL v9 = +[PKTextInputUITextInputInterface isValidRange:inTextInput:](PKTextInputUITextInputInterface, "isValidRange:inTextInput:", a2, a3, v8);

      return v9;
    }
    else
    {
      if (!*(void *)(v5 + 64)) {
        return 0;
      }
      return a2 + a3 <= (unint64_t)-[PKTextInputElementContent contentLength](v5);
    }
  }
  return result;
}

- (uint64_t)supportsAutoLineBreaks
{
  if (result)
  {
    uint64_t v1 = result;
    if (-[PKTextInputElementContent isSingleLineDocumentContent](result))
    {
      return 0;
    }
    else
    {
      id v2 = (id *)(v1 + 32);
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
      id v4 = [WeakRetained textInputView];

      if (v4)
      {
        uint64_t v5 = (id *)*(id *)(v1 + 8);
        id v6 = objc_loadWeakRetained(v2);
        id v7 = [v6 textInputView];
        uint64_t v8 = -[PKTextInputElement containsView:](v5, v7);

        return v8;
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

- (void)enumerateBoundsForCharactersInRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 reverse:(int)a5 block:(void *)a6
{
  id v13 = a4;
  id v11 = a6;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      [(PKTextInputElementContent *)(id *)a1 _textInput_enumerateBoundsForCharactersInRange:a3 inCoordinateSpace:v13 reverse:a5 block:v11];
    }
    else if (*(void *)(a1 + 64) && a3)
    {
      [(PKTextInputElementContent *)a1 _webDocumentContext_enumerateBoundsForCharactersInRange:a3 inCoordinateSpace:v13 reverse:a5 block:v11];
    }
  }
}

- (void)_textInput_enumerateBoundsForCharactersInRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 reverse:(char)a5 block:(void *)a6
{
  id v11 = a4;
  v12 = a6;
  if (a1)
  {
    if (a5)
    {
      uint64_t v13 = a2 + a3 - 1;
      do
      {
        if (v13 < a2) {
          break;
        }
        [(PKTextInputElementContent *)a1 firstRectForRange:1uLL inCoordinateSpace:v11];
        char v17 = 0;
        v12[2](v12, v13--, &v17);
      }
      while (!v17);
    }
    else if (a2 < (unint64_t)(a2 + a3))
    {
      uint64_t v14 = a3 - 1;
      do
      {
        [(PKTextInputElementContent *)a1 firstRectForRange:1uLL inCoordinateSpace:v11];
        char v16 = 0;
        v12[2](v12, a2++, &v16);
        if (v16) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = v14 == 0;
        }
        --v14;
      }
      while (!v15);
    }
  }
}

- (void)_webDocumentContext_enumerateBoundsForCharactersInRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 reverse:(int)a5 block:(void *)a6
{
  id v11 = a4;
  id v12 = a6;
  if (a1)
  {
    if (a5) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = *(void **)(a1 + 64);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __117__PKTextInputElementContent__webDocumentContext_enumerateBoundsForCharactersInRange_inCoordinateSpace_reverse_block___block_invoke;
    v15[3] = &unk_1E64C7AB8;
    id v16 = v11;
    uint64_t v17 = a1;
    id v18 = v12;
    objc_msgSend(v14, "enumerateLayoutRectsWithOptions:characterRange:block:", v13, a2, a3, v15);
  }
}

- (void)firstRectForRange:(unint64_t)a3 inCoordinateSpace:(void *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a1)
  {
    memset(&r1, 0, sizeof(r1));
    goto LABEL_5;
  }
  CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  r1.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  r1.size = v8;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);

  if (WeakRetained)
  {
    uint64_t v10 = objc_loadWeakRetained(a1 + 4);
    +[PKTextInputUITextInputInterface firstRectForRange:inCoordinateSpace:inTextInput:](PKTextInputUITextInputInterface, "firstRectForRange:inCoordinateSpace:inTextInput:", a2, a3, v7, v10);
    r1.origin.CGFloat x = v11;
    r1.origin.CGFloat y = v12;
    r1.size.CGFloat width = v13;
    r1.size.height = v14;
    goto LABEL_4;
  }
  id v15 = a1[8];
  if (v15 && a3)
  {
    id v16 = objc_msgSend(v15, "characterRectsForCharacterRange:", a2, 1);
    uint64_t v10 = [v16 firstObject];

    if (!v10) {
      goto LABEL_4;
    }
    [v10 getValue:&r1 size:32];
    if (a3 < 2) {
      goto LABEL_26;
    }
    uint64_t v17 = objc_msgSend(a1[8], "characterRectsForCharacterRange:", a2, a3);
    double Height = CGRectGetHeight(r1);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (!v20) {
      goto LABEL_25;
    }
    uint64_t v21 = v20;
    double v22 = Height * 0.2;
    uint64_t v23 = *(void *)v43;
    while (1)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        memset(&rect, 0, sizeof(rect));
        [v25 getValue:&rect size:32];
        CGFloat y = rect.origin.y;
        CGFloat v27 = r1.origin.y;
        double v28 = rect.origin.y - r1.origin.y;
        if (rect.origin.y - r1.origin.y < 0.0) {
          double v28 = -(rect.origin.y - r1.origin.y);
        }
        if (v28 <= v22) {
          goto LABEL_22;
        }
        double MaxY = CGRectGetMaxY(rect);
        double v30 = MaxY - CGRectGetMaxY(rect);
        if (v30 < 0.0) {
          double v30 = -v30;
        }
        if (v30 <= v22)
        {
          CGFloat v27 = r1.origin.y;
          CGFloat y = rect.origin.y;
LABEL_22:
          CGFloat x = r1.origin.x;
          CGFloat width = r1.size.width;
          CGFloat v33 = r1.size.height;
          CGFloat v34 = rect.origin.x;
          CGFloat v35 = rect.size.width;
          CGFloat v36 = rect.size.height;
          CGRect r1 = CGRectUnion(*(CGRect *)(&v27 - 1), *(CGRect *)(&y - 1));
          continue;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (!v21)
      {
LABEL_25:

LABEL_26:
        id v37 = objc_loadWeakRetained(a1 + 7);
        r1.origin.CGFloat x = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v37, v7, r1.origin.x, r1.origin.y, r1.size.width, r1.size.height);
        r1.origin.CGFloat y = v38;
        r1.size.CGFloat width = v39;
        r1.size.height = v40;

LABEL_4:
        break;
      }
    }
  }
LABEL_5:
}

uint64_t __117__PKTextInputElementContent__webDocumentContext_enumerateBoundsForCharactersInRange_inCoordinateSpace_reverse_block___block_invoke(void *a1, double a2, double a3, double a4, double a5)
{
  CGFloat v11 = (void *)a1[4];
  uint64_t v10 = a1[5];
  if (v10) {
    id WeakRetained = objc_loadWeakRetained((id *)(v10 + 56));
  }
  else {
    id WeakRetained = 0;
  }
  double v13 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(WeakRetained, v11, a2, a3, a4, a5);
  unint64_t v15 = v14;
  unint64_t v17 = v16;
  unint64_t v19 = v18;

  uint64_t v20 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(a1[6] + 16);
  v21.n128_f64[0] = v13;
  v22.n128_u64[0] = v15;
  v23.n128_u64[0] = v17;
  v24.n128_u64[0] = v19;

  return v20(v21, v22, v23, v24);
}

- (uint64_t)characterIndexClosestToPoint:(uint64_t)a3 inCoordinateSpace:(uint64_t)a4 forInsertingText:(double)a5 adjustForLastCharacter:(double)a6
{
  id v11 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 4);

    if (WeakRetained)
    {
      id v13 = objc_loadWeakRetained(a1 + 4);
      uint64_t v14 = +[PKTextInputUITextInputInterface characterIndexClosestToPoint:inCoordinateSpace:inTextInput:forInsertingText:adjustForLastCharacter:](PKTextInputUITextInputInterface, "characterIndexClosestToPoint:inCoordinateSpace:inTextInput:forInsertingText:adjustForLastCharacter:", v11, v13, a3, a4, a5, a6);
    }
    else if (a1[8])
    {
      id v16 = objc_loadWeakRetained(a1 + 7);
      double v17 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v11, v16, a5, a6, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v19 = v18;

      uint64_t v20 = objc_msgSend(a1[8], "closestCharacterIndexForPoint:", v17, v19);
      uint64_t v14 = v20;
      if (a3)
      {
        if (v20 + 1 == -[PKTextInputElementContent contentLength]((uint64_t)a1))
        {
          if (-[PKTextInputElementContent _isLastCharacterNewline]((uint64_t)a1))
          {
            v21.origin.CGFloat x = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:]((uint64_t)a1, v14, v11);
            if (a6 > CGRectGetMaxY(v21)) {
              ++v14;
            }
          }
        }
      }
    }
    else
    {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (uint64_t)_isLastCharacterNewline
{
  if (-[PKTextInputElementContent contentLength](a1) < 1) {
    return 0;
  }
  uint64_t v2 = -[PKTextInputElementContent contentLength](a1);
  uint64_t v3 = [(PKTextInputElementContent *)a1 stringInRange:1];
  if ([v3 length] == 1)
  {
    uint64_t v4 = [v3 characterAtIndex:0];
    uint64_t v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v6 = [v5 characterIsMember:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (double)caretRectForCharacterIndex:(void *)a3 inCoordinateSpace:
{
  id v5 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 32));
      +[PKTextInputUITextInputInterface caretRectForCharacterIndex:a2 inCoordinateSpace:v5 inTextInput:v7];
      double x = v8;
    }
    else if (*(void *)(a1 + 64))
    {
      [(PKTextInputElementContent *)(id *)a1 firstRectForRange:1uLL inCoordinateSpace:v5];
      double x = v15.origin.x;
      CGFloat y = v15.origin.y;
      CGFloat width = v15.size.width;
      CGFloat height = v15.size.height;
      BOOL IsNull = CGRectIsNull(v15);
      if (a2 >= 1 && IsNull)
      {
        [(PKTextInputElementContent *)(id *)a1 firstRectForRange:1uLL inCoordinateSpace:v5];
        double x = v16.origin.x;
        if (!CGRectIsNull(v16) && -[PKTextInputElementContent contentLength](a1) == a2) {
          -[PKTextInputElementContent _isLastCharacterNewline](a1);
        }
      }
      else
      {
        v17.origin.double x = x;
        v17.origin.CGFloat y = y;
        v17.size.CGFloat width = width;
        v17.size.CGFloat height = height;
        CGRectIsNull(v17);
      }
    }
    else
    {
      double x = *MEMORY[0x1E4F1DB20];
    }
  }
  else
  {
    double x = 0.0;
  }

  return x;
}

- (double)caretRectInCoordinateSpace:(uint64_t)a1
{
  id v3 = a2;
  if (!a1)
  {
    double v4 = 0.0;
    goto LABEL_13;
  }
  double v4 = *MEMORY[0x1E4F1DB20];
  if (*(void *)(a1 + 64))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = objc_loadWeakRetained((id *)(a1 + 56));
    id v7 = [WeakRetained selectedTextRange];
    double v8 = v7;
    if (WeakRetained)
    {
      if (v6)
      {
        uint64_t v9 = [v7 start];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          int v11 = [v8 isEmpty];

          if (v11)
          {
            CGFloat v12 = [v8 start];
            [WeakRetained caretRectForPosition:v12];
            double v4 = v13;
            double v15 = v14;
            double v17 = v16;
            double v19 = v18;

            v25.origin.double x = v4;
            v25.origin.CGFloat y = v15;
            v25.size.CGFloat width = v17;
            v25.size.CGFloat height = v19;
            if (!CGRectIsNull(v25))
            {
              objc_msgSend(v6, "PK_convertRect:toCoordinateSpace:", v3, v4, v15, v17, v19);
              double v4 = v20;
            }
          }
        }
      }
    }

    goto LABEL_12;
  }
  CGRect v21 = (id *)(a1 + 32);
  id v22 = objc_loadWeakRetained((id *)(a1 + 32));

  if (v22)
  {
    id WeakRetained = objc_loadWeakRetained(v21);
    +[PKTextInputUITextInputInterface caretRectInCoordinateSpace:v3 inTextInput:WeakRetained];
    double v4 = v23;
LABEL_12:
  }
LABEL_13:

  return v4;
}

- (double)caretRectForStartOfLineFromCharacterIndex:(void *)a3 coordinateSpace:(uint64_t *)a4 outCharacterIndex:
{
  id v7 = a3;
  if (a1)
  {
    double v8 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:](a1, a2, v7);
    double v12 = v11;
    do
    {
      double v13 = v8;
      double v14 = v9;
      uint64_t v15 = a2;
      if (a2-- < 1) {
        break;
      }
      double v17 = v12;
      if (CGRectIsEmpty(*(CGRect *)&v8)) {
        break;
      }
      double v8 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:](a1, a2, v7);
      double v19 = v12 * 0.5;
      double v20 = v9 - v14;
      if (v9 - v14 < 0.0) {
        double v20 = -(v9 - v14);
      }
      double v12 = v18;
    }
    while (v20 <= v19);
    if (a4) {
      *a4 = v15;
    }
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (void)setSelectionWithReferencePoint:(double)a3 completionHandler:(double)a4
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v15 = v7;
    id v8 = a1[8];
    if (v8 && (double v9 = v8, v10 = objc_loadWeakRetained(a1 + 7), v10, v9, v10))
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 7);
      objc_msgSend(WeakRetained, "selectPositionAtPoint:completionHandler:", v15, a3, a4);
    }
    else
    {
      double v12 = a1 + 4;
      id v13 = objc_loadWeakRetained(v12);

      if (v13)
      {
        id v14 = objc_loadWeakRetained(v12);
        +[PKTextInputUITextInputInterface setSelectionWithReferencePoint:inTextInput:](PKTextInputUITextInputInterface, "setSelectionWithReferencePoint:inTextInput:", v14, a3, a4);
      }
      v15[2]();
    }
    id v7 = v15;
  }
}

- (void)requestUpdatedApproximateCaretRectInCoordinateSpace:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      v8.n128_f64[0] = -[PKTextInputElementContent caretRectInCoordinateSpace:](a1, v5);
      v6[2](v6, v8);
    }
    else
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 56));

      if (v9)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4FB1F08]);
        [v11 setFlags:5];
        [v11 setSurroundingGranularity:0];
        [v11 setGranularityCount:2];
        id v12 = objc_loadWeakRetained((id *)(a1 + 56));
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke;
        v13[3] = &unk_1E64C7B30;
        id v14 = v5;
        uint64_t v15 = a1;
        double v16 = v6;
        +[PKTextInputUtilities requestDocumentContext:v11 forWebDocumentSourceView:v12 completionHandler:v13];
      }
      else
      {
        v10.n128_u64[0] = *MEMORY[0x1E4F1DB20];
        v6[2](v6, v10);
      }
    }
  }
}

void __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke_2;
  v8[3] = &unk_1E64C7B08;
  id v9 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = 0;
  double v17 = (CGRect *)&v16;
  double v19 = "";
  uint64_t v18 = 0x4010000000;
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v20 = *MEMORY[0x1E4F1DB20];
  long long v21 = v2;
  uint64_t v3 = [*(id *)(a1 + 32) selectedTextRange];
  id v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke_3;
  v15[3] = &unk_1E64C7AE0;
  v15[5] = v3;
  v15[6] = v5;
  void v15[4] = &v16;
  [v4 enumerateLayoutRects:v15];
  if (!CGRectIsNull(v17[1]))
  {
    p_double x = &v17->origin.x;
    __n128 v8 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      id WeakRetained = objc_loadWeakRetained((id *)(v7 + 56));
    }
    else {
      id WeakRetained = 0;
    }
    double v10 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(WeakRetained, v8, p_x[4], p_x[5], p_x[6], p_x[7]);
    uint64_t v11 = (void *)&v17->origin.x;
    v17[1].origin.double x = v10;
    v11[5] = v12;
    v11[6] = v13;
    v11[7] = v14;
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(v17[1].origin.x, v17[1].origin.y, v17[1].size.width, v17[1].size.height);
  _Block_object_dispose(&v16, 8);
}

void __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, double a5, double a6, double a7, double a8)
{
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = a2 + a3;
  if (a2 == v8 || v9 == v8)
  {
    if (!CGRectIsNull(*(CGRect *)&a5))
    {
      double v17 = *(double **)(*(void *)(a1 + 32) + 8);
      v17[4] = a5;
      v17[5] = a6;
      v17[6] = a7;
      v17[7] = a8;
      double v18 = a5;
      double v19 = a6;
      double v20 = a7;
      double v21 = a8;
      if (v9 == v8) {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v18);
      }
      else {
        double MaxX = CGRectGetMinX(*(CGRect *)&v18);
      }
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = MaxX;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = 0x4000000000000000;
    }
    *a4 = 1;
  }
}

- (void)requestUpdatedLastSelectionRectForCommittedTextLength:(void *)a3 targetCoordinateSpace:(void *)a4 completion:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a1) {
    goto LABEL_18;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (!WeakRetained)
  {
    id v24 = objc_loadWeakRetained((id *)(a1 + 56));

    if (v24)
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4FB1F08]);
      [v25 setFlags:5];
      [v25 setSurroundingGranularity:0];
      [v25 setGranularityCount:2 * a2];
      id v26 = objc_loadWeakRetained((id *)(a1 + 56));
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke;
      v27[3] = &unk_1E64C7BA8;
      unint64_t v30 = a2;
      v27[4] = a1;
      id v28 = v7;
      id v29 = v8;
      +[PKTextInputUtilities requestDocumentContext:v25 forWebDocumentSourceView:v26 completionHandler:v27];

      goto LABEL_18;
    }
LABEL_15:
    (*((void (**)(id, uint64_t, double, double, double, double))v8 + 2))(v8, v11, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    goto LABEL_18;
  }
  unint64_t v10 = -[PKTextInputElementContent selectedRange](a1);
  uint64_t v11 = v10 - a2;
  if (v10 < a2) {
    goto LABEL_15;
  }
  double v12 = *MEMORY[0x1E4F1DB20];
  double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v16 = [(PKTextInputElementContent *)a1 selectionRectsForRange:a2 inCoordinateSpace:v7 visibleOnly:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v17 = [v16 reverseObjectEnumerator];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    while (2)
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v33 + 1) + 8 * v21);
        long long v31 = 0u;
        long long v32 = 0u;
        [v22 getValue:&v31 size:32];
        double v23 = *(double *)&v32;
        if (*(double *)&v32 > 0.0)
        {
          double v13 = *((double *)&v31 + 1);
          double v12 = *(double *)&v31;
          double v14 = *((double *)&v32 + 1);
          goto LABEL_17;
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  double v23 = v15;
LABEL_17:

  (*((void (**)(id, double, double, double, double))v8 + 2))(v8, v12, v13, v23, v14);
LABEL_18:
}

- (uint64_t)selectedRange
{
  uint64_t v1 = a1;
  if (a1)
  {
    long long v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      if (-[PKTextInputElement isFocused](*(void *)(v1 + 8)))
      {
        id v4 = objc_loadWeakRetained(v2);
        uint64_t v1 = +[PKTextInputUITextInputInterface selectedRangeInTextInput:v4];

        return v1;
      }
    }
    else
    {
      uint64_t v5 = *(void **)(v1 + 64);
      if (v5) {
        return [v5 selectedTextRange];
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v1;
}

- (id)selectionRectsForRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 visibleOnly:(int)a5
{
  id v9 = a4;
  if (a1 && (unint64_t v10 = (id *)(a1 + 32), v11 = objc_loadWeakRetained((id *)(a1 + 32)), v11, v11))
  {
    if (a5)
    {
      id v12 = *(id *)(a1 + 8);
      double v13 = -[PKTextInputElement frame]((uint64_t)v12);
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      uint64_t v20 = -[PKTextInputElement coordinateSpace](*(void *)(a1 + 8));
      double v21 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v20, v9, v13, v15, v17, v19);
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
    }
    else
    {
      double v21 = *MEMORY[0x1E4F1DB20];
      double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    id WeakRetained = objc_loadWeakRetained(v10);
    id v28 = +[PKTextInputUITextInputInterface selectionRectsForRange:inCoordinateSpace:inTextInput:intersectingRect:](PKTextInputUITextInputInterface, "selectionRectsForRange:inCoordinateSpace:inTextInput:intersectingRect:", a2, a3, v9, WeakRetained, v21, v23, v25, v27);
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

void __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 sortTextRectsByCharacterRange];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke_2;
  block[3] = &unk_1E64C7B80;
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = 0;
  double v18 = (CGRect *)&v17;
  uint64_t v20 = "";
  uint64_t v19 = 0x4010000000;
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v21 = *MEMORY[0x1E4F1DB20];
  long long v22 = v2;
  unint64_t v3 = [*(id *)(a1 + 32) selectedTextRange];
  unint64_t v4 = *(void *)(a1 + 64);
  if (v3 >= v4)
  {
    uint64_t v5 = v3 - v4;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    id v6 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke_3;
    v15[3] = &unk_1E64C7B58;
    void v15[4] = &v17;
    v15[5] = v16;
    objc_msgSend(v6, "enumerateLayoutRectsWithOptions:characterRange:block:", 2, v5, v4, v15);
    _Block_object_dispose(v16, 8);
  }
  if (!CGRectIsNull(v18[1]))
  {
    p_double x = &v18->origin.x;
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      id WeakRetained = objc_loadWeakRetained((id *)(v8 + 56));
    }
    else {
      id WeakRetained = 0;
    }
    double v10 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(WeakRetained, *(void **)(a1 + 48), p_x[4], p_x[5], p_x[6], p_x[7]);
    id v11 = (void *)&v18->origin.x;
    v18[1].origin.double x = v10;
    v11[5] = v12;
    v11[6] = v13;
    v11[7] = v14;
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(v18[1].origin.x, v18[1].origin.y, v18[1].size.width, v18[1].size.height);
  _Block_object_dispose(&v17, 8);
}

void __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke_3(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  if (CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32)))
  {
    uint64_t v14 = *(double **)(*(void *)(a1 + 32) + 8);
    v14[4] = a2;
    v14[5] = a3;
    v14[6] = a4;
    v14[7] = a5;
    *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                             + 32))
                                                                 * 0.2;
    return;
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  double v16 = *(double *)(v15 + 40);
  double v17 = a3 - v16;
  if (a3 - v16 < 0.0) {
    double v17 = -(a3 - v16);
  }
  if (v17 > *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v23.origin.double x = a2;
    v23.origin.CGFloat y = a3;
    v23.size.CGFloat width = a4;
    v23.size.CGFloat height = a5;
    double MaxY = CGRectGetMaxY(v23);
    v24.origin.double x = a2;
    v24.origin.CGFloat y = a3;
    v24.size.CGFloat width = a4;
    v24.size.CGFloat height = a5;
    double v19 = MaxY - CGRectGetMaxY(v24);
    if (v19 < 0.0) {
      double v19 = -v19;
    }
    if (v19 > *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      *a8 = 1;
      return;
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    double v16 = *(double *)(v15 + 40);
  }
  uint64_t v20 = *(void *)(v15 + 32);
  uint64_t v21 = *(void *)(v15 + 48);
  uint64_t v22 = *(void *)(v15 + 56);
  v25.origin.double x = a2;
  v25.origin.CGFloat y = a3;
  v25.size.CGFloat width = a4;
  v25.size.CGFloat height = a5;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(&v16 - 1), v25);
}

- (id)rectValuesForSelectionRects:(void *)a3 inCoordinateSpace:(int)a4 visibleOnly:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (a4)
    {
      id v9 = a1[1];
      double v10 = -[PKTextInputElement frame]((uint64_t)v9);
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v17 = -[PKTextInputElement coordinateSpace]((uint64_t)a1[1]);
      double v18 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v17, v8, v10, v12, v14, v16);
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
    }
    else
    {
      double v18 = *MEMORY[0x1E4F1DB20];
      double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 4);

    if (WeakRetained)
    {
      id v26 = objc_loadWeakRetained(a1 + 4);
    }
    else
    {
      double v27 = a1 + 5;
      id v28 = objc_loadWeakRetained(v27);

      if (!v28) {
        goto LABEL_10;
      }
      id v26 = objc_loadWeakRetained(v27);
    }
    id v28 = +[PKTextInputUITextInputInterface rectValuesForSelectionRects:inCoordinateSpace:inTextInput:intersectingRect:](PKTextInputUITextInputInterface, "rectValuesForSelectionRects:inCoordinateSpace:inTextInput:intersectingRect:", v7, v8, v26, v18, v20, v22, v24);
  }
  else
  {
    id v28 = 0;
  }
LABEL_10:

  return v28;
}

- (BOOL)hasLinkAtCharacterIndex:(void *)a3 location:(double)a4 coordinateSpace:(double)a5
{
  id v9 = a3;
  if (a1)
  {
    double v10 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      double v13 = -[PKTextInputElement coordinateSpace](*(void *)(a1 + 8));
      double v14 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v9, v13, a4, a5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v16 = v15;

      id v17 = objc_loadWeakRetained(v10);
      double v18 = objc_msgSend(v17, "_anyTextItemConstrainedToLineAtPoint:", v14, v16);

      BOOL v19 = v18 != 0;
    }
    else
    {
      id v20 = objc_loadWeakRetained((id *)(a1 + 32));
      double v18 = [v20 textInputView];

      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_7;
      }
      double v21 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v9, v18, a4, a5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      uint64_t v29 = 0;
      unint64_t v30 = &v29;
      uint64_t v31 = 0x2020000000;
      char v32 = 0;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __78__PKTextInputElementContent_hasLinkAtCharacterIndex_location_coordinateSpace___block_invoke;
      v28[3] = &unk_1E64C7BD0;
      v28[4] = &v29;
      [v18 _requestTextItemConstrainedToLineAtPoint:v28 resultHandler:v21];
      int v22 = *((unsigned __int8 *)v30 + 24);
      _Block_object_dispose(&v29, 8);
      if (v22)
      {
        BOOL v19 = 1;
      }
      else
      {
LABEL_7:
        id v23 = objc_loadWeakRetained(v10);

        if (v23)
        {
          id v24 = objc_loadWeakRetained(v10);
          CGRect v25 = +[PKTextInputUITextInputInterface attributesAtCharacterIndex:a2 inTextInput:v24];
        }
        else
        {
          CGRect v25 = 0;
        }
        id v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4FB0720]];
        BOOL v19 = v26 != 0;
      }
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

BOOL __78__PKTextInputElementContent_hasLinkAtCharacterIndex_location_coordinateSpace___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  BOOL result = CGRectIsEmpty(*(CGRect *)&a3);
  if (!result)
  {
    if (a2) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

- (uint64_t)indexOfLastNonWhitespaceCharacter
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = -[PKTextInputElementContent contentLength](a1);
  unint64_t v3 = [(PKTextInputElementContent *)a1 stringInRange:v2];
  if (v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v5 = [v4 invertedSet];
    uint64_t v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v5, 4, 0, v2);
  }
  else
  {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)insertTextsToCommit:(void *)a3 withAlternatives:(void *)a4 activePreviewText:(uint64_t)a5 replacingRange:(uint64_t)a6 completion:(void *)a7
{
  id v46 = a2;
  id v45 = a3;
  id v42 = a4;
  double v13 = a7;
  if (!a1) {
    goto LABEL_43;
  }
  location = a1 + 4;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);

  if (WeakRetained)
  {
    double v15 = v46;
    if ([v46 count])
    {
      if ([v46 count])
      {
        uint64_t v16 = a6;
        v41 = v13;
        uint64_t v17 = 0;
        uint64_t v43 = 0;
        do
        {
          double v18 = objc_msgSend(v15, "objectAtIndexedSubscript:", v17, v41);
          BOOL v19 = [v45 objectAtIndexedSubscript:v17];
          if (v17) {
            uint64_t v20 = 0;
          }
          else {
            uint64_t v20 = v16;
          }
          if (v17) {
            uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v21 = a5;
          }
          id v22 = 0;
          if (v17 == [v15 count] - 1) {
            id v22 = v42;
          }
          id v23 = objc_loadWeakRetained(location);
          BOOL v24 = +[PKTextInputUITextInputInterface insertCommittedText:withAlternatives:activePreviewText:replacingRange:inTextInput:](PKTextInputUITextInputInterface, "insertCommittedText:withAlternatives:activePreviewText:replacingRange:inTextInput:", v18, v19, v22, v21, v20, v23);

          if (v24) {
            v43 += [v18 length];
          }
          double v15 = v46;
        }
        while (++v17 < (unint64_t)[v46 count] && v24);
        if (v24)
        {
          double v13 = v41;
          a6 = v16;
          uint64_t v26 = v43;
          goto LABEL_33;
        }
        uint64_t v33 = 0;
        double v13 = v41;
        uint64_t v26 = v43;
        if (!v41) {
          goto LABEL_43;
        }
LABEL_39:
        v13[2](v13, v33, v26);
        goto LABEL_43;
      }
      goto LABEL_32;
    }
    if (!v42 && !a6)
    {
LABEL_32:
      uint64_t v26 = 0;
      goto LABEL_33;
    }
    id v34 = objc_loadWeakRetained(location);
    BOOL v35 = +[PKTextInputUITextInputInterface insertCommittedText:withAlternatives:activePreviewText:replacingRange:inTextInput:](PKTextInputUITextInputInterface, "insertCommittedText:withAlternatives:activePreviewText:replacingRange:inTextInput:", &stru_1F1FB2C00, MEMORY[0x1E4F1CBF0], v42, a5, a6, v34);

    uint64_t v26 = 0;
    if (v35)
    {
LABEL_33:
      +[PKTextInputUtilities markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:](PKTextInputUtilities, "markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:", v15, a5, a6, [v45 count]);
      uint64_t v33 = 1;
      if (!v13) {
        goto LABEL_43;
      }
      goto LABEL_39;
    }
    uint64_t v33 = 0;
    if (v13) {
      goto LABEL_39;
    }
  }
  else
  {
    id v27 = a1[8];
    if (v27)
    {
      id v28 = v27;
      id v29 = objc_loadWeakRetained(a1 + 7);
      if (v29)
      {
        unint64_t v30 = v29;
        id v31 = objc_loadWeakRetained(a1 + 5);

        if (v31)
        {
          if (a5 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v47 = 0;
            BOOL v32 = [(PKTextInputElementContent *)(BOOL)a1 _webInsertTextsToCommitPhase2:v45 withAlternatives:v42 activePreviewText:0x7FFFFFFFFFFFFFFFLL replacingRange:a6 committedLength:&v47];
            if (v32) {
              +[PKTextInputUtilities markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:](PKTextInputUtilities, "markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:", v46, 0x7FFFFFFFFFFFFFFFLL, a6, [v45 count]);
            }
            if (v13) {
              v13[2](v13, v32, v47);
            }
          }
          else
          {
            if ([v46 count] || objc_msgSend(v42, "length"))
            {
              uint64_t v36 = objc_msgSend(a1[8], "deltaForSelectionRange:", a5, a6);
              uint64_t v38 = v37;
              id v39 = objc_loadWeakRetained(a1 + 7);
              v48[0] = MEMORY[0x1E4F143A8];
              v48[1] = 3221225472;
              v48[2] = __110__PKTextInputElementContent_insertTextsToCommit_withAlternatives_activePreviewText_replacingRange_completion___block_invoke_2;
              v48[3] = &unk_1E64C7C20;
              v48[4] = a1;
              id v49 = v46;
              id v50 = v45;
              id v51 = v42;
              uint64_t v53 = a5;
              uint64_t v54 = a6;
              v52 = v13;
              +[PKTextInputUtilities adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:", v36, v38, v39, v48);

              CGFloat v40 = v49;
            }
            else
            {
              v55[0] = MEMORY[0x1E4F143A8];
              v55[1] = 3221225472;
              v55[2] = __110__PKTextInputElementContent_insertTextsToCommit_withAlternatives_activePreviewText_replacingRange_completion___block_invoke;
              v55[3] = &unk_1E64C7BF8;
              v56 = v13;
              [(PKTextInputElementContent *)(uint64_t)a1 deleteTextInRange:a6 completion:v55];
              CGFloat v40 = v56;
            }
          }
          goto LABEL_43;
        }
      }
      else
      {
      }
    }
    if (v13) {
      v13[2](v13, 0, 0);
    }
  }
LABEL_43:
}

uint64_t __110__PKTextInputElementContent_insertTextsToCommit_withAlternatives_activePreviewText_replacingRange_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)deleteTextInRange:(uint64_t)a3 completion:(void *)a4
{
  id v7 = a4;
  if (a1)
  {
    id v8 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      if (a3)
      {
        if (*(void *)(a1 + 16))
        {
          objc_msgSend(MEMORY[0x1E4FAE450], "traitsForUITextInputTraits:");
          id v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v10 = objc_alloc_init(MEMORY[0x1E4FAE450]);
        }
        uint64_t v20 = v10;
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4FAE3F8]) initWithTextInputTraits:v10];
        id v22 = (void *)MEMORY[0x1E4FAE2A8];
        id v23 = objc_loadWeakRetained((id *)(a1 + 32));
        BOOL v24 = [v22 documentStateOfDocumentWithParagraph:v23];

        uint64_t v35 = 0;
        uint64_t v36 = 0;
        [v21 smartDeleteForDocumentState:v24 outBeforeLength:&v36 outAfterLength:&v35];
        a2 -= v36;
        a3 += v36 + v35;
      }
      if (qword_1EB3C5F58 != -1) {
        dispatch_once(&qword_1EB3C5F58, &__block_literal_global_36);
      }
      id v25 = (id)_MergedGlobals_131;
      if (a2)
      {
        uint64_t v26 = [(PKTextInputElementContent *)a1 stringInRange:1];
        if ([v26 length] == 1)
        {
          unsigned int v27 = objc_msgSend(v25, "characterIsMember:", objc_msgSend(v26, "characterAtIndex:", 0));
          a3 += v27;
          if (v27) {
            --a2;
          }
        }
      }
      if (a2 + a3 < (unint64_t)-[PKTextInputElementContent contentLength](a1))
      {
        id v28 = [(PKTextInputElementContent *)a1 stringInRange:1];
        if ([v28 length] == 1) {
          a3 += objc_msgSend(v25, "characterIsMember:", objc_msgSend(v28, "characterAtIndex:", 0));
        }
      }
      id v29 = objc_loadWeakRetained(v8);
      BOOL v30 = +[PKTextInputUITextInputInterface deleteTextInRange:inTextInput:](PKTextInputUITextInputInterface, "deleteTextInRange:inTextInput:", a2, a3, v29);

      if (v30) {
        +[PKTextInputUtilities markAnalyticsForDeletionCount:rangeToReplace:](PKTextInputUtilities, "markAnalyticsForDeletionCount:rangeToReplace:", a3, a2, a3);
      }
      if (v7) {
        v7[2](v7, v30);
      }
    }
    else
    {
      id v11 = *(id *)(a1 + 64);
      if (v11)
      {
        char v12 = v11;
        id v13 = objc_loadWeakRetained((id *)(a1 + 56));
        if (v13)
        {
          double v14 = v13;
          id v15 = objc_loadWeakRetained((id *)(a1 + 40));

          if (v15)
          {
            uint64_t v16 = objc_msgSend(*(id *)(a1 + 64), "deltaForSelectionRange:", a2, a3);
            uint64_t v18 = v17;
            id v19 = objc_loadWeakRetained((id *)(a1 + 56));
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __58__PKTextInputElementContent_deleteTextInRange_completion___block_invoke;
            v31[3] = &unk_1E64C7C48;
            v31[4] = a1;
            uint64_t v33 = a2;
            uint64_t v34 = a3;
            BOOL v32 = v7;
            +[PKTextInputUtilities adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:", v16, v18, v19, v31);

            goto LABEL_31;
          }
        }
        else
        {
        }
      }
      if (v7) {
        v7[2](v7, 0);
      }
    }
  }
LABEL_31:
}

uint64_t __110__PKTextInputElementContent_insertTextsToCommit_withAlternatives_activePreviewText_replacingRange_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = 0;
  BOOL v2 = [(PKTextInputElementContent *)*(void *)(a1 + 32) _webInsertTextsToCommitPhase2:*(void **)(a1 + 48) withAlternatives:*(void **)(a1 + 56) activePreviewText:*(void *)(a1 + 72) replacingRange:*(void *)(a1 + 80) committedLength:&v4];
  if (v2) {
    +[PKTextInputUtilities markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:](PKTextInputUtilities, "markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:", *(void *)(a1 + 40), *(void *)(a1 + 72), *(void *)(a1 + 80), [*(id *)(a1 + 48) count]);
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, v2, v4);
  }
  return result;
}

- (BOOL)_webInsertTextsToCommitPhase2:(void *)a3 withAlternatives:(void *)a4 activePreviewText:(uint64_t)a5 replacingRange:(uint64_t)a6 committedLength:(void *)a7
{
  id v12 = a2;
  id v25 = a3;
  id v23 = a4;
  if (!a1) {
    goto LABEL_21;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v22 = a7;
  if (WeakRetained)
  {
    if ([v12 count])
    {
      if ([v12 count])
      {
        unint64_t v14 = 0;
        uint64_t v15 = 0;
        do
        {
          uint64_t v16 = [v12 objectAtIndexedSubscript:v14];
          uint64_t v17 = [v25 objectAtIndexedSubscript:v14];
          if (v14) {
            uint64_t v18 = 0;
          }
          else {
            uint64_t v18 = a6;
          }
          if (v14) {
            uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v19 = a5;
          }
          id v20 = 0;
          if (v14 == [v12 count] - 1) {
            id v20 = v23;
          }
          -[PKTextInputElementContent _webInsertCommittedTextPhase3:withAlternatives:activePreviewText:replacingRange:webTextInput:](v16, v17, v20, v19, v18, WeakRetained);
          v15 += [v16 length];

          ++v14;
        }
        while (v14 < [v12 count]);
        goto LABEL_18;
      }
    }
    else
    {
      -[PKTextInputElementContent _webInsertCommittedTextPhase3:withAlternatives:activePreviewText:replacingRange:webTextInput:](&stru_1F1FB2C00, MEMORY[0x1E4F1CBF0], v23, a5, a6, WeakRetained);
    }
  }
  uint64_t v15 = 0;
LABEL_18:
  if (v22) {
    *id v22 = v15;
  }

  a1 = WeakRetained != 0;
LABEL_21:

  return a1;
}

- (void)_webInsertCommittedTextPhase3:(void *)a3 withAlternatives:(uint64_t)a4 activePreviewText:(uint64_t)a5 replacingRange:(void *)a6 webTextInput:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  if ([v10 length] | a5)
  {
    if (objc_opt_respondsToSelector())
    {
      [v13 insertText:v10 alternatives:v11 style:1];
    }
    else
    {
      unint64_t v14 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 134218754;
        id v30 = v13;
        __int16 v31 = 2112;
        BOOL v32 = v16;
        __int16 v33 = 2048;
        uint64_t v34 = [v10 length];
        __int16 v35 = 2048;
        uint64_t v36 = [v11 count];
        _os_log_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEFAULT, "Text input <%p %@> does not support insertText:alternatives:style:. Inserting text of %ld length and ignoring %ld alternatives.", buf, 0x2Au);
      }
      [v13 insertText:v10];
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [v13 markedTextRange];
    if (v17)
    {
      uint64_t v18 = [v13 markedTextRange];
      int v19 = [v18 isEmpty] ^ 1;
    }
    else
    {
      int v19 = 0;
    }

    if ([(__CFString *)v12 length] || v19)
    {
      if (!v12) {
        id v12 = &stru_1F1FB2C00;
      }
      uint64_t v20 = [(__CFString *)v12 length];
      uint64_t v21 = +[PKTextInputSettings sharedSettings];
      if ([v21 styledActivePreview])
      {
        char v22 = objc_opt_respondsToSelector();

        if (v22)
        {
          id v23 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 0.5, 0.3, *MEMORY[0x1E4FB0700]);
          v28[0] = v23;
          v27[1] = *MEMORY[0x1E4FB06C0];
          BOOL v24 = [MEMORY[0x1E4FB1618] clearColor];
          v28[1] = v24;
          id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

          uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12 attributes:v25];
          objc_msgSend(v13, "setAttributedMarkedText:selectedRange:", v26, v20, 0);

          goto LABEL_21;
        }
      }
      else
      {
      }
      objc_msgSend(v13, "setMarkedText:selectedRange:", v12, v20, 0);
    }
  }
LABEL_21:
}

void __68__PKTextInputElementContent_controlCharacterSetUsedByEducationPanel__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 17, 4);
  uint64_t v1 = (void *)_MergedGlobals_131;
  _MergedGlobals_131 = v0;
}

void __58__PKTextInputElementContent_deleteTextInRange_completion___block_invoke(void *a1)
{
  id v8 = [MEMORY[0x1E4FB1900] activeInstance];
  uint64_t v2 = [v8 delegate];
  if (v2 && (v3 = (void *)v2, char v4 = objc_opt_respondsToSelector(), v3, (v4 & 1) != 0))
  {
    [v8 performDelete];
  }
  else
  {
    uint64_t v5 = a1[4];
    if (v5) {
      id WeakRetained = objc_loadWeakRetained((id *)(v5 + 40));
    }
    else {
      id WeakRetained = 0;
    }
    [WeakRetained deleteBackward];
  }
  +[PKTextInputUtilities markAnalyticsForDeletionCount:rangeToReplace:](PKTextInputUtilities, "markAnalyticsForDeletionCount:rangeToReplace:", a1[7], a1[6], a1[7]);
  uint64_t v7 = a1[5];
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
  }
}

- (void)selectTextInRange:(uint64_t)a3 completion:(void *)a4
{
  uint64_t v7 = a4;
  if (a1)
  {
    id v8 = a1 + 4;
    id WeakRetained = objc_loadWeakRetained(a1 + 4);

    if (WeakRetained)
    {
      id v10 = objc_loadWeakRetained(v8);
      uint64_t v11 = +[PKTextInputUITextInputInterface selectedRangeInTextInput:v10];
      uint64_t v13 = v12;

      id v14 = objc_loadWeakRetained(v8);
      BOOL v15 = +[PKTextInputUITextInputInterface selectTextInRange:inTextInput:](PKTextInputUITextInputInterface, "selectTextInRange:inTextInput:", a2, a3, v14);

      +[PKTextInputUtilities markAnalyticsForSelectionChange:relativeRangeBefore:](PKTextInputUtilities, "markAnalyticsForSelectionChange:relativeRangeBefore:", a2, a3, v11, v13);
      if (v7) {
        v7[2](v7, v15);
      }
    }
    else
    {
      id v16 = a1[8];
      if (v16
        && (uint64_t v17 = v16, v18 = a1 + 7, v19 = objc_loadWeakRetained(a1 + 7), v19, v17, v19))
      {
        uint64_t v20 = [a1[8] selectedTextRange];
        uint64_t v22 = v21;
        uint64_t v23 = objc_msgSend(a1[8], "deltaForSelectionRange:", a2, a3);
        uint64_t v25 = v24;
        id v26 = objc_loadWeakRetained(v18);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        void v27[2] = __58__PKTextInputElementContent_selectTextInRange_completion___block_invoke;
        v27[3] = &unk_1E64C7C70;
        uint64_t v29 = a2;
        uint64_t v30 = a3;
        uint64_t v31 = v20;
        uint64_t v32 = v22;
        id v28 = v7;
        +[PKTextInputUtilities adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:", v23, v25, v26, v27);
      }
      else if (v7)
      {
        v7[2](v7, 0);
      }
    }
  }
}

uint64_t __58__PKTextInputElementContent_selectTextInRange_completion___block_invoke(void *a1)
{
  +[PKTextInputUtilities markAnalyticsForSelectionChange:relativeRangeBefore:](PKTextInputUtilities, "markAnalyticsForSelectionChange:relativeRangeBefore:", a1[5], a1[6], a1[7], a1[8]);
  uint64_t result = a1[4];
  if (result)
  {
    unint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)configureSelectionStyleForHighlight
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v4 = v2;
  }
  else {
    char v4 = (id *)(a1 + 40);
  }
  id v5 = objc_loadWeakRetained(v4);

  if (v5) {
    BOOL v6 = +[PKTextInputUITextInputInterface configureSelectionStyleForHighlightInTextInput:v5];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)configureSelectionStyleForDeletionPreview
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v4 = v2;
  }
  else {
    char v4 = (id *)(a1 + 40);
  }
  id v5 = objc_loadWeakRetained(v4);

  if (v5) {
    BOOL v6 = +[PKTextInputUITextInputInterface configureSelectionStyleForDeletionPreviewInTextInput:v5];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)configureSelectionStyleForNormalSelection
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v4 = v2;
  }
  else {
    char v4 = (id *)(a1 + 40);
  }
  id v5 = objc_loadWeakRetained(v4);

  if (v5) {
    BOOL v6 = +[PKTextInputUITextInputInterface configureSelectionStyleForNormalSelectionInTextInput:v5];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_insertTextPlaceholderWithSize:(double)a3 completionHandler:(double)a4
{
  uint64_t v7 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 32));
      id v10 = +[PKTextInputUITextInputInterface insertTextPlaceholderWithSize:inTextInput:](PKTextInputUITextInputInterface, "insertTextPlaceholderWithSize:inTextInput:", v9, a3, a4);

      v7[2](v7, v10);
LABEL_4:

      goto LABEL_5;
    }
    uint64_t v11 = (id *)(a1 + 56);
    id v12 = objc_loadWeakRetained(v11);

    if (v12)
    {
      id v10 = objc_loadWeakRetained(v11);
      if (objc_opt_respondsToSelector())
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __78__PKTextInputElementContent__insertTextPlaceholderWithSize_completionHandler___block_invoke;
        v19[3] = &unk_1E64C7C98;
        uint64_t v20 = v7;
        objc_msgSend(v10, "insertTextPlaceholderWithSize:completionHandler:", v19, a3, a4);
      }
      else if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = [v10 insertDictationResultPlaceholder];
        if (v13)
        {
          if (objc_opt_respondsToSelector())
          {
            [v10 frameForDictationResultPlaceholder:v13];
          }
          else
          {
            double v14 = *MEMORY[0x1E4F1DB20];
            double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
            double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
            double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
          }
          uint64_t v18 = +[PKTextInputTextPlaceholder placeholderWithToken:frame:](PKTextInputTextPlaceholder, "placeholderWithToken:frame:", v13, v14, v15, v16, v17);
          v7[2](v7, v18);
        }
        else
        {
          v7[2](v7, 0);
        }
      }
      else
      {
        v7[2](v7, 0);
      }
      goto LABEL_4;
    }
    if (v7) {
      v7[2](v7, 0);
    }
  }
LABEL_5:
}

void __78__PKTextInputElementContent__insertTextPlaceholderWithSize_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[PKTextInputTextPlaceholder placeholderWithWebTextPlaceholder:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removeTextPlaceholder:(uint64_t)a3 willInsertText:(void *)a4 completionHandler:
{
  id v15 = a2;
  uint64_t v7 = a4;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 32));
      +[PKTextInputUITextInputInterface removeTextPlaceholder:v15 inTextInput:v9];

LABEL_4:
      v7[2](v7);
      goto LABEL_12;
    }
    id v10 = (id *)(a1 + 56);
    id v11 = objc_loadWeakRetained(v10);

    if (!v11) {
      goto LABEL_4;
    }
    id v12 = objc_loadWeakRetained(v10);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [v15 placeholder];
      [v12 removeTextPlaceholder:v13 willInsertText:a3 completionHandler:v7];
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        double v14 = [v15 placeholder];
        [v12 removeDictationResultPlaceholder:v14 willInsertResult:a3];
      }
      v7[2](v7);
    }
  }
LABEL_12:
}

- (double)frameForTextPlaceholder:(void *)a3 inCoordinateSpace:
{
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    double v20 = 0.0;
    goto LABEL_7;
  }
  uint64_t v7 = [v5 rects];
  id v8 = [v7 firstObject];
  [v8 rect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v18 = objc_loadWeakRetained((id *)(a1 + 32));
    id v19 = [v18 textInputView];
    double v20 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v19, v6, v10, v12, v14, v16);
  }
  else
  {
    uint64_t v21 = (id *)(a1 + 56);
    id v22 = objc_loadWeakRetained(v21);

    if (!v22)
    {
      double v20 = *MEMORY[0x1E4F1DB20];
      goto LABEL_7;
    }
    id v18 = objc_loadWeakRetained(v21);
    double v20 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v18, v6, v10, v12, v14, v16);
  }

LABEL_7:
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__webDocumentCurrentLineContext, 0);
  objc_storeStrong((id *)&self->__webDocumentContext, 0);
  objc_destroyWeak((id *)&self->__webDocumentSourceView);
  objc_storeStrong((id *)&self->__webComposedContextString, 0);
  objc_destroyWeak((id *)&self->__webTextInput);
  objc_destroyWeak((id *)&self->__textInput);
  objc_storeStrong((id *)&self->_textInputTraits, 0);

  objc_storeStrong((id *)&self->_element, 0);
}

@end