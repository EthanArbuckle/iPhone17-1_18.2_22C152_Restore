@interface NSMethodSignature
+ (NSMethodSignature)signatureWithObjCTypes:(const char *)types;
+ (void)initialize;
- (BOOL)_isAllObjects;
- (BOOL)_isBlock;
- (BOOL)_isHiddenStructRet;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOneway;
- (Class)_classForObjectAtArgumentIndex:(int64_t)a3;
- (NSMethodFrameArgInfo)_argInfo:(int64_t)a3;
- (NSMethodSignature)init;
- (NSUInteger)frameLength;
- (NSUInteger)methodReturnLength;
- (NSUInteger)numberOfArguments;
- (const)_cTypeString;
- (const)getArgumentTypeAtIndex:(NSUInteger)idx;
- (const)methodReturnType;
- (id)_initWithROMEntry:(const CFMethodSignatureROMEntry *)a3;
- (id)_protocolsForObjectAtArgumentIndex:(int64_t)a3;
- (id)_signatureForBlockAtArgumentIndex:(int64_t)a3;
- (id)_typeString;
- (id)debugDescription;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSMethodSignature

- (id)_protocolsForObjectAtArgumentIndex:(int64_t)a3
{
  if (a3 < -1) {
    return 0;
  }
  uint64_t v13 = v4;
  uint64_t v14 = v3;
  if ((a3 & 0x8000000000000000) == 0 && [(NSMethodSignature *)self numberOfArguments] <= a3) {
    return 0;
  }
  id result = -[NSMethodSignature _argInfo:](self, "_argInfo:", a3, v13, v14, v5, v6);
  if (!result) {
    return result;
  }
  if ((*((_WORD *)result + 17) & 0x2000) == 0) {
    return 0;
  }
  uint64_t v10 = *(void *)result;
  if (!*(void *)result) {
    return 0;
  }
  if ((*(_WORD *)(v10 + 34) & 0x2000) != 0)
  {
    uint64_t v10 = *(void *)(v10 + 8);
    if (!v10) {
      return 0;
    }
  }
  v11 = +[NSArray array];
  do
  {
    Protocol = objc_getProtocol((const char *)(v10 + 37));
    if (Protocol) {
      [(NSArray *)v11 addObject:Protocol];
    }
    uint64_t v10 = *(void *)(v10 + 8);
  }
  while (v10);
  if ([(NSArray *)v11 count]) {
    return v11;
  }
  else {
    return 0;
  }
}

- (const)_cTypeString
{
  if (((unint64_t)self & 0x8000000000000000) == 0) {
    goto LABEL_12;
  }
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)off_1ECE0A6F0;
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = v3 ^ (unint64_t)self;
  unint64_t v5 = v4 & 7;
  do
  {
    if (v5 == *((unsigned __int8 *)off_1ECE0A6E0 + v2)) {
      break;
    }
    ++v2;
  }
  while (v2 != 7);
  if ((~(_BYTE)v2 & 7) == 0 && ((v2 | v4) & 0x7F80000000000000) == 0x600000000000000)
  {
    BOOL v6 = v5 == 7;
    uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
    if (v6) {
      uint64_t v7 = 0xFFFFFFFFFFFFFLL;
    }
    p_typeString = (char **)(__CFGetSignatureROMEntryAtIndex(v7 & (v4 >> 3)) + 1);
  }
  else
  {
LABEL_12:
    p_typeString = &self->_typeString;
  }
  return *p_typeString;
}

