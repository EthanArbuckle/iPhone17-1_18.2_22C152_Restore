@interface WKContentView(WKInteraction)
- (IPC::Encoder)appHighlightMenu;
- (WebKit::WebPageProxy)lookupForWebView:()WKInteraction;
- (uint64_t)_accessibilityRetrieveRectsAtSelectionOffset:()WKInteraction withText:completionHandler:;
- (uint64_t)_accessibilityRetrieveRectsEnclosingSelectionOffset:()WKInteraction withGranularity:;
- (uint64_t)_becomeFirstResponderWithSelectionMovingForward:()WKInteraction completionHandler:;
- (uint64_t)_completeImageAnalysisRequestForContextMenu:()WKInteraction requestIdentifier:hasTextResults:;
- (uint64_t)_elementDidFocus:()WKInteraction userIsInteracting:blurPreviousNode:activityStateChanges:userObject:;
- (uint64_t)_executeEditCommand:()WKInteraction notifyDelegate:;
- (uint64_t)_focusTextInputContext:()WKInteraction placeCaretAt:completionHandler:;
- (uint64_t)_handleDropByInsertingImagePlaceholders:()WKInteraction session:;
- (uint64_t)_insertDynamicImageAnalysisContextMenuItemsIfPossible;
- (uint64_t)_internalAdjustSelectionWithOffset:()WKInteraction lengthDelta:completionHandler:;
- (uint64_t)_internalRequestTextRectsForString:()WKInteraction completion:;
- (uint64_t)_internalSelectTextForContextMenuWithLocationInView:()WKInteraction completionHandler:;
- (uint64_t)_isInterruptingDecelerationForScrollViewOrAncestor:()WKInteraction;
- (uint64_t)_isPanningScrollViewOrAncestor:()WKInteraction;
- (uint64_t)_keyboardDidShow;
- (uint64_t)_keyboardDismissalGestureRecognized:()WKInteraction;
- (uint64_t)_prepareToDragPromisedAttachment:()WKInteraction;
- (uint64_t)_requestTextInputContextsInRect:()WKInteraction completionHandler:;
- (uint64_t)_selectPositionAtPoint:()WKInteraction stayingWithinFocusedElement:completionHandler:;
- (uint64_t)accessibilityRetrieveSpeakSelectionContent;
- (uint64_t)accessoryView:()WKInteraction tabInDirection:;
- (uint64_t)applyAutocorrection:()WKInteraction toString:isCandidate:withCompletionHandler:;
- (uint64_t)becomeFirstResponderForWebView;
- (uint64_t)beginSelectionInDirection:()WKInteraction completionHandler:;
- (uint64_t)callCompletionHandlerForAnimationID:()WKInteraction completionHandler:;
- (uint64_t)changeSelectionWithGestureAt:()WKInteraction withGesture:withState:withFlags:;
- (uint64_t)changeSelectionWithTouchAt:()WKInteraction withSelectionTouch:baseIsStart:withFlags:;
- (uint64_t)changeSelectionWithTouchesFrom:()WKInteraction to:withGesture:withState:;
- (uint64_t)doAfterComputingImageAnalysisResultsForBackgroundRemoval:()WKInteraction;
- (uint64_t)dragInteraction:()WKInteraction item:willAnimateCancelWithAnimator:;
- (uint64_t)imageAnalysisGestureDidBegin:()WKInteraction;
- (uint64_t)insertTextPlaceholderWithSize:()WKInteraction completionHandler:;
- (uint64_t)lookupForWebView:()WKInteraction;
- (uint64_t)menuWithInlineAction:image:identifier:handler:;
- (uint64_t)moveByOffset:()WKInteraction;
- (uint64_t)moveSelectionAtBoundary:()WKInteraction inDirection:completionHandler:;
- (uint64_t)pasteWithCompletionHandler:()WKInteraction;
- (uint64_t)performTextSearchWithQueryString:()WKInteraction usingOptions:resultAggregator:;
- (uint64_t)removeBackgroundMenu;
- (uint64_t)removeEmojiAlternatives;
- (uint64_t)replaceText:()WKInteraction withText:options:completionHandler:;
- (uint64_t)requestAutocorrectionContextWithCompletionHandler:()WKInteraction;
- (uint64_t)requestAutocorrectionRectsForString:()WKInteraction withCompletionHandler:;
- (uint64_t)requestDocumentContext:()WKInteraction completionHandler:;
- (uint64_t)requestPreferredArrowDirectionForEditMenuWithCompletionHandler:()WKInteraction;
- (uint64_t)requestRVItemInSelectedRangeWithCompletionHandler:()WKInteraction;
- (uint64_t)requestRectForFoundTextRange:()WKInteraction completionHandler:;
- (uint64_t)requestTextContextForAutocorrectionWithCompletionHandler:()WKInteraction;
- (uint64_t)requestTextRecognition:imageData:sourceLanguageIdentifier:targetLanguageIdentifier:completionHandler:;
- (uint64_t)requestTextRectsForString:()WKInteraction withCompletionHandler:;
- (uint64_t)resignFirstResponderForWebView;
- (uint64_t)scrollToTextFragmentGenerationMenu;
- (uint64_t)selectPositionAtBoundary:()WKInteraction inDirection:fromPoint:completionHandler:;
- (uint64_t)selectTextWithGranularity:()WKInteraction atPoint:completionHandler:;
- (uint64_t)selectWordForReplacement;
- (uint64_t)shareForWebView:()WKInteraction;
- (uint64_t)targetedPreviewForID:()WKInteraction completionHandler:;
- (uint64_t)translateForWebView:()WKInteraction;
- (uint64_t)updateCurrentFocusedElementInformation:()WKInteraction;
- (uint64_t)updateSelectionWithExtentPoint:()WKInteraction withBoundary:completionHandler:;
- (uint64_t)updateUnderlyingTextVisibilityForTextAnimationID:()WKInteraction visible:completionHandler:;
- (uint64_t)willFinishIgnoringCalloutBarFadeAfterPerformingAction;
- (void)_accessibilityRetrieveRectsEnclosingSelectionOffset:()WKInteraction withGranularity:;
- (void)_completeImageAnalysisRequestForContextMenu:()WKInteraction requestIdentifier:hasTextResults:;
- (void)_executeEditCommand:()WKInteraction notifyDelegate:;
- (void)_focusTextInputContext:()WKInteraction placeCaretAt:completionHandler:;
- (void)_handleDropByInsertingImagePlaceholders:()WKInteraction session:;
- (void)_internalRequestTextRectsForString:()WKInteraction completion:;
- (void)_internalSelectTextForContextMenuWithLocationInView:()WKInteraction completionHandler:;
- (void)_keyboardDidShow;
- (void)_keyboardDismissalGestureRecognized:()WKInteraction;
- (void)_requestTextInputContextsInRect:()WKInteraction completionHandler:;
- (void)accessibilityRetrieveSpeakSelectionContent;
- (void)accessoryView:()WKInteraction tabInDirection:;
- (void)becomeFirstResponderForWebView;
- (void)beginTextRecognitionForFullscreenVideo:playerViewController:;
- (void)callCompletionHandlerForAnimationID:()WKInteraction completionHandler:;
- (void)changeSelectionWithGestureAt:()WKInteraction withGesture:withState:withFlags:;
- (void)changeSelectionWithTouchAt:()WKInteraction withSelectionTouch:baseIsStart:withFlags:;
- (void)changeSelectionWithTouchesFrom:()WKInteraction to:withGesture:withState:;
- (void)doAfterComputingImageAnalysisResultsForBackgroundRemoval:()WKInteraction;
- (void)dragInteraction:()WKInteraction item:willAnimateCancelWithAnimator:;
- (void)imageAnalysisGestureDidBegin:()WKInteraction;
- (void)insertTextPlaceholderWithSize:()WKInteraction completionHandler:;
- (void)lookupForWebView:()WKInteraction;
- (void)menuWithInlineAction:image:identifier:handler:;
- (void)moveByOffset:()WKInteraction;
- (void)performTextSearchWithQueryString:()WKInteraction usingOptions:resultAggregator:;
- (void)removeEmojiAlternatives;
- (void)replaceText:()WKInteraction withText:options:completionHandler:;
- (void)requestPreferredArrowDirectionForEditMenuWithCompletionHandler:()WKInteraction;
- (void)requestRVItemInSelectedRangeWithCompletionHandler:()WKInteraction;
- (void)requestTextRectsForString:()WKInteraction withCompletionHandler:;
- (void)resignFirstResponderForWebView;
- (void)selectWordForReplacement;
- (void)shareForWebView:()WKInteraction;
- (void)targetedPreviewForID:()WKInteraction completionHandler:;
- (void)translateForWebView:()WKInteraction;
- (void)willFinishIgnoringCalloutBarFadeAfterPerformingAction;
@end

@implementation WKContentView(WKInteraction)

- (uint64_t)_elementDidFocus:()WKInteraction userIsInteracting:blurPreviousNode:activityStateChanges:userObject:
{
  if (*((unsigned char *)a1 + 8))
  {
    uint64_t v2 = **a1;
    uint64_t v6 = *(void *)(v2 + 3072);
    uint64_t v3 = v6;
    *(void *)(v2 + 3072) = 0;
    if (v3)
    {
      WTF::CompletionHandler<void ()(void)>::operator()(&v6);
      uint64_t v4 = v6;
      uint64_t v6 = 0;
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
      }
    }
  }
  return a1;
}

