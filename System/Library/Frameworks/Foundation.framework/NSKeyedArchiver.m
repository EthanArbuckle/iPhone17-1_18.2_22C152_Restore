@interface NSKeyedArchiver
+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path;
+ (NSData)archivedDataWithRootObject:(id)object requiringSecureCoding:(BOOL)requiresSecureCoding error:(NSError *)error;
+ (NSData)archivedDataWithRootObject:(id)rootObject;
+ (NSString)classNameForClass:(Class)cls;
+ (void)initialize;
+ (void)setClassName:(NSString *)codedName forClass:(Class)cls;
- (BOOL)_allowsValueCoding;
- (BOOL)allowsKeyedCoding;
- (BOOL)requiresSecureCoding;
- (NSData)encodedData;
- (NSKeyedArchiver)init;
- (NSKeyedArchiver)initRequiringSecureCoding:(BOOL)requiresSecureCoding;
- (NSPropertyListFormat)outputFormat;
- (NSString)classNameForClass:(Class)cls;
- (id)_blobForCurrentObject;
- (id)_initWithOutput:(id)a3;
- (id)delegate;
- (id)description;
- (int64_t)versionForClassName:(id)a3;
- (unsigned)systemVersion;
- (void)_encodeArrayOfObjects:(id)a3 forKey:(id)a4;
- (void)_encodePropertyList:(id)a3 forKey:(id)a4;
- (void)_setBlobForCurrentObject:(id)a3;
- (void)dealloc;
- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5;
- (void)encodeBool:(BOOL)value forKey:(NSString *)key;
- (void)encodeBytes:(const uint8_t *)bytes length:(NSUInteger)length forKey:(NSString *)key;
- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)encodeConditionalObject:(id)a3;
- (void)encodeConditionalObject:(id)object forKey:(NSString *)key;
- (void)encodeDouble:(double)value forKey:(NSString *)key;
- (void)encodeFloat:(float)value forKey:(NSString *)key;
- (void)encodeInt32:(int32_t)value forKey:(NSString *)key;
- (void)encodeInt64:(int64_t)value forKey:(NSString *)key;
- (void)encodeInt:(int)value forKey:(NSString *)key;
- (void)encodeObject:(id)a3;
- (void)encodeObject:(id)object forKey:(NSString *)key;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
- (void)encodeValuesOfObjCTypes:(const char *)a3;
- (void)finishEncoding;
- (void)replaceObject:(id)a3 withObject:(id)a4;
- (void)setClassName:(NSString *)codedName forClass:(Class)cls;
- (void)setDelegate:(id)delegate;
- (void)setOutputFormat:(NSPropertyListFormat)outputFormat;
- (void)setRequiresSecureCoding:(BOOL)requiresSecureCoding;
@end

@implementation NSKeyedArchiver

