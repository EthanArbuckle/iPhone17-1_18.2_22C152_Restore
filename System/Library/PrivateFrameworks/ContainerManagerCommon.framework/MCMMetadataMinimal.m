@interface MCMMetadataMinimal
- (BOOL)_initFromMetadataInDictionary:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 fsNode:(id)a7 fileURL:(id)a8 userIdentityCache:(id)a9 error:(id *)a10;
- (BOOL)_persisted;
- (BOOL)existed;
- (BOOL)transient;
- (MCMConcreteContainerIdentityForLibsystem)containerIdentity;
- (MCMContainerPath)containerPath;
- (MCMMetadataMinimal)initWithContainerIdentity:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 userIdentityCache:(id)a6;
- (MCMUserIdentity)userIdentity;
- (MCMUserIdentityCache)userIdentityCache;
- (NSNumber)schemaVersion;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (NSString)shortDescription;
- (NSUUID)uuid;
- (container_object_s)createLibsystemContainerWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initByReadingAndValidatingMetadataAtContainerPath:(id)a3 userIdentity:(id)a4 containerClass:(unint64_t)a5 userIdentityCache:(id)a6 error:(id *)a7;
- (id)initByReadingAndValidatingMetadataAtFileURL:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 userIdentityCache:(id)a7 error:(id *)a8;
- (id)metadataByChangingContainerIdentity:(id)a3;
- (id)metadataByChangingContainerPath:(id)a3;
- (id)metadataByChangingSchemaVersion:(id)a3;
- (id)metadataByChangingUUID:(id)a3;
- (id)metadataBySettingTransient:(BOOL)a3;
- (unint64_t)containerClass;
- (unsigned)platform;
@end

@implementation MCMMetadataMinimal

- (MCMMetadataMinimal)initWithContainerIdentity:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 userIdentityCache:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MCMMetadataMinimal;
  v15 = [(MCMMetadataMinimal *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_containerPath, a4);
    objc_storeStrong((id *)&v16->_containerIdentity, a3);
    if (v13) {
      v17 = v13;
    }
    else {
      v17 = &unk_1F2F12398;
    }
    objc_storeStrong((id *)&v16->_schemaVersion, v17);
    objc_storeStrong((id *)&v16->_userIdentityCache, a6);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);

  objc_storeStrong((id *)&self->_containerPath, 0);
}

- (id)metadataByChangingContainerIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(MCMMetadataMinimal *)self copy];
  v6 = (void *)v5[3];
  v5[3] = v4;

  [v5 _clearPersistedStatus];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_containerPath);
    objc_storeStrong(v5 + 2, self->_schemaVersion);
    objc_storeStrong(v5 + 3, self->_containerIdentity);
    objc_storeStrong(v5 + 4, self->_userIdentityCache);
  }
  return v5;
}

- (MCMContainerPath)containerPath
{
  return self->_containerPath;
}

- (container_object_s)createLibsystemContainerWithError:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = 1;
  v5 = [(MCMMetadataMinimal *)self containerIdentity];
  v6 = [(MCMMetadataMinimal *)self containerPath];
  v7 = [v6 containerPathIdentifier];
  v8 = (container_object_s *)objc_msgSend(v5, "createLibsystemContainerWithContainerPathIdentifier:existed:error:", v7, -[MCMMetadataMinimal existed](self, "existed"), v11);

  if (a3 && !v8)
  {
    v9 = [MCMError alloc];
    *a3 = [(MCMError *)v9 initWithErrorType:v11[0]];
  }
  return v8;
}

- (MCMConcreteContainerIdentityForLibsystem)containerIdentity
{
  return self->_containerIdentity;
}

- (BOOL)existed
{
  containerIdentity = self->_containerIdentity;

  return [(MCMConcreteContainerIdentityForLibsystem *)containerIdentity existed];
}

- (MCMUserIdentity)userIdentity
{
  containerIdentity = self->_containerIdentity;

  return [(MCMContainerIdentityMinimal *)containerIdentity userIdentity];
}

