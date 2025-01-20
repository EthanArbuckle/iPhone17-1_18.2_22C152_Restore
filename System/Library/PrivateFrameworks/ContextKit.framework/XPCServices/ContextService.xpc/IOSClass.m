@interface IOSClass
+ (J2ObjcClassInfo)__metadata;
+ (id)BOOLeanClass;
+ (id)byteClass;
+ (id)charClass;
+ (id)classForIosName:(id)a3;
+ (id)doubleClass;
+ (id)floatClass;
+ (id)forName:(id)a3;
+ (id)forName:(id)a3 initialize:(BOOL)a4 classLoader:(id)a5;
+ (id)intClass;
+ (id)longClass;
+ (id)primitiveClassForChar:(unsigned __int16)a3;
+ (id)shortClass;
+ (id)voidClass;
+ (int64_t)serialVersionUID;
+ (void)initialize;
- (BOOL)__convertRawValue:(id *)a3 toType:(id)a4;
- (BOOL)__unboxValue:(id)a3 toRawValue:(id *)a4;
- (BOOL)desiredAssertionStatus;
- (BOOL)isAnnotation;
- (BOOL)isAnnotationPresentWithIOSClass:(id)a3;
- (BOOL)isAnonymousClass;
- (BOOL)isArray;
- (BOOL)isAssignableFrom:(id)a3;
- (BOOL)isEnum;
- (BOOL)isInstance:(id)a3;
- (BOOL)isInterface;
- (BOOL)isLocalClass;
- (BOOL)isMemberClass;
- (BOOL)isPrimitive;
- (BOOL)isSynthetic;
- (Class)objcArrayClass;
- (Class)objcClass;
- (NSString)description;
- (Protocol)objcProtocol;
- (id)__boxValue:(id *)a3;
- (id)asSubclass:(id)a3;
- (id)binaryName;
- (id)cast:(id)a3;
- (id)findConstructorWithTranslatedName:(id)a3;
- (id)findMethodWithTranslatedName:(id)a3 checkSupertypes:(BOOL)a4;
- (id)getAnnotationWithIOSClass:(id)a3;
- (id)getAnnotations;
- (id)getCanonicalName;
- (id)getClasses;
- (id)getComponentType;
- (id)getConstructor:(id)a3;
- (id)getConstructors;
- (id)getDeclaredAnnotations;
- (id)getDeclaredClasses;
- (id)getDeclaredConstructor:(id)a3;
- (id)getDeclaredConstructors;
- (id)getDeclaredField:(id)a3;
- (id)getDeclaredFields;
- (id)getDeclaredMethod:(id)a3 parameterTypes:(id)a4;
- (id)getDeclaredMethods;
- (id)getDeclaringClass;
- (id)getEnclosingClass;
- (id)getEnclosingConstructor;
- (id)getEnclosingMethod;
- (id)getEnumConstants;
- (id)getField:(id)a3;
- (id)getFields;
- (id)getGenericInterfaces;
- (id)getGenericSuperclass;
- (id)getInterfaces;
- (id)getInterfacesInternal;
- (id)getMetadata;
- (id)getMethod:(id)a3 parameterTypes:(id)a4;
- (id)getMethods;
- (id)getName;
- (id)getPackage;
- (id)getProtectionDomain;
- (id)getResource:(id)a3;
- (id)getResourceAsStream:(id)a3;
- (id)getSigners;
- (id)getSuperclass;
- (id)getTypeParameters;
- (id)newInstance;
- (id)objcName;
- (int)getModifiers;
- (unint64_t)getSizeof;
- (void)__readRawValue:(id *)a3 fromAddress:(const void *)a4;
- (void)__writeRawValue:(id *)a3 toAddress:(const void *)a4;
@end

@implementation IOSClass

- (Class)objcClass
{
  return 0;
}

- (Protocol)objcProtocol
{
  return 0;
}

+ (id)byteClass
{
  return (id)qword_100560F98;
}

+ (id)charClass
{
  return (id)qword_100560FA0;
}

+ (id)doubleClass
{
  return (id)qword_100560FA8;
}

