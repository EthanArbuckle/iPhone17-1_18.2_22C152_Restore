@interface CUKeychainItem
- (BOOL)_updateWithAttributesDictionary:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (BOOL)invisible;
- (BOOL)isEqualToKeychainItem:(id)a3 flags:(unsigned int)a4;
- (BOOL)legacy;
- (NSArray)removedMetadata;
- (NSData)persistentRef;
- (NSDate)dateCreated;
- (NSDate)dateModified;
- (NSDictionary)metadata;
- (NSDictionary)secrets;
- (NSString)accessGroup;
- (NSString)identifier;
- (NSString)name;
- (NSString)type;
- (NSString)userDescription;
- (NSString)viewHint;
- (id)_attributesDictionaryWithFlags:(unsigned int)a3 error:(id *)a4;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)accessibleType;
- (int)syncType;
- (void)_mergeItem:(id)a3;
- (void)setAccessGroup:(id)a3;
- (void)setAccessibleType:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvisible:(BOOL)a3;
- (void)setLegacy:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setName:(id)a3;
- (void)setPersistentRef:(id)a3;
- (void)setRemovedMetadata:(id)a3;
- (void)setSecrets:(id)a3;
- (void)setSyncType:(int)a3;
- (void)setType:(id)a3;
- (void)setUserDescription:(id)a3;
- (void)setViewHint:(id)a3;
@end

@implementation CUKeychainItem

- (NSData)persistentRef
{
  return self->_persistentRef;
}

