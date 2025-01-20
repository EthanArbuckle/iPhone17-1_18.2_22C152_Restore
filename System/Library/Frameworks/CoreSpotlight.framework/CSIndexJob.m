@interface CSIndexJob
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CSIndexJob)initWithCoder:(id)a3;
- (CSIndexJob)initWithJobType:(int64_t)a3;
- (CSIndexJob)initWithJobType:(int64_t)a3 jobOptions:(int64_t)a4;
- (CSIndexJob)initWithXPCDict:(id)a3;
- (CSSearchContext)searchContext;
- (NSArray)bundleIDs;
- (NSArray)excludedBundleIDs;
- (NSArray)fileAttributeSets;
- (NSArray)identifiersToReindex;
- (NSArray)protectionClasses;
- (NSArray)providerIdentifiers;
- (NSArray)updatedItems;
- (NSData)importData;
- (NSString)extensionBundleID;
- (NSString)fileType;
- (NSString)providerIdentifier;
- (NSString)providerType;
- (NSString)reason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)xpc_dictionary;
- (int64_t)jobOptions;
- (int64_t)jobType;
- (int64_t)updatedItemsMask;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIDs:(id)a3;
- (void)setExcludedBundleIDs:(id)a3;
- (void)setExtensionBundleID:(id)a3;
- (void)setFileAttributeSets:(id)a3;
- (void)setFileType:(id)a3;
- (void)setIdentifiersToReindex:(id)a3;
- (void)setImportData:(id)a3;
- (void)setJobOptions:(int64_t)a3;
- (void)setJobType:(int64_t)a3;
- (void)setProtectionClasses:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setProviderIdentifiers:(id)a3;
- (void)setProviderType:(id)a3;
- (void)setReason:(id)a3;
- (void)setSearchContext:(id)a3;
- (void)setUpdatedItems:(id)a3;
- (void)setUpdatedItemsMask:(int64_t)a3;
@end

@implementation CSIndexJob

- (int64_t)jobType
{
  return self->_jobType;
}

- (CSIndexJob)initWithJobType:(int64_t)a3
{
  return [(CSIndexJob *)self initWithJobType:a3 jobOptions:0];
}

- (void)setReason:(id)a3
{
}

- (void)setProtectionClasses:(id)a3
{
}

- (int64_t)jobOptions
{
  return self->_jobOptions;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (CSIndexJob)initWithJobType:(int64_t)a3 jobOptions:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSIndexJob;
  result = [(CSIndexJob *)&v7 init];
  if (result)
  {
    result->_jobType = a3;
    result->_jobOptions = a4;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedItems, 0);
  objc_storeStrong((id *)&self->_fileAttributeSets, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_importData, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);
  objc_storeStrong((id *)&self->_providerType, 0);
  objc_storeStrong((id *)&self->_providerIdentifiers, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_protectionClasses, 0);
  objc_storeStrong((id *)&self->_excludedBundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);

  objc_storeStrong((id *)&self->_identifiersToReindex, 0);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t jobType = self->_jobType;
  id v5 = a3;
  [v5 encodeInteger:jobType forKey:@"t"];
  [v5 encodeInteger:self->_jobOptions forKey:@"o"];
  [v5 encodeObject:self->_identifiersToReindex forKey:@"ids"];
  [v5 encodeObject:self->_excludedBundleIDs forKey:@"excb"];
  [v5 encodeObject:self->_providerIdentifier forKey:@"pid"];
  [v5 encodeObject:self->_providerIdentifiers forKey:@"pids"];
  [v5 encodeObject:self->_protectionClasses forKey:@"pcs"];
  [v5 encodeObject:self->_providerType forKey:@"pt"];
  [v5 encodeObject:self->_extensionBundleID forKey:@"extb"];
  [v5 encodeObject:self->_searchContext forKey:@"sc"];
  [v5 encodeObject:self->_importData forKey:@"imd"];
  [v5 encodeObject:self->_reason forKey:@"reas"];
  [v5 encodeObject:self->_fileType forKey:@"ftp"];
  [v5 encodeObject:self->_fileAttributeSets forKey:@"fattr"];
  [v5 encodeObject:self->_updatedItems forKey:@"u"];
  [v5 encodeInteger:self->_updatedItemsMask forKey:@"um"];
}

