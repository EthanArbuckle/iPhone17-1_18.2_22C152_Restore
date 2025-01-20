@interface NSObject(NSObject)
+ (CFTypeRef)_copyDescription;
+ (NSMethodSignature)instanceMethodSignatureForSelector:()NSObject;
+ (NSMethodSignature)methodSignatureForSelector:()NSObject;
+ (objc_class)init;
+ (uint64_t)description;
+ (uint64_t)load;
+ (void)__allocWithZone_OA:()NSObject;
+ (void)dealloc;
+ (void)doesNotRecognizeSelector:()NSObject;
- (CFTypeRef)_copyDescription;
- (NSMethodSignature)methodSignatureForSelector:()NSObject;
- (uint64_t)___tryRetain_OA;
- (uint64_t)__autorelease_OA;
- (uint64_t)__release_OA;
- (uint64_t)__retain_OA;
- (uint64_t)description;
- (void)__dealloc_zombie;
- (void)doesNotRecognizeSelector:()NSObject;
@end

@implementation NSObject(NSObject)

+ (NSMethodSignature)instanceMethodSignatureForSelector:()NSObject
{
  if (!name || !__methodDescriptionForSelector(a1, name)) {
    return 0;
  }

  return +[NSMethodSignature signatureWithObjCTypes:v3];
}

- (NSMethodSignature)methodSignatureForSelector:()NSObject
{
  if (!a3) {
    return 0;
  }
  v4 = (objc_class *)objc_opt_class();
  if (!__methodDescriptionForSelector(v4, a3)) {
    return 0;
  }

  return +[NSMethodSignature signatureWithObjCTypes:v5];
}

+ (uint64_t)description
{
  Name = class_getName(a1);
  CFStringRef v2 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%s", Name);

  return _CFAutoreleasePoolAddObject((uint64_t)v2, (uint64_t)v2);
}

- (CFTypeRef)_copyDescription
{
  CFStringRef v2 = (void *)MEMORY[0x185311AE0]();
  uint64_t v3 = (const void *)[a1 description];
  if (v3) {
    CFTypeRef v4 = CFRetain(v3);
  }
  else {
    CFTypeRef v4 = 0;
  }
  _CFAutoreleasePoolPop(v2);
  return v4;
}

- (uint64_t)description
{
  CFStringRef v2 = (objc_class *)objc_opt_class();
  Name = class_getName(v2);
  CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"<%s: %p>", Name, a1);

  return _CFAutoreleasePoolAddObject((uint64_t)v4, (uint64_t)v4);
}

+ (uint64_t)load
{
  return MEMORY[0x1F41814A8](couldNotInstantiate);
}

+ (NSMethodSignature)methodSignatureForSelector:()NSObject
{
  if (!a3) {
    return 0;
  }
  Class = object_getClass(a1);
  if (!__methodDescriptionForSelector(Class, a3)) {
    return 0;
  }

  return +[NSMethodSignature signatureWithObjCTypes:v5];
}

+ (void)doesNotRecognizeSelector:()NSObject
{
  v16[1] = *(void *)off_1ECE0A5B0;
  if (cls)
  {
    Name = class_getName(cls);
    if (sel) {
      goto LABEL_3;
    }
  }
  else
  {
    Name = "(null class)";
    if (sel)
    {
LABEL_3:
      v6 = sel_getName(sel);
      goto LABEL_6;
    }
  }
  v6 = "(null selector)";
LABEL_6:
  CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"+[%s %s]: unrecognized selector sent to class %p", Name, v6, cls);
  uint64_t v8 = _CFAutoreleasePoolAddObject((uint64_t)v7, (uint64_t)v7);
  strlen(Name);
  int is_memory_immutable = _dyld_is_memory_immutable();
  strlen(v6);
  int v10 = _dyld_is_memory_immutable();
  uint64_t v11 = _os_log_pack_size();
  uint64_t v12 = _os_log_pack_fill();
  if (is_memory_immutable) {
    v13 = Name;
  }
  else {
    v13 = "(dynamic class)";
  }
  if (v10) {
    v14 = v6;
  }
  else {
    v14 = "(dynamic selector)";
  }
  v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException", v8, 0, (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v11, __os_log_helper_1_2_3_8_32_8_32_8_0(v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)cls) reason userInfo osLogPack size];
  objc_exception_throw(v15);
}