- (void)_encodeArrayOfObjects:(id)a3 forKey:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    goto LABEL_26;
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    v28 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v28);
  }
  CFStringRef v7 = (const __CFString *)a4;
  if (a4 && CFStringGetLength((CFStringRef)a4) >= 1 && CFStringGetCharacterAtIndex(v7, 0) == 36) {
    CFStringRef v7 = (const __CFString *)[@"$" stringByAppendingString:v7];
  }
  v9 = objc_opt_new();
  _CFArraySetCapacity();
  [(NSMutableArray *)self->_containers addObject:v9];
  ++self->_estimatedCount;

  unint64_t v10 = atomic_load(&self->_flags);
  if (v10 != self->_pac_signature) {
    goto LABEL_26;
  }
  unint64_t v11 = atomic_load(&self->_flags);
  atomic_store(v11 | 1, &self->_flags);
  unint64_t v12 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v12;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(a3);
        }
        _encodeObject((uint64_t)self, &stru_1ECA5C228, *(void **)(*((void *)&v30 + 1) + 8 * v16++), 0);
      }
      while (v14 != v16);
      uint64_t v14 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v14);
  }
  uint64_t v17 = [(NSMutableArray *)self->_containers count] - 1;
  if (v17 < 0) {
    v18 = 0;
  }
  else {
    v18 = (const void *)[(NSMutableArray *)self->_containers objectAtIndexedSubscript:v17];
  }
  CFTypeRef v19 = CFRetain(v18);
  uint64_t v20 = [(NSMutableArray *)self->_containers count];
  [(NSMutableArray *)self->_containers removeObjectAtIndex:v20 - 1];
  if (v20 - 1 >= 1)
  {
    CFTypeID v21 = CFGetTypeID((CFTypeRef)[(NSMutableArray *)self->_containers objectAtIndexedSubscript:v20 - 2]);
    unint64_t v22 = atomic_load(&self->_flags);
    unint64_t pac_signature = self->_pac_signature;
    if (v21 == 19)
    {
      if (v22 == pac_signature)
      {
        unint64_t v24 = atomic_load(&self->_flags);
        unint64_t v25 = v24 | 1;
LABEL_24:
        atomic_store(v25, &self->_flags);
        unint64_t v27 = atomic_load(&self->_flags);
        self->_unint64_t pac_signature = v27;
        goto LABEL_25;
      }
    }
    else if (v22 == pac_signature)
    {
      unint64_t v26 = atomic_load(&self->_flags);
      unint64_t v25 = v26 & 0xFFFFFFFFFFFFFFFELL;
      goto LABEL_24;
    }
LABEL_26:
    __NSPoisoned();
  }
LABEL_25:
  addValueToTopContainerE((uint64_t)self, v7, v19);
  CFRelease(v19);
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

- (NSString)classNameForClass:(Class)cls
{
  result = (NSString *)self->_classNameMap;
  if (result) {
    return (NSString *)CFDictionaryGetValue((CFDictionaryRef)result, cls);
  }
  return result;
}

+ (NSString)classNameForClass:(Class)cls
{
  os_unfair_lock_lock(&_MergedGlobals_41);
  if (qword_1EB1ECD18) {
    Value = (NSString *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB1ECD18, cls);
  }
  else {
    Value = 0;
  }
  os_unfair_lock_unlock(&_MergedGlobals_41);
  return Value;
}

- (void)replaceObject:(id)a3 withObject:(id)a4
{
  value[1] = *(void **)MEMORY[0x1E4F143B8];
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    unint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot replace", 0 reason userInfo];
    objc_exception_throw(v11);
  }
  if (a3 != a4)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [(NSKeyedArchiverDelegate *)self->_delegate archiver:self willReplaceObject:a3 withObject:a4];
    }
    value[0] = 0;
    if (CFDictionaryGetValueIfPresent(self->_objRefMap, a3, (const void **)value)) {
      BOOL v9 = LODWORD(value[0]) == 0xFFFFFFFFLL;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      CFDictionaryRemoveValue(self->_objRefMap, a3);
      CFDictionarySetValue(self->_objRefMap, a4, value[0]);
    }
  }
  if (!self->_replacementMap)
  {
    self->_replacementMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0, 0);
    _CFDictionarySetCapacity();
  }
  visited = self->_visited;
  if (!visited)
  {
    self->_visited = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0);
    _CFSetSetCapacity();
    visited = self->_visited;
  }
  CFSetAddValue(visited, a3);
  if (a3 != a4) {
    CFDictionarySetValue(self->_replacementMap, a3, a4);
  }
}

- (void)encodeBool:(BOOL)value forKey:(NSString *)key
{
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    unint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v11);
  }
  CFStringRef v7 = key;
  BOOL v8 = value;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v7, 0) == 36) {
    CFStringRef v7 = (NSString *)[@"$" stringByAppendingString:v7];
  }
  BOOL v9 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!v8) {
    BOOL v9 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  unint64_t v10 = *v9;

  addValueToTopContainerE((uint64_t)self, v7, v10);
}

- (void)encodeDouble:(double)value forKey:(NSString *)key
{
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    BOOL v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  CFStringRef v7 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v7, 0) == 36) {
    CFStringRef v7 = (NSString *)[@"$" stringByAppendingString:v7];
  }

  _encodeDouble((uint64_t)self, v7, value);
}

