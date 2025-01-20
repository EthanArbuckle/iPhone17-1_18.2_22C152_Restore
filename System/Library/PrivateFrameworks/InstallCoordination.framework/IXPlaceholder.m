@interface IXPlaceholder
+ (BOOL)_setEntitlementsFromBundleExecutableURL:(id)a3 withBundleID:(id)a4 client:(unint64_t)a5 onPlaceholder:(id)a6 error:(id *)a7;
+ (BOOL)supportsSecureCoding;
+ (id)_iconContentForBundleAtURL:(id)a3 infoPlistIconContent:(id *)a4 error:(id *)a5;
+ (id)_iconDataForBundle:(__CFBundle *)a3 atURL:(id)a4 isFromSerializedPlaceholder:(BOOL)a5 error:(id *)a6;
+ (id)_infoPlistLocalizationDictionaryForBundleURL:(id)a3 error:(id *)a4;
+ (id)_placeholderForBundle:(id)a3 client:(unint64_t)a4 withParent:(id)a5 installType:(unint64_t)a6 metadata:(id)a7 placeholderType:(unint64_t)a8 mayBeDeltaPackage:(BOOL)a9 isFromSerializedPlaceholder:(BOOL)a10 error:(id *)a11;
+ (id)_placeholderForInstallable:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 metadata:(id)a6 isFromSerializedPlaceholder:(BOOL)a7 error:(id *)a8;
+ (id)_pngDataForCGImage:(CGImage *)a3 error:(id *)a4;
+ (id)placeholderForInstallable:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 metadata:(id)a6 error:(id *)a7;
+ (id)placeholderForRemovableSystemAppWithBundleID:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 error:(id *)a6;
+ (id)placeholderFromSerializedPlaceholder:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 error:(id *)a6;
- (BOOL)_doInitWithBundleName:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 placeholderType:(unint64_t)a6 error:(id *)a7;
- (BOOL)_internalInitAppExtensionPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 placeholderType:(unint64_t)a6 client:(unint64_t)a7 error:(id *)a8;
- (BOOL)hasEntitlementsPromise;
- (BOOL)hasIconPromise;
- (BOOL)hasIconResourcesPromise;
- (BOOL)hasInfoPlistLoctablePromise;
- (BOOL)hasPlugInPlaceholderPromises;
- (BOOL)launchProhibited:(BOOL *)a3 error:(id *)a4;
- (BOOL)setAppExtensionPlaceholderPromises:(id)a3 error:(id *)a4;
- (BOOL)setConfigurationCompleteWithError:(id *)a3;
- (BOOL)setEntitlementsPromise:(id)a3 error:(id *)a4;
- (BOOL)setIconPromise:(id)a3 error:(id *)a4;
- (BOOL)setIconResourcesPromise:(id)a3 withInfoPlistContent:(id)a4 error:(id *)a5;
- (BOOL)setInfoPlistLocalizations:(id)a3 error:(id *)a4;
- (BOOL)setInfoPlistLoctablePromise:(id)a3 error:(id *)a4;
- (BOOL)setLaunchProhibited:(BOOL)a3 error:(id *)a4;
- (BOOL)setMetadata:(id)a3 error:(id *)a4;
- (BOOL)setPlaceholderAttributes:(id)a3 error:(id *)a4;
- (BOOL)setSinfData:(id)a3 error:(id *)a4;
- (Class)seedClass;
- (IXPlaceholder)initWithCoder:(id)a3;
- (IXPlaceholder)initWithSeed:(id)a3;
- (MIStoreMetadata)metadata;
- (NSString)bundleID;
- (NSString)bundleName;
- (id)_initAppExtensionPlaceholderWithBundleURL:(id)a3 bundleName:(id)a4 bundleID:(id)a5 parentPlaceholder:(id)a6 client:(unint64_t)a7 error:(id *)a8;
- (id)appExtensionPlaceholderPromisesWithError:(id *)a3;
- (id)entitlementsPromiseWithError:(id *)a3;
- (id)iconPromiseWithError:(id *)a3;
- (id)iconResourcesPromiseWithInfoPlistContent:(id *)a3 error:(id *)a4;
- (id)infoPlistLocalizationsWithError:(id *)a3;
- (id)infoPlistLoctablePromiseWithError:(id *)a3;
- (id)initAppPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 client:(unint64_t)a6;
- (id)initAppPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 client:(unint64_t)a6 error:(id *)a7;
- (id)initExtensionKitPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6;
- (id)initExtensionKitPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6 error:(id *)a7;
- (id)initPlugInPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6;
- (id)initPlugInPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6 error:(id *)a7;
- (id)metadataWithError:(id *)a3;
- (id)placeholderAttributesWithError:(id *)a3;
- (id)sinfDataWithError:(id *)a3;
- (unint64_t)installType;
- (unint64_t)placeholderType;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBundleName:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation IXPlaceholder

+ (id)placeholderForRemovableSystemAppWithBundleID:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v19 = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifierOfSystemPlaceholder:v10 error:&v19];
  id v12 = v19;
  if (v11 && ([v11 isPlaceholder] & 1) != 0)
  {
    v13 = [v11 URL];
    v14 = [a1 placeholderForInstallable:v13 client:a4 installType:a5 metadata:0 error:a6];

    id v15 = v12;
  }
  else
  {
    v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder placeholderForRemovableSystemAppWithBundleID:client:installType:error:]();
    }

    _CreateError((uint64_t)"+[IXPlaceholder placeholderForRemovableSystemAppWithBundleID:client:installType:error:]", 72, @"IXErrorDomain", 0xBuLL, v12, 0, @"Failed to get system app placeholder location from LaunchServices for %@", v17, (uint64_t)v10);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      id v15 = v15;
      v14 = 0;
      *a6 = v15;
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

+ (id)_pngDataForCGImage:(CGImage *)a3 error:(id *)a4
{
  v6 = [MEMORY[0x1E4F1CA58] data];
  v7 = [(id)*MEMORY[0x1E4F44460] identifier];
  v8 = CGImageDestinationCreateWithData(v6, v7, 1uLL, 0);

  if (v8)
  {
    CGImageDestinationAddImage(v8, a3, 0);
    if (CGImageDestinationFinalize(v8))
    {
      v9 = (void *)[(__CFData *)v6 copy];
      id v10 = 0;
    }
    else
    {
      v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[IXPlaceholder _pngDataForCGImage:error:]();
      }

      id v10 = _CreateError((uint64_t)"+[IXPlaceholder _pngDataForCGImage:error:]", 103, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to finalize image", v14, v16);
      v9 = 0;
    }
    CFRelease(v8);
    if (a4)
    {
LABEL_12:
      if (!v9) {
        *a4 = v10;
      }
    }
  }
  else
  {
    v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _pngDataForCGImage:error:]();
    }

    id v10 = _CreateError((uint64_t)"+[IXPlaceholder _pngDataForCGImage:error:]", 96, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to create CGImageDestination", v12, v16);
    v9 = 0;
    if (a4) {
      goto LABEL_12;
    }
  }

  return v9;
}

+ (id)_iconDataForBundle:(__CFBundle *)a3 atURL:(id)a4 isFromSerializedPlaceholder:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (v7)
  {
    ValueForInfoDictionaryKey = (__CFBundle *)CFBundleGetValueForInfoDictionaryKey(a3, @"CF_MIPlaceholderConstructorVersion");
    if (ValueForInfoDictionaryKey)
    {
      uint64_t v12 = ValueForInfoDictionaryKey;
      v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v81 = "_BundleHasMalformedIconKeys";
        __int16 v82 = 2112;
        v83 = v12;
        _os_log_impl(&dword_1A7B2D000, v13, OS_LOG_TYPE_DEFAULT, "%s: Using placeholder generated by OS version %@", buf, 0x16u);
      }
      goto LABEL_32;
    }
    uint64_t v14 = (void *)CFBundleGetValueForInfoDictionaryKey(a3, (CFStringRef)*MEMORY[0x1E4F1CFF0]);
    objc_opt_class();
    v13 = v14;
    if (objc_opt_isKindOfClass())
    {
      if (v13 && [v13 isEqualToString:@"Executable"])
      {
        id v15 = (void *)CFBundleGetValueForInfoDictionaryKey(a3, (CFStringRef)*MEMORY[0x1E4F1CC58]);
        objc_opt_class();
        id v16 = v15;
        if (objc_opt_isKindOfClass())
        {
          if (v16 && ([v16 isEqualToString:@"Icon"] & 1) != 0)
          {
            CFTypeRef v17 = CFBundleGetValueForInfoDictionaryKey(a3, @"CFBundleIcons");

            if (!v17) {
              goto LABEL_33;
            }
            v18 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v81 = "+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]";
              __int16 v82 = 2112;
              v83 = a3;
              _os_log_impl(&dword_1A7B2D000, v18, OS_LOG_TYPE_DEFAULT, "%s: Attempting malformed icon key fixup for %@", buf, 0x16u);
            }

            id v19 = (void *)_CFBundleCopyInfoPlistURL();
            if (!v19)
            {
              v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v81 = "_UpdateBundleWithCorrectedIconKeys";
                __int16 v82 = 2112;
                v83 = a3;
                _os_log_impl(&dword_1A7B2D000, v21, OS_LOG_TYPE_DEFAULT, "%s: Failed to get Info.plist URL from %@", buf, 0x16u);
              }
              goto LABEL_68;
            }
            id v72 = 0;
            v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "IX_dictionaryWithContentsOfURL:options:error:", v19, 0, &v72);
            v21 = v72;
            v22 = (void *)[v20 mutableCopy];

            if (!v22)
            {
              v58 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                v59 = [v19 path];
                *(_DWORD *)buf = 136315650;
                v81 = "_UpdateBundleWithCorrectedIconKeys";
                __int16 v82 = 2112;
                v83 = v59;
                __int16 v84 = 2112;
                v85 = v21;
                _os_log_impl(&dword_1A7B2D000, v58, OS_LOG_TYPE_DEFAULT, "%s: Failed to fetch info plist from %@ : %@", buf, 0x20u);
              }
              goto LABEL_68;
            }
            id v65 = a1;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"CFBundleIcons~iphone", @"CFBundleIcons~ipad", 0);
            uint64_t v24 = [v23 countByEnumeratingWithState:&v68 objects:buf count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              v62 = v21;
              v63 = v19;
              v64 = a6;
              char v26 = 0;
              uint64_t v27 = *(void *)v69;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v69 != v27) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v68 + 1) + 8 * i);
                  v30 = [v22 objectForKeyedSubscript:v29];

                  if (v30)
                  {
                    [v22 setObject:0 forKeyedSubscript:v29];
                    char v26 = 1;
                  }
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v68 objects:buf count:16];
              }
              while (v25);

              id v19 = v63;
              a6 = v64;
              v21 = v62;
              if (v26)
              {
                v67 = v62;
                char v31 = objc_msgSend(v22, "IX_writeToURL:format:options:error:", v63, 200, 268435457, &v67);
                v32 = v67;

                if (v31)
                {
                  _CFBundleFlushBundleCaches();
                  v33 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  a1 = v65;
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v74 = 136315394;
                    v75 = "_UpdateBundleWithCorrectedIconKeys";
                    __int16 v76 = 2112;
                    v77 = a3;
                    _os_log_impl(&dword_1A7B2D000, v33, OS_LOG_TYPE_DEFAULT, "%s: Fixed up malformed icon keys in %@", v74, 0x16u);
                  }
                }
                else
                {
                  v33 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  a1 = v65;
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    v61 = [v63 path];
                    *(_DWORD *)v74 = 136315650;
                    v75 = "_UpdateBundleWithCorrectedIconKeys";
                    __int16 v76 = 2112;
                    v77 = v61;
                    __int16 v78 = 2112;
                    v79 = v32;
                    _os_log_impl(&dword_1A7B2D000, v33, OS_LOG_TYPE_DEFAULT, "%s: Failed to write updated Info.plist to %@ : %@", v74, 0x20u);
                  }
                }

                v21 = v32;
LABEL_68:

                goto LABEL_33;
              }
            }
            else
            {
            }
            v60 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v74 = 136315394;
              v75 = "_UpdateBundleWithCorrectedIconKeys";
              __int16 v76 = 2112;
              v77 = a3;
              _os_log_impl(&dword_1A7B2D000, v60, OS_LOG_TYPE_DEFAULT, "%s: No offending keys found; skipping icon fixup for %@",
                v74,
                0x16u);
            }

            a1 = v65;
            goto LABEL_68;
          }
        }
        else
        {

          id v16 = 0;
        }
      }
    }
    else
    {

      v13 = 0;
    }
LABEL_32:
  }
LABEL_33:
  v34 = (void *)MEMORY[0x1AD0D4670]();
  CFBundleGetIdentifier(a3);
  v35 = (__CFBundle *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithURL:v10];
  if (!v36)
  {
    v50 = [v10 path];
    _CreateError((uint64_t)"+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]", 228, @"IXErrorDomain", 0xCuLL, 0, 0, @"Failed to initialize an icon for bundle at %@ ", v53, (uint64_t)v50);
LABEL_45:
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    v39 = 0;
LABEL_46:
    v42 = 0;
    goto LABEL_47;
  }
  uint64_t v37 = *MEMORY[0x1E4F6F298];
  v38 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F298]];
  if (!v38)
  {
    v50 = [v10 path];
    _CreateError((uint64_t)"+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]", 234, @"IXErrorDomain", 0xCuLL, 0, 0, @"Failed to create image descriptor with name %@ while creating an icon for bundle at %@", v54, v37);
    goto LABEL_45;
  }
  v39 = v38;
  [v38 setShouldApplyMask:0];
  v73 = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
  [v36 prepareImagesForImageDescriptors:v40];

  v41 = [v36 prepareImageForDescriptor:v39];
  if (!v41)
  {
    v50 = [v10 path];
    _CreateError((uint64_t)"+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]", 245, @"IXErrorDomain", 0xCuLL, 0, 0, @"Failed to create image with descriptor %@ for bundle at %@", v56, (uint64_t)v39);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  v42 = v41;
  if ([v41 placeholder])
  {
    v43 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      [v10 path];
      v45 = v44 = a6;
      *(_DWORD *)buf = 136315650;
      v81 = "+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]";
      __int16 v82 = 2112;
      v83 = v35;
      __int16 v84 = 2112;
      v85 = v45;
      _os_log_impl(&dword_1A7B2D000, v43, OS_LOG_TYPE_DEFAULT, "%s: IconServices returned a placeholder icon for bundle with identifer %@ located at %@", buf, 0x20u);

      a6 = v44;
    }
  }
  uint64_t v46 = [v42 CGImage];
  if (!v46)
  {
    v50 = [v10 path];
    _CreateError((uint64_t)"+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]", 255, @"IXErrorDomain", 0xCuLL, 0, 0, @"Failed to get CGImageRef from ISImage %@ for bundle at %@", v57, (uint64_t)v42);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  id v66 = 0;
  v47 = [a1 _pngDataForCGImage:v46 error:&v66];
  id v48 = v66;
  if (!v47)
  {
    v49 = a6;
    v50 = [v10 path];
    uint64_t v52 = _CreateError((uint64_t)"+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]", 261, @"IXErrorDomain", 0xCuLL, v48, 0, @"Failed to create PNG data when constructing icon for bundle at %@", v51, (uint64_t)v50);

    id v48 = (id)v52;
    a6 = v49;
LABEL_47:

    v47 = 0;
  }

  if (a6 && !v47) {
    *a6 = v48;
  }

  return v47;
}

+ (id)_iconContentForBundleAtURL:(id)a3 infoPlistIconContent:(id *)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = +[IXFileManager defaultManager];
  id v23 = 0;
  v9 = [v8 createTemporaryIconsDirectoryWithError:&v23];
  id v10 = v23;
  v11 = v10;
  if (!v9)
  {
    id v13 = 0;
    if (a5)
    {
LABEL_14:
      id v14 = v11;
      id v17 = 0;
      *a5 = v14;
      goto LABEL_15;
    }
LABEL_8:
    id v17 = 0;
    id v14 = v11;
    goto LABEL_15;
  }
  v22 = v10;
  char v12 = IFCaptureIconContent();
  id v13 = 0;
  id v14 = v22;

  if ((v12 & 1) == 0)
  {
    if (v14)
    {
      v18 = [v7 path];
      v11 = _CreateError((uint64_t)"+[IXPlaceholder _iconContentForBundleAtURL:infoPlistIconContent:error:]", 292, @"IXErrorDomain", 0xCuLL, v14, 0, @"Failed to capture icon content for placeholder from bundle at %@", v19, (uint64_t)v18);
    }
    else
    {
      v11 = _CreateError((uint64_t)"+[IXPlaceholder _iconContentForBundleAtURL:infoPlistIconContent:error:]", 290, @"IXErrorDomain", 0x17uLL, 0, 0, @"Bundle has no icon", v15, v21);
    }
LABEL_13:
    [v8 removeItemAtURL:v9 error:0];
    if (a5) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  if (![v13 count])
  {
    v11 = _CreateError((uint64_t)"+[IXPlaceholder _iconContentForBundleAtURL:infoPlistIconContent:error:]", 299, @"IXErrorDomain", 0x17uLL, 0, 0, @"Bundle has no icon", v16, v21);

    goto LABEL_13;
  }
  if (a4) {
    *a4 = v13;
  }
  id v17 = v9;
LABEL_15:

  return v17;
}

