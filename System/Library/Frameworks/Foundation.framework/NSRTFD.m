@interface NSRTFD
+ (void)initialize;
- (BOOL)_isLink:(id)a3;
- (BOOL)isPackage;
- (NSRTFD)init;
- (NSRTFD)initWithCapacity:(unint64_t)a3;
- (NSRTFD)initWithContentsOfFile:(id)a3;
- (NSRTFD)initWithDataRepresentation:(id)a3;
- (NSRTFD)initWithDictionary:(id)a3;
- (NSRTFD)initWithDictionary:(id)a3 copyItems:(BOOL)a4;
- (NSRTFD)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (NSRTFD)initWithPasteboardDataRepresentation:(id)a3;
- (id)_getDocInfoForKey:(id)a3;
- (id)addCommon:(id)a3 docInfo:(id)a4 value:(id)a5 zone:(_NSZone *)a6;
- (id)addData:(id)a3 name:(id)a4;
- (id)addFile:(id)a3;
- (id)addLink:(id)a3;
- (id)copy;
- (id)copy:(id)a3 into:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createRandomKey:(id)a3;
- (id)createUniqueKey:(id)a3;
- (id)dataForFile:(id)a3;
- (id)dataRepresentation;
- (id)freeSerialized:(void *)a3 length:(unint64_t)a4;
- (id)getDirInfo:(BOOL)a3;
- (id)getDocument:(id)a3 docInfo:(id)a4;
- (id)initFromDocument:(id)a3 error:(unint64_t *)a4;
- (id)initFromElement:(id)a3 ofDocument:(id)a4;
- (id)keyEnumerator;
- (id)nameFromPath:(id)a3 extra:(id)a4;
- (id)objectForKey:(id)a3;
- (id)pasteboardDataRepresentation;
- (id)removeFile:(id)a3;
- (id)replaceFile:(id)a3 data:(id)a4;
- (id)replaceFile:(id)a3 path:(id)a4;
- (id)serialize:(void *)a3 length:(unint64_t *)a4;
- (id)setPackage:(BOOL)a3;
- (id)tmpNameFromPath:(id)a3;
- (id)tmpNameFromPath:(id)a3 extension:(id)a4;
- (int64_t)validatePath:(id)a3 ignore:(id)a4;
- (unint64_t)addDirNamed:(id)a3;
- (unint64_t)addFileNamed:(id)a3 fileAttributes:(id)a4;
- (unint64_t)count;
- (unint64_t)initUnixFile:(id)a3;
- (unint64_t)insertItem:(id)a3 path:(id)a4 dirInfo:(id)a5 zone:(_NSZone *)a6 plist:(id)a7;
- (unint64_t)internalSaveTo:(id)a3 removeBackup:(BOOL)a4 errorHandler:(id)a5;
- (unint64_t)internalSaveTo:(id)a3 removeBackup:(BOOL)a4 errorHandler:(id)a5 temp:(id)a6 backup:(id)a7;
- (unint64_t)internalWritePath:(id)a3 errorHandler:(id)a4 remapContents:(BOOL)a5 hardLinkPath:(id)a6;
- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7;
- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 markBusy:(BOOL)a7 hardLinkPath:(id)a8;
- (void)dealloc;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation NSRTFD

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (NSRTFD)init
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) init];
  return self;
}

- (NSRTFD)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithObjects:a3 forKeys:a4 count:a5];
  return self;
}

- (NSRTFD)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithDictionary:a3 copyItems:a4];
  return self;
}

- (NSRTFD)initWithDictionary:(id)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithDictionary:a3];
  return self;
}

- (NSRTFD)initWithContentsOfFile:(id)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:a3];
  return self;
}

- (NSRTFD)initWithCapacity:(unint64_t)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSRTFD;
  [(NSRTFD *)&v3 dealloc];
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->dict count];
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->dict objectForKey:a3];
}

