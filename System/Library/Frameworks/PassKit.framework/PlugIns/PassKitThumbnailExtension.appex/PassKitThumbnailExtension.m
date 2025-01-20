void sub_10000396C(uint64_t a1)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void v9[4];
  id v10;
  double v11;
  double v12;

  v2 = [objc_alloc((Class)PKPassView) initWithPass:*(void *)(a1 + 32) content:5];
  [v2 setSuppressedContent:512];
  [v2 layoutIfNeeded];
  [v2 sizeOfFront];
  PKSizeAspectFit();
  v4 = v3;
  v6 = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003A88;
  v9[3] = &unk_100004100;
  v10 = v2;
  v11 = v3;
  v12 = v5;
  v7 = v2;
  v8 = +[QLThumbnailReply replyWithContextSize:currentContextDrawingBlock:](QLThumbnailReply, "replyWithContextSize:currentContextDrawingBlock:", v9, v4, v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100003A88(uint64_t a1)
{
  return 1;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKSizeAspectFit()
{
  return _PKSizeAspectFit();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_loadContentSync(void *a1, const char *a2, ...)
{
  return [a1 loadContentSync];
}

id objc_msgSend_maximumSize(void *a1, const char *a2, ...)
{
  return [a1 maximumSize];
}

id objc_msgSend_sizeOfFront(void *a1, const char *a2, ...)
{
  return [a1 sizeOfFront];
}