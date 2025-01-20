void sub_52A4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t vars8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(void *)(a1 + 40);
    v5 = a2;
    [v3 setImage:v5 forKey:v4];
    [*(id *)(a1 + 48) _configureWithImage:v5];
  }
}

id SiriGKLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleWithIdentifier:@"com.apple.siri.GeneralKnowledge"];
  v3 = [v2 siriUILocalizedStringForKey:v1];

  return v3;
}

id SiriGK_safariPunchoutURL(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init((Class)NSMutableString);
  v6 = [v3 scheme];
  if ([v6 isEqualToString:@"http"])
  {
  }
  else
  {
    v7 = [v3 scheme];
    unsigned int v8 = [v7 isEqualToString:@"https"];

    if (!v8)
    {
      id v15 = v3;
      goto LABEL_10;
    }
  }
  v9 = [v3 absoluteString];
  [v5 appendString:v9];

  if (v4)
  {
    [v5 appendString:@"?back="];
    v10 = [v4 absoluteString];
    v11 = +[NSMutableCharacterSet characterSetWithCharactersInString:@"/:?&="];
    v12 = [v11 invertedSet];
    v13 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v12];

    [v5 appendString:v13];
  }
  else
  {
    v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_EB84((uint64_t)v3, v14);
    }
  }
  id v15 = +[NSURL URLWithString:v5];
LABEL_10:
  v16 = v15;

  return v16;
}

void sub_94F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, char a20)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a20, 8);
  _Unwind_Resume(a1);
}

void sub_9520(uint64_t a1, void *a2, int a3)
{
  id v11 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = v11;
    if (!v11 && a3)
    {
      v7 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v8 = +[UIImage imageNamed:@"missingPhoto" inBundle:v7];
      v9 = +[UIColor siriui_maskingColor];
      id v12 = [v8 _flatImageWithColor:v9];

      id v6 = v12;
    }
    if (v6)
    {
      id v11 = v6;
      objc_msgSend(WeakRetained[2], "setImage:");
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      if (!*(unsigned char *)(v10 + 24))
      {
        *(unsigned char *)(v10 + 24) = 1;
        [WeakRetained[4] setHidden:1];
      }
    }
    else
    {
      id v11 = 0;
    }
  }
}

void sub_B968(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 184));
  _Unwind_Resume(a1);
}

void sub_B994(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (v6)
  {
    [*(id *)(a1 + 32) setImage:v6 forKey:*(void *)(a1 + 40)];
    [v4 _configureWithImage:v6];
  }
  else if (WeakRetained)
  {
    [*((id *)WeakRetained + 9) removeFromSuperview];
    id v5 = (void *)v4[9];
    v4[9] = 0;
  }
}

id sub_BB58(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) setAlpha:1.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);

  return [v2 setAlpha:0.0];
}

id sub_BBB4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeFromSuperview];
}

void sub_D724(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateComponentsFormatter);
  uint64_t v2 = (void *)qword_208F0;
  qword_208F0 = (uint64_t)v1;

  id v3 = (void *)qword_208F0;

  [v3 setUnitsStyle:1];
}

void sub_DE08(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    [v3 setImage:v5 forKey:v4];
    [*(id *)(a1 + 48) _configureWithImage:v5 asVideoResult:*(unsigned __int8 *)(a1 + 56)];
  }
}

void sub_DFD8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 72) setAlpha:0.0];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
    id v3 = +[UIColor colorWithWhite:1.0 alpha:0.2];
    [v2 setBackgroundColor:v3];
  }
}

id sub_E098(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeFromSuperview];
}

void sub_EB84(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "SiriGK_safariPunchoutURL";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s No back URL provided for punchout to target: %@", (uint8_t *)&v2, 0x16u);
}

uint64_t AFUIGetLanguageCode()
{
  return _AFUIGetLanguageCode();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MKMapPoint v3 = _MKMapPointForCoordinate(coordinate);
  double y = v3.y;
  double x = v3.x;
  result.double y = y;
  result.double x = x;
  return result;
}