- (id)keyEnumerator
{
  return (id)[(NSMutableDictionary *)self->dict keyEnumerator];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (_NSIsNSData() && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = -[NSPageData initWithData:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", [a3 zone]), "initWithData:", a3);
    [(NSMutableDictionary *)self->dict setObject:v8 forKey:a4];
  }
  else
  {
    dict = self->dict;
    [(NSMutableDictionary *)dict setObject:a3 forKey:a4];
  }
}

- (void)removeObjectForKey:(id)a3
{
}

- (BOOL)isPackage
{
  return [(NSRTFD *)self objectForKey:@".."] == 0;
}

- (id)setPackage:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSRTFD *)self isPackage] != a3)
  {
    if (v3)
    {
      [(NSRTFD *)self removeObjectForKey:@".."];
    }
    else
    {
      v5 = [+[NSData allocWithZone:[(NSRTFD *)self zone]] init];
      [(NSRTFD *)self setObject:v5 forKey:@".."];
    }
  }
  return self;
}

- (unint64_t)initUnixFile:(id)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  [(NSRTFD *)self initFromDocument:a3 error:v4];
  return v4[0];
}

- (id)initFromDocument:(id)a3 error:(unint64_t *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7 = +[NSFileManager defaultManager];
  v8 = [(NSRTFD *)self init];
  if (![a3 length]) {
    goto LABEL_8;
  }
  if (([a3 isAbsolutePath] & 1) == 0) {
    a3 = [(NSString *)[(NSFileManager *)v7 currentDirectoryPath] stringByAppendingPathComponent:a3];
  }
  char v11 = 0;
  if (![(NSFileManager *)v7 fileExistsAtPath:a3 isDirectory:&v11])
  {
LABEL_8:
    if (a4) {
      *a4 = 9;
    }
    goto LABEL_13;
  }
  if (v11)
  {
    unint64_t v9 = [(NSRTFD *)v8 addDirNamed:a3];
    if (!v9) {
      return v8;
    }
    goto LABEL_11;
  }
  unint64_t v9 = [(NSRTFD *)v8 addFileNamed:a3 fileAttributes:[(NSFileManager *)v7 fileAttributesAtPath:a3 traverseLink:1]];
  if (v9)
  {
LABEL_11:
    if (a4) {
      *a4 = v9;
    }
LABEL_13:

    return 0;
  }
  return v8;
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 markBusy:(BOOL)a7 hardLinkPath:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = [(NSRTFD *)self keyEnumerator];
  if (a4) {
    uint64_t v15 = *((unsigned __int16 *)a4 + 8);
  }
  else {
    uint64_t v15 = 511;
  }
  id v16 = [(NSRTFD *)self getDirInfo:0];
  uint64_t v31 = v15 | 0x1C0;
  if (_NXMakeDirs(a3, (v15 | 0x1C0) & ~+[NSPageData _umask]) < 0) {
    return 4;
  }
  uint64_t v29 = v15;
  if (v9)
  {
    v17 = +[NSFileManager defaultManager];
    v18 = [[NSNumber alloc] initWithBool:1];
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v18, @"NSFileBusy", 0);

    [(NSFileManager *)v17 changeFileAttributes:v19 atPath:a3];
  }
  uint64_t v20 = [v14 nextObject];
  BOOL v30 = v9;
  if (v20)
  {
    uint64_t v21 = v20;
    do
    {
      id v22 = [(NSRTFD *)self objectForKey:v21];
      if (v22)
      {
        v23 = [+[NSString allocWithZone:[(NSRTFD *)self zone]] initWithFormat:@"%@/%@", a3, v21];
        id v22 = (id)objc_msgSend(v22, "writePath:docInfo:errorHandler:remapContents:hardLinkPath:", v23, objc_msgSend(v16, "objectForKey:", v21), a5, v10, objc_msgSend(a8, "stringByAppendingPathComponent:", v21));
      }
      uint64_t v24 = [v14 nextObject];
      if (!v24) {
        break;
      }
      uint64_t v21 = v24;
    }
    while (!v22);
  }
  else
  {
    id v22 = 0;
  }
  if (v31 != v29) {
    _NXChmodFile((uint64_t)a3, v29 & ~+[NSPageData _umask]);
  }
  if (v30)
  {
    v25 = +[NSFileManager defaultManager];
    v26 = [[NSNumber alloc] initWithBool:0];
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v26, @"NSFileBusy", 0);

    [(NSFileManager *)v25 changeFileAttributes:v27 atPath:a3];
  }
  return (unint64_t)v22;
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7
{
  return [(NSRTFD *)self writePath:a3 docInfo:a4 errorHandler:a5 remapContents:a6 markBusy:0 hardLinkPath:a7];
}

