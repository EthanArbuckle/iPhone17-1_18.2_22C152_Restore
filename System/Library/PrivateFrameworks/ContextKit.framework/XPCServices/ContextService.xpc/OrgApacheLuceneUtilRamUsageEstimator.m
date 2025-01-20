@interface OrgApacheLuceneUtilRamUsageEstimator
+ (id)humanReadableUnitsWithLong:(int64_t)a3;
+ (id)humanReadableUnitsWithLong:(int64_t)a3 withJavaTextDecimalFormat:(id)a4;
+ (int64_t)adjustForFieldWithLong:(int64_t)a3 withJavaLangReflectField:(id)a4;
+ (int64_t)alignObjectSizeWithLong:(int64_t)a3;
+ (int64_t)shallowSizeOfInstanceWithIOSClass:(id)a3;
+ (int64_t)shallowSizeOfWithId:(id)a3;
+ (int64_t)shallowSizeOfWithNSObjectArray:(id)a3;
+ (int64_t)sizeOfWithBooleanArray:(id)a3;
+ (int64_t)sizeOfWithByteArray:(id)a3;
+ (int64_t)sizeOfWithCharArray:(id)a3;
+ (int64_t)sizeOfWithDoubleArray:(id)a3;
+ (int64_t)sizeOfWithFloatArray:(id)a3;
+ (int64_t)sizeOfWithIntArray:(id)a3;
+ (int64_t)sizeOfWithJavaLangLong:(id)a3;
+ (int64_t)sizeOfWithLongArray:(id)a3;
+ (int64_t)sizeOfWithOrgApacheLuceneUtilAccountableArray:(id)a3;
+ (int64_t)sizeOfWithShortArray:(id)a3;
+ (void)initialize;
@end

@implementation OrgApacheLuceneUtilRamUsageEstimator

+ (int64_t)alignObjectSizeWithLong:(int64_t)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_alignObjectSizeWithLong_(a3);
}

+ (int64_t)sizeOfWithJavaLangLong:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithJavaLangLong_(a3);
}

+ (int64_t)sizeOfWithByteArray:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithByteArray_((uint64_t)a3);
}

+ (int64_t)sizeOfWithBooleanArray:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithBooleanArray_((uint64_t)a3);
}

+ (int64_t)sizeOfWithCharArray:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithCharArray_((uint64_t)a3);
}

+ (int64_t)sizeOfWithShortArray:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithShortArray_((uint64_t)a3);
}

+ (int64_t)sizeOfWithIntArray:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithIntArray_((uint64_t)a3);
}

+ (int64_t)sizeOfWithFloatArray:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithFloatArray_((uint64_t)a3);
}

+ (int64_t)sizeOfWithLongArray:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)a3);
}

+ (int64_t)sizeOfWithDoubleArray:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithDoubleArray_((uint64_t)a3);
}

+ (int64_t)shallowSizeOfWithNSObjectArray:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithNSObjectArray_((uint64_t)a3);
}

+ (int64_t)shallowSizeOfWithId:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithId_(a3);
}

+ (int64_t)shallowSizeOfInstanceWithIOSClass:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(a3);
}

+ (int64_t)adjustForFieldWithLong:(int64_t)a3 withJavaLangReflectField:(id)a4
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  return OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_ + a3;
  }
}

+ (id)humanReadableUnitsWithLong:(int64_t)a3
{
  return (id)OrgApacheLuceneUtilRamUsageEstimator_humanReadableUnitsWithLong_(a3);
}

+ (id)humanReadableUnitsWithLong:(int64_t)a3 withJavaTextDecimalFormat:(id)a4
{
  return (id)OrgApacheLuceneUtilRamUsageEstimator_humanReadableUnitsWithLong_withJavaTextDecimalFormat_(a3, a4, a3, (uint64_t)a4, v4, v5, v6, v7);
}