- (CSIndexJob)initWithCoder:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CSIndexJob;
  id v5 = [(CSIndexJob *)&v51 init];
  if (v5)
  {
    v5->_int64_t jobType = [v4 decodeIntegerForKey:@"t"];
    v5->_jobOptions = [v4 decodeIntegerForKey:@"o"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ids"];
    identifiersToReindex = v5->_identifiersToReindex;
    v5->_identifiersToReindex = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"excb"];
    excludedBundleIDs = v5->_excludedBundleIDs;
    v5->_excludedBundleIDs = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pid"];
    providerIdentifier = v5->_providerIdentifier;
    v5->_providerIdentifier = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"pids"];
    providerIdentifiers = v5->_providerIdentifiers;
    v5->_providerIdentifiers = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"pcs"];
    protectionClasses = v5->_protectionClasses;
    v5->_protectionClasses = (NSArray *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pt"];
    providerType = v5->_providerType;
    v5->_providerType = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extb"];
    extensionBundleID = v5->_extensionBundleID;
    v5->_extensionBundleID = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sc"];
    searchContext = v5->_searchContext;
    v5->_searchContext = (CSSearchContext *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imd"];
    importData = v5->_importData;
    v5->_importData = (NSData *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reas"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ftp"];
    fileType = v5->_fileType;
    v5->_fileType = (NSString *)v38;

    v40 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"fattr"];
    fileAttributeSets = v5->_fileAttributeSets;
    v5->_fileAttributeSets = (NSArray *)v43;

    v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"u"];
    updatedItems = v5->_updatedItems;
    v5->_updatedItems = (NSArray *)v48;

    v5->_updatedItemsMask = [v4 decodeIntegerForKey:@"um"];
  }

  return v5;
}

- (CSIndexJob)initWithXPCDict:(id)a3
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "t");
  v6 = [(CSIndexJob *)self initWithJobType:uint64 jobOptions:xpc_dictionary_get_uint64(v4, "o")];
  if (v6)
  {
    uint64_t v7 = xpc_dictionary_get_value(v4, "ids");
    v8 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v7];
    identifiersToReindex = v6->_identifiersToReindex;
    v6->_identifiersToReindex = v8;

    v10 = xpc_dictionary_get_value(v4, "excb");
    v11 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v10];
    excludedBundleIDs = v6->_excludedBundleIDs;
    v6->_excludedBundleIDs = v11;

    v13 = +[CSXPCConnection copyNSStringForKey:"pid" fromXPCDictionary:v4];
    providerIdentifier = v6->_providerIdentifier;
    v6->_providerIdentifier = v13;

    v15 = xpc_dictionary_get_value(v4, "pids");
    uint64_t v16 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v15];
    providerIdentifiers = v6->_providerIdentifiers;
    v6->_providerIdentifiers = v16;

    v18 = xpc_dictionary_get_value(v4, "pcs");
    uint64_t v19 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v18];
    protectionClasses = v6->_protectionClasses;
    v6->_protectionClasses = v19;

    uint64_t v21 = +[CSXPCConnection copyNSStringForKey:"pt" fromXPCDictionary:v4];
    providerType = v6->_providerType;
    v6->_providerType = v21;

    v23 = +[CSXPCConnection copyNSStringForKey:"extb" fromXPCDictionary:v4];
    extensionBundleID = v6->_extensionBundleID;
    v6->_extensionBundleID = v23;

    v25 = xpc_dictionary_get_dictionary(v4, "sc");
    if (v25)
    {
      uint64_t v26 = [[CSSearchContext alloc] initWithXPCDictionary:v25];
      searchContext = v6->_searchContext;
      v6->_searchContext = v26;
    }
    uint64_t v28 = +[CSXPCConnection copyNSDataForKey:"imd" fromXPCDictionary:v4];
    importData = v6->_importData;
    v6->_importData = v28;

    uint64_t v30 = +[CSXPCConnection copyNSStringForKey:"reas" fromXPCDictionary:v4];
    reason = v6->_reason;
    v6->_reason = v30;

    uint64_t v32 = +[CSXPCConnection copyNSStringForKey:"ftp" fromXPCDictionary:v4];
    fileType = v6->_fileType;
    v6->_fileType = v32;
  }
  return v6;
}