- (unint64_t)internalWritePath:(id)a3 errorHandler:(id)a4 remapContents:(BOOL)a5 hardLinkPath:(id)a6
{
  BOOL v7 = a5;
  BOOL v11 = [(NSRTFD *)self isPackage];
  if ([+[NSFileManager defaultManager] fileExistsAtPath:a3])
  {
    return 8;
  }
  if (v11)
  {
    return [(NSRTFD *)self writePath:a3 docInfo:0 errorHandler:a4 remapContents:v7 markBusy:1 hardLinkPath:a6];
  }
  else
  {
    id v13 = [(NSRTFD *)self objectForKey:@".."];
    uint64_t v14 = objc_msgSend(-[NSRTFD getDirInfo:](self, "getDirInfo:", 0), "objectForKey:", @"..");
    if (v13)
    {
      return [v13 writePath:a3 docInfo:v14 errorHandler:a4 remapContents:v7 hardLinkPath:0];
    }
    else
    {
      return 12;
    }
  }
}

- (unint64_t)internalSaveTo:(id)a3 removeBackup:(BOOL)a4 errorHandler:(id)a5 temp:(id)a6 backup:(id)a7
{
  BOOL v10 = a4;
  id v13 = +[NSFileManager defaultManager];
  BOOL v14 = [(NSFileManager *)v13 fileExistsAtPath:a3];
  BOOL v15 = [(NSFileManager *)v13 isWritableFileAtPath:a3];
  BOOL v16 = [(NSFileManager *)v13 isDeletableFileAtPath:a3];
  if (v14) {
    id v17 = a3;
  }
  else {
    id v17 = 0;
  }
  if (!v14 || v15) {
    goto LABEL_9;
  }
  if (!v16) {
    return 11;
  }
  id v17 = a3;
  if (![a5 attemptOverwrite:a3]) {
    return 1;
  }
LABEL_9:
  if ([(NSFileManager *)v13 fileExistsAtPath:a6] && _NXRemoveDocument((uint64_t)a6) < 0) {
    return 7;
  }
  unint64_t v18 = [(NSRTFD *)self internalWritePath:a6 errorHandler:a5 remapContents:v10 hardLinkPath:v17];
  if (v18)
  {
    a7 = a6;
LABEL_12:
    _NXRemoveDocument((uint64_t)a7);
    return v18;
  }
  if (_NXRemoveDocument((uint64_t)a7) < 0) {
    return 6;
  }
  if (v14 && _NXRenameFile((uint64_t)a3, (uint64_t)a7) < 0) {
    return 5;
  }
  uint64_t v20 = _NXRenameFile((uint64_t)a6, (uint64_t)a3);
  if (v20 < 0) {
    unint64_t result = 5;
  }
  else {
    unint64_t result = 0;
  }
  if ((v20 & 0x8000000000000000) == 0 && v10) {
    goto LABEL_12;
  }
  return result;
}

- (id)nameFromPath:(id)a3 extra:(id)a4
{
  return (id)[a3 stringByAppendingString:a4];
}

- (id)tmpNameFromPath:(id)a3 extension:(id)a4
{
  v5 = objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend(@".", "stringByAppendingString:", -[NSProcessInfo globallyUniqueString](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "globallyUniqueString")));

  return (id)[v5 stringByAppendingPathExtension:a4];
}

