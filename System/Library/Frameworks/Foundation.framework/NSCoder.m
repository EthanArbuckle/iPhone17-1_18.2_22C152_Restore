@interface NSCoder
+ (BOOL)__categorizeException:(id)a3 intoError:(id *)a4;
- (BOOL)__failWithException:(void *)a1;
- (BOOL)__failWithExceptionName:(id)a3 errorCode:(int64_t)a4 format:(id)a5;
- (BOOL)_allowsValueCoding;
- (BOOL)_enforceCollectionTyping;
- (BOOL)_shouldExemptProcessBasedOnArchivingExceptionRules:(BOOL)result;
- (BOOL)_validateAllowedClass:(Class)a3 forKey:(id)a4 allowingInvocations:(BOOL)a5;
- (BOOL)_validateAllowedClassesContainsClass:(Class)a3 forKey:(id)a4;
- (BOOL)_validateDecodeCollectionAllowedClassesRequirementsWithClasses:(uint64_t)a3 forMethodExceptionProem:;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(NSString *)key;
- (BOOL)decodeBoolForKey:(NSString *)key;
- (BOOL)requiresSecureCoding;
- (BOOL)validateAllowedClass:(Class)a3 forKey:(id)a4;
- (BOOL)validateClassSupportsSecureCoding:(Class)a3;
- (Class)_isPossibleNestedCollectionClass:(uint64_t)a1;
- (NSArray)decodeArrayOfObjectsOfClass:(Class)cls forKey:(NSString *)key;
- (NSArray)decodeArrayOfObjectsOfClasses:(NSSet *)classes forKey:(NSString *)key;
- (NSData)decodeDataObject;
- (NSDecodingFailurePolicy)decodingFailurePolicy;
- (NSDictionary)decodeDictionaryWithKeysOfClass:(Class)keyCls objectsOfClass:(Class)objectCls forKey:(NSString *)key;
- (NSDictionary)decodeDictionaryWithKeysOfClasses:(NSSet *)keyClasses objectsOfClasses:(NSSet *)objectClasses forKey:(NSString *)key;
- (NSError)error;
- (NSInteger)versionForClassName:(NSString *)className;
- (NSPoint)decodePoint;
- (NSPoint)decodePointForKey:(NSString *)key;
- (NSRect)decodeRect;
- (NSRect)decodeRectForKey:(NSString *)key;
- (NSSet)allowedClasses;
- (NSSize)decodeSize;
- (NSSize)decodeSizeForKey:(NSString *)key;
- (NSString)__allowedClassesDescriptionForClass:(NSString *)result;
- (NSString)__descriptionForUnexpectedClass:(__CFString *)a3 forKey:(void *)a4 allowedClasses:;
- (NSString)__descriptionForUnexpectedElementClass:(__CFString *)a3 forContainerKey:(void *)a4 allowedClasses:;
- (NSString)__failWithUnexpectedClass:(__CFString *)a3 forKey:(void *)a4 allowedClasses:;
- (NSString)__failWithUnexpectedElementClass:(__CFString *)a3 forContainerKey:(void *)a4 allowedClasses:;
- (const)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp;
- (double)decodeDoubleForKey:(NSString *)key;
- (float)decodeFloatForKey:(NSString *)key;
- (id)__decoderInfoForAllowedClassesWarning;
- (id)_allowedClassesDescriptionForClasses:(uint64_t)a1;
- (id)decodeObject;
- (id)decodeObjectForKey:(NSString *)key;
- (id)decodeObjectOfClass:(Class)aClass forKey:(NSString *)key;
- (id)decodeObjectOfClasses:(NSSet *)classes forKey:(NSString *)key;
- (id)decodePropertyListForKey:(NSString *)key;
- (id)decodeTopLevelObjectAndReturnError:(NSError *)error;
- (id)decodeTopLevelObjectForKey:(NSString *)key error:(NSError *)error;
- (id)decodeTopLevelObjectOfClass:(Class)aClass forKey:(NSString *)key error:(NSError *)error;
- (id)decodeTopLevelObjectOfClasses:(NSSet *)classes forKey:(NSString *)key error:(NSError *)error;
- (int)decodeIntForKey:(NSString *)key;
- (int32_t)decodeInt32ForKey:(NSString *)key;
- (int64_t)decodeInt64ForKey:(NSString *)key;
- (uint64_t)__tryDecodeObjectForKey:(void *)a3 error:(uint64_t)a4 decodeBlock:;
- (uint64_t)_walkAllowedClassListLookingForClass:(uint64_t)a3 forKey:(id)obj allowedClasses:(int)a5 strictModeEnabled:(char)a6 alwaysEnforceExplicitSubclasses:(int)a7 specialCaseObject:;
- (uint64_t)_walkAllowedClassListValidatingInstance:(uint64_t)a3 forKey:(void *)a4 allowedClasses:(int)a5 strictModeEnabled:(char)a6 alwaysEnforceExplicitSubclasses:(int)a7 specialCaseObject:(uint64_t *)a8 invalidElementClass:;
- (uint64_t)_warnAboutNSObjectInAllowedClassesWithException:(uint64_t)result;
- (unsigned)systemVersion;
- (void)__setError:(id)a3;
- (void)_warnAboutPlistType:(uint64_t)a3 forKey:(void *)a4 missingInAllowedClasses:;
- (void)decodeArrayOfObjCType:(const char *)itemType count:(NSUInteger)count at:(void *)array;
- (void)decodeBytesWithReturnedLength:(NSUInteger *)lengthp;
- (void)decodeValueOfObjCType:(const char *)type at:(void *)data;
- (void)decodeValueOfObjCType:(const char *)type at:(void *)data size:(NSUInteger)size;
- (void)decodeValuesOfObjCTypes:(const char *)types;
- (void)encodeArrayOfObjCType:(const char *)type count:(NSUInteger)count at:(const void *)array;
- (void)encodeBool:(BOOL)value forKey:(NSString *)key;
- (void)encodeBytes:(const uint8_t *)bytes length:(NSUInteger)length forKey:(NSString *)key;
- (void)encodeBytes:(const void *)byteaddr length:(NSUInteger)length;
- (void)encodeConditionalObject:(id)object forKey:(NSString *)key;
- (void)encodeDataObject:(NSData *)data;
- (void)encodeDouble:(double)value forKey:(NSString *)key;
- (void)encodeFloat:(float)value forKey:(NSString *)key;
- (void)encodeInt32:(int32_t)value forKey:(NSString *)key;
- (void)encodeInt64:(int64_t)value forKey:(NSString *)key;
- (void)encodeInt:(int)value forKey:(NSString *)key;
- (void)encodeObject:(id)object;
- (void)encodeObject:(id)object forKey:(NSString *)key;
- (void)encodePoint:(NSPoint)point;
- (void)encodePoint:(NSPoint)point forKey:(NSString *)key;
- (void)encodeRect:(NSRect)rect;
- (void)encodeRect:(NSRect)rect forKey:(NSString *)key;
- (void)encodeSize:(NSSize)size;
- (void)encodeSize:(NSSize)size forKey:(NSString *)key;
- (void)encodeValueOfObjCType:(const char *)type at:(const void *)addr;
- (void)encodeValuesOfObjCTypes:(const char *)types;
- (void)failWithError:(NSError *)error;
@end

