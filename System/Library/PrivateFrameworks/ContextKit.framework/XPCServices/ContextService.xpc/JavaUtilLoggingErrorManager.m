@interface JavaUtilLoggingErrorManager
+ (const)__metadata;
+ (void)initialize;
- (void)errorWithNSString:(id)a3 withJavaLangException:(id)a4 withInt:(int)a5;
@end

@implementation JavaUtilLoggingErrorManager

- (void)errorWithNSString:(id)a3 withJavaLangException:(id)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  objc_sync_enter(self);
  if (self->called_)
  {
    objc_sync_exit(self);
  }
  else
  {
    self->called_ = 1;
    objc_sync_exit(self);
    if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v9 = (void *)JavaLangSystem_err_;
    if (!JavaLangSystem_err_
      || (id v10 = objc_msgSend(-[JavaUtilLoggingErrorManager getClass](self, "getClass"), "getName"), !qword_1005608B8))
    {
      JreThrowNullPointerException();
    }
    v18 = v10;
    uint64_t v19 = *(unsigned int *)(qword_1005608B8 + 8);
    if ((v5 & 0x80000000) != 0 || (int)v19 <= (int)v5) {
      IOSArray_throwOutOfBoundsWithMsg(v19, v5);
    }
    objc_msgSend(v9, "printlnWithNSString:", JreStrcat("$$$", v11, v12, v13, v14, v15, v16, v17, v18));
    if (a3)
    {
      if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      objc_msgSend((id)JavaLangSystem_err_, "printlnWithNSString:", JreStrcat("$$", v20, v21, v22, v23, v24, v25, v26, @"Error message - "));
    }
    if (a4)
    {
      if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      v27 = (void *)JavaLangSystem_err_;
      CFStringRef v28 = JreStrcat("$@", v20, v21, v22, v23, v24, v25, v26, @"Exception - ");
      [v27 printlnWithNSString:v28];
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3[0] = off_1003FEEB8;
    v3[1] = off_1003FEEC8;
    v3[2] = off_1003FEED8;
    id v2 = +[IOSObjectArray newArrayWithObjects:v3 count:6 type:NSString_class_()];
    JreStrongAssignAndConsume((id *)&qword_1005608B8, v2);
    atomic_store(1u, JavaUtilLoggingErrorManager__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FF108;
}

@end