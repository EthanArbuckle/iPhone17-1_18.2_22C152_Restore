@interface SGZipFileReader
- (BOOL)seekToPath:(id)a3;
- (SGZipFileReader)initWithPath:(id)a3;
- (SGZipFileReader)initWithResourceFilename:(id)a3;
- (id)cursor;
- (id)getAllPathsWithExtension:(id)a3;
- (id)nextObject;
- (id)readCurrentFile;
- (id)readFile:(id)a3;
- (void)dealloc;
- (void)gotoCursor:(id)a3;
- (void)reset;
@end

@implementation SGZipFileReader

- (void).cxx_destruct
{
}

- (id)getAllPathsWithExtension:(id)a3
{
  id v4 = a3;
  [(SGZipFileReader *)self reset];
  v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = self;
  id v7 = [(SGZipFileReader *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "pathExtension", (void)v15);
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(SGZipFileReader *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)gotoCursor:(id)a3
{
  file = self->_file;
  id v4 = [a3 bytes];
  file[8] = v4[9];
  long long v5 = v4[5];
  long long v6 = v4[6];
  long long v7 = v4[7];
  *((void *)file + 38) = *((void *)v4 + 16);
  file[17] = v6;
  file[18] = v7;
  file[16] = v5;
  long long v8 = v4[1];
  long long v9 = v4[2];
  long long v10 = v4[4];
  file[14] = v4[3];
  file[15] = v10;
  file[12] = v8;
  file[13] = v9;
  file[11] = *v4;
  *((void *)file + 39) = *((void *)v4 + 17);
}

- (id)cursor
{
  file = self->_file;
  long long v14 = file[8];
  long long v3 = file[18];
  v11[6] = file[17];
  v11[7] = v3;
  long long v4 = file[14];
  v11[2] = file[13];
  v11[3] = v4;
  long long v5 = file[16];
  v11[4] = file[15];
  v11[5] = v5;
  long long v6 = file[12];
  v11[0] = file[11];
  v11[1] = v6;
  uint64_t v8 = *((void *)file + 38);
  uint64_t v7 = *((void *)file + 39);
  uint64_t v12 = v8;
  uint64_t v13 = v7;
  id v9 = [objc_alloc((Class)NSData) initWithBytes:v11 length:160];

  return v9;
}

- (id)nextObject
{
  BOOL haveSeenFirstFile = self->_haveSeenFirstFile;
  file = self->_file;
  if (haveSeenFirstFile)
  {
    if (unzGoToNextFile(file) == -100)
    {
      long long v6 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    unzGoToFirstFile(file);
    self->_BOOL haveSeenFirstFile = 1;
  }
  memset(v14, 0, sizeof(v14));
  uint64_t v7 = self->_file;
  uint64_t v13 = 0;
  memset(v12, 0, sizeof(v12));
  if (sub_100003EE0((uint64_t)v7, (uint64_t)v12, 0, (uint64_t)v14, 0x200uLL, 0, 0, 0, 0))
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SGZipFileReader.m" lineNumber:90 description:@"minizip fail"];
  }
  long long v6 = +[NSString stringWithCString:v14 encoding:4];
  uint64_t v8 = [v6 pathExtension];
  id v9 = [(NSMutableDictionary *)self->_cursors objectForKeyedSubscript:v6];
  if (!v9)
  {
    if (([v8 isEqualToString:@"headers"] & 1) == 0
      && ![v8 isEqualToString:@"html"])
    {
      goto LABEL_12;
    }
    id v9 = [(SGZipFileReader *)self cursor];
    [(NSMutableDictionary *)self->_cursors setObject:v9 forKeyedSubscript:v6];
  }

LABEL_12:
LABEL_13:

  return v6;
}

- (void)reset
{
  self->_BOOL haveSeenFirstFile = 0;
}

- (id)readFile:(id)a3
{
  if ([(SGZipFileReader *)self seekToPath:a3])
  {
    long long v4 = [(SGZipFileReader *)self readCurrentFile];
  }
  else
  {
    long long v4 = 0;
  }

  return v4;
}

- (BOOL)seekToPath:(id)a3
{
  id v4 = a3;
  long long v5 = [(NSMutableDictionary *)self->_cursors objectForKeyedSubscript:v4];
  if (v5)
  {
    [(SGZipFileReader *)self gotoCursor:v5];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = unzLocateFile((uint64_t)self->_file, (char *)[v4 UTF8String], 0) == 0;
  }

  return v6;
}

- (id)readCurrentFile
{
  if (unzOpenCurrentFile3((uint64_t)self->_file, 0, 0, 0, 0))
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SGZipFileReader.m" lineNumber:45 description:@"minizip fail"];
  }
  id v4 = objc_opt_new();
  long long v5 = malloc_type_malloc(0x400uLL, 0x19C3503EuLL);
  if (!v5)
  {
    BOOL v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SGZipFileReader.m" lineNumber:49 description:@"malloc fail"];
  }
  while (1)
  {
    int CurrentFile = unzReadCurrentFile((uint64_t)self->_file, (uint64_t)v5, 0x400u);
    if (CurrentFile < 1) {
      break;
    }
    [v4 appendBytes:v5 length:CurrentFile];
  }
  unzCloseCurrentFile((uint64_t)self->_file);
  free(v5);

  return v4;
}

- (void)dealloc
{
  unzClose((uint64_t)self->_file);
  v3.receiver = self;
  v3.super_class = (Class)SGZipFileReader;
  [(SGZipFileReader *)&v3 dealloc];
}

- (SGZipFileReader)initWithResourceFilename:(id)a3
{
  id v4 = a3;
  long long v5 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v6 = [v5 pathForResource:v4 ofType:@"zip"];

  uint64_t v7 = [(SGZipFileReader *)self initWithPath:v6];
  return v7;
}

- (SGZipFileReader)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SGZipFileReader;
  long long v5 = [(SGZipFileReader *)&v10 init];
  if (v5
    && (v5->_file = sub_100003410((char *)[v4 UTF8String], 0, 0),
        uint64_t v6 = objc_opt_new(),
        cursors = v5->_cursors,
        v5->_cursors = (NSMutableDictionary *)v6,
        cursors,
        !v5->_file))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = v5;
  }

  return v8;
}

@end