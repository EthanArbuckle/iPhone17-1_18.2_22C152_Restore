void sub_11BC()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t vars8;

  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v0 = [v2 URLForResource:@"HeartSoundEffect" withExtension:@"m4r"];
  v1 = (void *)qword_8AC0;
  qword_8AC0 = v0;
}

void sub_25D0(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 format];
  [v3 bounds];
  objc_msgSend(v2, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

id objc_msgSend__snapshotImage(void *a1, const char *a2, ...)
{
  return [a1 _snapshotImage];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_calculateHandlePosition(void *a1, const char *a2, ...)
{
  return [a1 calculateHandlePosition];
}

id objc_msgSend_childNodes(void *a1, const char *a2, ...)
{
  return [a1 childNodes];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_firstMaterial(void *a1, const char *a2, ...)
{
  return [a1 firstMaterial];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_geometry(void *a1, const char *a2, ...)
{
  return [a1 geometry];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_messageOrientation(void *a1, const char *a2, ...)
{
  return [a1 messageOrientation];
}

id objc_msgSend_messageRect(void *a1, const char *a2, ...)
{
  return [a1 messageRect];
}

id objc_msgSend_parentNode(void *a1, const char *a2, ...)
{
  return [a1 parentNode];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_preferredFormat(void *a1, const char *a2, ...)
{
  return [a1 preferredFormat];
}

id objc_msgSend_reflective(void *a1, const char *a2, ...)
{
  return [a1 reflective];
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return [a1 rootNode];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return [a1 scene];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}