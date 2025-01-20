id sub_2B98(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ACDelayedConfirmationViewController;
  return objc_msgSendSuper2(&v2, "triggerConfirmation");
}

id sub_2C40(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ACDelayedConfirmationViewController;
  return objc_msgSendSuper2(&v2, "triggerDenial");
}

void sub_3F8C(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 40) addObject:v6];
}

void sub_42C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 120));
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_4310(uint64_t a1)
{
  objc_super v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v4 = [WeakRetained showingPlaying];

  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 56);
  if (v4)
  {
    unsigned int v8 = [v5 _itemAtIndexIsPlaying:v7];

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 48));
      v10 = [v9 _privateDelegate];
      id v11 = objc_loadWeakRetained((id *)(a1 + 48));
      [v10 cancelSpeakingForSiriViewController:v11];
    }
    id v12 = objc_loadWeakRetained((id *)(a1 + 48));
    [v12 _setItemAtIndex:*(void *)(a1 + 56) isPlaying:0];

    id v21 = objc_loadWeakRetained(v2);
    [v21 setShowingPlaying:0];
  }
  else
  {
    [v5 _setItemAtIndex:v7 isPlaying:1];

    id v13 = objc_loadWeakRetained(v2);
    [v13 setShowingPlaying:1];

    id v14 = objc_loadWeakRetained((id *)(a1 + 48));
    v15 = [v14 _privateDelegate];
    id v16 = objc_loadWeakRetained((id *)(a1 + 48));
    [v15 cancelSpeakingForSiriViewController:v16];

    id v17 = objc_loadWeakRetained((id *)(a1 + 48));
    v18 = [v17 _privateDelegate];
    id v19 = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v20 = *(void *)(a1 + 32);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_457C;
    v22[3] = &unk_184F0;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    v24[1] = *(id *)(a1 + 56);
    objc_copyWeak(v24, v2);
    [v18 siriViewController:v19 speakText:v20 completion:v22];

    objc_destroyWeak(v24);
    objc_destroyWeak(&v23);
  }
}

void sub_4560(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  _Unwind_Resume(a1);
}

void sub_457C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setItemAtIndex:*(void *)(a1 + 48) isPlaying:0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 setShowingPlaying:0];
}

void sub_45E8(uint64_t a1)
{
  objc_super v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned __int8 v4 = [WeakRetained delegate];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [*(id *)(a1 + 32) _selectionStatsForSelectedIndex:*(void *)(a1 + 56)];
  id v13 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v13 count:1];
  [v4 siriViewController:v5 performAceCommands:v7];

  id v8 = objc_loadWeakRetained(v2);
  id v9 = [v8 delegate];
  id v10 = objc_loadWeakRetained(v2);
  id v11 = [*(id *)(a1 + 40) commands];
  [v9 siriViewController:v10 performAceCommands:v11];

  id v12 = objc_loadWeakRetained(v2);
  [v12 _resetPlayCounts];
}

void sub_5CD0(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    [v3 setImage:v5 forKey:v4];
    [*(id *)(a1 + 48) _configureUsingImage:v5];
  }
}

id sub_869C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setObject:@"preferred item" forKey:@"type"];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    [v2 setObject:v3 forKey:@"aceId"];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v2 setObject:v4 forKey:@"title"];
  }

  return v2;
}

id sub_8724(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setObject:@"failure commands" forKey:@"type"];
  uint64_t v3 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  [v2 setObject:v3 forKey:@"failure code"];

  return v2;
}

void sub_CD6C(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    [v3 setImage:v5 forKey:v4];
    [*(id *)(a1 + 48) _configureWithImage:v5 superViewWidth:CGRectGetWidth(*(CGRect *)(a1 + 56))];
  }
}

void sub_DA40(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[SiriAlternativeParaphraseSuggestionResultView initWithAlternativeSuggestionResult:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s SAARParaphrasedSuggestedResult has no command property: %@", (uint8_t *)&v2, 0x16u);
}

void sub_DACC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  __int16 v4 = "-[ACAssistantDisambiguationController collectionView:cellForItemAtIndexPath:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s _disambiguationItems %@ is empty when loading cells", (uint8_t *)&v3, 0x16u);
}

