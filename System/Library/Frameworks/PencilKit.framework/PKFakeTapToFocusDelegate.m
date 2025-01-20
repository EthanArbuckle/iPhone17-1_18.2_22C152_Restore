@interface PKFakeTapToFocusDelegate
+ (BOOL)_shouldAttachForView:(id)a3;
+ (BOOL)isPossibleForView:(id)a3 focusInfo:(id)a4;
+ (id)_infoInProcess;
+ (id)_tapGestureForView:(id)a3;
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)_scribbleInteractionIsEnabled:(id)a3;
- (BOOL)_shouldFocusBeforeObservingWithFocusInfo:(id)a3;
- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4;
- (PKFakeTapToFocusDelegate)initWithView:(id)a3;
- (void)_focusWithFocusInfo:(id)a3;
- (void)_scribbleInteraction:(id)a3 didTargetElement:(id)a4 forTouches:(id)a5 event:(id)a6;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)_waitForFirstResponderChangeWithFocusInfo:(id)a3 completion:(id)a4;
@end

@implementation PKFakeTapToFocusDelegate

+ (id)_infoInProcess
{
  if (qword_1EB3C6340 != -1) {
    dispatch_once(&qword_1EB3C6340, &__block_literal_global_194_0);
  }
  v2 = (void *)qword_1EB3C6338;

  return v2;
}

void __42__PKFakeTapToFocusDelegate__infoInProcess__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:10];
  v1 = (void *)qword_1EB3C6330;
  qword_1EB3C6330 = v0;

  v2 = (void *)qword_1EB3C6330;
  v3 = +[_PKFakeTapToFocusInfo textFieldInfoWithInteractionValue:]((uint64_t)_PKFakeTapToFocusInfo, 0x8891053787535CDBLL);
  [v2 setObject:v3 forKey:0x19B59197E7178DCALL];

  v4 = (void *)qword_1EB3C6330;
  v5 = +[_PKFakeTapToFocusInfo textFieldInfoWithInteractionValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xEB605147DFE620FALL);
  [v4 setObject:v5 forKey:0xF0BB69860FE7B106];

  v6 = (void *)qword_1EB3C6330;
  v7 = +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:]((uint64_t)_PKFakeTapToFocusInfo, 0x9014357CBD5C32AALL);
  [v6 setObject:v7 forKey:0x7838F9B1D3C01804];

  v8 = (void *)qword_1EB3C6330;
  v9 = +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:]((uint64_t)_PKFakeTapToFocusInfo, 0x207FA8124C1E7C51);
  [v8 setObject:v9 forKey:0x7077CFFA7F89E0E4];

  v10 = (void *)qword_1EB3C6330;
  v11 = +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xDE8D388A4E693F22, 0xDE417A374F93F3A4, 0xE6C28B1B4EAE624BLL, 64);
  [v10 setObject:v11 forKey:0x45E68C020940D624];

  v12 = (void *)qword_1EB3C6330;
  v13 = +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xB2F09010117585, 0, 0, 65);
  [v12 setObject:v13 forKey:0xD4040AF4B530D3A4];

  v14 = (void *)qword_1EB3C6330;
  v15 = +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xDE8D388A4E693F22, 0xE04BF7250B5CF98BLL, 0xD6C7DAA82897923ALL, 64);
  [v14 setObject:v15 forKey:0x740E7DD9D64E6F3ALL];

  v16 = (void *)qword_1EB3C6330;
  v17 = +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xE457228ED2EB2668, 0xE457228ED2EB2668, 0x65329911294C9811, 64);
  [v16 setObject:v17 forKey:0x16C0C530235A29CELL];

  v18 = (void *)qword_1EB3C6330;
  v19 = +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xDE8D388A4E693F22, 0xC76EF808E9F7A6CLL, 0xACABC03EA61EEB31, 64);
  [v18 setObject:v19 forKey:0x55F2A4B0E948E145];

  v20 = (void *)qword_1EB3C6330;
  v21 = +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xFA1FCF624F78D43ALL);
  [v20 setObject:v21 forKey:0xF0B4DFE693370458];

  v22 = (void *)qword_1EB3C6330;
  uint64_t v23 = self;
  *((unsigned char *)+[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:](v23, 0xDE8D388A4E693F22, 0x10B9926FE6F58D34, 0x5DA2AF0EB412511BLL, 64)+ 8) = 1;
  objc_msgSend(v22, "setObject:forKey:");
  v24 = (void *)qword_1EB3C6330;
  uint64_t v25 = self;
  v26 = +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:](v25, 0xDE8D388A4E693F22, 0xE0667A6DCEB6885ELL, 0x49E229890D3D4237, 64);
  *((unsigned char *)v26 + 8) = 1;
  [v24 setObject:v26 forKey:0x16BCC6C64092E83BLL];
  v27 = (void *)qword_1EB3C6330;
  uint64_t v28 = self;
  objc_msgSend(v27, "setObject:forKey:", +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:](v28, 0x5F9FE10F790F1980, 0x73FEECA1B3E834CLL, 0), 0x171648361A91B8);
  v29 = (void *)qword_1EB3C6330;
  uint64_t v30 = self;
  objc_msgSend(v29, "setObject:forKey:", +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:](v30, 0x8C93728A528D43C8, 0, 0), 0x77F67D758E4B3E12);
  v31 = (void *)qword_1EB3C6330;
  uint64_t v32 = self;
  objc_msgSend(v31, "setObject:forKey:", +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:](v32, 0x695AE772484B8BB0, 0, 0), 0x77F6767AA7605E22);
  v33 = (void *)qword_1EB3C6330;
  uint64_t v34 = self;
  objc_msgSend(v33, "setObject:forKey:", +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:](v34, 0x4A8C1AEE2AAE961, 0, 0), 0x93BC748310DA00A5);
  v35 = (void *)qword_1EB3C6330;
  v36 = +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xB2137591A3D8F82BLL, 0, 0x24C5326594B7E975);
  [v35 setObject:v36 forKey:0x8ADE1D3DFF7A57A4];

  v37 = (void *)qword_1EB3C6330;
  uint64_t v38 = self;
  objc_msgSend(v37, "setObject:forKey:", +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:](v38, 0x1C421DFF5D3BFFLL, 0xDD2EA25F3EEFEE50, 0), 0x48D72B7EADA6A598);
  v39 = [MEMORY[0x1E4F28B50] mainBundle];
  id v42 = [v39 bundleIdentifier];

  uint64_t v40 = objc_msgSend((id)qword_1EB3C6330, "objectForKey:", objc_msgSend(v42, "hash"));
  v41 = (void *)qword_1EB3C6338;
  qword_1EB3C6338 = v40;
}

