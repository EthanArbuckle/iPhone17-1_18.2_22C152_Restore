@interface NSManagedImmutableObject
+ ($1D79F9163EEB6CED23A6D76318697ED0)_PFMOClassFactoryData;
+ (BOOL)_isGeneratedClass;
+ (BOOL)_isGeneratedClass_1;
+ (Class)classForEntity:(id)a3;
+ (id)_retain_1;
+ (id)allocWithEntity:(id)a3;
+ (void)_release_1;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForKey:(id)a3;
- (void)methodForSelector:(SEL)a3;
@end

@implementation NSManagedImmutableObject

+ ($1D79F9163EEB6CED23A6D76318697ED0)_PFMOClassFactoryData
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: null selector", _NSMethodExceptionProem() format];
  }
  Class = object_getClass(self);

  return class_respondsToSelector(Class, a3);
}

- (void)methodForSelector:(SEL)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: null selector", _NSMethodExceptionProem() format];
  }
  Class = object_getClass(self);

  return class_getMethodImplementation(Class, a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: null selector", _NSMethodExceptionProem() format];
  }
  Class Class = object_getClass(self);
  v6 = Class;
  if (Class)
  {
    Superclass = Class;
    while (1)
    {
      unsigned int outCount = 0;
      v8 = class_copyProtocolList(Superclass, &outCount);
      v9 = v8;
      if (outCount) {
        break;
      }
      if (v8) {
LABEL_12:
      }
        free(v9);
      Superclass = class_getSuperclass(Superclass);
      if (!Superclass) {
        goto LABEL_14;
      }
    }
    uint64_t v10 = 0;
    while (1)
    {
      v11 = v9[v10];
      isMetaClass Class = class_isMetaClass(Superclass);
      objc_method_description MethodDescription = protocol_getMethodDescription(v11, a3, 1, !isMetaClass);
      types = MethodDescription.types;
      if (MethodDescription.name) {
        break;
      }
      v15 = v9[v10];
      BOOL v16 = class_isMetaClass(Superclass);
      objc_method_description v17 = protocol_getMethodDescription(v15, a3, 0, !v16);
      types = v17.types;
      if (v17.name) {
        break;
      }
      if (++v10 >= (unint64_t)outCount) {
        goto LABEL_12;
      }
    }
    v20 = types;
    free(v9);
  }
  else
  {
LABEL_14:
    id result = class_getInstanceMethod(v6, a3);
    if (!result) {
      return result;
    }
    Description = method_getDescription((Method)result);
    if (!Description->name) {
      return 0;
    }
    v20 = Description->types;
  }
  return (id)[MEMORY[0x1E4F1CA38] signatureWithObjCTypes:v20];
}

+ (id)allocWithEntity:(id)a3
{
  unint64_t v5 = _PFFastEntityClass((unint64_t)a3);
  if (v5)
  {
    v6 = (void *)v5;
    if ((*((unsigned char *)a3 + 120) & 4) == 0)
    {
      uint64_t v11 = [a3 managedObjectModel];
      id v12 = a3;
      if (v11) {
        id v12 = (id)[a3 managedObjectModel];
      }
      [v12 _setIsEditable:0];
    }
    uint64_t v7 = [v6 _PFMOClassFactoryData];
    if (v7)
    {
      uint64_t v8 = v7;
      if (!*(void *)(v7 + 24))
      {
        uint64_t v13 = *((void *)a3 + 14);
        if (v13) {
          unint64_t v14 = *(void *)(v13 + 8);
        }
        else {
          unint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
        }
        if (v14 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v14;
        }
        *(void *)(v8 + 24) = 8 * v15;
      }
    }
    v9 = (objc_class *)v6;
  }
  else
  {
    v9 = (objc_class *)a1;
  }

  return _PFAllocateObject(v9, 0);
}

+ (id)_retain_1
{
  return a1;
}

+ (void)_release_1
{
}

+ (BOOL)_isGeneratedClass
{
  return 0;
}

+ (BOOL)_isGeneratedClass_1
{
  return 1;
}