@implementation NSCoder

- (uint64_t)_walkAllowedClassListLookingForClass:(uint64_t)a3 forKey:(id)obj allowedClasses:(int)a5 strictModeEnabled:(char)a6 alwaysEnforceExplicitSubclasses:(int)a7 specialCaseObject:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  id v10 = obj;
  uint64_t v13 = result;
  if (object_isClass(obj)) {
    id v10 = (id)[MEMORY[0x1E4F1CAD0] setWithObject:v10];
  }
  if (!v10) {
    return 0;
  }
  if (!object_isClass(a2))
  {
    v30 = (objc_class *)v13;
LABEL_57:
    v31 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ object in class list '%@' is not an Objective-C class!", _NSMethodExceptionProem(v30, sel_validateAllowedClass_forKey_), a2), 0 reason userInfo];
    objc_exception_throw(v31);
  }
  if (!a5)
  {
    int v14 = [v10 containsObject:MEMORY[0x1E4FBA8A8]];
    if (v14)
    {
      char v15 = -[NSCoder _warnAboutNSObjectInAllowedClassesWithException:](v13, a7 ^ 1u);
      result = 0;
      if (!a2) {
        return result;
      }
      char v36 = v14;
      uint64_t v33 = a3;
      char v34 = a7;
      v35 = (objc_class *)v13;
      unint64_t v16 = 0x1E4FBA000;
      if ((v15 & 1) == 0) {
        return result;
      }
      goto LABEL_15;
    }
    char v36 = 0;
    uint64_t v33 = a3;
    char v34 = a7;
    v35 = (objc_class *)v13;
    unint64_t v16 = 0x1E4FBA000uLL;
    if (a2)
    {
LABEL_15:
      v17 = a2;
      while (1)
      {
        if (!object_isClass(v17))
        {
          v30 = v35;
          goto LABEL_57;
        }
        if ([v10 containsObject:v17]) {
          return 1;
        }
        if (objc_opt_respondsToSelector())
        {
          int v18 = [v17 _subclassesMustBeExplicitlyMentionedWhenDecoded];
          if (a6) {
            goto LABEL_22;
          }
        }
        else
        {
          int v18 = 0;
          if (a6)
          {
LABEL_22:
            int v19 = 1;
            goto LABEL_23;
          }
        }
        int v19 = _os_feature_enabled_impl();
LABEL_23:
        if ((dyld_program_sdk_at_least() & v18) == 1)
        {
          IMP MethodImplementation = class_getMethodImplementation(*(Class *)(v16 + 2216), sel_classForCoder);
          v21 = class_getMethodImplementation((Class)v17, sel_classForCoder);
          if (object_getClass(v17) != *(Class *)(v16 + 2216))
          {
            v22 = *(objc_class **)(v16 + 2216);
            if (v21 == MethodImplementation
              && (InstanceMethod = class_getInstanceMethod((Class)v17, sel_classForCoder),
                  InstanceMethod == class_getInstanceMethod(v22, sel_classForCoder))
              || (Superclass = class_getSuperclass((Class)v17),
                  v21 == class_getMethodImplementation(Superclass, sel_classForCoder))
              && (v25 = class_getInstanceMethod((Class)v17, sel_classForCoder),
                  v25 == class_getInstanceMethod(Superclass, sel_classForCoder)))
            {
              unint64_t v16 = 0x1E4FBA000;
            }
            else
            {
              if (qword_1EB1ED1C0 != -1) {
                dispatch_once(&qword_1EB1ED1C0, &__block_literal_global_276);
              }
              Value = CFDictionaryGetValue((CFDictionaryRef)qword_1EB1ED1B8, v17);
              unint64_t v16 = 0x1E4FBA000;
              if (!Value) {
                goto LABEL_39;
              }
              v27 = Value;
              if ([v10 containsObject:Value]) {
                return 1;
              }
              if (qword_1EB1ED1C0 != -1) {
                dispatch_once(&qword_1EB1ED1C0, &__block_literal_global_276);
              }
              v28 = CFDictionaryGetValue((CFDictionaryRef)qword_1EB1ED1B8, v27);
              if (v28)
              {
                result = [v10 containsObject:v28];
                if (result & 1) != 0 || (a6) {
                  return result;
                }
              }
              else
              {
LABEL_39:
                if (a6) {
                  return 0;
                }
              }
              if (qword_1EB1ED198 != -1) {
                dispatch_once(&qword_1EB1ED198, &__block_literal_global_5);
              }
              if (dword_1EB1ED194 != 2)
              {
                if ((v36 & 1) == 0)
                {
                  uint64_t v37 = [(objc_class *)v35 __decoderInfoForAllowedClassesWarning];
                  unint64_t v16 = 0x1E4FBA000;
                  v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"'%@' (%p) [%@]", a2, a2, [(NSURL *)[+[NSBundle bundleForClass:a2] bundleURL] path]);
                  v29 = _NSRuntimeIssuesLog();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138544642;
                    v39 = v17;
                    __int16 v40 = 2114;
                    v41 = Superclass;
                    __int16 v42 = 2114;
                    uint64_t v43 = v33;
                    __int16 v44 = 2114;
                    v45 = v17;
                    __int16 v46 = 2114;
                    v47 = v32;
                    __int16 v48 = 2114;
                    uint64_t v49 = v37;
                    _os_log_fault_impl(&dword_181795000, v29, OS_LOG_TYPE_FAULT, "Attempted to decode a collection type '%{public}@' (subclass of '%{public}@') for key '%{public}@'. '%{public}@' requires its subclasses to be explicitly added to the allowed classes list but it is not present. Allowing this has been a source of security issues. Please ensure you meant this type to be in archives: %{public}@%{public}@", buf, 0x3Eu);
                  }
                }
                char v36 = 1;
                if (v19)
                {
                  if ((v34 & 1) == 0) {
                    return -[NSCoder _shouldExemptProcessBasedOnArchivingExceptionRules:]((BOOL)v35, (uint64_t)"/System/Library/CoreServices/ArchivingExceptions.bundle/CollectionSubclasses.plist");
                  }
                }
              }
            }
          }
        }
        result = (uint64_t)class_getSuperclass((Class)v17);
        v17 = (void *)result;
        if (!result) {
          return result;
        }
      }
    }
    return 0;
  }

  return [v10 containsObject:a2];
}

