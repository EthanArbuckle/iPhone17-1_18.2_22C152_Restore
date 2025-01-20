@interface BRFileProviderHelper
+ (id)_br_getDomainIdentifierForAccountDescriptor:(id)a3;
+ (id)br_getDomainIdentifierForACAccountID:(id)a3;
+ (id)br_getDomainIdentifierForCurrentPersona;
+ (id)br_getDomainIdentifierForDataSeparated:(BOOL)a3;
+ (id)br_getProviderDomainIDForCurrentPersona;
+ (id)br_getProviderDomainIDForDataSeparated:(BOOL)a3;
+ (id)br_getProviderDomainIDForDomainIdentifier:(id)a3 dataSeparated:(BOOL)a4;
+ (id)br_getProviderIDForCurrentPersona;
+ (id)br_getProviderIDForDataSeparated:(BOOL)a3;
@end

@implementation BRFileProviderHelper

+ (id)br_getProviderIDForCurrentPersona
{
  uint64_t IsDataSeparated = BRCurrentPersonaIsDataSeparated();

  return (id)objc_msgSend(a1, "br_getProviderIDForDataSeparated:", IsDataSeparated);
}

+ (id)br_getProviderIDForDataSeparated:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = BRIsFPFSEnabled(a1, a2);
  v5 = @"com.apple.CloudDocs.MobileDocumentsFileProviderManaged";
  if (v4) {
    v5 = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
  }
  v6 = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
  if (v4) {
    v6 = @"com.apple.CloudDocs.iCloudDriveFileProvider";
  }
  if (v3) {
    return v5;
  }
  else {
    return v6;
  }
}

+ (id)br_getProviderDomainIDForCurrentPersona
{
  BOOL v3 = objc_msgSend(a1, "br_getDomainIdentifierForCurrentPersona");
  int v4 = objc_msgSend(a1, "br_getProviderDomainIDForDomainIdentifier:dataSeparated:", v3, BRCurrentPersonaIsDataSeparated());

  return v4;
}

+ (id)br_getProviderDomainIDForDataSeparated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_msgSend(a1, "br_getDomainIdentifierForDataSeparated:");
  v6 = objc_msgSend(a1, "br_getProviderDomainIDForDomainIdentifier:dataSeparated:", v5, v3);

  return v6;
}

+ (id)br_getProviderDomainIDForDomainIdentifier:(id)a3 dataSeparated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_msgSend(a1, "br_getProviderIDForDataSeparated:", v4);
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v9 = [v7 stringByAppendingPathComponent:v6];
  }

  return v9;
}

+ (id)br_getDomainIdentifierForDataSeparated:(BOOL)a3
{
  int v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = +[BRAccountDescriptor allEligibleAccountDescriptors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 isDataSeparated] == v3)
        {
          v12 = brc_bread_crumbs((uint64_t)"+[BRFileProviderHelper br_getDomainIdentifierForDataSeparated:]", 70);
          v13 = brc_default_log(1);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            +[BRFileProviderHelper br_getDomainIdentifierForDataSeparated:v13];
          }

          v11 = objc_msgSend(a1, "_br_getDomainIdentifierForAccountDescriptor:", v10);
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

+ (id)br_getDomainIdentifierForCurrentPersona
{
  int v3 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  BOOL v4 = +[BRAccountDescriptor accountDescriptorForPersonaID:v3 mustBeLoggedIn:0];
  v5 = objc_msgSend(a1, "_br_getDomainIdentifierForAccountDescriptor:", v4);

  return v5;
}

+ (id)br_getDomainIdentifierForACAccountID:(id)a3
{
  BOOL v4 = +[BRAccountDescriptor accountDescriptorForAccountID:a3 mustBeLoggedIn:0];
  v5 = objc_msgSend(a1, "_br_getDomainIdentifierForAccountDescriptor:", v4);

  return v5;
}

+ (id)_br_getDomainIdentifierForAccountDescriptor:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v5 = v3;
  if (v3)
  {
    if ((BRIsFPFSEnabled(v3, v4) & 1) != 0 || [v5 isDataSeparated])
    {
      uint64_t v6 = [v5 domainIdentifier];
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v7 = brc_bread_crumbs((uint64_t)"+[BRFileProviderHelper _br_getDomainIdentifierForAccountDescriptor:]", 94);
    uint64_t v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] Couldn't resolve an account descriptor, returning nil domain identifier%@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

+ (void)br_getDomainIdentifierForDataSeparated:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Returning a domain for account: %@%@", (uint8_t *)&v3, 0x16u);
}

@end