- (NSUUID)uuid
{
  containerIdentity = self->_containerIdentity;

  return [(MCMConcreteContainerIdentity *)containerIdentity uuid];
}

- (NSString)identifier
{
  containerIdentity = self->_containerIdentity;

  return [(MCMContainerIdentityMinimal *)containerIdentity identifier];
}

- (unint64_t)containerClass
{
  containerIdentity = self->_containerIdentity;

  return [(MCMContainerIdentityMinimal *)containerIdentity containerClass];
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (BOOL)_persisted
{
  return 0;
}

- (BOOL)_initFromMetadataInDictionary:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 fsNode:(id)a7 fileURL:(id)a8 userIdentityCache:(id)a9 error:(id *)a10
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v122 = a5;
  id v16 = a8;
  id v123 = a9;
  v17 = [v14 objectForKeyedSubscript:@"MCMMetadataIdentifier"];
  v18 = [v14 objectForKeyedSubscript:@"MCMMetadataVersion"];
  objc_storeStrong((id *)&self->_userIdentityCache, a9);
  objc_storeStrong((id *)&self->_containerPath, a4);
  v124 = v17;
  v121 = v16;
  if (v18)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v20 = NSNumber;
    if (isKindOfClass)
    {
      v21 = v18;
      v18 = objc_msgSend(v20, "numberWithInteger:", -[NSObject integerValue](v21, "integerValue"));

      if ([v18 integerValue] > 5)
      {
        v22 = [MCMError alloc];
        v23 = [v16 path];
        v24 = [(MCMError *)v22 initWithErrorType:29 category:5 path:v23 POSIXerrno:0];

        v25 = container_log_handle_for_category();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v76 = (objc_class *)objc_opt_class();
          NSStringFromClass(v76);
          v78 = id v77 = v15;
          *(_DWORD *)buf = 138412546;
          unint64_t v128 = (unint64_t)v78;
          __int16 v129 = 2112;
          *(void *)v130 = v18;
          _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Invalid metadata version: (%@) %@", buf, 0x16u);

          id v15 = v77;
        }
        goto LABEL_6;
      }

      v17 = v124;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = [MCMError alloc];
        v27 = [v16 path];
        v24 = [(MCMError *)v26 initWithErrorType:29 category:5 path:v27 POSIXerrno:0];

        v21 = container_log_handle_for_category();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        v28 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138412546;
        unint64_t v128 = (unint64_t)v25;
        __int16 v129 = 2112;
        *(void *)v130 = v18;
        v29 = "Invalid metadata version: (%@) %@";
        v30 = v21;
        uint32_t v31 = 22;
        goto LABEL_63;
      }
    }
  }
  else
  {
    v18 = &unk_1F2F11A08;
  }
  objc_opt_class();
  id v32 = v17;
  if (objc_opt_isKindOfClass()) {
    id v33 = v32;
  }
  else {
    id v33 = 0;
  }

  if (!v33)
  {
    id v37 = v15;
    v38 = [MCMError alloc];
    v39 = [v16 path];
    v24 = [(MCMError *)v38 initWithErrorType:29 category:5 path:v39 POSIXerrno:0];

    v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v128 = (unint64_t)v32;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Invalid metadata Identifier: %@", buf, 0xCu);
    }
    v40 = 0;
    id v41 = 0;
    id v42 = 0;
    id v15 = v37;
    goto LABEL_52;
  }
  v34 = [v14 objectForKeyedSubscript:@"MCMMetadataUUID"];
  objc_opt_class();
  id v35 = v34;
  if (objc_opt_isKindOfClass()) {
    id v36 = v35;
  }
  else {
    id v36 = 0;
  }

  if (!v36)
  {
    v47 = [MCMError alloc];
    v48 = [v16 path];
    v24 = [(MCMError *)v47 initWithErrorType:29 category:5 path:v48 POSIXerrno:0];

    v21 = container_log_handle_for_category();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    v25 = [v14 objectForKeyedSubscript:@"MCMMetadataUUID"];
    *(_DWORD *)buf = 138412290;
    unint64_t v128 = (unint64_t)v25;
    v29 = "Invalid metadata UUID String: %@";
    v30 = v21;
    uint32_t v31 = 12;
LABEL_63:
    _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
LABEL_6:

LABEL_26:
    v40 = 0;
    id v41 = 0;
    id v42 = 0;
LABEL_52:

    if (a10)
    {
      v24 = v24;
      BOOL v71 = 0;
      *a10 = v24;
    }
    else
    {
      BOOL v71 = 0;
    }
    v72 = v123;
    v73 = v124;
    goto LABEL_56;
  }
  id v43 = objc_alloc(MEMORY[0x1E4F29128]);
  v44 = [v14 objectForKeyedSubscript:@"MCMMetadataUUID"];
  v45 = (void *)[v43 initWithUUIDString:v44];

  objc_opt_class();
  id v42 = v45;
  if (objc_opt_isKindOfClass()) {
    id v46 = v42;
  }
  else {
    id v46 = 0;
  }

  if (!v46)
  {
    v52 = [MCMError alloc];
    v53 = [v16 path];
    v24 = [(MCMError *)v52 initWithErrorType:29 category:5 path:v53 POSIXerrno:0];

    v21 = container_log_handle_for_category();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_51:
      v40 = 0;
      id v41 = 0;
      goto LABEL_52;
    }
    *(_DWORD *)buf = 138412290;
    unint64_t v128 = (unint64_t)v42;
    v54 = "Invalid metadata UUID: %@";