- (BOOL)_isAllObjects
{
  return ((unint64_t)_getFlags((uint64_t)self) >> 1) & 1;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    FrameDescriptor = (uint64_t *)_getFrameDescriptor((uint64_t)self);
    BOOL v6 = (uint64_t *)_getFrameDescriptor((uint64_t)a3);
    int v7 = __NSMS6(*FrameDescriptor, *v6);
    if (v7)
    {
      uint64_t v8 = FrameDescriptor[1];
      uint64_t v9 = v6[1];
      LOBYTE(v7) = __NSMS6(v8, v9);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (NSUInteger)methodReturnLength
{
  uint64_t v2 = [(NSMethodSignature *)self _argInfo:-1];
  if ((*((_WORD *)v2 + 17) & 0x80) != 0) {
    uint64_t v2 = v2->var0;
  }
  return v2->var2;
}

- (const)getArgumentTypeAtIndex:(NSUInteger)idx
{
  uint64_t FrameDescriptor = _getFrameDescriptor((uint64_t)self);
  if (*(unsigned int *)(FrameDescriptor + 16) <= idx)
  {
    uint64_t v9 = FrameDescriptor;
    uint64_t v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: index (%lu) out of bounds [0, %ld]", v10, idx, *(unsigned int *)(v9 + 16) - 1);
    v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
    objc_exception_throw(v12);
  }
  int v7 = [(NSMethodSignature *)self _argInfo:idx];
  if ((*((_WORD *)v7 + 17) & 0x80) != 0) {
    int v7 = v7->var0;
  }
  return v7->var25;
}

- (Class)_classForObjectAtArgumentIndex:(int64_t)a3
{
  if (a3 < -1
    || (a3 & 0x8000000000000000) == 0 && [(NSMethodSignature *)self numberOfArguments] <= a3)
  {
    return 0;
  }
  unint64_t v5 = [(NSMethodSignature *)self _argInfo:a3];
  if (!v5) {
    return 0;
  }
  if ((*((_WORD *)v5 + 17) & 0x2000) == 0) {
    return 0;
  }
  var0 = v5->var0;
  if (!v5->var0 || (*((_WORD *)var0 + 17) & 0x2000) == 0) {
    return 0;
  }

  return objc_getClass(var0->var25);
}

- (NSUInteger)frameLength
{
  return *(unsigned int *)(_getFrameDescriptor((uint64_t)self) + 20);
}

- (NSMethodFrameArgInfo)_argInfo:(int64_t)a3
{
  uint64_t FrameDescriptor = (NSMethodFrameArgInfo **)_getFrameDescriptor((uint64_t)self);
  if (a3 == -1) {
    return *FrameDescriptor;
  }
  id result = FrameDescriptor[1];
  if (a3 >= 1)
  {
    unint64_t v6 = a3 + 1;
    do
    {
      id result = result->var1;
      --v6;
    }
    while (v6 > 1);
  }
  return result;
}

- (NSUInteger)numberOfArguments
{
  return *(unsigned int *)(_getFrameDescriptor((uint64_t)self) + 16);
}

- (const)methodReturnType
{
  uint64_t v2 = [(NSMethodSignature *)self _argInfo:-1];
  if ((*((_WORD *)v2 + 17) & 0x80) != 0) {
    uint64_t v2 = v2->var0;
  }
  return v2->var25;
}

- (id)_typeString
{
  v14[1] = *(void *)off_1ECE0A5B0;
  uint64_t FrameDescriptor = _getFrameDescriptor((uint64_t)self);
  uint64_t v3 = *(const char **)FrameDescriptor;
  if ((*(_WORD *)(*(void *)FrameDescriptor + 34) & 0x80) != 0) {
    uint64_t v3 = *(const char **)v3;
  }
  unint64_t v4 = v3 + 37;
  size_t v5 = strlen(v3 + 37);
  for (i = *(const char **)(FrameDescriptor + 8); i; i = (const char *)*((void *)i + 1))
  {
    int v7 = i;
    if ((*((_WORD *)i + 17) & 0x80) != 0) {
      int v7 = *(const char **)i;
    }
    v5 += strlen(v7 + 37);
  }
  size_t v8 = v5 + 1;
  if (v8 < 0x401)
  {
    if (v8)
    {
      uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v9, v8);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = (char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  }
  strlcpy(v9, v4, v8);
  while (1)
  {
    uint64_t FrameDescriptor = *(void *)(FrameDescriptor + 8);
    if (!FrameDescriptor) {
      break;
    }
    uint64_t v10 = FrameDescriptor;
    if ((*(_WORD *)(FrameDescriptor + 34) & 0x80) != 0) {
      uint64_t v10 = *(void *)FrameDescriptor;
    }
    strlcat(v9, (const char *)(v10 + 37), v8);
  }
  CFStringRef v11 = CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, 0x8000100u);
  v12 = (void *)_CFAutoreleasePoolAddObject(0, (uint64_t)v11);
  if (v8 >= 0x401) {
    free(v9);
  }
  return v12;
}

- (void)dealloc
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if ((self->_flags & 4) == 0)
  {
    frameDescriptor = self->_frameDescriptor;
    if (frameDescriptor)
    {
      __NSMethodFrameArgInfoDestroy(&frameDescriptor->var0->var0);
      __NSMethodFrameArgInfoDestroy(&self->_frameDescriptor->var1->var0);
      free(self->_frameDescriptor);
    }
    if (self->_typeString)
    {
      strlen(self->_typeString);
      if ((_dyld_is_memory_immutable() & 1) == 0) {
        free(self->_typeString);
      }
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSMethodSignature;
  [(NSMethodSignature *)&v4 dealloc];
}

- (id)_signatureForBlockAtArgumentIndex:(int64_t)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  id result = [(NSMethodSignature *)self _argInfo:a3];
  if (result)
  {
    if ((~*((unsigned __int16 *)result + 17) & 0xA000) != 0 || !*(void *)result)
    {
      return 0;
    }
    else
    {
      size_t v4 = strnlen((const char *)result + 37, 0x400uLL);
      id result = 0;
      if (v4 >= 7 && v4 != 1024)
      {
        size_t v5 = v4 - 4;
        __strncpy_chk();
        v6[v5] = 0;
        return +[NSMethodSignature signatureWithObjCTypes:v6];
      }
    }
  }
  return result;
}

+ (NSMethodSignature)signatureWithObjCTypes:(const char *)types
{
  uint64_t v54 = *(void *)off_1ECE0A5B0;
  if (!types) {
    return 0;
  }
  size_t v5 = strlen(types);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = __CFSearchSignatureROM((unsigned __int8 *)types, v5);
  if (v6 != -1)
  {
    unint64_t Value = (8 * (v6 & 0xFFFFFFFFFFFFFLL)) | 0x8600000000000007;
    unint64_t v8 = *(void *)off_1ECE0A6F0 ^ Value;
    if ((~v8 & 0xC000000000000007) != 0) {
      return (NSMethodSignature *)(v8 & 0xFFFFFFFFFFFFFFF8 | *((unsigned __int8 *)off_1ECE0A6E0 + (v8 & 7)));
    }
    return (NSMethodSignature *)Value;
  }
  if (!signatureWithObjCTypes__cache)
  {
    *(_OWORD *)keyCallBacks = xmmword_1ECE10248;
    *(_OWORD *)&keyCallBacks[16] = *(_OWORD *)&off_1ECE10258;
    *(_OWORD *)&keyCallBacks[32] = xmmword_1ECE10268;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, (const CFDictionaryKeyCallBacks *)keyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v11 = 0;
    atomic_compare_exchange_strong(&signatureWithObjCTypes__cache, (unint64_t *)&v11, (unint64_t)Mutable);
    if (v11) {
      CFRelease(Mutable);
    }
  }
  os_unfair_lock_lock_with_options();
  unint64_t Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)signatureWithObjCTypes__cache, types);
  os_unfair_lock_unlock((os_unfair_lock_t)&signatureWithObjCTypes__lock);
  if (!Value)
  {
    if (_os_feature_enabled_impl())
    {
      v12 = _CFMethodSignatureROMLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)keyCallBacks = 136315138;
        *(void *)&keyCallBacks[4] = types;
        _os_log_impl(&dword_182B90000, v12, OS_LOG_TYPE_DEFAULT, "MISS: %s", keyCallBacks, 0xCu);
      }
    }
    v36 = types;
    uint64_t v53 = 0;
    long long v52 = 0u;
    long long v51 = 0u;
    long long v50 = 0u;
    long long v49 = 0u;
    long long v48 = 0u;
    long long v47 = 0u;
    long long v46 = 0u;
    long long v45 = 0u;
    long long v44 = 0u;
    long long v43 = 0u;
    long long v42 = 0u;
    long long v41 = 0u;
    memset(&keyCallBacks[24], 0, 32);
    uint64_t v13 = malloc_type_calloc(1uLL, 0x18uLL, 0x102004062D53EE8uLL);
    uint64_t v14 = parseFrameArgumentInfo((uint64_t *)&v36, 0, 0, 0);
    uint64_t v15 = (uint64_t)v14;
    *(void *)uint64_t v13 = v14;
    if (!v14)
    {
      CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"+[NSMethodSignature signatureWithObjCTypes:]: unsupported type encoding spec '%s'", types);
      v33 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0];
      objc_exception_throw(v33);
    }
    *(_OWORD *)keyCallBacks = xmmword_182EDD440;
    *(void *)&keyCallBacks[16] = 224;
    int v16 = *((unsigned __int8 *)v14 + 36);
    uint64_t v17 = (v16 - 35);
    if (v17 <= 0x31)
    {
      if (((1 << (v16 - 35)) & 0x34241A0800081) != 0) {
        goto LABEL_25;
      }
      if (v17 == 33)
      {
LABEL_49:
        v14[3] = 0x5000000010;
        __int16 v28 = -2048;
LABEL_51:
        *((_WORD *)v14 + 16) = v28;
        goto LABEL_26;
      }
    }
    if ((v16 - 105) > 0x12) {
      goto LABEL_24;
    }
    if (((1 << (v16 - 105)) & 0xD09) == 0)
    {
      if (v16 == 123)
      {
        v39 = 0;
        char v38 = 0;
        if (__NSMFAIsHFA_arm64((uint64_t)v14, &v38, (unint64_t *)&v39))
        {
          uint64_t v37 = 0;
          __NSMFASetRegisterOffsetsForHFA_arm64(v15, 80, &v37);
        }
        else if (*(_DWORD *)(v15 + 16) < 0x11u)
        {
          copyMemStateToFrameState(v15);
        }
        else
        {
          size_t v29 = strlen((const char *)(v15 + 37));
          v30 = malloc_type_calloc(1uLL, v29 + 42, 0xDC283349uLL);
          *(void *)v30 = v15;
          v30[1] = xmmword_182EDD450;
          *((_WORD *)v30 + 17) |= 0x1082u;
          *((_WORD *)v30 + 18) = 24158;
          size_t v31 = strlen((const char *)(v15 + 37));
          memmove((char *)v30 + 38, (const void *)(v15 + 37), v31 + 1);
          copyMemStateToFrameState(*(void *)v15);
          *(void *)uint64_t v13 = v30;
        }
        goto LABEL_26;
      }
LABEL_24:
      switch(*((unsigned char *)v14 + 36))
      {
        case '[':
          CFStringRef v34 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"+[NSMethodSignature signatureWithObjCTypes:]: unsupported return type encoding spec '%s'", (char *)v14 + 37);
          v35 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v34) userInfo:0];
          objc_exception_throw(v35);
        case '^':
        case 'c':
          break;
        case 'd':
          goto LABEL_49;
        case 'f':
          v14[3] = 0x5000000010;
          __int16 v28 = -3072;
          goto LABEL_51;
        default:
          goto LABEL_26;
      }
    }