- (BOOL)validateClassSupportsSecureCoding:(Class)a3
{
  if (([(objc_class *)a3 conformsToProtocol:&unk_1ECABCCC8] & 1) == 0)
  {
    [(NSCoder *)self __failWithExceptionName:@"NSInvalidUnarchiveOperationException", 4864, @"This decoder will only decode classes that adopt NSSecureCoding. Class '%s' does not adopt it.", class_getName(a3), v9 errorCode format];
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    [(NSCoder *)self __failWithExceptionName:@"NSInvalidUnarchiveOperationException", 4864, @"Class '%s' disallows secure coding. It must implement supportsSecureCoding and return YES.", class_getName(a3), v9 errorCode format];
    return 0;
  }
  if (![(objc_class *)a3 supportsSecureCoding])
  {
    [(NSCoder *)self __failWithExceptionName:@"NSInvalidUnarchiveOperationException", 4864, @"Class '%s' disallows secure coding. It must return YES from supportsSecureCoding.", class_getName(a3), v9 errorCode format];
    return 0;
  }
  if (!a3)
  {
LABEL_8:
    [(NSCoder *)self __failWithExceptionName:@"NSInvalidUnarchiveOperationException", 4864, @"Class '%s' does not implement initWithCoder:.", class_getName(a3), v9 errorCode format];
    return 0;
  }
  Superclass = a3;
  while ((_classOverridesSelector(Superclass, sel_initWithCoder_) & 1) == 0)
  {
    Superclass = class_getSuperclass(Superclass);
    if (!Superclass) {
      goto LABEL_8;
    }
  }
  Class = object_getClass(Superclass);
  if ((_classOverridesSelector(Class, sel_supportsSecureCoding) & 1) == 0)
  {
    Name = class_getName(a3);
    [(NSCoder *)self __failWithExceptionName:@"NSInvalidUnarchiveOperationException", 4864, @"Class '%s' has a superclass that supports secure coding, but '%s' overrides -initWithCoder: and does not override +supportsSecureCoding. The class must implement +supportsSecureCoding and return YES to verify that its implementation of -initWithCoder: is secure coding compliant.", Name, class_getName(a3) errorCode format];
    return 0;
  }
  return 1;
}

- (Class)_isPossibleNestedCollectionClass:(uint64_t)a1
{
  Class result = 0;
  if (a1)
  {
    v4 = a2;
    if (a2)
    {
      while (1)
      {
        if (v4 == (objc_class *)MEMORY[0x1E4FBA8A8]) {
          return 0;
        }
        if (qword_1EB1ED1B0 != -1) {
          dispatch_once(&qword_1EB1ED1B0, &__block_literal_global_274);
        }
        if ([(id)qword_1EB1ED1A8 containsObject:v4]) {
          break;
        }
        Class result = class_getSuperclass(v4);
        v4 = result;
        if (!result) {
          return result;
        }
      }
      return (Class)1;
    }
  }
  return result;
}

- (BOOL)validateAllowedClass:(Class)a3 forKey:(id)a4
{
  return [(NSCoder *)self _validateAllowedClass:a3 forKey:a4 allowingInvocations:0];
}

- (BOOL)_validateAllowedClass:(Class)a3 forKey:(id)a4 allowingInvocations:(BOOL)a5
{
  BOOL v5 = a5;
  if (![(NSCoder *)self _validateAllowedClassesContainsClass:a3 forKey:a4]|| v5 && ((Class)MEMORY[0x1E4F1CA18] == a3 || (Class)MEMORY[0x1E4F1C988] == a3))
  {
    return 0;
  }

  return [(NSCoder *)self validateClassSupportsSecureCoding:a3];
}

- (void)encodeRect:(NSRect)rect forKey:(NSString *)key
{
  v6 = NSStringFromRect(rect);

  [(NSCoder *)self encodeObject:v6 forKey:key];
}

- (void)encodeSize:(NSSize)size forKey:(NSString *)key
{
  v6 = NSStringFromSize(size);

  [(NSCoder *)self encodeObject:v6 forKey:key];
}

- (NSArray)decodeArrayOfObjectsOfClass:(Class)cls forKey:(NSString *)key
{
  v7 = (void *)[MEMORY[0x1E4F1CAD0] setWithObject:cls];
  v8 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (!-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, v7, (uint64_t)v8))return 0; {

  }
  return [(NSCoder *)self decodeArrayOfObjectsOfClasses:v7 forKey:key];
}

- (BOOL)_validateDecodeCollectionAllowedClassesRequirementsWithClasses:(uint64_t)a3 forMethodExceptionProem:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [a2 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v24 != v7) {
        objc_enumerationMutation(a2);
      }
      uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
      if (!object_isClass(v9))
      {
        int v14 = +[NSString stringWithFormat:@"%@ object in class list '%@' is not an Objective-C class!", a3, v9];
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0]);
      }
      if (v9 == (void *)MEMORY[0x1E4FBA8A8]
        && !-[NSCoder _warnAboutNSObjectInAllowedClassesWithException:]((uint64_t)a1, 1))
      {
        return 0;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [a2 countByEnumeratingWithState:&v23 objects:v22 count:16];
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  int v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  uint64_t v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__NSCoder__validateDecodeCollectionAllowedClassesRequirementsWithClasses_forMethodExceptionProem___block_invoke;
  v15[3] = &unk_1E51F6DD0;
  v15[4] = a1;
  v15[5] = &v16;
  [a2 enumerateObjectsUsingBlock:v15];
  id v10 = (void *)v17[5];
  BOOL v11 = v10 == 0;
  if (v10)
  {
    [v10 appendString:@"\n\t\n"]);
    v12 = +[NSString stringWithFormat:@"%@: This method only supports decoding non-nested collections. Please remove the following or use '-decodeObjectOfClasses: forKey:' instead: %@", a3, v17[5]];

    objc_msgSend(a1, "__failWithExceptionName:errorCode:format:", @"NSInvalidUnarchiveOperationException", 4864, @"%@", v12);
  }
  _Block_object_dispose(&v16, 8);
  return v11;
}

- (NSRect)decodeRectForKey:(NSString *)key
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSCoder *)self decodeObjectOfClass:objc_opt_class() forKey:key];
  if (v3)
  {
    long long v8 = 0u;
    *(_OWORD *)uint64_t v9 = 0u;
    parseFloats(v3, 4, (uint64_t)&v8);
    double v5 = *((double *)&v8 + 1);
    double v4 = *(double *)&v8;
    double v7 = v9[1];
    double v6 = v9[0];
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (NSSize)decodeSizeForKey:(NSString *)key
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSCoder *)self decodeObjectOfClass:objc_opt_class() forKey:key];
  if (v3)
  {
    double v6 = 0.0;
    double v7 = 0.0;
    parseFloats(v3, 2, (uint64_t)&v6);
    double v4 = v6;
    double v5 = v7;
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)decodeObjectOfClass:(Class)aClass forKey:(NSString *)key
{
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:aClass];

  return [(NSCoder *)self decodeObjectOfClasses:v6 forKey:key];
}

- (id)decodeTopLevelObjectOfClasses:(NSSet *)classes forKey:(NSString *)key error:(NSError *)error
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__NSCoder_decodeTopLevelObjectOfClasses_forKey_error___block_invoke;
  v6[3] = &unk_1E51F6DA8;
  v6[4] = self;
  v6[5] = classes;
  v6[6] = key;
  return (id)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](self, (uint64_t)key, error, (uint64_t)v6);
}