+ (id)_infoPlistLocalizationDictionaryForBundleURL:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  id v7 = +[IXFileManager defaultManager];
  id v41 = 0;
  v8 = [v7 urlsForItemsInDirectoryAtURL:v5 ignoringSymlinks:1 error:&v41];
  id v9 = v41;

  if (v8)
  {
    char v31 = a4;
    id v32 = v5;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v30 = v8;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (!v10) {
      goto LABEL_21;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    uint64_t v34 = *MEMORY[0x1E4F281F8];
    v33 = v6;
    while (1)
    {
      uint64_t v13 = 0;
      id v14 = v9;
      do
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * v13);
        uint64_t v16 = [v15 pathExtension];
        int v17 = [v16 isEqualToString:@"lproj"];

        if (!v17)
        {
          id v9 = v14;
          goto LABEL_19;
        }
        v18 = [v15 URLByAppendingPathComponent:@"InfoPlist.strings" isDirectory:0];
        uint64_t v19 = [v15 lastPathComponent];
        v20 = [v19 stringByDeletingPathExtension];

        id v36 = v14;
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v18 error:&v36];
        id v9 = v36;

        v22 = v21;
        if (!v21)
        {
          id v23 = [v9 domain];
          if (![v23 isEqualToString:v34])
          {

LABEL_15:
            char v26 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v27 = [v18 path];
              *(_DWORD *)buf = 136315650;
              v43 = "+[IXPlaceholder _infoPlistLocalizationDictionaryForBundleURL:error:]";
              __int16 v44 = 2112;
              v45 = v27;
              __int16 v46 = 2112;
              id v47 = v9;
              _os_log_impl(&dword_1A7B2D000, v26, OS_LOG_TYPE_DEFAULT, "%s: Failed to read %@: %@", buf, 0x20u);

              v6 = v33;
            }

            v22 = (void *)MEMORY[0x1E4F1CC08];
            goto LABEL_18;
          }
          uint64_t v24 = [v9 code];

          v22 = (void *)MEMORY[0x1E4F1CC08];
          BOOL v25 = v24 == 260;
          v6 = v33;
          if (!v25) {
            goto LABEL_15;
          }
        }
LABEL_18:
        [v6 setObject:v22 forKeyedSubscript:v20];

        id v14 = v9;
LABEL_19:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
      if (!v11)
      {
LABEL_21:

        v28 = (void *)[v6 copy];
        a4 = v31;
        id v5 = v32;
        v8 = v30;
        if (!v31) {
          goto LABEL_26;
        }
        goto LABEL_24;
      }
    }
  }
  v28 = 0;
  if (!a4) {
    goto LABEL_26;
  }
LABEL_24:
  if (!v28) {
    *a4 = v9;
  }
LABEL_26:

  return v28;
}

+ (id)placeholderForInstallable:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 metadata:(id)a6 error:(id *)a7
{
  return (id)[a1 _placeholderForInstallable:a3 client:a4 installType:a5 metadata:a6 isFromSerializedPlaceholder:0 error:a7];
}

+ (id)_placeholderForInstallable:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 metadata:(id)a6 isFromSerializedPlaceholder:(BOOL)a7 error:(id *)a8
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = v12;
  id v15 = v13;
  char v72 = 0;
  uint64_t v16 = +[IXFileManager defaultManager];
  id v71 = 0;
  LODWORD(v13) = [v16 itemExistsAtURL:v14 isDirectory:&v72 error:&v71];
  id v17 = v71;
  v18 = v17;
  if (!v13)
  {
    id v23 = 0;
    uint64_t v19 = 0;
    id v21 = v17;
LABEL_8:
    v22 = v15;
    id v24 = v14;
    goto LABEL_9;
  }
  if (!v72)
  {
    char v26 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:](v14, v26);
    }

    uint64_t v27 = [v14 path];
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:]", 407, @"IXErrorDomain", 4uLL, 0, 0, @"Item at %@ is unexpectedly a file", v28, (uint64_t)v27);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    id v23 = 0;
    uint64_t v19 = 0;
    goto LABEL_21;
  }
  id v62 = a1;
  unint64_t v63 = a4;
  uint64_t v19 = [v14 URLByAppendingPathComponent:@"Payload" isDirectory:1];
  id v70 = v18;
  char v20 = [v16 itemExistsAtURL:v19 isDirectory:&v72 error:&v70];
  id v21 = v70;

  if (v20)
  {
    if (v72)
    {
      if (v15)
      {
        unint64_t v61 = a5;
        v22 = v15;
        goto LABEL_31;
      }
      v18 = [v14 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0];
      id v69 = v21;
      int v35 = [v16 itemExistsAtURL:v18 error:&v69];
      id v36 = v69;

      if (v35)
      {
        id v68 = v36;
        [MEMORY[0x1E4F6F5C8] metadataFromPlistAtURL:v18 error:&v68];
        v23 = long long v37 = v36;
        id v21 = v68;

        if (!v23) {
          goto LABEL_58;
        }
        goto LABEL_30;
      }
      long long v38 = [v36 domain];
      id v21 = v36;
      if (![v38 isEqualToString:*MEMORY[0x1E4F28798]])
      {

        id v23 = 0;
LABEL_58:
        v22 = 0;
        goto LABEL_22;
      }
      id v57 = v36;
      uint64_t v39 = [v36 code];

      id v23 = 0;
      BOOL v40 = v39 == 2;
      id v21 = v57;
      if (v40)
      {
LABEL_30:
        unint64_t v61 = a5;

        v22 = v23;
LABEL_31:
        id v24 = v14;
        id v41 = +[IXFileManager defaultManager];
        id v77 = 0;
        v42 = [v41 urlsForItemsInDirectoryAtURL:v24 ignoringSymlinks:1 error:&v77];
        id v60 = v77;

        if (v42)
        {
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          v59 = v42;
          v43 = v42;
          uint64_t v44 = [v43 countByEnumeratingWithState:&v73 objects:buf count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v56 = v19;
            id v58 = v21;
            uint64_t v46 = *(void *)v74;
            while (2)
            {
              for (uint64_t i = 0; i != v45; ++i)
              {
                if (*(void *)v74 != v46) {
                  objc_enumerationMutation(v43);
                }
                id v48 = v43;
                uint64_t v49 = [*(id *)(*((void *)&v73 + 1) + 8 * i) lastPathComponent];
                if (([v49 hasPrefix:@"com.apple.deltainstallcommands."] & 1) != 0
                  || ([v49 hasPrefix:@"com.apple.parallelpatchinfo."] & 1) != 0)
                {

                  char v30 = 1;
                  id v21 = v58;
                  v42 = v59;
                  v43 = v48;
                  goto LABEL_43;
                }

                v43 = v48;
              }
              uint64_t v45 = [v48 countByEnumeratingWithState:&v73 objects:buf count:16];
              if (v45) {
                continue;
              }
              break;
            }
            char v30 = 0;
            id v21 = v58;
            v42 = v59;
LABEL_43:
            uint64_t v19 = v56;
          }
          else
          {
            char v30 = 0;
          }
        }
        else
        {
          v43 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            [v24 path];
            uint64_t v51 = v50 = v43;
            *(_DWORD *)buf = 136315650;
            v79 = "_DirectoryContainsDeltaManifest";
            __int16 v80 = 2112;
            v81 = v51;
            __int16 v82 = 2112;
            id v83 = v60;
            _os_log_impl(&dword_1A7B2D000, v50, OS_LOG_TYPE_DEFAULT, "%s: Failed to get contents of %@ : %@", buf, 0x20u);

            v43 = v50;
          }
          char v30 = 0;
        }

        id v67 = v21;
        id v23 = AppURLFromExtractedPayloadDir(v19, &v67);
        id v52 = v67;
        uint64_t v53 = v21;
        id v21 = v52;

        if (v23)
        {

          id v24 = v23;
          goto LABEL_50;
        }
LABEL_9:
        BOOL v25 = a8;
        if (!a8) {
          goto LABEL_54;
        }
        goto LABEL_52;
      }
      v22 = 0;
LABEL_22:
      id v24 = v14;
      goto LABEL_51;
    }
    char v31 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:](v19, v31);
    }

    id v32 = [v19 path];
    uint64_t v34 = _CreateError((uint64_t)"+[IXPlaceholder _placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:]", 439, @"IXErrorDomain", 4uLL, 0, 0, @"Item at %@ is a file", v33, (uint64_t)v32);

    id v23 = 0;
    v18 = v21;
    id v21 = (id)v34;
LABEL_21:
    v22 = v15;
    goto LABEL_22;
  }
  v18 = [v21 domain];
  if (![v18 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    id v23 = 0;
    goto LABEL_21;
  }
  uint64_t v29 = [v21 code];

  if (v29 != 2)
  {
    id v23 = 0;
    goto LABEL_8;
  }
  unint64_t v61 = a5;
  char v30 = 0;
  v22 = v15;
  id v24 = v14;
LABEL_50:
  id v66 = v21;
  BYTE1(v55) = a7;
  LOBYTE(v55) = v30;
  id v23 = objc_msgSend(v62, "_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:", v24, v63, 0, v61, v22, 1, v55, &v66);
  v18 = v21;
  id v21 = v66;
LABEL_51:
  BOOL v25 = a8;

  if (!a8) {
    goto LABEL_54;
  }
LABEL_52:
  if (!v23) {
    *BOOL v25 = v21;
  }
LABEL_54:

  return v23;
}

+ (id)placeholderFromSerializedPlaceholder:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = +[IXFileManager defaultManager];
  char v37 = 0;
  id v36 = 0;
  int v11 = [v10 itemExistsAtURL:v9 isDirectory:&v37 error:&v36];
  id v12 = v36;
  id v13 = v12;
  if (!v11) {
    goto LABEL_13;
  }
  if (v37)
  {
    id v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:](v9, v14);
    }

    id v15 = [v9 path];
    uint64_t v17 = _CreateError((uint64_t)"+[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:]", 467, @"IXErrorDomain", 0x2AuLL, 0, 0, @"Expected the serialized placeholder at %@ to be an IPA", v16, (uint64_t)v15);

    v18 = 0;
    uint64_t v19 = 0;
    id v13 = (id)v17;
    if (!a6) {
      goto LABEL_16;
    }
LABEL_14:
    if (!v19) {
      *a6 = v13;
    }
    goto LABEL_16;
  }
  id v35 = v12;
  v18 = [v10 createTemporaryExtractionDirectoryWithError:&v35];
  id v20 = v35;

  if (!v18)
  {
    id v23 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:]();
    }

    _CreateError((uint64_t)"+[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:]", 473, @"IXErrorDomain", 0x2AuLL, v20, 0, @"Failed to create directory for extraction", v24, v31);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v18 = 0;
    uint64_t v19 = 0;
    if (!a6) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  id v34 = v20;
  char v21 = [MEMORY[0x1E4F78068] extractZipArchiveAtURL:v9 toURL:v18 withError:&v34];
  id v22 = v34;

  if (v21)
  {
    id v33 = v22;
    uint64_t v19 = +[IXPlaceholder _placeholderForInstallable:v18 client:a4 installType:a5 metadata:0 isFromSerializedPlaceholder:1 error:&v33];
    id v13 = v33;
  }
  else
  {
    char v26 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [v9 path];
      char v30 = [v18 path];
      *(_DWORD *)buf = 136315906;
      uint64_t v39 = "+[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:]";
      __int16 v40 = 2112;
      id v41 = v29;
      __int16 v42 = 2112;
      v43 = v30;
      __int16 v44 = 2112;
      id v45 = v22;
      _os_log_error_impl(&dword_1A7B2D000, v26, OS_LOG_TYPE_ERROR, "%s: Failed to extract %@ to %@ : %@", buf, 0x2Au);
    }
    uint64_t v27 = [v9 path];
    id v32 = [v18 path];
    _CreateError((uint64_t)"+[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:]", 479, @"IXErrorDomain", 0x2AuLL, v22, 0, @"Failed to extract %@ to %@", v28, (uint64_t)v27);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = 0;
  }

  [v10 removeItemAtURL:v18 error:0];
  if (a6) {
    goto LABEL_14;
  }
LABEL_16:

  return v19;
}

+ (BOOL)_setEntitlementsFromBundleExecutableURL:(id)a3 withBundleID:(id)a4 client:(unint64_t)a5 onPlaceholder:(id)a6 error:(id *)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = v11;
  *(void *)staticCode = 0;
  CFDictionaryRef information = 0;
  if (SecStaticCodeCreateWithPath((CFURLRef)v14, 0, (SecStaticCodeRef *)staticCode))
  {
    id v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:].cold.5(v14);
    }

    uint64_t v16 = [v14 path];
    _CreateError((uint64_t)"_IXCopyEntitlementsForPath", 597, @"IXErrorDomain", 0x2BuLL, 0, 0, @"Failed to construct SecStaticCode for %@ : %d", v17, (uint64_t)v16);
    id v20 = LABEL_9:;

    CFDictionaryRef Copy = 0;
    goto LABEL_10;
  }
  if (SecCodeCopySigningInformation(*(SecStaticCodeRef *)staticCode, 4u, &information))
  {
    v18 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:].cold.4(v14);
    }

    uint64_t v16 = [v14 path];
    _CreateError((uint64_t)"_IXCopyEntitlementsForPath", 603, @"IXErrorDomain", 0x2BuLL, 0, 0, @"SecCodeCopySigningInformation for %@ returned error %d", v19, (uint64_t)v16);
    goto LABEL_9;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(information, (const void *)*MEMORY[0x1E4F3B9B0]);
  if (Value)
  {
    CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Value);
  }
  else
  {
    CFDictionaryRef Copy = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v39 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      +[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:](v14, v39);
    }
  }
  id v20 = 0;
LABEL_10:
  if (*(void *)staticCode)
  {
    CFRelease(*(CFTypeRef *)staticCode);
    *(void *)staticCode = 0;
  }
  if (information)
  {
    CFRelease(information);
    CFDictionaryRef information = 0;
  }
  if (Copy) {
    id v22 = 0;
  }
  else {
    id v22 = v20;
  }

  id v23 = v22;
  if (!Copy)
  {
    char v30 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = [v14 path];
      *(_DWORD *)staticCode = 136315906;
      *(void *)&staticCode[4] = "+[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]";
      __int16 v48 = 2112;
      id v49 = v12;
      __int16 v50 = 2112;
      id v51 = v31;
      __int16 v52 = 2112;
      id v53 = v23;
      _os_log_error_impl(&dword_1A7B2D000, v30, OS_LOG_TYPE_ERROR, "%s: Failed to fetch entitlements for %@ from %@ : %@", staticCode, 0x2Au);
    }
    goto LABEL_26;
  }
  if (![(__CFDictionary *)Copy count])
  {
    char v30 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)staticCode = 136315650;
      *(void *)&staticCode[4] = "+[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]";
      __int16 v48 = 2112;
      id v49 = v12;
      __int16 v50 = 2112;
      id v51 = v14;
      _os_log_impl(&dword_1A7B2D000, v30, OS_LOG_TYPE_DEFAULT, "%s: Executable for %@ at %@ had no entitlements", staticCode, 0x20u);
    }
