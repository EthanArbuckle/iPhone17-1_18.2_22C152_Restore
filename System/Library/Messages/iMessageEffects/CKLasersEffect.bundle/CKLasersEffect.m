void sub_22E8()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t vars8;

  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v0 = [v2 URLForResource:@"LasersSoundEffect" withExtension:@"m4r"];
  v1 = (void *)qword_8900;
  qword_8900 = v0;
}

id sub_2924(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__flippedFocusPoint(void *a1, const char *a2, ...)
{
  return [a1 _flippedFocusPoint];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bigEmojiFilter(void *a1, const char *a2, ...)
{
  return [a1 bigEmojiFilter];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_focusPoint(void *a1, const char *a2, ...)
{
  return [a1 focusPoint];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_sharedBehaviors(void *a1, const char *a2, ...)
{
  return [a1 sharedBehaviors];
}

id objc_msgSend_stickerFilter(void *a1, const char *a2, ...)
{
  return [a1 stickerFilter];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_tapBackFilter(void *a1, const char *a2, ...)
{
  return [a1 tapBackFilter];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return [a1 theme];
}

id objc_msgSend_valueWithCAColorMatrix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCAColorMatrix:");
}