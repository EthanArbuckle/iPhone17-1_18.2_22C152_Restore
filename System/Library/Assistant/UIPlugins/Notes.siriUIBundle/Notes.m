void sub_351C(id a1)
{
  +[ICPluginUtilities setupNoteContextWithOptions:580];
}

void sub_7248(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  performBlockOnMainThread();
}

void sub_72DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) configuration];
  id v3 = [v2 uniqueKey];
  v4 = [*(id *)(a1 + 40) currentThumbnailConfigurationUniqueKey];
  unsigned int v5 = [v3 isEqual:v4];

  if (!v5) {
    return;
  }
  uint64_t v6 = [*(id *)(a1 + 32) image];
  if (v6)
  {
    v7 = (void *)v6;
    unsigned int v8 = [*(id *)(a1 + 40) isThumbnailPresent];

    if (v8)
    {
      v9 = [*(id *)(a1 + 32) image];
      v10 = [*(id *)(a1 + 40) thumbnailImageView];
      [v10 setImage:v9];

      if (+[UIDevice ic_isVision]) {
        +[UIColor ic_noteEditorBackgroundColor];
      }
      else {
      v16 = +[UIColor secondarySystemGroupedBackgroundColor];
      }
      v17 = [*(id *)(a1 + 40) thumbnailImageView];
      [v17 setBackgroundColor:v16];

      objc_msgSend(*(id *)(a1 + 40), "ic_hairlineWidth");
      double v19 = v18;
      v20 = [*(id *)(a1 + 40) thumbnailImageView];
      v21 = [v20 layer];
      [v21 setBorderWidth:v19];

      v22 = [*(id *)(a1 + 40) thumbnailImageView];
      [v22 setHidden:0];

      v23 = [*(id *)(a1 + 40) thumbnailImageView];
      id v24 = [v23 contentMode];
      id v25 = [*(id *)(a1 + 32) preferredContentMode];

      if (v24 == v25) {
        return;
      }
      id v26 = [*(id *)(a1 + 32) preferredContentMode];
      id v27 = [*(id *)(a1 + 40) thumbnailImageView];
      [v27 setContentMode:v26];
LABEL_14:

      return;
    }
  }
  v11 = [*(id *)(a1 + 40) thumbnailImageView];
  v12 = [v11 image];

  if (v12)
  {
    v13 = [*(id *)(a1 + 40) thumbnailImageView];
    [v13 setImage:0];
  }
  v14 = [*(id *)(a1 + 40) thumbnailImageView];
  unsigned __int8 v15 = [v14 isHidden];

  if ((v15 & 1) == 0)
  {
    id v27 = [*(id *)(a1 + 40) thumbnailImageView];
    [v27 setHidden:1];
    goto LABEL_14;
  }
}

void sub_7728(uint64_t a1)
{
  id v5 = +[UIColor quaternaryLabelColor];
  id v2 = [v5 CGColor];
  id v3 = [*(id *)(a1 + 32) thumbnailImageView];
  v4 = [v3 layer];
  [v4 setBorderColor:v2];
}

void sub_7E70(id a1)
{
  id v3 = [objc_alloc((Class)NoteContext) initWithPrivateQueue];
  uint64_t v1 = [v3 managedObjectContext];
  id v2 = (void *)qword_20D58;
  qword_20D58 = v1;
}

void sub_7F20(id a1)
{
  id v3 = +[ICNoteContext sharedContext];
  uint64_t v1 = [v3 workerManagedObjectContext];
  id v2 = (void *)qword_20D68;
  qword_20D68 = v1;
}

void sub_7FD0(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.notes.load-data-queue", attr);
  id v3 = (void *)qword_20D78;
  qword_20D78 = (uint64_t)v2;
}

void sub_841C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_84B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_85B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadDataWithContext:*(void *)(a1 + 40)];
}