LABEL_25:
    v14[3] = 8;
    *((unsigned char *)v14 + 32) = 0;
    *((unsigned char *)v14 + 33) = *((unsigned char *)v14 + 16) - 8;
LABEL_26:
    if (*v36)
    {
      v18 = 0;
      do
      {
        v39 = parseFrameArgumentInfo((uint64_t *)&v36, 0, 0, 0);
        if (!v39) {
          break;
        }
        ++v13[4];
        v13[5] = computeReturnFrameExtent((uint64_t *)&v39, (uint64_t *)keyCallBacks);
        v19 = v39;
        if (!*((void *)v13 + 1)) {
          *((void *)v13 + 1) = v39;
        }
        if (v18) {
          v18[1] = (uint64_t)v19;
        }
        v18 = v19;
      }
      while (*v36);
    }
    v20 = objc_alloc((Class)a1);
    v20[1] = v13;
    char is_memory_immutable = _dyld_is_memory_immutable();
    v22 = (void *)types;
    if ((is_memory_immutable & 1) == 0) {
      v22 = strdup(types);
    }
    v20[2] = v22;
    unsigned int v23 = v13[4];
    if (v23)
    {
      uint64_t v24 = *(void *)(*((void *)v13 + 1) + 8);
      if (v23 == 1 || *(unsigned char *)(v24 + 36) != 58)
      {
        unsigned int v25 = 1;
      }
      else
      {
        uint64_t v24 = *(void *)(v24 + 8);
        unsigned int v25 = 2;
      }
      BOOL v26 = v23 >= v25;
      unsigned int v27 = v23 - v25;
      if (v27 != 0 && v26)
      {
        while ((*(_WORD *)(v24 + 34) & 0x2000) != 0)
        {
          uint64_t v24 = *(void *)(v24 + 8);
          if (!--v27) {
            goto LABEL_45;
          }
        }
      }
      else
      {
LABEL_45:
        v20[3] |= 2uLL;
      }
    }
    os_unfair_lock_lock_with_options();
    unint64_t Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)signatureWithObjCTypes__cache, types);
    if (!Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)signatureWithObjCTypes__cache, types, v20);
      unint64_t Value = (unint64_t)v20;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&signatureWithObjCTypes__lock);
  }
  return (NSMethodSignature *)Value;
}