- (void)_encodePropertyList:(id)a3 forKey:(id)a4
{
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    BOOL v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  CFStringRef v7 = (const __CFString *)a4;
  if (a4 && CFStringGetLength((CFStringRef)a4) >= 1 && CFStringGetCharacterAtIndex(v7, 0) == 36) {
    CFStringRef v7 = (const __CFString *)[@"$" stringByAppendingString:v7];
  }

  addValueToTopContainerE((uint64_t)self, v7, a3);
}

- (void)encodeFloat:(float)value forKey:(NSString *)key
{
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    BOOL v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  CFStringRef v7 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v7, 0) == 36) {
    CFStringRef v7 = (NSString *)[@"$" stringByAppendingString:v7];
  }

  _encodeFloat((uint64_t)self, v7, value);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeInt64:(int64_t)value forKey:(NSString *)key
{
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    BOOL v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  CFStringRef v7 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v7, 0) == 36) {
    CFStringRef v7 = (NSString *)[@"$" stringByAppendingString:v7];
  }

  _encodeInt64((uint64_t)self, v7, value);
}

+ (NSData)archivedDataWithRootObject:(id)rootObject
{
  v5 = (NSData *)(id)[objc_allocWithZone(MEMORY[0x1E4F1CA58]) initWithLength:0];
  char v6 = (void *)MEMORY[0x185308110]();
  id v7 = (id)[objc_allocWithZone((Class)a1) initForWritingWithMutableData:v5];
  [v7 encodeObject:rootObject forKey:@"root"];
  [v7 finishEncoding];
  return v5;
}

+ (NSData)archivedDataWithRootObject:(id)object requiringSecureCoding:(BOOL)requiresSecureCoding error:(NSError *)error
{
  char v6 = (void *)[objc_alloc((Class)a1) initRequiringSecureCoding:requiresSecureCoding];
  [v6 encodeObject:object forKey:@"root"];
  id v7 = (NSData *)[v6 encodedData];
  [v6 finishEncoding];

  return v7;
}

- (void)encodeObject:(id)object forKey:(NSString *)key
{
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    BOOL v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  id v7 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v7, 0) == 36) {
    id v7 = (NSString *)[@"$" stringByAppendingString:v7];
  }

  _encodeObject((uint64_t)self, v7, object, 0);
}

- (NSData)encodedData
{
  if (_NSIsNSData())
  {
    unint64_t v3 = atomic_load(&self->_flags);
    if (v3 != self->_pac_signature) {
      __NSPoisoned();
    }
    char v4 = atomic_load(&self->_flags);
    if ((v4 & 2) == 0) {
      [(NSKeyedArchiver *)self finishEncoding];
    }
    v5 = self->_stream;
    return (NSData *)v5;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1C9B8];
    return (NSData *)[v7 data];
  }
}

- (void)finishEncoding
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int valuePtr = 100000;
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    goto LABEL_19;
  }
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0) {
    return;
  }
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(NSKeyedArchiverDelegate *)self->_delegate archiverWillFinish:self];
  }
  unint64_t v6 = atomic_load(&self->_flags);
  if (v6 != self->_pac_signature) {
LABEL_19:
  }
    __NSPoisoned();
  unint64_t v7 = atomic_load(&self->_flags);
  atomic_store(v7 | 2, &self->_flags);
  unint64_t v8 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v8;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFNumberRef v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  Mutable = CFDictionaryCreateMutable(v9, 8, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  unint64_t v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  CFDictionarySetValue(Mutable, @"$archiver", v13);
  CFDictionarySetValue(Mutable, @"$version", v10);
  CFDictionarySetValue(Mutable, @"$objects", self->_objects);
  ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)self->_containers, 0);
  CFDictionarySetValue(Mutable, @"$top", ValueAtIndex);
  CFRelease(v10);
  self->_estimatedCount += 12;
  if ([(NSKeyedArchiver *)self outputFormat] == NSPropertyListXMLFormat_v1_0)
  {
    uint64_t XMLDataWithExtras = _CFPropertyListCreateXMLDataWithExtras();
    if (!XMLDataWithExtras)
    {
      unint64_t v22 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: could not create XML data", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
      objc_exception_throw(v22);
    }
    CFDataRef v16 = (const __CFData *)XMLDataWithExtras;
    CFTypeID v17 = CFGetTypeID(self->_stream);
    CFTypeID TypeID = CFDataGetTypeID();
    stream = (__CFData *)self->_stream;
    BytePtr = CFDataGetBytePtr(v16);
    CFIndex Length = CFDataGetLength(v16);
    if (v17 == TypeID) {
      CFDataAppendBytes(stream, BytePtr, Length);
    }
    else {
      CFWriteStreamWrite(stream, BytePtr, Length);
    }
    CFRelease(v16);
  }
  else if ([(NSKeyedArchiver *)self outputFormat] == NSPropertyListBinaryFormat_v1_0)
  {
    __CFBinaryPlistWriteToStreamWithOptions();
  }
  CFRelease(Mutable);
  if (self->_delegate)
  {
    if (objc_opt_respondsToSelector()) {
      [(NSKeyedArchiverDelegate *)self->_delegate archiverDidFinish:self];
    }
  }
}

