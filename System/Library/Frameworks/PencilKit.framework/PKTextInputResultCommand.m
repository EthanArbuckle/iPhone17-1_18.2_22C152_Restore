@interface PKTextInputResultCommand
+ (id)_tokenColumnStringsForTopTranscriptionInTextResult:(uint64_t)a1;
+ (id)_transcriptionForTokensAtColumn:(uint64_t)a3 row:(void *)a4 textResult:;
- (id)_strokeSliceIDsToRemoveForCommittedTokenColumnCount:(char)a3 forceRemoveAll:;
- (id)description;
- (uint64_t)initWithQueryItem:(void *)a3 handwritingShot:(uint64_t)a4 immediateCommitType:(double)a5 applyAfterDelay:;
- (void)_applyResultCommandPhase2;
- (void)_applyTextReplacementWithCompletion:(uint64_t)a1;
- (void)_finishApplyingResultWithSuccess:(int)a3 cancelled:;
- (void)_removeStrokesForSliceIDs:(CGFloat)a3 destinationRect:(CGFloat)a4;
- (void)_setCommandState:(uint64_t)a1;
- (void)_updateInputTargetStateWithUncommittedPendingText:(void *)a3 activePreviewText:(uint64_t)a4 committedTextLength:(uint64_t)a5 accumulatedCommitLength:;
- (void)beginApplyingResultCommandWithInputTargetState:(uint64_t)a1;
- (void)cancelDelayedCommand;
@end

@implementation PKTextInputResultCommand

- (uint64_t)initWithQueryItem:(void *)a3 handwritingShot:(uint64_t)a4 immediateCommitType:(double)a5 applyAfterDelay:
{
  id v10 = a2;
  id v11 = a3;
  if (a1)
  {
    v23.receiver = (id)a1;
    v23.super_class = (Class)PKTextInputResultCommand;
    id v12 = objc_msgSendSuper2(&v23, sel_init);
    a1 = (uint64_t)v12;
    if (v12)
    {
      *((void *)v12 + 3) = 0;
      objc_storeStrong((id *)v12 + 4, a2);
      objc_storeStrong((id *)(a1 + 40), a3);
      *(void *)(a1 + 64) = a4;
      v13 = [v10 correctionResult];
      v14 = [v13 inputTarget];
      v15 = [v14 inputTargetIdentifier];

      if (v15)
      {
        uint64_t v16 = [v11 textInputElementContentForRecognitionIdentifier:v15];
        v17 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v16;
      }
      v18 = [v10 correctionResult];
      if (v18)
      {
        v19 = [v10 correctionResult];
        *(void *)(a1 + 112) = [v19 affectedRange];
        *(void *)(a1 + 120) = v20;
      }
      else
      {
        *(_OWORD *)(a1 + 112) = xmmword_1C482B1D0;
      }

      *(unsigned char *)(a1 + 11) = 1;
      if (a5 <= 0.0)
      {
        -[PKTextInputResultCommand _setCommandState:](a1, 2);
      }
      else
      {
        -[PKTextInputResultCommand _setCommandState:](a1, 1);
        objc_initWeak(&location, (id)a1);
        dispatch_time_t v21 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __59__PKTextInputResultCommand__scheduleBecomeReadyAfterDelay___block_invoke;
        block[3] = &unk_1E64C5998;
        objc_copyWeak(&v25, &location);
        dispatch_after(v21, MEMORY[0x1E4F14428], block);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
    }
  }

  return a1;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)PKTextInputResultCommand;
  v3 = [(PKTextInputResultCommand *)&v13 description];
  if (self)
  {
    unint64_t commandState = self->_commandState;
    if (commandState > 7) {
      v5 = &stru_1F1FB2C00;
    }
    else {
      v5 = off_1E64CA750[commandState];
    }
    unint64_t immediateCommitType = self->_immediateCommitType;
    if (immediateCommitType > 3) {
      v7 = &stru_1F1FB2C00;
    }
    else {
      v7 = off_1E64CA7C0[immediateCommitType];
    }
    v8 = self->_queryItem;
    v9 = self->_handwritingShot;
    targetElementContent = self->_targetElementContent;
  }
  else
  {
    v9 = 0;
    v8 = 0;
    targetElementContent = 0;
    v5 = @"SettingUp";
    v7 = @"None";
  }
  id v11 = [v3 stringByAppendingFormat:@" state: %@, immediateCommitType: %@, queryItem: %@, handwritingShot: %@, targetElementContent: %@", v5, v7, v8, v9, targetElementContent];

  return v11;
}

- (void)beginApplyingResultCommandWithInputTargetState:(uint64_t)a1
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  objc_setProperty_nonatomic_copy((id)a1, newValue, newValue, 56);
  v3 = [*(id *)(a1 + 32) correctionResult];
  id v4 = *(id *)(a1 + 48);
  v5 = v4;
  if (v4) {
    v6 = (void *)*((void *)v4 + 1);
  }
  else {
    v6 = 0;
  }
  v7 = v6;

  v8 = -[PKTextInputElement coordinateSpace]((uint64_t)v7);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  id v10 = [WeakRetained resultCommandSupportedElementDelegate:a1];

  id v11 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v3 resultType];
    objc_super v13 = NSStringFromRange(*(NSRange *)(a1 + 112));
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    uint64_t v72 = a1;
    __int16 v73 = 2048;
    v74 = (void *)v12;
    __int16 v75 = 2112;
    v76 = v13;
    __int16 v77 = 2112;
    v78 = v7;
    __int16 v79 = 2048;
    uint64_t v80 = v14;
    _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "ResultCommand %p: beginApplying, correctionType: %ld, affectedRange: %@, element: %@, shot: %p", buf, 0x34u);
  }
  if (v7 && v8)
  {
    if (!v3)
    {
      v17 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v59 = *(void **)(a1 + 32);
        v60 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        uint64_t v72 = a1;
        __int16 v73 = 2048;
        v74 = v59;
        __int16 v75 = 2112;
        v76 = v60;
        v61 = v59;
        _os_log_error_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_ERROR, "ResultCommand %p: failed because correctionResult is nil. QueryItem: %p. Shot: <%@>", buf, 0x20u);
      }
      goto LABEL_16;
    }
    if ([v3 resultType] != 1
      || ([v3 textResult], v15 = objc_claimAutoreleasedReturnValue(), v15, v15))
    {
      int v16 = 1;
      goto LABEL_17;
    }
    v17 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v53 = [v3 error];
      v54 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v72 = a1;
      __int16 v73 = 2112;
      v74 = v53;
      __int16 v75 = 2112;
      v76 = v54;
      v55 = "ResultCommand %p: failed because text result is nil. Error: %@. Shot: <%@>";
      v56 = v17;
      uint32_t v57 = 32;
LABEL_49:
      _os_log_error_impl(&dword_1C44F8000, v56, OS_LOG_TYPE_ERROR, v55, buf, v57);
    }
  }
  else
  {
    v17 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v53 = [v3 error];
      uint64_t v58 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134219010;
      uint64_t v72 = a1;
      __int16 v73 = 2048;
      v74 = v7;
      __int16 v75 = 2048;
      v76 = v8;
      __int16 v77 = 2112;
      v78 = v53;
      __int16 v79 = 2112;
      uint64_t v80 = v58;
      v55 = "ResultCommand %p: failed because of nil target element: %p or coordinate space: %p. Error: %@. Shot: <%@>";
      v56 = v17;
      uint32_t v57 = 52;
      goto LABEL_49;
    }
  }

LABEL_16:
  int v16 = 0;
LABEL_17:
  v18 = (id *)*(id *)(a1 + 56);
  v19 = v18;
  if (!v18)
  {
    id v20 = 0;
    goto LABEL_32;
  }
  id v20 = v18[2];
  if (v20)
  {
    v62 = v3;
    dispatch_time_t v21 = v8;
    v22 = v10;
    id v23 = v19[6];
    uint64_t v24 = [v23 length];

    if (!v24) {
      goto LABEL_31;
    }
    if (!v16)
    {
LABEL_27:
      id v34 = v19[4];
      v35 = [v34 textInputElementForRecognitionIdentifier:v20];
      v36 = v35;
      if (v35 && [v35 activePreviewRange] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [v36 notifyTextInputTextWillChange];
        [v36 clearActivePreview];
        [v36 notifyTextInputTextDidChange];
      }

      goto LABEL_31;
    }
    uint64_t v25 = *(void *)(a1 + 48);
    if (v25)
    {
      id v26 = *(id *)(v25 + 8);
      v27 = v26;
      if (v26)
      {
        v28 = (void *)*((void *)v26 + 14);
LABEL_24:
        id v29 = v28;

        if (!v29) {
          goto LABEL_27;
        }
        id v30 = v19[2];
        int v31 = [v30 isEqualToNumber:v29];

        if (!v31) {
          goto LABEL_27;
        }
        v32 = [*(id *)(a1 + 32) correctionResult];
        uint64_t v33 = [v32 resultType];

        if (v33 != 1) {
          goto LABEL_27;
        }
LABEL_31:
        id v10 = v22;
        v8 = v21;
        v3 = v62;
        goto LABEL_32;
      }
    }
    else
    {
      v27 = 0;
    }
    v28 = 0;
    goto LABEL_24;
  }
