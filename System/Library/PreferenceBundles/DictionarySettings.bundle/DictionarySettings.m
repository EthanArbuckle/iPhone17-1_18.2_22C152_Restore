void sub_3F38(uint64_t a1)
{
  id v2;
  uint64_t vars8;

  v2 = +[UIApplication sharedApplication];
  [v2 openURL:*(void *)(a1 + 32) options:&__NSDictionary0__struct completionHandler:0];
}

void sub_4200(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_421C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    qword_10DD8 = 0;
    +[MAAsset cancelCatalogDownload:DCSDictionaryAssetGetAssetType() then:&stru_C438];
  }
  v4 = +[UIApplication sharedApplication];
  [v4 setNetworkActivityIndicatorVisible:0];

  v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setPerformedRemoteQuery:1];

  id v7 = objc_loadWeakRetained(v5);
  [v7 setCatalogDownloadResult:a2];

  id v8 = objc_loadWeakRetained(v5);
  [v8 reloadDictionariesList];
}

void sub_42F8(uint64_t a1, uint64_t a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_4380;
  v2[3] = &unk_C488;
  uint64_t v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_4380(uint64_t a1)
{
  NSLog(@"DictionaryUI: Catalog download finished with result = %ld", *(void *)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

void sub_43D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v3 = [WeakRetained performedRemoteQuery];

  if ((v3 & 1) == 0)
  {
    NSLog(@"DictionaryUI: Catalog download not aborted timely, so fired fallback timer");
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

id sub_4718(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) activated];
  unsigned __int8 v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v2)
  {
    return [v3 deactivateDictionaryForSpecifier:v4];
  }
  else
  {
    return [v3 activateDictionaryForSpecifier:v4];
  }
}

void sub_4868(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_4884(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] state] != &dword_4) {
    [a1[4] refreshState];
  }
  CFStringRef v12 = @"MAProgressNotification";
  id v13 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_49D8;
  block[3] = &unk_C528;
  objc_copyWeak(&v11, a1 + 6);
  id v8 = a1[5];
  id v9 = v4;
  id v10 = v3;
  id v5 = v3;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v11);
}

void sub_49D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained updateProgressForSpecifier:*(void *)(a1 + 32) operationState:*(void *)(a1 + 40)];

  if ([*(id *)(a1 + 48) isStalled])
  {
    id v6 = [*(id *)(a1 + 32) propertyForKey:PSValueKey];
    id v3 = [v6 rawAsset];
    uint64_t v4 = [v3 attributes];
    id v5 = [v4 objectForKeyedSubscript:@"DictionaryIdentifier"];
    NSLog(@"DictionaryUI: Downloading dictionary(%@) is stalled", v5);
  }
}

void sub_5110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5140(id *a1, void *a2)
{
  [a1[4] refreshState];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5228;
  block[3] = &unk_C578;
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  v8[1] = a2;
  objc_copyWeak(v8, a1 + 7);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v8);
}