- (id)_attributesDictionaryWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v14 = v7;
  if ((a3 & 0x80000) == 0)
  {
    accessGroup = self->_accessGroup;
    if (accessGroup) {
      [v7 setObject:accessGroup forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    }
  }
  v15 = (void *)MEMORY[0x1E4F3B5B0];
  switch(self->_accessibleType)
  {
    case 0:
      goto LABEL_14;
    case 1:
      goto LABEL_13;
    case 2:
      v15 = (void *)MEMORY[0x1E4F3B570];
      goto LABEL_13;
    case 3:
      v15 = (void *)MEMORY[0x1E4F3B588];
      goto LABEL_13;
    case 4:
      v15 = (void *)MEMORY[0x1E4F3B5A8];
      goto LABEL_13;
    case 5:
      v15 = (void *)MEMORY[0x1E4F3B5B8];
      goto LABEL_13;
    case 6:
      v15 = (void *)MEMORY[0x1E4F3B578];
      goto LABEL_13;
    case 7:
      v15 = (void *)MEMORY[0x1E4F3B598];
LABEL_13:
      [v14 setObject:*v15 forKeyedSubscript:*MEMORY[0x1E4F3B558]];
LABEL_14:
      if ((a3 & 0x80000) == 0) {
        [v14 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
      }
      identifier = self->_identifier;
      if (identifier) {
        [v14 setObject:identifier forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
      }
      if (self->_invisible) {
        [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3B698]];
      }
      v18 = self->_metadata;
      v19 = v18;
      if (!v18) {
        goto LABEL_23;
      }
      unsigned int v55 = 0;
      CFMutableDataRef DataMutable = OPACKEncoderCreateDataMutable((const __CFString *)v18, 8u, (int *)&v55);
      if (DataMutable)
      {
        CFMutableDataRef v27 = DataMutable;
        [v14 setObject:DataMutable forKeyedSubscript:*MEMORY[0x1E4F3B688]];

LABEL_23:
        name = self->_name;
        if (name) {
          [v14 setObject:name forKeyedSubscript:*MEMORY[0x1E4F3B788]];
        }
        persistentRef = self->_persistentRef;
        if (persistentRef) {
          [v14 setObject:persistentRef forKeyedSubscript:*MEMORY[0x1E4F3BD40]];
        }
        v30 = self->_secrets;
        v37 = v30;
        if (v30)
        {
          unsigned int v54 = 0;
          CFMutableDataRef v38 = OPACKEncoderCreateDataMutable((const __CFString *)v30, 8u, (int *)&v54);
          if (!v38)
          {
            if (a4)
            {
              if (v54) {
                uint64_t v48 = v54;
              }
              else {
                uint64_t v48 = 4294960596;
              }
              NSErrorWithOSStatusF(v48, (uint64_t)"Encode secrets failed", v39, v40, v41, v42, v43, v44, v53);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_44:
            id v16 = 0;
            goto LABEL_64;
          }
          CFMutableDataRef v45 = v38;
          [v14 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F3BD38]];
        }
        if ((a3 & 0x80000) == 0)
        {
          v46 = (void *)MEMORY[0x1E4F1CFC8];
          switch(self->_syncType)
          {
            case 0:
              break;
            case 1:
              goto LABEL_48;
            case 2:
              v46 = (void *)MEMORY[0x1E4F1CFD0];
              goto LABEL_48;
            case 3:
              v46 = (void *)MEMORY[0x1E4F3B880];
LABEL_48:
              [v14 setObject:*v46 forKeyedSubscript:*MEMORY[0x1E4F3B878]];
              break;
            default:
              if (!a4) {
                goto LABEL_44;
              }
              NSErrorWithOSStatusF(4294960591, (uint64_t)"Unknown SyncType (%d)", v31, v32, v33, v34, v35, v36, self->_syncType);
              id v16 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_64;
          }
        }
        if ((a3 & 0x20) != 0) {
          [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
        }
        type = self->_type;
        if (type) {
          [v14 setObject:type forKeyedSubscript:*MEMORY[0x1E4F3B850]];
        }
        userDescription = self->_userDescription;
        if (userDescription) {
          [v14 setObject:userDescription forKeyedSubscript:*MEMORY[0x1E4F3B678]];
        }
        if ((a3 & 0x80000) == 0)
        {
          viewHint = self->_viewHint;
          if (viewHint) {
            [v14 setObject:viewHint forKeyedSubscript:*MEMORY[0x1E4F3B870]];
          }
        }
        if ((a3 & 0x40000) != 0)
        {
          [v14 setObject:*MEMORY[0x1E4F3BB88] forKeyedSubscript:*MEMORY[0x1E4F3BB80]];
          if ((a3 & 8) == 0)
          {
LABEL_60:
            if ((a3 & 0x10000) == 0) {
              goto LABEL_61;
            }
            goto LABEL_71;
          }
        }
        else if ((a3 & 8) == 0)
        {
          goto LABEL_60;
        }
        [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC78]];
        if ((a3 & 0x10000) == 0)
        {
LABEL_61:
          if ((a3 & 0x20000) == 0)
          {
LABEL_63:
            id v16 = v14;
LABEL_64:

            goto LABEL_65;
          }
LABEL_62:
          [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC70]];
          goto LABEL_63;
        }
LABEL_71:
        [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC68]];
        if ((a3 & 0x20000) == 0) {
          goto LABEL_63;
        }
        goto LABEL_62;
      }
      if (a4)
      {
        if (v55) {
          uint64_t v47 = v55;
        }
        else {
          uint64_t v47 = 4294960596;
        }
        NSErrorWithOSStatusF(v47, (uint64_t)"Encode metadata failed", v21, v22, v23, v24, v25, v26, v53);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v16 = 0;
LABEL_65:

LABEL_66:
      return v16;
    default:
      if (a4)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"Unknown AccessibleType (%d)", (uint64_t)accessGroup, v9, v10, v11, v12, v13, self->_accessibleType);
        id v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v16 = 0;
      }
      goto LABEL_66;
  }
}

- (void)setType:(id)a3
{
}

- (void)setAccessGroup:(id)a3
{
}