+ (id)_tapGestureForView:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "gestureRecognizers", 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)_shouldAttachForView:(id)a3
{
  id v4 = a3;
  if (v4 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v5 = [a1 _infoInProcess];
    int v6 = [a1 isPossibleForView:v4 focusInfo:v5];
    LOBYTE(a1) = 0;
    if (!v5 || !v6) {
      goto LABEL_15;
    }
    if (v5[3])
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      uint64_t v9 = [v8 hash];
      uint64_t v10 = v5[3];

      if (v9 == v10)
      {
        if (!v5[4])
        {
LABEL_11:
          if (v5[5] && v5[6])
          {
            uint64_t v21 = 0;
            v22 = &v21;
            uint64_t v23 = 0x2020000000;
            char v24 = 0;
            id v16 = v4;
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __49__PKFakeTapToFocusDelegate__shouldAttachForView___block_invoke;
            v18[3] = &unk_1E64CB2D8;
            v19 = v5;
            v20 = &v21;
            [v16 enumerateEventHandlers:v18];
            LOBYTE(a1) = *((unsigned char *)v22 + 24) != 0;

            _Block_object_dispose(&v21, 8);
          }
          else
          {
            LOBYTE(a1) = 1;
          }
          goto LABEL_15;
        }
        long long v11 = [v4 subviews];
        a1 = [v11 firstObject];

        if (!a1)
        {
LABEL_15:

          goto LABEL_16;
        }
        long long v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        uint64_t v14 = [v13 hash];
        uint64_t v15 = v5[4];

        if (v14 == v15) {
          goto LABEL_11;
        }
      }
    }
    LOBYTE(a1) = 0;
    goto LABEL_15;
  }
  LOBYTE(a1) = 0;
LABEL_16:

  return (char)a1;
}

