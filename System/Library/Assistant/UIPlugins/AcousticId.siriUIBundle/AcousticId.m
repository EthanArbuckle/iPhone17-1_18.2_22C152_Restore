void sub_3534(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_35E4;
  block[3] = &unk_8270;
  v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void *sub_35E4(void *result)
{
  if (result[4])
  {
    v1 = result;
    result = (void *)result[5];
    if (result[1] == v1[6]) {
      return objc_msgSend(result, "_updateAttributionButton:withImage:", result[3]);
    }
  }
  return result;
}

id sub_37B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_43F4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 40) setPlayButtonState:1];
  }
  else {
    return [*(id *)(a1 + 32) play];
  }
}

id SiriAcousticIdLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleWithIdentifier:@"com.apple.assistant.AcousticId"];
  v3 = [v2 siriUILocalizedStringForKey:v1];

  return v3;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t SiriLanguageSemanticContentAttribute()
{
  return _SiriLanguageSemanticContentAttribute();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return _UIRectCenteredIntegralRectScale();
}

uint64_t UIRectCenteredYInRect()
{
  return _UIRectCenteredYInRect();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
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

void objc_destroyWeak(id *location)
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

id objc_msgSend__displaysFooterView(void *a1, const char *a2, ...)
{
  return [a1 _displaysFooterView];
}

id objc_msgSend__isNowPlayingCurrentStoreID(void *a1, const char *a2, ...)
{
  return [a1 _isNowPlayingCurrentStoreID];
}

id objc_msgSend__playbackStoreID(void *a1, const char *a2, ...)
{
  return [a1 _playbackStoreID];
}

id objc_msgSend__updatePlaybackPosition(void *a1, const char *a2, ...)
{
  return [a1 _updatePlaybackPosition];
}

id objc_msgSend_adamId(void *a1, const char *a2, ...)
{
  return [a1 adamId];
}

id objc_msgSend_albumArt(void *a1, const char *a2, ...)
{
  return [a1 albumArt];
}

id objc_msgSend_animateIn(void *a1, const char *a2, ...)
{
  return [a1 animateIn];
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return [a1 artist];
}

id objc_msgSend_attributionPunchOut(void *a1, const char *a2, ...)
{
  return [a1 attributionPunchOut];
}

id objc_msgSend_beginGeneratingPlaybackNotifications(void *a1, const char *a2, ...)
{
  return [a1 beginGeneratingPlaybackNotifications];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentPlaybackTime(void *a1, const char *a2, ...)
{
  return [a1 currentPlaybackTime];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endGeneratingPlaybackNotifications(void *a1, const char *a2, ...)
{
  return [a1 endGeneratingPlaybackNotifications];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_keylineWithDefaultInsets(void *a1, const char *a2, ...)
{
  return [a1 keylineWithDefaultInsets];
}

id objc_msgSend_labelWithLightWeightSubtextFont(void *a1, const char *a2, ...)
{
  return [a1 labelWithLightWeightSubtextFont];
}

id objc_msgSend_labelWithMediumWeightRegularFont(void *a1, const char *a2, ...)
{
  return [a1 labelWithMediumWeightRegularFont];
}

id objc_msgSend_nowPlayingItem(void *a1, const char *a2, ...)
{
  return [a1 nowPlayingItem];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_playButtonState(void *a1, const char *a2, ...)
{
  return [a1 playButtonState];
}

id objc_msgSend_playbackButton(void *a1, const char *a2, ...)
{
  return [a1 playbackButton];
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return [a1 playbackState];
}

id objc_msgSend_playbackStoreID(void *a1, const char *a2, ...)
{
  return [a1 playbackStoreID];
}

id objc_msgSend_previewImage(void *a1, const char *a2, ...)
{
  return [a1 previewImage];
}

id objc_msgSend_purchaseSongPunchOut(void *a1, const char *a2, ...)
{
  return [a1 purchaseSongPunchOut];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resourceUrl(void *a1, const char *a2, ...)
{
  return [a1 resourceUrl];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return [a1 semanticContentAttribute];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_songDetailsPunchOut(void *a1, const char *a2, ...)
{
  return [a1 songDetailsPunchOut];
}

id objc_msgSend_songTag(void *a1, const char *a2, ...)
{
  return [a1 songTag];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemMusicPlayer(void *a1, const char *a2, ...)
{
  return [a1 systemMusicPlayer];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}