LABEL_26:

    char v26 = 0;
    BOOL v29 = 1;
    goto LABEL_45;
  }
  uint64_t v24 = [IXPromisedInMemoryDictionary alloc];
  BOOL v25 = [NSString stringWithFormat:@"Entitlements Promise for %@", v12];
  char v26 = [(IXPromisedInMemoryDictionary *)v24 initWithName:v25 client:a5 dictionary:Copy];

  if (v26)
  {
    id v43 = v23;
    char v27 = [v13 setEntitlementsPromise:v26 error:&v43];
    id v28 = v43;

    if (v27)
    {

      char v26 = 0;
      BOOL v29 = 1;
      id v23 = v28;
      goto LABEL_45;
    }
    id v36 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]();
    }

    id v34 = _CreateError((uint64_t)"+[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]", 668, @"IXErrorDomain", 2uLL, v28, 0, @"Failed to set alternative entitlements promise for %@", v37, (uint64_t)v12);

    if (v34)
    {
      uint64_t v45 = *MEMORY[0x1E4F28A50];
      uint64_t v46 = v34;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    }
    else
    {
      id v23 = 0;
    }
    __int16 v40 = _CreateError((uint64_t)"+[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]", 682, @"IXErrorDomain", 1uLL, 0, v23, @"An error occurred before the entitlements promise could be set on the placeholder.", v38, v42);
    [(IXDataPromise *)v26 cancelForReason:v40 client:15 error:0];
  }
  else
  {
    id v32 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]();
    }

    id v34 = _CreateError((uint64_t)"+[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]", 663, @"IXErrorDomain", 2uLL, 0, 0, @"Failed to create IXPromisedInMemoryDictionary for entitlements for %@", v33, (uint64_t)v12);
  }

  if (a7)
  {
    id v23 = v34;
    BOOL v29 = 0;
    *a7 = v23;
  }
  else
  {
    BOOL v29 = 0;
    id v23 = v34;
  }
LABEL_45:

  return v29;
}

+ (id)_placeholderForBundle:(id)a3 client:(unint64_t)a4 withParent:(id)a5 installType:(unint64_t)a6 metadata:(id)a7 placeholderType:(unint64_t)a8 mayBeDeltaPackage:(BOOL)a9 isFromSerializedPlaceholder:(BOOL)a10 error:(id *)a11
{
  uint64_t v247 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v199 = a5;
  id v192 = a7;
  id v17 = (id)objc_opt_new();
  v193 = +[IXFileManager defaultManager];
  uint64_t Unique = _CFBundleCreateUnique();
  v195 = v16;
  if (!Unique)
  {
    char v26 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:](v16, v26);
    }

    char v27 = [v16 path];
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 730, @"IXErrorDomain", 0xAuLL, 0, 0, @"Failed to create CFBundle from %@", v28, (uint64_t)v27);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    v190 = 0;
    v191 = 0;
    v186 = 0;
    v188 = 0;
    v196 = 0;
    char v30 = 0;
    uint64_t v31 = 0;
    id v32 = 0;
    CFURLRef v194 = 0;
    v189 = 0;
    id v23 = 0;
    v200 = 0;
    goto LABEL_29;
  }
  uint64_t v19 = (__CFBundle *)Unique;
  id v233 = 0;
  id v20 = [[IXPlaceholderAttributes alloc] initWithInfoPlistFromBundle:Unique error:&v233];
  id v21 = v233;
  v196 = v20;
  if (!v20)
  {
    uint64_t v33 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]();
    }

    id v34 = [v16 path];
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 736, @"IXErrorDomain", 2uLL, v21, 0, @"Failed create placeholder attributes from %@", v35, (uint64_t)v34);
    goto LABEL_17;
  }
  id v185 = a1;
  id v22 = CFBundleGetIdentifier(v19);
  if (!v22)
  {
    id v36 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:](v16, v36);
    }

    id v34 = [v16 path];
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 742, @"IXErrorDomain", 0xDuLL, 0, 0, @"Failed to get bundle ID from %@", v37, (uint64_t)v34);
LABEL_17:
    id v38 = (id)objc_claimAutoreleasedReturnValue();

    v200 = 0;
    id v23 = 0;
LABEL_25:
    v189 = 0;
LABEL_26:
    CFURLRef v44 = 0;
    id v32 = 0;
    v186 = 0;
    v188 = 0;
    uint64_t v31 = 0;
    char v30 = 0;
    v190 = 0;
    v191 = 0;
    goto LABEL_27;
  }
  id v23 = v22;
  if ([v22 containsString:@"/"])
  {
    uint64_t v24 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.4();
    }

    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 747, @"IXErrorDomain", 0x2CuLL, 0, 0, @"Bundle identifier %@ contains \"/\", which is not allowed", v25, (uint64_t)v23);
LABEL_24:
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    v200 = 0;
    goto LABEL_25;
  }
  if (![v23 length])
  {
    uint64_t v42 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.5();
    }

    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 752, @"IXErrorDomain", 0x2CuLL, 0, 0, @"Bundle identifier is an empty string, which is not allowed", v43, (uint64_t)v174);
    goto LABEL_24;
  }
  ValueForInfoDictionaryKey = (void *)CFBundleGetValueForInfoDictionaryKey(v19, (CFStringRef)*MEMORY[0x1E4F1CC48]);
  objc_opt_class();
  id v40 = ValueForInfoDictionaryKey;
  if (objc_opt_isKindOfClass()) {
    id v41 = v40;
  }
  else {
    id v41 = 0;
  }

  if (!v41 || ![v41 length])
  {
    unint64_t v183 = a4;
    uint64_t v55 = v41;
    uint64_t v56 = (void *)CFBundleGetValueForInfoDictionaryKey(v19, (CFStringRef)*MEMORY[0x1E4F1D008]);
    objc_opt_class();
    id v57 = v56;
    if (objc_opt_isKindOfClass()) {
      id v58 = v57;
    }
    else {
      id v58 = 0;
    }

    if (v58 && [v58 length])
    {
      id v41 = v58;
    }
    else
    {
      v59 = [v16 URLByDeletingPathExtension];
      uint64_t v60 = [v59 lastPathComponent];

      id v41 = (id)v60;
    }
    a4 = v183;
  }
  unint64_t v61 = [IXPlaceholder alloc];
  v189 = v41;
  if (v199)
  {
    id v230 = v21;
    unint64_t v62 = a4;
    uint64_t v31 = [(IXPlaceholder *)v61 _initAppExtensionPlaceholderWithBundleURL:v16 bundleName:v41 bundleID:v23 parentPlaceholder:v199 client:a4 error:&v230];
    id v38 = v230;

    if (!v31)
    {
      v200 = 0;
      CFURLRef v44 = 0;
      id v32 = 0;
      v186 = 0;
      v188 = 0;
      char v30 = 0;
      v190 = 0;
      v191 = 0;
      goto LABEL_28;
    }
    unint64_t v63 = v196;
    [(IXPlaceholderAttributes *)v196 setLaunchProhibited:0];
    id v21 = v38;
    a4 = v62;
  }
  else
  {
    id v232 = v21;
    uint64_t v31 = [(IXPlaceholder *)v61 initAppPlaceholderWithBundleName:v41 bundleID:v23 installType:a6 client:a4 error:&v232];
    id v64 = v232;

    if (!v31)
    {
      id v77 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
        +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.6();
      }

      _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 770, @"IXErrorDomain", 2uLL, v64, 0, @"Failed to create IXPlaceholder for app bundle ID %@", v78, (uint64_t)v23);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      v200 = 0;
      id v21 = v64;
      goto LABEL_26;
    }
    id v231 = v64;
    char v65 = [(IXPromisedTransferToPath *)v31 setMetadata:v192 error:&v231];
    id v21 = v231;

    if ((v65 & 1) == 0)
    {
      v200 = v31;
      v79 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
        +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]1();
      }

      _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 775, @"IXErrorDomain", 2uLL, v21, 0, @"Failed to set metadata for %@", v80, (uint64_t)v23);
      goto LABEL_79;
    }
    unint64_t v63 = v196;
    [(IXPlaceholderAttributes *)v196 setExtensionDictionary:0];
    [(IXPlaceholderAttributes *)v196 setExAppExtensionAttributes:0];
  }
  id v66 = v21;
  id v229 = v21;
  char v67 = [(IXPromisedTransferToPath *)v31 setPlaceholderAttributes:v63 error:&v229];
  id v21 = v229;

  v200 = v31;
  if ((v67 & 1) == 0)
  {
    id v70 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]0();
    }

    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 795, @"IXErrorDomain", 2uLL, v21, 0, @"Failed to set placeholder attributes %@", v71, (uint64_t)v23);
LABEL_79:
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  unint64_t v184 = a4;
  CFURLRef v44 = CFBundleCopyExecutableURL(v19);
  uint64_t v68 = [v16 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];
  v191 = (void *)v68;
  if (v44 && [v193 itemExistsAtURL:v44])
  {
    id v228 = v21;
    char v69 = [v185 _setEntitlementsFromBundleExecutableURL:v44 withBundleID:v23 client:v184 onPlaceholder:v31 error:&v228];
    id v38 = v228;

    if ((v69 & 1) == 0)
    {
      id v32 = 0;
      v186 = 0;
      v188 = 0;
      uint64_t v31 = 0;
      char v30 = 0;
      v190 = 0;
      goto LABEL_28;
    }
    CFURLRef v194 = v44;
  }
  else
  {
    CFURLRef v194 = v44;
    if ([v193 itemExistsAtURL:v68])
    {
      uint64_t v72 = [v193 diskUsageForURL:v68];
      long long v73 = [IXPromisedTransferToPath alloc];
      uint64_t v198 = (uint64_t)v23;
      v174 = v23;
      long long v74 = [NSString stringWithFormat:@"Entitlements Promise for %@"];
      uint64_t v31 = [(IXPromisedTransferToPath *)v73 initWithName:v74 client:v184 transferPath:v68 diskSpaceNeeded:v72];

      if (!v31)
      {
        v81 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        id v23 = (void *)v198;
        CFURLRef v44 = v194;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
          +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.7();
        }

        _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 811, @"IXErrorDomain", 2uLL, 0, 0, @"Failed to create IXPromisedTransferToPath for entitlements for %@", v82, v198);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        id v32 = 0;
        v186 = 0;
        v188 = 0;
        uint64_t v31 = 0;
        char v30 = 0;
        v190 = 0;
        goto LABEL_27;
      }
      [(IXPromisedTransferToPath *)v31 setShouldCopy:1];
      [(IXPromisedTransferToPath *)v31 setComplete:1];
      id v227 = v21;
      char v75 = [(IXPromisedTransferToPath *)v200 setEntitlementsPromise:v31 error:&v227];
      id v76 = v227;

      id v23 = (void *)v198;
      if ((v75 & 1) == 0)
      {
        v114 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
          +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]9();
        }

        _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 819, @"IXErrorDomain", 2uLL, v76, 0, @"Failed to set entitlements promise for %@", v115, v198);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        id v32 = 0;
        v186 = 0;
        v188 = 0;
        char v30 = 0;
        v190 = 0;
        id v21 = v76;
        goto LABEL_156;
      }
      id v21 = v76;
    }
    else
    {
      if (v199)
      {
        id v38 = v21;
        goto LABEL_92;
      }
      id v83 = (IXPromisedTransferToPath *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v23 allowPlaceholder:0 error:0];
      uint64_t v31 = v83;
      if (v83)
      {
        uint64_t v84 = [(IXPromisedTransferToPath *)v83 executableURL];
        if (v84)
        {
          id v226 = v21;
          int v85 = [v185 _setEntitlementsFromBundleExecutableURL:v84 withBundleID:v23 client:v184 onPlaceholder:v200 error:&v226];
          id v38 = v226;

          if (!v85)
          {

            id v32 = 0;
            v186 = 0;
            v188 = 0;
            char v30 = 0;
            v190 = 0;
            id v21 = v31;
            uint64_t v31 = 0;
            goto LABEL_156;
          }
          id v21 = v38;
        }
      }
    }

    id v38 = v21;
    uint64_t v31 = v200;
  }
LABEL_92:
  int v86 = [MEMORY[0x1E4F6F580] fullFidelityIconsEnabled];
  v87 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  BOOL v88 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
  if (v86)
  {
    if (v88)
    {
      v89 = [v16 path];
      *(_DWORD *)buf = 136315650;
      v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPack"
             "age:isFromSerializedPlaceholder:error:]";
      __int16 v241 = 2112;
      v242 = v23;
      __int16 v243 = 2112;
      v244 = v89;
      _os_log_impl(&dword_1A7B2D000, v87, OS_LOG_TYPE_DEFAULT, "%s: Using full fidelity icons for %@ at %@", buf, 0x20u);
    }
    id v225 = 0;
    id v224 = v38;
    v90 = [v185 _iconContentForBundleAtURL:v16 infoPlistIconContent:&v225 error:&v224];
    id v21 = v225;
    v91 = v224;

    v197 = v23;
    if (v90)
    {
      uint64_t v92 = [v193 diskUsageForURL:v90];
      v93 = [IXPromisedTransferToPath alloc];
      v94 = v23;
      v95 = v93;
      v174 = v94;
      v96 = [NSString stringWithFormat:@"Icon resources for %@"];
      unint64_t v97 = v184;
      v98 = [(IXPromisedTransferToPath *)v95 initWithName:v96 client:v184 transferPath:v90 diskSpaceNeeded:v92];

      v188 = v98;
      if (v98)
      {
        [(IXPromisedTransferToPath *)v98 setComplete:1];
        v223 = v91;
        char v99 = [(IXPromisedTransferToPath *)v200 setIconResourcesPromise:v98 withInfoPlistContent:v21 error:&v223];
        v100 = v223;

        if (v99)
        {
          id v32 = v90;
          v101 = v21;
          id v21 = v100;
LABEL_105:
          uint64_t v31 = v200;
          goto LABEL_135;
        }
        v120 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        id v23 = v197;
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
          +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]6();
        }

        _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 860, @"IXErrorDomain", 2uLL, v100, 0, @"Failed to set icon resources promise for %@", v121, (uint64_t)v197);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        v91 = v100;
      }
      else
      {
        v116 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        id v23 = v197;
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
          +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]5();
        }

        _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 853, @"IXErrorDomain", 2uLL, 0, 0, @"Failed to create IXPromisedTransferToPath for icon resources at %@ for %@", v117, (uint64_t)v90);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
      }

      id v32 = 0;
      goto LABEL_130;
    }
    v107 = [v91 domain];
    if ([v107 isEqualToString:@"IXErrorDomain"])
    {
      v108 = v23;
      uint64_t v109 = [v91 code];

      BOOL v147 = v109 == 23;
      id v23 = v108;
      if (v147)
      {
        v110 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        {
LABEL_133:

          uint64_t v31 = v200;
          unint64_t v97 = v184;
          goto LABEL_134;
        }
        v111 = [v16 path];
        *(_DWORD *)buf = 136315650;
        v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPa"
               "ckage:isFromSerializedPlaceholder:error:]";
        __int16 v241 = 2112;
        v242 = v108;
        __int16 v243 = 2112;
        v244 = v111;
        _os_log_impl(&dword_1A7B2D000, v110, OS_LOG_TYPE_DEFAULT, "%s: No icon found for bundle %@ at %@", buf, 0x20u);
LABEL_207:

        goto LABEL_133;
      }
    }
    else
    {
    }
    v110 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (!os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    [v16 path];
    v111 = v169 = v23;
    *(_DWORD *)buf = 136315906;
    v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackag"
           "e:isFromSerializedPlaceholder:error:]";
    __int16 v241 = 2112;
    v242 = v169;
    __int16 v243 = 2112;
    v244 = v111;
    __int16 v245 = 2112;
    p_super = v91;
    _os_log_error_impl(&dword_1A7B2D000, v110, OS_LOG_TYPE_ERROR, "%s: Failed to get icon content for bundle with identifier %@ at %@ : %@", buf, 0x2Au);
    goto LABEL_207;
  }
  if (v88)
  {
    v102 = [v16 path];
    *(_DWORD *)buf = 136315650;
    v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackag"
           "e:isFromSerializedPlaceholder:error:]";
    __int16 v241 = 2112;
    v242 = v23;
    __int16 v243 = 2112;
    v244 = v102;
    _os_log_impl(&dword_1A7B2D000, v87, OS_LOG_TYPE_DEFAULT, "%s: Using single PNG icon for %@ at %@", buf, 0x20u);
  }
  id v222 = v38;
  id v21 = [v185 _iconDataForBundle:v19 atURL:v16 isFromSerializedPlaceholder:a10 error:&v222];
  v90 = (IXPromisedInMemoryData *)v222;

  if (v21)
  {
    v103 = [IXPromisedInMemoryData alloc];
    v174 = v23;
    v104 = [NSString stringWithFormat:@"Icon for %@"];
    unint64_t v97 = v184;
    id v32 = [(IXPromisedInMemoryData *)v103 initWithName:v104 client:v184 data:v21];

    if (v32)
    {
      v221 = v90;
      char v105 = [(IXPromisedTransferToPath *)v200 setIconPromise:v32 error:&v221];
      v106 = v221;

      if (v105)
      {
        v197 = v23;
        v188 = 0;
        v101 = v21;
        id v21 = v106;
        goto LABEL_105;
      }
      v122 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
        +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]8();
      }

      _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 885, @"IXErrorDomain", 2uLL, v106, 0, @"Failed to set icon promise for %@", v123, (uint64_t)v23);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      v90 = v106;
    }
    else
    {
      v118 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
        +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]7();
      }

      _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 880, @"IXErrorDomain", 2uLL, 0, 0, @"Failed to create IXPromisedInMemoryData for icon for %@", v119, (uint64_t)v23);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
    }

    v188 = 0;