- (NSPropertyListFormat)outputFormat
{
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    __NSPoisoned();
  }
  unint64_t v3 = atomic_load(&self->_flags);
  return v3 >> 16;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = atomic_load(&self->_flags);
  if (v2 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) == 0)
  {
    unint64_t v6 = _NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v22 = _NSMethodExceptionProem((objc_class *)self, a2);
      _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "%@: warning: NSKeyedArchiver deallocated without having had -finishEncoding called on it.", buf, 0xCu);
    }
  }
  unint64_t cacheSize = self->_cacheSize;
  if (cacheSize)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      CFKeyedArchiverUIDRef v10 = self->_cache[v8];
      if (v10)
      {
        CFRelease(v10);
        unint64_t cacheSize = self->_cacheSize;
      }
      uint64_t v8 = v9;
    }
    while (cacheSize > v9++);
  }
  cache = self->_cache;
  if (cache) {
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], cache);
  }
  stream = self->_stream;
  if (stream) {
    CFRelease(stream);
  }

  objRefMap = self->_objRefMap;
  if (objRefMap) {
    CFRelease(objRefMap);
  }
  replacementMap = self->_replacementMap;
  if (replacementMap) {
    CFRelease(replacementMap);
  }
  classNameMap = self->_classNameMap;
  if (classNameMap) {
    CFRelease(classNameMap);
  }
  conditionals = self->_conditionals;
  if (conditionals) {
    CFRelease(conditionals);
  }
  classes = self->_classes;
  if (classes) {
    CFRelease(classes);
  }
  visited = self->_visited;
  if (visited) {
    CFRelease(visited);
  }
  v20.receiver = self;
  v20.super_class = (Class)NSKeyedArchiver;
  [(NSKeyedArchiver *)&v20 dealloc];
}

- (NSKeyedArchiver)initRequiringSecureCoding:(BOOL)requiresSecureCoding
{
  BOOL v3 = requiresSecureCoding;
  char v4 = [(NSKeyedArchiver *)self init];
  [(NSKeyedArchiver *)v4 setRequiresSecureCoding:v3];
  return v4;
}

- (void)setRequiresSecureCoding:(BOOL)requiresSecureCoding
{
  unint64_t v3 = atomic_load(&self->_flags);
  if (v3 != self->_pac_signature) {
    __NSPoisoned();
  }
  unint64_t v4 = atomic_load(&self->_flags);
  p_flags = &self->_flags;
  unint64_t v6 = v4 & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v7 = 4;
  if (!requiresSecureCoding) {
    uint64_t v7 = 0;
  }
  atomic_store(v6 | v7, p_flags);
  unint64_t v8 = atomic_load(p_flags);
  self->_unint64_t pac_signature = v8;
}

- (NSKeyedArchiver)init
{
  id v3 = (id)objc_opt_new();

  return (NSKeyedArchiver *)[(NSKeyedArchiver *)self _initWithOutput:v3];
}