- (void)setSyncType:(int)a3
{
  self->_syncType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewHint, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_secrets, 0);
  objc_storeStrong((id *)&self->_persistentRef, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_removedMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

- (void)setViewHint:(id)a3
{
}

- (NSString)viewHint
{
  return self->_viewHint;
}

- (void)setUserDescription:(id)a3
{
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (NSString)type
{
  return self->_type;
}

- (int)syncType
{
  return self->_syncType;
}

- (void)setSecrets:(id)a3
{
}

- (NSDictionary)secrets
{
  return self->_secrets;
}

- (void)setPersistentRef:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setRemovedMetadata:(id)a3
{
}

- (NSArray)removedMetadata
{
  return self->_removedMetadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setLegacy:(BOOL)a3
{
  self->_legacy = a3;
}

- (BOOL)legacy
{
  return self->_legacy;
}

- (void)setInvisible:(BOOL)a3
{
  self->_invisible = a3;
}

- (BOOL)invisible
{
  return self->_invisible;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setAccessibleType:(int)a3
{
  self->_accessibleType = a3;
}

- (int)accessibleType
{
  return self->_accessibleType;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (BOOL)_updateWithAttributesDictionary:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  char v6 = a4;
  v99[1] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v8 = (const __CFDictionary *)a3;
  uint64_t v9 = (const void *)*MEMORY[0x1E4F3B550];
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t v11 = CFDictionaryGetTypedValue(v8, v9, TypeID, 0);
  if (v11) {
    objc_storeStrong((id *)&self->_accessGroup, v11);
  }

  uint64_t v12 = (const void *)*MEMORY[0x1E4F3B558];
  CFTypeID v13 = CFStringGetTypeID();
  v14 = CFDictionaryGetTypedValue(v8, v12, v13, 0);
  v15 = v14;
  if (v14)
  {
    if ([v14 isEqual:*MEMORY[0x1E4F3B5B0]])
    {
      int v16 = 1;
    }
    else if ([v15 isEqual:*MEMORY[0x1E4F3B570]])
    {
      int v16 = 2;
    }
    else if ([v15 isEqual:*MEMORY[0x1E4F3B588]])
    {
      int v16 = 3;
    }
    else if ([v15 isEqual:*MEMORY[0x1E4F3B5A8]])
    {
      int v16 = 4;
    }
    else if ([v15 isEqual:*MEMORY[0x1E4F3B5B8]])
    {
      int v16 = 5;
    }
    else if ([v15 isEqual:*MEMORY[0x1E4F3B578]])
    {
      int v16 = 6;
    }
    else
    {
      if (([v15 isEqual:*MEMORY[0x1E4F3B598]] & 1) == 0)
      {
        if (a5)
        {
          NSErrorWithOSStatusF(4294960561, (uint64_t)"Unsupported kSecAttrAccessible (%@)", v17, v18, v19, v20, v21, v22, (uint64_t)v15);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_69;
      }
      int v16 = 7;
    }
    self->_accessibleType = v16;
  }

  uint64_t v23 = (const void *)*MEMORY[0x1E4F3B668];
  CFTypeID v24 = CFDateGetTypeID();
  uint64_t v25 = CFDictionaryGetTypedValue(v8, v23, v24, 0);
  if (v25) {
    objc_storeStrong((id *)&self->_dateCreated, v25);
  }

  uint64_t v26 = (const void *)*MEMORY[0x1E4F3B790];
  CFTypeID v27 = CFDateGetTypeID();
  v28 = CFDictionaryGetTypedValue(v8, v26, v27, 0);
  if (v28) {
    objc_storeStrong((id *)&self->_dateModified, v28);
  }

  v29 = (const void *)*MEMORY[0x1E4F3B5C0];
  CFTypeID v30 = CFStringGetTypeID();
  uint64_t v31 = CFDictionaryGetTypedValue(v8, v29, v30, 0);
  if (v31) {
    objc_storeStrong((id *)&self->_identifier, v31);
  }

  self->_invisible = CFDictionaryGetInt64(v8, (const void *)*MEMORY[0x1E4F3B698], 0) != 0;
  uint64_t v32 = (const void *)*MEMORY[0x1E4F3B688];
  CFTypeID v33 = CFDataGetTypeID();
  uint64_t v34 = CFDictionaryGetTypedValue(v8, v32, v33, 0);
  v15 = v34;
  if (v34 && [v34 length])
  {
    unsigned int v89 = 0;
    uint64_t v41 = (NSDictionary *)OPACKDecodeData((const __CFData *)v15, 8u, &v89);
    if (!v41)
    {
      if ((v6 & 4) == 0)
      {
        if (a5)
        {
          if (v89) {
            uint64_t v42 = v89;
          }
          else {
            uint64_t v42 = 4294960534;
          }
          uint64_t v43 = "Decode metadata failed";
LABEL_54:
          NSErrorWithOSStatusF(v42, (uint64_t)v43, v35, v36, v37, v38, v39, v40, v88);
          uint64_t v41 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_68;
        }
        goto LABEL_59;
      }
      v98 = @"_legacyData";
      v99[0] = v15;
      uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:&v98 count:1];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((v6 & 4) == 0)
      {
        if (!a5)
        {
LABEL_68:

LABEL_69:
          BOOL v75 = 0;
          goto LABEL_79;
        }
        uint64_t v44 = (objc_class *)objc_opt_class();
        CFMutableDataRef v45 = NSStringFromClass(v44);
        NSErrorWithOSStatusF(4294960540, (uint64_t)"Decoded metadata non-dictionary (%@)", v46, v47, v48, v49, v50, v51, (uint64_t)v45);
LABEL_67:
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_68;
      }
      v96 = @"_legacyData";
      v97 = v15;
      uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];

      uint64_t v41 = (NSDictionary *)v52;
    }
    metadata = self->_metadata;
    self->_metadata = v41;
  }
  unsigned int v54 = (const void *)*MEMORY[0x1E4F3B788];
  CFTypeID v55 = CFStringGetTypeID();
  v56 = CFDictionaryGetTypedValue(v8, v54, v55, 0);
  if (v56) {
    objc_storeStrong((id *)&self->_name, v56);
  }

  v57 = (const void *)*MEMORY[0x1E4F3BD40];
  CFTypeID v58 = CFDataGetTypeID();
  v59 = CFDictionaryGetTypedValue(v8, v57, v58, 0);
  if (v59) {
    objc_storeStrong((id *)&self->_persistentRef, v59);
  }

  v60 = (const void *)*MEMORY[0x1E4F3BD38];
  CFTypeID v61 = CFDataGetTypeID();
  v62 = CFDictionaryGetTypedValue(v8, v60, v61, 0);
  v15 = v62;
  if (v62 && [v62 length])
  {
    unsigned int v89 = 0;
    uint64_t v41 = (NSDictionary *)OPACKDecodeData((const __CFData *)v15, 8u, &v89);
    if (v41)
    {
LABEL_63:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((v6 & 4) == 0)
        {
          if (!a5) {
            goto LABEL_68;
          }
          v68 = (objc_class *)objc_opt_class();
          CFMutableDataRef v45 = NSStringFromClass(v68);
          NSErrorWithOSStatusF(4294960540, (uint64_t)"Decoded secrets non-dictionary (%@)", v69, v70, v71, v72, v73, v74, (uint64_t)v45);
          goto LABEL_67;
        }
        v90 = @"_legacyData";
        v91 = v15;
        uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];

        uint64_t v41 = (NSDictionary *)v76;
      }
      secrets = self->_secrets;
      self->_secrets = v41;

      goto LABEL_72;
    }
    if ((v6 & 4) == 0)
    {
      if (a5)
      {
        if (v89) {
          uint64_t v42 = v89;
        }
        else {
          uint64_t v42 = 4294960534;
        }
        uint64_t v43 = "Decode secrets failed";
        goto LABEL_54;
      }
LABEL_59:
      uint64_t v41 = 0;
      goto LABEL_68;
    }
    v63 = [MEMORY[0x1E4F28F98] propertyListWithData:v15 options:0 format:0 error:0];
    if (v63 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ((v6 & 0x10) != 0)
      {
        v67 = v63;
        goto LABEL_62;
      }
      v94 = @"_legacyPlist";
      v95 = v63;
      v64 = (void *)MEMORY[0x1E4F1C9E8];
      v65 = &v95;
      v66 = &v94;
    }
    else
    {
      v92 = @"_legacyData";
      v93 = v15;
      v64 = (void *)MEMORY[0x1E4F1C9E8];
      v65 = &v93;
      v66 = &v92;
    }
    v67 = [v64 dictionaryWithObjects:v65 forKeys:v66 count:1];
LABEL_62:
    uint64_t v41 = v67;

    goto LABEL_63;
  }
LABEL_72:

  v78 = (const void *)*MEMORY[0x1E4F3B850];
  CFTypeID v79 = CFStringGetTypeID();
  v80 = CFDictionaryGetTypedValue(v8, v78, v79, 0);
  if (v80) {
    objc_storeStrong((id *)&self->_type, v80);
  }

  v81 = (const void *)*MEMORY[0x1E4F3B678];
  CFTypeID v82 = CFStringGetTypeID();
  v83 = CFDictionaryGetTypedValue(v8, v81, v82, 0);
  if (v83) {
    objc_storeStrong((id *)&self->_userDescription, v83);
  }

  v84 = (const void *)*MEMORY[0x1E4F3B870];
  CFTypeID v85 = CFStringGetTypeID();
  v86 = CFDictionaryGetTypedValue(v8, v84, v85, 0);
  if (v86) {
    objc_storeStrong((id *)&self->_viewHint, v86);
  }

  BOOL v75 = 1;
LABEL_79:

  return v75;
}

- (void)_mergeItem:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 accessGroup];
  if (v5) {
    objc_storeStrong((id *)&self->_accessGroup, v5);
  }

  int v6 = [v4 accessibleType];
  if (v6) {
    self->_accessibleType = v6;
  }
  id v7 = [v4 identifier];
  if (v7) {
    objc_storeStrong((id *)&self->_identifier, v7);
  }

  self->_invisible = [v4 invisible];
  CFDictionaryRef v8 = [v4 metadata];
  if (v8)
  {
    uint64_t v9 = (void *)[(NSDictionary *)self->_metadata mutableCopy];
    uint64_t v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v12 = v11;

    [v12 addEntriesFromDictionary:v8];
    CFTypeID v13 = (NSDictionary *)[v12 copy];
    metadata = self->_metadata;
    self->_metadata = v13;
  }
  v15 = [v4 removedMetadata];
  if (v15)
  {
    int v16 = (void *)[(NSDictionary *)self->_metadata mutableCopy];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, *(void *)(*((void *)&v36 + 1) + 8 * i), (void)v36);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v19);
    }

    uint64_t v22 = (NSDictionary *)[v16 copy];
    uint64_t v23 = self->_metadata;
    self->_metadata = v22;
  }
  CFTypeID v24 = [v4 name];
  if (v24) {
    objc_storeStrong((id *)&self->_name, v24);
  }

  uint64_t v25 = [v4 secrets];
  if (v25)
  {
    uint64_t v26 = (void *)[(NSDictionary *)self->_secrets mutableCopy];
    CFTypeID v27 = v26;
    if (v26) {
      id v28 = v26;
    }
    else {
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v29 = v28;

    [v29 addEntriesFromDictionary:v25];
    CFTypeID v30 = (NSDictionary *)[v29 copy];
    secrets = self->_secrets;
    self->_secrets = v30;
  }
  int v32 = objc_msgSend(v4, "syncType", (void)v36);
  if (v32) {
    self->_syncType = v32;
  }
  CFTypeID v33 = [v4 type];
  if (v33) {
    objc_storeStrong((id *)&self->_type, v33);
  }

  uint64_t v34 = [v4 userDescription];
  if (v34) {
    objc_storeStrong((id *)&self->_userDescription, v34);
  }

  uint64_t v35 = [v4 viewHint];
  if (v35) {
    objc_storeStrong((id *)&self->_viewHint, v35);
  }
}