- (id)xpc_dictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "t", self->_jobType);
  xpc_dictionary_set_uint64(v3, "o", self->_jobOptions);
  +[CSXPCConnection dictionary:v3 setStringArray:self->_identifiersToReindex forKey:"ids"];
  +[CSXPCConnection dictionary:v3 setStringArray:self->_excludedBundleIDs forKey:"excb"];
  providerIdentifier = self->_providerIdentifier;
  if (providerIdentifier) {
    xpc_dictionary_set_string(v3, "pid", [(NSString *)providerIdentifier UTF8String]);
  }
  providerIdentifiers = self->_providerIdentifiers;
  if (providerIdentifiers) {
    +[CSXPCConnection dictionary:v3 setStringArray:providerIdentifiers forKey:"pids"];
  }
  protectionClasses = self->_protectionClasses;
  if (protectionClasses) {
    +[CSXPCConnection dictionary:v3 setStringArray:protectionClasses forKey:"pcs"];
  }
  providerType = self->_providerType;
  if (providerType) {
    xpc_dictionary_set_string(v3, "pt", [(NSString *)providerType UTF8String]);
  }
  extensionBundleID = self->_extensionBundleID;
  if (extensionBundleID) {
    xpc_dictionary_set_string(v3, "extb", [(NSString *)extensionBundleID UTF8String]);
  }
  uint64_t v9 = [(CSSearchContext *)self->_searchContext xpc_dictionary];
  if (v9) {
    xpc_dictionary_set_value(v3, "sc", v9);
  }
  importData = self->_importData;
  if (importData) {
    xpc_dictionary_set_data(v3, "imd", [(NSData *)importData bytes], [(NSData *)self->_importData length]);
  }
  reason = self->_reason;
  if (reason) {
    xpc_dictionary_set_string(v3, "reas", [(NSString *)reason UTF8String]);
  }
  fileType = self->_fileType;
  if (fileType) {
    xpc_dictionary_set_string(v3, "ftp", [(NSString *)fileType UTF8String]);
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithJobType:self->_jobType jobOptions:self->_jobOptions];
  [v4 setIdentifiersToReindex:self->_identifiersToReindex];
  [v4 setExcludedBundleIDs:self->_excludedBundleIDs];
  [v4 setProviderIdentifier:self->_providerIdentifier];
  [v4 setProviderIdentifiers:self->_providerIdentifiers];
  [v4 setProtectionClasses:self->_protectionClasses];
  [v4 setProviderType:self->_providerType];
  [v4 setExtensionBundleID:self->_extensionBundleID];
  [v4 setSearchContext:self->_searchContext];
  [v4 setImportData:self->_importData];
  [v4 setReason:self->_reason];
  [v4 setFileType:self->_fileType];
  [v4 setFileAttributeSets:self->_fileAttributeSets];
  [v4 setUpdatedItems:self->_updatedItems];
  [v4 setUpdatedItemsMask:self->_updatedItemsMask];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    int64_t jobType = self->_jobType;
    if (jobType != [v6 jobType]
      || (int64_t jobOptions = self->_jobOptions, jobOptions != [v6 jobOptions]))
    {
      BOOL v12 = 0;
LABEL_39:

      goto LABEL_40;
    }
    identifiersToReindex = self->_identifiersToReindex;
    v10 = [v6 identifiersToReindex];
    if (identifiersToReindex != v10)
    {
      v11 = self->_identifiersToReindex;
      xpc_object_t v3 = [v6 identifiersToReindex];
      if (![(NSArray *)v11 isEqual:v3])
      {
        BOOL v12 = 0;
        goto LABEL_37;
      }
    }
    excludedBundleIDs = self->_excludedBundleIDs;
    uint64_t v14 = [v6 excludedBundleIDs];
    if (excludedBundleIDs != v14)
    {
      v15 = self->_excludedBundleIDs;
      uint64_t v16 = [v6 excludedBundleIDs];
      if (![(NSArray *)v15 isEqual:v16])
      {
        BOOL v12 = 0;
LABEL_35:

LABEL_36:
        if (identifiersToReindex == v10)
        {
LABEL_38:

          goto LABEL_39;
        }
LABEL_37:

        goto LABEL_38;
      }
      uint64_t v46 = v16;
    }
    searchContext = self->_searchContext;
    uint64_t v18 = [v6 searchContext];
    uint64_t v19 = (void *)v18;
    v47 = searchContext;
    if (searchContext == (void *)v18)
    {
      uint64_t v41 = v14;
      v20 = identifiersToReindex;
      uint64_t v21 = (void *)v18;
      v45 = excludedBundleIDs;
    }
    else
    {
      searchContext = [(CSSearchContext *)self->_searchContext userQuery];
      uint64_t v43 = [v6 searchContext];
      v42 = [v43 userQuery];
      if (!objc_msgSend(searchContext, "isEqual:"))
      {
        BOOL v12 = 0;
LABEL_33:

LABEL_34:
        uint64_t v16 = v46;
        if (excludedBundleIDs == v14) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
      uint64_t v41 = v14;
      v20 = identifiersToReindex;
      uint64_t v21 = v19;
      v45 = excludedBundleIDs;
    }
    importData = self->_importData;
    v23 = [v6 importData];
    v40 = importData;
    v44 = searchContext;
    if (importData == v23)
    {
      uint64_t v38 = v3;
      uint64_t v19 = v21;
    }
    else
    {
      uint64_t v24 = self->_importData;
      v39 = [v6 importData];
      uint64_t v19 = v21;
      if (!-[NSData isEqualToData:](v24, "isEqualToData:"))
      {
        BOOL v12 = 0;
        searchContext = v44;
        identifiersToReindex = v20;
        uint64_t v14 = v41;
LABEL_31:

LABEL_32:
        excludedBundleIDs = v45;
        if (v47 == v19) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      uint64_t v38 = v3;
    }
    identifiersToReindex = v20;
    fileType = self->_fileType;
    uint64_t v26 = [v6 fileType];
    uint64_t v14 = v41;
    if ([(NSString *)fileType isEqualToString:v26])
    {
      fileAttributeSets = self->_fileAttributeSets;
      uint64_t v28 = [v6 fileAttributeSets];
      v29 = fileAttributeSets;
      uint64_t v30 = (void *)v28;
      if ([(NSArray *)v29 isEqualToArray:v28])
      {
        v37 = v30;
        updatedItems = self->_updatedItems;
        uint64_t v32 = [v6 updatedItems];
        v33 = updatedItems;
        uint64_t v34 = (void *)v32;
        if (-[NSArray isEqualToArray:](v33, "isEqualToArray:"))
        {
          int64_t updatedItemsMask = self->_updatedItemsMask;
          BOOL v12 = updatedItemsMask == [v6 updatedItemsMask];

          goto LABEL_30;
        }
      }
      else
      {
      }
    }

    BOOL v12 = 0;
LABEL_30:
    xpc_object_t v3 = v38;
    searchContext = v44;
    if (v40 == v23) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  BOOL v12 = 0;
LABEL_40:

  return v12;
}

- (unint64_t)hash
{
  int64_t v3 = 3 * self->_jobOptions + self->_jobType;
  uint64_t v4 = [(NSArray *)self->_identifiersToReindex hash];
  return v3 + 5 * ([(NSArray *)self->_excludedBundleIDs hash] ^ v4);
}

- (id)description
{
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"type=%ld", self->_jobType);
  [v3 addObject:v4];

  if (self->_jobOptions)
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"options=%ld", self->_jobOptions);
    [v3 addObject:v5];
  }
  if ([(NSArray *)self->_identifiersToReindex count])
  {
    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"identifiersCount=%ld", -[NSArray count](self->_identifiersToReindex, "count"));
    [v3 addObject:v6];
  }
  if ([(NSArray *)self->_excludedBundleIDs count])
  {
    id v7 = [NSString alloc];
    v8 = [(NSArray *)self->_excludedBundleIDs componentsJoinedByString:@"|"];
    uint64_t v9 = (void *)[v7 initWithFormat:@"excludedBundleIDs=%@", v8];
    [v3 addObject:v9];
  }
  if ([(NSArray *)self->_protectionClasses count])
  {
    id v10 = [NSString alloc];
    v11 = [(NSArray *)self->_protectionClasses componentsJoinedByString:@"|"];
    BOOL v12 = (void *)[v10 initWithFormat:@"pcs=%@", v11];
    [v3 addObject:v12];
  }
  v13 = [(CSSearchContext *)self->_searchContext userQuery];

  if (v13)
  {
    id v14 = [NSString alloc];
    v15 = [(CSSearchContext *)self->_searchContext userQuery];
    uint64_t v16 = (void *)[v14 initWithFormat:@"query=%@", v15];
    [v3 addObject:v16];
  }
  if ([(NSData *)self->_importData length])
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"importData=%d:%p", -[NSData length](self->_importData, "length"), -[NSData bytes](self->_importData, "bytes"));
    [v3 addObject:v17];
  }
  if ([(NSString *)self->_reason length])
  {
    uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"reason=%@", self->_reason];
    [v3 addObject:v18];
  }
  if ([(NSString *)self->_fileType length])
  {
    uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"fileType=%@", self->_fileType];
    [v3 addObject:v19];
  }
  if ([(NSArray *)self->_fileAttributeSets count])
  {
    v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"fileAttributeSetsCount=%ld", -[NSArray count](self->_fileAttributeSets, "count"));
    [v3 addObject:v20];
  }
  if ([(NSArray *)self->_updatedItems count])
  {
    uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"updatedItems=%ld", -[NSArray count](self->_updatedItems, "count"));
    [v3 addObject:v21];
  }
  if (self->_updatedItemsMask)
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"updatedItemsMask=%ld", self->_updatedItemsMask);
    [v3 addObject:v22];
  }
  id v23 = [NSString alloc];
  uint64_t v24 = objc_opt_class();
  v25 = [v3 componentsJoinedByString:@", "];
  uint64_t v26 = (void *)[v23 initWithFormat:@"<%@:%p; %@>", v24, self, v25];

  return v26;
}

