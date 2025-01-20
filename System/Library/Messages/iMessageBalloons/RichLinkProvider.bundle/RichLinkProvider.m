void sub_2F04(uint64_t a1)
{
  id v2;
  uint64_t vars8;

  v2 = [*(id *)(a1 + 32) customizationPickerDelegate];
  [v2 customizationPickerControllerDidPresent:*(void *)(a1 + 40)];
}

void sub_3110(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) customizationPickerDelegate];
  [v2 customizationPickerControllerDidDismiss:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
}

BOOL sub_324C(void *a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_32F0;
  v6[3] = &unk_C340;
  id v7 = a1;
  id v3 = v7;
  BOOL v4 = [a2 indexOfObjectPassingTest:v6] != (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

BOOL sub_32F0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) caseInsensitiveCompare:a2] == 0;
}

id sub_3318()
{
  if (qword_12088 != -1) {
    dispatch_once(&qword_12088, &stru_C380);
  }
  v0 = (void *)qword_12090;

  return v0;
}

void sub_336C(id a1)
{
  qword_12090 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id sub_33C8(void *a1)
{
  id v1 = a1;
  v2 = sub_3318();
  id v3 = [v2 localizedStringForKey:v1 value:v1 table:0];

  return v3;
}

id sub_3E40(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 56) isPlaceholder];
  if (result)
  {
    id v3 = LPLogChannelPlugin();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = *(void **)(a1 + 32);
      v5 = v3;
      v6 = [v4 messageGUID];
      int v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "RichLinkPluginDataSource<%@>: update watchdog timer fired", (uint8_t *)&v7, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 54) = 1;
    return [*(id *)(a1 + 32) dispatchMetadataUpdateToAllClients];
  }
  return result;
}

void sub_4038(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = +[NSProcessInfo processInfo];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_4120;
  v10[3] = &unk_C3F8;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 performExpiringActivityWithReason:@"com.apple.LinkPresentation.RichLinkPluginDataSource.Fetch" usingBlock:v10];
}

void sub_4120(uint64_t a1, int a2)
{
  BOOL v4 = LPLogChannelPlugin();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      int v7 = v4;
      id v8 = [v6 messageGUID];
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "RichLinkPluginDataSource<%@>: background activity expired", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      id v9 = *(void **)(a1 + 32);
      v10 = v4;
      id v11 = [v9 messageGUID];
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "RichLinkPluginDataSource<%@>: starting background activity", buf, 0xCu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_42D0;
    block[3] = &unk_C3D0;
    id v12 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v14 = v12;
    id v15 = *(id *)(a1 + 48);
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_42D0(void *a1)
{
  objc_storeWeak((id *)(a1[4] + 8), 0);
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  return [v2 _didFetchMetadata:v3 error:v4];
}

void sub_46D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_47B8;
  block[3] = &unk_C448;
  int v7 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v11 = v5;
  char v14 = *(unsigned char *)(a1 + 48);
  id v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_47B8(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), 0);
  id v2 = *(id *)(a1 + 40);
  if (*(unsigned char *)(a1 + 64))
  {
    id v5 = v2;
    id v3 = [*(id *)(a1 + 48) copy];
    id v4 = *(id *)(a1 + 48);

    [v4 _copyPropertiesFrom:*(void *)(a1 + 40) onlyUpgradeFields:1];
    [*(id *)(a1 + 32) postProcessMetadataUpgradedByCompleteRefetch:v4 originalMetadata:v3];

    id v2 = v4;
  }
  id v6 = v2;
  [*(id *)(a1 + 32) _didFetchMetadata:v2 error:*(void *)(a1 + 56)];
}

void sub_5384(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v6), "rendererForRichLinkPluginDataSource:", *(void *)(a1 + 32), (void)v8);
        [v7 setNeedsLayout];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void sub_6948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 136));
  _Unwind_Resume(a1);
}