- (BOOL)isEqualToKeychainItem:(id)a3 flags:(unsigned int)a4
{
  char v4 = a4;
  id v6 = a3;
  identifier = self->_identifier;
  CFDictionaryRef v8 = [v6 identifier];
  uint64_t v9 = identifier;
  uint64_t v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    id v11 = v10;
    if ((v9 == 0) == (v10 != 0)) {
      goto LABEL_32;
    }
    int v12 = [(NSDictionary *)v9 isEqual:v10];

    if (!v12) {
      goto LABEL_25;
    }
  }
  int invisible = self->_invisible;
  if (invisible == [v6 invisible])
  {
    type = self->_type;
    v15 = [v6 type];
    uint64_t v9 = type;
    int v16 = v15;
    if (v9 == v16)
    {
    }
    else
    {
      id v11 = v16;
      if ((v9 == 0) == (v16 != 0)) {
        goto LABEL_32;
      }
      int v17 = [(NSDictionary *)v9 isEqual:v16];

      if (!v17) {
        goto LABEL_25;
      }
    }
    name = self->_name;
    uint64_t v19 = [v6 name];
    uint64_t v9 = name;
    uint64_t v20 = v19;
    if (v9 == v20)
    {
    }
    else
    {
      id v11 = v20;
      if ((v9 == 0) == (v20 != 0)) {
        goto LABEL_32;
      }
      int v21 = [(NSDictionary *)v9 isEqual:v20];

      if (!v21) {
        goto LABEL_25;
      }
    }
    metadata = self->_metadata;
    uint64_t v23 = [v6 metadata];
    uint64_t v9 = metadata;
    CFTypeID v24 = v23;
    if (v9 == v24)
    {
    }
    else
    {
      id v11 = v24;
      if ((v9 == 0) == (v24 != 0)) {
        goto LABEL_32;
      }
      int v25 = [(NSDictionary *)v9 isEqual:v24];

      if (!v25) {
        goto LABEL_25;
      }
    }
    userDescription = self->_userDescription;
    CFTypeID v27 = [v6 userDescription];
    uint64_t v9 = userDescription;
    id v28 = v27;
    if (v9 == v28)
    {
    }
    else
    {
      id v11 = v28;
      if ((v9 == 0) == (v28 != 0)) {
        goto LABEL_32;
      }
      int v29 = [(NSDictionary *)v9 isEqual:v28];

      if (!v29) {
        goto LABEL_25;
      }
    }
    if ((v4 & 1) == 0)
    {
      char v30 = 1;
      goto LABEL_34;
    }
    secrets = self->_secrets;
    int v32 = [v6 secrets];
    uint64_t v9 = secrets;
    CFTypeID v33 = v32;
    if (v9 == v33)
    {
      char v30 = 1;
      id v11 = v9;
      goto LABEL_33;
    }
    id v11 = v33;
    if ((v9 == 0) != (v33 != 0))
    {
      char v30 = [(NSDictionary *)v9 isEqual:v33];
LABEL_33:

      goto LABEL_34;
    }
LABEL_32:
    char v30 = 0;
    goto LABEL_33;
  }