LABEL_32:

  v37 = objc_alloc_init(PKTextInputTargetState);
  uint64_t v38 = a1 + 104;
  objc_storeStrong((id *)(a1 + 104), v37);

  v39 = *(id *)(a1 + 56);
  if (v39) {
    BOOL v40 = v39[8] != 0;
  }
  else {
    BOOL v40 = 0;
  }
  if (*(void *)v38) {
    *(unsigned char *)(*(void *)v38 + 8) = v40;
  }

  if (v16)
  {
    if (-[PKTextInputElement isFocused]((uint64_t)v7))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke_2;
      block[3] = &unk_1E64C9B48;
      id v64 = v10;
      uint64_t v65 = a1;
      v66 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else if (-[PKTextInputElement shouldPostponeFocusing](v7) {
           && (*(unsigned char *)(a1 + 10) = 1, !*(void *)(a1 + 64)))
    }
    {
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke_51;
      v67[3] = &unk_1E64C61C0;
      v67[4] = a1;
      dispatch_async(MEMORY[0x1E4F14428], v67);
    }
    else
    {
      -[PKTextInputResultCommand _setCommandState:](a1, 3);
      v41 = [*(id *)(a1 + 32) strokeIdentifiers];
      v42 = [*(id *)(a1 + 40) strokeProvider];
      id v43 = objc_loadWeakRetained((id *)(a1 + 16));
      v44 = [v43 resultCommandCanvasController:a1];

      [v42 startingPointForSlicesWithIdentifiers:v41];
      double v46 = v45;
      double v48 = v47;
      v49 = -[PKTextInputCanvasController canvasCoordinateSpace](v44);
      double v50 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v49, v8, v46, v48, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v52 = v51;

      -[PKTextInputElement updateWithFocusedTextInput:]((uint64_t)v7, 0);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke;
      v68[3] = &unk_1E64CA558;
      v68[4] = a1;
      v69 = v7;
      id v70 = v10;
      [(PKTextInputElement *)(uint64_t)v69 focusElementIfNeededWithReferencePoint:v68 alwaysSetSelectionFromReferencePoint:v50 completion:v52];
    }
  }
  else
  {
    -[PKTextInputResultCommand _finishApplyingResultWithSuccess:cancelled:](a1, 0, 0);
  }
}

- (void)_setCommandState:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a1 + 24) = a2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained resultCommandStateDidChange:a1];
  }
}