+ (Class)classForEntity:(id)a3
{
  v3 = a3;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
  if (!v5 || (v6 = v5, !*v5))
  {
    v88 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v89 = *MEMORY[0x1E4F1C3C8];
    v90 = @"Entity name must not be nil.";
    goto LABEL_72;
  }
  if ((v3[120] & 4) == 0)
  {
    uint64_t v86 = [v3 managedObjectModel];
    v87 = v3;
    if (v86) {
      v87 = (void *)[v3 managedObjectModel];
    }
    [v87 _setIsEditable:0];
  }
  Name = class_getName((Class)a1);
  snprintf(__str, 0x200uLL, "%s_%s_", Name, v6);
  os_unfair_lock_lock(&_MergedGlobals_82);
  uint64_t v8 = 0;
  int v9 = 2;
  v91 = v3;
  while (1)
  {
    Class Class = objc_getClass(__str);
    if (Class)
    {
      uint64_t v11 = Class;
      goto LABEL_50;
    }
    while (1)
    {
      Class ClassPair = objc_allocateClassPair((Class)a1, __str, 0);
      if (ClassPair) {
        break;
      }
      uint64_t v13 = class_getName((Class)a1);
      int v14 = v9 + 1;
      snprintf(__str, 0x200uLL, "%s_%s_%x", v13, v6, v9);
      Class v15 = objc_getClass(__str);
      ++v9;
      if (v15)
      {
        uint64_t v11 = v15;
        int v9 = v14;
        goto LABEL_50;
      }
    }
    uint64_t v11 = ClassPair;
    BOOL v16 = object_getClass(ClassPair);
    ClassMethod = class_getClassMethod(v11, sel__retain_1);
    Implementation = method_getImplementation(ClassMethod);
    TypeEncoding = method_getTypeEncoding(ClassMethod);
    class_addMethod(v16, sel_retain, Implementation, TypeEncoding);
    v20 = class_getClassMethod(v11, sel__release_1);
    v21 = method_getImplementation(v20);
    v22 = method_getTypeEncoding(v20);
    class_addMethod(v16, sel_release, v21, v22);
    v23 = class_getClassMethod(v11, sel__isGeneratedClass_1);
    v24 = method_getImplementation(v23);
    v25 = method_getTypeEncoding(v23);
    class_addMethod(v16, sel__isGeneratedClass, v24, v25);
    v26 = class_getClassMethod((Class)a1, sel_class);
    v27 = method_getTypeEncoding(v26);
    class_addMethod(v11, sel_class, (IMP)override_instace_class_0, v27);
    v28 = class_getClassMethod((Class)a1, sel_class);
    v29 = method_getTypeEncoding(v28);
    class_addMethod(v16, sel_class, (IMP)override_class_class_0, v29);
    v30 = class_getClassMethod((Class)a1, sel_superclass);
    v31 = method_getTypeEncoding(v30);
    class_addMethod(v16, sel_superclass, (IMP)override_class_superclass_0, v31);
    int v32 = objc_msgSend((id)objc_msgSend(v3, "properties"), "count");
    v33 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      v33 = malloc_default_zone();
    }
    if (v32) {
      size_t v34 = (((v32 - 1) >> 3) & 0x1FFFFFFC) + 84;
    }
    else {
      size_t v34 = 84;
    }
    v35 = malloc_type_zone_calloc(v33, 1uLL, v34, 0xFB957036uLL);
    ReturnPointerMethod = generateReturnPointerMethod((uint64_t)v35);
    class_addMethod(v16, sel__PFMOClassFactoryData, ReturnPointerMethod, "@@:");
    v37 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      v37 = malloc_default_zone();
    }
    size_t InstanceSize = class_getInstanceSize((Class)a1);
    uint64_t v8 = malloc_type_zone_calloc(v37, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8, 0x28861AD9uLL);
    v35[6] = v8;
    if ((id)objc_opt_class() != a1)
    {
      v92 = v8;
      v39 = (objc_class *)objc_opt_class();
      v40 = v35;
      IMP MethodImplementation = class_getMethodImplementation(v39, sel_willAccessValueForKey_);
      IMP v42 = class_getMethodImplementation((Class)a1, sel_willAccessValueForKey_);
      v43 = (objc_class *)objc_opt_class();
      IMP v44 = class_getMethodImplementation(v43, sel_didAccessValueForKey_);
      IMP v45 = class_getMethodImplementation((Class)a1, sel_didAccessValueForKey_);
      BOOL v46 = MethodImplementation == v42;
      v35 = v40;
      BOOL v46 = v46 && v44 == v45;
      int v47 = !v46;
      v40[18] = v40[18] & 0xFFFFFFFE | v47;
      v48 = (objc_class *)objc_opt_class();
      v49 = class_getMethodImplementation(v48, sel_validateValue_forKey_error_);
      if (v49 != class_getMethodImplementation((Class)a1, sel_validateValue_forKey_error_))
      {
        v40[18] |= 0x10u;
        v50 = (objc_class *)objc_opt_class();
        v51 = class_getClassMethod(v50, sel__isGeneratedClass);
        v52 = method_getImplementation(v51);
        v53 = method_getTypeEncoding(v51);
        class_addMethod(v16, sel__useFastValidationMethod, v52, v53);
      }
      v54 = (objc_class *)objc_opt_class();
      v55 = class_getMethodImplementation(v54, sel_awakeFromFetch);
      if (v55 != class_getMethodImplementation((Class)a1, sel_awakeFromFetch)) {
        v40[18] |= 0x20u;
      }
      v56 = (objc_class *)objc_opt_class();
      IMP v57 = class_getMethodImplementation(v56, sel_willChangeValueForKey_);
      IMP v58 = class_getMethodImplementation((Class)a1, sel_willChangeValueForKey_);
      v59 = (objc_class *)objc_opt_class();
      v60 = class_getMethodImplementation(v59, sel_didChangeValueForKey_);
      if (v60 == class_getMethodImplementation((Class)a1, sel_didChangeValueForKey_) && v57 == v58) {
        int v62 = 0;
      }
      else {
        int v62 = 2;
      }
      v40[18] = v62 | v40[18] & 0xFFFFFFFD;
      v63 = (objc_class *)objc_opt_class();
      IMP v64 = class_getMethodImplementation(v63, sel_willChangeValueForKey_withSetMutation_usingObjects_);
      IMP v65 = class_getMethodImplementation((Class)a1, sel_willChangeValueForKey_withSetMutation_usingObjects_);
      v66 = (objc_class *)objc_opt_class();
      v67 = class_getMethodImplementation(v66, sel_didChangeValueForKey_withSetMutation_usingObjects_);
      if (v67 == class_getMethodImplementation((Class)a1, sel_didChangeValueForKey_withSetMutation_usingObjects_)
        && v64 == v65)
      {
        int v69 = 0;
      }
      else
      {
        int v69 = 4;
      }
      v40[18] = v69 | v40[18] & 0xFFFFFFFB;
      v3 = v91;
      uint64_t v8 = v92;
    }
    int v70 = objc_msgSend((id)objc_msgSend(v3, "properties"), "count");
    if ((v70 & 0xFFFFFFF8) != 0)
    {
      int v71 = v70;
      snprintf(__str, 0x200uLL, "_cd_bits_%p", v11);
      if (v71) {
        unsigned int v72 = ((v71 - 1) >> 5) + 1;
      }
      else {
        unsigned int v72 = 1;
      }
      if (v72 > 0x4000)
      {
        v88 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v89 = *MEMORY[0x1E4F1C3B8];
        v90 = @"Incorrect ivar generation";
      }
      else
      {
        snprintf(types, 0xAuLL, "[%dI]", v72);
        if (class_addIvar(v11, __str, 4 * v72, 1u, types))
        {
          objc_registerClassPair(v11);
          object_setClass(v8, v11);
          v8[4] |= 0x100000u;
          v8[2] = 10000;
          v73 = generateReturnPointerMethod((uint64_t)v8);
          class_addMethod(v16, sel__PFPlaceHolderSingleton, v73, "@@:");
          InstanceVariable = class_getInstanceVariable(v11, __str);
          ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
          unint64_t v76 = ((unint64_t)(((unsigned __int16)class_getInstanceSize(v11) + 7) & 0x3F8) - Offset) >> 2;
          goto LABEL_49;
        }
        v88 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v89 = *MEMORY[0x1E4F1C3B8];
        v90 = @"class_addIvar failed";
      }
LABEL_72:
      objc_exception_throw((id)[v88 exceptionWithName:v89 reason:v90 userInfo:0]);
    }
    objc_registerClassPair(v11);
    object_setClass(v8, v11);
    v8[4] |= 0x100000u;
    v8[2] = 10000;
    v77 = generateReturnPointerMethod((uint64_t)v8);
    class_addMethod(v16, sel__PFPlaceHolderSingleton, v77, "@@:");
    LOBYTE(v76) = 0;
