@interface CUICatalog(IconServicesAdditions)
+ (CFURLRef)_IS_assetCatalogURLWithBundleURL:()IconServicesAdditions;
+ (__CFString)_IS_appearanceStringFromAppearance:()IconServicesAdditions;
+ (id)_IS_appearanceNameFromAppearance:()IconServicesAdditions;
+ (id)_IS_coreGlyphsBundleURL;
- (BOOL)_IS_possibleLayerStackExistsWithName:()IconServicesAdditions platform:;
- (BOOL)_IS_possibleMultisizedImageExistsWithName:()IconServicesAdditions platform:;
- (id)_IS_layerStackWithName:()IconServicesAdditions scale:layoutDirection:softCheck:platform:;
- (id)_IS_multisizedImageWithName:()IconServicesAdditions size:scale:layoutDirection:platform:appearance:;
- (id)idiomsForPlatform:()IconServicesAdditions;
- (uint64_t)_IS_layerStackWithName:()IconServicesAdditions scale:layoutDirection:platform:;
- (uint64_t)_IS_multisizedImageWithName:()IconServicesAdditions size:scale:layoutDirection:platform:;
- (uint64_t)nativeIdiom;
- (uint64_t)subtypeForPlatform:()IconServicesAdditions;
@end

@implementation CUICatalog(IconServicesAdditions)

+ (id)_IS_coreGlyphsBundleURL
{
  if (_IS_coreGlyphsBundleURL_onceToken != -1) {
    dispatch_once(&_IS_coreGlyphsBundleURL_onceToken, &__block_literal_global_37);
  }
  v0 = (void *)_IS_coreGlyphsBundleURL_url;
  return v0;
}

+ (CFURLRef)_IS_assetCatalogURLWithBundleURL:()IconServicesAdditions
{
  id v3 = a3;
  if (v3 && (Unique = (__CFBundle *)_CFBundleCreateUnique()) != 0)
  {
    v5 = Unique;
    CFURLRef v6 = CFBundleCopyResourceURL(Unique, @"Assets", @"car", 0);
    CFRelease(v5);
  }
  else
  {
    CFURLRef v6 = 0;
  }

  return v6;
}

+ (__CFString)_IS_appearanceStringFromAppearance:()IconServicesAdditions
{
  if (a3 > 1)
  {
    if (a3 == 2) {
      return @"ISAppearanceTintable";
    }
    if (a3 == 0xFFFF) {
      return @"UIAppearanceAny";
    }
  }
  else
  {
    if (!a3) {
      return @"UIAppearanceLight";
    }
    if (a3 == 1) {
      return @"UIAppearanceDark";
    }
  }
  v4 = _ISDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    +[CUICatalog(IconServicesAdditions) _IS_appearanceStringFromAppearance:](v4);
  }

  return 0;
}

+ (id)_IS_appearanceNameFromAppearance:()IconServicesAdditions
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    v10[0] = @"ISAppearanceTintable";
    v10[1] = @"UIAppearanceLight";
    id v3 = [MEMORY[0x1E4F1CA98] null];
    v10[2] = v3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = v10;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v11[0] = @"UIAppearanceDark";
    v11[1] = @"UIAppearanceLight";
    id v3 = [MEMORY[0x1E4F1CA98] null];
    v11[2] = v3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = v11;
LABEL_5:
    uint64_t v6 = 3;
    goto LABEL_7;
  }
  v9[0] = @"UIAppearanceLight";
  id v3 = [MEMORY[0x1E4F1CA98] null];
  v9[1] = v3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  v5 = v9;
  uint64_t v6 = 2;
LABEL_7:
  v7 = [v4 arrayWithObjects:v5 count:v6];

  return v7;
}

- (uint64_t)_IS_multisizedImageWithName:()IconServicesAdditions size:scale:layoutDirection:platform:
{
  return objc_msgSend(a1, "_IS_multisizedImageWithName:size:scale:layoutDirection:platform:appearance:", a3, a4, a5, 0);
}