- (id)tmpNameFromPath:(id)a3
{
  return [(NSRTFD *)self tmpNameFromPath:a3 extension:@"tmp"];
}

- (unint64_t)internalSaveTo:(id)a3 removeBackup:(BOOL)a4 errorHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = [(NSRTFD *)self tmpNameFromPath:a3 extension:@"tmp"];
  if (v6) {
    id v10 = [(NSRTFD *)self tmpNameFromPath:a3 extension:@"bak"];
  }
  else {
    id v10 = [(NSRTFD *)self nameFromPath:a3 extra:@"~"];
  }

  return [(NSRTFD *)self internalSaveTo:a3 removeBackup:v6 errorHandler:a5 temp:v9 backup:v10];
}

- (id)dataRepresentation
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSRTFD *)self zone];
  uint64_t v4 = [+[NSAKSerializerStream allocWithZone:v3] init];
  v11[0] = 1684436082;
  [(NSAKSerializerStream *)v4 writeData:v11 length:8];
  id v5 = [(NSAKSerializer *)+[NSDocumentSerializer allocWithZone:v3] initForSerializerStream:v4];
  uint64_t v6 = [v5 serializeObject:self];
  uint64_t v7 = v6 + 8;
  id v8 = objc_allocWithZone(MEMORY[0x1E4F1CA58]);
  id v9 = (void *)[v8 initWithLength:(v6 + *MEMORY[0x1E4F14B00] + 7) & -*MEMORY[0x1E4F14B00]];
  -[NSAKSerializerStream copySerializationInto:](v4, "copySerializationInto:", [v9 mutableBytes]);
  [v9 setLength:v7];

  return v9;
}

- (NSRTFD)initWithDataRepresentation:(id)a3
{
  unint64_t v5 = [a3 length];
  unint64_t v6 = v5 - 8;
  if (v5 < 8)
  {
    NSLog((NSString *)@"Unable to read RTFD from data:%p", a3);
LABEL_3:

    return 0;
  }
  id v8 = (_DWORD *)[a3 bytes];
  if (*v8 ^ 0x64667472 | *((unsigned __int8 *)v8 + 4))
  {
    id v9 = self;
    id v10 = a3;
  }
  else
  {
    if (v8[1])
    {
      NSLog((NSString *)@"Bad version in RTFD data:%p", a3);
      goto LABEL_3;
    }
    id v10 = (id)objc_msgSend(a3, "subdataWithRange:", 8, v6);
    id v9 = self;
  }

  return [(NSRTFD *)v9 initWithPasteboardDataRepresentation:v10];
}

- (id)createRandomKey:(id)a3
{
  uint64_t v5 = [(NSRTFD *)self zone];
  if (![(NSRTFD *)self objectForKey:a3]) {
    return a3;
  }
  while (1)
  {
    uint64_t v6 = mach_absolute_time();
    uint64_t v7 = [a3 significantText];
    id v9 = -[NSString initWithFormat:](+[NSString allocWithZone:](NSString, "allocWithZone:", v5), "initWithFormat:", @"%d_%@", v6, objc_msgSend(a3, "substringWithRange:", v7, v8));
    if (![(NSRTFD *)self objectForKey:v9]) {
      break;
    }
  }

  return v9;
}

- (id)createUniqueKey:(id)a3
{
  do
    id v5 = [(NSRTFD *)self createRandomKey:a3];
  while ([(NSRTFD *)self objectForKey:+[NSString stringWithFormat:@"%@.tiff", v5]]);
  return v5;
}

- (id)getDocument:(id)a3 docInfo:(id)a4
{
  uint64_t v6 = [(NSRTFD *)self zone];
  __int16 v7 = *((_WORD *)a4 + 9);
  if (v7) {
    return [+[NSRTFD allocWithZone:v6] initFromDocument:a3 error:0];
  }
  else {
    return (id)newLeafDocument((uint64_t)a3, v7, v6);
  }
}