+ (int64_t)sizeOfWithOrgApacheLuceneUtilAccountableArray:(id)a3
{
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithOrgApacheLuceneUtilAccountableArray_((uint64_t)a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilIdentityHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_100560030, v2);
    objc_msgSend((id)qword_100560030, "putWithId:withId:", +[IOSClass BOOLeanClass](IOSClass, "BOOLeanClass"), JavaLangInteger_valueOfWithInt_(1));
    objc_msgSend((id)qword_100560030, "putWithId:withId:", +[IOSClass byteClass](IOSClass, "byteClass"), JavaLangInteger_valueOfWithInt_(1));
    objc_msgSend((id)qword_100560030, "putWithId:withId:", +[IOSClass charClass](IOSClass, "charClass"), JavaLangInteger_valueOfWithInt_(2));
    objc_msgSend((id)qword_100560030, "putWithId:withId:", +[IOSClass shortClass](IOSClass, "shortClass"), JavaLangInteger_valueOfWithInt_(2));
    objc_msgSend((id)qword_100560030, "putWithId:withId:", +[IOSClass intClass](IOSClass, "intClass"), JavaLangInteger_valueOfWithInt_(4));
    objc_msgSend((id)qword_100560030, "putWithId:withId:", +[IOSClass floatClass](IOSClass, "floatClass"), JavaLangInteger_valueOfWithInt_(4));
    objc_msgSend((id)qword_100560030, "putWithId:withId:", +[IOSClass doubleClass](IOSClass, "doubleClass"), JavaLangInteger_valueOfWithInt_(8));
    objc_msgSend((id)qword_100560030, "putWithId:withId:", +[IOSClass longClass](IOSClass, "longClass"), JavaLangInteger_valueOfWithInt_(8));
    if ((atomic_load_explicit(OrgApacheLuceneUtilConstants__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (OrgApacheLuceneUtilConstants_JRE_IS_64BIT_)
    {
      v3 = (void *)IOSClass_forName_(OrgApacheLuceneUtilRamUsageEstimator_HOTSPOT_BEAN_CLASS_);
      uint64_t v4 = (void *)IOSClass_forName_(OrgApacheLuceneUtilRamUsageEstimator_MANAGEMENT_FACTORY_CLASS_);
      if (!v4
        || (uint64_t v42 = IOSClass_class_(),
            (id v5 = objc_msgSend(v4, "getMethod:parameterTypes:", @"getPlatformMXBean", +[IOSObjectArray arrayWithObjects:count:type:](IOSObjectArray, "arrayWithObjects:count:type:", &v42, 1, IOSClass_class_()))) == 0))
      {
        JreThrowNullPointerException();
      }
      v41 = v3;
      id v6 = objc_msgSend(v5, "invokeWithId:withNSObjectArray:", 0, +[IOSObjectArray arrayWithObjects:count:type:](IOSObjectArray, "arrayWithObjects:count:type:", &v41, 1, NSObject_class_()));
      if (v6)
      {
        if (!v3) {
          JreThrowNullPointerException();
        }
        uint64_t v40 = NSString_class_();
        id v7 = objc_msgSend(v3, "getMethod:parameterTypes:", @"getVMOption", +[IOSObjectArray arrayWithObjects:count:type:](IOSObjectArray, "arrayWithObjects:count:type:", &v40, 1, IOSClass_class_()));
        if (!v7
          || (CFStringRef v39 = @"UseCompressedOops",
              id v8 = objc_msgSend(v7, "invokeWithId:withNSObjectArray:", v6, +[IOSObjectArray arrayWithObjects:count:type:](IOSObjectArray, "arrayWithObjects:count:type:", &v39, 1, NSObject_class_())), (v9 = v8) == 0)|| (v10 = objc_msgSend(objc_msgSend(v8, "getClass"), "getMethod:parameterTypes:", @"getValue", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, IOSClass_class_()))) == 0
          || (id v11 = objc_msgSend(v10, "invokeWithId:withNSObjectArray:", v9, +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, NSObject_class_()))) == 0)
        {
          JreThrowNullPointerException();
        }
        unsigned int v12 = JavaLangBoolean_parseBooleanWithNSString_((uint64_t)[v11 description]);
        char v13 = 1;
        CFStringRef v38 = @"ObjectAlignmentInBytes";
        v14 = +[IOSObjectArray arrayWithObjects:&v38 count:1 type:NSObject_class_()];
        id v15 = objc_msgSend(v7, "invokeWithId:withNSObjectArray:", v6, v14, v38, v39, v40, v41, v42);
        id v16 = v15;
        if (!v15
          || (id v17 = objc_msgSend(objc_msgSend(v15, "getClass"), "getMethod:parameterTypes:", @"getValue", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, IOSClass_class_()))) == 0|| (v18 = objc_msgSend(v17, "invokeWithId:withNSObjectArray:", v16, +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, NSObject_class_()))) == 0)
        {
          JreThrowNullPointerException();
        }
        id v19 = [v18 description];
        int v27 = JavaLangInteger_parseIntWithNSString_(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      else
      {
        char v13 = 0;
        unsigned int v12 = 0;
        int v27 = 8;
      }
      OrgApacheLuceneUtilRamUsageEstimator_JVM_IS_HOTSPOT_64BIT_ = v13;
      OrgApacheLuceneUtilRamUsageEstimator_COMPRESSED_REFS_ENABLED_ = v12 != 0;
      OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_ALIGNMENT_ = v27;
      if (v12) {
        int v29 = 4;
      }
      else {
        int v29 = 8;
      }
      OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_ = v29;
      OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_HEADER_ = v29 + 8;
      int v28 = OrgApacheLuceneUtilRamUsageEstimator_alignObjectSizeWithLong_((v29 + 12));
    }
    else
    {
      OrgApacheLuceneUtilRamUsageEstimator_JVM_IS_HOTSPOT_64BIT_ = 0;
      OrgApacheLuceneUtilRamUsageEstimator_COMPRESSED_REFS_ENABLED_ = 0;
      OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_ALIGNMENT_ = 8;
      OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_ = 4;
      int v28 = 12;
      OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_HEADER_ = 8;
    }
    uint64_t v30 = 0;
    OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_ARRAY_HEADER_ = v28;
    do
    {
      uint64_t v31 = v30;
      if (v30 == 0x8000000000000000) {
        break;
      }
      --v30;
      v32 = JavaLangLong_valueOfWithLong_(v31 - 1);
    }
    while (v32 == JavaLangLong_valueOfWithLong_(v31 - 1));
    int64_t v33 = 0;
    do
    {
      int64_t v34 = v33;
      if (v33 == 0x8000000000000000) {
        break;
      }
      v35 = JavaLangLong_valueOfWithLong_(v33);
      v36 = JavaLangLong_valueOfWithLong_(v34);
      int64_t v33 = v34 + 1;
    }
    while (v35 == v36);
    OrgApacheLuceneUtilRamUsageEstimator_LONG_CACHE_MIN_VALUE_ = v31;
    OrgApacheLuceneUtilRamUsageEstimator_LONG_CACHE_MAX_VALUE_ = v34 - 1;
    v37 = (void *)JavaLangLong_class_();
    OrgApacheLuceneUtilRamUsageEstimator_LONG_SIZE_ = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v37);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilRamUsageEstimator__initialized);
  }
}

@end