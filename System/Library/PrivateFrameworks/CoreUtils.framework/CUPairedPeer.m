@interface CUPairedPeer
+ (BOOL)supportsSecureCoding;
- (CUPairedPeer)initWithCoder:(id)a3;
- (NSData)altIRK;
- (NSData)publicKey;
- (NSDate)dateModified;
- (NSDictionary)acl;
- (NSDictionary)groupInfo;
- (NSDictionary)info;
- (NSString)identifierStr;
- (NSString)label;
- (NSString)model;
- (NSString)name;
- (NSUUID)identifier;
- (id)description;
- (id)detailedDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAcl:(id)a3;
- (void)setAltIRK:(id)a3;
- (void)setDateModified:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierStr:(id)a3;
- (void)setInfo:(id)a3;
- (void)setLabel:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPublicKey:(id)a3;
@end

@implementation CUPairedPeer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierStr, 0);
  objc_storeStrong((id *)&self->_dateModified, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_altIRK, 0);
  objc_storeStrong((id *)&self->_acl, 0);
}

- (void)setIdentifierStr:(id)a3
{
}

- (NSString)identifierStr
{
  return self->_identifierStr;
}

- (void)setDateModified:(id)a3
{
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setModel:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setInfo:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setAltIRK:(id)a3
{
}

- (NSData)altIRK
{
  return self->_altIRK;
}

- (void)setAcl:(id)a3
{
}

- (NSDictionary)acl
{
  return self->_acl;
}

- (NSDictionary)groupInfo
{
  info = self->_info;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  return (NSDictionary *)CFDictionaryGetTypedValue((const __CFDictionary *)info, @"groupInfo", TypeID, 0);
}

- (id)detailedDescription
{
  CFMutableStringRef v56 = 0;
  NSAppendPrintF(&v56, (uint64_t)"CUPairedPeer", v2, v3, v4, v5, v6, v7, v45);
  v9 = v56;
  v16 = v9;
  identifier = self->_identifier;
  if (identifier)
  {
    CFMutableStringRef v55 = v9;
    NSAppendPrintF(&v55, (uint64_t)", ID %@", v10, v11, v12, v13, v14, v15, (uint64_t)identifier);
    v18 = v55;

    v16 = v18;
  }
  name = self->_name;
  if (name)
  {
    CFMutableStringRef v54 = v16;
    NSAppendPrintF(&v54, (uint64_t)", Name '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)name);
    v20 = v54;

    v16 = v20;
  }
  model = self->_model;
  if (model)
  {
    CFMutableStringRef v53 = v16;
    NSAppendPrintF(&v53, (uint64_t)", Model '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)model);
    v22 = v53;

    v16 = v22;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    CFMutableStringRef v52 = v16;
    NSAppendPrintF(&v52, (uint64_t)", PK <%.4@>", v10, v11, v12, v13, v14, v15, (uint64_t)publicKey);
    v24 = v52;

    v16 = v24;
  }
  altIRK = self->_altIRK;
  if (altIRK)
  {
    CFMutableStringRef v51 = v16;
    NSAppendPrintF(&v51, (uint64_t)", IRK %{mask}", v10, v11, v12, v13, v14, v15, (uint64_t)altIRK);
    v26 = v51;

    v16 = v26;
  }
  dateModified = self->_dateModified;
  if (dateModified)
  {
    CFMutableStringRef v50 = v16;
    NSAppendPrintF(&v50, (uint64_t)", Date %@", v10, v11, v12, v13, v14, v15, (uint64_t)dateModified);
    v28 = v50;

    v16 = v28;
  }
  CFMutableStringRef v49 = v16;
  NSAppendPrintF(&v49, (uint64_t)"\n", v10, v11, v12, v13, v14, v15, v46);
  v29 = v49;

  if ([(NSDictionary *)self->_acl count])
  {
    CFMutableStringRef v48 = v29;
    NSAppendPrintF(&v48, (uint64_t)"    ACL: %##@\n", v30, v31, v32, v33, v34, v35, (uint64_t)self->_acl);
    v36 = v48;

    v29 = v36;
  }
  if ([(NSDictionary *)self->_info count])
  {
    CFMutableStringRef v47 = v29;
    NSAppendPrintF(&v47, (uint64_t)"    Info: %##@\n", v37, v38, v39, v40, v41, v42, (uint64_t)self->_info);
    v43 = v47;

    v29 = v43;
  }
  return v29;
}

- (id)description
{
  CFMutableStringRef v64 = 0;
  NSAppendPrintF(&v64, (uint64_t)"CUPairedPeer", v2, v3, v4, v5, v6, v7, v54);
  v9 = v64;
  v16 = v9;
  identifierStr = self->_identifierStr;
  if (identifierStr)
  {
    CFMutableStringRef v63 = v9;
    v18 = &v63;
    NSAppendPrintF(&v63, (uint64_t)", ID %@", v10, v11, v12, v13, v14, v15, (uint64_t)identifierStr);
  }
  else
  {
    identifier = self->_identifier;
    if (!identifier) {
      goto LABEL_6;
    }
    CFMutableStringRef v62 = v9;
    v18 = &v62;
    NSAppendPrintF(&v62, (uint64_t)", ID %@", v10, v11, v12, v13, v14, v15, (uint64_t)identifier);
  }
  v20 = *v18;

  v16 = v20;
LABEL_6:
  name = self->_name;
  if (name)
  {
    CFMutableStringRef v61 = v16;
    NSAppendPrintF(&v61, (uint64_t)", Name '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)name);
    v22 = v61;

    v16 = v22;
  }
  model = self->_model;
  if (model)
  {
    CFMutableStringRef v60 = v16;
    NSAppendPrintF(&v60, (uint64_t)", Model '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)model);
    v24 = v60;

    v16 = v24;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    CFMutableStringRef v59 = v16;
    NSAppendPrintF(&v59, (uint64_t)", PK <%.4@>", v10, v11, v12, v13, v14, v15, (uint64_t)publicKey);
    v26 = v59;

    v16 = v26;
  }
  if ([(NSDictionary *)self->_acl count])
  {
    CFMutableStringRef v58 = v16;
    uint64_t v33 = [(NSDictionary *)self->_acl count];
    NSAppendPrintF(&v58, (uint64_t)", ACLs %ld", v34, v35, v36, v37, v38, v39, v33);
    uint64_t v40 = v58;

    v16 = v40;
  }
  altIRK = self->_altIRK;
  if (altIRK)
  {
    CFMutableStringRef v57 = v16;
    NSAppendPrintF(&v57, (uint64_t)", IRK %{mask}", v27, v28, v29, v30, v31, v32, (uint64_t)altIRK);
    uint64_t v42 = v57;

    v16 = v42;
  }
  dateModified = self->_dateModified;
  if (dateModified)
  {
    CFMutableStringRef v56 = v16;
    NSAppendPrintF(&v56, (uint64_t)", Date %@", v27, v28, v29, v30, v31, v32, (uint64_t)dateModified);
    v44 = v56;

    v16 = v44;
  }
  if ([(NSDictionary *)self->_info count])
  {
    CFMutableStringRef v55 = v16;
    uint64_t v45 = [(NSDictionary *)self->_info count];
    NSAppendPrintF(&v55, (uint64_t)", Info %ld", v46, v47, v48, v49, v50, v51, v45);
    CFMutableStringRef v52 = v55;

    v16 = v52;
  }
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  acl = self->_acl;
  id v14 = v4;
  if (acl)
  {
    [v4 encodeObject:acl forKey:@"acl"];
    id v4 = v14;
  }
  altIRK = self->_altIRK;
  if (altIRK)
  {
    [v14 encodeObject:altIRK forKey:@"altIRK"];
    id v4 = v14;
  }
  dateModified = self->_dateModified;
  if (dateModified)
  {
    [v14 encodeObject:dateModified forKey:@"dateModified"];
    id v4 = v14;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v14 encodeObject:identifier forKey:@"ident"];
    id v4 = v14;
  }
  identifierStr = self->_identifierStr;
  if (identifierStr)
  {
    [v14 encodeObject:identifierStr forKey:@"idStr"];
    id v4 = v14;
  }
  info = self->_info;
  if (info)
  {
    [v14 encodeObject:info forKey:@"info"];
    id v4 = v14;
  }
  if (self->_label && !self->_name)
  {
    objc_msgSend(v14, "encodeObject:forKey:");
    id v4 = v14;
  }
  model = self->_model;
  if (model)
  {
    [v14 encodeObject:model forKey:@"model"];
    id v4 = v14;
  }
  name = self->_name;
  if (name)
  {
    [v14 encodeObject:name forKey:@"name"];
    id v4 = v14;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    [v14 encodeObject:publicKey forKey:@"pk"];
    id v4 = v14;
  }
}

- (CUPairedPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CUPairedPeer;
  uint64_t v5 = [(CUPairedPeer *)&v26 init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = objc_opt_class();
    NSDecodeStandardContainerIfPresent(v6, @"acl", v7, (void **)&v5->_acl);

    id v8 = v6;
    uint64_t v9 = objc_opt_class();
    NSDecodeObjectIfPresent(v8, @"altIRK", v9, (void **)&v5->_altIRK);

    id v10 = v8;
    uint64_t v11 = objc_opt_class();
    NSDecodeObjectIfPresent(v10, @"dateModified", v11, (void **)&v5->_dateModified);

    id v12 = v10;
    uint64_t v13 = objc_opt_class();
    NSDecodeObjectIfPresent(v12, @"ident", v13, (void **)&v5->_identifier);

    id v14 = v12;
    uint64_t v15 = objc_opt_class();
    NSDecodeObjectIfPresent(v14, @"idStr", v15, (void **)&v5->_identifierStr);

    id v16 = v14;
    uint64_t v17 = objc_opt_class();
    NSDecodeStandardContainerIfPresent(v16, @"info", v17, (void **)&v5->_info);

    id v18 = v16;
    uint64_t v19 = objc_opt_class();
    NSDecodeObjectIfPresent(v18, @"model", v19, (void **)&v5->_model);

    id v20 = v18;
    uint64_t v21 = objc_opt_class();
    NSDecodeObjectIfPresent(v20, @"name", v21, (void **)&v5->_name);

    id v22 = v20;
    uint64_t v23 = objc_opt_class();
    NSDecodeObjectIfPresent(v22, @"pk", v23, (void **)&v5->_publicKey);

    objc_storeStrong((id *)&v5->_label, v5->_name);
    v24 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end