- (id)_IS_multisizedImageWithName:()IconServicesAdditions size:scale:layoutDirection:platform:appearance:
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v37 = a6;
  uint64_t v16 = [a1 subtypeForPlatform:a8];
  v36 = a1;
  v17 = [a1 idiomsForPlatform:a8];
  v33 = objc_msgSend(MEMORY[0x1E4F5E048], "_IS_appearanceNameFromAppearance:", a9);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v17;
  uint64_t v32 = [obj countByEnumeratingWithState:&v42 objects:v65 count:16];
  v18 = 0;
  if (v32)
  {
    uint64_t v31 = *(void *)v43;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v43 != v31) {
        objc_enumerationMutation(obj);
      }
      if (v18) {
        break;
      }
      uint64_t v20 = [*(id *)(*((void *)&v42 + 1) + 8 * v19) integerValue];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v35 = v33;
      uint64_t v21 = [v35 countByEnumeratingWithState:&v38 objects:v64 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v34 = v19;
        uint64_t v23 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v39 != v23) {
              objc_enumerationMutation(v35);
            }
            id v25 = *(id *)(*((void *)&v38 + 1) + 8 * i);
            id v26 = [MEMORY[0x1E4F1CA98] null];

            if (v25 == v26)
            {

              id v25 = 0;
            }
            v18 = objc_msgSend(v36, "iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:", v37, v20, v16, 1, a7, 0, a4, a2, a3, 0, v25);
            v27 = _ISDefaultLog();
            v28 = v27;
            if (v18)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138414338;
                id v47 = v37;
                __int16 v48 = 2048;
                double v49 = a4;
                __int16 v50 = 1024;
                int v51 = v20;
                __int16 v52 = 1024;
                int v53 = v16;
                __int16 v54 = 1024;
                int v55 = 1;
                __int16 v56 = 1024;
                int v57 = a7;
                __int16 v58 = 2048;
                double v59 = a2;
                __int16 v60 = 2048;
                double v61 = a3;
                __int16 v62 = 2112;
                id v63 = v25;
                _os_log_debug_impl(&dword_1AE771000, v28, OS_LOG_TYPE_DEBUG, "Found catalog image with query info name:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d desiredSize:%f,%f appearanceName:%@]", buf, 0x4Cu);
              }

              goto LABEL_23;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138414338;
              id v47 = v37;
              __int16 v48 = 2048;
              double v49 = a4;
              __int16 v50 = 1024;
              int v51 = v20;
              __int16 v52 = 1024;
              int v53 = v16;
              __int16 v54 = 1024;
              int v55 = 1;
              __int16 v56 = 1024;
              int v57 = a7;
              __int16 v58 = 2048;
              double v59 = a2;
              __int16 v60 = 2048;
              double v61 = a3;
              __int16 v62 = 2112;
              id v63 = v25;
              _os_log_impl(&dword_1AE771000, v28, OS_LOG_TYPE_DEFAULT, "Failed to find named image for name:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d desiredSize:%f,%f appearanceName:%@]", buf, 0x4Cu);
            }
          }
          uint64_t v22 = [v35 countByEnumeratingWithState:&v38 objects:v64 count:16];
          if (v22) {
            continue;
          }
          break;
        }
        v18 = 0;
LABEL_23:
        uint64_t v19 = v34;
      }
      else
      {
        v18 = 0;
      }

      if (++v19 == v32)
      {
        uint64_t v32 = [obj countByEnumeratingWithState:&v42 objects:v65 count:16];
        if (v32) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v18;
}

- (uint64_t)_IS_layerStackWithName:()IconServicesAdditions scale:layoutDirection:platform:
{
  return objc_msgSend(a1, "_IS_layerStackWithName:scale:layoutDirection:softCheck:platform:", a3, a4, 0, a5);
}

- (id)_IS_layerStackWithName:()IconServicesAdditions scale:layoutDirection:softCheck:platform:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  uint64_t v13 = [a1 subtypeForPlatform:a7];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [a1 idiomsForPlatform:a7];
  uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v26 = *(void *)v28;
    int v24 = v13;
    if (a6) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v13;
    }