- (uint64_t)_prepareToDragPromisedAttachment:()WKInteraction
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = **(void **)(a1 + 8);
    WTF::String::utf8();
    uint64_t v6 = [**(id **)(a1 + 24) path];
    v7 = (char *)v12 + 16;
    *(_DWORD *)buf = 134218498;
    if (!v12) {
      v7 = 0;
    }
    *(void *)&buf[4] = v5;
    __int16 v14 = 2080;
    v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Drag session: %p delivering promised attachment: %s at path: %@", buf, 0x20u);
    if (v12)
    {
      if (*(_DWORD *)v12 == 1) {
        WTF::fastFree(v12, v8);
      }
      else {
        --*(_DWORD *)v12;
      }
    }
  }
  *(void *)buf = 0;
  int v9 = [a2 writeToURL:**(void **)(a1 + 24) options:0 originalContentsURL:0 error:buf];
  uint64_t v10 = **(void **)(a1 + 32);
  if (v9) {
    return (*(uint64_t (**)(uint64_t, void, void))(v10 + 16))(v10, **(void **)(a1 + 24), 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void))(v10 + 16))(v10, 0, *(void *)buf);
  }
}

- (void)dragInteraction:()WKInteraction item:willAnimateCancelWithAnimator:
{
  *a1 = &unk_1EEA0E690;
  uint64_t v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)dragInteraction:()WKInteraction item:willAnimateCancelWithAnimator:
{
  uint64_t result = [*(id *)(a1 + 8) removeFromSuperview];
  *(unsigned char *)(*(void *)(a1 + 16) + 3552) = 0;
  return result;
}

- (uint64_t)menuWithInlineAction:image:identifier:handler:
{
  objc_destroyWeak((id *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v3();
  }
  return result;
}

- (void)menuWithInlineAction:image:identifier:handler:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    (*(void (**)(void, id))(**(void **)(a1 + 32) + 16))(*(void *)(a1 + 32), WeakRetained);
    CFRelease(v3);
  }
}

- (uint64_t)requestTextRecognition:imageData:sourceLanguageIdentifier:targetLanguageIdentifier:completionHandler:
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  WebKit::makeTextRecognitionResult(a2, (uint64_t)v8);
  WTF::CompletionHandler<void ()(WebCore::TextRecognitionResult &&)>::operator()(v2);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  WTF::Vector<WebCore::TextRecognitionBlockData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v10, v3);
  WTF::Vector<WebCore::TextRecognitionDataDetector,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v9, v5);
  return WTF::Vector<WebCore::TextRecognitionLineData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v8, v6);
}

- (uint64_t)imageAnalysisGestureDidBegin:()WKInteraction
{
  *(void *)a1 = &unk_1EEA0E7E0;
  uint64_t v2 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = 0;
  if (v2) {
    WTF::RefCounted<WebKit::ImageAnalysisGestureDeferralToken>::deref(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (v3) {
    CFRelease(v3);
  }
  objc_destroyWeak((id *)(a1 + 16));
  return a1;
}

{
  uint64_t v2;
  const void *v3;
  void *v4;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0E7E0;
  uint64_t v2 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = 0;
  if (v2) {
    WTF::RefCounted<WebKit::ImageAnalysisGestureDeferralToken>::deref(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (v3) {
    CFRelease(v3);
  }
  objc_destroyWeak((id *)(a1 + 16));

  return WTF::fastFree((WTF *)a1, v4);
}

- (void)imageAnalysisGestureDidBegin:()WKInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  if (([WeakRetained validateImageAnalysisRequestIdentifier:*(void *)(a1 + 8)] & 1) == 0)
  {
LABEL_7:
    if (!WeakRetained) {
      return;
    }
    goto LABEL_8;
  }
  if (a2 != 1)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 16) = 1;
    if (a2 == 2) {
      [WeakRetained _invokeAllActionsToPerformAfterPendingImageAnalysis:0];
    }
    else {
      [WeakRetained _completeImageAnalysisRequestForContextMenu:*(void *)(a1 + 32) requestIdentifier:*(void *)(a1 + 8) hasTextResults:*(unsigned __int8 *)(a1 + 24)];
    }
    goto LABEL_7;
  }
  WeakRetained[3760] = 1;
  [WeakRetained _invokeAllActionsToPerformAfterPendingImageAnalysis:1];
LABEL_8:

  CFRelease(WeakRetained);
}

- (uint64_t)_insertDynamicImageAnalysisContextMenuItemsIfPossible
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  **(unsigned char **)(a1 + 32) = 1;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  CFTypeRef v4 = elementActionTypeToUIActionIdentifier(13);
  uint64_t v5 = elementActionTypeToUIActionIdentifier(12);
  uint64_t v6 = (void *)[a2 children];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = ___ZZ85__WKContentView_WKInteraction___insertDynamicImageAnalysisContextMenuItemsIfPossible_ENK3__5clEP6UIMenu_block_invoke;
  v24[3] = &unk_1E5814018;
  v24[4] = v4;
  v24[5] = v5;
  v24[6] = &v29;
  v24[7] = &v25;
  [v6 enumerateObjectsUsingBlock:v24];
  v19 = a2;
  v7 = objc_msgSend((id)objc_msgSend(a2, "children"), "mutableCopy");
  v8 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & (v12 != 0)) != 0)
        {
          if (objc_msgSend((id)objc_msgSend(v12, "identifier"), "isEqual:", elementActionTypeToUIActionIdentifier(14)))
          {
            if ([**(id **)(a1 + 40) copySubjectResultForImageContextMenu]) {
              goto LABEL_12;
            }
          }
          else if (objc_msgSend((id)objc_msgSend(v12, "identifier"), "isEqual:", v4) {
                 && [**(id **)(a1 + 40) hasVisualSearchResultsForImageContextMenu])
          }
          {
LABEL_12:
            objc_msgSend(v12, "setAttributes:", objc_msgSend(v12, "attributes") & 0xFFFFFFFFFFFFFFFELL);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v35 count:16];
    }
    while (v9);
  }
  if (!*((unsigned char *)v26 + 24) && [**(id **)(a1 + 40) hasSelectableTextForImageContextMenu])
  {
    v13 = +[_WKActivatedElementInfo activatedElementInfoWithInteractionInformationAtPosition:**(void **)(a1 + 40) + 1520 userInfo:0];
    objc_msgSend(v8, "addObject:", objc_msgSend(+[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 12, v13, *(void *)(**(void **)(a1 + 40) + 824)), "uiActionForElementInfo:", v13));
  }
  if (*((unsigned char *)v30 + 24))
  {
    uint64_t v14 = [**(id **)(a1 + 40) machineReadableCodeSubMenuForImageContextMenu];
    if (v14) {
      [v8 addObject:v14];
    }
  }
  v15 = qword_1EB358910;
  if (os_log_type_enabled((os_log_t)qword_1EB358910, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v8 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v16;
    _os_log_impl(&dword_1985F2000, v15, OS_LOG_TYPE_DEFAULT, "Dynamically inserting %zu context menu action(s)", buf, 0xCu);
  }
  [v7 addObjectsFromArray:v8];
  uint64_t v17 = [v19 menuByReplacingChildren:v7];
  if (v8) {
    CFRelease(v8);
  }
  if (v7) {
    CFRelease(v7);
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v17;
}

- (void)beginTextRecognitionForFullscreenVideo:playerViewController:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    *((_DWORD *)WeakRetained + 980) = 0;
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) setImageAnalysis:a2];
    }
    CFRelease(v5);
  }
}

- (uint64_t)becomeFirstResponderForWebView
{
  *a1 = &unk_1EEA0E9B8;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)becomeFirstResponderForWebView
{
  v1 = (id *)(a1 + 8);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
    id v3 = objc_loadWeakRetained(v1);
    [v3 stopDeferringInputViewUpdates:1];
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

- (uint64_t)resignFirstResponderForWebView
{
  *a1 = &unk_1EEA0E9E0;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)resignFirstResponderForWebView
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    if (([WeakRetained isFirstResponder] & 1) == 0) {
      [v2 _cancelPendingKeyEventHandlers:1];
    }
    CFRelease(v2);
  }
}

- (uint64_t)_keyboardDidShow
{
  *a1 = &unk_1EEA0EA08;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_keyboardDidShow
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    uint64_t v3 = WeakRetained[368];
    if (v3) {
      WebKit::RevealFocusedElementDeferrer::fulfill(v3, 4);
    }
    CFRelease(v2);
  }
}

- (uint64_t)_isPanningScrollViewOrAncestor:()WKInteraction
{
  if ([a2 isDragging] & 1) != 0 || (objc_msgSend(a2, "isDecelerating")) {
    return 1;
  }
  CFTypeRef v4 = (void *)[a2 panGestureRecognizer];

  return objc_msgSend(v4, "_wk_hasRecognizedOrEnded");
}

- (uint64_t)_isInterruptingDecelerationForScrollViewOrAncestor:()WKInteraction
{
  return objc_msgSend(a2, "_wk_isInterruptingDeceleration");
}