+ (void)initialize
{
  if (NSMethodSignature == a1 && *(void *)off_1ECE0A6E8 != 0) {
    _objc_registerTaggedPointerClass();
  }
}

- (id)_initWithROMEntry:(const CFMethodSignatureROMEntry *)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  v6.receiver = self;
  v6.super_class = (Class)NSMethodSignature;
  id result = [(NSMethodSignature *)&v6 init];
  if (result)
  {
    *((void *)result + 1) = a3->var0;
    unint64_t var2 = a3->var2;
    *((void *)result + 2) = a3->var1;
    *((void *)result + 3) = var2;
  }
  return result;
}

- (NSMethodSignature)init
{
  return 0;
}

- (BOOL)isOneway
{
  return ((unsigned __int16)[(NSMethodSignature *)self _argInfo:-1][34] >> 5) & 1;
}

- (BOOL)_isHiddenStructRet
{
  return ((unsigned __int16)[(NSMethodSignature *)self _argInfo:-1][34] >> 6) & 1;
}

- (BOOL)_isBlock
{
  return (int64_t)[(NSMethodSignature *)self numberOfArguments] >= 1
      && (__int16)[(NSMethodSignature *)self _argInfo:0][34] < 0;
}

- (unint64_t)hash
{
  uint64_t FrameDescriptor = (void **)_getFrameDescriptor((uint64_t)self);
  uint64_t v3 = __NSMS5(*FrameDescriptor);
  return (unint64_t)v3 + (void)__NSMS5(FrameDescriptor[1]);
}