LABEL_5:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v28 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = [*(id *)(*((void *)&v27 + 1) + 8 * v17) integerValue];
      uint64_t v19 = a6 ? 0 : v18;
      uint64_t v20 = [a1 namedLookupWithName:v12 scaleFactor:v19 deviceIdiom:v16 deviceSubtype:1 displayGamut:a5 layoutDirection:0 sizeClassHorizontal:a2 sizeClassVertical:0];
      if (v20)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      uint64_t v21 = a6;
      uint64_t v22 = _ISDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413570;
        id v32 = v12;
        __int16 v33 = 2048;
        double v34 = a2;
        __int16 v35 = 1024;
        int v36 = v19;
        __int16 v37 = 1024;
        int v38 = v24;
        __int16 v39 = 1024;
        int v40 = 1;
        __int16 v41 = 1024;
        int v42 = a5;
        _os_log_impl(&dword_1AE771000, v22, OS_LOG_TYPE_DEFAULT, "Failed to find layer stack for name:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d]", buf, 0x2Eu);
      }

      ++v17;
      a6 = v21;
      if (v15 == v17)
      {
        uint64_t v15 = [obj countByEnumeratingWithState:&v27 objects:v43 count:16];
        if (v15) {
          goto LABEL_5;
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    uint64_t v20 = 0;
  }

  return v20;
}

- (BOOL)_IS_possibleLayerStackExistsWithName:()IconServicesAdditions platform:
{
  v4 = objc_msgSend(a1, "_IS_layerStackWithName:scale:layoutDirection:softCheck:platform:", a3, 5, 1, a4, 0.0);
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_IS_possibleMultisizedImageExistsWithName:()IconServicesAdditions platform:
{
  id v6 = a3;
  if ([a1 imageExistsWithName:v6])
  {
    v7 = objc_msgSend(a1, "_IS_multisizedImageWithName:size:scale:layoutDirection:platform:", v6, 4, a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), 0.0);
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (uint64_t)nativeIdiom
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = +[ISDeviceInfo sharedInstance];
  int v1 = [v0 deviceClass];

  int v2 = v1 - 1;
  if (v1 - 1) < 0xB && ((0x52Fu >> v2)) {
    return qword_1AE7C4F20[v2];
  }
  id v3 = _ISDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v1;
    _os_log_impl(&dword_1AE771000, v3, OS_LOG_TYPE_DEFAULT, "Unknown device class: %d", (uint8_t *)v5, 8u);
  }

  return 0;
}

- (id)idiomsForPlatform:()IconServicesAdditions
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __55__CUICatalog_IconServicesAdditions__idiomsForPlatform___block_invoke;
  v9[3] = &unk_1E5F095B8;
  v9[4] = a1;
  v4 = (void (**)(void, void))MEMORY[0x1B3E71130](v9);
  BOOL v5 = v4[2](v4, a3);
  if (![v5 count])
  {
    uint64_t v6 = +[ISPlatformInfo sharedInstance];
    v7 = v4[2](v4, [v6 nativePlatform]);

    if ([v7 count])
    {
      BOOL v5 = v7;
    }
    else
    {

      BOOL v5 = &unk_1F064B0F8;
    }
  }

  return v5;
}

- (uint64_t)subtypeForPlatform:()IconServicesAdditions
{
  v4 = +[ISDeviceInfo sharedInstance];
  uint64_t v5 = [v4 deviceSubtype];

  uint64_t v6 = +[ISPlatformInfo sharedInstance];
  uint64_t v7 = [v6 nativePlatform];

  if (v7 == 1)
  {
    *((void *)&v9 + 1) = a3;
    *(void *)&long long v9 = a3 - 4;
    unint64_t v8 = v9 >> 2;
    if (v8 <= 7 && ((0x8Bu >> v8) & 1) != 0) {
      return qword_1AE7C4F78[v8];
    }
  }
  return v5;
}

+ (void)_IS_appearanceStringFromAppearance:()IconServicesAdditions .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_1AE771000, log, OS_LOG_TYPE_FAULT, "Unknown appearance", v1, 2u);
}

@end