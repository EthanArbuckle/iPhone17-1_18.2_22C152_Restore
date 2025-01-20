@interface NSURL(IconFoundationAdditions)
- (BOOL)_IF_conformsToUTI:()IconFoundationAdditions;
- (BOOL)_IF_getResourceValue:()IconFoundationAdditions forKey:error:;
- (id)_IF_attributeModifiedDate;
- (id)_IF_contentModifiedDate;
- (id)_IF_extendedAttributeForName:()IconFoundationAdditions;
- (id)_IF_modifiedDate;
- (id)_IF_typeIdentifier;
- (id)_IF_volumeURL;
- (uint64_t)_IF_fileSize;
- (uint64_t)_IF_isAliasFile;
- (uint64_t)_IF_isBootVolume;
- (uint64_t)_IF_isDirectory;
- (uint64_t)_IF_isOnBootVolume;
- (uint64_t)_IF_isSymLink;
- (uint64_t)_IF_isVolume;
- (uint64_t)_IF_setExtendedAttribute:()IconFoundationAdditions forName:error:;
- (void)_IF_contentModifiedDate;
@end

@implementation NSURL(IconFoundationAdditions)

- (id)_IF_extendedAttributeForName:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = a1;
  v6 = (const char *)[v5 fileSystemRepresentation];
  id v7 = v4;
  v8 = (const char *)[v7 fileSystemRepresentation];
  if (!v6 || (v9 = v8) == 0)
  {
    v14 = IFDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(NSURL(IconFoundationAdditions) *)(uint64_t)v5 _IF_extendedAttributeForName:v14];
    }

    goto LABEL_9;
  }
  ssize_t v10 = getxattr(v6, v8, 0, 0, 0, 0);
  if (v10 < 1)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  size_t v11 = v10;
  v12 = malloc_type_malloc(v10, 0x3050905EuLL);
  if (getxattr(v6, v9, v12, v11, 0, 0) != v11) {
    -[NSURL(IconFoundationAdditions) _IF_extendedAttributeForName:]();
  }
  v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:v11 freeWhenDone:1];
LABEL_10:

  return v13;
}

- (uint64_t)_IF_setExtendedAttribute:()IconFoundationAdditions forName:error:
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a1;
  size_t v11 = (const char *)[v10 fileSystemRepresentation];
  id v12 = v9;
  v13 = (const char *)[v12 fileSystemRepresentation];
  if (v11)
  {
    v14 = v13;
    if (v13)
    {
      if (v8)
      {
        id v15 = v8;
        if (setxattr(v11, v14, (const void *)[v15 bytes], objc_msgSend(v15, "length"), 0, 0))
        {
LABEL_5:
          v16 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v17 = *MEMORY[0x1E4F28798];
          uint64_t v18 = *__error();
          uint64_t v19 = *MEMORY[0x1E4F28228];
          uint64_t v33 = *MEMORY[0x1E4F28228];
          v20 = NSString;
          v21 = __error();
          v22 = [v20 stringWithFormat:@"Failed to set xattr %@ with name %@ error %s", v8, v12, strerror(*v21), v33];
          v34 = v22;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          v24 = v16;
          uint64_t v25 = v17;
          uint64_t v26 = v18;
          goto LABEL_7;
        }
      }
      else if (removexattr(v11, v13, 0))
      {
        goto LABEL_5;
      }
      id v29 = 0;
      goto LABEL_15;
    }
  }
  v27 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v28 = *MEMORY[0x1E4F28760];
  uint64_t v19 = *MEMORY[0x1E4F28228];
  uint64_t v35 = *MEMORY[0x1E4F28228];
  v22 = [NSString stringWithFormat:@"XAttr set on invalid URL %@ or with invalid name %@", v10, v12];
  v36[0] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
  v24 = v27;
  uint64_t v25 = v28;
  uint64_t v26 = -43;
LABEL_7:
  id v29 = [v24 errorWithDomain:v25 code:v26 userInfo:v23];

  if (!v29)
  {
LABEL_15:
    uint64_t v31 = 1;
    goto LABEL_16;
  }
  v30 = IFDefaultLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    -[NSURL(IconFoundationAdditions) _IF_setExtendedAttribute:forName:error:](v29, v19, v30);
  }

  if (a5)
  {
    id v29 = v29;
    uint64_t v31 = 0;
    *a5 = v29;
  }
  else
  {
    uint64_t v31 = 0;
  }
