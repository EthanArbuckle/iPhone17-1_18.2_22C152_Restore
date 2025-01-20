@interface JavaUtilLoggingLevel
+ (const)__metadata;
+ (id)parseWithNSString:(id)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaUtilLoggingLevel)initWithNSString:(id)a3 withInt:(int)a4;
- (JavaUtilLoggingLevel)initWithNSString:(id)a3 withInt:(int)a4 withNSString:(id)a5;
- (NSString)description;
- (id)getLocalizedName;
- (id)getName;
- (id)getResourceBundleName;
- (id)readResolve;
- (int)intValue;
- (unint64_t)hash;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
@end

@implementation JavaUtilLoggingLevel

+ (id)parseWithNSString:(id)a3
{
  return JavaUtilLoggingLevel_parseWithNSString_(a3);
}

- (JavaUtilLoggingLevel)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

- (JavaUtilLoggingLevel)initWithNSString:(id)a3 withInt:(int)a4 withNSString:(id)a5
{
  return self;
}

- (id)getName
{
  return self->name_;
}

- (id)getResourceBundleName
{
  return self->resourceBundleName_;
}

- (int)intValue
{
  return self->value_;
}

- (id)readResolve
{
  v3 = (void *)qword_100560E18;
  objc_sync_enter((id)qword_100560E18);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = (void *)qword_100560E18;
  if (!qword_100560E18) {
LABEL_16:
  }
    JreThrowNullPointerException();
  id v5 = [(id)qword_100560E18 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(JavaUtilLoggingLevel **)(*((void *)&v11 + 1) + 8 * i);
        if (!v8) {
          goto LABEL_16;
        }
        if (self->value_ == v8->value_)
        {
          name = self->name_;
          if (!name) {
            goto LABEL_16;
          }
          if (-[NSString isEqual:](name, "isEqual:", v8->name_, (void)v11)
            && (LibcoreUtilObjects_equalWithId_withId_((uint64_t)self->resourceBundleName_, (uint64_t)v8->resourceBundleName_) & 1) != 0)
          {
            goto LABEL_15;
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  objc_msgSend((id)qword_100560E18, "addWithId:", self, (void)v11);
  v8 = self;
LABEL_15:
  objc_sync_exit(v3);
  return v8;
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  resourceBundleName = (__CFString *)self->resourceBundleName_;
  if (resourceBundleName)
  {
    BundleWithNSString = JavaUtilResourceBundle_getBundleWithNSString_(resourceBundleName);
    JreStrongAssign((id *)&self->rb_, BundleWithNSString);
  }
}

- (id)getLocalizedName
{
  rb = self->rb_;
  name = self->name_;
  if (rb) {
    return [(JavaUtilResourceBundle *)rb getStringWithNSString:name];
  }
  return name;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return *((_DWORD *)a3 + 4) == self->value_;
}

- (unint64_t)hash
{
  return self->value_;
}

- (NSString)description
{
  return self->name_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLoggingLevel;
  [(JavaUtilLoggingLevel *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilArrayList_initWithInt_(9);
    JreStrongAssignAndConsume((id *)&qword_100560E18, v2);
    objc_super v3 = [JavaUtilLoggingLevel alloc];
    JavaUtilLoggingLevel_initWithNSString_withInt_withNSString_((uint64_t)v3, @"OFF", 0x7FFFFFFF, 0);
    JreStrongAssignAndConsume((id *)&JavaUtilLoggingLevel_OFF_, v3);
    v4 = [JavaUtilLoggingLevel alloc];
    JavaUtilLoggingLevel_initWithNSString_withInt_withNSString_((uint64_t)v4, @"SEVERE", 1000, 0);
    JreStrongAssignAndConsume((id *)&JavaUtilLoggingLevel_SEVERE_, v4);
    id v5 = [JavaUtilLoggingLevel alloc];
    JavaUtilLoggingLevel_initWithNSString_withInt_withNSString_((uint64_t)v5, @"WARNING", 900, 0);
    JreStrongAssignAndConsume((id *)&JavaUtilLoggingLevel_WARNING_, v5);
    uint64_t v6 = [JavaUtilLoggingLevel alloc];
    JavaUtilLoggingLevel_initWithNSString_withInt_withNSString_((uint64_t)v6, @"INFO", 800, 0);
    JreStrongAssignAndConsume((id *)&JavaUtilLoggingLevel_INFO_, v6);
    v7 = [JavaUtilLoggingLevel alloc];
    JavaUtilLoggingLevel_initWithNSString_withInt_withNSString_((uint64_t)v7, @"CONFIG", 700, 0);
    JreStrongAssignAndConsume((id *)&JavaUtilLoggingLevel_CONFIG_, v7);
    v8 = [JavaUtilLoggingLevel alloc];
    JavaUtilLoggingLevel_initWithNSString_withInt_withNSString_((uint64_t)v8, @"FINE", 500, 0);
    JreStrongAssignAndConsume((id *)&JavaUtilLoggingLevel_FINE_, v8);
    v9 = [JavaUtilLoggingLevel alloc];
    JavaUtilLoggingLevel_initWithNSString_withInt_withNSString_((uint64_t)v9, @"FINER", 400, 0);
    JreStrongAssignAndConsume((id *)&JavaUtilLoggingLevel_FINER_, v9);
    v10 = [JavaUtilLoggingLevel alloc];
    JavaUtilLoggingLevel_initWithNSString_withInt_withNSString_((uint64_t)v10, @"FINEST", 300, 0);
    JreStrongAssignAndConsume((id *)&JavaUtilLoggingLevel_FINEST_, v10);
    long long v11 = [JavaUtilLoggingLevel alloc];
    JavaUtilLoggingLevel_initWithNSString_withInt_withNSString_((uint64_t)v11, @"ALL", 0x80000000, 0);
    JreStrongAssignAndConsume((id *)&JavaUtilLoggingLevel_ALL_, v11);
    atomic_store(1u, (unsigned __int8 *)JavaUtilLoggingLevel__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100440960;
}

@end