LABEL_49:
    *((unsigned char *)v35 + 32) = v76;
    v35[5] = 0;
LABEL_50:
    uint64_t v78 = [(objc_class *)v11 _PFMOClassFactoryData];
    v79 = *(unsigned char **)(v78 + 8);
    if (!v79 || v79 == v3)
    {
      uint64_t v81 = v78;
      if (!*(void *)(v78 + 56)) {
        goto LABEL_59;
      }
      if (objc_msgSend((id)objc_msgSend(v3, "versionHash"), "isEqualToData:", *(void *)(v78 + 56))) {
        break;
      }
    }
    v82 = class_getName((Class)a1);
    snprintf(__str, 0x200uLL, "%s_%s_%x", v82, v6, v9++);
  }
  v79 = *(unsigned char **)(v81 + 8);
LABEL_59:
  if (!v79)
  {
    *(_DWORD *)uint64_t v81 = 0;
    *(void *)(v81 + 8) = v3;
    *(void *)(v81 + 16) = objc_msgSend((id)objc_msgSend(v3, "name"), "copy");
    *(void *)(v81 + 24) = 0;
    v83 = (void *)[(objc_class *)v11 _PFPlaceHolderSingleton];
    object_setClass(v83, v11);
    *(void *)(v81 + 48) = v83;
  }
  os_unfair_lock_unlock(&_MergedGlobals_82);
  if (v8)
  {
    os_unfair_lock_lock_with_options();
    Mutable = (__CFArray *)qword_1EB270770;
    if (!qword_1EB270770)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
      qword_1EB270770 = (uint64_t)Mutable;
    }
    CFArrayAppendValue(Mutable, v8);
    os_unfair_lock_unlock(&stru_1EB27076C);
  }
  self;
  __dmb(0xBu);
  return v11;
}

- (id)valueForKey:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NSManagedImmutableObject;
  return [(NSManagedImmutableObject *)&v4 valueForKey:a3];
}

@end