void __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = a1[4];
    if (v4) {
      uint64_t v5 = *(void *)(v4 + 48);
    }
    else {
      uint64_t v5 = 0;
    }
    -[PKTextInputElementContent loadDataIfNeededWithTextInput:](v5, v3);
  }
  -[PKTextInputElement updateWithFocusedTextInput:](a1[5], v3);
  v6 = (void *)a1[6];
  if (!v6)
  {
    int v13 = 0;
    if (!v3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  uint64_t v7 = a1[4];
  if (v7)
  {
    id v8 = *(id *)(v7 + 48);
    v9 = v8;
    if (v8)
    {
      id v10 = (void *)*((void *)v8 + 2);
      goto LABEL_9;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = 0;
LABEL_9:
  id v11 = v10;
  int v12 = [v6 isSupportedForTextInputTraits:v11];

  int v13 = v12 ^ 1;
  if (!v3) {
    goto LABEL_14;
  }
LABEL_12:
  if ((v13 & 1) == 0)
  {
    -[PKTextInputResultCommand _applyResultCommandPhase2](a1[4]);
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v14 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = @"Yes";
    if (v3) {
      int v16 = @"Yes";
    }
    else {
      int v16 = @"No";
    }
    uint64_t v17 = a1[4];
    uint64_t v18 = a1[5];
    int v19 = 134218754;
    if (v13) {
      v15 = @"No";
    }
    uint64_t v20 = v17;
    __int16 v21 = 2112;
    v22 = v16;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    _os_log_error_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_ERROR, "ResultCommand %p: Failed to focus element, returned focusedTextInput: %@, is supported: %@. Element: %@", (uint8_t *)&v19, 0x2Au);
  }

  -[PKTextInputResultCommand _finishApplyingResultWithSuccess:cancelled:](a1[4], 0, 0);
LABEL_16:
}

- (void)_applyResultCommandPhase2
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[PKTextInputResultCommand _setCommandState:](a1, 4);
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v95 = __53__PKTextInputResultCommand__applyResultCommandPhase2__block_invoke;
    v96 = &unk_1E64C6730;
    uint64_t v97 = a1;
    v2 = v94;
    id v3 = *(id *)(a1 + 32);
    id v4 = *(id *)(a1 + 56);
    uint64_t v5 = [v3 correctionResult];
    v6 = *(id *)(a1 + 48);
    uint64_t v7 = v6;
    if (v6) {
      id v8 = (void *)v6[1];
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    id v93 = *(id *)(a1 + 40);
    if (!v7
      || ((uint64_t v10 = v7[3]) != 0 ? (v11 = v10 == 3) : (v11 = 1),
          v11
       || (NSUInteger v36 = *(void *)(a1 + 112), v37 = *(void *)(a1 + 120), v36 != 0x7FFFFFFFFFFFFFFFLL)
       && [(PKTextInputElementContent *)(BOOL)v7 isValidRange:*(void *)(a1 + 120)]))
    {
      switch([v5 resultType])
      {
        case 1:
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke;
          v104 = &unk_1E64CA580;
          v105 = (id *)v9;
          v106 = (id *)v4;
          v42 = v93;
          id v107 = v93;
          uint64_t v108 = a1;
          v109 = v2;
          -[PKTextInputResultCommand _applyTextReplacementWithCompletion:](a1, buf);

          id v43 = v105;
          goto LABEL_82;
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 8:
          id v88 = v4;
          id v89 = v9;
          uint64_t v86 = [v5 resultType];
          v98[0] = MEMORY[0x1E4F143A8];
          v98[1] = 3221225472;
          v98[2] = __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_4;
          v98[3] = &unk_1E64C6848;
          v98[4] = a1;
          v99 = v2;
          int v12 = v98;
          id v13 = *(id *)(a1 + 48);
          uint64_t v14 = [*(id *)(a1 + 40) inputInProgressStroke];
          v91 = [v14 _strokeUUID];

          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
          int v16 = [WeakRetained resultCommandFeedbackController:a1];

          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke;
          aBlock[3] = &unk_1E64CA620;
          id v90 = v16;
          id v101 = v90;
          v87 = v12;
          id v102 = v87;
          uint64_t v17 = _Block_copy(aBlock);
          if (!v13) {
            goto LABEL_78;
          }
          uint64_t v18 = *((void *)v13 + 3);
          if (!v18 || v18 == 3) {
            goto LABEL_78;
          }
          v83 = *(void **)(a1 + 120);
          uint64_t v85 = *(void *)(a1 + 112);
          id v19 = objc_loadWeakRetained((id *)(a1 + 16));
          uint64_t v20 = [v19 resultCommandCursorController:a1];
          [v20 makeCursorTemporarilyStrongWhileWriting];

          if (v91)
          {
            uint64_t v22 = *(void *)(a1 + 56);
            if (!v22) {
              goto LABEL_58;
            }
            id v23 = *(id *)(v22 + 80);
            if (!v23) {
              goto LABEL_58;
            }
            uint64_t v24 = v23;
            __int16 v25 = *(void **)(a1 + 56);
            if (v25) {
              __int16 v25 = (void *)v25[10];
            }
            uint64_t v26 = v25;
            int v27 = [v91 isEqual:v26];

            if (v27)
            {
              uint64_t v28 = *(void *)(a1 + 56);
              if (v28) {
                long long v29 = *(_OWORD *)(v28 + 104);
              }
              else {
                long long v29 = 0uLL;
              }
              int v31 = v83;
              uint64_t v30 = v85;
              uint64_t v32 = *(void *)(a1 + 104);
              uint64_t v33 = v86;
              if (v32)
              {
                *(_OWORD *)(v32 + 104) = v29;
                uint64_t v28 = *(void *)(a1 + 56);
              }
              if (v28) {
                uint64_t v34 = *(void *)(v28 + 88);
              }
              else {
                uint64_t v34 = 0;
              }
              uint64_t v35 = *(void *)(a1 + 104);
              if (v35) {
                *(void *)(v35 + 88) = v34;
              }
            }
            else
            {
LABEL_58:
              objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", v83);
              uint64_t v71 = *(void *)(a1 + 104);
              if (v71) {
                *(void *)(v71 + 88) = v70;
              }
              id v72 = *(id *)(a1 + 48);
              uint64_t v73 = -[PKTextInputElementContent selectedRange]((uint64_t)v72);
              uint64_t v75 = *(void *)(a1 + 104);
              uint64_t v33 = v86;
              if (v75)
              {
                *(void *)(v75 + 104) = v73;
                *(void *)(v75 + 112) = v74;
              }

              int v31 = v84;
              uint64_t v30 = v85;
            }
            -[PKTextInputTargetState setInProgressGestureStrokeUUID:](*(void *)(a1 + 104), v91);
            uint64_t v76 = *(void *)(a1 + 104);
            if (v33 == 6) {
              __int16 v77 = v31;
            }
            else {
              __int16 v77 = 0;
            }
            uint64_t v78 = 0x7FFFFFFFFFFFFFFFLL;
            if (v33 == 6) {
              uint64_t v79 = v30;
            }
            else {
              uint64_t v79 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v76)
            {
              if (v33 == 6) {
                uint64_t v80 = 0;
              }
              else {
                uint64_t v80 = v31;
              }
              if (v33 != 6) {
                uint64_t v78 = v30;
              }
              *(void *)(v76 + 120) = v78;
              *(void *)(v76 + 128) = v80;
              uint64_t v81 = *(void *)(a1 + 104);
              if (v81)
              {
                *(void *)(v81 + 136) = v79;
                *(void *)(v81 + 144) = v77;
              }
            }
            if (v33 == 2)
            {
LABEL_78:
              (*((void (**)(void *, uint64_t, void, uint64_t, void, void))v17 + 2))(v17, 1, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
            }
            else
            {
              if (v86 == 6) {
                uint64_t v82 = 1;
              }
              else {
                uint64_t v82 = 2;
              }
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_2;
              v104 = &unk_1E64CA648;
              v106 = v17;
              id v107 = (id)v82;
              uint64_t v108 = v30;
              v109 = v31;
              v105 = (id *)v13;
              [(PKTextInputElementContent *)v105 selectTextInRange:(uint64_t)v31 completion:buf];
            }
            id v4 = v88;
            id v9 = v89;
          }
          else
          {
            *(unsigned char *)(a1 + 8) = 1;
            v42 = v93;
            if (v86 == 6)
            {
              objc_setProperty_nonatomic_copy((id)a1, v21, @"DeleteGesture", 96);
              id v45 = *((id *)v13 + 1);
              [v45 notifyTextInputTextWillChange];

              objc_msgSend(v90, "setReferenceElementContent:referenceRange:feedbackType:", v13, v85, v83, 1);
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_3;
              v104 = &unk_1E64CA670;
              double v46 = (id *)v13;
              v105 = v46;
              v106 = (id *)a1;
              id v107 = v17;
              [(PKTextInputElementContent *)(uint64_t)v46 deleteTextInRange:(uint64_t)v83 completion:buf];

              id v4 = v88;
              id v9 = v89;
              goto LABEL_81;
            }
            objc_setProperty_nonatomic_copy((id)a1, v21, @"SelectGesture", 96);
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_4;
            v104 = &unk_1E64CA698;
            v105 = (id *)a1;
            id v107 = v17;
            uint64_t v108 = v85;
            v109 = v83;
            v106 = (id *)v13;
            [(PKTextInputElementContent *)v106 selectTextInRange:(uint64_t)v83 completion:buf];
            id v47 = *(id *)(a1 + 48);
            double v48 = v47;
            if (v47) {
              v49 = (void *)*((void *)v47 + 1);
            }
            else {
              v49 = 0;
            }
            id v9 = v89;
            double v50 = v49;

            id v4 = v88;
            if (v85 != 0x7FFFFFFFFFFFFFFFLL && v83 && ([v50 showSelectionCommands] & 1) == 0)
            {
              double v51 = -[PKTextInputElement referenceView](v50);
              if (v51)
              {
                double v52 = v51;
                [v51 bounds];
                uint32_t v57 = *(id **)(a1 + 48);
                if (v57)
                {
                  uint64_t v58 = v52;
                  [(PKTextInputElementContent *)v57 firstRectForRange:(unint64_t)v83 inCoordinateSpace:v52];
                  double v60 = v59;
                  double v62 = v61;
                  double v64 = v63;
                  double v66 = v65;
                }
                else
                {
                  double v60 = v53;
                  double v62 = v54;
                  double v64 = v55;
                  double v66 = v56;
                  v68 = os_log_create("com.apple.pencilkit", "PencilTextInput");
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v110 = 134218242;
                    uint64_t v111 = a1;
                    __int16 v112 = 2112;
                    v113 = v50;
                    _os_log_error_impl(&dword_1C44F8000, v68, OS_LOG_TYPE_ERROR, "ResultCommand %p: Failed to load element content, the callout menu might show up in the wrong place. Element: %@", v110, 0x16u);
                  }

                  id v4 = v88;
                  uint64_t v58 = v52;
                }
                v69 = objc_msgSend(MEMORY[0x1E4FB1978], "sharedMenuController", v83);
                objc_msgSend(v69, "showMenuFromView:rect:", v58, v60, v62, v64, v66);

                id v9 = v89;
                double v51 = v58;
              }
            }
          }
          v42 = v93;
LABEL_81:

          id v43 = v99;
LABEL_82:

          goto LABEL_83;
        case 7:
          v92 = v5;
          id v38 = v3;
          id v39 = v9;
          v42 = v93;
          v44 = [v93 inputInProgressStroke];

          if (v44)
          {
            uint64_t v41 = 1;
            goto LABEL_35;
          }
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_3;
          v104 = &unk_1E64CA5A8;
          v105 = (id *)a1;
          v106 = v2;
          -[PKTextInputResultCommand _applyTextReplacementWithCompletion:](a1, buf);

          break;
        default:
          v92 = v5;
          id v38 = v3;
          id v39 = v9;
          uint64_t v41 = 1;
          goto LABEL_34;
      }
    }
    else
    {
      v92 = v5;
      id v38 = v3;
      id v39 = v9;
      BOOL v40 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v115.id location = v36;
        v115.length = v37;
        v67 = NSStringFromRange(v115);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v67;
        _os_log_error_impl(&dword_1C44F8000, v40, OS_LOG_TYPE_ERROR, "ResultCommand %p: Could not process result replacing range %@ because it is out of bounds.", buf, 0x16u);
      }
      uint64_t v41 = 0;
LABEL_34:
      v42 = v93;
LABEL_35:
      -[PKTextInputResultCommand _updateInputTargetStateWithUncommittedPendingText:activePreviewText:committedTextLength:accumulatedCommitLength:]((void *)a1, 0, 0, 0, 0);
      v95((uint64_t)v2, (const char *)v41);
    }
    id v9 = v39;
    id v3 = v38;
    uint64_t v5 = v92;
LABEL_83:
  }
}

- (void)_finishApplyingResultWithSuccess:(int)a3 cancelled:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  char v4 = (char)a2;
  if ((a2 & 1) == 0) {
    [(PKTextInputTargetState *)*(void *)(a1 + 104) clear];
  }
  uint64_t v6 = *(void *)(a1 + 104);
  id v7 = *(id *)(a1 + 32);
  -[PKMathResultAttribution setString:](v6, v7);

  uint64_t v8 = *(void *)(a1 + 104);
  id v9 = *(id *)(a1 + 40);
  -[PKMathResultAttribution setDate:](v8, v9);

  uint64_t v10 = (id *)*(id *)(a1 + 48);
  BOOL v11 = v10;
  if (!v10)
  {
    id v13 = 0;
    goto LABEL_29;
  }
  id v12 = v10[1];
  id v13 = v12;
  if (!v12)
  {
LABEL_29:
    uint64_t v14 = 0;
    goto LABEL_7;
  }
  uint64_t v14 = (void *)*((void *)v12 + 14);
