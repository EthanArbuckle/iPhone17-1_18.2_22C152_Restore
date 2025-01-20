void sub_36CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_42A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_appStoreURL(void *a1, const char *a2, ...)
{
  return [a1 appStoreURL];
}

id objc_msgSend_artworkSize(void *a1, const char *a2, ...)
{
  return [a1 artworkSize];
}

id objc_msgSend_artworkSizeTemplateURL(void *a1, const char *a2, ...)
{
  return [a1 artworkSizeTemplateURL];
}

id objc_msgSend_artworkURLString(void *a1, const char *a2, ...)
{
  return [a1 artworkURLString];
}

id objc_msgSend_basicContentMetadata(void *a1, const char *a2, ...)
{
  return [a1 basicContentMetadata];
}

id objc_msgSend_canonicalID(void *a1, const char *a2, ...)
{
  return [a1 canonicalID];
}

id objc_msgSend_canonicalId(void *a1, const char *a2, ...)
{
  return [a1 canonicalId];
}

id objc_msgSend_canonicalSeasonID(void *a1, const char *a2, ...)
{
  return [a1 canonicalSeasonID];
}

id objc_msgSend_canonicalShowID(void *a1, const char *a2, ...)
{
  return [a1 canonicalShowID];
}

id objc_msgSend_channelDetails(void *a1, const char *a2, ...)
{
  return [a1 channelDetails];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_images(void *a1, const char *a2, ...)
{
  return [a1 images];
}

id objc_msgSend_isAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 isAppInstalled];
}

id objc_msgSend_isEntitled(void *a1, const char *a2, ...)
{
  return [a1 isEntitled];
}

id objc_msgSend_isEvod(void *a1, const char *a2, ...)
{
  return [a1 isEvod];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_movieOrShowContent(void *a1, const char *a2, ...)
{
  return [a1 movieOrShowContent];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_network(void *a1, const char *a2, ...)
{
  return [a1 network];
}

id objc_msgSend_onlyReturnNextItem(void *a1, const char *a2, ...)
{
  return [a1 onlyReturnNextItem];
}

id objc_msgSend_optedIn(void *a1, const char *a2, ...)
{
  return [a1 optedIn];
}

id objc_msgSend_playable(void *a1, const char *a2, ...)
{
  return [a1 playable];
}

id objc_msgSend_playables(void *a1, const char *a2, ...)
{
  return [a1 playables];
}

id objc_msgSend_punchoutUrls(void *a1, const char *a2, ...)
{
  return [a1 punchoutUrls];
}

id objc_msgSend_releaseDate(void *a1, const char *a2, ...)
{
  return [a1 releaseDate];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_responseType(void *a1, const char *a2, ...)
{
  return [a1 responseType];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return [a1 sharedSettings];
}

id objc_msgSend_siriLocale(void *a1, const char *a2, ...)
{
  return [a1 siriLocale];
}

id objc_msgSend_statsId(void *a1, const char *a2, ...)
{
  return [a1 statsId];
}

id objc_msgSend_studio(void *a1, const char *a2, ...)
{
  return [a1 studio];
}

id objc_msgSend_supportsLayeredImage(void *a1, const char *a2, ...)
{
  return [a1 supportsLayeredImage];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_utsId(void *a1, const char *a2, ...)
{
  return [a1 utsId];
}

id objc_msgSend_wlkDefaultQueue(void *a1, const char *a2, ...)
{
  return [a1 wlkDefaultQueue];
}