void sub_69B0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 55) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_6A6C;
  v4[3] = &unk_C3A8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [WeakRetained _setCollaborationFooterViewModel:v3 action:v4];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) pluginPayloadShouldSendCollaboration];
  }
}

id sub_6A6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) chooseOptions];
}

void sub_6A74(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 55) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setCollaborationFooterViewModel:0 action:0];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) pluginPayloadShouldSendCopy];
  }
}

id sub_6AF8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 55) = 1;
  return [*(id *)(a1 + 32) chooseOptions];
}

void sub_6E6C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_6E8C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "RichLinkPluginController: Failed to find a view controller for full screen presentation.", v1, 2u);
}

void sub_6ED0(void *a1, void *a2, double a3)
{
  uint64_t v5 = a1;
  id v6 = [a2 messageGUID];
  int v7 = 138412546;
  long long v8 = v6;
  __int16 v9 = 2048;
  double v10 = a3;
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "RichLinkPluginDataSource<%@>: starting update watchdog timer with %f seconds remaining", (uint8_t *)&v7, 0x16u);
}

void sub_6F90(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 messageGUID];
  sub_6E6C(&dword_0, v5, v6, "RichLinkPluginDataSource<%@>: fetched metadata before initial send. UPDATING payload on datasource.", v7, v8, v9, v10, 2u);
}

void sub_7028(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 messageGUID];
  sub_6E6C(&dword_0, v5, v6, "RichLinkPluginDataSource<%@>: invalidating size", v7, v8, v9, v10, 2u);
}

uint64_t CKResizableBalloonMask()
{
  return _CKResizableBalloonMask();
}

uint64_t LPLogChannelPlugin()
{
  return _LPLogChannelPlugin();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__dominantBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 _dominantBackgroundColor];
}

id objc_msgSend__flattenedMetadata(void *a1, const char *a2, ...)
{
  return [a1 _flattenedMetadata];
}

id objc_msgSend__metadataVariants(void *a1, const char *a2, ...)
{
  return [a1 _metadataVariants];
}

id objc_msgSend__resetIncompleteState(void *a1, const char *a2, ...)
{
  return [a1 _resetIncompleteState];
}

id objc_msgSend__selectedVariantIndex(void *a1, const char *a2, ...)
{
  return [a1 _selectedVariantIndex];
}

id objc_msgSend__tapticEngine(void *a1, const char *a2, ...)
{
  return [a1 _tapticEngine];
}