+ (id)floatClass
{
  return (id)qword_100560FB0;
}

+ (id)intClass
{
  return (id)qword_100560FB8;
}

+ (id)longClass
{
  return (id)qword_100560FC0;
}

+ (id)shortClass
{
  return (id)qword_100560FC8;
}

+ (id)BOOLeanClass
{
  return (id)qword_100560FD0;
}

+ (id)voidClass
{
  return (id)qword_100560FD8;
}

- (id)newInstance
{
}

- (id)getSuperclass
{
  return 0;
}

- (id)getGenericSuperclass
{
  id v3 = [(IOSClass *)self getSuperclass];
  if (!v3) {
    return v3;
  }
  id v4 = objc_msgSend(-[IOSClass getMetadata](self, "getMetadata"), "genericSignature");
  if (!v4) {
    return v3;
  }
  id v5 = v4;
  v6 = [[LibcoreReflectGenericSignatureParser alloc] initWithJavaLangClassLoader:JavaLangClassLoader_getSystemClassLoader()];
  [(LibcoreReflectGenericSignatureParser *)v6 parseForClassWithJavaLangReflectGenericDeclaration:self withNSString:v5];
  id v7 = +[LibcoreReflectTypes getType:v6->superclassType_];

  return v7;
}

- (id)getDeclaringClass
{
  if ([(IOSClass *)self isPrimitive]
    || [(IOSClass *)self isArray]
    || [(IOSClass *)self isAnonymousClass]
    || [(IOSClass *)self isLocalClass])
  {
    return 0;
  }
  id v3 = [(IOSClass *)self getEnclosingClass];
  if ([v3 isAnonymousClass])
  {
    do
      id v3 = [v3 getEnclosingClass];
    while (([v3 isAnonymousClass] & 1) != 0);
  }
  return v3;
}

- (BOOL)isInstance:(id)a3
{
  return 0;
}

- (id)getName
{
}

- (id)getCanonicalName
{
  id v2 = [(IOSClass *)self getName];
  return [v2 stringByReplacingOccurrencesOfString:@"$" withString:@"."];
}

- (id)objcName
{
}

- (int)getModifiers
{
  id v2 = [(IOSClass *)self getMetadata];
  if (!v2) {
    return 1;
  }
  unsigned int v3 = [v2 modifiers];
  return JavaLangReflectModifier_classModifiers() & v3;
}

- (id)getDeclaredMethods
{
  id v3 = +[NSMutableDictionary dictionary];
  [(IOSClass *)self collectMethods:v3 publicOnly:0];
  id v4 = [v3 allValues];
  uint64_t v5 = JavaLangReflectMethod_class_();
  return +[IOSObjectArray arrayWithNSArray:v4 type:v5];
}

- (id)getDeclaredConstructors
{
  uint64_t v2 = JavaLangReflectConstructor_class_();
  return +[IOSObjectArray arrayWithLength:0 type:v2];
}

- (id)getMethods
{
  id v3 = +[NSMutableDictionary dictionary];
  sub_100224318(self, (uint64_t)v3);
  id v4 = [v3 allValues];
  uint64_t v5 = JavaLangReflectMethod_class_();
  return +[IOSObjectArray arrayWithNSArray:v4 type:v5];
}

- (id)getConstructors
{
  uint64_t v2 = JavaLangReflectConstructor_class_();
  return +[IOSObjectArray arrayWithLength:0 type:v2];
}

- (id)getMethod:(id)a3 parameterTypes:(id)a4
{
  uint64_t v5 = self;
  TranslatedMethodName = IOSClass_GetTranslatedMethodName(self, (uint64_t)a3, (uint64_t)a4);
  while (1)
  {
    id v7 = [(IOSClass *)v5 findMethodWithTranslatedName:TranslatedMethodName checkSupertypes:1];
    if (v7) {
      break;
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [(IOSClass *)v5 getInterfacesInternal];
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v9) {
      goto LABEL_11;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v12) findMethodWithTranslatedName:TranslatedMethodName checkSupertypes:1];
        if (v13) {
          return v13;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_11:
    uint64_t v5 = [(IOSClass *)v5 getSuperclass];
    if (!v5) {
      goto LABEL_12;
    }
  }
  v14 = v7;
  if (([v7 getModifiers] & 1) == 0) {
LABEL_12:
  }
    objc_exception_throw([[JavaLangNoSuchMethodException alloc] initWithNSString:a3]);
  return v14;
}

