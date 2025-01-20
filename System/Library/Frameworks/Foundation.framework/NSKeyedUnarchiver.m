@interface NSKeyedUnarchiver
+ (BOOL)_evaluateCycleSecurityRules:(NSKeyedUnarchiverCycleEvaluationRules *)a3;
+ (Class)classForClassName:(NSString *)codedName;
+ (NSArray)unarchivedArrayOfObjectsOfClass:(Class)cls fromData:(NSData *)data error:(NSError *)error;
+ (NSArray)unarchivedArrayOfObjectsOfClasses:(NSSet *)classes fromData:(NSData *)data error:(NSError *)error;
+ (NSDictionary)unarchivedDictionaryWithKeysOfClass:(Class)keyCls objectsOfClass:(Class)valueCls fromData:(NSData *)data error:(NSError *)error;
+ (NSDictionary)unarchivedDictionaryWithKeysOfClasses:(NSSet *)keyClasses objectsOfClasses:(NSSet *)valueClasses fromData:(NSData *)data error:(NSError *)error;
+ (id)_copyByArchiving:(id)a3;
+ (id)_strictlyUnarchivedObjectOfClasses:(id)a3 fromData:(id)a4 error:(id *)a5;
+ (id)unarchiveObjectWithData:(NSData *)data;
+ (id)unarchiveObjectWithFile:(NSString *)path;
+ (id)unarchiveTopLevelObjectWithData:(NSData *)data error:(NSError *)error;
+ (id)unarchivedObjectOfClass:(Class)cls fromData:(NSData *)data error:(NSError *)error;
+ (id)unarchivedObjectOfClasses:(NSSet *)classes fromData:(NSData *)data error:(NSError *)error;
+ (int)_swift_checkClassAndWarnForKeyedArchiving:(Class)a3 operation:(int)a4;
+ (void)initialize;
+ (void)setClass:(Class)cls forClassName:(NSString *)codedName;
- (BOOL)_allowsValueCoding;
- (BOOL)_containsNextUnkeyedObject;
- (BOOL)_strictSecureDecodingEnabled;
- (BOOL)_validateAllowedClassesContainsClass:(Class)a3 forKey:(id)a4;
- (BOOL)_validateAllowedClassesContainsClassOfReference:(id)a3 forKey:(id)a4;
- (BOOL)_willEnforceExplicitPlistTypes;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(NSString *)key;
- (BOOL)decodeBoolForKey:(NSString *)key;
- (BOOL)requiresSecureCoding;
- (Class)classForClassName:(NSString *)codedName;
- (NSDecodingFailurePolicy)decodingFailurePolicy;
- (NSKeyedUnarchiver)init;
- (NSKeyedUnarchiver)initForReadingFromData:(NSData *)data error:(NSError *)error;
- (NSKeyedUnarchiver)initForReadingWithData:(NSData *)data;
- (NSKeyedUnarchiver)initWithStream:(id)a3;
- (const)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp;
- (double)decodeDoubleForKey:(NSString *)key;
- (float)decodeFloatForKey:(NSString *)key;
- (id)_allowedClassNames;
- (id)_blobForCurrentObject;
- (id)_decodeArrayOfObjectsForKey:(id)a3;
- (id)_decodeObjectOfClass:(Class)a3;
- (id)_decodePropertyListForKey:(id)a3;
- (id)_initForReadingFromData:(id)a3 error:(id *)a4 throwLegacyExceptions:(BOOL)a5;
- (id)_initWithStream:(__CFReadStream *)a3 data:(id)a4 topDict:(__CFDictionary *)a5;
- (id)allowedClasses;
- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4;
- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5;
- (id)decodeObject;
- (id)decodeObjectForKey:(NSString *)key;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (id)delegate;
- (id)description;
- (id)error;
- (int)decodeIntForKey:(NSString *)key;
- (int32_t)decodeInt32ForKey:(NSString *)key;
- (int64_t)decodeInt64ForKey:(NSString *)key;
- (int64_t)versionForClassName:(id)a3;
- (uint64_t)_validatePropertyListClass:(uint64_t)a3 forKey:;
- (unint64_t)_decodeCollectionOfClass:(void *)a3 allowedClasses:(__CFString *)a4 forKey:;
- (unsigned)_currentUniqueIdentifier;
- (unsigned)systemVersion;
- (void)__setError:(id)a3;
- (void)_allowDecodingCyclesInSecureMode;
- (void)_enableStrictSecureDecodingMode;
- (void)_enforceExplicitPlistTypes;
- (void)_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded;
- (void)_replaceObject:(id)a3 withObject:(id)a4;
- (void)_setAllowedClassNames:(id)a3;
- (void)_temporaryMapReplaceObject:(id)a3 withObject:(id)a4;
- (void)dealloc;
- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5;
- (void)decodeBytesWithReturnedLength:(unint64_t *)a3;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4;
- (void)decodeValuesOfObjCTypes:(const char *)a3;
- (void)finishDecoding;
- (void)replaceObject:(id)a3 withObject:(id)a4;
- (void)setClass:(Class)cls forClassName:(NSString *)codedName;
- (void)setDecodingFailurePolicy:(NSDecodingFailurePolicy)decodingFailurePolicy;
- (void)setDelegate:(id)delegate;
- (void)setRequiresSecureCoding:(BOOL)requiresSecureCoding;
@end

@implementation NSKeyedUnarchiver

- (id)_decodeArrayOfObjectsForKey:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    goto LABEL_63;
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    v56 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v56);
  }
  unint64_t v7 = atomic_load(&self->_flags);
  if (v7 != self->_pac_signature) {
    goto LABEL_63;
  }
  v8 = (__CFString *)a3;
  unint64_t v9 = atomic_load(&self->_flags);
  atomic_store(v9 | 8, &self->_flags);
  unint64_t v10 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v10;
  if (a3 && CFStringGetLength((CFStringRef)a3) >= 1 && CFStringGetCharacterAtIndex(v8, 0) == 36) {
    v8 = (__CFString *)[(__CFString *)v8 substringFromIndex:1];
  }
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  uint64_t v61 = 0;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v63 = __49__NSKeyedUnarchiver__decodeArrayOfObjectsForKey___block_invoke;
  v64 = &unk_1E51F8FA8;
  v65 = &v67;
  v66 = &v71;
  containers = self->_containers;
  if (!containers)
  {
    bytes = self->_bytes;
    unint64_t len = self->_len;
    uint64_t v60 = 0;
    if ((__CFBinaryPlistGetOffsetForValueFromDictionary3() & 1) == 0) {
      goto LABEL_48;
    }
    v18 = &bytes[v60];
    if (__CFADD__(bytes, v60) || &bytes[len - 1] < v18) {
      goto LABEL_35;
    }
    char v19 = *v18;
    if ((*v18 & 0xF0) != 0xA0)
    {
      [(NSCoder *)self __failWithExceptionName:@"NSInvalidUnarchiveOperationException", 4864, @"%@: value for key (%@) is not an array", _NSMethodExceptionProem((objc_class *)self, a2), v8 errorCode format];
      goto LABEL_48;
    }
    unint64_t v57 = (unint64_t)&bytes[len - 1];
    v20 = v18 + 1;
    if (v18 == (const char *)-1 || v57 < (unint64_t)v20)
    {
LABEL_35:
      v22 = _NSMethodExceptionProem((objc_class *)self, a2);
      v23 = @"%@: data is corrupt";
    }
    else
    {
      unint64_t v21 = v19 & 0xF;
      if ((v19 & 0xF) != 0xF) {
        goto LABEL_50;
      }
      unint64_t v59 = 0x1FFFFFFFLL;
      if ((_readInt(self, v20, v57, &v59, 0) & 1) == 0)
      {
        v22 = _NSMethodExceptionProem((objc_class *)self, a2);
        v23 = @"%@: data is corrupt";
        goto LABEL_36;
      }
      unint64_t v21 = v59;
      if (!(v59 >> 29))
      {
LABEL_50:
        uint64_t v52 = _CFCreateArrayStorage();
        v68[3] = v52;
        if (v52)
        {
          v72[3] = 0;
          if (!v21) {
            goto LABEL_56;
          }
          while (1)
          {
            unint64_t v59 = 0;
            if ((__CFBinaryPlistGetOffsetForValueFromArray2() & 1) == 0)
            {
              v63((uint64_t)v62);
              [(NSCoder *)self __failWithExceptionName:@"NSArchiverArchiveInconsistency", 4864, @"%@: data is corrupt or object is too large to decode", _NSMethodExceptionProem((objc_class *)self, a2) errorCode format];
              goto LABEL_48;
            }
            unint64_t v58 = 0;
            if ((_getUIDFromData(self, &bytes[v59], v57, &v58) & 1) == 0) {
              break;
            }
            _decodeObjectBinary((uint64_t)self, v58, (uint64_t)v8, (CFTypeRef *)(v68[3] + 8 * v72[3]));
            uint64_t v53 = v72[3];
            if (!*(void *)(v68[3] + 8 * v53)) {
              goto LABEL_46;
            }
            v72[3] = v53 + 1;
            if (v53 + 1 >= v21) {
              goto LABEL_56;
            }
          }
          v63((uint64_t)v62);
          [(NSCoder *)self __failWithExceptionName:@"NSArchiverArchiveInconsistency", 4864, @"%@: data is corrupt or value is not an object", _NSMethodExceptionProem((objc_class *)self, a2) errorCode format];
          goto LABEL_48;
        }
      }
      v22 = _NSMethodExceptionProem((objc_class *)self, a2);
      v23 = @"%@: array is too large to decode";
    }
LABEL_36:
    [(NSCoder *)self __failWithExceptionName:@"NSArchiverArchiveInconsistency", 4864, v23, v22 errorCode format];
    goto LABEL_48;
  }
  CFIndex Count = CFArrayGetCount(containers);
  CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
  if (CFGetTypeID(ValueAtIndex) == 19)
  {
    Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
    id v15 = Value;
    CFArrayRemoveValueAtIndex(ValueAtIndex, 0);
  }
  else
  {
    Value = (void *)CFDictionaryGetValue(ValueAtIndex, v8);
    id v24 = Value;
  }
  if (Value)
  {
    unint64_t v21 = [Value count];
    uint64_t v25 = _CFCreateArrayStorage();
    v68[3] = v25;
    if (v25)
    {
      CFRetain(Value);
      CFArrayAppendValue(self->_containers, Value);
      CFTypeID v26 = CFGetTypeID(Value);
      unint64_t v27 = atomic_load(&self->_flags);
      unint64_t pac_signature = self->_pac_signature;
      if (v26 == 19)
      {
        if (v27 != pac_signature) {
          goto LABEL_63;
        }
        unint64_t v29 = atomic_load(&self->_flags);
        unint64_t v30 = v29 | 1;
      }
      else
      {
        if (v27 != pac_signature) {
          goto LABEL_63;
        }
        unint64_t v31 = atomic_load(&self->_flags);
        unint64_t v30 = v31 & 0xFFFFFFFFFFFFFFFELL;
      }
      atomic_store(v30, &self->_flags);
      unint64_t v32 = atomic_load(&self->_flags);
      self->_unint64_t pac_signature = v32;
      v72[3] = 0;
      if (v21)
      {
        unint64_t v33 = 0;
        uint64_t v34 = v68[3];
        do
        {
          _decodeObjectXML((uint64_t)self, &stru_1ECA5C228, (void *)(v34 + 8 * v33));
          uint64_t v34 = v68[3];
          uint64_t v35 = v72[3];
          uint64_t v36 = *(void *)(v34 + 8 * v35);
          BOOL v37 = v36 == 0;
          if (!v36) {
            break;
          }
          unint64_t v33 = v35 + 1;
          v72[3] = v33;
        }
        while (v33 < v21);
      }
      else
      {
        BOOL v37 = 0;
      }
      CFIndex v38 = CFArrayGetCount(self->_containers);
      v39 = CFArrayGetValueAtIndex(self->_containers, v38 - 1);
      CFArrayRemoveValueAtIndex(self->_containers, v38 - 1);
      CFRelease(v39);
      CFIndex v40 = v38 - 2;
      if (v38 < 2)
      {
LABEL_45:
        if (v37)
        {
LABEL_46:
          ((void (*)(void *, CFIndex))v63)(v62, v40);
          v50 = 0;
LABEL_57:
          id v51 = v50;
          goto LABEL_58;
        }
LABEL_56:
        id v54 = objc_allocWithZone(MEMORY[0x1E4F1C978]);
        v50 = (void *)[v54 _initByAdoptingBuffer:v68[3] count:v21 size:v61];
        goto LABEL_57;
      }
      v41 = CFArrayGetValueAtIndex(self->_containers, v40);
      CFTypeID v42 = CFGetTypeID(v41);
      unint64_t v43 = atomic_load(&self->_flags);
      unint64_t v44 = self->_pac_signature;
      if (v42 == 19)
      {
        unint64_t v45 = 0x1EB1DE000;
        if (v43 == v44)
        {
          unint64_t v46 = atomic_load(&self->_flags);
          unint64_t v47 = v46 | 1;
LABEL_44:
          atomic_store(v47, &self->_flags);
          v49 = (objc_class *)atomic_load(&self->_flags);
          *(Class *)((char *)&self->super.super.isa + *(int *)(v45 + 1164)) = v49;
          goto LABEL_45;
        }
      }
      else
      {
        unint64_t v45 = 0x1EB1DE000uLL;
        if (v43 == v44)
        {
          unint64_t v48 = atomic_load(&self->_flags);
          unint64_t v47 = v48 & 0xFFFFFFFFFFFFFFFELL;
          goto LABEL_44;
        }
      }
LABEL_63:
      __NSPoisoned();
    }
    [(NSCoder *)self __failWithExceptionName:@"NSArchiverArchiveInconsistency", 4864, @"%@: array is too large to decode", _NSMethodExceptionProem((objc_class *)self, a2) errorCode format];
  }