- (id)_initWithOutput:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_stream = (void *)CFRetain(a3);
  p_flags = &self->_flags;
  atomic_store(0xC80000uLL, &self->_flags);
  self->_delegate = 0;
  self->_containers = 0;
  self->_objects = 0;
  self->_objRefMap = 0;
  self->_replacementMap = 0;
  self->_classNameMap = 0;
  self->_conditionals = 0;
  self->_classes = 0;
  self->_visited = 0;
  self->_cache = 0;
  self->_unint64_t cacheSize = 0;
  self->_estimatedCount = 0;
  self->_containers = (NSMutableArray *)objc_opt_new();
  self->_objects = (NSMutableArray *)objc_opt_new();
  _CFArraySetCapacity();
  [(NSMutableArray *)self->_objects addObject:@"$null"];
  keyCallBacks.version = 0;
  keyCallBacks.retain = (CFDictionaryRetainCallBack)__karetain;
  keyCallBacks.release = (CFDictionaryReleaseCallBack)__karelease;
  memset(&keyCallBacks.copyDescription, 0, 24);
  self->_objRefMap = CFDictionaryCreateMutable(0, 0, &keyCallBacks, 0);
  _CFDictionarySetCapacity();
  self->_conditionals = CFDictionaryCreateMutable(0, 0, &keyCallBacks, 0);
  unint64_t v5 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v5;
  unint64_t v6 = objc_opt_new();
  _CFDictionarySetCapacity();
  [(NSMutableArray *)self->_containers addObject:v6];
  ++self->_estimatedCount;

  unint64_t v7 = atomic_load(&self->_flags);
  if (v7 != self->_pac_signature) {
    __NSPoisoned();
  }
  unint64_t v8 = atomic_load(p_flags);
  atomic_store(v8 & 0xFFFFFFFFFFFFFFFELL, p_flags);
  unint64_t v9 = atomic_load(p_flags);
  self->_unint64_t pac_signature = v9;
  self->_genericKey = 0;
  return self;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (NSKeyedArchiverDelegate *)delegate;
}

- (void)encodeBytes:(const uint8_t *)bytes length:(NSUInteger)length forKey:(NSString *)key
{
  atomic_load(&self->_flags);
  if (self->_pac_signature != 12333) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    CFKeyedArchiverUIDRef v10 = +[NSString stringWithFormat:@"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"];
    unint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = @"NSInvalidArchiveOperationException";
    goto LABEL_15;
  }
  unint64_t v7 = key;
  if (!bytes && length)
  {
    CFKeyedArchiverUIDRef v10 = +[NSString stringWithFormat:@"%@: argument inconsistency: bytes pointer is null but length (%ld) is not zero", _NSMethodExceptionProem((objc_class *)self, a2), length];
    unint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = (__CFString *)*MEMORY[0x1E4F1C3C8];
LABEL_15:
    objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v10 userInfo:0]);
  }
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v7, 0) == 36) {
    unint64_t v7 = (NSString *)[@"$" stringByAppendingString:v7];
  }

  _encodeBytes((uint64_t)self, bytes, length, v7);
}

- (void)encodeInt:(int)value forKey:(NSString *)key
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int valuePtr = value;
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    unint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)key, 0) == 36) {
    key = (NSString *)[@"$" stringByAppendingString:key];
  }
  addValueToTopContainerE((uint64_t)self, key, v8);
  CFRelease(v8);
}

- (void)setClassName:(NSString *)codedName forClass:(Class)cls
{
  classNameMap = self->_classNameMap;
  if (!classNameMap)
  {
    classNameMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0, MEMORY[0x1E4F1D540]);
    self->_classNameMap = classNameMap;
  }
  if (codedName)
  {
    CFDictionarySetValue(classNameMap, cls, codedName);
  }
  else
  {
    CFDictionaryRemoveValue(classNameMap, cls);
  }
}

- (void)encodeInt32:(int32_t)value forKey:(NSString *)key
{
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    unint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  unint64_t v7 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v7, 0) == 36) {
    unint64_t v7 = (NSString *)[@"$" stringByAppendingString:v7];
  }

  _encodeInt32((uint64_t)self, v7, value);
}

