@interface PAMediaConversionServiceResourceURLCollection
+ (BOOL)getSignatureString:(id *)a3 filenameSummary:(id *)a4 forDictionaryRepresentation:(id)a5;
+ (PAMediaConversionServiceResourceURLCollection)collectionWithMainResourceURL:(id)a3;
+ (id)collectionForBookmarkDataDictionaryRepresentation:(id)a3 accessProvider:(id)a4 error:(id *)a5;
+ (id)filenameSummaryStringForDictionaryRepresentation:(id)a3;
- (BOOL)allURLsAreReadable;
- (BOOL)containsAllRoles:(id)a3;
- (BOOL)containsAnyRole:(id)a3;
- (BOOL)copyURL:(id)a3 forRole:(id)a4 toDirectory:(id)a5 error:(id *)a6;
- (BOOL)ensureFilesExistWithError:(id *)a3;
- (BOOL)isBlastDoorAccessRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeExistingEmptyFilesWithError:(id *)a3;
- (NSDictionary)blastDoorMainSourceProperties;
- (NSDictionary)blastDoorVideoComplementProperties;
- (NSError)blastDoorError;
- (NSMutableDictionary)urlReferencesByRole;
- (NSURL)blastDoorSourceURL;
- (PAMediaConversionServiceResourceURLCollection)init;
- (PAMediaConversionServiceResourceURLCollectionAccessProvider)accessProviderDelegate;
- (id)bookmarkDataDictionaryRepresentationWithError:(id *)a3;
- (id)description;
- (id)fileSizeSummary;
- (id)filenameExtensionAndPathHashForRole:(id)a3;
- (id)logMessageSummary;
- (id)logMessageSummaryWithFullPath:(BOOL)a3;
- (id)resourceURLForRole:(id)a3;
- (id)typeIdentifierForResourceURLWithRole:(id)a3;
- (id)urlForDebugDumpWithDirectoryName:(id)a3 inExistingParentDirectory:(id)a4 error:(id *)a5;
- (unint64_t)hash;
- (unint64_t)urlCount;
- (void)enumerateResourceURLReferences:(id)a3;
- (void)enumerateResourceURLs:(id)a3;
- (void)setAccessProviderDelegate:(id)a3;
- (void)setResourceURL:(id)a3 forRole:(id)a4;
- (void)setResourceURL:(id)a3 forRole:(id)a4 deleteOnDeallocation:(BOOL)a5;
- (void)setShouldDeleteURLOnDeallocation:(BOOL)a3 forRole:(id)a4;
- (void)setUrlReferencesByRole:(id)a3;
@end

@implementation PAMediaConversionServiceResourceURLCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessProviderDelegate, 0);
  objc_storeStrong((id *)&self->_urlReferencesByRole, 0);
}

- (void)setAccessProviderDelegate:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollectionAccessProvider)accessProviderDelegate
{
  return (PAMediaConversionServiceResourceURLCollectionAccessProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrlReferencesByRole:(id)a3
{
}

- (NSMutableDictionary)urlReferencesByRole
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)copyURL:(id)a3 forRole:(id)a4 toDirectory:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[NSFileManager defaultManager];
  NSFileAttributeKey v17 = NSFileOwnerAccountName;
  CFStringRef v18 = @"mobile";
  v11 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  unsigned int v12 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:0 attributes:v11 error:a6];

  unsigned __int8 v13 = 0;
  if (v12)
  {
    v14 = [v8 lastPathComponent];
    v15 = [v9 URLByAppendingPathComponent:v14];

    unsigned __int8 v13 = [v10 copyItemAtURL:v8 toURL:v15 error:a6];
  }

  return v13;
}

- (id)urlForDebugDumpWithDirectoryName:(id)a3 inExistingParentDirectory:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 541, @"Invalid parameter not satisfying: %@", @"outputDirectoryName" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v26 = +[NSAssertionHandler currentHandler];
  [v26 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 542, @"Invalid parameter not satisfying: %@", @"parentDirectoryURL" object file lineNumber description];

