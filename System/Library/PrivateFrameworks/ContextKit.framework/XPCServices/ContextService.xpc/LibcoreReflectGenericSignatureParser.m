@interface LibcoreReflectGenericSignatureParser
+ (BOOL)isStopSymbolWithChar:(unsigned __int16)a3;
+ (const)__metadata;
- (LibcoreReflectGenericSignatureParser)initWithJavaLangClassLoader:(id)a3;
- (id)parseClassTypeSignature;
- (id)parseFieldTypeSignature;
- (id)parseFormalTypeParameter;
- (id)parseOptTypeArguments;
- (id)parseReturnType;
- (id)parseTypeArgument;
- (id)parseTypeSignature;
- (id)parseTypeVariableSignature;
- (void)dealloc;
- (void)expectWithChar:(unsigned __int16)a3;
- (void)parseClassSignature;
- (void)parseForClassWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4;
- (void)parseForConstructorWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4 withIOSClassArray:(id)a5;
- (void)parseForFieldWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4;
- (void)parseForMethodWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4 withIOSClassArray:(id)a5;
- (void)parseMethodTypeSignatureWithIOSClassArray:(id)a3;
- (void)parseOptFormalTypeParameters;
- (void)scanIdentifier;
- (void)scanSymbol;
- (void)setInputWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4;
@end

@implementation LibcoreReflectGenericSignatureParser

- (LibcoreReflectGenericSignatureParser)initWithJavaLangClassLoader:(id)a3
{
  return self;
}

- (void)setInputWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4
{
  if (a4)
  {
    JreStrongAssign((id *)&self->genericDecl_, a3);
    JreStrongAssign((id *)&self->buffer_, [a4 toCharArray]);
    self->eof_ = 0;
    [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
  }
  else
  {
    self->eof_ = 1;
  }
}

- (void)parseForClassWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4
{
  [(LibcoreReflectGenericSignatureParser *)self setInputWithJavaLangReflectGenericDeclaration:a3 withNSString:a4];
  if (self->eof_)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      JreStrongAssign((id *)&self->formalTypeParameters_, (void *)LibcoreUtilEmptyArray_TYPE_VARIABLE_);
      if (!a3
        || (JreStrongAssign((id *)&self->superclassType_, [a3 getSuperclass]),
            (v6 = [a3 getInterfaces]) == 0))
      {
        JreThrowNullPointerException();
      }
      p_interfaceTypes = &self->interfaceTypes_;
      if (v6[2])
      {
        v8 = new_LibcoreReflectListOfTypes_initWithJavaLangReflectTypeArray_((uint64_t)v6);
        JreStrongAssignAndConsume((id *)p_interfaceTypes, v8);
        return;
      }
    }
    else
    {
      if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      JreStrongAssign((id *)&self->formalTypeParameters_, (void *)LibcoreUtilEmptyArray_TYPE_VARIABLE_);
      v9 = NSObject_class_();
      JreStrongAssign((id *)&self->superclassType_, v9);
      p_interfaceTypes = &self->interfaceTypes_;
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)LibcoreReflectListOfTypes__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v10 = (void *)LibcoreReflectListOfTypes_EMPTY_;
    JreStrongAssign((id *)p_interfaceTypes, v10);
  }
  else
  {
    [(LibcoreReflectGenericSignatureParser *)self parseClassSignature];
  }
}