- (uint64_t)_keyboardDismissalGestureRecognized:()WKInteraction
{
  *a1 = &unk_1EEA0EA90;
  objc_destroyWeak(a1 + 2);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_keyboardDismissalGestureRecognized:()WKInteraction
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if ([WeakRetained _hasFocusedElement]
      && WebCore::ElementContext::isSameElement((WebCore::ElementContext *)(WeakRetained + 288), (const ElementContext *)(a1 + 32)))
    {
      CFTypeRef v4 = qword_1EB358708;
      if (os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(*(void *)(WeakRetained[53] + 32) + 760);
        int v6 = 134218240;
        v7 = WeakRetained;
        __int16 v8 = 2048;
        uint64_t v9 = v5;
        _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing keyboard after tap (%p, pageProxyID=%llu)", (uint8_t *)&v6, 0x16u);
      }
      [WeakRetained _elementDidBlur];
    }
    if (WeakRetained) {
      CFRelease(WeakRetained);
    }
  }
}

- (uint64_t)pasteWithCompletionHandler:()WKInteraction
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)lookupForWebView:()WKInteraction
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EEA0EAE0;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)lookupForWebView:()WKInteraction
{
  uint64_t v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EEA0EAE0;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (WebKit::WebPageProxy)lookupForWebView:()WKInteraction
{
  if (*a2)
  {
    CFTypeRef v4 = result;
    uint64_t result = *(WebKit::WebPageProxy **)(*((void *)result + 1) + 424);
    uint64_t v5 = *((void *)result + 4);
    if (*(unsigned char *)(v5 + 576))
    {
      if (*(unsigned char *)(v5 + 704))
      {
        if (*(unsigned char *)(v5 + 250)) {
          BOOL v9 = *(_DWORD *)(v5 + 652) == 0;
        }
        else {
          BOOL v9 = 1;
        }
        if (v9)
        {
          WebCore::IntRect::operator CGRect();
        }
        else
        {
          LODWORD(v36) = WebKit::WebPageProxy::selectionBoundingRectInRootViewCoordinates(result);
          HIDWORD(v36) = v10;
          int v37 = v11;
          int v38 = v12;
          WebCore::FloatRect::operator CGRect();
        }
        uint64_t v17 = *a3;
        if (*a3) {
          *(_DWORD *)v17 += 2;
        }
        v35 = v17;
        uint64_t v18 = *a2;
        if (*a2) {
          *(_DWORD *)v18 += 2;
        }
        double v31 = v15;
        double v32 = v16;
        double v29 = v13;
        double v30 = v14;
        uint64_t v34 = v18;
        v19 = *a4;
        if (*a4) {
          *(_DWORD *)v19 += 2;
        }
        v33 = v19;
        WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v35, (uint64_t *)&v34, (uint64_t *)&v33, &v36);
        long long v21 = v33;
        v33 = 0;
        if (v21)
        {
          if (*(_DWORD *)v21 == 2) {
            WTF::StringImpl::destroy(v21, v20);
          }
          else {
            *(_DWORD *)v21 -= 2;
          }
        }
        long long v22 = v34;
        uint64_t v34 = 0;
        if (v22)
        {
          if (*(_DWORD *)v22 == 2) {
            WTF::StringImpl::destroy(v22, v20);
          }
          else {
            *(_DWORD *)v22 -= 2;
          }
        }
        long long v23 = v35;
        v35 = 0;
        if (v23)
        {
          if (*(_DWORD *)v23 == 2) {
            WTF::StringImpl::destroy(v23, v20);
          }
          else {
            *(_DWORD *)v23 -= 2;
          }
        }
        if (*a3) {
          uint64_t v24 = *((unsigned int *)*a3 + 1);
        }
        else {
          uint64_t v24 = 0;
        }
        if (*a2) {
          uint64_t v25 = *((unsigned int *)*a2 + 1);
        }
        else {
          uint64_t v25 = 0;
        }
        uint64_t v26 = *((void *)v4 + 1);
        uint64_t v27 = *(void **)(v26 + 712);
        if (v27)
        {
          CFRetain(*(CFTypeRef *)(v26 + 712));
          if (v36) {
            char v28 = (__CFString *)WTF::StringImpl::operator NSString *();
          }
          else {
            char v28 = &stru_1EEA10550;
          }
          objc_msgSend(v27, "lookup:withRange:fromRect:", v28, v24, v25, v29, v30, v31, v32);
          CFRelease(v27);
        }
        uint64_t result = v36;
        uint64_t v36 = 0;
        if (result)
        {
          if (*(_DWORD *)result == 2) {
            return (WebKit::WebPageProxy *)WTF::StringImpl::destroy(result, v20);
          }
          else {
            *(_DWORD *)result -= 2;
          }
        }
      }
    }
  }
  return result;
}

- (void)shareForWebView:()WKInteraction
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EEA0EB08;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)shareForWebView:()WKInteraction
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void **)(v2 + 712);
  uint64_t result = *a2;
  if (v3) {
    BOOL v5 = result == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v6 = *(void *)(*(void *)(v2 + 424) + 32);
    if (*(unsigned char *)(v6 + 704))
    {
      if (*(_DWORD *)(v6 + 652))
      {
        uint64_t result = WTF::StringImpl::operator NSString *();
        if (*(_DWORD *)(v6 + 652))
        {
          uint64_t v7 = result;
          uint64_t v9 = WebCore::SelectionGeometry::rect(*(WebCore::SelectionGeometry **)(v6 + 640));
          uint64_t v10 = v8;
          WebCore::IntRect::operator CGRect();
          return objc_msgSend(v3, "showShareSheetFor:fromRect:", v7, v9, v10);
        }
        else
        {
          __break(0xC471u);
        }
      }
    }
  }
  return result;
}

- (uint64_t)translateForWebView:()WKInteraction
{
  *a1 = &unk_1EEA0EB30;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)translateForWebView:()WKInteraction
{
  uint64_t v3 = (id *)(a1 + 8);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
    if (*(void *)a2)
    {
      if (*(_DWORD *)(*(void *)a2 + 4))
      {
        BOOL v5 = objc_loadWeakRetained(v3);
        uint64_t v6 = (WebKit::WebPageProxy *)v5[53];
        uint64_t v7 = *((void *)v6 + 4);
        if (*(unsigned char *)(v7 + 704) && *(_DWORD *)(v7 + 652))
        {
          uint64_t v8 = (void *)v5[89];
          if (*(void *)a2)
          {
            uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
            uint64_t v6 = (WebKit::WebPageProxy *)v5[53];
          }
          else
          {
            uint64_t v9 = &stru_1EEA10550;
          }
          LODWORD(v13) = WebKit::WebPageProxy::selectionBoundingRectInRootViewCoordinates(v6);
          HIDWORD(v13) = v10;
          unint64_t v14 = __PAIR64__(v12, v11);
          WebCore::FloatRect::operator CGRect();
          objc_msgSend(v8, "translate:fromRect:", v9, v13, v14);
        }
        CFRelease(v5);
      }
    }
  }
}

- (void)accessibilityRetrieveSpeakSelectionContent
{
  *a1 = &unk_1EEA0EB80;
  uint64_t v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)accessibilityRetrieveSpeakSelectionContent
{
  CFTypeRef v4 = *(void **)(a1 + 16);
  if (*a2) {
    BOOL v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    BOOL v5 = &stru_1EEA10550;
  }
  [v4 _accessibilityDidGetSpeakSelectionContent:v5];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v7 = *(void **)(a1 + 8);
    if (*a2) {
      uint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v8 = &stru_1EEA10550;
    }
    return [v7 accessibilitySpeakSelectionSetContent:v8];
  }
  return result;
}

- (void)_accessibilityRetrieveRectsEnclosingSelectionOffset:()WKInteraction withGranularity:
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EEA0EBA8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_accessibilityRetrieveRectsEnclosingSelectionOffset:()WKInteraction withGranularity:
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    BOOL v5 = (void *)a1[1];
    uint64_t v6 = [v5 webSelectionRectsForSelectionGeometries:a2];
    uint64_t v8 = a1[2];
    uint64_t v7 = a1[3];
    return [v5 _accessibilityDidGetSelectionRects:v6 withGranularity:v7 atOffset:v8];
  }
  return result;
}

- (uint64_t)_accessibilityRetrieveRectsAtSelectionOffset:()WKInteraction withText:completionHandler:
{
  uint64_t v4 = a1[3];
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v6 = (void *)a1[1];
    uint64_t v7 = [v6 webSelectionRectsForSelectionGeometries:a2];
    uint64_t v8 = a1[2];
    return [v6 _accessibilityDidGetSelectionRects:v7 withGranularity:1 atOffset:v8];
  }
  return result;
}

- (void)changeSelectionWithGestureAt:()WKInteraction withGesture:withState:withFlags:
{
  *a1 = &unk_1EEA0EC20;
  uint64_t v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)changeSelectionWithGestureAt:()WKInteraction withGesture:withState:withFlags:
{
  uint64_t result = selectionChangedWithGesture(*(void **)(*(void *)(a1 + 8) + 712), a2, a3, a4, *(unsigned char *)(a1 + 32) & 7u | a5);
  if ((unint64_t)(*(void *)(a1 + 24) - 3) <= 1) {
    *(unsigned char *)(*(void *)(a1 + 8) + 2962) = 0;
  }
  return result;
}

