@interface PKTextInputElement
+ (double)hitToleranceFrameFromElementFrame:(double)a3 insets:(double)a4;
- (BOOL)clearActivePreview;
- (BOOL)containsPoint:(double)a3 inCoordinateSpace:(double)a4;
- (BOOL)isElementView:(uint64_t)a1;
- (BOOL)showSelectionCommands;
- (CGRect)selectionClipRectInCoordinateSpace:(id)a3;
- (_NSRange)activeAffectedRange;
- (_NSRange)activePreviewRange;
- (__CFString)debugElementTypeDescription;
- (double)_safeHitFrame;
- (double)clampedReferencePoint:(uint64_t)a1;
- (double)frame;
- (double)hitToleranceFrameFromElementFrame:(double)a3;
- (id)_containerInteractionView;
- (id)_textInputResponder;
- (id)coordinateSpace;
- (id)description;
- (id)initWithElementInteraction:(void *)a3 elementIdentifier:(void *)a4 orderInContainer:;
- (id)initWithTextInput:(id *)a1;
- (id)isEquivalentToElement:(id *)a1;
- (id)referenceView;
- (id)selectionHighlightColor;
- (uint64_t)_isFromSameContainerAsElement:(uint64_t)a1;
- (uint64_t)containsView:(id *)a1;
- (uint64_t)isEditableElement;
- (uint64_t)isFocused;
- (uint64_t)isInFrontOfElement:(uint64_t)a1;
- (uint64_t)shouldBeginAtLocation:(double)a3;
- (uint64_t)shouldPostponeFocusing;
- (void)_beginSuppressingFieldPlaceholder;
- (void)_finishSuppressingFieldPlaceholderIfNeeded;
- (void)_promoteKeyWindowIfNecessary:(void *)a1;
- (void)_scribbleInteraction;
- (void)dealloc;
- (void)didEndWriting;
- (void)didInsertText;
- (void)didMoveToWritingSession:(id)a3;
- (void)didTargetElementForTouches:(void *)a3 event:;
- (void)evaluateLineBreakForTapAtLocation:(char)a3 weakCursor:(void *)a4 allowTrailingWhitespace:(double)a5 completion:(CGFloat)a6;
- (void)focusElementIfNeededWithReferencePoint:(void *)a3 alwaysSetSelectionFromReferencePoint:(double)a4 completion:(double)a5;
- (void)loadContentFocusingIfNeededWithReferencePoint:(void *)a3 alwaysSetSelectionFromReferencePoint:(double)a4 rectOfInterest:(double)a5 completion:(CGFloat)a6;
- (void)notifyTextInputTextDidChange;
- (void)notifyTextInputTextWillChange;
- (void)swapWritingStateWithElement:(id)a3;
- (void)updateFromEquivalentElement:(uint64_t)a1;
- (void)updateWithFocusedTextInput:(uint64_t)a1;
- (void)willBeginWriting;
@end

@implementation PKTextInputElement

- (id)initWithElementInteraction:(void *)a3 elementIdentifier:(void *)a4 orderInContainer:
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)PKTextInputElement;
    v10 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 10, a2);
      objc_storeStrong(a1 + 15, a3);
      a1[11] = a4;
      v11 = -[PKTextInputElement _containerInteractionView](a1);
      char v12 = objc_opt_respondsToSelector();
      uint64_t v13 = 1;
      if (v12) {
        uint64_t v13 = 2;
      }
      a1[7] = (id)v13;
    }
  }

  return a1;
}

- (id)_containerInteractionView
{
  if (a1)
  {
    v2 = a1;
    if (objc_opt_respondsToSelector())
    {
      a1 = [v2[10] interactionView];
    }
    else if (objc_opt_respondsToSelector())
    {
      a1 = [v2[10] view];
    }
    else
    {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)initWithTextInput:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)PKTextInputElement;
    v4 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 13, v3);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeWeak(a1 + 8, v3);
      }
      else if (objc_opt_respondsToSelector())
      {
        v5 = [v3 textInputView];
        objc_storeWeak(a1 + 8, v5);
      }
      a1[7] = 0;
      uint64_t v6 = PKScribbleInteractionInTextInput(v3);
      id v7 = a1[9];
      a1[9] = (id)v6;
    }
  }

  return a1;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self && self->__waitingForMatchingDidFinishWriting)
  {
    id v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = self;
      _os_log_fault_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_FAULT, "Element deallocated while waiting for matching didEndWriting. %@", buf, 0xCu);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)PKTextInputElement;
  [(PKTextInputElement *)&v4 dealloc];
}

- (id)coordinateSpace
{
  if (WeakRetained)
  {
    uint64_t v2 = *(void *)(WeakRetained + 56);
    if ((unint64_t)(v2 - 1) >= 2)
    {
      if (v2) {
        WeakRetained = 0;
      }
      else {
        WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(WeakRetained + 64));
      }
    }
    else
    {
      WeakRetained = -[PKTextInputElement _containerInteractionView]((id *)WeakRetained);
    }
    uint64_t v1 = vars8;
  }
  return (id)WeakRetained;
}

- (double)frame
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if ((unint64_t)(v2 - 1) >= 2)
    {
      if (v2) {
        return *(double *)(a1 + 8);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      uint64_t v9 = -[PKTextInputElement coordinateSpace](a1);
      id v10 = (id)v9;
      if (WeakRetained && v9)
      {
        [WeakRetained bounds];
        if (v10 != WeakRetained) {
          double v11 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(WeakRetained, v10, v11, v12, v13, v14);
        }
        *(double *)(a1 + 8) = v11;
        *(double *)(a1 + 16) = v12;
        *(double *)(a1 + 24) = v13;
        *(double *)(a1 + 32) = v14;
      }
    }
    else
    {
      uint64_t v3 = *(void *)(a1 + 120);
      id WeakRetained = *(id *)(a1 + 80);
      [WeakRetained frameForElement:v3];
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v6;
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = v8;
    }

    return *(double *)(a1 + 8);
  }
  return 0.0;
}