- (id)replaceFile:(id)a3 data:(id)a4
{
  uint64_t v6 = [+[NSData allocWithZone:[(NSRTFD *)self zone]] initWithData:a4];
  [(NSRTFD *)self setObject:v6 forKey:a3];

  return self;
}

- (id)replaceFile:(id)a3 path:(id)a4
{
  uint64_t v6 = self;
  uint64_t v7 = [(NSRTFD *)self zone];
  id v8 = [(NSRTFD *)v6 getDirInfo:1];
  id v9 = (void *)[v8 objectForKey:a3];
  id v10 = [+[NSFileManager defaultManager] fileAttributesAtPath:a4 traverseLink:0];
  if (!v10) {
    return 0;
  }
  if (!v9)
  {
    id v13 = [+[NSDocInfo allocWithZone:v7] initWithFileAttributes:v10];
    uint64_t v14 = [(NSRTFD *)v6 getDocument:a4 docInfo:v13];
    if (!v14)
    {

      return v6;
    }
    uint64_t v12 = (void *)v14;
    [(NSRTFD *)v6 setObject:v14 forKey:a3];
    [v8 setObject:v13 forKey:a3];

    goto LABEL_8;
  }
  [v9 setFileAttributes:v10];
  uint64_t v11 = [(NSRTFD *)v6 getDocument:a4 docInfo:v9];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    [(NSRTFD *)v6 setObject:v11 forKey:a3];
LABEL_8:
  }
  return v6;
}

- (id)addCommon:(id)a3 docInfo:(id)a4 value:(id)a5 zone:(_NSZone *)a6
{
  id v10 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 1, a4, a5, a6);
  id v11 = -[NSRTFD uniqueKey:](self, "uniqueKey:", [a3 lastPathComponent]);
  [(NSRTFD *)self setObject:a5 forKey:v11];
  if (a4) {
    [v10 setObject:a4 forKey:v11];
  }
  return v11;
}

- (id)_getDocInfoForKey:(id)a3
{
  id v4 = [(NSRTFD *)self getDirInfo:0];

  return (id)[v4 objectForKey:a3];
}