LABEL_48:
  id v51 = 0;
LABEL_58:
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  return v51;
}

- (BOOL)requiresSecureCoding
{
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    __NSPoisoned();
  }
  unint64_t v3 = atomic_load(&self->_flags);
  return (v3 >> 2) & 1;
}

- (Class)classForClassName:(NSString *)codedName
{
  Class result = self->_nameClassMap;
  if (result) {
    return (Class)CFDictionaryGetValue(result, codedName);
  }
  return result;
}

- (void)_replaceObject:(id)a3 withObject:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot replace", 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if (a3 != a4)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [(NSKeyedUnarchiverDelegate *)self->_delegate unarchiver:self willReplaceObject:a3 withObject:a4];
    }
    objRefMap = self->_objRefMap;
    if (objRefMap)
    {
      Value = CFDictionaryGetValue(objRefMap, a3);
      CFDictionaryRemoveValue(self->_objRefMap, a3);
      CFDictionarySetValue(self->_objRefMap, a4, Value);
      CFDictionarySetValue(self->_refObjMap, Value, a4);
    }
    [(NSKeyedUnarchiver *)self _temporaryMapReplaceObject:a3 withObject:a4];
  }
  replacementMap = self->_replacementMap;
  if (!replacementMap)
  {
    keyCallBacks.version = 0;
    *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D530] + 8);
    memset(&keyCallBacks.copyDescription, 0, 24);
    self->_replacementMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &keyCallBacks, 0);
    _CFDictionarySetCapacity();
    replacementMap = self->_replacementMap;
  }
  CFDictionarySetValue(replacementMap, a3, a4);
}

+ (Class)classForClassName:(NSString *)codedName
{
  os_unfair_lock_lock(&stru_1EB1ECD14);
  if (qword_1EB1ECD20) {
    Value = (objc_class *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB1ECD20, codedName);
  }
  else {
    Value = 0;
  }
  os_unfair_lock_unlock(&stru_1EB1ECD14);
  return Value;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)containsValueForKey:(NSString *)key
{
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v14);
  }
  char v6 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36) {
    char v6 = (__CFString *)[(__CFString *)v6 substringFromIndex:1];
  }
  containers = self->_containers;
  if (!containers) {
    return __CFBinaryPlistGetOffsetForValueFromDictionary3();
  }
  CFIndex Count = CFArrayGetCount(containers);
  CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
  if (CFGetTypeID(ValueAtIndex) == 19)
  {
    Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
    id v11 = Value;
    CFArrayRemoveValueAtIndex(ValueAtIndex, 0);
  }
  else
  {
    Value = (void *)CFDictionaryGetValue(ValueAtIndex, v6);
    id v13 = Value;
  }
  return Value != 0;
}

- (BOOL)_validateAllowedClassesContainsClass:(Class)a3 forKey:(id)a4
{
  if (!a3)
  {
    id v15 = +[NSString stringWithFormat:@"Attempt to decode an object with no class for key '%@'.", a4];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v15 userInfo:0]);
  }
  id v7 = [(NSKeyedUnarchiver *)self allowedClasses];
  unint64_t v8 = atomic_load(&self->_flags);
  if (v8 != self->_pac_signature
    || (unint64_t v9 = atomic_load(&self->_flags), v10 = atomic_load(&self->_flags), v10 != self->_pac_signature))
  {
    __NSPoisoned();
  }
  id v11 = v7;
  char v12 = atomic_load(&self->_flags);
  char v13 = -[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]((uint64_t)self, a3, (uint64_t)a4, v7, (v9 >> 5) & 1, (v12 & 0x40) != 0, 0);
  if ((v13 & 1) == 0 && !self->_helper->_decodeError) {
    -[NSCoder __failWithUnexpectedClass:forKey:allowedClasses:]((NSString *)self, (uint64_t)a3, (__CFString *)a4, v11);
  }
  return v13;
}

- (uint64_t)_validatePropertyListClass:(uint64_t)a3 forKey:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (!a2)
    {
      v20 = +[NSString stringWithFormat:@"Attempt to decode an object with no class for key '%@'.", a3];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v20 userInfo:0]);
    }
    char v5 = (unint64_t *)result;
    char v6 = (void *)[(id)result allowedClasses];
    unint64_t v7 = atomic_load(v5 + 2);
    if (v7 != v5[17]) {
      goto LABEL_25;
    }
    unint64_t v8 = v6;
    unint64_t v9 = atomic_load(v5 + 2);
    if ((-[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]((uint64_t)v5, a2, a3, v6, (v9 >> 5) & 1, 0, 0) & 1) != 0|| *(void *)(v5[15] + 32))
    {
      return 1;
    }
    int v10 = _os_feature_enabled_impl();
    int v11 = dyld_program_sdk_at_least();
    unint64_t v12 = atomic_load(v5 + 2);
    if (v12 != v5[17]) {
LABEL_25:
    }
      __NSPoisoned();
    unsigned __int8 v13 = atomic_load(v5 + 2);
    unint64_t v14 = v13 & 0x80 | v9 & 0x20;
    if (v14) {
      int v15 = 1;
    }
    else {
      int v15 = v10 & v11;
    }
    if (v11 && !v14) {
      -[NSCoder _warnAboutPlistType:forKey:missingInAllowedClasses:]((objc_class *)v5, (uint64_t)a2, a3, v8);
    }
    if (!v15
      || !v14
      && _os_feature_enabled_impl()
      && -[NSCoder _shouldExemptProcessBasedOnArchivingExceptionRules:]((BOOL)v5, (uint64_t)"/System/Library/CoreServices/ArchivingExceptions.bundle/PlistTypeExceptions.plist"))
    {
      return 1;
    }
    v16 = -[NSCoder __allowedClassesDescriptionForClass:]((NSString *)v5, (uint64_t)a2);
    id v17 = -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)v5, v8);
    if (a3) {
      v18 = (__CFString *)a3;
    }
    else {
      v18 = @"(no key, possibly an argument to a message)";
    }
    char v19 = _NSRuntimeIssuesLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      __int16 v23 = 2114;
      id v24 = v18;
      __int16 v25 = 2112;
      id v26 = v17;
    }
    objc_msgSend(v5, "__failWithExceptionName:errorCode:format:", @"NSInvalidUnarchiveOperationException", 4864, @"value for key '%@' was of unexpected class %@.\nAllowed classes are:\n %@", v18, v16, v17);
    return 0;
  }
  return result;
}