LABEL_130:
    uint64_t v31 = 0;
    char v30 = 0;
    v186 = 0;
    v190 = 0;
    goto LABEL_156;
  }
  v91 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  unint64_t v97 = v184;
  v197 = v23;
  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
  {
    [v16 path];
    v113 = v112 = v31;
    *(_DWORD *)buf = 136315906;
    v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackag"
           "e:isFromSerializedPlaceholder:error:]";
    __int16 v241 = 2112;
    v242 = v23;
    __int16 v243 = 2112;
    v244 = v113;
    __int16 v245 = 2112;
    p_super = &v90->super.super.super;
    _os_log_error_impl(&dword_1A7B2D000, v91, OS_LOG_TYPE_ERROR, "%s: Failed to get icon data for bundle with identifier %@ at %@ : %@", buf, 0x2Au);

    uint64_t v31 = v112;
  }
LABEL_134:

  v188 = 0;
  id v32 = v90;
  v101 = v21;
  id v21 = 0;
LABEL_135:

  v124 = v195;
  uint64_t v125 = [v195 URLByAppendingPathComponent:@"InfoPlist.loctable" isDirectory:0];
  __int16 v52 = v193;
  v190 = (void *)v125;
  if (![v193 itemExistsAtURL:v125])
  {
    id v130 = v21;
    goto LABEL_140;
  }
  uint64_t v187 = [v193 diskUsageForURL:v125];
  v126 = [IXPromisedTransferToPath alloc];
  v127 = NSString;
  v174 = [v195 path];
  v128 = [v127 stringWithFormat:@"Loctable Promise for %@"];
  char v30 = [(IXPromisedTransferToPath *)v126 initWithName:v128 client:v97 transferPath:v125 diskSpaceNeeded:v187];

  if (!v30)
  {
    v137 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    id v23 = v197;
    if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.8(v195, v137);
    }

    v138 = [v195 path];
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 901, @"IXErrorDomain", 2uLL, 0, 0, @"Failed to create IXPromisedTransferToPath for loctable for %@", v139, (uint64_t)v138);
    id v38 = (id)objc_claimAutoreleasedReturnValue();

    id v32 = 0;
    uint64_t v31 = 0;
    char v30 = 0;
    goto LABEL_155;
  }
  [(IXPromisedTransferToPath *)v30 setShouldCopy:1];
  [(IXPromisedTransferToPath *)v30 setComplete:1];
  id v220 = v21;
  uint64_t v31 = v200;
  char v129 = [(IXPromisedTransferToPath *)v200 setInfoPlistLoctablePromise:v30 error:&v220];
  id v130 = v220;

  if ((v129 & 1) == 0)
  {
    v140 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    id v23 = v197;
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]4();
    }

    v141 = [v190 path];
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 909, @"IXErrorDomain", 2uLL, v130, 0, @"Failed to set loctable promise for %@", v142, (uint64_t)v141);
    id v38 = (id)objc_claimAutoreleasedReturnValue();

    id v21 = v130;
    id v32 = 0;
    uint64_t v31 = 0;
LABEL_155:
    v186 = 0;
    goto LABEL_156;
  }

  v124 = v195;
  __int16 v52 = v193;
LABEL_140:
  id v219 = v130;
  uint64_t v131 = [v185 _infoPlistLocalizationDictionaryForBundleURL:v124 error:&v219];
  id v21 = v219;

  if (!v131)
  {
    v135 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    id v23 = v197;
    CFURLRef v44 = v194;
    if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.9();
    }

    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 919, @"IXErrorDomain", 2uLL, v21, 0, @"Failed to set localization dictionary for %@", v136, (uint64_t)v197);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    id v32 = 0;
    uint64_t v31 = 0;
    char v30 = 0;
    v186 = 0;
    goto LABEL_27;
  }
  id v218 = v21;
  v186 = (void *)v131;
  int v132 = [(IXPromisedTransferToPath *)v31 setInfoPlistLocalizations:v131 error:&v218];
  id v38 = v218;

  if (!v132)
  {
    id v32 = 0;
    uint64_t v31 = 0;
    char v30 = 0;
    id v23 = v197;
    CFURLRef v44 = v194;
    goto LABEL_28;
  }
  if (v199) {
    goto LABEL_143;
  }
  long long v216 = 0u;
  long long v217 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  uint64_t v175 = [&unk_1EFE06E40 countByEnumeratingWithState:&v214 objects:v238 count:16];
  if (!v175) {
    goto LABEL_193;
  }
  uint64_t v176 = *(void *)v215;
  do
  {
    uint64_t v143 = 0;
    do
    {
      if (*(void *)v215 != v176) {
        objc_enumerationMutation(&unk_1EFE06E40);
      }
      uint64_t v177 = v143;
      uint64_t v144 = [*(id *)(*((void *)&v214 + 1) + 8 * v143) unsignedIntegerValue];
      v145 = @"Extensions";
      if (v144 != 3) {
        v145 = 0;
      }
      uint64_t v178 = v144;
      if (v144 == 2) {
        v146 = @"PlugIns";
      }
      else {
        v146 = v145;
      }
      id v21 = [v124 URLByAppendingPathComponent:v146 isDirectory:1];
      char v213 = 0;
      if ([v52 itemExistsAtURL:v21 isDirectory:&v213 error:0]) {
        BOOL v147 = v213 == 0;
      }
      else {
        BOOL v147 = 1;
      }
      if (v147) {
        goto LABEL_191;
      }
      id v212 = v38;
      v148 = [v52 urlsForItemsInDirectoryAtURL:v21 ignoringSymlinks:1 error:&v212];
      id v149 = v212;

      if (!v148)
      {
        v172 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR)) {
          +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]2();
        }

        v168 = [v21 path];
        _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 937, @"IXErrorDomain", 2uLL, v149, 0, @"Failed to get URLs of items at %@", v173, (uint64_t)v168);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        id v23 = v197;
LABEL_205:
        CFURLRef v44 = v194;

        id v32 = 0;
        uint64_t v31 = 0;
        char v30 = 0;
        goto LABEL_27;
      }
      long long v210 = 0u;
      long long v211 = 0u;
      long long v208 = 0u;
      long long v209 = 0u;
      id v150 = v148;
      uint64_t v181 = [v150 countByEnumeratingWithState:&v208 objects:v237 count:16];
      if (!v181) {
        goto LABEL_190;
      }
      uint64_t v180 = *(void *)v209;
      id obj = v150;
      while (2)
      {
        for (uint64_t i = 0; i != v181; ++i)
        {
          v182 = v149;
          if (*(void *)v209 != v180) {
            objc_enumerationMutation(obj);
          }
          v152 = *(void **)(*((void *)&v208 + 1) + 8 * i);
          v153 = [v152 pathExtension];
          int v154 = [v153 isEqualToString:@"appex"];

          if (!v154)
          {
            v124 = v195;
            id v149 = v182;
            continue;
          }
          id v23 = v197;
          BOOL v155 = a9;
          if (!a9) {
            goto LABEL_185;
          }
          v156 = [v152 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
          if (([v52 itemDoesNotExistAtURL:v156] & 1) == 0)
          {

            BOOL v155 = a9;
LABEL_185:
            id v207 = v182;
            BYTE1(v174) = a10;
            LOBYTE(v174) = v155;
            v156 = objc_msgSend(v185, "_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:", v152, v184, v200, 0, 0, v178, v174, &v207);
            v159 = v152;
            id v149 = v207;

            if (!v156)
            {
              v163 = v159;
              v164 = v149;
              v165 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR)) {
                +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]3();
              }

              v166 = [v163 path];
              _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 958, @"IXErrorDomain", 2uLL, v164, 0, @"Failed to create app extension placeholder for %@", v167, (uint64_t)v166);
              id v38 = (id)objc_claimAutoreleasedReturnValue();

              v168 = obj;
              id v149 = obj;
              goto LABEL_205;
            }
            [v17 addObject:v156];
            goto LABEL_187;
          }
          v157 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
          {
            v158 = [v152 path];
            *(_DWORD *)buf = 136315394;
            v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDel"
                   "taPackage:isFromSerializedPlaceholder:error:]";
            __int16 v241 = 2112;
            v242 = v158;
            _os_log_impl(&dword_1A7B2D000, v157, OS_LOG_TYPE_DEFAULT, "%s: Skipping incomplete app extension in delta package at %@", buf, 0x16u);
          }
          id v149 = v182;
LABEL_187:

          v124 = v195;
        }
        id v150 = obj;
        uint64_t v181 = [obj countByEnumeratingWithState:&v208 objects:v237 count:16];
        if (v181) {
          continue;
        }
        break;
      }
LABEL_190:

      id v38 = v149;
      uint64_t v31 = v200;
LABEL_191:

      uint64_t v143 = v177 + 1;
    }
    while (v177 + 1 != v175);
    uint64_t v175 = [&unk_1EFE06E40 countByEnumeratingWithState:&v214 objects:v238 count:16];
  }
  while (v175);
LABEL_193:
  if (![v17 count]) {
    goto LABEL_196;
  }
  id v206 = v38;
  char v160 = [(IXPromisedTransferToPath *)v31 setAppExtensionPlaceholderPromises:v17 error:&v206];
  id v21 = v206;

  if (v160)
  {
    id v38 = v21;
LABEL_196:

    id v17 = 0;
LABEL_143:
    id v205 = v38;
    char v133 = [(IXPromisedTransferToPath *)v31 setConfigurationCompleteWithError:&v205];
    id v21 = v205;

    if (v133)
    {
      v134 = v31;
      CFRelease(v19);
      char v30 = 0;
      uint64_t v31 = 0;
      id v32 = 0;
      v200 = v134;
      id v51 = v134;
      goto LABEL_42;
    }
    v161 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]0();
    }

    id v23 = v197;
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 975, @"IXErrorDomain", 2uLL, v21, 0, @"Failed to set configuration complete for %@", v162, (uint64_t)v197);
  }
  else
  {
    v170 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR)) {
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]1();
    }

    id v23 = v197;
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 968, @"IXErrorDomain", 2uLL, v21, 0, @"Failed to set app extension placeholders for %@", v171, (uint64_t)v197);
  }
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  id v32 = 0;
  uint64_t v31 = 0;
  char v30 = 0;
LABEL_156:
  CFURLRef v44 = v194;
LABEL_27:

LABEL_28:
  CFURLRef v194 = v44;
  CFRelease(v19);
  id v21 = v38;
LABEL_29:
  if (a11) {
    *a11 = v21;
  }
  v197 = v23;
  if (v21)
  {
    uint64_t v235 = *MEMORY[0x1E4F28A50];
    id v236 = v21;
    uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v236 forKeys:&v235 count:1];
  }
  else
  {
    uint64_t v45 = 0;
  }
  uint64_t v46 = _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 993, @"IXErrorDomain", 1uLL, 0, v45, @"Canceling because an error occurred during creation of the IXPlaceholder", v29, (uint64_t)v174);
  [(IXDataPromise *)v200 cancelForReason:v46 client:15 error:0];
  [(IXDataPromise *)v31 cancelForReason:v46 client:15 error:0];
  [(IXDataPromise *)v32 cancelForReason:v46 client:15 error:0];
  [(IXDataPromise *)v30 cancelForReason:v46 client:15 error:0];
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  id v17 = v17;
  uint64_t v47 = [v17 countByEnumeratingWithState:&v201 objects:v234 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v202;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v202 != v49) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v201 + 1) + 8 * j) cancelForReason:v46 client:15 error:0];
      }
      uint64_t v48 = [v17 countByEnumeratingWithState:&v201 objects:v234 count:16];
    }
    while (v48);
  }

  id v51 = 0;
  __int16 v52 = v193;
LABEL_42:
  id v53 = v51;

  return v53;
}

- (id)initAppPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 client:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = [NSString stringWithFormat:@"App Placeholder: %@ (%@)", v12, v13];
  v18.receiver = self;
  v18.super_class = (Class)IXPlaceholder;
  id v15 = [(IXOwnedDataPromise *)&v18 initWithName:v14 client:a6 diskSpaceNeeded:0];

  if (v15
    && ![(IXPlaceholder *)v15 _doInitWithBundleName:v12 bundleID:v13 installType:a5 placeholderType:1 error:a7])
  {
    id v16 = 0;
  }
  else
  {
    id v16 = v15;
  }

  return v16;
}

- (id)_initAppExtensionPlaceholderWithBundleURL:(id)a3 bundleName:(id)a4 bundleID:(id)a5 parentPlaceholder:(id)a6 client:(unint64_t)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  objc_super v18 = [v14 URLByDeletingLastPathComponent];
  uint64_t v19 = [v18 lastPathComponent];
  if ([v19 isEqualToString:@"PlugIns"])
  {
    id v20 = [(IXPlaceholder *)self initPlugInPlaceholderWithBundleName:v15 bundleID:v16 parentPlaceholder:v17 client:a7 error:a8];
LABEL_5:
    self = (IXPlaceholder *)v20;
    id v21 = self;
    goto LABEL_11;
  }
  if ([v19 isEqualToString:@"Extensions"])
  {
    id v20 = [(IXPlaceholder *)self initExtensionKitPlaceholderWithBundleName:v15 bundleID:v16 parentPlaceholder:v17 client:a7 error:a8];
    goto LABEL_5;
  }
  id v22 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[IXPlaceholder _initAppExtensionPlaceholderWithBundleURL:bundleName:bundleID:parentPlaceholder:client:error:]();
  }

  uint64_t v24 = _CreateError((uint64_t)"-[IXPlaceholder _initAppExtensionPlaceholderWithBundleURL:bundleName:bundleID:parentPlaceholder:client:error:]", 1029, @"IXErrorDomain", 2uLL, 0, 0, @"Unable to determine IXPlaceholder type for this app extension bundle at %@", v23, (uint64_t)v14);
  uint64_t v25 = v24;
  if (a8) {
    *a8 = v24;
  }

  id v21 = 0;
LABEL_11:

  return v21;
}

- (id)initExtensionKitPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [NSString stringWithFormat:@"ExtensionKit app extension Placeholder: %@ (%@)", v12, v13];
  v19.receiver = self;
  v19.super_class = (Class)IXPlaceholder;
  id v16 = [(IXOwnedDataPromise *)&v19 initWithName:v15 client:a6 diskSpaceNeeded:0];

  if (v16
    && ![(IXPlaceholder *)v16 _internalInitAppExtensionPlaceholderWithBundleName:v12 bundleID:v13 parentPlaceholder:v14 placeholderType:3 client:a6 error:a7])
  {
    id v17 = 0;
  }
  else
  {
    id v17 = v16;
  }

  return v17;
}

- (id)initPlugInPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [NSString stringWithFormat:@"PluginKit app extension Placeholder: %@ (%@)", v12, v13];
  v19.receiver = self;
  v19.super_class = (Class)IXPlaceholder;
  id v16 = [(IXOwnedDataPromise *)&v19 initWithName:v15 client:a6 diskSpaceNeeded:0];

  if (v16
    && ![(IXPlaceholder *)v16 _internalInitAppExtensionPlaceholderWithBundleName:v12 bundleID:v13 parentPlaceholder:v14 placeholderType:2 client:a6 error:a7])
  {
    id v17 = 0;
  }
  else
  {
    id v17 = v16;
  }

  return v17;
}

- (id)initAppPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 client:(unint64_t)a6
{
  return [(IXPlaceholder *)self initAppPlaceholderWithBundleName:a3 bundleID:a4 installType:a5 client:a6 error:0];
}

