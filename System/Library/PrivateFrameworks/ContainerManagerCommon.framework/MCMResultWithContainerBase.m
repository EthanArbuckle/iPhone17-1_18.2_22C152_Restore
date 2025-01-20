@interface MCMResultWithContainerBase
- (BOOL)encodeResultOntoReply:(id)a3;
- (BOOL)existed;
- (BOOL)transient;
- (MCMPOSIXUser)posixUser;
- (MCMResultWithContainerBase)initWithContainerPath:(id)a3 containerIdentity:(id)a4 uuid:(id)a5 sandboxToken:(const char *)a6 includePath:(BOOL)a7;
- (MCMResultWithContainerBase)initWithMetadata:(id)a3 sandboxToken:(const char *)a4 includePath:(BOOL)a5 includeInfo:(BOOL)a6 includeUserManagedAssetsRelPath:(BOOL)a7 includeCreator:(BOOL)a8;
- (MCMResultWithContainerBase)initWithUUID:(id)a3 containerPathIdentifier:(id)a4 identifier:(id)a5 containerClass:(unint64_t)a6 POSIXUser:(id)a7 personaUniqueString:(id)a8 sandboxToken:(const char *)a9 existed:(BOOL)a10 url:(id)a11 info:(id)a12 transient:(BOOL)a13 userManagedAssetsRelPath:(id)a14 creator:(id)a15;
- (NSDictionary)info;
- (NSString)containerPathIdentifier;
- (NSString)creator;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSString)userManagedAssetsRelPath;
- (NSURL)url;
- (NSUUID)uuid;
- (char)sandboxToken;
- (unint64_t)containerClass;
- (void)dealloc;
@end

@implementation MCMResultWithContainerBase

- (BOOL)encodeResultOntoReply:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MCMResultWithContainerBase;
  BOOL v5 = [(MCMResultBase *)&v23 encodeResultOntoReply:v4];
  if (v5)
  {
    v6 = [(MCMResultBase *)self error];

    if (!v6)
    {
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      v8 = [(MCMResultWithContainerBase *)self url];

      if (v8)
      {
        id v9 = [(MCMResultWithContainerBase *)self url];
        [v9 fileSystemRepresentation];
      }
      v10 = [(MCMResultWithContainerBase *)self info];

      if (v10)
      {
        v11 = [(MCMResultWithContainerBase *)self info];
        v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      }
      v12 = [(MCMResultWithContainerBase *)self userManagedAssetsRelPath];

      if (v12)
      {
        id v13 = [(MCMResultWithContainerBase *)self userManagedAssetsRelPath];
        [v13 UTF8String];
      }
      v14 = [(MCMResultWithContainerBase *)self creator];

      if (v14)
      {
        id v15 = [(MCMResultWithContainerBase *)self creator];
        [v15 UTF8String];
      }
      [(MCMResultWithContainerBase *)self existed];
      [(MCMResultWithContainerBase *)self sandboxToken];
      [(MCMResultWithContainerBase *)self transient];
      container_xpc_encode_container_metadata_as_object();
      v24[0] = 0;
      v24[1] = 0;
      v16 = [(MCMResultWithContainerBase *)self uuid];
      [v16 getUUIDBytes:v24];

      id v17 = [(MCMResultWithContainerBase *)self identifier];
      [v17 UTF8String];
      [(MCMResultWithContainerBase *)self containerClass];
      v18 = [(MCMResultWithContainerBase *)self posixUser];
      [v18 UID];
      [(MCMResultWithContainerBase *)self containerPathIdentifier];
      v22 = v10;
      id v19 = objc_claimAutoreleasedReturnValue();
      [v19 UTF8String];
      id v20 = [(MCMResultWithContainerBase *)self personaUniqueString];
      [v20 UTF8String];
      container_xpc_encode_container_as_object();
    }
  }

  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)userManagedAssetsRelPath
{
  return self->_userManagedAssetsRelPath;
}

- (BOOL)transient
{
  return self->_transient;
}

- (char)sandboxToken
{
  return self->_sandboxToken;
}