- (double)hitToleranceFrameFromElementFrame:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  id v10 = +[PKTextInputSettings sharedSettings];
  if (-[PKTextInputElement isFocused]((uint64_t)a1))
  {
    [v10 firstResponderAttractionHorizontal];
    double v12 = v11;
    [v10 firstResponderAttractionVertical];
  }
  else
  {
    [v10 textInputViewHitTestSlackHorizontal];
    double v12 = v14;
    [v10 textInputViewHitTestSlackVertical];
  }
  double v15 = v13;
  self;
  double v16 = -v15;
  double v17 = -v12;
  double v18 = v12 * -1.25;
  v19 = -[PKTextInputElement _scribbleInteraction](a1);
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "hitToleranceInsetsWithDefaultInsets:element:", a1[15], v16, v17, v16, v18);
    double v16 = v21;
    double v17 = v22;
  }
  double v23 = +[PKTextInputElement hitToleranceFrameFromElementFrame:insets:](a2, a3, a4, a5, v16, v17);

  return v23;
}

- (uint64_t)isFocused
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 56);
    if ((unint64_t)(v2 - 1) >= 2)
    {
      if (v2)
      {
        return 0;
      }
      else
      {
        uint64_t v7 = -[PKTextInputElement _textInputResponder](result);
        uint64_t v8 = [v7 isFirstResponder];

        return v8;
      }
    }
    else if ([*(id *)(result + 80) supportsIsElementFocused])
    {
      uint64_t v3 = *(void **)(v1 + 80);
      uint64_t v4 = *(void *)(v1 + 120);
      id v5 = v3;
      uint64_t v6 = [v5 isElementFocused:v4];

      return v6;
    }
    else
    {
      return *(unsigned char *)(v1 + 50) != 0;
    }
  }
  return result;
}

- (void)_scribbleInteraction
{
  if (a1)
  {
    unint64_t v2 = a1[7];
    if (v2 > 2) {
      a1 = 0;
    }
    else {
      a1 = *(id *)((char *)a1 + qword_1C48292E0[v2]);
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (double)hitToleranceFrameFromElementFrame:(double)a3 insets:(double)a4
{
  self;
  uint64_t v9 = +[PKTextInputSettings sharedSettings];
  [v9 minimumWritingSpaceWidth];
  double v11 = v10;

  if (a3 < v11)
  {
    double v12 = +[PKTextInputSettings sharedSettings];
    [v12 minimumWritingSpaceWidth];
  }
  return a1 + a6;
}

- (id)description
{
  if (self)
  {
    unint64_t elementType = self->__elementType;
    if (elementType > 2) {
      uint64_t v4 = @"?";
    }
    else {
      uint64_t v4 = off_1E64C69A8[elementType];
    }
  }
  else
  {
    uint64_t v4 = @"UITextInputView";
  }
  id v5 = -[PKTextInputElement coordinateSpace]((uint64_t)self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  uint64_t v6 = -[PKTextInputElement coordinateSpace]((uint64_t)self);
  uint64_t v7 = [v6 window];

  if (!v7)
  {
LABEL_9:
    v27 = NSString;
    v43.origin.x = -[PKTextInputElement frame]((uint64_t)self);
    v26 = NSStringFromCGRect(v43);
    [v27 stringWithFormat:@"frameInElement: %@", v26];
    goto LABEL_10;
  }
  double v8 = -[PKTextInputElement frame]((uint64_t)self);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = -[PKTextInputElement coordinateSpace]((uint64_t)self);
  double v16 = -[PKTextInputElement coordinateSpace]((uint64_t)self);
  double v17 = [v16 window];
  double v18 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v15, v17, v8, v10, v12, v14);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v25 = NSString;
  v42.origin.x = v18;
  v42.origin.y = v20;
  v42.size.width = v22;
  v42.size.height = v24;
  v26 = NSStringFromCGRect(v42);
  [v25 stringWithFormat:@"frameInWindow: %@", v26];
  v28 = LABEL_10:;

  if (self && self->__containerInteraction)
  {
    v29 = NSString;
    v30 = self->_containerElementIdentifier;
    v31 = [v29 stringWithFormat:@", containerElementID: %@, orderInContainer: %ld", v30, self->__orderInContainer];
  }
  else
  {
    v31 = &stru_1F1FB2C00;
  }
  v32 = -[PKTextInputElement referenceView]((id *)&self->super.isa);
  v33 = v32;
  if (v32)
  {
    PKDebugStringRepresentation(v32);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = @"None";
  }
  v40.receiver = self;
  v40.super_class = (Class)PKTextInputElement;
  v35 = [(PKTextInputElement *)&v40 description];
  v36 = v35;
  if (self) {
    recognitionIdentifier = self->_recognitionIdentifier;
  }
  else {
    recognitionIdentifier = 0;
  }
  v38 = [v35 stringByAppendingFormat:@" type: %@, recognitionID: %@%@, %@, referenceView: %@", v4, recognitionIdentifier, v31, v28, v34];

  return v38;
}

- (id)referenceView
{
  if (WeakRetained)
  {
    unint64_t v2 = WeakRetained;
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 8);
    if (!WeakRetained)
    {
      if (v2[10])
      {
        -[PKTextInputElement _containerInteractionView](v2);
        id WeakRetained = (id *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id WeakRetained = 0;
      }
    }
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (__CFString)debugElementTypeDescription
{
  if (result)
  {
    unint64_t length = result[1].length;
    if (length > 2) {
      return @"?";
    }
    else {
      return off_1E64C69A8[length];
    }
  }
  return result;
}

- (id)_textInputResponder
{
  if (a1)
  {
    uint64_t v1 = (id *)(a1 + 104);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = objc_loadWeakRetained(v1);
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)updateWithFocusedTextInput:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && *(void *)(a1 + 56) == 1)
  {
    id v4 = v3;
    objc_storeWeak((id *)(a1 + 104), v3);
    id v3 = v4;
  }
}

- (void)updateFromEquivalentElement:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (v3)
    {
      char v4 = v3[50];
      uint64_t v5 = *((void *)v3 + 11);
    }
    else
    {
      char v4 = 0;
      uint64_t v5 = 0;
    }
    *(unsigned char *)(a1 + 50) = v4;
    *(void *)(a1 + 88) = v5;
  }
}

- (uint64_t)shouldBeginAtLocation:(double)a3
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = -[PKTextInputElement _scribbleInteraction](a1);
  uint64_t v6 = v5;
  if (v5) {
    uint64_t v7 = objc_msgSend(v5, "shouldBeginAtLocation:", a2, a3);
  }
  else {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)didTargetElementForTouches:(void *)a3 event:
{
  id v7 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = -[PKTextInputElement _scribbleInteraction](a1);
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v6 didTargetElement:a1[15] forTouches:v7 event:v5];
    }
  }
}