- (id)allowedClasses
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v3 = atomic_load(&self->_flags);
  if ((v3 & 4) != 0)
  {
    allowedClasses = self->_helper->_allowedClasses;
    return (id)[(NSMutableArray *)allowedClasses lastObject];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NSKeyedUnarchiver;
    return [(NSCoder *)&v6 allowedClasses];
  }
}

- (float)decodeFloatForKey:(NSString *)key
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    unint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v8);
  }
  float result = 0.0;
  if (!self->_helper->_decodeError)
  {
    uint64_t v7 = (__CFString *)key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v7, 0) == 36) {
      uint64_t v7 = (__CFString *)[(__CFString *)v7 substringFromIndex:1];
    }
    float v9 = 0.0;
    _decodeFloat(self, v7, &v9);
    return v9;
  }
  return result;
}

- (double)decodeDoubleForKey:(NSString *)key
{
  v9[1] = *(double *)MEMORY[0x1E4F143B8];
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    unint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v8);
  }
  double result = 0.0;
  if (!self->_helper->_decodeError)
  {
    uint64_t v7 = (__CFString *)key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v7, 0) == 36) {
      uint64_t v7 = (__CFString *)[(__CFString *)v7 substringFromIndex:1];
    }
    v9[0] = 0.0;
    _decodeDouble((uint64_t)self, v7, v9);
    return v9[0];
  }
  return result;
}

- (const)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp
{
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v10);
  }
  if (self->_helper->_decodeError)
  {
    if (lengthp) {
      *lengthp = 0;
    }
    return 0;
  }
  else
  {
    float v9 = (__CFString *)key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v9, 0) == 36) {
      float v9 = (__CFString *)[(__CFString *)v9 substringFromIndex:1];
    }
    return _decodeBytes((uint64_t)self, v9, lengthp);
  }
}

- (id)delegate
{
  return self->_delegate;
}

- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v7 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (!-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, a3, (uint64_t)v7))return 0; {
  uint64_t v8 = MEMORY[0x1E4F1C978];
  }

  return -[NSKeyedUnarchiver _decodeCollectionOfClass:allowedClasses:forKey:]((unint64_t *)self, v8, a3, (__CFString *)a4);
}

+ (id)unarchivedObjectOfClasses:(NSSet *)classes fromData:(NSData *)data error:(NSError *)error
{
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initForReadingFromData:data error:error];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  [v7 setRequiresSecureCoding:1];
  [v8 setDecodingFailurePolicy:1];
  float v9 = (void *)[v8 decodeTopLevelObjectOfClasses:classes forKey:@"root" error:error];

  return v9;
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  data = self->_data;
  if (data) {
    CFRelease(data);
  }
  containers = self->_containers;
  if (containers)
  {
    for (CFIndex i = CFArrayGetCount(containers); i >= 1; CFIndex i = CFArrayGetCount(self->_containers))
    {
      if (!CFArrayGetValueAtIndex(self->_containers, i - 1)) {
        break;
      }
      CFIndex Count = CFArrayGetCount(self->_containers);
      CFArrayRef ValueAtIndex = CFArrayGetValueAtIndex(self->_containers, Count - 1);
      CFArrayRemoveValueAtIndex(self->_containers, Count - 1);
      CFRelease(ValueAtIndex);
      if (Count > 1)
      {
        uint64_t v8 = CFArrayGetValueAtIndex(self->_containers, Count - 2);
        CFTypeID v9 = CFGetTypeID(v8);
        unint64_t v10 = atomic_load(&self->_flags);
        unint64_t pac_signature = self->_pac_signature;
        if (v9 == 19)
        {
          if (v10 != pac_signature) {
            goto LABEL_32;
          }
          unint64_t v12 = atomic_load(&self->_flags);
          unint64_t v13 = v12 | 1;
        }
        else
        {
          if (v10 != pac_signature) {
LABEL_32:
          }
            __NSPoisoned();
          unint64_t v14 = atomic_load(&self->_flags);
          unint64_t v13 = v14 & 0xFFFFFFFFFFFFFFFELL;
        }
        atomic_store(v13, &self->_flags);
        unint64_t v15 = atomic_load(&self->_flags);
        self->_unint64_t pac_signature = v15;
      }
    }
    CFRelease(self->_containers);
  }
  objects = self->_objects;
  if (objects) {
    CFRelease(objects);
  }
  objRefMap = self->_objRefMap;
  if (objRefMap) {
    CFRelease(objRefMap);
  }
  replacementMap = self->_replacementMap;
  if (replacementMap) {
    CFRelease(replacementMap);
  }
  nameClassMap = self->_nameClassMap;
  if (nameClassMap) {
    CFRelease(nameClassMap);
  }
  tmpRefObjMap = self->_tmpRefObjMap;
  if (tmpRefObjMap) {
    CFRelease(tmpRefObjMap);
  }
  refObjMap = self->_refObjMap;
  if (refObjMap) {
    CFRelease(refObjMap);
  }
  offsetData = self->_offsetData;
  if (offsetData) {
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], offsetData);
  }

  offsetObjMap = self->_offsetObjMap;
  if (offsetObjMap) {
    CFRelease(offsetObjMap);
  }
  v24.receiver = self;
  v24.super_class = (Class)NSKeyedUnarchiver;
  [(NSKeyedUnarchiver *)&v24 dealloc];
}

- (id)_initForReadingFromData:(id)a3 error:(id *)a4 throwLegacyExceptions:(BOOL)a5
{
  BOOL v50 = a5;
  char v6 = self;
  v61[1] = *MEMORY[0x1E4F143B8];
  id v54 = 0;
  unsigned int valuePtr = -1;
  long long v55 = 0u;
  long long v56 = 0u;
  self->_data = 0;
  p_flags = &self->_flags;
  atomic_store(0x10uLL, &self->_flags);
  self->_delegate = 0;
  self->_containers = 0;
  self->_objects = 0;
  self->_objRefMap = 0;
  self->_replacementMap = 0;
  self->_nameClassMap = 0;
  self->_tmpRefObjMap = 0;
  self->_refObjMap = 0;
  self->_genericKey = 0;
  self->_helper = objc_alloc_init(_NSKeyedUnarchiverHelper);
  v6->_offsetObjMap = 0;
  unint64_t v8 = atomic_load(p_flags);
  v6->_unint64_t pac_signature = v8;
  unint64_t v9 = atomic_load(p_flags);
  if (v9 != v6->_pac_signature) {
    goto LABEL_85;
  }
  unint64_t v10 = &v6->_flags;
  unint64_t v11 = atomic_load(&v6->_flags);
  atomic_store(v11 | 4, &v6->_flags);
  unint64_t v12 = atomic_load(&v6->_flags);
  v6->_unint64_t pac_signature = v12;
  unint64_t v13 = atomic_load(&v6->_flags);
  if (v13 != v6->_pac_signature) {
    goto LABEL_85;
  }
  unint64_t v14 = atomic_load(v10);
  atomic_store(v14 & 0xFFFFFFFFFFFFFFEFLL, v10);
  unint64_t v15 = atomic_load(v10);
  v6->_unint64_t pac_signature = v15;
  if (!a3)
  {
    if (a4)
    {
      v22 = [[NSString alloc] initWithFormat:@"%@: data is NULL", _NSMethodExceptionProem((objc_class *)v6, a2)];
      uint64_t v60 = @"NSDebugDescription";
      v61[0] = v22;
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1]);
    }
    goto LABEL_66;
  }
  uint64_t v16 = [a3 bytes];
  unint64_t v17 = [a3 length];
  unint64_t v18 = v17;
  if (!v17 || !v16)
  {
    if (v50) {
      [(NSKeyedUnarchiver *)v6 setDecodingFailurePolicy:0];
    }
    -[NSCoder __failWithExceptionName:errorCode:format:](v6, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E4F1C3C8], 4864, @"%@: data is empty; did you forget to send -finishEncoding to the NSKeyedArchiver?",
      _NSMethodExceptionProem((objc_class *)v6, a2));
    if (!a4) {
      goto LABEL_66;
    }
    goto LABEL_20;
  }
  if (v17 >= 0xD)
  {
    if (*(unsigned char *)(v16 + 1) != 11) {
      goto LABEL_28;
    }
    if ((*(void *)(v16 + 2) != 0x7274736465707974 || *(void *)(v16 + 5) != 0x6D61657274736465)
      && (*(void *)(v16 + 2) != 0x79746D6165727473 || *(void *)(v16 + 5) != 0x64657079746D6165))
    {
      goto LABEL_28;
    }
    if (v50) {
      [(NSKeyedUnarchiver *)v6 setDecodingFailurePolicy:0];
    }
    [(NSCoder *)v6 __failWithExceptionName:*MEMORY[0x1E4F1C3C8], 4864, @"%@: non-keyed archive cannot be decoded by NSKeyedUnarchiver", _NSMethodExceptionProem((objc_class *)v6, a2) errorCode format];
    if (!a4) {
      goto LABEL_66;
    }
LABEL_20:
    id v21 = [(NSKeyedUnarchiver *)v6 error];
LABEL_65:
    *a4 = v21;
LABEL_66:

    return 0;
  }
  if (v17 < 8) {
    goto LABEL_53;
  }