- (void)changeSelectionWithTouchAt:()WKInteraction withSelectionTouch:baseIsStart:withFlags:
{
  *a1 = &unk_1EEA0EC48;
  uint64_t v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)changeSelectionWithTouchAt:()WKInteraction withSelectionTouch:baseIsStart:withFlags:
{
  uint64_t v6 = *(void **)(*(void *)(a1 + 8) + 712);
  uint64_t v7 = *(void *)(a1 + 24) & 7 | a4;
  WebCore::IntPoint::operator CGPoint();
  uint64_t v8 = a3;
  switch(a3)
  {
    case 1u:
      uint64_t v9 = v7 & 7;
      int v10 = v6;
      uint64_t v11 = 1;
      goto LABEL_4;
    case 2u:
      goto LABEL_10;
    case 3u:
      uint64_t v8 = 3;
      goto LABEL_10;
    case 4u:
      uint64_t v8 = 4;
      goto LABEL_10;
    case 5u:
      uint64_t v8 = 5;
LABEL_10:
      uint64_t result = objc_msgSend(v6, "selectionChangedWithTouchAt:withSelectionTouch:withFlags:", v8, v7 & 7);
      *(unsigned char *)(*(void *)(a1 + 8) + 2962) = 0;
      break;
    default:
      uint64_t v9 = v7 & 7;
      int v10 = v6;
      uint64_t v11 = 0;
LABEL_4:
      uint64_t result = objc_msgSend(v10, "selectionChangedWithTouchAt:withSelectionTouch:withFlags:", v11, v9);
      break;
  }
  return result;
}

- (void)changeSelectionWithTouchesFrom:()WKInteraction to:withGesture:withState:
{
  *a1 = &unk_1EEA0EC70;
  uint64_t v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)changeSelectionWithTouchesFrom:()WKInteraction to:withGesture:withState:
{
  char v5 = a4;
  uint64_t result = selectionChangedWithGesture(*(void **)(*(void *)(a1 + 8) + 712), a2, a3, a4, a5);
  if ((v5 - 3) <= 1u) {
    *(unsigned char *)(*(void *)(a1 + 8) + 2962) = 0;
  }
  return result;
}

- (void)moveByOffset:()WKInteraction
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EEA0EC98;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)moveByOffset:()WKInteraction
{
  return [*(id *)(a1 + 8) _internalEndSelectionChange];
}

- (uint64_t)requestAutocorrectionRectsForString:()WKInteraction withCompletionHandler:
{
  if (*(_DWORD *)(a2 + 12))
  {
    uint64_t result = WebCore::FloatRect::operator CGRect();
    if (!*(_DWORD *)(a2 + 12))
    {
      __break(0xC471u);
      return result;
    }
    double v9 = v5;
    double v10 = v6;
    double v11 = v7;
    double v12 = v8;
    WebCore::FloatRect::operator CGRect();
    +[WKAutocorrectionRects autocorrectionRectsWithFirstCGRect:lastCGRect:](WKAutocorrectionRects, "autocorrectionRectsWithFirstCGRect:lastCGRect:", v9, v10, v11, v12, v13, v14, v15, v16);
  }
  uint64_t v17 = *(uint64_t (**)(void))(*(void *)(a1 + 16) + 16);

  return v17();
}

- (void)_internalRequestTextRectsForString:()WKInteraction completion:
{
  *a1 = &unk_1EEA0ECE8;
  uint64_t v2 = a1[2];
  a1[2] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)_internalRequestTextRectsForString:()WKInteraction completion:
{
  if (*(_DWORD *)(a2 + 12))
  {
    uint64_t result = WebCore::FloatRect::operator CGRect();
    if (!*(_DWORD *)(a2 + 12))
    {
      __break(0xC471u);
      return result;
    }
    uint64_t v9 = v5;
    uint64_t v10 = v6;
    uint64_t v11 = v7;
    uint64_t v12 = v8;
    WebCore::FloatRect::operator CGRect();
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F1DB28];
    uint64_t v16 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    uint64_t v18 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
    uint64_t v20 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = *MEMORY[0x1E4F1DB28];
    uint64_t v10 = v16;
    uint64_t v11 = v18;
    uint64_t v12 = v20;
  }
  uint64_t v21 = *(void *)(a1 + 8);
  uint64_t v22 = *(void *)(a2 + 16);
  if (v22) {
    CFRetain(*(CFTypeRef *)(a2 + 16));
  }
  long long v23 = *(const void **)(v21 + 1448);
  *(void *)(v21 + 1448) = v22;
  if (v23) {
    CFRelease(v23);
  }
  uint64_t v24 = *(void *)(a1 + 16);
  uint64_t v25 = (void *)(*(void *)(a1 + 8) + 1448);
  v25[1] = v9;
  v25[2] = v10;
  v25[3] = v11;
  v25[4] = v12;
  v25[5] = v14;
  v25[6] = v16;
  v25[7] = v18;
  v25[8] = v20;
  uint64_t v26 = *(uint64_t (**)(void))(*(void *)v24 + 16);

  return v26();
}

- (uint64_t)requestPreferredArrowDirectionForEditMenuWithCompletionHandler:()WKInteraction
{
  *(void *)a1 = &unk_1EEA0ED38;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  void *v2;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0ED38;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)requestPreferredArrowDirectionForEditMenuWithCompletionHandler:()WKInteraction
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 16));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    uint64_t v4 = WeakRetained[53];
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 8);
      *(void *)(a1 + 8) = 0;
      uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
      *uint64_t v6 = &unk_1EEA0ED60;
      v6[1] = v5;
      uint64_t v9 = v6;
      WebKit::WebPageProxy::requestEvasionRectsAboveSelection(v4, (uint64_t *)&v9);
      uint64_t v7 = (uint64_t)v9;
      uint64_t v9 = 0;
      if (v7) {
        (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
      }
      _Block_release(0);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    }
    CFRelease(v3);
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 8) + 16);
    v8();
  }
}

- (uint64_t)removeBackgroundMenu
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (long long *)(a2 + 3968);
  LOBYTE(v33[0]) = 0;
  char v36 = 0;
  LOBYTE(v37) = 0;
  char v43 = 0;
  if (*(unsigned char *)(a2 + 4064))
  {
    long long v4 = *(_OWORD *)(a2 + 4016);
    long long v39 = *(_OWORD *)(a2 + 4000);
    long long v40 = v4;
    long long v5 = *(_OWORD *)(a2 + 3984);
    long long v37 = *v3;
    long long v38 = v5;
    long long v6 = *(_OWORD *)(a2 + 4032);
    long long v7 = *(_OWORD *)(a2 + 4048);
    *(void *)(a2 + 4048) = 0;
    *(void *)(a2 + 4056) = 0;
    long long v41 = v6;
    long long v42 = v7;
    char v43 = 1;
  }
  std::__optional_storage_base<WebKit::RemoveBackgroundData,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WebKit::RemoveBackgroundData,false>>((uint64_t)v3, (uint64_t)v33);
  std::__optional_destruct_base<WebKit::RemoveBackgroundData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v33, v8);
  if (v43)
  {
    v33[2] = v39;
    v33[3] = v40;
    v33[4] = v41;
    v33[0] = v37;
    v33[1] = v38;
    CFTypeRef v34 = (CFTypeRef)v42;
    if ((void)v42) {
      CFRetain((CFTypeRef)v42);
    }
    uint64_t v10 = (WTF::StringImpl *)*((void *)&v42 + 1);
    if (*((void *)&v42 + 1)) {
      **((_DWORD **)&v42 + 1) += 2;
    }
    v35 = v10;
    uint64_t v11 = (WebKit *)v34;
    WTF::String::createCFString((uint64_t *)cf, (WTF::String *)&v35);
    MEMORY[0x19972EAD0](v30, cf[0]);
    WebKit::imageDataForRemoveBackground(v11, v30, v12, (WebKit *)&v28);
    uint64_t v13 = v30[0];
    v30[0] = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2) {
        WTF::StringImpl::destroy(v13, v9);
      }
      else {
        *(_DWORD *)v13 -= 2;
      }
    }
    CFTypeRef v14 = cf[0];
    cf[0] = 0;
    if (v14) {
      CFRelease(v14);
    }
    if (v28)
    {
      uint64_t v15 = *(void *)(a2 + 424);
      MEMORY[0x19972EAD0](&v32, v29);
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v27, (_DWORD **)&v32, 1uLL);
      uint64_t v16 = (void *)v28;
      if (v28)
      {
        uint64_t v17 = (const void *)[(id)v28 bytes];
        uint64_t v18 = (const void *)[v16 length];
      }
      else
      {
        uint64_t v17 = 0;
        uint64_t v18 = 0;
      }
      cf[0] = v17;
      cf[1] = v18;
      uint64_t v19 = *(void *)(v15 + 256);
      v30[0] = (WTF::StringImpl *)v33;
      v30[1] = (WTF::StringImpl *)v27;
      v30[2] = (WTF::StringImpl *)cf;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ReplaceImageForRemoveBackground>(v19, (uint64_t)v30, *(void *)(*(void *)(v15 + 32) + 1928), 0);
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v27, v20);
      uint64_t v21 = v32;
      double v32 = 0;
      if (v21)
      {
        if (*(_DWORD *)v21 == 2) {
          WTF::StringImpl::destroy(v21, v9);
        }
        else {
          *(_DWORD *)v21 -= 2;
        }
      }
    }
    CFTypeRef v22 = v29;
    CFTypeRef v29 = 0;
    if (v22) {
      CFRelease(v22);
    }
    CFTypeRef v23 = v28;
    CFTypeRef v28 = 0;
    if (v23) {
      CFRelease(v23);
    }
    uint64_t v24 = v35;
    v35 = 0;
    if (v24)
    {
      if (*(_DWORD *)v24 == 2) {
        WTF::StringImpl::destroy(v24, v9);
      }
      else {
        *(_DWORD *)v24 -= 2;
      }
    }
    CFTypeRef v25 = v34;
    CFTypeRef v34 = 0;
    if (v25) {
      CFRelease(v25);
    }
  }
  return std::__optional_destruct_base<WebKit::RemoveBackgroundData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v37, v9);
}

