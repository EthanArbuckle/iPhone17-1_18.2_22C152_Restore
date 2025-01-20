@interface MCMXPCMessageQuery
- (BOOL)createIfNecessary;
- (BOOL)expectSingleResult;
- (BOOL)extensionsPolicyUsesProxiedClient;
- (BOOL)extensionsUseProxiedClient;
- (BOOL)fuzzyMatchInternalUUID;
- (BOOL)fuzzyMatchTransient;
- (BOOL)includeCreator;
- (BOOL)includeInfoInResult;
- (BOOL)includePathInResult;
- (BOOL)includeUnowned;
- (BOOL)includeUserManagedAssetsRelPath;
- (BOOL)issueSandboxExtensions;
- (BOOL)legacyExtensionPolicy;
- (BOOL)legacyPersonaPolicy;
- (BOOL)transient;
- (MCMUserIdentity)userIdentity;
- (MCMXPCMessageQuery)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSSet)groupIdentifiers;
- (NSSet)identifiers;
- (NSUUID)internalUUID;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)disposition;
- (unsigned)expectedPersonaKernelID;
- (unsigned)uid;
@end

@implementation MCMXPCMessageQuery

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (unsigned)uid
{
  return self->_uid;
}

- (BOOL)transient
{
  return self->_transient;
}

- (BOOL)legacyPersonaPolicy
{
  return self->_legacyPersonaPolicy;
}

- (BOOL)legacyExtensionPolicy
{
  return self->_legacyExtensionPolicy;
}

- (BOOL)issueSandboxExtensions
{
  return self->_issueSandboxExtensions;
}