- (BOOL)containsPoint:(double)a3 inCoordinateSpace:(double)a4
{
  if (result)
  {
    uint64_t v6 = result;
    id v7 = a2;
    double v8 = -[PKTextInputElement coordinateSpace](v6);
    double v9 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v7, v8, a3, a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    uint64_t v11 = v10;

    double v12 = -[PKTextInputElement frame](v6);
    double v16 = v9;
    uint64_t v17 = v11;
    return CGRectContainsPoint(*(CGRect *)&v12, *(CGPoint *)&v16);
  }
  return result;
}

- (id)isEquivalentToElement:(id *)a1
{
  id v3 = a2;
  char v4 = (id *)v3;
  if (!a1) {
    goto LABEL_20;
  }
  if (v3) {
    id v5 = (id)v3[7];
  }
  else {
    id v5 = 0;
  }
  if (a1[7] != v5) {
    goto LABEL_19;
  }
  if (a1[14])
  {
    if (v3)
    {
      uint64_t v6 = (void *)v3[14];
      if (v6)
      {
        a1 = (id *)objc_msgSend(v6, "isEqualToNumber:");
        goto LABEL_20;
      }
    }
  }
  if (!a1[10])
  {
    uint64_t v10 = a1 + 13;
    id WeakRetained = objc_loadWeakRetained(v10);

    if (WeakRetained)
    {
      if (v4) {
        id v12 = objc_loadWeakRetained(v4 + 13);
      }
      else {
        id v12 = 0;
      }
      id v13 = objc_loadWeakRetained(v10);
      a1 = (id *)[v12 isEqual:v13];

      goto LABEL_20;
    }
LABEL_19:
    a1 = 0;
    goto LABEL_20;
  }
  if (!-[PKTextInputElement _isFromSameContainerAsElement:]((uint64_t)a1, v4)) {
    goto LABEL_19;
  }
  a1 = (id *)a1[15];
  if (a1)
  {
    if (v4) {
      id v7 = v4[15];
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
    double v9 = a1;
    a1 = (id *)[v8 isEqual:v9];
  }
LABEL_20:

  return a1;
}

- (uint64_t)_isFromSameContainerAsElement:(uint64_t)a1
{
  id v3 = a2;
  char v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    id v6 = *((id *)v3 + 10);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = v4[10];
      id v9 = *(id *)(a1 + 80);
      uint64_t v5 = [v9 isEqual:v8];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (uint64_t)isInFrontOfElement:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = -[PKTextInputElement referenceView]((id *)a1);
    uint64_t v5 = -[PKTextInputElement referenceView](v3);
    uint64_t v6 = [v4 isDescendantOfView:v5];

    uint64_t v7 = *(void *)(a1 + 56);
    if (v7 == 2)
    {
      if (-[PKTextInputElement _isFromSameContainerAsElement:](a1, v3))
      {
        if (v3) {
          id v9 = v3[11];
        }
        else {
          id v9 = 0;
        }
        uint64_t v6 = *(void *)(a1 + 88) < (uint64_t)v9;
      }
    }
    else if (v7 == 1 && -[PKTextInputElement _isFromSameContainerAsElement:](a1, v3))
    {
      if (v3) {
        id v8 = v3[11];
      }
      else {
        id v8 = 0;
      }
      uint64_t v6 = *(void *)(a1 + 88) >= (uint64_t)v8;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)isEditableElement
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (*(void *)(a1 + 80))
    {
      if (objc_opt_respondsToSelector())
      {
        unint64_t v2 = *(void **)(v1 + 80);
        uint64_t v3 = *(void *)(v1 + 120);
        id v4 = v2;
        uint64_t v5 = [v4 isEditableElement:v3];
LABEL_8:
        uint64_t v1 = v5;

        return v1;
      }
    }
    else
    {
      uint64_t v6 = (id *)(a1 + 104);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      if (WeakRetained)
      {
        id v8 = WeakRetained;
        id v9 = objc_loadWeakRetained(v6);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v4 = objc_loadWeakRetained(v6);
          uint64_t v5 = +[PKTextInputElementsFinder isResponderEditableTextInput:]((uint64_t)PKTextInputElementsFinder, v4);
          goto LABEL_8;
        }
      }
    }
    return 1;
  }
  return v1;
}