LABEL_95:
    _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, v54, buf, 0xCu);
    goto LABEL_51;
  }
  v49 = [v14 objectForKeyedSubscript:@"MCMMetadataContentClass"];
  objc_opt_class();
  id v50 = v49;
  if (objc_opt_isKindOfClass()) {
    id v51 = v50;
  }
  else {
    id v51 = 0;
  }

  if (!v51)
  {
    v66 = [MCMError alloc];
    v67 = [v16 path];
    v24 = [(MCMError *)v66 initWithErrorType:29 category:5 path:v67 POSIXerrno:0];

    v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v68 = [v14 objectForKeyedSubscript:@"MCMMetadataContentClass"];
      *(_DWORD *)buf = 138412290;
      unint64_t v128 = (unint64_t)v68;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Invalid metadata Class: %@", buf, 0xCu);
    }
    goto LABEL_51;
  }
  v55 = [v14 objectForKeyedSubscript:@"MCMMetadataContentClass"];
  uint64_t v56 = [v55 unsignedLongLongValue];

  if ((unint64_t)(v56 - 1) >= 0xE)
  {
    v69 = [MCMError alloc];
    v70 = [v16 path];
    v24 = [(MCMError *)v69 initWithErrorType:29 category:5 path:v70 POSIXerrno:0];

    v21 = container_log_handle_for_category();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_51;
    }
    *(_DWORD *)buf = 134217984;
    unint64_t v128 = a6;
    v54 = "Invalid metadata Content Class: %ld";
    goto LABEL_95;
  }
  if (container_class_normalized() != a6)
  {
    v57 = container_log_handle_for_category();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v128 = (unint64_t)v32;
      __int16 v129 = 2050;
      *(void *)v130 = v56;
      *(_WORD *)&v130[8] = 2050;
      *(void *)&v130[10] = a6;
      _os_log_error_impl(&dword_1D7739000, v57, OS_LOG_TYPE_ERROR, "Container [%@] declares its class to be [%{public}llu] while scanning for class [%{public}llu]", buf, 0x20u);
    }
  }
  id v58 = containermanager_copy_global_configuration();
  v59 = [v58 staticConfig];
  v40 = [v59 configForContainerClass:a6];

  v119 = v15;
  if ([v40 personaAndUserSpecific])
  {
    v21 = [v14 objectForKeyedSubscript:@"MCMMetadataPersona"];
    v60 = [v122 posixUser];
    v61 = +[MCMContainerClassPath posixOwnerForContainerClass:a6 user:v60];

    v118 = v61;
    if (a6 <= 0xB && ((1 << a6) & 0xED4) != 0)
    {
      if (v21)
      {
        int v62 = [v61 UID];
        if (v62 != [v21 unsignedIntValue])
        {
          v63 = [MCMError alloc];
          v64 = [v121 path];
          v24 = [(MCMError *)v63 initWithErrorType:29 category:5 path:v64 POSIXerrno:0];

          v65 = container_log_handle_for_category();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            int v108 = [v61 UID];
            *(_DWORD *)buf = 138412802;
            unint64_t v128 = (unint64_t)v21;
            __int16 v129 = 1024;
            *(_DWORD *)v130 = v108;
            *(_WORD *)&v130[4] = 2112;
            *(void *)&v130[6] = v32;
            _os_log_error_impl(&dword_1D7739000, v65, OS_LOG_TYPE_ERROR, "Incorrect UserId: %@, expecting: %u for %@", buf, 0x1Cu);
          }

          id v41 = 0;
          goto LABEL_104;
        }
      }
      else
      {
        v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v61, "UID"));
      }
    }
    v79 = [v14 objectForKeyedSubscript:@"MCMMetadataUserIdentity"];

    if (!v79)
    {
      unsigned int v86 = [v21 unsignedIntValue];
      if (v86 == 499) {
        uint64_t v87 = 0;
      }
      else {
        uint64_t v87 = v86;
      }
      v88 = +[MCMPOSIXUser posixUserWithUID:v87];
      id v41 = [v123 userIdentityForPersonalPersonaWithPOSIXUser:v88];

      goto LABEL_77;
    }
    uint64_t v126 = 1;
    v80 = [v14 objectForKeyedSubscript:@"MCMMetadataUserIdentity"];
    id v41 = +[MCMUserIdentity userIdentityWithPlist:v80 cache:v123 error:&v126];

    if (v41)
    {
LABEL_67:
      if (([v41 isEqual:v122] & 1) == 0)
      {
        id v81 = containermanager_copy_global_configuration();
        if ([v81 runmode] == 2)
        {
          id v116 = containermanager_copy_global_configuration();
          v82 = [v116 currentUser];
          id v111 = containermanager_copy_global_configuration();
          [v111 defaultUser];
          v83 = v114 = v81;
          int v112 = [v82 isEqual:v83];

          if (v112)
          {
            v84 = container_log_handle_for_category();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              unint64_t v128 = (unint64_t)v32;
              __int16 v129 = 2048;
              *(void *)v130 = a6;
              _os_log_impl(&dword_1D7739000, v84, OS_LOG_TYPE_DEFAULT, "User identity reconstructed from metadata for [%@(%llu)] doesn't match expected, assuming the current user identity.", buf, 0x16u);
            }

            id v85 = v122;
            id v41 = v85;
            goto LABEL_77;
          }
        }
        else
        {
        }
        v106 = [MCMError alloc];
        v107 = [v121 path];
        v24 = [(MCMError *)v106 initWithErrorType:29 category:5 path:v107 POSIXerrno:0];

        v105 = container_log_handle_for_category();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          unint64_t v128 = (unint64_t)v41;
          __int16 v129 = 2112;
          *(void *)v130 = v122;
          *(_WORD *)&v130[8] = 2112;
          *(void *)&v130[10] = v32;
          __int16 v131 = 2048;
          uint64_t v132 = v126;
          _os_log_error_impl(&dword_1D7739000, v105, OS_LOG_TYPE_ERROR, "Incorrect User Identity: %@, expecting: %@ for %@: %llu", buf, 0x2Au);
        }