- (id)getDeclaredMethod:(id)a3 parameterTypes:(id)a4
{
  id result = [(IOSClass *)self findMethodWithTranslatedName:IOSClass_GetTranslatedMethodName(self, (uint64_t)a3, (uint64_t)a4) checkSupertypes:0];
  if (!result) {
    objc_exception_throw([[JavaLangNoSuchMethodException alloc] initWithNSString:a3]);
  }
  return result;
}

- (id)findMethodWithTranslatedName:(id)a3 checkSupertypes:(BOOL)a4
{
  return 0;
}

- (id)findConstructorWithTranslatedName:(id)a3
{
  return 0;
}

- (id)getComponentType
{
  return 0;
}

- (id)getConstructor:(id)a3
{
}

- (id)getDeclaredConstructor:(id)a3
{
}

- (BOOL)isAssignableFrom:(id)a3
{
}

- (id)asSubclass:(id)a3
{
  if (![a3 isAssignableFrom:self]) {
    objc_exception_throw([[JavaLangClassCastException alloc] initWithNSString:[(IOSClass *)self description]]);
  }
  return self;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"class %@", [(IOSClass *)self getName]];
}

- (id)binaryName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"L%@;",
           [(IOSClass *)self getName]);
}

+ (id)classForIosName:(id)a3
{
  return sub_100224980(a3);
}

+ (id)primitiveClassForChar:(unsigned __int16)a3
{
  return (id)sub_100224A24(a3);
}

+ (id)forName:(id)a3
{
  return (id)IOSClass_forName_(a3);
}

+ (id)forName:(id)a3 initialize:(BOOL)a4 classLoader:(id)a5
{
  return (id)IOSClass_forName_(a3);
}

- (id)cast:(id)a3
{
  return a3;
}

- (id)getEnclosingClass
{
  id v2 = [(IOSClass *)self getMetadata];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  if (![v2 enclosingName]) {
    return 0;
  }
  id v4 = +[NSMutableString string];
  if ([v3 packageName])
  {
    objc_msgSend(v4, "appendString:", objc_msgSend(v3, "packageName"));
    [v4 appendString:@"."];
  }
  objc_msgSend(v4, "appendString:", objc_msgSend(v3, "enclosingName"));
  return sub_100224F5C(v4);
}

- (BOOL)isArray
{
  return 0;
}

- (BOOL)isEnum
{
  return 0;
}

- (BOOL)isInterface
{
  return 0;
}

- (BOOL)isPrimitive
{
  return 0;
}

- (BOOL)isAnnotation
{
  id v2 = [(IOSClass *)self getMetadata];
  if (v2) {
    LODWORD(v2) = ([v2 modifiers] >> 13) & 1;
  }
  return (char)v2;
}

- (BOOL)isMemberClass
{
  id v3 = [(IOSClass *)self getMetadata];
  if (v3)
  {
    id v3 = [v3 enclosingName];
    if (v3) {
      LOBYTE(v3) = ![(IOSClass *)self isAnonymousClass];
    }
  }
  return (char)v3;
}

- (BOOL)isLocalClass
{
  id v3 = [(IOSClass *)self getEnclosingMethod];
  if (v3) {
    LOBYTE(v3) = ![(IOSClass *)self isAnonymousClass];
  }
  return (char)v3;
}

- (BOOL)isSynthetic
{
  id v2 = [(IOSClass *)self getMetadata];
  if (v2) {
    LODWORD(v2) = ([v2 modifiers] >> 12) & 1;
  }
  return (char)v2;
}

- (id)getInterfacesInternal
{
  return (id)qword_100560FE0;
}

- (id)getInterfaces
{
  id v2 = [(IOSClass *)self getInterfacesInternal];
  return +[IOSObjectArray arrayWithArray:v2];
}