- (BOOL)isElementView:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)(v4 - 1) < 2)
    {
      -[PKTextInputElement _containerInteractionView]((id *)a1);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v6 = v5 == v3;
LABEL_9:

      goto LABEL_10;
    }
    if (!v4)
    {
      uint64_t v7 = (id *)(a1 + 104);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      if (WeakRetained == v3)
      {
        BOOL v6 = 1;
        id v5 = v3;
      }
      else
      {
        id v5 = WeakRetained;
        id v9 = objc_loadWeakRetained(v7);
        id v10 = [v9 textInputView];
        BOOL v6 = v10 == v3;
      }
      goto LABEL_9;
    }
  }
  BOOL v6 = 0;
LABEL_10:

  return v6;
}

- (uint64_t)containsView:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = -[PKTextInputElement referenceView](a1);
    if (v4) {
      uint64_t v5 = [v3 isDescendantOfView:v4];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)loadContentFocusingIfNeededWithReferencePoint:(void *)a3 alwaysSetSelectionFromReferencePoint:(double)a4 rectOfInterest:(double)a5 completion:(CGFloat)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  if (a1)
  {
    double v18 = -[PKTextInputElementContent initWithElement:]((id *)[PKTextInputElementContent alloc], (void *)a1);
    unint64_t v19 = *(void *)(a1 + 56);
    if (v19 >= 2)
    {
      if (v19 == 2)
      {
        v47.origin.CGFloat x = -[PKTextInputElement _safeHitFrame](a1);
        v49.origin.CGFloat x = a6;
        v49.origin.CGFloat y = a7;
        v49.size.CGFloat width = a8;
        v49.size.CGFloat height = a9;
        CGRect v48 = CGRectIntersection(v47, v49);
        CGFloat x = v48.origin.x;
        CGFloat y = v48.origin.y;
        CGFloat width = v48.size.width;
        CGFloat height = v48.size.height;
        CGFloat v24 = -[PKTextInputElement _containerInteractionView]((id *)a1);
        if (v24)
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke_2;
          v30[3] = &unk_1E64C68C0;
          v31 = v18;
          id v32 = v24;
          CGFloat v35 = x;
          CGFloat v36 = y;
          CGFloat v37 = width;
          CGFloat v38 = height;
          uint64_t v33 = a1;
          id v34 = v17;
          [(PKTextInputElement *)a1 focusElementIfNeededWithReferencePoint:v30 alwaysSetSelectionFromReferencePoint:a4 completion:a5];
        }
        else
        {
          v28 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            uint64_t v29 = *(void *)(a1 + 80);
            *(_DWORD *)buf = 138412546;
            uint64_t v43 = a1;
            __int16 v44 = 2112;
            uint64_t v45 = v29;
            _os_log_error_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_ERROR, "Failed to load content for web element because the interaction view is nil. element: %@, interaction: %@", buf, 0x16u);
          }

          (*((void (**)(id, id *))v17 + 2))(v17, v18);
        }
      }
      goto LABEL_25;
    }
    if ((-[PKTextInputElement isEditableElement](a1) & 1) == 0 && !*(void *)(a1 + 56)) {
      goto LABEL_17;
    }
    if (!-[PKTextInputElement shouldPostponeFocusing]((void *)a1)
      || -[PKTextInputElement isFocused](a1))
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke;
      v39[3] = &unk_1E64C6870;
      objc_super v40 = v18;
      id v41 = v17;
      [(PKTextInputElement *)a1 focusElementIfNeededWithReferencePoint:v39 alwaysSetSelectionFromReferencePoint:a4 completion:a5];

LABEL_25:
      goto LABEL_26;
    }
    if (*(void *)(a1 + 56))
    {
      v25 = [*(id *)(a1 + 80) interaction];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_20:
        (*((void (**)(id, id *))v17 + 2))(v17, v18);
        goto LABEL_25;
      }
      id WeakRetained = *(id *)(a1 + 120);
      if (!WeakRetained
        || (objc_opt_respondsToSelector() & 1) == 0
        || ![WeakRetained conformsToProtocol:&unk_1F208B728])
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
LABEL_17:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    }
    -[PKTextInputElementContent loadDataIfNeededWithTextInput:]((uint64_t)v18, WeakRetained);
    goto LABEL_19;
  }
LABEL_26:
}

- (uint64_t)shouldPostponeFocusing
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    unint64_t v2 = -[PKTextInputElement _scribbleInteraction](a1);
    char v3 = [v2 focusWillTransformElement:*(void *)(v1 + 120)];

    if (v3)
    {
      return 1;
    }
    else
    {
      uint64_t v4 = +[PKTextInputSettings sharedSettings];
      char v5 = [v4 UCBPaletteEnabled];

      if (v5)
      {
        return 0;
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v1 + 64));
        uint64_t v7 = [WeakRetained window];

        if (!v7)
        {
          id v8 = -[PKTextInputElement _containerInteractionView]((id *)v1);
          uint64_t v7 = [v8 window];

          if (!v7) {
            goto LABEL_12;
          }
        }
        id v9 = -[PKTextInputElement coordinateSpace](v1);

        if (v9)
        {
          double v10 = -[PKTextInputElement frame](v1);
          double v12 = v11;
          double v14 = v13;
          double v16 = v15;
          id v17 = -[PKTextInputElement coordinateSpace](v1);
          double v18 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v17, v7, v10, v12, v14, v16);
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          double v24 = v23;

          [v7 bounds];
          double MaxY = CGRectGetMaxY(v28);
          v29.origin.CGFloat x = v18;
          v29.origin.CGFloat y = v20;
          v29.size.CGFloat width = v22;
          v29.size.CGFloat height = v24;
          BOOL v26 = MaxY - CGRectGetMaxY(v29) < 120.0;
          uint64_t v1 = v24 <= 120.0 && v26;
        }
        else
        {
LABEL_12:
          uint64_t v1 = 0;
        }
      }
    }
  }
  return v1;
}