LABEL_28:
  if (!__CFBinaryPlistGetTopLevelInfo()
    || (offsetObjMap = v6->_offsetObjMap, !__CFBinaryPlistGetOffsetForValueFromDictionary3())
    || !__CFBinaryPlistCreateObject()
    || !v54
    || (CFTypeID v49 = CFGetTypeID(v54), v49 != CFNumberGetTypeID())
    || !CFNumberGetValue((CFNumberRef)v54, kCFNumberSInt32Type, &valuePtr)
    || valuePtr != 100000)
  {
    if (v18 >= 0x78)
    {
      CFDictionaryRef v27 = (const __CFDictionary *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], (CFDataRef)a3, 1uLL, 0, 0);
      if (v27)
      {
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v27))
        {
          Value = (void *)CFDictionaryGetValue(v27, @"$version");
          id v54 = Value;
          if (Value)
          {
            CFTypeID v30 = CFGetTypeID(Value);
            if (v30 == CFNumberGetTypeID()
              && CFNumberGetValue((CFNumberRef)v54, kCFNumberSInt32Type, &valuePtr)
              && valuePtr == 100000)
            {
              unint64_t v31 = CFDictionaryGetValue(v27, @"$top");
              unint64_t v32 = CFDictionaryGetValue(v27, @"$objects");
              if (v31)
              {
                unint64_t v33 = v32;
                if (v32)
                {
                  if (CFGetTypeID(v32) == 19)
                  {
                    v6->_containers = CFArrayCreateMutable(0, 0, 0);
                    CFRetain(v31);
                    CFArrayAppendValue(v6->_containers, v31);
                    CFTypeID v34 = CFGetTypeID(v31);
                    unint64_t v35 = atomic_load(&v6->_flags);
                    unint64_t pac_signature = v6->_pac_signature;
                    if (v34 == 19)
                    {
                      if (v35 == pac_signature)
                      {
                        unint64_t v37 = atomic_load(&v6->_flags);
                        unint64_t v38 = v37 | 1;
LABEL_82:
                        atomic_store(v38, &v6->_flags);
                        unint64_t v44 = atomic_load(&v6->_flags);
                        v6->_unint64_t pac_signature = v44;
                        v6->_objects = (__CFArray *)CFRetain(v33);
                        [(NSKeyedUnarchiver *)v6 _initWithStream:0 data:0 topDict:v27];
                        CFRelease(v27);
                        return v6;
                      }
                    }
                    else if (v35 == pac_signature)
                    {
                      unint64_t v43 = atomic_load(&v6->_flags);
                      unint64_t v38 = v43 & 0xFFFFFFFFFFFFFFFELL;
                      goto LABEL_82;
                    }
LABEL_85:
                    __NSPoisoned();
                  }
                }
              }
              CFRelease(v27);
              if (v50) {
                [(NSKeyedUnarchiver *)v6 setDecodingFailurePolicy:0];
              }
              [(NSCoder *)v6 __failWithExceptionName:@"NSArchiverArchiveInconsistency", 4864, @"%@: data is corrupt or archive is missing key components or object is too large to decode", _NSMethodExceptionProem((objc_class *)v6, a2) errorCode format];
              if (!a4) {
                goto LABEL_66;
              }
LABEL_64:
              id v21 = [(NSKeyedUnarchiver *)v6 error];
              goto LABEL_65;
            }
          }
        }
        else
        {
          id v54 = 0;
        }
        CFRelease(v27);
        if (v50) {
          [(NSKeyedUnarchiver *)v6 setDecodingFailurePolicy:0];
        }
        v41 = _NSMethodExceptionProem((objc_class *)v6, a2);
        [(NSCoder *)v6 __failWithExceptionName:*MEMORY[0x1E4F1C3C8], 4864, @"%@: incomprehensible archive version (%d)", v41, valuePtr errorCode format];
        if (!a4) {
          goto LABEL_66;
        }
        goto LABEL_64;
      }
      id v54 = 0;
    }
LABEL_53:
    uint64_t v57 = 0;
    if (v18 >= 8) {
      uint64_t v39 = 8;
    }
    else {
      uint64_t v39 = v18;
    }
    objc_msgSend(a3, "getBytes:range:", &v57, 0, v39, offsetObjMap);
    if (v50) {
      [(NSKeyedUnarchiver *)v6 setDecodingFailurePolicy:0];
    }
    CFIndex v40 = _NSMethodExceptionProem((objc_class *)v6, a2);
    [(NSCoder *)v6 __failWithExceptionName:*MEMORY[0x1E4F1C3C8], 4864, @"%@: incomprehensible archive (0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x)", v40, (char)v57, SBYTE1(v57), SBYTE2(v57), SBYTE3(v57), SBYTE4(v57), SBYTE5(v57), SBYTE6(v57), SHIBYTE(v57) errorCode format];
    if (!a4) {
      goto LABEL_66;
    }
    goto LABEL_64;
  }
  unint64_t v47 = v6->_offsetObjMap;
  if ((__CFBinaryPlistGetOffsetForValueFromDictionary3() & 1) == 0)
  {
    if (v50) {
      -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0, v47);
    }
    [(NSCoder *)v6 __failWithExceptionName:@"NSArchiverArchiveInconsistency", 4864, @"%@: data is corrupt or archive is missing key components or object is too large to decode", _NSMethodExceptionProem((objc_class *)v6, a2) errorCode format];
    if (!a4) {
      goto LABEL_66;
    }
    goto LABEL_64;
  }
  unint64_t v48 = v6->_offsetObjMap;
  if ((__CFBinaryPlistGetOffsetForValueFromDictionary3() & 1) == 0)
  {
    if (v50) {
      -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0, v48);
    }
    [(NSCoder *)v6 __failWithExceptionName:@"NSArchiverArchiveInconsistency", 4864, @"%@: data is corrupt or archive is missing key components or object is too large to decode", _NSMethodExceptionProem((objc_class *)v6, a2) errorCode format];
    if (!a4) {
      goto LABEL_66;
    }
    goto LABEL_64;
  }
  if ((*(unsigned char *)v16 & 0xF0) != 0xA0)
  {
    if (a4)
    {
      unint64_t v45 = [[NSString alloc] initWithFormat:@"%@: data is corrupt or archive is missing key components or object is too large to decode", _NSMethodExceptionProem((objc_class *)v6, a2)];
      unint64_t v58 = @"NSDebugDescription";
      unint64_t v59 = v45;
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1]);
    }
    goto LABEL_66;
  }
  CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
  objc_super v24 = ($02305E47CAA2D936086EFC4D3EC0EBCE *)MEMORY[0x1853044A0](*MEMORY[0x1E4F1CFB0], 48, 0x1000040EED21634, 0);
  v6->_offsetData = v24;
  long long v25 = v56;
  *(_OWORD *)v24->var0.var0 = v55;
  *(_OWORD *)&v24->var0.var5 = v25;
  offsetData = v6->_offsetData;
  offsetData->var1 = 0;
  offsetData->var2 = 0;
  v6->_data = (__CFData *)CFRetain(a3);
  v6->_bytes = (const char *)v16;
  v6->_unint64_t len = v18;
  v6->_objRefMap = CFDictionaryCreateMutable(0, 0, 0, 0);
  v6->_tmpRefObjMap = CFDictionaryCreateMutable(v23, 0, 0, 0);
  v6->_refObjMap = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  _CFDictionarySetCapacity();
  _CFDictionarySetCapacity();
  v6->_offsetObjMap = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  return v6;
}

- (NSKeyedUnarchiver)initForReadingFromData:(NSData *)data error:(NSError *)error
{
  return (NSKeyedUnarchiver *)[(NSKeyedUnarchiver *)self _initForReadingFromData:data error:error throwLegacyExceptions:0];
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_helper->_decodeError) {
    return 0;
  }
  unint64_t v6 = atomic_load(&self->_flags);
  if (v6 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v9 = atomic_load(&self->_flags);
  if ((v9 & 4) == 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)NSKeyedUnarchiver;
    return [(NSCoder *)&v18 decodeObjectOfClasses:a3 forKey:a4];
  }
  if (a3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = [a3 countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(a3);
          }
          unint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (!object_isClass(v15))
          {
            unint64_t v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ object in classes '%@' is not an Objective-C class!", _NSMethodExceptionProem((objc_class *)self, a2), v15), 0 reason userInfo];
            objc_exception_throw(v17);
          }
        }
        uint64_t v12 = [a3 countByEnumeratingWithState:&v20 objects:v19 count:16];
      }
      while (v12);
    }
    [(NSMutableArray *)self->_helper->_allowedClasses addObject:a3];
    id v4 = [(NSKeyedUnarchiver *)self decodeObjectForKey:a4];
    [(NSMutableArray *)self->_helper->_allowedClasses removeLastObject];
    return v4;
  }

  return [(NSKeyedUnarchiver *)self decodeObjectForKey:a4];
}

- (id)decodeObjectForKey:(NSString *)key
{
  v9[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    unint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (self->_helper->_decodeError) {
    return 0;
  }
  uint64_t v7 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v7, 0) == 36) {
    uint64_t v7 = (__CFString *)[(__CFString *)v7 substringFromIndex:1];
  }
  v9[0] = 0;
  _decodeObject((unint64_t *)self, v7, v9);
  return (id)v9[0];
}

- (id)error
{
  return self->_helper->_decodeError;
}

- (NSDecodingFailurePolicy)decodingFailurePolicy
{
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    __NSPoisoned();
  }
  unsigned int v3 = atomic_load(&self->_flags);
  return ~(v3 >> 4) & 1;
}

- (void)setRequiresSecureCoding:(BOOL)requiresSecureCoding
{
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    goto LABEL_7;
  }
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 8) != 0)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", @"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchiver has started; cannot change secure coding state",
                      _NSMethodExceptionProem((objc_class *)self, a2)),
                    0);
    objc_exception_throw(v11);
  }
  unint64_t v5 = atomic_load(&self->_flags);
  if (v5 != self->_pac_signature) {
LABEL_7:
  }
    __NSPoisoned();
  unint64_t v6 = atomic_load(&self->_flags);
  p_flags = &self->_flags;
  unint64_t v8 = v6 & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v9 = 4;
  if (!requiresSecureCoding) {
    uint64_t v9 = 0;
  }
  atomic_store(v8 | v9, p_flags);
  unint64_t v10 = atomic_load(p_flags);
  self->_unint64_t pac_signature = v10;
}

- (void)setDecodingFailurePolicy:(NSDecodingFailurePolicy)decodingFailurePolicy
{
  if ((unint64_t)decodingFailurePolicy >= 2)
  {
    unint64_t v8 = +[NSString stringWithFormat:@"%@: invalid decoding error policy %lu", _NSMethodExceptionProem((objc_class *)self, a2), decodingFailurePolicy];
    goto LABEL_9;
  }
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    goto LABEL_6;
  }
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 8) != 0)
  {
    unint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchiver has started; cannot change decoding error policy",
           _NSMethodExceptionProem((objc_class *)self, a2),
           v9);