- (void)parseForMethodWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4 withIOSClassArray:(id)a5
{
  [(LibcoreReflectGenericSignatureParser *)self setInputWithJavaLangReflectGenericDeclaration:a3 withNSString:a4];
  if (self->eof_)
  {
    objc_opt_class();
    if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    JreStrongAssign((id *)&self->formalTypeParameters_, (void *)LibcoreUtilEmptyArray_TYPE_VARIABLE_);
    if (!a3) {
      goto LABEL_25;
    }
    v8 = [a3 getParameterTypes];
    if (!v8) {
      goto LABEL_25;
    }
    if (v8[2])
    {
      v9 = new_LibcoreReflectListOfTypes_initWithJavaLangReflectTypeArray_((uint64_t)v8);
      JreStrongAssignAndConsume((id *)&self->parameterTypes_, v9);
    }
    else
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)LibcoreReflectListOfTypes__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      JreStrongAssign((id *)&self->parameterTypes_, (void *)LibcoreReflectListOfTypes_EMPTY_);
    }
    v10 = [a3 getExceptionTypes];
    if (!v10) {
LABEL_25:
    }
      JreThrowNullPointerException();
    if (v10[2])
    {
      v11 = new_LibcoreReflectListOfTypes_initWithJavaLangReflectTypeArray_((uint64_t)v10);
      JreStrongAssignAndConsume((id *)&self->exceptionTypes_, v11);
    }
    else
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)LibcoreReflectListOfTypes__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      JreStrongAssign((id *)&self->exceptionTypes_, (void *)LibcoreReflectListOfTypes_EMPTY_);
    }
    id v12 = [a3 getReturnType];
    JreStrongAssign((id *)&self->returnType_, v12);
  }
  else
  {
    [(LibcoreReflectGenericSignatureParser *)self parseMethodTypeSignatureWithIOSClassArray:a5];
  }
}

- (void)parseForConstructorWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4 withIOSClassArray:(id)a5
{
  [(LibcoreReflectGenericSignatureParser *)self setInputWithJavaLangReflectGenericDeclaration:a3 withNSString:a4];
  if (self->eof_)
  {
    objc_opt_class();
    if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    JreStrongAssign((id *)&self->formalTypeParameters_, (void *)LibcoreUtilEmptyArray_TYPE_VARIABLE_);
    if (!a3) {
      goto LABEL_26;
    }
    v8 = [a3 getParameterTypes];
    if (!v8) {
      goto LABEL_26;
    }
    if (v8[2])
    {
      v9 = new_LibcoreReflectListOfTypes_initWithJavaLangReflectTypeArray_((uint64_t)v8);
      JreStrongAssignAndConsume((id *)&self->parameterTypes_, v9);
    }
    else
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)LibcoreReflectListOfTypes__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      JreStrongAssign((id *)&self->parameterTypes_, (void *)LibcoreReflectListOfTypes_EMPTY_);
    }
    v10 = [a3 getExceptionTypes];
    if (!v10) {
LABEL_26:
    }
      JreThrowNullPointerException();
    p_exceptionTypes = &self->exceptionTypes_;
    if (v10[2])
    {
      id v12 = new_LibcoreReflectListOfTypes_initWithJavaLangReflectTypeArray_((uint64_t)v10);
      JreStrongAssignAndConsume((id *)p_exceptionTypes, v12);
    }
    else
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)LibcoreReflectListOfTypes__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      v13 = (void *)LibcoreReflectListOfTypes_EMPTY_;
      JreStrongAssign((id *)p_exceptionTypes, v13);
    }
  }
  else
  {
    [(LibcoreReflectGenericSignatureParser *)self parseMethodTypeSignatureWithIOSClassArray:a5];
  }
}

- (void)parseForFieldWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4
{
  [(LibcoreReflectGenericSignatureParser *)self setInputWithJavaLangReflectGenericDeclaration:a3 withNSString:a4];
  if (!self->eof_)
  {
    id v5 = [(LibcoreReflectGenericSignatureParser *)self parseFieldTypeSignature];
    JreStrongAssign((id *)&self->fieldType_, v5);
  }
}

- (void)parseClassSignature
{
  [(LibcoreReflectGenericSignatureParser *)self parseOptFormalTypeParameters];
  JreStrongAssign((id *)&self->superclassType_, [(LibcoreReflectGenericSignatureParser *)self parseClassTypeSignature]);
  v3 = new_LibcoreReflectListOfTypes_initWithInt_(16);
  JreStrongAssignAndConsume((id *)&self->interfaceTypes_, v3);
  while (self->symbol_)
    [(LibcoreReflectListOfTypes *)self->interfaceTypes_ addWithJavaLangReflectType:[(LibcoreReflectGenericSignatureParser *)self parseClassTypeSignature]];
}