- (NSUUID)internalUUID
{
  return self->_internalUUID;
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (BOOL)includeUnowned
{
  return self->_includeUnowned;
}

- (BOOL)includePathInResult
{
  return self->_includePathInResult;
}

- (BOOL)includeInfoInResult
{
  return self->_includeInfoInResult;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (BOOL)fuzzyMatchTransient
{
  return self->_fuzzyMatchTransient;
}

- (BOOL)fuzzyMatchInternalUUID
{
  return self->_fuzzyMatchInternalUUID;
}

- (BOOL)extensionsUseProxiedClient
{
  return self->_extensionsUseProxiedClient;
}

- (BOOL)extensionsPolicyUsesProxiedClient
{
  return self->_extensionsPolicyUsesProxiedClient;
}

- (unint64_t)explicitFlags
{
  return self->_explicitFlags;
}

- (BOOL)expectSingleResult
{
  return self->_expectSingleResult;
}

- (unsigned)disposition
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MCMXPCMessageQuery;
  unsigned int v3 = [(MCMXPCMessageWithContainerClassBase *)&v6 disposition];
  if (v3 == 1)
  {
    v4 = [(MCMXPCMessageWithContainerClassBase *)self containerConfig];
    unsigned int v3 = [v4 disposition];
  }
  return v3;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (MCMXPCMessageQuery)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v80.receiver = self;
  v80.super_class = (Class)MCMXPCMessageQuery;
  v10 = [(MCMXPCMessageWithContainerClassBase *)&v80 initWithXPCObject:v8 context:v9 error:a5];
  if (!v10) {
    goto LABEL_50;
  }
  v75 = a5;
  uint64_t v79 = 1;
  v10->_unint64_t privateFlags = xpc_dictionary_get_uint64(v8, "PrivateFlags");
  v10->_unint64_t explicitFlags = xpc_dictionary_get_uint64(v8, "Explicit");
  identifiers = v10->_identifiers;
  v10->_identifiers = 0;

  groupIdentifiers = v10->_groupIdentifiers;
  v10->_groupIdentifiers = 0;

  v10->_createIfNecessary = 0;
  v10->_includeInfoInResult = 0;
  v10->_includePathInResult = 0;
  v10->_issueSandboxExtensions = 0;
  v13 = [v9 clientIdentity];
  v14 = [v13 userIdentity];
  v15 = [v14 posixUser];
  v10->_uid = [v15 UID];

  userIdentity = v10->_userIdentity;
  v10->_userIdentity = 0;

  v10->_transient = 0;
  v10->_includeUnowned = 0;
  v10->_fuzzyMatchTransient = 0;
  v10->_fuzzyMatchInternalUUID = 0;
  v10->_expectSingleResult = 0;
  v10->_legacyPersonaPolicy = 0;
  v10->_legacyExtensionPolicy = 0;
  v10->_extensionsUseProxiedClient = 0;
  v10->_extensionsPolicyUsesProxiedClient = 0;
  unint64_t privateFlags = v10->_privateFlags;
  if (privateFlags)
  {
    v10->_legacyPersonaPolicy = 1;
    unint64_t privateFlags = v10->_privateFlags;
  }
  if ((privateFlags & 2) != 0) {
    v10->_legacyExtensionPolicy = 1;
  }
  unint64_t explicitFlags = v10->_explicitFlags;
  if ((explicitFlags & 1) == 0)
  {
    if ((explicitFlags & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
  v21 = [(MCMXPCMessageBase *)v10 nsObjectFromXPCObject:v8 key:"IdentifiersArray" error:&v79];
  if (v79 != 1)
  {
LABEL_44:
    v20 = a5;
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v79 = 110;
    goto LABEL_44;
  }
  id v71 = v9;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v21 = v21;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v95 objects:v94 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v96;
LABEL_14:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v96 != v24) {
        objc_enumerationMutation(v21);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_43;
      }
      if (v23 == ++v25)
      {
        uint64_t v23 = [v21 countByEnumeratingWithState:&v95 objects:v94 count:16];
        if (v23) {
          goto LABEL_14;
        }
        break;
      }
    }
  }

  uint64_t v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
  v27 = v10->_identifiers;
  v10->_identifiers = (NSSet *)v26;

  unint64_t explicitFlags = v10->_explicitFlags;
  id v9 = v71;
  if ((explicitFlags & 2) == 0)
  {
LABEL_8:
    uint64_t v19 = 72;
    uint64_t v79 = 72;
    v20 = a5;
    if (!a5) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_21:
  v20 = a5;
  if ((explicitFlags & 4) == 0)
  {
    if ((explicitFlags & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v21 = [(MCMXPCMessageBase *)v10 nsObjectFromXPCObject:v8 key:"GroupIdentifiers" error:&v79];
  if (v79 != 1) {
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v79 = 110;
    goto LABEL_45;
  }
  id v71 = v9;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v21 = v21;
  uint64_t v29 = [v21 countByEnumeratingWithState:&v90 objects:v89 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v91;
LABEL_34:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v91 != v31) {
        objc_enumerationMutation(v21);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v30 == ++v32)
      {
        uint64_t v30 = [v21 countByEnumeratingWithState:&v90 objects:v89 count:16];
        if (v30) {
          goto LABEL_34;
        }
        goto LABEL_40;
      }
    }
LABEL_43:
    uint64_t v79 = 110;

    id v9 = v71;
    goto LABEL_44;
  }
LABEL_40:

  uint64_t v33 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
  v34 = v10->_groupIdentifiers;
  v10->_groupIdentifiers = (NSSet *)v33;

  v20 = a5;
  unint64_t explicitFlags = v10->_explicitFlags;
  id v9 = v71;
  if ((explicitFlags & 8) != 0)
  {
LABEL_23:
    v10->_uid = xpc_dictionary_get_uint64(v8, "UID");
    unint64_t explicitFlags = v10->_explicitFlags;
  }
LABEL_24:
  if ((explicitFlags & 0x10) == 0)
  {
    int v28 = 1;
    if ((explicitFlags & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  v36 = [v9 clientIdentity];
  uint64_t v37 = [v36 userIdentity];
  v38 = v10->_userIdentity;
  v10->_userIdentity = (MCMUserIdentity *)v37;

  string = xpc_dictionary_get_string(v8, "PersonaUniqueString");
  if (string)
  {
    v40 = [NSString stringWithUTF8String:string];
  }
  else
  {
    v40 = 0;
  }
  v44 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14058]];
  int v45 = [v40 isEqualToString:v44];

  int v28 = v45;
  if ((v45 & 1) == 0)
  {
    if (v40)
    {
      v46 = [(MCMXPCMessageWithContainerClassBase *)v10 containerConfig];
      BOOL v47 = +[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", [v46 containerClass]);

      if (v47)
      {
        v48 = [v9 clientIdentity];
        uint64_t v49 = [(MCMXPCMessageBase *)v10 userIdentityFromClientPersonaUniqueString:v40 clientIdentity:v48 error:&v79];
        v50 = v10->_userIdentity;
        v10->_userIdentity = (MCMUserIdentity *)v49;
      }
    }
  }
  v51 = v10->_userIdentity;

  if (v51)
  {
    unint64_t explicitFlags = v10->_explicitFlags;
    if ((explicitFlags & 0x20) == 0)
    {
LABEL_27:
      if ((explicitFlags & 0x40) != 0)
      {
        v10->_includeUnowned = xpc_dictionary_get_BOOL(v8, "IncludeUnowned");
        if ((v10->_explicitFlags & 0x80) == 0) {
          goto LABEL_66;
        }
      }
      else if ((explicitFlags & 0x80) == 0)
      {
        goto LABEL_66;
      }
      uuid = xpc_dictionary_get_uuid(v8, "UUID");
      if (uuid)
      {
        uint64_t v42 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
        internalUUID = v10->_internalUUID;
        v10->_internalUUID = (NSUUID *)v42;
      }
      if (!v10->_internalUUID)
      {
        v61 = container_log_handle_for_category();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D7739000, v61, OS_LOG_TYPE_ERROR, "Invalid UUID parameter", buf, 2u);
        }

        uint64_t v19 = 38;
        uint64_t v79 = 38;
        if (!v20) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }
LABEL_66:
      uint64_t uint64 = xpc_dictionary_get_uint64(v8, "Flags");
      if (uint64) {
        v10->_createIfNecessary = 1;
      }
      if ((uint64 & 2) != 0)
      {
        v10->_expectSingleResult = 1;
        if ((uint64 & 0x10000) == 0)
        {
LABEL_70:
          if ((uint64 & 0x20000) == 0) {
            goto LABEL_71;
          }
          goto LABEL_91;
        }
      }
      else if ((uint64 & 0x10000) == 0)
      {
        goto LABEL_70;
      }
      v10->_fuzzyMatchTransient = 1;
      v10->_fuzzyMatchInternalUUID = 1;
      if ((uint64 & 0x20000) == 0)
      {
LABEL_71:
        if ((uint64 & 0x200000000) == 0) {
          goto LABEL_72;
        }
        goto LABEL_92;
      }
LABEL_91:
      v10->_fuzzyMatchInternalUUID = 1;
      if ((uint64 & 0x200000000) == 0)
      {
LABEL_72:
        if ((uint64 & 0x100000000) == 0) {
          goto LABEL_73;
        }
        goto LABEL_93;
      }
LABEL_92:
      v10->_includeInfoInResult = 1;
      if ((uint64 & 0x100000000) == 0)
      {
LABEL_73:
        if ((uint64 & 0x800000000) == 0) {
          goto LABEL_74;
        }
        goto LABEL_94;
      }
LABEL_93:
      v10->_includePathInResult = 1;
      if ((uint64 & 0x800000000) == 0)
      {
LABEL_74:
        if ((uint64 & 0x1000000000) == 0) {
          goto LABEL_75;
        }
        goto LABEL_95;
      }
LABEL_94:
      v10->_issueSandboxExtensions = 1;
      if ((uint64 & 0x1000000000) == 0)
      {
LABEL_75:
        if ((uint64 & 0x2000000000) == 0) {
          goto LABEL_76;
        }
        goto LABEL_96;
      }
LABEL_95:
      v10->_includeUserManagedAssetsRelPath = 1;
      if ((uint64 & 0x2000000000) == 0)
      {
LABEL_76:
        if ((uint64 & 0x1000000000000) == 0)
        {
LABEL_78:
          if ((uint64 & 0x2000000000000) != 0) {
            v10->_extensionsPolicyUsesProxiedClient = 1;
          }
          v10->_unsigned int expectedPersonaKernelID = -1;
          if (v28)
          {
            v53 = [(MCMXPCMessageBase *)v10 context];
            v54 = [v53 userIdentityCache];
            int v55 = [(id)objc_opt_class() personasAreSupported];

            if (v55)
            {
              id v56 = containermanager_copy_global_configuration();
              v21 = [v56 staticConfig];

              uint64_t v57 = xpc_dictionary_get_value(v8, "PersonaKernelID");
              v58 = (void *)v57;
              if (v57 && MEMORY[0x1D94798D0](v57) == MEMORY[0x1E4F145F8])
              {
                v10->_unsigned int expectedPersonaKernelID = xpc_uint64_get_value(v58);
                if ([v9 kernelPersonaID] != v10->_expectedPersonaKernelID)
                {
                  v62 = container_log_handle_for_category();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                  {
                    v78 = [v9 clientIdentity];
                    v74 = [v78 codeSignInfo];
                    v73 = [v74 identifier];
                    [v9 clientIdentity];
                    v67 = v72 = v9;
                    int v68 = [v67 posixPID];
                    unsigned int expectedPersonaKernelID = v10->_expectedPersonaKernelID;
                    int v70 = [v72 kernelPersonaID];
                    *(_DWORD *)buf = 138413058;
                    v82 = v73;
                    __int16 v83 = 1024;
                    int v84 = v68;
                    __int16 v85 = 1024;
                    unsigned int v86 = expectedPersonaKernelID;
                    __int16 v87 = 1024;
                    int v88 = v70;
                    _os_log_error_impl(&dword_1D7739000, v62, OS_LOG_TYPE_ERROR, "Persona failed to propgate; client[%@(%d)] = %d, server = %d",
                      buf,
                      0x1Eu);

                    id v9 = v72;
                    v20 = v75;
                  }
                  if ([v21 errorOnPersonaPropagationFailure])
                  {
                    uint64_t v60 = 151;
                    goto LABEL_88;
                  }
                }
              }
              else
              {
                v59 = container_log_handle_for_category();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  v77 = [v9 clientIdentity];
                  v76 = [v77 codeSignInfo];
                  v63 = [v76 identifier];
                  [v9 clientIdentity];
                  v65 = id v64 = v9;
                  int v66 = [v65 posixPID];
                  *(_DWORD *)buf = 138412546;
                  v82 = v63;
                  __int16 v83 = 1024;
                  int v84 = v66;
                  _os_log_error_impl(&dword_1D7739000, v59, OS_LOG_TYPE_ERROR, "Kernel persona ID is invalid; client[%@(%d)]",
                    buf,
                    0x12u);

                  id v9 = v64;
                }

                if ([v21 errorOnPersonaPropagationFailure])
                {
                  uint64_t v60 = 38;
LABEL_88:
                  uint64_t v79 = v60;
LABEL_110:

                  goto LABEL_45;
                }
              }
            }
          }
          v21 = container_log_handle_for_category();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v58 = [(MCMUserIdentity *)v10->_userIdentity debugDescription];
            *(_DWORD *)buf = 138412290;
            v82 = v58;
            _os_log_debug_impl(&dword_1D7739000, v21, OS_LOG_TYPE_DEBUG, "message userIdentity: %@", buf, 0xCu);
            goto LABEL_110;
          }
LABEL_45:

          goto LABEL_46;
        }
LABEL_77:
        v10->_extensionsUseProxiedClient = 1;
        goto LABEL_78;
      }
LABEL_96:
      v10->_includeCreator = 1;
      if ((uint64 & 0x1000000000000) == 0) {
        goto LABEL_78;
      }
      goto LABEL_77;
    }
LABEL_26:
    v10->_transient = xpc_dictionary_get_BOOL(v8, "Transient");
    unint64_t explicitFlags = v10->_explicitFlags;
    goto LABEL_27;
  }
LABEL_46:
  uint64_t v19 = v79;
  if (v79 != 1)
  {
    if (!v20)
    {
LABEL_49:

      v10 = 0;
      goto LABEL_50;
    }
LABEL_48:
    unint64_t *v20 = v19;
    goto LABEL_49;
  }
LABEL_50:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalUUID, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

- (unint64_t)privateFlags
{
  return self->_privateFlags;
}

@end