uint64_t __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    -[PKTextInputElementContent loadDataIfNeededWithTextInput:](*(void *)(a1 + 32), a2);
  }
  char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)focusElementIfNeededWithReferencePoint:(void *)a3 alwaysSetSelectionFromReferencePoint:(double)a4 completion:(double)a5
{
  id v9 = a3;
  double v10 = (void (**)(void, void))v9;
  if (!a1) {
    goto LABEL_39;
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if ((unint64_t)(v11 - 1) >= 2)
  {
    if (v11) {
      goto LABEL_39;
    }
    int v27 = -[PKTextInputElement isFocused](a1);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    if (WeakRetained
      && (-[PKTextInputElement coordinateSpace](a1),
          CGRect v29 = objc_claimAutoreleasedReturnValue(),
          v29,
          v29))
    {
      if (!v27 || a2)
      {
        v30 = -[PKTextInputElement coordinateSpace](a1);
        v31 = [WeakRetained textInputView];
        double v32 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v30, v31, a4, a5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
        double v34 = v33;

        +[PKTextInputUITextInputInterface setSelectionWithReferencePoint:inTextInput:](PKTextInputUITextInputInterface, "setSelectionWithReferencePoint:inTextInput:", WeakRetained, v32, v34);
      }
      CGFloat v35 = [MEMORY[0x1E4FB1900] activeInstance];
      CGFloat v36 = [v35 textInputTraits];
      uint64_t v37 = [v36 keyboardType];

      if (v37 == 122)
      {
        BOOL v38 = 1;
        if (!v10) {
          goto LABEL_38;
        }
      }
      else
      {
        -[PKTextInputElement _promoteKeyWindowIfNecessary:](WeakRetained);
        uint64_t v43 = -[PKTextInputElement _textInputResponder](a1);
        BOOL v38 = +[PKTextInputUITextInputInterface makeTextInputFirstResponder:v43 forPencilInput:1];

        if (!v10)
        {
LABEL_38:

          goto LABEL_39;
        }
      }
    }
    else
    {
      BOOL v38 = 0;
      if (!v10) {
        goto LABEL_38;
      }
    }
    if ((v27 & v38) == 1)
    {
      ((void (**)(void, id))v10)[2](v10, WeakRetained);
    }
    else
    {
      __int16 v44 = +[PKTextInputSettings sharedSettings];
      [v44 debugFirstResponderArtificialDelay];
      double v46 = v45;

      dispatch_time_t v47 = dispatch_time(0, (uint64_t)(v46 * 1000000000.0));
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke;
      v54[3] = &unk_1E64C6910;
      v56 = v10;
      BOOL v57 = v38;
      id v55 = WeakRetained;
      dispatch_after(v47, MEMORY[0x1E4F14428], v54);
    }
    goto LABEL_38;
  }
  if (*(void *)(a1 + 80))
  {
    v59.origin.double x = -[PKTextInputElement frame](a1);
    double x = v59.origin.x;
    double y = v59.origin.y;
    double width = v59.size.width;
    double height = v59.size.height;
    v58.double x = a4;
    v58.double y = a5;
    BOOL v16 = CGRectContainsPoint(v59, v58);
    double v17 = x + width;
    if (a4 <= x + width) {
      double v17 = a4;
    }
    if (a4 < x) {
      double v17 = x;
    }
    double v18 = y + height;
    if (a5 <= y + height) {
      double v18 = a5;
    }
    if (a5 < y) {
      double v18 = y;
    }
    if (!v16)
    {
      a4 = v17;
      a5 = v18;
    }
    double v19 = -[PKTextInputElement _containerInteractionView]((id *)a1);
    -[PKTextInputElement _promoteKeyWindowIfNecessary:](v19);

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_2;
    aBlock[3] = &unk_1E64C6870;
    aBlock[4] = a1;
    v53 = v10;
    CGFloat v20 = _Block_copy(aBlock);
    id v21 = objc_loadWeakRetained((id *)(a1 + 104));
    if (v21)
    {
      CGFloat v22 = v21;
      id v23 = *(id *)(a1 + 80);
      if ([v23 supportsIsElementFocused])
      {
        int v24 = -[PKTextInputElement isFocused](a1);

        if (v24)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_4;
          block[3] = &unk_1E64C6960;
          block[4] = a1;
          v51 = v20;
          id v25 = v20;
          dispatch_async(MEMORY[0x1E4F14428], block);
          BOOL v26 = v51;
LABEL_33:

          goto LABEL_39;
        }
      }
      else
      {
      }
    }
    v39 = *(void **)(a1 + 80);
    uint64_t v40 = *(void *)(a1 + 120);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_5;
    v48[3] = &unk_1E64C6870;
    v48[4] = a1;
    CGRect v49 = v20;
    id v41 = v20;
    id v42 = v39;
    objc_msgSend(v42, "focusElement:initialFocusSelectionReferencePoint:completion:", v40, v48, a4, a5);

    BOOL v26 = v49;
    goto LABEL_33;
  }
  if (v9) {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
LABEL_39:
}

- (double)_safeHitFrame
{
  if (!a1) {
    return 0.0;
  }
  double result = -[PKTextInputElement frame](a1);
  if (*(void *)(a1 + 56) == 2)
  {
    -[PKTextInputElement frame](a1);
    if (v3 * 0.5 <= 4.0) {
      double v5 = v3 * 0.5;
    }
    else {
      double v5 = 4.0;
    }
    if (v4 * 0.5 <= 4.0) {
      double v6 = v4 * 0.5;
    }
    else {
      double v6 = 4.0;
    }
    v7.origin.double x = -[PKTextInputElement frame](a1);
    *(void *)&double result = (unint64_t)CGRectInset(v7, v5, v6);
  }
  return result;
}

void __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke_3;
    v9[3] = &unk_1E64C6898;
    id v11 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 32);
    -[PKTextInputElementContent loadDataIfNeededWithWebDocumentSourceView:textInput:rectOfInterest:completion:](v4, v5, a2, v9, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
  }
  else
  {
    double v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7) {
        uint64_t v8 = *(void *)(v7 + 80);
      }
      else {
        uint64_t v8 = 0;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_error_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_ERROR, "Failed to load content for web element because it returned a nil focusedTextInput. element: %@, interaction: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)evaluateLineBreakForTapAtLocation:(char)a3 weakCursor:(void *)a4 allowTrailingWhitespace:(double)a5 completion:(CGFloat)a6
{
  id v11 = a4;
  if (a1)
  {
    double v12 = +[PKTextInputSettings sharedSettings];
    [v12 tapToLineBreakVerticalDistance];
    double v14 = v13;

    uint64_t v15 = -[PKTextInputElement coordinateSpace](a1);
    -[PKTextInputElement frame](a1);
    v29.origin.CGFloat x = 0.0;
    v29.size.CGFloat height = 1.0;
    v29.origin.CGFloat y = a6;
    CGRect v30 = CGRectInset(v29, 0.0, -v14);
    CGFloat x = v30.origin.x;
    CGFloat y = v30.origin.y;
    CGFloat width = v30.size.width;
    CGFloat height = v30.size.height;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __102__PKTextInputElement_evaluateLineBreakForTapAtLocation_weakCursor_allowTrailingWhitespace_completion___block_invoke;
    v21[3] = &unk_1E64C68E8;
    id v22 = v15;
    id v23 = v11;
    char v27 = a3;
    double v24 = a5;
    CGFloat v25 = a6;
    v21[4] = a1;
    double v26 = v14;
    char v28 = a2;
    id v20 = v15;
    -[PKTextInputElement loadContentFocusingIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:rectOfInterest:completion:](a1, 0, v21, a5, a6, x, y, width, height);
  }
}

void __102__PKTextInputElement_evaluateLineBreakForTapAtLocation_weakCursor_allowTrailingWhitespace_completion___block_invoke(uint64_t a1, void *a2)
{
  double v19 = a2;
  if (!-[PKTextInputElementContent isSingleLineDocumentContent]((uint64_t)v19)
    && ((int v3 = *(unsigned __int8 *)(a1 + 80),
         uint64_t v4 = -[PKTextInputElementContent contentLength]((uint64_t)v19),
         -[PKTextInputElement coordinateSpace](*(void *)(a1 + 32)),
         double v5 = objc_claimAutoreleasedReturnValue(),
         uint64_t v6 = [(PKTextInputElementContent *)v19 characterIndexClosestToPoint:0 inCoordinateSpace:0 forInsertingText:*(double *)(a1 + 56) adjustForLastCharacter:*(double *)(a1 + 64)], v5, v6 != 0x7FFFFFFFFFFFFFFFLL)? (v7 = v6 <= v4): (v7 = 0), v7))
  {
    if (!v3
      || !v4
      || (uint64_t NonWhitespace = -[PKTextInputElementContent indexOfLastNonWhitespaceCharacter]((uint64_t)v19),
          NonWhitespace == 0x7FFFFFFFFFFFFFFFLL)
      || NonWhitespace >= v6)
    {
      if (v4 < 1) {
        double v10 = -[PKTextInputElementContent caretRectInCoordinateSpace:]((uint64_t)v19, *(void **)(a1 + 40));
      }
      else {
        [(PKTextInputElementContent *)v19 firstRectForRange:1uLL inCoordinateSpace:*(void **)(a1 + 40)];
      }
      CGFloat v14 = v10;
      CGFloat v15 = v11;
      CGFloat v16 = v12;
      CGFloat v17 = v13;
      if (!CGRectIsNull(*(CGRect *)&v10))
      {
        double v18 = *(double *)(a1 + 64);
        v21.origin.CGFloat x = v14;
        v21.origin.CGFloat y = v15;
        v21.size.CGFloat width = v16;
        v21.size.CGFloat height = v17;
        if (v18 > CGRectGetMaxY(v21) + *(double *)(a1 + 72))
        {
          if (*(unsigned char *)(a1 + 81)) {
            [(PKTextInputElementContent *)v19 setSelectionWithReferencePoint:*(double *)(a1 + 56) completionHandler:*(double *)(a1 + 64)];
          }
        }
      }
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v8();
}

- (void)_promoteKeyWindowIfNecessary:(void *)a1
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  int v3 = PKDynamicCast(v2, v1);

  id v4 = [v3 _responderWindow];

  if (([v4 isKeyWindow] & 1) == 0) {
    [v4 makeKeyWindow];
  }
}

uint64_t __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    +[PKTextInputUITextInputInterface makeTextInputFirstResponder:v3 forPencilInput:1];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    double v5 = *(void **)(v4 + 80);
  }
  else {
    double v5 = 0;
  }
  if ([v5 supportsIsElementFocused])
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    }
  }
  else
  {
    double v7 = -[PKTextInputElement frame](*(void *)(a1 + 32));
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      CGFloat v15 = *(void **)(v14 + 80);
    }
    else {
      CGFloat v15 = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_3;
    v16[3] = &unk_1E64C6938;
    v16[4] = v14;
    id v18 = *(id *)(a1 + 40);
    id v17 = v3;
    objc_msgSend(v15, "requestElementsInRect:completion:", v16, v7, v9, v11, v13);
  }
}