id objc_msgSend_actionURL(void *a1, const char *a2, ...)
{
  return [a1 actionURL];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_collaborationMetadata(void *a1, const char *a2, ...)
{
  return [a1 collaborationMetadata];
}

id objc_msgSend_collaborationOptionsSummary(void *a1, const char *a2, ...)
{
  return [a1 collaborationOptionsSummary];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createEmptyMetadataWithOriginalURL(void *a1, const char *a2, ...)
{
  return [a1 createEmptyMetadataWithOriginalURL];
}

id objc_msgSend_createRichLinkView(void *a1, const char *a2, ...)
{
  return [a1 createRichLinkView];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_customizationPickerDelegate(void *a1, const char *a2, ...)
{
  return [a1 customizationPickerDelegate];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dispatchMetadataUpdateToAllClients(void *a1, const char *a2, ...)
{
  return [a1 dispatchMetadataUpdateToAllClients];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_ensureValidCollaborationState(void *a1, const char *a2, ...)
{
  return [a1 ensureValidCollaborationState];
}

id objc_msgSend_entryViewLinkViewDiscardButtonDiameter(void *a1, const char *a2, ...)
{
  return [a1 entryViewLinkViewDiscardButtonDiameter];
}

id objc_msgSend_hasPendingFetch(void *a1, const char *a2, ...)
{
  return [a1 hasPendingFetch];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_imMessage(void *a1, const char *a2, ...)
{
  return [a1 imMessage];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCollaboration(void *a1, const char *a2, ...)
{
  return [a1 isCollaboration];
}

id objc_msgSend_isCollaborationLink(void *a1, const char *a2, ...)
{
  return [a1 isCollaborationLink];
}

id objc_msgSend_isDeferredSend(void *a1, const char *a2, ...)
{
  return [a1 isDeferredSend];
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return [a1 isFromMe];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_maxWidthForSourceView(void *a1, const char *a2, ...)
{
  return [a1 maxWidthForSourceView];
}

id objc_msgSend_messageGUID(void *a1, const char *a2, ...)
{
  return [a1 messageGUID];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metadataForDisplay(void *a1, const char *a2, ...)
{
  return [a1 metadataForDisplay];
}

id objc_msgSend_metadataHasContent(void *a1, const char *a2, ...)
{
  return [a1 metadataHasContent];
}

id objc_msgSend_metadataIsLikelyFinal(void *a1, const char *a2, ...)
{
  return [a1 metadataIsLikelyFinal];
}

id objc_msgSend_metadataIsViableForDisplay(void *a1, const char *a2, ...)
{
  return [a1 metadataIsViableForDisplay];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsCompleteFetch(void *a1, const char *a2, ...)
{
  return [a1 needsCompleteFetch];
}

id objc_msgSend_needsResize(void *a1, const char *a2, ...)
{
  return [a1 needsResize];
}

id objc_msgSend_needsSubresourceFetch(void *a1, const char *a2, ...)
{
  return [a1 needsSubresourceFetch];
}

id objc_msgSend_originalURL(void *a1, const char *a2, ...)
{
  return [a1 originalURL];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_payloadCollaborationType(void *a1, const char *a2, ...)
{
  return [a1 payloadCollaborationType];
}

id objc_msgSend_payloadInShelf(void *a1, const char *a2, ...)
{
  return [a1 payloadInShelf];
}

id objc_msgSend_pluginPayload(void *a1, const char *a2, ...)
{
  return [a1 pluginPayload];
}

id objc_msgSend_pluginPayloadShouldSendCollaboration(void *a1, const char *a2, ...)
{
  return [a1 pluginPayloadShouldSendCollaboration];
}

id objc_msgSend_pluginPayloadShouldSendCopy(void *a1, const char *a2, ...)
{
  return [a1 pluginPayloadShouldSendCopy];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_previewSummary(void *a1, const char *a2, ...)
{
  return [a1 previewSummary];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_resolve(void *a1, const char *a2, ...)
{
  return [a1 resolve];
}

id objc_msgSend_richLink(void *a1, const char *a2, ...)
{
  return [a1 richLink];
}

id objc_msgSend_searchQuery(void *a1, const char *a2, ...)
{
  return [a1 searchQuery];
}

id objc_msgSend_sendAsCopy(void *a1, const char *a2, ...)
{
  return [a1 sendAsCopy];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return [a1 separatorColor];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedBehaviors(void *a1, const char *a2, ...)
{
  return [a1 sharedBehaviors];
}

id objc_msgSend_sizingView(void *a1, const char *a2, ...)
{
  return [a1 sizingView];
}

id objc_msgSend_specialization(void *a1, const char *a2, ...)
{
  return [a1 specialization];
}

id objc_msgSend_startUpdateWatchdogIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 startUpdateWatchdogIfNeeded];
}

id objc_msgSend_statusText(void *a1, const char *a2, ...)
{
  return [a1 statusText];
}

id objc_msgSend_statusTransformer(void *a1, const char *a2, ...)
{
  return [a1 statusTransformer];
}

id objc_msgSend_storeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 storeIdentifier];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_supportsCollaboration(void *a1, const char *a2, ...)
{
  return [a1 supportsCollaboration];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 verticalSizeClass];
}

id objc_msgSend_video(void *a1, const char *a2, ...)
{
  return [a1 video];
}

id objc_msgSend_viewControllerToPresent(void *a1, const char *a2, ...)
{
  return [a1 viewControllerToPresent];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}