- (id)addFile:(id)a3
{
  uint64_t v5 = [(NSRTFD *)self zone];
  uint64_t v6 = [+[NSFileManager defaultManager] fileAttributesAtPath:a3 traverseLink:0];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = [+[NSDocInfo allocWithZone:v5] initWithFileAttributes:v6];
  id v8 = [(NSRTFD *)self getDocument:a3 docInfo:v7];
  if (v8)
  {
    id v9 = v8;
    id v10 = [(NSRTFD *)self addCommon:a3 docInfo:v7 value:v8 zone:v5];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)addLink:(id)a3
{
  uint64_t v5 = [(NSRTFD *)self zone];
  id result = [+[NSFileManager defaultManager] fileAttributesAtPath:a3 traverseLink:1];
  if (result)
  {
    uint64_t v7 = [+[NSDocInfo allocWithZone:v5] initWithFileAttributes:result];
    *(&v7->mode + 1) |= 4u;
    id v8 = -[NSPageData initWithData:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", v5), "initWithData:", [a3 dataUsingEncoding:4 allowLossyConversion:1]);
    id v9 = [(NSRTFD *)self addCommon:a3 docInfo:v7 value:v8 zone:v5];

    return v9;
  }
  return result;
}

- (id)dataForFile:(id)a3
{
  id v5 = -[NSRTFD objectForKey:](self, "objectForKey:");
  if (!v5) {
    return v5;
  }
  uint64_t v6 = objc_msgSend(-[NSRTFD getDirInfo:](self, "getDirInfo:", 0), "objectForKey:", a3);
  if (!v6 || (*(_WORD *)(v6 + 18) & 4) == 0) {
    return v5;
  }
  id v8 = (id)[objc_allocWithZone((Class)NSString) initWithData:v5 encoding:4];
  id v9 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v9 dataWithContentsOfFile:v8];
}

- (id)removeFile:(id)a3
{
  id v5 = [(NSRTFD *)self getDirInfo:0];
  [(NSRTFD *)self removeObjectForKey:a3];
  [v5 removeObjectForKey:a3];
  return self;
}

- (id)copy:(id)a3 into:(id)a4
{
  uint64_t v7 = [a4 zone];
  id v8 = [(NSRTFD *)self getDirInfo:0];
  id v9 = (void *)[a4 uniqueKey:a3];
  id v10 = objc_msgSend(-[NSRTFD objectForKey:](self, "objectForKey:", a3), "copyWithZone:", v7);
  [a4 setObject:v10 forKey:v9];

  uint64_t v11 = [v8 objectForKey:v9];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    id v13 = (void *)[a4 getDirInfo:1];
    uint64_t v14 = (void *)[v12 copyWithZone:v7];
    [v13 setObject:v14 forKey:v9];
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSRTFD *)self getDirInfo:0];
  id v7 = [(NSRTFD *)self keyEnumerator];
  id v8 = 0;
  while (1)
  {
    uint64_t v9 = [v7 nextObject];
    if (!v9) {
      break;
    }
    id v10 = (void *)v9;
    id v11 = [(NSRTFD *)self objectForKey:v9];
    if (([v10 isEqual:@"."] & 1) == 0)
    {
      if (v6)
      {
        uint64_t v12 = [v6 objectForKey:v10];
        if (v12)
        {
          id v13 = (void *)v12;
          if (!v8) {
            id v8 = (void *)[v5 getDirInfo:1];
          }
          uint64_t v14 = (void *)[v13 copyWithZone:a3];
          [v8 setObject:v14 forKey:v10];
        }
      }
      BOOL v15 = (void *)[v11 copyWithZone:a3];
      [v5 setObject:v15 forKey:v10];
    }
  }
  return v5;
}

- (id)copy
{
  return [(NSRTFD *)self copyWithZone:0];
}

- (id)addData:(id)a3 name:(id)a4
{
  id v6 = [+[NSData allocWithZone:[(NSRTFD *)self zone]] initWithData:a3];
  id v7 = -[NSRTFD uniqueKey:](self, "uniqueKey:", [a4 lastPathComponent]);
  [(NSRTFD *)self setObject:v6 forKey:v7];

  return v7;
}

- (int64_t)validatePath:(id)a3 ignore:(id)a4
{
  uint64_t v7 = [(NSRTFD *)self zone];
  id v8 = [(NSRTFD *)self keyEnumerator];
  id v9 = [(NSRTFD *)self getDirInfo:0];
  if (!v9) {
    return 0;
  }
  id v10 = v9;
  uint64_t v11 = [v8 nextObject];
  if (!v11) {
    return 0;
  }
  uint64_t v12 = v11;
  uint64_t v26 = v7;
  id v13 = 0;
  uint64_t v14 = __SCR_NSNotification;
  do
  {
    if (-[NSRTFD objectForKey:](self, "objectForKey:", v12) && ![a4 objectForKey:v12])
    {
      BOOL v15 = v14;
      BOOL v16 = (void *)[objc_allocWithZone((Class)v14[89]) initWithFormat:@"%@/%@", a3, v12];
      uint64_t v17 = [v10 objectForKey:v12];
      if (v17)
      {
        uint64_t v18 = v17;
        v19 = [+[NSFileManager defaultManager] fileAttributesAtPath:v16 traverseLink:0];
        if (v19)
        {
          objc_msgSend(-[NSDictionary fileModificationDate](v19, "fileModificationDate"), "timeIntervalSince1970");
          if (*(void *)(v18 + 8) != (uint64_t)v20)
          {
            if (!v13) {
              id v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", v26), "init");
            }
            [v13 addObject:v12];
          }
        }
      }

      uint64_t v14 = v15;
    }
    uint64_t v12 = [v8 nextObject];
  }
  while (v12);
  if (!v13) {
    return 0;
  }
  int64_t v21 = [v13 count];
  if (v21 >= 1)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      uint64_t v23 = [v13 objectAtIndex:i];
      uint64_t v24 = (void *)[objc_allocWithZone((Class)v14[89]) initWithFormat:@"%@/%@", a3, v23];
      [(NSRTFD *)self replaceFile:v23 path:v24];
    }
  }

  return v21;
}