void __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_3(void *a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  double v13 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v7 = 0;
  }
  else
  {
    if ([v5 count] <= a3)
    {
      char v7 = 0;
    }
    else
    {
      double v8 = [v13 objectAtIndexedSubscript:a3];
      uint64_t v9 = a1[4];
      if (v9) {
        double v10 = *(void **)(v9 + 120);
      }
      else {
        double v10 = 0;
      }
      char v7 = [v10 isEqual:v8];
    }
    uint64_t v6 = v13;
  }
  uint64_t v11 = a1[4];
  if (v11) {
    *(unsigned char *)(v11 + 50) = v7;
  }
  uint64_t v12 = a1[6];
  if (v12)
  {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, a1[5]);
    uint64_t v6 = v13;
  }
}

void __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

void __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_6;
  block[3] = &unk_1E64C6988;
  uint64_t v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_6(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (double)clampedReferencePoint:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  double result = -[PKTextInputElement _safeHitFrame](a1);
  if (a2 >= result)
  {
    double v5 = result + v4;
    double result = a2;
    if (a2 > v5) {
      return v5;
    }
  }
  return result;
}

- (_NSRange)activeAffectedRange
{
  p_isa = (id *)&self->super.isa;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  }
  else {
    id WeakRetained = 0;
  }
  double v4 = [WeakRetained selectedTextRange];
  double v5 = [v4 start];

  if (p_isa) {
    id v6 = objc_loadWeakRetained(p_isa + 13);
  }
  else {
    id v6 = 0;
  }
  id v7 = [v6 selectedTextRange];
  id v8 = [v7 end];

  uint64_t v9 = 0;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 && v8)
  {
    if (p_isa) {
      id v11 = objc_loadWeakRetained(p_isa + 13);
    }
    else {
      id v11 = 0;
    }
    uint64_t v9 = [v11 beginningOfDocument];

    if (v9)
    {
      if (p_isa) {
        id v12 = objc_loadWeakRetained(p_isa + 13);
      }
      else {
        id v12 = 0;
      }
      double v13 = [v12 beginningOfDocument];
      uint64_t v10 = [v12 offsetFromPosition:v13 toPosition:v5];

      if (p_isa) {
        p_isa = (id *)objc_loadWeakRetained(p_isa + 13);
      }
      uint64_t v9 = (void *)[p_isa offsetFromPosition:v5 toPosition:v8];
    }
    else
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  NSUInteger v14 = v10;
  NSUInteger v15 = (NSUInteger)v9;
  result.unint64_t length = v15;
  result.location = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerElementIdentifier, 0);
  objc_storeStrong((id *)&self->_recognitionIdentifier, 0);
  objc_destroyWeak((id *)&self->_textInput);
  objc_destroyWeak((id *)&self->__writingSession);
  objc_storeStrong((id *)&self->__containerInteraction, 0);
  objc_storeStrong((id *)&self->__viewScribbleInteraction, 0);
  objc_destroyWeak((id *)&self->_elementTextInputView);

  objc_storeStrong((id *)&self->_coordinateSpace, 0);
}

