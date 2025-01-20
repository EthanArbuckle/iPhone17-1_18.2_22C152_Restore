@interface QLUTIAnalyzer
+ (BOOL)isContentTypeAudioOnly:(id)a3;
+ (BOOL)isTypeAudioOnly:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)UTIForURL:(id)a3;
+ (id)contentTypeForURL:(id)a3;
+ (id)knownExtensions;
+ (id)privateContentTypeFromFileName:(id)a3;
+ (id)removeSpacesFromString:(id)a3;
- (BOOL)isAudioOnly;
- (NSString)contentType;
- (QLUTIAnalyzer)initWithCoder:(id)a3;
- (QLUTIAnalyzer)initWithContentType:(id)a3;
- (QLUTIAnalyzer)initWithURL:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation QLUTIAnalyzer

+ (id)knownExtensions
{
  v2 = (void *)knownExtensions_knownExtensions;
  if (!knownExtensions_knownExtensions)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v4 = [v3 URLForResource:@"UTIOverrides" withExtension:@"plist"];

    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4];
      v6 = (void *)knownExtensions_knownExtensions;
      knownExtensions_knownExtensions = v5;
    }
    if (!knownExtensions_knownExtensions)
    {
      knownExtensions_knownExtensions = MEMORY[0x1E4F1CC08];
    }
    v2 = (void *)knownExtensions_knownExtensions;
  }

  return v2;
}

+ (id)removeSpacesFromString:(id)a3
{
  v3 = [a3 stringByRemovingPercentEncoding];
  if (([v3 hasPrefix:@" "] & 1) != 0 || objc_msgSend(v3, "hasSuffix:", @" "))
  {
    v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" "];
    id v5 = [v3 stringByTrimmingCharactersInSet:v4];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

+ (id)UTIForURL:(id)a3
{
  v3 = [a1 contentTypeForURL:a3];
  v4 = [v3 identifier];

  return v4;
}

+ (id)contentTypeForURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [v3 startAccessingSecurityScopedResource];
  int v5 = v4;
  if (v3)
  {
    id v25 = 0;
    uint64_t v6 = *MEMORY[0x1E4F1C538];
    id v24 = 0;
    int v7 = [v3 getPromisedItemResourceValue:&v25 forKey:v6 error:&v24];
    id v8 = v25;
    id v9 = v24;
    if (v7
      && ([v8 isDynamic] & 1) == 0
      && ![v8 isEqual:*MEMORY[0x1E4F44558]])
    {
      goto LABEL_15;
    }
    v10 = [v3 pathComponents];
    if ((unint64_t)[v10 count] >= 2
      && ([v10 objectAtIndex:1],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 isEqualToString:@".vol"],
          v11,
          v12))
    {
      uint64_t v23 = 0;
      long long v22 = xmmword_1B28577D8;
      memset(v26, 0, 512);
      id v13 = v3;
      if ((getattrlist((const char *)objc_msgSend(v13, "fileSystemRepresentation", 0x100000005, 0, 0), &v22, v26, 0x30CuLL, 0x20u) & 0x80000000) == 0)
      {
        uint64_t v14 = [NSString stringWithUTF8String:(char *)v26 + SDWORD1(v26[0]) + 4];
        goto LABEL_11;
      }
      v15 = v13;
    }
    else
    {
      v15 = v3;
    }
    uint64_t v14 = [v15 lastPathComponent];
LABEL_11:
    v16 = (void *)v14;
    v17 = [(id)objc_opt_class() privateContentTypeFromFileName:v14];
    v18 = v17;
    if (v17 && ([v17 isDynamic] & 1) == 0)
    {
      id v19 = v18;

      id v8 = v19;
    }

LABEL_15:
    if (!v8 || [v8 isDynamic])
    {
      id v20 = (id)*MEMORY[0x1E4F44378];

      id v8 = v20;
    }
    if (v5) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  id v9 = 0;
  id v8 = 0;
  if (v4) {
LABEL_19:
  }
    [v3 stopAccessingSecurityScopedResource];
LABEL_20:

  return v8;
}

+ (id)privateContentTypeFromFileName:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 pathExtension];
    int v7 = [v6 lowercaseString];

    if ([v7 isEqualToString:@"zip"])
    {
      id v8 = [v5 stringByDeletingPathExtension];
      id v9 = [v8 pathExtension];
      v10 = [a1 removeSpacesFromString:v9];

      if (v10 && [v10 length])
      {
        v11 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v10 conformingToType:*MEMORY[0x1E4F44468]];
        if (v11)
        {
          id v12 = v10;

          id v13 = v11;
          int v7 = v12;
        }
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
    if ([v7 isEqualToString:@"synced"])
    {
      uint64_t v14 = [v5 stringByDeletingPathExtension];
      v15 = [v14 pathExtension];
      v16 = [a1 removeSpacesFromString:v15];

      if (v16 && [v16 length])
      {
        v17 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v16 conformingToType:*MEMORY[0x1E4F44470]];
        if (v17)
        {
          id v18 = v16;

          id v19 = v17;
          int v7 = v18;
          v11 = v19;
        }
      }
    }
    if (!v11 || [v11 isDynamic])
    {
      if (v7)
      {
        id v20 = [a1 knownExtensions];
        v21 = [v7 lowercaseString];
        long long v22 = [v20 objectForKeyedSubscript:v21];

        if (v22)
        {
          uint64_t v23 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v22];

          v11 = (void *)v23;
        }
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (QLUTIAnalyzer)initWithContentType:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLUTIAnalyzer;
  uint64_t v6 = [(QLUTIAnalyzer *)&v10 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentType, a3);
    id v8 = v7;
  }

  return v7;
}

- (QLUTIAnalyzer)initWithURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLUTIAnalyzer;
  id v5 = [(QLUTIAnalyzer *)&v10 init];
  if (v5)
  {
    uint64_t v6 = +[QLUTIAnalyzer UTIForURL:v4];
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v6;

    id v8 = v5;
  }

  return v5;
}

- (BOOL)isAudioOnly
{
  id v3 = objc_opt_class();
  contentType = self->_contentType;

  return [v3 isTypeAudioOnly:contentType];
}

+ (BOOL)isTypeAudioOnly:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
  LOBYTE(a1) = [a1 isContentTypeAudioOnly:v4];

  return (char)a1;
}

+ (BOOL)isContentTypeAudioOnly:(id)a3
{
  return [a3 conformsToType:*MEMORY[0x1E4F44330]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  contentType = self->_contentType;
  if (contentType) {
    [a3 encodeObject:contentType forKey:@"contentType"];
  }
}

- (QLUTIAnalyzer)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLUTIAnalyzer;
  id v5 = [(QLUTIAnalyzer *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v6;

    id v8 = v5;
  }

  return v5;
}

- (NSString)contentType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end