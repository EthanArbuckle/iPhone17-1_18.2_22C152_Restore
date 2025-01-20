@interface NSArchiver
+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path;
+ (NSData)archivedDataWithRootObject:(id)rootObject;
+ (id)classNameEncodedForTrueClassName:(id)a3;
+ (void)encodeClassName:(id)a3 intoClassName:(id)a4;
+ (void)initialize;
- (NSArchiver)initForWritingWithMutableData:(NSMutableData *)mdata;
- (NSMutableData)archiverData;
- (NSString)classNameEncodedForTrueClassName:(NSString *)trueName;
- (id)data;
- (int64_t)versionForClassName:(id)a3;
- (void)dealloc;
- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5;
- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)encodeClassName:(NSString *)trueName intoClassName:(NSString *)inArchiveName;
- (void)encodeConditionalObject:(id)object;
- (void)encodeDataObject:(id)a3;
- (void)encodeObject:(id)a3;
- (void)encodeRootObject:(id)rootObject;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
- (void)encodeValuesOfObjCTypes:(const char *)a3;
- (void)replaceObject:(id)object withObject:(id)newObject;
@end

@implementation NSArchiver

+ (void)initialize
{
  if (NSArchiver == a1)
  {
    +[NSArchiver encodeClassName:@"__NSLocalTimeZone" intoClassName:@"NSLocalTimeZone"];
    +[NSArchiver encodeClassName:@"__NSLocalTimeZoneI" intoClassName:@"NSLocalTimeZone"];
  }
}

- (NSArchiver)initForWritingWithMutableData:(NSMutableData *)mdata
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFDictionaryKeyCallBacks v8 = *(CFDictionaryKeyCallBacks *)byte_1ECA5BFB8;
  if (!mdata)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"*** -initForWritingWithMutableData: nil argument", 0, *(_OWORD *)&v8.version, *(_OWORD *)&v8.release, *(_OWORD *)&v8.equal));
  }
  self->mdata = mdata;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
  self->stringTable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &v8, 0);
  self->pointerTable = CFDictionaryCreateMutable(v4, 0, 0, 0);
  v5 = self->mdata;
  LOBYTE(v9) = 4;
  objc_msgSend(v5, "appendBytes:length:", &v9, 1, *(_OWORD *)&v8.version, *(_OWORD *)&v8.release, *(_OWORD *)&v8.equal);
  _encodeCString(self->mdata, "streamtyped");
  v6 = self->mdata;
  __int16 v9 = 1000;
  char v10 = -127;
  [v6 appendBytes:&v10 length:1];
  [v6 appendBytes:&v9 length:2];
  return self;
}

- (NSMutableData)archiverData
{
  return (NSMutableData *)self->mdata;
}

- (id)data
{
  return self->mdata;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];

  replacementTable = self->replacementTable;
  if (replacementTable) {
    CFRelease(replacementTable);
  }
  pointerTable = self->pointerTable;
  if (pointerTable) {
    CFRelease(pointerTable);
  }
  stringTable = self->stringTable;
  if (stringTable) {
    CFRelease(stringTable);
  }
  ids = self->ids;
  if (ids) {
    CFRelease(ids);
  }
  map = self->map;
  if (map) {
    CFRelease(map);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSArchiver;
  [(NSArchiver *)&v8 dealloc];
}

- (void)replaceObject:(id)object withObject:(id)newObject
{
  replacementTable = self->replacementTable;
  if (!replacementTable)
  {
    replacementTable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0, 0);
    self->replacementTable = replacementTable;
  }
  objc_super v8 = (const void *)[newObject replacementObjectForArchiver:self];

  CFDictionarySetValue((CFMutableDictionaryRef)replacementTable, object, v8);
}

+ (void)encodeClassName:(id)a3 intoClassName:(id)a4
{
  Mutable = (__CFDictionary *)encodingMap;
  if (!encodingMap)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    encodingMap = (uint64_t)Mutable;
  }

  CFDictionarySetValue(Mutable, a3, a4);
}

+ (id)classNameEncodedForTrueClassName:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (!encodingMap || (id result = (id)CFDictionaryGetValue((CFDictionaryRef)encodingMap, a3)) == 0)
  {
    v5 = (void *)[a3 copyWithZone:0];
    return v5;
  }
  return result;
}