- (id)initExtensionKitPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6
{
  return [(IXPlaceholder *)self initExtensionKitPlaceholderWithBundleName:a3 bundleID:a4 parentPlaceholder:a5 client:a6 error:0];
}

- (id)initPlugInPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6
{
  return [(IXPlaceholder *)self initPlugInPlaceholderWithBundleName:a3 bundleID:a4 parentPlaceholder:a5 client:a6 error:0];
}

- (BOOL)_internalInitAppExtensionPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 placeholderType:(unint64_t)a6 client:(unint64_t)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = v15;
  if (v15)
  {
    id v17 = [v15 seed];
    int v18 = [v17 isAppExtension];

    if (!v18)
    {
      BOOL v20 = [(IXPlaceholder *)self _doInitWithBundleName:v13 bundleID:v14 installType:0 placeholderType:a6 error:a8];
      goto LABEL_9;
    }
    objc_super v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[IXPlaceholder _internalInitAppExtensionPlaceholderWithBundleName:bundleID:parentPlaceholder:placeholderType:client:error:](v19);
    }
  }
  else
  {
    objc_super v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[IXPlaceholder _internalInitAppExtensionPlaceholderWithBundleName:bundleID:parentPlaceholder:placeholderType:client:error:](v19);
    }
  }

  BOOL v20 = 0;
LABEL_9:

  return v20;
}

- (BOOL)_doInitWithBundleName:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 placeholderType:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__5;
  uint64_t v39 = __Block_byref_object_dispose__5;
  id v40 = 0;
  if (!v12)
  {
    uint64_t v24 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:]();
    }

    uint64_t v26 = _CreateError((uint64_t)"-[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:]", 1100, @"IXErrorDomain", 0x35uLL, 0, 0, @"Bundle Name argument was nil.", v25, (uint64_t)v32);
    goto LABEL_13;
  }
  if (!v13)
  {
    char v27 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:]();
    }

    uint64_t v26 = _CreateError((uint64_t)"-[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:]", 1105, @"IXErrorDomain", 0x35uLL, 0, 0, @"Bundle ID argument was nil.", v28, (uint64_t)v32);
LABEL_13:
    BOOL v20 = 0;
    BOOL v23 = 0;
    uint64_t v29 = (void *)v36[5];
    v36[5] = v26;
    goto LABEL_14;
  }
  id v15 = [(IXDataPromise *)self seed];
  [v15 setBundleName:v12];

  id v16 = [(IXDataPromise *)self seed];
  [v16 setBundleID:v14];

  id v17 = [(IXDataPromise *)self seed];
  [v17 setInstallType:a5];

  int v18 = [(IXDataPromise *)self seed];
  [v18 setPlaceholderType:a6];

  objc_super v19 = +[IXServerConnection sharedConnection];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __82__IXPlaceholder__doInitWithBundleName_bundleID_installType_placeholderType_error___block_invoke;
  v34[3] = &unk_1E5D172A8;
  v34[4] = &v35;
  BOOL v20 = [v19 synchronousRemoteObjectProxyWithErrorHandler:v34];

  if (v20)
  {
    id v21 = [(IXDataPromise *)self seed];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __82__IXPlaceholder__doInitWithBundleName_bundleID_installType_placeholderType_error___block_invoke_206;
    v33[3] = &unk_1E5D17E90;
    v33[4] = self;
    v33[5] = &v35;
    objc_msgSend(v20, "_remote_createPlaceholderDataPromiseWithSeed:completion:", v21, v33);

    id v22 = v36;
    if (!v36[5])
    {
      id v32 = 0;
      BOOL v23 = [(IXOwnedDataPromise *)self consumeSandboxExtensionWithError:&v32];
      id v31 = v32;
      uint64_t v29 = (void *)v22[5];
      v22[5] = (uint64_t)v31;
LABEL_14:

      if (!a7) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
  }
  BOOL v23 = 0;
  if (!a7) {
    goto LABEL_17;
  }
LABEL_15:
  if (!v23) {
    *a7 = (id) v36[5];
  }
LABEL_17:

  _Block_object_dispose(&v35, 8);
  return v23;
}

void __82__IXPlaceholder__doInitWithBundleName_bundleID_installType_placeholderType_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __82__IXPlaceholder__doInitWithBundleName_bundleID_installType_placeholderType_error___block_invoke_206(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      __int16 v9 = "-[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up placeholder promise: %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    [*(id *)(a1 + 32) _updateInitWithSeed:a2 notifyDaemon:0];
  }
}

- (IXPlaceholder)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPlaceholder;
  return [(IXOwnedDataPromise *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IXPlaceholder;
  [(IXDataPromise *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)setIconPromise:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__5;
  uint64_t v29 = __Block_byref_object_dispose__5;
  id v30 = 0;
  int v7 = +[IXServerConnection sharedConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __38__IXPlaceholder_setIconPromise_error___block_invoke;
  v21[3] = &unk_1E5D175A0;
  id v8 = v6;
  id v22 = v8;
  BOOL v23 = self;
  uint64_t v24 = &v25;
  __int16 v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v21];
  __int16 v10 = [(IXDataPromise *)self uniqueIdentifier];
  id v11 = [v8 uniqueIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __38__IXPlaceholder_setIconPromise_error___block_invoke_212;
  v17[3] = &unk_1E5D175A0;
  id v12 = v8;
  id v18 = v12;
  objc_super v19 = self;
  BOOL v20 = &v25;
  objc_msgSend(v9, "_remote_IXSPlaceholder:setIconPromiseUUID:completion:", v10, v11, v17);

  id v13 = v26;
  if (a4)
  {
    id v14 = (void *)v26[5];
    if (v14)
    {
      *a4 = v14;
      id v13 = v26;
    }
  }
  BOOL v15 = v13[5] == 0;

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __38__IXPlaceholder_setIconPromise_error___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      __int16 v9 = "-[IXPlaceholder setIconPromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set icon promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

void __38__IXPlaceholder_setIconPromise_error___block_invoke_212(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      __int16 v9 = "-[IXPlaceholder setIconPromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set icon promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

- (id)iconPromiseWithError:(id *)a3
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__5;
  BOOL v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  id v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__IXPlaceholder_iconPromiseWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  v12[4] = &v13;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v7 = [(IXDataPromise *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__IXPlaceholder_iconPromiseWithError___block_invoke_213;
  v11[3] = &unk_1E5D175F0;
  v11[4] = &v13;
  v11[5] = &v19;
  objc_msgSend(v6, "_remote_IXSPlaceholder:getIconPromise:", v7, v11);

  int v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    int v8 = (void *)v20[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __38__IXPlaceholder_iconPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[IXPlaceholder iconPromiseWithError:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get icon promise: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __38__IXPlaceholder_iconPromiseWithError___block_invoke_213(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      id v9 = (objc_class *)[v5 clientPromiseClass];
      uint64_t v10 = [[v9 alloc] initWithSeed:v5];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_17;
        }
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        __int16 v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;

        uint64_t v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __38__IXPlaceholder_iconPromiseWithError___block_invoke_213_cold_2();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXPlaceholder iconPromiseWithError:]_block_invoke", 1219, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for an owned data promise subclass but was instead for class %@", v17, (uint64_t)v5);
      }
      else
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __38__IXPlaceholder_iconPromiseWithError___block_invoke_213_cold_1();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXPlaceholder iconPromiseWithError:]_block_invoke", 1216, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ with seed %@", v22, (uint64_t)v16);
      uint64_t v23 = };

      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
      BOOL v20 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      uint64_t v18 = _CreateError((uint64_t)"-[IXPlaceholder iconPromiseWithError:]_block_invoke", 1211, @"IXErrorDomain", 0x17uLL, 0, 0, @"An icon promise is not currently set.", v6, v25);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      BOOL v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[IXPlaceholder iconPromiseWithError:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get icon promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
LABEL_17:
}

- (BOOL)hasIconPromise
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  objc_super v3 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__IXPlaceholder_hasIconPromise__block_invoke;
  v8[3] = &unk_1E5D17618;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  id v5 = [(IXDataPromise *)self uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__IXPlaceholder_hasIconPromise__block_invoke_225;
  v7[3] = &unk_1E5D17640;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "_remote_IXSPlaceholder:hasIconPromise:", v5, v7);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __31__IXPlaceholder_hasIconPromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315650;
      id v7 = "-[IXPlaceholder hasIconPromise]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an icon promise: %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

void __31__IXPlaceholder_hasIconPromise__block_invoke_225(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXPlaceholder hasIconPromise]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an icon promise: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)setIconResourcesPromise:(id)a3 withInfoPlistContent:(id)a4 error:(id *)a5
{
  id v28 = a3;
  id v8 = a4;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__5;
  id v41 = __Block_byref_object_dispose__5;
  id v42 = 0;
  if (!IXDictionaryContainsOnlyPlistContent(v8))
  {
    uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:]();
    }

    uint64_t v23 = _CreateError((uint64_t)"-[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:]", 1255, @"IXErrorDomain", 0x1CuLL, 0, 0, @"Info.plist content dictionary contains content that cannot be contained in a property list.", v22, v27);
    goto LABEL_10;
  }
  uint64_t v9 = [IXPromisedInMemoryDictionary alloc];
  __int16 v10 = NSString;
  uint64_t v11 = [(IXPlaceholder *)self bundleID];
  __int16 v12 = [v10 stringWithFormat:@"Info.plist icon content for %@", v11];
  id v13 = [(IXPromisedInMemoryDictionary *)v9 initWithName:v12 client:[(IXDataPromise *)self creatorIdentifier] dictionary:v8];

  if (!v13)
  {
    uint64_t v24 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:]();
    }

    uint64_t v23 = _CreateError((uint64_t)"-[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:]", 1261, @"IXErrorDomain", 2uLL, 0, 0, @"Failed to create dictionary promise for Info.plist icon content for %@", v25, (uint64_t)self);
LABEL_10:
    BOOL v20 = 0;
    id v13 = (IXPromisedInMemoryDictionary *)v38[5];
    v38[5] = v23;
    goto LABEL_11;
  }
  uint64_t v14 = +[IXServerConnection sharedConnection];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __68__IXPlaceholder_setIconResourcesPromise_withInfoPlistContent_error___block_invoke;
  v33[3] = &unk_1E5D175A0;
  id v15 = v28;
  id v34 = v15;
  uint64_t v35 = self;
  id v36 = &v37;
  uint64_t v16 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v33];
  uint64_t v17 = [(IXDataPromise *)self uniqueIdentifier];
  uint64_t v18 = [v15 uniqueIdentifier];
  uint64_t v19 = [(IXDataPromise *)v13 uniqueIdentifier];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __68__IXPlaceholder_setIconResourcesPromise_withInfoPlistContent_error___block_invoke_236;
  v29[3] = &unk_1E5D175A0;
  id v30 = v15;
  id v31 = self;
  id v32 = &v37;
  objc_msgSend(v16, "_remote_IXSPlaceholder:setIconResourcesPromiseUUID:withInfoPlistIconContentPromiseUUID:completion:", v17, v18, v19, v29);

  BOOL v20 = v38[5] == 0;
LABEL_11:

  if (a5 && !v20) {
    *a5 = (id) v38[5];
  }
  _Block_object_dispose(&v37, 8);

  return v20;
}

void __68__IXPlaceholder_setIconResourcesPromise_withInfoPlistContent_error___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      uint64_t v9 = "-[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set icon resources promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