- (id)initFromElement:(id)a3 ofDocument:(id)a4
{
  uint64_t v7 = [(NSRTFD *)self zone];
  uint64_t v8 = [a4 objectForKey:a3];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(NSRTFD *)self init];
    uint64_t v11 = (void *)[a4 getDirInfo:0];
    if (v11)
    {
      uint64_t v12 = [v11 objectForKey:a3];
      if (v12)
      {
        id v13 = (void *)v12;
        uint64_t v14 = [+[NSDirInfo allocWithZone:v7] init];
        BOOL v15 = (void *)[v13 copyWithZone:v7];
        [(NSDirInfo *)v14 setObject:v15 forKey:@".."];
        [(NSRTFD *)v10 setObject:v14 forKey:@"."];
      }
    }
    BOOL v16 = (void *)[v9 copyWithZone:v7];
    [(NSRTFD *)v10 setObject:v16 forKey:@".."];
  }
  else
  {
    [(NSRTFD *)self dealloc];
    return 0;
  }
  return v10;
}

- (id)getDirInfo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NSRTFD *)self objectForKey:@"."];
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    id v5 = [+[NSDirInfo allocWithZone:[(NSRTFD *)self zone]] init];
    [(NSRTFD *)self setObject:v5 forKey:@"."];
  }
  return v5;
}

- (unint64_t)addFileNamed:(id)a3 fileAttributes:(id)a4
{
  uint64_t v7 = [(NSRTFD *)self zone];
  uint64_t v8 = [+[NSData allocWithZone:v7] initWithContentsOfMappedFile:a3];
  if (!v8) {
    return 10;
  }
  id v9 = v8;
  id v10 = [+[NSDirInfo allocWithZone:v7] init];
  uint64_t v11 = [+[NSDocInfo allocWithZone:v7] initWithFileAttributes:a4];
  *(&v11->mode + 1) |= 2u;
  [(NSDirInfo *)v10 setObject:v11 forKey:@".."];

  [(NSRTFD *)self setObject:v9 forKey:@".."];
  [(NSRTFD *)self setObject:v10 forKey:@"."];

  return 0;
}