- (id)getGenericInterfaces
{
  if ([(IOSClass *)self isPrimitive])
  {
    uint64_t v3 = JavaLangReflectType_class_();
    return +[IOSObjectArray arrayWithLength:0 type:v3];
  }
  else
  {
    id v5 = objc_msgSend(-[IOSClass getMetadata](self, "getMetadata"), "genericSignature");
    if (v5)
    {
      id v6 = v5;
      id v7 = [[LibcoreReflectGenericSignatureParser alloc] initWithJavaLangClassLoader:JavaLangClassLoader_getSystemClassLoader()];
      [(LibcoreReflectGenericSignatureParser *)v7 parseForClassWithJavaLangReflectGenericDeclaration:self withNSString:v6];
      id v8 = +[LibcoreReflectTypes getTypeArray:v7->interfaceTypes_ clone:0];

      return v8;
    }
    else
    {
      id v9 = [(IOSClass *)self getInterfacesInternal];
      id v10 = v9 + 6;
      uint64_t v11 = v9[2];
      uint64_t v12 = JavaLangReflectType_class_();
      return +[IOSObjectArray arrayWithObjects:v10 count:v11 type:v12];
    }
  }
}

- (id)getTypeParameters
{
  id v3 = objc_msgSend(-[IOSClass getMetadata](self, "getMetadata"), "genericSignature");
  if (v3)
  {
    id v4 = v3;
    id v5 = [[LibcoreReflectGenericSignatureParser alloc] initWithJavaLangClassLoader:JavaLangClassLoader_getSystemClassLoader()];
    [(LibcoreReflectGenericSignatureParser *)v5 parseForClassWithJavaLangReflectGenericDeclaration:self withNSString:v4];
    id v6 = v5->formalTypeParameters_;

    return v6;
  }
  else
  {
    uint64_t v8 = JavaLangReflectTypeVariable_class_();
    return +[IOSObjectArray arrayWithLength:0 type:v8];
  }
}

- (id)getAnnotationWithIOSClass:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [(IOSClass *)self getAnnotations];
  uint64_t v5 = v4[2];
  if ((int)v5 < 1) {
    return 0;
  }
  for (i = v4; ; i += 2)
  {
    id v7 = (void *)*((void *)i + 3);
    if ([a3 isInstance:v7]) {
      break;
    }
    if (!--v5) {
      return 0;
    }
  }
  return v7;
}

- (BOOL)isAnnotationPresentWithIOSClass:(id)a3
{
  return [(IOSClass *)self getAnnotationWithIOSClass:a3] != 0;
}

- (id)getAnnotations
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(IOSClass *)self getDeclaredAnnotations];
  if (v4[2] >= 1)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    do
      [v3 addObject:*(void *)&v5[2 * v6++ + 6]];
    while (v6 < v5[2]);
  }
  id v7 = [(IOSClass *)self getSuperclass];
  uint64_t v8 = JavaLangAnnotationInherited_class_();
  if (v7)
  {
    id v9 = (id)v8;
    do
    {
      id v10 = (int *)[v7 getDeclaredAnnotations];
      if (v10[2] >= 1)
      {
        uint64_t v11 = v10;
        uint64_t v12 = 0;
        do
        {
          id v13 = *(void **)&v11[2 * v12 + 6];
          v14 = (int *)objc_msgSend(objc_msgSend(v13, "getClass"), "getDeclaredAnnotations");
          if (v14[2] >= 1)
          {
            v15 = v14;
            uint64_t v16 = 0;
            do
            {
              if (v9 == [*(id *)&v15[2 * v16 + 6] annotationType]) {
                [v3 addObject:v13];
              }
              ++v16;
            }
            while (v16 < v15[2]);
          }
          ++v12;
        }
        while (v12 < v11[2]);
      }
      id v7 = [v7 getSuperclass];
    }
    while (v7);
  }
  long long v17 = +[IOSObjectArray arrayWithNSArray:v3 type:JavaLangAnnotationAnnotation_class_()];

  return v17;
}

