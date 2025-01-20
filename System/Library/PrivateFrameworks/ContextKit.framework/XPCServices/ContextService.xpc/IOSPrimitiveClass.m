@interface IOSPrimitiveClass
- (BOOL)__convertRawValue:(id *)a3 toType:(id)a4;
- (BOOL)__unboxValue:(id)a3 toRawValue:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstance:(id)a3;
- (BOOL)isPrimitive;
- (Class)objcArrayClass;
- (IOSPrimitiveClass)initWithName:(id)a3 type:(id)a4;
- (id)__boxValue:(id *)a3;
- (id)binaryName;
- (id)description;
- (id)getCanonicalName;
- (id)getConstructorWithClasses:(id)a3;
- (id)getDeclaredMethod:(id)a3;
- (id)getDeclaredMethods;
- (id)getMethod:(id)a3;
- (id)getName;
- (id)getSimpleName;
- (id)objcName;
- (id)wrapperClass;
- (int)getModifiers;
- (unint64_t)getSizeof;
- (unint64_t)hash;
- (void)__readRawValue:(id *)a3 fromAddress:(const void *)a4;
- (void)__writeRawValue:(id *)a3 toAddress:(const void *)a4;
- (void)dealloc;
@end

@implementation IOSPrimitiveClass

- (IOSPrimitiveClass)initWithName:(id)a3 type:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)IOSPrimitiveClass;
  v6 = [(IOSPrimitiveClass *)&v8 init];
  if (v6)
  {
    v6->name_ = (NSString *)a3;
    v6->type_ = (NSString *)a4;
  }
  return v6;
}

- (id)getName
{
  return self->name_;
}

- (id)getSimpleName
{
  return self->name_;
}

- (id)getCanonicalName
{
  return self->name_;
}

- (id)objcName
{
  return self->name_;
}

- (id)description
{
  return self->name_;
}

- (BOOL)isInstance:(id)a3
{
  return 0;
}

- (int)getModifiers
{
  return 1041;
}

- (id)getDeclaredMethods
{
  uint64_t v2 = JavaLangReflectMethod_class_();
  return +[IOSObjectArray arrayWithLength:0 type:v2];
}

- (id)getMethod:(id)a3
{
  v3 = objc_alloc_init(JavaLangNoSuchMethodException);
  v4 = v3;
  objc_exception_throw(v3);
}

- (id)getDeclaredMethod:(id)a3
{
  v3 = objc_alloc_init(JavaLangNoSuchMethodException);
  v4 = v3;
  objc_exception_throw(v3);
}

- (id)getConstructorWithClasses:(id)a3
{
  v3 = objc_alloc_init(JavaLangNoSuchMethodException);
  v4 = v3;
  objc_exception_throw(v3);
}

- (BOOL)isPrimitive
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  name = self->name_;
  uint64_t v6 = *((void *)a3 + 1);
  return [(NSString *)name isEqual:v6];
}

- (unint64_t)hash
{
  return [(NSString *)self->name_ hash];
}

- (id)binaryName
{
  return self->type_;
}

- (Class)objcArrayClass
{
  unsigned int v2 = [(NSString *)self->type_ characterAtIndex:0];
  switch(v2)
  {
    case 'B':
    case 'C':
    case 'D':
    case 'F':
    case 'I':
    case 'J':
      goto LABEL_5;
    case 'E':
    case 'G':
    case 'H':
      return 0;
    default:
      if (v2 != 83 && v2 != 90) {
        return 0;
      }
LABEL_5:
      return (Class)objc_opt_class();
  }
}

- (unint64_t)getSizeof
{
  unsigned int v2 = [(NSString *)self->type_ characterAtIndex:0];
  unint64_t result = 1;
  switch(v2)
  {
    case 'B':
      return result;
    case 'C':
      return 2;
    case 'D':
    case 'J':
      return 8;
    case 'E':
    case 'G':
    case 'H':
      return 0;
    case 'F':
    case 'I':
      return 4;
    default:
      if (v2 == 83) {
        return 2;
      }
      if (v2 != 90) {
        return 0;
      }
      return result;
  }
}