double MKMapPointsPerMeterAtLatitude(CLLocationDegrees latitude)
{
  return _MKMapPointsPerMeterAtLatitude(latitude);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SiriLanguageIsRTL()
{
  return _SiriLanguageIsRTL();
}

uint64_t SiriUIDeviceIsPad()
{
  return _SiriUIDeviceIsPad();
}

uint64_t SiriUIDeviceIsSmallPhone()
{
  return _SiriUIDeviceIsSmallPhone();
}

uint64_t SiriUIIsCompactWidth()
{
  return _SiriUIIsCompactWidth();
}

uint64_t SiriUIIsLargePhoneLayout()
{
  return _SiriUIIsLargePhoneLayout();
}

uint64_t SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()
{
  return _SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets();
}

uint64_t SiriUIRectForLabelWithDistanceFromTopToBaseline()
{
  return _SiriUIRectForLabelWithDistanceFromTopToBaseline();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRectCenteredIntegralRect()
{
  return _UIRectCenteredIntegralRect();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return _UIRectCenteredIntegralRectScale();
}

uint64_t UIRectCenteredXInRect()
{
  return _UIRectCenteredXInRect();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_msgSend__bottomMargin(void *a1, const char *a2, ...)
{
  return [a1 _bottomMargin];
}

id objc_msgSend__edgeInsets(void *a1, const char *a2, ...)
{
  return [a1 _edgeInsets];
}

id objc_msgSend__lineHeight(void *a1, const char *a2, ...)
{
  return [a1 _lineHeight];
}

id objc_msgSend__linkTextAttributes(void *a1, const char *a2, ...)
{
  return [a1 _linkTextAttributes];
}

id objc_msgSend__textAttributes(void *a1, const char *a2, ...)
{
  return [a1 _textAttributes];
}

id objc_msgSend__titleLabelAttributes(void *a1, const char *a2, ...)
{
  return [a1 _titleLabelAttributes];
}

id objc_msgSend__urlLabelAttributes(void *a1, const char *a2, ...)
{
  return [a1 _urlLabelAttributes];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alternateResults(void *a1, const char *a2, ...)
{
  return [a1 alternateResults];
}

id objc_msgSend_appIcon(void *a1, const char *a2, ...)
{
  return [a1 appIcon];
}

id objc_msgSend_appPunchOut(void *a1, const char *a2, ...)
{
  return [a1 appPunchOut];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
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

id objc_msgSend_caption(void *a1, const char *a2, ...)
{
  return [a1 caption];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
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

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_commands(void *a1, const char *a2, ...)
{
  return [a1 commands];
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

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_decoratedValue(void *a1, const char *a2, ...)
{
  return [a1 decoratedValue];
}

id objc_msgSend_decoratedValueAnnotation(void *a1, const char *a2, ...)
{
  return [a1 decoratedValueAnnotation];
}

id objc_msgSend_defaultBrowserBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 defaultBrowserBundleIdentifier];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descriptionText(void *a1, const char *a2, ...)
{
  return [a1 descriptionText];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayLink(void *a1, const char *a2, ...)
{
  return [a1 displayLink];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayedImage(void *a1, const char *a2, ...)
{
  return [a1 displayedImage];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dragItem(void *a1, const char *a2, ...)
{
  return [a1 dragItem];
}

id objc_msgSend_edgeInsets(void *a1, const char *a2, ...)
{
  return [a1 edgeInsets];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_footerView(void *a1, const char *a2, ...)
{
  return [a1 footerView];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_headerButton(void *a1, const char *a2, ...)
{
  return [a1 headerButton];
}

id objc_msgSend_headerInsets(void *a1, const char *a2, ...)
{
  return [a1 headerInsets];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return [a1 imageData];
}

id objc_msgSend_imageResource(void *a1, const char *a2, ...)
{
  return [a1 imageResource];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_images(void *a1, const char *a2, ...)
{
  return [a1 images];
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return [a1 indexPath];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateLayout];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isFullWidth(void *a1, const char *a2, ...)
{
  return [a1 isFullWidth];
}

id objc_msgSend_isManagingBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 isManagingBackgroundColor];
}

id objc_msgSend_isSelectable(void *a1, const char *a2, ...)
{
  return [a1 isSelectable];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_keyline(void *a1, const char *a2, ...)
{
  return [a1 keyline];
}

id objc_msgSend_keylineType(void *a1, const char *a2, ...)
{
  return [a1 keylineType];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutManager(void *a1, const char *a2, ...)
{
  return [a1 layoutManager];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return [a1 layoutSubviews];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_link(void *a1, const char *a2, ...)
{
  return [a1 link];
}

id objc_msgSend_linkText(void *a1, const char *a2, ...)
{
  return [a1 linkText];
}

id objc_msgSend_links(void *a1, const char *a2, ...)
{
  return [a1 links];
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return [a1 loadView];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mapViewSnippet(void *a1, const char *a2, ...)
{
  return [a1 mapViewSnippet];
}

id objc_msgSend_minimumInteritemSpacing(void *a1, const char *a2, ...)
{
  return [a1 minimumInteritemSpacing];
}

id objc_msgSend_minimumLineSpacing(void *a1, const char *a2, ...)
{
  return [a1 minimumLineSpacing];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_openInMaps(void *a1, const char *a2, ...)
{
  return [a1 openInMaps];
}

id objc_msgSend_pixelHeight(void *a1, const char *a2, ...)
{
  return [a1 pixelHeight];
}

id objc_msgSend_pixelWidth(void *a1, const char *a2, ...)
{
  return [a1 pixelWidth];
}

id objc_msgSend_podList(void *a1, const char *a2, ...)
{
  return [a1 podList];
}

id objc_msgSend_pods(void *a1, const char *a2, ...)
{
  return [a1 pods];
}

id objc_msgSend_property(void *a1, const char *a2, ...)
{
  return [a1 property];
}

id objc_msgSend_propertyList(void *a1, const char *a2, ...)
{
  return [a1 propertyList];
}

id objc_msgSend_publicationDate(void *a1, const char *a2, ...)
{
  return [a1 publicationDate];
}

id objc_msgSend_punchOut(void *a1, const char *a2, ...)
{
  return [a1 punchOut];
}

id objc_msgSend_punchOutName(void *a1, const char *a2, ...)
{
  return [a1 punchOutName];
}

id objc_msgSend_punchOutUri(void *a1, const char *a2, ...)
{
  return [a1 punchOutUri];
}

id objc_msgSend_punchoutURL(void *a1, const char *a2, ...)
{
  return [a1 punchoutURL];
}

id objc_msgSend_regions(void *a1, const char *a2, ...)
{
  return [a1 regions];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_representedElementKind(void *a1, const char *a2, ...)
{
  return [a1 representedElementKind];
}

id objc_msgSend_resourceUrl(void *a1, const char *a2, ...)
{
  return [a1 resourceUrl];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_selected(void *a1, const char *a2, ...)
{
  return [a1 selected];
}

id objc_msgSend_selectionResponseTitle(void *a1, const char *a2, ...)
{
  return [a1 selectionResponseTitle];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setupMap(void *a1, const char *a2, ...)
{
  return [a1 setupMap];
}

id objc_msgSend_sharedURLSession(void *a1, const char *a2, ...)
{
  return [a1 sharedURLSession];
}

id objc_msgSend_showButton(void *a1, const char *a2, ...)
{
  return [a1 showButton];
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

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return [a1 textContainer];
}

id objc_msgSend_thumbnails(void *a1, const char *a2, ...)
{
  return [a1 thumbnails];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return [a1 userAgent];
}

id objc_msgSend_videos(void *a1, const char *a2, ...)
{
  return [a1 videos];
}

id objc_msgSend_viewArray(void *a1, const char *a2, ...)
{
  return [a1 viewArray];
}

id objc_msgSend_viewCount(void *a1, const char *a2, ...)
{
  return [a1 viewCount];
}

id objc_msgSend_weekOfMonth(void *a1, const char *a2, ...)
{
  return [a1 weekOfMonth];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}

id objc_msgSend_zIndex(void *a1, const char *a2, ...)
{
  return [a1 zIndex];
}

id objc_msgSend_zoomLevel(void *a1, const char *a2, ...)
{
  return [a1 zoomLevel];
}