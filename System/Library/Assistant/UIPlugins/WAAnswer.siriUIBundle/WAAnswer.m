void sub_2DE8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  CGSize v29;
  CGSize v30;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v4 CGImage], 0, 1.0);

    v6 = [*(id *)(a1 + 32) imageInverted];
    v7 = [v6 BOOLValue];

    if (v7)
    {
      v8 = [*(id *)(a1 + 40) _blendedImageFromImage:v5];
      if (v8)
      {
        v9 = (id)v8;
        v10 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          [v9 size];
          v12 = NSStringFromCGSize(v29);
          [v5 size];
          v13 = NSStringFromCGSize(v30);
          v14 = *(void *)(a1 + 48);
          v17 = 136316418;
          v18 = "-[WADetailedSnippetViewController wasAddedToTranscript]_block_invoke";
          v19 = 2112;
          v20 = v9;
          v21 = 2112;
          v22 = v12;
          v23 = 2112;
          v24 = v5;
          v25 = 2112;
          v26 = v13;
          v27 = 2112;
          v28 = v14;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%s Redrew %@ (%@) from %@ (%@) at %@", (uint8_t *)&v17, 0x3Eu);
        }
      }
      else
      {
        v9 = v5;
        v16 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
          sub_4050(v9, v16, a1);
        }
      }
    }
    else
    {
      v9 = v5;
    }
    [*(id *)(a1 + 56) setImage:v9 forKey:*(void *)(a1 + 64)];
    [*(id *)(a1 + 72) setImage:v9];
  }
  else
  {
    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_3FB8(a1, v15);
    }
    v9 = 0;
    v5 = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

void sub_302C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadData];

  [*(id *)(a1 + 32) setLoading:0];
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 siriSnippetViewControllerViewDidLoad:*(void *)(a1 + 32)];
}

void sub_3FB8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 136315650;
  v4 = "-[WADetailedSnippetViewController wasAddedToTranscript]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s Failed to download image %@ at URL %@", (uint8_t *)&v3, 0x20u);
}

void sub_4050(void *a1, void *a2, uint64_t a3)
{
  __int16 v5 = a2;
  [a1 size];
  uint64_t v6 = NSStringFromCGSize(v16);
  uint64_t v7 = *(void *)(a3 + 48);
  int v8 = 136315906;
  v9 = "-[WADetailedSnippetViewController wasAddedToTranscript]_block_invoke";
  __int16 v10 = 2112;
  v11 = a1;
  __int16 v12 = 2112;
  v13 = v6;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%s Could not produce redrawn image from %@ (%@), at %@", (uint8_t *)&v8, 0x2Au);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

void CGImageRelease(CGImageRef image)
{
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
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

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRectCenteredYInRect()
{
  return _UIRectCenteredYInRect();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__headerHeight(void *a1, const char *a2, ...)
{
  return [a1 _headerHeight];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_answerPunchOut(void *a1, const char *a2, ...)
{
  return [a1 answerPunchOut];
}

id objc_msgSend_answers(void *a1, const char *a2, ...)
{
  return [a1 answers];
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

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return [a1 extent];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return [a1 imageData];
}

id objc_msgSend_imageInverted(void *a1, const char *a2, ...)
{
  return [a1 imageInverted];
}

id objc_msgSend_imageResource(void *a1, const char *a2, ...)
{
  return [a1 imageResource];
}

id objc_msgSend_invertImage(void *a1, const char *a2, ...)
{
  return [a1 invertImage];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_lines(void *a1, const char *a2, ...)
{
  return [a1 lines];
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return [a1 loadView];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_resourceUrl(void *a1, const char *a2, ...)
{
  return [a1 resourceUrl];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_setDefaults(void *a1, const char *a2, ...)
{
  return [a1 setDefaults];
}

id objc_msgSend_sharedURLSession(void *a1, const char *a2, ...)
{
  return [a1 sharedURLSession];
}

id objc_msgSend_shouldInvert(void *a1, const char *a2, ...)
{
  return [a1 shouldInvert];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_snippet(void *a1, const char *a2, ...)
{
  return [a1 snippet];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}