void sub_5228(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgress:0.0];
  id v17 = [*(id *)(a1 + 40) propertyForKey:PSTableCellKey];
  [v17 reloadDataWithAssetOperationState:&off_CB78];
  uint64_t v2 = [*(id *)(a1 + 48) attributes];
  id v3 = [v2 objectForKeyedSubscript:@"DictionaryIdentifier"];
  NSLog(@"DictionaryUI: DictionarySettings downloaded dictionary(%@) with error(%ld)", v3, *(void *)(a1 + 64));

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = (char *)[WeakRetained runningAssetOperationForDictionary:*(void *)(a1 + 32)];

  id v6 = objc_loadWeakRetained((id *)(a1 + 56));
  [v6 setRunningAssetOperation:0 forDictionary:*(void *)(a1 + 32)];

  if (v5 == (unsigned char *)&dword_0 + 2)
  {
    id v7 = [*(id *)(a1 + 48) attributes];
    id v8 = [v7 objectForKeyedSubscript:@"DictionaryIdentifier"];
    NSLog(@"DictionaryUI: DictionarySettings download dictionary(%@) canceled by user", v8);

    if (*(void *)(a1 + 64)) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (!*(void *)(a1 + 64))
  {
LABEL_6:
    id v11 = [*(id *)(a1 + 48) attributes];
    DCSDictionaryAssetAttributesDownloaded();
    goto LABEL_7;
  }
  id v9 = objc_loadWeakRetained((id *)(a1 + 56));
  id v10 = +[NSNumber numberWithInteger:*(void *)(a1 + 64)];
  id v11 = [v9 downloadFailedAlertWithError:v10];

  id v12 = objc_loadWeakRetained((id *)(a1 + 56));
  [v12 presentViewController:v11 animated:1 completion:0];

  id v13 = objc_loadWeakRetained((id *)(a1 + 56));
  [v13 deactivateDictionaryForSpecifier:*(void *)(a1 + 40)];

LABEL_7:
LABEL_8:
  id v14 = objc_loadWeakRetained((id *)(a1 + 56));
  v15 = [v14 downloadingAssets];
  v16 = [*(id *)(a1 + 48) assetId];
  [v15 removeObjectForKey:v16];
}

void sub_5790(id a1)
{
  qword_10DE8 = +[DUDictionaryManager assetManager];

  _objc_release_x1();
}

void sub_712C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(&a9);
  _Unwind_Resume(a1);
}

id sub_7148(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setImage:*(void *)(a1 + 40)];
}

UIImage *__cdecl sub_715C(id a1, SUUIItemOfferButton *a2, int64_t a3)
{
  if (a3 == 2)
  {
    id v3 = a2;
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [(SUUIItemOfferButton *)v3 traitCollection];

    id v6 = +[UIImage imageNamed:@"UniversalDownloadProgressStopButton" inBundle:v4 compatibleWithTraitCollection:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (UIImage *)v6;
}

id sub_721C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v2 setTransform:v5];
}

uint64_t sub_728C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v3 = WeakRetained;
    if ((objc_msgSend(WeakRetained, "_needsAddToLibraryOrDownloadImageViewForProgressType:", objc_msgSend(WeakRetained, "progressType")) & 1) == 0)objc_msgSend(v3[1], "setHidden:", 1); {
  }
    }

  return _objc_release_x1();
}

