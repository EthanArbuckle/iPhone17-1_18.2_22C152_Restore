@interface NSString
- (BOOL)lib_skanIsVersionFidelityAware;
- (BOOL)lib_skanIsVersionMultiAware;
- (NSData)sk_sha1Hash;
- (NSNumber)lib_numberValue;
- (NSURL)tcr_url;
- (id)lib_accountDSIDValue;
- (id)lib_digestMD5;
- (id)lib_stringByAppendingPathComponents:(id)a3;
- (id)lib_stringByCopyingUTF8StringWithLength:(unint64_t)a3;
- (id)lib_stringByLimitingToLength:(unint64_t)a3 addElipsis:(BOOL)a4;
- (id)lib_stringSantiziedAndTruncatedToLength:(unint64_t)a3;
- (id)lib_volumePath;
- (unint64_t)tcr_unsignedLongLong;
@end

@implementation NSString

- (unint64_t)tcr_unsignedLongLong
{
  unint64_t v4 = 0;
  id v2 = [objc_alloc((Class)NSScanner) initWithString:self];
  [v2 scanUnsignedLongLong:&v4];

  return v4;
}

- (NSURL)tcr_url
{
  return +[NSURL URLWithString:self];
}

- (NSNumber)lib_numberValue
{
  id v3 = objc_alloc_init((Class)NSNumberFormatter);
  [v3 setNumberStyle:1];
  unint64_t v4 = [v3 numberFromString:self];

  return (NSNumber *)v4;
}

- (id)lib_accountDSIDValue
{
  unint64_t v2 = strtoull([(NSString *)self UTF8String], 0, 10);

  return +[NSNumber numberWithUnsignedLongLong:v2];
}

- (id)lib_digestMD5
{
  unint64_t v2 = [(NSString *)self dataUsingEncoding:4];
  id v3 = objc_msgSend(v2, "lib_digestMD5");

  return v3;
}

- (id)lib_stringByAppendingPathComponents:(id)a3
{
  id v4 = a3;
  v5 = self;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0;
      v12 = v5;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSString stringByAppendingPathComponent:](v12, "stringByAppendingPathComponent:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v11), (void)v14);
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();

        v11 = (char *)v11 + 1;
        v12 = v5;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)lib_stringByCopyingUTF8StringWithLength:(unint64_t)a3
{
  v5 = malloc_type_malloc(a3 + 1, 0x100004077774924uLL);
  if (v5)
  {
    v6 = v5;
    uint64_t v9 = 0;
    if (-[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v5, a3, &v9, 4, 0, 0, [(NSString *)self length], 0))
    {
      v6[v9] = 0;
      id v7 = (__CFString *)[objc_alloc((Class)NSString) initWithUTF8String:v6];
    }
    else
    {
      id v7 = &stru_10036C970;
    }
    free(v6);
  }
  else
  {
    id v7 = &stru_10036C970;
  }

  return v7;
}

- (id)lib_stringByLimitingToLength:(unint64_t)a3 addElipsis:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSString *)self length] <= a3)
  {
    uint64_t v9 = self;
  }
  else
  {
    if (v4)
    {
      id v7 = [(NSString *)self substringToIndex:a3];
      id v8 = +[NSString stringWithFormat:@"%@...", v7];

      goto LABEL_7;
    }
    uint64_t v9 = [(NSString *)self substringToIndex:a3];
  }
  id v8 = v9;
LABEL_7:

  return v8;
}

- (id)lib_stringSantiziedAndTruncatedToLength:(unint64_t)a3
{
  v5 = +[NSMutableCharacterSet alphanumericCharacterSet];
  v6 = +[NSCharacterSet characterSetWithCharactersInString:@".()-"];
  [v5 formUnionWithCharacterSet:v6];

  id v7 = [v5 invertedSet];
  id v8 = [(NSString *)self componentsSeparatedByCharactersInSet:v7];
  uint64_t v9 = [v8 componentsJoinedByString:&stru_10036C970];

  uint64_t v10 = objc_msgSend(v9, "lib_stringByLimitingToLength:addElipsis:", a3, 1);

  return v10;
}

- (id)lib_volumePath
{
  if ([(NSString *)self isAbsolutePath])
  {
    id v3 = +[NSFileManager defaultManager];
    BOOL v4 = self;
    if (![(NSString *)v4 isEqualToString:@"/"])
    {
      while (([v3 fileExistsAtPath:v4] & 1) == 0)
      {
        v5 = [(NSString *)v4 stringByDeletingLastPathComponent];

        BOOL v4 = v5;
        if ([(NSString *)v5 isEqualToString:@"/"]) {
          goto LABEL_7;
        }
      }
    }
    v5 = v4;
LABEL_7:
    bzero(&v9, 0x878uLL);
    id v7 = v5;
    if (statfs([(NSString *)v7 fileSystemRepresentation], &v9))
    {
      v6 = 0;
    }
    else
    {
      v6 = [v3 stringWithFileSystemRepresentation:v9.f_mntonname length:strlen(v9.f_mntonname)];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)lib_skanIsVersionFidelityAware
{
  return [(NSString *)self compare:@"2.2" options:64] != NSOrderedAscending;
}

- (BOOL)lib_skanIsVersionMultiAware
{
  return [(NSString *)self compare:@"3.0" options:64] != NSOrderedAscending;
}

- (NSData)sk_sha1Hash
{
  unint64_t v2 = self;
  Class v3 = sub_1000D66D4();

  return (NSData *)v3;
}

@end