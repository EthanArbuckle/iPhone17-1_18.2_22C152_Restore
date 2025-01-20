@interface JavaLangStackTraceElement
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaLangStackTraceElement)initWithLong:(int64_t)a3;
- (JavaLangStackTraceElement)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6;
- (NSString)description;
- (id)getClassName;
- (id)getFileName;
- (id)getMethodName;
- (int)getLineNumber;
- (unint64_t)hash;
- (void)dealloc;
- (void)initializeFromAddress;
@end

@implementation JavaLangStackTraceElement

- (id)getClassName
{
  return self->declaringClass_;
}

- (void)initializeFromAddress
{
  if (*(void *)(a1 + 40) && !*(void *)(a1 + 16))
  {
    v20 = *(void **)(a1 + 40);
    v2 = backtrace_symbols(&v20, 1);
    uint64_t v3 = +[NSString defaultCStringEncoding];
    v4 = strstr(*v2, "0x");
    v5 = strchr(v4, 32);
    v6 = strndup(v4, v5 - v4);
    *(void *)(a1 + 48) = [objc_alloc((Class)NSString) initWithCString:v6 encoding:v3];
    free(v6);
    unint64_t v7 = (unint64_t)(v5 + 1);
    v8 = strstr(v5 + 1, " + ");
    if (v8)
    {
      v9 = v8;
      *(void *)(a1 + 56) = [objc_alloc((Class)NSString) initWithCString:v8 + 3 encoding:v3];
      char *v9 = 0;
    }
    v10 = strchr(v5 + 1, 91);
    v11 = strchr(v5 + 1, 93);
    if (v10 && v11 && v11 - v10 > 0)
    {
      __stringp = v10 + 1;
      v12 = strsep(&__stringp, "[ ]");
      if (v12 && *v12)
      {
        id v13 = +[IOSClass classForIosName:](IOSClass, "classForIosName:", +[NSString stringWithCString:v12 encoding:v3]);
        if (v13) {
          *(void *)(a1 + 8) = [v13 getName];
        }
      }
      v14 = strsep(&__stringp, "[ ]");
      if (!v14) {
        goto LABEL_24;
      }
      unsigned __int8 v15 = 58;
    }
    else
    {
      uint64_t v16 = 0;
      while (*(unsigned __int8 *)(v7 + v16++))
        ;
      while (1)
      {
        if ((unint64_t)&v5[v16 - 1] <= v7 || v5[v16 - 1] == 95)
        {
          if (v16 == 2) {
            goto LABEL_22;
          }
          id v18 = +[IOSClass classForIosName:](IOSClass, "classForIosName:", [objc_alloc((Class)NSString) initWithBytesNoCopy:v5 + 1 length:v16 - 2 encoding:v3 freeWhenDone:0]);
          if (v18) {
            break;
          }
        }
        --v16;
      }
      *(void *)(a1 + 8) = [v18 getName];
      unint64_t v7 = (unint64_t)&v5[v16];
LABEL_22:
      v14 = (char *)v7;
      unsigned __int8 v15 = 95;
    }
    *(void *)(a1 + 16) = sub_1001DFEE4(v14, v15, v3);
LABEL_24:
    free(v2);
  }
}

- (id)getMethodName
{
  return self->methodName_;
}

- (id)getFileName
{
  return self->fileName_;
}

- (int)getLineNumber
{
  return self->lineNumber_;
}

- (JavaLangStackTraceElement)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6
{
  self->lineNumber_ = a6;
  return self;
}

- (JavaLangStackTraceElement)initWithLong:(int64_t)a3
{
  return self;
}

- (NSString)description
{
  -[JavaLangStackTraceElement initializeFromAddress]_0((uint64_t)self);
  uint64_t v3 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v3 appendWithNSString:self->hexAddress_];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@" "];
  if (self->declaringClass_)
  {
    -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:");
    [(JavaLangStringBuilder *)v3 appendWithChar:46];
  }
  if (self->methodName_) {
    -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:");
  }
  if (!self->fileName_ && self->lineNumber_ == -1)
  {
    if (self->declaringClass_) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@"()"];
    }
  }
  else
  {
    [(JavaLangStringBuilder *)v3 appendWithChar:40];
    if (self->fileName_) {
      -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:");
    }
    if (self->lineNumber_ != -1)
    {
      [(JavaLangStringBuilder *)v3 appendWithChar:58];
      [(JavaLangStringBuilder *)v3 appendWithInt:self->lineNumber_];
    }
    [(JavaLangStringBuilder *)v3 appendWithChar:41];
  }
  if (self->offset_)
  {
    [(JavaLangStringBuilder *)v3 appendWithNSString:@" + "];
    [(JavaLangStringBuilder *)v3 appendWithNSString:self->offset_];
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_16;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  v5 = (void *)*((void *)a3 + 1);
  if (!v5) {
LABEL_16:
  }
    JreThrowNullPointerException();
  unsigned int v6 = [v5 isEqual:self->declaringClass_];
  if (v6)
  {
    if (*((_DWORD *)a3 + 8) == self->lineNumber_)
    {
      unsigned int v6 = JavaUtilObjects_equalsWithId_withId_(self->methodName_, *((void *)a3 + 2));
      if (v6)
      {
        fileName = self->fileName_;
        uint64_t v8 = *((void *)a3 + 3);
        LOBYTE(v6) = JavaUtilObjects_equalsWithId_withId_(fileName, v8);
      }
      return v6;
    }
LABEL_12:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)hash
{
  declaringClass = self->declaringClass_;
  if (!declaringClass
    || (unsigned int v4 = [(NSString *)declaringClass hash], (methodName = self->methodName_) == 0))
  {
    JreThrowNullPointerException();
  }
  unsigned int v6 = [(NSString *)methodName hash] - v4 + 32 * v4;
  unsigned int v7 = JavaUtilObjects_hashCodeWithId_(self->fileName_);
  return (int)(self->lineNumber_ - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangStackTraceElement;
  [(JavaLangStackTraceElement *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100431610;
}

@end