uint64_t ASServerURLForAssetType()
{
  return _ASServerURLForAssetType();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t DCSDictionaryAssetAttributesDownloaded()
{
  return _DCSDictionaryAssetAttributesDownloaded();
}

uint64_t DCSDictionaryAssetAttributesWillBePurged()
{
  return _DCSDictionaryAssetAttributesWillBePurged();
}

uint64_t DCSDictionaryAssetCopyDiagnosticLog()
{
  return _DCSDictionaryAssetCopyDiagnosticLog();
}

uint64_t DCSDictionaryAssetGetAssetType()
{
  return _DCSDictionaryAssetGetAssetType();
}

uint64_t MPUFloatEqualToFloat()
{
  return _MPUFloatEqualToFloat();
}

uint64_t MPUFloatFloorForScale()
{
  return _MPUFloatFloorForScale();
}

uint64_t MPUFloatGetSafeScaleForValue()
{
  return _MPUFloatGetSafeScaleForValue();
}

uint64_t MPUFloatRoundForScale()
{
  return _MPUFloatRoundForScale();
}

uint64_t MPURectByApplyingUserInterfaceLayoutDirectionInRect()
{
  return _MPURectByApplyingUserInterfaceLayoutDirectionInRect();
}

uint64_t MPUSizeEqualToSize()
{
  return _MPUSizeEqualToSize();
}

void NSLog(NSString *format, ...)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

uint64_t UIRectCenteredXInRectScale()
{
  return _UIRectCenteredXInRectScale();
}

uint64_t UIRectCenteredYInRectScale()
{
  return _UIRectCenteredYInRectScale();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_TTYSoftwareEnabled(void *a1, const char *a2, ...)
{
  return [a1 TTYSoftwareEnabled];
}

id objc_msgSend__addToLibraryOrDownloadImage(void *a1, const char *a2, ...)
{
  return [a1 _addToLibraryOrDownloadImage];
}

id objc_msgSend__allAvailableDefinitionDictionaries(void *a1, const char *a2, ...)
{
  return [a1 _allAvailableDefinitionDictionaries];
}

id objc_msgSend__animatesContents(void *a1, const char *a2, ...)
{
  return [a1 _animatesContents];
}

id objc_msgSend__stopProgressAnimation(void *a1, const char *a2, ...)
{
  return [a1 _stopProgressAnimation];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activated(void *a1, const char *a2, ...)
{
  return [a1 activated];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return [a1 assetManager];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_availableDefinitionDictionaries(void *a1, const char *a2, ...)
{
  return [a1 availableDefinitionDictionaries];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_cancelDownloadSync(void *a1, const char *a2, ...)
{
  return [a1 cancelDownloadSync];
}

id objc_msgSend_catalogDownloadResult(void *a1, const char *a2, ...)
{
  return [a1 catalogDownloadResult];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_definitionDictionary(void *a1, const char *a2, ...)
{
  return [a1 definitionDictionary];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_dictionariesUnavailableView(void *a1, const char *a2, ...)
{
  return [a1 dictionariesUnavailableView];
}

id objc_msgSend_dictionaryManager(void *a1, const char *a2, ...)
{
  return [a1 dictionaryManager];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_downloadButton(void *a1, const char *a2, ...)
{
  return [a1 downloadButton];
}

id objc_msgSend_downloadingAssets(void *a1, const char *a2, ...)
{
  return [a1 downloadingAssets];
}

id objc_msgSend_emitNavigationEventForRootController(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEventForRootController];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAppleDictionary(void *a1, const char *a2, ...)
{
  return [a1 isAppleDictionary];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return [a1 isHighlighted];
}

id objc_msgSend_isStalled(void *a1, const char *a2, ...)
{
  return [a1 isStalled];
}

id objc_msgSend_isTTYDictionary(void *a1, const char *a2, ...)
{
  return [a1 isTTYDictionary];
}

id objc_msgSend_isTTYEnabled(void *a1, const char *a2, ...)
{
  return [a1 isTTYEnabled];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_loadingSpinner(void *a1, const char *a2, ...)
{
  return [a1 loadingSpinner];
}

id objc_msgSend_localizedDictionaryName(void *a1, const char *a2, ...)
{
  return [a1 localizedDictionaryName];
}

id objc_msgSend_localizedLanguageName(void *a1, const char *a2, ...)
{
  return [a1 localizedLanguageName];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needsDownloadNewerVersion(void *a1, const char *a2, ...)
{
  return [a1 needsDownloadNewerVersion];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_performButtonAction(void *a1, const char *a2, ...)
{
  return [a1 performButtonAction];
}

id objc_msgSend_performedRemoteQuery(void *a1, const char *a2, ...)
{
  return [a1 performedRemoteQuery];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressType(void *a1, const char *a2, ...)
{
  return [a1 progressType];
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return [a1 purgeSync];
}

id objc_msgSend_rawAsset(void *a1, const char *a2, ...)
{
  return [a1 rawAsset];
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return [a1 refreshState];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadDictionariesList(void *a1, const char *a2, ...)
{
  return [a1 reloadDictionariesList];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showPlaceholderViewsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 showPlaceholderViewsIfNeeded];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return [a1 stroke];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return [a1 totalExpected];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return [a1 totalWritten];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_updateLabels(void *a1, const char *a2, ...)
{
  return [a1 updateLabels];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_wasLocal(void *a1, const char *a2, ...)
{
  return [a1 wasLocal];
}

id objc_msgSend_wasPurgeable(void *a1, const char *a2, ...)
{
  return [a1 wasPurgeable];
}

id objc_msgSend_willReloadContent(void *a1, const char *a2, ...)
{
  return [a1 willReloadContent];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}