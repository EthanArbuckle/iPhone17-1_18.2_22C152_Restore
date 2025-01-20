@interface JavaLangReflectArray
+ (BOOL)getBooleanWithId:(id)a3 withInt:(int)a4;
+ (char)getByteWithId:(id)a3 withInt:(int)a4;
+ (const)__metadata;
+ (double)getDoubleWithId:(id)a3 withInt:(int)a4;
+ (float)getFloatWithId:(id)a3 withInt:(int)a4;
+ (id)badArrayWithId:(id)a3;
+ (id)createMultiArrayWithIOSClass:(id)a3 withIntArray:(id)a4;
+ (id)createObjectArrayWithIOSClass:(id)a3 withInt:(int)a4;
+ (id)getWithId:(id)a3 withInt:(int)a4;
+ (id)incompatibleTypeWithId:(id)a3;
+ (id)newInstanceWithIOSClass:(id)a3 withInt:(int)a4;
+ (id)newInstanceWithIOSClass:(id)a3 withIntArray:(id)a4;
+ (id)notAnArrayWithId:(id)a3;
+ (int)getIntWithId:(id)a3 withInt:(int)a4;
+ (int)getLengthWithId:(id)a3;
+ (int64_t)getLongWithId:(id)a3 withInt:(int)a4;
+ (signed)getShortWithId:(id)a3 withInt:(int)a4;
+ (unsigned)getCharWithId:(id)a3 withInt:(int)a4;
+ (void)setBooleanWithId:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
+ (void)setByteWithId:(id)a3 withInt:(int)a4 withByte:(char)a5;
+ (void)setCharWithId:(id)a3 withInt:(int)a4 withChar:(unsigned __int16)a5;
+ (void)setDoubleWithId:(id)a3 withInt:(int)a4 withDouble:(double)a5;
+ (void)setFloatWithId:(id)a3 withInt:(int)a4 withFloat:(float)a5;
+ (void)setIntWithId:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)setLongWithId:(id)a3 withInt:(int)a4 withLong:(int64_t)a5;
+ (void)setShortWithId:(id)a3 withInt:(int)a4 withShort:(signed __int16)a5;
+ (void)setWithId:(id)a3 withInt:(int)a4 withId:(id)a5;
@end

@implementation JavaLangReflectArray

+ (id)notAnArrayWithId:(id)a3
{
}

+ (id)incompatibleTypeWithId:(id)a3
{
}

+ (id)badArrayWithId:(id)a3
{
}

+ (id)getWithId:(id)a3 withInt:(int)a4
{
  return JavaLangReflectArray_getWithId_withInt_((unsigned int *)a3, *(uint64_t *)&a4);
}

+ (BOOL)getBooleanWithId:(id)a3 withInt:(int)a4
{
  return JavaLangReflectArray_getBooleanWithId_withInt_((unsigned int *)a3, *(uint64_t *)&a4);
}

+ (char)getByteWithId:(id)a3 withInt:(int)a4
{
  return JavaLangReflectArray_getByteWithId_withInt_((unsigned int *)a3, *(uint64_t *)&a4);
}

+ (unsigned)getCharWithId:(id)a3 withInt:(int)a4
{
  return JavaLangReflectArray_getCharWithId_withInt_((unsigned int *)a3, *(uint64_t *)&a4);
}

+ (double)getDoubleWithId:(id)a3 withInt:(int)a4
{
  return JavaLangReflectArray_getDoubleWithId_withInt_((unsigned int *)a3, *(uint64_t *)&a4);
}

+ (float)getFloatWithId:(id)a3 withInt:(int)a4
{
  return JavaLangReflectArray_getFloatWithId_withInt_((unsigned int *)a3, *(uint64_t *)&a4);
}

+ (int)getIntWithId:(id)a3 withInt:(int)a4
{
  return JavaLangReflectArray_getIntWithId_withInt_((unsigned int *)a3, *(uint64_t *)&a4);
}

+ (int)getLengthWithId:(id)a3
{
  return JavaLangReflectArray_getLengthWithId_((unsigned int *)a3);
}

+ (int64_t)getLongWithId:(id)a3 withInt:(int)a4
{
  return JavaLangReflectArray_getLongWithId_withInt_((unsigned int *)a3, *(uint64_t *)&a4);
}

+ (signed)getShortWithId:(id)a3 withInt:(int)a4
{
  return JavaLangReflectArray_getShortWithId_withInt_((unsigned int *)a3, *(uint64_t *)&a4);
}

+ (id)newInstanceWithIOSClass:(id)a3 withIntArray:(id)a4
{
  return JavaLangReflectArray_newInstanceWithIOSClass_withIntArray_(a3, (uint64_t)a4, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
}

+ (id)createMultiArrayWithIOSClass:(id)a3 withIntArray:(id)a4
{
  return +[IOSObjectArray arrayWithDimensions:*((int *)a4 + 2) lengths:(char *)a4 + 12 type:a3];
}

+ (id)newInstanceWithIOSClass:(id)a3 withInt:(int)a4
{
  return JavaLangReflectArray_newInstanceWithIOSClass_withInt_(a3, a4);
}

+ (id)createObjectArrayWithIOSClass:(id)a3 withInt:(int)a4
{
  return +[IOSObjectArray arrayWithLength:a4 type:a3];
}

+ (void)setWithId:(id)a3 withInt:(int)a4 withId:(id)a5
{
}

+ (void)setBooleanWithId:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
}

+ (void)setByteWithId:(id)a3 withInt:(int)a4 withByte:(char)a5
{
}

+ (void)setCharWithId:(id)a3 withInt:(int)a4 withChar:(unsigned __int16)a5
{
}

+ (void)setDoubleWithId:(id)a3 withInt:(int)a4 withDouble:(double)a5
{
}

+ (void)setFloatWithId:(id)a3 withInt:(int)a4 withFloat:(float)a5
{
}

+ (void)setIntWithId:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)setLongWithId:(id)a3 withInt:(int)a4 withLong:(int64_t)a5
{
}

+ (void)setShortWithId:(id)a3 withInt:(int)a4 withShort:(signed __int16)a5
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FCEC0;
}

@end