@interface JavaLangThrowable
+ (J2ObjcClassInfo)__metadata;
- (JavaLangThrowable)init;
- (JavaLangThrowable)initWithJavaLangThrowable:(id)a3;
- (JavaLangThrowable)initWithNSString:(id)a3;
- (JavaLangThrowable)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
- (JavaLangThrowable)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6;
- (NSString)description;
- (id)fillInStackTrace;
- (id)filterStackTrace;
- (id)getCause;
- (id)getMessage;
- (id)getSuppressed;
- (id)initCauseWithJavaLangThrowable:(id)a3;
- (void)addSuppressedWithJavaLangThrowable:(id)a3;
- (void)dealloc;
- (void)maybeFreeRawCallStack;
- (void)printStackTrace;
- (void)printStackTraceWithJavaIoPrintStream:(id)a3;
- (void)printStackTraceWithJavaIoPrintWriter:(id)a3;
- (void)setStackTraceWithJavaLangStackTraceElementArray:(id)a3;
@end

@implementation JavaLangThrowable

- (JavaLangThrowable)init
{
  return self;
}

- (JavaLangThrowable)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangThrowable)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
  return self;
}

- (JavaLangThrowable)initWithJavaLangThrowable:(id)a3
{
  if (a3) {
    id v5 = [a3 description];
  }
  else {
    id v5 = 0;
  }
  JavaLangThrowable_initWithNSString_withJavaLangThrowable_withBoolean_withBoolean_(self, v5, a3, 1, 1);
  return self;
}

- (JavaLangThrowable)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6
{
  return self;
}

- (id)filterStackTrace
{
  v3 = &OBJC_IVAR___JavaUtilConcurrentConcurrentHashMap_keySet_ConcurrentHashMap_;
  if (self->rawCallStack)
  {
    objc_sync_enter(self);
    if (self->rawCallStack)
    {
      id v4 = +[NSMutableArray array];
      if (self->rawFrameCount)
      {
        unint64_t v5 = 0;
        do
        {
          v6 = [[JavaLangStackTraceElement alloc] initWithLong:self->rawCallStack[v5]];
          id v7 = [(JavaLangStackTraceElement *)v6 getClassName];
          v8 = v7;
          if (v7
            && ([v7 isEqualToString:@"NSInvocation"] & 1) == 0
            && (![v8 isEqualToString:@"java.lang.Throwable"]
             || (objc_msgSend(-[JavaLangStackTraceElement getMethodName](v6, "getMethodName"), "isEqualToString:", @"<init>") & 1) == 0))
          {
            [v4 addObject:v6];
          }
          ++v5;
        }
        while (v5 < self->rawFrameCount);
      }
      id v9 = [v4 lastObject];
      if (objc_msgSend(objc_msgSend(v9, "getClassName"), "isEqualToString:", @"JavaLangReflectMethod")&& objc_msgSend(objc_msgSend(v9, "getMethodName"), "isEqualToString:", @"invoke"))
      {
        [v4 removeLastObject];
      }
      v10 = +[IOSObjectArray arrayWithNSArray:v4 type:JavaLangStackTraceElement_class_()];
      v3 = &OBJC_IVAR___JavaUtilConcurrentConcurrentHashMap_keySet_ConcurrentHashMap_;
      self->stackTrace = v10;
      free(self->rawCallStack);
      self->rawCallStack = 0;
    }
    objc_sync_exit(self);
  }
  return *(Class *)((char *)&self->super.super.isa + v3[338]);
}

- (id)fillInStackTrace
{
  return self;
}

- (id)getCause
{
  return self->cause;
}

- (id)getMessage
{
  return self->detailMessage;
}

- (id)initCauseWithJavaLangThrowable:(id)a3
{
  if (self->cause)
  {
    unint64_t v5 = [JavaLangIllegalStateException alloc];
    CFStringRef v6 = @"Can't overwrite cause";
    goto LABEL_6;
  }
  if (a3 == self)
  {
    unint64_t v5 = [JavaLangIllegalArgumentException alloc];
    CFStringRef v6 = @"Self-causation not permitted";
LABEL_6:
    id v7 = [(JavaLangIllegalStateException *)v5 initWithNSString:v6];
    v8 = v7;
    objc_exception_throw(v7);
  }
  self->cause = (JavaLangThrowable *)a3;
  return self;
}

- (void)printStackTrace
{
  if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = JavaLangSystem_err_;
  [(JavaLangThrowable *)self printStackTraceWithJavaIoPrintStream:v3];
}

