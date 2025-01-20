@interface _KSFileEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithSerialisedDataAtURL:(id)a3;
- (NSMutableDictionary)extendedAttributes;
- (NSString)name;
- (_KSFileEntry)initWithCoder:(id)a3;
- (_KSFileEntry)initWithName:(id)a3;
- (id)description;
- (id)serialiseToTemporaryFile;
- (id)temporaryFileNameForType:(id)a3;
- (unint64_t)addBlobToFile:(id)a3;
- (void)consistencyCheck;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadAttributesFromURL:(id)a3;
- (void)performOnEverything:(id)a3;
- (void)restoreToPath:(id)a3;
- (void)saveAttributesToURL:(id)a3;
@end

@implementation _KSFileEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)entryWithSerialisedDataAtURL:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:1 error:0];
  unint64_t v5 = [v4 length];
  v6 = (void *)MEMORY[0x263EFF498];
  if (v5 <= 0xF) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Input file '%@' smaller than minimum header size (size %lu, minimum %lu)", v3, objc_msgSend(v4, "length"), 16 format];
  }
  id v7 = v4;
  v8 = (unsigned int *)[v7 bytes];
  uint64_t v9 = *v8;
  if (v9) {
    [MEMORY[0x263EFF940] raise:*v6, @"Input file '%@' incorrect version (contains %i, expected %i)", v3, v9, 0 format];
  }
  uint64_t v10 = *((void *)v8 + 1);
  if (v10 + 16 > (unint64_t)[v7 length]) {
    [MEMORY[0x263EFF940] raise:*v6, @"Input file '%@' too short to contain serialised directory (size %lu, expected %lu)", v3, objc_msgSend(v7, "length"), v10 + 16 format];
  }
  v11 = objc_msgSend(v7, "subdataWithRange:", 16, v10);
  id v22 = 0;
  v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v22];
  id v13 = v22;
  if (v13)
  {
    v14 = KSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[_KSFileEntry entryWithSerialisedDataAtURL:](v13, v14);
    }
  }
  if (!v12) {
    [MEMORY[0x263EFF940] raise:*v6, @"Input file '%@' didn't deserialise directory", v3 format];
  }
  uint64_t v15 = *((void *)v8 + 1);
  unint64_t v16 = [v7 length];
  if (v16 > [v7 length]) {
    [MEMORY[0x263EFF940] raise:*v6, @"Input file '%@' missing padding (size %lu, expected %lu)", v3, objc_msgSend(v7, "length"), v16 format];
  }
  v17 = objc_msgSend(v7, "subdataWithRange:", ((v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v16 - (((v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 16));
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __45___KSFileEntry_entryWithSerialisedDataAtURL___block_invoke;
  v20[3] = &unk_264891418;
  id v21 = v17;
  id v18 = v17;
  [v12 performOnEverything:v20];
  [v12 consistencyCheck];

  return v12;
}

- (id)serialiseToTemporaryFile
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(_KSFileEntry *)self temporaryFileNameForType:@"UserWordStore"];
  ssize_t v4 = open((const char *)[v3 fileSystemRepresentation], 1573, 384);
  if ((v4 & 0x80000000) != 0)
  {
    id v18 = 0;
  }
  else
  {
    ssize_t v5 = v4;
    v6 = [MEMORY[0x263EFF980] array];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __40___KSFileEntry_serialiseToTemporaryFile__block_invoke;
    v25[3] = &unk_264891418;
    id v7 = v6;
    id v26 = v7;
    [(_KSFileEntry *)self performOnEverything:v25];
    v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    [(_KSFileEntry *)self performOnEverything:&__block_literal_global_4];
    __buf[0] = 0;
    __buf[1] = [v8 length];
    write(v5, __buf, 0x10uLL);
    id v9 = v8;
    write(v5, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    WritePadding(v5, [v9 length]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          unint64_t v16 = (void *)MEMORY[0x230F44DF0]();
          id v17 = [v15 contents];
          write(v5, (const void *)[v17 bytes], objc_msgSend(v17, "length"));
          WritePadding(v5, [v17 length]);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v27 count:16];
      }
      while (v12);
    }

    close(v5);
    id v18 = v3;
  }
  return v18;
}

- (id)temporaryFileNameForType:(id)a3
{
  id v4 = a3;
  ssize_t v5 = +[_KSUserWordsSynchroniser generateKeyWithSize:10];
  v6 = +[_KSUserWordsSynchroniser generateRecordNameForFilename:v4 withKey:v5];
  id v7 = [v4 stringByAppendingFormat:@".%@", v6];

  v8 = NSURL;
  id v9 = NSTemporaryDirectory();
  id v10 = [v9 stringByAppendingPathComponent:v7];
  uint64_t v11 = [v8 fileURLWithPath:v10];

  tempFiles = self->_tempFiles;
  uint64_t v13 = NSString;
  id v14 = v11;
  uint64_t v15 = objc_msgSend(v13, "stringWithUTF8String:", objc_msgSend(v14, "fileSystemRepresentation"));
  [(NSMutableArray *)tempFiles addObject:v15];

  return v14;
}