void sub_8678(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) note];
  unsigned __int8 v4 = [v3 isModernNote];
  if ((v4 & 1) != 0
    || ([*(id *)(a1 + 32) invitation], (uint64_t v1 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = [(id)objc_opt_class() modernBackgroundContext];
    if (v4) {
      goto LABEL_7;
    }
  }
  else
  {
    id v5 = [(id)objc_opt_class() legacyBackgroundContext];
  }

LABEL_7:
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8790;
  v8[3] = &unk_18588;
  uint64_t v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [v7 performBlock:v8];
}

uint64_t sub_8790(uint64_t a1)
{
  [*(id *)(a1 + 32) loadDataWithContext:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_92F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_9898(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_A764(uint64_t a1)
{
  [*(id *)(a1 + 32) setStalenessInterval:0.0];
  id v1 = +[ICNoteContext sharedContext];
  [v1 refreshAll];
}

uint64_t sub_AB1C()
{
  return performBlockOnMainThread();
}

id sub_AB8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromConfiguration];
}

id sub_B260(uint64_t a1)
{
  [*(id *)(a1 + 32) updateViewStateProperties];
  dispatch_queue_t v2 = *(void **)(a1 + 32);

  return [v2 synchronouslyLoadConfigurationDataAndUpdate];
}

void sub_B7A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_B7C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_B7D4(uint64_t a1)
{
}

id sub_B7DC(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)SANoteObject);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned __int8 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) title];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTitle:v5];

  uint64_t v6 = [*(id *)(a1 + 32) modificationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLastModifiedDate:v6];

  id v7 = [*(id *)(a1 + 32) creationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCreatedDate:v7];

  unsigned int v8 = +[ICAppURLUtilities appURLForNote:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIdentifier:v8];

  id v9 = [*(id *)(a1 + 32) isPasswordProtected];
  id v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v10 setRestricted:v9];
}

id sub_B8EC(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)SANoteObject);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned __int8 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) title];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTitle:v5];

  uint64_t v6 = [*(id *)(a1 + 32) modificationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLastModifiedDate:v6];

  id v7 = [*(id *)(a1 + 32) creationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCreatedDate:v7];

  unsigned int v8 = +[ICAppURLUtilities appURLForHTMLNote:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIdentifier:v8];

  id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v9 setRestricted:0];
}

void sub_BCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_BCEC(void *a1)
{
  id v6 = +[ICNote notesMatchingPredicate:a1[4] context:a1[5]];
  id v2 = [v6 firstObject];
  uint64_t v3 = ICProtocolCast();
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_BD84(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) existingObjectWithID:*(void *)(a1 + 40) error:0];
  uint64_t v2 = ICProtocolCast();
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_C218(void *a1, void *a2, NSObject *a3)
{
  id v5 = [a1 description];
  id v6 = [v5 UTF8String];
  id v7 = [a2 contents];
  int v8 = 136315394;
  id v9 = v6;
  __int16 v10 = 2080;
  id v11 = [v7 UTF8String];
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "NotesAssistantNoteProvider initializing with note identifier %s, contents %s", (uint8_t *)&v8, 0x16u);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t ICAccessibilityAccessibilityLargerTextSizesEnabled()
{
  return _ICAccessibilityAccessibilityLargerTextSizesEnabled();
}

uint64_t ICDynamicCast()
{
  return _ICDynamicCast();
}

uint64_t ICNotesAppBundleIdentifier()
{
  return _ICNotesAppBundleIdentifier();
}