LABEL_3:
  unsigned int v12 = +[NSFileManager defaultManager];
  char v44 = 0;
  unsigned __int8 v13 = [v11 path];
  unsigned __int8 v14 = [v12 fileExistsAtPath:v13 isDirectory:&v44];

  if (v44) {
    unsigned __int8 v15 = v14;
  }
  else {
    unsigned __int8 v15 = 0;
  }
  if ((v15 & 1) == 0)
  {
    v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 546, @"Invalid parameter not satisfying: %@", @"exists && isDirectory" object file lineNumber description];
  }
  v16 = [v11 URLByAppendingPathComponent:v9];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100007614;
  v42 = sub_100007624;
  id v43 = 0;
  NSFileAttributeKey v45 = NSFileOwnerAccountName;
  CFStringRef v46 = @"mobile";
  NSFileAttributeKey v17 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  CFStringRef v18 = (id *)(v39 + 5);
  id obj = (id)v39[5];
  unsigned __int8 v19 = [v12 createDirectoryAtURL:v16 withIntermediateDirectories:0 attributes:v17 error:&obj];
  objc_storeStrong(v18, obj);

  if (v19) {
    goto LABEL_9;
  }
  v22 = [(id)v39[5] domain];
  if ([v22 isEqualToString:NSCocoaErrorDomain])
  {
    BOOL v23 = [(id)v39[5] code] == (id)516;

    if (v23)
    {
LABEL_9:
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      char v36 = 0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10000762C;
      v28[3] = &unk_100034E88;
      id v20 = v16;
      id v29 = v20;
      v30 = self;
      v31 = &v38;
      v32 = &v33;
      [(PAMediaConversionServiceResourceURLCollection *)self enumerateResourceURLs:v28];
      if (*((unsigned char *)v34 + 24))
      {
        id v21 = 0;
        if (a5) {
          *a5 = (id) v39[5];
        }
      }
      else
      {
        id v21 = v20;
      }

      _Block_object_dispose(&v33, 8);
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v21 = 0;
  if (a5) {
    *a5 = (id) v39[5];
  }
LABEL_20:
  _Block_object_dispose(&v38, 8);

  return v21;
}

- (unint64_t)urlCount
{
  return (unint64_t)[(NSMutableDictionary *)self->_urlReferencesByRole count];
}

- (void)enumerateResourceURLs:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007790;
  v5[3] = &unk_100034E60;
  id v6 = a3;
  id v4 = v6;
  [(PAMediaConversionServiceResourceURLCollection *)self enumerateResourceURLReferences:v5];
}

- (void)enumerateResourceURLReferences:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(NSMutableDictionary *)self->_urlReferencesByRole allKeys];
  id v6 = [v5 sortedArrayUsingComparator:&stru_100034E38];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
      unsigned int v12 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:v11];
      unsigned __int8 v13 = 0;
      v4[2](v4, v11, v12, &v13);
      LODWORD(v11) = v13;

      if (v11) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)fileSizeSummary
{
  v3 = +[NSMutableString stringWithString:@"<"];
  id v4 = +[NSMutableArray array];
  urlReferencesByRole = self->_urlReferencesByRole;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007A98;
  v9[3] = &unk_100034E18;
  id v10 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)urlReferencesByRole enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = [v6 componentsJoinedByString:@"|"];
  [v3 appendString:v7];

  [v3 appendString:@">"];
  return v3;
}

- (id)description
{
  return [(PAMediaConversionServiceResourceURLCollection *)self logMessageSummaryWithFullPath:1];
}

- (id)logMessageSummary
{
  return [(PAMediaConversionServiceResourceURLCollection *)self logMessageSummaryWithFullPath:0];
}

- (id)logMessageSummaryWithFullPath:(BOOL)a3
{
  v5 = +[NSMutableString stringWithString:@"<"];
  +[NSMutableArray array];
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_100007D40;
  unsigned int v12 = &unk_100034DF0;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v14 = a3;
  id v6 = v13;
  [(PAMediaConversionServiceResourceURLCollection *)self enumerateResourceURLs:&v9];
  id v7 = objc_msgSend(v6, "componentsJoinedByString:", @"|", v9, v10, v11, v12);
  [v5 appendString:v7];

  [v5 appendString:@">"];
  return v5;
}