- (id)__boxValue:(id *)a3
{
  unsigned int v4 = [(NSString *)self->type_ characterAtIndex:0];
  switch(v4)
  {
    case 'B':
      int var1 = a3->var1;
      id result = (id)JavaLangByte_valueOfWithByte_(var1);
      break;
    case 'C':
      unsigned int var2 = a3->var2;
      id result = JavaLangCharacter_valueOfWithChar_(var2);
      break;
    case 'D':
      int64_t var5 = a3->var5;
      id result = JavaLangDouble_valueOfWithDouble_(*(double *)&var5);
      break;
    case 'E':
    case 'G':
    case 'H':
      goto LABEL_10;
    case 'F':
      int var4 = a3->var4;
      id result = JavaLangFloat_valueOfWithFloat_(*(float *)&var4);
      break;
    case 'I':
      int v11 = a3->var4;
      id result = JavaLangInteger_valueOfWithInt_(v11);
      break;
    case 'J':
      int64_t v12 = a3->var5;
      id result = JavaLangLong_valueOfWithLong_(v12);
      break;
    default:
      if (v4 == 83)
      {
        int var3 = a3->var3;
        id result = JavaLangShort_valueOfWithShort_(var3);
      }
      else if (v4 == 90)
      {
        int v7 = a3->var1;
        id result = (id)JavaLangBoolean_valueOfWithBoolean_(v7);
      }
      else
      {
LABEL_10:
        id result = 0;
      }
      break;
  }
  return result;
}

- (id)wrapperClass
{
  unsigned int v2 = [(NSString *)self->type_ characterAtIndex:0];
  switch(v2)
  {
    case 'B':
      id result = (id)JavaLangByte_class_();
      break;
    case 'C':
      id result = (id)JavaLangCharacter_class_();
      break;
    case 'D':
      id result = (id)JavaLangDouble_class_();
      break;
    case 'E':
    case 'G':
    case 'H':
      goto LABEL_10;
    case 'F':
      id result = (id)JavaLangFloat_class_();
      break;
    case 'I':
      id result = (id)JavaLangInteger_class_();
      break;
    case 'J':
      id result = (id)JavaLangLong_class_();
      break;
    default:
      if (v2 == 83)
      {
        id result = (id)JavaLangShort_class_();
      }
      else if (v2 == 90)
      {
        id result = (id)JavaLangBoolean_class_();
      }
      else
      {
LABEL_10:
        id result = 0;
      }
      break;
  }
  return result;
}

- (BOOL)__unboxValue:(id)a3 toRawValue:(id *)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a4->int var1 = [a3 charValue];
    id v7 = +[IOSClass byteClass];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a4->unsigned int var2 = (unsigned __int16)[a3 charValue];
      id v7 = +[IOSClass charClass];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a3 doubleValue];
        a4->int64_t var5 = v8;
        id v7 = +[IOSClass doubleClass];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [a3 floatValue];
          a4->int var4 = v9;
          id v7 = +[IOSClass floatClass];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            a4->int var4 = [a3 intValue];
            id v7 = +[IOSClass intClass];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              a4->int64_t var5 = (int64_t)[a3 longValue];
              id v7 = +[IOSClass longClass];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                a4->unsigned int var2 = (unsigned __int16)[a3 shortValue];
                id v7 = +[IOSClass shortClass];
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  return 0;
                }
                a4->int var1 = [a3 BOOLeanValue];
                id v7 = +[IOSClass BOOLeanClass];
              }
            }
          }
        }
      }
    }
  }
  if (!v7) {
    return 0;
  }
  return objc_msgSend(v7, "__convertRawValue:toType:", a4, self);
}

- (void)__readRawValue:(id *)a3 fromAddress:(const void *)a4
{
  unsigned int v6 = [(NSString *)self->type_ characterAtIndex:0];
  switch(v6)
  {
    case 'B':
      goto LABEL_5;
    case 'C':
      goto LABEL_6;
    case 'D':
      a3->var0 = *(void **)a4;
      return;
    case 'E':
    case 'G':
    case 'H':
      return;
    case 'F':
      a3->int var4 = *(_DWORD *)a4;
      return;
    case 'I':
      a3->int var4 = *(_DWORD *)a4;
      return;
    case 'J':
      a3->var0 = *(void **)a4;
      return;
    default:
      if (v6 == 83)
      {
LABEL_6:
        a3->unsigned int var2 = *(_WORD *)a4;
      }
      else if (v6 == 90)
      {
LABEL_5:
        a3->int var1 = *(unsigned char *)a4;
      }
      return;
  }
}

- (void)__writeRawValue:(id *)a3 toAddress:(const void *)a4
{
  unsigned int v6 = [(NSString *)self->type_ characterAtIndex:0];
  switch(v6)
  {
    case 'B':
      goto LABEL_5;
    case 'C':
      goto LABEL_6;
    case 'D':
      *($B8780FE5D3888F6881D07C2E5E281BC0 *)a4 = ($B8780FE5D3888F6881D07C2E5E281BC0)a3->var0;
      return;
    case 'E':
    case 'G':
    case 'H':
      return;
    case 'F':
      *(_DWORD *)a4 = a3->var4;
      return;
    case 'I':
      *(_DWORD *)a4 = a3->var4;
      return;
    case 'J':
      *($B8780FE5D3888F6881D07C2E5E281BC0 *)a4 = ($B8780FE5D3888F6881D07C2E5E281BC0)a3->var0;
      return;
    default:
      if (v6 == 83)
      {
LABEL_6:
        *(_WORD *)a4 = a3->var2;
      }
      else if (v6 == 90)
      {
LABEL_5:
        *(unsigned char *)a4 = a3->var1;
      }
      return;
  }
}