- (_KSFileEntry)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_KSFileEntry;
  v6 = [(_KSFileEntry *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    extendedAttributes = v7->_extendedAttributes;
    v7->_extendedAttributes = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (_KSFileEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_KSFileEntry;
  id v5 = [(_KSFileEntry *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = objc_opt_class();
    id v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"eattr"];
    uint64_t v10 = [v9 mutableCopy];
    extendedAttributes = v5->_extendedAttributes;
    v5->_extendedAttributes = (NSMutableDictionary *)v10;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_tempFiles;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        unlink((const char *)[*(id *)(*((void *)&v9 + 1) + 8 * v7++) UTF8String]);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_KSFileEntry;
  [(_KSFileEntry *)&v8 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_extendedAttributes forKey:@"eattr"];
}

- (unint64_t)addBlobToFile:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_fileArray;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "size", (void)v12) + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  [(NSMutableArray *)self->_fileArray addObject:v4];
  return v8;
}

- (void)performOnEverything:(id)a3
{
}

- (void)loadAttributesFromURL:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (const char *)[v4 fileSystemRepresentation];
  v32 = [MEMORY[0x263EFF9A0] dictionary];
  ssize_t v6 = listxattr(v5, 0, 0, 0);
  if (v6 == -1)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF498];
    uint64_t v9 = *__error();
    long long v10 = __error();
    [v7 raise:v8, @"Unable to find size of extended attributes for '%@': %i: %s", v4, v9, strerror(*v10) format];
  }
  long long v11 = (char *)malloc_type_malloc(v6, 0x491080D4uLL);
  if (!v11) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Unable to allocate memory for extended attributes for '%@' (%zi bytes)", v4, v6 format];
  }
  ssize_t v12 = listxattr(v5, v11, v6, 0);
  long long v13 = (void *)v12;
  v31 = v4;
  if (v12)
  {
    if (v12 == -1)
    {
      free(v11);
      long long v14 = (void *)MEMORY[0x263EFF940];
      uint64_t v15 = *MEMORY[0x263EFF498];
      uint64_t v16 = *__error();
      uint64_t v17 = __error();
      [v14 raise:v15, @"Unable to load extended attributes for '%@': %i: %s", v4, v16, strerror(*v17), v4 format];
    }
    id v18 = (void *)[[NSString alloc] initWithBytes:v11 length:v13 encoding:4];
    long long v13 = [v18 componentsSeparatedByString:&stru_26DE8B790];
  }
  free(v11);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = v13;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (([v24 isEqualToString:&stru_26DE8B7B0] & 1) == 0)
        {
          id v25 = v24;
          ssize_t v26 = getxattr(v5, (const char *)[v25 UTF8String], 0, 0, 0, 0);
          v27 = malloc_type_malloc(v26, 0x7AAA60C7uLL);
          id v28 = v25;
          getxattr(v5, (const char *)[v28 UTF8String], v27, v26, 0, 0);
          v29 = [MEMORY[0x263EFF8F8] dataWithBytes:v27 length:v26];
          [(NSMutableDictionary *)v32 setValue:v29 forKey:v28];

          free(v27);
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v21);
  }

  extendedAttributes = self->_extendedAttributes;
  self->_extendedAttributes = v32;
}

- (void)saveAttributesToURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (const char *)[a3 fileSystemRepresentation];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_extendedAttributes;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = -[NSMutableDictionary objectForKey:](self->_extendedAttributes, "objectForKey:", v10, (void)v14);
        ssize_t v12 = (const char *)[v10 UTF8String];
        id v13 = v11;
        setxattr(v4, v12, (const void *)[v13 bytes], objc_msgSend(v13, "length"), 0, 0);
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_KSFileEntry;
  id v4 = [(_KSFileEntry *)&v7 description];
  objc_msgSend(v3, "stringWithFormat:", @"<%@; \"%@\" (extended attributes %@)>",
    v4,
    self->_name,
  id v5 = self->_extendedAttributes);

  return v5;
}

- (void)consistencyCheck
{
  if (!self->_name) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ missing name", self format];
  }
  if (!self->_extendedAttributes) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ missing extended attributes", self format];
  }
}

- (void)restoreToPath:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSMutableDictionary)extendedAttributes
{
  return self->_extendedAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileBlob, 0);
  objc_storeStrong((id *)&self->_fileArray, 0);
  objc_storeStrong((id *)&self->_tempFiles, 0);
  objc_storeStrong((id *)&self->_extendedAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)entryWithSerialisedDataAtURL:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 description];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_22B2BC000, a2, OS_LOG_TYPE_ERROR, "%s  couldn't decode data: %@", (uint8_t *)v4, 0x16u);
}

@end