LABEL_103:

LABEL_104:
LABEL_105:
        id v15 = v119;
        goto LABEL_52;
      }
LABEL_77:

      goto LABEL_80;
    }
    id v99 = containermanager_copy_global_configuration();
    if ([v99 runmode] == 2)
    {
      id v117 = containermanager_copy_global_configuration();
      v100 = [v117 currentUser];
      id v113 = containermanager_copy_global_configuration();
      v101 = [v113 defaultUser];
      int v115 = [v100 isEqual:v101];

      if (v115)
      {
        v102 = container_log_handle_for_category();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v128 = (unint64_t)v32;
          __int16 v129 = 2048;
          *(void *)v130 = a6;
          _os_log_impl(&dword_1D7739000, v102, OS_LOG_TYPE_DEFAULT, "Could not reconstruct user identity from metadata for [%@(%llu)], assuming the current user identity.", buf, 0x16u);
        }

        id v41 = v122;
        goto LABEL_67;
      }
    }
    else
    {
    }
    v103 = [MCMError alloc];
    v104 = [v121 path];
    v24 = [(MCMError *)v103 initWithErrorType:29 category:5 path:v104 POSIXerrno:0];

    v105 = container_log_handle_for_category();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      v109 = [v14 objectForKeyedSubscript:@"MCMMetadataUserIdentity"];
      *(_DWORD *)buf = 138412802;
      unint64_t v128 = (unint64_t)v109;
      __int16 v129 = 2112;
      *(void *)v130 = v32;
      *(_WORD *)&v130[8] = 2048;
      *(void *)&v130[10] = v126;
      _os_log_error_impl(&dword_1D7739000, v105, OS_LOG_TYPE_ERROR, "Invalid metadata User Identity: %@ for %@: %llu", buf, 0x20u);
    }
    id v41 = 0;
    goto LABEL_103;
  }
  if ([v40 usesGlobalBundleUserIdentity])
  {
    uint64_t v75 = [v123 globalBundleUserIdentity];
  }
  else
  {
    if ([v40 usesGlobalSystemUserIdentity]) {
      [v123 globalSystemUserIdentity];
    }
    else {
    uint64_t v75 = [v123 defaultUserIdentity];
    }
  }
  id v41 = (id)v75;
