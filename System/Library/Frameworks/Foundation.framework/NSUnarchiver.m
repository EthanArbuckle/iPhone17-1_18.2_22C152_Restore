@interface NSUnarchiver
+ (NSString)classNameDecodedForArchiveClassName:(NSString *)inArchiveName;
+ (id)unarchiveObjectWithData:(NSData *)data;
+ (id)unarchiveObjectWithFile:(NSString *)path;
+ (void)decodeClassName:(NSString *)inArchiveName asClassName:(NSString *)trueName;
+ (void)initialize;
- (BOOL)isAtEnd;
- (NSString)classNameDecodedForArchiveClassName:(NSString *)inArchiveName;
- (NSUnarchiver)initForReadingWithData:(NSData *)data;
- (NSZone)objectZone;
- (id)data;
- (id)decodeDataObject;
- (id)decodeObject;
- (int64_t)versionForClassName:(id)a3;
- (unsigned)systemVersion;
- (void)_setAllowedClasses:(id)a3;
- (void)dealloc;
- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5;
- (void)decodeBytesWithReturnedLength:(unint64_t *)a3;
- (void)decodeClassName:(NSString *)inArchiveName asClassName:(NSString *)trueName;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4;
- (void)decodeValuesOfObjCTypes:(const char *)a3;
- (void)replaceObject:(id)object withObject:(id)newObject;
- (void)setObjectZone:(NSZone *)zone;
@end

@implementation NSUnarchiver