void __49__PKFakeTapToFocusDelegate__shouldAttachForView___block_invoke(uint64_t a1, uint64_t a2, void *a3, const char *a4, uint64_t a5, unsigned char *a6)
{
  id v21 = a3;
  char v10 = objc_opt_respondsToSelector();
  long long v11 = v21;
  if (v10)
  {
    long long v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = [v13 hash];
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      uint64_t v15 = *(void *)(v15 + 40);
    }
    if (v14 == v15)
    {
      id v16 = NSStringFromSelector(a4);
      uint64_t v17 = [v16 hash];
      uint64_t v18 = *(void *)(a1 + 32);
      if (v18) {
        uint64_t v19 = *(void *)(v18 + 48);
      }
      else {
        uint64_t v19 = 0;
      }

      long long v11 = v21;
      if (v17 == v19)
      {
        uint64_t v20 = *(void *)(a1 + 32);
        if (v20) {
          *(void *)(v20 + 56) = a5;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a6 = 1;
      }
    }
    else
    {

      long long v11 = v21;
    }
  }
}

+ (BOOL)isPossibleForView:(id)a3 focusInfo:(id)a4
{
  id v5 = a3;
  int v6 = (unint64_t *)a4;
  v7 = v6;
  if (v6)
  {
    unint64_t v8 = v6[2];
    if (v8 == 2)
    {
      uint64_t v9 = [v5 gestureRecognizers];
      char isKindOfClass = [v9 count] != 0;

      goto LABEL_7;
    }
    if (v8 > 1)
    {
      char isKindOfClass = 0;
      goto LABEL_7;
    }
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
LABEL_7:

  return isKindOfClass & 1;
}

- (PKFakeTapToFocusDelegate)initWithView:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKFakeTapToFocusDelegate;
  id v5 = [(PKFakeTapToFocusDelegate *)&v18 init];
  int v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    uint64_t v7 = [(id)objc_opt_class() _infoInProcess];
    focusInfo = v6->_focusInfo;
    v6->_focusInfo = (_PKFakeTapToFocusInfo *)v7;

    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    elementID = v6->_elementID;
    v6->_elementID = (NSUUID *)v9;

    long long v11 = v6->_focusInfo;
    if (v11)
    {
      if (v11->_type == 2)
      {
        long long v12 = [(id)objc_opt_class() _tapGestureForView:v4];
        objc_storeWeak((id *)&v6->_tapGesture, v12);

        v13 = objc_alloc_init(PKFakeUITapGestureForRequirements);
        gestureForRequirements = v6->_gestureForRequirements;
        v6->_gestureForRequirements = v13;

        [(PKFakeUITapGestureForRequirements *)v6->_gestureForRequirements setName:@"com.apple.PencilKit.tapGestureFailure"];
        [(PKFakeUITapGestureForRequirements *)v6->_gestureForRequirements setAllowedTouchTypes:&unk_1F200F090];
        [(PKFakeUITapGestureForRequirements *)v6->_gestureForRequirements setDelegate:v6];
        id WeakRetained = objc_loadWeakRetained((id *)&v6->_view);
        [WeakRetained addGestureRecognizer:v6->_gestureForRequirements];

        id v16 = objc_loadWeakRetained((id *)&v6->_tapGesture);
        [v16 requireGestureRecognizerToFail:v6->_gestureForRequirements];
      }
    }
  }

  return v6;
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 1;
}

- (BOOL)_scribbleInteractionIsEnabled:(id)a3
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v5 = [WeakRetained firstResponder];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_view);
    int v7 = [v6 _containsResponder:v5] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_view);
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 didTargetElement:(id)a4 forTouches:(id)a5 event:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  double v11 = (NSUUID *)a4;
  id v12 = a5;
  id v13 = a6;
  focusInfo = self->_focusInfo;
  if (focusInfo)
  {
    if (focusInfo->_type == 2 && self->_elementID == v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tapGesture);
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v24 = v12;
        id v25 = v10;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v17 = v12;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v27 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              -[PKFakeUITapGestureForRequirements _addTouch:forEvent:](self->_gestureForRequirements, "_addTouch:forEvent:", v22, v13, v24, v25, (void)v26);
              id v23 = objc_loadWeakRetained((id *)&self->_tapGesture);
              [v23 _removeTouch:v22 forEvent:v13];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v19);
        }

        id v12 = v24;
        id v10 = v25;
      }
    }
  }
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, uint64_t))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained)
  {
    v9[0] = self->_elementID;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v6[2](v6, v8, 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E4F1CBF0], 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (BOOL)_shouldFocusBeforeObservingWithFocusInfo:(id)a3
{
  return !a3 || *((void *)a3 + 2) == 0;
}

- (void)_focusWithFocusInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = v4[2];
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      double v7 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      [WeakRetained sendActionsForControlEvents:v7[7]];
      goto LABEL_8;
    }
    if (v5) {
      goto LABEL_10;
    }