LABEL_80:
  v89 = [(MCMContainerPath *)self->_containerPath containerClassPath];
  [v89 setExists:1];

  [(MCMContainerPath *)self->_containerPath setExists:1];
  uint64_t v125 = 1;
  LOBYTE(v89) = [v119 transient];
  v90 = [v119 containerPathIdentifier];
  BYTE1(v110) = (_BYTE)v89;
  LOBYTE(v110) = 1;
  +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:](MCMConcreteContainerIdentityForLibsystem, "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v42, v41, v32, v40, 0, v90, v110, v123, &v125);
  v91 = (MCMConcreteContainerIdentityForLibsystem *)objc_claimAutoreleasedReturnValue();
  containerIdentity = self->_containerIdentity;
  self->_containerIdentity = v91;

  if (!self->_containerIdentity)
  {
    v96 = [MCMError alloc];
    v97 = [v121 path];
    v24 = [(MCMError *)v96 initWithErrorType:29 category:5 path:v97 POSIXerrno:0];

    v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v128 = v125;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Could not create container identity: %llu", buf, 0xCu);
    }
    goto LABEL_105;
  }
  v93 = [v14 objectForKeyedSubscript:@"MCMMetadataSchemaVersion"];
  objc_opt_class();
  id v94 = v93;
  if (objc_opt_isKindOfClass()) {
    v95 = (NSNumber *)v94;
  }
  else {
    v95 = 0;
  }
  v72 = v123;
  v73 = v124;

  schemaVersion = self->_schemaVersion;
  self->_schemaVersion = v95;

  if (!self->_schemaVersion) {
    self->_schemaVersion = (NSNumber *)&unk_1F2F11A08;
  }
  v24 = 0;
  BOOL v71 = 1;
  id v15 = v119;
LABEL_56:

  return v71;
}

- (NSString)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__MCMMetadataMinimal_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  uint64_t v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return (NSString *)v4;
}