- (void)decodeBytesWithReturnedLength:(unint64_t *)a3
{
  if (self->streamerVersion > 3)
  {
    v5 = _decodeReusedCStringUsingTable((uint64_t)self->datax, (unint64_t *)self->stringTable, &self->cursor, self->swap != 0);
    checkExpected((uint64_t)v5, "+");
  }
  datax = self->datax;
  p_cursor = &self->cursor;
  BOOL v8 = self->swap != 0;
  uint64_t v9 = _decodeCharAtCursor(datax[1], datax[2], &self->cursor);
  int v10 = _decodeIntStartingWithChar((uint64_t)datax, v9, &self->cursor, v8);
  uint64_t v11 = v10;
  *a3 = v10;
  if (v10 < 0) {
    goto LABEL_35;
  }
  v12 = self->datax;
  unint64_t v13 = v12[1];
  int64_t v14 = *p_cursor;
  BOOL v15 = !__CFADD__(*p_cursor, v13) || v14 <= 0;
  BOOL v16 = !v15;
  if (v14 == 0x8000000000000000) {
    goto LABEL_35;
  }
  if (v16) {
    goto LABEL_35;
  }
  uint64_t v17 = v12[2];
  if (v14 < 0 && v13 < -v14) {
    goto LABEL_35;
  }
  if (!v17
    || ((result = (void *)(v14 + v13), -v17 < v13) ? (BOOL v19 = v17 == 1) : (BOOL v19 = 1),
        (unint64_t v20 = v17 - 1 + v13, v19) ? (v21 = (unint64_t)result >= v13) : (v21 = 0),
        v21 ? (BOOL v22 = v20 >= (unint64_t)result) : (BOOL v22 = 0),
        !v22
     || v11
     && (v11 != 1 && (unint64_t)result > -v11
      || ((v23 = (char *)result + v11 - 1, (unint64_t)v23 >= v13)
        ? (BOOL v24 = v20 >= (unint64_t)v23)
        : (BOOL v24 = 0),
          !v24))))
  {
LABEL_35:
    v25 = +[NSString stringWithFormat:@"*** End of archive encountered prematurely at %ld", *p_cursor];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSArchiverArchiveInconsistency" reason:v25 userInfo:0]);
  }
  unint64_t *p_cursor = v14 + v11;
  return result;
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  v7 = _decodeReusedCStringUsingTable((uint64_t)self->datax, (unint64_t *)self->stringTable, &self->cursor, self->swap != 0);
  checkExpected((uint64_t)v7, (char *)a3);
  char v8 = *_decodeValueOfObjCType((uint64_t)self, (char *)a3, (NSUInteger *)a4);
  if (v8) {
    typeDescriptorError(v8, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
  }
}

- (int64_t)versionForClassName:(id)a3
{
  v6[1] = *(const void **)MEMORY[0x1E4F143B8];
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    CFDictionaryRef classVersions = (const __CFDictionary *)self->classVersions;
    if (classVersions)
    {
      v6[0] = 0;
      if (CFDictionaryGetValueIfPresent(classVersions, a3, v6)) {
        return (int64_t)v6[0];
      }
      else {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return result;
}

- (id)decodeObject
{
  if (self->streamerVersion >= 4)
  {
    v3 = _decodeReusedCStringUsingTable((uint64_t)self->datax, (unint64_t *)self->stringTable, &self->cursor, self->swap != 0);
    checkExpected((uint64_t)v3, "@");
  }

  return (id)_decodeObject_old((uint64_t)self);
}

- (void)decodeValuesOfObjCTypes:(const char *)a3
{
  v5 = _decodeReusedCStringUsingTable((uint64_t)self->datax, (unint64_t *)self->stringTable, &self->cursor, self->swap != 0);
  checkExpected((uint64_t)v5, (char *)a3);
  for (i = (NSUInteger **)&v8; *a3; a3 = _decodeValueOfObjCType((uint64_t)self, (char *)a3, *v6))
    v6 = i++;
}

- (id)decodeDataObject
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  [(NSCoder *)self decodeValueOfObjCType:"i" at:&v6 size:4];
  if (v6 < 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSArchiverArchiveInconsistency" reason:@"attempt to decode NSData bytes with a negative byte count" userInfo:0]);
  }
  v3 = (void *)[MEMORY[0x1E4F1CA58] allocWithZone:self->objectZone];
  v4 = (void *)[v3 initWithLength:v6];
  -[NSUnarchiver decodeArrayOfObjCType:count:at:](self, "decodeArrayOfObjCType:count:at:", "c", v6, [v4 mutableBytes]);
  return v4;
}

- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5
{
  sizep[1] = *MEMORY[0x1E4F143B8];
  size_t v9 = strlen(a3);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)sizep - ((v10 + 30) & 0xFFFFFFFFFFFFFFF0);
  snprintf(v11, v12, "[%lu%s]", a4, a3);
  unint64_t v13 = _decodeReusedCStringUsingTable((uint64_t)self->datax, (unint64_t *)self->stringTable, &self->cursor, self->swap != 0);
  checkExpected((uint64_t)v13, v11);
  if (*a3 == 99 && (int64_t v14 = a3 + 1, !a3[1]))
  {
    _deserializeBytes(a5, *((void *)self->datax + 1), *((void *)self->datax + 2), &self->cursor, a4);
  }
  else
  {
    sizep[0] = 0;
    size_t v15 = strlen(a3);
    size_t v16 = v15 + 3;
    MEMORY[0x1F4188790](v15);
    v18 = (char *)sizep - ((v17 + 18) & 0xFFFFFFFFFFFFFFF0);
    BOOL v19 = (char *)a3;
    if (*a3)
    {
      BOOL v19 = (char *)a3;
      if (*a3 != 123)
      {
        BOOL v19 = (char *)a3;
        if (a3[1])
        {
          strlcpy((char *)sizep - ((v17 + 18) & 0xFFFFFFFFFFFFFFF0), "{", v16);
          strlcat(v18, a3, v16);
          strlcat(v18, "}", v16);
          BOOL v19 = v18;
        }
      }
    }
    int64_t v14 = NSGetSizeAndAlignment(v19, sizep, 0);
    if (a4)
    {
      NSUInteger v20 = 0;
      do
      {
        if (v20 > 0x7FFFFFFFFFFFFFFFLL / sizep[0])
        {
          BOOL v21 = +[NSString stringWithFormat:@"*** value %lu too large (may have wrapped)", v20];
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v21 userInfo:0]);
        }
        _decodeValueOfObjCType((uint64_t)self, v19, (NSUInteger *)((char *)a5 + sizep[0] * v20++));
      }
      while (a4 != v20);
    }
  }
  if (*v14) {
    typeDescriptorError(*v14, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
  }
}