LABEL_5:
    double v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained becomeFirstResponder];
LABEL_8:

    goto LABEL_9;
  }
  double v7 = v4;
  [(PKFakeUITapGestureForRequirements *)self->_gestureForRequirements setState:5];
LABEL_9:
  id v4 = v7;
LABEL_10:
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v18 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a6;
  focusInfo = self->_focusInfo;
  if (focusInfo && focusInfo->_type == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tapGesture);
    if (WeakRetained)
    {
      id v13 = WeakRetained;
      id v14 = objc_loadWeakRetained((id *)&self->_tapGesture);
      uint64_t v15 = [v14 state];

      focusInfo = self->_focusInfo;
      if (v15 == 5)
      {
        [(PKFakeTapToFocusDelegate *)self _focusWithFocusInfo:focusInfo];
        v10[2](v10, 0);
        goto LABEL_10;
      }
    }
    else
    {
      focusInfo = self->_focusInfo;
    }
  }
  BOOL v16 = [(PKFakeTapToFocusDelegate *)self _shouldFocusBeforeObservingWithFocusInfo:focusInfo];
  id v17 = self->_focusInfo;
  if (v16)
  {
    [(PKFakeTapToFocusDelegate *)self _focusWithFocusInfo:v17];
    [(PKFakeTapToFocusDelegate *)self _waitForFirstResponderChangeWithFocusInfo:self->_focusInfo completion:v10];
  }
  else
  {
    [(PKFakeTapToFocusDelegate *)self _waitForFirstResponderChangeWithFocusInfo:v17 completion:v10];
    [(PKFakeTapToFocusDelegate *)self _focusWithFocusInfo:self->_focusInfo];
  }
LABEL_10:
}

- (void)_waitForFirstResponderChangeWithFocusInfo:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0;
  id v18 = (id *)&v17;
  uint64_t v19 = 0x3042000000;
  uint64_t v20 = __Block_byref_object_copy__35;
  id v21 = __Block_byref_object_dispose__35;
  id v22 = 0;
  double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *MEMORY[0x1E4FB3348];
  id v9 = [MEMORY[0x1E4F28F08] mainQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__PKFakeTapToFocusDelegate__waitForFirstResponderChangeWithFocusInfo_completion___block_invoke;
  v13[3] = &unk_1E64CB300;
  id v15 = v6;
  BOOL v16 = &v17;
  id v14 = v5;
  id v10 = v6;
  id v11 = v5;
  id v12 = [v7 addObserverForName:v8 object:0 queue:v9 usingBlock:v13];
  objc_storeWeak(v18 + 5, v12);

  _Block_object_dispose(&v17, 8);
  objc_destroyWeak(&v22);
}

void __81__PKFakeTapToFocusDelegate__waitForFirstResponderChangeWithFocusInfo_completion___block_invoke(void *a1, void *a2)
{
  v3 = [a2 userInfo];
  id v14 = [v3 objectForKey:@"UIWindowFirstResponderUserInfoKey"];

  uint64_t v4 = a1[4];
  if (v4)
  {
    if (*(void *)(v4 + 64) && v14 != 0)
    {
      id v6 = (objc_class *)objc_opt_class();
      double v7 = NSStringFromClass(v6);
      uint64_t v8 = [v7 hash];
      uint64_t v9 = a1[4];
      uint64_t v10 = v9 ? *(void *)(v9 + 64) : 0;

      if (v8 != v10)
      {

        id v14 = 0;
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1[6] + 8) + 40));
  if (WeakRetained) {
    BOOL v12 = v14 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 removeObserver:WeakRetained];

    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureForRequirements, 0);
  objc_destroyWeak((id *)&self->_tapGesture);
  objc_storeStrong((id *)&self->_elementID, 0);
  objc_storeStrong((id *)&self->_focusInfo, 0);

  objc_destroyWeak((id *)&self->_view);
}

@end