id __33__MCMMetadataMinimal_description__block_invoke(uint64_t a1, int a2)
{
  v18 = NSString;
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  v5 = v4;
  v6 = v4;
  if (a2)
  {
    v6 = [v4 redactedDescription];
  }
  objc_super v19 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) containerClass];
  if ([*(id *)(a1 + 32) transient]) {
    v8 = "T";
  }
  else {
    v8 = "";
  }
  v9 = [*(id *)(a1 + 32) userIdentity];
  v10 = [v9 shortDescription];
  id v11 = v10;
  id v12 = v10;
  if (a2)
  {
    id v12 = [v10 redactedDescription];
  }
  id v13 = [*(id *)(a1 + 32) uuid];
  id v14 = [*(id *)(a1 + 32) containerPath];
  id v15 = [v14 containerPathIdentifier];
  id v16 = [v18 stringWithFormat:@"<%@(%llu%s);%@;u%@;p%@>", v6, v7, v8, v12, v13, v15];

  if (a2)
  {

    id v11 = v9;
  }
  else
  {
    v6 = v9;
  }

  return v16;
}

- (NSString)shortDescription
{
  return [(MCMMetadataMinimal *)self description];
}

- (NSString)debugDescription
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__MCMMetadataMinimal_debugDescription__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  uint64_t v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return (NSString *)v4;
}

id __38__MCMMetadataMinimal_debugDescription__block_invoke(uint64_t a1, int a2)
{
  v23 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 userIdentity];
  v8 = v7;
  uint64_t v9 = (uint64_t)v7;
  if (a2)
  {
    uint64_t v9 = [v7 redactedDescription];
  }
  v10 = [*(id *)(a1 + 32) uuid];
  uint64_t v11 = [*(id *)(a1 + 32) containerClass];
  uint64_t v12 = [*(id *)(a1 + 32) transient];
  id v13 = [*(id *)(a1 + 32) identifier];
  id v14 = v13;
  if (a2)
  {
    id v15 = [v13 redactedDescription];
    id v16 = [*(id *)(a1 + 32) containerPath];
    [v16 redactedDescription];
    v22 = v8;
    v18 = v17 = v5;
    objc_msgSend(v23, "stringWithFormat:", @"<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@>",
      v17,
      v6,
      v9,
      v10,
      v11,
      v12,
      v15,
    objc_super v19 = v18);

    v5 = v17;
    v8 = v22;

    uint64_t v20 = v14;
    id v14 = v10;
    v10 = (void *)v9;
  }
  else
  {
    uint64_t v20 = [*(id *)(a1 + 32) containerPath];
    objc_msgSend(v23, "stringWithFormat:", @"<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@>",
      v5,
      v6,
      v9,
      v10,
      v11,
      v12,
      v14,
    objc_super v19 = v20);
  }

  return v19;
}

- (id)metadataByChangingSchemaVersion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(MCMMetadataMinimal *)self copy];
  v6 = (void *)v5[2];
  v5[2] = v4;

  [v5 _clearPersistedStatus];

  return v5;
}

- (id)metadataByChangingUUID:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(MCMMetadataMinimal *)self copy];
  v6 = [(MCMMetadataMinimal *)self containerIdentity];
  uint64_t v7 = [v6 identityByChangingUUID:v4];

  v8 = (void *)v5[3];
  v5[3] = v7;

  [v5 _clearPersistedStatus];

  return v5;
}

- (id)metadataByChangingContainerPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(MCMMetadataMinimal *)self copy];
  v6 = (void *)v5[1];
  v5[1] = v4;
  id v7 = v4;

  v8 = (void *)v5[3];
  uint64_t v9 = [v7 containerPathIdentifier];
  uint64_t v10 = [v8 identityByChangingContainerPathIdentifier:v9];
  uint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  [v5 _clearPersistedStatus];

  return v5;
}

- (id)metadataBySettingTransient:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)[(MCMMetadataMinimal *)self copy];
  v6 = [(MCMMetadataMinimal *)self containerIdentity];
  uint64_t v7 = [v6 identityByChangingTransient:v3];

  v8 = (void *)v5[3];
  v5[3] = v7;

  [v5 _clearPersistedStatus];

  return v5;
}

- (unsigned)platform
{
  containerIdentity = self->_containerIdentity;

  return [(MCMContainerIdentityMinimal *)containerIdentity platform];
}

- (BOOL)transient
{
  containerIdentity = self->_containerIdentity;

  return [(MCMContainerIdentity *)containerIdentity transient];
}