- (void)_setAllowedClasses:(id)a3
{
  id reserved = self->reserved;
  if (reserved != a3)
  {

    self->id reserved = (id)[a3 copy];
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  datax = (CFTypeRef *)self->datax;
  if (!*datax || (CFRelease(*datax), (datax = (CFTypeRef *)self->datax) != 0)) {
    free(datax);
  }
  pointerTable = self->pointerTable;
  if (pointerTable) {
    CFRelease(pointerTable);
  }
  stringTable = self->stringTable;
  if (stringTable)
  {
    if (*(void *)stringTable)
    {
      unint64_t v6 = 0;
      do
        free(*(void **)(*((void *)stringTable + 3) + 8 * v6++));
      while (v6 < *(void *)stringTable);
    }
    free(*((void **)stringTable + 3));
    free(stringTable);
  }
  id classVersions = self->classVersions;
  if (classVersions) {

  }
  allUnarchivedObjects = (uint64_t *)self->allUnarchivedObjects;
  if (allUnarchivedObjects)
  {
    uint64_t v9 = *allUnarchivedObjects;
    uint64_t v10 = (id *)allUnarchivedObjects[2];
    if (*allUnarchivedObjects)
    {
      do
      {
        uint64_t v11 = v9 - 1;

        uint64_t v9 = v11;
      }
      while (v11);
    }
    free(v10);
    free(self->allUnarchivedObjects);
  }
  v12.receiver = self;
  v12.super_class = (Class)NSUnarchiver;
  [(NSUnarchiver *)&v12 dealloc];
}

- (NSUnarchiver)initForReadingWithData:(NSData *)data
{
  v3 = self;
  if (!data)
  {

    v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    v28 = @"*** -initForReadingWithData: nil argument";
LABEL_31:
    objc_exception_throw((id)[v26 exceptionWithName:v27 reason:v28 userInfo:0]);
  }
  v5 = malloc_type_malloc(0x18uLL, 0x1070040B3A6EEE0uLL);
  v3->uint64_t datax = v5;
  if (!v5)
  {
LABEL_29:
    v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C4A0];
    v28 = @"*** memory allocation failed";
    goto LABEL_31;
  }
  unint64_t v6 = v5;
  void *v5 = CFRetain(data);
  v6[1] = CFDataGetBytePtr((CFDataRef)data);
  CFIndex Length = CFDataGetLength((CFDataRef)data);
  v6[2] = Length;
  if (Length < 13) {
    goto LABEL_18;
  }
  uint64_t v8 = v6[1];
  if (*(unsigned char *)(v8 + 1) != 11) {
    goto LABEL_18;
  }
  if (*(void *)(v8 + 2) != 0x7274736465707974 || *(void *)(v8 + 5) != 0x6D61657274736465)
  {
    uint64_t v10 = *(void *)(v8 + 2);
    uint64_t v11 = *(void *)(v8 + 5);
    if (v10 != 0x79746D6165727473 || v11 != 0x64657079746D6165) {
      goto LABEL_18;
    }
  }
  char v13 = _decodeCharAtCursor(*((void *)v3->datax + 1), *((void *)v3->datax + 2), &v3->cursor);
  v3->streamerVersion = v13;
  if ((v13 - 5) < 0xFEu) {
    goto LABEL_18;
  }
  int64_t v14 = _decodeCStringAtCursor((uint64_t)v3->datax, &v3->cursor, v3->swap != 0);
  if (!strcmp(v14, "typedstream"))
  {
    char v16 = 1;
  }
  else
  {
    if (strcmp(v14, "streamtyped"))
    {
      free(v14);
LABEL_18:

      return 0;
    }
    char v16 = 0;
  }
  v3->swap = v16;
  free(v14);
  uint64_t datax = (uint64_t)v3->datax;
  BOOL v18 = v3->swap != 0;
  uint64_t v19 = _decodeCharAtCursor(*(void *)(datax + 8), *(void *)(datax + 16), &v3->cursor);
  v3->systemVersion = (int)_decodeIntStartingWithChar(datax, v19, &v3->cursor, v18);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, &_NSUnarchiverCreatePointerTable__NSUnarchiverPointerTableValueCallbacks);
  v3->pointerTable = Mutable;
  if (!Mutable) {
    goto LABEL_28;
  }
  BOOL v21 = malloc_type_malloc(0x20uLL, 0x108004019856BD9uLL);
  if (!v21) {
    goto LABEL_29;
  }
  BOOL v22 = v21;
  *(_OWORD *)BOOL v21 = xmmword_182231440;
  v21[2] = 100;
  v23 = malloc_type_malloc(0x320uLL, 0x10040436913F5uLL);
  v22[3] = v23;
  if (!v23) {
    goto LABEL_29;
  }
  v3->stringTable = v22;
  CFMutableDictionaryRef v24 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
  v3->id classVersions = v24;
  if (!v24
    || (v3->objectZone = 0,
        v3->lastLabel = -111,
        v3->id reserved = 0,
        v25 = malloc_type_malloc(0x18uLL, 0x108004098BBCF0FuLL),
        (v3->allUnarchivedObjects = v25) == 0)
    || (_OWORD *v25 = xmmword_182231450, (*((void *)v3->allUnarchivedObjects + 2) = NSAllocateObjectArray(0x200uLL)) == 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  return v3;
}

+ (void)initialize
{
  if (NSUnarchiver == a1)
  {
    +[NSUnarchiver decodeClassName:@"NSAbsoluteURL" asClassName:@"NSURL"];
    +[NSUnarchiver decodeClassName:@"NSLocalTimeZone" asClassName:@"__NSLocalTimeZone"];
  }
}

+ (void)decodeClassName:(NSString *)inArchiveName asClassName:(NSString *)trueName
{
  CFMutableDictionaryRef Mutable = (__CFDictionary *)decodingMap;
  if (!decodingMap)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    decodingMap = (uint64_t)Mutable;
    if (!Mutable) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"*** memory allocation failed" userInfo:0]);
    }
  }

  CFDictionarySetValue(Mutable, inArchiveName, trueName);
}