- (void)encodeConditionalObject:(id)object forKey:(NSString *)key
{
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    unint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  unint64_t v7 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v7, 0) == 36) {
    unint64_t v7 = (NSString *)[@"$" stringByAppendingString:v7];
  }

  _encodeObject((uint64_t)self, v7, object, 1);
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  if (_warnArchiverCompat == 1)
  {
    CFNumberRef v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v8);
  }
  unint64_t v9 = atomic_load(&self->_flags);
  if (v9 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v10 = atomic_load(&self->_flags);
  if ((v10 & 2) != 0)
  {
    CFTypeID v17 = +[NSString stringWithFormat:@"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"];
    v18 = (void *)MEMORY[0x1E4F1CA00];
    CFTypeRef v19 = @"NSInvalidArchiveOperationException";
    goto LABEL_27;
  }
  if (!a3 || !a4)
  {
    objc_super v20 = +[NSString stringWithFormat:@"%@: null type or address pointer", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_26:
    CFTypeID v17 = v20;
    v18 = (void *)MEMORY[0x1E4F1CA00];
    CFTypeRef v19 = (__CFString *)*MEMORY[0x1E4F1C3C8];
LABEL_27:
    objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v17 userInfo:0]);
  }
  int v11 = *(unsigned __int8 *)a3;
  if (v11 != 91)
  {
    if (v11 != 123)
    {
      _compatEncodeValueOfObjCType((objc_class *)self, (char)v11, (const char **)a4, a2);
      return;
    }
    objc_super v20 = +[NSString stringWithFormat:@"%@: this archiver cannot encode structs", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_26;
  }
  unsigned int v14 = *((unsigned __int8 *)a3 + 1);
  uint64_t v13 = a3 + 1;
  unsigned int v12 = v14;
  if (v14 - 48 > 9) {
    goto LABEL_23;
  }
  uint64_t v15 = 0;
  do
  {
    uint64_t v15 = 10 * v15 + v12 - 48;
    unsigned int v16 = *(unsigned __int8 *)++v13;
    unsigned int v12 = v16;
  }
  while (v16 - 48 < 0xA);
  if (!v15)
  {
LABEL_23:
    objc_super v20 = +[NSString stringWithFormat:@"%@: array count is missing or zero", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_26;
  }
  if (v12 == 93)
  {
    objc_super v20 = +[NSString stringWithFormat:@"%@: array type is missing", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_26;
  }

  -[NSKeyedArchiver encodeArrayOfObjCType:count:at:](self, "encodeArrayOfObjCType:count:at:", v13);
}

+ (void)initialize
{
  if (NSKeyedArchiver == a1)
  {
    if (getenv("NSWarnAboutOldStyleArchiverMethods")) {
      _warnArchiverCompat = 1;
    }
    +[NSKeyedArchiver setClassName:@"NSLocalTimeZone" forClass:objc_lookUpClass("__NSLocalTimeZone")];
    Class v2 = objc_lookUpClass("__NSLocalTimeZoneI");
    +[NSKeyedArchiver setClassName:@"NSLocalTimeZone" forClass:v2];
  }
}

+ (void)setClassName:(NSString *)codedName forClass:(Class)cls
{
  os_unfair_lock_lock(_MergedGlobals_41);
  Mutable = (__CFDictionary *)qword_1EB1ECD18;
  if (!qword_1EB1ECD18)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0, MEMORY[0x1E4F1D540]);
    qword_1EB1ECD18 = (uint64_t)Mutable;
  }
  if (codedName) {
    CFDictionarySetValue(Mutable, cls, codedName);
  }
  else {
    CFDictionaryRemoveValue(Mutable, cls);
  }

  os_unfair_lock_unlock(_MergedGlobals_41);
}

- (void)_setBlobForCurrentObject:(id)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_containers count] - 1;
  [(NSMutableArray *)self->_containers addObject:a3];
  containers = self->_containers;

  [(NSMutableArray *)containers removeObjectAtIndex:v5];
}