- (void)_beginSuppressingFieldPlaceholder
{
  uint64_t v2 = self;
  if (self)
  {
    if (self->__requestingPlaceholderSuppression || self->__elementType > 1uLL) {
      return;
    }
    id v3 = -[PKTextInputElement _scribbleInteraction](self);
    self = (PKTextInputElement *)objc_loadWeakRetained((id *)&v2->_textInput);
  }
  else
  {
    id v3 = 0;
  }
  id v8 = self;
  if (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = [(PKTextInputElement *)v8 textAlignment];
    }
    else {
      uint64_t v4 = 4;
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F1FB2C00];
    [(PKTextInputElement *)v8 _setOverridePlaceholder:v7 alignment:v4];

    if (v2) {
LABEL_16:
    }
      v2->__requestingPlaceholderSuppression = 1;
  }
  else if (v3)
  {
    if (v2) {
      containerElementIdentifier = v2->_containerElementIdentifier;
    }
    else {
      containerElementIdentifier = 0;
    }
    int v6 = [v3 beginSuppressingPlaceholderForElement:containerElementIdentifier];

    if (v2 && v6) {
      goto LABEL_16;
    }
  }
  else
  {
  }
}

- (void)_finishSuppressingFieldPlaceholderIfNeeded
{
  if (self)
  {
    if (self->__elementType > 1uLL)
    {
LABEL_11:
      self->__requestingPlaceholderSuppression = 0;
      return;
    }
    id v3 = -[PKTextInputElement _scribbleInteraction](self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  }
  else
  {
    id v3 = 0;
    id WeakRetained = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(WeakRetained, "_setOverridePlaceholder:alignment:", 0, objc_msgSend(WeakRetained, "textAlignment"));
  }
  else if (v3)
  {
    if (self) {
      containerElementIdentifier = self->_containerElementIdentifier;
    }
    else {
      containerElementIdentifier = 0;
    }
    [v3 endSuppressingPlaceholderForElement:containerElementIdentifier];
  }

  if (self) {
    goto LABEL_11;
  }
}

- (BOOL)showSelectionCommands
{
  if (!self) {
    return 0;
  }
  if (self->__elementType > 1uLL) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  if (!WeakRetained) {
    return 0;
  }
  id v3 = WeakRetained;
  BOOL v4 = +[PKTextInputUITextInputInterface showSelectionCommandsForTextInput:WeakRetained];

  return v4;
}

- (_NSRange)activePreviewRange
{
  if (self && self->__elementType <= 1uLL && (id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput)) != 0)
  {
    id v3 = WeakRetained;
    uint64_t v4 = +[PKTextInputUITextInputInterface activePreviewRangeInTextInput:WeakRetained];
    NSUInteger v6 = v5;
  }
  else
  {
    NSUInteger v6 = 0;
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v7 = v4;
  NSUInteger v8 = v6;
  result.unint64_t length = v8;
  result.location = v7;
  return result;
}

- (BOOL)clearActivePreview
{
  if (!self) {
    return 0;
  }
  if (self->__elementType > 1uLL) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  if (!WeakRetained) {
    return 0;
  }
  id v3 = WeakRetained;
  BOOL v4 = +[PKTextInputUITextInputInterface clearActivePreviewInTextInput:WeakRetained];

  return v4;
}

- (id)selectionHighlightColor
{
  if (self)
  {
    if (self->__elementType > 1uLL) {
      goto LABEL_12;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    if (WeakRetained)
    {
      if (objc_opt_respondsToSelector())
      {
        id v3 = [WeakRetained selectionHighlightColor];
        goto LABEL_8;
      }
      if (objc_opt_respondsToSelector())
      {
        BOOL v4 = [WeakRetained tintColor];
        id v3 = [v4 colorWithAlphaComponent:0.2];

LABEL_8:
        if (v3) {
          goto LABEL_15;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
    id WeakRetained = 0;
  }

LABEL_12:
  if (objc_opt_respondsToSelector())
  {
    id v3 = [MEMORY[0x1E4FB1618] performSelector:sel_selectionHighlightColor];
  }
  else
  {
    NSUInteger v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
    id v3 = [v5 colorWithAlphaComponent:0.2];
  }
LABEL_15:

  return v3;
}

- (CGRect)selectionClipRectInCoordinateSpace:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = -[PKTextInputElement coordinateSpace]((uint64_t)self);

  if (v5)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    }
    else {
      id WeakRetained = 0;
    }
    +[PKTextInputUtilities selectionClipRectForTextInput:WeakRetained];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v23.origin.CGFloat x = v8;
    v23.origin.CGFloat y = v10;
    v23.size.CGFloat width = v12;
    v23.size.CGFloat height = v14;
    if (!CGRectIsNull(v23))
    {
      NSUInteger v15 = -[PKTextInputElement coordinateSpace]((uint64_t)self);
      double v8 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v15, v4, v8, v10, v12, v14);
      double v10 = v16;
      double v12 = v17;
      double v14 = v18;
    }
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)notifyTextInputTextWillChange
{
  if (self)
  {
    if (self->__elementType <= 1uLL)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
      if (WeakRetained)
      {
        id v3 = WeakRetained;
        +[PKTextInputUITextInputInterface notifyTextWillChangeInTextInput:WeakRetained];
      }
    }
  }
}

- (void)notifyTextInputTextDidChange
{
  if (self)
  {
    if (self->__elementType <= 1uLL)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
      if (WeakRetained)
      {
        id v3 = WeakRetained;
        +[PKTextInputUITextInputInterface notifyTextDidChangeInTextInput:WeakRetained];
      }
    }
  }
}