- (BOOL)__convertRawValue:(id *)a3 toType:(id)a4
{
  unsigned int v7 = [a4 isPrimitive];
  if (v7)
  {
    unsigned int v8 = [*((id *)a4 + 2) characterAtIndex:0];
    unsigned int v9 = [(NSString *)self->type_ characterAtIndex:0];
    LOBYTE(v7) = 0;
    switch(v9)
    {
      case 'B':
        LOBYTE(v7) = 1;
        switch(v8)
        {
          case 'B':
            return v7;
          case 'C':
          case 'E':
          case 'G':
          case 'H':
            goto LABEL_32;
          case 'D':
            int var1 = a3->var1;
            goto LABEL_19;
          case 'F':
            *(float *)&unint64_t v10 = (float)a3->var1;
            goto LABEL_39;
          case 'I':
            int var2 = a3->var1;
            goto LABEL_41;
          case 'J':
            int64_t var4 = a3->var1;
            goto LABEL_43;
          default:
            if (v8 != 83) {
              goto LABEL_32;
            }
            a3->int var2 = a3->var1;
            goto LABEL_48;
        }
      case 'C':
        LOBYTE(v7) = 1;
        switch(v8)
        {
          case 'C':
            return v7;
          case 'D':
            LOWORD(v10) = a3->var2;
            v13.var7 = (double)v10;
            goto LABEL_20;
          case 'F':
            LOWORD(v10) = a3->var2;
            *(float *)&unint64_t v10 = (float)v10;
            goto LABEL_39;
          case 'I':
            int var2 = a3->var2;
LABEL_41:
            a3->int64_t var4 = var2;
            break;
          case 'J':
            int64_t var4 = a3->var2;
            goto LABEL_43;
          default:
            goto LABEL_32;
        }
        return v7;
      case 'D':
        BOOL v12 = v8 == 68;
        goto LABEL_11;
      case 'E':
      case 'G':
      case 'H':
        return v7;
      case 'F':
        if (v8 == 70) {
          goto LABEL_48;
        }
        if (v8 != 68) {
          goto LABEL_32;
        }
        v14.var7 = a3->var6;
        goto LABEL_27;
      case 'I':
        LOBYTE(v7) = 1;
        switch(v8)
        {
          case 'D':
            int var1 = a3->var4;
LABEL_19:
            v13.var7 = (double)var1;
LABEL_20:
            a3->var0 = v13.var0;
            break;
          case 'F':
            *(float *)&unint64_t v10 = (float)a3->var4;
LABEL_39:
            a3->int64_t var4 = v10;
            break;
          case 'I':
            return v7;
          case 'J':
            int64_t var4 = a3->var4;
LABEL_43:
            a3->float var5 = var4;
            break;
          default:
            goto LABEL_32;
        }
        return v7;
      case 'J':
        switch(v8)
        {
          case 'J':
            break;
          case 'F':
            float var5 = (float)a3->var5;
LABEL_45:
            a3->var6 = var5;
            break;
          case 'D':
            v14.var7 = (double)a3->var5;
LABEL_27:
            a3->var0 = v14.var0;
            break;
          default:
LABEL_32:
            LOBYTE(v7) = 0;
            return v7;
        }
LABEL_48:
        LOBYTE(v7) = 1;
        break;
      default:
        if (v9 == 83)
        {
          switch(v8)
          {
            case 'D':
              v14.var7 = (double)a3->var3;
              goto LABEL_27;
            case 'E':
            case 'G':
            case 'H':
              goto LABEL_32;
            case 'F':
              float var5 = (float)a3->var3;
              goto LABEL_45;
            case 'I':
              a3->int64_t var4 = a3->var3;
              goto LABEL_48;
            case 'J':
              a3->float var5 = a3->var3;
              goto LABEL_48;
            default:
              if (v8 != 83) {
                goto LABEL_32;
              }
              goto LABEL_48;
          }
        }
        if (v9 != 90) {
          return v7;
        }
        BOOL v12 = v8 == 90;
LABEL_11:
        LOBYTE(v7) = v12;
        return v7;
    }
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IOSPrimitiveClass;
  [(IOSPrimitiveClass *)&v3 dealloc];
}

@end