- (BOOL)allURLsAreReadable
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  +[NSFileManager defaultManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007F38;
  v5[3] = &unk_100034DC8;
  id v7 = &v8;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  [(PAMediaConversionServiceResourceURLCollection *)self enumerateResourceURLs:v5];
  LOBYTE(self) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (BOOL)removeExistingEmptyFilesWithError:(id *)a3
{
  uint64_t v18 = 0;
  unsigned __int8 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100007614;
  v22 = sub_100007624;
  id v23 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v5 = +[NSFileManager defaultManager];
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008128;
  v10[3] = &unk_100034DA0;
  unsigned int v12 = &v18;
  id v13 = &v14;
  id v7 = v5;
  id v11 = v7;
  [(NSMutableDictionary *)urlReferencesByRole enumerateKeysAndObjectsUsingBlock:v10];
  int v8 = *((unsigned __int8 *)v15 + 24);
  if (a3 && *((unsigned char *)v15 + 24)) {
    *a3 = (id) v19[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8 == 0;
}

- (BOOL)ensureFilesExistWithError:(id *)a3
{
  uint64_t v18 = 0;
  unsigned __int8 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100007614;
  v22 = sub_100007624;
  id v23 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v5 = +[NSFileManager defaultManager];
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000084CC;
  v10[3] = &unk_100034DA0;
  id v7 = v5;
  id v11 = v7;
  unsigned int v12 = &v14;
  id v13 = &v18;
  [(NSMutableDictionary *)urlReferencesByRole enumerateKeysAndObjectsUsingBlock:v10];
  int v8 = *((unsigned __int8 *)v15 + 24);
  if (a3 && *((unsigned char *)v15 + 24)) {
    *a3 = (id) v19[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8 == 0;
}

- (id)filenameExtensionAndPathHashForRole:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3)
  {
    id v9 = 0;
    uint64_t v10 = 0;
    [v3 getPathHash:&v10 lastPathComponent:&v9];
    id v5 = v9;
    id v6 = [v5 pathExtension];
    id v7 = +[NSString stringWithFormat:@"%@|%lx", v6, v10];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)bookmarkDataDictionaryRepresentationWithError:(id *)a3
{
  uint64_t v18 = 0;
  unsigned __int8 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100007614;
  v22 = sub_100007624;
  id v23 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v5 = +[NSMutableDictionary dictionary];
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008A7C;
  v10[3] = &unk_100034DA0;
  unsigned int v12 = &v18;
  id v7 = v5;
  id v11 = v7;
  id v13 = &v14;
  [(NSMutableDictionary *)urlReferencesByRole enumerateKeysAndObjectsUsingBlock:v10];
  if (*((unsigned char *)v15 + 24))
  {
    id v8 = 0;
    if (a3) {
      *a3 = (id) v19[5];
    }
  }
  else
  {
    id v8 = v7;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)typeIdentifierForResourceURLWithRole:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v29 = +[NSAssertionHandler currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 305, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];
  }
  id v6 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:v5];
  id v7 = v6;
  if (!v6)
  {
    id v10 = 0;
    goto LABEL_25;
  }
  id v8 = [v6 url];
  if (!v8)
  {
    v30 = +[NSAssertionHandler currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceResourceURLCollection.m" lineNumber:313 description:@"Unexpected nil role"];
  }
  id v32 = 0;
  id v31 = 0;
  unsigned __int8 v9 = [v8 getResourceValue:&v32 forKey:NSURLTypeIdentifierKey error:&v31];
  id v10 = v32;
  id v11 = v31;
  unsigned int v12 = v11;
  if ((v9 & 1) == 0)
  {
    uint64_t v14 = [v11 domain];
    unsigned int v15 = [v14 isEqualToString:NSCocoaErrorDomain];
    char v13 = v15;
    if (v15)
    {
      id v16 = [v12 code];

      if (v16 != (id)260)
      {
        char v13 = 0;
        if (v10) {
          goto LABEL_13;
        }
        goto LABEL_21;
      }
      uint64_t v14 = [v8 lastPathComponent];
      char v17 = [v14 pathExtension];
      uint64_t v18 = +[UTType typeWithFilenameExtension:v17];
      uint64_t v19 = [v18 identifier];

      id v10 = (id)v19;
    }

    if (v10) {
      goto LABEL_13;
    }
LABEL_21:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v28 = [v8 path];
      *(_DWORD *)buf = 138543874;
      id v34 = v5;
      __int16 v35 = 2112;
      char v36 = v28;
      __int16 v37 = 2114;
      uint64_t v38 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to determine type identifier for URL with role %{public}@ %@: %{public}@", buf, 0x20u);
    }
    id v10 = 0;
    goto LABEL_24;
  }
  char v13 = 0;
LABEL_13:
  if (v10)
  {
    if ((v13 & 1) == 0)
    {
      uint64_t v20 = +[UTType typeWithIdentifier:v10];
      unsigned int v21 = [v20 conformsToType:UTTypeImage];

      if (v21)
      {
        v22 = CGImageSourceCreateWithURL((CFURLRef)v8, 0);
        if (v22)
        {
          id v23 = v22;
          v24 = CGImageSourceGetType(v22);
          v25 = v24;
          if (v24)
          {
            id v26 = v24;

            id v10 = v26;
          }
          CFRelease(v23);
        }
      }
    }
  }
LABEL_24:

LABEL_25:
  return v10;
}

- (BOOL)containsAnyRole:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    uint64_t v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 294, @"Invalid parameter not satisfying: %@", @"[roles count]" object file lineNumber description];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)containsAllRoles:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    uint64_t v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 283, @"Invalid parameter not satisfying: %@", @"[roles count]" object file lineNumber description];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (void)setShouldDeleteURLOnDeallocation:(BOOL)a3 forRole:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:");
  if (!v7)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 277, @"No URL is currently set for role %@", v9 object file lineNumber description];
  }
  [v7 setShouldDeleteOnDeallocation:v4];
}

