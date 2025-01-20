@interface JavaLangEnum_$1
+ (const)__metadata;
- (JavaLangEnum_$1)initWithInt:(int)a3;
- (id)createWithId:(id)a3;
@end

@implementation JavaLangEnum_$1

- (id)createWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (![a3 isEnum]) {
    return 0;
  }
  if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v4 = [a3 getDeclaredMethod:@"values" parameterTypes:LibcoreUtilEmptyArray_CLASS_];
  v5 = v4;
  if (!v4) {
    JreThrowNullPointerException();
  }
  [v4 setAccessibleWithBoolean:1];
  id v6 = objc_msgSend(v5, "invokeWithId:withNSObjectArray:", 0, +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, NSObject_class_()));
  objc_opt_class();
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v6;
}

- (JavaLangEnum_$1)initWithInt:(int)a3
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100488390;
}

@end