void sub_DB5C(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v4 = *a1;
  __int16 v5 = a2;
  int v6 = 136315650;
  uint64_t v7 = "-[ACAssistantDisambiguationController collectionView:layout:sizeForItemAtIndexPath:]";
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  id v11 = [a3 row];
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%s _disambiguationItems : %@ does not contain an item at index : %zd", (uint8_t *)&v6, 0x20u);
}

void sub_DC24(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[SiriAlternativeParaphraseAlternativeResultView initWithAlternativeResult:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s SAARParaphrasedAlternativeResult has no command property: %@", (uint8_t *)&v2, 0x16u);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t FBSOpenApplicationErrorCodeToString()
{
  return _FBSOpenApplicationErrorCodeToString();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SiriLanguageIsRTL()
{
  return _SiriLanguageIsRTL();
}

uint64_t SiriUIIsCompactWidth()
{
  return _SiriUIIsCompactWidth();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__attributedString(void *a1, const char *a2, ...)
{
  return [a1 _attributedString];
}

id objc_msgSend__buttonPlayImage(void *a1, const char *a2, ...)
{
  return [a1 _buttonPlayImage];
}

id objc_msgSend__buttonStopImage(void *a1, const char *a2, ...)
{
  return [a1 _buttonStopImage];
}

id objc_msgSend__cancelAutomaticConfirmation(void *a1, const char *a2, ...)
{
  return [a1 _cancelAutomaticConfirmation];
}

id objc_msgSend__cancelCommands(void *a1, const char *a2, ...)
{
  return [a1 _cancelCommands];
}

id objc_msgSend__configureContent(void *a1, const char *a2, ...)
{
  return [a1 _configureContent];
}

id objc_msgSend__emitButtonInteraction(void *a1, const char *a2, ...)
{
  return [a1 _emitButtonInteraction];
}

id objc_msgSend__hasScheduledAutomaticConfirmation(void *a1, const char *a2, ...)
{
  return [a1 _hasScheduledAutomaticConfirmation];
}

id objc_msgSend__picker(void *a1, const char *a2, ...)
{
  return [a1 _picker];
}

id objc_msgSend__pickerController(void *a1, const char *a2, ...)
{
  return [a1 _pickerController];
}

id objc_msgSend__privateDelegate(void *a1, const char *a2, ...)
{
  return [a1 _privateDelegate];
}

id objc_msgSend__pronunciationItems(void *a1, const char *a2, ...)
{
  return [a1 _pronunciationItems];
}

id objc_msgSend__removeFromTranscript(void *a1, const char *a2, ...)
{
  return [a1 _removeFromTranscript];
}

id objc_msgSend__resetPlayCounts(void *a1, const char *a2, ...)
{
  return [a1 _resetPlayCounts];
}

id objc_msgSend__scheduleAutomaticConfirmation(void *a1, const char *a2, ...)
{
  return [a1 _scheduleAutomaticConfirmation];
}

id objc_msgSend__selectNoneCommands(void *a1, const char *a2, ...)
{
  return [a1 _selectNoneCommands];
}

id objc_msgSend__showsConfirmButton(void *a1, const char *a2, ...)
{
  return [a1 _showsConfirmButton];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_aceId(void *a1, const char *a2, ...)
{
  return [a1 aceId];
}

id objc_msgSend_aceObject(void *a1, const char *a2, ...)
{
  return [a1 aceObject];
}

id objc_msgSend_allConfirmationOptions(void *a1, const char *a2, ...)
{
  return [a1 allConfirmationOptions];
}

id objc_msgSend_alternateProviderResults(void *a1, const char *a2, ...)
{
  return [a1 alternateProviderResults];
}

id objc_msgSend_alternativeResultViews(void *a1, const char *a2, ...)
{
  return [a1 alternativeResultViews];
}

id objc_msgSend_appIcon(void *a1, const char *a2, ...)
{
  return [a1 appIcon];
}

id objc_msgSend_appIdentifyingInfo(void *a1, const char *a2, ...)
{
  return [a1 appIdentifyingInfo];
}

id objc_msgSend_appPunchOut(void *a1, const char *a2, ...)
{
  return [a1 appPunchOut];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autoConfirmDelay(void *a1, const char *a2, ...)
{
  return [a1 autoConfirmDelay];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return [a1 button];
}

id objc_msgSend_buttonWithLightWeightFont(void *a1, const char *a2, ...)
{
  return [a1 buttonWithLightWeightFont];
}

id objc_msgSend_buttonWithMediumWeightFont(void *a1, const char *a2, ...)
{
  return [a1 buttonWithMediumWeightFont];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_cancelCommands(void *a1, const char *a2, ...)
{
  return [a1 cancelCommands];
}

id objc_msgSend_cellClass(void *a1, const char *a2, ...)
{
  return [a1 cellClass];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_collectionViewContentSize(void *a1, const char *a2, ...)
{
  return [a1 collectionViewContentSize];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return [a1 collectionViewLayout];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_commands(void *a1, const char *a2, ...)
{
  return [a1 commands];
}

id objc_msgSend_confirmButton(void *a1, const char *a2, ...)
{
  return [a1 confirmButton];
}

id objc_msgSend_confirmCommands(void *a1, const char *a2, ...)
{
  return [a1 confirmCommands];
}

id objc_msgSend_confirmText(void *a1, const char *a2, ...)
{
  return [a1 confirmText];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createViewArray(void *a1, const char *a2, ...)
{
  return [a1 createViewArray];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultBrowserBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 defaultBrowserBundleIdentifier];
}

id objc_msgSend_defaultCellHeight(void *a1, const char *a2, ...)
{
  return [a1 defaultCellHeight];
}

id objc_msgSend_defaultHeight(void *a1, const char *a2, ...)
{
  return [a1 defaultHeight];
}

id objc_msgSend_defaultHeightWithHeading(void *a1, const char *a2, ...)
{
  return [a1 defaultHeightWithHeading];
}

id objc_msgSend_defaultHeightWithImageView(void *a1, const char *a2, ...)
{
  return [a1 defaultHeightWithImageView];
}

id objc_msgSend_defaultHeightWithSubtitle(void *a1, const char *a2, ...)
{
  return [a1 defaultHeightWithSubtitle];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_denyCommands(void *a1, const char *a2, ...)
{
  return [a1 denyCommands];
}

id objc_msgSend_denyText(void *a1, const char *a2, ...)
{
  return [a1 denyText];
}

id objc_msgSend_desiredHeightForFooterView(void *a1, const char *a2, ...)
{
  return [a1 desiredHeightForFooterView];
}

id objc_msgSend_disambiguationItem(void *a1, const char *a2, ...)
{
  return [a1 disambiguationItem];
}

id objc_msgSend_disambiguationKey(void *a1, const char *a2, ...)
{
  return [a1 disambiguationKey];
}

id objc_msgSend_disambiguationLists(void *a1, const char *a2, ...)
{
  return [a1 disambiguationLists];
}

id objc_msgSend_displayText(void *a1, const char *a2, ...)
{
  return [a1 displayText];
}

id objc_msgSend_domainObjectPicker(void *a1, const char *a2, ...)
{
  return [a1 domainObjectPicker];
}

id objc_msgSend_edgeInsets(void *a1, const char *a2, ...)
{
  return [a1 edgeInsets];
}

id objc_msgSend_extraDisambiguationSubText(void *a1, const char *a2, ...)
{
  return [a1 extraDisambiguationSubText];
}

id objc_msgSend_extraDisambiguationText(void *a1, const char *a2, ...)
{
  return [a1 extraDisambiguationText];
}

id objc_msgSend_fallbackCommands(void *a1, const char *a2, ...)
{
  return [a1 fallbackCommands];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_groupTitle(void *a1, const char *a2, ...)
{
  return [a1 groupTitle];
}

id objc_msgSend_hasStarColumn(void *a1, const char *a2, ...)
{
  return [a1 hasStarColumn];
}

id objc_msgSend_headingText(void *a1, const char *a2, ...)
{
  return [a1 headingText];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_instrumentationTurnIdentifier(void *a1, const char *a2, ...)
{
  return [a1 instrumentationTurnIdentifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interactionId(void *a1, const char *a2, ...)
{
  return [a1 interactionId];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateLayout];
}

id objc_msgSend_isLastRow(void *a1, const char *a2, ...)
{
  return [a1 isLastRow];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_isVirgin(void *a1, const char *a2, ...)
{
  return [a1 isVirgin];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_keyline(void *a1, const char *a2, ...)
{
  return [a1 keyline];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelWithLightWeightRegularFont(void *a1, const char *a2, ...)
{
  return [a1 labelWithLightWeightRegularFont];
}

id objc_msgSend_labelWithMediumWeightSubtextFont(void *a1, const char *a2, ...)
{
  return [a1 labelWithMediumWeightSubtextFont];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leftButton(void *a1, const char *a2, ...)
{
  return [a1 leftButton];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return [a1 loadView];
}

id objc_msgSend_logDisambiguationDismissedEvent(void *a1, const char *a2, ...)
{
  return [a1 logDisambiguationDismissedEvent];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_orthography(void *a1, const char *a2, ...)
{
  return [a1 orthography];
}

id objc_msgSend_prepareForReuse(void *a1, const char *a2, ...)
{
  return [a1 prepareForReuse];
}

id objc_msgSend_pronunciations(void *a1, const char *a2, ...)
{
  return [a1 pronunciations];
}

id objc_msgSend_property(void *a1, const char *a2, ...)
{
  return [a1 property];
}

id objc_msgSend_providerImage(void *a1, const char *a2, ...)
{
  return [a1 providerImage];
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return [a1 providerName];
}

id objc_msgSend_punchOutName(void *a1, const char *a2, ...)
{
  return [a1 punchOutName];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 punctuationCharacterSet];
}

id objc_msgSend_regions(void *a1, const char *a2, ...)
{
  return [a1 regions];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resourceUrl(void *a1, const char *a2, ...)
{
  return [a1 resourceUrl];
}

id objc_msgSend_responseText(void *a1, const char *a2, ...)
{
  return [a1 responseText];
}

id objc_msgSend_resultView(void *a1, const char *a2, ...)
{
  return [a1 resultView];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_rightButton(void *a1, const char *a2, ...)
{
  return [a1 rightButton];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_selectNoneCommands(void *a1, const char *a2, ...)
{
  return [a1 selectNoneCommands];
}

id objc_msgSend_selectNoneText(void *a1, const char *a2, ...)
{
  return [a1 selectNoneText];
}

id objc_msgSend_selectionText(void *a1, const char *a2, ...)
{
  return [a1 selectionText];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return [a1 semanticContentAttribute];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedAnalytics(void *a1, const char *a2, ...)
{
  return [a1 sharedAnalytics];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedURLSession(void *a1, const char *a2, ...)
{
  return [a1 sharedURLSession];
}

id objc_msgSend_showImmediately(void *a1, const char *a2, ...)
{
  return [a1 showImmediately];
}

id objc_msgSend_showKeyLine(void *a1, const char *a2, ...)
{
  return [a1 showKeyLine];
}

id objc_msgSend_showingPlaying(void *a1, const char *a2, ...)
{
  return [a1 showingPlaying];
}

id objc_msgSend_showsFavoriteStar(void *a1, const char *a2, ...)
{
  return [a1 showsFavoriteStar];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_snippet(void *a1, const char *a2, ...)
{
  return [a1 snippet];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_suggestedResults(void *a1, const char *a2, ...)
{
  return [a1 suggestedResults];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleBoldedRange(void *a1, const char *a2, ...)
{
  return [a1 titleBoldedRange];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_tts(void *a1, const char *a2, ...)
{
  return [a1 tts];
}

id objc_msgSend_turnIdentifier(void *a1, const char *a2, ...)
{
  return [a1 turnIdentifier];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateConstraintConstants(void *a1, const char *a2, ...)
{
  return [a1 updateConstraintConstants];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllerExpectedWidth(void *a1, const char *a2, ...)
{
  return [a1 viewControllerExpectedWidth];
}

id objc_msgSend_views(void *a1, const char *a2, ...)
{
  return [a1 views];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}