- (void)parseOptFormalTypeParameters
{
  v3 = new_LibcoreReflectListOfVariables_init();
  if (self->symbol_ == 60)
  {
    [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
    do
    {
      [(LibcoreReflectListOfVariables *)v3 addWithJavaLangReflectTypeVariable:[(LibcoreReflectGenericSignatureParser *)self parseFormalTypeParameter]];
      int symbol = self->symbol_;
    }
    while (symbol != 62 && symbol != 0);
    [(LibcoreReflectGenericSignatureParser *)self expectWithChar:62];
  }
  id v6 = [(LibcoreReflectListOfVariables *)v3 getArray];
  JreStrongAssign((id *)&self->formalTypeParameters_, v6);
}

- (id)parseFormalTypeParameter
{
  [(LibcoreReflectGenericSignatureParser *)self scanIdentifier];
  identifier = self->identifier_;
  if (!identifier) {
    JreThrowNullPointerException();
  }
  id v4 = [(NSString *)identifier intern];
  id v5 = new_LibcoreReflectListOfTypes_initWithInt_(8);
  [(LibcoreReflectGenericSignatureParser *)self expectWithChar:58];
  int symbol = self->symbol_;
  if ((symbol - 76) > 0xF || ((1 << (symbol - 76)) & 0x8101) == 0) {
    goto LABEL_11;
  }
  while (1)
  {
    [(LibcoreReflectListOfTypes *)v5 addWithJavaLangReflectType:[(LibcoreReflectGenericSignatureParser *)self parseFieldTypeSignature]];
    int symbol = self->symbol_;
LABEL_11:
    if (symbol != 58) {
      break;
    }
    [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
  }
  v8 = new_LibcoreReflectTypeVariableImpl_initWithJavaLangReflectGenericDeclaration_withNSString_withLibcoreReflectListOfTypes_(self->genericDecl_, v4, v5);
  return v8;
}

- (id)parseFieldTypeSignature
{
  int symbol = self->symbol_;
  switch(symbol)
  {
    case '[':
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      id v5 = new_LibcoreReflectGenericArrayTypeImpl_initWithJavaLangReflectType_([(LibcoreReflectGenericSignatureParser *)self parseTypeSignature]);
      return v5;
    case 'T':
      return [(LibcoreReflectGenericSignatureParser *)self parseTypeVariableSignature];
    case 'L':
      return [(LibcoreReflectGenericSignatureParser *)self parseClassTypeSignature];
    default:
      id v6 = new_JavaLangReflectGenericSignatureFormatError_init();
      objc_exception_throw(v6);
  }
}

- (id)parseClassTypeSignature
{
  [(LibcoreReflectGenericSignatureParser *)self expectWithChar:76];
  v3 = new_JavaLangStringBuilder_init();
  [(LibcoreReflectGenericSignatureParser *)self scanIdentifier];
  while (self->symbol_ == 47)
  {
    [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
    id v4 = [(JavaLangStringBuilder *)v3 appendWithNSString:self->identifier_];
    if (!v4) {
LABEL_9:
    }
      JreThrowNullPointerException();
    [v4 appendWithNSString:@"."];
    [(LibcoreReflectGenericSignatureParser *)self scanIdentifier];
  }
  [(JavaLangStringBuilder *)v3 appendWithNSString:self->identifier_];
  id v5 = new_LibcoreReflectParameterizedTypeImpl_initWithLibcoreReflectParameterizedTypeImpl_withNSString_withLibcoreReflectListOfTypes_withJavaLangClassLoader_(0, [(JavaLangStringBuilder *)v3 description], [(LibcoreReflectGenericSignatureParser *)self parseOptTypeArguments], self->loader_);
  if (self->symbol_ == 46)
  {
    do
    {
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      [(LibcoreReflectGenericSignatureParser *)self scanIdentifier];
      id v6 = [(JavaLangStringBuilder *)v3 appendWithNSString:@"$"];
      if (!v6) {
        goto LABEL_9;
      }
      [v6 appendWithNSString:self->identifier_];
      v7 = new_LibcoreReflectParameterizedTypeImpl_initWithLibcoreReflectParameterizedTypeImpl_withNSString_withLibcoreReflectListOfTypes_withJavaLangClassLoader_(v5, [(JavaLangStringBuilder *)v3 description], [(LibcoreReflectGenericSignatureParser *)self parseOptTypeArguments], self->loader_);
    }
    while (self->symbol_ == 46);
    id v5 = v7;
  }
  [(LibcoreReflectGenericSignatureParser *)self expectWithChar:59];
  return v5;
}

- (id)parseOptTypeArguments
{
  v3 = new_LibcoreReflectListOfTypes_initWithInt_(8);
  if (self->symbol_ == 60)
  {
    [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
    do
    {
      [(LibcoreReflectListOfTypes *)v3 addWithJavaLangReflectType:[(LibcoreReflectGenericSignatureParser *)self parseTypeArgument]];
      int symbol = self->symbol_;
    }
    while (symbol != 62 && symbol != 0);
    [(LibcoreReflectGenericSignatureParser *)self expectWithChar:62];
  }
  return v3;
}

- (id)parseTypeArgument
{
  v3 = new_LibcoreReflectListOfTypes_initWithInt_(1);
  id v4 = new_LibcoreReflectListOfTypes_initWithInt_(1);
  int symbol = self->symbol_;
  switch(symbol)
  {
    case '-':
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      [(LibcoreReflectListOfTypes *)v4 addWithJavaLangReflectType:[(LibcoreReflectGenericSignatureParser *)self parseFieldTypeSignature]];
      goto LABEL_6;
    case '+':
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      id v6 = [(LibcoreReflectGenericSignatureParser *)self parseFieldTypeSignature];
      goto LABEL_8;
    case '*':
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
LABEL_6:
      id v6 = (id)NSObject_class_();
LABEL_8:
      [(LibcoreReflectListOfTypes *)v3 addWithJavaLangReflectType:v6];
      v7 = new_LibcoreReflectWildcardTypeImpl_initWithLibcoreReflectListOfTypes_withLibcoreReflectListOfTypes_(v3, v4);
      return v7;
  }
  return [(LibcoreReflectGenericSignatureParser *)self parseFieldTypeSignature];
}

- (id)parseTypeVariableSignature
{
  [(LibcoreReflectGenericSignatureParser *)self expectWithChar:84];
  [(LibcoreReflectGenericSignatureParser *)self scanIdentifier];
  [(LibcoreReflectGenericSignatureParser *)self expectWithChar:59];
  v3 = new_LibcoreReflectTypeVariableImpl_initWithJavaLangReflectGenericDeclaration_withNSString_(self->genericDecl_, self->identifier_);
  return v3;
}

- (id)parseTypeSignature
{
  int symbol = self->symbol_;
  switch(self->symbol_)
  {
    case 'B':
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      id result = +[IOSClass byteClass];
      break;
    case 'C':
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      id result = +[IOSClass charClass];
      break;
    case 'D':
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      id result = +[IOSClass doubleClass];
      break;
    case 'E':
    case 'G':
    case 'H':
      goto LABEL_10;
    case 'F':
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      id result = +[IOSClass floatClass];
      break;
    case 'I':
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      id result = +[IOSClass intClass];
      break;
    case 'J':
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      id result = +[IOSClass longClass];
      break;
    default:
      if (symbol == 83)
      {
        [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
        id result = +[IOSClass shortClass];
      }
      else if (symbol == 90)
      {
        [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
        id result = +[IOSClass BOOLeanClass];
      }
      else
      {
LABEL_10:
        id result = [(LibcoreReflectGenericSignatureParser *)self parseFieldTypeSignature];
      }
      break;
  }
  return result;
}

- (void)parseMethodTypeSignatureWithIOSClassArray:(id)a3
{
  [(LibcoreReflectGenericSignatureParser *)self parseOptFormalTypeParameters];
  id v5 = new_LibcoreReflectListOfTypes_initWithInt_(16);
  JreStrongAssignAndConsume((id *)&self->parameterTypes_, v5);
  [(LibcoreReflectGenericSignatureParser *)self expectWithChar:40];
  while (self->symbol_ && self->symbol_ != 41)
    [(LibcoreReflectListOfTypes *)self->parameterTypes_ addWithJavaLangReflectType:[(LibcoreReflectGenericSignatureParser *)self parseTypeSignature]];
  [(LibcoreReflectGenericSignatureParser *)self expectWithChar:41];
  JreStrongAssign((id *)&self->returnType_, [(LibcoreReflectGenericSignatureParser *)self parseReturnType]);
  if (self->symbol_ == 94)
  {
    id v6 = new_LibcoreReflectListOfTypes_initWithInt_(8);
    JreStrongAssignAndConsume((id *)&self->exceptionTypes_, v6);
    do
    {
      [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
      exceptionTypes = self->exceptionTypes_;
      if (self->symbol_ == 84) {
        id v8 = [(LibcoreReflectGenericSignatureParser *)self parseTypeVariableSignature];
      }
      else {
        id v8 = [(LibcoreReflectGenericSignatureParser *)self parseClassTypeSignature];
      }
      [(LibcoreReflectListOfTypes *)exceptionTypes addWithJavaLangReflectType:v8];
    }
    while (self->symbol_ == 94);
  }
  else
  {
    p_exceptionTypes = &self->exceptionTypes_;
    if (a3) {
      v10 = new_LibcoreReflectListOfTypes_initWithJavaLangReflectTypeArray_((uint64_t)a3);
    }
    else {
      v10 = new_LibcoreReflectListOfTypes_initWithInt_(0);
    }
    JreStrongAssignAndConsume((id *)p_exceptionTypes, v10);
  }
}

- (id)parseReturnType
{
  if (self->symbol_ == 86)
  {
    [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
    return +[IOSClass voidClass];
  }
  else
  {
    return [(LibcoreReflectGenericSignatureParser *)self parseTypeSignature];
  }
}

- (void)scanSymbol
{
  if (self->eof_)
  {
    id v6 = new_JavaLangReflectGenericSignatureFormatError_init();
    objc_exception_throw(v6);
  }
  buffer = self->buffer_;
  if (!buffer) {
    JreThrowNullPointerException();
  }
  uint64_t pos = self->pos_;
  uint64_t size = buffer->super.size_;
  if ((int)pos >= (int)size)
  {
    self->symbol_ = 0;
    self->eof_ = 1;
  }
  else
  {
    if ((pos & 0x80000000) != 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, pos);
    }
    self->symbol_ = *((_WORD *)&buffer->super.size_ + (int)pos + 2);
    self->pos_ = pos + 1;
  }
}

- (void)expectWithChar:(unsigned __int16)a3
{
  if (self->symbol_ != a3)
  {
    v3 = new_JavaLangReflectGenericSignatureFormatError_init();
    objc_exception_throw(v3);
  }
  [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
}

+ (BOOL)isStopSymbolWithChar:(unsigned __int16)a3
{
  return (a3 < 0x3Du) & (0x1C00C00000000000uLL >> a3);
}

- (void)scanIdentifier
{
  if (self->eof_)
  {
LABEL_24:
    v13 = new_JavaLangReflectGenericSignatureFormatError_init();
    objc_exception_throw(v13);
  }
  v3 = new_JavaLangStringBuilder_initWithInt_(0x20u);
  unsigned int symbol = self->symbol_;
  if (symbol <= 0x3C && ((1 << symbol) & 0x1C00C00000000000) != 0)
  {
    self->symbol_ = 0;
    self->eof_ = 1;
    goto LABEL_24;
  }
  id v6 = v3;
  -[JavaLangStringBuilder appendWithChar:](v3, "appendWithChar:");
  buffer = self->buffer_;
  while (1)
  {
    if (!buffer) {
      JreThrowNullPointerException();
    }
    int pos = self->pos_;
    uint64_t size = buffer->super.size_;
    if (pos < 0 || pos >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, pos);
    }
    unsigned int v10 = *((unsigned __int16 *)&buffer->super.size_ + pos + 2);
    if ((unsigned __int16)((v10 & 0xFFDF) - 65) >= 0x1Au && v10 <= 0x3C && ((1 << v10) & 0x1C00C00000000000) != 0) {
      break;
    }
    -[JavaLangStringBuilder appendWithChar:](v6, "appendWithChar:");
    int v12 = self->pos_ + 1;
    self->pos_ = v12;
    buffer = self->buffer_;
    if (v12 == buffer->super.size_)
    {
      JreStrongAssign((id *)&self->identifier_, [(JavaLangStringBuilder *)v6 description]);
      self->symbol_ = 0;
      self->eof_ = 1;
      return;
    }
  }
  JreStrongAssign((id *)&self->identifier_, [(JavaLangStringBuilder *)v6 description]);
  [(LibcoreReflectGenericSignatureParser *)self scanSymbol];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreReflectGenericSignatureParser;
  [(LibcoreReflectGenericSignatureParser *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100488B00;
}

@end