- (int64_t)versionForClassName:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v3 = NSClassFromString((NSString *)a3);
  if (v3) {
    return class_getVersion(v3);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  mdata = self->mdata;
  if (mdata) {
    _encodeOrReuseCString(mdata, (char *)a3, (CFDictionaryRef)self->stringTable);
  }
  char v8 = *_encodeValueOfObjCType((uint64_t)self, (char *)a3, (SEL *)a4);
  if (v8) {
    typeDescriptorError(v8, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
  }
}

- (void)encodeValuesOfObjCTypes:(const char *)a3
{
  v3 = (char *)a3;
  mdata = self->mdata;
  if (mdata) {
    _encodeOrReuseCString(mdata, (char *)a3, (CFDictionaryRef)self->stringTable);
  }
  for (i = (SEL **)&v8; *v3; v3 = _encodeValueOfObjCType((uint64_t)self, v3, *v6))
    v6 = i++;
}

- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5
{
  sizep[1] = *MEMORY[0x1E4F143B8];
  size_t v9 = strlen(a3);
  if (self->mdata)
  {
    size_t v10 = v9 + 15;
    if (v9 + 15 < 0x201)
    {
      if (v9 == -15)
      {
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = (char *)sizep - ((v9 + 30) & 0xFFFFFFFFFFFFFFF0);
        bzero(v11, v10);
      }
    }
    else
    {
      uint64_t v11 = (char *)malloc_type_malloc(v9 + 15, 0x100004077774924uLL);
    }
    snprintf(v11, v10, "[%lu%s]", a4, a3);
    _encodeOrReuseCString(self->mdata, v11, (CFDictionaryRef)self->stringTable);
    if (v10 >= 0x201) {
      free(v11);
    }
  }
  int v12 = *(unsigned __int8 *)a3;
  if (v12 == 99 && (v13 = a3 + 1, !a3[1]))
  {
    [self->mdata appendBytes:a5 length:a4];
  }
  else
  {
    sizep[0] = 0;
    size_t v14 = strlen(a3);
    size_t v15 = v14 + 3;
    if (v14 + 3 < 0x201)
    {
      if (v14 == -3)
      {
        v16 = 0;
      }
      else
      {
        v16 = (char *)sizep - ((v14 + 18) & 0xFFFFFFFFFFFFFFF0);
        bzero(v16, v15);
      }
    }
    else
    {
      v16 = (char *)malloc_type_malloc(v14 + 3, 0x100004077774924uLL);
      int v12 = *(unsigned __int8 *)a3;
    }
    v17 = (char *)a3;
    if (v12)
    {
      v17 = (char *)a3;
      if (v12 != 123)
      {
        v17 = (char *)a3;
        if (a3[1])
        {
          strlcpy(v16, "{", v15);
          strlcat(v16, a3, v15);
          strlcat(v16, "}", v15);
          v17 = v16;
        }
      }
    }
    v13 = NSGetSizeAndAlignment(v17, sizep, 0);
    if (a4)
    {
      uint64_t v18 = 0;
      do
        _encodeValueOfObjCType((uint64_t)self, v17, (SEL *)((char *)a5 + sizep[0] * v18++));
      while (a4 != v18);
    }
    if (v15 >= 0x201) {
      free(v16);
    }
  }
  if (*v13) {
    typeDescriptorError(*v13, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
  }
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  mdata = self->mdata;
  if (mdata)
  {
    _encodeOrReuseCString(mdata, "+", (CFDictionaryRef)self->stringTable);
    _encodeInt(self->mdata, a4);
    uint64_t v8 = self->mdata;
    [v8 appendBytes:a3 length:a4];
  }
}

- (void)encodeObject:(id)a3
{
  mdata = self->mdata;
  if (mdata) {
    _encodeOrReuseCString(mdata, "@", (CFDictionaryRef)self->stringTable);
  }

  _encodeObject_old((uint64_t)self, a3);
}

- (void)encodeDataObject:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [a3 length];
  if (v6 >> 31)
  {
    v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: data length (%qd) makes data too large to fit in non-keyed archive", _NSMethodExceptionProem((objc_class *)self, a2), v6), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  int v8 = v6;
  [(NSArchiver *)self encodeValueOfObjCType:"i" at:&v8];
  -[NSArchiver encodeArrayOfObjCType:count:at:](self, "encodeArrayOfObjCType:count:at:", "c", v8, [a3 bytes]);
}

- (void)encodeRootObject:(id)rootObject
{
  mdata = self->mdata;
  if (!mdata)
  {
    v7 = +[NSString stringWithFormat:@"*** -encodeRootObject: already done for %p", rootObject];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v7 userInfo:0]);
  }
  if (!self->ids)
  {
    self->ids = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0);
    mdata = self->mdata;
  }
  id v6 = mdata;
  self->mdata = 0;
  [(NSArchiver *)self encodeObject:rootObject];
  self->mdata = v6;

  [(NSArchiver *)self encodeObject:rootObject];
}

- (void)encodeConditionalObject:(id)object
{
  if (self->mdata)
  {
    if (!self->ids)
    {
      v7 = +[NSString stringWithFormat:@"*** encodeConditionalObject: -encodeRootObject: has not been previously done for %p", object];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v7 userInfo:0]);
    }
    v5 = _replacementObjectForObject((uint64_t)self, object);
    if (v5)
    {
      if (CFSetGetValue((CFSetRef)self->ids, v5)) {
        id v6 = object;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    [(NSArchiver *)self encodeObject:v6];
  }
}

+ (NSData)archivedDataWithRootObject:(id)rootObject
{
  v5 = (NSData *)[MEMORY[0x1E4F1CA58] data];
  int v6 = _CFExecutableLinkedOnOrAfter();
  if (v6) {
    _CFAutoreleasePoolPush();
  }
  objc_msgSend((id)objc_msgSend(objc_allocWithZone((Class)a1), "initForWritingWithMutableData:", v5), "encodeRootObject:", rootObject);
  if (v6) {
    _CFAutoreleasePoolPop();
  }
  return v5;
}

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path
{
  v5 = (void *)[a1 archivedDataWithRootObject:rootObject];

  return [v5 writeToFile:path atomically:1];
}

- (void)encodeClassName:(NSString *)trueName intoClassName:(NSString *)inArchiveName
{
  map = self->map;
  if (!map)
  {
    map = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    self->map = map;
  }

  CFDictionarySetValue((CFMutableDictionaryRef)map, trueName, inArchiveName);
}

- (NSString)classNameEncodedForTrueClassName:(NSString *)trueName
{
  if (!trueName) {
    return 0;
  }
  CFDictionaryRef map = (const __CFDictionary *)self->map;
  if (!map || (id result = (NSString *)CFDictionaryGetValue(map, trueName)) == 0)
  {
    id v6 = [(NSString *)trueName copyWithZone:0];
    return (NSString *)v6;
  }
  return result;
}

@end