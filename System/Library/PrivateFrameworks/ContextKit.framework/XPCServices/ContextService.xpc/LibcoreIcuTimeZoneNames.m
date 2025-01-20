@interface LibcoreIcuTimeZoneNames
+ (const)__metadata;
+ (id)getDisplayNameWithNSStringArray2:(id)a3 withNSString:(id)a4 withBoolean:(BOOL)a5 withInt:(int)a6;
+ (id)getZoneStringsWithJavaUtilLocale:(id)a3;
+ (void)fillZoneStringNamesWithNSString:(id)a3 withNSStringArray:(id)a4;
+ (void)fillZoneStringsWithNSString:(id)a3 withNSStringArray2:(id)a4;
+ (void)initialize;
@end

@implementation LibcoreIcuTimeZoneNames

+ (id)getDisplayNameWithNSStringArray2:(id)a3 withNSString:(id)a4 withBoolean:(BOOL)a5 withInt:(int)a6
{
  return (id)LibcoreIcuTimeZoneNames_getDisplayNameWithNSStringArray2_withNSString_withBoolean_withInt_((uint64_t)a3, (uint64_t)a4, a5, a6);
}

+ (id)getZoneStringsWithJavaUtilLocale:(id)a3
{
  return LibcoreIcuTimeZoneNames_getZoneStringsWithJavaUtilLocale_((uint64_t)a3);
}

+ (void)fillZoneStringsWithNSString:(id)a3 withNSStringArray2:(id)a4
{
}

+ (void)fillZoneStringNamesWithNSString:(id)a3 withNSStringArray:(id)a4
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    AvailableIDs = JavaUtilTimeZone_getAvailableIDs();
    JreStrongAssign((id *)&qword_100560B10, AvailableIDs);
    v3 = [LibcoreIcuTimeZoneNames_ZoneStringsCache alloc];
    LibcoreIcuTimeZoneNames_ZoneStringsCache_init((uint64_t)v3);
    JreStrongAssignAndConsume((id *)&qword_100560B18, v3);
    v4 = (void *)qword_100560B18;
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [v4 getWithId:JavaUtilLocale_ROOT_];
    v5 = (void *)qword_100560B18;
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [v5 getWithId:JavaUtilLocale_US_];
    [(id)qword_100560B18 getWithId:JavaUtilLocale_getDefault()];
    JreStrongAssignAndConsume((id *)&qword_100560B20, [LibcoreIcuTimeZoneNames__1 alloc]);
    atomic_store(1u, (unsigned __int8 *)LibcoreIcuTimeZoneNames__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041CC50;
}

@end