- (id)_blobForCurrentObject
{
  uint64_t v3 = [(NSMutableArray *)self->_containers count] - 1;
  containers = self->_containers;

  return (id)[(NSMutableArray *)containers objectAtIndexedSubscript:v3];
}

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path
{
  v17[1] = *(NSString **)MEMORY[0x1E4F143B8];
  unint64_t v7 = (void *)MEMORY[0x185308110](a1, a2);
  uint64_t v16 = 0;
  v17[0] = 0;
  if (_NSCreateTemporaryFile(path, v17, 0, &v16, 0))
  {
    CFNumberRef v8 = CFWriteStreamCreateWithFile(0, (CFURLRef)[MEMORY[0x1E4F1CB10] fileURLWithPath:v17[0] isDirectory:0]);
    int v9 = CFWriteStreamOpen(v8);
    CFStreamStatus Status = CFWriteStreamGetStatus(v8);
    char v11 = 0;
    if (v9) {
      BOOL v12 = Status == kCFStreamStatusOpen;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      id v13 = (id)[objc_allocWithZone((Class)a1) _initWithOutput:v8];
      [v13 encodeObject:rootObject forKey:@"root"];
      [v13 finishEncoding];
      CFStreamStatus v14 = CFWriteStreamGetStatus(v8);
      CFWriteStreamClose(v8);
      if (v14 == kCFStreamStatusError) {
        char v11 = 0;
      }
      else {
        char v11 = _NSMoveTemporaryFileToDestination(v17[0], path);
      }
    }
    _NSCleanupTemporaryDirectory(v16);
  }
  else
  {
    char v11 = 0;
  }
  return v11;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSKeyedArchiver;
  return [(NSKeyedArchiver *)&v3 description];
}

- (BOOL)_allowsValueCoding
{
  return 1;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setOutputFormat:(NSPropertyListFormat)outputFormat
{
  if (outputFormat != NSPropertyListXMLFormat_v1_0 && outputFormat != NSPropertyListBinaryFormat_v1_0)
  {
    unint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: invalid format (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), outputFormat), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  p_flags = &self->_flags;
  unint64_t v4 = atomic_load(&self->_flags);
  if (v4 != self->_pac_signature) {
    __NSPoisoned();
  }
  unsigned __int16 v5 = atomic_load(p_flags);
  atomic_store((outputFormat << 16) | (unint64_t)v5, p_flags);
  unint64_t v6 = atomic_load(&self->_flags);
  self->_unint64_t pac_signature = v6;
}

- (void)encodeObject:(id)a3
{
  if (_warnArchiverCompat == 1)
  {
    unint64_t v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v6);
  }
  unint64_t v7 = atomic_load(&self->_flags);
  if (v7 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v8 = atomic_load(&self->_flags);
  if ((v8 & 2) != 0)
  {
    char v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v11);
  }
  unint64_t genericKey = self->_genericKey;
  self->_unint64_t genericKey = genericKey + 1;
  if (genericKey > 0x27) {
    char v10 = +[NSString stringWithFormat:@"$%ld", genericKey];
  }
  else {
    char v10 = (NSString *)generic_keys[genericKey];
  }

  _encodeObject((uint64_t)self, v10, a3, 0);
}

- (void)encodeConditionalObject:(id)a3
{
  if (_warnArchiverCompat == 1)
  {
    unint64_t v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v6);
  }
  unint64_t v7 = atomic_load(&self->_flags);
  if (v7 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v8 = atomic_load(&self->_flags);
  if ((v8 & 2) != 0)
  {
    char v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v11);
  }
  unint64_t genericKey = self->_genericKey;
  self->_unint64_t genericKey = genericKey + 1;
  if (genericKey > 0x27) {
    char v10 = +[NSString stringWithFormat:@"$%ld", genericKey];
  }
  else {
    char v10 = (NSString *)generic_keys[genericKey];
  }

  _encodeObject((uint64_t)self, v10, a3, 1);
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  if (_warnArchiverCompat == 1)
  {
    char v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v8);
  }
  unint64_t v9 = atomic_load(&self->_flags);
  if (v9 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v10 = atomic_load(&self->_flags);
  if ((v10 & 2) != 0)
  {
    id v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0 reason userInfo];
    objc_exception_throw(v13);
  }
  unint64_t genericKey = self->_genericKey;
  self->_unint64_t genericKey = genericKey + 1;
  if (genericKey > 0x27) {
    BOOL v12 = +[NSString stringWithFormat:@"$%ld", genericKey];
  }
  else {
    BOOL v12 = (NSString *)generic_keys[genericKey];
  }

  _encodeBytes((uint64_t)self, (const UInt8 *)a3, a4, v12);
}

