id sub_1000020BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConstraintsForZKWBrowser];
}

void sub_100002518(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error inserting attachment to current coversation %@", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) requestPresentationStyle:0];
  [*(id *)(a1 + 32) _addResultToRecents:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
}

id sub_1000025F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestPresentationStyle:0];
}

void sub_1000025FC(uint64_t a1)
{
  id v2 = +[STSFeedbackReporter sharedInstance];
  [v2 didEngageResult:*(void *)(a1 + 32)];
}

void sub_100002654(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained engagementFeedbackBlock];

  if (v3)
  {
    id v5 = objc_loadWeakRetained(v1);
    int v4 = [v5 engagementFeedbackBlock];
    v4[2]();
  }
}

id sub_100002810(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConstraintsForSearchBrowser];
}

void sub_100002818(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setPresentationStyle:1];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) searchHeaderView];
  [v2 invalidateIntrinsicContentSize];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) view];
  [v3 setNeedsLayout];

  int v4 = +[STSFeedbackReporter sharedInstance];
  [v4 searchViewDidAppearWithEvent:21];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 32) searchHeaderView];
  id v5 = [v6 searchBar];
  [v5 becomeFirstResponder];
}

id sub_1000029AC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) searchHeaderView];
  id v3 = [v2 searchBar];
  [v3 setText:*(void *)(a1 + 40)];

  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[2];
  uint64_t v6 = v4[4];
  v8[4] = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002AB0;
  v9[3] = &unk_100008280;
  v9[4] = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002AB8;
  v8[3] = &unk_100008280;
  return [v4 _transitionContentFromViewController:v5 toViewController:v6 animations:v9 completion:v8];
}

id sub_100002AB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConstraintsForSearchBrowser];
}

void sub_100002AB8(uint64_t a1)
{
  id v2 = +[STSFeedbackReporter sharedInstance];
  [v2 searchViewDidAppearWithEvent:20];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) searchHeaderView];
  id v3 = [v4 searchBar];
  [v3 becomeFirstResponder];
}

void sub_100002C34(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  uint64_t v4 = v2[4];
  v6[4] = v2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002D20;
  v7[3] = &unk_100008280;
  v7[4] = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002D28;
  v6[3] = &unk_100008280;
  [v2 _transitionContentFromViewController:v3 toViewController:v4 animations:v7 completion:v6];
  uint64_t v5 = +[STSFeedbackReporter sharedInstance];
  [v5 didEngageResult:*(void *)(a1 + 40)];
}

id sub_100002D20(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConstraintsForSearchBrowser];
}

void sub_100002D28(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) pickerViewController];
  v1 = [v2 pickerView];
  [v1 setNeedsLayout];
}

void sub_100002E80(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  uint64_t v4 = v2[4];
  v6[4] = v2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002F6C;
  v7[3] = &unk_100008280;
  v7[4] = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002F74;
  v6[3] = &unk_100008280;
  [v2 _transitionContentFromViewController:v3 toViewController:v4 animations:v7 completion:v6];
  uint64_t v5 = +[STSFeedbackReporter sharedInstance];
  [v5 didSearchWithSuggestedQuery:*(void *)(a1 + 40)];
}

id sub_100002F6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConstraintsForSearchBrowser];
}

void sub_100002F74(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) pickerViewController];
  v1 = [v2 pickerView];
  [v1 setNeedsLayout];
}

id sub_100003398(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[4];
  uint64_t v3 = v1[2];
  v5[4] = v1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003458;
  v6[3] = &unk_100008280;
  v6[4] = v1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003460;
  v5[3] = &unk_100008280;
  return [v1 _transitionContentFromViewController:v2 toViewController:v3 animations:v6 completion:v5];
}

id sub_100003458(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConstraintsForZKWBrowser];
}

id sub_100003460(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) clear];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v2 enableSearchButton];
}

id sub_1000034AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConstraintsForZKWBrowser];
}

id sub_1000034B4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) clear];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v2 enableSearchButton];
}