- (void)swapWritingStateWithElement:(id)a3
{
  id v4 = a3;
  if (self)
  {
    BOOL waitingForMatchingDidFinishWriting = self->__waitingForMatchingDidFinishWriting;
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL waitingForMatchingDidFinishWriting = 0;
    if (v4)
    {
LABEL_3:
      BOOL v6 = v4[49] != 0;
      if (!self) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  BOOL v6 = 0;
  if (self) {
LABEL_4:
  }
    self->__BOOL waitingForMatchingDidFinishWriting = v6;
LABEL_5:
  if (v4) {
    v4[49] = waitingForMatchingDidFinishWriting;
  }
}

- (void)didMoveToWritingSession:(id)a3
{
  if (self) {
    objc_storeWeak((id *)&self->__writingSession, a3);
  }
}

- (void)willBeginWriting
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    if (self->__waitingForMatchingDidFinishWriting)
    {
      id v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        int v7 = 138412290;
        double v8 = self;
        _os_log_fault_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_FAULT, "Element received willBeginWriting while waiting for matching didEndWriting. %@", (uint8_t *)&v7, 0xCu);
      }
    }
    self->__BOOL waitingForMatchingDidFinishWriting = 1;
  }
  [(PKTextInputElement *)self _beginSuppressingFieldPlaceholder];
  id v4 = -[PKTextInputElement _scribbleInteraction](self);
  NSUInteger v5 = v4;
  if (self)
  {
    [v4 willBeginWritingInElement:self->_containerElementIdentifier];

    id WeakRetained = objc_loadWeakRetained((id *)&self->__writingSession);
  }
  else
  {
    [v4 willBeginWritingInElement:0];

    id WeakRetained = 0;
  }
  -[PKTextInputWritingSession willBeginWritingInElement:]((uint64_t)WeakRetained, self);
}

- (void)didEndWriting
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self && self->__waitingForMatchingDidFinishWriting) {
    goto LABEL_6;
  }
  id v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v7 = 138412290;
    double v8 = self;
    _os_log_fault_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_FAULT, "Element received didEndWriting without a matching willBeginWriting. %@", (uint8_t *)&v7, 0xCu);
  }

  if (self) {
LABEL_6:
  }
    self->__BOOL waitingForMatchingDidFinishWriting = 0;
  [(PKTextInputElement *)self _finishSuppressingFieldPlaceholderIfNeeded];
  id v4 = -[PKTextInputElement _scribbleInteraction](self);
  NSUInteger v5 = v4;
  if (self)
  {
    [v4 didFinishWritingInElement:self->_containerElementIdentifier];

    id WeakRetained = objc_loadWeakRetained((id *)&self->__writingSession);
  }
  else
  {
    [v4 didFinishWritingInElement:0];

    id WeakRetained = 0;
  }
  -[PKTextInputWritingSession didEndWritingInElement:]((uint64_t)WeakRetained, self);
}

- (void)didInsertText
{
  uint64_t v2 = self;
  if (self) {
    self = (PKTextInputElement *)objc_loadWeakRetained((id *)&self->__writingSession);
  }
  id v3 = self;
  -[PKTextInputWritingSession didInsertTextInElement:]((uint64_t)self, v2);
}

@end