- (uint64_t)doAfterComputingImageAnalysisResultsForBackgroundRemoval:()WKInteraction
{
  *(void *)a1 = &unk_1EEA0EDB0;
  objc_destroyWeak((id *)(a1 + 104));
  uint64_t v2 = *(void *)(a1 + 96);
  *(void *)(a1 + 96) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

{
  void *v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0EDB0;
  objc_destroyWeak((id *)(a1 + 104));
  uint64_t v3 = *(void *)(a1 + 96);
  *(void *)(a1 + 96) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)doAfterComputingImageAnalysisResultsForBackgroundRemoval:()WKInteraction
{
  v26[2] = *(id *)MEMORY[0x1E4F143B8];
  long long v4 = (id *)(a1 + 104);
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 104));
  long long v6 = WeakRetained;
  if (a2 && WeakRetained)
  {
    uint64_t v7 = WeakRetained[53];
    long long v8 = *(_OWORD *)(a1 + 64);
    long long v22 = *(_OWORD *)(a1 + 48);
    long long v23 = v8;
    uint64_t v9 = *(void *)(a1 + 96);
    *(void *)(a1 + 96) = 0;
    uint64_t v10 = *(void *)(a1 + 80);
    long long v11 = *(_OWORD *)(a1 + 32);
    long long v20 = *(_OWORD *)(a1 + 16);
    long long v21 = v11;
    *(void *)&long long v24 = v10;
    uint64_t v25 = v9;
    v26[0] = 0;
    objc_moveWeak(v26, v4);
    uint64_t v12 = WTF::fastMalloc((WTF *)0x70);
    *(void *)uint64_t v12 = &unk_1EEA0EDD8;
    long long v14 = v23;
    long long v13 = v24;
    *(_OWORD *)(v12 + 48) = v22;
    *(_OWORD *)(v12 + 64) = v14;
    *(_OWORD *)(v12 + 80) = v13;
    long long v15 = v21;
    *(_OWORD *)(v12 + 16) = v20;
    *(_OWORD *)(v12 + 32) = v15;
    uint64_t v16 = v25;
    uint64_t v25 = 0;
    *(void *)(v12 + 96) = v16;
    *(void *)(v12 + 104) = 0;
    objc_moveWeak((id *)(v12 + 104), v26);
    uint64_t v19 = v12;
    WebKit::WebPageProxy::requestImageBitmap(v7, a1 + 16, &v19);
    uint64_t v17 = v19;
    uint64_t v19 = 0;
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
    }
    objc_destroyWeak(v26);
    uint64_t v18 = v25;
    uint64_t v25 = 0;
    if (v18) {
      (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
    }
  }
  else
  {
    WTF::CompletionHandler<void ()(void)>::operator()((uint64_t *)(a1 + 96));
    if (!v6) {
      return;
    }
  }
  CFRelease(v6);
}

- (uint64_t)_selectPositionAtPoint:()WKInteraction stayingWithinFocusedElement:completionHandler:
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16))();
  *(unsigned char *)(*(void *)(a1 + 8) + 2962) = 0;
  return result;
}

- (uint64_t)selectPositionAtBoundary:()WKInteraction inDirection:fromPoint:completionHandler:
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16))();
  *(unsigned char *)(*(void *)(a1 + 8) + 2962) = 0;
  return result;
}

- (uint64_t)moveSelectionAtBoundary:()WKInteraction inDirection:completionHandler:
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16))();
  *(unsigned char *)(*(void *)(a1 + 8) + 2962) = 0;
  return result;
}

- (uint64_t)selectTextWithGranularity:()WKInteraction atPoint:completionHandler:
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16))();
  uint64_t v3 = *(void *)(a1 + 8);
  *(unsigned char *)(v3 + 2962) = 0;
  --*(void *)(v3 + 3040);
  return result;
}

- (uint64_t)beginSelectionInDirection:()WKInteraction completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)updateSelectionWithExtentPoint:()WKInteraction withBoundary:completionHandler:
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
  --*(void *)(*(void *)(a1 + 16) + 3040);
  return result;
}

- (uint64_t)applyAutocorrection:()WKInteraction toString:isCandidate:withCompletionHandler:
{
  if (a2) {
    +[WKAutocorrectionRects autocorrectionRectsWithFirstCGRect:lastCGRect:](WKAutocorrectionRects, "autocorrectionRectsWithFirstCGRect:lastCGRect:", *(double *)(*(void *)(a1 + 16) + 1456), *(double *)(*(void *)(a1 + 16) + 1464), *(double *)(*(void *)(a1 + 16) + 1472), *(double *)(*(void *)(a1 + 16) + 1480), *(double *)(*(void *)(a1 + 16) + 1488), *(double *)(*(void *)(a1 + 16) + 1496), *(double *)(*(void *)(a1 + 16) + 1504), *(double *)(*(void *)(a1 + 16) + 1512));
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);

  return v3();
}

- (uint64_t)requestAutocorrectionContextWithCompletionHandler:()WKInteraction
{
  if (a2) {
    +[WKAutocorrectionContext autocorrectionContextWithWebContext:*(void *)(a1 + 16) + 1400];
  }
  else {
    +[WKAutocorrectionContext emptyAutocorrectionContext];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);

  return v3();
}

- (uint64_t)_becomeFirstResponderWithSelectionMovingForward:()WKInteraction completionHandler:
{
  if (*(void *)(result + 16))
  {
    uint64_t v1 = result;
    [*(id *)(result + 8) becomeFirstResponder];
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 16) + 16);
    return v2();
  }
  return result;
}

- (void)accessoryView:()WKInteraction tabInDirection:
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EEA0EFB8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)accessoryView:()WKInteraction tabInDirection:
{
  [*(id *)(a1 + 8) _internalEndSelectionChange];
  uint64_t result = [*(id *)(a1 + 8) reloadInputViews];
  *(unsigned char *)(*(void *)(a1 + 8) + 2965) = 0;
  return result;
}

- (uint64_t)willFinishIgnoringCalloutBarFadeAfterPerformingAction
{
  *a1 = &unk_1EEA0EFE0;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)willFinishIgnoringCalloutBarFadeAfterPerformingAction
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    --WeakRetained[378];
    CFRelease(WeakRetained);
  }
}

- (uint64_t)removeEmojiAlternatives
{
  *a1 = &unk_1EEA0F008;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)removeEmojiAlternatives
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[53];
    if (v4)
    {
      CFTypeRef cf = WeakRetained;
      CFRetain(*(CFTypeRef *)(v4 + 8));
      v33 = 0;
      uint64_t v34 = 0;
      uint64_t v5 = *(unsigned int *)(a2 + 12);
      if (v5)
      {
        long long v6 = *(uint64_t **)a2;
        uint64_t v7 = *(void *)a2 + 8 * v5;
        do
        {
          uint64_t v32 = *v6;
          long long v8 = (void *)WebKit::WebPageProxy::platformDictationAlternatives(v4, v32);
          uint64_t v9 = v8;
          if (v8)
          {
            uint64_t v10 = (void *)[v8 alternativeStrings];
            long long v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v35 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v29;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v29 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  long long v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                  if (([v15 _containsEmojiOnly] & 1) == 0) {
                    [v11 addObject:v15];
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v35 count:16];
              }
              while (v12);
            }
            uint64_t v16 = [v11 count];
            if (v16 != [v10 count])
            {
              if ([v11 count])
              {
                uint64_t v17 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42690]), "initWithPrimaryString:alternativeStrings:isLowConfidence:", objc_msgSend(v9, "primaryString"), v11, objc_msgSend(v9, "isLowConfidence"));
              }
              else
              {
                uint64_t v18 = HIDWORD(v34);
                if (HIDWORD(v34) == v34)
                {
                  uint64_t v19 = (uint64_t *)WTF::Vector<WTF::ObjectIdentifierGeneric<WebCore::DictationContextType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v33, HIDWORD(v34) + 1, (unint64_t)&v32);
                  uint64_t v18 = HIDWORD(v34);
                  long long v20 = v33;
                  uint64_t v21 = *v19;
                }
                else
                {
                  uint64_t v21 = v32;
                  long long v20 = v33;
                }
                *((void *)v20 + v18) = v21;
                uint64_t v17 = 0;
                ++HIDWORD(v34);
              }
              long long v22 = (const void *)[objc_alloc(MEMORY[0x1E4F18BC0]) _initWithNSTextAlternatives:v17];
              uint64_t v23 = *(void *)(v4 + 40);
              if (v23) {
                uint64_t v24 = *(void *)(v23 + 8);
              }
              else {
                uint64_t v24 = 0;
              }
              (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)v24 + 792))(v24, v22, v32);
              if (v22) {
                CFRelease(v22);
              }
              if (v17) {
                CFRelease(v17);
              }
            }
          }
          ++v6;
        }
        while (v6 != (uint64_t *)v7);
      }
      WebKit::WebPageProxy::clearDictationAlternatives(v4, (uint64_t)&v33);
      uint64_t v26 = v33;
      if (v33)
      {
        v33 = 0;
        LODWORD(v34) = 0;
        WTF::fastFree(v26, v25);
      }
      CFRelease(*(CFTypeRef *)(v4 + 8));
      id WeakRetained = cf;
    }
    CFRelease(WeakRetained);
  }
}