void __68__IXPlaceholder_setIconResourcesPromise_withInfoPlistContent_error___block_invoke_236(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      uint64_t v9 = "-[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set icon resources promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

- (id)iconResourcesPromiseWithInfoPlistContent:(id *)a3 error:(id *)a4
{
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__5;
  id v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__5;
  uint64_t v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__5;
  uint64_t v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke;
  v14[3] = &unk_1E5D172A8;
  v14[4] = &v27;
  int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  uint64_t v9 = [(IXDataPromise *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_237;
  v13[3] = &unk_1E5D17EB8;
  v13[4] = &v27;
  v13[5] = &v21;
  v13[6] = &v15;
  objc_msgSend(v8, "_remote_IXSPlaceholder:getIconResourcesPromiseAndInfoPlistContentPromise:", v9, v13);

  __int16 v10 = (void *)v22[5];
  if (a3 && v10)
  {
    *a3 = (id) v16[5];
    __int16 v10 = (void *)v22[5];
  }
  if (a4 && !v10)
  {
    *a4 = (id) v28[5];
    __int16 v10 = (void *)v22[5];
  }
  id v11 = v10;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[IXPlaceholder iconResourcesPromiseWithInfoPlistContent:error:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get icon resources promise: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_237(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (v10)
  {
    id v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v32 = "-[IXPlaceholder iconResourcesPromiseWithInfoPlistContent:error:]_block_invoke";
      __int16 v33 = 2112;
      id v34 = v10;
      _os_log_impl(&dword_1A7B2D000, v11, OS_LOG_TYPE_DEFAULT, "%s: Failed to get icon resources promise: %@", buf, 0x16u);
    }

    __int16 v12 = (id *)(*(void *)(a1[4] + 8) + 40);
    uint64_t v13 = a4;
    goto LABEL_5;
  }
  if (!v7 || !v8)
  {
    uint64_t v18 = _CreateError((uint64_t)"-[IXPlaceholder iconResourcesPromiseWithInfoPlistContent:error:]_block_invoke", 1307, @"IXErrorDomain", 0x17uLL, 0, 0, @"An icon resources promise is not currently set.", v9, v30);
    uint64_t v19 = *(void *)(a1[4] + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
LABEL_19:

    goto LABEL_20;
  }
  __int16 v14 = (objc_class *)[v7 clientPromiseClass];
  uint64_t v15 = [[v14 alloc] initWithSeed:v7];
  uint64_t v16 = *(void *)(a1[5] + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_237_cold_1();
    }

    uint64_t v22 = NSStringFromClass(v14);
    _CreateError((uint64_t)"-[IXPlaceholder iconResourcesPromiseWithInfoPlistContent:error:]_block_invoke", 1312, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ with seed %@", v23, (uint64_t)v22);
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v24 = *(void *)(a1[5] + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = 0;

    id v26 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_237_cold_2();
    }

    uint64_t v22 = NSStringFromClass(v14);
    _CreateError((uint64_t)"-[IXPlaceholder iconResourcesPromiseWithInfoPlistContent:error:]_block_invoke", 1315, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for IXPromisedTransferToPath but was instead for class %@", v27, (uint64_t)v7);
    uint64_t v28 = LABEL_18:;

    uint64_t v29 = *(void *)(a1[4] + 8);
    id v20 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;
    goto LABEL_19;
  }
  __int16 v12 = (id *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v13 = a3;
LABEL_5:
  objc_storeStrong(v12, v13);
LABEL_20:
}

- (BOOL)hasIconResourcesPromise
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__IXPlaceholder_hasIconResourcesPromise__block_invoke;
  v8[3] = &unk_1E5D17618;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  id v5 = [(IXDataPromise *)self uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__IXPlaceholder_hasIconResourcesPromise__block_invoke_245;
  v7[3] = &unk_1E5D17640;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "_remote_IXSPlaceholder:hasIconResourcesPromise:", v5, v7);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __40__IXPlaceholder_hasIconResourcesPromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315650;
      id v7 = "-[IXPlaceholder hasIconResourcesPromise]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an icon resources promise: %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

void __40__IXPlaceholder_hasIconResourcesPromise__block_invoke_245(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXPlaceholder hasIconResourcesPromise]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an icon resources promise: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)setInfoPlistLocalizations:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  __int16 v33 = __Block_byref_object_copy__5;
  id v34 = __Block_byref_object_dispose__5;
  id v35 = 0;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  if ((IXDictionaryContainsOnlyClassesCheckingValueTypes(v6, v7, v8, v9, v10) & 1) == 0)
  {
    uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[IXPlaceholder setInfoPlistLocalizations:error:]();
    }

    uint64_t v23 = _CreateError((uint64_t)"-[IXPlaceholder setInfoPlistLocalizations:error:]", 1357, @"IXErrorDomain", 0x1CuLL, 0, 0, @"Localizations dictionary contains objects other than those expected.", v22, v27);
    goto LABEL_10;
  }
  uint64_t v11 = [IXPromisedInMemoryDictionary alloc];
  __int16 v12 = NSString;
  id v13 = [(IXPlaceholder *)self bundleID];
  uint64_t v14 = [v12 stringWithFormat:@"Localizations for %@", v13];
  uint64_t v15 = [(IXPromisedInMemoryDictionary *)v11 initWithName:v14 client:[(IXDataPromise *)self creatorIdentifier] dictionary:v6];

  if (!v15)
  {
    uint64_t v24 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[IXPlaceholder setInfoPlistLocalizations:error:]();
    }

    uint64_t v23 = _CreateError((uint64_t)"-[IXPlaceholder setInfoPlistLocalizations:error:]", 1363, @"IXErrorDomain", 2uLL, 0, 0, @"Failed to create dictionary promise for localizations for %@", v25, (uint64_t)self);
LABEL_10:
    BOOL v20 = 0;
    uint64_t v15 = (IXPromisedInMemoryDictionary *)v31[5];
    v31[5] = v23;
    goto LABEL_11;
  }
  uint64_t v16 = +[IXServerConnection sharedConnection];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __49__IXPlaceholder_setInfoPlistLocalizations_error___block_invoke;
  v29[3] = &unk_1E5D17550;
  void v29[4] = self;
  v29[5] = &v30;
  uint64_t v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v29];
  uint64_t v18 = [(IXDataPromise *)self uniqueIdentifier];
  uint64_t v19 = [(IXDataPromise *)v15 uniqueIdentifier];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __49__IXPlaceholder_setInfoPlistLocalizations_error___block_invoke_256;
  v28[3] = &unk_1E5D17550;
  v28[4] = self;
  v28[5] = &v30;
  objc_msgSend(v17, "_remote_IXSPlaceholder:setLocalizationPromiseUUID:completion:", v18, v19, v28);

  BOOL v20 = v31[5] == 0;
LABEL_11:

  if (a4 && !v20) {
    *a4 = (id) v31[5];
  }
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __49__IXPlaceholder_setInfoPlistLocalizations_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      uint64_t v8 = "-[IXPlaceholder setInfoPlistLocalizations:error:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set Info plist localizations on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __49__IXPlaceholder_setInfoPlistLocalizations_error___block_invoke_256(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      uint64_t v8 = "-[IXPlaceholder setInfoPlistLocalizations:error:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set Info plist localizations on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)infoPlistLocalizationsWithError:(id *)a3
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__IXPlaceholder_infoPlistLocalizationsWithError___block_invoke;
  v12[3] = &unk_1E5D17550;
  v12[4] = self;
  void v12[5] = &v19;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  int v7 = [(IXDataPromise *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__IXPlaceholder_infoPlistLocalizationsWithError___block_invoke_257;
  v11[3] = &unk_1E5D17EE0;
  v11[4] = self;
  v11[5] = &v19;
  void v11[6] = &v13;
  objc_msgSend(v6, "_remote_IXSPlaceholder:getLocalizationDictionary:", v7, v11);

  uint64_t v8 = (void *)v14[5];
  if (a3 && !v8)
  {
    *a3 = (id) v20[5];
    uint64_t v8 = (void *)v14[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __49__IXPlaceholder_infoPlistLocalizationsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      uint64_t v8 = "-[IXPlaceholder infoPlistLocalizationsWithError:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set Info plist localizations on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __49__IXPlaceholder_infoPlistLocalizationsWithError___block_invoke_257(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v8 = a3;
  if (v8)
  {
    __int16 v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      *(_DWORD *)uint64_t v16 = 136315650;
      *(void *)&v16[4] = "-[IXPlaceholder infoPlistLocalizationsWithError:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to set Info plist localizations on %@ : %@", v16, 0x20u);
    }

    __int16 v11 = (id *)(*(void *)(a1[5] + 8) + 40);
    id v12 = a3;
  }
  else
  {
    if (!v6)
    {
      uint64_t v13 = _CreateError((uint64_t)"-[IXPlaceholder infoPlistLocalizationsWithError:]_block_invoke", 1408, @"IXErrorDomain", 0x17uLL, 0, 0, @"A localization dictionary is not currently set.", v7, *(uint64_t *)v16);
      uint64_t v14 = *(void *)(a1[5] + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      goto LABEL_8;
    }
    __int16 v11 = (id *)(*(void *)(a1[6] + 8) + 40);
    id v12 = a2;
  }
  objc_storeStrong(v11, v12);
LABEL_8:
}

- (BOOL)setEntitlementsPromise:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__5;
  uint64_t v29 = __Block_byref_object_dispose__5;
  id v30 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__IXPlaceholder_setEntitlementsPromise_error___block_invoke;
  v21[3] = &unk_1E5D175A0;
  id v8 = v6;
  id v22 = v8;
  uint64_t v23 = self;
  id v24 = &v25;
  __int16 v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v21];
  uint64_t v10 = [(IXDataPromise *)self uniqueIdentifier];
  __int16 v11 = [v8 uniqueIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__IXPlaceholder_setEntitlementsPromise_error___block_invoke_262;
  v17[3] = &unk_1E5D175A0;
  id v12 = v8;
  id v18 = v12;
  __int16 v19 = self;
  id v20 = &v25;
  objc_msgSend(v9, "_remote_IXSPlaceholder:setEntitlementsPromiseUUID:completion:", v10, v11, v17);

  uint64_t v13 = v26;
  if (a4)
  {
    uint64_t v14 = (void *)v26[5];
    if (v14)
    {
      *a4 = v14;
      uint64_t v13 = v26;
    }
  }
  BOOL v15 = v13[5] == 0;

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __46__IXPlaceholder_setEntitlementsPromise_error___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      __int16 v9 = "-[IXPlaceholder setEntitlementsPromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set entitlements promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

void __46__IXPlaceholder_setEntitlementsPromise_error___block_invoke_262(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      __int16 v9 = "-[IXPlaceholder setEntitlementsPromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set entitlements promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

- (id)entitlementsPromiseWithError:(id *)a3
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  __int16 v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  v12[4] = &v13;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v7 = [(IXDataPromise *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_263;
  v11[3] = &unk_1E5D175F0;
  v11[4] = &v13;
  v11[5] = &v19;
  objc_msgSend(v6, "_remote_IXSPlaceholder:getEntitlementsPromise:", v7, v11);

  int v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    int v8 = (void *)v20[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[IXPlaceholder entitlementsPromiseWithError:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get entitlements promise: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_263(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      id v9 = (objc_class *)[v5 clientPromiseClass];
      uint64_t v10 = [[v9 alloc] initWithSeed:v5];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_17;
        }
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        __int16 v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;

        uint64_t v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_263_cold_2();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXPlaceholder entitlementsPromiseWithError:]_block_invoke", 1466, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for an owned data promise subclass but was instead for class %@", v17, (uint64_t)v5);
      }
      else
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_263_cold_1();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXPlaceholder entitlementsPromiseWithError:]_block_invoke", 1463, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ with seed %@", v22, (uint64_t)v16);
      uint64_t v23 = };

      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
      id v20 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      uint64_t v18 = _CreateError((uint64_t)"-[IXPlaceholder entitlementsPromiseWithError:]_block_invoke", 1458, @"IXErrorDomain", 0x17uLL, 0, 0, @"An entitlements promise is not currently set.", v6, v25);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[IXPlaceholder entitlementsPromiseWithError:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get entitlements promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
LABEL_17:
}

- (BOOL)hasEntitlementsPromise
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__IXPlaceholder_hasEntitlementsPromise__block_invoke;
  v8[3] = &unk_1E5D17618;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  id v5 = [(IXDataPromise *)self uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__IXPlaceholder_hasEntitlementsPromise__block_invoke_267;
  v7[3] = &unk_1E5D17640;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "_remote_IXSPlaceholder:hasEntitlementsPromise:", v5, v7);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __39__IXPlaceholder_hasEntitlementsPromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315650;
      id v7 = "-[IXPlaceholder hasEntitlementsPromise]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an entitlements promise: %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

void __39__IXPlaceholder_hasEntitlementsPromise__block_invoke_267(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXPlaceholder hasEntitlementsPromise]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an entitlements promise: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)setInfoPlistLoctablePromise:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = __Block_byref_object_copy__5;
  id v29 = __Block_byref_object_dispose__5;
  id v30 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __51__IXPlaceholder_setInfoPlistLoctablePromise_error___block_invoke;
  v21[3] = &unk_1E5D175A0;
  id v8 = v6;
  id v22 = v8;
  uint64_t v23 = self;
  uint64_t v24 = &v25;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v21];
  __int16 v10 = [(IXDataPromise *)self uniqueIdentifier];
  uint64_t v11 = [v8 uniqueIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__IXPlaceholder_setInfoPlistLoctablePromise_error___block_invoke_268;
  v17[3] = &unk_1E5D175A0;
  id v12 = v8;
  id v18 = v12;
  uint64_t v19 = self;
  id v20 = &v25;
  objc_msgSend(v9, "_remote_IXSPlaceholder:setInfoPlistLoctablePromiseUUID:completion:", v10, v11, v17);

  id v13 = v26;
  if (a4)
  {
    uint64_t v14 = (void *)v26[5];
    if (v14)
    {
      *a4 = v14;
      id v13 = v26;
    }
  }
  BOOL v15 = v13[5] == 0;

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __51__IXPlaceholder_setInfoPlistLoctablePromise_error___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      uint64_t v9 = "-[IXPlaceholder setInfoPlistLoctablePromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set loctable promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

void __51__IXPlaceholder_setInfoPlistLoctablePromise_error___block_invoke_268(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      uint64_t v9 = "-[IXPlaceholder setInfoPlistLoctablePromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set loctable promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

- (id)infoPlistLoctablePromiseWithError:(id *)a3
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  v12[4] = &v13;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v7 = [(IXDataPromise *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_269;
  v11[3] = &unk_1E5D175F0;
  v11[4] = &v13;
  v11[5] = &v19;
  objc_msgSend(v6, "_remote_IXSPlaceholder:getInfoPlistLoctablePromise:", v7, v11);

  int v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    int v8 = (void *)v20[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[IXPlaceholder infoPlistLoctablePromiseWithError:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get loctable promise: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_269(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      id v9 = (objc_class *)[v5 clientPromiseClass];
      uint64_t v10 = [[v9 alloc] initWithSeed:v5];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_17;
        }
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        __int16 v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;

        uint64_t v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_269_cold_2();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXPlaceholder infoPlistLoctablePromiseWithError:]_block_invoke", 1540, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for an owned data promise subclass but was instead for class %@", v17, (uint64_t)v5);
      }
      else
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_269_cold_1();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXPlaceholder infoPlistLoctablePromiseWithError:]_block_invoke", 1537, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ with seed %@", v22, (uint64_t)v16);
      uint64_t v23 = };

      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
      id v20 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      uint64_t v18 = _CreateError((uint64_t)"-[IXPlaceholder infoPlistLoctablePromiseWithError:]_block_invoke", 1532, @"IXErrorDomain", 0x17uLL, 0, 0, @"A loctable promise is not currently set.", v6, v25);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[IXPlaceholder infoPlistLoctablePromiseWithError:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get loctable promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
LABEL_17:
}

- (BOOL)hasInfoPlistLoctablePromise
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__IXPlaceholder_hasInfoPlistLoctablePromise__block_invoke;
  v8[3] = &unk_1E5D17618;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  id v5 = [(IXDataPromise *)self uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__IXPlaceholder_hasInfoPlistLoctablePromise__block_invoke_273;
  v7[3] = &unk_1E5D17640;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "_remote_IXSPlaceholder:hasInfoPlistLoctablePromise:", v5, v7);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __44__IXPlaceholder_hasInfoPlistLoctablePromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315650;
      id v7 = "-[IXPlaceholder hasInfoPlistLoctablePromise]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a loctable promise: %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

void __44__IXPlaceholder_hasInfoPlistLoctablePromise__block_invoke_273(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXPlaceholder hasInfoPlistLoctablePromise]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a loctable promise: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)setAppExtensionPlaceholderPromises:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v43 = 0;
  CFURLRef v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__5;
  uint64_t v47 = __Block_byref_object_dispose__5;
  id v48 = 0;
  int v6 = objc_opt_new();
  uint64_t v7 = NSString;
  int v8 = [(IXPlaceholder *)self bundleID];
  uint64_t v9 = [v7 stringWithFormat:@"%@.", v8];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v40;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
      uint64_t v15 = [v14 bundleID];
      char v16 = [v15 hasPrefix:v9];

      if ((v16 & 1) == 0) {
        break;
      }
      uint64_t v17 = [v14 seed];
      char v18 = [v17 isAppExtension];

      if ((v18 & 1) == 0)
      {
        id v29 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[IXPlaceholder setAppExtensionPlaceholderPromises:error:]();
        }

        uint64_t v31 = _CreateError((uint64_t)"-[IXPlaceholder setAppExtensionPlaceholderPromises:error:]", 1587, @"IXErrorDomain", 4uLL, 0, 0, @"Attempt made to set an app placeholder as an app extension placeholder: %@", v30, (uint64_t)v14);
        __int16 v28 = (void *)v44[5];
        v44[5] = v31;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v19 = [v14 uniqueIdentifier];
      [v6 addObject:v19];

      if (v11 == ++v13)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v50 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    uint64_t v23 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = [v14 bundleID];
      -[IXPlaceholder setAppExtensionPlaceholderPromises:error:](v24, (uint64_t)v9, v49);
    }

    uint64_t v25 = [v14 bundleID];
    uint64_t v27 = _CreateError((uint64_t)"-[IXPlaceholder setAppExtensionPlaceholderPromises:error:]", 1582, @"IXErrorDomain", 8uLL, 0, 0, @"Attempted to set app extension placeholder promise with bundle ID %@ that does not match required prefix of %@ for parent", v26, (uint64_t)v25);

    __int16 v28 = (void *)v44[5];
    v44[5] = v27;
    goto LABEL_17;
  }
LABEL_10:

  id v20 = +[IXServerConnection sharedConnection];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __58__IXPlaceholder_setAppExtensionPlaceholderPromises_error___block_invoke;
  v38[3] = &unk_1E5D17550;
  v38[4] = self;
  v38[5] = &v43;
  uint64_t v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v38];
  uint64_t v22 = [(IXDataPromise *)self uniqueIdentifier];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __58__IXPlaceholder_setAppExtensionPlaceholderPromises_error___block_invoke_283;
  v37[3] = &unk_1E5D17550;
  v37[4] = self;
  v37[5] = &v43;
  objc_msgSend(v21, "_remote_IXSPlaceholder:setAppExtensionPlaceholderPromiseUUIDs:completion:", v22, v6, v37);

LABEL_18:
  uint64_t v32 = v44;
  if (a4)
  {
    __int16 v33 = (void *)v44[5];
    if (v33)
    {
      *a4 = v33;
      uint64_t v32 = v44;
    }
  }
  BOOL v34 = v32[5] == 0;

  _Block_object_dispose(&v43, 8);
  return v34;
}

void __58__IXPlaceholder_setAppExtensionPlaceholderPromises_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      int v8 = "-[IXPlaceholder setAppExtensionPlaceholderPromises:error:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app extension placeholder promises on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __58__IXPlaceholder_setAppExtensionPlaceholderPromises_error___block_invoke_283(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      int v8 = "-[IXPlaceholder setAppExtensionPlaceholderPromises:error:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app extension placeholder promises on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)appExtensionPlaceholderPromisesWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x3032000000;
  CFURLRef v44 = __Block_byref_object_copy__5;
  uint64_t v45 = __Block_byref_object_dispose__5;
  id v46 = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__5;
  long long v39 = __Block_byref_object_dispose__5;
  id v40 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __58__IXPlaceholder_appExtensionPlaceholderPromisesWithError___block_invoke;
  v34[3] = &unk_1E5D172A8;
  v34[4] = &v35;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v34];
  int v7 = [(IXDataPromise *)self uniqueIdentifier];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __58__IXPlaceholder_appExtensionPlaceholderPromisesWithError___block_invoke_284;
  v33[3] = &unk_1E5D172D0;
  void v33[4] = &v35;
  v33[5] = &v41;
  objc_msgSend(v6, "_remote_IXSPlaceholder:getAppExtensionPlaceholderPromises:", v7, v33);

  if (v36[5])
  {
    int v8 = 0;
LABEL_21:
    char v16 = 0;
    if (!a3) {
      goto LABEL_24;
    }
LABEL_22:
    if (!v16) {
      *a3 = (id) v36[5];
    }
    goto LABEL_24;
  }
  int v8 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = (id)v42[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v48 count:16];
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      uint64_t v14 = (objc_class *)[v13 clientPromiseClass];
      uint64_t v15 = (void *)[[v14 alloc] initWithSeed:v13];
      if (!v15)
      {
        uint64_t v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          char v18 = NSStringFromClass(v14);
          [(IXPlaceholder *)v18 appExtensionPlaceholderPromisesWithError:v47];
        }

        uint64_t v19 = NSStringFromClass(v14);
        uint64_t v21 = _CreateError((uint64_t)"-[IXPlaceholder appExtensionPlaceholderPromisesWithError:]", 1653, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ with seed %@", v20, (uint64_t)v19);

        goto LABEL_20;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v22 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = NSStringFromClass(v14);
          [(IXPlaceholder *)(uint64_t)v13 appExtensionPlaceholderPromisesWithError:v47];
        }

        __int16 v28 = NSStringFromClass(v14);
        uint64_t v21 = _CreateError((uint64_t)"-[IXPlaceholder appExtensionPlaceholderPromisesWithError:]", 1656, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for a placeholder promise but was instead for class %@", v24, (uint64_t)v13);

LABEL_20:
        uint64_t v25 = (void *)v36[5];
        v36[5] = v21;

        goto LABEL_21;
      }
      [v8 addObject:v15];
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v48 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_12:

  char v16 = (void *)[v8 copy];
  if (a3) {
    goto LABEL_22;
  }