- (uint64_t)__tryDecodeObjectForKey:(void *)a3 error:(uint64_t)a4 decodeBlock:
{
  if (!a1) {
    return 0;
  }
  if (!a4) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSCoder(Exceptions) __tryDecodeObjectForKey:error:decodeBlock:]"), @"NSCoder.m", 1370, @"Invalid parameter not satisfying: %@", @"decodeBlock != nil");
  }
  uint64_t v8 = [a1 decodingFailurePolicy];
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (v8 && (uint64_t v10 = (void *)[a1 error]) != 0)
  {
    if (a3) {
      *a3 = v10;
    }
    objc_msgSend(a1, "__setError:", 0);
    return 0;
  }
  else if (a3 && !v9)
  {
    if (a2)
    {
      BOOL v11 = (void *)MEMORY[0x1E4F1C9E8];
      v12 = +[NSString stringWithFormat:@"requested key: '%@'", a2];
      uint64_t v13 = [v11 dictionaryWithObject:v12 forKey:*MEMORY[0x1E4F1D138]];
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v9 = 0;
    *a3 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:4865 userInfo:v13];
  }
  return v9;
}

uint64_t __54__NSCoder_decodeTopLevelObjectOfClasses_forKey_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeObjectOfClasses:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (id)decodeObjectOfClasses:(NSSet *)classes forKey:(NSString *)key
{
  if (![(NSCoder *)self allowsKeyedCoding])
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: This method is only implemented for coders which allowKeyedCoding.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  if ([(NSCoder *)self requiresSecureCoding])
  {
    uint64_t v8 = NSClassFromString((NSString *)@"NSCoder");
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }

  return [(NSCoder *)self decodeObjectForKey:key];
}

- (BOOL)requiresSecureCoding
{
  return 0;
}

uint64_t __44__NSCoder_decodeTopLevelObjectForKey_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeObjectForKey:*(void *)(a1 + 40)];
}

- (NSError)error
{
  return 0;
}

- (uint64_t)_walkAllowedClassListValidatingInstance:(uint64_t)a3 forKey:(void *)a4 allowedClasses:(int)a5 strictModeEnabled:(char)a6 alwaysEnforceExplicitSubclasses:(int)a7 specialCaseObject:(uint64_t *)a8 invalidElementClass:
{
  v32[128] = *(void **)MEMORY[0x1E4F143B8];
  if (!a1
    || !-[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]((uint64_t)a1, (void *)[a2 classForCoder], a3, a4, a5, a6, a7))
  {
    return 0;
  }
  if (![a1 _enforceCollectionTyping]
    || (_NSIsNSArray() & 1) == 0
    && (_NSIsNSSet() & 1) == 0
    && (_NSIsNSOrderedSet() & 1) == 0
    && !_NSIsNSDictionary())
  {
    return 1;
  }
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  memset(&callBacks, 0, sizeof(callBacks));
  CFSetRef v13 = CFSetCreateMutable(v12, 32, &callBacks);
  memset(&v26, 0, sizeof(v26));
  int v14 = CFArrayCreateMutable(v12, 32, &v26);
  CFArrayAppendValue(v14, a2);
  CFIndex Count = CFArrayGetCount(v14);
  if (!Count)
  {
LABEL_24:
    uint64_t v23 = 1;
    goto LABEL_25;
  }
  long long v25 = a8;
  while (1)
  {
    CFIndex v16 = Count - 1;
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v14, Count - 1);
    CFArrayRemoveValueAtIndex(v14, v16);
    if (!CFSetContainsValue(v13, ValueAtIndex)) {
      break;
    }
LABEL_23:
    CFIndex Count = CFArrayGetCount(v14);
    if (!Count) {
      goto LABEL_24;
    }
  }
  CFSetAddValue(v13, ValueAtIndex);
  uint64_t v18 = [ValueAtIndex classForCoder];
  if ([a1 _validateAllowedClassesContainsClass:v18 forKey:a3])
  {
    if ((_NSIsNSArray() & 1) != 0
      || (_NSIsNSSet() & 1) != 0
      || (_NSIsNSOrderedSet() & 1) != 0
      || _NSIsNSDictionary())
    {
      int v19 = _NSIsNSDictionary();
      long long v30 = 0u;
      long long v31 = 0u;
      *(_OWORD *)newValues = 0u;
      long long v29 = 0u;
      uint64_t v20 = [ValueAtIndex countByEnumeratingWithState:newValues objects:v32 count:128];
      if (v20)
      {
        CFIndex v21 = v20;
        do
        {
          v33.location = v16;
          v33.length = 0;
          CFArrayReplaceValues(v14, v33, (const void **)newValues[1], v21);
          v16 += v21;
          if (v19)
          {
            for (uint64_t i = 0; i != v21; ++i)
              v32[i] = (void *)[ValueAtIndex objectForKey:newValues[1][i]];
            v34.location = v16;
            v34.length = 0;
            CFArrayReplaceValues(v14, v34, (const void **)v32, v21);
            v16 += v21;
          }
          CFIndex v21 = [ValueAtIndex countByEnumeratingWithState:newValues objects:v32 count:128];
        }
        while (v21);
      }
    }
    goto LABEL_23;
  }
  uint64_t v23 = 0;
  if (v25) {
    uint64_t *v25 = v18;
  }
LABEL_25:
  CFRelease(v13);
  CFRelease(v14);
  return v23;
}

- (BOOL)_enforceCollectionTyping
{
  if (qword_1EB1ED198 != -1) {
    dispatch_once(&qword_1EB1ED198, &__block_literal_global_5);
  }
  return dword_1EB1ED194 == 0;
}

- (BOOL)_validateAllowedClassesContainsClass:(Class)a3 forKey:(id)a4
{
  double v4 = (__CFString *)a4;
  if (!a3)
  {
    BOOL v11 = +[NSString stringWithFormat:@"Attempt to decode an object with no class for key '%@'.", a4];
    CFAllocatorRef v12 = (void *)MEMORY[0x1E4F1CA00];
    CFSetRef v13 = &NSInvalidUnarchiveOperationException;
    goto LABEL_15;
  }
  if (!object_isClass(a3))
  {
    BOOL v11 = +[NSString stringWithFormat:@"%@ object in class list '%@' is not an Objective-C class!", _NSMethodExceptionProem((objc_class *)self, sel_validateAllowedClass_forKey_), a3];
    CFAllocatorRef v12 = (void *)MEMORY[0x1E4F1CA00];
    CFSetRef v13 = (const NSExceptionName *)MEMORY[0x1E4F1C3C8];
LABEL_15:
    objc_exception_throw((id)[v12 exceptionWithName:*v13 reason:v11 userInfo:0]);
  }
  double v7 = [(NSCoder *)self allowedClasses];
  if (![(NSSet *)v7 containsObject:MEMORY[0x1E4FBA8A8]]
    || (int v8 = -[NSCoder _warnAboutNSObjectInAllowedClassesWithException:]((uint64_t)self, 1)) != 0)
  {
    Superclass = a3;
    do
    {
      if ([(NSSet *)v7 containsObject:Superclass])
      {
        LOBYTE(v8) = 1;
        return v8;
      }
      Superclass = class_getSuperclass(Superclass);
    }
    while (Superclass);
    if (!v4) {
      double v4 = @"(no key, possibly an argument to a message)";
    }
    uint64_t v10 = -[NSCoder __allowedClassesDescriptionForClass:]((NSString *)self, (uint64_t)a3);
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", @"NSInvalidUnarchiveOperationException", 4864, @"value for key '%@' was of unexpected class %@.\nAllowed classes are:\n %@", v4, v10, -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)self, v7));
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)failWithError:(NSError *)error
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (error)
  {
    if (!self) {
      return;
    }
  }
  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSCoder(Exceptions) failWithError:]"), @"NSCoder.m", 1354, @"Invalid parameter not satisfying: %@", @"error != nil");
    if (!self) {
      return;
    }
  }
  uint64_t v6 = @"__NSCoderError";
  v7[0] = error;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  -[NSCoder __failWithException:](self, objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", @"NSInvalidUnarchiveOperationException", -[NSError localizedDescription](error, "localizedDescription"), v5));
}