- (id)initByReadingAndValidatingMetadataAtFileURL:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 userIdentityCache:(id)a7 error:(id *)a8
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v60 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  BOOL v71 = __Block_byref_object_copy__2992;
  v72 = __Block_byref_object_dispose__2993;
  id v73 = 0;
  v61 = [v13 URLByDeletingLastPathComponent];
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__2992;
  v66[4] = __Block_byref_object_dispose__2993;
  id v67 = 0;
  v65.receiver = self;
  v65.super_class = (Class)MCMMetadataMinimal;
  id v16 = [(MCMMetadataMinimal *)&v65 init];
  if (!v16)
  {
    uint64_t v20 = 0;
    v18 = 0;
    goto LABEL_36;
  }
  v59 = [v15 libraryRepairForUserIdentity:v14];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __132__MCMMetadataMinimal_initByReadingAndValidatingMetadataAtFileURL_containerPath_userIdentity_containerClass_userIdentityCache_error___block_invoke;
  v63[3] = &unk_1E6A805A0;
  v63[4] = &v68;
  v63[5] = v66;
  id v64 = 0;
  [v59 fixAndRetryIfPermissionsErrorWithURL:v13 containerRootURL:v61 error:&v64 duringBlock:v63];
  v17 = (MCMError *)v64;
  v18 = v17;
  if (v69[5])
  {
    objc_super v19 = 0;
    goto LABEL_26;
  }
  if (v17)
  {
    v21 = [(MCMError *)v17 domain];
    if ([v21 isEqual:*MEMORY[0x1E4F281F8]])
    {
      BOOL v22 = [(MCMError *)v18 code] == 2048;

      if (v22)
      {
        v23 = [MCMError alloc];
        v24 = [v13 path];
        uint64_t v20 = [(MCMError *)v23 initWithErrorType:108 category:5 path:v24 POSIXerrno:0];

        v25 = container_log_handle_for_category();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = [v13 path];
          *(_DWORD *)buf = 138543362;
          uint64_t v75 = v26;
          _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Metadata file at [%{public}@] is corrupt.", buf, 0xCu);
        }
        goto LABEL_23;
      }
    }
    else
    {
    }
  }
  v27 = [(MCMError *)v18 domain];
  uint64_t v28 = *MEMORY[0x1E4F28798];
  int v29 = [v27 isEqual:*MEMORY[0x1E4F28798]];

  if (v29)
  {
    v30 = [(MCMError *)v18 domain];
    if ([v30 isEqualToString:v28])
    {
      BOOL v31 = [(MCMError *)v18 code] == 2;

      if (v31)
      {
LABEL_22:
        v34 = [MCMError alloc];
        v25 = [v13 path];
        uint64_t v20 = [(MCMError *)v34 initWithErrorType:127 category:1 path:v25 POSIXerrno:[(MCMError *)v18 code]];
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
    }
    id v33 = container_log_handle_for_category();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v49 = [v13 path];
      *(_DWORD *)buf = 138543618;
      uint64_t v75 = v49;
      __int16 v76 = 2112;
      id v77 = v18;
      _os_log_error_impl(&dword_1D7739000, v33, OS_LOG_TYPE_ERROR, "Could not read metadata file at [%{public}@]; error = %@",
        buf,
        0x16u);
    }
    goto LABEL_22;
  }
  id v32 = container_log_handle_for_category();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v48 = [v13 path];
    *(_DWORD *)buf = 138543618;
    uint64_t v75 = v48;
    __int16 v76 = 2112;
    id v77 = v18;
    _os_log_error_impl(&dword_1D7739000, v32, OS_LOG_TYPE_ERROR, "Could not read metadata file at [%{public}@]; error = %@",
      buf,
      0x16u);
  }
  uint64_t v20 = [[MCMError alloc] initWithErrorType:12];