void sub_1000035DC(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003660;
  block[3] = &unk_100008280;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100003660(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) searchHeaderView];
  uint64_t v3 = [v2 searchBar];
  unsigned __int8 v4 = [v3 isFirstResponder];

  if ((v4 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) searchHeaderView];
    uint64_t v5 = [v6 searchBar];
    [v5 becomeFirstResponder];
  }
}

uint64_t sub_1000039A4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromParentViewController];
  id v2 = [*(id *)(a1 + 40) view];
  uint64_t v3 = [*(id *)(a1 + 48) view];
  [v2 setContentView:v3];

  [*(id *)(a1 + 48) didMoveToParentViewController:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_10000401C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(a1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100004C90((uint64_t)v2);
    }
    objc_end_catch();
    JUMPOUT(0x100003FBCLL);
  }
  _Unwind_Resume(a1);
}

id sub_100004060(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConstraintsForZKWBrowser];
}

uint64_t sub_100004068(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) searchResultForDict:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return _objc_release_x1();
}

BOOL sub_1000042C8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  unsigned __int8 v4 = [v2 identifier];
  uint64_t v5 = [v3 identifier];

  BOOL v6 = [v4 caseInsensitiveCompare:v5] == 0;
  return v6;
}

uint64_t sub_100004430(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) dictForSearchResult:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return _objc_release_x1();
}

void sub_100004C90(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error loading recents %@", (uint8_t *)&v1, 0xCu);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
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
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return [a1 _setup];
}

id objc_msgSend__updatePickerBottomInset(void *a1, const char *a2, ...)
{
  return [a1 _updatePickerBottomInset];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cancelImageDownloads(void *a1, const char *a2, ...)
{
  return [a1 cancelImageDownloads];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_conversationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 conversationIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_didEngageProviderLogo(void *a1, const char *a2, ...)
{
  return [a1 didEngageProviderLogo];
}

id objc_msgSend_engagementFeedbackBlock(void *a1, const char *a2, ...)
{
  return [a1 engagementFeedbackBlock];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_fetchCategories(void *a1, const char *a2, ...)
{
  return [a1 fetchCategories];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return [a1 imageURL];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 isFirstResponder];
}

id objc_msgSend_isPencilInputExpected(void *a1, const char *a2, ...)
{
  return [a1 isPencilInputExpected];
}

id objc_msgSend_isPickerVisible(void *a1, const char *a2, ...)
{
  return [a1 isPickerVisible];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_performZKWSearchQuery(void *a1, const char *a2, ...)
{
  return [a1 performZKWSearchQuery];
}

id objc_msgSend_pickerView(void *a1, const char *a2, ...)
{
  return [a1 pickerView];
}

id objc_msgSend_pickerViewController(void *a1, const char *a2, ...)
{
  return [a1 pickerViewController];
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return [a1 presentationStyle];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_requestExpandedCompletion(void *a1, const char *a2, ...)
{
  return [a1 requestExpandedCompletion];
}

id objc_msgSend_resetContent(void *a1, const char *a2, ...)
{
  return [a1 resetContent];
}

id objc_msgSend_resultType(void *a1, const char *a2, ...)
{
  return [a1 resultType];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_saveRecents(void *a1, const char *a2, ...)
{
  return [a1 saveRecents];
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return [a1 searchBar];
}

id objc_msgSend_searchHeaderView(void *a1, const char *a2, ...)
{
  return [a1 searchHeaderView];
}

id objc_msgSend_searchViewDidDisappear(void *a1, const char *a2, ...)
{
  return [a1 searchViewDidDisappear];
}

id objc_msgSend_secondaryTitle(void *a1, const char *a2, ...)
{
  return [a1 secondaryTitle];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showCategories(void *a1, const char *a2, ...)
{
  return [a1 showCategories];
}

id objc_msgSend_snapshotImage(void *a1, const char *a2, ...)
{
  return [a1 snapshotImage];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_storeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 storeIdentifier];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_thumbnail(void *a1, const char *a2, ...)
{
  return [a1 thumbnail];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlValue(void *a1, const char *a2, ...)
{
  return [a1 urlValue];
}

id objc_msgSend_videoURL(void *a1, const char *a2, ...)
{
  return [a1 videoURL];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_willTransitionToPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 willTransitionToPresentationStyle:];
}