- (id)getDeclaredAnnotations
{
  id v2 = [(IOSClass *)self objcClass];
  if (v2 && JreFindClassMethod(v2, "__annotations"))
  {
    method_invoke();
  }
  else
  {
    uint64_t v4 = JavaLangAnnotationAnnotation_class_();
    return +[IOSObjectArray arrayWithLength:0 type:v4];
  }
  return result;
}

- (id)getMetadata
{
  id v2 = [(IOSClass *)self objcClass];
  if (!v2 || !JreFindClassMethod(v2, "__metadata")) {
    return 0;
  }
  method_invoke();
  uint64_t v4 = [[JavaClassMetadata alloc] initWithMetadata:v3];
  return v4;
}

- (id)getPackage
{
  id v2 = [(IOSClass *)self getMetadata];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  if (![v2 packageName]) {
    return 0;
  }
  uint64_t v4 = -[JavaLangPackage initWithNSString:withNSString:withNSString:withNSString:withNSString:withNSString:withNSString:withJavaNetURL:]([JavaLangPackage alloc], "initWithNSString:withNSString:withNSString:withNSString:withNSString:withNSString:withNSString:withJavaNetURL:", [v3 packageName], 0, 0, 0, 0, 0, 0, 0);
  return v4;
}

- (id)getDeclaredField:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id result = findDeclaredField(self, a3, 0);
  if (!result) {
    objc_exception_throw([[JavaLangNoSuchFieldException alloc] initWithNSString:a3]);
  }
  return result;
}

- (id)getField:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id result = findField((JavaLangReflectField *)self, a3, 1);
  if (!result) {
    objc_exception_throw([[JavaLangNoSuchFieldException alloc] initWithNSString:a3]);
  }
  return result;
}

- (id)getDeclaredFields
{
  id v3 = +[NSMutableDictionary dictionary];
  sub_1002261B4(self, v3, 0);
  id v4 = [v3 allValues];
  return copyFieldsToObjectArray(v4);
}

- (id)getFields
{
  id v3 = +[NSMutableDictionary dictionary];
  sub_1002263A4(self, v3);
  id v4 = [v3 allValues];
  return copyFieldsToObjectArray(v4);
}

- (id)getEnclosingMethod
{
  id v2 = objc_msgSend(-[IOSClass getMetadata](self, "getMetadata"), "getEnclosingMethod");
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  id v4 = [v2 selector];
  if (([v4 isEqualToString:@"init"] & 1) != 0
    || ([v4 hasPrefix:@"initWith"] & 1) != 0)
  {
    return 0;
  }
  Class v6 = sub_100224980([v3 typeName]);
  if (!v6) {
    objc_exception_throw(objc_alloc_init(JavaLangAssertionError));
  }
  Class v7 = v6;
  id v8 = [v3 selector];
  return [(objc_class *)v7 findMethodWithTranslatedName:v8 checkSupertypes:0];
}

- (id)getEnclosingConstructor
{
  id v2 = objc_msgSend(-[IOSClass getMetadata](self, "getMetadata"), "getEnclosingMethod");
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  id v4 = [v2 selector];
  if (([v4 isEqualToString:@"init"] & 1) == 0
    && ![v4 hasPrefix:@"initWith"])
  {
    return 0;
  }
  Class v5 = sub_100224980([v3 typeName]);
  if (!v5) {
    objc_exception_throw(objc_alloc_init(JavaLangAssertionError));
  }
  Class v6 = v5;
  id v7 = [v3 selector];
  return [(objc_class *)v6 findConstructorWithTranslatedName:v7];
}

- (id)getClasses
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  sub_1002266D8(self, v3, 1, 1);
  id v4 = [(IOSClass *)self getSuperclass];
  if (v4)
  {
    id v5 = v4;
    do
    {
      sub_1002266D8(v5, v3, 1, 0);
      id v5 = [v5 getSuperclass];
    }
    while (v5);
  }
  Class v6 = +[IOSObjectArray arrayWithNSArray:v3 type:IOSClass_class_()];

  return v6;
}

- (id)getDeclaredClasses
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  sub_1002266D8(self, v3, 0, 1);
  id v4 = +[IOSObjectArray arrayWithNSArray:v3 type:IOSClass_class_()];

  return v4;
}