LABEL_24:
  id v26 = v16;
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);

  return v26;
}

void __58__IXPlaceholder_appExtensionPlaceholderPromisesWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      int v7 = "-[IXPlaceholder appExtensionPlaceholderPromisesWithError:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app extension placeholder promises: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __58__IXPlaceholder_appExtensionPlaceholderPromisesWithError___block_invoke_284(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v8 = a3;
  if (v8)
  {
    id v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)&v15[4] = "-[IXPlaceholder appExtensionPlaceholderPromisesWithError:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app extension placeholder promises: %@", v15, 0x16u);
    }

    uint64_t v10 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v11 = a3;
  }
  else
  {
    if (!v6)
    {
      uint64_t v12 = _CreateError((uint64_t)"-[IXPlaceholder appExtensionPlaceholderPromisesWithError:]_block_invoke", 1637, @"IXErrorDomain", 0x17uLL, 0, 0, @"No app extension placeholder promises are currently set.", v7, *(uint64_t *)v15);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      goto LABEL_8;
    }
    uint64_t v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = a2;
  }
  objc_storeStrong(v10, v11);
LABEL_8:
}

- (BOOL)hasPlugInPlaceholderPromises
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__IXPlaceholder_hasPlugInPlaceholderPromises__block_invoke;
  v8[3] = &unk_1E5D17618;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  id v5 = [(IXDataPromise *)self uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__IXPlaceholder_hasPlugInPlaceholderPromises__block_invoke_292;
  v7[3] = &unk_1E5D17640;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "_remote_IXSPlaceholder:hasAppExtensionPlaceholderPromises:", v5, v7);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __45__IXPlaceholder_hasPlugInPlaceholderPromises__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315650;
      uint64_t v7 = "-[IXPlaceholder hasPlugInPlaceholderPromises]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an icon promise: %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

void __45__IXPlaceholder_hasPlugInPlaceholderPromises__block_invoke_292(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXPlaceholder hasPlugInPlaceholderPromises]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has app extension placeholder promises: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)setConfigurationCompleteWithError:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__5;
  uint64_t v18 = __Block_byref_object_dispose__5;
  id v19 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__IXPlaceholder_setConfigurationCompleteWithError___block_invoke;
  v13[3] = &unk_1E5D17550;
  v13[4] = self;
  v13[5] = &v14;
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v13];
  uint64_t v7 = [(IXDataPromise *)self uniqueIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__IXPlaceholder_setConfigurationCompleteWithError___block_invoke_293;
  v12[3] = &unk_1E5D17550;
  v12[4] = self;
  void v12[5] = &v14;
  objc_msgSend(v6, "_remote_IXSPlaceholder:setConfigurationCompleteWithCompletion:", v7, v12);

  int v8 = v15;
  if (a3)
  {
    uint64_t v9 = (void *)v15[5];
    if (v9)
    {
      *a3 = v9;
      int v8 = v15;
    }
  }
  BOOL v10 = v8[5] == 0;
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __51__IXPlaceholder_setConfigurationCompleteWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      int v8 = "-[IXPlaceholder setConfigurationCompleteWithError:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app extension placeholder promises on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __51__IXPlaceholder_setConfigurationCompleteWithError___block_invoke_293(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      int v8 = "-[IXPlaceholder setConfigurationCompleteWithError:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set configuration complete on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (IXPlaceholder)initWithSeed:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPlaceholder;
  return [(IXOwnedDataPromise *)&v4 initWithSeed:a3];
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (NSString)bundleName
{
  v2 = [(IXDataPromise *)self seed];
  id v3 = [v2 bundleName];

  return (NSString *)v3;
}

- (void)setBundleName:(id)a3
{
  id v4 = a3;
  id v5 = [(IXDataPromise *)self seed];
  [v5 setBundleName:v4];
}

- (NSString)bundleID
{
  v2 = [(IXDataPromise *)self seed];
  id v3 = [v2 bundleID];

  return (NSString *)v3;
}

- (void)setBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(IXDataPromise *)self seed];
  [v5 setBundleID:v4];
}

- (unint64_t)placeholderType
{
  v2 = [(IXDataPromise *)self seed];
  unint64_t v3 = [v2 placeholderType];

  return v3;
}

- (unint64_t)installType
{
  v2 = [(IXDataPromise *)self seed];
  unint64_t v3 = [v2 installType];

  return v3;
}

- (MIStoreMetadata)metadata
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  unint64_t v3 = [(IXPlaceholder *)self metadataWithError:&v7];
  id v4 = v7;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v9 = "-[IXPlaceholder metadata]";
      __int16 v10 = 2112;
      __int16 v11 = self;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get metadata for %@: %@", buf, 0x20u);
    }
  }

  return (MIStoreMetadata *)v3;
}

- (void)setMetadata:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  BOOL v4 = [(IXPlaceholder *)self setMetadata:a3 error:&v7];
  id v5 = v7;
  if (!v4)
  {
    uint64_t v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v9 = "-[IXPlaceholder setMetadata:]";
      __int16 v10 = 2112;
      __int16 v11 = self;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to set metadata for %@: %@", buf, 0x20u);
    }
  }
}

- (BOOL)setMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = __Block_byref_object_copy__5;
  long long v29 = __Block_byref_object_dispose__5;
  id v30 = 0;
  if (!v6)
  {
    int v8 = 0;
    __int16 v9 = 0;
    goto LABEL_6;
  }
  id obj = 0;
  int v8 = IXEncodeRootObject(v6, &obj);
  objc_storeStrong(&v30, obj);
  if (v8)
  {
    __int16 v9 = [[IXPromisedInMemoryData alloc] initWithName:@"MIStoreMetadata data" client:15 data:v8];
    if (v9)
    {

      int v8 = [(IXDataPromise *)v9 uniqueIdentifier];
LABEL_6:
      __int16 v10 = +[IXServerConnection sharedConnection];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __35__IXPlaceholder_setMetadata_error___block_invoke;
      v23[3] = &unk_1E5D17550;
      v23[4] = self;
      v23[5] = &v25;
      __int16 v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v23];
      __int16 v12 = [(IXDataPromise *)self uniqueIdentifier];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __35__IXPlaceholder_setMetadata_error___block_invoke_303;
      v22[3] = &unk_1E5D17550;
      v22[4] = self;
      v22[5] = &v25;
      objc_msgSend(v11, "_remote_IXSPlaceholder:setMetadataPromiseUUID:completion:", v12, v8, v22);

      goto LABEL_11;
    }
    id v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[IXPlaceholder setMetadata:error:]();
    }

    uint64_t v15 = _CreateError((uint64_t)"-[IXPlaceholder setMetadata:error:]", 1797, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to create data promise for serialized metadata", v14, v21);
    uint64_t v16 = (void *)v26[5];
    v26[5] = v15;
  }
  __int16 v9 = 0;
LABEL_11:

  uint64_t v17 = v26[5];
  if (v17)
  {
    [(IXDataPromise *)self cancelForReason:v17 client:15 error:0];
    uint64_t v18 = (void *)v26[5];
    if (a4 && v18)
    {
      *a4 = v18;
      uint64_t v18 = (void *)v26[5];
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  BOOL v19 = v18 == 0;

  _Block_object_dispose(&v25, 8);
  return v19;
}

void __35__IXPlaceholder_setMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    __int16 v9 = "-[IXPlaceholder setMetadata:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get remote proxy for setting metadata promise on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __35__IXPlaceholder_setMetadata_error___block_invoke_303(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315650;
      __int16 v9 = "-[IXPlaceholder setMetadata:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set metadata promise UUID on %@ : %@", (uint8_t *)&v8, 0x20u);
    }
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

- (id)metadataWithError:(id *)a3
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__5;
  uint64_t v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__5;
  uint64_t v21 = __Block_byref_object_dispose__5;
  id v22 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__IXPlaceholder_metadataWithError___block_invoke;
  v16[3] = &unk_1E5D172A8;
  v16[4] = &v17;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v16];
  id v7 = [(IXDataPromise *)self uniqueIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__IXPlaceholder_metadataWithError___block_invoke_2;
  v15[3] = &unk_1E5D17F08;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v6, "_remote_IXSPlaceholder:getMetadataWithCompletion:", v7, v15);

  __int16 v9 = (void *)v24[5];
  if (!v9)
  {
    if (v18[5])
    {
      __int16 v9 = 0;
      if (!a3) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v10 = _CreateError((uint64_t)"-[IXPlaceholder metadataWithError:]", 1841, @"IXErrorDomain", 0x17uLL, 0, 0, @"Metadata is not currently set.", v8, v14);
      uint64_t v11 = (void *)v18[5];
      v18[5] = v10;

      __int16 v9 = (void *)v24[5];
      if (!a3) {
        goto LABEL_8;
      }
    }
    if (!v9)
    {
      *a3 = (id) v18[5];
      __int16 v9 = (void *)v24[5];
    }
  }
LABEL_8:
  id v12 = v9;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v12;
}

void __35__IXPlaceholder_metadataWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __35__IXPlaceholder_metadataWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setSinfData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__5;
  uint64_t v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  if (!v6)
  {
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = [[IXPromisedInMemoryData alloc] initWithName:@"Placeholder Sinf Data" client:15 data:v6];
  if (v7)
  {
LABEL_7:
    id v11 = [(IXDataPromise *)v7 uniqueIdentifier];
    id v12 = +[IXServerConnection sharedConnection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__IXPlaceholder_setSinfData_error___block_invoke;
    v20[3] = &unk_1E5D17550;
    v20[4] = self;
    v20[5] = &v21;
    id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v20];
    uint64_t v14 = [(IXDataPromise *)self uniqueIdentifier];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__35__IXPlaceholder_setSinfData_error___block_invoke_314;
    v19[3] = (uint64_t)&unk_1E5D17550;
    v19[4] = (uint64_t)self;
    v19[5] = (uint64_t)&v21;
    objc_msgSend(v13, "_remote_IXSPlaceholder:setSinfPromiseUUID:completion:", v14, v11, v19);

    goto LABEL_8;
  }
  uint64_t v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[IXPlaceholder setSinfData:error:]();
  }

  uint64_t v10 = _CreateError((uint64_t)"-[IXPlaceholder setSinfData:error:]", 1861, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to create data promise for sinf data", v9, v19[0]);
  uint64_t v7 = 0;
  id v11 = (void *)v22[5];
  v22[5] = v10;
LABEL_8:

  uint64_t v15 = v22[5];
  if (v15)
  {
    [(IXDataPromise *)self cancelForReason:v15 client:15 error:0];
    uint64_t v16 = (void *)v22[5];
    if (a4 && v16)
    {
      *a4 = v16;
      uint64_t v16 = (void *)v22[5];
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  BOOL v17 = v16 == 0;

  _Block_object_dispose(&v21, 8);
  return v17;
}

void __35__IXPlaceholder_setSinfData_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    uint64_t v9 = "-[IXPlaceholder setSinfData:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get remote proxy for setting sinf promise on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __35__IXPlaceholder_setSinfData_error___block_invoke_314(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXPlaceholder setSinfData:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set sinf promise UUID on %@ : %@", (uint8_t *)&v8, 0x20u);
    }
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

- (id)sinfDataWithError:(id *)a3
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__5;
  uint64_t v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__5;
  uint64_t v21 = __Block_byref_object_dispose__5;
  id v22 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__IXPlaceholder_sinfDataWithError___block_invoke;
  v16[3] = &unk_1E5D172A8;
  v16[4] = &v17;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v16];
  uint64_t v7 = [(IXDataPromise *)self uniqueIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__IXPlaceholder_sinfDataWithError___block_invoke_2;
  v15[3] = &unk_1E5D17F30;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v6, "_remote_IXSPlaceholder:getSinfDataWithCompletion:", v7, v15);

  uint64_t v9 = (void *)v24[5];
  if (!v9)
  {
    if (v18[5])
    {
      uint64_t v9 = 0;
      if (!a3) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v10 = _CreateError((uint64_t)"-[IXPlaceholder sinfDataWithError:]", 1905, @"IXErrorDomain", 0x17uLL, 0, 0, @"Sinf data is not currently set.", v8, v14);
      uint64_t v11 = (void *)v18[5];
      v18[5] = v10;

      uint64_t v9 = (void *)v24[5];
      if (!a3) {
        goto LABEL_8;
      }
    }
    if (!v9)
    {
      *a3 = (id) v18[5];
      uint64_t v9 = (void *)v24[5];
    }
  }
LABEL_8:
  id v12 = v9;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v12;
}

void __35__IXPlaceholder_sinfDataWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __35__IXPlaceholder_sinfDataWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setLaunchProhibited:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__5;
  uint64_t v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__IXPlaceholder_setLaunchProhibited_error___block_invoke;
  v14[3] = &unk_1E5D172A8;
  v14[4] = &v15;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  uint64_t v9 = [(IXDataPromise *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__IXPlaceholder_setLaunchProhibited_error___block_invoke_2;
  v13[3] = &unk_1E5D172A8;
  v13[4] = &v15;
  objc_msgSend(v8, "_remote_IXSPlaceholder:setLaunchProhibited:completion:", v9, v5, v13);

  uint64_t v10 = (void *)v16[5];
  if (a4 && v10)
  {
    *a4 = v10;
    uint64_t v10 = (void *)v16[5];
  }
  BOOL v11 = v10 == 0;
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __43__IXPlaceholder_setLaunchProhibited_error___block_invoke(uint64_t a1, void *a2)
{
}

void __43__IXPlaceholder_setLaunchProhibited_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)launchProhibited:(BOOL *)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__5;
  uint64_t v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__IXPlaceholder_launchProhibited_error___block_invoke;
  v14[3] = &unk_1E5D172A8;
  v14[4] = &v15;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  uint64_t v9 = [(IXDataPromise *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__IXPlaceholder_launchProhibited_error___block_invoke_2;
  v13[3] = &unk_1E5D17668;
  v13[4] = &v15;
  void v13[5] = a3;
  objc_msgSend(v8, "_remote_IXSPlaceholder:getLaunchProhibitedWithCompletion:", v9, v13);

  uint64_t v10 = (void *)v16[5];
  if (a4 && v10)
  {
    *a4 = v10;
    uint64_t v10 = (void *)v16[5];
  }
  BOOL v11 = v10 == 0;
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __40__IXPlaceholder_launchProhibited_error___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __40__IXPlaceholder_launchProhibited_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v6 = *(unsigned char **)(a1 + 40);
    if (v6) {
      unsigned char *v6 = a2;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v5;

  return MEMORY[0x1F41817F8]();
}

- (BOOL)setPlaceholderAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__5;
  id v48 = __Block_byref_object_dispose__5;
  id v49 = 0;
  unint64_t v7 = [(IXPlaceholder *)self placeholderType];
  uint64_t v8 = v7;
  switch(v7)
  {
    case 1uLL:
      uint64_t v15 = [v6 extensionDictionary];

      if (v15)
      {
        uint64_t v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.4();
        }

        uint64_t v14 = _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1963, @"IXErrorDomain", 0x11uLL, 0, 0, @"extensionDictionary does not make sense as an attribute of an app placeholder", v17, v41);
        goto LABEL_34;
      }
      uint64_t v25 = [v6 exAppExtensionAttributes];

      if (v25)
      {
        id v26 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[IXPlaceholder setPlaceholderAttributes:error:]();
        }

        uint64_t v14 = _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1968, @"IXErrorDomain", 0x11uLL, 0, 0, @"exAppExtensionAttributes does not make sense as an attribute of an app placeholder", v27, v41);
        goto LABEL_34;
      }
      goto LABEL_26;
    case 2uLL:
      uint64_t v18 = [v6 extensionDictionary];

      if (!v18)
      {
        id v30 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.5();
        }

        uint64_t v14 = _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1976, @"IXErrorDomain", 0x11uLL, 0, 0, @"extensionDictionary must be set in placeholder attributes for an app extension placeholder", v31, v41);
        goto LABEL_34;
      }
      uint64_t v19 = [v6 extensionDictionary];
      id v20 = [v19 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];

      if (!v20)
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.6();
        }

        uint64_t v14 = _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1979, @"IXErrorDomain", 0x11uLL, 0, 0, @"extensionDictionary must have the NSExtensionPointIdentifier key set to a valid extension point identifier string", v22, v41);
        goto LABEL_34;
      }
      goto LABEL_26;
    case 3uLL:
      uint64_t v9 = [v6 exAppExtensionAttributes];

      if (!v9)
      {
        uint64_t v23 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.7();
        }

        uint64_t v14 = _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1987, @"IXErrorDomain", 0x11uLL, 0, 0, @"exAppExtensionAttributes must be set in placeholder attributes for an ExtensionKit app extension placeholder", v24, v41);
        goto LABEL_34;
      }
      uint64_t v10 = [v6 exAppExtensionAttributes];
      BOOL v11 = [v10 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];

      if (!v11)
      {
        id v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.8();
        }

        uint64_t v14 = _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1990, @"IXErrorDomain", 0x11uLL, 0, 0, @"exAppExtensionAttributes must have the EXExtensionPointIdentifier key set to a valid extension point identifier string", v13, v41);