- (unint64_t)insertItem:(id)a3 path:(id)a4 dirInfo:(id)a5 zone:(_NSZone *)a6 plist:(id)a7
{
  uint64_t v8 = a6;
  id v9 = a5;
  if (a5)
  {
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = [(NSRTFD *)self getDirInfo:0];
  if (!v8) {
LABEL_3:
  }
    uint64_t v8 = (_NSZone *)[(NSRTFD *)self zone];
LABEL_4:
  id v13 = [+[NSFileManager defaultManager] fileAttributesAtPath:a4 traverseLink:0];
  if (v13)
  {
    uint64_t v14 = [+[NSDocInfo allocWithZone:v8] initWithFileAttributes:v13];
    __int16 v15 = *(&v14->mode + 1);
    if (v15)
    {
      uint64_t v17 = [+[NSRTFD allocWithZone:v8] init];
      unint64_t v18 = [(NSRTFD *)v17 addDirNamed:a4];
      if (!v17)
      {
LABEL_17:

        return v18;
      }
    }
    else
    {
      uint64_t v16 = newLeafDocument((uint64_t)a4, v15, (uint64_t)v8);
      uint64_t v17 = (NSRTFD *)v16;
      if (v16) {
        unint64_t v18 = 0;
      }
      else {
        unint64_t v18 = 10;
      }
      if (!v16) {
        goto LABEL_17;
      }
    }
    if (!v18)
    {
      [a7 setObject:v17 forKey:a3];
      [v9 setObject:v14 forKey:a3];
    }
    goto LABEL_17;
  }
  return 9;
}

- (unint64_t)addDirNamed:(id)a3
{
  uint64_t v5 = [(NSRTFD *)self zone];
  BOOL v6 = [+[NSDirInfo allocWithZone:v5] init];
  uint64_t v7 = [+[NSFileManager defaultManager] directoryContentsAtPath:a3];
  if (!v7) {
    uint64_t v7 = (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  [(NSRTFD *)self setObject:v6 forKey:@"."];
  uint64_t v8 = [(NSArray *)v7 count];
  if (v8 < 1)
  {
LABEL_7:
    unint64_t v13 = 0;
  }
  else
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [(NSArray *)v7 objectAtIndex:v10];
      uint64_t v12 = (void *)[objc_allocWithZone((Class)NSString) initWithFormat:@"%@/%@", a3, v11];
      unint64_t v13 = [(NSRTFD *)self insertItem:v11 path:v12 dirInfo:v6 zone:v5 plist:self];

      if (v13) {
        break;
      }
      if (v9 == ++v10) {
        goto LABEL_7;
      }
    }
  }

  return v13;
}

- (id)serialize:(void *)a3 length:(unint64_t *)a4
{
  uint64_t v7 = [(NSRTFD *)self zone];
  uint64_t v8 = [+[NSAKSerializerStream allocWithZone:v7] init];
  id v9 = [(NSAKSerializer *)+[NSDocumentSerializer allocWithZone:v7] initForSerializerStream:v8];
  unint64_t v10 = [v9 serializeObject:self];
  *a4 = v10;
  *a3 = 0;
  uint64_t v11 = vm_allocate(*MEMORY[0x1E4F14960], (vm_address_t *)a3, v10, 1);
  if (v11) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", @"NSAppKitVirtualMemoryException", @"vm_allocate() failed in NSRTFD serialize:length:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11), @"NSErrorCodeExceptionInfo", 0)), "raise");
  }
  [(NSAKSerializerStream *)v8 copySerializationInto:*a3];

  return self;
}

- (id)freeSerialized:(void *)a3 length:(unint64_t)a4
{
  uint64_t v5 = mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)a3, a4);
  if (v5) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", @"NSAppKitVirtualMemoryException", @"vm_allocate() failed in NSRTFD freeSerialized:length:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5), @"NSErrorCodeExceptionInfo", 0)), "raise");
  }
  return self;
}

- (id)pasteboardDataRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  v6[0] = 0;
  [(NSRTFD *)self serialize:v6 length:&v5];
  BOOL v3 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:v6[0] length:v5];
  [(NSRTFD *)self freeSerialized:v6[0] length:v5];
  return v3;
}

- (NSRTFD)initWithPasteboardDataRepresentation:(id)a3
{
  uint64_t v5 = [(NSRTFD *)self zone];
  id v6 = -[NSAKDeserializerStream initFromMemoryNoCopy:length:freeWhenDone:](+[NSAKDeserializerStream allocWithZone:](NSAKDeserializerStream, "allocWithZone:", v5), "initFromMemoryNoCopy:length:freeWhenDone:", [a3 bytes], objc_msgSend(a3, "length"), 0);
  id v7 = [(NSAKDeserializer *)+[NSDocumentDeserializer allocWithZone:v5] initForDeserializerStream:v6];
  uint64_t v8 = (NSRTFD *)[v7 deserializeNewObject];

  return v8;
}

- (BOOL)_isLink:(id)a3
{
  id v4 = [(NSRTFD *)self getDirInfo:0];
  if (v4)
  {
    uint64_t v5 = [v4 objectForKey:a3];
    LOBYTE(v4) = v5 && (*(_WORD *)(v5 + 18) & 4) != 0;
  }
  return (char)v4;
}

@end