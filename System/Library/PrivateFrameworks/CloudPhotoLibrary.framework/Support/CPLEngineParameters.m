@interface CPLEngineParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)matchesParameters:(id)a3;
- (CPLEngineParameters)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8;
- (CPLEngineParameters)initWithCoder:(id)a3;
- (CPLEngineParameters)initWithPlist:(id)a3;
- (NSString)libraryIdentifier;
- (NSString)mainScopeIdentifier;
- (NSURL)clientLibraryBaseURL;
- (NSURL)cloudLibraryResourceStorageURL;
- (NSURL)cloudLibraryStateStorageURL;
- (id)asPlist;
- (id)description;
- (id)redactedDescription;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLEngineParameters

- (CPLEngineParameters)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)CPLEngineParameters;
  v19 = [(CPLEngineParameters *)&v31 init];
  if (v19)
  {
    v20 = (NSURL *)[v14 copy];
    clientLibraryBaseURL = v19->_clientLibraryBaseURL;
    v19->_clientLibraryBaseURL = v20;

    v22 = (NSURL *)[v15 copy];
    cloudLibraryStateStorageURL = v19->_cloudLibraryStateStorageURL;
    v19->_cloudLibraryStateStorageURL = v22;

    v24 = (NSURL *)[v16 copy];
    cloudLibraryResourceStorageURL = v19->_cloudLibraryResourceStorageURL;
    v19->_cloudLibraryResourceStorageURL = v24;

    v26 = (NSString *)[v17 copy];
    libraryIdentifier = v19->_libraryIdentifier;
    v19->_libraryIdentifier = v26;

    v28 = (NSString *)[v18 copy];
    mainScopeIdentifier = v19->_mainScopeIdentifier;
    v19->_mainScopeIdentifier = v28;

    v19->_options = a8;
  }

  return v19;
}

- (CPLEngineParameters)initWithPlist:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 objectForKeyedSubscript:@"libraryIdentifier"];
    v7 = [v5 objectForKeyedSubscript:@"mainScopeIdentifier"];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      CPLPrimaryScopeIdentifierForCurrentUniverse();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v11 = v9;

    uint64_t v12 = [v5 objectForKeyedSubscript:@"clientLibraryBasePath"];
    v13 = [v5 objectForKeyedSubscript:@"cloudLibraryStateStoragePath"];
    uint64_t v14 = [v5 objectForKeyedSubscript:@"cloudLibraryResourceStoragePath"];
    if (v12)
    {
      uint64_t v15 = +[NSURL fileURLWithPath:v12 isDirectory:1];
    }
    else
    {
      uint64_t v15 = 0;
    }
    v29 = (void *)v15;
    objc_super v31 = (void *)v12;
    if (v13)
    {
      id v16 = +[NSURL fileURLWithPath:v13 isDirectory:1];
    }
    else
    {
      id v16 = 0;
    }
    v30 = v11;
    id v17 = (void *)v6;
    uint64_t v27 = v14;
    if (v14)
    {
      uint64_t v18 = v14;
      v19 = self;
      v20 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v18, 1, v27);
    }
    else
    {
      v19 = self;
      v20 = 0;
    }
    v21 = objc_msgSend(v5, "objectForKeyedSubscript:", @"options", v27);
    id v22 = [v21 integerValue];

    v10 = 0;
    if (v13)
    {
      v23 = v29;
      if (v29 && v20)
      {
        v24 = v19;
        v25 = v30;
        self = [(CPLEngineParameters *)v24 initWithClientLibraryBaseURL:v29 cloudLibraryStateStorageURL:v16 cloudLibraryResourceStorageURL:v20 libraryIdentifier:v17 mainScopeIdentifier:v30 options:v22];
        v10 = self;
      }
      else
      {
        self = v19;
        v25 = v30;
      }
    }
    else
    {
      self = v19;
      v23 = v29;
      v25 = v30;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)asPlist
{
  v3 = [(NSURL *)self->_clientLibraryBaseURL path];
  id v4 = [(NSURL *)self->_cloudLibraryStateStorageURL path];
  id v5 = [(NSURL *)self->_cloudLibraryResourceStorageURL path];
  v11[0] = @"clientLibraryBasePath";
  v11[1] = @"cloudLibraryStateStoragePath";
  v11[2] = @"cloudLibraryResourceStoragePath";
  v11[3] = @"libraryIdentifier";
  libraryIdentifier = self->_libraryIdentifier;
  mainScopeIdentifier = self->_mainScopeIdentifier;
  v12[2] = v5;
  v12[3] = libraryIdentifier;
  v12[4] = mainScopeIdentifier;
  v12[0] = v3;
  v12[1] = v4;
  v11[4] = @"mainScopeIdentifier";
  v11[5] = @"options";
  v8 = +[NSNumber numberWithUnsignedInteger:self->_options];
  v12[5] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  libraryIdentifier = self->_libraryIdentifier;
  uint64_t v6 = [(NSURL *)self->_clientLibraryBaseURL path];
  v7 = [v6 stringByAbbreviatingWithTildeInPath];
  id v8 = [v3 initWithFormat:@"<%@ for %@ at %@>", v4, libraryIdentifier, v7];

  return v8;
}

