@interface LibcoreIcuTimeZoneNames_ZoneStringsCache
+ (const)__metadata;
- (LibcoreIcuTimeZoneNames_ZoneStringsCache)init;
- (id)createWithId:(id)a3;
- (void)dealloc;
- (void)internStringsWithNSStringArray2:(id)a3;
@end

@implementation LibcoreIcuTimeZoneNames_ZoneStringsCache

- (LibcoreIcuTimeZoneNames_ZoneStringsCache)init
{
  return self;
}

- (id)createWithId:(id)a3
{
  JavaLangSystem_currentTimeMillis();
  if ((atomic_load_explicit(LibcoreIcuTimeZoneNames__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!qword_100560B10) {
    goto LABEL_18;
  }
  v19[0] = *(_DWORD *)(qword_100560B10 + 8);
  v19[1] = 5;
  v5 = +[IOSObjectArray arrayWithDimensions:2 lengths:v19 type:NSString_class_()];
  for (uint64_t i = 0; ; IOSObjectArray_Set(v8, 0, *(void **)(qword_100560B10 + 24 + 8 * i++)))
  {
    if ((atomic_load_explicit(LibcoreIcuTimeZoneNames__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (i >= *(int *)(qword_100560B10 + 8)) {
      break;
    }
    uint64_t size = v5->super.size_;
    if (i >= size) {
      IOSArray_throwOutOfBoundsWithMsg(size, i);
    }
    uint64_t v8 = (uint64_t)(&v5->elementType_)[i];
    if (!v8) {
      goto LABEL_18;
    }
    if ((atomic_load_explicit(LibcoreIcuTimeZoneNames__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v9 = *(int *)(qword_100560B10 + 8);
    if (i >= v9) {
      IOSArray_throwOutOfBoundsWithMsg(v9, i);
    }
  }
  JavaLangSystem_currentTimeMillis();
  if (!a3) {
LABEL_18:
  }
    JreThrowNullPointerException();
  sub_1001B82DC((uint64_t)[a3 description], (uint64_t)v5);
  JavaLangSystem_currentTimeMillis();
  sub_1001B88B4((uint64_t)self, (uint64_t)v5);
  JavaLangSystem_currentTimeMillis();
  CFStringRef v17 = JreStrcat("$@$J$J$", v10, v11, v12, v13, v14, v15, v16, @"Loaded time zone names for \"");
  JavaLangSystem_logIWithNSString_((uint64_t)v17);
  return v5;
}

- (void)internStringsWithNSStringArray2:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreIcuTimeZoneNames_ZoneStringsCache;
  [(LibcoreUtilBasicLruCache *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041CD88;
}

@end