- (uint64_t)_focusTextInputContext:()WKInteraction placeCaretAt:completionHandler:
{
  *(void *)a1 = &unk_1EEA0F030;
  _Block_release(*(const void **)(a1 + 24));
  uint64_t v2 = *(const void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    CFRelease(v2);
  }
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

{
  const void *v2;
  void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0F030;
  _Block_release(*(const void **)(a1 + 24));
  uint64_t v2 = *(const void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    CFRelease(v2);
  }
  objc_destroyWeak((id *)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_focusTextInputContext:()WKInteraction placeCaretAt:completionHandler:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    if (a2) {
      char v6 = [WeakRetained _isTextInputContextFocused:*(void *)(a1 + 16)];
    }
    else {
      char v6 = 0;
    }
    v5[2969] |= v6;
    v5[2962] = 0;
    (*(void (**)(void))(*(void *)(a1 + 24) + 16))();
    CFRelease(v5);
  }
  else
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 24) + 16);
    v7();
  }
}

- (uint64_t)_requestTextInputContextsInRect:()WKInteraction completionHandler:
{
  *a1 = &unk_1EEA0F058;
  uint64_t v2 = (id *)(a1 + 1);
  _Block_release(a1[2]);
  objc_destroyWeak(v2);

  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_requestTextInputContextsInRect:()WKInteraction completionHandler:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained && *((_DWORD *)a2 + 3))
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a2 + 3)];
    uint64_t v6 = *((unsigned int *)a2 + 3);
    if (v6)
    {
      uint64_t v7 = *a2;
      uint64_t v8 = 80 * v6;
      do
      {
        id v9 = [[_WKTextInputContext alloc] _initWithTextInputContext:v7];
        if (v9)
        {
          [v5 addObject:v9];
          CFRelease(v9);
        }
        v7 += 80;
        v8 -= 80;
      }
      while (v8);
    }
    (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
  }
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
  }
}

- (void)_executeEditCommand:()WKInteraction notifyDelegate:
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EEA0F080;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_executeEditCommand:()WKInteraction notifyDelegate:
{
  if (*(unsigned char *)(result + 16)) {
    return [*(id *)(result + 8) _internalEndSelectionChange];
  }
  return result;
}

- (uint64_t)updateCurrentFocusedElementInformation:()WKInteraction
{
  uint64_t v4 = (id *)(a1 + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  if (WeakRetained && (CFRelease(WeakRetained), *((unsigned char *)a2 + 416)) && *((void *)a2 + 47) == *(void *)(a1 + 16))
  {
    uint64_t v6 = (char *)objc_loadWeakRetained(v4);
    long long v7 = a2[3];
    long long v9 = *a2;
    long long v8 = a2[1];
    *((_OWORD *)v6 + 145) = a2[2];
    *((_OWORD *)v6 + 146) = v7;
    *((_OWORD *)v6 + 143) = v9;
    *((_OWORD *)v6 + 144) = v8;
    long long v10 = a2[7];
    long long v12 = a2[4];
    long long v11 = a2[5];
    *((_OWORD *)v6 + 149) = a2[6];
    *((_OWORD *)v6 + 150) = v10;
    *((_OWORD *)v6 + 147) = v12;
    *((_OWORD *)v6 + 148) = v11;
    long long v14 = a2[9];
    long long v13 = a2[10];
    long long v15 = a2[8];
    *(_OWORD *)(v6 + 2460) = *(long long *)((char *)a2 + 172);
    *((_OWORD *)v6 + 152) = v14;
    *((_OWORD *)v6 + 153) = v13;
    *((_OWORD *)v6 + 151) = v15;
    WTF::String::operator=((uint64_t *)v6 + 310, (WTF::StringImpl **)a2 + 24);
    WTF::Vector<WebKit::OptionItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)(v6 + 2488), (uint64_t *)a2 + 25);
    *((_DWORD *)v6 + 626) = *((_DWORD *)a2 + 54);
    WTF::String::operator=((uint64_t *)v6 + 314, (WTF::StringImpl **)a2 + 28);
    *((void *)v6 + 315) = *((void *)a2 + 29);
    WTF::String::operator=((uint64_t *)v6 + 316, (WTF::StringImpl **)a2 + 30);
    *((_WORD *)v6 + 1268) = *((_WORD *)a2 + 124);
    WTF::String::operator=((uint64_t *)v6 + 318, (WTF::StringImpl **)a2 + 32);
    long long v16 = *(long long *)((char *)a2 + 264);
    *(_OWORD *)(v6 + 2568) = *(long long *)((char *)a2 + 280);
    *(_OWORD *)(v6 + 2552) = v16;
    *((_WORD *)v6 + 1292) = *((_WORD *)a2 + 148);
    WTF::String::operator=((uint64_t *)v6 + 324, (WTF::StringImpl **)a2 + 38);
    WTF::String::operator=((uint64_t *)v6 + 325, (WTF::StringImpl **)a2 + 39);
    WTF::String::operator=((uint64_t *)v6 + 326, (WTF::StringImpl **)a2 + 40);
    *((_WORD *)v6 + 1308) = *((_WORD *)a2 + 164);
    WebCore::Color::operator=();
    WTF::Vector<WebCore::Color,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)(v6 + 2632), (uint64_t *)a2 + 43);
    long long v17 = *(long long *)((char *)a2 + 360);
    long long v18 = *(long long *)((char *)a2 + 376);
    long long v19 = *(long long *)((char *)a2 + 392);
    *((void *)v6 + 337) = *((void *)a2 + 51);
    *(_OWORD *)(v6 + 2664) = v18;
    *(_OWORD *)(v6 + 2680) = v19;
    *(_OWORD *)(v6 + 2648) = v17;
    CFRelease(v6);
    long long v20 = *(uint64_t (**)(void))(**(void **)(a1 + 8) + 16);
  }
  else
  {
    long long v20 = *(uint64_t (**)(void))(**(void **)(a1 + 8) + 16);
  }

  return v20();
}

- (uint64_t)selectWordForReplacement
{
  *a1 = &unk_1EEA0F0D0;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)selectWordForReplacement
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained _internalEndSelectionChange];
    CFRelease(v2);
  }
}

- (uint64_t)requestRVItemInSelectedRangeWithCompletionHandler:()WKInteraction
{
  *(void *)a1 = &unk_1EEA0F0F8;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  void *v2;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0F0F8;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)requestRVItemInSelectedRangeWithCompletionHandler:()WKInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    WebKit::RevealItem::item(a2);
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    CFRelease(v5);
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 8) + 16);
    v6();
  }
}

- (uint64_t)_internalSelectTextForContextMenuWithLocationInView:()WKInteraction completionHandler:
{
  *a1 = &unk_1EEA0F120;
  uint64_t v2 = (id *)(a1 + 1);
  _Block_release(a1[2]);
  objc_destroyWeak(v2);

  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_internalSelectTextForContextMenuWithLocationInView:()WKInteraction completionHandler:
{
  uint64_t v6 = (id *)(a1 + 8);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    long long v8 = WeakRetained;
    if (a2 && ([WeakRetained shouldSuppressEditMenu] & 1) == 0) {
      [v8[89] activateSelection];
    }
    aBlock = _Block_copy(*(const void **)(a1 + 16));
    long long v9 = *(WTF::StringImpl **)a3;
    if (*(void *)a3) {
      *(_DWORD *)v9 += 2;
    }
    long long v16 = v9;
    *(_OWORD *)long long v17 = *(_OWORD *)(a3 + 8);
    long long v10 = *(const void **)(a3 + 24);
    CFTypeRef cf = v10;
    if (v10) {
      CFRetain(v10);
    }
    id v19 = 0;
    objc_copyWeak(&v19, v6);
    uint64_t v11 = WTF::fastMalloc((WTF *)0x40);
    uint64_t v12 = v11;
    *(void *)uint64_t v11 = &unk_1EEA0F148;
    *(void *)(v11 + 8) = aBlock;
    *(unsigned char *)(v11 + 16) = a2;
    if (v16) {
      *(_DWORD *)v16 += 2;
    }
    *(void *)(v11 + 24) = v16;
    *(_OWORD *)(v11 + 32) = *(_OWORD *)v17;
    *(void *)(v11 + 48) = cf;
    if (cf) {
      CFRetain(cf);
    }
    *(void *)(v12 + 56) = 0;
    objc_moveWeak((id *)(v12 + 56), &v19);
    uint64_t v20 = v12;
    [v8 doAfterComputingImageAnalysisResultsForBackgroundRemoval:&v20];
    uint64_t v13 = v20;
    uint64_t v20 = 0;
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    }
    objc_destroyWeak(&v19);
    if (cf) {
      CFRelease(cf);
    }
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v14);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
    _Block_release(0);
    CFRelease(v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
  }
}

- (uint64_t)insertTextPlaceholderWithSize:()WKInteraction completionHandler:
{
  *a1 = &unk_1EEA0F170;
  uint64_t v2 = (id *)(a1 + 1);
  _Block_release(a1[2]);
  objc_destroyWeak(v2);

  return WTF::fastFree((WTF *)a1, v3);
}