- (void)replaceObject:(id)object withObject:(id)newObject
{
  v50[129] = *MEMORY[0x1E4F143B8];
  if (object == newObject) {
    return;
  }
  MEMORY[0x1F4188790](self);
  MEMORY[0x1F4188790](v7);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v8 + 48));
  if (!Count) {
    return;
  }
  unint64_t v10 = Count;
  if (Count >> 60)
  {
    size_t v15 = +[NSString stringWithFormat:@"*** value %lu too large (may have wrapped)", Count];
    char v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3A8];
    goto LABEL_20;
  }
  if (Count >= 0x81)
  {
    uint64_t v11 = (const void **)malloc_type_malloc(8 * Count, 0x100004000313F17uLL);
    objc_super v12 = (const void **)malloc_type_malloc(8 * v10, 0x2004093837F09uLL);
  }
  else
  {
    uint64_t v11 = (const void **)v50;
    objc_super v12 = (const void **)&v18;
  }
  if (!v11 || !v12)
  {
    char v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C4A0];
    size_t v15 = (NSString *)@"*** memory allocation failed";
LABEL_20:
    objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v15, 0, (void)v18, *((void *)&v18 + 1), (void)v19, *((void *)&v19 + 1), (void)v20, *((void *)&v20 + 1), (void)v21, *((void *)&v21 + 1), (void)v22, *((void *)&v22 + 1), (void)v23, *((void *)&v23 + 1), (void)v24, *((void *)&v24 + 1),
                               (void)v25,
                               *((void *)&v25 + 1),
                               (void)v26,
                               *((void *)&v26 + 1),
                               (void)v27,
                               *((void *)&v27 + 1),
                               (void)v28,
                               *((void *)&v28 + 1),
                               (void)v29,
                               *((void *)&v29 + 1),
                               (void)v30,
                               *((void *)&v30 + 1),
                               (void)v31,
                               *((void *)&v31 + 1),
                               (void)v32,
                               *((void *)&v32 + 1),
                               (void)v33,
                               *((void *)&v33 + 1),
                               (void)v34,
                               *((void *)&v34 + 1),
                               (void)v35,
                               *((void *)&v35 + 1),
                               (void)v36,
                               *((void *)&v36 + 1),
                               (void)v37,
                               *((void *)&v37 + 1),
                               (void)v38,
                               *((void *)&v38 + 1),
                               (void)v39,
                               *((void *)&v39 + 1),
                               (void)v40,
                               *((void *)&v40 + 1),
                               (void)v41,
                               *((void *)&v41 + 1),
                               (void)v42,
                               *((void *)&v42 + 1),
                               (void)v43,
                               *((void *)&v43 + 1),
                               (void)v44,
                               *((void *)&v44 + 1),
                               (void)v45,
                               *((void *)&v45 + 1),
                               (void)v46,
                               *((void *)&v46 + 1)));
  }
  CFDictionaryGetKeysAndValues((CFDictionaryRef)self->pointerTable, v11, v12);
  for (uint64_t i = 0; i != v10; ++i)
  {
    int64_t v14 = v12[i];
    if (*(id *)v14 == object)
    {
      *(void *)int64_t v14 = newObject;
      v14[8] = 2;
    }
  }
  if (v11 != v50) {
    free(v11);
  }
  if (v12 != (const void **)&v18) {
    free(v12);
  }
}