- (id)debugDescription
{
  uint64_t v12 = *(void *)off_1ECE0A5B0;
  uint64_t FrameDescriptor = _getFrameDescriptor((uint64_t)self);
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  v11.receiver = self;
  v11.super_class = (Class)NSMethodSignature;
  id v5 = [&v11 description];
  if ((*(_WORD *)(*(void *)FrameDescriptor + 34) & 0x40) != 0) {
    objc_super v6 = "YES";
  }
  else {
    objc_super v6 = "NO";
  }
  [(__CFString *)Mutable appendFormat:@"%@\n    number of arguments = %d\n    frame size = %d\n    is special struct return? %s\n", v5, *(unsigned int *)(FrameDescriptor + 16), *(unsigned int *)(FrameDescriptor + 20), v6];
  [(__CFString *)Mutable appendFormat:@"    return value: -------- -------- -------- --------\n"];
  uint64_t v7 = *(uint64_t **)FrameDescriptor;
  if ((*(_WORD *)(*(void *)FrameDescriptor + 34) & 0x80) != 0) {
    uint64_t v7 = (uint64_t *)*v7;
  }
  __NSMS7(Mutable, v7, 2);
  unint64_t v8 = *(uint64_t **)(FrameDescriptor + 8);
  if (v8)
  {
    uint64_t v9 = 0;
    do
    {
      [(__CFString *)Mutable appendFormat:@"    argument %ld: -------- -------- -------- --------\n", v9];
      __NSMS7(Mutable, v8, 2);
      ++v9;
      unint64_t v8 = (uint64_t *)v8[1];
    }
    while (v8);
  }
  return Mutable;
}

@end