- (BOOL)__failWithExceptionName:(id)a3 errorCode:(int64_t)a4 format:(id)a5
{
  unint64_t v9 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (!a4) {
      goto LABEL_5;
    }
  }
  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSCoder(Exceptions) __failWithExceptionName:errorCode:format:]"), @"NSCoder.m", 1464, @"Invalid parameter not satisfying: %@", @"exceptionName != nil");
    if (!v9) {
      goto LABEL_5;
    }
  }
  if (v9 >> 1 != 2432) {
    __NSCoderInvalidState(@"invalid error code: %ld", (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, v5, v6, v7, v9);
  }
  int v14 = @"__NSCoderInternalErrorCode";
  v15[0] = +[NSNumber numberWithInteger:v9];
  unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
LABEL_5:
  if (a5) {
    CFAllocatorRef v12 = [[NSString alloc] initWithFormat:a5 arguments:&v16];
  }
  else {
    CFAllocatorRef v12 = (NSString *)&stru_1ECA5C228;
  }
  return -[NSCoder __failWithException:](self, (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:a3 reason:v12 userInfo:v9]);
}

- (BOOL)__failWithException:(void *)a1
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (![a1 decodingFailurePolicy]
      || (v5[0] = 0, !objc_msgSend((id)objc_opt_class(), "__categorizeException:intoError:", a2, v5)))
    {
      objc_exception_throw(a2);
    }
    objc_msgSend(a1, "__setError:", v5[0]);
  }
  return a1 != 0;
}

- (NSDecodingFailurePolicy)decodingFailurePolicy
{
  return 0;
}

+ (BOOL)__categorizeException:(id)a3 intoError:(id *)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSCoder(Exceptions) __categorizeException:intoError:]"), @"NSCoder.m", 1501, @"Invalid parameter not satisfying: %@", @"exception != nil" file lineNumber description];
    if (a4) {
      goto LABEL_3;
    }
  }
  [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSCoder(Exceptions) __categorizeException:intoError:]"), @"NSCoder.m", 1502, @"Invalid parameter not satisfying: %@", @"outError != NULL" file lineNumber description];
LABEL_3:
  uint64_t v6 = (void *)[a3 userInfo];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = (void *)[v6 objectForKey:@"__NSCoderInternalErrorCode"];
    uint64_t v9 = [v7 objectForKey:@"__NSCoderError"];
    v17 = (NSError *)v9;
    if (v8 && v9) {
      __NSCoderInvalidState(@"expected only one of: internal error code (%@) or external error (%@) not both", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }
    if (v8)
    {
      if ((_NSIsNSNumber() & 1) == 0)
      {
        uint64_t v29 = objc_opt_class();
        __NSCoderInvalidState(@"wrong type for error code value %@, expecting NSNumber", v30, v31, v32, v33, v34, v35, v36, v29);
      }
      unint64_t v18 = [v8 integerValue];
      unint64_t v26 = v18;
      if (v18 >> 1 != 2432) {
        __NSCoderInvalidState(@"invalid error code: %ld", v19, v20, v21, v22, v23, v24, v25, v18);
      }
      if (!a4) {
        goto LABEL_19;
      }
      uint64_t v27 = (void *)[a3 reason];
      if ([v27 length]) {
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v27 forKey:*MEMORY[0x1E4F1D138]];
      }
      else {
        uint64_t v28 = 0;
      }
      v17 = [[NSError alloc] initWithDomain:@"NSCocoaErrorDomain" code:v26 userInfo:v28];
LABEL_18:
      *a4 = v17;
LABEL_19:
      LOBYTE(v6) = 1;
      return (char)v6;
    }
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        __NSCoderInvalidState(@"expected external to be a kind of NSError, instead it is a '%@'", v39, v40, v41, v42, v43, v44, v45, (uint64_t)v38);
      }
      if (!a4) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    LOBYTE(v6) = 0;
  }
  return (char)v6;
}

- (void)decodeValueOfObjCType:(const char *)type at:(void *)data size:(NSUInteger)size
{
  sizep[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = objc_opt_class();
  sizep[0] = 0;
  NSGetSizeAndAlignment(type, sizep, 0);
  if (sizep[0] != size)
  {
    uint64_t v14 = +[NSString stringWithFormat:@"Cannot get decode with size %zu. The type encoded as %s is expected to be %zu bytes", size, type, sizep[0]];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0]);
  }
  uint64_t v11 = [v10 instanceMethodForSelector:sel_decodeValueOfObjCType_at_];
  if (v11 == +[NSCoder instanceMethodForSelector:](NSCoder, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_)|| (uint64_t v12 = [v10 instanceMethodForSelector:sel_decodeValueOfObjCType_at_size_], v12 != +[NSCoder instanceMethodForSelector:](NSCoder, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_size_)))
  {
    uint64_t v13 = NSClassFromString((NSString *)@"NSCoder");
    NSRequestConcreteImplementation((uint64_t)self, a2, v13);
  }
  [(NSCoder *)self decodeValueOfObjCType:type at:data];
}

- (BOOL)allowsKeyedCoding
{
  return 0;
}

- (NSDictionary)decodeDictionaryWithKeysOfClass:(Class)keyCls objectsOfClass:(Class)objectCls forKey:(NSString *)key
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v14[0] = keyCls;
  v14[1] = objectCls;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 2));
  uint64_t v11 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (!-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, v10, (uint64_t)v11))return 0; {
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:keyCls];
  }
  return -[NSCoder decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:](self, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v12, [MEMORY[0x1E4F1CAD0] setWithObject:objectCls], key);
}

NSMutableString *__98__NSCoder__validateDecodeCollectionAllowedClassesRequirementsWithClasses_forMethodExceptionProem___block_invoke(uint64_t a1, objc_class *a2)
{
  NSSize result = (NSMutableString *)-[NSCoder _isPossibleNestedCollectionClass:](*(void *)(a1 + 32), a2);
  if (result)
  {
    uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\n\t\t%@", -[NSCoder __allowedClassesDescriptionForClass:](*(NSString **)(a1 + 32), (uint64_t)a2));
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v6)
    {
      return (NSMutableString *)[v6 appendString:v5];
    }
    else
    {
      NSSize result = -[NSString initWithFormat:]([NSMutableString alloc], "initWithFormat:", @"\n\t(%@"), v5;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    }
  }
  return result;
}