LABEL_16:

  return v31;
}

- (id)_IF_contentModifiedDate
{
  id v13 = 0;
  int v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v13, *MEMORY[0x1E4F1C530], 0);
  id v2 = v13;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = IFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(NSURL(IconFoundationAdditions) *)v3 _IF_contentModifiedDate];
    }

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantPast];

    id v2 = (id)v11;
  }

  return v2;
}

- (BOOL)_IF_getResourceValue:()IconFoundationAdditions forKey:error:
{
  id v9 = 0;
  CFErrorRef error = 0;
  int v7 = CFURLCopyResourcePropertyForKey(a1, key, &v9, &error);
  if (v7)
  {
    *a3 = v9;
  }
  else if (a5 && error)
  {
    *a5 = error;
  }
  else if (error)
  {
    CFRelease(error);
  }
  return v7 != 0;
}

- (id)_IF_attributeModifiedDate
{
  id v13 = 0;
  int v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v13, *MEMORY[0x1E4F1C518], 0);
  id v2 = v13;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = IFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(NSURL(IconFoundationAdditions) *)v3 _IF_contentModifiedDate];
    }

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantPast];

    id v2 = (id)v11;
  }

  return v2;
}

- (id)_IF_modifiedDate
{
  id v2 = objc_msgSend(a1, "_IF_attributeModifiedDate");
  v3 = objc_msgSend(a1, "_IF_contentModifiedDate");
  if ([v3 compare:v2] == -1) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (uint64_t)_IF_fileSize
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C5F8], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 integerValue];

  return v3;
}

- (uint64_t)_IF_isVolume
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C6A0], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (id)_IF_volumeURL
{
  id v4 = 0;
  int v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v4, *MEMORY[0x1E4F1C960], 0);
  id v2 = v4;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }

  return v2;
}

- (uint64_t)_IF_isBootVolume
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C870], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)_IF_isOnBootVolume
{
  int v1 = objc_msgSend(a1, "_IF_volumeURL");
  uint64_t v2 = objc_msgSend(v1, "_IF_isBootVolume");

  return v2;
}

- (uint64_t)_IF_isSymLink
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C680], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)_IF_isAliasFile
{
  id v6 = 0;
  int v2 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v6, *MEMORY[0x1E4F1C610], 0);
  id v3 = v6;
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v3 = 0;
  }
  if ([v3 BOOLValue]) {
    uint64_t v4 = objc_msgSend(a1, "_IF_isSymLink") ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_IF_typeIdentifier
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C728], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v3 = (id)*MEMORY[0x1E4F22590];

    id v2 = v3;
  }

  return v2;
}

- (BOOL)_IF_conformsToUTI:()IconFoundationAdditions
{
  uint64_t v4 = a3;
  CFStringRef inUTI = 0;
  objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &inUTI, *MEMORY[0x1E4F1C728], 0);
  if (inUTI) {
    BOOL v5 = UTTypeConformsTo(inUTI, v4) != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)_IF_isDirectory
{
  id v13 = 0;
  int v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v13, *MEMORY[0x1E4F1C628], 0);
  id v2 = v13;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v3 = IFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(NSURL(IconFoundationAdditions) *)v3 _IF_contentModifiedDate];
    }

    id v2 = 0;
  }
  uint64_t v11 = [v2 BOOLValue];

  return v11;
}

- (void)_IF_extendedAttributeForName:()IconFoundationAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DC6CA000, log, OS_LOG_TYPE_ERROR, "XAttr set on invalid URL %@ or with invalid name %@", (uint8_t *)&v3, 0x16u);
}

- (void)_IF_extendedAttributeForName:()IconFoundationAdditions .cold.2()
{
  __assert_rtn("-[NSURL(IconFoundationAdditions) _IF_extendedAttributeForName:]", "NSURL+IconFoundationAdditions.m", 32, "getxattr(cPath, cName, buffer, length, 0, 0) == length");
}

- (void)_IF_setExtendedAttribute:()IconFoundationAdditions forName:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  __int16 v5 = [a1 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:a2];
  int v7 = 138412290;
  uint64_t v8 = v6;
  _os_log_error_impl(&dword_1DC6CA000, a3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
}

- (void)_IF_contentModifiedDate
{
}

@end