- (id)redactedDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  libraryIdentifier = self->_libraryIdentifier;
  uint64_t v6 = [(NSURL *)self->_clientLibraryBaseURL path];
  v7 = [v6 lastPathComponent];
  id v8 = [v3 initWithFormat:@"<%@ for %@ at %@>", v4, libraryIdentifier, v7];

  return v8;
}

- (BOOL)matchesParameters:(id)a3
{
  id v4 = a3;
  clientLibraryBaseURL = self->_clientLibraryBaseURL;
  uint64_t v6 = [v4 clientLibraryBaseURL];
  if (sub_10002820C((uint64_t)self, clientLibraryBaseURL, v6))
  {
    cloudLibraryStateStorageURL = self->_cloudLibraryStateStorageURL;
    id v8 = [v4 cloudLibraryStateStorageURL];
    if (sub_10002820C((uint64_t)self, cloudLibraryStateStorageURL, v8))
    {
      cloudLibraryResourceStorageURL = self->_cloudLibraryResourceStorageURL;
      v10 = [v4 cloudLibraryResourceStorageURL];
      if (sub_10002820C((uint64_t)self, cloudLibraryResourceStorageURL, v10))
      {
        unint64_t v11 = self->_mainScopeIdentifier;
        uint64_t v12 = [v4 mainScopeIdentifier];
        uint64_t v13 = v12;
        BOOL v14 = v11 && v12 && ([(id)v11 isEqual:v12] & 1) != 0 || (v11 | v13) == 0;
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(CPLEngineParameters *)self asPlist];
  id v9 = 0;
  v7 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:&v9];
  id v8 = v9;

  if (!v7) {
    sub_1001C5884(self, (uint64_t)v8, (uint64_t)a2);
  }
  [v5 encodeObject:v7 forKey:@"data"];
}

- (CPLEngineParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];

  if (v5)
  {
    id v10 = 0;
    uint64_t v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v10];
    id v7 = v10;
    if (v6)
    {
      self = [(CPLEngineParameters *)self initWithPlist:v6];
      id v8 = self;
    }
    else
    {
      if (_CPLSilentLogging)
      {
        id v8 = 0;
        goto LABEL_10;
      }
      uint64_t v6 = sub_10002866C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Invalid plist from coder: %@", buf, 0xCu);
      }
      id v8 = 0;
    }

LABEL_10:
    goto LABEL_11;
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (NSURL)clientLibraryBaseURL
{
  return self->_clientLibraryBaseURL;
}

- (NSURL)cloudLibraryStateStorageURL
{
  return self->_cloudLibraryStateStorageURL;
}

- (NSURL)cloudLibraryResourceStorageURL
{
  return self->_cloudLibraryResourceStorageURL;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (NSString)mainScopeIdentifier
{
  return self->_mainScopeIdentifier;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudLibraryResourceStorageURL, 0);
  objc_storeStrong((id *)&self->_cloudLibraryStateStorageURL, 0);
  objc_storeStrong((id *)&self->_clientLibraryBaseURL, 0);
}

@end