- (void)setObjectZone:(NSZone *)zone
{
  self->objectZone = zone;
}

- (NSZone)objectZone
{
  return self->objectZone;
}

- (BOOL)isAtEnd
{
  CFIndex cursor = self->cursor;
  return cursor >= CFDataGetLength(*(CFDataRef *)self->datax);
}

- (unsigned)systemVersion
{
  return self->systemVersion;
}

- (id)data
{
  return *(id *)self->datax;
}

+ (id)unarchiveObjectWithData:(NSData *)data
{
  v3 = (void *)[objc_allocWithZone((Class)a1) initForReadingWithData:data];
  v4 = (void *)[v3 decodeObject];
  if (([v3 isAtEnd] & 1) == 0 && v4) {
    NSLog((NSString *)@"*** +[NSUnarchiver unarchiveObjectWithData:]: extra data discarded");
  }
  id v5 = v4;

  return v4;
}

+ (id)unarchiveObjectWithFile:(NSString *)path
{
  id result = (id)[MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:path];
  if (result)
  {
    return (id)[a1 unarchiveObjectWithData:result];
  }
  return result;
}

- (void)decodeClassName:(NSString *)inArchiveName asClassName:(NSString *)trueName
{
  map = self->map;
  if (!map)
  {
    map = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    self->map = map;
    if (!map) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"*** memory allocation failed" userInfo:0]);
    }
  }

  CFDictionarySetValue((CFMutableDictionaryRef)map, inArchiveName, trueName);
}

+ (NSString)classNameDecodedForArchiveClassName:(NSString *)inArchiveName
{
  if (!inArchiveName) {
    return 0;
  }
  if (!decodingMap || (id result = (NSString *)CFDictionaryGetValue((CFDictionaryRef)decodingMap, inArchiveName)) == 0)
  {
    id v5 = [(NSString *)inArchiveName copyWithZone:0];
    return (NSString *)v5;
  }
  return result;
}

- (NSString)classNameDecodedForArchiveClassName:(NSString *)inArchiveName
{
  if (!inArchiveName) {
    return 0;
  }
  CFDictionaryRef map = (const __CFDictionary *)self->map;
  if (!map || (id result = (NSString *)CFDictionaryGetValue(map, inArchiveName)) == 0)
  {
    id v6 = [(NSString *)inArchiveName copyWithZone:0];
    return (NSString *)v6;
  }
  return result;
}

@end