LABEL_7:
  id v16 = v14;
  uint64_t v17 = *(void **)(a1 + 104);
  if (v17) {
    objc_setProperty_nonatomic_copy(v17, v15, v16, 16);
  }

  id v18 = *(id *)(a1 + 40);
  uint64_t v20 = [v18 writingSessionIdentifier];
  __int16 v21 = *(void **)(a1 + 104);
  if (v21) {
    objc_setProperty_nonatomic_copy(v21, v19, v20, 40);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v24 = *(void *)(a1 + 104);
  if (v24)
  {
    *(void *)(v24 + 96) = v23;
    __int16 v25 = *(void **)(a1 + 104);
  }
  else
  {
    __int16 v25 = 0;
  }
  objc_setProperty_nonatomic_copy((id)a1, v22, v25, 72);
  if (v4)
  {
    uint64_t v26 = 5;
  }
  else
  {
    int v27 = -[PKTextInputResultCommand _strokeSliceIDsToRemoveForCommittedTokenColumnCount:forceRemoveAll:](a1, 0, 1);
    -[PKTextInputResultCommand _removeStrokesForSliceIDs:destinationRect:](a1, v27, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));

    if (a3) {
      uint64_t v26 = 7;
    }
    else {
      uint64_t v26 = 6;
    }
  }
  uint64_t v28 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v29 = *(void *)(a1 + 24);
    if (v29 > 7) {
      uint64_t v30 = &stru_1F1FB2C00;
    }
    else {
      uint64_t v30 = off_1E64CA750[v29];
    }
    if ((unint64_t)(v26 - 5) > 2) {
      int v31 = &stru_1F1FB2C00;
    }
    else {
      int v31 = off_1E64CA790[v26 - 5];
    }
    int v32 = 134218498;
    uint64_t v33 = a1;
    __int16 v34 = 2112;
    uint64_t v35 = v30;
    __int16 v36 = 2112;
    NSUInteger v37 = v31;
    _os_log_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_DEFAULT, "ResultCommand %p: finishApplying. state change: %@ -> %@", (uint8_t *)&v32, 0x20u);
  }

  -[PKTextInputResultCommand _setCommandState:](a1, v26);
}

void __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke_51(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    *(unsigned char *)(v1 + 11) = 0;
    -[PKTextInputResultCommand _applyResultCommandPhase2](*(void *)(a1 + 32));
  }
  else
  {
    -[PKTextInputResultCommand _applyResultCommandPhase2](0);
  }
}

void __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
LABEL_6:
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      *(unsigned char *)(v9 + 11) = 1;
      uint64_t v10 = *(void *)(a1 + 40);
    }
    else
    {
      uint64_t v10 = 0;
    }
    -[PKTextInputResultCommand _applyResultCommandPhase2](v10);
    return;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    id v4 = *(id *)(v3 + 48);
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = (void *)*((void *)v4 + 2);
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 0;
LABEL_5:
  id v7 = v6;
  int v8 = [v2 isSupportedForTextInputTraits:v7];

  if (v8) {
    goto LABEL_6;
  }
  uint64_t v11 = *(void *)(a1 + 40);

  -[PKTextInputResultCommand _finishApplyingResultWithSuccess:cancelled:](v11, 0, 1);
}

- (void)cancelDelayedCommand
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 134217984;
      uint64_t v4 = a1;
      _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "ResultCommand %p: Cancel delayed result command", (uint8_t *)&v3, 0xCu);
    }

    -[PKTextInputResultCommand _setCommandState:](a1, 7);
  }
}

void __53__PKTextInputResultCommand__applyResultCommandPhase2__block_invoke(uint64_t a1, const char *a2)
{
}