- (void)insertTextPlaceholderWithSize:()WKInteraction completionHandler:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  uint64_t v5 = WeakRetained;
  if (WeakRetained && [WeakRetained webView] && *(unsigned char *)(a2 + 80))
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    v19[2] = *(_OWORD *)(a2 + 32);
    v19[3] = v6;
    v19[4] = *(_OWORD *)(a2 + 64);
    long long v7 = *(_OWORD *)(a2 + 16);
    v19[0] = *(_OWORD *)a2;
    v19[1] = v7;
    WebCore::FloatRect::operator CGRect();
    objc_msgSend(v5, "convertRect:fromView:", objc_msgSend(v5, "webView"), v8, v9, v10, v11);
    v17.origin.x = v12;
    v17.origin.y = v13;
    v17.size.width = v14;
    v17.size.height = v15;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v18, &v17);
    v19[0] = v18;
    long long v16 = [[WKTextPlaceholder alloc] initWithElementContext:v19];
    (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
    if (v16) {
      CFRelease(v16);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
    if (!v5) {
      return;
    }
  }
  CFRelease(v5);
}

- (void)_handleDropByInsertingImagePlaceholders:()WKInteraction session:
{
  uint64_t v5 = (WebCore::DestinationColorSpace *)std::__optional_move_base<WebCore::TextIndicatorData,false>::__optional_move_base[abi:sn180100](v41, a3);
  if (!v48 || (uint64_t v6 = *(void *)(a1 + 8), !*(void *)(v6 + 3008)))
  {
    uint64_t v24 = qword_1EB357DA8;
    if (!os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    uint64_t v25 = "Failed to animate image placeholders: missing text indicator data.";
    goto LABEL_14;
  }
  long long v7 = v45;
  if (!v45)
  {
    uint64_t v24 = qword_1EB357DA8;
    if (!os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    uint64_t v25 = "Failed to animate image placeholders: missing unselected content image.";
LABEL_14:
    _os_log_impl(&dword_1985F2000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
    goto LABEL_31;
  }
  ++v45[2];
  uint64_t v8 = WebCore::DestinationColorSpace::SRGB(v5);
  (*(void (**)(uint8_t *__return_ptr, _DWORD *, uint64_t))(*(void *)v7 + 288))(buf, v7, v8);
  if (*(void *)buf)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F42A80]);
    double v10 = (void *)WebCore::NativeImage::platformImage(*(WebCore::NativeImage **)buf);
    uint64_t v11 = *(void *)(*(void *)(a1 + 8) + 424);
    uint64_t v12 = 764;
    if (!*(unsigned char *)(v11 + 768)) {
      uint64_t v12 = 760;
    }
    CGFloat v13 = (const void *)[v9 initWithCGImage:*v10 scale:0 orientation:*(float *)(v11 + v12)];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v13];
    if (!v48)
    {
      __break(1u);
      return;
    }
    CGFloat v15 = (void *)v14;
    WebCore::FloatRect::operator CGRect();
    objc_msgSend(v15, "setFrame:");
    [*(id *)(a1 + 8) addSubview:v15];
    uint64_t v16 = *(void *)(a1 + 8);
    CGRect v17 = *(const void **)(v16 + 3568);
    *(void *)(v16 + 3568) = v15;
    if (v17) {
      CFRelease(v17);
    }
    long long v18 = *(void **)(a1 + 8);
    [v18 unobscuredContentRect];
    WebKit::DragDropInteractionState::deliverDelayedDropPreview(v6 + 3104, (uint64_t)v18, *(void **)(a1 + 16), a2, v19, v20, v21, v22);
    if (v13) {
      CFRelease(v13);
    }
  }
  else
  {
    uint64_t v26 = qword_1EB357DA8;
    if (!os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)v49 = 0;
    _os_log_impl(&dword_1985F2000, v26, OS_LOG_TYPE_DEFAULT, "Failed to animate image placeholders: could not decode unselected content image.", v49, 2u);
  }
  uint64_t v27 = *(WebCore::NativeImage **)buf;
  *(void *)buf = 0;
  if (v27)
  {
    char v28 = 0;
    uint64_t v29 = *((void *)v27 + 1);
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v29, (unsigned __int8 *)&v28, 1u, memory_order_acquire, memory_order_acquire);
    if (v28) {
      MEMORY[0x19972E8D0](v29);
    }
    uint64_t v30 = *(void *)(v29 + 8);
    int v31 = 1;
    uint64_t v32 = v30 - 1;
    *(void *)(v29 + 8) = v30 - 1;
    if (v30 == 1)
    {
      uint64_t v40 = *(void *)(v29 + 16);
      uint64_t v33 = *(void *)(v29 + 24);
      *(void *)(v29 + 24) = 0;
      BOOL v34 = v40 != 0;
    }
    else
    {
      uint64_t v33 = 0;
      BOOL v34 = 1;
    }
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v29, (unsigned __int8 *)&v31, 0, memory_order_release, memory_order_relaxed);
    if (v31 == 1)
    {
      if (!v32)
      {
LABEL_24:
        if (v33) {
          (*(void (**)(uint64_t))(*(void *)v33 + 8))(v33);
        }
        if (!v34) {
          WTF::fastFree((WTF *)v29, v23);
        }
      }
    }
    else
    {
      WTF::Lock::unlockSlow((WTF::Lock *)v29);
      if (!v32) {
        goto LABEL_24;
      }
    }
  }
LABEL_28:
  if (v7[2] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v7 + 8))(v7);
  }
  else {
    --v7[2];
  }
LABEL_31:
  if (v48)
  {
    if ((v47 & 0x8000000000000) != 0)
    {
      long long v39 = (unsigned int *)(v47 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(v47 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v39);
        WTF::fastFree((WTF *)v39, v23);
      }
    }
    v35 = v46;
    v46 = 0;
    if (v35)
    {
      if (v35[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v35 + 8))(v35);
      }
      else {
        --v35[2];
      }
    }
    uint64_t v36 = v45;
    v45 = 0;
    if (v36)
    {
      if (v36[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v36 + 8))(v36);
      }
      else {
        --v36[2];
      }
    }
    long long v37 = v44;
    uint64_t v44 = 0;
    if (v37)
    {
      if (v37[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v37 + 8))(v37);
      }
      else {
        --v37[2];
      }
    }
    long long v38 = v42;
    if (v42)
    {
      long long v42 = 0;
      int v43 = 0;
      WTF::fastFree(v38, v23);
    }
  }
}

- (uint64_t)_handleDropByInsertingImagePlaceholders:()WKInteraction session:
{
  *(void *)this = &unk_1EEA0F198;
  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)requestDocumentContext:()WKInteraction completionHandler:
{
  char v4 = *(unsigned char *)(a1 + 24);
  if (*(unsigned char *)(a1 + 8)) {
    WebKit::DocumentEditingContext::toPlatformContext(a2, v4);
  }
  else {
    WebKit::DocumentEditingContext::toLegacyPlatformContext(a2, v4);
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 16) + 16);

  return v5();
}

- (IPC::Encoder)appHighlightMenu
{
  return WebKit::WebPageProxy::createAppHighlightInSelectedRange(*(IPC::Encoder **)(a2 + 424), *(unsigned char *)(a1 + 8) == 0, 0);
}

- (uint64_t)scrollToTextFragmentGenerationMenu
{
  uint64_t v2 = *(void *)(a2 + 424);
  char v4 = 0;
  return WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::CopyLinkWithHighlight>(*(void *)(v2 + 256), (uint64_t)&v4, *(void *)(*(void *)(v2 + 32) + 1928), 0);
}

- (void)performTextSearchWithQueryString:()WKInteraction usingOptions:resultAggregator:
{
  *a1 = &unk_1EEA0F238;
  uint64_t v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)performTextSearchWithQueryString:()WKInteraction usingOptions:resultAggregator:
{
  uint64_t v3 = (long long *)*a2;
  CGFloat v13 = (long long *)*a2;
  unsigned int v5 = *((_DWORD *)a2 + 2);
  uint64_t v4 = *((unsigned int *)a2 + 3);
  *a2 = 0;
  a2[1] = 0;
  unint64_t v14 = __PAIR64__(v4, v5);
  if (v4)
  {
    uint64_t v6 = &v3[2 * v4];
    do
    {
      long long v15 = *v3;
      long long v7 = (WTF::StringImpl *)*((void *)v3 + 2);
      if (v7) {
        *(_DWORD *)v7 += 2;
      }
      uint64_t v16 = v7;
      uint64_t v17 = *((void *)v3 + 3);
      id v9 = +[WKFoundTextRange foundTextRangeWithWebFoundTextRange:](WKFoundTextRange, "foundTextRangeWithWebFoundTextRange:", &v15, v13, v14);
      double v10 = v16;
      uint64_t v16 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v8);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
      }
      [*(id *)(a1 + 16) foundRange:v9 forSearchString:*(void *)(a1 + 8) inDocument:0];
      v3 += 2;
    }
    while (v3 != v6);
  }
  objc_msgSend(*(id *)(a1 + 16), "finishedSearching", v13, v14, v15, v16);
  return WTF::Vector<WebKit::WebFoundTextRange,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, v11);
}

- (uint64_t)requestRectForFoundTextRange:()WKInteraction completionHandler:
{
  WebCore::FloatRect::operator CGRect();
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 8) + 16))(*(void *)(a1 + 8), v2);
}

- (uint64_t)_completeImageAnalysisRequestForContextMenu:()WKInteraction requestIdentifier:hasTextResults:
{
  *(void *)a1 = &unk_1EEA0F2B0;
  uint64_t v3 = *(WTF **)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v3) {
    WTF::ThreadSafeRefCounted<WTF::Box<WebKit::ImageAnalysisContextMenuActionData>::Data,(WTF::DestructionThread)0>::deref(v3, a2);
  }
  uint64_t v4 = *(unsigned int **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v4) {
    WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)2>,(WTF::DestructionThread)2>::deref(v4);
  }
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