- (id)decodePropertyListForKey:(NSString *)key
{
  if (![(NSCoder *)self allowsKeyedCoding])
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: This method is only implemented for coders which allowKeyedCoding.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);

  return [(NSCoder *)self decodeObjectOfClasses:v12 forKey:key];
}

- (id)decodeTopLevelObjectForKey:(NSString *)key error:(NSError *)error
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __44__NSCoder_decodeTopLevelObjectForKey_error___block_invoke;
  v5[3] = &unk_1E51F6D80;
  v5[4] = self;
  v5[5] = key;
  return (id)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](self, (uint64_t)key, error, (uint64_t)v5);
}

- (id)decodeTopLevelObjectOfClass:(Class)aClass forKey:(NSString *)key error:(NSError *)error
{
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:aClass];

  return [(NSCoder *)self decodeObjectOfClasses:v8 forKey:key error:error];
}

- (void)encodeValueOfObjCType:(const char *)type at:(const void *)addr
{
  uint64_t v6 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeDataObject:(NSData *)data
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)decodeValueOfObjCType:(const char *)type at:(void *)data
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v8 instanceMethodForSelector:sel_decodeValueOfObjCType_at_size_];
  if (v9 == +[NSCoder instanceMethodForSelector:](NSCoder, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_size_)|| (uint64_t v10 = [v8 instanceMethodForSelector:sel_decodeValueOfObjCType_at_], v10 != +[NSCoder instanceMethodForSelector:](NSCoder, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_)))
  {
    uint64_t v12 = NSClassFromString((NSString *)@"NSCoder");
    NSRequestConcreteImplementation((uint64_t)self, a2, v12);
  }
  uint64_t v11 = _NSOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)uint64_t v13 = 138412290;
    *(void *)&v13[4] = v8;
    _os_log_fault_impl(&dword_181795000, v11, OS_LOG_TYPE_FAULT, "%@ overrode the default implementation of '-decodeValueOfObjCType:at:', which is insecure and deprecated, but not '-decodeValueOfObjCType:at:size:' which is insecure as it can lead to potential buffer overflows. Use the safer '-decodeValueOfObjCType:at:size:' method", v13, 0xCu);
  }
  *(void *)uint64_t v13 = 0;
  NSGetSizeAndAlignment(type, (NSUInteger *)v13, 0);
  [(NSCoder *)self decodeValueOfObjCType:type at:data size:*(void *)v13];
}

- (NSData)decodeDataObject
{
  double v4 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSInteger)versionForClassName:(NSString *)className
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)encodeObject:(id)object
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = object;
  [(NSCoder *)self encodeValueOfObjCType:"@" at:v3];
}

- (void)encodeValuesOfObjCTypes:(const char *)types
{
  va_start(va, types);
  va_copy(v6, va);
  if (*types)
  {
    id v3 = types;
    do
      -[NSCoder encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", v3, *(void *)v6, v6 + 8);
    while (*(unsigned __int8 *)++v3);
  }
}

- (void)encodeArrayOfObjCType:(const char *)type count:(NSUInteger)count at:(const void *)array
{
  v12[1] = *MEMORY[0x1E4F143B8];
  size_t v9 = strlen(type);
  size_t v10 = v9 + 16;
  if (v9 + 16 < 0x201)
  {
    if (v9 == -16)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = (char *)v12 - ((v9 + 31) & 0xFFFFFFFFFFFFFFF0);
      bzero(v11, v10);
    }
  }
  else
  {
    uint64_t v11 = (char *)malloc_type_malloc(v9 + 16, 0x100004077774924uLL);
  }
  snprintf(v11, v10, "[%lu%s]", count, type);
  [(NSCoder *)self encodeValueOfObjCType:v11 at:array];
  if (v10 >= 0x201) {
    free(v11);
  }
}

- (void)encodeBytes:(const void *)byteaddr length:(NSUInteger)length
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = length;
  [(NSCoder *)self encodeValueOfObjCType:"I" at:&v6];
  [(NSCoder *)self encodeArrayOfObjCType:"c" count:v6 at:byteaddr];
}

- (id)decodeObject
{
  v4[1] = *(id *)MEMORY[0x1E4F143B8];
  if ([(NSCoder *)self error]) {
    return 0;
  }
  v4[0] = 0;
  [(NSCoder *)self decodeValueOfObjCType:"@" at:v4 size:8];
  return v4[0];
}

- (id)decodeTopLevelObjectAndReturnError:(NSError *)error
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  id v4[2] = __46__NSCoder_decodeTopLevelObjectAndReturnError___block_invoke;
  v4[3] = &unk_1E51F6D58;
  v4[4] = self;
  return (id)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](self, 0, error, (uint64_t)v4);
}

uint64_t __46__NSCoder_decodeTopLevelObjectAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeObject];
}

- (void)decodeValuesOfObjCTypes:(const char *)types
{
  va_start(va, types);
  va_copy(v6, va);
  if (*types)
  {
    id v3 = types;
    do
      -[NSCoder decodeValueOfObjCType:at:](self, "decodeValueOfObjCType:at:", v3, *(void *)v6, v6 + 8);
    while (*(unsigned __int8 *)++v3);
  }
}

- (void)decodeArrayOfObjCType:(const char *)itemType count:(NSUInteger)count at:(void *)array
{
  v12[1] = *MEMORY[0x1E4F143B8];
  size_t v9 = strlen(itemType);
  size_t v10 = v9 + 23;
  if (v9 + 23 < 0x201)
  {
    if (v9 == -23)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = (char *)v12 - ((v9 + 38) & 0xFFFFFFFFFFFFFFF0);
      bzero(v11, v10);
    }
  }
  else
  {
    uint64_t v11 = (char *)malloc_type_malloc(v9 + 23, 0x100004077774924uLL);
  }
  snprintf(v11, v10, "[%lu%s]", count, itemType);
  [(NSCoder *)self decodeValueOfObjCType:v11 at:array];
  if (v10 >= 0x201) {
    free(v11);
  }
}

- (void)decodeBytesWithReturnedLength:(NSUInteger *)lengthp
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = 0;
  [(NSCoder *)self decodeValueOfObjCType:"I" at:&v7 size:4];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", v7), "mutableBytes");
  [(NSCoder *)self decodeArrayOfObjCType:"c" count:v7 at:v5];
  *lengthp = v7;
  return v5;
}

- (BOOL)_allowsValueCoding
{
  return 0;
}