void __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke(uint64_t a1, char a2, uint64_t a3, unint64_t a4, void *a5, void *a6)
{
  id v39 = a5;
  id v11 = a6;
  uint64_t v12 = *(void *)(a1 + 32);
  if (!v12)
  {
    id v13 = 0;
    goto LABEL_9;
  }
  id v13 = *(id *)(v12 + 112);
  if (!v13)
  {
LABEL_9:
    int v19 = 1;
    goto LABEL_10;
  }
  uint64_t v14 = *(void **)(a1 + 40);
  if (v14) {
    uint64_t v14 = (void *)v14[2];
  }
  v15 = v14;
  id v16 = *(void **)(a1 + 32);
  if (v16) {
    id v16 = (void *)v16[14];
  }
  uint64_t v17 = v16;
  int v18 = [v15 isEqualToNumber:v17];

  int v19 = v18 ^ 1;
LABEL_10:

  uint64_t v20 = [*(id *)(a1 + 48) writingSessionIdentifier];
  uint64_t v21 = a4;
  if (v20)
  {
    uint64_t v22 = (void *)v20;
    uint64_t v23 = *(void **)(a1 + 40);
    if (v23) {
      uint64_t v23 = (void *)v23[5];
    }
    uint64_t v24 = v23;
    __int16 v25 = [*(id *)(a1 + 48) writingSessionIdentifier];
    int v26 = [v24 isEqualToNumber:v25];

    uint64_t v21 = a4;
    if (((v19 | v26 ^ 1) & 1) == 0)
    {
      uint64_t v27 = *(void *)(a1 + 40);
      if (v27) {
        uint64_t v27 = *(void *)(v27 + 64);
      }
      uint64_t v21 = v27 + a4;
    }
  }
  -[PKTextInputResultCommand _updateInputTargetStateWithUncommittedPendingText:activePreviewText:committedTextLength:accumulatedCommitLength:](*(void **)(a1 + 56), v39, v11, a4, v21);
  uint64_t v28 = -[PKTextInputResultCommand _strokeSliceIDsToRemoveForCommittedTokenColumnCount:forceRemoveAll:](*(void *)(a1 + 56), a3, 0);
  if ([v28 count])
  {
    id v38 = v11;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_2;
    v40[3] = &unk_1E64C6B68;
    uint64_t v29 = *(void *)(a1 + 56);
    id v41 = *(id *)(a1 + 64);
    char v42 = a2;
    id v30 = v28;
    int v31 = v40;
    if (v29)
    {
      id v32 = *(id *)(v29 + 48);
      id WeakRetained = objc_loadWeakRetained((id *)(v29 + 16));
      __int16 v34 = [WeakRetained resultCommandCanvasController:v29];

      uint64_t v35 = -[PKTextInputCanvasController canvasCoordinateSpace](v34);
      __int16 v36 = +[PKTextInputSettings sharedSettings];
      int v37 = [v36 useTransformStrokesAnimation];

      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      if (v37)
      {
        v44 = __96__PKTextInputResultCommand__removeCommittedTextInsertionStrokes_committedTextLength_completion___block_invoke;
        id v45 = &unk_1E64CA6E8;
        uint64_t v46 = v29;
        id v47 = v30;
        double v48 = v31;
        -[PKTextInputElementContent requestUpdatedLastSelectionRectForCommittedTextLength:targetCoordinateSpace:completion:]((uint64_t)v32, a4, v35, v43);
      }
      else
      {
        v44 = __96__PKTextInputResultCommand__removeCommittedTextInsertionStrokes_committedTextLength_completion___block_invoke_2;
        id v45 = &unk_1E64CA6E8;
        uint64_t v46 = v29;
        id v47 = v30;
        double v48 = v31;
        -[PKTextInputElementContent requestUpdatedApproximateCaretRectInCoordinateSpace:completion:]((uint64_t)v32, v35, v43);
      }
    }
    id v11 = v38;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_updateInputTargetStateWithUncommittedPendingText:(void *)a3 activePreviewText:(uint64_t)a4 committedTextLength:(uint64_t)a5 accumulatedCommitLength:
{
  if (!a1) {
    return;
  }
  uint64_t v9 = (void *)a1[4];
  id v10 = a3;
  id v11 = a2;
  id v28 = [v9 correctionResult];
  uint64_t v12 = (void *)a1[6];
  if (v12) {
    uint64_t v12 = (void *)v12[1];
  }
  id v13 = v12;
  if (v11)
  {
    uint64_t v14 = (void *)a1[7];
    if (v14) {
      uint64_t v14 = (void *)v14[2];
    }
    v15 = v14;
    if (v13) {
      id v16 = (void *)v13[14];
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
    int v18 = [v15 isEqualToNumber:v17];

    if (v18)
    {
      uint64_t v19 = a1[7];
      if (v19) {
        uint64_t v20 = *(void *)(v19 + 72);
      }
      else {
        uint64_t v20 = 0;
      }
      goto LABEL_18;
    }
  }
  else if ([v28 isCharacterLevel])
  {
    uint64_t v21 = [v28 resultType];
    if (v21 == 6)
    {
      uint64_t v20 = [v28 affectedRange];
      goto LABEL_18;
    }
    if (v21 == 1)
    {
      uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      if ([v28 affectedRange] != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v20 = [v28 affectedRange] + a4;
      }
      goto LABEL_18;
    }
  }
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

  uint64_t v23 = (void *)a1[13];
  if (v23) {
    objc_setProperty_nonatomic_copy(v23, v22, v11, 48);
  }

  __int16 v25 = (void *)a1[13];
  if (v25) {
    objc_setProperty_nonatomic_copy(v25, v24, v10, 56);
  }

  uint64_t v26 = a1[13];
  if (v26)
  {
    *(void *)(v26 + 64) = a5;
    uint64_t v27 = a1[13];
    if (v27) {
      *(void *)(v27 + 72) = v20;
    }
  }
}

- (id)_strokeSliceIDsToRemoveForCommittedTokenColumnCount:(char)a3 forceRemoveAll:
{
  if (a1)
  {
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    int v8 = [v7 inputInProgressStroke];

    uint64_t v9 = [v6 correctionResult];
    unint64_t v10 = [v9 resultType];

    if (a3)
    {
      uint64_t v11 = 0;
      int v12 = 1;
    }
    else
    {
      BOOL v14 = v10 <= 8 && (v10 & 0x1FF) != 1 && v8 == 0;
      int v15 = !v14;
      int v12 = v15 ^ 1;
      if (v14) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = a2;
      }
      if ((v12 & 1) == 0 && v11 < 1)
      {
        id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_30:

        goto LABEL_31;
      }
    }
    id v17 = [v7 strokeProvider];
    int v18 = [v6 strokeIdentifiers];
    uint64_t v19 = v18;
    if (v12)
    {
      id v16 = v18;
      if (!v8)
      {
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v20 = [v6 correctionResult];
      uint64_t v21 = [v20 textResult];
      uint64_t v22 = objc_msgSend(v21, "strokeIndexesForColumnsInRange:", 0, v11);

      if (v22)
      {
        id v16 = [v19 objectsAtIndexes:v22];
      }
      else
      {
        id v16 = (id)MEMORY[0x1E4F1CBF0];
      }

      if (!v8) {
        goto LABEL_29;
      }
    }
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __95__PKTextInputResultCommand__strokeSliceIDsToRemoveForCommittedTokenColumnCount_forceRemoveAll___block_invoke;
    id v30 = &unk_1E64CA6C0;
    id v31 = v17;
    id v32 = v7;
    uint64_t v23 = [v16 indexesOfObjectsPassingTest:&v27];
    unint64_t v24 = objc_msgSend(v23, "count", v27, v28, v29, v30);
    if (v24 < [v16 count])
    {
      uint64_t v25 = [v16 objectsAtIndexes:v23];

      id v16 = (id)v25;
    }

    goto LABEL_29;
  }
  id v16 = 0;
LABEL_31:

  return v16;
}

uint64_t __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_applyTextReplacementWithCompletion:(uint64_t)a1
{
  uint64_t v246 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(id *)(a1 + 48);
  uint64_t v5 = v4;
  if (v4) {
    id v6 = (void *)v4[1];
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  int v8 = *(id *)(a1 + 56);
  v191 = v5;
  v187 = (void (**)(void, void, void, void, void, void))v3;
  v188 = v7;
  if (!v7) {
    goto LABEL_11;
  }
  id v9 = v7[14];
  if (!v9) {
    goto LABEL_11;
  }
  unint64_t v10 = v9;
  uint64_t v11 = v8 ? (void *)v8[2] : 0;
  id v12 = v11;
  id v13 = v7[14];
  char v14 = [v12 isEqualToNumber:v13];

  if (v14)
  {
    if (v8)
    {
      BOOL v218 = *((unsigned char *)v8 + 8) != 0;
      id v15 = *(id *)(a1 + 32);
      char v184 = 0;
      v189 = v8;
      id v16 = (void *)v8[3];
      goto LABEL_13;
    }
  }
  else
  {
LABEL_11:
  }
  id v15 = *(id *)(a1 + 32);
  BOOL v218 = 0;
  v189 = 0;
  id v16 = 0;
  char v184 = 1;
LABEL_13:
  id v17 = v16;
  uint64_t v221 = [v15 correctionResult];
  uint64_t v185 = *(void *)(a1 + 112);
  unint64_t v194 = *(void *)(a1 + 120);
  unint64_t v18 = *(void *)(a1 + 64);
  int v19 = *(unsigned __int8 *)(a1 + 11);
  uint64_t v197 = a1;
  id v20 = *(id *)(a1 + 40);
  uint64_t v21 = [v20 languageSpec];
  uint64_t v214 = -[PKTextInputLanguageSpec uncommittedTokenColumnCount]((uint64_t)v21);
  id v22 = v15;
  id v192 = v17;
  uint64_t v23 = self;
  v195 = v22;
  unint64_t v24 = [v22 correctionResult];
  uint64_t v25 = [v24 textResult];
  uint64_t v26 = [v25 tokenColumnCount];
  uint64_t v27 = [v25 changeableTokenColumnCount];
  if (!v19) {
    goto LABEL_33;
  }
  uint64_t v28 = v27;
  if (!v18 || v26 < 1)
  {
    uint64_t v33 = [v195 correctionResult];
    uint64_t v34 = [v33 resultType];

    if (v34 == 7)
    {
      id v32 = @"SplitJoinGesture";
      uint64_t v29 = (void *)v197;
      uint64_t v209 = v26;
LABEL_35:
      id v30 = v191;
      id v31 = (void *)v221;
      goto LABEL_36;
    }
    if (v26 >= 2)
    {
      uint64_t v35 = [v192 correctionResult];
      __int16 v36 = [v35 textResult];

      uint64_t v37 = 0;
      if (v25 && v36)
      {
        id v38 = +[PKTextInputResultCommand _tokenColumnStringsForTopTranscriptionInTextResult:](v23, v25);
        v207 = v36;
        id v39 = +[PKTextInputResultCommand _tokenColumnStringsForTopTranscriptionInTextResult:](v23, v36);
        BOOL v40 = v38;
        uint64_t v41 = 0;
        if ([v38 count])
        {
          unint64_t v42 = 0;
          uint64_t v210 = v26 + ~v28;
          v211 = v24;
          while (v42 < [v39 count])
          {
            id v43 = v21;
            id v44 = v20;
            id v45 = [v40 objectAtIndexedSubscript:v42];
            uint64_t v46 = v39;
            id v47 = [v39 objectAtIndexedSubscript:v42];
            unsigned int v48 = [v45 isEqualToString:v47];
            if ((uint64_t)v42 <= v210) {
              uint64_t v49 = v48;
            }
            else {
              uint64_t v49 = 0;
            }
            v41 += v49;

            if ((v49 & 1) == 0)
            {
              id v39 = v46;
              id v20 = v44;
              uint64_t v21 = v43;
              unint64_t v24 = v211;
              break;
            }
            ++v42;
            id v39 = v46;
            id v20 = v44;
            uint64_t v21 = v43;
            unint64_t v24 = v211;
            if (v42 >= [v40 count]) {
              break;
            }
          }
        }
        uint64_t v183 = [v40 count];
        if (v41 >= v183 - v214) {
          uint64_t v37 = v183 - v214;
        }
        else {
          uint64_t v37 = v41;
        }

        __int16 v36 = v207;
      }

      id v32 = @"StableWord";
      uint64_t v209 = v37;
      goto LABEL_34;
    }
LABEL_33:
    uint64_t v209 = 0;
    id v32 = &stru_1F1FB2C00;
LABEL_34:
    uint64_t v29 = (void *)v197;
    goto LABEL_35;
  }
  uint64_t v29 = (void *)v197;
  id v30 = v191;
  id v31 = (void *)v221;
  uint64_t v209 = v26;
  if (v18 > 3) {
    id v32 = &stru_1F1FB2C00;
  }
  else {
    id v32 = off_1E64CA7A8[v18 - 1];
  }
LABEL_36:

  double v50 = v32;
  objc_setProperty_nonatomic_copy(v29, v51, v50, 96);
  id v52 = v31;
  double v53 = v30;
  uint64_t v212 = self;
  double v54 = [MEMORY[0x1E4F1CA48] array];
  double v55 = [MEMORY[0x1E4F1CA48] array];
  v193 = v52;
  double v56 = [v52 textResult];
  uint32_t v57 = v56;
  v190 = v53;
  id v203 = v55;
  v186 = v50;
  if (v56)
  {
    uint64_t v58 = [v56 transcriptionPaths];
    v206 = [v58 firstObject];

    if (v30)
    {
      id v30 = 0;
      id v59 = v53[3];
      v208 = 0;
      if (v59 && v59 != (id)3)
      {
        uint64_t v60 = v185;
        if (v185)
        {
          uint64_t v61 = [(PKTextInputElementContent *)(uint64_t)v53 stringInRange:1];
          uint64_t v60 = v185;
          uint64_t v62 = v61;
        }
        else
        {
          uint64_t v62 = 0;
        }
        uint64_t v65 = v194 + v60;
        unint64_t v66 = v194 + v60 + 1;
        v200 = (void *)v62;
        if (v66 <= -[PKTextInputElementContent contentLength]((uint64_t)v53))
        {
          v67 = [(PKTextInputElementContent *)(uint64_t)v53 stringInRange:1];
        }
        else
        {
          v67 = 0;
        }
        v68 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 65532);
        v208 = v67;
        if ([v67 isEqualToString:v68]
          && v65 + 2 <= (unint64_t)-[PKTextInputElementContent contentLength]((uint64_t)v53))
        {
          uint64_t v69 = [(PKTextInputElementContent *)(uint64_t)v53 stringInRange:1];

          v208 = (void *)v69;
        }

        id v30 = v200;
      }
    }
    else
    {
      v208 = 0;
    }
    v201 = v30;
    if ([v57 tokenColumnCount] >= 1)
    {
      v205 = 0;
      int v196 = 0;
      uint64_t v70 = 0;
      uint64_t v71 = v208;
      v198 = v54;
      char v202 = !v218;
      v199 = v57;
      while (1)
      {
        uint64_t v72 = [v206 indexAtPosition:v70];
        uint64_t v73 = [v57 tokenRowsAtColumnIndex:v70];
        v219 = [v73 objectAtIndexedSubscript:v72];
        uint64_t v74 = [v219 firstObject];
        v215 = (void *)v74;
        if (!v74)
        {
          uint64_t v76 = &stru_1F1FB2C00;
          goto LABEL_66;
        }
        uint64_t v75 = [v57 precedingSeparatorForToken:v74];
        uint64_t v76 = v75;
        if (v70) {
          char v77 = 1;
        }
        else {
          char v77 = v202;
        }
        if (v77)
        {
          if (v70) {
            goto LABEL_66;
          }
        }
        else
        {

          uint64_t v76 = @" ";
        }
        if (![v201 length]
          || [(__CFString *)v76 isEqualToString:v201])
        {
          uint64_t v78 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
          uint64_t v79 = [(__CFString *)v76 stringByTrimmingCharactersInSet:v78];
          uint64_t v80 = [v79 length];

          if (v80)
          {

            uint64_t v76 = &stru_1F1FB2C00;
          }
          uint64_t v71 = v208;
        }
LABEL_66:
        v222 = v73;
        if (v70 == [v57 tokenColumnCount] - 1)
        {
          uint64_t v81 = [v57 trailingSeparator];
          goto LABEL_78;
        }
        if (v70 != v209 - 1)
        {
          uint64_t v81 = &stru_1F1FB2C00;
          goto LABEL_78;
        }
        uint64_t v82 = [v57 transcriptionPaths];
        v83 = [v82 firstObject];
        v84 = [v57 tokensInTranscriptionPath:v83 atColumnIndex:v209];

        uint64_t v85 = [v84 firstObject];
        if (!v85)
        {
          uint64_t v81 = &stru_1F1FB2C00;
LABEL_74:
          uint64_t v86 = [(__CFString *)v81 length];
          int v87 = v196;
          if (v86) {
            int v87 = 1;
          }
          int v196 = v87;
          goto LABEL_77;
        }
        uint64_t v81 = [v57 precedingSeparatorForToken:v85];
        if (v81) {
          goto LABEL_74;
        }
LABEL_77:
        uint64_t v71 = v208;

LABEL_78:
        if (![v71 length]
          || ([(__CFString *)v81 isEqualToString:v71] & 1) != 0
          || ([MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet],
              uint64_t v97 = objc_claimAutoreleasedReturnValue(),
              char v98 = objc_msgSend(v97, "characterIsMember:", objc_msgSend(v71, "characterAtIndex:", 0)),
              v97,
              (v98 & 1) != 0)
          || !v81)
        {

          uint64_t v81 = &stru_1F1FB2C00;
        }
        id v88 = +[PKTextInputResultCommand _transcriptionForTokensAtColumn:row:textResult:](v212, v70, v72, v57);
        if (v70 >= v209)
        {
          v96 = v205;
          if (!v205)
          {
            v96 = [MEMORY[0x1E4F28E78] string];
          }
          v205 = v96;
          [v96 appendFormat:@"%@%@%@", v76, v88, v81];
        }
        else
        {
          if ([(__CFString *)v76 length])
          {
            [v54 addObject:v76];
            [v55 addObject:MEMORY[0x1E4F1CBF0]];
          }
          v204 = v76;
          id v89 = v57;
          id v90 = v88;
          uint64_t v91 = self;
          v92 = [v89 tokenRowsAtColumnIndex:v70];
          id v93 = [MEMORY[0x1E4F1CA48] array];
          if ([v92 count])
          {
            unint64_t v94 = 0;
            do
            {
              v95 = +[PKTextInputResultCommand _transcriptionForTokensAtColumn:row:textResult:](v91, v70, v94, v89);
              if (([v95 isEqualToString:v90] & 1) == 0) {
                [v93 addObject:v95];
              }

              ++v94;
            }
            while (v94 < [v92 count]);
          }

          double v54 = v198;
          [v198 addObject:v90];
          double v55 = v203;
          [v203 addObject:v93];
          if ([(__CFString *)v81 length])
          {
            [v198 addObject:v81];
            [v203 addObject:MEMORY[0x1E4F1CBF0]];
          }

          uint32_t v57 = v199;
          uint64_t v71 = v208;
          uint64_t v76 = v204;
        }

        if (++v70 >= [v57 tokenColumnCount]) {
          goto LABEL_101;
        }
      }
    }
    LOBYTE(v196) = 0;
    v205 = 0;
    uint64_t v71 = v208;
LABEL_101:

    char v63 = v196 & 1;
    double v53 = v190;
    double v64 = v205;
  }
  else
  {
    char v63 = 0;
    double v64 = 0;
  }
  id v99 = v54;
  id v100 = v203;
  id v101 = v64;

  id v102 = v99;
  id v220 = v100;
  id v103 = v101;
  v104 = +[PKTextInputSettings sharedSettings];
  LODWORD(v100) = [v104 activePreviewEnabled];

  if (!v100)
  {
    v223 = 0;
    goto LABEL_117;
  }
  id v105 = v103;
  v106 = *(void **)(v197 + 48);
  char v216 = v63;
  if (v106) {
    v106 = (void *)v106[1];
  }
  id v107 = v106;
  id v213 = *(id *)(v197 + 32);
  uint64_t v108 = [*(id *)(v197 + 40) strokeProvider];
  id WeakRetained = objc_loadWeakRetained((id *)(v197 + 16));
  v110 = [WeakRetained resultCommandCanvasController:v197];

  uint64_t v111 = -[PKTextInputCanvasController canvasCoordinateSpace](v110);
  id v112 = v105;
  v113 = v112;
  if (!*(unsigned char *)(v197 + 11)
    || v194
    || (uint64_t v114 = *(void *)(v197 + 48)) == 0
    || (uint64_t v115 = *(void *)(v114 + 24), v115 == 3)
    || (v116 = v112, !v115))
  {

    v116 = 0;
  }
  if ((unint64_t)[v116 length] < 3)
  {
    uint64_t v117 = v209;
LABEL_113:
    v223 = 0;
    goto LABEL_114;
  }
  v223 = v116;
  uint64_t v117 = v209;
  if (!v108) {
    goto LABEL_115;
  }
  if (!v111) {
    goto LABEL_115;
  }
  v134 = -[PKTextInputElement coordinateSpace]((uint64_t)v107);

  if (!v134) {
    goto LABEL_115;
  }
  v116 = [v213 strokeIdentifiers];
  [v108 boundsForSliceIdentifiers:v116];
  CGFloat v136 = v135;
  CGFloat v138 = v137;
  CGFloat v140 = v139;
  CGFloat v142 = v141;
  v247.origin.double x = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:](*(void *)(v197 + 48), v185, v111);
  double x = v247.origin.x;
  CGFloat y = v247.origin.y;
  double width = v247.size.width;
  CGFloat height = v247.size.height;
  if (!CGRectIsNull(v247))
  {
    double v148 = width + 50.0 >= 100.0 ? width + 50.0 : 100.0;
    v248.origin.double x = v136;
    v248.origin.CGFloat y = v138;
    v248.size.double width = v140;
    v248.size.CGFloat height = v142;
    CGFloat v149 = y;
    CGFloat v150 = height;
    double v147 = x + -50.0;
    if (CGRectIntersectsRect(v248, *(CGRect *)(&v148 - 2)))
    {

      goto LABEL_113;
    }
  }
LABEL_114:
  uint64_t v209 = v117;

LABEL_115:
  char v63 = v216;
LABEL_117:
  id v118 = *(id *)(v197 + 40);
  id v119 = v195;
  self;
  v120 = [v119 correctionResult];
  v121 = [v118 strokeProvider];
  v122 = [v119 strokeIdentifiers];

  v123 = [v118 inputInProgressStroke];

  BOOL v124 = 0;
  if (v123 || v194 < 2)
  {
LABEL_144:

    int v153 = 0;
    if (v191) {
      int v151 = 1;
    }
    else {
      int v151 = v124;
    }
    if (!v191)
    {
      v152 = v190;
LABEL_161:
      if (!v103) {
        goto LABEL_164;
      }
      goto LABEL_162;
    }
    v152 = v190;
    if (v124) {
      goto LABEL_161;
    }
    goto LABEL_149;
  }
  if ([v122 count] != 1)
  {
    v123 = 0;
    BOOL v124 = 0;
    goto LABEL_144;
  }
  v125 = [v120 textResult];
  uint64_t v126 = [v125 tokenColumnCount];

  if (v126 == 1)
  {
    v127 = [v120 textResult];
    v123 = [v127 topTranscription];

    if ([v123 length])
    {
      char v217 = v63;
      [v123 rangeOfComposedCharacterSequenceAtIndex:0];
      uint64_t v129 = v128;
      uint64_t v130 = [v123 length];
      [v121 boundsForSliceIdentifiers:v122];
      BOOL v124 = 0;
      if (v129 == v130)
      {
        double v133 = v131 >= v132 ? v131 : v132;
        if (v133 <= 20.0) {
          BOOL v124 = 1;
        }
      }
      char v63 = v217;
    }
    else
    {
      BOOL v124 = 1;
    }
    goto LABEL_144;
  }

  v152 = v190;
  int v151 = (int)v191;
  if (!v191)
  {
    int v153 = 0;
    if (!v103) {
      goto LABEL_164;
    }
LABEL_162:
    *(unsigned char *)(v197 + 9) = 1;
    goto LABEL_169;
  }
LABEL_149:
  int v151 = 0;
  id v154 = v152[3];
  if (!v154)
  {
    int v153 = 0;
    if (!v103) {
      goto LABEL_164;
    }
    goto LABEL_162;
  }
  int v153 = 0;
  if (v154 == (id)3) {
    goto LABEL_161;
  }
  if ((unint64_t)[v102 count] > 1
    || ([v102 firstObject],
        v155 = objc_claimAutoreleasedReturnValue(),
        uint64_t v156 = [v155 length],
        v155,
        v156)
    || [v193 resultType] == 7)
  {
    if (v184) {
      v157 = 0;
    }
    else {
      v157 = (void *)v189[7];
    }
    id v158 = v157;
LABEL_157:
    int v153 = 1;
    goto LABEL_158;
  }
  uint64_t v178 = *(void *)(v197 + 64);
  if (v184) {
    v179 = 0;
  }
  else {
    v179 = (void *)v189[7];
  }
  id v180 = v179;
  id v158 = v180;
  if (v178) {
    goto LABEL_157;
  }
  if ([v180 length] || objc_msgSend(v223, "length"))
  {
    id v158 = v158;
    id v181 = v223;
    v182 = v181;
    if (v158 == v181)
    {
      int v153 = 0;
    }
    else
    {
      int v153 = 1;
      if (v181 && v158) {
        int v153 = [v158 isEqualToString:v181] ^ 1;
      }
    }
  }
  else
  {
    int v153 = 0;
  }
LABEL_158:

  int v151 = 0;
  if (v103) {
    goto LABEL_162;
  }
LABEL_164:
  if (v194) {
    char v159 = v153;
  }
  else {
    char v159 = 1;
  }
  if ((v159 & 1) == 0 && !*(void *)(v197 + 64)) {
    goto LABEL_162;
  }
LABEL_169:
  if (v153)
  {
    v160 = v188;
    [v188 notifyTextInputTextWillChange];
    v229[0] = MEMORY[0x1E4F143A8];
    v229[1] = 3221225472;
    v229[2] = __64__PKTextInputResultCommand__applyTextReplacementWithCompletion___block_invoke;
    v229[3] = &unk_1E64CA5D0;
    v230 = v188;
    id v231 = v102;
    uint64_t v232 = v197;
    uint64_t v236 = v209;
    char v237 = v63;
    v235 = v187;
    id v233 = v103;
    v161 = v223;
    id v234 = v223;
    v162 = v220;
    [(PKTextInputElementContent *)v152 insertTextsToCommit:v220 withAlternatives:v234 activePreviewText:v185 replacingRange:v194 completion:v229];
  }
  else
  {
    if (v151)
    {
      uint64_t v163 = *(void *)(v197 + 64);
      v161 = v223;
      if (v163)
      {
        v164 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
        {
          v165 = NSStringFromRange(*(NSRange *)(v197 + 112));
          uint64_t v166 = *(void *)(v197 + 40);
          *(_DWORD *)buf = 134218754;
          uint64_t v239 = v197;
          v161 = v223;
          __int16 v240 = 2112;
          v241 = v165;
          __int16 v242 = 2112;
          v243 = v188;
          __int16 v244 = 2048;
          uint64_t v245 = v166;
          v152 = v190;
          _os_log_impl(&dword_1C44F8000, v164, OS_LOG_TYPE_DEFAULT, "ResultCommand %p: ignoring final commit of text insertion as accidental replacement, affectedRange: %@, element: %@, shot: %p", buf, 0x2Au);
        }
      }
      ((void (**)(void, BOOL, void, void, void, void))v187)[2](v187, v163 == 0, 0, 0, 0, 0);
    }
    else
    {
      v167 = [*(id *)(v197 + 40) inputInProgressStroke];
      v168 = [v167 _strokeUUID];

      uint64_t v169 = *(void *)(v197 + 56);
      if (!v169) {
        goto LABEL_204;
      }
      id v170 = *(id *)(v169 + 80);
      if (!v170) {
        goto LABEL_204;
      }
      v171 = v170;
      v172 = *(void **)(v197 + 56);
      if (v172) {
        v172 = (void *)v172[10];
      }
      v173 = v172;
      int v174 = [v168 isEqual:v173];

      if (v174)
      {
        uint64_t v175 = [v193 affectedRange];
        uint64_t v177 = v176;
        v224[0] = MEMORY[0x1E4F143A8];
        v224[1] = 3221225472;
        v224[2] = __64__PKTextInputResultCommand__applyTextReplacementWithCompletion___block_invoke_58;
        v224[3] = &unk_1E64CA5F8;
        v227 = v187;
        uint64_t v228 = v209;
        id v225 = v103;
        v161 = v223;
        id v226 = v223;
        v152 = v190;
        [(PKTextInputElementContent *)v190 selectTextInRange:v177 completion:v224];
      }
      else
      {
LABEL_204:
        v161 = v223;
        ((void (**)(void, uint64_t, uint64_t, void, id, void *))v187)[2](v187, 1, v209, 0, v103, v223);
        v152 = v190;
      }
    }
    v160 = v188;
    v162 = v220;
  }
}

void __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = a6;
  id v11 = a5;
  -[PKTextInputResultCommand _strokeSliceIDsToRemoveForCommittedTokenColumnCount:forceRemoveAll:](v9, 0, 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputResultCommand _removeStrokesForSliceIDs:destinationRect:](*(void *)(a1 + 32), v12, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
  -[PKTextInputResultCommand _updateInputTargetStateWithUncommittedPendingText:activePreviewText:committedTextLength:accumulatedCommitLength:](*(void **)(a1 + 32), v11, v10, a4, a4);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_removeStrokesForSliceIDs:(CGFloat)a3 destinationRect:(CGFloat)a4
{
  if (a1)
  {
    id v24 = *(id *)(a1 + 40);
    id v12 = a2;
    id v13 = [v24 strokeProvider];
    char v14 = [v13 strokesForSliceIdentifiers:v12];

    if ([v14 count])
    {
      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      v26.origin.double x = a3;
      v26.origin.CGFloat y = a4;
      v26.size.double width = a5;
      v26.size.CGFloat height = a6;
      BOOL IsNull = CGRectIsNull(v26);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      unint64_t v18 = [WeakRetained resultCommandCanvasController:a1];

      if (IsNull || IsReduceMotionEnabled)
      {
        id v20 = [v14 allObjects];
        -[PKTextInputCanvasController removeStrokes:animationDuration:]((uint64_t)v18, v20, 0.1);
      }
      else
      {
        if (*(unsigned char *)(a1 + 10))
        {
          uint64_t v19 = 1;
        }
        else
        {
          uint64_t v21 = +[PKTextInputSettings sharedSettings];
          uint64_t v19 = [v21 useTransformStrokesAnimation] ^ 1;
        }
        id v22 = [*(id *)(a1 + 40) languageSpec];
        double v23 = -[PKTextInputLanguageSpec strokeFadeOutDuration]((uint64_t)v22);

        id v20 = [v14 allObjects];
        -[PKTextInputCanvasController animateAndRemoveStrokes:destinationFrame:animationDuration:useImpreciseAnimation:]((uint64_t)v18, v20, v19, a3, a4, a5, a6, v23);
      }
    }
  }
}

void __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_4(uint64_t a1)
{
  -[PKTextInputResultCommand _strokeSliceIDsToRemoveForCommittedTokenColumnCount:forceRemoveAll:](*(void *)(a1 + 32), 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputResultCommand _removeStrokesForSliceIDs:destinationRect:](*(void *)(a1 + 32), v2, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
  -[PKTextInputResultCommand _updateInputTargetStateWithUncommittedPendingText:activePreviewText:committedTextLength:accumulatedCommitLength:](*(void **)(a1 + 32), 0, 0, 0, 0);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __64__PKTextInputResultCommand__applyTextReplacementWithCompletion___block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) notifyTextInputTextDidChange];
  if (a2)
  {
    uint64_t v5 = [*(id *)(a1 + 40) componentsJoinedByString:&stru_1F1FB2C00];
    id v6 = *(void **)(a1 + 48);
    if (v6)
    {
      objc_setProperty_nonatomic_copy(v6, v4, v5, 80);
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7) {
        *(void *)(v7 + 88) = *(void *)(a1 + 80);
      }
    }
    if ([v5 length])
    {
      uint64_t v8 = *(void *)(a1 + 48);
      if (v8)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v8 + 16));
        uint64_t v10 = *(void *)(a1 + 48);
      }
      else
      {
        uint64_t v10 = 0;
        id WeakRetained = 0;
      }
      id v11 = [WeakRetained resultCommandCursorController:v10];
      [v11 makeCursorTemporarilyStrongWhileWriting];

      [*(id *)(a1 + 32) didInsertText];
    }
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12)
  {
    *(unsigned char *)(v12 + 8) = 1;
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13)
    {
      uint64_t v14 = *(void *)(v13 + 104);
      if (v14) {
        *(unsigned char *)(v14 + 8) = *(unsigned char *)(a1 + 88);
      }
    }
  }
  id v15 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);

  return v15();
}