- (MCMPOSIXUser)posixUser
{
  return self->_posixUser;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (NSDictionary)info
{
  return self->_info;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)existed
{
  return self->_existed;
}

- (NSString)creator
{
  return self->_creator;
}

- (NSString)containerPathIdentifier
{
  return self->_containerPathIdentifier;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (MCMResultWithContainerBase)initWithUUID:(id)a3 containerPathIdentifier:(id)a4 identifier:(id)a5 containerClass:(unint64_t)a6 POSIXUser:(id)a7 personaUniqueString:(id)a8 sandboxToken:(const char *)a9 existed:(BOOL)a10 url:(id)a11 info:(id)a12 transient:(BOOL)a13 userManagedAssetsRelPath:(id)a14 creator:(id)a15
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v30 = a4;
  id v21 = a4;
  id v36 = a5;
  id v35 = a7;
  id v32 = a8;
  id v34 = a8;
  id v33 = a11;
  id v22 = a12;
  id v23 = a14;
  id v24 = a15;
  v37.receiver = self;
  v37.super_class = (Class)MCMResultWithContainerBase;
  v25 = [(MCMResultBase *)&v37 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_uuid, a3);
    v26->_existed = a10;
    objc_storeStrong((id *)&v26->_containerPathIdentifier, v30);
    objc_storeStrong((id *)&v26->_identifier, a5);
    v26->_containerClass = a6;
    objc_storeStrong((id *)&v26->_posixUser, a7);
    objc_storeStrong((id *)&v26->_personaUniqueString, v32);
    if (a9) {
      v27 = strndup(a9, 0x800uLL);
    }
    else {
      v27 = 0;
    }
    v26->_sandboxToken = v27;
    objc_storeStrong((id *)&v26->_url, a11);
    objc_storeStrong((id *)&v26->_info, a12);
    v26->_transient = a13;
    objc_storeStrong((id *)&v26->_userManagedAssetsRelPath, a14);
    objc_storeStrong((id *)&v26->_creator, a15);
  }

  return v26;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)MCMResultWithContainerBase;
  [(MCMResultWithContainerBase *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_userManagedAssetsRelPath, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_posixUser, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_containerPathIdentifier, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (MCMResultWithContainerBase)initWithMetadata:(id)a3 sandboxToken:(const char *)a4 includePath:(BOOL)a5 includeInfo:(BOOL)a6 includeUserManagedAssetsRelPath:(BOOL)a7 includeCreator:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v12 = a3;
  id v13 = v12;
  if (v9 && [v12 conformsToProtocol:&unk_1F2F1ADA0])
  {
    id v35 = [v13 userManagedAssetsDirName];
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v35 = 0;
    if (!v8) {
      goto LABEL_8;
    }
  }
  if ([v13 conformsToProtocol:&unk_1F2F1ADA0])
  {
    id v34 = [v13 creator];
    goto LABEL_9;
  }
LABEL_8:
  id v34 = 0;
LABEL_9:
  v28 = [v13 uuid];
  v27 = [v13 containerPath];
  id v33 = [v27 containerPathIdentifier];
  id v32 = [v13 identifier];
  uint64_t v14 = [v13 containerClass];
  id v15 = [v13 userIdentity];
  v16 = [v15 posixUser];
  id v17 = [v13 userIdentity];
  v18 = [v17 personaUniqueString];
  char v19 = [v13 existed];
  BOOL v31 = v11;
  if (v11)
  {
    v26 = [v13 containerPath];
    id v20 = [v26 containerDataURL];
    if (!v10) {
      goto LABEL_16;
    }
  }
  else
  {
    id v20 = 0;
    if (!v10) {
      goto LABEL_16;
    }
  }
  if ([v13 conformsToProtocol:&unk_1F2F1ADA0])
  {
    id v21 = [v13 info];
    BOOL v10 = 1;
    goto LABEL_17;
  }
  BOOL v10 = 0;
LABEL_16:
  id v21 = 0;
LABEL_17:
  LOBYTE(v25) = [v13 transient];
  LOBYTE(v24) = v19;
  id v22 = [(MCMResultWithContainerBase *)self initWithUUID:v28 containerPathIdentifier:v33 identifier:v32 containerClass:v14 POSIXUser:v16 personaUniqueString:v18 sandboxToken:a4 existed:v24 url:v20 info:v21 transient:v25 userManagedAssetsRelPath:v35 creator:v34];
  if (v10) {

  }
  if (v31)
  {
  }
  return v22;
}

- (MCMResultWithContainerBase)initWithContainerPath:(id)a3 containerIdentity:(id)a4 uuid:(id)a5 sandboxToken:(const char *)a6 includePath:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a3;
  id v23 = a5;
  id v11 = a4;
  id v12 = [v10 containerClassPath];
  id v13 = [v12 userIdentity];
  uint64_t v25 = [v10 containerPathIdentifier];
  v27 = [v11 identifier];

  uint64_t v14 = [v12 containerClass];
  id v15 = [v13 posixUser];
  v16 = [v13 personaUniqueString];
  char v17 = [v10 exists];
  if (v7)
  {
    v18 = [v10 containerDataURL];
  }
  else
  {
    v18 = 0;
  }
  LOBYTE(v22) = [v10 transient];
  LOBYTE(v21) = v17;
  char v19 = [(MCMResultWithContainerBase *)self initWithUUID:v23 containerPathIdentifier:v25 identifier:v27 containerClass:v14 POSIXUser:v15 personaUniqueString:v16 sandboxToken:a6 existed:v21 url:v18 info:0 transient:v22 userManagedAssetsRelPath:0 creator:0];

  if (v7) {
  return v19;
  }
}

@end