- (void)encodeObject:(id)object forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)decodeObjectForKey:(NSString *)key
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)encodeConditionalObject:(id)object forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeBool:(BOOL)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeInt:(int)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeInt32:(int32_t)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeInt64:(int64_t)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeFloat:(float)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeDouble:(double)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeBytes:(const uint8_t *)bytes length:(NSUInteger)length forKey:(NSString *)key
{
  unsigned int v7 = NSClassFromString((NSString *)@"NSCoder");

  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (BOOL)containsValueForKey:(NSString *)key
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)decodeBoolForKey:(NSString *)key
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int)decodeIntForKey:(NSString *)key
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int32_t)decodeInt32ForKey:(NSString *)key
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int64_t)decodeInt64ForKey:(NSString *)key
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (float)decodeFloatForKey:(NSString *)key
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (double)decodeDoubleForKey:(NSString *)key
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (const)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (unsigned)systemVersion
{
  return 1000;
}

- (NSArray)decodeArrayOfObjectsOfClasses:(NSSet *)classes forKey:(NSString *)key
{
  unsigned int v7 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, classes, (uint64_t)v7))
  {
    if ([(NSCoder *)self allowsKeyedCoding])
    {
      if ([(NSCoder *)self requiresSecureCoding])
      {
        size_t v9 = NSClassFromString((NSString *)@"NSCoder");
        NSRequestConcreteImplementation((uint64_t)self, a2, v9);
      }
      size_t v10 = +[NSString stringWithFormat:@"%@: This method only supports secure coding.", _NSMethodExceptionProem((objc_class *)self, a2)];
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = &NSInvalidUnarchiveOperationException;
    }
    else
    {
      size_t v10 = +[NSString stringWithFormat:@"%@: This method is only implemented for coders which allowKeyedCoding.", _NSMethodExceptionProem((objc_class *)self, a2)];
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = (const NSExceptionName *)MEMORY[0x1E4F1C3C8];
    }
    objc_exception_throw((id)[v11 exceptionWithName:*v12 reason:v10 userInfo:0]);
  }
  return 0;
}

- (NSDictionary)decodeDictionaryWithKeysOfClasses:(NSSet *)keyClasses objectsOfClasses:(NSSet *)objectClasses forKey:(NSString *)key
{
  unsigned int v7 = [(NSSet *)keyClasses setByAddingObjectsFromSet:objectClasses];
  uint64_t v8 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, v7, (uint64_t)v8))
  {
    if ([(NSCoder *)self allowsKeyedCoding])
    {
      if ([(NSCoder *)self requiresSecureCoding])
      {
        size_t v10 = NSClassFromString((NSString *)@"NSCoder");
        NSRequestConcreteImplementation((uint64_t)self, a2, v10);
      }
      uint64_t v11 = +[NSString stringWithFormat:@"%@: This method only supports secure coding.", _NSMethodExceptionProem((objc_class *)self, a2)];
      uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = &NSInvalidUnarchiveOperationException;
    }
    else
    {
      uint64_t v11 = +[NSString stringWithFormat:@"%@: This method is only implemented for coders which allowKeyedCoding.", _NSMethodExceptionProem((objc_class *)self, a2)];
      uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = (const NSExceptionName *)MEMORY[0x1E4F1C3C8];
    }
    objc_exception_throw((id)[v12 exceptionWithName:*v13 reason:v11 userInfo:0]);
  }
  return 0;
}

- (NSSet)allowedClasses
{
  return 0;
}

- (uint64_t)_warnAboutNSObjectInAllowedClassesWithException:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  id v3 = (objc_class *)result;
  uint64_t v4 = objc_msgSend((id)result, "__decoderInfoForAllowedClassesWarning");
  uint64_t v5 = _NSRuntimeIssuesLog();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    if (a2) {
      goto LABEL_4;
    }
    return 1;
  }
  *(_DWORD *)buf = 138543874;
  uint64_t v8 = _NSMethodExceptionProem(v3, sel_validateAllowedClass_forKey_);
  __int16 v9 = 2114;
  id v10 = -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)v3, (void *)[(objc_class *)v3 allowedClasses]);
  __int16 v11 = 2114;
  uint64_t v12 = v4;
  _os_log_fault_impl(&dword_181795000, v5, OS_LOG_TYPE_FAULT, "%{public}@: NSSecureCoding allowed classes list contains [NSObject class], which bypasses security by allowing any Objective-C class to be implicitly decoded. Consider reducing the scope of allowed classes during decoding by listing only the classes you expect to decode, or a more specific base class than NSObject. This will become an error in the future. Allowed class list: %{public}@%{public}@", buf, 0x20u);
  if (!a2) {
    return 1;
  }
LABEL_4:
  if (!dyld_program_sdk_at_least()) {
    return 1;
  }
  if (qword_1EB1ED198 != -1) {
    dispatch_once(&qword_1EB1ED198, &__block_literal_global_5);
  }
  if (dword_1EB1ED194 == 2) {
    return 1;
  }
  va_list v6 = _NSMethodExceptionProem(v3, sel_validateAllowedClass_forKey_);
  -[objc_class __failWithExceptionName:errorCode:format:](v3, "__failWithExceptionName:errorCode:format:", @"NSInvalidUnarchiveOperationException", 4864, @"%@: NSSecureCoding allowed classes list contains '[NSObject class]', which bypasses security by allowing any Objective-C class to be implicitly decoded. Consider reducing the scope of allowed classes during decoding by listing only the classes you expect to decode, or a more specific base class than NSObject. Allowed class list: %@%@", v6, -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)v3, (void *)[(objc_class *)v3 allowedClasses]), v4);
  return 0;
}

- (NSString)__allowedClassesDescriptionForClass:(NSString *)result
{
  if (result) {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"'%@' (%p) [%@]", a2, a2, [(NSURL *)[+[NSBundle bundleForClass:a2] bundleURL] path]);
  }
  return result;
}

- (BOOL)_shouldExemptProcessBasedOnArchivingExceptionRules:(BOOL)result
{
  v2[5] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __62__NSCoder__shouldExemptProcessBasedOnArchivingExceptionRules___block_invoke;
    v2[3] = &__block_descriptor_40_e5_v8__0l;
    v2[4] = a2;
    if (qword_1EB1ED1A0 != -1) {
      dispatch_once(&qword_1EB1ED1A0, v2);
    }
    return _MergedGlobals_93 != 0;
  }
  return result;
}

void __62__NSCoder__shouldExemptProcessBasedOnArchivingExceptionRules___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  getpid();
  uint64_t v8 = *(void *)(a1 + 32);
  if (sandbox_check()
    || (v4 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", *(void *)(a1 + 32), 4, v8), (uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithContentsOfFile:v4]) == 0))
  {
    byte_1EB1ED191 = 1;
    v2 = _NSOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_181795000, v2, OS_LOG_TYPE_ERROR, "No ArchivingExceptions available / readable. Allowing all.", buf, 2u);
    }
    id v3 = 0;
  }
  else
  {
    id v3 = v5;
    byte_1EB1ED191 = objc_msgSend(v5, "containsObject:", -[NSProcessInfo processName](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "processName"));
  }

  if (byte_1EB1ED191)
  {
    char v6 = 1;
  }
  else
  {
    if (qword_1EB1ED198 != -1) {
      dispatch_once(&qword_1EB1ED198, &__block_literal_global_5);
    }
    if (byte_1EB1ED191) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = dword_1EB1ED194 == 2;
    }
    char v6 = v7;
  }
  _MergedGlobals_93 = v6;
}