LABEL_24:
  if (v69[5])
  {
    objc_super v19 = v20;
LABEL_26:
    int v62 = v19;
    BOOL v35 = -[MCMMetadataMinimal _initFromMetadataInDictionary:containerPath:userIdentity:containerClass:fsNode:fileURL:userIdentityCache:error:](v16, "_initFromMetadataInDictionary:containerPath:userIdentity:containerClass:fsNode:fileURL:userIdentityCache:error:", v15, &v62);
    uint64_t v20 = v62;

    if (v35)
    {
      id v36 = container_log_handle_for_category();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG);

      if (v37)
      {
        v38 = container_log_handle_for_category();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v47 = [(MCMMetadataMinimal *)v16 uuid];
          id v58 = [(MCMMetadataMinimal *)v16 containerPath];
          uint64_t v56 = [v58 containerPathIdentifier];
          v55 = [(MCMMetadataMinimal *)v16 identifier];
          uint64_t v54 = [(MCMMetadataMinimal *)v16 containerClass];
          int v57 = [(MCMMetadataMinimal *)v16 conformsToProtocol:&unk_1F2F1ADA0];
          if (v57)
          {
            v52 = [(MCMMetadataMinimal *)v16 fsNode];
            uint64_t v53 = [v52 inode];
          }
          else
          {
            uint64_t v53 = 0;
          }
          id v50 = [v13 path];
          id v51 = [(MCMMetadataMinimal *)v16 shortDescription];
          *(_DWORD *)buf = 138544898;
          uint64_t v75 = v47;
          __int16 v76 = 2114;
          id v77 = v56;
          __int16 v78 = 2112;
          v79 = v55;
          __int16 v80 = 2050;
          uint64_t v81 = v54;
          __int16 v82 = 2048;
          uint64_t v83 = v53;
          __int16 v84 = 2112;
          id v85 = v50;
          __int16 v86 = 2112;
          uint64_t v87 = v51;
          _os_log_debug_impl(&dword_1D7739000, v38, OS_LOG_TYPE_DEBUG, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Read metadata from [%@]: %@", buf, 0x48u);

          if (v57) {
        }
          }
      }
      goto LABEL_44;
    }
    goto LABEL_35;
  }
  if (!v20)
  {
    v39 = [(MCMError *)v18 domain];
    int v40 = [v39 isEqualToString:*MEMORY[0x1E4F28798]];

    if (v40)
    {
      id v41 = [MCMError alloc];
      id v42 = [v13 path];
      uint64_t v20 = [(MCMError *)v41 initWithErrorType:127 category:1 path:v42 POSIXerrno:[(MCMError *)v18 code]];
    }
    else
    {
      uint64_t v20 = [[MCMError alloc] initWithErrorType:108];
    }
  }
LABEL_35:

LABEL_36:
  if ([(MCMError *)v20 category] != 1 || [(MCMError *)v20 POSIXerrno] != 2)
  {
    id v43 = container_log_handle_for_category();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      id v46 = [v13 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v75 = v46;
      __int16 v76 = 2112;
      id v77 = v20;
      _os_log_error_impl(&dword_1D7739000, v43, OS_LOG_TYPE_ERROR, "Failed to read container metadata [%@]: %@", buf, 0x16u);
    }
  }

  if (a8)
  {
    uint64_t v20 = v20;
    id v16 = 0;
    *a8 = v20;
  }
  else
  {
    id v16 = 0;
  }
LABEL_44:
  v44 = v16;
  _Block_object_dispose(v66, 8);

  _Block_object_dispose(&v68, 8);
  return v44;
}

BOOL __132__MCMMetadataMinimal_initByReadingAndValidatingMetadataAtFileURL_containerPath_userIdentity_containerClass_userIdentityCache_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  obj[0] = *(id *)(v4 + 40);
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "MCM_dictionaryWithContentsOfURL:options:fsNode:error:", a2, 0, obj, a3);
  objc_storeStrong((id *)(v4 + 40), obj[0]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (id)initByReadingAndValidatingMetadataAtContainerPath:(id)a3 userIdentity:(id)a4 containerClass:(unint64_t)a5 userIdentityCache:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v14 metadataURL];
  id v16 = [(MCMMetadataMinimal *)self initByReadingAndValidatingMetadataAtFileURL:v15 containerPath:v14 userIdentity:v13 containerClass:a5 userIdentityCache:v12 error:a7];

  return v16;
}

@end