LABEL_9:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v8 userInfo:0]);
  }
  unint64_t v5 = atomic_load(&self->_flags);
  if (v5 != self->_pac_signature) {
LABEL_6:
  }
    __NSPoisoned();
  unint64_t v6 = atomic_load(&self->_flags);
  atomic_store(v6 & 0xFFFFFFFFFFFFFFEFLL | (16 * (decodingFailurePolicy == NSDecodingFailurePolicyRaiseException)), &self->_flags);
  unint64_t v7 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v7;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_helper->_decodeError) {
    return 0;
  }
  unint64_t v6 = atomic_load(&self->_flags);
  if (v6 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v8 = atomic_load(&self->_flags);
  if ((v8 & 4) != 0)
  {
    if (a3) {
      a3 = (Class)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    }
    return [(NSKeyedUnarchiver *)self decodeObjectOfClasses:a3 forKey:a4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSKeyedUnarchiver;
    return [(NSCoder *)&v9 decodeObjectOfClass:a3 forKey:a4];
  }
}

uint64_t __91__NSKeyedUnarchiver_unarchivedDictionaryWithKeysOfClasses_objectsOfClasses_fromData_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeDictionaryWithKeysOfClasses:*(void *)(a1 + 40) objectsOfClasses:*(void *)(a1 + 48) forKey:@"root"];
}

- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5
{
  char v8 = (void *)[a3 setByAddingObjectsFromSet:a4];
  objc_super v9 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (!-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, v8, (uint64_t)v9))return 0; {
  uint64_t v10 = MEMORY[0x1E4F1C9E8];
  }

  return -[NSKeyedUnarchiver _decodeCollectionOfClass:allowedClasses:forKey:]((unint64_t *)self, v10, v8, (__CFString *)a5);
}

uint64_t __70__NSKeyedUnarchiver_unarchivedArrayOfObjectsOfClasses_fromData_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeArrayOfObjectsOfClasses:*(void *)(a1 + 40) forKey:@"root"];
}

- (BOOL)decodeBoolForKey:(NSString *)key
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    char v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (self->_helper->_decodeError) {
    return 0;
  }
  unint64_t v7 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v7, 0) == 36) {
    unint64_t v7 = (__CFString *)[(__CFString *)v7 substringFromIndex:1];
  }
  BOOL v9 = 0;
  _decodeBool((uint64_t)self, v7, &v9);
  return v9;
}

- (int64_t)decodeInt64ForKey:(NSString *)key
{
  v9[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    char v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (self->_helper->_decodeError) {
    return 0;
  }
  unint64_t v7 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v7, 0) == 36) {
    unint64_t v7 = (__CFString *)[(__CFString *)v7 substringFromIndex:1];
  }
  v9[0] = 0;
  _decodeInt64((uint64_t)self, v7, v9);
  return v9[0];
}

- (int32_t)decodeInt32ForKey:(NSString *)key
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    char v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (self->_helper->_decodeError) {
    return 0;
  }
  unint64_t v7 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v7, 0) == 36) {
    unint64_t v7 = (__CFString *)[(__CFString *)v7 substringFromIndex:1];
  }
  int32_t v9 = 0;
  _decodeInt32(self, v7, &v9);
  return v9;
}

- (int)decodeIntForKey:(NSString *)key
{
  v14[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    goto LABEL_14;
  }
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v13);
  }
  if (self->_helper->_decodeError) {
    return 0;
  }
  unint64_t v7 = atomic_load(&self->_flags);
  if (v7 != self->_pac_signature) {
LABEL_14:
  }
    __NSPoisoned();
  char v8 = (__CFString *)key;
  unint64_t v9 = atomic_load(&self->_flags);
  atomic_store(v9 | 8, &self->_flags);
  unint64_t v10 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v10;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v8, 0) == 36) {
    char v8 = (__CFString *)[(__CFString *)v8 substringFromIndex:1];
  }
  v14[0] = 0;
  int v11 = _decodeInt64((uint64_t)self, v8, v14);
  int v6 = v14[0];
  if (v11 && v14[0] - 0x80000000 <= 0xFFFFFFFEFFFFFFFFLL) {
    [(NSCoder *)self __failWithExceptionName:*MEMORY[0x1E4F1C4A8], 4864, @"%@: value (%lld) for key (%@) too large to fit in a native integer", _NSMethodExceptionProem((objc_class *)self, sel_decodeIntForKey_), v14[0], v8 errorCode format];
  }
  return v6;
}

- (BOOL)_validateAllowedClassesContainsClassOfReference:(id)a3 forKey:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = 0;
  id v7 = [(NSKeyedUnarchiver *)self allowedClasses];
  unint64_t v8 = atomic_load(&self->_flags);
  if (v8 != self->_pac_signature
    || (unint64_t v9 = atomic_load(&self->_flags), v10 = atomic_load(&self->_flags), v10 != self->_pac_signature))
  {
    __NSPoisoned();
  }
  int v11 = v7;
  char v12 = atomic_load(&self->_flags);
  char v13 = -[NSCoder _walkAllowedClassListValidatingInstance:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:invalidElementClass:](self, a3, (uint64_t)a4, v7, (v9 >> 5) & 1, (v12 & 0x40) != 0, 0, v15);
  if ((v13 & 1) == 0 && !self->_helper->_decodeError)
  {
    if (v15[0]) {
      -[NSCoder __failWithUnexpectedElementClass:forContainerKey:allowedClasses:]((NSString *)self, v15[0], (__CFString *)a4, v11);
    }
    else {
      -[NSCoder __failWithUnexpectedClass:forKey:allowedClasses:]((NSString *)self, [a3 classForCoder], (__CFString *)a4, v11);
    }
  }
  return v13;
}

- (void)__setError:(id)a3
{
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (NSKeyedUnarchiverDelegate *)delegate;
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  if (_warnArchiverCompat == 1)
  {
    unint64_t v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v8);
  }
  unint64_t v9 = atomic_load(&self->_flags);
  if (v9 != self->_pac_signature) {
    goto LABEL_25;
  }
  char v10 = atomic_load(&self->_flags);
  if ((v10 & 2) != 0)
  {
    long long v20 = +[NSString stringWithFormat:@"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"];
    long long v21 = (void *)MEMORY[0x1E4F1CA00];
    long long v22 = @"NSInvalidUnarchiveOperationException";
    goto LABEL_30;
  }
  if (self->_helper->_decodeError) {
    return;
  }
  unint64_t v11 = atomic_load(&self->_flags);
  if (v11 != self->_pac_signature) {
LABEL_25:
  }
    __NSPoisoned();
  unint64_t v12 = atomic_load(&self->_flags);
  atomic_store(v12 | 8, &self->_flags);
  unint64_t v13 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v13;
  if (!a3 || !a4)
  {
    long long v23 = +[NSString stringWithFormat:@"%@: null type or address pointer", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_29:
    long long v20 = v23;
    long long v21 = (void *)MEMORY[0x1E4F1CA00];
    long long v22 = (__CFString *)*MEMORY[0x1E4F1C3C8];
LABEL_30:
    objc_exception_throw((id)[v21 exceptionWithName:v22 reason:v20 userInfo:0]);
  }
  int v14 = *(unsigned __int8 *)a3;
  if (v14 != 91)
  {
    if (v14 != 123)
    {
      _compatDecodeValueOfObjCType((uint64_t)self, (NSString *)(char)v14, (BOOL *)a4, a2);
      return;
    }
    long long v23 = +[NSString stringWithFormat:@"%@: this unarchiver cannot decode structs", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_29;
  }
  unsigned int v17 = *((unsigned __int8 *)a3 + 1);
  uint64_t v16 = a3 + 1;
  unsigned int v15 = v17;
  if (v17 - 48 > 9) {
    goto LABEL_20;
  }
  uint64_t v18 = 0;
  do
  {
    uint64_t v18 = 10 * v18 + v15 - 48;
    unsigned int v19 = *(unsigned __int8 *)++v16;
    unsigned int v15 = v19;
  }
  while (v19 - 48 < 0xA);
  if (v18)
  {
    if (v15 == 93)
    {
      [(NSCoder *)self __failWithExceptionName:*MEMORY[0x1E4F1C3C8], 4864, @"%@: array type is missing", _NSMethodExceptionProem((objc_class *)self, a2) errorCode format];
    }
    else
    {
      -[NSKeyedUnarchiver decodeArrayOfObjCType:count:at:](self, "decodeArrayOfObjCType:count:at:", v16);
    }
  }
  else
  {
LABEL_20:
    [(NSCoder *)self __failWithExceptionName:*MEMORY[0x1E4F1C3C8], 4864, @"%@: array count is missing or zero", _NSMethodExceptionProem((objc_class *)self, a2) errorCode format];
  }
}

- (id)_decodePropertyListForKey:(id)a3
{
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    goto LABEL_17;
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    uint64_t v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v18);
  }
  unint64_t v7 = atomic_load(&self->_flags);
  if (v7 != self->_pac_signature) {
LABEL_17:
  }
    __NSPoisoned();
  unint64_t v8 = (__CFString *)a3;
  unint64_t v9 = atomic_load(&self->_flags);
  atomic_store(v9 | 8, &self->_flags);
  unint64_t v10 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v10;
  if (a3 && CFStringGetLength((CFStringRef)a3) >= 1 && CFStringGetCharacterAtIndex(v8, 0) == 36) {
    unint64_t v8 = (__CFString *)[(__CFString *)v8 substringFromIndex:1];
  }
  containers = self->_containers;
  if (containers)
  {
    CFIndex Count = CFArrayGetCount(containers);
    CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
    if (CFGetTypeID(ValueAtIndex) == 19)
    {
      Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
      id v15 = Value;
      CFArrayRemoveValueAtIndex(ValueAtIndex, 0);
    }
    else
    {
      Value = (void *)CFDictionaryGetValue(ValueAtIndex, v8);
      id v16 = Value;
    }
  }
  else if (__CFBinaryPlistGetOffsetForValueFromDictionary3() {
         && !__CFBinaryPlistCreateObject())
  }
  {
    [(NSCoder *)self __failWithExceptionName:@"NSInvalidUnarchiveOperationException", 4864, @"%@: data is corrupt or object is too large to decode", _NSMethodExceptionProem((objc_class *)self, a2) errorCode format];
    return 0;
  }
  else
  {
    return 0;
  }
  return Value;
}