LABEL_25:
  char v30 = 0;
LABEL_34:

  return v30;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    uint64_t v10 = 0;
    if ((a3 & 0x800000) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    CFMutableStringRef v150 = 0;
    NSAppendPrintF(&v150, (uint64_t)"CUKeychainItem ", *(uint64_t *)&a3, v3, v4, v5, v6, v7, v128);
    uint64_t v10 = v150;
    if ((a3 & 0x800000) != 0)
    {
LABEL_3:
      CFMutableStringRef v149 = v10;
      id v11 = &v149;
      NSAppendPrintF(&v149, (uint64_t)"ID '%@'", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
      goto LABEL_6;
    }
  }
  CFMutableStringRef v148 = v10;
  id v11 = &v148;
  NSAppendPrintF(&v148, (uint64_t)"ID '%{mask}'", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
LABEL_6:
  int v12 = *v11;

  type = self->_type;
  if (type)
  {
    CFMutableStringRef v147 = v12;
    v14 = type;
    NSAppendPrintF(&v147, (uint64_t)", Type '%@'", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    int v21 = v147;

    int v12 = v21;
  }
  uint64_t v22 = self->_name;
  int v29 = v22;
  if (v22)
  {
    if ((a3 & 0x800000) != 0)
    {
      CFMutableStringRef v146 = v12;
      char v30 = &v146;
      NSAppendPrintF(&v146, (uint64_t)", Name '%@'", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
    }
    else
    {
      CFMutableStringRef v145 = v12;
      char v30 = &v145;
      NSAppendPrintF(&v145, (uint64_t)", Name '%{mask}'", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
    }
    uint64_t v31 = *v30;

    int v12 = v31;
  }

  unsigned int v38 = a3;
  if (a3 < 0x1Fu)
  {
    dateCreated = self->_dateCreated;
    if (dateCreated)
    {
      CFMutableStringRef v144 = v12;
      uint64_t v40 = dateCreated;
      NSAppendPrintF(&v144, (uint64_t)", Created %@", v41, v42, v43, v44, v45, v46, (uint64_t)v40);
      uint64_t v47 = v144;

      int v12 = v47;
    }
    dateModified = self->_dateModified;
    if (dateModified)
    {
      CFMutableStringRef v143 = v12;
      uint64_t v49 = dateModified;
      NSAppendPrintF(&v143, (uint64_t)", Modified %@", v50, v51, v52, v53, v54, v55, (uint64_t)v49);
      v56 = v143;

      uint64_t v57 = 100;
      int v12 = v56;
    }
    else
    {
      uint64_t v57 = 100;
    }
    goto LABEL_27;
  }
  if (a3 < 0x29u)
  {
    uint64_t v57 = 16;
LABEL_27:
    metadata = self->_metadata;
    if (metadata)
    {
      CFMutableStringRef v142 = v12;
      v132 = metadata;
      NSAppendPrintF(&v142, (uint64_t)", Metadata %##.*@", v88, v89, v90, v91, v92, v93, v57);
      v94 = v142;

      int v12 = v94;
    }
    persistentRef = self->_persistentRef;
    if (persistentRef)
    {
      CFMutableStringRef v141 = v12;
      v133 = persistentRef;
      NSAppendPrintF(&v141, (uint64_t)", PersistentRef <%.*@>", v96, v97, v98, v99, v100, v101, v57);
      v102 = v141;

      int v12 = v102;
    }
    v103 = self->_secrets;
    CFTypeID v79 = v103;
    if (!v103) {
      goto LABEL_36;
    }
    if ((a3 & 0x800000) != 0)
    {
      CFMutableStringRef v140 = v12;
      v80 = &v140;
      NSAppendPrintF(&v140, (uint64_t)", Secrets %##.*@", v104, v105, v106, v107, v108, v109, v57);
    }
    else
    {
      CFMutableStringRef v139 = v12;
      uint64_t v131 = [(NSDictionary *)v103 count];
      v80 = &v139;
      NSAppendPrintF(&v139, (uint64_t)", Secrets (%d)", v110, v111, v112, v113, v114, v115, v131);
    }
LABEL_35:
    v116 = *v80;

    int v12 = v116;
LABEL_36:

    goto LABEL_37;
  }
  CFTypeID v58 = self->_metadata;
  if (v58)
  {
    CFMutableStringRef v138 = v12;
    v59 = v58;
    uint64_t v60 = [(NSDictionary *)v59 count];
    NSAppendPrintF(&v138, (uint64_t)", Metadata (%d)", v61, v62, v63, v64, v65, v66, v60);
    v67 = v138;

    int v12 = v67;
  }
  v68 = self->_persistentRef;
  if (v68)
  {
    CFMutableStringRef v137 = v12;
    uint64_t v69 = v68;
    uint64_t v70 = [(NSData *)v69 length];
    NSAppendPrintF(&v137, (uint64_t)", PersistentRef %d bytes", v71, v72, v73, v74, v75, v76, v70);
    v77 = v137;

    int v12 = v77;
  }
  secrets = self->_secrets;
  if (secrets)
  {
    CFMutableStringRef v136 = v12;
    CFTypeID v79 = secrets;
    uint64_t v130 = [(NSDictionary *)v79 count];
    v80 = &v136;
    NSAppendPrintF(&v136, (uint64_t)", Secrets (%d)", v81, v82, v83, v84, v85, v86, v130);
    goto LABEL_35;
  }
LABEL_37:
  viewHint = self->_viewHint;
  if (viewHint)
  {
    CFMutableStringRef v135 = v12;
    v118 = viewHint;
    NSAppendPrintF(&v135, (uint64_t)", View '%@'", v119, v120, v121, v122, v123, v124, (uint64_t)v118);
    v125 = v135;

    int v12 = v125;
  }
  if (v38 < 0x15)
  {
    CFMutableStringRef v134 = v12;
    NSAppendPrintF(&v134, (uint64_t)"\n", v32, v33, v34, v35, v36, v37, v129);
    v126 = v134;

    int v12 = v126;
  }
  return v12;
}

- (id)description
{
  return [(CUKeychainItem *)self descriptionWithLevel:50];
}

@end