uint64_t __64__PKTextInputResultCommand__applyTextReplacementWithCompletion___block_invoke_58(void *a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, void, void))(a1[6] + 16))(a1[6], 1, a1[7], 0, a1[4], a1[5]);
}

uint64_t __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_msgSend(*(id *)(a1 + 32), "setReferenceElementContent:referenceRange:feedbackType:", a6, a4, a5, a3);
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

uint64_t __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_2(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, void, void))(a1[5] + 16))(a1[5], a2, a1[6], a1[7], a1[8], a1[4]);
}

uint64_t __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_3(void *a1, int a2)
{
  uint64_t v4 = (void *)a1[4];
  if (v4) {
    uint64_t v4 = (void *)v4[1];
  }
  uint64_t v5 = v4;
  [v5 notifyTextInputTextDidChange];

  if (a2)
  {
    id v6 = +[PKTextInputSettings sharedSettings];
    int v7 = [v6 scratchOutMakesTheCursorStrong];

    if (v7)
    {
      uint64_t v8 = a1[5];
      if (v8)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v8 + 16));
        uint64_t v10 = a1[5];
      }
      else
      {
        uint64_t v10 = 0;
        id WeakRetained = 0;
      }
      id v11 = [WeakRetained resultCommandCursorController:v10];
      [v11 makeCursorStrong];
    }
  }
  uint64_t v12 = *(uint64_t (**)(void))(a1[6] + 16);

  return v12();
}