- (unint64_t)_decodeCollectionOfClass:(void *)a3 allowedClasses:(__CFString *)a4 forKey:
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  if (result)
  {
    char v4 = result;
    if (*(void *)(result[15] + 32))
    {
      return 0;
    }
    else
    {
      unint64_t v5 = atomic_load(result + 2);
      if (v5 != result[17]) {
        goto LABEL_17;
      }
      char v6 = atomic_load(result + 2);
      if ((v6 & 4) == 0)
      {
        int v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: This method only supports secure coding.", _NSMethodExceptionProem((objc_class *)result, sel__decodeCollectionOfClass_allowedClasses_forKey_)), 0 reason userInfo];
        objc_exception_throw(v14);
      }
      unint64_t v8 = result[15];
      uint64_t Length = objc_msgSend(*(id *)(v8 + 24), "addObject:", objc_msgSend(a3, "setByAddingObject:", a2));
      *(_WORD *)(v8 + 40) = 1;
      if (a4)
      {
        uint64_t Length = CFStringGetLength(a4);
        if (Length >= 1)
        {
          uint64_t Length = CFStringGetCharacterAtIndex(a4, 0);
          if (Length == 36)
          {
            uint64_t Length = [(__CFString *)a4 substringFromIndex:1];
            a4 = (__CFString *)Length;
          }
        }
      }
      v17[0] = 0;
      unint64_t v10 = atomic_load(v4 + 2);
      if (v10 != v4[17]) {
LABEL_17:
      }
        __NSPoisoned();
      unint64_t v11 = atomic_load(v4 + 2);
      atomic_store(v11 | 8, v4 + 2);
      unint64_t v12 = atomic_load(v4 + 2);
      v4[17] = v12;
      unint64_t v13 = (void *)MEMORY[0x185308110](Length);
      if (v4[10])
      {
        _decodeObjectXML((uint64_t)v4, a4, v17);
      }
      else
      {
        unint64_t v15 = 0;
        uint64_t v16 = 0;
        if (_decodeOffsetAndRef((objc_class *)v4, (uint64_t)a4, &v16, &v15)) {
          _decodeObjectBinary((uint64_t)v4, v15, (uint64_t)a4, (CFTypeRef *)v17);
        }
      }
      *(_WORD *)(v8 + 40) = 0;
      [*(id *)(v8 + 24) removeLastObject];
      return (unint64_t *)v17[0];
    }
  }
  return result;
}

- (void)_allowDecodingCyclesInSecureMode
{
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    __NSPoisoned();
  }
  atomic_fetch_or((atomic_ullong *volatile)&self->_flags, 0x100uLL);
  unint64_t v3 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v3;
}

+ (id)unarchivedObjectOfClass:(Class)cls fromData:(NSData *)data error:(NSError *)error
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  Class v11 = cls;
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v11 count:1];
  unint64_t v9 = objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:", v8, data, error, v11, v12);

  return v9;
}

+ (id)unarchiveTopLevelObjectWithData:(NSData *)data error:(NSError *)error
{
  v15[1] = *(id *)MEMORY[0x1E4F143B8];
  v15[0] = 0;
  unint64_t v7 = (void *)MEMORY[0x185308110](a1, a2);
  unint64_t v8 = (void *)[objc_alloc((Class)a1) initForReadingWithData:data];
  id v9 = (id)[v8 decodeTopLevelObjectForKey:@"root" error:v15];
  unint64_t v10 = v9;
  if (!error || v9)
  {
    [v8 finishDecoding];
  }
  else
  {
    id v11 = v15[0];
    [v8 finishDecoding];

    id v12 = v15[0];
    *error = (NSError *)v15[0];
    id v13 = v12;
  }
  return v10;
}

- (void)finishDecoding
{
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    goto LABEL_13;
  }
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0) {
    return;
  }
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(NSKeyedUnarchiverDelegate *)self->_delegate unarchiverWillFinish:self];
  }
  unint64_t v5 = atomic_load(&self->_flags);
  if (v5 != self->_pac_signature) {
LABEL_13:
  }
    __NSPoisoned();
  unint64_t v6 = atomic_load(&self->_flags);
  atomic_store(v6 | 2, &self->_flags);
  unint64_t v7 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v7;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    [(NSKeyedUnarchiverDelegate *)delegate unarchiverDidFinish:self];
  }
}

- (NSKeyedUnarchiver)initForReadingWithData:(NSData *)data
{
  unint64_t v3 = [(NSKeyedUnarchiver *)self _initForReadingFromData:data error:0 throwLegacyExceptions:dyld_program_sdk_at_least() ^ 1];
  char v4 = v3;
  if (v3)
  {
    [(NSKeyedUnarchiver *)v3 setDecodingFailurePolicy:0];
    unint64_t v5 = atomic_load(&v4->_flags);
    if (v5 != v4->_pac_signature) {
      __NSPoisoned();
    }
    unint64_t v6 = atomic_load(&v4->_flags);
    atomic_store(v6 & 0xFFFFFFFFFFFFFFFBLL, &v4->_flags);
    unint64_t v7 = atomic_load(&v4->_flags);
    v4->_unint64_t pac_signature = v7;
    if (_NSCoderGetTrustRestrictions() != 2)
    {
      char v8 = _os_feature_enabled_impl();
      int v9 = _os_feature_enabled_impl();
      if (v8)
      {
        [(NSCoder *)v4 __failWithExceptionName:@"NSInvalidUnarchiveOperationException", 4864, @"%@: NSKeyedUnarchiver was used with secure coding disabled.", _NSMethodExceptionProem((objc_class *)v4, sel_initForReadingWithData_) errorCode format];

        return 0;
      }
      else if (v9 && initForReadingWithData__onceToken != -1)
      {
        dispatch_once(&initForReadingWithData__onceToken, &__block_literal_global_21);
      }
    }
  }
  return v4;
}

- (void)setClass:(Class)cls forClassName:(NSString *)codedName
{
  nameClassMap = self->_nameClassMap;
  if (!nameClassMap)
  {
    nameClassMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
    self->_nameClassMap = nameClassMap;
  }
  if (cls)
  {
    CFDictionarySetValue(nameClassMap, codedName, cls);
  }
  else
  {
    CFDictionaryRemoveValue(nameClassMap, codedName);
  }
}

+ (void)setClass:(Class)cls forClassName:(NSString *)codedName
{
  os_unfair_lock_lock(&stru_1EB1ECD14);
  Mutable = (__CFDictionary *)qword_1EB1ECD20;
  if (!qword_1EB1ECD20)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
    qword_1EB1ECD20 = (uint64_t)Mutable;
  }
  if (cls) {
    CFDictionarySetValue(Mutable, codedName, cls);
  }
  else {
    CFDictionaryRemoveValue(Mutable, codedName);
  }

  os_unfair_lock_unlock(&stru_1EB1ECD14);
}

+ (void)initialize
{
  if (NSKeyedUnarchiver == a1)
  {
    if (getenv("NSWarnAboutOldStyleArchiverMethods")) {
      _warnArchiverCompat = 1;
    }
    Class v2 = objc_lookUpClass("__NSLocalTimeZone");
    +[NSKeyedUnarchiver setClass:v2 forClassName:@"NSLocalTimeZone"];
  }
}

+ (NSDictionary)unarchivedDictionaryWithKeysOfClass:(Class)keyCls objectsOfClass:(Class)valueCls fromData:(NSData *)data error:(NSError *)error
{
  v14[1] = *MEMORY[0x1E4F143B8];
  Class v13 = valueCls;
  v14[0] = keyCls;
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v14 count:1];
  unint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v13 count:1];
  id v11 = (NSDictionary *)[a1 unarchivedDictionaryWithKeysOfClasses:v9 objectsOfClasses:v10 fromData:data error:error];

  return v11;
}

+ (NSDictionary)unarchivedDictionaryWithKeysOfClasses:(NSSet *)keyClasses objectsOfClasses:(NSSet *)valueClasses fromData:(NSData *)data error:(NSError *)error
{
  v13[7] = *MEMORY[0x1E4F143B8];
  int v9 = (void *)[objc_alloc((Class)a1) initForReadingFromData:data error:error];
  if (!v9) {
    return 0;
  }
  unint64_t v10 = v9;
  [v9 setRequiresSecureCoding:1];
  [v10 setDecodingFailurePolicy:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__NSKeyedUnarchiver_unarchivedDictionaryWithKeysOfClasses_objectsOfClasses_fromData_error___block_invoke;
  v13[3] = &unk_1E51F8F80;
  v13[4] = v10;
  v13[5] = keyClasses;
  v13[6] = valueClasses;
  id v11 = (NSDictionary *)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](v10, @"root", error, (uint64_t)v13);

  return v11;
}

+ (NSArray)unarchivedArrayOfObjectsOfClass:(Class)cls fromData:(NSData *)data error:(NSError *)error
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  Class v11 = cls;
  char v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v11 count:1];
  int v9 = (NSArray *)objc_msgSend(a1, "unarchivedArrayOfObjectsOfClasses:fromData:error:", v8, data, error, v11, v12);

  return v9;
}

+ (NSArray)unarchivedArrayOfObjectsOfClasses:(NSSet *)classes fromData:(NSData *)data error:(NSError *)error
{
  v11[6] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (void *)[objc_alloc((Class)a1) initForReadingFromData:data error:error];
  if (!v7) {
    return 0;
  }
  char v8 = v7;
  [v7 setRequiresSecureCoding:1];
  [v8 setDecodingFailurePolicy:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__NSKeyedUnarchiver_unarchivedArrayOfObjectsOfClasses_fromData_error___block_invoke;
  v11[3] = &unk_1E51F8F58;
  v11[4] = v8;
  v11[5] = classes;
  int v9 = (NSArray *)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](v8, @"root", error, (uint64_t)v11);

  return v9;
}

