void sub_4804()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t vars8;

  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v0 = [v2 URLForResource:@"HappyBirthdaySoundEffect" withExtension:@"m4r"];
  v1 = (void *)qword_CAB8;
  qword_CAB8 = v0;
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

uint32_t arc4random(void)
{
  return _arc4random();
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

double drand48(void)
{
  return _drand48();
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

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachmentLayer(void *a1, const char *a2, ...)
{
  return [a1 attachmentLayer];
}

id objc_msgSend_balloonLayer(void *a1, const char *a2, ...)
{
  return [a1 balloonLayer];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_emitterCell(void *a1, const char *a2, ...)
{
  return [a1 emitterCell];
}

id objc_msgSend_fromValue(void *a1, const char *a2, ...)
{
  return [a1 fromValue];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_stringLayer(void *a1, const char *a2, ...)
{
  return [a1 stringLayer];
}

id objc_msgSend_zIndex(void *a1, const char *a2, ...)
{
  return [a1 zIndex];
}