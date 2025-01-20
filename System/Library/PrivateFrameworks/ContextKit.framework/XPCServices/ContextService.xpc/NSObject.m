@interface NSObject
+ (J2ObjcClassInfo)__metadata;
- (id)clone;
- (id)getClass;
- (int)compareToWithId:(id)a3;
- (void)notify;
- (void)notifyAll;
- (void)wait;
- (void)waitWithLong:(int64_t)a3;
- (void)waitWithLong:(int64_t)a3 withInt:(int)a4;
@end

@implementation NSObject

- (id)clone
{
  if (([(id)NSCopying_class_() isInstance:self] & 1) == 0) {
    objc_exception_throw(objc_alloc_init(JavaLangCloneNotSupportedException));
  }
  Superclass = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(Superclass);
  v5 = (objc_class *)objc_opt_class();
  size_t v6 = class_getInstanceSize(v5);
  v7 = (char *)[Superclass alloc];
  memcpy(&v7[v6], (char *)self + v6, InstanceSize - v6);
  for (; Superclass; Superclass = class_getSuperclass(Superclass))
  {
    if (Superclass == (objc_class *)objc_opt_class()) {
      break;
    }
    unsigned int outCount = 0;
    v8 = class_copyIvarList(Superclass, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        v10 = v8[i];
        if (*ivar_getTypeEncoding(v10) == 64) {
          id v11 = *(id *)&v7[ivar_getOffset(v10)];
        }
      }
    }
    free(v8);
  }
  objc_msgSend(v7, "__javaClone");
  return v7;
}

- (id)getClass
{
  uint64_t v2 = objc_opt_class();
  return (id)IOSClass_fromClass(v2);
}

- (int)compareToWithId:(id)a3
{
}

- (void)notify
{
  uint64_t v2 = j2objc_sync_notify((unint64_t)self);
  if (v2)
  {
    if (v2 == -1) {
      v3 = objc_alloc_init(JavaLangIllegalMonitorStateException);
    }
    else {
      v3 = [[JavaLangInternalError alloc] initWithNSString:+[NSString stringWithFormat:@"system error %d", v2]];
    }
    objc_exception_throw(v3);
  }
}

- (void)notifyAll
{
  uint64_t v2 = j2objc_sync_notifyAll((unint64_t)self);
  if (v2)
  {
    if (v2 == -1) {
      v3 = objc_alloc_init(JavaLangIllegalMonitorStateException);
    }
    else {
      v3 = [[JavaLangInternalError alloc] initWithNSString:+[NSString stringWithFormat:@"system error %d", v2]];
    }
    objc_exception_throw(v3);
  }
}

- (void)wait
{
}

- (void)waitWithLong:(int64_t)a3
{
}

- (void)waitWithLong:(int64_t)a3 withInt:(int)a4
{
  if (a4 < 0) {
    objc_exception_throw(objc_alloc_init(JavaLangIllegalArgumentException));
  }
  if (a4) {
    int64_t v5 = a3 + 1;
  }
  else {
    int64_t v5 = a3;
  }
  sub_1002794CC((unint64_t)self, v5);
}

+ (J2ObjcClassInfo)__metadata
{
  return (J2ObjcClassInfo *)&unk_10055F5D8;
}

@end