- (void)setJobType:(int64_t)a3
{
  self->_int64_t jobType = a3;
}

- (void)setJobOptions:(int64_t)a3
{
  self->_int64_t jobOptions = a3;
}

- (NSArray)identifiersToReindex
{
  return self->_identifiersToReindex;
}

- (void)setIdentifiersToReindex:(id)a3
{
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (NSArray)excludedBundleIDs
{
  return self->_excludedBundleIDs;
}

- (void)setExcludedBundleIDs:(id)a3
{
}

- (NSArray)protectionClasses
{
  return self->_protectionClasses;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (NSArray)providerIdentifiers
{
  return self->_providerIdentifiers;
}

- (void)setProviderIdentifiers:(id)a3
{
}

- (NSString)providerType
{
  return self->_providerType;
}

- (void)setProviderType:(id)a3
{
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (void)setExtensionBundleID:(id)a3
{
}

- (CSSearchContext)searchContext
{
  return self->_searchContext;
}

- (void)setSearchContext:(id)a3
{
}

- (NSData)importData
{
  return self->_importData;
}

- (void)setImportData:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setFileType:(id)a3
{
}

- (NSArray)fileAttributeSets
{
  return self->_fileAttributeSets;
}

- (void)setFileAttributeSets:(id)a3
{
}

- (NSArray)updatedItems
{
  return self->_updatedItems;
}

- (void)setUpdatedItems:(id)a3
{
}

- (int64_t)updatedItemsMask
{
  return self->_updatedItemsMask;
}

- (void)setUpdatedItemsMask:(int64_t)a3
{
  self->_int64_t updatedItemsMask = a3;
}

@end