- (void)encodeValuesOfObjCTypes:(const char *)a3
{
  if (_warnArchiverCompat == 1)
  {
    unint64_t v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v6);
  }
  unint64_t v7 = atomic_load(&self->_flags);
  if (v7 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v8 = atomic_load(&self->_flags);
  if ((v8 & 2) != 0)
  {
    BOOL v12 = +[NSString stringWithFormat:@"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more", 0];
    id v13 = (void *)MEMORY[0x1E4F1CA00];
    CFStreamStatus v14 = @"NSInvalidArchiveOperationException";
LABEL_12:
    objc_exception_throw((id)[v13 exceptionWithName:v14 reason:v12 userInfo:0]);
  }
  if (!a3)
  {
    char v11 = +[NSString stringWithFormat:@"%@: null types pointer", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_11:
    BOOL v12 = v11;
    id v13 = (void *)MEMORY[0x1E4F1CA00];
    CFStreamStatus v14 = (__CFString *)*MEMORY[0x1E4F1C3C8];
    goto LABEL_12;
  }
  uint64_t v15 = &v16;
  if (*a3)
  {
    while (1)
    {
      unint64_t v9 = v15++;
      if (!*v9) {
        break;
      }
      -[NSKeyedArchiver encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", a3);
      if (!*(unsigned __int8 *)++a3) {
        return;
      }
    }
    char v11 = +[NSString stringWithFormat:@"%@: null address pointer", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_11;
  }
}

- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5
{
  if (_warnArchiverCompat == 1)
  {
    char v10 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v10);
  }
  unint64_t v11 = atomic_load(&self->_flags);
  if (v11 != self->_pac_signature) {
    __NSPoisoned();
  }
  char v12 = atomic_load(&self->_flags);
  if ((v12 & 2) != 0)
  {
    uint64_t v16 = +[NSString stringWithFormat:@"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"];
    CFTypeID v17 = (void *)MEMORY[0x1E4F1CA00];
    v18 = @"NSInvalidArchiveOperationException";
    goto LABEL_19;
  }
  if (!a3 || !a5)
  {
    objc_super v20 = _NSMethodExceptionProem((objc_class *)self, a2);
    CFTypeRef v19 = @"%@: null type or address pointer";
LABEL_17:
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v20, v21);
    goto LABEL_18;
  }
  if (!a4)
  {
    objc_super v20 = _NSMethodExceptionProem((objc_class *)self, a2);
    CFTypeRef v19 = @"%@: count is zero";
    goto LABEL_17;
  }
  int v13 = *(unsigned __int8 *)a3;
  if (v13 == 40 || v13 == 123 || v13 == 91)
  {
    uint64_t v15 = +[NSString stringWithFormat:@"%@: unsupported type \"%s\" for array encoding", _NSMethodExceptionProem((objc_class *)self, a2), a3];
LABEL_18:
    uint64_t v16 = v15;
    CFTypeID v17 = (void *)MEMORY[0x1E4F1CA00];
    v18 = (__CFString *)*MEMORY[0x1E4F1C3C8];
LABEL_19:
    objc_exception_throw((id)[v17 exceptionWithName:v18 reason:v16 userInfo:0]);
  }
  CFStreamStatus v14 = (void *)[objc_allocWithZone((Class)_NSKeyedCoderOldStyleArray) initWithObjCType:*a3 count:a4 at:a5];
  [(NSKeyedArchiver *)self encodeObject:v14];
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