- (id)resourceURLForRole:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 266, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];
  }
  id v6 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:v5];
  id v7 = [v6 url];

  id v8 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];

  if (v8)
  {
    id v9 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
    uint64_t v10 = [v9 validateAccessForURL:v7 role:v5];

    id v7 = (void *)v10;
  }

  return v7;
}

- (void)setResourceURL:(id)a3 forRole:(id)a4 deleteOnDeallocation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  [(PAMediaConversionServiceResourceURLCollection *)self setResourceURL:a3 forRole:v8];
  [(PAMediaConversionServiceResourceURLCollection *)self setShouldDeleteURLOnDeallocation:v5 forRole:v8];
}

- (void)setResourceURL:(id)a3 forRole:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (v13)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 251, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v11 = +[NSAssertionHandler currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 252, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];

LABEL_3:
  id v8 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:v7];

  if (v8)
  {
    BOOL v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 253, @"This resource URL collection already has a URL for role '%@'", v7 object file lineNumber description];
  }
  id v9 = +[PAMediaConversionServiceResourceURLReference referenceWithURL:v13];
  [(NSMutableDictionary *)self->_urlReferencesByRole setObject:v9 forKeyedSubscript:v7];
}

- (unint64_t)hash
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009694;
  v4[3] = &unk_100034D78;
  v4[4] = &v5;
  [(PAMediaConversionServiceResourceURLCollection *)self enumerateResourceURLReferences:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  urlReferencesByRole = self->_urlReferencesByRole;
  BOOL v4 = [a3 urlReferencesByRole];
  LOBYTE(urlReferencesByRole) = [(NSMutableDictionary *)urlReferencesByRole isEqual:v4];

  return (char)urlReferencesByRole;
}

- (PAMediaConversionServiceResourceURLCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)PAMediaConversionServiceResourceURLCollection;
  unint64_t v2 = [(PAMediaConversionServiceResourceURLCollection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    urlReferencesByRole = v2->_urlReferencesByRole;
    v2->_urlReferencesByRole = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)filenameSummaryStringForDictionaryRepresentation:(id)a3
{
  uint64_t v3 = [a3 allValues];
  BOOL v4 = [v3 valueForKey:@"lastPathComponent"];
  uint64_t v5 = [v4 componentsJoinedByString:@"|"];

  return v5;
}

+ (BOOL)getSignatureString:(id *)a3 filenameSummary:(id *)a4 forDictionaryRepresentation:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 200, @"Invalid parameter not satisfying: %@", @"bookmarkDictionary" object file lineNumber description];
  }
  uint64_t v10 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = [v9 allKeys];
  BOOL v12 = [v11 sortedArrayUsingComparator:&stru_100034D50];

  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    id v26 = a3;
    v27 = a4;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v32;
    char v28 = 1;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v29 = 0;
        uint64_t v30 = 0;
        id v19 = v9;
        uint64_t v20 = [v9 objectForKeyedSubscript:v18];
        unsigned int v21 = +[PAMediaConversionServiceResourceURLReference getPathHash:&v30 lastPathComponent:&v29 forDictionaryRepresentation:v20];
        id v22 = v29;

        if (v21)
        {
          v15 ^= v30;
          [v10 addObject:v22];
        }
        else
        {
          char v28 = 0;
        }

        id v9 = v19;
      }
      id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);

    a3 = v26;
    a4 = v27;
    if ((v28 & 1) == 0)
    {
      BOOL v23 = 0;
      goto LABEL_21;
    }
  }
  else
  {

    uint64_t v15 = 0;
  }
  if (a3)
  {
    *a3 = +[NSString stringWithFormat:@"%lx", v15];
  }
  if (a4)
  {
    *a4 = [v10 componentsJoinedByString:@"|"];
  }
  BOOL v23 = 1;
LABEL_21:

  return v23;
}

+ (id)collectionForBookmarkDataDictionaryRepresentation:(id)a3 accessProvider:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 169, @"Invalid parameter not satisfying: %@", @"bookmarkDictionary" object file lineNumber description];
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_100007614;
  v27 = sub_100007624;
  id v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009CBC;
  v15[3] = &unk_100034D30;
  long long v17 = &v23;
  id v11 = (id)objc_opt_new();
  id v16 = v11;
  uint64_t v18 = &v19;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];
  if (*((unsigned char *)v20 + 24))
  {
    id v12 = 0;
    if (a5) {
      *a5 = (id) v24[5];
    }
  }
  else
  {
    if (v10) {
      [v11 setAccessProviderDelegate:v10];
    }
    id v12 = v11;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

+ (PAMediaConversionServiceResourceURLCollection)collectionWithMainResourceURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  [v4 setResourceURL:v3 forRole:@"PAMediaConversionResourceRoleMainResource"];

  return (PAMediaConversionServiceResourceURLCollection *)v4;
}

- (NSError)blastDoorError
{
  unint64_t v2 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
  id v3 = [v2 error];

  return (NSError *)v3;
}

- (NSURL)blastDoorSourceURL
{
  unint64_t v2 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
  id v3 = [v2 blastDoorSourceURL];

  return (NSURL *)v3;
}

- (NSDictionary)blastDoorVideoComplementProperties
{
  id v3 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:@"PAMediaConversionResourceRoleVideoComplement"];
  BOOL v4 = [v3 url];

  uint64_t v5 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
  objc_super v6 = [v5 propertiesForVideoComplementURL:v4];

  return (NSDictionary *)v6;
}

- (NSDictionary)blastDoorMainSourceProperties
{
  unint64_t v2 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
  id v3 = [v2 blastDoorMainSourceProperties];

  return (NSDictionary *)v3;
}

- (BOOL)isBlastDoorAccessRequired
{
  unint64_t v2 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
  unsigned __int8 v3 = [v2 isBlastDoorAccessRequired];

  return v3;
}

@end