uint64_t __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
    id WeakRetained = 0;
  }
  uint64_t v5 = [WeakRetained resultCommandCursorController:v4];
  [v5 makeCursorStrong];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v6();
}

uint64_t __95__PKTextInputResultCommand__strokeSliceIDsToRemoveForCommittedTokenColumnCount_forceRemoveAll___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v12[0] = v3;
  uint64_t v5 = 1;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  int v7 = [v4 strokesForSliceIdentifiers:v6];
  uint64_t v8 = [v7 anyObject];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) inputInProgressStroke];
    int v10 = [v9 isEqual:v8];

    uint64_t v5 = v10 ^ 1u;
  }

  return v5;
}

uint64_t __96__PKTextInputResultCommand__removeCommittedTextInsertionStrokes_committedTextLength_completion___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  -[PKTextInputResultCommand _removeStrokesForSliceIDs:destinationRect:](*(void *)(a1 + 32), *(void **)(a1 + 40), a2, a3, a4, a5);
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v6();
}

uint64_t __96__PKTextInputResultCommand__removeCommittedTextInsertionStrokes_committedTextLength_completion___block_invoke_2(uint64_t a1, double a2, CGFloat y, CGFloat width, CGFloat height)
{
  double x = a2;
  if (!CGRectIsNull(*(CGRect *)&a2))
  {
    v13.origin.double x = x;
    v13.origin.CGFloat y = y;
    v13.size.double width = width;
    v13.size.CGFloat height = height;
    CGRect v14 = CGRectInset(v13, -10.0, 0.0);
    double x = v14.origin.x;
    CGFloat y = v14.origin.y;
    double width = v14.size.width;
    CGFloat height = v14.size.height;
  }
  -[PKTextInputResultCommand _removeStrokesForSliceIDs:destinationRect:](*(void *)(a1 + 32), *(void **)(a1 + 40), x, y, width, height);
  int v10 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v10();
}