- (NSString)__descriptionForUnexpectedClass:(__CFString *)a3 forKey:(void *)a4 allowedClasses:
{
  if (result)
  {
    if (a3) {
      uint64_t v4 = a3;
    }
    else {
      uint64_t v4 = @"(no key, possibly an argument to a message)";
    }
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"value for key '%@' was of unexpected class %@.\nAllowed classes are:\n %@", v4, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"'%@' (%p) [%@]", a2, a2, -[NSURL path](-[NSBundle bundleURL](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", a2), "bundleURL"), "path")), -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)result, a4));
  }
  return result;
}

- (id)_allowedClassesDescriptionForClasses:(uint64_t)a1
{
  v6[6] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__NSCoder__allowedClassesDescriptionForClasses___block_invoke;
  v6[3] = &unk_1E51F6DF8;
  v6[4] = v4;
  v6[5] = a1;
  [a2 enumerateObjectsUsingBlock:v6];
  return v4;
}

- (NSString)__descriptionForUnexpectedElementClass:(__CFString *)a3 forContainerKey:(void *)a4 allowedClasses:
{
  if (result)
  {
    if (a3) {
      id v4 = a3;
    }
    else {
      id v4 = @"(no key, possibly an argument to a message)";
    }
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"collection for key '%@' recursively contained an element of unexpected class %@.\nAllowed classes are:\n %@", v4, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"'%@' (%p) [%@]", a2, a2, -[NSURL path](-[NSBundle bundleURL](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", a2), "bundleURL"), "path")), -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)result, a4));
  }
  return result;
}

uint64_t __48__NSCoder__allowedClassesDescriptionForClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = -[NSCoder __allowedClassesDescriptionForClass:](*(NSString **)(a1 + 40), a2);

  return [v2 addObject:v3];
}

- (void)_warnAboutPlistType:(uint64_t)a3 forKey:(void *)a4 missingInAllowedClasses:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v8 = _NSOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544386;
      uint64_t v10 = _NSMethodExceptionProem(a1, sel_validateAllowedClass_forKey_);
      __int16 v11 = 2114;
      uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"'%@' (%p) [%@]", a2, a2, [(NSURL *)[+[NSBundle bundleForClass:a2] bundleURL] path]);
      __int16 v13 = 2114;
      uint64_t v14 = a3;
      __int16 v15 = 2114;
      id v16 = -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)a1, a4);
      __int16 v17 = 2114;
      uint64_t v18 = [(objc_class *)a1 __decoderInfoForAllowedClassesWarning];
      _os_log_fault_impl(&dword_181795000, v8, OS_LOG_TYPE_FAULT, "%{public}@ allowed unarchiving safe plist type '%{public}@' for key '%{public}@', even though it was not explicitly included in the client allowed classes set: '%{public}@'. This will be disallowed in the future.%{public}@", buf, 0x34u);
    }
  }
}

- (id)__decoderInfoForAllowedClassesWarning
{
  return &stru_1ECA5C228;
}

- (void)__setError:(id)a3
{
  __NSCoderInvalidState(@"Attempting to set decode error on throwing NSCoder %@", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)self);
}

- (NSString)__failWithUnexpectedClass:(__CFString *)a3 forKey:(void *)a4 allowedClasses:
{
  if (result) {
    return (NSString *)-[NSString __failWithExceptionName:errorCode:format:](result, "__failWithExceptionName:errorCode:format:", @"NSInvalidUnarchiveOperationException", 4864, @"%@", -[NSCoder __descriptionForUnexpectedClass:forKey:allowedClasses:](result, a2, a3, a4));
  }
  return result;
}

- (NSString)__failWithUnexpectedElementClass:(__CFString *)a3 forContainerKey:(void *)a4 allowedClasses:
{
  if (result) {
    return (NSString *)-[NSString __failWithExceptionName:errorCode:format:](result, "__failWithExceptionName:errorCode:format:", @"NSInvalidUnarchiveOperationException", 4864, @"%@", -[NSCoder __descriptionForUnexpectedElementClass:forContainerKey:allowedClasses:](result, a2, a3, a4));
  }
  return result;
}

- (void)encodePoint:(NSPoint)point
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  float x = point.x;
  float v6 = x;
  float y = point.y;
  float v5 = y;
  -[NSCoder encodeValuesOfObjCTypes:](self, "encodeValuesOfObjCTypes:", "ff", &v6, &v5);
}

- (NSPoint)decodePoint
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  float v5 = 0.0;
  float v4 = 0.0;
  -[NSCoder decodeValuesOfObjCTypes:](self, "decodeValuesOfObjCTypes:", "ff", &v5, &v4);
  double v2 = v5;
  double v3 = v4;
  result.float y = v3;
  result.float x = v2;
  return result;
}

- (void)encodeSize:(NSSize)size
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  float width = size.width;
  float v6 = width;
  float height = size.height;
  float v5 = height;
  -[NSCoder encodeValuesOfObjCTypes:](self, "encodeValuesOfObjCTypes:", "ff", &v6, &v5);
}

- (NSSize)decodeSize
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  float v5 = 0.0;
  float v4 = 0.0;
  -[NSCoder decodeValuesOfObjCTypes:](self, "decodeValuesOfObjCTypes:", "ff", &v5, &v4);
  double v2 = v5;
  double v3 = v4;
  result.float height = v3;
  result.float width = v2;
  return result;
}

- (void)encodeRect:(NSRect)rect
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  float x = rect.origin.x;
  float y = rect.origin.y;
  float v9 = y;
  float v10 = x;
  float width = rect.size.width;
  float height = rect.size.height;
  float v7 = height;
  float v8 = width;
  -[NSCoder encodeValuesOfObjCTypes:](self, "encodeValuesOfObjCTypes:", "ffff", &v10, &v9, &v8, &v7);
}

- (NSRect)decodeRect
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  v7[0] = 0;
  -[NSCoder decodeValuesOfObjCTypes:](self, "decodeValuesOfObjCTypes:", "ffff", (char *)v7 + 4, v7, (char *)&v6 + 4, &v6);
  double v2 = *((float *)v7 + 1);
  double v3 = *(float *)v7;
  double v4 = *((float *)&v6 + 1);
  double v5 = *(float *)&v6;
  result.size.float height = v5;
  result.size.float width = v4;
  result.origin.float y = v3;
  result.origin.float x = v2;
  return result;
}

- (void)encodePoint:(NSPoint)point forKey:(NSString *)key
{
  uint64_t v6 = NSStringFromPoint(point);

  [(NSCoder *)self encodeObject:v6 forKey:key];
}

- (NSPoint)decodePointForKey:(NSString *)key
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSCoder *)self decodeObjectOfClass:objc_opt_class() forKey:key];
  if (v3)
  {
    double v6 = 0.0;
    double v7 = 0.0;
    parseFloats(v3, 2, (uint64_t)&v6);
    double v4 = v6;
    double v5 = v7;
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }
  result.float y = v5;
  result.float x = v4;
  return result;
}

@end