- (void)printStackTraceWithJavaIoPrintWriter:(id)a3
{
  objc_msgSend(a3, "printlnWithNSString:", -[JavaLangThrowable description](self, "description"));
  unint64_t v5 = [(JavaLangThrowable *)self filterStackTrace];
  if (v5[2] >= 1)
  {
    CFStringRef v6 = v5;
    uint64_t v7 = 0;
    do
    {
      [a3 printWithNSString:@"\tat "];
      [a3 printlnWithId:*(void *)&v6[2 * v7++ + 6]];
    }
    while (v7 < v6[2]);
  }
  if (self->cause)
  {
    [a3 printWithNSString:@"Caused by: "];
    cause = self->cause;
    [(JavaLangThrowable *)cause printStackTraceWithJavaIoPrintWriter:a3];
  }
}

- (void)printStackTraceWithJavaIoPrintStream:(id)a3
{
  objc_msgSend(a3, "printlnWithNSString:", -[JavaLangThrowable description](self, "description"));
  unint64_t v5 = [(JavaLangThrowable *)self filterStackTrace];
  if (v5[2] >= 1)
  {
    CFStringRef v6 = v5;
    uint64_t v7 = 0;
    do
    {
      [a3 printWithNSString:@"\tat "];
      [a3 printlnWithId:*(void *)&v6[2 * v7++ + 6]];
    }
    while (v7 < v6[2]);
  }
  if (self->cause)
  {
    [a3 printWithNSString:@"Caused by: "];
    cause = self->cause;
    [(JavaLangThrowable *)cause printStackTraceWithJavaIoPrintStream:a3];
  }
}

- (void)setStackTraceWithJavaLangStackTraceElementArray:(id)a3
{
  if (!a3) {
    goto LABEL_12;
  }
  uint64_t v5 = *((unsigned int *)a3 + 2);
  if ((int)v5 >= 1)
  {
    CFStringRef v6 = (char *)a3 + 24;
    while (*v6)
    {
      ++v6;
      if (!--v5) {
        goto LABEL_6;
      }
    }
LABEL_12:
    JreThrowNullPointerException();
  }
LABEL_6:
  objc_sync_enter(self);
  if (self->stackTrace || self->rawCallStack)
  {
    [(JavaLangThrowable *)self maybeFreeRawCallStack];
    uint64_t v7 = self->stackTrace;
  }
  self->stackTrace = (IOSObjectArray *)a3;
  objc_sync_exit(self);
}

- (void)addSuppressedWithJavaLangThrowable:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (a3 == self) {
    objc_exception_throw(objc_alloc_init(JavaLangIllegalArgumentException));
  }
  if (self->suppressedExceptions)
  {
    objc_sync_enter(self);
    suppressedExceptions = self->suppressedExceptions;
    if (suppressedExceptions) {
      int size = suppressedExceptions->super.size_;
    }
    else {
      int size = 0;
    }
    if (qword_100560DF0 != -1) {
      dispatch_once(&qword_100560DF0, &stru_10043E4C8);
    }
    uint64_t v7 = +[IOSObjectArray newArrayWithLength:size + 1 type:qword_100560DE8];
    if (size >= 1)
    {
      for (uint64_t i = 0; i != size; ++i)
        [(IOSObjectArray *)v7 replaceObjectAtIndex:i withObject:(&self->suppressedExceptions->elementType_)[i]];
    }
    [(IOSObjectArray *)v7 replaceObjectAtIndex:size withObject:a3];

    self->suppressedExceptions = v7;
    objc_sync_exit(self);
  }
}

- (id)getSuppressed
{
  if (self->suppressedExceptions)
  {
    return +[IOSObjectArray arrayWithArray:](IOSObjectArray, "arrayWithArray:");
  }
  else
  {
    if (qword_100560DF0 != -1) {
      dispatch_once(&qword_100560DF0, &stru_10043E4C8);
    }
    uint64_t v3 = qword_100560DE8;
    return +[IOSObjectArray arrayWithLength:0 type:v3];
  }
}

- (NSString)description
{
  uint64_t v3 = (NSString *)objc_msgSend(-[JavaLangThrowable getClass](self, "getClass"), "getName");
  id v4 = [(JavaLangThrowable *)self getMessage];
  if (v4) {
    return +[NSString stringWithFormat:@"%@: %@", v3, v4];
  }
  else {
    return v3;
  }
}

- (void)maybeFreeRawCallStack
{
  rawCallStack = self->rawCallStack;
  if (rawCallStack)
  {
    free(rawCallStack);
    self->rawCallStack = 0;
  }
}

- (void)dealloc
{
  [(JavaLangThrowable *)self maybeFreeRawCallStack];

  v3.receiver = self;
  v3.super_class = (Class)JavaLangThrowable;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (J2ObjcClassInfo)__metadata
{
  return (J2ObjcClassInfo *)&unk_10055CD18;
}

@end