+ (id)_strictlyUnarchivedObjectOfClasses:(id)a3 fromData:(id)a4 error:(id *)a5
{
  unint64_t v7 = (unint64_t *)[objc_alloc((Class)a1) initForReadingFromData:a4 error:a5];
  if (!v7) {
    return 0;
  }
  char v8 = v7;
  [v7 setRequiresSecureCoding:1];
  [v8 setDecodingFailurePolicy:1];
  unint64_t v9 = atomic_load(v8 + 2);
  if (v9 != v8[17]) {
    __NSPoisoned();
  }
  atomic_fetch_or((atomic_ullong *volatile)v8 + 2, 0x20uLL);
  unint64_t v10 = atomic_load(v8 + 2);
  v8[17] = v10;
  Class v11 = (void *)[v8 decodeTopLevelObjectOfClasses:a3 forKey:@"root" error:a5];

  return v11;
}

+ (int)_swift_checkClassAndWarnForKeyedArchiving:(Class)a3 operation:(int)a4
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();

  return specialized static NSKeyedUnarchiver.__swift_checkClassAndWarnForKeyedArchiving(_:operation:)(ObjCClassMetadata, a4);
}

- (id)_blobForCurrentObject
{
  containers = self->_containers;
  if (containers)
  {
    CFIndex v4 = CFArrayGetCount(containers) - 1;
    unint64_t v5 = self->_containers;
    return (id)CFArrayGetValueAtIndex(v5, v4);
  }
  else
  {
    int Object = __CFBinaryPlistCreateObject();
    id result = 0;
    if (Object) {
      return 0;
    }
  }
  return result;
}

- (NSKeyedUnarchiver)init
{
  unint64_t v3 = +[NSString stringWithFormat:@"%@: cannot use -init for initialization", _NSMethodExceptionProem((objc_class *)self, a2)];

  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v3 userInfo:0]);
}

- (id)_initWithStream:(__CFReadStream *)a3 data:(id)a4 topDict:(__CFDictionary *)a5
{
  self->_objRefMap = CFDictionaryCreateMutable(0, 0, 0, 0);
  _CFDictionarySetCapacity();
  self->_tmpRefObjMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0, 0);
  _CFDictionarySetCapacity();
  self->_refObjMap = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  _CFDictionarySetCapacity();
  return self;
}

+ (id)_copyByArchiving:(id)a3
{
  unint64_t v3 = (unint64_t *)objc_msgSend(objc_alloc((Class)a1), "initForReadingFromData:error:", +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 0, 0), 0);
  if (!v3) {
    return 0;
  }
  CFIndex v4 = v3;
  unint64_t v5 = atomic_load(v3 + 2);
  if (v5 != v3[17]) {
    __NSPoisoned();
  }
  unint64_t v6 = atomic_load(v3 + 2);
  atomic_store(v6 & 0xFFFFFFFFFFFFFFFBLL, v3 + 2);
  unint64_t v7 = atomic_load(v3 + 2);
  v3[17] = v7;
  id v8 = (id)[v3 decodeObjectForKey:@"root"];

  return v8;
}

void __44__NSKeyedUnarchiver_initForReadingWithData___block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v0 = _NSRuntimeIssuesLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_fault_impl(&dword_181795000, v0, OS_LOG_TYPE_FAULT, "NSKeyedUnarchiver was created with secure coding implicitly disabled. This simulated crash will soon turn into an actual crash. See rdar://104622435 for help.", v1, 2u);
  }
}

- (NSKeyedUnarchiver)initWithStream:(id)a3
{
  MEMORY[0x1F4188790](self);
  unint64_t v5 = v4;
  long long v22 = v6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!v3 || (unint64_t v7 = v3, TypeID = CFReadStreamGetTypeID(), TypeID != CFGetTypeID(v7)))
  {
    unsigned int v19 = v22;
    long long v20 = +[NSString stringWithFormat:@"%@: stream argument is not a read stream", _NSMethodExceptionProem(v22, v5)];
    goto LABEL_27;
  }
  if ((unint64_t)(CFReadStreamGetStatus((CFReadStreamRef)v7) - 4) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unsigned int v19 = v22;
    long long v20 = +[NSString stringWithFormat:@"%@: stream is not open", _NSMethodExceptionProem(v22, v5)];
LABEL_27:
    long long v21 = v20;

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0]);
  }
  int v9 = CFReadStreamRead((CFReadStreamRef)v7, buffer, 0x2000);
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
  if (v9 < 1)
  {
    CFIndex v14 = 0;
    Class v11 = 0;
  }
  else
  {
    int v10 = 0;
    Class v11 = 0;
    LODWORD(v12) = 0;
    do
    {
      if ((v9 ^ 0x7FFFFFFF) < v10 || (int)v12 >= 0x40000000)
      {
        if (v11) {
          CFAllocatorDeallocate(allocator, v11);
        }
LABEL_23:
        [(objc_class *)v22 __failWithExceptionName:*MEMORY[0x1E4F1C3C8] errorCode:4864 format:@"stream too big"];
        Class v11 = 0;
        CFIndex v14 = 0;
        goto LABEL_24;
      }
      CFIndex v14 = (v9 + v10);
      if ((int)v12 < (int)v14)
      {
        CFIndex v12 = 2 * (int)v12 <= (int)v14 ? v14 : (2 * v12);
        uint64_t v25 = 0;
        id v26 = &v25;
        uint64_t v27 = 0x2020000000;
        char v28 = 0;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = ___NSConvertReadStreamToBytes_block_invoke;
        v24[3] = &unk_1E51F9110;
        v24[4] = &v25;
        Class v11 = (char *)MEMORY[0x185306D90](allocator, v11, v12, 3268606558, 0, v24);
        int v15 = *((unsigned __int8 *)v26 + 24);
        _Block_object_dispose(&v25, 8);
        if (v15) {
          goto LABEL_23;
        }
      }
      memmove(&v11[v10], buffer, v9);
      int v9 = CFReadStreamRead((CFReadStreamRef)v7, buffer, 0x2000);
      int v10 = v14;
    }
    while (v9 >= 1);
    if (v11) {
      goto LABEL_24;
    }
  }
  [(objc_class *)v22 __failWithExceptionName:*MEMORY[0x1E4F1C3C8], 4864, @"stream has no or too few bytes (%lu)", v14 errorCode format];
LABEL_24:
  CFDataRef v16 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)v11, v14, allocator);
  unsigned int v17 = (NSKeyedUnarchiver *)[(objc_class *)v22 initForReadingWithData:v16];
  CFRelease(v16);
  return v17;
}

+ (id)unarchiveObjectWithFile:(NSString *)path
{
  if (!path) {
    return 0;
  }
  unint64_t v5 = (void *)MEMORY[0x185308110](a1, a2);
  uint64_t v6 = [objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:path options:0 error:0];
  if (v6)
  {
    unint64_t v7 = (void *)v6;
    id v8 = (void *)[objc_alloc((Class)a1) initForReadingWithData:v6];
    id v9 = (id)[v8 decodeObjectForKey:@"root"];
    [v8 finishDecoding];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)unarchiveObjectWithData:(NSData *)data
{
  unint64_t v5 = (void *)MEMORY[0x185308110](a1, a2);
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initForReadingWithData:data];
  id v7 = (id)[v6 decodeObjectForKey:@"root"];
  [v6 finishDecoding];

  return v7;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSKeyedUnarchiver;
  return [(NSKeyedUnarchiver *)&v3 description];
}

- (BOOL)_allowsValueCoding
{
  return 1;
}

- (id)_allowedClassNames
{
  return [(_NSKeyedUnarchiverHelper *)self->_helper allowedClassNames];
}

- (void)_setAllowedClassNames:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = _NSRuntimeIssuesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
  }
  [(_NSKeyedUnarchiverHelper *)self->_helper setAllowedClassNames:a3];
}

- (void)_temporaryMapReplaceObject:(id)a3 withObject:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  tmpRefObjMap = self->_tmpRefObjMap;
  if (!tmpRefObjMap) {
    return;
  }
  CFIndex Count = CFDictionaryGetCount(tmpRefObjMap);
  uint64_t v9 = Count;
  size_t v10 = 8 * Count;
  if ((unint64_t)(8 * Count) <= 0x200)
  {
    if (Count <= 0)
    {
      CFIndex v14 = self->_tmpRefObjMap;
      CFDictionaryGetKeysAndValues(v14, 0, 0);
      return;
    }
    Class v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v11, v10);
    CFIndex v12 = (const void **)v11;
    bzero(v11, v10);
    CFDictionaryGetKeysAndValues(self->_tmpRefObjMap, (const void **)v11, (const void **)v11);
  }
  else
  {
    Class v11 = (char *)malloc_type_malloc(8 * Count, 0x100004000313F17uLL);
    CFIndex v12 = (const void **)malloc_type_malloc(v10, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(self->_tmpRefObjMap, (const void **)v11, v12);
    if (v9 < 1)
    {
LABEL_13:
      free(v12);
      free(v11);
      return;
    }
  }
  uint64_t v13 = 0;
  while (v12[v13] != a3)
  {
    if (v9 == ++v13) {
      goto LABEL_12;
    }
  }
  CFDictionarySetValue(self->_tmpRefObjMap, *(const void **)&v11[8 * v13], a4);
LABEL_12:
  if (v10 >= 0x201) {
    goto LABEL_13;
  }
}

- (void)replaceObject:(id)a3 withObject:(id)a4
{
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot replace", 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (a3 != a4)
  {
    -[NSKeyedUnarchiver _temporaryMapReplaceObject:withObject:](self, "_temporaryMapReplaceObject:withObject:");
  }
}