LABEL_34:
        long long v32 = (void *)v45[5];
        v45[5] = v14;
LABEL_37:

        goto LABEL_38;
      }
LABEL_26:
      if (IXIsAppExtensionForPlaceholderType(v8))
      {
        if ([v6 launchProhibited])
        {
          id v28 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[IXPlaceholder setPlaceholderAttributes:error:]();
          }

          uint64_t v14 = _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 2003, @"IXErrorDomain", 0x11uLL, 0, 0, @"launchProhibited = YES does not make sense as an attribute of an app extension placeholder", v29, v41);
          goto LABEL_34;
        }
        __int16 v33 = [v6 bundleVersion];

        if (!v33)
        {
          long long v39 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[IXPlaceholder setPlaceholderAttributes:error:]();
          }

          uint64_t v14 = _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 2006, @"IXErrorDomain", 0x11uLL, 0, 0, @"bundleVersion must be set in placeholder attributes for an app extension placeholder", v40, v41);
          goto LABEL_34;
        }
      }
      long long v32 = +[IXServerConnection sharedConnection];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __48__IXPlaceholder_setPlaceholderAttributes_error___block_invoke;
      v43[3] = &unk_1E5D172A8;
      v43[4] = &v44;
      BOOL v34 = [v32 synchronousRemoteObjectProxyWithErrorHandler:v43];
      uint64_t v35 = [(IXDataPromise *)self uniqueIdentifier];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __48__IXPlaceholder_setPlaceholderAttributes_error___block_invoke_2;
      v42[3] = &unk_1E5D172A8;
      v42[4] = &v44;
      objc_msgSend(v34, "_remote_IXSPlaceholder:setAttributes:completion:", v35, v6, v42);

      goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Unknown placeholder type: %lu", v7);
LABEL_38:
  id v36 = (void *)v45[5];
  if (a4 && v36)
  {
    *a4 = v36;
    id v36 = (void *)v45[5];
  }
  BOOL v37 = v36 == 0;
  _Block_object_dispose(&v44, 8);

  return v37;
}

void __48__IXPlaceholder_setPlaceholderAttributes_error___block_invoke(uint64_t a1, void *a2)
{
}

void __48__IXPlaceholder_setPlaceholderAttributes_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)placeholderAttributesWithError:(id *)a3
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__5;
  uint64_t v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__5;
  uint64_t v21 = __Block_byref_object_dispose__5;
  id v22 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__IXPlaceholder_placeholderAttributesWithError___block_invoke;
  v16[3] = &unk_1E5D172A8;
  v16[4] = &v17;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v16];
  unint64_t v7 = [(IXDataPromise *)self uniqueIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__IXPlaceholder_placeholderAttributesWithError___block_invoke_2;
  v15[3] = &unk_1E5D17F58;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v6, "_remote_IXSPlaceholder:getAttributesWithCompletion:", v7, v15);

  uint64_t v9 = (void *)v24[5];
  if (!v9)
  {
    if (v18[5])
    {
      uint64_t v9 = 0;
      if (!a3) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v10 = _CreateError((uint64_t)"-[IXPlaceholder placeholderAttributesWithError:]", 2038, @"IXErrorDomain", 0x17uLL, 0, 0, @"Placeholder attributes are not currently set.", v8, v14);
      BOOL v11 = (void *)v18[5];
      v18[5] = v10;

      uint64_t v9 = (void *)v24[5];
      if (!a3) {
        goto LABEL_8;
      }
    }
    if (!v9)
    {
      *a3 = (id) v18[5];
      uint64_t v9 = (void *)v24[5];
    }
  }
LABEL_8:
  id v12 = v9;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v12;
}

void __48__IXPlaceholder_placeholderAttributesWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __48__IXPlaceholder_placeholderAttributesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

+ (void)placeholderForRemovableSystemAppWithBundleID:client:installType:error:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to get system app placeholder location from LaunchServices for %@ : %@", v2);
}

+ (void)_pngDataForCGImage:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to create CGImageDestination : %@", v2, v3, v4, v5, 2u);
}

+ (void)_pngDataForCGImage:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to finalize image : %@", v2, v3, v4, v5, 2u);
}

+ (void)_placeholderForInstallable:(void *)a1 client:(NSObject *)a2 installType:metadata:isFromSerializedPlaceholder:error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  v5[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a2, v4, "%s: Item at %@ is unexpectedly a file : %@", (uint8_t *)v5);
}

+ (void)_placeholderForInstallable:(void *)a1 client:(NSObject *)a2 installType:metadata:isFromSerializedPlaceholder:error:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  v5[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a2, v4, "%s: Item at %@ is a file : %@", (uint8_t *)v5);
}

+ (void)placeholderFromSerializedPlaceholder:client:installType:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to create directory for extraction : %@", v2, v3, v4, v5, 2u);
}

+ (void)placeholderFromSerializedPlaceholder:(void *)a1 client:(NSObject *)a2 installType:error:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  v5[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a2, v4, "%s: Expected the serialized placeholder at %@ to be an IPA : %@", (uint8_t *)v5);
}

+ (void)_setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Failed to create IXPromisedInMemoryDictionary for entitlements for %@ : %@", (uint8_t *)v2);
}

+ (void)_setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to set alternative entitlements promise for %@ : %@", v2);
}

+ (void)_setEntitlementsFromBundleExecutableURL:(void *)a1 withBundleID:(NSObject *)a2 client:onPlaceholder:error:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_DEBUG, "%s: Failed to get entitlements dictionary for %@", (uint8_t *)v4, 0x16u);
}

+ (void)_setEntitlementsFromBundleExecutableURL:(void *)a1 withBundleID:client:onPlaceholder:error:.cold.4(void *a1)
{
  os_log_t v1 = [a1 path];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16_0(&dword_1A7B2D000, v2, v3, "%s: SecCodeCopySigningInformation for %@ returned error %d : %@", v4, v5, v6, v7, 2u);
}

+ (void)_setEntitlementsFromBundleExecutableURL:(void *)a1 withBundleID:client:onPlaceholder:error:.cold.5(void *a1)
{
  os_log_t v1 = [a1 path];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16_0(&dword_1A7B2D000, v2, v3, "%s: Failed to construct SecStaticCode for %@ : %d : %@", v4, v5, v6, v7, 2u);
}

+ (void)_placeholderForBundle:(void *)a1 client:(NSObject *)a2 withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  v5[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a2, v4, "%s: Failed to create CFBundle from %@ : %@", (uint8_t *)v5);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.2()
{
  OUTLINED_FUNCTION_15();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 path];
  v4[0] = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v3, "%s: Failed create placeholder attributes from %@ : %@", (uint8_t *)v4);
}

+ (void)_placeholderForBundle:(void *)a1 client:(NSObject *)a2 withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  v5[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a2, v4, "%s: Failed to get bundle ID from %@ : %@", (uint8_t *)v5);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Bundle identifier %@ contains \"/\", which is not allowed : %@", (uint8_t *)v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Bundle identifier is an empty string, which is not allowed : %@", v2, v3, v4, v5, 2u);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.6()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to create IXPlaceholder for app bundle ID %@ : %@", v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.7()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Failed to create IXPromisedTransferToPath for entitlements for %@ : %@", (uint8_t *)v2);
}

+ (void)_placeholderForBundle:(void *)a1 client:(NSObject *)a2 withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.8(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  v5[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a2, v4, "%s: Failed to create IXPromisedTransferToPath for loctable for %@ : %@", (uint8_t *)v5);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.9()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to set localization dictionary for %@ : %@", v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.10()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to set configuration complete for %@ : %@", v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.11()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to set app extension placeholders for %@ : %@", v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.12()
{
  OUTLINED_FUNCTION_15();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = [v1 path];
  v4[0] = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v3, "%s: Failed to get URLs of items at %@ : %@", (uint8_t *)v4);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.13()
{
  OUTLINED_FUNCTION_15();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = [v1 path];
  v4[0] = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v3, "%s: Failed to create app extension placeholder for %@ : %@", (uint8_t *)v4);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.14()
{
  OUTLINED_FUNCTION_15();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = [v1 path];
  v4[0] = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v3, "%s: Failed to set loctable promise for %@ : %@", (uint8_t *)v4);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.15()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_0_4();
  __int16 v3 = v0;
  uint64_t v4 = 0;
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v1, (uint64_t)v1, "%s: Failed to create IXPromisedTransferToPath for icon resources at %@ for %@ : %@", (uint8_t *)v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.16()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to set icon resources promise for %@ : %@", v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.17()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Failed to create IXPromisedInMemoryData for icon for %@ : %@", (uint8_t *)v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.18()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to set icon promise for %@ : %@", v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.19()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to set entitlements promise for %@ : %@", v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.20()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to set placeholder attributes %@ : %@", v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.21()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to set metadata for %@ : %@", v2);
}

- (void)_initAppExtensionPlaceholderWithBundleURL:bundleName:bundleID:parentPlaceholder:client:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Unable to determine IXPlaceholder type for this app extension bundle at %@ : %@", (uint8_t *)v2);
}

- (void)_internalInitAppExtensionPlaceholderWithBundleName:(os_log_t)log bundleID:parentPlaceholder:placeholderType:client:error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[IXPlaceholder _internalInitAppExtensionPlaceholderWithBundleName:bundleID:parentPlaceholder:placeholderType:client:error:]";
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: parentPlaceholder argument was unexpectedly nil!", (uint8_t *)&v1, 0xCu);
}

- (void)_internalInitAppExtensionPlaceholderWithBundleName:(os_log_t)log bundleID:parentPlaceholder:placeholderType:client:error:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[IXPlaceholder _internalInitAppExtensionPlaceholderWithBundleName:bundleID:parentPlaceholder:placeholderType:client:error:]";
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: parentPlaceholder argument must be an app placeholder but was an app extension placeholder", (uint8_t *)&v1, 0xCu);
}

- (void)_doInitWithBundleName:bundleID:installType:placeholderType:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Bundle Name argument was nil. : %@", v2, v3, v4, v5, 2u);
}

- (void)_doInitWithBundleName:bundleID:installType:placeholderType:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Bundle ID argument was nil. : %@", v2, v3, v4, v5, 2u);
}

void __38__IXPlaceholder_iconPromiseWithError___block_invoke_213_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);
}

void __38__IXPlaceholder_iconPromiseWithError___block_invoke_213_cold_2()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = (objc_class *)OUTLINED_FUNCTION_17(v0, *MEMORY[0x1E4F143B8]);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v3, v4, "%s: Seed object %@ should have been for an owned data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);
}

- (void)setIconResourcesPromise:withInfoPlistContent:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Failed to create dictionary promise for Info.plist icon content for %@ : %@", (uint8_t *)v2);
}

- (void)setIconResourcesPromise:withInfoPlistContent:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Info.plist content dictionary contains content that cannot be contained in a property list. : %@", v2, v3, v4, v5, 2u);
}

void __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_237_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);
}

void __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_237_cold_2()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = (objc_class *)OUTLINED_FUNCTION_17(v0, *MEMORY[0x1E4F143B8]);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v3, v4, "%s: Seed object %@ should have been for IXPromisedTransferToPath but was instead for class %@ : %@", v5, v6, v7, v8, 2u);
}

- (void)setInfoPlistLocalizations:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Failed to create dictionary promise for localizations for %@ : %@", (uint8_t *)v2);
}

- (void)setInfoPlistLocalizations:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Localizations dictionary contains objects other than those expected. : %@", v2, v3, v4, v5, 2u);
}

void __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_263_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);
}

void __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_263_cold_2()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = (objc_class *)OUTLINED_FUNCTION_17(v0, *MEMORY[0x1E4F143B8]);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v3, v4, "%s: Seed object %@ should have been for an owned data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);
}

void __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_269_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);
}

void __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_269_cold_2()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = (objc_class *)OUTLINED_FUNCTION_17(v0, *MEMORY[0x1E4F143B8]);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v3, v4, "%s: Seed object %@ should have been for an owned data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);
}

- (void)setAppExtensionPlaceholderPromises:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Attempt made to set an app placeholder as an app extension placeholder: %@ : %@", (uint8_t *)v2);
}

- (void)setAppExtensionPlaceholderPromises:(_DWORD *)a3 error:.cold.2(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315906;
  OUTLINED_FUNCTION_10((uint64_t)a1, a2, (uint64_t)a3);
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v6, v4, "%s: Attempted to set app extension placeholder promise with bundle ID %@ that does not match required prefix of %@ for parent : %@", v5);
}

- (void)appExtensionPlaceholderPromisesWithError:(_DWORD *)a3 .cold.1(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315906;
  OUTLINED_FUNCTION_10((uint64_t)a1, a2, (uint64_t)a3);
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v6, v4, "%s: Failed to initialize promise class %@ with seed %@ : %@", v5);
}

- (void)appExtensionPlaceholderPromisesWithError:(_DWORD *)a3 .cold.2(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315906;
  OUTLINED_FUNCTION_10(a1, (uint64_t)a2, (uint64_t)a3);
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v6, v4, "%s: Seed object %@ should have been for a placeholder promise but was instead for class %@ : %@", v5);
}

- (void)setMetadata:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to create data promise for serialized metadata : %@", v2, v3, v4, v5, 2u);
}

- (void)setSinfData:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to create data promise for sinf data : %@", v2, v3, v4, v5, 2u);
}

- (void)setPlaceholderAttributes:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: launchProhibited = YES does not make sense as an attribute of an app extension placeholder : %@", v2, v3, v4, v5, 2u);
}

- (void)setPlaceholderAttributes:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: bundleVersion must be set in placeholder attributes for an app extension placeholder : %@", v2, v3, v4, v5, 2u);
}

- (void)setPlaceholderAttributes:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: exAppExtensionAttributes does not make sense as an attribute of an app placeholder : %@", v2, v3, v4, v5, 2u);
}

- (void)setPlaceholderAttributes:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: extensionDictionary does not make sense as an attribute of an app placeholder : %@", v2, v3, v4, v5, 2u);
}

- (void)setPlaceholderAttributes:error:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: extensionDictionary must be set in placeholder attributes for an app extension placeholder : %@", v2, v3, v4, v5, 2u);
}

- (void)setPlaceholderAttributes:error:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: extensionDictionary must have the NSExtensionPointIdentifier key set to a valid extension point identifier string : %@", v2, v3, v4, v5, 2u);
}

- (void)setPlaceholderAttributes:error:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: exAppExtensionAttributes must be set in placeholder attributes for an ExtensionKit app extension placeholder : %@", v2, v3, v4, v5, 2u);
}

- (void)setPlaceholderAttributes:error:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: exAppExtensionAttributes must have the EXExtensionPointIdentifier key set to a valid extension point identifier string : %@", v2, v3, v4, v5, 2u);
}

@end