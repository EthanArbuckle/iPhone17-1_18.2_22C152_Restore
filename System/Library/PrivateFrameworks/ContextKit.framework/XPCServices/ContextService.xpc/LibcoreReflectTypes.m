@interface LibcoreReflectTypes
+ (const)__metadata;
+ (id)__annotations_appendArrayGenericTypeWithJavaLangStringBuilder_withJavaLangReflectTypeArray_;
+ (id)__annotations_appendGenericTypeWithJavaLangStringBuilder_withJavaLangReflectType_;
+ (id)__annotations_appendTypeNameWithJavaLangStringBuilder_withIOSClass_;
+ (id)__annotations_getSignatureWithIOSClass_;
+ (id)__annotations_getTypeArrayWithLibcoreReflectListOfTypes_withBoolean_;
+ (id)__annotations_getTypeWithJavaLangReflectType_;
+ (id)__annotations_toStringWithIOSClassArray_;
+ (id)getSignature:(id)a3;
+ (id)getType:(id)a3;
+ (id)getTypeArray:(id)a3 clone:(BOOL)a4;
+ (id)toString:(id)a3;
+ (void)appendArrayGenericType:(id)a3 types:(id)a4;
+ (void)appendGenericType:(id)a3 type:(id)a4;
+ (void)appendTypeName:(id)a3 class:(id)a4;
+ (void)initialize;
@end

@implementation LibcoreReflectTypes

+ (id)getTypeArray:(id)a3 clone:(BOOL)a4
{
  return LibcoreReflectTypes_getTypeArray_clone_(a3, a4);
}

+ (id)getType:(id)a3
{
  return LibcoreReflectTypes_getType_(a3);
}

+ (id)getSignature:(id)a3
{
  return (id)LibcoreReflectTypes_getSignature_(a3);
}

+ (id)toString:(id)a3
{
  return (id)LibcoreReflectTypes_toString_((uint64_t)a3);
}

+ (void)appendTypeName:(id)a3 class:(id)a4
{
}

+ (void)appendArrayGenericType:(id)a3 types:(id)a4
{
}

+ (void)appendGenericType:(id)a3 type:(id)a4
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilHashMap_initWithInt_(9);
    JreStrongAssignAndConsume((id *)&qword_100560F10, v2);
    objc_msgSend((id)qword_100560F10, "putWithId:withId:", +[IOSClass byteClass](IOSClass, "byteClass"), @"B");
    objc_msgSend((id)qword_100560F10, "putWithId:withId:", +[IOSClass charClass](IOSClass, "charClass"), @"C");
    objc_msgSend((id)qword_100560F10, "putWithId:withId:", +[IOSClass shortClass](IOSClass, "shortClass"), @"S");
    objc_msgSend((id)qword_100560F10, "putWithId:withId:", +[IOSClass intClass](IOSClass, "intClass"), @"I");
    objc_msgSend((id)qword_100560F10, "putWithId:withId:", +[IOSClass longClass](IOSClass, "longClass"), @"J");
    objc_msgSend((id)qword_100560F10, "putWithId:withId:", +[IOSClass floatClass](IOSClass, "floatClass"), @"F");
    objc_msgSend((id)qword_100560F10, "putWithId:withId:", +[IOSClass doubleClass](IOSClass, "doubleClass"), @"D");
    objc_msgSend((id)qword_100560F10, "putWithId:withId:", +[IOSClass voidClass](IOSClass, "voidClass"), @"V");
    objc_msgSend((id)qword_100560F10, "putWithId:withId:", +[IOSClass BOOLeanClass](IOSClass, "BOOLeanClass"), @"Z");
    atomic_store(1u, (unsigned __int8 *)LibcoreReflectTypes__initialized);
  }
}

+ (id)__annotations_getTypeArrayWithLibcoreReflectListOfTypes_withBoolean_
{
  v3 = [[ComGoogleJ2objcAnnotationsObjectiveCName alloc] initWithValue:@"getTypeArray:clone:"];
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_getTypeWithJavaLangReflectType_
{
  v3 = [[ComGoogleJ2objcAnnotationsObjectiveCName alloc] initWithValue:@"getType:"];
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_getSignatureWithIOSClass_
{
  v3 = [[ComGoogleJ2objcAnnotationsObjectiveCName alloc] initWithValue:@"getSignature:"];
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_toStringWithIOSClassArray_
{
  v3 = [[ComGoogleJ2objcAnnotationsObjectiveCName alloc] initWithValue:@"toString:"];
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_appendTypeNameWithJavaLangStringBuilder_withIOSClass_
{
  v3 = [[ComGoogleJ2objcAnnotationsObjectiveCName alloc] initWithValue:@"appendTypeName:class:"];
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_appendArrayGenericTypeWithJavaLangStringBuilder_withJavaLangReflectTypeArray_
{
  v3 = [[ComGoogleJ2objcAnnotationsObjectiveCName alloc] initWithValue:@"appendArrayGenericType:types:"];
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_appendGenericTypeWithJavaLangStringBuilder_withJavaLangReflectType_
{
  v3 = [[ComGoogleJ2objcAnnotationsObjectiveCName alloc] initWithValue:@"appendGenericType:type:"];
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004483C0;
}

@end