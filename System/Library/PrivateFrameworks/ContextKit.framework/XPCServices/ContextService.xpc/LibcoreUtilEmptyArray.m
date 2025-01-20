@interface LibcoreUtilEmptyArray
+ (const)__metadata;
+ (void)initialize;
@end

@implementation LibcoreUtilEmptyArray

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume(&LibcoreUtilEmptyArray_BOOLEAN_, +[IOSBooleanArray newArrayWithLength:0]);
    JreStrongAssignAndConsume((id *)&LibcoreUtilEmptyArray_BYTE_, +[IOSByteArray newArrayWithLength:0]);
    JreStrongAssignAndConsume((id *)&LibcoreUtilEmptyArray_CHAR_, +[IOSCharArray newArrayWithLength:0]);
    JreStrongAssignAndConsume((id *)&LibcoreUtilEmptyArray_DOUBLE_, +[IOSDoubleArray newArrayWithLength:0]);
    JreStrongAssignAndConsume(&LibcoreUtilEmptyArray_INT_, +[IOSIntArray newArrayWithLength:0]);
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:IOSClass_class_()];
    JreStrongAssignAndConsume((id *)&LibcoreUtilEmptyArray_CLASS_, v2);
    id v3 = +[IOSObjectArray newArrayWithLength:0 type:NSObject_class_()];
    JreStrongAssignAndConsume((id *)&LibcoreUtilEmptyArray_OBJECT_, v3);
    id v4 = +[IOSObjectArray newArrayWithLength:0 type:NSString_class_()];
    JreStrongAssignAndConsume((id *)&LibcoreUtilEmptyArray_STRING_, v4);
    id v5 = +[IOSObjectArray newArrayWithLength:0 type:JavaLangThrowable_class_()];
    JreStrongAssignAndConsume(&LibcoreUtilEmptyArray_THROWABLE_, v5);
    id v6 = +[IOSObjectArray newArrayWithLength:0 type:JavaLangStackTraceElement_class_()];
    JreStrongAssignAndConsume(&LibcoreUtilEmptyArray_STACK_TRACE_ELEMENT_, v6);
    id v7 = +[IOSObjectArray newArrayWithLength:0 type:JavaLangReflectType_class_()];
    JreStrongAssignAndConsume((id *)&LibcoreUtilEmptyArray_TYPE_, v7);
    id v8 = +[IOSObjectArray newArrayWithLength:0 type:JavaLangReflectTypeVariable_class_()];
    JreStrongAssignAndConsume((id *)&LibcoreUtilEmptyArray_TYPE_VARIABLE_, v8);
    atomic_store(1u, (unsigned __int8 *)LibcoreUtilEmptyArray__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100424D70;
}

@end