{
  WTF *v3;
  unsigned int *v4;
  void *v5;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0F2B0;
  uint64_t v3 = *(WTF **)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v3) {
    WTF::ThreadSafeRefCounted<WTF::Box<WebKit::ImageAnalysisContextMenuActionData>::Data,(WTF::DestructionThread)0>::deref(v3, a2);
  }
  uint64_t v4 = *(unsigned int **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v4) {
    WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)2>,(WTF::DestructionThread)2>::deref(v4);
  }
  objc_destroyWeak((id *)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v5);
}

- (void)_completeImageAnalysisRequestForContextMenu:()WKInteraction requestIdentifier:hasTextResults:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    unsigned int v5 = WeakRetained;
    uint64_t v6 = *(void *)(a1 + 24);
    if (a2) {
      CFRetain(a2);
    }
    long long v7 = *(const void **)(v6 + 16);
    *(void *)(v6 + 16) = a2;
    if (v7) {
      CFRelease(v7);
    }
    CFRelease(v5);
  }
}

- (uint64_t)replaceText:()WKInteraction withText:options:completionHandler:
{
  *(void *)a1 = &unk_1EEA0F2D8;
  _Block_release(*(const void **)(a1 + 16));
  uint64_t v2 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

{
  void *v2;
  const void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0F2D8;
  _Block_release(*(const void **)(a1 + 16));
  uint64_t v3 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)replaceText:()WKInteraction withText:options:completionHandler:
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(double **)(a1 + 8);
    uint64_t v4 = v3 + 181;
    unsigned int v5 = +[WKUITextSelectionRect selectionRectWithCGRect:](WKUITextSelectionRect, "selectionRectWithCGRect:", v3[182], v3[183], v3[184], v3[185]);
    uint64_t v6 = v5;
    if (v5) {
      CFRetain(v5);
    }
    CGRect v11 = *(CGRect *)(v4 + 1);
    CGRect v12 = *(CGRect *)(v4 + 5);
    v9[0] = v6;
    if (CGRectEqualToRect(v11, v12))
    {
      uint64_t v7 = 1;
    }
    else
    {
      v9[1] = +[WKUITextSelectionRect selectionRectWithCGRect:](WKUITextSelectionRect, "selectionRectWithCGRect:", v4[5], v4[6], v4[7], v4[8]);
      uint64_t v7 = 2;
    }
    [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:v7];
    (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 16) + 16);
    v8();
  }
}

- (uint64_t)requestTextRectsForString:()WKInteraction withCompletionHandler:
{
  *(void *)a1 = &unk_1EEA0F300;
  _Block_release(*(const void **)(a1 + 16));
  uint64_t v2 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

{
  void *v2;
  const void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0F300;
  _Block_release(*(const void **)(a1 + 16));
  uint64_t v3 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)requestTextRectsForString:()WKInteraction withCompletionHandler:
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a2 + 3)];
  uint64_t v5 = *((unsigned int *)a2 + 3);
  if (v5)
  {
    uint64_t v6 = *a2;
    uint64_t v7 = 16 * v5;
    do
    {
      WebCore::FloatRect::operator CGRect();
      uint64_t v8 = +[WKUITextSelectionRect selectionRectWithCGRect:](WKUITextSelectionRect, "selectionRectWithCGRect:");
      if (v8) {
        [v4 addObject:v8];
      }
      v6 += 16;
      v7 -= 16;
    }
    while (v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
  if (v4)
  {
    CFRelease(v4);
  }
}

- (uint64_t)requestTextContextForAutocorrectionWithCompletionHandler:()WKInteraction
{
  WebCore::AttributedString::AttributedString((WebCore::AttributedString *)v11);
  WebCore::AttributedString::AttributedString((WebCore::AttributedString *)v12);
  WebCore::AttributedString::AttributedString((WebCore::AttributedString *)v13);
  WebCore::AttributedString::AttributedString((WebCore::AttributedString *)v14);
  WebCore::AttributedString::AttributedString((WebCore::AttributedString *)v15);
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 16) + 1400;
    WTF::String::operator=(v11, (WTF::StringImpl **)v4);
    WTF::String::operator=(v14, (WTF::StringImpl **)(v4 + 8));
    WTF::String::operator=(v12, (WTF::StringImpl **)(v4 + 16));
    WTF::String::operator=(v13, (WTF::StringImpl **)(v4 + 24));
    uint64_t v5 = *(void *)(v4 + 32);
    if (v5 == -1)
    {
      uint64_t v6 = 0;
      uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v6 = *(void *)(v4 + 40);
    }
    *(void *)&long long v16 = v5;
    *((void *)&v16 + 1) = v6;
  }
  WebKit::DocumentEditingContext::toPlatformContext((uint64_t)v11, 1);
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  uint64_t v8 = (WTF *)v18;
  if ((void)v18)
  {
    *(void *)&long long v18 = 0;
    DWORD2(v18) = 0;
    WTF::fastFree(v8, v7);
  }
  id v9 = (WTF *)v17;
  if ((void)v17)
  {
    *(void *)&long long v17 = 0;
    DWORD2(v17) = 0;
    WTF::fastFree(v9, v7);
  }
  MEMORY[0x199732DE0](v15);
  MEMORY[0x199732DE0](v14);
  MEMORY[0x199732DE0](v13);
  MEMORY[0x199732DE0](v12);
  return MEMORY[0x199732DE0](v11);
}

- (uint64_t)_internalAdjustSelectionWithOffset:()WKInteraction lengthDelta:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)targetedPreviewForID:()WKInteraction completionHandler:
{
  *(void *)a1 = &unk_1EEA0F378;
  _Block_release(*(const void **)(a1 + 16));
  uint64_t v2 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

{
  void *v2;
  const void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0F378;
  _Block_release(*(const void **)(a1 + 16));
  uint64_t v3 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)targetedPreviewForID:()WKInteraction completionHandler:
{
  if (*((unsigned char *)a2 + 112))
  {
    uint64_t v3 = *(void **)(a1 + 8);
    WebCore::TextIndicatorData::TextIndicatorData((WebCore::TextIndicatorData *)v13, a2);
    uint64_t v4 = (const void *)objc_msgSend(v3, "_createTargetedPreviewFromTextIndicator:previewContainer:", v13, objc_msgSend(*(id *)(a1 + 8), "containerForContextMenuHintPreviews"));
    uint64_t v6 = v4;
    if (v4) {
      CFRetain(v4);
    }
    if ((v19 & 0x8000000000000) != 0)
    {
      CGRect v12 = (unsigned int *)(v19 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v12);
        WTF::fastFree((WTF *)v12, v5);
      }
    }
    uint64_t v7 = v18;
    long long v18 = 0;
    if (v7)
    {
      if (v7[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v7 + 8))(v7);
      }
      else {
        --v7[2];
      }
    }
    id v9 = v17;
    long long v17 = 0;
    if (v9)
    {
      if (v9[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v9 + 8))(v9);
      }
      else {
        --v9[2];
      }
    }
    double v10 = v16;
    long long v16 = 0;
    if (v10)
    {
      if (v10[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v10 + 8))(v10);
      }
      else {
        --v10[2];
      }
    }
    CGRect v11 = v14;
    if (v14)
    {
      unint64_t v14 = 0;
      int v15 = 0;
      WTF::fastFree(v11, v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 16) + 16);
    v8();
  }
}

- (uint64_t)updateUnderlyingTextVisibilityForTextAnimationID:()WKInteraction visible:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)callCompletionHandlerForAnimationID:()WKInteraction completionHandler:
{
  *(void *)a1 = &unk_1EEA0F3C8;
  _Block_release(*(const void **)(a1 + 16));
  uint64_t v2 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

{
  void *v2;
  const void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0F3C8;
  _Block_release(*(const void **)(a1 + 16));
  uint64_t v3 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)callCompletionHandlerForAnimationID:()WKInteraction completionHandler:
{
  if (*((unsigned char *)a2 + 112))
  {
    uint64_t v3 = *(void **)(a1 + 8);
    WebCore::TextIndicatorData::TextIndicatorData((WebCore::TextIndicatorData *)v13, a2);
    uint64_t v4 = (const void *)objc_msgSend(v3, "_createTargetedPreviewFromTextIndicator:previewContainer:", v13, objc_msgSend(*(id *)(a1 + 8), "containerForContextMenuHintPreviews"));
    uint64_t v6 = v4;
    if (v4) {
      CFRetain(v4);
    }
    if ((v19 & 0x8000000000000) != 0)
    {
      CGRect v12 = (unsigned int *)(v19 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v12);
        WTF::fastFree((WTF *)v12, v5);
      }
    }
    uint64_t v7 = v18;
    long long v18 = 0;
    if (v7)
    {
      if (v7[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v7 + 8))(v7);
      }
      else {
        --v7[2];
      }
    }
    id v9 = v17;
    long long v17 = 0;
    if (v9)
    {
      if (v9[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v9 + 8))(v9);
      }
      else {
        --v9[2];
      }
    }
    double v10 = v16;
    long long v16 = 0;
    if (v10)
    {
      if (v10[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v10 + 8))(v10);
      }
      else {
        --v10[2];
      }
    }
    CGRect v11 = v14;
    if (v14)
    {
      unint64_t v14 = 0;
      int v15 = 0;
      WTF::fastFree(v11, v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 16) + 16);
    v8();
  }
}

@end