uint64_t ICProtocolCast()
{
  return _ICProtocolCast();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NotesAppURLForNote()
{
  return _NotesAppURLForNote();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return _UIAccessibilityDarkerSystemColorsEnabled();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __ICAccessibilityStringForVariables()
{
  return ___ICAccessibilityStringForVariables();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t performBlockOnMainThread()
{
  return _performBlockOnMainThread();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_ICDarkenedTintColor(void *a1, const char *a2, ...)
{
  return [a1 ICDarkenedTintColor];
}

id objc_msgSend_ICListStatusIndicatorColor(void *a1, const char *a2, ...)
{
  return [a1 ICListStatusIndicatorColor];
}

id objc_msgSend_ICTintColor(void *a1, const char *a2, ...)
{
  return [a1 ICTintColor];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__splitViewControllerContext(void *a1, const char *a2, ...)
{
  return [a1 _splitViewControllerContext];
}

id objc_msgSend_accessibilityCustomActionsDelegate(void *a1, const char *a2, ...)
{
  return [a1 accessibilityCustomActionsDelegate];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return [a1 accountName];
}

id objc_msgSend_addNotificationObservers(void *a1, const char *a2, ...)
{
  return [a1 addNotificationObservers];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_attributedContentInfoText(void *a1, const char *a2, ...)
{
  return [a1 attributedContentInfoText];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return [a1 attributedText];
}

id objc_msgSend_attributedTitle(void *a1, const char *a2, ...)
{
  return [a1 attributedTitle];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bottomThumbnailConstraints(void *a1, const char *a2, ...)
{
  return [a1 bottomThumbnailConstraints];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cell(void *a1, const char *a2, ...)
{
  return [a1 cell];
}

id objc_msgSend_cellDropState(void *a1, const char *a2, ...)
{
  return [a1 cellDropState];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearData(void *a1, const char *a2, ...)
{
  return [a1 clearData];
}

id objc_msgSend_collaboratorsBadgeView(void *a1, const char *a2, ...)
{
  return [a1 collaboratorsBadgeView];
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

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return [a1 commonInit];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationState(void *a1, const char *a2, ...)
{
  return [a1 configurationState];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentAsPlainTextPreservingNewlines(void *a1, const char *a2, ...)
{
  return [a1 contentAsPlainTextPreservingNewlines];
}

id objc_msgSend_contentDescription(void *a1, const char *a2, ...)
{
  return [a1 contentDescription];
}

id objc_msgSend_contentInfoText(void *a1, const char *a2, ...)
{
  return [a1 contentInfoText];
}

id objc_msgSend_contentMode(void *a1, const char *a2, ...)
{
  return [a1 contentMode];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createLabel(void *a1, const char *a2, ...)
{
  return [a1 createLabel];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentStatus(void *a1, const char *a2, ...)
{
  return [a1 currentStatus];
}

id objc_msgSend_currentThumbnailConfigurationUniqueKey(void *a1, const char *a2, ...)
{
  return [a1 currentThumbnailConfigurationUniqueKey];
}

id objc_msgSend_currentThumbnailLocation(void *a1, const char *a2, ...)
{
  return [a1 currentThumbnailLocation];
}

id objc_msgSend_currentThumbnailSize(void *a1, const char *a2, ...)
{
  return [a1 currentThumbnailSize];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 currentTraitCollection];
}

id objc_msgSend_currentWidth(void *a1, const char *a2, ...)
{
  return [a1 currentWidth];
}

id objc_msgSend_dateLabel(void *a1, const char *a2, ...)
{
  return [a1 dateLabel];
}

id objc_msgSend_dateString(void *a1, const char *a2, ...)
{
  return [a1 dateString];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultSystemImageName(void *a1, const char *a2, ...)
{
  return [a1 defaultSystemImageName];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_disambiguationItem(void *a1, const char *a2, ...)
{
  return [a1 disambiguationItem];
}

id objc_msgSend_displayedAvatarCount(void *a1, const char *a2, ...)
{
  return [a1 displayedAvatarCount];
}

id objc_msgSend_estimatedSummaryLabelFrame(void *a1, const char *a2, ...)
{
  return [a1 estimatedSummaryLabelFrame];
}

id objc_msgSend_estimatedTitleLabelFrame(void *a1, const char *a2, ...)
{
  return [a1 estimatedTitleLabelFrame];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_folder(void *a1, const char *a2, ...)
{
  return [a1 folder];
}

id objc_msgSend_folderAndAccountInfoString(void *a1, const char *a2, ...)
{
  return [a1 folderAndAccountInfoString];
}

id objc_msgSend_folderAndAccountLabel(void *a1, const char *a2, ...)
{
  return [a1 folderAndAccountLabel];
}

id objc_msgSend_folderAndAccountLabelAttributes(void *a1, const char *a2, ...)
{
  return [a1 folderAndAccountLabelAttributes];
}

id objc_msgSend_folderImage(void *a1, const char *a2, ...)
{
  return [a1 folderImage];
}

id objc_msgSend_folderLabelImageView(void *a1, const char *a2, ...)
{
  return [a1 folderLabelImageView];
}

id objc_msgSend_folderName(void *a1, const char *a2, ...)
{
  return [a1 folderName];
}

id objc_msgSend_folderNoteSortType(void *a1, const char *a2, ...)
{
  return [a1 folderNoteSortType];
}

id objc_msgSend_folderStackView(void *a1, const char *a2, ...)
{
  return [a1 folderStackView];
}

id objc_msgSend_folderSystemImageName(void *a1, const char *a2, ...)
{
  return [a1 folderSystemImageName];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_foundAttachmentObjectID(void *a1, const char *a2, ...)
{
  return [a1 foundAttachmentObjectID];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hasThumbnail(void *a1, const char *a2, ...)
{
  return [a1 hasThumbnail];
}

id objc_msgSend_hasThumbnailImage(void *a1, const char *a2, ...)
{
  return [a1 hasThumbnailImage];
}

id objc_msgSend_hasUnreadChanges(void *a1, const char *a2, ...)
{
  return [a1 hasUnreadChanges];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hidesThumbnail(void *a1, const char *a2, ...)
{
  return [a1 hidesThumbnail];
}

id objc_msgSend_highlightColor(void *a1, const char *a2, ...)
{
  return [a1 highlightColor];
}

id objc_msgSend_htmlManagedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 htmlManagedObjectContext];
}

id objc_msgSend_htmlNote(void *a1, const char *a2, ...)
{
  return [a1 htmlNote];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageName(void *a1, const char *a2, ...)
{
  return [a1 imageName];
}

id objc_msgSend_initForMainContext(void *a1, const char *a2, ...)
{
  return [a1 initForMainContext];
}

id objc_msgSend_initWithPrivateQueue(void *a1, const char *a2, ...)
{
  return [a1 initWithPrivateQueue];
}

id objc_msgSend_invitation(void *a1, const char *a2, ...)
{
  return [a1 invitation];
}

id objc_msgSend_isAXSize(void *a1, const char *a2, ...)
{
  return [a1 isAXSize];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isDataLoaded(void *a1, const char *a2, ...)
{
  return [a1 isDataLoaded];
}

id objc_msgSend_isDeletedOrInTrash(void *a1, const char *a2, ...)
{
  return [a1 isDeletedOrInTrash];
}

id objc_msgSend_isDisplayedInFolder(void *a1, const char *a2, ...)
{
  return [a1 isDisplayedInFolder];
}

id objc_msgSend_isFocused(void *a1, const char *a2, ...)
{
  return [a1 isFocused];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInSplitView(void *a1, const char *a2, ...)
{
  return [a1 isInSplitView];
}

id objc_msgSend_isLargerThanAXLarge(void *a1, const char *a2, ...)
{
  return [a1 isLargerThanAXLarge];
}

id objc_msgSend_isModernNote(void *a1, const char *a2, ...)
{
  return [a1 isModernNote];
}

id objc_msgSend_isOwnedByCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 isOwnedByCurrentUser];
}

id objc_msgSend_isPasswordProtected(void *a1, const char *a2, ...)
{
  return [a1 isPasswordProtected];
}

id objc_msgSend_isPinDropTarget(void *a1, const char *a2, ...)
{
  return [a1 isPinDropTarget];
}

id objc_msgSend_isPinned(void *a1, const char *a2, ...)
{
  return [a1 isPinned];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_isSharedViaICloud(void *a1, const char *a2, ...)
{
  return [a1 isSharedViaICloud];
}

id objc_msgSend_isSharedViaICloudFolder(void *a1, const char *a2, ...)
{
  return [a1 isSharedViaICloudFolder];
}

id objc_msgSend_isThumbnailPresent(void *a1, const char *a2, ...)
{
  return [a1 isThumbnailPresent];
}

id objc_msgSend_isUnsupported(void *a1, const char *a2, ...)
{
  return [a1 isUnsupported];
}

id objc_msgSend_keyline(void *a1, const char *a2, ...)
{
  return [a1 keyline];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_legacyBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 legacyBackgroundContext];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_listGroupedCellConfiguration(void *a1, const char *a2, ...)
{
  return [a1 listGroupedCellConfiguration];
}

id objc_msgSend_listPlainCellConfiguration(void *a1, const char *a2, ...)
{
  return [a1 listPlainCellConfiguration];
}

id objc_msgSend_loadConfigurationDataAndUpdate(void *a1, const char *a2, ...)
{
  return [a1 loadConfigurationDataAndUpdate];
}

id objc_msgSend_loadDataQueue(void *a1, const char *a2, ...)
{
  return [a1 loadDataQueue];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadViewIfNeeded];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_maxNumberOfLabelLines(void *a1, const char *a2, ...)
{
  return [a1 maxNumberOfLabelLines];
}

id objc_msgSend_modernBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 modernBackgroundContext];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_note(void *a1, const char *a2, ...)
{
  return [a1 note];
}

id objc_msgSend_noteAsPlainText(void *a1, const char *a2, ...)
{
  return [a1 noteAsPlainText];
}

id objc_msgSend_noteContents(void *a1, const char *a2, ...)
{
  return [a1 noteContents];
}

id objc_msgSend_noteTitle(void *a1, const char *a2, ...)
{
  return [a1 noteTitle];
}

id objc_msgSend_notes(void *a1, const char *a2, ...)
{
  return [a1 notes];
}

id objc_msgSend_numberOfLines(void *a1, const char *a2, ...)
{
  return [a1 numberOfLines];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_participantsInfoDescription(void *a1, const char *a2, ...)
{
  return [a1 participantsInfoDescription];
}

id objc_msgSend_participantsInfoString(void *a1, const char *a2, ...)
{
  return [a1 participantsInfoString];
}

id objc_msgSend_participantsLabel(void *a1, const char *a2, ...)
{
  return [a1 participantsLabel];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_preferredContentMode(void *a1, const char *a2, ...)
{
  return [a1 preferredContentMode];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_prepareForReuse(void *a1, const char *a2, ...)
{
  return [a1 prepareForReuse];
}

id objc_msgSend_primaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 primaryLabelColor];
}

id objc_msgSend_primaryStatusImage(void *a1, const char *a2, ...)
{
  return [a1 primaryStatusImage];
}

id objc_msgSend_primaryStatusImageTintColor(void *a1, const char *a2, ...)
{
  return [a1 primaryStatusImageTintColor];
}

id objc_msgSend_primaryWritingDirection(void *a1, const char *a2, ...)
{
  return [a1 primaryWritingDirection];
}

id objc_msgSend_quaternaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 quaternaryLabelColor];
}

id objc_msgSend_receivedDate(void *a1, const char *a2, ...)
{
  return [a1 receivedDate];
}

id objc_msgSend_refreshAll(void *a1, const char *a2, ...)
{
  return [a1 refreshAll];
}

id objc_msgSend_registerForTraitChanges(void *a1, const char *a2, ...)
{
  return [a1 registerForTraitChanges];
}

id objc_msgSend_resetColors(void *a1, const char *a2, ...)
{
  return [a1 resetColors];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_rootObjectType(void *a1, const char *a2, ...)
{
  return [a1 rootObjectType];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_searchResult(void *a1, const char *a2, ...)
{
  return [a1 searchResult];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_secondaryStatusImage(void *a1, const char *a2, ...)
{
  return [a1 secondaryStatusImage];
}

id objc_msgSend_secondaryStatusImageTintColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryStatusImageTintColor];
}

id objc_msgSend_secondaryStatusIndicatorCenterYAXConstraint(void *a1, const char *a2, ...)
{
  return [a1 secondaryStatusIndicatorCenterYAXConstraint];
}

id objc_msgSend_secondaryStatusIndicatorCenterYNormalConstraint(void *a1, const char *a2, ...)
{
  return [a1 secondaryStatusIndicatorCenterYNormalConstraint];
}

id objc_msgSend_secondaryStatusIndicatorImageView(void *a1, const char *a2, ...)
{
  return [a1 secondaryStatusIndicatorImageView];
}

id objc_msgSend_secondarySystemFillColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemFillColor];
}

id objc_msgSend_secondarySystemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemGroupedBackgroundColor];
}

id objc_msgSend_secondaryTextProperties(void *a1, const char *a2, ...)
{
  return [a1 secondaryTextProperties];
}

id objc_msgSend_separatorLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 separatorLayoutGuide];
}

id objc_msgSend_separatorLeadingConstraint(void *a1, const char *a2, ...)
{
  return [a1 separatorLeadingConstraint];
}

id objc_msgSend_setupNoteContext(void *a1, const char *a2, ...)
{
  return [a1 setupNoteContext];
}

id objc_msgSend_share(void *a1, const char *a2, ...)
{
  return [a1 share];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return [a1 sharedContext];
}

id objc_msgSend_sharedHTMLNoteManagedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 sharedHTMLNoteManagedObjectContext];
}

id objc_msgSend_sharedThumbnailService(void *a1, const char *a2, ...)
{
  return [a1 sharedThumbnailService];
}

id objc_msgSend_showAccountName(void *a1, const char *a2, ...)
{
  return [a1 showAccountName];
}

id objc_msgSend_showFolderName(void *a1, const char *a2, ...)
{
  return [a1 showFolderName];
}

id objc_msgSend_showParticipantsInfo(void *a1, const char *a2, ...)
{
  return [a1 showParticipantsInfo];
}

id objc_msgSend_showPinnedBadge(void *a1, const char *a2, ...)
{
  return [a1 showPinnedBadge];
}

id objc_msgSend_showUnreadIndicator(void *a1, const char *a2, ...)
{
  return [a1 showUnreadIndicator];
}

id objc_msgSend_showsNoteContainer(void *a1, const char *a2, ...)
{
  return [a1 showsNoteContainer];
}

id objc_msgSend_statusIndicatorImageView(void *a1, const char *a2, ...)
{
  return [a1 statusIndicatorImageView];
}

id objc_msgSend_statusType(void *a1, const char *a2, ...)
{
  return [a1 statusType];
}

id objc_msgSend_styleForCalculator(void *a1, const char *a2, ...)
{
  return [a1 styleForCalculator];
}

id objc_msgSend_summaryAttributedString(void *a1, const char *a2, ...)
{
  return [a1 summaryAttributedString];
}

id objc_msgSend_summaryLabel(void *a1, const char *a2, ...)
{
  return [a1 summaryLabel];
}

id objc_msgSend_summaryLabelAttributes(void *a1, const char *a2, ...)
{
  return [a1 summaryLabelAttributes];
}

id objc_msgSend_summaryString(void *a1, const char *a2, ...)
{
  return [a1 summaryString];
}

id objc_msgSend_symbolImageConfiguration(void *a1, const char *a2, ...)
{
  return [a1 symbolImageConfiguration];
}

id objc_msgSend_synchronouslyLoadConfigurationDataAndUpdate(void *a1, const char *a2, ...)
{
  return [a1 synchronouslyLoadConfigurationDataAndUpdate];
}

id objc_msgSend_synchronouslyLoadData(void *a1, const char *a2, ...)
{
  return [a1 synchronouslyLoadData];
}

id objc_msgSend_systemFillColor(void *a1, const char *a2, ...)
{
  return [a1 systemFillColor];
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 tertiaryLabelColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return [a1 textProperties];
}

id objc_msgSend_thumbnailImageView(void *a1, const char *a2, ...)
{
  return [a1 thumbnailImageView];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleAttributedString(void *a1, const char *a2, ...)
{
  return [a1 titleAttributedString];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_titleLabelAttributes(void *a1, const char *a2, ...)
{
  return [a1 titleLabelAttributes];
}

id objc_msgSend_titleString(void *a1, const char *a2, ...)
{
  return [a1 titleString];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_trailingThumbnailConstraints(void *a1, const char *a2, ...)
{
  return [a1 trailingThumbnailConstraints];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_typeDescription(void *a1, const char *a2, ...)
{
  return [a1 typeDescription];
}

id objc_msgSend_uniqueKey(void *a1, const char *a2, ...)
{
  return [a1 uniqueKey];
}

id objc_msgSend_updateConfigurationAttributes(void *a1, const char *a2, ...)
{
  return [a1 updateConfigurationAttributes];
}

id objc_msgSend_updateEstimatedLabelFrames(void *a1, const char *a2, ...)
{
  return [a1 updateEstimatedLabelFrames];
}

id objc_msgSend_updateFromConfiguration(void *a1, const char *a2, ...)
{
  return [a1 updateFromConfiguration];
}

id objc_msgSend_updateLabelsFromConfiguration(void *a1, const char *a2, ...)
{
  return [a1 updateLabelsFromConfiguration];
}

id objc_msgSend_updateThumbnailFromConfiguration(void *a1, const char *a2, ...)
{
  return [a1 updateThumbnailFromConfiguration];
}

id objc_msgSend_updateViewStateProperties(void *a1, const char *a2, ...)
{
  return [a1 updateViewStateProperties];
}

id objc_msgSend_valueCellConfiguration(void *a1, const char *a2, ...)
{
  return [a1 valueCellConfiguration];
}

id objc_msgSend_verticalPadding(void *a1, const char *a2, ...)
{
  return [a1 verticalPadding];
}

id objc_msgSend_verticalStackView(void *a1, const char *a2, ...)
{
  return [a1 verticalStackView];
}

id objc_msgSend_verticalStackViewBottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 verticalStackViewBottomConstraint];
}

id objc_msgSend_verticalStackViewLeadingConstraint(void *a1, const char *a2, ...)
{
  return [a1 verticalStackViewLeadingConstraint];
}

id objc_msgSend_verticalStackViewTopConstraint(void *a1, const char *a2, ...)
{
  return [a1 verticalStackViewTopConstraint];
}

id objc_msgSend_verticalStackViewTrailingConstraint(void *a1, const char *a2, ...)
{
  return [a1 verticalStackViewTrailingConstraint];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_workerManagedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 workerManagedObjectContext];
}