- (void)doesNotRecognizeSelector:()NSObject
{
  v17[1] = *(void *)off_1ECE0A5B0;
  uint64_t v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    Name = class_getName(v5);
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    Name = "(null class)";
    if (a3)
    {
LABEL_3:
      CFStringRef v7 = sel_getName(a3);
      goto LABEL_6;
    }
  }
  CFStringRef v7 = "(null selector)";
LABEL_6:
  CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"-[%s %s]: unrecognized selector sent to instance %p", Name, v7, a1);
  uint64_t v9 = _CFAutoreleasePoolAddObject((uint64_t)v8, (uint64_t)v8);
  strlen(Name);
  int is_memory_immutable = _dyld_is_memory_immutable();
  strlen(v7);
  int v11 = _dyld_is_memory_immutable();
  uint64_t v12 = _os_log_pack_size();
  uint64_t v13 = _os_log_pack_fill();
  if (is_memory_immutable) {
    v14 = Name;
  }
  else {
    v14 = "(dynamic class)";
  }
  if (v11) {
    v15 = v7;
  }
  else {
    v15 = "(dynamic selector)";
  }
  v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException", v9, 0, (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v12, __os_log_helper_1_2_3_8_32_8_32_8_0(v13, (uint64_t)v14, (uint64_t)v15, a1) reason userInfo osLogPack size];
  objc_exception_throw(v16);
}

+ (CFTypeRef)_copyDescription
{
  CFStringRef v2 = (void *)MEMORY[0x185311AE0]();
  uint64_t v3 = (const void *)[a1 description];
  if (v3) {
    CFTypeRef v4 = CFRetain(v3);
  }
  else {
    CFTypeRef v4 = 0;
  }
  _CFAutoreleasePoolPop(v2);
  return v4;
}

- (uint64_t)__retain_OA
{
  uint64_t v0 = _objc_rootRetain();
  __CFRecordAllocationEvent();
  return v0;
}

- (uint64_t)___tryRetain_OA
{
  uint64_t v0 = _objc_rootTryRetain();
  if (v0) {
    __CFRecordAllocationEvent();
  }
  return v0;
}

- (uint64_t)__release_OA
{
  __CFRecordAllocationEvent();

  return MEMORY[0x1F4181478](a1);
}

- (uint64_t)__autorelease_OA
{
  return _CFAutoreleasePoolAddObject(a1, a1);
}

+ (void)__allocWithZone_OA:()NSObject
{
  uint64_t v0 = (void *)_objc_rootAllocWithZone();
  v1 = v0;
  if (v0)
  {
    object_getClassName(v0);
    __CFSetLastAllocationEventName();
  }
  return v1;
}

- (void)__dealloc_zombie
{
  name[1] = *(char **)off_1ECE0A5B0;
  if ((a1 & 0x8000000000000000) == 0)
  {
    if (__CFZombieEnabled)
    {
      Class = object_getClass((id)a1);
      name[0] = 0;
      uint64_t v3 = class_getName(Class);
      asprintf(name, "_NSZombie_%s", v3);
      CFTypeRef v4 = objc_lookUpClass(name[0]);
      if (!v4)
      {
        uint64_t v5 = objc_lookUpClass("_NSZombie_");
        CFTypeRef v4 = objc_duplicateClass(v5, name[0], 0);
      }
      free(name[0]);
      objc_destructInstance((id)a1);
      object_setClass((id)a1, v4);
      if (__CFDeallocateZombies) {
        free((void *)a1);
      }
    }
    else
    {
      MEMORY[0x1F4181458]();
    }
  }
}

+ (objc_class)init
{
  if (_CFExecutableLinkedOnOrAfter(6uLL))
  {
    Name = class_getName(a1);
    CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** +[%s<%p> init]: cannot init a class object.", Name, a1);
    uint64_t v5 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject((uint64_t)v4, (uint64_t)v4) userInfo:0];
    objc_exception_throw(v5);
  }
  return a1;
}

+ (void)dealloc
{
  Name = class_getName(a1);
  CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** +[%s<%p> dealloc]: cannot dealloc a class object.", Name, a1);
  CFStringRef v4 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject((uint64_t)v3, (uint64_t)v3) userInfo:0];
  objc_exception_throw(v4);
}

@end