- (BOOL)isAnonymousClass
{
  return 0;
}

- (BOOL)desiredAssertionStatus
{
  return 0;
}

- (id)getEnumConstants
{
  if (![(IOSClass *)self isEnum]) {
    return 0;
  }
  return JavaLangEnum_getSharedConstantsWithIOSClass_((uint64_t)self);
}

- (Class)objcArrayClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)getSizeof
{
  return 8;
}

- (id)getResource:(id)a3
{
  id v5 = [(IOSClass *)self getClassLoader];
  Class v6 = resolveResourceName(self, a3);
  return [v5 getResourceWithNSString:v6];
}

- (id)getResourceAsStream:(id)a3
{
  id v5 = [(IOSClass *)self getClassLoader];
  Class v6 = resolveResourceName(self, a3);
  return [v5 getResourceAsStreamWithNSString:v6];
}

- (id)getProtectionDomain
{
  return 0;
}

- (id)getSigners
{
  return 0;
}

- (id)__boxValue:(id *)a3
{
  return (id)a3->var5;
}

- (BOOL)__unboxValue:(id)a3 toRawValue:(id *)a4
{
  a4->var5 = (int64_t)a3;
  return 1;
}

- (void)__readRawValue:(id *)a3 fromAddress:(const void *)a4
{
  a3->var0 = *(void **)a4;
}

- (void)__writeRawValue:(id *)a3 toAddress:(const void *)a4
{
  *($B8780FE5D3888F6881D07C2E5E281BC0 *)a4 = ($B8780FE5D3888F6881D07C2E5E281BC0)a3->var0;
}

- (BOOL)__convertRawValue:(id *)a3 toType:(id)a4
{
  return objc_msgSend(a4, "isPrimitive", a3) ^ 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_100560FE8 = (uint64_t)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"NSObject", @"java.lang.Object", @"IOSClass", @"java.lang.Class", @"NSNumber", @"java.lang.Number", @"NSString", @"java.lang.String", @"NSCopying", @"java.lang.Cloneable", 0);
    qword_100560F98 = [[IOSPrimitiveClass alloc] initWithName:@"byte" type:@"B"];
    qword_100560FA0 = [[IOSPrimitiveClass alloc] initWithName:@"char" type:@"C"];
    qword_100560FA8 = [[IOSPrimitiveClass alloc] initWithName:@"double" type:@"D"];
    qword_100560FB0 = [[IOSPrimitiveClass alloc] initWithName:@"float" type:@"F"];
    qword_100560FB8 = [[IOSPrimitiveClass alloc] initWithName:@"int" type:@"I"];
    qword_100560FC0 = [[IOSPrimitiveClass alloc] initWithName:@"long" type:@"J"];
    qword_100560FC8 = [[IOSPrimitiveClass alloc] initWithName:@"short" type:@"S"];
    qword_100560FD0 = [[IOSPrimitiveClass alloc] initWithName:@"BOOLean" type:@"Z"];
    qword_100560FD8 = [[IOSPrimitiveClass alloc] initWithName:@"void" type:@"V"];
    uint64_t v2 = objc_opt_class();
    qword_100560FF0 = IOSClass_fromClass(v2);
    qword_100560FE0 = +[IOSObjectArray newArrayWithLength:0 type:IOSClass_class_()];
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
    if (![(id)objc_opt_class() instanceMethodSignatureForSelector:"compareToWithId:"]
      || ![(id)objc_opt_class() instanceMethodSignatureForSelector:"trim"]
      || (+[NSNumber conformsToProtocol:&OBJC_PROTOCOL___JavaIoSerializable] & 1) == 0)
    {
      +[NSException raise:@"J2ObjCLinkError" format:@"Your project is not configured to load categories from the JRE emulation library. Try adding the -force_load linker flag."];
    }
    atomic_store(1u, (unsigned __int8 *)&IOSClass__initialized);
  }
}

+ (int64_t)serialVersionUID
{
  return 0x2C7E5503D9BF9553;
}

+ (J2ObjcClassInfo)__metadata
{
  return (J2ObjcClassInfo *)&unk_10055D630;
}

@end