- (id)_decodeObjectOfClass:(Class)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (self->_helper->_decodeError) {
    return 0;
  }
  unint64_t v5 = atomic_load(&self->_flags);
  if (v5 != self->_pac_signature) {
    goto LABEL_20;
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 4) == 0)
  {
    return [(NSKeyedUnarchiver *)self decodeObject];
  }
  if (!a3 || !object_isClass(a3))
  {
    int v15 = +[NSString stringWithFormat:@"%@ '%@' is not an Objective-C class!", _NSMethodExceptionProem((objc_class *)self, a2), a3];
    CFDataRef v16 = (void *)MEMORY[0x1E4F1CA00];
    unsigned int v17 = (__CFString *)*MEMORY[0x1E4F1C3C8];
    goto LABEL_23;
  }
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", a3, 0);
  [(NSMutableArray *)self->_helper->_allowedClasses addObject:v9];

  if (_warnArchiverCompat == 1)
  {
    size_t v10 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v10);
  }
  unint64_t v11 = atomic_load(&self->_flags);
  if (v11 != self->_pac_signature) {
LABEL_20:
  }
    __NSPoisoned();
  char v12 = atomic_load(&self->_flags);
  if ((v12 & 2) != 0)
  {
    int v15 = +[NSString stringWithFormat:@"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"];
    CFDataRef v16 = (void *)MEMORY[0x1E4F1CA00];
    unsigned int v17 = @"NSInvalidUnarchiveOperationException";
LABEL_23:
    objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v15 userInfo:0]);
  }
  if (self->_helper->_decodeError) {
    return 0;
  }
  v18[0] = 0;
  uint64_t genericKey = self->_genericKey;
  self->_uint64_t genericKey = genericKey + 1;
  if (genericKey > 0x27) {
    CFIndex v14 = +[NSString stringWithFormat:@"$%ld", genericKey];
  }
  else {
    CFIndex v14 = (NSString *)generic_keys[genericKey];
  }
  _decodeObject((unint64_t *)self, v14, v18);
  [(NSMutableArray *)self->_helper->_allowedClasses removeLastObject];
  return (id)v18[0];
}

- (void)_enableStrictSecureDecodingMode
{
  [(NSKeyedUnarchiver *)self setRequiresSecureCoding:1];
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    __NSPoisoned();
  }
  atomic_fetch_or((atomic_ullong *volatile)&self->_flags, 0x20uLL);
  unint64_t v4 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v4;
}

- (BOOL)_strictSecureDecodingEnabled
{
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    __NSPoisoned();
  }
  unint64_t v3 = atomic_load(&self->_flags);
  return (v3 >> 5) & 1;
}

- (void)_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded
{
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    __NSPoisoned();
  }
  atomic_fetch_or((atomic_ullong *volatile)&self->_flags, 0x40uLL);
  unint64_t v3 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v3;
}

- (void)_enforceExplicitPlistTypes
{
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    __NSPoisoned();
  }
  atomic_fetch_or((atomic_ullong *volatile)&self->_flags, 0x80uLL);
  unint64_t v3 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v3;
}

- (BOOL)_willEnforceExplicitPlistTypes
{
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v3 = atomic_load(&self->_flags);
  if (v3 < 0) {
    return 1;
  }

  return _os_feature_enabled_impl();
}

void __49__NSKeyedUnarchiver__decodeArrayOfObjectsForKey___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v4 = (v3 - 1);
    if (v3 - 1 >= 0)
    {
      do
      {
        unint64_t v5 = *(void **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 8 * v4);
        if (v5) {
      }
        }
      while (v4-- > 0);
      unint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
    free(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (unsigned)_currentUniqueIdentifier
{
  return self->_helper->_lastRef;
}

- (BOOL)_containsNextUnkeyedObject
{
  uint64_t genericKey = self->_genericKey;
  if (genericKey <= 0x27)
  {
    uint64_t v4 = (NSString *)generic_keys[genericKey];
    if (v4) {
      goto LABEL_3;
    }
    return 0;
  }
  uint64_t v4 = +[NSString stringWithFormat:@"$%ld", genericKey];
  if (!v4) {
    return 0;
  }
LABEL_3:
  containers = self->_containers;
  if (!containers) {
    return __CFBinaryPlistGetOffsetForValueFromDictionary3();
  }
  CFIndex Count = CFArrayGetCount(containers);
  CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
  if (CFGetTypeID(ValueAtIndex) == 19)
  {
    Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
    id v9 = Value;
    CFArrayRemoveValueAtIndex(ValueAtIndex, 0);
  }
  else
  {
    Value = (void *)CFDictionaryGetValue(ValueAtIndex, v4);
    id v11 = Value;
  }
  return Value != 0;
}

+ (BOOL)_evaluateCycleSecurityRules:(NSKeyedUnarchiverCycleEvaluationRules *)a3
{
  uint64_t v3 = *(unsigned int *)&a3->var0;
  if ((v3 & 0x10000) != 0) {
    return 0;
  }
  if ((v3 & 0x1000101) == 1) {
    return ((v3 | ((unint64_t)a3->var4 << 32)) & 0x100000000) == 0;
  }
  return 1;
}

- (id)decodeObject
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (_warnArchiverCompat == 1)
  {
    uint64_t v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v4);
  }
  unint64_t v5 = atomic_load(&self->_flags);
  if (v5 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    size_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v10);
  }
  if (self->_helper->_decodeError) {
    return 0;
  }
  v11[0] = 0;
  uint64_t genericKey = self->_genericKey;
  self->_uint64_t genericKey = genericKey + 1;
  if (genericKey > 0x27) {
    id v9 = +[NSString stringWithFormat:@"$%ld", genericKey];
  }
  else {
    id v9 = (NSString *)generic_keys[genericKey];
  }
  _decodeObject((unint64_t *)self, v9, v11);
  return (id)v11[0];
}

- (void)decodeBytesWithReturnedLength:(unint64_t *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v17[0] = 0;
  if (_warnArchiverCompat == 1)
  {
    char v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v6);
  }
  unint64_t v7 = atomic_load(&self->_flags);
  if (v7 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v8 = atomic_load(&self->_flags);
  if ((v8 & 2) != 0)
  {
    CFDataRef v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v16);
  }
  if (self->_helper->_decodeError)
  {
    if (a3)
    {
      id result = 0;
      *a3 = 0;
      return result;
    }
  }
  else
  {
    uint64_t genericKey = self->_genericKey;
    self->_uint64_t genericKey = genericKey + 1;
    if (genericKey > 0x27) {
      id v11 = +[NSString stringWithFormat:@"$%ld", genericKey];
    }
    else {
      id v11 = (NSString *)generic_keys[genericKey];
    }
    char v12 = _decodeBytes((uint64_t)self, v11, v17);
    if (a3) {
      *a3 = v17[0];
    }
    if (v12)
    {
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CA58] dataWithBytes:v12 length:v17[0]];
      if (v13) {
        return (void *)[v13 mutableBytes];
      }
      uint64_t v14 = *MEMORY[0x1E4F1C4A0];
      int v15 = _NSMethodExceptionProem((objc_class *)self, sel_decodeBytesWithReturnedLength_);
      [(NSCoder *)self __failWithExceptionName:v14, 4864, @"%@: unable to allocate memory for length (%ld)", v15, v17[0] errorCode format];
    }
  }
  return 0;
}

- (void)decodeValuesOfObjCTypes:(const char *)a3
{
  if (_warnArchiverCompat == 1)
  {
    char v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v6);
  }
  unint64_t v7 = atomic_load(&self->_flags);
  if (v7 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v8 = atomic_load(&self->_flags);
  if ((v8 & 2) != 0)
  {
    char v12 = +[NSString stringWithFormat:@"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0];
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = @"NSInvalidUnarchiveOperationException";
LABEL_12:
    objc_exception_throw((id)[v13 exceptionWithName:v14 reason:v12 userInfo:0]);
  }
  if (!a3)
  {
    id v11 = +[NSString stringWithFormat:@"%@: null types pointer", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_11:
    char v12 = v11;
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = (__CFString *)*MEMORY[0x1E4F1C3C8];
    goto LABEL_12;
  }
  int v15 = &v16;
  if (*a3)
  {
    while (1)
    {
      id v9 = v15++;
      if (!*v9) {
        break;
      }
      -[NSKeyedUnarchiver decodeValueOfObjCType:at:](self, "decodeValueOfObjCType:at:", a3);
      if (!*(unsigned __int8 *)++a3) {
        return;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@: null address pointer", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_11;
  }
}

- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5
{
  uint64_t v10 = objc_opt_class();
  if (_warnArchiverCompat == 1)
  {
    id v11 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v11);
  }
  unint64_t v12 = atomic_load(&self->_flags);
  if (v12 != self->_pac_signature) {
    goto LABEL_19;
  }
  char v13 = atomic_load(&self->_flags);
  if ((v13 & 2) != 0)
  {
    long long v21 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more", 0 reason userInfo];
    objc_exception_throw(v21);
  }
  if (!self->_helper->_decodeError)
  {
    unint64_t v14 = atomic_load(&self->_flags);
    if (v14 == self->_pac_signature)
    {
      unint64_t v15 = atomic_load(&self->_flags);
      atomic_store(v15 | 8, &self->_flags);
      unint64_t v16 = atomic_load(&self->_flags);
      self->_unint64_t pac_signature = v16;
      if (a3 && a5)
      {
        if (a4)
        {
          id v17 = [(NSKeyedUnarchiver *)self _decodeObjectOfClass:v10];
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = *a3;
            [v17 fillObjCType:v18 count:a4 at:a5];
          }
          else
          {
            [(NSCoder *)self __failWithExceptionName:@"NSInvalidUnarchiveOperationException", 4864, @"%@: encoded entity at this point is not an array of ObjC type", _NSMethodExceptionProem((objc_class *)self, a2) errorCode format];
          }
          return;
        }
        uint64_t v19 = *MEMORY[0x1E4F1C3C8];
        long long v22 = _NSMethodExceptionProem((objc_class *)self, a2);
        long long v20 = @"%@: count is zero";
      }
      else
      {
        uint64_t v19 = *MEMORY[0x1E4F1C3C8];
        long long v22 = _NSMethodExceptionProem((objc_class *)self, a2);
        long long v20 = @"%@: null type or address pointer";
      }
      -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", v19, 4864, v20, v22);
      return;
    }
LABEL_19:
    __NSPoisoned();
  }
}

- (int64_t)versionForClassName:(id)a3
{
  Class v3 = NSClassFromString((NSString *)a3);
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [(objc_class *)v3 version];
}

- (unsigned)systemVersion
{
  return 2000;
}

@end