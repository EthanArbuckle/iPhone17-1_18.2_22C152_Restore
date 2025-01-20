void sub_29F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2D70(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2E80()
{
  +[NSBundle bundleForClass:objc_opt_class()];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3304;
  block[3] = &unk_4158;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = qword_88F8;
  id v1 = v7;
  if (v0 != -1) {
    dispatch_once(&qword_88F8, block);
  }
  id v2 = (id)qword_88F0;

  v3 = +[NSData dataWithContentsOfURL:v2];
  +[CIWarpKernel kernelWithString:fromMetalLibraryData:](CIWarpKernel, "kernelWithString:fromMetalLibraryData:", @"kernel vec2 CIPT_Warp() { return destCoord(); }",
  uint64_t v4 = v3);
  v5 = (void *)qword_88E8;
  qword_88E8 = v4;
}

void sub_2FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_32CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_3304(uint64_t a1)
{
  qword_88F0 = [*(id *)(a1 + 32) URLForResource:@"CIPassThrough.ci" withExtension:@"metallib"];

  return _objc_release_x1();
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_emptyImage(void *a1, const char *a2, ...)
{
  return [a1 emptyImage];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return [a1 extent];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}