void __59__PKTextInputResultCommand__scheduleBecomeReadyAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[3] == 1)
  {
    uint64_t v2 = WeakRetained;
    -[PKTextInputResultCommand _setCommandState:]((uint64_t)WeakRetained, 2);
    id WeakRetained = v2;
  }
}

+ (id)_tokenColumnStringsForTopTranscriptionInTextResult:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 tokenColumnCount];
  uint64_t v4 = [v2 transcriptionPaths];
  uint64_t v5 = [v4 firstObject];

  id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2 * v3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __79__PKTextInputResultCommand__tokenColumnStringsForTopTranscriptionInTextResult___block_invoke;
  v12[3] = &unk_1E64CA710;
  id v7 = v6;
  id v13 = v7;
  id v14 = v2;
  id v8 = v2;
  objc_msgSend(v8, "enumerateTokensInTranscriptionPath:columnRange:tokenProcessingBlock:", v5, 0, v3, v12);
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

+ (id)_transcriptionForTokensAtColumn:(uint64_t)a3 row:(void *)a4 textResult:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  self;
  uint64_t v21 = [v6 tokenRowsAtColumnIndex:a2];
  id v7 = [v21 objectAtIndexedSubscript:a3];
  id v8 = [MEMORY[0x1E4F28E78] string];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (v11 + i < 1)
        {
          id v15 = &stru_1F1FB2C00;
        }
        else
        {
          id v15 = [v6 precedingSeparatorForToken:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        uint64_t v16 = [v14 string];
        id v17 = (void *)v16;
        if (v16) {
          unint64_t v18 = (__CFString *)v16;
        }
        else {
          unint64_t v18 = &stru_1F1FB2C00;
        }
        uint64_t v19 = v18;

        [v8 appendFormat:@"%@%@", v15, v19];
      }
      v11 += v10;
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  return v8;
}

void __79__PKTextInputResultCommand__tokenColumnStringsForTopTranscriptionInTextResult___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v15 = a2;
  uint64_t v6 = *(void *)(a4 + 16);
  if (v6 < 1)
  {
    id v7 = &stru_1F1FB2C00;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) lastObject];
  }
  id v8 = [*(id *)(a1 + 40) precedingSeparatorForToken:v15];
  uint64_t v9 = [v15 string];
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = &stru_1F1FB2C00;
  }
  uint64_t v12 = v11;

  id v13 = [NSString stringWithFormat:@"%@%@%@", v7, v8, v12];
  id v14 = *(void **)(a1 + 32);
  if (v6 < 1) {
    [v14 addObject:v13];
  }
  else {
    objc_msgSend(v14, "replaceObjectAtIndex:withObject:", objc_msgSend(v14, "count") - 1, v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__inProgressInputTargetState, 0);
  objc_storeStrong((id *)&self->_commitReason, 0);
  objc_storeStrong((id *)&self->_committedText, 0);
  objc_storeStrong((id *)&self->_finalInputTargetState, 0);
  objc_storeStrong((id *)&self->_initialInputTargetState, 0);
  objc_storeStrong((id *)&self->_targetElementContent, 0);
  objc_storeStrong((id *)&self->_handwritingShot, 0);
  objc_storeStrong((id *)&self->_queryItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end