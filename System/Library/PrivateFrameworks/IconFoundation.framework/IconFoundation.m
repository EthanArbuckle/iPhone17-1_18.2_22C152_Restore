void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t CopyImageBlockSetCallback(void *a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = a1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      CopyImageBlockSetCallback_cold_1();
    }
    uint64_t v5 = objc_msgSend(v4, "__IS_copyCGImageBlockSetWithProvider:", a2);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [a1 blockSet];
      if (v5) {
        CGImageBlockSetRetain();
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

void ReleaseInfoCallback(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      ReleaseInfoCallback_cold_1();
    }
  }
}

void __CGImageProviderAuxInfo_block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1DD78];
  v3[0] = *MEMORY[0x1E4F1CFD0];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)CGImageProviderAuxInfo_auxiliaryInfo;
  CGImageProviderAuxInfo_auxiliaryInfo = v0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id IFTopLevelAppBundlePlistKeys()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v1 = +[IFPlistParser topLevelAppBundleIconKeys];
  uint64_t v2 = [v0 setWithArray:v1];

  return v2;
}

id IFPossibleResourceFilenames(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v5 = [[IFPlistParser alloc] initWithInfoDictionary:v4];
    v6 = [(IFPlistParser *)v5 catalogAssetNamesReturningPlistExcerpt:0];

    if (v6)
    {
      v7 = [MEMORY[0x1E4F1CAD0] setWithObject:@"Assets.car"];
    }
    else
    {
      uint64_t v9 = [(IFPlistParser *)v5 looseFilesNamesReturningPlistExcerpt:0];
      if (v9)
      {
        v10 = [[IFResourceNames alloc] initWithRootNames:v9 variants:&unk_1F37BF7D0];
        v11 = [(IFResourceNames *)v10 extrapolateFullNamesForIOS];
        v12 = [(IFResourceNames *)v10 extrapolateFullNamesForMacOS];
        v7 = [v12 setByAddingObjectsFromSet:v11];
      }
      else
      {
        v7 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = [NSString stringWithFormat:@"Invalid infoDictionary"];
    logAndSetError(v5, -2, a2);
    v7 = 0;
  }

  return v7;
}

void logAndSetError(void *a1, uint64_t a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  v6 = IFDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    logAndSetError_cold_1((uint64_t)v5, a2, v6);
  }

  if (a3)
  {
    v7 = [NSString stringWithFormat:@"%@", v5, *MEMORY[0x1E4F28568]];
    v10[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.iconServices.assetCapture.error" code:a2 userInfo:v8];
  }
}

uint64_t _captureCatalogAssets(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  v11 = [a2 catalogAssetNamesReturningPlistExcerpt:a4];
  if (!v11) {
    goto LABEL_7;
  }
  v12 = [v9 assetCatalogURL];

  if (!v12)
  {
    v24 = NSString;
    v25 = [v9 bundleURL];
    v26 = [v24 stringWithFormat:@"Bundle '%@' declared catalog asset but couldn't find catalog", v25];
    logAndSetError(v26, -4, a5);

LABEL_7:
    uint64_t v18 = 0;
    goto LABEL_8;
  }
  v13 = [v9 assetCatalogURL];
  v14 = [v13 lastPathComponent];
  v15 = [v10 URLByAppendingPathComponent:v14];

  v16 = [v9 assetCatalogURL];
  v17 = [v11 allObjects];
  id v28 = 0;
  uint64_t v18 = CUIGeneratePlaceholderAssetCatalog(v16, v15, v17, (uint64_t *)&v28);
  id v19 = v28;

  if ((v18 & 1) == 0)
  {
    v20 = NSString;
    v21 = [v9 assetCatalogURL];
    v22 = [v11 allObjects];
    v23 = [v20 stringWithFormat:@"Failed to thin asset catalog %@ to %@ items only. Error: %@", v21, v22, v19];
    logAndSetError(v23, -3, a5);
  }
LABEL_8:

  return v18;
}

uint64_t _captureLooseFileAssets(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v46 = a3;
  id v10 = [a2 looseFilesNamesReturningPlistExcerpt:a4];
  if (v10)
  {
    v11 = [[IFResourceNames alloc] initWithRootNames:v10 variants:&unk_1F37BF7E8];
    v12 = [(IFResourceNames *)v11 extrapolateFullNamesForIOS];
    v13 = [(IFResourceNames *)v11 extrapolateFullNamesForMacOS];
    v14 = [v13 setByAddingObjectsFromSet:v12];
    v15 = [v14 allObjects];

    v16 = [v9 URLsForResources:v15];
    v17 = v16;
    if (v16 && [v16 count])
    {
      v40 = v15;
      v41 = v13;
      v38 = a5;
      v39 = v17;
      v42 = v12;
      v43 = v11;
      v44 = v9;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id obj = v17;
      uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        int v20 = 0;
        uint64_t v21 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v49 != v21) {
              objc_enumerationMutation(obj);
            }
            v23 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            v24 = [v23 lastPathComponent];
            v25 = [v46 URLByAppendingPathComponent:v24];

            v26 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v47 = 0;
            char v27 = [v26 copyItemAtURL:v23 toURL:v25 error:&v47];
            id v28 = v47;

            if ((v27 & 1) == 0)
            {
              v29 = IFDefaultLog();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v53 = v23;
                __int16 v54 = 2112;
                v55 = v25;
                __int16 v56 = 2112;
                id v57 = v28;
                _os_log_impl(&dword_1DC6CA000, v29, OS_LOG_TYPE_INFO, "Failed to copy file %@ to %@. Error: %@", buf, 0x20u);
              }

              ++v20;
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
        }
        while (v19);
      }
      else
      {
        int v20 = 0;
      }

      if ([obj count] == v20)
      {
        v34 = NSString;
        id v9 = v44;
        v35 = [v44 bundleURL];
        v15 = v40;
        v36 = [v34 stringWithFormat:@"Failed to retrieve file assets %@ from %@", v40, v35];
        logAndSetError(v36, -5, v38);

        uint64_t v33 = 0;
        v11 = v43;
        v13 = v41;
        v12 = v42;
      }
      else
      {
        uint64_t v33 = 1;
        id v9 = v44;
        v12 = v42;
        v11 = v43;
        v15 = v40;
        v13 = v41;
      }
      v17 = v39;
    }
    else
    {
      v30 = NSString;
      v31 = [v9 bundleURL];
      v32 = [v30 stringWithFormat:@"File assets %@ were declared but we were unable to find them in %@", v15, v31];
      logAndSetError(v32, -4, a5);

      uint64_t v33 = 0;
    }
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

uint64_t IFCaptureIconContent(void *a1, void *a2, void *a3, void *a4, NSObject **a5)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  if (v9)
  {
    if (v10)
    {
      v12 = IFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v9;
        _os_log_impl(&dword_1DC6CA000, v12, OS_LOG_TYPE_INFO, "Capturing icon content for %@", buf, 0xCu);
      }

      v13 = [(IFBundle *)[IFVariantAgnosticBundle alloc] initWithURL:v9];
      v14 = v13;
      if (!v13 || ![(IFBundle *)v13 bundle])
      {
        v16 = [NSString stringWithFormat:@"Failed to create bundle at %@", v9];
        logAndSetError(v16, -1, a5);
        uint64_t v23 = 0;
LABEL_46:

        goto LABEL_47;
      }
      v15 = [(IFVariantAgnosticBundle *)v14 infoDictionary];
      v16 = v15;
      if (!v15 || ![v15 count])
      {
        uint64_t v19 = [NSString stringWithFormat:@"Failed to read Info.plist at %@", v9];
        logAndSetError(v19, -1, a5);
        uint64_t v23 = 0;
LABEL_45:

        goto LABEL_46;
      }
      v17 = [IFPlistParser alloc];
      uint64_t v18 = [(IFVariantAgnosticBundle *)v14 infoDictionary];
      uint64_t v19 = [(IFPlistParser *)v17 initWithInfoDictionary:v18];

      if (v11)
      {
        int v20 = [(IFPlistParser *)v19 iconContentForAlternateIconName:v11 variants:&unk_1F37BF800];
        uint64_t v21 = [[IFPlistParser alloc] initWithInfoDictionary:v20];

        uint64_t v19 = v21;
      }
      if ([(IFPlistParser *)v19 hasGraphicIconReturningPlistExcerpt:a4])
      {
        v22 = IFDefaultLog();
        uint64_t v23 = 1;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v9;
          _os_log_impl(&dword_1DC6CA000, v22, OS_LOG_TYPE_INFO, "Graphic icon configuration set for %@", buf, 0xCu);
        }
        goto LABEL_44;
      }
      id v39 = 0;
      char v27 = _captureCatalogAssets(v14, v19, v10, (uint64_t)a4, &v39);
      id v28 = v39;
      v29 = v28;
      if (v27)
      {
        v22 = 0;
        uint64_t v23 = 1;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
      id v37 = v28;
      if ([v28 code] == -4)
      {
        if (a4)
        {
          v22 = 0;
          *a4 = 0;
LABEL_27:
          id v38 = 0;
          char v30 = _captureLooseFileAssets(v14, v19, v10, (uint64_t)a4, &v38);
          v31 = v38;
          if (v30)
          {
            uint64_t v23 = 1;
            v29 = v37;
          }
          else
          {
            v32 = v31;
            v36 = v31;
            if ([v31 code] == -4)
            {
              v29 = v37;
              if (a4) {
                *a4 = 0;
              }
            }
            else
            {
              uint64_t v33 = v32;
              v29 = v37;
              if (v33)
              {
                if (v22) {
                  uint64_t v33 = v22;
                }
                v34 = v33;

                v22 = v34;
              }
            }
            if (v22)
            {
              if (a5)
              {
                v22 = v22;
                uint64_t v23 = 0;
                *a5 = v22;
              }
              else
              {
                uint64_t v23 = 0;
              }
            }
            else
            {
              uint64_t v23 = 1;
            }
            v31 = v36;
          }

          goto LABEL_43;
        }
      }
      else if (v29)
      {
        v22 = v29;
        goto LABEL_27;
      }
      v22 = 0;
      goto LABEL_27;
    }
    v24 = NSString;
    v25 = @"Invalid destination url";
  }
  else
  {
    v24 = NSString;
    v25 = @"Invalid bundle url";
  }
  v26 = [v24 stringWithFormat:v25];
  logAndSetError(v26, -2, a5);

  uint64_t v23 = 0;
LABEL_47:

  return v23;
}

id IFDefaultLog()
{
  if (IFDefaultLog_onceToken != -1) {
    dispatch_once(&IFDefaultLog_onceToken, &__block_literal_global_8);
  }
  uint64_t v0 = (void *)IFDefaultLog_log;

  return v0;
}

uint64_t __IFDefaultLog_block_invoke()
{
  IFDefaultLog_log = (uint64_t)os_log_create("com.apple.iconservices", "foundation");

  return MEMORY[0x1F41817F8]();
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t CreateARGBBitmapContext()
{
  return 0;
}

uint64_t _LookupStructuredThemeProvider()
{
  return 0;
}

uint64_t CUIConstantToMapID()
{
  return 0;
}

uint64_t CUICreateEffectPresetWithStyle()
{
  return 0;
}

uint64_t CUICreateRenditionKeyWithShapeEffectState()
{
  return 0;
}

uint64_t _CUIDebugUseSimplifiedTextEffects()
{
  return 0;
}

uint64_t _CUIDebugShowGraphicVariantMetrics()
{
  return 0;
}

double _CUIEffectiveScaleForContext()
{
  return 0.0;
}

uint64_t __CUISubtypeFromIndex(unint64_t a1, unsigned int a2)
{
  if (a1 == -1)
  {
    if (a2 >= 0x20) {
      return 0xFFFFFFFFLL;
    }
    else {
      return dword_1DC701FE0[a2];
    }
  }
  else if (a2)
  {
    switch(a1)
    {
      case 0uLL:
        uint64_t result = 1864;
        switch(a2)
        {
          case 0x1Au:
            return 1964;
          case 0x1Bu:
            return 2234;
          case 0x1Cu:
          case 0x1Du:
          case 0x1Eu:
            goto LABEL_25;
          case 0x1Fu:
            return 1665;
          case 0x20u:
            return result;
          default:
            if (a2 != 1) {
              goto LABEL_25;
            }
            return result;
        }
      case 3uLL:
        signed int v4 = a2 - 5;
        if (a2 - 5 >= 3) {
          goto LABEL_25;
        }
        id v5 = (unsigned int *)&unk_1DC702060;
        goto LABEL_16;
      case 4uLL:
        switch(a2)
        {
          case 0x17u:
            return 430;
          case 0x18u:
            return 484;
          case 0x19u:
          case 0x1Au:
          case 0x1Bu:
            goto LABEL_25;
          case 0x1Cu:
            return 502;
          case 0x1Du:
            return 446;
          case 0x1Eu:
            return 496;
          default:
            uint64_t result = 320;
            switch(a2)
            {
              case 8u:
                return result;
              case 9u:
                return 384;
              case 0xDu:
                return 340;
              case 0xEu:
                return 390;
              default:
                goto LABEL_25;
            }
        }
      case 5uLL:
        if (a2 != 1) {
          goto LABEL_25;
        }
        return 3648;
      default:
        if (a1 > 2 || a2 >= 0x1F || (signed int v4 = a2 - 1, ((0x313FFEFFu >> (a2 - 1)) & 1) == 0)) {
LABEL_25:
        }
          __CUISubtypeFromIndex_cold_1(a1);
        id v5 = (unsigned int *)&unk_1DC70206C;
LABEL_16:
        uint64_t result = v5[v4];
        break;
    }
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t CUIValidateIdiomSubtypes(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  switch(a1)
  {
    case 0:
    case 4:
    case 6:
    case 7:
      goto LABEL_2;
    case 1:
    case 2:
      uint64_t result = 1;
      if (v2 > 2419)
      {
        if (v2 <= 2731)
        {
          if (v2 > 2555)
          {
            if (v2 == 2556 || v2 == 2622 || v2 == 2688) {
              return result;
            }
          }
          else if (v2 == 2420 || v2 == 2436 || v2 == 2532)
          {
            return result;
          }
        }
        else if (v2 > 2867)
        {
          if (v2 == 2868 || v2 == 3024 || v2 == 32401) {
            return result;
          }
        }
        else
        {
          BOOL v6 = (unint64_t)(v2 - 2752) > 0x2C || ((1 << (v2 + 64)) & 0x100004000001) == 0;
          if (!v6 || v2 == 2732) {
            return result;
          }
        }
      }
      else if (v2 > 2159)
      {
        BOOL v7 = (unint64_t)(v2 - 2224) > 0x2A || ((1 << (v2 + 80)) & 0x40000000401) == 0;
        if (!v7
          || (unint64_t)(v2 - 2340) <= 0x30 && ((1 << (v2 - 36)) & 0x1000000100001) != 0
          || v2 == 2160)
        {
          return result;
        }
      }
      else if (v2 > 1664)
      {
        if (v2 == 1665 || v2 == 1792 || v2 == 1964) {
          return result;
        }
      }
      else if ((unint64_t)(v2 - 568) < 3 || v2 == 163)
      {
        return result;
      }
      goto LABEL_2;
    case 3:
      uint64_t result = 1;
      if (v2 == 720 || v2 == 1088 || v2 == 3840) {
        return result;
      }
      goto LABEL_2;
    case 5:
      uint64_t result = 1;
      if (v2 > 483)
      {
        if ((unint64_t)(v2 - 484) <= 0x12 && ((1 << (v2 + 28)) & 0x41001) != 0) {
          return result;
        }
      }
      else
      {
        BOOL v5 = (unint64_t)(v2 - 384) > 0x3E || ((1 << (v2 + 0x80)) & 0x4000400000000041) == 0;
        if (!v5 || v2 == 320 || v2 == 340) {
          return result;
        }
      }
LABEL_2:
      uint64_t v3 = 0;
      *a2 = 0;
LABEL_3:
      if (v3 == v2) {
        return 1;
      }
      _CUILog();
      return 0;
    case 8:
      if (v2 != 3648) {
        goto LABEL_2;
      }
      uint64_t v3 = 3648;
      goto LABEL_3;
    default:
      return 1;
  }
}

uint64_t CUIParseDeploymentTarget(char *a1, int a2)
{
  signed int v4 = *(const char **)(MEMORY[0x1E4F5E098] + 16);
  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x1E4F5E098];
    while (strcasecmp(a1, v4))
    {
      signed int v4 = (const char *)v5[5];
      v5 += 3;
      if (!v4) {
        goto LABEL_5;
      }
    }
    return *(unsigned int *)v5;
  }
  else
  {
LABEL_5:
    BOOL v6 = (void *)[[NSString alloc] initWithUTF8String:a1];
    BOOL v7 = (void *)[v6 componentsSeparatedByString:@"."];
    uint64_t v8 = [v7 count];
    if (v8)
    {
      uint64_t v9 = v8;
      unsigned int v10 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "intValue");
      if (v9 == 1) {
        int v11 = 0;
      }
      else {
        int v11 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "intValue");
      }
    }
    else
    {
      int v11 = 0;
      unsigned int v10 = 0x7FFFFFFF;
    }

    if (a2 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = a2;
    }
    switch(v13)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 7:
        if ((int)v10 < 10) {
          goto LABEL_53;
        }
        if (v10 == 10) {
          return 1;
        }
        if (v10 < 0xC) {
          return 2;
        }
        if (v10 == 12) {
          goto LABEL_35;
        }
        if (v10 < 0xE) {
          return 5;
        }
        if (v10 == 14) {
          return 6;
        }
        if (v10 < 0x10) {
          return 7;
        }
        if (v10 == 16) {
          return 8;
        }
        if (v10 <= 0x11) {
          goto LABEL_50;
        }
        if (v10 == 18) {
          goto LABEL_40;
        }
        goto LABEL_52;
      case 5:
        if ((int)v10 < 3) {
          goto LABEL_53;
        }
        if (v10 == 3) {
          return 1;
        }
        if (v10 < 5) {
          return 2;
        }
        if (v10 == 5)
        {
LABEL_35:
          BOOL v14 = v11 < 2;
          unsigned int v15 = 3;
          goto LABEL_36;
        }
        if (v10 < 7) {
          return 5;
        }
        if (v10 == 7) {
          return 6;
        }
        if (v10 < 9) {
          return 7;
        }
        if (v10 == 9) {
          return 8;
        }
        if (v10 <= 0xA)
        {
LABEL_50:
          BOOL v14 = v11 < 4;
          goto LABEL_33;
        }
        if (v10 == 11) {
          goto LABEL_40;
        }
        goto LABEL_52;
      case 8:
        if ((int)v10 > 1)
        {
          if (v10 == 2)
          {
LABEL_40:
            uint64_t result = 11;
          }
          else
          {
LABEL_52:
            fprintf((FILE *)*MEMORY[0x1E4F143C8], "assuming --deployment-target %s == --deployment-target any\n", a1);
LABEL_53:
            uint64_t result = 0;
          }
        }
        else
        {
          BOOL v14 = v11 < 1;
LABEL_33:
          unsigned int v15 = 9;
LABEL_36:
          if (v14) {
            uint64_t result = v15;
          }
          else {
            uint64_t result = v15 + 1;
          }
        }
        break;
      default:
        goto LABEL_52;
    }
  }
  return result;
}

uint64_t CUIWatchSubTypeFallbackOrder(uint64_t result, void *a2)
{
  if (result > 445)
  {
    if (result > 495)
    {
      if (result != 496 && result != 502) {
        return result;
      }
      objc_msgSend(a2, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", 484));
    }
    else
    {
      if (result == 446)
      {
        uint64_t v3 = 430;
        goto LABEL_18;
      }
      if (result != 484) {
        return result;
      }
    }
    uint64_t v3 = 390;
LABEL_18:
    objc_msgSend(a2, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", v3));
LABEL_19:
    objc_msgSend(a2, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", 340));
    goto LABEL_20;
  }
  if (result > 389)
  {
    if (result != 390 && result != 430) {
      return result;
    }
    goto LABEL_19;
  }
  if (result != 340)
  {
    if (result != 384) {
      return result;
    }
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(a2, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", 384));
LABEL_21:
  uint64_t v4 = [NSNumber numberWithInteger:320];

  return [a2 addObject:v4];
}

__CFString *OUTLINED_FUNCTION_0_2(uint64_t a1, uint64_t a2)
{
  return CUIPlatformNameForPlatform(a2);
}

__CFString *OUTLINED_FUNCTION_1_1(uint64_t a1, uint64_t a2)
{
  return CUIPlatformNameForPlatform(a2);
}

BOOL __copyBlock(uint64_t a1, uint64_t a2, const char *a3)
{
  unsigned int NamedBlock = BOMStorageGetNamedBlock(a1, a3);
  if (!NamedBlock) {
    return 1;
  }
  unsigned int v7 = NamedBlock;
  uint64_t v8 = BOMStorageNewNamedBlock(a2, a3);
  size_t v9 = BOMStorageSizeOfBlock(a1, v7);
  unsigned int v10 = malloc_type_malloc(v9, 0xD26F2467uLL);
  if (BOMStorageCopyFromBlock(a1, v7, v10))
  {
    free(v10);
    return 0;
  }
  int v16 = BOMStorageCopyToBlock(a2, v8, v10, v9, v11, v12, v13, v14);
  free(v10);
  if (v16) {
    return 0;
  }
  return BOMStorageCommit(a2) == 0;
}

uint64_t __copyTree(uint64_t a1, uint64_t a2, const char *a3, int a4)
{
  uint64_t v7 = BOMTreeOpenWithName(a1, a3, 0);
  if (!v7) {
    return 1;
  }
  uint64_t v8 = v7;
  if (BOMTreePageSize(v7) <= 0x400) {
    a4 = BOMTreePageSize(v8);
  }
  char v9 = BOMTreeUsesNumericKeys(v8);
  unsigned int v10 = BOMTreeNewWithOptions(a2, 0, a3, a4, v9);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = BOMTreeIteratorNew(v8, 0, 0, 0);
  if (!v12) {
    return 0;
  }
  for (uint64_t i = v12;
        !BOMTreeIteratorIsAtEnd((uint64_t)i, v13, v14, v15, v16, v17, v18, v19);
        BOMTreeIteratorNext((uint64_t)i, v53, v54, v55, v56, v57, v58, v59))
  {
    id v28 = (void *)BOMTreeIteratorKey((uint64_t)i, v21, v22, v23, v24, v25, v26, v27);
    size_t v36 = BOMTreeIteratorKeySize((uint64_t)i, v29, v30, v31, v32, v33, v34, v35);
    v44 = (const void *)BOMTreeIteratorValue((uint64_t)i, v37, v38, v39, v40, v41, v42, v43);
    size_t v52 = BOMTreeIteratorValueSize((uint64_t)i, v45, v46, v47, v48, v49, v50, v51);
    BOMTreeSetValue(v11, v28, v36, v44, v52);
  }
  BOOL v60 = BOMStorageCommit(a2) == 0;
  BOMTreeIteratorFree(i);
  BOMTreeFree(v11);
  return v60;
}

uint64_t __commonAssetStoragetHandler()
{
  return _CUILog();
}

unsigned __int16 *CUIFillRenditionKeyForCARKeyArray(unsigned __int16 *result, uint64_t a2, uint64_t a3)
{
  if (!result || !a2) {
    CUIFillRenditionKeyForCARKeyArray_cold_1();
  }
  unsigned int v5 = *(_DWORD *)(a3 + 8);
  if (v5)
  {
    BOOL v6 = result;
    int v7 = 0;
    do
    {
      uint64_t result = CUIRenditionKeySetValueForAttribute(v6, *(unsigned __int16 *)(a3 + 4 * (unsigned __int16)v7 + 12), *(unsigned __int16 *)(a2 + 2 * (unsigned __int16)v7), (unsigned __int16)(v5 + 1));
      ++v7;
      unsigned int v5 = *(_DWORD *)(a3 + 8);
    }
    while (v5 > (unsigned __int16)v7);
  }
  return result;
}

unsigned __int16 *CUIRenditionKeySetValueForAttribute(unsigned __int16 *result, int a2, int a3, unsigned int a4)
{
  if (result)
  {
    if (!a4) {
      CUIRenditionKeySetValueForAttribute_cold_1();
    }
    int v4 = *result;
    if (!(result[1] | v4)) {
      goto LABEL_15;
    }
    LODWORD(v5) = 0;
    BOOL v6 = result + 3;
    while (v4 != a2)
    {
      LODWORD(v5) = v5 + 1;
      int v7 = *v6;
      int v4 = *(v6 - 1);
      v6 += 2;
      if (v7) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = v4 == 0;
      }
      if (v8) {
        goto LABEL_15;
      }
    }
    if ((v5 & 0x80000000) != 0)
    {
LABEL_15:
      if (!a3) {
        return result;
      }
      unsigned __int16 v9 = 0;
      if (result[1]) {
        goto LABEL_18;
      }
      while (result[2 * v9])
      {
        do
LABEL_18:
          ++v9;
        while (result[2 * v9 + 1]);
      }
      if ((int)(a4 - 1) <= v9) {
        CUIRenditionKeySetValueForAttribute_cold_2();
      }
      unsigned int v10 = &result[2 * v9];
      unsigned __int16 *v10 = a2;
      v10[1] = a3;
      unint64_t v5 = v9 + 1;
      result[2 * v5] = 0;
      LOWORD(a3) = 0;
      goto LABEL_22;
    }
    if (a3)
    {
      unint64_t v5 = v5;
LABEL_22:
      result[2 * v5 + 1] = a3;
      return result;
    }
    unsigned __int16 v11 = 0;
    if (result[1]) {
      goto LABEL_26;
    }
    while (1)
    {
      unint64_t v12 = v11;
      if (!result[2 * v11]) {
        break;
      }
      do
LABEL_26:
        ++v11;
      while (result[2 * v11 + 1]);
    }
    if (a4 <= v11) {
      CUIRenditionKeySetValueForAttribute_cold_3();
    }
    if (v11 > (unsigned __int16)v5)
    {
      unint64_t v5 = (unsigned __int16)v5;
      uint64_t v13 = &result[2 * (unsigned __int16)v5 + 2];
      do
      {
        ++v5;
        *((_DWORD *)v13 - 1) = *(_DWORD *)v13;
        v13 += 2;
      }
      while (v5 < v12);
    }
  }
  return result;
}

const char *CUISystemThemeRenditionKeyFormat()
{
  return "tmfk";
}

const char *CUIDefaultThemeRenditionKeyFormat(int a1, unsigned int a2)
{
  switch(a1)
  {
    case 4:
      return "tmfk";
    case 2:
      if (a2 >= 6)
      {
        if (a2 >= 0xB)
        {
          if (a2 == 11)
          {
            return "tmfk";
          }
          else if (a2 >= 0xD)
          {
            if (a2 == 13)
            {
              return "tmfk";
            }
            else if (a2 >= 0xF)
            {
              if (a2 == 15)
              {
                return "tmfk";
              }
              else if (a2 >= 0x11)
              {
                return "tmfk";
              }
              else
              {
                return "tmfk";
              }
            }
            else
            {
              return "tmfk";
            }
          }
          else
          {
            return "tmfk";
          }
        }
        else
        {
          return "tmfk";
        }
      }
      else
      {
        return "tmfk";
      }
    case 1:
      uint64_t v2 = "tmfk";
      uint64_t v3 = "tmfk";
      if (a2 < 0xF) {
        uint64_t v3 = "tmfk";
      }
      if (a2 != 13) {
        uint64_t v2 = v3;
      }
      if (a2 >= 0xD) {
        return v2;
      }
      else {
        return "tmfk";
      }
    default:
      _CUILog();
      return 0;
  }
}

uint64_t CUIRenditionKeyIndexForAttribute(unsigned __int16 *a1, int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int v3 = *a1;
  if (!a1[1] && v3 == 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  BOOL v6 = a1 + 3;
  while (v3 != a2)
  {
    int v7 = *v6;
    int v3 = *(v6 - 1);
    uint64_t result = (result + 1);
    v6 += 2;
    if (v7) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v3 == 0;
    }
    if (v8) {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t CUIRenditionKeyTokenCount(uint64_t a1)
{
  unsigned __int16 v1 = 0;
  if (a1)
  {
    while (*(_WORD *)(a1 + 4 * v1 + 2) || *(_WORD *)(a1 + 4 * v1))
      ++v1;
  }
  return v1;
}

BOOL CUIRenditionKeyHasIdentifier(uint64_t a1, int a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (!v2) {
    return 0;
  }
  int v3 = (int *)(a1 + 12);
  for (uint64_t i = 0xFFFFFFFFLL; ; --i)
  {
    int v5 = *v3++;
    if (v5 == a2) {
      break;
    }
    if (!--v2) {
      return 0;
    }
  }
  return i != 0;
}

uint64_t CUIRenditionKeyFormatRemoveAttribute(uint64_t result, int a2)
{
  uint64_t v2 = *(unsigned int *)(result + 8);
  if (v2)
  {
    uint64_t v3 = 0;
    while (*(_DWORD *)(result + 12 + 4 * v3) != a2)
    {
      if (v2 == ++v3) {
        return result;
      }
    }
    if ((int)v3 + 1 < v2)
    {
      do
      {
        *(_DWORD *)(result + 4 * v3 + 12) = *(_DWORD *)(result + 16 + 4 * v3);
        ++v3;
      }
      while (v2 - 1 != v3);
    }
    *(_DWORD *)(result + 8) = v2 - 1;
  }
  return result;
}

unsigned __int16 *CUIRenditionKeyValueForAttribute(unsigned __int16 *result, int a2)
{
  if (result)
  {
    int v2 = *result;
    if (result[1]) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = v2 == 0;
    }
    if (v3) {
      return 0;
    }
    int v4 = 0;
    int v5 = result + 3;
    while (v2 != a2)
    {
      ++v4;
      int v6 = *v5;
      int v2 = *(v5 - 1);
      v5 += 2;
      if (v6) {
        BOOL v7 = 0;
      }
      else {
        BOOL v7 = v2 == 0;
      }
      if (v7) {
        return 0;
      }
    }
    if (v4 < 0) {
      return 0;
    }
    else {
      return (unsigned __int16 *)result[2 * v4 + 1];
    }
  }
  return result;
}

uint64_t CUIFillCARKeyArrayForRenditionKey2(uint64_t result, int *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!result || !a2) {
    CUIFillCARKeyArrayForRenditionKey2_cold_1();
  }
  int v5 = a4;
  uint64_t v6 = result;
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  if (!a4)
  {
    int v5 = (uint64_t *)v11;
    uint64_t result = CUIRenditionKeyInitializeAttributeIndexWithKeyFormat((uint64_t)v11, a3);
  }
  int v7 = *a2;
  if (*a2)
  {
    uint64_t v8 = *v5;
    unsigned __int16 v9 = a2 + 1;
    do
    {
      if ((v8 & (1 << v7)) != 0) {
        *(_WORD *)(v6 + 2 * *((unsigned __int8 *)v5 + (unsigned __int16)v7 + 8)) = *((_WORD *)v9 - 1);
      }
      int v10 = *v9++;
      LOWORD(v7) = v10;
    }
    while (v10);
  }
  return result;
}

uint64_t CUIRenditionKeyInitializeAttributeIndexWithKeyFormat(uint64_t result, uint64_t a2)
{
  *(void *)(result + 192) = 0;
  *(_OWORD *)(result + 160) = 0u;
  *(_OWORD *)(result + 176) = 0u;
  *(_OWORD *)(result + 128) = 0u;
  *(_OWORD *)(result + 144) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 112) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)uint64_t result = 0u;
  *(_OWORD *)(result + 80) = 0u;
  unsigned int v2 = *(_DWORD *)(a2 + 8);
  if (v2 >= 0x40) {
    unsigned int v2 = 64;
  }
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
    unsigned int v5 = 0;
    do
    {
      unint64_t v6 = *(unsigned __int16 *)(a2 + 12 + 4 * v3);
      *(unsigned char *)(result + 8 + v6) = v3;
      if (v6 <= 0x1C) {
        *(_DWORD *)(result + 80 + 4 * v5++) = v6;
      }
      v4 |= 1 << v6;
      ++v3;
      LODWORD(v6) = *(_DWORD *)(a2 + 8);
      if (v6 >= 0x40) {
        unint64_t v6 = 64;
      }
      else {
        unint64_t v6 = v6;
      }
    }
    while (v3 < v6);
  }
  else
  {
    unsigned int v5 = 0;
    uint64_t v4 = 0;
  }
  *(_DWORD *)(result + 76) = v5;
  *(void *)uint64_t result = v4;
  return result;
}

uint64_t CUIFillCARKeyArrayForRenditionKey(uint64_t a1, int *a2, uint64_t a3)
{
  return CUIFillCARKeyArrayForRenditionKey2(a1, a2, a3, 0);
}

void CUIRenditionKeyStandardize(void *a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, 92);
  unsigned int v6 = *(_DWORD *)(a3 + 8);
  if (v6 - 23 > 0xFFFFFFE7)
  {
    int v7 = v14;
  }
  else
  {
    int v7 = malloc_type_calloc(v6 + 3, 4uLL, 0x100004052888210uLL);
    unsigned int v6 = *(_DWORD *)(a3 + 8);
  }
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = v6;
    int v10 = (int *)(a3 + 12);
    uint64_t v8 = v7;
    do
    {
      int v12 = *v10++;
      __int16 v11 = v12;
      unsigned int v13 = CUIRenditionKeyValueForAttribute(a2, (unsigned __int16)v12);
      if (v13)
      {
        _WORD *v8 = v11;
        v8[1] = v13;
        v8 += 2;
      }
      --v9;
    }
    while (v9);
  }
  *(_DWORD *)uint64_t v8 = 0;
  CUIRenditionKeyCopy(a1, v7, (unsigned __int16)(*(_WORD *)(a3 + 8) + 1));
  if (v7 != (_WORD *)v14) {
    free(v7);
  }
}

void *CUIRenditionKeyCopy(void *a1, _WORD *a2, unsigned int a3)
{
  if (!a1 || !a2) {
    CUIRenditionKeyCopy_cold_1();
  }
  for (unsigned __int16 i = 0; a2[2 * i + 1] || a2[2 * i]; ++i)
    ;
  if (i >= a3) {
    CUIRenditionKeyCopy_cold_2();
  }

  return memmove(a1, a2, 4 * i + 4);
}

uint64_t CUICompareRenditionKey(unsigned __int16 *a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a3 + 8);
  if (!v4) {
    return 0;
  }
  int v7 = (unsigned __int16 *)(a3 + 12);
  while (1)
  {
    int v8 = *v7;
    v7 += 2;
    unsigned int v9 = CUIRenditionKeyValueForAttribute(a1, v8);
    unsigned int v10 = CUIRenditionKeyValueForAttribute(a2, v8);
    uint64_t v11 = v9 > v10 ? 1 : v3;
    uint64_t v3 = v9 < v10 ? -1 : v11;
    if (v9 != v10) {
      break;
    }
    if (!--v4) {
      return 0;
    }
  }
  return v3;
}

uint64_t _CUICopySortedKeySignature(char *__dst, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = -1;
  if (__dst && a2 >= 0x65)
  {
    unsigned int v9 = stpncpy(__dst, "{", a2 - 1);
    unsigned int v10 = (char *)(&__dst[a2] - v9);
    if (&__dst[a2] != v9 && (uint64_t)(a4 & 0xFFFFFFFFFFFFFFFELL) >= 1)
    {
      unint64_t v11 = a3 + 2;
      do
      {
        unsigned int v12 = *(unsigned __int16 *)(v11 - 2);
        unsigned int v13 = (v12 >> 8) & 0xF;
        if (v12 >= 0xA000) {
          int v14 = 87;
        }
        else {
          int v14 = 48;
        }
        unsigned int v15 = v14 + (v12 >> 12);
        if (v13 >= 0xA) {
          int v16 = 87;
        }
        else {
          int v16 = 48;
        }
        unsigned int v17 = v16 + v13;
        unsigned int v18 = v12 & 0xF;
        unsigned int v19 = v12 >> 4;
        if (v19 >= 0xA) {
          int v20 = 87;
        }
        else {
          int v20 = 48;
        }
        unsigned int v21 = v20 + v19;
        if (v18 >= 0xA) {
          int v22 = 87;
        }
        else {
          int v22 = 48;
        }
        unsigned int v23 = v22 + v18;
        BOOL v25 = v15 == 48 && v17 == 48;
        BOOL v26 = v21 == 48 && v25;
        uint64_t v27 = v9 + 1;
        if (v26 && v23 == 48)
        {
          *unsigned int v9 = 48;
        }
        else if (v26)
        {
          *unsigned int v9 = v23;
        }
        else if (v25)
        {
          *unsigned int v9 = v21;
          uint64_t v27 = v9 + 2;
          v9[1] = v23;
        }
        else if (v15 == 48)
        {
          uint64_t v27 = v9 + 3;
          *unsigned int v9 = v17;
          v9[1] = v21;
          v9[2] = v23;
        }
        else
        {
          *unsigned int v9 = v15;
          v9[1] = v17;
          v9[2] = v21;
          uint64_t v27 = v9 + 4;
          v9[3] = v23;
        }
        *uint64_t v27 = 45;
        unsigned int v9 = v27 + 1;
        v10 -= 5;
        if (!v10) {
          break;
        }
        BOOL v28 = v11 >= a3 + (a4 & 0xFFFFFFFFFFFFFFFELL);
        v11 += 2;
      }
      while (!v28);
    }
    if ((unint64_t)(v10 - 3) > 0xFFFFFFFFFFFFFFFDLL) {
      v9 -= 2;
    }
    else {
      *(v9 - 1) = 125;
    }
    *unsigned int v9 = 0;
    return v9 - __dst;
  }
  return result;
}

uint64_t CUICopyKeySignatureWithPrefix(char *a1, unint64_t a2, int *a3, uint64_t a4, uint64_t *a5, unsigned int a6)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    CUICopyKeySignatureWithPrefix_cold_1();
  }
  memset(v34, 0, 44);
  size_t v12 = *(unsigned int *)(a4 + 8);
  if (v12 < 0x16) {
    unsigned int v13 = v34;
  }
  else {
    unsigned int v13 = malloc_type_calloc(v12, 2uLL, 0x1000040BDFB0063uLL);
  }
  CUIFillCARKeyArrayForRenditionKey2((uint64_t)v13, a3, a4, a5);
  if (a2)
  {
    int v14 = a1 + 1;
    do
    {
      unsigned int v15 = a6;
      int v16 = v14;
      a6 /= 0xAu;
      *(v14 - 1) = (v15 - 10 * a6) | 0x30;
      if (v15 < 0xA) {
        break;
      }
      ++v14;
      --a2;
    }
    while (a2);
  }
  else
  {
    int v16 = a1;
  }
  unint64_t v17 = v16 - a1;
  if ((unint64_t)(v16 - a1) >= 2)
  {
    uint64_t v18 = 0;
    do
    {
      char v19 = a1[v18];
      int v20 = (char *)(v17 - (v18 + 1));
      a1[v18] = v20[(void)a1];
      v20[(void)a1] = v19;
    }
    while (v17 >> 1 > ++v18);
  }
  uint64_t v22 = _CUICopySortedKeySignature(v16, a2, (uint64_t)v13, 2 * *(unsigned int *)(a4 + 8));
  if (v22 < 0)
  {
    if (v13 != v34) {
      free(v13);
    }
    return -1;
  }
  unint64_t v23 = v22;
  if (v13 != v34) {
    free(v13);
  }
  if (a2 - v23 < 0x11) {
    return -1;
  }
  if (v23 < 0x61) {
    return v23;
  }
  uint64_t v24 = 0;
  unint64_t v25 = 0;
  while (HIWORD(a3[v24]))
  {
    int v26 = LOWORD(a3[v24]);
    if (a5 && (*a5 & (1 << v26)) != 0)
    {
      LODWORD(v27) = *((unsigned __int8 *)a5 + LOWORD(a3[v24]) + 8);
LABEL_24:
      char v28 = 4 * v24 + 16;
      if (v27 < 4) {
        char v28 = 8 * v24;
      }
      if (v27 <= 0xB) {
        v25 ^= (unint64_t)HIWORD(a3[v24]) << v28;
      }
      goto LABEL_33;
    }
    uint64_t v29 = *(unsigned int *)(a4 + 8);
    if (v29)
    {
      uint64_t v27 = 0;
      while (*(_DWORD *)(a4 + 12 + 4 * v27) != v26)
      {
        if (v29 == ++v27) {
          goto LABEL_33;
        }
      }
      goto LABEL_24;
    }
LABEL_33:
    if (++v24 == 21) {
      break;
    }
  }
  v23 += 16;
  uint64_t v30 = &v16[v23];
  v16[v23] = 0;
  int v31 = 16;
  do
  {
    if (v25)
    {
      if ((v25 & 0xF) >= 0xA) {
        char v32 = (v25 & 0xF) + 87;
      }
      else {
        char v32 = v25 & 0xF | 0x30;
      }
      *--uint64_t v30 = v32;
      v25 >>= 4;
    }
    else
    {
      *--uint64_t v30 = 48;
    }
    --v31;
  }
  while (v31);
  return v23;
}

uint64_t CUICopyKeySignature(char *a1, unint64_t a2, int *a3, uint64_t a4, uint64_t *a5)
{
  return CUICopyKeySignatureWithPrefix(a1, a2, a3, a4, a5, 0);
}

uint64_t CUIMaxScaleForTargetPlatform(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 2) {
    return 2;
  }
  else {
    return 3;
  }
}

uint64_t CUIMinScaleForTargetPlatform(uint64_t a1)
{
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    return 2;
  }
  else {
    return 1;
  }
}

double CUIPointSizeForDimensionForVectorGlyph(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = (char *)&__VectorGlyphDimension2ToPointSizeTableEmbedded + 8 * a2;
  uint64_t v3 = (char *)&__VectorGlyphDimension2ToPointSizeTableWatch + 8 * a2;
  uint64_t v4 = (char *)&__VectorGlyphDimension2ToPointSizeTableForMac + 8 * a2;
  if (a1) {
    uint64_t v4 = (char *)&__VectorGlyphDimension2ToPointSizeTableEmbedded + 8 * a2;
  }
  if (a1 != 4) {
    uint64_t v3 = v4;
  }
  if (a1 != 5) {
    unsigned int v2 = v3;
  }
  return *(double *)v2;
}

uint64_t CUIMinDimensionForVectorGlyph()
{
  return 0;
}

uint64_t CUIMaxDimensionForVectorGlyph(uint64_t a1)
{
  if (a1 == 4) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t CUIPreferredVectorGlyphConfigurationsForPlatform(unint64_t a1)
{
  if (a1 < 6) {
    return (uint64_t)*(&off_1E6C9C768 + a1);
  }
  _CUILog();
  return 0;
}

__CFString *CUIPlatformNameForPlatform(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t result = (__CFString *)kCUIPlatformMac;
      break;
    case 1:
      uint64_t result = (__CFString *)kCUIPlatformiOS;
      break;
    case 2:
      uint64_t result = (__CFString *)kCUIPlatformMaciOS;
      break;
    case 3:
      uint64_t result = (__CFString *)kCUIPlatformAppleTV;
      break;
    case 4:
      uint64_t result = (__CFString *)kCUIPlatformWatch;
      break;
    case 5:
      uint64_t result = (__CFString *)kCUIPlatformVision;
      break;
    default:
      uint64_t result = &stru_1F37B9820;
      break;
  }
  return result;
}

uint64_t CUIPlatformForPlatformString(void *a1)
{
  if (([a1 isEqualToString:kCUIPlatformMac] & 1) != 0
    || ([a1 isEqualToString:@"osx"] & 1) != 0)
  {
    return 0;
  }
  if ([a1 isEqualToString:kCUIPlatformMaciOS]) {
    return 2;
  }
  if (([a1 isEqualToString:kCUIPlatformiOS] & 1) != 0
    || ([a1 isEqualToString:@"iphoneos"] & 1) != 0)
  {
    return 1;
  }
  if ([a1 isEqualToString:kCUIPlatformAppleTV]) {
    return 3;
  }
  if ([a1 isEqualToString:kCUIPlatformWatch]) {
    return 4;
  }
  if ([a1 isEqualToString:kCUIPlatformVision]) {
    return 5;
  }
  if ([a1 isEqualToString:@"xros"]) {
    return 5;
  }
  return -1;
}

uint64_t CUICurrentDeploymentVersionForTargetPlatform()
{
  return 11;
}

uint64_t CUICurrentPlatform()
{
  return 1;
}

uint64_t CUIRenditionKeyTokenIsBaseKeyOfKeyList(uint64_t a1, unsigned __int16 *a2)
{
  unsigned __int16 v3 = 0;
  if (a1)
  {
    while (*(_WORD *)(a1 + 4 * v3 + 2) || *(_WORD *)(a1 + 4 * v3))
      ++v3;
  }
  unsigned __int16 v4 = 0;
  if (a2)
  {
    while (a2[2 * v4 + 1] || a2[2 * v4])
      ++v4;
  }
  if (v4 < v3) {
    return 0;
  }
  if (v3)
  {
    uint64_t v6 = v3;
    for (unsigned __int16 i = (_WORD *)(a1 + 2); ; i += 2)
    {
      if (*i)
      {
        int v8 = (unsigned __int16)*i;
        if (v8 != CUIRenditionKeyValueForAttribute(a2, (unsigned __int16)*(i - 1))) {
          break;
        }
      }
      if (!--v6) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t CUICGBlendModeFromLSRDescription(void *a1)
{
  uint64_t result = [a1 UTF8String];
  if (result)
  {
    unsigned int v2 = (const char *)result;
    uint64_t v3 = 0;
    while (strcasecmp((const char *)gCGBlendModeDescriptions[v3 + 1], v2))
    {
      v3 += 3;
      if (v3 == 84) {
        return 0;
      }
    }
    return LODWORD(gCGBlendModeDescriptions[v3]);
  }
  return result;
}

__CFString *CUIBlendModeLSRDescriptionFromCGBlendMode(int a1)
{
  uint64_t v1 = 0;
  while (gCGBlendModeDescriptions[v1] != a1)
  {
    v1 += 3;
    if (v1 == 84) {
      return @"normal";
    }
  }
  return (__CFString *)[NSString stringWithUTF8String:gCGBlendModeDescriptions[v1 + 1]];
}

__CFString *CUIBlendModeDescriptionFromCGBlendMode(int a1)
{
  uint64_t v1 = 0;
  while (gCGBlendModeDescriptions[v1] != a1)
  {
    v1 += 3;
    if (v1 == 84) {
      return @"Normal";
    }
  }
  return (__CFString *)[NSString stringWithUTF8String:gCGBlendModeDescriptions[v1 + 2]];
}

const char *CUIThemeAttributeNameToString(int a1)
{
  if ((a1 - 1) > 0x1B) {
    return "UNKNOWN";
  }
  else {
    return off_1E6C9C798[a1 - 1];
  }
}

void *CUIKeyFormatToArrayString(uint64_t a1)
{
  unsigned int v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (*(_DWORD *)(a1 + 8))
  {
    int v3 = 0;
    do
      objc_msgSend(v2, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", CUIThemeAttributeNameToString(*(_DWORD *)(a1 + 4 * (unsigned __int16)v3++ + 12))));
    while (*(_DWORD *)(a1 + 8) > (unsigned __int16)v3);
  }
  return v2;
}

void sub_1DC6EE254()
{
}

unsigned __int16 *_CUIRenditionKeySetIntegerValueForAttribute(unsigned __int16 *a1, __int16 a2, unint64_t a3)
{
  if (a3 >> 16) {
    _CUIRenditionKeySetIntegerValueForAttribute_cold_1(a2);
  }
  return CUIRenditionKeySetValueForAttribute(a1, a2, (unsigned __int16)a3, 0x16u);
}

_DWORD *CUIBitVectorCreate(unsigned int a1)
{
  if (a1 <= 1) {
    int v1 = 1;
  }
  else {
    int v1 = a1;
  }
  unsigned int v2 = ((v1 - 1) >> 5) + 1;
  uint64_t v3 = malloc_type_malloc(4 * v2 + 8, 0x7EDDED84uLL);
  bzero(v3, 4 * v2 + 8);
  __CFSetLastAllocationEventName();
  *uint64_t v3 = 0;
  v3[1] = v2;
  return v3;
}

void *CUIBitVectorCopy(unsigned int *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = malloc_type_malloc(4 * v2 + 8, 0x7EDDED84uLL);
  bzero(v3, 4 * v2 + 8);
  __CFSetLastAllocationEventName();
  *uint64_t v3 = 0;
  v3[1] = v2;
  size_t v4 = 4 * a1[1] + 8;

  return memcpy(v3, a1, v4);
}

void CUIBitVectorDestroy(os_unfair_lock_s *a1)
{
  if (a1)
  {
    os_unfair_lock_lock(a1);
    free(a1);
  }
}

uint64_t CUIBitVectorSetBit(os_unfair_lock_s *a1, unsigned int a2)
{
  os_unfair_lock_lock(a1);
  if (a2 >> 5 >= a1[1]._os_unfair_lock_opaque)
  {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v4 = 1;
    a1[(a2 >> 5) + 2]._os_unfair_lock_opaque |= 1 << a2;
  }
  os_unfair_lock_unlock(a1);
  return v4;
}

uint64_t CUIBitVectorUnSetBit(os_unfair_lock_s *a1, unsigned int a2)
{
  os_unfair_lock_lock(a1);
  if (a2 >> 5 >= a1[1]._os_unfair_lock_opaque)
  {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v4 = 1;
    a1[(a2 >> 5) + 2]._os_unfair_lock_opaque &= ~(1 << a2);
  }
  os_unfair_lock_unlock(a1);
  return v4;
}

uint64_t CUIBitVectorIsBitSet(os_unfair_lock_s *a1, unsigned int a2)
{
  os_unfair_lock_lock(a1);
  if (a2 >> 5 >= a1[1]._os_unfair_lock_opaque) {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v4 = (a1[(a2 >> 5) + 2]._os_unfair_lock_opaque >> a2) & 1;
  }
  os_unfair_lock_unlock(a1);
  return v4;
}

uint64_t CUIBitVectorNumberOfBitsSet(os_unfair_lock_s *a1)
{
  os_unfair_lock_lock(a1);
  uint64_t os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque)
  {
    LODWORD(v3) = 0;
    uint64_t v4 = a1 + 2;
    do
    {
      uint32_t v5 = v4->_os_unfair_lock_opaque;
      ++v4;
      uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
      v6.i16[0] = vaddlv_u8(v6);
      uint64_t v3 = (v6.i32[0] + v3);
      --os_unfair_lock_opaque;
    }
    while (os_unfair_lock_opaque);
  }
  else
  {
    uint64_t v3 = 0;
  }
  os_unfair_lock_unlock(a1);
  return v3;
}

uint64_t CUIBitVectorNumberOfBitsSetInBucket(uint64_t a1, unsigned int a2)
{
  uint8x8_t v2 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned int *)(a1 + 4 * (a2 >> 5) + 8));
  v2.i16[0] = vaddlv_u8(v2);
  return v2.u32[0];
}

uint64_t CUIBitVectorBucketValue(os_unfair_lock_s *a1, unsigned int a2)
{
  os_unfair_lock_lock(a1);
  uint64_t os_unfair_lock_opaque = a1[(a2 >> 5) + 2]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(a1);
  return os_unfair_lock_opaque;
}

uint64_t CUIBitVectorSetBitRange(os_unfair_lock_s *a1, unsigned int a2, unsigned int a3)
{
  os_unfair_lock_lock(a1);
  if (a2 >= a3)
  {
LABEL_5:
    os_unfair_lock_unlock(a1);
    return 1;
  }
  else
  {
    uint32_t os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
    while (a2 >> 5 < os_unfair_lock_opaque)
    {
      a1[(a2 >> 5) + 2]._os_unfair_lock_opaque |= 1 << a2;
      if (a3 == ++a2) {
        goto LABEL_5;
      }
    }
    os_unfair_lock_unlock(a1);
    return 0xFFFFFFFFLL;
  }
}

_DWORD *CUIBitVectorBitAnd(os_unfair_lock_s *a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_lock(a1);
  os_unfair_lock_lock(a2);
  uint64_t os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque == a2[1]._os_unfair_lock_opaque)
  {
    uint32_t v5 = malloc_type_malloc(4 * os_unfair_lock_opaque + 8, 0x7EDDED84uLL);
    bzero(v5, 4 * os_unfair_lock_opaque + 8);
    __CFSetLastAllocationEventName();
    *uint32_t v5 = 0;
    v5[1] = os_unfair_lock_opaque;
    if (a1[1]._os_unfair_lock_opaque)
    {
      uint64_t v6 = 2;
      do
      {
        v5[v6] = a2[v6]._os_unfair_lock_opaque & a1[v6]._os_unfair_lock_opaque;
        unint64_t v7 = v6++ - 1;
      }
      while (v7 < a1[1]._os_unfair_lock_opaque);
    }
  }
  else
  {
    uint32_t v5 = 0;
  }
  os_unfair_lock_unlock(a2);
  os_unfair_lock_unlock(a1);
  return v5;
}

_DWORD *CUIBitVectorBitOrForBucket(os_unfair_lock_s *a1, os_unfair_lock_s *a2, int a3)
{
  os_unfair_lock_lock(a1);
  os_unfair_lock_lock(a2);
  uint64_t os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque == a2[1]._os_unfair_lock_opaque)
  {
    unint64_t v7 = malloc_type_malloc(4 * os_unfair_lock_opaque + 8, 0x7EDDED84uLL);
    bzero(v7, 4 * os_unfair_lock_opaque + 8);
    __CFSetLastAllocationEventName();
    _DWORD *v7 = 0;
    v7[1] = os_unfair_lock_opaque;
    if (a1[1]._os_unfair_lock_opaque)
    {
      unint64_t v8 = 0;
      do
      {
        if (a3 == v8) {
          int v9 = a2[a3 + 2]._os_unfair_lock_opaque | a1[a3 + 2]._os_unfair_lock_opaque;
        }
        else {
          int v9 = a1[v8 + 2]._os_unfair_lock_opaque;
        }
        v7[v8++ + 2] = v9;
      }
      while (v8 < a1[1]._os_unfair_lock_opaque);
    }
    os_unfair_lock_unlock(a2);
  }
  else
  {
    os_unfair_lock_unlock(a2);
    unint64_t v7 = 0;
  }
  os_unfair_lock_unlock(a1);
  return v7;
}

_DWORD *CUIBitVectorToData(os_unfair_lock_s *a1, size_t *a2)
{
  os_unfair_lock_lock(a1);
  size_t v4 = 4 * a1[1]._os_unfair_lock_opaque + 4;
  *a2 = v4;
  uint32_t v5 = malloc_type_malloc(v4, 0x46EEF169uLL);
  uint64_t v6 = v5;
  *uint32_t v5 = a1[1]._os_unfair_lock_opaque;
  if (a1[1]._os_unfair_lock_opaque)
  {
    unint64_t v7 = 0;
    do
    {
      v5[v7 + 1] = a1[v7 + 2]._os_unfair_lock_opaque;
      ++v7;
    }
    while (v7 < a1[1]._os_unfair_lock_opaque);
  }
  __CFSetLastAllocationEventName();
  os_unfair_lock_unlock(a1);
  return v6;
}

_DWORD *CUIBitVectorFromData(unsigned int *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = 4 * v2;
  if (4 * v2 + 4 != a2) {
    return 0;
  }
  uint32_t v5 = malloc_type_malloc(v3 + 8, 0x7EDDED84uLL);
  bzero(v5, v3 + 8);
  __CFSetLastAllocationEventName();
  *uint32_t v5 = 0;
  v5[1] = v2;
  if (v2)
  {
    unint64_t v6 = 0;
    do
    {
      v5[v6 / 4 + 2] = a1[v6 / 4 + 1];
      v6 += 4;
    }
    while (v3 != v6);
  }
  return v5;
}

BOOL CUIBitVectorEqual(os_unfair_lock_s *a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_lock(a1);
  os_unfair_lock_lock(a2);
  uint64_t os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque == a2[1]._os_unfair_lock_opaque)
  {
    if (os_unfair_lock_opaque)
    {
      uint64_t v5 = os_unfair_lock_opaque - 1;
      unint64_t v6 = a1 + 2;
      unint64_t v7 = a2 + 2;
      do
      {
        uint32_t v9 = v6->_os_unfair_lock_opaque;
        ++v6;
        uint32_t v8 = v9;
        uint32_t v11 = v7->_os_unfair_lock_opaque;
        ++v7;
        uint32_t v10 = v11;
        BOOL v13 = v5-- != 0;
        BOOL v14 = v8 == v10;
      }
      while (v8 == v10 && v13);
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  os_unfair_lock_unlock(a2);
  os_unfair_lock_unlock(a1);
  return v14;
}

unsigned char *CUIBitVectorToString(os_unfair_lock_s *a1)
{
  os_unfair_lock_lock(a1);
  int v2 = (34 * a1[1]._os_unfair_lock_opaque) | 1;
  uint64_t v3 = malloc_type_calloc((2 * a1[1]._os_unfair_lock_opaque + 32 * a1[1]._os_unfair_lock_opaque) | 1, 1uLL, 0x100004077774924uLL);
  signed int os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque)
  {
    unint64_t v5 = 0;
    int v6 = 0;
    do
    {
      uint64_t v7 = 0;
      int v8 = v6;
      v3[v6] = 91;
      uint64_t v9 = (v6 + 1);
      uint32_t v10 = &v3[(int)v9];
      uint64_t v11 = v9 << 32;
      do
      {
        if ((a1[v5 + 2]._os_unfair_lock_opaque >> v7)) {
          char v12 = 49;
        }
        else {
          char v12 = 48;
        }
        v10[v7++] = v12;
        v11 += 0x100000000;
      }
      while (v7 != 32);
      v6 += 34;
      v3[v11 >> 32] = 93;
      ++v5;
    }
    while (v5 < a1[1]._os_unfair_lock_opaque);
    signed int os_unfair_lock_opaque = v8 + 34;
  }
  if (os_unfair_lock_opaque >= v2) {
    CUIBitVectorToString_cold_1();
  }
  __CFSetLastAllocationEventName();
  os_unfair_lock_unlock(a1);
  return v3;
}

uint64_t CUIGeneratePlaceholderAssetCatalog(void *a1, void *a2, void *a3, uint64_t *a4)
{
  uint64_t result = [a3 count];
  if (result)
  {
    uint64_t result = preserveAssetsNamed(objc_msgSend((id)objc_msgSend(a3, "componentsJoinedByString:", @","), "UTF8String"), 917.3, 0, (const char *)objc_msgSend(a1, "fileSystemRepresentation"), (const char *)objc_msgSend(a2, "fileSystemRepresentation"));
    if (result != 1)
    {
      if (!a4) {
        return 0;
      }
      if (result == -2)
      {
        unsigned int v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F28798];
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"ERROR inputfile not a valid Asset catalog", *MEMORY[0x1E4F28588], 0);
        char v12 = v15;
        uint64_t v13 = v16;
        uint64_t v14 = 5;
      }
      else if (result == -1)
      {
        unint64_t v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F28798];
        uint64_t v19 = *__error();
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"ERROR copying input to output", *MEMORY[0x1E4F28588], 0);
        char v12 = v17;
        uint64_t v13 = v18;
        uint64_t v14 = v19;
      }
      else
      {
        if (result)
        {
          uint64_t v20 = 0;
          goto LABEL_13;
        }
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = *MEMORY[0x1E4F28798];
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Passed Invalid namesToPreserve", *MEMORY[0x1E4F28588], 0);
        char v12 = v9;
        uint64_t v13 = v10;
        uint64_t v14 = 45;
      }
      uint64_t v20 = [v12 errorWithDomain:v13 code:v14 userInfo:v11];
LABEL_13:
      uint64_t result = 0;
      *a4 = v20;
    }
  }
  return result;
}

uint64_t parseIdiom(const char *a1)
{
  uint64_t result = strcasecmp(a1, "universal");
  if (result)
  {
    if (!strcasecmp(a1, "reality"))
    {
      return 8;
    }
    else
    {
      uint64_t v3 = *(const char **)(MEMORY[0x1E4F5E0B8] + 16);
      if (v3)
      {
        size_t v4 = (void *)MEMORY[0x1E4F5E0B8];
        while (strcasecmp(a1, v3))
        {
          uint64_t v3 = (const char *)v4[5];
          v4 += 3;
          if (!v3) {
            return 0xFFFFFFFFLL;
          }
        }
        return *(unsigned int *)v4;
      }
      else
      {
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

char *getIdiomListUsage()
{
  getIdiomListUsage_idiomListUsage = 0;
  uint64_t v0 = MEMORY[0x1E4F5E0B8];
  int v1 = *(const char **)(MEMORY[0x1E4F5E0B8] + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    do
    {
      while (strcasecmp(v1, "universal"))
      {
        __strcat_chk();
        ++v2;
        int v1 = *(const char **)(v0 + 24 * v2 + 16);
        if (!v1) {
          return &getIdiomListUsage_idiomListUsage;
        }
        __strcat_chk();
      }
      ++v2;
      int v1 = *(const char **)(v0 + 24 * v2 + 16);
    }
    while (v1);
  }
  return &getIdiomListUsage_idiomListUsage;
}

char *getIdiomUsage()
{
  getIdiomUsage_idiomUsage = 0;
  uint64_t v0 = MEMORY[0x1E4F5E0B8];
  if (*(void *)(MEMORY[0x1E4F5E0B8] + 16))
  {
    __strcat_chk();
    if (*(void *)(v0 + 40))
    {
      int v1 = (uint64_t *)(v0 + 64);
      do
      {
        __strcat_chk();
        __strcat_chk();
        uint64_t v2 = *v1;
        v1 += 3;
      }
      while (v2);
    }
  }
  return &getIdiomUsage_idiomUsage;
}

const char *getDisplayGamutUsage()
{
  return "srgb/p3/all";
}

uint64_t getDeploymentTargetUsage()
{
  uint64_t v3 = 0;
  size_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v6 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __getDeploymentTargetUsage_block_invoke;
  block[3] = &unk_1E6C9CDA8;
  block[4] = &v3;
  if (getDeploymentTargetUsage_onceToken != -1) {
    dispatch_once(&getDeploymentTargetUsage_onceToken, block);
  }
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void __getDeploymentTargetUsage_block_invoke(uint64_t a1)
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:6];
  if (*(void *)(MEMORY[0x1E4F5E098] + 16))
  {
    uint64_t v2 = (uint64_t *)(MEMORY[0x1E4F5E098] + 40);
    do
    {
      objc_msgSend(v5, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:"));
      uint64_t v3 = *v2;
      v2 += 3;
    }
    while (v3);
  }
  uint64_t v4 = [v5 componentsJoinedByString:@","];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [(id)objc_msgSend(NSString stringWithFormat:@"9.0,10.0,11.0,12.0,12.2,13.0,14.0,15.0 (or %@). 'any' means targeting 2015 or earlier)", v4], "UTF8String");
}

void *getGraphicsClassUsage()
{
  if (getGraphicsClassUsage_onceToken != -1) {
    dispatch_once(&getGraphicsClassUsage_onceToken, &__block_literal_global_15);
  }
  return &getGraphicsClassUsage_graphicsClassUsage;
}

size_t __getGraphicsClassUsage_block_invoke()
{
  if (*(void *)(MEMORY[0x1E4F5E0B0] + 16))
  {
    uint64_t v0 = (uint64_t *)(MEMORY[0x1E4F5E0B0] + 40);
    do
    {
      __strncat_chk();
      __strncat_chk();
      uint64_t v1 = *v0;
      v0 += 3;
    }
    while (v1);
  }
  __strncat_chk();
  if (*(void *)(MEMORY[0x1E4F5E0A8] + 16))
  {
    uint64_t v2 = (uint64_t *)(MEMORY[0x1E4F5E0A8] + 40);
    do
    {
      __strncat_chk();
      __strncat_chk();
      uint64_t v3 = *v2;
      v2 += 3;
    }
    while (v3);
  }
  size_t result = strlen(getGraphicsClassUsage_graphicsClassUsage);
  getGraphicsClassUsage_graphicsClassUsage[result - 1] = 0;
  return result;
}

uint64_t parseDisplayGamut(const char *a1)
{
  if (!strcasecmp(a1, "all")) {
    return 10;
  }
  uint64_t v2 = *(const char **)(MEMORY[0x1E4F5E0A0] + 16);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F5E0A0];
  while (strcasecmp(a1, v2))
  {
    uint64_t v2 = (const char *)v3[5];
    v3 += 3;
    if (!v2) {
      return 0xFFFFFFFFLL;
    }
  }
  return *(unsigned int *)v3;
}

id parseIdiomList(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01A13D0]();
  uint64_t v3 = (void *)[[NSString alloc] initWithUTF8String:a1];
  uint64_t v4 = (void *)[v3 componentsSeparatedByString:@","];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = parseIdiom((const char *)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet")), "UTF8String"));
        if ((int)v10 < 1)
        {

          return 0;
        }
        uint64_t v11 = v10;
        if (!v7) {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v11));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

uint64_t parseGraphicsFeatureSetClass(char *a1)
{
  uint64_t v2 = *(const char **)(MEMORY[0x1E4F5E0B0] + 16);
  if (v2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F5E0B0];
    while (strcasecmp(a1, v2))
    {
      uint64_t v2 = (const char *)v3[5];
      v3 += 3;
      if (!v2) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v4 = *(const char **)(MEMORY[0x1E4F5E0A8] + 16);
    if (!v4) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v3 = (void *)MEMORY[0x1E4F5E0A8];
    while (strcasecmp(a1, v4))
    {
      uint64_t v4 = (const char *)v3[5];
      v3 += 3;
      if (!v4) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  return *(unsigned int *)v3;
}

id parseGraphicsFallBacks(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01A13D0]();
  uint64_t v3 = (void *)[[NSString alloc] initWithUTF8String:a1];
  uint64_t v4 = (void *)[v3 componentsSeparatedByString:@":"];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = parseGraphicsFeatureSetClass((char *)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet")), "UTF8String"));
        if ((v10 & 0x80000000) != 0)
        {

          return 0;
        }
        uint64_t v11 = v10;
        if (!v7) {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v11));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

id parseSubtypeFallBacks(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01A13D0]();
  uint64_t v3 = (void *)[[NSString alloc] initWithUTF8String:a1];
  uint64_t v4 = (void *)[v3 componentsSeparatedByString:@":"];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet")), "integerValue");
        if ((v10 & 0x80000000) != 0)
        {
LABEL_17:

          return 0;
        }
        if (!v7) {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
        }
        if ([v7 count])
        {
          if ((int)objc_msgSend((id)objc_msgSend(v7, "lastObject"), "intValue") < (int)v10) {
            goto LABEL_17;
          }
        }
        else if ([v7 count] == 1 {
               && objc_msgSend((id)objc_msgSend(v7, "lastObject"), "intValue"))
        }
        {
          goto LABEL_17;
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v10));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

uint64_t processIdiom()
{
  return 1;
}

void resetComparisonResultsToString()
{
  __comparisonResultString = 0;
}

char *lastComparisonResult()
{
  return &__comparisonResultString;
}

uint64_t compareThinningParameters()
{
  return 0;
}

uint64_t compareThinningParametersInBatch()
{
  return 0;
}

uint64_t firstIntegerValue(void *a1)
{
  if (![a1 count]) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = (void *)[a1 firstObject];

  return [v2 intValue];
}

uint64_t preserveAssetsNamed(uint64_t a1, double a2, uint64_t a3, const char *a4, const char *a5)
{
  uint64_t v9 = (void *)MEMORY[0x1E01A13D0]();
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", a1), "componentsSeparatedByString:", @","));
  if ([v10 count])
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v12 = [v11 stringWithFileSystemRepresentation:a4 length:strlen(a4)];
    if (*a5) {
      long long v13 = (void *)[v11 stringWithFileSystemRepresentation:a5 length:strlen(a5)];
    }
    else {
      long long v13 = 0;
    }
    if ([v13 length]
      && (long long v15 = copyfile_state_alloc(),
          int v16 = copyfile(a4, a5, v15, 0x20000Fu),
          copyfile_state_free(v15),
          uint64_t v12 = (uint64_t)v13,
          v16 < 0))
    {
      uint64_t v14 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v17 = [[CUIPlaceholderCUICarUtilAssetStorage alloc] initWithPath:v12 forWriting:1];
      if (v17)
      {
        uint64_t v18 = v17;
        [(CUIPlaceholderCUIMutableCommonAssetStorage *)v17 setUseBitmapIndex:1];
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v20 = [(CUIPlaceholderCUICommonAssetStorage *)v18 keyFormat];
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __preserveAssetsNamed_block_invoke;
        v26[3] = &unk_1E6C9CDF8;
        v26[7] = v19;
        v26[8] = v20;
        v26[4] = v18;
        v26[5] = v21;
        v26[6] = v10;
        if ([(CUIPlaceholderCUICommonAssetStorage *)v18 enumerateKeysAndObjectsUsingBlock:v26])
        {
          if ([v19 count])
          {
            id v22 = [(CUIPlaceholderCUICommonAssetStorage *)v18 thinningArguments];
            if ([v22 length]) {
              uint64_t v23 = [NSString stringWithFormat:@"%@ [carutil %f preserve name '%s']", v22, *(void *)&a2, a1];
            }
            else {
              uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"[carutil %f preserve name '%s']", *(void *)&a2, a1, v25);
            }
            __removeUnwantedAssets(v18, v19, v21, v23);
          }
          uint64_t v14 = 1;
        }
        else
        {
          uint64_t v14 = 4294967294;
        }
      }
      else
      {
        if ([v13 length]) {
          unlink(a5);
        }
        uint64_t v14 = 4294967294;
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

void __preserveAssetsNamed_block_invoke(uint64_t a1, unsigned __int16 *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) renditionNameForKeyBaseList:a2];
  unsigned int v5 = CUIRenditionKeyValueForAttribute(a2, 1);
  KeyTokenToData = (void *)__createKeyTokenToData((int *)a2, *(void *)(a1 + 64));
  unsigned int v7 = CUIRenditionKeyValueForAttribute(a2, 17);
  if (v5 == 9 && !v7)
  {
    uint64_t v8 = *(void **)(a1 + 40);
LABEL_6:
    [v8 addObject:KeyTokenToData];
    goto LABEL_7;
  }
  uint64_t v9 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __preserveAssetsNamed_block_invoke_2;
  v10[3] = &unk_1E6C9CDD0;
  v10[4] = v4;
  if (!objc_msgSend((id)objc_msgSend(v9, "objectsPassingTest:", v10), "count"))
  {
    uint64_t v8 = *(void **)(a1 + 56);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __createKeyTokenToData(int *a1, uint64_t a2)
{
  uint64_t v4 = malloc_type_calloc(*(unsigned int *)(a2 + 8), 2uLL, 0x1000040BDFB0063uLL);
  CUIFillCARKeyArrayForRenditionKey((uint64_t)v4, a1, a2);
  id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v6 = 2 * *(unsigned int *)(a2 + 8);

  return [v5 initWithBytesNoCopy:v4 length:v6 freeWhenDone:1];
}

uint64_t __preserveAssetsNamed_block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) hasPrefix:a2];
  if (result) {
    *a3 = 1;
  }
  return result;
}

void __removeUnwantedAssets(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  id v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  uint64_t v21 = 0;
  uint64_t v8 = [a1 keyFormat];
  uint64_t v9 = [a3 mutableCopy];
  v17[5] = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ____removeUnwantedAssets_block_invoke;
  v15[3] = &unk_1E6C9CE48;
  v15[4] = a1;
  v15[5] = &v22;
  [a2 enumerateObjectsUsingBlock:v15];
  if ([(id)v17[5] count])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ____removeUnwantedAssets_block_invoke_2;
    v14[3] = &unk_1E6C9CE70;
    v14[4] = a1;
    v14[5] = &v16;
    _OWORD v14[6] = v8;
    [a1 enumerateKeysAndObjectsUsingBlock:v14];
    uint64_t v10 = (void *)v17[5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ____removeUnwantedAssets_block_invoke_3;
    v13[3] = &unk_1E6C9CE48;
    v13[4] = a1;
    v13[5] = &v22;
    [v10 enumerateObjectsUsingBlock:v13];
  }
  uint64_t v11 = *((unsigned int *)v23 + 6);
  if (v11) {
    uint64_t v12 = [NSString stringWithFormat:@"%@ <removed %d>", a4, v11];
  }
  else {
    uint64_t v12 = [NSString stringWithFormat:@"%@ <removed none>", a4];
  }
  [a1 setThinningArguments:v12];
  [a1 updateBitmapInfo];
  [a1 writeToDiskAndCompact:1];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

void sub_1DC6F1890(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t deleteAssetsNamed(uint64_t a1, double a2, uint64_t a3, const char *a4, const char *a5)
{
  uint64_t v9 = (void *)MEMORY[0x1E01A13D0]();
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", a1), "componentsSeparatedByString:", @","));
  if (![v10 count])
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "carutil: passed invalid names delete-assets-named '%s'\n");
    goto LABEL_17;
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v12 = [v11 stringWithFileSystemRepresentation:a4 length:strlen(a4)];
  if (*a5) {
    long long v13 = (void *)[v11 stringWithFileSystemRepresentation:a5 length:strlen(a5)];
  }
  else {
    long long v13 = 0;
  }
  if ([v13 length])
  {
    uint64_t v14 = copyfile_state_alloc();
    if ((copyfile(a4, a5, v14, 0x20000Fu) & 0x80000000) == 0)
    {
      copyfile_state_free(v14);
      uint64_t v12 = (uint64_t)v13;
      goto LABEL_9;
    }
    uint64_t v22 = (FILE *)*MEMORY[0x1E4F143C8];
    uint64_t v23 = __error();
    uint64_t v24 = strerror(*v23);
    fprintf(v22, "carutil: error: %s copy %s to %s\n", v24, a4, a5);
    copyfile_state_free(v14);
LABEL_17:
    return 0;
  }
LABEL_9:
  long long v15 = [[CUIPlaceholderCUICarUtilAssetStorage alloc] initWithPath:v12 forWriting:1];
  if (!v15)
  {
    if ([v13 length]) {
      unlink(a5);
    }
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "carutil: error:\n\t%s is not a valid AssetCatalog\n");
    goto LABEL_17;
  }
  uint64_t v16 = v15;
  [(CUIPlaceholderCUIMutableCommonAssetStorage *)v15 setUseBitmapIndex:1];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v18 = [(CUIPlaceholderCUICommonAssetStorage *)v16 keyFormat];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __deleteAssetsNamed_block_invoke;
  v27[3] = &unk_1E6C9CDF8;
  v27[7] = v17;
  v27[8] = v18;
  v27[4] = v16;
  v27[5] = v19;
  v27[6] = v10;
  [(CUIPlaceholderCUICommonAssetStorage *)v16 enumerateKeysAndObjectsUsingBlock:v27];
  if ([v17 count])
  {
    id v20 = [(CUIPlaceholderCUICommonAssetStorage *)v16 thinningArguments];
    if ([v20 length]) {
      uint64_t v21 = [NSString stringWithFormat:@"%@ [carutil %f remove name '%s']", v20, *(void *)&a2, a1];
    }
    else {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"[carutil %f remove name '%s']", *(void *)&a2, a1, v26);
    }
    __removeUnwantedAssets(v16, v17, v19, v21);
  }

  return 1;
}

void __deleteAssetsNamed_block_invoke(uint64_t a1, unsigned __int16 *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) renditionNameForKeyBaseList:a2];
  unsigned int v5 = CUIRenditionKeyValueForAttribute(a2, 1);
  KeyTokenToData = (void *)__createKeyTokenToData((int *)a2, *(void *)(a1 + 64));
  unsigned int v7 = CUIRenditionKeyValueForAttribute(a2, 17);
  if (v5 == 9 && !v7)
  {
    uint64_t v8 = *(void **)(a1 + 40);
LABEL_6:
    [v8 addObject:KeyTokenToData];
    goto LABEL_7;
  }
  uint64_t v9 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __deleteAssetsNamed_block_invoke_2;
  v10[3] = &unk_1E6C9CDD0;
  v10[4] = v4;
  if (!objc_msgSend((id)objc_msgSend(v9, "objectsPassingTest:", v10), "count"))
  {
    uint64_t v8 = *(void **)(a1 + 56);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __deleteAssetsNamed_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasPrefix:a2] ^ 1;
}

uint64_t processCoreGlyphs(const char *a1, const char *a2, double a3)
{
  uint64_t v6 = (void *)MEMORY[0x1E01A13D0]();
  unsigned int v7 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [v7 stringWithFileSystemRepresentation:a1 length:strlen(a1)];
  if (*a2) {
    uint64_t v9 = (void *)[v7 stringWithFileSystemRepresentation:a2 length:strlen(a2)];
  }
  else {
    uint64_t v9 = 0;
  }
  if ([v9 length])
  {
    uint64_t v10 = copyfile_state_alloc();
    if (copyfile(a1, a2, v10, 0x20000Fu) < 0)
    {
      id v17 = (FILE *)*MEMORY[0x1E4F143C8];
      uint64_t v18 = __error();
      id v19 = strerror(*v18);
      fprintf(v17, "carutil: error: %s copy %s to %s\n", v19, a1, a2);
      copyfile_state_free(v10);
LABEL_15:
      return 0;
    }
    copyfile_state_free(v10);
    uint64_t v8 = (uint64_t)v9;
  }
  uint64_t v11 = [[CUIPlaceholderCUICarUtilAssetStorage alloc] initWithPath:v8 forWriting:1];
  if (!v11)
  {
    if ([v9 length]) {
      unlink(a2);
    }
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "carutil: error:\n\t%s is not a valid AssetCatalog\n", a1);
    goto LABEL_15;
  }
  uint64_t v12 = v11;
  [(CUIPlaceholderCUIMutableCommonAssetStorage *)v11 setUseBitmapIndex:1];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v14 = [(CUIPlaceholderCUICommonAssetStorage *)v12 keyFormat];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __processCoreGlyphs_block_invoke;
  v22[3] = &unk_1E6C9CE20;
  v22[4] = v13;
  v22[5] = v14;
  [(CUIPlaceholderCUICommonAssetStorage *)v12 enumerateKeysAndObjectsUsingBlock:v22];
  if ([v13 count])
  {
    id v15 = [(CUIPlaceholderCUICommonAssetStorage *)v12 thinningArguments];
    if ([v15 length]) {
      uint64_t v16 = [NSString stringWithFormat:@"%@ [carutil %f CoreGlyphs thin]", v15, *(void *)&a3];
    }
    else {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"[carutil %f CoreGlyphs thin]", *(void *)&a3, v21);
    }
    __removeUnwantedAssets(v12, v13, 0, v16);
  }

  return 1;
}

uint64_t __processCoreGlyphs_block_invoke(uint64_t a1, unsigned __int16 *a2)
{
  unsigned int v4 = CUIRenditionKeyValueForAttribute(a2, 1);
  unsigned int v5 = CUIRenditionKeyValueForAttribute(a2, 2);
  unsigned int v6 = CUIRenditionKeyValueForAttribute(a2, 26);
  unsigned int v7 = CUIRenditionKeyValueForAttribute(a2, 27);
  uint64_t KeyTokenToData = __createKeyTokenToData((int *)a2, *(void *)(a1 + 40));
  uint64_t v9 = KeyTokenToData;
  if (v4 == 85)
  {
    if (v5 == 181 || v5 == 59 && (v7 != 1 || v6 > 9 || ((1 << v6) & 0x212) == 0))
    {
LABEL_10:
      uint64_t v11 = KeyTokenToData;
      uint64_t KeyTokenToData = [*(id *)(a1 + 32) addObject:KeyTokenToData];
      uint64_t v9 = v11;
    }
  }
  else if (v4 == 9 && v5 == 181)
  {
    goto LABEL_10;
  }

  return MEMORY[0x1F41817F8](KeyTokenToData, v9);
}

uint64_t validateInput(int a1, const char *a2, void *a3, void *a4, void *a5)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "stringWithFileSystemRepresentation:length:", a2, strlen(a2));
  if (result)
  {
    uint64_t v11 = [[CUIPlaceholderCUICarUtilAssetStorage alloc] initWithPath:result forWriting:0];
    if (!v11) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v12 = v11;
    uint64_t v13 = [(CUIPlaceholderCUICommonAssetStorage *)v11 deploymentPlatform];
    unsigned int v14 = [(CUIPlaceholderCUICommonAssetStorage *)v12 storageVersion];

    uint64_t v15 = [a4 count];
    if ([a5 count] == v15 && v15)
    {
      uint64_t v16 = 0;
      do
      {
        uint64_t v29 = 0;
        uint64_t v17 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", v16), "integerValue");
        uint64_t v29 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", v16), "unsignedIntegerValue");
        char v18 = CUIValidateIdiomSubtypes(v17, &v29);
        if (a1)
        {
          if ((v18 & 1) == 0) {
            return 0xFFFFFFFFLL;
          }
        }
      }
      while (v15 != ++v16);
    }
    if (v14 > 0x11)
    {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "carutil: not validating inputs '%s' of the future '%d > %d'\n", a2, v14, 17);
      return 0;
    }
    else
    {
      uint64_t v19 = [a3 count];
      uint64_t result = 0;
      if (v19 && v13 != -1)
      {
        uint64_t v20 = 0;
        uint64_t v21 = (FILE **)MEMORY[0x1E4F143C8];
        while (1)
        {
          uint64_t v22 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v20), "integerValue");
          if (v22 > CUIMaxScaleForTargetPlatform(v13))
          {
            uint64_t v23 = *v21;
            int v24 = CUIMaxScaleForTargetPlatform(v13);
            int v25 = (const char *)[(__CFString *)CUIPlatformNameForPlatform(v13) UTF8String];
            fprintf(v23, "carutil: error: scale larger than %d valid scale for platform %d %s'\n", v22, v24, v25);
            if (a1) {
              break;
            }
          }
          if (v22 < CUIMinScaleForTargetPlatform(v13))
          {
            uint64_t v26 = *v21;
            int v27 = CUIMinScaleForTargetPlatform(v13);
            char v28 = (const char *)[(__CFString *)CUIPlatformNameForPlatform(v13) UTF8String];
            fprintf(v26, "carutil: error: scale smaller than %d valid scale for platform %d %s'\n", v22, v27, v28);
            if (a1) {
              break;
            }
          }
          if (v19 == ++v20) {
            return 0;
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t ____removeUnwantedAssets_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) assetExistsForKey:a2];
  if (result)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    unsigned int v5 = *(void **)(a1 + 32);
    return [v5 removeAssetForKey:a2];
  }
  return result;
}

void ____removeUnwantedAssets_block_invoke_2(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (CUIRenditionKeyValueForAttribute(a2, 1) != 9)
  {
    unsigned int v7 = -[CUIPlaceholderCUIThemeRendition initWithCSIData:forKey:version:]([CUIPlaceholderCUIThemeRendition alloc], "initWithCSIData:forKey:version:", a3, a2, [*(id *)(a1 + 32) distilledInCoreUIVersion]);
    if ([(CUIPlaceholderCUIThemeRendition *)v7 isInternalLink])
    {
      uint64_t KeyTokenToData = (void *)__createKeyTokenToData((int *)objc_msgSend(-[CUIPlaceholderCUIThemeRendition linkingToRendition](v7, "linkingToRendition"), "keyList"), *(void *)(a1 + 48));
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:KeyTokenToData];
    }
  }
}

uint64_t ____removeUnwantedAssets_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) assetExistsForKey:a2];
  if (result)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    unsigned int v5 = *(void **)(a1 + 32);
    return [v5 removeAssetForKey:a2];
  }
  return result;
}

uint64_t BOMStorageNewWithOptionsAndSys(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    uint64_t v3 = BomSys_default();
  }
  uint64_t v5 = (*((uint64_t (**)(void, uint64_t, uint64_t, uint64_t))v3 + 2))(*((void *)v3 + 1), a1, 1538, 420);
  if (v5 == -1)
  {
    uint64_t v8 = __error();
    strerror(*v8);
    _CUILog();
  }
  else
  {
    uint64_t v6 = v5;
    bzero(v9, 0x470uLL);
    int v10 = v6;
    uint64_t v11 = v3;
    if (!_WriteRootPage((uint64_t)v9))
    {
      (*((void (**)(void, uint64_t))v3 + 3))(*((void *)v3 + 1), v6);
      return BOMStorageOpenWithSys(a1, 1, v3);
    }
  }
  return 0;
}

uint64_t _WriteRootPage(uint64_t a1)
{
  if (a1) {
    uint64_t v2 = *(void *)(a1 + 1120);
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = 1;
  unsigned int v4 = BOMStreamWithFileAndSys(*(_DWORD *)(a1 + 1028), 0, 0x200uLL, 1, 0, (long long *)v2);
  if (v4)
  {
    uint64_t v11 = (uint64_t (*)(void *))v4;
    BOMStreamWriteUInt32((uint64_t (*)(void *))v4, 1112493395, v5, v6, v7, v8, v9, v10);
    BOMStreamWriteUInt32(v11, 1953460837, v12, v13, v14, v15, v16, v17);
    BOMStreamWriteUInt32(v11, 1, v18, v19, v20, v21, v22, v23);
    BOMStreamWriteUInt32(v11, *(unsigned int *)(a1 + 1056), v24, v25, v26, v27, v28, v29);
    BOMStreamWriteUInt32(v11, *(unsigned int *)(a1 + 1060), v30, v31, v32, v33, v34, v35);
    BOMStreamWriteUInt32(v11, *(unsigned int *)(a1 + 1064), v36, v37, v38, v39, v40, v41);
    BOMStreamWriteUInt32(v11, *(unsigned int *)(a1 + 1096), v42, v43, v44, v45, v46, v47);
    BOMStreamWriteUInt32(v11, *(unsigned int *)(a1 + 1100), v48, v49, v50, v51, v52, v53);
    uint64_t v3 = BOMStreamFree((uint64_t)v11, v54, v55, v56, v57, v58, v59, v60);
    if ((*(unsigned int (**)(void, void))(v2 + 64))(*(void *)(v2 + 8), *(unsigned int *)(a1 + 1028)))
    {
      v61 = __error();
      strerror(*v61);
      _CUILog();
      return 1;
    }
  }
  return v3;
}

uint64_t BOMStorageOpenWithSys(uint64_t a1, int a2, long long *a3)
{
  uint64_t v3 = a3;
  uint64_t v209 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    uint64_t v3 = BomSys_default();
  }
  long long v203 = 0u;
  long long v204 = 0u;
  long long v202 = 0u;
  memset(v201, 0, sizeof(v201));
  uint64_t v6 = (*((uint64_t (**)(void, uint64_t, void, uint64_t))v3 + 2))(*((void *)v3 + 1), a1, 2 * (a2 != 0), 420);
  if (v6 != -1)
  {
    uint64_t v7 = v6;
    if ((*((unsigned int (**)(void, uint64_t, _OWORD *))v3 + 9))(*((void *)v3 + 1), v6, v201) != -1)
    {
      uint64_t v8 = BOMStreamWithFileAndSys(v7, 0, 0x200uLL, 0, 0, v3);
      if (!v8)
      {
        v122 = __error();
        strerror(*v122);
        v130 = BOMExceptionHandlerMessage("can't read from: '%s' %s", v123, v124, v125, v126, v127, v128, v129, a1);
        int v88 = *__error();
        v89 = v130;
        int v90 = 286;
        goto LABEL_18;
      }
      uint64_t v16 = (uint64_t)v8;
      if (BOMStreamReadUInt32((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15) == 1112493395
        && BOMStreamReadUInt32(v16, v17, v18, v19, v20, v21, v22, v23) == 1953460837)
      {
        if (BOMStreamReadUInt32(v16, v17, v18, v19, v20, v21, v22, v23) == 1)
        {
          uint64_t v31 = BOM_malloczero(0x470uLL);
          uint64_t v39 = (uint64_t)v31;
          if (!v31)
          {
            v133 = __error();
            char v134 = strerror(*v133);
            v142 = BOMExceptionHandlerMessage("malloc: %s", v135, v136, v137, v138, v139, v140, v141, v134);
            v143 = __error();
            _BOMExceptionHandlerCall(v142, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 317, *v143);
            BOMStreamFree(v16, v144, v145, v146, v147, v148, v149, v150);
            (*((void (**)(void, uint64_t))v3 + 3))(*((void *)v3 + 1), v7);
            return v39;
          }
          v31[140] = v3;
          *((_DWORD *)v31 + 257) = v7;
          int v40 = v202;
          *((_DWORD *)v31 + 258) = v202;
          *((_DWORD *)v31 + 259) = v40;
          *((_DWORD *)v31 + 263) = *((_DWORD *)v31 + 263) & 0xFFFFFFF6 | a2 & 1;
          *((_DWORD *)v31 + 264) = BOMStreamReadUInt32(v16, v32, v33, v34, v35, v36, v37, v38);
          *(_DWORD *)(v39 + 1060) = BOMStreamReadUInt32(v16, v41, v42, v43, v44, v45, v46, v47);
          *(_DWORD *)(v39 + 1064) = BOMStreamReadUInt32(v16, v48, v49, v50, v51, v52, v53, v54);
          *(_DWORD *)(v39 + 1096) = BOMStreamReadUInt32(v16, v55, v56, v57, v58, v59, v60, v61);
          *(_DWORD *)(v39 + 1100) = BOMStreamReadUInt32(v16, v62, v63, v64, v65, v66, v67, v68);
          *(_DWORD *)(v39 + 1052) &= ~4u;
          *(void *)(v39 + 1128) = 0;
          BOMStreamFree(v16, v69, v70, v71, v72, v73, v74, v75);
          int v83 = *(_DWORD *)(v39 + 1060);
          int v84 = *(_DWORD *)(v39 + 1064);
          BOOL v85 = __CFADD__(v84, v83);
          unsigned int v86 = v84 + v83;
          if (v85)
          {
            v87 = BOMExceptionHandlerMessage("%s: stream invalid; overflow of admin offset+size",
                    v76,
                    v77,
                    v78,
                    v79,
                    v80,
                    v81,
                    v82,
                    a1);
            int v88 = *__error();
            v89 = v87;
            int v90 = 344;
          }
          else
          {
            uint64_t v151 = *(unsigned int *)(v39 + 1032);
            if (v86 <= v151)
            {
              int v153 = *(_DWORD *)(v39 + 1096);
              int v154 = *(_DWORD *)(v39 + 1100);
              BOOL v85 = __CFADD__(v154, v153);
              unsigned int v155 = v154 + v153;
              if (v85)
              {
                v156 = BOMExceptionHandlerMessage("%s: stream invalid; overflow of toc offset+size",
                         v76,
                         v151,
                         v78,
                         v79,
                         v80,
                         v81,
                         v82,
                         a1);
                int v88 = *__error();
                v89 = v156;
                int v90 = 358;
              }
              else
              {
                if (v155 <= v151)
                {
                  if (a2)
                  {
                    if (v151 <= 0x800) {
                      unsigned int v158 = 2048;
                    }
                    else {
                      unsigned int v158 = *(_DWORD *)(v39 + 1032);
                    }
                    *(_DWORD *)(v39 + 1048) = v158;
                    _CreateMapAddress(v39, v158);
                    uint64_t v159 = *(void *)(v39 + 1040);
                    if (!v159) {
                      goto LABEL_19;
                    }
                    *(_DWORD *)(v39 + 1052) |= 0xAu;
                    uint64_t v160 = *(unsigned int *)(v39 + 1096);
                    if (v160)
                    {
                      v161 = BOMStreamWithFileAndSys(*(_DWORD *)(v39 + 1028), v160, *(unsigned int *)(v39 + 1100), 0, (char *)(v159 + v160), v3);
                      if (!v161) {
                        goto LABEL_19;
                      }
                      BOMStreamFree((uint64_t)v161, v162, v163, v164, v165, v166, v167, v168);
                    }
                  }
                  else
                  {
                    v169 = (uint64_t (*)(void, void))*((void *)v3 + 12);
                    if (!v169) {
                      goto LABEL_48;
                    }
                    uint64_t v170 = v169(*((void *)v3 + 1), 0);
                    if (CUILogRenditionLogEnabled())
                    {
                      v171 = CUILogHandle();
                      if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136446466;
                        uint64_t v206 = a1;
                        __int16 v207 = 2050;
                        uint64_t v208 = v170;
                        _os_log_impl(&dword_1DC6CA000, v171, OS_LOG_TYPE_INFO, "CoreUI %{public}s %{public}p", buf, 0x16u);
                      }
                    }
                    if (v170 == -1)
                    {
LABEL_48:
                      *(_DWORD *)(v39 + 1048) = 0;
                      *(void *)(v39 + 1040) = 0;
                      *(_DWORD *)(v39 + 1052) &= ~2u;
                      __error();
                      _CUILog();
                    }
                    else
                    {
                      (*(void (**)(void, void))(*(void *)(v39 + 1120) + 24))(*(void *)(*(void *)(v39 + 1120) + 8), *(unsigned int *)(v39 + 1028));
                      *(_DWORD *)(v39 + 1028) = -1;
                      int v172 = *(_DWORD *)(v39 + 1052);
                      *(_DWORD *)(v39 + 1048) = *(_DWORD *)(v39 + 1032);
                      *(void *)(v39 + 1040) = v170;
                      *(_DWORD *)(v39 + 1052) = v172 | 0xA;
                      uint64_t v173 = *(unsigned int *)(v39 + 1060);
                      if (v173) {
                        madvise((void *)(v170 + v173), *(unsigned int *)(v39 + 1064), 3);
                      }
                      uint64_t v174 = *(unsigned int *)(v39 + 1096);
                      if (v174) {
                        madvise((void *)(*(void *)(v39 + 1040) + v174), *(unsigned int *)(v39 + 1100), 3);
                      }
                    }
                  }
                  _CreateBlockTable((void *)v39);
                  uint64_t v175 = *(unsigned int *)(v39 + 1060);
                  if (v175)
                  {
                    if (!a2 && (*(unsigned char *)(v39 + 1052) & 2) != 0)
                    {
                      uint64_t v177 = BOMStreamWithAddress(*(void *)(v39 + 1040) + v175, *(unsigned int *)(v39 + 1064), 0);
                    }
                    else
                    {
                      v176 = (char *)BOM_malloczero(*(unsigned int *)(v39 + 1064));
                      *(void *)(v39 + 1128) = v176;
                      if (!v176)
                      {
                        v185 = __error();
                        strerror(*v185);
                        _CUILog();
                        return 0;
                      }
                      uint64_t v177 = (uint64_t)BOMStreamWithFileAndSys(v7, *(unsigned int *)(v39 + 1060), *(unsigned int *)(v39 + 1064), 0, v176, v3);
                    }
                    uint64_t v186 = v177;
                    if (!v177)
                    {
                      v200 = BOMExceptionHandlerMessage("can't read from %s unable to create a BOMStream", v178, v179, v180, v181, v182, v183, v184, a1);
                      int v88 = *__error();
                      v89 = v200;
                      int v90 = 452;
                      goto LABEL_18;
                    }
                    if (_ReadBlockTable(v39, v177, v179, v180, v181, v182, v183, v184)
                      || _ReadFreeList(v39, v186, v187, v188, v189, v190, v191, v192))
                    {
                      goto LABEL_19;
                    }
                    BOMStreamFree(v186, v193, v194, v195, v196, v197, v198, v199);
                  }
                  else
                  {
                    *(void *)(v39 + 1088) = _BOMFreeListAllocate();
                  }
                  __strlcpy_chk();
                  return v39;
                }
                v157 = BOMExceptionHandlerMessage("%s: stream invalid; toc range is outside of file",
                         v76,
                         v151,
                         v78,
                         v79,
                         v80,
                         v81,
                         v82,
                         a1);
                int v88 = *__error();
                v89 = v157;
                int v90 = 365;
              }
            }
            else
            {
              v152 = BOMExceptionHandlerMessage("%s: stream invalid; admin range is outside of file",
                       v76,
                       v151,
                       v78,
                       v79,
                       v80,
                       v81,
                       v82,
                       a1);
              int v88 = *__error();
              v89 = v152;
              int v90 = 351;
            }
          }
LABEL_18:
          _BOMExceptionHandlerCall(v89, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v90, v88);
          goto LABEL_19;
        }
        v132 = BOMExceptionHandlerMessage("%s has an unknown version: 0x%X", v24, v25, v26, v27, v28, v29, v30, a1);
        int v112 = *__error();
        v113 = v132;
        int v114 = 307;
      }
      else
      {
        v111 = BOMExceptionHandlerMessage("%s is not a BOMStorage file\n", v17, v18, v19, v20, v21, v22, v23, a1);
        int v112 = *__error();
        v113 = v111;
        int v114 = 293;
      }
      _BOMExceptionHandlerCall(v113, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v114, v112);
      BOMStreamFree(v16, v115, v116, v117, v118, v119, v120, v121);
LABEL_19:
      (*((void (**)(void, uint64_t))v3 + 3))(*((void *)v3 + 1), v7);
      return 0;
    }
    v101 = __error();
    char v102 = strerror(*v101);
    v110 = BOMExceptionHandlerMessage("fstat: %s", v103, v104, v105, v106, v107, v108, v109, v102);
    int v88 = *__error();
    v89 = v110;
    int v90 = 277;
    goto LABEL_18;
  }
  v91 = __error();
  strerror(*v91);
  v99 = BOMExceptionHandlerMessage("can't open: '%s' %s", v92, v93, v94, v95, v96, v97, v98, a1);
  v100 = __error();
  _BOMExceptionHandlerCall(v99, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 270, *v100);
  return 0;
}

uint64_t _CreateMapAddress(uint64_t a1, unsigned int a2)
{
  unint64_t v3 = (unint64_t)a2 % *MEMORY[0x1E4F14B00];
  if (v3) {
    int v4 = *MEMORY[0x1E4F14B00] - v3;
  }
  else {
    int v4 = 0;
  }
  uint64_t v5 = v4 + a2;
  uint64_t result = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(a1 + 1120)
                                                                                                 + 96))(*(void *)(*(void *)(a1 + 1120) + 8), 0, v5, 3, 4098, 0xFFFFFFFFLL, 0);
  *(void *)(a1 + 1040) = result;
  if (result == -1)
  {
    uint64_t v7 = __error();
    strerror(*v7);
    uint64_t result = _CUILog();
    *(void *)(a1 + 1040) = 0;
  }
  *(_DWORD *)(a1 + 1048) = v5;
  return result;
}

void *_CreateBlockTable(void *result)
{
  if (*((unsigned char *)result + 1052))
  {
    uint64_t v1 = result;
    result[134] = BOM_malloczero(0x800uLL);
    uint64_t result = BOM_malloczero(0x400uLL);
    v1[135] = result;
    *((_DWORD *)v1 + 267) = 256;
  }
  return result;
}

uint64_t _ReadBlockTable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = BOMStreamReadUInt32(a2, a2, a3, a4, a5, a6, a7, a8);
  if (result)
  {
    int v18 = result;
    if (result >> 29 || (unint64_t v11 = 8 * result, v11 > *(unsigned int *)(a1 + 1064)))
    {
      uint64_t v19 = BOMExceptionHandlerMessage("bad value for block table count", v11, v12, v13, v14, v15, v16, v17, v40);
      uint64_t v20 = __error();
      _BOMExceptionHandlerCall(v19, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1594, *v20);
      return 1;
    }
    else if (*(unsigned char *)(a1 + 1052))
    {
      uint64_t v22 = result;
      _ExpandBlockTable((char *)a1, result);
      uint64_t v30 = 0;
      uint64_t v31 = 4 * v22;
      uint64_t v32 = 4;
      do
      {
        *(_DWORD *)(*(void *)(a1 + 1072) + v32 - 4) = BOMStreamReadUInt32(a2, v23, v24, v25, v26, v27, v28, v29);
        *(_DWORD *)(*(void *)(a1 + 1072) + v32) = BOMStreamReadUInt32(a2, v33, v34, v35, v36, v37, v38, v39);
        *(unsigned char *)(*(void *)(a1 + 1080) + v30) &= ~1u;
        v32 += 8;
        v30 += 4;
      }
      while (v31 != v30);
      return 0;
    }
    else
    {
      uint64_t DataPointer = BOMStreamGetDataPointer(a2, v11);
      uint64_t result = 0;
      *(void *)(a1 + 1072) = DataPointer;
      *(_DWORD *)(a1 + 1068) = v18;
    }
  }
  return result;
}

uint64_t _ReadFreeList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(unsigned char *)(a1 + 1052) & 1) == 0)
  {
    uint64_t v9 = _BOMFreeListAllocate();
    uint64_t result = 0;
    *(void *)(a1 + 1088) = v9;
    return result;
  }
  int UInt32 = BOMStreamReadUInt32(a2, a2, a3, a4, a5, a6, a7, a8);
  *(void *)(a1 + 1088) = _BOMFreeListAllocate();
  if (!UInt32) {
    return 0;
  }
  size_t v20 = (8 * UInt32);
  if ((int)v20 < 1)
  {
    uint64_t v31 = BOMExceptionHandlerMessage("_ReadFreeList: tring to read %d byte for freelist table.", v13, v14, v15, v16, v17, v18, v19, v20);
    uint64_t v32 = __error();
    _BOMExceptionHandlerCall(v31, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1723, *v32);
  }
  else
  {
    uint64_t v21 = BOM_malloc(v20);
    if (v21)
    {
      uint64_t v27 = v21;
      BOMStreamReadBuffer(a2, v21, v20, v22, v23, v24, v25, v26);
      uint64_t v28 = *(void *)(a1 + 1088);
      uint64_t v29 = *(void (**)(uint64_t, void *, size_t, BOOL))(v28 + 16);
      BOOL v30 = BOMStreamGetByteOrder(a2) == 1;
      v29(v28, v27, v20, v30);
      free(v27);
      return 0;
    }
  }
  return 1;
}

void *BOMStorageOpenInRAM(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 <= 0x1FF)
  {
    uint64_t v8 = BOMExceptionHandlerMessage("stream invalid; root page is outside of address range",
           a2,
           a3,
           a4,
           a5,
           a6,
           a7,
           a8,
           v155);
    int v9 = *__error();
    uint64_t v10 = v8;
    int v11 = 486;
    goto LABEL_14;
  }
  char v12 = a3;
  int v13 = a2;
  uint64_t v15 = BOMStreamWithAddress(a1, 512, 0);
  if (!v15)
  {
    uint64_t v105 = BOMExceptionHandlerMessage("can't read from memory %p", v16, v17, v18, v19, v20, v21, v22, a1);
    int v9 = *__error();
    uint64_t v10 = v105;
    int v11 = 494;
    goto LABEL_14;
  }
  uint64_t v23 = v15;
  if (BOMStreamReadUInt32(v15, v16, v17, v18, v19, v20, v21, v22) == 1112493395
    && BOMStreamReadUInt32(v23, v24, v25, v26, v27, v28, v29, v30) == 1953460837)
  {
    int UInt32 = BOMStreamReadUInt32(v23, v24, v25, v26, v27, v28, v29, v30);
    if (UInt32 == 1)
    {
      uint64_t v39 = BOM_malloczero(0x470uLL);
      if (!v39)
      {
        uint64_t v108 = __error();
        strerror(*v108);
        _CUILog();
        BOMStreamFree(v23, v109, v110, v111, v112, v113, v114, v115);
        return v39;
      }
      v39[140] = BomSys_default();
      *((_DWORD *)v39 + 257) = -1;
      *((_DWORD *)v39 + 258) = v13;
      *((_DWORD *)v39 + 259) = v13;
      *((_DWORD *)v39 + 263) = *((_DWORD *)v39 + 263) & 0xFFFFFFF6 | v12 & 1;
      *((_DWORD *)v39 + 264) = BOMStreamReadUInt32(v23, v40, v41, v42, v43, v44, v45, v46);
      *((_DWORD *)v39 + 265) = BOMStreamReadUInt32(v23, v47, v48, v49, v50, v51, v52, v53);
      *((_DWORD *)v39 + 266) = BOMStreamReadUInt32(v23, v54, v55, v56, v57, v58, v59, v60);
      *((_DWORD *)v39 + 274) = BOMStreamReadUInt32(v23, v61, v62, v63, v64, v65, v66, v67);
      *((_DWORD *)v39 + 275) = BOMStreamReadUInt32(v23, v68, v69, v70, v71, v72, v73, v74);
      *((_DWORD *)v39 + 263) |= 6u;
      BOMStreamFree(v23, v75, v76, v77, v78, v79, v80, v81);
      int v89 = *((_DWORD *)v39 + 265);
      int v90 = *((_DWORD *)v39 + 266);
      BOOL v91 = __CFADD__(v90, v89);
      unsigned int v92 = v90 + v89;
      if (v91)
      {
        uint64_t v93 = BOMExceptionHandlerMessage(" <memory>: stream invalid; overflow of admin offset+size",
                v82,
                v83,
                v84,
                v85,
                v86,
                v87,
                v88,
                v155);
        int v9 = *__error();
        uint64_t v10 = v93;
        int v11 = 549;
      }
      else
      {
        unsigned int v116 = *((_DWORD *)v39 + 258);
        if (v92 <= v116)
        {
          int v118 = *((_DWORD *)v39 + 274);
          int v119 = *((_DWORD *)v39 + 275);
          BOOL v91 = __CFADD__(v119, v118);
          unsigned int v120 = v119 + v118;
          if (v91)
          {
            uint64_t v121 = BOMExceptionHandlerMessage("<memory>: stream invalid; overflow of toc offset+size",
                     v82,
                     v83,
                     v84,
                     v85,
                     v86,
                     v87,
                     v88,
                     v155);
            int v9 = *__error();
            uint64_t v10 = v121;
            int v11 = 561;
          }
          else
          {
            if (v120 <= v116)
            {
              *((_DWORD *)v39 + 262) = v116;
              v39[130] = a1;
              _CreateBlockTable(v39);
              uint64_t v123 = *((unsigned int *)v39 + 265);
              if (v123)
              {
                uint64_t v124 = BOMStreamWithAddress(v39[130] + v123, *((unsigned int *)v39 + 266), 0);
                if (!v124)
                {
                  uint64_t v145 = __error();
                  char v146 = strerror(*v145);
                  int v154 = BOMExceptionHandlerMessage("can't read from <memory>: %s", v147, v148, v149, v150, v151, v152, v153, v146);
                  int v9 = *__error();
                  uint64_t v10 = v154;
                  int v11 = 585;
                  goto LABEL_14;
                }
                uint64_t v131 = v124;
                if (_ReadBlockTable((uint64_t)v39, v124, v125, v126, v127, v128, v129, v130)
                  || _ReadFreeList((uint64_t)v39, v131, v132, v133, v134, v135, v136, v137))
                {
                  return 0;
                }
                BOMStreamFree(v131, v138, v139, v140, v141, v142, v143, v144);
              }
              else
              {
                v39[136] = _BOMFreeListAllocate();
              }
              __strlcpy_chk();
              return v39;
            }
            v122 = BOMExceptionHandlerMessage("<memory>: stream invalid; toc range is outside file",
                     v82,
                     v83,
                     v84,
                     v85,
                     v86,
                     v87,
                     v88,
                     v155);
            int v9 = *__error();
            uint64_t v10 = v122;
            int v11 = 567;
          }
        }
        else
        {
          uint64_t v117 = BOMExceptionHandlerMessage("<memory>: stream invalid; admin range is outside of file",
                   v82,
                   v83,
                   v84,
                   v85,
                   v86,
                   v87,
                   v88,
                   v155);
          int v9 = *__error();
          uint64_t v10 = v117;
          int v11 = 555;
        }
      }
LABEL_14:
      _BOMExceptionHandlerCall(v10, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v11, v9);
      return 0;
    }
    uint64_t v107 = BOMExceptionHandlerMessage("<memory> has an unknown version: 0x%X", v32, v33, v34, v35, v36, v37, v38, UInt32);
    int v95 = *__error();
    uint64_t v96 = v107;
    int v97 = 514;
  }
  else
  {
    uint64_t v94 = BOMExceptionHandlerMessage("%s is not a BOMStorage file", v24, v25, v26, v27, v28, v29, v30, (char)"<memory>");
    int v95 = *__error();
    uint64_t v96 = v94;
    int v97 = 501;
  }
  _BOMExceptionHandlerCall(v96, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v97, v95);
  BOMStreamFree(v23, v98, v99, v100, v101, v102, v103, v104);
  return 0;
}

uint64_t BOMStorageFree(unsigned char *a1)
{
  if (!a1) {
    return 1;
  }
  if ((a1[1052] & 0x10) != 0 && BOMStorageCommit((uint64_t)a1)) {
    return 1;
  }
  unint64_t v3 = (void *)*((void *)a1 + 134);
  if (v3)
  {
    if (a1[1052])
    {
      free(v3);
      int v4 = (void *)*((void *)a1 + 135);
      if (v4) {
        free(v4);
      }
    }
  }
  uint64_t v5 = (void (**)(void))*((void *)a1 + 136);
  if (v5)
  {
    v5[4](*((void *)a1 + 136));
    free(v5);
  }
  if (*((void *)a1 + 130))
  {
    if ((*((_DWORD *)a1 + 263) & 8) != 0)
    {
      int v6 = *((_DWORD *)a1 + 263) & 3;
      int v7 = (*(uint64_t (**)(void))(*((void *)a1 + 140) + 104))(*(void *)(*((void *)a1 + 140) + 8));
      if (v6 != 2 && v7 == -1)
      {
        uint64_t v8 = __error();
        _BOMExceptionHandlerCall("munmap failed", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1505, *v8);
      }
    }
  }
  if (*((_DWORD *)a1 + 257) != -1) {
    (*(void (**)(void))(*((void *)a1 + 140) + 24))(*(void *)(*((void *)a1 + 140) + 8));
  }
  int v9 = (void *)*((void *)a1 + 141);
  if (v9) {
    free(v9);
  }
  free(a1);
  return 0;
}

uint64_t BOMStorageCommit(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  int v2 = *(_DWORD *)(a1 + 1052);
  if ((v2 & 0x10) == 0) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 1028) == -1)
  {
    BOOL v3 = 0;
    *(_DWORD *)(a1 + 1036) = *(_DWORD *)(a1 + 1032);
    goto LABEL_8;
  }
  _FlushWriteCache(a1);
  if (_AdjustFileSize(a1, 0, 0)) {
    return 1;
  }
  uint64_t v5 = *(void *)(a1 + 1088);
  int v6 = 8 * (*(_DWORD *)(a1 + 1068) + *(_DWORD *)(v5 + 8));
  size_t v7 = (v6 + 24);
  if (v6 == -24)
  {
    unsigned int v8 = 0;
  }
  else
  {
    unsigned int v8 = (*(uint64_t (**)(uint64_t, void))(v5 + 48))(v5, (v6 + 39) & 0xFFFFFFF0);
    if (!v8) {
      unsigned int v8 = (*(_DWORD *)(a1 + 1032) + 15) & 0xFFFFFFF0;
    }
  }
  int v9 = *(_DWORD *)(a1 + 1060);
  int v10 = *(_DWORD *)(a1 + 1064);
  *(_DWORD *)(a1 + 1060) = v8;
  *(_DWORD *)(a1 + 1064) = v7;
  if (v9 && v10) {
    (*(void (**)(void))(*(void *)(a1 + 1088) + 40))();
  }
  uint64_t v11 = v8;
  BOOL v3 = 1;
  char v12 = BOMStreamWithFile(*(_DWORD *)(a1 + 1028), v11, v7, 1, 0);
  if (v12)
  {
    uint64_t v19 = (uint64_t (*)(void *))v12;
    uint64_t v20 = *(unsigned int *)(a1 + 1068);
    BOMStreamWriteUInt32((uint64_t (*)(void *))v12, v20, v13, v14, v15, v16, v17, v18);
    if (v20)
    {
      uint64_t v27 = 0;
      unint64_t v28 = 0;
      do
      {
        if (v28 >= *(unsigned int *)(a1 + 1068))
        {
          _CUILog();
          uint64_t v31 = 0xFFFFFFFFLL;
        }
        else
        {
          unsigned int v29 = *(_DWORD *)(*(void *)(a1 + 1072) + v27);
          unsigned int v30 = bswap32(v29);
          if (*(unsigned char *)(a1 + 1052)) {
            uint64_t v31 = v29;
          }
          else {
            uint64_t v31 = v30;
          }
        }
        BOMStreamWriteUInt32(v19, v31, v21, v22, v23, v24, v25, v26);
        if (v28 >= *(unsigned int *)(a1 + 1068))
        {
          _CUILog();
          uint64_t v40 = 0;
        }
        else
        {
          unsigned int v38 = *(_DWORD *)(*(void *)(a1 + 1072) + v27 + 4);
          unsigned int v39 = bswap32(v38);
          if (*(unsigned char *)(a1 + 1052)) {
            uint64_t v40 = v38;
          }
          else {
            uint64_t v40 = v39;
          }
        }
        BOMStreamWriteUInt32(v19, v40, v32, v33, v34, v35, v36, v37);
        ++v28;
        v27 += 8;
      }
      while (8 * v20 != v27);
    }
    BOMStreamWriteUInt32(v19, *(unsigned int *)(*(void *)(a1 + 1088) + 8), v21, v22, v23, v24, v25, v26);
    size_t __len = 0;
    uint64_t v41 = *(void *)(a1 + 1088);
    uint64_t v42 = *(uint64_t (**)(uint64_t, BOOL, size_t *))(v41 + 24);
    BOOL v43 = BOMStreamGetByteOrder((uint64_t)v19) == 1;
    uint64_t v44 = (void *)v42(v41, v43, &__len);
    BOMStreamWriteBuffer((uint64_t)v19, v44, __len, v45, v46, v47, v48, v49);
    free(v44);
    int v57 = BOMStreamFree((uint64_t)v19, v50, v51, v52, v53, v54, v55, v56);
    if (_AdjustFileSize(a1, 0, 0)) {
      return 1;
    }
    *(_DWORD *)(a1 + 1036) = *(_DWORD *)(a1 + 1032);
    BOOL v3 = (_WriteRootPage(a1) | v57) != 0;
    int v2 = *(_DWORD *)(a1 + 1052);
LABEL_8:
    *(_DWORD *)(a1 + 1052) = v2 & 0xFFFFFFEF;
  }
  return v3;
}

uint64_t BOMStorageGetSys(uint64_t result)
{
  if (result) {
    return *(void *)(result + 1120);
  }
  return result;
}

uint64_t BOMStorageIsOpenForWriting(uint64_t result)
{
  if (result) {
    return *(unsigned char *)(result + 1052) & 1;
  }
  return result;
}

BOOL BOMStorageMemoryMapped(BOOL result)
{
  if (result) {
    return (*(_DWORD *)(result + 1052) & 6) == 2;
  }
  return result;
}

uint64_t BOMStorageNewBlock(uint64_t a1)
{
  if (!a1 || (*(unsigned char *)(a1 + 1052) & 1) == 0) {
    return 0;
  }
  uint64_t v1 = (*(_DWORD *)(a1 + 1056) + 1);
  *(_DWORD *)(a1 + 1056) = v1;
  unsigned int v3 = *(_DWORD *)(a1 + 1068);
  if (v1 >= v3) {
    _ExpandBlockTable((char *)a1, v3 + 8);
  }
  return v1;
}

char *_ExpandBlockTable(char *result, unsigned int a2)
{
  int v2 = result;
  uint64_t v3 = *((unsigned int *)result + 267);
  if (v3 < a2)
  {
    *((void *)result + 134) = BOM_realloczero(*((void **)result + 134), 8 * v3, 8 * a2);
    uint64_t result = BOM_realloczero(*((void **)v2 + 135), 4 * *((unsigned int *)v2 + 267), 4 * a2);
    *((void *)v2 + 135) = result;
    *((_DWORD *)v2 + 267) = a2;
  }
  if (!*((void *)v2 + 134) || !*((void *)v2 + 135))
  {
    int v5 = *__error();
    return (char *)_BOMExceptionHandlerCall("Out of memory.", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1672, v5);
  }
  return result;
}

uint64_t BOMStorageNewNamedBlock(uint64_t a1, const char *a2)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
    return 0;
  }
  if (_tocGet(a1, a2))
  {
    _CUILog();
    return 0;
  }
  uint64_t v4 = BOMStorageNewBlock(a1);
  unsigned int v6 = strnlen(a2, 0xFFuLL);
  unsigned int v7 = v6;
  if (v6 < 0xFF)
  {
    if (*(_DWORD *)(a1 + 1096)) {
      int v8 = *(_DWORD *)(a1 + 1100);
    }
    else {
      int v8 = 4;
    }
    unsigned int v9 = v6 + v8;
    unsigned int v10 = v9 + 5;
    if (v9 == -5)
    {
      unsigned int v11 = 0;
    }
    else
    {
      unsigned int v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 1088) + 48))();
      if (!v11) {
        unsigned int v11 = (*(_DWORD *)(a1 + 1032) + 15) & 0xFFFFFFF0;
      }
    }
    _ExpandMapAddress(a1, v11 + v10);
    uint64_t v12 = *(unsigned int *)(a1 + 1096);
    if (v12)
    {
      uint64_t v13 = BOMStreamWithAddress(*(void *)(a1 + 1040) + v12, *(unsigned int *)(a1 + 1100), 0);
      if (!v13) {
        return v4;
      }
      uint64_t v21 = v13;
      int UInt32 = BOMStreamReadUInt32(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      int UInt32 = 0;
      uint64_t v21 = 0;
    }
    uint64_t v23 = (uint64_t (*)(void *))BOMStreamWithAddress(*(void *)(a1 + 1040) + v11, v10, 1);
    if (v23)
    {
      unsigned int v30 = v23;
      size_t v31 = v7;
      BOMStreamWriteUInt32(v23, (UInt32 + 1), v24, v25, v26, v27, v28, v29);
      if (v21)
      {
        for (unsigned int i = v11; UInt32; --UInt32)
        {
          uint64_t v39 = BOMStreamReadUInt32(v21, v32, v33, v34, v35, v36, v37, v38);
          uint64_t UInt8 = BOMStreamReadUInt8(v21, v40, v41, v42, v43, v44, v45, v46);
          BOMStreamReadBuffer(v21, __dst, UInt8, v48, v49, v50, v51, v52);
          BOMStreamWriteUInt32(v30, v39, v53, v54, v55, v56, v57, v58);
          BOMStreamWriteUInt8(v30, UInt8, v59, v60, v61, v62, v63, v64);
          BOMStreamWriteBuffer((uint64_t)v30, __dst, UInt8, v65, v66, v67, v68, v69);
        }
        BOMStreamFree(v21, v32, v33, v34, v35, v36, v37, v38);
        if (*(_DWORD *)(a1 + 1096))
        {
          uint64_t v33 = *(unsigned int *)(a1 + 1100);
          if (v33) {
            (*(void (**)(void))(*(void *)(a1 + 1088) + 40))();
          }
        }
        unsigned int v11 = i;
        size_t v31 = v7;
      }
      BOMStreamWriteUInt32(v30, v4, v33, v34, v35, v36, v37, v38);
      BOMStreamWriteUInt8(v30, v7, v70, v71, v72, v73, v74, v75);
      BOMStreamWriteBuffer((uint64_t)v30, a2, v31, v76, v77, v78, v79, v80);
      BOMStreamFree((uint64_t)v30, v81, v82, v83, v84, v85, v86, v87);
      *(_DWORD *)(a1 + 1096) = v11;
      *(_DWORD *)(a1 + 1100) = v10;
      _AdjustFileSize(a1, v11, v10);
      if (*(_DWORD *)(a1 + 1028) != -1) {
        _AddToWriteCache(a1, v11, v10);
      }
      *(_DWORD *)(a1 + 1052) |= 0x10u;
    }
  }
  else
  {
    _CUILog();
  }
  return v4;
}

uint64_t _tocGet(uint64_t a1, const char *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 1096);
  if (!v4) {
    return 0;
  }
  size_t v5 = *(unsigned int *)(a1 + 1100);
  if (!v5) {
    return 0;
  }
  unsigned int v6 = (*(unsigned char *)(a1 + 1052) & 2) != 0
     ? (void *)BOMStreamWithAddress(*(void *)(a1 + 1040) + v4, *(unsigned int *)(a1 + 1100), 0)
     : BOMStreamWithFile(*(_DWORD *)(a1 + 1028), v4, v5, 0, 0);
  uint64_t v14 = (uint64_t)v6;
  if (!v6) {
    return 0;
  }
  int UInt32 = BOMStreamReadUInt32((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  if (UInt32)
  {
    int v23 = UInt32;
    while (1)
    {
      uint64_t v24 = BOMStreamReadUInt32(v14, v16, v17, v18, v19, v20, v21, v22);
      unsigned int UInt8 = BOMStreamReadUInt8(v14, v25, v26, v27, v28, v29, v30, v31);
      BOMStreamReadBuffer(v14, __s2, UInt8, v33, v34, v35, v36, v37);
      __s2[UInt8] = 0;
      if (!strncmp(a2, __s2, 0xFFuLL)) {
        break;
      }
      if (!--v23) {
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    uint64_t v24 = 0;
  }
  BOMStreamFree(v14, v16, v17, v18, v19, v20, v21, v22);
  unsigned int v38 = *(_DWORD *)(a1 + 1068);
  if (v24 <= v38) {
    uint64_t v39 = v24;
  }
  else {
    uint64_t v39 = 0;
  }
  int v40 = *(_DWORD *)(a1 + 1052);
  if ((v40 & 2) != 0 && (v40 & 1) == 0 && v39)
  {
    uint64_t v41 = *(void *)(a1 + 1040);
    if (v38 <= v39)
    {
      _CUILog();
      unsigned int v38 = *(_DWORD *)(a1 + 1068);
      uint64_t v42 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v42 = bswap32(*(_DWORD *)(*(void *)(a1 + 1072) + 8 * v39));
    }
    uint64_t v44 = (void *)(v41 + v42);
    if (v38 <= v39)
    {
      _CUILog();
      size_t v47 = 0;
    }
    else
    {
      unsigned int v45 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * v39 + 4);
      unsigned int v46 = bswap32(v45);
      if (*(unsigned char *)(a1 + 1052)) {
        size_t v47 = v45;
      }
      else {
        size_t v47 = v46;
      }
    }
    madvise(v44, v47, 3);
    return v24;
  }
  return v39;
}

uint64_t BOMStorageSizeOfBlock(uint64_t a1, unsigned int a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a1 + 1056) < a2) {
      return 0;
    }
    unsigned int v5 = *(_DWORD *)(a1 + 1068);
    if (v5 <= a2)
    {
      _CUILog();
      unsigned int v5 = *(_DWORD *)(a1 + 1068);
    }
    else
    {
      unsigned int v6 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2);
      unsigned int v7 = bswap32(v6);
      if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
        unsigned int v6 = v7;
      }
      if (v6 != -1)
      {
LABEL_16:
        if (v5 > a2)
        {
          unsigned int v10 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2 + 4);
          unsigned int v11 = bswap32(v10);
          if (*(unsigned char *)(a1 + 1052)) {
            return v10;
          }
          else {
            return v11;
          }
        }
        _CUILog();
        return 0;
      }
    }
    if (v5 <= a2)
    {
      _CUILog();
      unsigned int v5 = *(_DWORD *)(a1 + 1068);
    }
    else
    {
      unsigned int v8 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2 + 4);
      unsigned int v9 = bswap32(v8);
      if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
        unsigned int v8 = v9;
      }
      if (v8 == -1) {
        return 0;
      }
    }
    goto LABEL_16;
  }
  return result;
}

double BOMStorageFreeBlock(uint64_t a1, unsigned int a2)
{
  if (a1 && a2 && *(_DWORD *)(a1 + 1056) >= a2)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 1068);
    if (v4 <= a2)
    {
      _CUILog();
      unsigned int v4 = *(_DWORD *)(a1 + 1068);
      uint64_t v7 = 0xFFFFFFFFLL;
    }
    else
    {
      unsigned int v5 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2);
      unsigned int v6 = bswap32(v5);
      if (*(unsigned char *)(a1 + 1052)) {
        uint64_t v7 = v5;
      }
      else {
        uint64_t v7 = v6;
      }
    }
    if (v4 <= a2)
    {
      _CUILog();
LABEL_19:
      double result = NAN;
      *(void *)(*(void *)(a1 + 1072) + 8 * a2) = -1;
      return result;
    }
    unsigned int v9 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2 + 4);
    unsigned int v10 = bswap32(v9);
    if (*(unsigned char *)(a1 + 1052)) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v10;
    }
    if (v7 != -1 || v11 != -1)
    {
      if (v7)
      {
        if (v11) {
          (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 1088) + 40))(*(void *)(a1 + 1088), v7, v11);
        }
      }
      goto LABEL_19;
    }
  }
  return result;
}

void BOMStorageFreeNamedBlock(uint64_t a1, const char *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      unsigned int v4 = _tocGet(a1, a2);
      if (v4)
      {
        BOMStorageFreeBlock(a1, v4);
        if (*(_DWORD *)(a1 + 1096))
        {
          int v5 = strlen(a2);
          int v6 = *(_DWORD *)(a1 + 1100);
          if (v6)
          {
            unsigned int v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 1088) + 48))();
            if (!v7) {
              unsigned int v7 = (*(_DWORD *)(a1 + 1032) + 15) & 0xFFFFFFF0;
            }
          }
          else
          {
            unsigned int v7 = 0;
          }
          uint64_t v8 = (v6 - v5 - 5);
          _ExpandMapAddress(a1, v7 + v8);
          uint64_t v9 = BOMStreamWithAddress(*(void *)(a1 + 1040) + *(unsigned int *)(a1 + 1096), *(unsigned int *)(a1 + 1100), 0);
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = BOMStreamWithAddress(*(void *)(a1 + 1040) + v7, v8, 1);
            if (v11)
            {
              uint64_t v19 = (uint64_t (*)(void *))v11;
              int UInt32 = BOMStreamReadUInt32(v10, v12, v13, v14, v15, v16, v17, v18);
              BOMStreamWriteUInt32(v19, (UInt32 - 1), v21, v22, v23, v24, v25, v26);
              for (; UInt32; --UInt32)
              {
                uint64_t v34 = BOMStreamReadUInt32(v10, v27, v28, v29, v30, v31, v32, v33);
                size_t UInt8 = BOMStreamReadUInt8(v10, v35, v36, v37, v38, v39, v40, v41);
                BOMStreamReadBuffer(v10, __s1, UInt8, v43, v44, v45, v46, v47);
                __s1[UInt8] = 0;
                if (strcmp(__s1, a2))
                {
                  BOMStreamWriteUInt32(v19, v34, v28, v29, v30, v31, v32, v33);
                  BOMStreamWriteUInt8(v19, UInt8, v48, v49, v50, v51, v52, v53);
                  BOMStreamWriteBuffer((uint64_t)v19, __s1, UInt8, v54, v55, v56, v57, v58);
                }
              }
              BOMStreamFree(v10, v27, v28, v29, v30, v31, v32, v33);
              BOMStreamFree((uint64_t)v19, v59, v60, v61, v62, v63, v64, v65);
              if (*(_DWORD *)(a1 + 1096) && *(_DWORD *)(a1 + 1100)) {
                (*(void (**)(void))(*(void *)(a1 + 1088) + 40))();
              }
              *(_DWORD *)(a1 + 1096) = v7;
              *(_DWORD *)(a1 + 1100) = v8;
              _AdjustFileSize(a1, v7, v8);
              if (*(_DWORD *)(a1 + 1028) != -1) {
                _AddToWriteCache(a1, v7, v8);
              }
              *(_DWORD *)(a1 + 1052) |= 0x10u;
            }
          }
        }
      }
    }
  }
}

uint64_t BOMStorageCopyToBlock(uint64_t a1, uint64_t a2, const void *a3, size_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2 || *(_DWORD *)(a1 + 1056) < a2 || (*(unsigned char *)(a1 + 1052) & 1) == 0) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 1068) <= a2)
  {
    _CUILog();
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v13 = *(unsigned int *)(*(void *)(a1 + 1072) + 8 * a2 + 4);
  }

  return BOMStorageCopyToBlockRange(a1, a2, a3, a4, 0, v13, a7, a8);
}

uint64_t BOMStorageCopyToBlockRange(uint64_t a1, uint64_t a2, const void *a3, size_t a4, unint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = 1;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (*(_DWORD *)(a1 + 1056) >= a2 && (*(unsigned char *)(a1 + 1052) & 1) != 0)
      {
        unsigned int v15 = *(_DWORD *)(a1 + 1068);
        if (v15 <= a2)
        {
          uint64_t v68 = "unsigned int _getBlockTableAddr(BOMStorage, BOMBlockID)";
          _CUILog();
          unsigned int v15 = *(_DWORD *)(a1 + 1068);
          uint64_t v16 = 0xFFFFFFFFLL;
        }
        else
        {
          uint64_t v16 = *(unsigned int *)(*(void *)(a1 + 1072) + 8 * a2);
        }
        if (v15 <= v10)
        {
          uint64_t v68 = "unsigned int _getBlockTableSize(BOMStorage, BOMBlockID)";
          _CUILog();
          unsigned int v17 = 0;
        }
        else
        {
          unsigned int v17 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * v10 + 4);
          unsigned int v18 = bswap32(v17);
          if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
            unsigned int v17 = v18;
          }
        }
        unint64_t v19 = a6 + a5;
        unint64_t v20 = v17;
        size_t v21 = v17 - (a6 + a5);
        if (v17 < a6 + a5)
        {
          int v22 = *__error();
          uint64_t v23 = "BOMStorageCopyToBlockRange: length extends beyond block size";
          int v24 = 826;
          goto LABEL_31;
        }
        if (v17 <= a5) {
          unint64_t v25 = a5;
        }
        else {
          unint64_t v25 = v17;
        }
        unint64_t v26 = v25 + a4;
        if (((v25 + a4) | v25 | a4) >> 32)
        {
          uint64_t v27 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"BOMStorageCopyToBlockRange");
          int v22 = *__error();
          uint64_t v23 = v27;
          int v24 = 843;
          goto LABEL_31;
        }
        unint64_t v28 = v26 - a6;
        if ((v26 - a6) >> 32 || HIDWORD(a6))
        {
          uint64_t v33 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"BOMStorageCopyToBlockRange");
          int v22 = *__error();
          uint64_t v23 = v33;
          int v24 = 845;
          goto LABEL_31;
        }
        if (v20 != v28 || (unsigned int v29 = v16, v16 < *(_DWORD *)(a1 + 1036)))
        {
          if (v16 && v20)
          {
            unint64_t v30 = v28;
            (*(void (**)(void, uint64_t, unint64_t))(*(void *)(a1 + 1088) + 40))(*(void *)(a1 + 1088), v16, v20);
            unint64_t v28 = v30;
          }
          if (v28)
          {
            unint64_t v31 = v28;
            unsigned int v32 = (*(uint64_t (**)(void, void, const void *))(*(void *)(a1 + 1088) + 48))(*(void *)(a1 + 1088), (v28 + 15) & 0xFFFFFFF0, a3);
            unint64_t v28 = v31;
            unsigned int v29 = v32;
            if (!v32) {
              unsigned int v29 = (*(_DWORD *)(a1 + 1032) + 15) & 0xFFFFFFF0;
            }
          }
          else
          {
            unsigned int v29 = 0;
          }
          uint64_t v34 = (unsigned int *)(*(void *)(a1 + 1072) + 8 * v10);
          unsigned int *v34 = v29;
          v34[1] = v28;
        }
        uint64_t result = 0;
        if (v29 && v28)
        {
          unint64_t v69 = v28;
          unint64_t v35 = v28 + v29;
          if (HIDWORD(v35))
          {
            uint64_t v65 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", v35, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"BOMStorageCopyToBlockRange");
            int v22 = *__error();
            uint64_t v23 = v65;
            int v24 = 882;
          }
          else
          {
            if (_ExpandMapAddress(a1, v35)) {
              return 1;
            }
            uint64_t v43 = v29;
            uint64_t v44 = v16;
            if (a5
              && (v45 = *(void *)(a1 + 1040), (uint64_t v36 = (const void *)(v45 + v16)) != 0)
              && v45 + v29)
            {
              memmove((void *)(v45 + v29), v36, a5);
              uint64_t v44 = v16;
              uint64_t v43 = v29;
              unsigned int v46 = a5;
            }
            else
            {
              unsigned int v46 = 0;
            }
            uint64_t v47 = v19 + v44;
            if ((v19 | (v19 + v44)) >> 32)
            {
              uint64_t v48 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", (uint64_t)v36, v37, v38, v39, v40, v41, v42, (char)"BOMStorageCopyToBlockRange");
              int v22 = *__error();
              uint64_t v23 = v48;
              int v24 = 905;
            }
            else
            {
              uint64_t v49 = a5 + a4 + v43;
              if (!(((a5 + a4) | v49) >> 32))
              {
                if (v20 <= a5 || v29 < v16 || v29 >= (int)v20 + (int)v16)
                {
                  if (a4)
                  {
                    uint64_t v54 = a3;
                    unsigned int v55 = v46;
                    uint64_t v56 = v43;
                    uint64_t v57 = v47;
                    memmove((void *)(*(void *)(a1 + 1040) + v43 + v46), v54, a4);
                    uint64_t v47 = v57;
                    uint64_t v43 = v56;
                    unsigned int v46 = v55 + a4;
                  }
                  if (v46 < v69)
                  {
                    size_t v58 = v69 - v46;
                    if (HIDWORD(v58))
                    {
                      uint64_t v67 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", (uint64_t)v36, v37, v38, v39, v40, v41, v42, (char)"BOMStorageCopyToBlockRange");
                      int v22 = *__error();
                      uint64_t v23 = v67;
                      int v24 = 945;
                      goto LABEL_31;
                    }
                    unsigned int v59 = v46;
                    memmove((void *)(*(void *)(a1 + 1040) + v43 + v46), (const void *)(*(void *)(a1 + 1040) + v47), v58);
                    unsigned int v46 = v59 + v58;
                  }
                }
                else
                {
                  if (HIDWORD(v21))
                  {
                    uint64_t v66 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", (uint64_t)v36, v37, v38, v39, v40, v41, v42, (char)"BOMStorageCopyToBlockRange");
                    int v22 = *__error();
                    uint64_t v23 = v66;
                    int v24 = 917;
                    goto LABEL_31;
                  }
                  if (v21)
                  {
                    unsigned int v51 = v46;
                    uint64_t v52 = v43;
                    memmove((void *)(*(void *)(a1 + 1040) + v49), (const void *)(*(void *)(a1 + 1040) + v47), v21);
                    uint64_t v43 = v52;
                    unsigned int v46 = v51;
                  }
                  if (a4)
                  {
                    unsigned int v53 = v46;
                    memmove((void *)(*(void *)(a1 + 1040) + v43 + v46), a3, a4);
                    unsigned int v46 = v53 + a4;
                  }
                  v46 += v21;
                }
                uint64_t v60 = *(void *)(a1 + 1080);
                if (v60)
                {
                  *(unsigned char *)(v60 + 4 * v10) |= 1u;
                }
                else
                {
                  unsigned int v61 = v46;
                  uint64_t v62 = BOMExceptionHandlerMessage("BOM blockShadowTable is null", (uint64_t)v36, v37, v38, v39, v40, v41, v42, (char)v68);
                  uint64_t v63 = __error();
                  _BOMExceptionHandlerCall(v62, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 957, *v63);
                  unsigned int v46 = v61;
                }
                int v64 = v69;
                if (v46 == v69)
                {
                  if (*(_DWORD *)(a1 + 1028) == -1)
                  {
                    if (v29 + v69 > *(_DWORD *)(a1 + 1032)) {
                      *(_DWORD *)(a1 + 1032) = v29 + v69;
                    }
                  }
                  else
                  {
                    _AddToWriteCache(a1, v29, v69);
                    int v64 = v69;
                  }
                  uint64_t result = _AdjustFileSize(a1, v29, v64);
                  if (!result)
                  {
                    *(_DWORD *)(a1 + 1052) |= 0x10u;
                    return result;
                  }
                  return 1;
                }
                int v22 = *__error();
                uint64_t v23 = "BOMStorageCopyToBlockRange: internal consistency error";
                int v24 = 962;
                goto LABEL_31;
              }
              uint64_t v50 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", (uint64_t)v36, v37, v38, v39, v40, v41, v42, (char)"BOMStorageCopyToBlockRange");
              int v22 = *__error();
              uint64_t v23 = v50;
              int v24 = 906;
            }
          }
LABEL_31:
          _BOMExceptionHandlerCall(v23, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v24, v22);
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t _ExpandMapAddress(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 1048);
  if (v3 < a2)
  {
    if (v3 >= 0x100000) {
      LODWORD(v4) = v3 + 0x100000;
    }
    else {
      LODWORD(v4) = 2 * v3;
    }
    if (v4 <= a2) {
      unint64_t v4 = a2;
    }
    else {
      unint64_t v4 = v4;
    }
    unint64_t v5 = v4 % *MEMORY[0x1E4F14B00];
    int v6 = *MEMORY[0x1E4F14B00] - v5;
    if (!v5) {
      int v6 = 0;
    }
    uint64_t v7 = (v6 + v4);
    vm_address_t v8 = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(a1 + 1120)
                                                                                               + 96))(*(void *)(*(void *)(a1 + 1120) + 8), 0, v7, 3, 4098, 0xFFFFFFFFLL, 0);
    if (v8 == -1)
    {
      int v13 = *__error();
      uint64_t v14 = "mmap failed";
      uint64_t v12 = 1;
      int v15 = 1531;
    }
    else
    {
      vm_address_t v9 = v8;
      if (vm_copy(*MEMORY[0x1E4F14960], *(void *)(a1 + 1040), *(unsigned int *)(a1 + 1048), v8))
      {
        unsigned int v10 = __error();
        _BOMExceptionHandlerCall("vm_copy failed", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1535, *v10);
      }
      if ((*(unsigned int (**)(void, void, void))(*(void *)(a1 + 1120) + 104))(*(void *)(*(void *)(a1 + 1120) + 8), *(void *)(a1 + 1040), *(unsigned int *)(a1 + 1048)) != -1)
      {
        *(void *)(a1 + 1040) = v9;
        *(_DWORD *)(a1 + 1048) = v7;
        if (!v9) {
          goto LABEL_17;
        }
        return 0;
      }
      int v13 = *__error();
      uint64_t v14 = "munmap failed";
      uint64_t v12 = 1;
      int v15 = 1538;
    }
    _BOMExceptionHandlerCall(v14, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v15, v13);
    return v12;
  }
  if (!*(void *)(a1 + 1040))
  {
LABEL_17:
    uint64_t v11 = __error();
    _BOMExceptionHandlerCall("Out of memory.", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1551, *v11);
  }
  return 0;
}

void _AddToWriteCache(uint64_t a1, unsigned int a2, int a3)
{
  if (!a2 || !a3) {
    return;
  }
  unint64_t v5 = *(_DWORD **)(a1 + 1104);
  if (!v5)
  {
    *(void *)(a1 + 1104) = _newFreeListEntry(a2, a3);
    int v11 = 1;
LABEL_23:
    *(_DWORD *)(a1 + 1112) = v11;
LABEL_24:
    if (*(_DWORD *)(a1 + 1112) < 0x10u)
    {
      uint64_t v14 = *(_DWORD **)(a1 + 1104);
      if (v14)
      {
        int v15 = 0;
        do
        {
          unsigned int v16 = v14[3];
          if (v16 < 0xFFFF)
          {
            unsigned int v17 = *(_DWORD **)v14;
            int v15 = v14;
          }
          else
          {
            unsigned int v17 = *(_DWORD **)v14;
            if (v15)
            {
              void *v15 = v17;
              unsigned int v17 = *(_DWORD **)v14;
            }
            else
            {
              *(void *)(a1 + 1104) = v17;
            }
            _WriteAddress(a1, v14[2], v16);
            free(v14);
            --*(_DWORD *)(a1 + 1112);
          }
          uint64_t v14 = v17;
        }
        while (v17);
      }
    }
    else
    {
      _FlushWriteCache(a1);
    }
    return;
  }
  unsigned int v6 = v5[2];
  if (v6 <= a2)
  {
    while (1)
    {
      uint64_t v7 = v5;
      unint64_t v5 = *(_DWORD **)v5;
      if (!v5) {
        break;
      }
      unsigned int v8 = v5[2];
      if (v8 >= a2)
      {
        int v10 = v7[3];
        if (v10 + v7[2] != a2) {
          goto LABEL_6;
        }
        v7[3] = v10 + a3;
        if (a3 + a2 == v5[2])
        {
          v7[3] = v5[3] + v10 + a3;
          *(void *)uint64_t v7 = *(void *)v5;
          free(v5);
          int v11 = *(_DWORD *)(a1 + 1112) - 1;
          goto LABEL_23;
        }
        goto LABEL_24;
      }
    }
    int v13 = v7[3];
    if (v13 + v7[2] == a2)
    {
      v7[3] = v13 + a3;
      goto LABEL_24;
    }
    uint64_t v12 = _newFreeListEntry(a2, a3);
    if (v12)
    {
      *(void *)uint64_t v12 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v7 = 0;
    unsigned int v8 = v5[2];
LABEL_6:
    if (a3 + a2 == v8)
    {
      int v9 = v5[3] + a3;
      v5[2] = a2;
      v5[3] = v9;
      goto LABEL_24;
    }
    uint64_t v12 = _newFreeListEntry(a2, a3);
    if (v12)
    {
      *(void *)uint64_t v12 = v5;
      if (v6 <= a2) {
LABEL_21:
      }
        *(void *)uint64_t v7 = v12;
      else {
        *(void *)(a1 + 1104) = v12;
      }
      int v11 = *(_DWORD *)(a1 + 1112) + 1;
      goto LABEL_23;
    }
  }
  int v18 = *__error();

  _BOMExceptionHandlerCall("Out of memory.", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 2104, v18);
}

uint64_t _AdjustFileSize(uint64_t a1, int a2, int a3)
{
  if (a2)
  {
    if ((a3 + a2) <= *(_DWORD *)(a1 + 1032))
    {
      return 0;
    }
    else
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 1032) = a3 + a2;
    }
  }
  else
  {
    uint64_t v5 = (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 1120) + 56))(*(void *)(*(void *)(a1 + 1120) + 8), *(unsigned int *)(a1 + 1028), 0, 2);
    if (v5 == -1)
    {
      uint64_t v7 = __error();
      strerror(*v7);
      _CUILog();
      return 1;
    }
    else
    {
      int v6 = v5;
      uint64_t result = 0;
      *(_DWORD *)(a1 + 1032) = v6;
    }
  }
  return result;
}

uint64_t BOMStorageCopyFromBlock(uint64_t a1, unsigned int a2, void *a3)
{
  if (!a1 || !a2)
  {
    if (a1)
    {
      if (!a2) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v12 = __error();
      _BOMExceptionHandlerCall("BOMStorageCopyFromBlock: !storage", 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 994, *v12);
      if (!a2)
      {
LABEL_13:
        int v5 = *__error();
        int v6 = "BOMStorageCopyFromBlock: !bid";
        int v7 = 996;
        goto LABEL_14;
      }
    }
    return 1;
  }
  if (*(_DWORD *)(a1 + 1056) < a2)
  {
    int v5 = *__error();
    int v6 = "BOMStorageCopyFromBlock: bid > storage->blocks";
    int v7 = 1000;
LABEL_14:
    _BOMExceptionHandlerCall(v6, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v7, v5);
    return 1;
  }
  if (*(_DWORD *)(a1 + 1068) <= a2)
  {
    _CUILog();
    size_t v11 = 0;
  }
  else
  {
    unsigned int v9 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2 + 4);
    unsigned int v10 = bswap32(v9);
    if (*(unsigned char *)(a1 + 1052)) {
      size_t v11 = v9;
    }
    else {
      size_t v11 = v10;
    }
  }

  return BOMStorageCopyFromBlockRange(a1, a2, 0, v11, a3);
}

uint64_t BOMStorageCopyFromBlockRange(uint64_t a1, unsigned int a2, uint64_t a3, size_t __len, void *__dst)
{
  if (!a1 || !a2 || !__dst)
  {
    if (a1)
    {
      if (a2) {
        goto LABEL_8;
      }
    }
    else
    {
      unsigned int v16 = __error();
      _BOMExceptionHandlerCall("BOMStorageCopyFromBlockRange: !storage", 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1096, *v16);
      if (a2)
      {
LABEL_8:
        if (!__dst) {
          goto LABEL_17;
        }
        return 1;
      }
    }
    unsigned int v17 = __error();
    _BOMExceptionHandlerCall("BOMStorageCopyFromBlockRange: !bid", 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1098, *v17);
    if (!__dst)
    {
LABEL_17:
      int v8 = *__error();
      unsigned int v9 = "BOMStorageCopyFromBlockRange: !data";
      int v10 = 1100;
      goto LABEL_43;
    }
    return 1;
  }
  if (*(_DWORD *)(a1 + 1056) < a2)
  {
    int v8 = *__error();
    unsigned int v9 = "BOMStorageCopyRangeFromBlockRange: bad block (bid > storage->blocks)";
    int v10 = 1106;
LABEL_43:
    _BOMExceptionHandlerCall(v9, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v10, v8);
    return 1;
  }
  unsigned int v13 = *(_DWORD *)(a1 + 1068);
  if (v13 <= a2)
  {
    uint64_t v60 = "unsigned int _getBlockTableAddr(BOMStorage, BOMBlockID)";
    _CUILog();
    unsigned int v13 = *(_DWORD *)(a1 + 1068);
  }
  else
  {
    unsigned int v14 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2);
    unsigned int v15 = bswap32(v14);
    if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
      unsigned int v14 = v15;
    }
    if (v14 != -1) {
      goto LABEL_25;
    }
  }
  if (v13 <= a2)
  {
    uint64_t v60 = "unsigned int _getBlockTableSize(BOMStorage, BOMBlockID)";
    _CUILog();
    unsigned int v13 = *(_DWORD *)(a1 + 1068);
  }
  else
  {
    unsigned int v18 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2 + 4);
    unsigned int v19 = bswap32(v18);
    if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
      unsigned int v18 = v19;
    }
    if (v18 == -1)
    {
      int v8 = *__error();
      unsigned int v9 = "BOMStorageCopyRangeFromBlockRange: reading from free block";
      int v10 = 1111;
      goto LABEL_43;
    }
  }
LABEL_25:
  if (v13 <= a2)
  {
    uint64_t v60 = "unsigned int _getBlockTableAddr(BOMStorage, BOMBlockID)";
    _CUILog();
    unsigned int v13 = *(_DWORD *)(a1 + 1068);
    unsigned int v21 = -1;
  }
  else
  {
    unsigned int v20 = bswap32(*(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2));
    if (*(unsigned char *)(a1 + 1052)) {
      unsigned int v21 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2);
    }
    else {
      unsigned int v21 = v20;
    }
  }
  if (v13 <= a2)
  {
    uint64_t v60 = "unsigned int _getBlockTableSize(BOMStorage, BOMBlockID)";
    _CUILog();
    unsigned int v22 = 0;
  }
  else
  {
    unsigned int v22 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2 + 4);
    unsigned int v23 = bswap32(v22);
    if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
      unsigned int v22 = v23;
    }
  }
  if (__CFADD__(v22, v21))
  {
    int v8 = *__error();
    unsigned int v9 = "BOMStorageCopyRangeFromBlockRange: 32-bit overflow with block address+size";
    int v10 = 1121;
    goto LABEL_43;
  }
  if (v22 + v21 > *(_DWORD *)(a1 + 1032))
  {
    int v8 = *__error();
    unsigned int v9 = "BOMStorageCopyRangeFromBlockRange: block extends past end of storage";
    int v10 = 1125;
    goto LABEL_43;
  }
  if (__CFADD__(__len, a3))
  {
    int v8 = *__error();
    unsigned int v9 = "BOMStorageCopyRangeFromBlockRange: length extends beyond block size overflow";
    int v10 = 1136;
    goto LABEL_43;
  }
  if (__len + a3 > v22)
  {
    int v8 = *__error();
    unsigned int v9 = "BOMStorageCopyRangeFromBlockRange: length extends beyond block size";
    int v10 = 1140;
    goto LABEL_43;
  }
  if (v22)
  {
    if (!v21)
    {
      int v8 = *__error();
      unsigned int v9 = "BOMStorageCopyRangeFromBlockRange: bad block address";
      int v10 = 1148;
      goto LABEL_43;
    }
    uint64_t v25 = *(void *)(a1 + 1080);
    if (v25 && (*(unsigned char *)(v25 + 4 * a2) & 1) != 0)
    {
      int v26 = *(_DWORD *)(a1 + 1052);
    }
    else
    {
      int v26 = *(_DWORD *)(a1 + 1052);
      if ((v26 & 1) != 0 && *(_DWORD *)(a1 + 1028) != -1) {
        goto LABEL_55;
      }
    }
    if ((v26 & 2) != 0)
    {
      uint64_t v41 = (const void *)(*(void *)(a1 + 1040) + v21 + a3);
      goto LABEL_64;
    }
LABEL_55:
    int v27 = *(_DWORD *)(a1 + 1028);
    if ((v26 & 2) == 0)
    {
      unint64_t v28 = BOMStreamWithFile(v27, v21, v22, 0, 0);
      BOMStreamReadBuffer((uint64_t)v28, __dst, __len, v29, v30, v31, v32, v33);
      BOMStreamFree((uint64_t)v28, v34, v35, v36, v37, v38, v39, v40);
      return 0;
    }
    uint64_t v42 = BOMStreamWithFile(v27, v21, v22, 0, (char *)(*(void *)(a1 + 1040) + v21));
    if (!v42)
    {
      int v8 = *__error();
      unsigned int v9 = "BOMStorageCopyRangeFromBlockRange: !stream";
      int v10 = 1173;
      goto LABEL_43;
    }
    BOMStreamFree((uint64_t)v42, v43, v44, v45, v46, v47, v48, v49);
    uint64_t v57 = *(void *)(a1 + 1080);
    if (v57)
    {
      *(unsigned char *)(v57 + 4 * a2) |= 1u;
    }
    else
    {
      size_t v58 = BOMExceptionHandlerMessage("BOM blockShadowTable is null", v50, v51, v52, v53, v54, v55, v56, (char)v60);
      unsigned int v59 = __error();
      _BOMExceptionHandlerCall(v58, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1180, *v59);
    }
    uint64_t v41 = (const void *)(*(void *)(a1 + 1040) + v21 + a3);
LABEL_64:
    memmove(__dst, v41, __len);
  }
  return 0;
}

uint64_t BOMStorageReadFromBlock(uint64_t a1, unsigned int a2)
{
  if (!a1 || !a2)
  {
    if (a1)
    {
      if (!a2) {
        goto LABEL_13;
      }
    }
    else
    {
      int v10 = __error();
      _BOMExceptionHandlerCall("BOMStorageCopyFromBlock: !storage", 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1013, *v10);
      if (!a2)
      {
LABEL_13:
        int v4 = *__error();
        int v5 = "BOMStorageCopyFromBlock: !bid";
        int v6 = 1016;
        goto LABEL_27;
      }
    }
    return 0;
  }
  if (*(_DWORD *)(a1 + 1056) < a2)
  {
    int v4 = *__error();
    int v5 = "BOMStorageCopyRangeFromBlockRange: bad block (bid > storage->blocks)";
    int v6 = 1023;
LABEL_27:
    _BOMExceptionHandlerCall(v5, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v6, v4);
    return 0;
  }
  unsigned int v7 = *(_DWORD *)(a1 + 1068);
  if (v7 <= a2)
  {
    uint64_t v35 = "unsigned int _getBlockTableAddr(BOMStorage, BOMBlockID)";
    _CUILog();
    unsigned int v7 = *(_DWORD *)(a1 + 1068);
    unsigned int v9 = -1;
  }
  else
  {
    unsigned int v8 = bswap32(*(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2));
    if (*(unsigned char *)(a1 + 1052)) {
      unsigned int v9 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2);
    }
    else {
      unsigned int v9 = v8;
    }
  }
  if (v7 <= a2)
  {
    uint64_t v35 = "unsigned int _getBlockTableSize(BOMStorage, BOMBlockID)";
    _CUILog();
    unsigned int v11 = 0;
  }
  else
  {
    unsigned int v11 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * a2 + 4);
    unsigned int v12 = bswap32(v11);
    if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
      unsigned int v11 = v12;
    }
    if (v9 == -1 && v11 == -1)
    {
      int v4 = *__error();
      int v5 = "BOMStorageCopyRangeFromBlockRange: reading from free block";
      int v6 = 1032;
      goto LABEL_27;
    }
  }
  if (__CFADD__(v11, v9))
  {
    int v4 = *__error();
    int v5 = "BOMStorageCopyRangeFromBlockRange: 32-bit overflow with block address+size";
    int v6 = 1038;
    goto LABEL_27;
  }
  if (v11 + v9 > *(_DWORD *)(a1 + 1032))
  {
    int v4 = *__error();
    int v5 = "BOMStorageCopyRangeFromBlockRange: block extends past end of storage";
    int v6 = 1042;
    goto LABEL_27;
  }
  if (!v11) {
    return 0;
  }
  uint64_t v14 = *(void *)(a1 + 1080);
  if (v14 && (*(unsigned char *)(v14 + 4 * a2) & 1) != 0)
  {
    int v15 = *(_DWORD *)(a1 + 1052);
LABEL_39:
    if ((v15 & 2) == 0) {
      return 0;
    }
    return *(void *)(a1 + 1040) + v9;
  }
  int v15 = *(_DWORD *)(a1 + 1052);
  if ((v15 & 1) == 0) {
    goto LABEL_39;
  }
  int v16 = *(_DWORD *)(a1 + 1028);
  if (v16 == -1) {
    goto LABEL_39;
  }
  if ((v15 & 2) == 0) {
    return 0;
  }
  unsigned int v17 = BOMStreamWithFile(v16, v9, v11, 0, (char *)(*(void *)(a1 + 1040) + v9));
  if (!v17)
  {
    int v4 = *__error();
    int v5 = "BOMStorageCopyRangeFromBlockRange: !stream";
    int v6 = 1070;
    goto LABEL_27;
  }
  BOMStreamFree((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
  uint64_t v32 = *(void *)(a1 + 1080);
  if (v32)
  {
    *(unsigned char *)(v32 + 4 * a2) |= 1u;
  }
  else
  {
    uint64_t v33 = BOMExceptionHandlerMessage("BOM blockShadowTable is null", v25, v26, v27, v28, v29, v30, v31, (char)v35);
    uint64_t v34 = __error();
    _BOMExceptionHandlerCall(v33, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1077, *v34);
  }
  return *(void *)(a1 + 1040) + v9;
}

void _FlushWriteCache(uint64_t a1)
{
  for (unsigned int i = *(_DWORD **)(a1 + 1104); i; unsigned int i = *(_DWORD **)(a1 + 1104))
  {
    *(void *)(a1 + 1104) = *(void *)i;
    _WriteAddress(a1, i[2], i[3]);
    free(i);
  }
  *(_DWORD *)(a1 + 1112) = 0;
}

uint64_t BOMStorageCompact(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!a1 || (*(unsigned char *)(a1 + 1052) & 1) == 0 || *(_DWORD *)(a1 + 1028) == -1) {
    return 1;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  uint64_t v2 = *(void *)(a1 + 1120);
  BOMStorageCommit(a1);
  __strlcpy_chk();
  int v3 = (*(uint64_t (**)(void, void, long long *))(v2 + 72))(*(void *)(v2 + 8), *(unsigned int *)(a1 + 1028), &v45);
  if (v3 == -1)
  {
    int v4 = __error();
    char v5 = strerror(*v4);
    unsigned int v13 = BOMExceptionHandlerMessage("fstat: %s", v6, v7, v8, v9, v10, v11, v12, v5);
    uint64_t v14 = __error();
    _BOMExceptionHandlerCall(v13, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1303, *v14);
  }
  __strlcpy_chk();
  int v15 = strrchr(__s, 47);
  if (v15) {
    char *v15 = 0;
  }
  else {
    __strlcpy_chk();
  }
  __strlcat_chk();
  if (!mktemp(__s))
  {
    _CUILog();
    return 1;
  }
  uint64_t v17 = BOMStorageNewWithOptionsAndSys((uint64_t)__s, v16, (long long *)v2);
  if (!v17)
  {
LABEL_57:
    unlink(__s);
    return 1;
  }
  uint64_t v19 = v17;
  if (*(_DWORD *)(a1 + 1056))
  {
    uint64_t v20 = 1;
    do
    {
      if (v20 != BOMStorageNewBlock(v19)) {
        goto LABEL_56;
      }
      unsigned int v21 = *(_DWORD *)(a1 + 1068);
      if (v21 <= v20)
      {
        _CUILog();
        unsigned int v21 = *(_DWORD *)(a1 + 1068);
      }
      else
      {
        unsigned int v22 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * v20);
        unsigned int v23 = bswap32(v22);
        if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
          unsigned int v22 = v23;
        }
        if (v22 != -1) {
          goto LABEL_26;
        }
      }
      if (v21 <= v20)
      {
        _CUILog();
        unsigned int v21 = *(_DWORD *)(a1 + 1068);
      }
      else
      {
        unsigned int v24 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * v20 + 4);
        unsigned int v25 = bswap32(v24);
        if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
          unsigned int v24 = v25;
        }
        if (v24 == -1)
        {
          BOMStorageFreeBlock(v19, v20);
          goto LABEL_39;
        }
      }
LABEL_26:
      if (v21 <= v20)
      {
        _CUILog();
        unsigned int v26 = 0;
      }
      else
      {
        unsigned int v26 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * v20 + 4);
        unsigned int v27 = bswap32(v26);
        if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
          unsigned int v26 = v27;
        }
      }
      uint64_t v28 = BOM_malloc(v26);
      if (BOMStorageCopyFromBlock(a1, v20, v28)) {
        goto LABEL_45;
      }
      if (*(_DWORD *)(a1 + 1068) <= v20)
      {
        _CUILog();
        unsigned int v33 = 0;
      }
      else
      {
        unsigned int v33 = *(_DWORD *)(*(void *)(a1 + 1072) + 8 * v20 + 4);
        unsigned int v34 = bswap32(v33);
        if ((*(unsigned char *)(a1 + 1052) & 1) == 0) {
          unsigned int v33 = v34;
        }
      }
      if (BOMStorageCopyToBlock(v19, v20, v28, v33, v29, v30, v31, v32))
      {
LABEL_45:
        _CUILog();
        free(v28);
        goto LABEL_57;
      }
      free(v28);
LABEL_39:
      uint64_t v20 = (v20 + 1);
    }
    while (v20 <= *(_DWORD *)(a1 + 1056));
  }
  if (*(_DWORD *)(a1 + 1096))
  {
    size_t v35 = *(unsigned int *)(a1 + 1100);
    *(_DWORD *)(v19 + 1100) = v35;
    if (v35)
    {
      unsigned int v36 = (*(uint64_t (**)(void, void, uint64_t))(*(void *)(v19 + 1088) + 48))(*(void *)(v19 + 1088), (v35 + 15) & 0xFFFFFFF0, v18);
      if (!v36) {
        unsigned int v36 = (*(_DWORD *)(v19 + 1032) + 15) & 0xFFFFFFF0;
      }
    }
    else
    {
      unsigned int v36 = 0;
    }
    *(_DWORD *)(v19 + 1096) = v36;
    _ExpandMapAddress(v19, v36 + v35);
    memmove((void *)(*(void *)(v19 + 1040) + *(unsigned int *)(v19 + 1096)), (const void *)(*(void *)(a1 + 1040) + *(unsigned int *)(a1 + 1096)), v35);
    _AdjustFileSize(v19, v36, v35);
    if (*(_DWORD *)(v19 + 1028) != -1) {
      _AddToWriteCache(v19, v36, v35);
    }
    *(_DWORD *)(v19 + 1052) |= 0x10u;
  }
  BOMStorageCommit(v19);
  uint64_t v37 = BOM_malloc(0x470uLL);
  if (!v37)
  {
    BOMStorageFree((unsigned char *)v19);
    uint64_t v43 = __error();
    strerror(*v43);
LABEL_56:
    _CUILog();
    goto LABEL_57;
  }
  uint64_t v38 = v37;
  memcpy(v37, (const void *)a1, 0x470uLL);
  BOMStorageFree(v38);
  if ((*(unsigned int (**)(void, char *, unsigned char *))(v2 + 88))(*(void *)(v2 + 8), __s, v55))
  {
    uint64_t v39 = __error();
    strerror(*v39);
    _CUILog();
    BOMStorageFree((unsigned char *)v19);
    uint64_t v40 = 1;
    uint64_t v41 = (void *)BOMStorageOpenWithSys((uint64_t)v55, 1, (long long *)v2);
    if (v41)
    {
      uint64_t v42 = v41;
      memcpy((void *)a1, v41, 0x470uLL);
      free(v42);
    }
  }
  else
  {
    if (v3 != -1)
    {
      (*(void (**)(void, void, void))(v2 + 112))(*(void *)(v2 + 8), *(unsigned int *)(v19 + 1028), WORD2(v45));
      (*(void (**)(void, void, void, void))(v2 + 120))(*(void *)(v2 + 8), *(unsigned int *)(v19 + 1028), v46, DWORD1(v46));
    }
    memcpy((void *)a1, (const void *)v19, 0x470uLL);
    __strlcpy_chk();
    free((void *)v19);
    return 0;
  }
  return v40;
}

uint64_t BOMStorageDumpFreeList(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 1088) + 64))();
}

uint64_t _BOMStoragePrintDiagnostics(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (FILE **)MEMORY[0x1E4F143C8];
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "   # blocks : %d\n", *(_DWORD *)(result + 1056));
    fprintf(*v2, "   adm size : %d\n", *(_DWORD *)(v1 + 1064));
    fprintf(*v2, "   bt size  : %d\n", (8 * *(_DWORD *)(v1 + 1068)) | 4);
    fprintf(*v2, "   fl size  : %d\n", *(_DWORD *)(*(void *)(v1 + 1088) + 8));
    return fprintf(*v2, "   toc size : %d\n", *(_DWORD *)(v1 + 1100));
  }
  return result;
}

uint64_t BOMStorageDump(uint64_t a1, int a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 1;
  }
  uint64_t v3 = *(unsigned int *)(a1 + 1096);
  if (!v3) {
    return 1;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 1100);
  if (!v5) {
    return 1;
  }
  uint64_t v6 = BOMStreamWithAddress(*(void *)(a1 + 1040) + v3, v5, 0);
  if (!v6) {
    return 2;
  }
  uint64_t v14 = v6;
  int UInt32 = BOMStreamReadUInt32(v6, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v16 = "read/write";
  int v17 = *(_DWORD *)(a1 + 1052);
  if ((v17 & 1) == 0) {
    uint64_t v16 = "readonly";
  }
  if ((~v17 & 0x11) == 0) {
    uint64_t v16 = "read/write [dirty]";
  }
  uint64_t v18 = (FILE **)MEMORY[0x1E4F143D8];
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "Storage: open %s (%u blocks)\n", v16, *(_DWORD *)(a1 + 1056));
  fprintf(*v18, "    ToC: %u entries (%u bytes)\n", UInt32, *(_DWORD *)(a1 + 1100));
  if (!UInt32)
  {
    uint64_t v52 = 0;
    goto LABEL_66;
  }
  int v54 = 0;
  do
  {
    unsigned int v26 = BOMStreamReadUInt32(v14, v19, v20, v21, v22, v23, v24, v25);
    unsigned int UInt8 = BOMStreamReadUInt8(v14, v27, v28, v29, v30, v31, v32, v33);
    BOMStreamReadBuffer(v14, &__dst, UInt8, v35, v36, v37, v38, v39);
    *((unsigned char *)&__dst + UInt8) = 0;
    BOMStorageSizeOfBlock(a1, v26);
    uint64_t v40 = *v18;
    if (a2) {
      fprintf(v40, "    Bid: 0x%08x (%u) '%s' (%lu bytes)");
    }
    else {
      fprintf(v40, "    Bid: '%s' (%lu bytes)");
    }
    if ((void)__dst == 0x6F666E496D6F42
      || (__dst == 1752457552 ? (BOOL v41 = WORD2(__dst) == 115) : (BOOL v41 = 0),
          v41
       || (void)__dst == 0x7865646E494C48
       || (__dst == 1684949334 ? (BOOL v42 = *(_DWORD *)((char *)&__dst + 3) == 7890276) : (BOOL v42 = 0),
           v42 || (__dst == 1702521171 ? (BOOL v43 = *(_DWORD *)((char *)&__dst + 3) == 3421797) : (BOOL v43 = 0), v43))))
    {
      fwrite(" [BOM]\n", 7uLL, 1uLL, *v18);
      goto LABEL_50;
    }
    if ((void)__dst == 0x547463656A6F7250 && *((void *)&__dst + 1) == 0x656C6261546761)
    {
      fwrite(" [Metabom]\n", 0xBuLL, 1uLL, *v18);
      v54 |= 0x10u;
      uint64_t v49 = a1;
      p_dst = "ProjectTagTable";
    }
    else if ((void)__dst == 0x546567616B636150 && *((void *)&__dst + 1) == 0x656C6261546761)
    {
      fwrite(" [Metabom]\n", 0xBuLL, 1uLL, *v18);
      v54 |= 0x20u;
      uint64_t v49 = a1;
      p_dst = "PackageTagTable";
    }
    else
    {
      if ((void)__dst != 0x5467615468746150 || *(void *)((char *)&__dst + 5) != 0x656C6261546761)
      {
        if ((void)__dst == 0x547463656A6F7250 && *((void *)&__dst + 1) == 0x657254687461506FLL && v56 == 101)
        {
          fwrite(" [Metabom]\n", 0xBuLL, 1uLL, *v18);
          v54 |= 0x80u;
          uint64_t v49 = a1;
          p_dst = "ProjectToPathTree";
          unsigned int v51 = a2 | 0x1310000;
        }
        else
        {
          if ((v54 & 0x20) == 0)
          {
            fputc(10, *v18);
            goto LABEL_50;
          }
          fwrite(" [Package]\n", 0xBuLL, 1uLL, *v18);
          p_dst = (const char *)&__dst;
          uint64_t v49 = a1;
          unsigned int v51 = a2 | 0x230000;
        }
        goto LABEL_56;
      }
      fwrite(" [Metabom]\n", 0xBuLL, 1uLL, *v18);
      v54 |= 0x40u;
      uint64_t v49 = a1;
      p_dst = "PathTagTable";
    }
    unsigned int v51 = a2 | 0x210000;
LABEL_56:
    BOMStorageDumpTree(v49, p_dst, v51);
LABEL_50:
    --UInt32;
  }
  while (UInt32);
  uint64_t v52 = 0;
  if ((v54 & 0xF0) != 0 && (v54 & 0xF0) != 0xF0)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "WARNING: file appears to be a corrupt Metabom! (found %04x expected %04x or %04x)\n", v54 & 0xF0, 240, 0);
    uint64_t v52 = 3;
  }
LABEL_66:
  BOMStreamFree(v14, v19, v20, v21, v22, v23, v24, v25);
  return v52;
}

uint64_t BOMStorageDumpBlock(uint64_t a1, const char *a2, unsigned int a3)
{
  if (a1)
  {
    if (*(_DWORD *)(a1 + 1096))
    {
      if (*(_DWORD *)(a1 + 1100))
      {
        unsigned int v6 = _tocGet(a1, a2);
        if (v6)
        {
          unsigned int v7 = v6;
          unint64_t v8 = BOMStorageSizeOfBlock(a1, v6);
          size_t v9 = BOMStorageReadFromBlock(a1, v7);
          fprintf((FILE *)*MEMORY[0x1E4F143D8], "        %s ", a2);
          BOMValueDump(v9, v8, "        ", a3);
        }
      }
    }
  }
  return 1;
}

_DWORD *_newFreeListEntry(int a1, int a2)
{
  int v4 = BOM_malloc(0x10uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)int v4 = 0;
    v4[2] = a1;
    v4[3] = a2;
  }
  else
  {
    unsigned int v6 = __error();
    strerror(*v6);
    _CUILog();
  }
  return v5;
}

uint64_t (*_WriteAddress(uint64_t a1, unsigned int a2, unsigned int a3))(void *)
{
  uint64_t v3 = BOMStreamWithFile(*(_DWORD *)(a1 + 1028), a2, a3, 1, (char *)(*(void *)(a1 + 1040) + a2));
  if (v3)
  {
    int v4 = v3;
    BOMStreamFlush();
    return (uint64_t (*)(void *))BOMStreamFree(v4);
  }
  else
  {
    int v6 = *__error();
    return _BOMExceptionHandlerCall("Unable to create write stream.", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 2177, v6);
  }
}

uint64_t BomSys_init(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int v4 = BOM_malloc(0x80uLL);
  uint64_t result = 0;
  long long v6 = *(_OWORD *)&off_1F37B8CE8;
  v4[4] = xmmword_1F37B8CD8;
  v4[5] = v6;
  long long v7 = *(_OWORD *)&off_1F37B8D08;
  v4[6] = xmmword_1F37B8CF8;
  v4[7] = v7;
  long long v8 = *(_OWORD *)&off_1F37B8CA8;
  *int v4 = gDefaultSys;
  v4[1] = v8;
  long long v9 = *(_OWORD *)&off_1F37B8CC8;
  v4[2] = xmmword_1F37B8CB8;
  v4[3] = v9;
  *((void *)v4 + 1) = a2;
  *a1 = v4;
  return result;
}

void BomSys_free(void *a1)
{
  if (a1 != &gDefaultNOMMAPSys && a1 != 0 && a1 != &gDefaultSys) {
    free(a1);
  }
}

long long *BomSys_set_open(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 2) = a2;
  }
  else {
    *((void *)result + 2) = BomSys_open;
  }
  return result;
}

uint64_t BomSys_open(int a1, char *a2, int a3, unsigned int a4)
{
  return open(a2, a3, a4);
}

long long *BomSys_set_close(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 3) = a2;
  }
  else {
    *((void *)result + 3) = BomSys_close;
  }
  return result;
}

uint64_t BomSys_close(int a1, int a2)
{
  return close(a2);
}

long long *BomSys_set_fcntl(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 4) = a2;
  }
  else {
    *((void *)result + 4) = BomSys_fcntl;
  }
  return result;
}

uint64_t BomSys_fcntl(int a1, int a2, int a3, uint64_t a4)
{
  return fcntl(a2, a3, a4);
}

long long *BomSys_set_read(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 5) = a2;
  }
  else {
    *((void *)result + 5) = BomSys_read;
  }
  return result;
}

ssize_t BomSys_read(int a1, int a2, void *a3, size_t a4)
{
  return read(a2, a3, a4);
}

long long *BomSys_set_write(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 6) = a2;
  }
  else {
    *((void *)result + 6) = BomSys_write;
  }
  return result;
}

ssize_t BomSys_write(int a1, int __fd, void *__buf, size_t __nbyte)
{
  return write(__fd, __buf, __nbyte);
}

long long *BomSys_set_lseek(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 7) = a2;
  }
  else {
    *((void *)result + 7) = BomSys_lseek;
  }
  return result;
}

off_t BomSys_lseek(int a1, int a2, off_t a3, int a4)
{
  return lseek(a2, a3, a4);
}

long long *BomSys_set_fsync(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 8) = a2;
  }
  else {
    *((void *)result + 8) = BomSys_fsync;
  }
  return result;
}

uint64_t BomSys_fsync(int a1, int a2)
{
  return fsync(a2);
}

long long *BomSys_set_fstat(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 9) = a2;
  }
  else {
    *((void *)result + 9) = BomSys_fstat;
  }
  return result;
}

uint64_t BomSys_fstat(int a1, int a2, stat *a3)
{
  return fstat(a2, a3);
}

long long *BomSys_set_fstatfs(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 10) = a2;
  }
  else {
    *((void *)result + 10) = BomSys_fstatfs;
  }
  return result;
}

uint64_t BomSys_fstatfs(int a1, int a2, statfs *a3)
{
  return fstatfs(a2, a3);
}

long long *BomSys_set_rename(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 11) = a2;
  }
  else {
    *((void *)result + 11) = BomSys_rename;
  }
  return result;
}

void BomSys_rename(int a1, std::__fs::filesystem::path *__from, std::__fs::filesystem::path *__to)
{
}

long long *BomSys_set_mmap(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 12) = a2;
  }
  else {
    *((void *)result + 12) = BomSys_mmap;
  }
  return result;
}

void *BomSys_mmap(int a1, void *a2, size_t a3, int a4, int a5, int a6, off_t a7)
{
  return mmap(a2, a3, a4, a5, a6, a7);
}

long long *BomSys_set_munmap(long long *result, uint64_t a2)
{
  BOOL v3 = result == (long long *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(void *)result) {
    return (long long *)_CUILog();
  }
  if (a2) {
    *((void *)result + 13) = a2;
  }
  else {
    *((void *)result + 13) = BomSys_munmap;
  }
  return result;
}

uint64_t BomSys_munmap(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

long long *BomSys_default()
{
  return &gDefaultSys;
}

void *BomSys_defaultNoMMAP()
{
  return &gDefaultNOMMAPSys;
}

uint64_t BomSys_fchmod(int a1, int a2, mode_t a3)
{
  return fchmod(a2, a3);
}

uint64_t BomSys_fchown(int a1, int a2, uid_t a3, gid_t a4)
{
  return fchown(a2, a3, a4);
}

void **BOMStackNew()
{
  uint64_t v0 = (void **)BOM_calloc(1uLL, 0x18uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    v0[1] = (void *)1024;
    uint64_t v2 = BOM_malloczero(0x2000uLL);
    void *v1 = v2;
    if (!v2)
    {
      BOMStackFree(v1);
      uint64_t v11 = BOMExceptionHandlerMessage("Allocating BOMStack failed", v4, v5, v6, v7, v8, v9, v10, v13);
      uint64_t v12 = __error();
      _BOMFatalException(v11, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMStack.c", 38, *v12);
    }
  }
  return v1;
}

void BOMStackFree(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      free(v2);
    }
    free(a1);
  }
}

uint64_t *BOMStackPop(uint64_t *result)
{
  if (result)
  {
    uint64_t v1 = *result;
    if (*result && (uint64_t v2 = result[2]) != 0)
    {
      uint64_t v3 = v2 - 1;
      result[2] = v3;
      uint64_t result = *(uint64_t **)(v1 + 8 * v3);
      *(void *)(v1 + 8 * v3) = 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *BOMStackPeek(void *result)
{
  if (result)
  {
    if (*result && (uint64_t v1 = result[2]) != 0) {
      return *(void **)(*result + 8 * v1 - 8);
    }
    else {
      return 0;
    }
  }
  return result;
}

char *BOMStackPush(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    uint64_t result = *(char **)result;
    if (result)
    {
      unint64_t v11 = v8[1];
      uint64_t v10 = v8[2];
      uint64_t v12 = v10 + 1;
      if (v10 + 1 >= v11)
      {
        if (v11 == 0xFFFFFFF)
        {
          uint64_t v21 = BOMExceptionHandlerMessage("BOMStack is full can't grow anymore", a2, a3, a4, a5, a6, a7, a8, v25);
          uint64_t v22 = __error();
          _BOMFatalException(v21, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMStack.c", 103, *v22);
        }
        uint64_t v13 = 2 * v11;
        if (2 * v11 >= 0xFFFFFFF) {
          uint64_t v13 = 0xFFFFFFFLL;
        }
        v8[1] = v13;
        uint64_t result = BOM_realloczero(result, 8 * v11, 8 * v13);
        void *v8 = result;
        if (!result)
        {
          uint64_t v23 = BOMExceptionHandlerMessage("BOMStack got blown", v14, v15, v16, v17, v18, v19, v20, v25);
          uint64_t v24 = __error();
          _BOMFatalException(v23, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMStack.c", 122, *v24);
        }
        uint64_t v10 = v8[2];
        uint64_t v12 = v10 + 1;
      }
      v8[2] = v12;
      *(void *)&result[8 * v10] = a2;
    }
  }
  return result;
}

BOOL BOMStackIsEmpty(uint64_t a1)
{
  return !a1 || !*(void *)a1 || *(_DWORD *)(a1 + 16) < 1;
}

uint64_t BOMStackCount(uint64_t result)
{
  if (result)
  {
    if (*(void *)result) {
      return *(unsigned int *)(result + 16);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t BOMCFArrayMaxRange(const __CFArray *a1)
{
  return 0;
}

uint64_t BOMExceptionHandlerSet(void *a1)
{
  if (__BOMExceptionHandlerKey___onceHandler != -1) {
    dispatch_once(&__BOMExceptionHandlerKey___onceHandler, &__block_literal_global_16);
  }
  uint64_t result = pthread_setspecific(__BOMExceptionHandlerKey___key, a1);
  if (result)
  {
    return _CUILog();
  }
  return result;
}

uint64_t BOMExceptionHandlerSetDefault()
{
  return BOMExceptionHandlerSet(__defaultHandler);
}

uint64_t __defaultHandler(uint64_t a1)
{
  uint64_t result = _CUILog();
  if (*(unsigned char *)(a1 + 8)) {
    abort();
  }
  return result;
}

void _BOMFatalException(void *a1, const char *a2, int a3, int a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))__BOMGlobalExceptionHandler();
  if (!a1) {
    a1 = __BOMExceptionMessageString();
  }
  unint64_t v11 = a1;
  uint64_t v12 = 0;
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = __defaultHandler;
  }
  LOBYTE(v12) = 1;
  if (a2) {
    uint64_t v10 = a2;
  }
  else {
    uint64_t v10 = "";
  }
  uint64_t v13 = v10;
  int v14 = a3;
  int v15 = a4;
  v9((uint64_t)&v11);
  abort();
}

void *__BOMGlobalExceptionHandler()
{
  if (__BOMExceptionHandlerKey___onceHandler != -1) {
    dispatch_once(&__BOMExceptionHandlerKey___onceHandler, &__block_literal_global_16);
  }
  pthread_key_t v0 = __BOMExceptionHandlerKey___key;

  return pthread_getspecific(v0);
}

void *__BOMExceptionMessageString()
{
  if (__BOMExceptionMessageString___onceMessage != -1) {
    dispatch_once(&__BOMExceptionMessageString___onceMessage, &__block_literal_global_6);
  }
  pthread_key_t v0 = pthread_getspecific(__BOMExceptionMessageString___key);
  if (!v0)
  {
    pthread_key_t v0 = malloc_type_calloc(0x1000uLL, 1uLL, 0x100004077774924uLL);
    __CFSetLastAllocationEventName();
    if (pthread_setspecific(__BOMExceptionMessageString___key, v0)) {
      _CUILog();
    }
  }
  return v0;
}

uint64_t (*_BOMExceptionHandlerCall(void *a1, unsigned __int8 a2, const char *a3, int a4, int a5))(void *)
{
  uint64_t result = (uint64_t (*)(void *))__BOMGlobalExceptionHandler();
  if (result)
  {
    unint64_t v11 = result;
    if (!a1) {
      a1 = __BOMExceptionMessageString();
    }
    v13[0] = a1;
    uint64_t v12 = "";
    v13[1] = a2;
    if (a3) {
      uint64_t v12 = a3;
    }
    v13[2] = v12;
    int v14 = a4;
    int v15 = a5;
    return (uint64_t (*)(void *))v11(v13);
  }
  return result;
}

char *BOMExceptionHandlerMessage(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)__BOMExceptionMessageString();
  vsnprintf(v10, 0x1000uLL, a1, &a9);
  return v10;
}

void *BOM_malloc(size_t a1)
{
  char v1 = a1;
  uint64_t v2 = malloc_type_malloc(a1, 0x1607F7D5uLL);
  if (v2)
  {
    __CFSetLastAllocationEventName();
  }
  else
  {
    uint64_t v3 = __error();
    strerror(*v3);
    unint64_t v11 = BOMExceptionHandlerMessage("BOM_malloc: (%zd bytes) %s\n", v4, v5, v6, v7, v8, v9, v10, v1);
    uint64_t v12 = __error();
    _BOMExceptionHandlerCall(v11, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMSystemCmds.c", 24, *v12);
  }
  return v2;
}

void *BOM_malloczero(size_t size)
{
  char v1 = size;
  uint64_t v2 = malloc_type_calloc(1uLL, size, 0x83655E9DuLL);
  if (v2)
  {
    __CFSetLastAllocationEventName();
  }
  else
  {
    uint64_t v3 = __error();
    strerror(*v3);
    unint64_t v11 = BOMExceptionHandlerMessage("BOM_malloczero: (%zd bytes) %s\n", v4, v5, v6, v7, v8, v9, v10, v1);
    uint64_t v12 = __error();
    _BOMExceptionHandlerCall(v11, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMSystemCmds.c", 37, *v12);
  }
  return v2;
}

void *BOM_calloc(size_t a1, size_t a2)
{
  char v2 = a2;
  uint64_t v3 = malloc_type_calloc(a1, a2, 0x561175E7uLL);
  if (v3)
  {
    __CFSetLastAllocationEventName();
  }
  else
  {
    uint64_t v4 = __error();
    strerror(*v4);
    uint64_t v12 = BOMExceptionHandlerMessage("BOM_calloc: (%zd bytes) %s\n", v5, v6, v7, v8, v9, v10, v11, v2);
    uint64_t v13 = __error();
    _BOMExceptionHandlerCall(v12, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMSystemCmds.c", 54, *v13);
  }
  return v3;
}

void *BOM_realloc(void *a1, size_t a2)
{
  char v2 = a2;
  uint64_t v3 = reallocf(a1, a2);
  if (v3)
  {
    __CFSetLastAllocationEventName();
  }
  else
  {
    uint64_t v4 = __error();
    strerror(*v4);
    uint64_t v12 = BOMExceptionHandlerMessage("BOM_realloc: (%zd bytes) %s\n", v5, v6, v7, v8, v9, v10, v11, v2);
    uint64_t v13 = __error();
    _BOMExceptionHandlerCall(v12, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMSystemCmds.c", 70, *v13);
  }
  return v3;
}

char *BOM_realloczero(void *a1, unint64_t a2, size_t __size)
{
  uint64_t v5 = (char *)reallocf(a1, __size);
  if (v5)
  {
    __CFSetLastAllocationEventName();
    if (__size > a2) {
      bzero(&v5[a2], __size - a2);
    }
  }
  else
  {
    uint64_t v6 = __error();
    strerror(*v6);
    int v14 = BOMExceptionHandlerMessage("BOM_realloczero: (%zd bytes) %s\n", v7, v8, v9, v10, v11, v12, v13, __size);
    int v15 = __error();
    _BOMExceptionHandlerCall(v14, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMSystemCmds.c", 85, *v15);
  }
  return v5;
}

_DWORD *_BOMFreeListAllocate()
{
  pthread_key_t v0 = BOM_malloc(0x48uLL);
  char v1 = v0;
  if (v0)
  {
    v0[2] = _dense_initialize;
    v0[3] = _dense_serialize;
    v0[4] = _dense_deallocate;
    v0[7] = _dense_clear;
    v0[5] = _dense_addFreeRange;
    v0[6] = _dense_allocateRange;
    v0[8] = _dense_print;
    char v2 = BOM_malloc(0x18uLL);
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = BOM_calloc(0x20uLL, 8uLL);
      *uint64_t v3 = v4;
      if (v4)
      {
        v3[1] = 0;
        *((_DWORD *)v3 + 4) = 32;
        *(void *)char v1 = v3;
        v1[2] = 0;
        return v1;
      }
      free(v1);
      uint64_t v5 = v3;
    }
    else
    {
      uint64_t v5 = v1;
    }
    free(v5);
    return 0;
  }
  return v1;
}

uint64_t _dense_initialize(uint64_t result, uint64_t a2, unint64_t a3, int a4)
{
  if ((a3 & 7) == 0 && (int)(a3 >> 3) >= 1)
  {
    uint64_t v5 = result;
    uint64_t v6 = (a3 >> 3);
    uint64_t v7 = (unsigned int *)(a2 + 4);
    do
    {
      unsigned int v8 = *(v7 - 1);
      unsigned int v9 = bswap32(v8);
      unsigned int v10 = bswap32(*v7);
      if (a4) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = v8;
      }
      if (a4) {
        uint64_t v12 = v10;
      }
      else {
        uint64_t v12 = *v7;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(v5, v11, v12);
      v7 += 2;
      --v6;
    }
    while (v6);
  }
  return result;
}

_DWORD *_dense_serialize(uint64_t **a1, int a2, size_t *a3)
{
  uint64_t v4 = *a1;
  size_t v5 = 8 * *((int *)a1 + 2);
  *a3 = v5;
  uint64_t result = BOM_malloc(v5);
  if (result)
  {
    int v7 = *((_DWORD *)v4 + 4);
    if (v7 < 1)
    {
      int v9 = 0;
    }
    else
    {
      uint64_t v8 = 0;
      int v9 = 0;
      uint64_t v10 = *v4;
      do
      {
        uint64_t v11 = *(uint64_t **)(v10 + 8 * v8);
        if (v11)
        {
          int v12 = 2 * v9;
          do
          {
            unsigned int v13 = *((_DWORD *)v11 + 2);
            unsigned int v14 = *((_DWORD *)v11 + 3);
            unsigned int v15 = bswap32(v13);
            unsigned int v16 = bswap32(v14);
            if (a2)
            {
              unsigned int v13 = v15;
              unsigned int v14 = v16;
            }
            result[v12] = v13;
            result[v12 + 1] = v14;
            uint64_t v11 = (uint64_t *)*v11;
            v12 += 2;
            ++v9;
          }
          while (v11);
          int v7 = *((_DWORD *)v4 + 4);
        }
        ++v8;
      }
      while (v8 < v7);
    }
    uint64_t v17 = (uint64_t *)v4[1];
    if (v17)
    {
      int v18 = 2 * v9;
      do
      {
        unsigned int v19 = *((_DWORD *)v17 + 2);
        unsigned int v20 = *((_DWORD *)v17 + 3);
        unsigned int v21 = bswap32(v19);
        unsigned int v22 = bswap32(v20);
        if (a2) {
          unsigned int v19 = v21;
        }
        result[v18] = v19;
        if (a2) {
          unsigned int v23 = v22;
        }
        else {
          unsigned int v23 = v20;
        }
        result[v18 + 1] = v23;
        uint64_t v17 = (uint64_t *)*v17;
        v18 += 2;
      }
      while (v17);
    }
  }
  return result;
}

void _dense_deallocate(uint64_t a1)
{
  char v2 = *(void ***)a1;
  (*(void (**)(void))(a1 + 56))();
  free(*v2);
  free(v2);
  *(void *)a1 = 0;
}

void *_dense_clear(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = *(_DWORD *)(*a1 + 16);
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i < v2; ++i)
    {
      uint64_t v4 = *(void **)(*(void *)v1 + 8 * i);
      *(void *)(*(void *)v1 + 8 * i) = 0;
      if (v4)
      {
        do
        {
          size_t v5 = (void *)*v4;
          free(v4);
          uint64_t v4 = v5;
        }
        while (v5);
        int v2 = *(_DWORD *)(v1 + 16);
      }
    }
  }
  uint64_t result = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
  if (result)
  {
    do
    {
      int v7 = (void *)*result;
      free(result);
      uint64_t result = v7;
    }
    while (v7);
  }
  return result;
}

_DWORD *_dense_addFreeRange(_DWORD *result, int a2, unint64_t a3)
{
  if (a3)
  {
    size_t v5 = result;
    uint64_t v6 = *(void *)result;
    if (a3 < 0x10000)
    {
      unint64_t v8 = *(int *)(v6 + 16);
      if (v8 <= a3)
      {
        int v9 = a3 + 1;
        uint64_t v10 = (char *)BOM_realloc(*(void **)v6, (8 * (a3 + 1)));
        *(void *)uint64_t v6 = v10;
        if ((int)v8 <= (int)a3) {
          bzero(&v10[8 * *(int *)(v6 + 16)], 8 * (v9 - (int)v8));
        }
        *(_DWORD *)(v6 + 16) = v9;
        uint64_t v6 = *(void *)v5;
      }
      uint64_t v11 = *(void *)(*(void *)v6 + 8 * a3);
      uint64_t result = BOM_malloc(0x10uLL);
      result[2] = a2;
      result[3] = a3;
      *(void *)uint64_t result = v11;
      *(void *)(*(void *)v6 + 8 * a3) = result;
    }
    else
    {
      uint64_t v7 = *(void *)(v6 + 8);
      uint64_t result = BOM_malloc(0x10uLL);
      result[2] = a2;
      result[3] = a3;
      *(void *)uint64_t result = v7;
      *(void *)(v6 + 8) = result;
    }
    ++v5[2];
  }
  return result;
}

uint64_t _dense_allocateRange(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  unint64_t v5 = *(int *)(*(void *)a1 + 16);
  if (v5 > a2)
  {
    uint64_t v6 = *(unsigned int **)(*v4 + 8 * a2);
    if (v6)
    {
      uint64_t v7 = v6[2];
      uint64_t v8 = *(void *)v6;
      free(v6);
      *(void *)(*v4 + 8 * a2) = v8;
      --*(_DWORD *)(a1 + 8);
      return v7;
    }
  }
  LODWORD(v9) = 0;
  while (1)
  {
    uint64_t v10 = (a2 + 1 + v9);
    if (v10 >= v5) {
      break;
    }
    uint64_t v11 = *(unsigned int **)(*v4 + 8 * v10);
    uint64_t v9 = (v9 + 1);
    if (v11)
    {
      uint64_t v7 = v11[2];
      uint64_t v12 = *(void *)v11;
      free(v11);
      *(void *)(*v4 + 8 * v10) = v12;
      --*(_DWORD *)(a1 + 8);
      (*(void (**)(uint64_t, void, uint64_t))(a1 + 40))(a1, (v7 + a2), v9);
      return v7;
    }
  }
  unsigned int v15 = (void **)v4[1];
  unsigned int v14 = v4 + 1;
  unsigned int v13 = v15;
  if (!v15) {
    return 0;
  }
  unint64_t v16 = *((unsigned int *)v13 + 3);
  if (v16 < a2)
  {
    while (1)
    {
      uint64_t v17 = v13;
      unsigned int v13 = (void **)*v13;
      if (!v13) {
        return 0;
      }
      unint64_t v16 = *((unsigned int *)v13 + 3);
      if (v16 >= a2) {
        goto LABEL_15;
      }
    }
  }
  uint64_t v17 = 0;
LABEL_15:
  int v18 = (void **)*v13;
  uint64_t v7 = *((unsigned int *)v13 + 2);
  uint64_t v19 = (v7 + a2);
  uint64_t v20 = (v16 - a2);
  free(v13);
  if (v17) {
    unsigned int v21 = v17;
  }
  else {
    unsigned int v21 = v14;
  }
  void *v21 = v18;
  --*(_DWORD *)(a1 + 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 40))(a1, v19, v20);
  return v7;
}

uint64_t _dense_print(uint64_t result, FILE *__stream, int a3)
{
  uint64_t v5 = *(void *)result;
  int v6 = *(_DWORD *)(*(void *)result + 16);
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i < v6; ++i)
    {
      uint64_t v8 = *(void **)(*(void *)v5 + 8 * i);
      if (v8)
      {
        int v9 = 0;
        do
        {
          ++v9;
          uint64_t v8 = (void *)*v8;
        }
        while (v8);
        if (v9 == 1) {
          uint64_t v10 = "y";
        }
        else {
          uint64_t v10 = "ies";
        }
        uint64_t result = fprintf(__stream, "Size %d: %d entr%s\n", i, v9, v10);
        int v6 = *(_DWORD *)(v5 + 16);
      }
    }
  }
  uint64_t v11 = *(uint64_t **)(v5 + 8);
  if (v11)
  {
    if (a3) {
      fwrite("Large sizes:\n\t", 0xEuLL, 1uLL, __stream);
    }
    int v12 = 1;
    if (!a3) {
      goto LABEL_17;
    }
    while (1)
    {
      fprintf(__stream, "%d ", *((_DWORD *)v11 + 3));
      uint64_t v11 = (uint64_t *)*v11;
      if (!v11) {
        break;
      }
      while (1)
      {
        ++v12;
        if (a3) {
          break;
        }
LABEL_17:
        uint64_t v11 = (uint64_t *)*v11;
        if (!v11)
        {
          unsigned int v13 = "ies";
          if (v12 == 1) {
            unsigned int v13 = "y";
          }
          return fprintf(__stream, "Large sizes: %d entr%s\n", v12, v13);
        }
      }
    }
    return fputc(10, __stream);
  }
  return result;
}

_DWORD *BOMTreeNewWithName(uint64_t a1, const char *a2)
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return 0;
  }
  unsigned int v4 = BOMStorageNewNamedBlock(a1, a2);
  if (!v4) {
    return 0;
  }

  return _BOMTreeNew(a1, a2, v4, 0, 0);
}

_DWORD *_BOMTreeNew(uint64_t a1, const char *a2, unsigned int a3, int a4, char a5)
{
  uint64_t result = _newBOMTree(a1, a2);
  if (result)
  {
    uint64_t v11 = (uint64_t)result;
    result[4] = a3;
    if ((a4 - 1) >= 0x2F) {
      int v12 = a4;
    }
    else {
      int v12 = 48;
    }
    if (!v12) {
      int v12 = 4096;
    }
    result[76] = v12;
    unsigned int v13 = v12 - 16;
    result[77] = v13 >> 3;
    result[78] = (v13 >> 3) + 1;
    result[79] = v13 >> 4;
    result[89] = result[89] & 0xFFFFFFFB | (4 * (a5 & 1));
    unsigned int v14 = _NewPage((uint64_t)result, 0);
    *(void *)(v11 + 24) = v14;
    *((_WORD *)v14 + 2) |= 1u;
    *(_DWORD *)(v11 + 356) |= 1u;
    BOMTreeFree(v11);
    return (_DWORD *)_BOMTreeOpen(a1, a2, a3, 1);
  }
  return result;
}

_DWORD *BOMTreeNewWithOptions(uint64_t a1, unsigned int a2, const char *a3, int a4, char a5)
{
  if (!a1) {
    return 0;
  }
  unsigned int v8 = a2;
  if (!a2 && !a3) {
    return 0;
  }
  if (!a2)
  {
    unsigned int v8 = BOMStorageNewNamedBlock(a1, a3);
    if (!v8) {
      return 0;
    }
  }

  return _BOMTreeNew(a1, a3, v8, a4, a5);
}

uint64_t BOMTreeOpenWithName(uint64_t a1, const char *a2, char a3)
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return 0;
  }
  unsigned int NamedBlock = BOMStorageGetNamedBlock(a1, a2);
  if (!NamedBlock) {
    return 0;
  }

  return _BOMTreeOpen(a1, a2, NamedBlock, a3);
}

uint64_t _BOMTreeOpen(uint64_t a1, const char *a2, unsigned int a3, char a4)
{
  uint64_t v7 = _newBOMTree(a1, a2);
  uint64_t v8 = (uint64_t)v7;
  if (v7)
  {
    void *v7 = a1;
    *((_DWORD *)v7 + 4) = a3;
    uint64_t v9 = BOMStorageSizeOfBlock(a1, a3);
    uint64_t v10 = *(void *)v8;
    if ((*(unsigned char *)(v8 + 356) & 0x40) != 0)
    {
      uint64_t v19 = BOMStorageReadFromBlock(v10, a3);
      if (!v19) {
        goto LABEL_16;
      }
      uint64_t v20 = (void *)v19;
      uint64_t v18 = BOMStreamWithAddress(v19, v9, 0);
      madvise(v20, v9, 3);
      if (!v18) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v18 = BOMStreamWithBlockID(v10, a3, v9, 0);
      if (!v18) {
        goto LABEL_16;
      }
    }
    if (BOMStreamReadUInt32(v18, v11, v12, v13, v14, v15, v16, v17) != 1953654117
      || BOMStreamReadUInt32(v18, v21, v22, v23, v24, v25, v26, v27) != 1)
    {
      _CUILog();
      BOMStreamFree(v18, v80, v81, v82, v83, v84, v85, v86);
LABEL_16:
      BOMTreeFree(v8);
      return 0;
    }
    int UInt32 = BOMStreamReadUInt32(v18, v28, v29, v30, v31, v32, v33, v34);
    *(_DWORD *)(v8 + 304) = BOMStreamReadUInt32(v18, v36, v37, v38, v39, v40, v41, v42);
    *(_DWORD *)(v8 + 20) = BOMStreamReadUInt32(v18, v43, v44, v45, v46, v47, v48, v49);
    *(_DWORD *)(v8 + 356) = *(_DWORD *)(v8 + 356) & 0xFFFFFFFB | (4
                                                                * (BOMStreamReadUInt8(v18, v50, v51, v52, v53, v54, v55, v56) & 1));
    if (!BOMStreamAtEOF(v18, v57, v58, v59, v60, v61, v62, v63))
    {
      *(_DWORD *)(v8 + 348) = BOMStreamReadUInt32(v18, v64, v65, v66, v67, v68, v69, v70);
      if (!BOMStreamAtEOF(v18, v71, v72, v73, v74, v75, v76, v77)) {
        *(_DWORD *)(v8 + 352) = BOMStreamReadUInt32(v18, v64, v65, v66, v67, v68, v69, v70);
      }
    }
    BOMStreamFree(v18, v64, v65, v66, v67, v68, v69, v70);
    unsigned int v78 = *(_DWORD *)(v8 + 304) - 16;
    *(_DWORD *)(v8 + 308) = v78 >> 3;
    *(_DWORD *)(v8 + 312) = (v78 >> 3) + 1;
    *(_DWORD *)(v8 + 316) = v78 >> 4;
    uint64_t v79 = _NewPage(v8, UInt32);
    *(void *)(v8 + 24) = v79;
    if (!v79 || _ReadPage(v8, (uint64_t)v79)) {
      goto LABEL_16;
    }
    *(_DWORD *)(v8 + 356) = *(_DWORD *)(v8 + 356) & 0xFFFFFFFD | (2 * (a4 & 1));
  }
  return v8;
}

uint64_t BOMTreeFree(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 356) & 1) != 0 && BOMTreeCommit(result))
    {
      return 1;
    }
    else
    {
      for (uint64_t i = 32; i != 288; i += 8)
      {
        uint64_t v3 = *(_WORD **)(v1 + i);
        if (v3)
        {
          if ((v3[2] & 2) != 0) {
            _WritePage(v1, *(void *)(v1 + i));
          }
          _FreePage(v1, v3);
          *(void *)(v1 + i) = 0;
        }
      }
      _FreePage(v1, *(void **)(v1 + 24));
      *(void *)(v1 + 24) = 0;
      unsigned int v4 = *(void **)(v1 + 8);
      if (v4 && (*(unsigned char *)(v1 + 356) & 0x20) != 0)
      {
        free(v4);
        *(void *)(v1 + 8) = 0;
      }
      uint64_t v5 = *(const void **)(v1 + 296);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(v1 + 296) = 0;
      }
      int v6 = *(void **)(v1 + 336);
      if (v6)
      {
        free(v6);
        *(void *)(v1 + 336) = 0;
      }
      uint64_t v7 = *(void **)(v1 + 320);
      if (v7) {
        free(v7);
      }
      free((void *)v1);
      return 0;
    }
  }
  return result;
}

uint64_t BOMTreeCommit(uint64_t a1)
{
  if (!a1 || (*(unsigned char *)(a1 + 356) & 1) == 0) {
    return 0;
  }
  for (uint64_t i = 32; i != 288; i += 8)
  {
    uint64_t v5 = *(void *)(a1 + i);
    if (v5 && (*(_WORD *)(v5 + 4) & 2) != 0) {
      _WritePage(a1, v5);
    }
  }
  _WritePage(a1, *(void *)(a1 + 24));
  uint64_t v2 = 1;
  int v6 = (uint64_t (*)(void *))BOMStreamWithBlockID(*(void *)a1, *(_DWORD *)(a1 + 16), 0x1DuLL, 1);
  if (v6)
  {
    uint64_t v13 = v6;
    BOMStreamWriteUInt32(v6, 1953654117, v7, v8, v9, v10, v11, v12);
    BOMStreamWriteUInt32(v13, 1, v14, v15, v16, v17, v18, v19);
    BOMStreamWriteUInt32(v13, **(unsigned int **)(a1 + 24), v20, v21, v22, v23, v24, v25);
    BOMStreamWriteUInt32(v13, *(unsigned int *)(a1 + 304), v26, v27, v28, v29, v30, v31);
    BOMStreamWriteUInt32(v13, *(unsigned int *)(a1 + 20), v32, v33, v34, v35, v36, v37);
    BOMStreamWriteUInt8(v13, (*(unsigned __int8 *)(a1 + 356) >> 2) & 1, v38, v39, v40, v41, v42, v43);
    if ((*(unsigned char *)(a1 + 356) & 4) != 0) {
      uint64_t v50 = 0;
    }
    else {
      uint64_t v50 = *(unsigned int *)(a1 + 348);
    }
    BOMStreamWriteUInt32(v13, v50, v44, v45, v46, v47, v48, v49);
    BOMStreamWriteUInt32(v13, 0, v51, v52, v53, v54, v55, v56);
    if (!BOMStreamFree((uint64_t)v13, v57, v58, v59, v60, v61, v62, v63))
    {
      uint64_t v2 = 0;
      *(_DWORD *)(a1 + 356) &= ~1u;
    }
  }
  return v2;
}

void _FreePage(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(_DWORD *)a2 = -1;
    *((void *)a2 + 1) = -1;
    *((void *)a2 + 4) = 0;
    if ((*(unsigned char *)(a1 + 356) & 0x40) == 0) {
      free(*((void **)a2 + 3));
    }
    free(a2);
  }
}

uint64_t BOMTreeRemoveAndFree(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)result;
    uint64_t v3 = BOMTreeIteratorNew(result, 0, 0, 0);
    if (v3)
    {
      for (uint64_t i = v3;
            !BOMTreeIteratorIsAtEnd((uint64_t)i, v4, v5, v6, v7, v8, v9, v10);
            BOMTreeIteratorNext((uint64_t)i, v28, v29, v30, v31, v32, v33, v34))
      {
        uint64_t v19 = (void *)BOMTreeIteratorKey((uint64_t)i, v12, v13, v14, v15, v16, v17, v18);
        size_t v27 = BOMTreeIteratorKeySize((uint64_t)i, v20, v21, v22, v23, v24, v25, v26);
        BOMTreeRemoveValue(v1, v19, v27);
      }
      BOMTreeIteratorFree(i);
      BOMStorageFreeBlock(v2, **(_DWORD **)(v1 + 24));
      _FreePage(v1, *(void **)(v1 + 24));
      *(void *)(v1 + 24) = 0;
      uint64_t v35 = *(const char **)(v1 + 8);
      if (v35) {
        BOMStorageFreeNamedBlock(v2, v35);
      }
      else {
        BOMStorageFreeBlock(v2, *(_DWORD *)(v1 + 16));
      }
      uint64_t v36 = *(void **)(v1 + 8);
      if (v36 && (*(unsigned char *)(v1 + 356) & 0x20) != 0)
      {
        free(v36);
        *(void *)(v1 + 8) = 0;
      }
      uint64_t v37 = *(const void **)(v1 + 296);
      if (v37) {
        CFRelease(v37);
      }
      free((void *)v1);
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void *BOMTreeIteratorNew(uint64_t a1, void *a2, size_t a3, BOOL *a4)
{
  uint64_t v8 = BOM_malloczero(0x40uLL);
  uint64_t v13 = v8;
  if (!v8) {
    return v13;
  }
  void *v8 = a1;
  BOMTreeIteratorSet((uint64_t)v8, a2, a3, a4, v9, v10, v11, v12);
  CFArrayRef v14 = *(const __CFArray **)(a1 + 296);
  if (!v14)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    *(void *)(a1 + 296) = Mutable;
    if (!Mutable)
    {
      uint64_t v19 = __error();
      _BOMExceptionHandlerCall("Out of memory.", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 2679, *v19);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  CFIndex v15 = BOMCFArrayMaxRange(v14);
  CFIndex v17 = v16;
  v21.location = v15;
  v21.length = v17;
  if (!CFArrayContainsValue(*(CFArrayRef *)(a1 + 296), v21, v13))
  {
    Mutable = *(__CFArray **)(a1 + 296);
LABEL_6:
    CFArrayAppendValue(Mutable, v13);
  }
LABEL_8:
  if ((*(unsigned char *)(*v13 + 356) & 4) == 0) {
    void v13[3] = BOM_malloc(v13[4]);
  }
  v13[5] = BOM_malloc(v13[6]);
  return v13;
}

uint64_t BOMTreeIteratorIsAtEnd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 1;
  }
  unsigned int v9 = *(unsigned __int8 *)(a1 + 57);
  if ((v9 & 8) != 0) {
    return 1;
  }
  if ((v9 & 1) != 0 || (uint64_t v10 = *(_DWORD **)(a1 + 8)) == 0 || *v10 != *(_DWORD *)(a1 + 16))
  {
    int v11 = _revalidateIterator(a1, a2, a3, a4, a5, a6, a7, a8);
    unsigned int v9 = *(unsigned __int8 *)(a1 + 57);
    if (!v11)
    {
      v9 |= 8u;
      *(unsigned char *)(a1 + 57) = v9;
    }
  }
  return (v9 >> 3) & 1;
}

uint64_t BOMTreeIteratorKey(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    if ((*(unsigned char *)(result + 57) & 8) != 0) {
      return 0;
    }
    if (((*(unsigned char *)(result + 57) & 1) != 0 || (unsigned int v9 = *(_DWORD **)(result + 8)) == 0
                                             || *v9 != *(_DWORD *)(result + 16))
      && !_revalidateIterator(result, a2, a3, a4, a5, a6, a7, a8))
    {
      uint64_t result = 0;
      *(unsigned char *)(v8 + 57) |= 8u;
      return result;
    }
    uint64_t v10 = *(void *)v8;
    int v11 = *(_DWORD *)(*(void *)v8 + 356);
    if ((v11 & 4) == 0)
    {
      if ((*(unsigned char *)(v8 + 57) & 2) != 0) {
        return *(void *)(v8 + 24);
      }
      if ((v11 & 0x40) != 0)
      {
        unint64_t v15 = *(unsigned int *)(v10 + 348);
        if ((int)v15 >= 1)
        {
LABEL_18:
          unint64_t v16 = *(void *)(v8 + 32);
          if (v15 > v16)
          {
            CFIndex v17 = *(void **)(v8 + 24);
            if (v17)
            {
              free(v17);
              *(void *)(v8 + 24) = 0;
              unint64_t v16 = *(void *)(v8 + 32);
            }
            if (v15 <= 2 * v16) {
              size_t v18 = 2 * v16;
            }
            else {
              size_t v18 = v15;
            }
            *(void *)(v8 + 32) = v18;
            *(void *)(v8 + 24) = BOM_malloc(v18);
          }
          uint64_t v19 = *(void *)v8;
          if ((*(unsigned char *)(*(void *)v8 + 356) & 0x40) == 0)
          {
            unsigned int v20 = *(_DWORD *)(*(void *)(*(void *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4);
            goto LABEL_31;
          }
          size_t v21 = *(unsigned int *)(v19 + 348);
          uint64_t v22 = *(void *)(v8 + 8);
          if ((int)v21 < 1)
          {
            unsigned int v20 = bswap32(*(_DWORD *)(*(void *)(v22 + 24) + 8 * *(int *)(v8 + 20) + 4));
LABEL_31:
            if (BOMStorageCopyFromBlock(*(void *)v19, v20, *(void **)(v8 + 24))) {
              return 0;
            }
            goto LABEL_34;
          }
          uint64_t v23 = *(void *)(v22 + 32);
          if (v23)
          {
            memcpy(*(void **)(v8 + 24), (const void *)(v23 + *(int *)(v8 + 20) * v21), v21);
LABEL_34:
            *(unsigned char *)(v8 + 57) |= 2u;
            return *(void *)(v8 + 24);
          }
          return 0;
        }
        unsigned int v12 = bswap32(*(_DWORD *)(*(void *)(*(void *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4));
      }
      else
      {
        unsigned int v12 = *(_DWORD *)(*(void *)(*(void *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4);
      }
      unint64_t v15 = BOMStorageSizeOfBlock(*(void *)v10, v12);
      goto LABEL_18;
    }
    unsigned int v13 = *(_DWORD *)(*(void *)(*(void *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4);
    unsigned int v14 = bswap32(v13);
    if ((v11 & 0x40) != 0) {
      return v14;
    }
    else {
      return v13;
    }
  }
  return result;
}

uint64_t BOMTreeIteratorKeySize(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    if ((*(unsigned char *)(result + 57) & 8) != 0) {
      return 0;
    }
    if (((*(unsigned char *)(result + 57) & 1) != 0 || (unsigned int v9 = *(_DWORD **)(result + 8)) == 0
                                             || *v9 != *(_DWORD *)(result + 16))
      && !_revalidateIterator(result, a2, a3, a4, a5, a6, a7, a8))
    {
      uint64_t result = 0;
      *(unsigned char *)(v8 + 57) |= 8u;
      return result;
    }
    uint64_t v10 = *(void *)v8;
    int v11 = *(_DWORD *)(*(void *)v8 + 356);
    if ((v11 & 4) != 0) {
      return 0;
    }
    if ((v11 & 0x40) != 0)
    {
      uint64_t result = *(unsigned int *)(v10 + 348);
      if ((int)result >= 1) {
        return result;
      }
      unsigned int v12 = bswap32(*(_DWORD *)(*(void *)(*(void *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4));
    }
    else
    {
      unsigned int v12 = *(_DWORD *)(*(void *)(*(void *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4);
    }
    uint64_t v13 = *(void *)v10;
    return BOMStorageSizeOfBlock(v13, v12);
  }
  return result;
}

uint64_t BOMTreeRemoveValue(uint64_t a1, void *a2, size_t a3)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      int v5 = *(_DWORD *)(a1 + 356);
      if (a3 || (v5 & 4) != 0)
      {
        if ((v5 & 2) != 0)
        {
          uint64_t v6 = *(void *)(a1 + 24);
          uint64_t result = _findRemove(a1, &v6, 0, 0, 0, 0, a2, a3, 0);
          if (!result)
          {
            --*(_DWORD *)(a1 + 20);
            *(_DWORD *)(a1 + 356) |= 1u;
          }
        }
        else
        {
          _CUILog();
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t BOMTreeIteratorNext(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    if ((*(unsigned char *)(result + 57) & 8) == 0)
    {
      if ((*(unsigned char *)(result + 57) & 1) == 0
        && (unsigned int v9 = *(_DWORD **)(result + 8)) != 0
        && *v9 == *(_DWORD *)(result + 16)
        || (uint64_t result = _revalidateIterator(result, a2, a3, a4, a5, a6, a7, a8), result))
      {
        if (*(unsigned char *)(v8 + 56))
        {
          unsigned int v10 = *(_DWORD *)(v8 + 20) + 1;
          *(_DWORD *)(v8 + 20) = v10;
          uint64_t v11 = *(void *)(v8 + 8);
          if (v10 >= *(unsigned __int16 *)(v11 + 16))
          {
            *(_DWORD *)(v8 + 20) = 0;
            int v12 = *(_DWORD *)(v11 + 8);
            if (!v12
              || (*(_DWORD *)(v8 + 16) = v12,
                  uint64_t result = (uint64_t)_findPage(*(void *)v8, v12),
                  (*(void *)(v8 + 8) = result) == 0))
            {
              *(unsigned char *)(v8 + 57) |= 8u;
            }
          }
        }
        else
        {
          *(unsigned char *)(v8 + 56) = 1;
        }
        char v13 = *(unsigned char *)(v8 + 57) & 0xF9;
      }
      else
      {
        char v13 = *(unsigned char *)(v8 + 57) | 8;
      }
      *(unsigned char *)(v8 + 57) = v13;
    }
  }
  return result;
}

void BOMTreeIteratorFree(unsigned char *a1)
{
  if (a1)
  {
    char v2 = a1[57];
    a1[56] = 0;
    char v3 = v2 | 9;
    a1[57] = v3;
    uint64_t v4 = (void *)*((void *)a1 + 3);
    if (v4 && (*(unsigned char *)(*(void *)a1 + 356) & 4) == 0)
    {
      free(v4);
      *((void *)a1 + 3) = 0;
      char v3 = a1[57];
    }
    char v5 = v3 & 0xFD;
    a1[57] = v5;
    uint64_t v6 = (void *)*((void *)a1 + 5);
    if (v6)
    {
      free(v6);
      *((void *)a1 + 5) = 0;
      char v5 = a1[57];
    }
    a1[57] = v5 & 0xFB;
    *((_DWORD *)a1 + 4) = -1;
    *((void *)a1 + 1) = 0;
    uint64_t v7 = *(void *)a1;
    CFArrayRef v8 = *(const __CFArray **)(*(void *)a1 + 296);
    if (v8)
    {
      CFIndex v9 = BOMCFArrayMaxRange(v8);
      CFIndex v11 = v10;
      v14.location = v9;
      v14.length = v11;
      CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(*(CFArrayRef *)(v7 + 296), v14, a1);
      if (FirstIndexOfValue != -1)
      {
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v7 + 296), FirstIndexOfValue);
        if (!CFArrayGetCount(*(CFArrayRef *)(v7 + 296)))
        {
          CFRelease(*(CFTypeRef *)(v7 + 296));
          *(void *)(v7 + 296) = 0;
        }
      }
    }
    free(a1);
  }
}

uint64_t (*_WritePage(uint64_t a1, uint64_t a2))(void *)
{
  size_t v4 = *(unsigned int *)(a1 + 304);
  if ((*(unsigned char *)(a1 + 356) & 4) == 0)
  {
    int v5 = *(_DWORD *)(a1 + 348);
    if (v5 >= 1) {
      v4 += v5 * (unint64_t)*(unsigned __int16 *)(a2 + 16);
    }
  }
  uint64_t result = (uint64_t (*)(void *))BOMStreamWithBlockID(*(void *)a1, *(_DWORD *)a2, v4, 1);
  if (result)
  {
    char v13 = result;
    BOMStreamWriteUInt16(result, *(_WORD *)(a2 + 4) & 1, v7, v8, v9, v10, v11, v12);
    BOMStreamWriteUInt16(v13, *(unsigned __int16 *)(a2 + 16), v14, v15, v16, v17, v18, v19);
    BOMStreamWriteUInt32(v13, *(unsigned int *)(a2 + 8), v20, v21, v22, v23, v24, v25);
    BOMStreamWriteUInt32(v13, *(unsigned int *)(a2 + 12), v26, v27, v28, v29, v30, v31);
    if (*(_WORD *)(a2 + 16))
    {
      uint64_t v38 = 0;
      unint64_t v39 = 0;
      do
      {
        BOMStreamWriteUInt32(v13, *(unsigned int *)(*(void *)(a2 + 24) + v38), v32, v33, v34, v35, v36, v37);
        BOMStreamWriteUInt32(v13, *(unsigned int *)(*(void *)(a2 + 24) + v38 + 4), v40, v41, v42, v43, v44, v45);
        ++v39;
        unint64_t v46 = *(unsigned __int16 *)(a2 + 16);
        v38 += 8;
      }
      while (v39 < v46);
    }
    else
    {
      unint64_t v46 = 0;
    }
    BOMStreamWriteUInt32(v13, *(unsigned int *)(*(void *)(a2 + 24) + 8 * v46), v32, v33, v34, v35, v36, v37);
    if ((*(unsigned char *)(a1 + 356) & 4) == 0)
    {
      size_t v54 = *(unsigned int *)(a1 + 348);
      if ((int)v54 >= 1)
      {
        uint64_t v55 = BOM_malloc(v54);
        if (*(_WORD *)(a2 + 16))
        {
          unint64_t v56 = 0;
          uint64_t v57 = 4;
          do
          {
            if (BOMStorageSizeOfBlock(*(void *)a1, *(_DWORD *)(*(void *)(a2 + 24) + v57)) != *(_DWORD *)(a1 + 348))
            {
              uint64_t v70 = BOMExceptionHandlerMessage("%s blockSize %d != tree->keySize %d", v58, v59, v60, v61, v62, v63, v64, (char)"_WritePage");
              uint64_t v71 = __error();
              _BOMFatalException(v70, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 1408, *v71);
            }
            BOMStorageCopyFromBlock(*(void *)a1, *(_DWORD *)(*(void *)(a2 + 24) + v57), v55);
            BOMStreamWriteBuffer((uint64_t)v13, v55, *(int *)(a1 + 348), v65, v66, v67, v68, v69);
            ++v56;
            v57 += 8;
          }
          while (v56 < *(unsigned __int16 *)(a2 + 16));
        }
        free(v55);
      }
    }
    uint64_t result = (uint64_t (*)(void *))BOMStreamFree((uint64_t)v13, v47, v48, v49, v50, v51, v52, v53);
    *(_WORD *)(a2 + 4) &= ~2u;
  }
  return result;
}

uint64_t BOMTreeStorage(uint64_t result)
{
  if (result) {
    return *(void *)result;
  }
  return result;
}

uint64_t BOMTreeSetValue(uint64_t a1, void *a2, size_t a3, const void *a4, size_t a5)
{
  BOOL v36 = 0;
  uint64_t v5 = 1;
  if (a1)
  {
    if (a2)
    {
      int v11 = *(_DWORD *)(a1 + 356);
      if (a3 || (v11 & 4) != 0)
      {
        if ((v11 & 2) == 0)
        {
          _CUILog();
          return v5;
        }
        uint64_t v12 = BOMStackNew();
        if (!_findPagesForKey(a1, (char *)v12, a2, a3, v13, v14, v15, v16))
        {
          BOMStackFree(v12);
          return v5;
        }
        if (v12)
        {
          if ((*(unsigned char *)(a1 + 356) & 4) != 0)
          {
            int v25 = (int)a2;
          }
          else
          {
            uint64_t v17 = BOMStackPeek(v12);
            if (!v17)
            {
              int v27 = 0;
              goto LABEL_27;
            }
            uint64_t v18 = v17;
            unsigned int IndexForKey = _findIndexForKey(a1, (uint64_t)v17, a2, a3, &v36);
            if (v36)
            {
              uint64_t v24 = (unsigned int *)(v18[3] + 8 * IndexForKey);
              uint64_t v26 = *v24;
              int v25 = v24[1];
              if (v26)
              {
LABEL_17:
                if (!BOMStorageCopyToBlock(*(void *)a1, v26, a4, a5, v20, v21, v22, v23)
                  && !_PageSetValue(a1, (uint64_t *)v12, a2, a3, v25, v26))
                {
                  if (!v36) {
                    ++*(_DWORD *)(a1 + 20);
                  }
                  uint64_t v5 = 0;
                  *(_DWORD *)(a1 + 356) |= 1u;
                  int v27 = 1;
LABEL_27:
                  while (!BOMStackIsEmpty((uint64_t)v12))
                  {
                    uint64_t v33 = BOMStackPop((uint64_t *)v12);
                    *((_WORD *)v33 + 2) &= ~8u;
                  }
                  BOMStackFree(v12);
                  if (v27)
                  {
                    if ((*(unsigned char *)(a1 + 356) & 4) == 0)
                    {
                      int v34 = *(_DWORD *)(a1 + 348);
                      if (v34 != -1)
                      {
                        if (!v34)
                        {
                          uint64_t v5 = 0;
                          *(_DWORD *)(a1 + 348) = a3;
                          return v5;
                        }
                        if (v34 != a3)
                        {
                          uint64_t v5 = 0;
                          *(_DWORD *)(a1 + 348) = -1;
                          return v5;
                        }
                      }
                    }
                    return 0;
                  }
                  return v5;
                }
LABEL_25:
                int v27 = 0;
                uint64_t v5 = 1;
                goto LABEL_27;
              }
            }
            else
            {
              uint64_t v28 = BOMStorageNewBlock(*(void *)a1);
              if (!v28) {
                goto LABEL_25;
              }
              int v25 = v28;
              if (BOMStorageCopyToBlock(*(void *)a1, v28, a2, a3, v29, v30, v31, v32)) {
                goto LABEL_25;
              }
            }
          }
          uint64_t v26 = BOMStorageNewBlock(*(void *)a1);
          if (!v26) {
            goto LABEL_25;
          }
          goto LABEL_17;
        }
      }
    }
  }
  return v5;
}

uint64_t _findIndexForKey(uint64_t a1, uint64_t a2, void *__s1, size_t a4, BOOL *a5)
{
  if (*(_WORD *)(a2 + 16))
  {
    int v9 = 0;
    int v10 = *(unsigned __int16 *)(a2 + 16) - 1;
    while (1)
    {
      uint64_t v11 = v9 + ((v10 - v9) >> 1);
      unsigned int v12 = *(_DWORD *)(*(void *)(a2 + 24) + 8 * (int)v11 + 4);
      int v13 = *(_DWORD *)(a1 + 356);
      unsigned int v14 = bswap32(v12);
      if ((v13 & 0x40) != 0) {
        unint64_t v15 = v14;
      }
      else {
        unint64_t v15 = v12;
      }
      if (!v15)
      {
        unint64_t v15 = 0;
LABEL_18:
        unint64_t v16 = 0;
        goto LABEL_27;
      }
      if ((v13 & 4) != 0) {
        goto LABEL_18;
      }
      if ((v13 & 0x40) != 0)
      {
        unint64_t v16 = *(unsigned int *)(a1 + 348);
        if ((int)v16 >= 1) {
          goto LABEL_12;
        }
        unsigned int v12 = v14;
      }
      unint64_t v16 = BOMStorageSizeOfBlock(*(void *)a1, v12);
LABEL_12:
      unint64_t v17 = *(unsigned int *)(a1 + 344);
      unint64_t v15 = *(void *)(a1 + 336);
      if (v16 > v17)
      {
        unint64_t v18 = (2 * v17);
        if (v16 > v18) {
          LODWORD(v18) = v16;
        }
        *(_DWORD *)(a1 + 344) = v18;
        if (v15)
        {
          free((void *)v15);
          *(void *)(a1 + 336) = 0;
          size_t v19 = *(unsigned int *)(a1 + 344);
        }
        else
        {
          size_t v19 = v18;
        }
        unint64_t v15 = (unint64_t)BOM_malloc(v19);
        *(void *)(a1 + 336) = v15;
      }
      if ((*(unsigned char *)(a1 + 356) & 0x40) != 0)
      {
        size_t v21 = *(unsigned int *)(a1 + 348);
        if ((int)v21 >= 1)
        {
          memcpy((void *)v15, (const void *)(*(void *)(a2 + 32) + v21 * (int)v11), v21);
          goto LABEL_27;
        }
        unsigned int v20 = bswap32(*(_DWORD *)(*(void *)(a2 + 24) + 8 * (int)v11 + 4));
      }
      else
      {
        unsigned int v20 = *(_DWORD *)(*(void *)(a2 + 24) + 8 * (int)v11 + 4);
      }
      BOMStorageCopyFromBlock(*(void *)a1, v20, (void *)v15);
LABEL_27:
      if ((*(unsigned char *)(a1 + 356) & 4) != 0)
      {
        if (v15 <= (unint64_t)__s1) {
          int v24 = 0;
        }
        else {
          int v24 = -1;
        }
        if (v15 < (unint64_t)__s1) {
          int v23 = 1;
        }
        else {
          int v23 = v24;
        }
        goto LABEL_43;
      }
      if ((void *)v15 == __s1)
      {
        if (!a5) {
          return v11;
        }
        int v23 = 0;
        BOOL v25 = 1;
        goto LABEL_47;
      }
      if (__s1)
      {
        if (!v15)
        {
          int v23 = 1;
          goto LABEL_43;
        }
        if (a4 >= v16) {
          size_t v22 = v16;
        }
        else {
          size_t v22 = a4;
        }
        int v23 = memcmp(__s1, (const void *)v15, v22);
        if (v23) {
          goto LABEL_43;
        }
        if (v16 <= a4)
        {
          int v23 = v16 < a4;
          goto LABEL_43;
        }
      }
      int v23 = -1;
LABEL_43:
      if (!a5) {
        goto LABEL_48;
      }
      BOOL v25 = v23 == 0;
LABEL_47:
      *a5 = v25;
LABEL_48:
      if (v10 == v9)
      {
        if (v23 <= 0) {
          return v11;
        }
        else {
          return (v11 + 1);
        }
      }
      if (v23 >= 1)
      {
        if (v11 == v10) {
          v9 += (v10 - v9) >> 1;
        }
        else {
          int v9 = v11 + 1;
        }
      }
      else
      {
        if ((v23 & 0x80000000) == 0) {
          return v11;
        }
        int v10 = v11 - ((v10 - v9) > 1);
      }
    }
  }
  uint64_t v11 = 0;
  if (a5) {
    *a5 = 0;
  }
  return v11;
}

uint64_t _PageSetValue(uint64_t a1, uint64_t *a2, void *a3, size_t a4, int a5, int a6)
{
  BOOL v53 = 0;
  uint64_t v6 = 1;
  if (a5)
  {
    if (a6)
    {
      int v13 = BOMStackPop(a2);
      if (v13)
      {
        uint64_t v14 = (uint64_t)v13;
        BOOL v15 = (*((_WORD *)v13 + 2) & 1) == 0;
        _invalidateIteratorsForPageID(a1, *(_DWORD *)v13);
        unsigned int IndexForKey = _findIndexForKey(a1, v14, a3, a4, &v53);
        uint64_t v17 = *(void *)(v14 + 24);
        if (v53)
        {
          unsigned __int16 v18 = *(_WORD *)(v14 + 16);
        }
        else
        {
          if (*(_DWORD *)(v17 + 8 * IndexForKey + 4))
          {
            int v19 = *(_DWORD *)(a1 + 356);
            if ((v19 & 8) != 0)
            {
              *(_DWORD *)(a1 + 356) = v19 & 0xFFFFFFF7;
              uint64_t v17 = *(void *)(v14 + 24);
            }
            int v20 = *(unsigned __int16 *)(v14 + 16);
            LODWORD(v21) = v20 - IndexForKey;
            if (v20 != IndexForKey)
            {
              if (v21 <= 1) {
                uint64_t v21 = 1;
              }
              else {
                uint64_t v21 = v21;
              }
              unsigned int v22 = v15 + v20;
              unsigned int v23 = *(unsigned __int16 *)(v14 + 16);
              do
              {
                uint64_t v24 = v17 + 8 * v23--;
                uint64_t v25 = 8 * v22--;
                int v26 = *(_DWORD *)(v17 + 8 * v22);
                *(_DWORD *)(v24 + 4) = *(_DWORD *)(v17 + 8 * v23 + 4);
                *(_DWORD *)(v17 + v25) = v26;
                --v21;
              }
              while (v21);
            }
          }
          else
          {
            LOWORD(v20) = *(_WORD *)(v14 + 16);
          }
          *(_DWORD *)(v17 + 8 * IndexForKey + 4) = a5;
          unsigned __int16 v18 = v20 + 1;
          *(_WORD *)(v14 + 16) = v20 + 1;
        }
        *(_DWORD *)(v17 + 8 * (IndexForKey + v15)) = a6;
        *(_WORD *)(v14 + 4) |= 2u;
        if (*(_DWORD *)(a1 + 308) >= v18)
        {
          uint64_t v6 = 0;
        }
        else
        {
          int v27 = _NewPage(a1, 0);
          if (v27)
          {
            uint64_t v28 = (unsigned int *)v27;
            *((_WORD *)v27 + 2) = *((_WORD *)v27 + 2) & 0xFFFC | *(_WORD *)(v14 + 4) & 1 | 2;
            if ((*(_WORD *)(v14 + 4) & 1) == 0
              || (int v29 = *(_DWORD *)v27,
                  int v30 = *(_DWORD *)v14,
                  *((_DWORD *)v27 + 2) = *(_DWORD *)(v14 + 8),
                  *(_DWORD *)(v14 + 8) = v29,
                  *((_DWORD *)v27 + 3) = v30,
                  (int v31 = *((_DWORD *)v27 + 2)) == 0))
            {
LABEL_25:
              if ((*(unsigned char *)(a1 + 356) & 8) != 0)
              {
                LODWORD(v34) = *(_DWORD *)(a1 + 308) - 1;
                unsigned int v33 = *(unsigned __int16 *)(v14 + 16);
              }
              else
              {
                unsigned int v33 = *(unsigned __int16 *)(v14 + 16);
                LODWORD(v34) = v33 >> 1;
              }
              uint64_t v35 = *(void *)(v14 + 24);
              uint64_t v36 = *((void *)v28 + 3);
              if ((int)v34 + 1 >= (int)v33)
              {
                unsigned __int16 v38 = *((_WORD *)v28 + 8);
                uint64_t v34 = (int)v34;
                uint64_t v40 = v33;
              }
              else
              {
                uint64_t v34 = (int)v34;
                uint64_t v37 = (int)v34 + 1;
                unsigned __int16 v38 = *((_WORD *)v28 + 8);
                do
                {
                  unint64_t v39 = (void *)(v35 + 8 * v37);
                  *(void *)(v36 + 8 * v38++) = *v39;
                  *((_WORD *)v28 + 8) = v38;
                  void *v39 = 0;
                  ++v37;
                  uint64_t v40 = *(unsigned __int16 *)(v14 + 16);
                }
                while (v37 < v40);
                LOWORD(v33) = *(_WORD *)(v14 + 16);
              }
              uint64_t v41 = 8 * v40;
              *(_DWORD *)(v36 + 8 * v38) = *(_DWORD *)(v35 + v41);
              *(_DWORD *)(v35 + v41) = 0;
              *(_WORD *)(v14 + 16) = v33 - v38;
              uint64_t v42 = v35 + 8 * v34;
              unsigned int v45 = *(_DWORD *)(v42 + 4);
              uint64_t v43 = (_DWORD *)(v42 + 4);
              uint64_t v44 = v45;
              if ((*(unsigned char *)(v14 + 4) & 1) == 0)
              {
                _DWORD *v43 = 0;
                *(_WORD *)(v14 + 16) = v33 - v38 - 1;
              }
              _addPageToCache(a1, (uint64_t)v28);
              if (BOMStackIsEmpty((uint64_t)a2))
              {
                unint64_t v46 = _NewPage(a1, 0);
                uint64_t v6 = 1;
                if (v46)
                {
                  uint64_t v47 = v46;
                  uint64_t v48 = (_DWORD *)v46[3];
                  *uint64_t v48 = *(_DWORD *)v14;
                  v48[1] = v44;
                  v48[2] = *v28;
                  *((_WORD *)v46 + 8) = 1;
                  *((_WORD *)v46 + 2) |= 2u;
                  _addPageToCache(a1, v14);
                  uint64_t v6 = 0;
                  *(void *)(a1 + 24) = v47;
                }
              }
              else
              {
                uint64_t v6 = _PageSetValue(a1, a2, a3, a4, v44, *v28);
              }
              goto LABEL_44;
            }
            Page = _findPage(a1, v31);
            if (Page)
            {
              if (*((_DWORD *)Page + 3) == *(_DWORD *)v14)
              {
                *((_DWORD *)Page + 3) = *v28;
                *((_WORD *)Page + 2) |= 2u;
                goto LABEL_25;
              }
              int v49 = *__error();
              uint64_t v50 = "internal btree error";
              uint64_t v6 = 1;
              int v51 = 2201;
            }
            else
            {
              int v49 = *__error();
              uint64_t v50 = "missing tree page";
              uint64_t v6 = 1;
              int v51 = 2197;
            }
            _BOMExceptionHandlerCall(v50, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", v51, v49);
          }
          else
          {
            uint64_t v6 = 1;
          }
        }
LABEL_44:
        *(_WORD *)(v14 + 4) &= ~8u;
      }
    }
  }
  return v6;
}

uint64_t BOMTreeGetValueSize(uint64_t a1, void *a2, size_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = 1;
  if (a1 && a2 && a4 && (a3 || (*(unsigned char *)(a1 + 356) & 4) != 0))
  {
    uint64_t PagesForKey = _findPagesForKey(a1, 0, a2, a3, a5, a6, a7, a8);
    if (PagesForKey && (v14 = PagesForKey, BOOL v19 = 0, IndexForKey = _findIndexForKey(a1, PagesForKey, a2, a3, &v19), v19))
    {
      unsigned int v16 = bswap32(*(_DWORD *)(*(void *)(v14 + 24) + 8 * IndexForKey));
      if ((*(_DWORD *)(a1 + 356) & 0x40) != 0) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = *(_DWORD *)(*(void *)(v14 + 24) + 8 * IndexForKey);
      }
      uint64_t v18 = BOMStorageSizeOfBlock(*(void *)a1, v17);
      uint64_t result = 0;
      *a4 = v18;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t BOMTreeValueExists(uint64_t a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = 0;
  BOOL v12 = 0;
  if (a1 && a2)
  {
    if (a3 || (*(unsigned char *)(a1 + 356) & 4) != 0)
    {
      uint64_t result = _findPagesForKey(a1, 0, a2, a3, a5, a6, a7, a8);
      if (result)
      {
        _findIndexForKey(a1, result, a2, a3, &v12);
        return v12;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

unint64_t BOMTreeGetValue(uint64_t a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t result = 0;
  BOOL v22 = 0;
  if (a1 && a2)
  {
    if (!a3 && (*(unsigned char *)(a1 + 356) & 4) == 0) {
      return 0;
    }
    unint64_t result = _findPagesForKey(a1, 0, a2, a3, a5, a6, a7, a8);
    if (!result) {
      return result;
    }
    unint64_t v12 = result;
    int IndexForKey = _findIndexForKey(a1, result, a2, a3, &v22);
    if (!v22) {
      return 0;
    }
    int v14 = IndexForKey;
    unsigned int v15 = bswap32(*(_DWORD *)(*(void *)(v12 + 24) + 8 * IndexForKey));
    unsigned int v16 = (*(_DWORD *)(a1 + 356) & 0x40) != 0 ? v15 : *(_DWORD *)(*(void *)(v12 + 24) + 8 * IndexForKey);
    unint64_t result = BOMStorageSizeOfBlock(*(void *)a1, v16);
    if (result)
    {
      unint64_t v17 = result;
      uint64_t v18 = *(void **)(a1 + 320);
      if (v18)
      {
        if (result <= *(unsigned int *)(a1 + 328)) {
          goto LABEL_19;
        }
        free(*(void **)(a1 + 320));
        *(void *)(a1 + 320) = 0;
        unint64_t v19 = (2 * *(_DWORD *)(a1 + 328));
        if (v17 <= v19) {
          unint64_t result = v19;
        }
        else {
          unint64_t result = v17;
        }
        *(_DWORD *)(a1 + 328) = result;
      }
      else
      {
        *(_DWORD *)(a1 + 328) = result;
        unint64_t result = result;
      }
      uint64_t v18 = BOM_malloc(result);
      *(void *)(a1 + 320) = v18;
LABEL_19:
      unsigned int v20 = bswap32(*(_DWORD *)(*(void *)(v12 + 24) + 8 * v14));
      if ((*(_DWORD *)(a1 + 356) & 0x40) != 0) {
        unsigned int v21 = v20;
      }
      else {
        unsigned int v21 = *(_DWORD *)(*(void *)(v12 + 24) + 8 * v14);
      }
      if (!BOMStorageCopyFromBlock(*(void *)a1, v21, v18)) {
        return *(void *)(a1 + 320);
      }
      return 0;
    }
  }
  return result;
}

uint64_t BOMTreeReadValue(uint64_t a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = 0;
  BOOL v16 = 0;
  if (a1 && a2)
  {
    if (!a3 && (*(unsigned char *)(a1 + 356) & 4) == 0) {
      return 0;
    }
    uint64_t result = _findPagesForKey(a1, 0, a2, a3, a5, a6, a7, a8);
    if (!result) {
      return result;
    }
    uint64_t v12 = result;
    int IndexForKey = _findIndexForKey(a1, result, a2, a3, &v16);
    if (v16)
    {
      unsigned int v14 = bswap32(*(_DWORD *)(*(void *)(v12 + 24) + 8 * IndexForKey));
      if ((*(_DWORD *)(a1 + 356) & 0x40) != 0) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = *(_DWORD *)(*(void *)(v12 + 24) + 8 * IndexForKey);
      }
      return BOMStorageReadFromBlock(*(void *)a1, v15);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _findRemove(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, size_t a8, char *a9)
{
  unsigned int v14 = a2;
  uint64_t v15 = a1;
  BOOL v16 = a9;
  BOOL v79 = 0;
  uint64_t v17 = *a2;
  unsigned int v78 = 0;
  char v77 = 0;
  if (!a9) {
    BOOL v16 = &v77;
  }
  uint64_t v76 = v16;
  unsigned int IndexForKey = _findIndexForKey(a1, v17, a7, a8, &v79);
  unsigned int v19 = IndexForKey;
  *(_DWORD *)(v17 + 20) = IndexForKey;
  if (*(unsigned char *)(v17 + 4))
  {
    BOOL v23 = v79;
    uint64_t result = 1;
    if (!v79) {
      return result;
    }
LABEL_42:
    if (v23)
    {
      _invalidateIteratorsForPageID(v15, *(_DWORD *)v17);
LABEL_45:
      unsigned int v33 = *(unsigned __int16 *)(v17 + 16);
      uint64_t v34 = *(void *)(v17 + 24);
      LODWORD(v35) = v33 - v19;
      if (v33 == v19)
      {
        unsigned int v36 = 0;
        unsigned int v37 = 0;
        *(_DWORD *)(v34 + 8 * (v19 - 1) + 4) = 0;
      }
      else
      {
        unsigned __int16 v38 = (unsigned int *)(v34 + 8 * v19);
        unsigned int v37 = *v38;
        unsigned int v36 = v38[1];
        if (v35 <= 1) {
          uint64_t v35 = 1;
        }
        else {
          uint64_t v35 = v35;
        }
        unsigned int v39 = v19;
        do
        {
          *(void *)(v34 + 8 * v39) = *(void *)(v34 + 8 * (v39 + 1));
          ++v39;
          --v35;
        }
        while (v35);
      }
      *(_DWORD *)(v34 + 8 * v33) = 0;
      *(_WORD *)(v17 + 16) = v33 - 1;
      if (*(_WORD *)(v17 + 4))
      {
        if ((*(unsigned char *)(v15 + 356) & 4) == 0 && v36) {
          BOMStorageFreeBlock(*(void *)v15, v36);
        }
        if (v37) {
          BOMStorageFreeBlock(*(void *)v15, v37);
        }
      }
      __int16 v40 = *(_WORD *)(v17 + 4);
      *(_WORD *)(v17 + 4) = v40 | 2;
      unsigned int v41 = *(unsigned __int16 *)(v17 + 16);
      if ((v40 & 1) != 0 && a6 && v19 == v41)
      {
        *(_DWORD *)(*(void *)(a6 + 24) + 8 * *(unsigned int *)(a6 + 20) + 4) = *(_DWORD *)(*(void *)(v17 + 24)
                                                                                             + 8 * (v19 - 1)
                                                                                             + 4);
        *(_WORD *)(a6 + 4) |= 2u;
        unsigned int v41 = *(unsigned __int16 *)(v17 + 16);
      }
      unsigned int v42 = *(_DWORD *)(v15 + 316);
      if (v42 <= v41)
      {
        uint64_t result = 0;
        *uint64_t v76 = 0;
        return result;
      }
      if (v17 != *(void *)(v15 + 24))
      {
        uint64_t v43 = (_WORD *)*v14;
        if (!(a3 | a4))
        {
LABEL_111:
          uint64_t result = 0;
          uint64_t *v14 = (uint64_t)v43;
          return result;
        }
        uint64_t v71 = a3;
        uint64_t v73 = v14;
        if (a3) {
          uint64_t v44 = a3;
        }
        else {
          uint64_t v44 = a4;
        }
        uint64_t v45 = a5;
        if (!a3) {
          uint64_t v45 = a6;
        }
        if (a4) {
          BOOL v46 = a3 != 0;
        }
        else {
          BOOL v46 = 0;
        }
        BOOL v70 = v46;
        if (v46)
        {
          unsigned int v47 = *(unsigned __int16 *)(a3 + 16);
          unsigned int v48 = *(unsigned __int16 *)(a4 + 16);
          if (v47 >= v48)
          {
            if (v47 <= v48)
            {
              int v51 = *(_DWORD *)(*(void *)(a6 + 24) + 8 * *(unsigned int *)(a6 + 20));
              if (*(_DWORD *)v43 == v51) {
                uint64_t v44 = a4;
              }
              else {
                uint64_t v44 = a3;
              }
              if (*(_DWORD *)v43 != v51) {
                a6 = a5;
              }
            }
            else
            {
              uint64_t v44 = a3;
              a6 = a5;
            }
          }
          else
          {
            uint64_t v44 = a4;
          }
        }
        else
        {
          a6 = v45;
        }
        unsigned int v52 = *(unsigned __int16 *)(v44 + 16);
        uint64_t v53 = a4;
        BOOL v54 = v44 == a4;
        BOOL v55 = v44 == a4;
        if (v54) {
          unint64_t v56 = (_WORD *)*v14;
        }
        else {
          unint64_t v56 = (_WORD *)v44;
        }
        if (v43[2]) {
          _invalidateIteratorsForPageID(v15, *(_DWORD *)v44);
        }
        uint64_t v57 = a6;
        int v58 = *(_DWORD *)(a6 + 20) - (v44 != v53);
        if ((v56[2] & 1) == 0)
        {
          uint64_t v59 = (unsigned __int16)v56[8];
          *(_DWORD *)(*((void *)v56 + 3) + 8 * v59 + 4) = *(_DWORD *)(*(void *)(v57 + 24) + 8 * v58 + 4);
          v56[8] = v59 + 1;
          v56[2] |= 2u;
        }
        if (v42 < v52)
        {
          _shiftKeysAndValues(v15, (uint64_t)v43, v44, v55);
          int v60 = *(_DWORD *)(*((void *)v56 + 3) + 8 * (unsigned __int16)v56[8] - 4);
          uint64_t v61 = *(void *)(v57 + 24) + 8 * v58;
          int v63 = *(_DWORD *)(v61 + 4);
          uint64_t v62 = (_DWORD *)(v61 + 4);
          if (v63 != v60)
          {
            *uint64_t v62 = v60;
            *(_WORD *)(v57 + 4) |= 2u;
          }
          unsigned int v14 = v73;
          char v64 = 0;
          if ((v56[2] & 1) == 0)
          {
            unsigned __int16 v65 = v56[8] - 1;
            v56[8] = v65;
            *(_DWORD *)(*((void *)v56 + 3) + 8 * v65 + 4) = 0;
            v56[2] |= 2u;
          }
          goto LABEL_110;
        }
        _shiftKeysAndValues(v15, v44, (uint64_t)v43, v44 != v53);
        if (v70)
        {
          unsigned int v14 = v73;
          *(_DWORD *)(v71 + 8) = *(_DWORD *)v53;
          *(_DWORD *)(v53 + 12) = *(_DWORD *)v71;
          *(_WORD *)(v71 + 4) |= 2u;
        }
        else if (v71)
        {
          *(_DWORD *)(v71 + 8) = 0;
          uint64_t v53 = v71;
          unsigned int v14 = v73;
        }
        else
        {
          unsigned int v14 = v73;
          if (!v53)
          {
LABEL_109:
            v43[2] &= ~8u;
            _removePageFromCache(v15, v43);
            BOMStorageFreeBlock(*(void *)v15, *(_DWORD *)v43);
            _FreePage(v15, v43);
            uint64_t v43 = 0;
            char v64 = 1;
LABEL_110:
            *uint64_t v76 = v64;
            goto LABEL_111;
          }
          *(_DWORD *)(v53 + 12) = 0;
        }
        *(_WORD *)(v53 + 4) |= 2u;
        goto LABEL_109;
      }
      if (!(*(_WORD *)(v17 + 4) & 1 | v41))
      {
        int v49 = **(_DWORD **)(v17 + 24);
        if (v49)
        {
          Page = _findPage(v15, v49);
          Page[2] &= ~8u;
          _removePageFromCache(v15, Page);
          *(void *)(v15 + 24) = Page;
          BOMStorageFreeBlock(*(void *)v15, *(_DWORD *)v17);
          _FreePage(v15, (void *)v17);
        }
      }
      return 0;
    }
LABEL_44:
    if (!*v76) {
      return 0;
    }
    goto LABEL_45;
  }
  uint64_t v74 = a6;
  if (IndexForKey)
  {
    uint64_t v20 = v15;
    unsigned int v21 = _findPage(v15, *(_DWORD *)(*(void *)(v17 + 24) + 8 * (IndexForKey - 1)));
    __int16 v22 = *((_WORD *)v21 + 2);
    if ((v22 & 8) == 0)
    {
      uint64_t v67 = v17;
LABEL_12:
      char v25 = 0;
      *((_WORD *)v21 + 2) = v22 | 8;
      goto LABEL_16;
    }
    char v25 = 1;
    uint64_t v67 = v17;
  }
  else if (a3)
  {
    uint64_t v20 = v15;
    unsigned int v21 = _findPage(v15, *(_DWORD *)(*(void *)(a3 + 24) + 8 * *(unsigned __int16 *)(a3 + 16)));
    __int16 v22 = *((_WORD *)v21 + 2);
    if ((v22 & 8) == 0)
    {
      uint64_t v67 = a5;
      goto LABEL_12;
    }
    char v25 = 1;
    uint64_t v67 = a5;
  }
  else
  {
    uint64_t v20 = v15;
    uint64_t v67 = 0;
    unsigned int v21 = 0;
    char v25 = 1;
  }
LABEL_16:
  uint64_t v72 = v14;
  size_t v69 = a8;
  uint64_t v68 = a7;
  if (v19 == *(unsigned __int16 *)(v17 + 16))
  {
    if (a4)
    {
      int v26 = _findPage(v20, **(_DWORD **)(a4 + 24));
      __int16 v27 = *((_WORD *)v26 + 2);
      if ((v27 & 8) == 0)
      {
        uint64_t v28 = v74;
LABEL_22:
        char v29 = 0;
        *((_WORD *)v26 + 2) = v27 | 8;
        goto LABEL_26;
      }
      char v29 = 1;
      uint64_t v28 = v74;
    }
    else
    {
      uint64_t v28 = 0;
      int v26 = 0;
      char v29 = 1;
    }
  }
  else
  {
    int v26 = _findPage(v20, *(_DWORD *)(*(void *)(v17 + 24) + 8 * (v19 + 1)));
    __int16 v27 = *((_WORD *)v26 + 2);
    if ((v27 & 8) == 0)
    {
      uint64_t v28 = v17;
      goto LABEL_22;
    }
    char v29 = 1;
    uint64_t v28 = v17;
  }
LABEL_26:
  int v30 = _findPage(v20, *(_DWORD *)(*(void *)(v17 + 24) + 8 * v19));
  unsigned int v78 = v30;
  if (!v30)
  {
    uint64_t v66 = __error();
    _BOMFatalException("BOMTree in invalid state - nextNode is NULL!", "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 1810, *v66);
  }
  uint64_t v31 = v28;
  __int16 v32 = *((_WORD *)v30 + 2);
  if ((v32 & 8) == 0) {
    *((_WORD *)v30 + 2) = v32 | 8;
  }
  if (a3) {
    *(_WORD *)(a3 + 4) &= ~4u;
  }
  if (a4) {
    *(_WORD *)(a4 + 4) &= ~4u;
  }
  *((_WORD *)v30 + 2) &= ~4u;
  uint64_t result = _findRemove(v20, &v78, v21, v26, v67, v31, v68, v69, v76);
  if ((v25 & 1) == 0) {
    *((_WORD *)v21 + 2) &= ~8u;
  }
  if ((v29 & 1) == 0) {
    *((_WORD *)v26 + 2) &= ~8u;
  }
  uint64_t v15 = v20;
  if ((v32 & 8) == 0 && v78) {
    *((_WORD *)v78 + 2) &= ~8u;
  }
  unsigned int v14 = v72;
  a6 = v74;
  if (!result)
  {
    BOOL v23 = v79;
    if ((*(_WORD *)(v17 + 4) & 1) == 0) {
      goto LABEL_44;
    }
    goto LABEL_42;
  }
  return result;
}

_DWORD *BOMTreeIteratorSet(uint64_t a1, void *a2, size_t a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(a1 + 57) &= 0xF6u;
  uint64_t result = (_DWORD *)_findPagesForKey(*(void *)a1, 0, a2, a3, a5, a6, a7, a8);
  *(void *)(a1 + 8) = result;
  if (result)
  {
    *(_DWORD *)(a1 + 16) = *result;
    uint64_t result = (_DWORD *)_findIndexForKey(*(void *)a1, (uint64_t)result, a2, a3, a4);
    *(_DWORD *)(a1 + 20) = result;
    *(unsigned char *)(a1 + 56) = 1;
    uint64_t v13 = *(void *)(a1 + 8);
    if (result >= *(unsigned __int16 *)(v13 + 16))
    {
      *(_DWORD *)(a1 + 20) = 0;
      int v14 = *(_DWORD *)(v13 + 8);
      if (!v14
        || (*(_DWORD *)(a1 + 16) = v14, uint64_t result = _findPage(*(void *)a1, v14), (*(void *)(a1 + 8) = result) == 0))
      {
        *(unsigned char *)(a1 + 57) |= 8u;
      }
    }
  }
  else
  {
    *(unsigned char *)(a1 + 57) |= 8u;
    *(unsigned char *)(a1 + 56) = 0;
  }
  return result;
}

void *_findPage(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a1)
    {
      uint64_t v4 = 0;
      while (1)
      {
        uint64_t v5 = *(void **)(a1 + 32 + v4);
        if (v5)
        {
          if (*(_DWORD *)v5 == a2) {
            break;
          }
        }
        v4 += 8;
        if (v4 == 256) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      uint64_t v5 = 0;
    }
    int v6 = 0;
    while (1)
    {
      if (v5) {
        return v5;
      }
      uint64_t v7 = *(int *)(a1 + 288);
      uint64_t v5 = *(void **)(a1 + 8 * v7 + 32);
      if (!v5)
      {
        uint64_t v5 = _NewPage(a1, a2);
        if (!v5) {
          return v5;
        }
        if (_ReadPage(a1, (uint64_t)v5)) {
          return 0;
        }
        uint64_t v7 = *(int *)(a1 + 288);
        *(void *)(a1 + 8 * v7 + 32) = v5;
        goto LABEL_26;
      }
      __int16 v8 = *((_WORD *)v5 + 2);
      if ((v8 & 0xC) == 4) {
        break;
      }
      if ((v8 & 4) != 0)
      {
        uint64_t v5 = 0;
LABEL_26:
        int v12 = v6;
        goto LABEL_27;
      }
      int v12 = 0;
      *((_WORD *)v5 + 2) = v8 | 4;
      LODWORD(v7) = *(_DWORD *)(a1 + 288);
      uint64_t v5 = 0;
LABEL_27:
      int v13 = v7 + 1;
      BOOL v14 = -v13 < 0;
      int v15 = -v13 & 0x1F;
      int v16 = v13 & 0x1F;
      if (!v14) {
        int v16 = -v15;
      }
      *(_DWORD *)(a1 + 288) = v16;
      int v6 = v12 + 1;
      if (!v5 && v12 >= 32)
      {
        uint64_t v17 = __error();
        _BOMExceptionHandlerCall("btree cache is deadlocked", 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 2347, *v17);
        return 0;
      }
    }
    if ((v8 & 2) != 0) {
      _WritePage(a1, (uint64_t)v5);
    }
    int v9 = 0;
    int v10 = (void *)v5[3];
    v5[4] = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    if ((*(unsigned char *)(a1 + 356) & 0x40) == 0)
    {
      unsigned int v11 = *(_DWORD *)(a1 + 308);
      if (v11 <= *(_DWORD *)(a1 + 312)) {
        unsigned int v11 = *(_DWORD *)(a1 + 312);
      }
      bzero(v10, 8 * v11);
      int v9 = v10;
    }
    *(_DWORD *)uint64_t v5 = a2;
    v5[1] = -1;
    v5[3] = v9;
    v5[4] = 0;
    if (_ReadPage(a1, (uint64_t)v5)) {
      return 0;
    }
    uint64_t v7 = *(int *)(a1 + 288);
    *(void *)(a1 + 8 * v7 + 32) = v5;
    goto LABEL_26;
  }
  return 0;
}

uint64_t _revalidateIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t PagesForKey = _findPagesForKey(*(void *)a1, 0, *(void **)(a1 + 24), *(void *)(a1 + 32), a5, a6, a7, a8);
    *(void *)(a1 + 8) = PagesForKey;
    if (!PagesForKey)
    {
      *(unsigned char *)(a1 + 57) |= 1u;
      goto LABEL_12;
    }
    int IndexForKey = _findIndexForKey(*(void *)a1, PagesForKey, *(void **)(a1 + 24), *(void *)(a1 + 32), (BOOL *)(a1 + 56));
    Page = *(void **)(a1 + 8);
    *(_DWORD *)(a1 + 16) = *(_DWORD *)Page;
    *(_DWORD *)(a1 + 20) = IndexForKey;
    *(unsigned char *)(a1 + 57) &= ~1u;
    goto LABEL_9;
  }
  Page = *(void **)(a1 + 8);
  if (!Page)
  {
    int v10 = *(_DWORD *)(a1 + 16);
LABEL_8:
    Page = _findPage(*(void *)a1, v10);
    *(void *)(a1 + 8) = Page;
    if (!Page) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  int v10 = *(_DWORD *)(a1 + 16);
  if (*(_DWORD *)Page != v10) {
    goto LABEL_8;
  }
LABEL_9:
  if (*(_DWORD *)(a1 + 20) < *((unsigned __int16 *)Page + 8)) {
    return 1;
  }
LABEL_12:
  uint64_t result = 0;
  *(unsigned char *)(a1 + 57) |= 1u;
  return result;
}

uint64_t BOMTreeIteratorValueSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || (*(unsigned char *)(a1 + 57) & 8) != 0) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 57) & 1) != 0 || (uint64_t v9 = *(void *)(a1 + 8)) == 0 || *(_DWORD *)v9 != *(_DWORD *)(a1 + 16))
  {
    if (_revalidateIterator(a1, a2, a3, a4, a5, a6, a7, a8))
    {
      uint64_t v9 = *(void *)(a1 + 8);
      goto LABEL_8;
    }
    *(unsigned char *)(a1 + 57) |= 8u;
    return 0;
  }
LABEL_8:
  uint64_t v10 = **(void **)a1;
  unsigned int v11 = *(_DWORD *)(*(void *)(v9 + 24) + 8 * *(int *)(a1 + 20));
  unsigned int v12 = bswap32(v11);
  if ((*(_DWORD *)(*(void *)a1 + 356) & 0x40) != 0) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = v11;
  }

  return BOMStorageSizeOfBlock(v10, v13);
}

uint64_t BOMTreeIteratorValue(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    char v9 = *(unsigned char *)(result + 57);
    if ((v9 & 8) != 0) {
      return 0;
    }
    if ((*(unsigned char *)(result + 57) & 1) == 0
      && (uint64_t v10 = *(_DWORD **)(result + 8)) != 0
      && *v10 == *(_DWORD *)(result + 16)
      || (v11 = _revalidateIterator(result, a2, a3, a4, a5, a6, a7, a8), char v9 = *(unsigned char *)(v8 + 57), v11))
    {
      if ((v9 & 4) == 0)
      {
        unsigned int v12 = bswap32(*(_DWORD *)(*(void *)(*(void *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20)));
        if ((*(_DWORD *)(*(void *)v8 + 356) & 0x40) != 0) {
          unsigned int v13 = v12;
        }
        else {
          unsigned int v13 = *(_DWORD *)(*(void *)(*(void *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20));
        }
        unint64_t v14 = BOMStorageSizeOfBlock(**(void **)v8, v13);
        unint64_t v15 = *(void *)(v8 + 48);
        if (v14 > v15)
        {
          unint64_t v16 = v14;
          uint64_t v17 = *(void **)(v8 + 40);
          if (v17)
          {
            free(v17);
            *(void *)(v8 + 40) = 0;
            unint64_t v15 = *(void *)(v8 + 48);
          }
          if (v16 <= 2 * v15) {
            size_t v18 = 2 * v15;
          }
          else {
            size_t v18 = v16;
          }
          *(void *)(v8 + 48) = v18;
          *(void *)(v8 + 40) = BOM_malloc(v18);
        }
        unsigned int v19 = bswap32(*(_DWORD *)(*(void *)(*(void *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20)));
        if ((*(_DWORD *)(*(void *)v8 + 356) & 0x40) != 0) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = *(_DWORD *)(*(void *)(*(void *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20));
        }
        if (BOMStorageCopyFromBlock(**(void **)v8, v20, *(void **)(v8 + 40))) {
          return 0;
        }
        *(unsigned char *)(v8 + 57) |= 4u;
      }
      return *(void *)(v8 + 40);
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)(v8 + 57) = v9 | 8;
    }
  }
  return result;
}

uint64_t _BOMTreeDiagnosticTraverse(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, void *a6, void *a7)
{
  if (!a1) {
    return 1;
  }
  uint64_t v12 = a2;
  if (!a2) {
    uint64_t v12 = *(void *)(a1 + 24);
  }
  *a3 = BOMStorageSizeOfBlock(*(void *)a1, *(_DWORD *)v12);
  if (*(_WORD *)(v12 + 4))
  {
    if (a4) {
      ++*a4;
    }
    if (*(_WORD *)(v12 + 16))
    {
      uint64_t v21 = 0;
      unint64_t v22 = 0;
      do
      {
        if (a6)
        {
          int v23 = *(_DWORD *)(a1 + 356);
          if ((v23 & 4) == 0)
          {
            unsigned int v24 = bswap32(*(_DWORD *)(*(void *)(v12 + 24) + v21 + 4));
            if ((v23 & 0x40) != 0) {
              unsigned int v25 = v24;
            }
            else {
              unsigned int v25 = *(_DWORD *)(*(void *)(v12 + 24) + v21 + 4);
            }
            *a6 += BOMStorageSizeOfBlock(*(void *)a1, v25);
          }
        }
        if (a7)
        {
          unsigned int v26 = bswap32(*(_DWORD *)(*(void *)(v12 + 24) + v21));
          if ((*(_DWORD *)(a1 + 356) & 0x40) != 0) {
            unsigned int v27 = v26;
          }
          else {
            unsigned int v27 = *(_DWORD *)(*(void *)(v12 + 24) + v21);
          }
          *a7 += BOMStorageSizeOfBlock(*(void *)a1, v27);
        }
        ++v22;
        v21 += 8;
      }
      while (v22 < *(unsigned __int16 *)(v12 + 16));
    }
    else
    {
      unint64_t v22 = 0;
    }
    unsigned int v30 = *(_DWORD *)(*(void *)(v12 + 24) + 8 * v22);
    if ((*(unsigned char *)(a1 + 356) & 0x40) != 0)
    {
      int v16 = 0;
      if (!a7 || !v30) {
        return v16 != 0;
      }
      unsigned int v30 = bswap32(v30);
    }
    else
    {
      int v16 = 0;
      if (!a7 || !v30) {
        return v16 != 0;
      }
    }
    int v16 = 0;
    *a7 += BOMStorageSizeOfBlock(*(void *)a1, v30);
  }
  else
  {
    if (a5) {
      ++*a5;
    }
    if (*(_WORD *)(v12 + 16))
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      int v16 = 0;
      do
      {
        unsigned int v17 = bswap32(*(_DWORD *)(*(void *)(v12 + 24) + v14));
        if ((*(_DWORD *)(a1 + 356) & 0x40) != 0) {
          int v18 = v17;
        }
        else {
          int v18 = *(_DWORD *)(*(void *)(v12 + 24) + v14);
        }
        Page = _findPage(a1, v18);
        v16 += _BOMTreeDiagnosticTraverse(a1, Page, a3, a4, a5, a6, a7);
        ++v15;
        v14 += 8;
      }
      while (v15 < *(unsigned __int16 *)(v12 + 16));
    }
    else
    {
      unint64_t v15 = 0;
      int v16 = 0;
    }
    unsigned int v28 = *(_DWORD *)(*(void *)(v12 + 24) + 8 * v15);
    if ((*(unsigned char *)(a1 + 356) & 0x40) == 0)
    {
      if (!v28) {
        return v16 != 0;
      }
      goto LABEL_38;
    }
    if (v28)
    {
      unsigned int v28 = bswap32(v28);
LABEL_38:
      char v29 = _findPage(a1, v28);
      v16 += _BOMTreeDiagnosticTraverse(a1, v29, a3, a4, a5, a6, a7);
    }
  }
  return v16 != 0;
}

uint64_t _BOMTreePrintDiagnostics(uint64_t result)
{
  int v8 = 0;
  int v6 = 0;
  int v7 = 0;
  size_t v4 = 0;
  size_t v5 = 0;
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = _BOMTreeDiagnosticTraverse(result, 0, &v7, &v8, &v6, &v5, &v4);
    if (!result)
    {
      int v2 = v6 + v8;
      char v3 = (FILE **)MEMORY[0x1E4F143D8];
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "           # records: %d\n", *(_DWORD *)(v1 + 20));
      fprintf(*v3, "           page size: %d (%d)\n", *(_DWORD *)(v1 + 304), v7);
      fprintf(*v3, "           # pages  : %d (%d)\n", v2, *(_DWORD *)(v1 + 304) * v2);
      fprintf(*v3, "             leaf   : %d (%d)\n", v8, *(_DWORD *)(v1 + 304) * v8);
      fprintf(*v3, "             branch : %d (%d)\n", v6, *(_DWORD *)(v1 + 304) * v6);
      fprintf(*v3, "           key size : %zd\n", v5);
      return fprintf(*v3, "           data size: %zd\n", v4);
    }
  }
  return result;
}

uint64_t BOMMemoryDump(unsigned __int8 *a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = a2;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  size_t v5 = (FILE **)MEMORY[0x1E4F143D8];
  int v6 = (FILE *)*MEMORY[0x1E4F143D8];
  unsigned int v27 = a1;
  if (!a1)
  {
    fprintf(v6, "(%lu bytes) (NULL)\n", a2);
    return 0;
  }
  fprintf(v6, "(%lu bytes)\n", a2);
  if (v3 >= 1)
  {
    int v8 = v27;
    unint64_t v9 = (unint64_t)&v27[v3];
    uint64_t v10 = "";
    if (a3) {
      uint64_t v10 = a3;
    }
    uint64_t v25 = v3;
    unsigned int v26 = v10;
    while (1)
    {
      int v11 = v8;
      fprintf(*v5, "%s%08x:", v26, v8 - v27);
      uint64_t v12 = 0;
      unsigned int v13 = v28;
      do
      {
        fprintf(*v5, " %02x", *v8);
        uint64_t v14 = *v8;
        if ((v14 & 0x80) != 0) {
          int v15 = __maskrune(v14, 0x40000uLL);
        }
        else {
          int v15 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v14 + 60) & 0x40000;
        }
        if (v15) {
          char v16 = v14;
        }
        else {
          char v16 = 46;
        }
        char *v13 = v16;
        unsigned int v17 = v13 + 1;
        uint64_t v18 = v12 + 1;
        if (v12 < 15)
        {
          unsigned int v19 = &v11[v18];
          if ((unint64_t)&v11[v18] < v9)
          {
            fprintf(*v5, "%02x", *v19);
            uint64_t v20 = *v19;
            if ((v20 & 0x80) != 0) {
              int v21 = __maskrune(v20, 0x40000uLL);
            }
            else {
              int v21 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v20 + 60) & 0x40000;
            }
            if (v21) {
              char v22 = v20;
            }
            else {
              char v22 = 46;
            }
            unsigned int v17 = v13 + 2;
            v13[1] = v22;
            uint64_t v18 = v12 + 2;
          }
        }
        int v8 = &v11[v18];
        if (v18 > 15) {
          break;
        }
        unsigned int v13 = v17;
        uint64_t v12 = v18;
      }
      while ((unint64_t)v8 < v9);
      if (v18 > 15) {
        goto LABEL_29;
      }
      uint64_t v23 = 16 - v18;
      if (((16 - v18) & 1) == 0) {
        goto LABEL_28;
      }
      fwrite("  ", 2uLL, 1uLL, *v5);
      if (v18 != 15) {
        break;
      }
LABEL_29:
      char *v17 = 0;
      fprintf(*v5, "  %s\n", v28);
      if ((unint64_t)v8 >= v9) {
        return v25;
      }
    }
    uint64_t v23 = 15 - v18;
    do
    {
LABEL_28:
      fwrite("     ", 5uLL, 1uLL, *v5);
      v23 -= 2;
    }
    while (v23);
    goto LABEL_29;
  }
  return v3;
}

size_t BOMValueDump(size_t result, unint64_t a2, const char *a3, unsigned int a4)
{
  unsigned int v4 = a4;
  unint64_t v6 = a2;
  int v7 = (unsigned __int8 *)result;
  if ((a4 & 0x1000000) == 0)
  {
LABEL_8:
    if (v6)
    {
      int v11 = (v4 >> 20) & 0xF;
      uint64_t v12 = (FILE **)MEMORY[0x1E4F143D8];
      do
      {
        if ((v4 & 0x1000000) != 0) {
          fprintf(*v12, "  %s", a3);
        }
        switch(v11)
        {
          case 3:
            uint64_t result = BOMPathKeyDump((uint64_t)v7, v6, a3);
            break;
          case 2:
            uint64_t result = BOMPathIdDump(v7, v6, a3);
            break;
          case 1:
            uint64_t result = BOMPathDump((char *)v7);
            break;
          default:
            uint64_t result = BOMMemoryDump(v7, v6, a3);
            break;
        }
        v7 += result;
        v6 -= result;
      }
      while (v6);
    }
    return result;
  }
  if (a2 < 4)
  {
    unsigned int v4 = 0;
    goto LABEL_8;
  }
  int v7 = (unsigned __int8 *)(result + 4);
  unsigned int v8 = *(_DWORD *)result;
  unsigned int v9 = bswap32(*(_DWORD *)result);
  uint64_t v10 = "y";
  if (*(_DWORD *)result != 0x1000000) {
    uint64_t v10 = "ies";
  }
  uint64_t result = fprintf((FILE *)*MEMORY[0x1E4F143D8], "(%lu bytes for %d entr%s)\n", a2, v9, v10);
  v6 -= 4;
  if (v8) {
    goto LABEL_8;
  }
  return result;
}

size_t BOMPathDump(char *__s)
{
  if (__s) {
    size_t v2 = strlen(__s);
  }
  else {
    size_t v2 = 0;
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "\"%s\" (%lu bytes)\n", __s, v2);
  return v2;
}

uint64_t BOMPathIdDump(unsigned __int8 *a1, unint64_t a2, const char *a3)
{
  if (a1 && a2 >= 4)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "0x%02x%02x%02x%02x (%lu bytes)\n", *a1, a1[1], a1[2], a1[3], 4);
    return 4;
  }
  else
  {
    return BOMMemoryDump(a1, a2, a3);
  }
}

uint64_t BOMPathKeyDump(uint64_t a1, unint64_t a2, const char *a3)
{
  if (a1 && a2 >= 5)
  {
    size_t v3 = strlen((const char *)(a1 + 4)) + 5;
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "0x%02x%02x%02x%02x \"%s\" (%lu bytes)\n");
    return v3;
  }
  if (a1 && a2 == 4)
  {
    size_t v3 = 4;
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "0x%02x%02x%02x%02x (NULL) (%lu bytes)\n");
    return v3;
  }

  return BOMMemoryDump((unsigned __int8 *)a1, a2, a3);
}

uint64_t BOMStorageDumpTree(uint64_t a1, const char *a2, unsigned int a3)
{
  uint64_t v5 = BOMTreeOpenWithName(a1, a2, 0);
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = (FILE **)MEMORY[0x1E4F143D8];
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "        %s (%u entries) (%d localkeysize)\n", a2, *(_DWORD *)(v6 + 20), *(_DWORD *)(v6 + 348));
    _BOMTreePrintDiagnostics(v6);
    unsigned int v8 = BOMTreeIteratorNew(v6, 0, 0, 0);
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15))
    {
      int v16 = HIWORD(a3) & 0xF;
      do
      {
        fprintf(*v7, "        %s   Key ", a2);
        unsigned int v24 = (unsigned __int8 *)BOMTreeIteratorKey((uint64_t)v8, v17, v18, v19, v20, v21, v22, v23);
        uint64_t v32 = BOMTreeIteratorKeySize((uint64_t)v8, v25, v26, v27, v28, v29, v30, v31);
        switch(v16)
        {
          case 3:
            BOMPathKeyDump((uint64_t)v24, v32, "        ");
            break;
          case 2:
            BOMPathIdDump(v24, v32, "        ");
            break;
          case 1:
            BOMPathDump((char *)v24);
            break;
          default:
            BOMMemoryDump(v24, v32, "        ");
            break;
        }
        fprintf(*v7, "        %s Value ", a2);
        size_t v40 = BOMTreeIteratorValue((uint64_t)v8, v33, v34, v35, v36, v37, v38, v39);
        unint64_t v48 = BOMTreeIteratorValueSize((uint64_t)v8, v41, v42, v43, v44, v45, v46, v47);
        BOMValueDump(v40, v48, "        ", a3);
        BOMTreeIteratorNext((uint64_t)v8, v49, v50, v51, v52, v53, v54, v55);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v56, v57, v58, v59, v60, v61, v62));
    }
    fputc(10, *v7);
    if (v8) {
      BOMTreeIteratorFree(v8);
    }
    BOMTreeFree(v6);
    return 0;
  }
  else
  {
    fputc(10, (FILE *)*MEMORY[0x1E4F143D8]);
    return 0xFFFFFFFFLL;
  }
}

uint64_t BOMTreePrint(uint64_t a1, const char *a2, FILE *a3, uint64_t a4)
{
  uint64_t v7 = BOMTreeOpenWithName(a1, a2, 0);
  if (v7)
  {
    uint64_t v8 = v7;
    fprintf(a3, "        %s (%u entries)\n", a2, *(_DWORD *)(v7 + 20));
    _BOMTreePrintDiagnostics(v8);
    fputc(10, a3);
    uint64_t v9 = *(unsigned int **)(v8 + 24);
    int v11 = 0;
    _BOMTreePrintPage(v8, v9, a3, a4, 0, 0, &v11);
    fputc(10, a3);
    BOMTreeFree(v8);
    return 0;
  }
  else
  {
    fputc(10, a3);
    return 0xFFFFFFFFLL;
  }
}

uint64_t BOMTreeUsesNumericKeys(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 356) >> 2) & 1;
}

uint64_t BOMTreePageSize(uint64_t a1)
{
  return *(unsigned int *)(a1 + 304);
}

void *_newBOMTree(uint64_t a1, const char *a2)
{
  unsigned int v4 = BOM_malloczero(0x168uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    *unsigned int v4 = a1;
    if (BOMStorageMemoryMapped(a1)) {
      int v6 = (BOMStorageIsOpenForWriting(a1) == 0) << 6;
    }
    else {
      int v6 = 0;
    }
    unsigned int v8 = *((_DWORD *)v5 + 89) & 0xFFFFFFBF | v6;
    *((_DWORD *)v5 + 89) = v8;
    if (a2)
    {
      uint64_t v9 = strdup(a2);
      v5[1] = v9;
      *((_DWORD *)v5 + 89) = v8 & 0xFFFFFFDF | (32 * (v9 != a2));
    }
  }
  else
  {
    uint64_t v7 = __error();
    strerror(*v7);
    _CUILog();
  }
  return v5;
}

void *_NewPage(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)a1;
  if ((*(unsigned char *)(a1 + 356) & 0x40) != 0)
  {
    unsigned int v8 = BOM_malloczero(0x28uLL);
    int v6 = 0;
    uint64_t result = 0;
    if (!v8) {
      return result;
    }
LABEL_8:
    if (!a2) {
      a2 = BOMStorageNewBlock(v3);
    }
    v8[3] = v6;
    *(_DWORD *)unsigned int v8 = a2;
    return v8;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 308);
  if (v4 <= *(_DWORD *)(a1 + 312)) {
    unsigned int v4 = *(_DWORD *)(a1 + 312);
  }
  uint64_t result = BOM_malloczero(8 * (v4 + 1));
  if (result)
  {
    int v6 = result;
    uint64_t v7 = BOM_malloczero(0x28uLL);
    if (!v7)
    {
      free(v6);
      return 0;
    }
    unsigned int v8 = v7;
    goto LABEL_8;
  }
  return result;
}

uint64_t _ReadPage(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)a2;
  uint64_t v5 = BOMStorageSizeOfBlock(*(void *)a1, *(_DWORD *)a2);
  uint64_t v6 = *(void *)a1;
  if ((*(unsigned char *)(a1 + 356) & 0x40) != 0)
  {
    uint64_t v15 = BOMStorageReadFromBlock(v6, v4);
    if (!v15) {
      return 1;
    }
    int v16 = (void *)v15;
    uint64_t v14 = BOMStreamWithAddress(v15, v5, 0);
    madvise(v16, v5, 3);
    if (!v14) {
      return 1;
    }
  }
  else
  {
    uint64_t v14 = BOMStreamWithBlockID(v6, v4, v5, 0);
    if (!v14) {
      return 1;
    }
  }
  *(_WORD *)(a2 + 4) = *(_WORD *)(a2 + 4) & 0xFFFE | (BOMStreamReadUInt16(v14, v7, v8, v9, v10, v11, v12, v13) != 0);
  *(_WORD *)(a2 + 16) = BOMStreamReadUInt16(v14, v17, v18, v19, v20, v21, v22, v23);
  *(_DWORD *)(a2 + 8) = BOMStreamReadUInt32(v14, v24, v25, v26, v27, v28, v29, v30);
  *(_DWORD *)(a2 + 12) = BOMStreamReadUInt32(v14, v31, v32, v33, v34, v35, v36, v37);
  uint64_t v45 = *(unsigned __int16 *)(a2 + 16);
  if (*(_DWORD *)(a1 + 308) < v45)
  {
    unsigned __int16 v65 = BOMExceptionHandlerMessage("(tree (%s) page->numKeys(%d) > tree->maxKeys(%d)", v38, v39, v40, v41, v42, v43, v44, *(void *)(a1 + 8));
    uint64_t v66 = __error();
    _BOMFatalException(v65, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 1329, *v66);
  }
  if ((*(unsigned char *)(a1 + 356) & 0x40) != 0)
  {
    *(void *)(a2 + 24) = BOMStreamGetDataPointer(v14, (8 * v45) | 4);
  }
  else
  {
    if (*(_WORD *)(a2 + 16))
    {
      uint64_t v46 = 0;
      unint64_t v47 = 0;
      do
      {
        *(_DWORD *)(*(void *)(a2 + 24) + v46) = BOMStreamReadUInt32(v14, v38, v39, v40, v41, v42, v43, v44);
        *(_DWORD *)(*(void *)(a2 + 24) + v46 + 4) = BOMStreamReadUInt32(v14, v48, v49, v50, v51, v52, v53, v54);
        ++v47;
        v46 += 8;
      }
      while (v47 < *(unsigned __int16 *)(a2 + 16));
    }
    *(_DWORD *)(*(void *)(a2 + 24) + 8 * *(unsigned __int16 *)(a2 + 16)) = BOMStreamReadUInt32(v14, v38, v39, v40, v41, v42, v43, v44);
  }
  if ((*(_DWORD *)(a1 + 356) & 0x44) == 0x40 && (int v63 = *(_DWORD *)(a1 + 348), v63 >= 1)) {
    uint64_t DataPointer = BOMStreamGetDataPointer(v14, v63 * (unint64_t)*(unsigned __int16 *)(a2 + 16));
  }
  else {
    uint64_t DataPointer = 0;
  }
  *(void *)(a2 + 32) = DataPointer;
  BOMStreamFree(v14, v55, v56, v57, v58, v59, v60, v61);
  return 0;
}

void _invalidateIteratorsForPageID(uint64_t a1, unsigned int a2)
{
  CFArrayRef v3 = *(const __CFArray **)(a1 + 296);
  if (v3)
  {
    CFIndex v5 = BOMCFArrayMaxRange(v3);
    CFIndex v7 = v6;
    CFArrayRef v8 = *(const __CFArray **)(a1 + 296);
    v9.location = v5;
    v9.length = v7;
    CFArrayApplyFunction(v8, v9, (CFArrayApplierFunction)_invalidateIterator, (void *)a2);
  }
}

void _addPageToCache(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 8 * *(int *)(a1 + 288);
  CFIndex v6 = *(_WORD **)(v3 + 32);
  unsigned int v4 = (void *)(v3 + 32);
  CFIndex v5 = v6;
  if (v6)
  {
    while (1)
    {
      __int16 v8 = v5[2];
      if ((v8 & 0xC) == 4) {
        break;
      }
      v5[2] = v8 | 4;
      int v9 = *(_DWORD *)(a1 + 288) + 1;
      BOOL v10 = -v9 < 0;
      int v11 = -v9 & 0x1F;
      int v12 = v9 & 0x1F;
      if (!v10) {
        int v12 = -v11;
      }
      *(_DWORD *)(a1 + 288) = v12;
      uint64_t v13 = a1 + 8 * v12;
      uint64_t v14 = *(_WORD **)(v13 + 32);
      unsigned int v4 = (void *)(v13 + 32);
      CFIndex v5 = v14;
      if (!v14) {
        goto LABEL_10;
      }
    }
    if ((v8 & 2) != 0) {
      _WritePage(a1, (uint64_t)v5);
    }
    _FreePage(a1, v5);
    unsigned int v4 = (void *)(a1 + 8 * *(int *)(a1 + 288) + 32);
  }
LABEL_10:
  *unsigned int v4 = a2;
}

uint64_t _invalidateIterator(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(_DWORD *)(result + 16) == a2 && (*(unsigned char *)(result + 57) & 9) == 0)
    {
      uint64_t result = *(void *)(result + 8);
      if (!result || *(_DWORD *)result != a2)
      {
        uint64_t result = (uint64_t)_findPage(*(void *)v2, a2);
        *(void *)(v2 + 8) = result;
        if (!result) {
          goto LABEL_27;
        }
      }
      uint64_t v3 = *(void *)v2;
      int v4 = *(_DWORD *)(*(void *)v2 + 356);
      if ((v4 & 4) != 0)
      {
        unsigned int v6 = *(_DWORD *)(*(void *)(result + 24) + 8 * *(int *)(v2 + 20) + 4);
        unsigned int v7 = bswap32(v6);
        if ((v4 & 0x40) != 0) {
          uint64_t v8 = v7;
        }
        else {
          uint64_t v8 = v6;
        }
        *(void *)(v2 + 24) = v8;
        *(void *)(v2 + 32) = 0;
        goto LABEL_27;
      }
      if ((v4 & 0x40) != 0)
      {
        size_t v9 = *(unsigned int *)(v3 + 348);
        if ((int)v9 >= 1)
        {
LABEL_17:
          *(void *)(v2 + 32) = v9;
          BOOL v10 = *(void **)(v2 + 24);
          if (v10)
          {
            free(v10);
            *(void *)(v2 + 24) = 0;
            size_t v9 = *(void *)(v2 + 32);
          }
          int v11 = BOM_malloc(v9);
          *(void *)(v2 + 24) = v11;
          if (!v11)
          {
            uint64_t v17 = __error();
            _BOMFatalException("BOMTree iterator cannot cache keys. This is a fatal error (!it->key).", "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 2773, *v17);
          }
          uint64_t v12 = *(void *)v2;
          if ((*(unsigned char *)(*(void *)v2 + 356) & 0x40) != 0)
          {
            size_t v14 = *(unsigned int *)(v12 + 348);
            uint64_t v15 = *(void *)(v2 + 8);
            if ((int)v14 >= 1)
            {
              uint64_t v16 = *(void *)(v15 + 32);
              if (!v16)
              {
                uint64_t v19 = __error();
                _BOMFatalException("BOMTree iterator cannot cache keys. This is a fatal error (__getKeyIDValuePTR return 0).", "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 2781, *v19);
              }
              uint64_t result = (uint64_t)memcpy(v11, (const void *)(v16 + *(int *)(v2 + 20) * v14), v14);
              goto LABEL_27;
            }
            unsigned int v13 = bswap32(*(_DWORD *)(*(void *)(v15 + 24) + 8 * *(int *)(v2 + 20) + 4));
          }
          else
          {
            unsigned int v13 = *(_DWORD *)(*(void *)(*(void *)(v2 + 8) + 24) + 8 * *(int *)(v2 + 20) + 4);
          }
          uint64_t result = BOMStorageCopyFromBlock(*(void *)v12, v13, v11);
          if (result)
          {
            uint64_t v18 = __error();
            _BOMFatalException("BOMTree iterator cannot cache keys. This is a fatal error (BOMStorageCopyFromBlock returned an error).", "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 2786, *v18);
          }
LABEL_27:
          *(unsigned char *)(v2 + 57) |= 1u;
          return result;
        }
        unsigned int v5 = bswap32(*(_DWORD *)(*(void *)(result + 24) + 8 * *(int *)(v2 + 20) + 4));
      }
      else
      {
        unsigned int v5 = *(_DWORD *)(*(void *)(result + 24) + 8 * *(int *)(v2 + 20) + 4);
      }
      size_t v9 = BOMStorageSizeOfBlock(*(void *)v3, v5);
      goto LABEL_17;
    }
  }
  return result;
}

void _removePageFromCache(uint64_t a1, _WORD *a2)
{
  if ((a2[2] & 8) == 0)
  {
    for (uint64_t i = 32; i != 288; i += 8)
    {
      if (*(_WORD **)(a1 + i) == a2)
      {
        CFArrayRef v5 = *(const __CFArray **)(a1 + 296);
        if (v5)
        {
          CFIndex v6 = BOMCFArrayMaxRange(v5);
          CFIndex v8 = v7;
          v10.location = v6;
          v10.length = v8;
          CFArrayApplyFunction(*(CFArrayRef *)(a1 + 296), v10, (CFArrayApplierFunction)_pageRemovedCallback, a2);
        }
        *(void *)(a1 + i) = 0;
      }
    }
    if ((a2[2] & 2) != 0)
    {
      _WritePage(a1, (uint64_t)a2);
    }
  }
}

uint64_t _pageRemovedCallback(uint64_t result, uint64_t a2)
{
  if (result && a2 && *(void *)(result + 8) == a2) {
    *(void *)(result + 8) = 0;
  }
  return result;
}

uint64_t _shiftKeysAndValues(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4 = *(unsigned __int16 *)(a3 + 16);
  unsigned int v5 = *(_DWORD *)(result + 316);
  BOOL v6 = v4 >= v5;
  int v8 = v4 - v5;
  BOOL v7 = v8 != 0 && v6;
  unsigned int v9 = (v8 + 1) >> 1;
  if (v7) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = *(unsigned __int16 *)(a3 + 16);
  }
  uint64_t v11 = *(unsigned __int16 *)(a2 + 16);
  __int16 v12 = v10 + v11;
  unint64_t v13 = v4 - v10;
  if (a4)
  {
    unsigned int v14 = 0;
    if (!v10) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  uint64_t v15 = *(void *)(a2 + 24);
  *(_DWORD *)(v15 + 8 * (v10 + v11)) = *(_DWORD *)(v15 + 8 * v11);
  if (v11)
  {
    do
    {
      unsigned int v16 = v10 - 1 + v11--;
      *(void *)(v15 + 8 * v16) = *(void *)(v15 + 8 * v11);
    }
    while (v11);
  }
  unsigned int v14 = v4 - v10;
  if (v10)
  {
LABEL_10:
    uint64_t v17 = *(void *)(a3 + 24);
    uint64_t v18 = *(void *)(a2 + 24);
    uint64_t v11 = v11;
    unsigned int v19 = v10;
    do
    {
      *(void *)(v18 + 8 * v11) = *(void *)(v17 + 8 * v14);
      if (!a4) {
        *(void *)(v17 + 8 * v14) = 0;
      }
      ++v11;
      ++v14;
      --v19;
    }
    while (v19);
  }
LABEL_14:
  if (a4)
  {
    if ((*(_WORD *)(a2 + 4) & 1) == 0 && v4 == v10)
    {
      uint64_t v20 = *(void *)(a3 + 24);
      uint64_t v21 = 8 * v14;
      *(_DWORD *)(*(void *)(a2 + 24) + 8 * v11) = *(_DWORD *)(v20 + v21);
      *(_DWORD *)(v20 + v21) = 0;
    }
    if (v4 != v10)
    {
      if (v4)
      {
        unint64_t v22 = 0;
        unint64_t v23 = v13 + v10;
        uint64_t v24 = 8 * v10;
        uint64_t v25 = 8 * v23;
        do
        {
          if (v22 >= v13)
          {
            uint64_t v26 = *(void *)(a3 + 24);
            if (v13 == v22) {
              *(void *)(v26 + 8 * v13) = *(unsigned int *)(v26 + v25);
            }
            else {
              *(void *)(v26 + 8 * v22) = 0;
            }
          }
          else
          {
            uint64_t v26 = *(void *)(a3 + 24);
            *(void *)(v26 + 8 * v22) = *(void *)(v26 + 8 * v22 + v24);
          }
          ++v22;
        }
        while (v4 != v22);
      }
      else
      {
        uint64_t v26 = *(void *)(a3 + 24);
      }
      *(_DWORD *)(v26 + 8 * v4) = 0;
    }
  }
  *(_WORD *)(a2 + 16) = v12;
  *(_WORD *)(a2 + 4) |= 2u;
  *(_WORD *)(a3 + 16) = v13;
  *(_WORD *)(a3 + 4) |= 2u;
  return result;
}

uint64_t _findPagesForKey(uint64_t a1, char *a2, void *__s1, size_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 0;
  }
  uint64_t v12 = *(void *)(a1 + 24);
  if (a2) {
    BOMStackPush(a2, v12, (uint64_t)__s1, a4, a5, a6, a7, a8);
  }
  if ((*(_WORD *)(v12 + 4) & 1) == 0)
  {
    do
    {
      unsigned int v13 = *(_DWORD *)(*(void *)(v12 + 24) + 8 * (int)_findIndexForKey(a1, v12, __s1, a4, 0));
      unsigned int v14 = bswap32(v13);
      if ((*(_DWORD *)(a1 + 356) & 0x40) != 0) {
        int v15 = v14;
      }
      else {
        int v15 = v13;
      }
      Page = _findPage(a1, v15);
      uint64_t v12 = (uint64_t)Page;
      if (!Page) {
        break;
      }
      if (a2)
      {
        BOMStackPush(a2, (uint64_t)Page, v17, v18, v19, v20, v21, v22);
        __int16 v23 = *(_WORD *)(v12 + 4) | 8;
      }
      else
      {
        __int16 v23 = *((_WORD *)Page + 2);
      }
      *(_WORD *)(v12 + 4) = v23 & 0xFFFB;
    }
    while ((v23 & 1) == 0);
  }
  return v12;
}

uint64_t _BOMTreePrintPage(uint64_t a1, unsigned int *a2, FILE *a3, uint64_t a4, int a5, int a6, _DWORD *a7)
{
  int v8 = a5;
  if (!a5) {
    goto LABEL_10;
  }
  int v12 = a5;
  do
  {
    fwrite("                             ", 0x1DuLL, 1uLL, a3);
    --v12;
  }
  while (v12);
  if (v8)
  {
    fwrite("---", 3uLL, 1uLL, a3);
    int v13 = (*a7)++;
    fprintf(a3, "| node #          : %*u\n", 8, v13);
    int v14 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v14;
    }
    while (v14);
    fwrite("   ", 3uLL, 1uLL, a3);
    fprintf(a3, "| bid             : %*u\n", 8, *a2);
    int v15 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v15;
    }
    while (v15);
    fwrite("   ", 3uLL, 1uLL, a3);
  }
  else
  {
LABEL_10:
    int v16 = (*a7)++;
    fprintf(a3, "| node #          : %*u\n", 8, v16);
    fprintf(a3, "| bid             : %*u\n", 8, *a2);
  }
  int v17 = BOMStorageSizeOfBlock(*(void *)a1, *a2);
  fprintf(a3, "| psize           : %*u\n", 8, v17);
  if (v8)
  {
    int v18 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v18;
    }
    while (v18);
    fwrite("   ", 3uLL, 1uLL, a3);
    fprintf(a3, "| prev            : %*u\n", 8, a2[3]);
    int v19 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v19;
    }
    while (v19);
    fwrite("   ", 3uLL, 1uLL, a3);
    fprintf(a3, "| next            : %*u\n", 8, a2[2]);
    int v20 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v20;
    }
    while (v20);
    fwrite("   ", 3uLL, 1uLL, a3);
  }
  else
  {
    fprintf(a3, "| prev            : %*u\n", 8, a2[3]);
    fprintf(a3, "| next            : %*u\n", 8, a2[2]);
  }
  fprintf(a3, "| num keys        : %*d/%d", 8, *((unsigned __int16 *)a2 + 8), *(_DWORD *)(a1 + 308));
  if ((a2[1] & 1) == 0)
  {
    fwrite("-----", 5uLL, 1uLL, a3);
    goto LABEL_40;
  }
  fputc(10, a3);
  if (v8)
  {
    int v21 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v21;
    }
    while (v21);
  }
  fwrite("   ", 3uLL, 1uLL, a3);
  if (*((_WORD *)a2 + 8))
  {
    uint64_t v22 = 0;
    unint64_t v23 = 0;
    uint64_t v24 = 0;
    do
    {
      unsigned int v25 = bswap32(*(_DWORD *)(*((void *)a2 + 3) + v22));
      if ((*(_DWORD *)(a1 + 356) & 0x40) != 0) {
        unsigned int v26 = v25;
      }
      else {
        unsigned int v26 = *(_DWORD *)(*((void *)a2 + 3) + v22);
      }
      v24 += BOMStorageSizeOfBlock(*(void *)a1, v26);
      ++v23;
      v22 += 8;
    }
    while (v23 < *((unsigned __int16 *)a2 + 8));
  }
  else
  {
    uint64_t v24 = 0;
    unint64_t v23 = 0;
  }
  unsigned int v27 = *(_DWORD *)(*((void *)a2 + 3) + 8 * v23);
  if ((*(unsigned char *)(a1 + 356) & 0x40) == 0)
  {
    if (!v27) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (v27)
  {
    unsigned int v27 = bswap32(v27);
LABEL_38:
    v24 += BOMStorageSizeOfBlock(*(void *)a1, v27);
  }
LABEL_39:
  fprintf(a3, "| data size       : %*lu", 8, v24);
LABEL_40:
  fputc(10, a3);
  __int16 v28 = *((_WORD *)a2 + 2);
  if (v28)
  {
    uint64_t v29 = (void **)BOM_calloc(*((unsigned __int16 *)a2 + 8), 8uLL);
    int v74 = a6;
    int v66 = v8;
    if (*((_WORD *)a2 + 8))
    {
      uint64_t v30 = 0;
      unint64_t v31 = 0;
      uint64_t v32 = 0;
      size_t v33 = 0xFFFFFFFFLL;
      do
      {
        unsigned int v34 = bswap32(*(_DWORD *)(*((void *)a2 + 3) + v30));
        if ((*(unsigned char *)(a1 + 356) & 0x40) != 0) {
          unsigned int v35 = v34;
        }
        else {
          unsigned int v35 = *(_DWORD *)(*((void *)a2 + 3) + v30);
        }
        if (v35)
        {
          size_t v36 = BOMStorageSizeOfBlock(*(void *)a1, v35);
          if (v33 >= v36) {
            size_t v33 = v36;
          }
          uint64_t v37 = BOM_malloc(v36);
          if (v37)
          {
            uint64_t v38 = v37;
            if (!BOMStorageCopyFromBlock(*(void *)a1, v35, v37)) {
              v29[v32++] = v38;
            }
          }
        }
        ++v31;
        v30 += 8;
      }
      while (v31 < *((unsigned __int16 *)a2 + 8));
      uint64_t v39 = (char *)malloc_type_malloc(v33, 0xC47B7872uLL);
      uint64_t v67 = v39;
      if ((v33 & 0x80000000) == 0)
      {
        uint64_t v40 = v39;
        signed int v41 = 0;
        uint64_t v42 = 0;
        do
        {
          uint64_t v43 = 0;
          int v44 = v33 - v41;
          if ((int)v33 < v41) {
            ++v44;
          }
          unint64_t v45 = v41 + (v44 >> 1);
          uint64_t v46 = (char *)*v29;
          while (v41 > v45)
          {
LABEL_62:
            if (++v43 > (unint64_t)((int)v32 - 1))
            {
              size_t v69 = v45 - v41 + 1;
              memcpy(&v40[v42], &v46[v41], v69);
              v42 += v69;
              signed int v41 = v45 + 1;
              goto LABEL_65;
            }
          }
          uint64_t v47 = v41;
          while (*((unsigned __int8 *)v29[v43] + v47) == v46[v47])
          {
            if (++v47 > v45) {
              goto LABEL_62;
            }
          }
          LODWORD(v33) = v45 - 1;
LABEL_65:
          ;
        }
        while (v41 <= (int)v33);
        goto LABEL_69;
      }
    }
    else
    {
      uint64_t v67 = (char *)malloc_type_malloc(0xFFFFFFFFuLL, 0xC47B7872uLL);
      uint64_t v32 = 0;
    }
    uint64_t v42 = 0;
LABEL_69:
    uint64_t v48 = (char *)BOM_malloc((2 * v42) | 1);
    uint64_t v49 = v48;
    uint64_t v70 = v42;
    if (v42)
    {
      uint64_t v50 = v67;
      uint64_t v51 = v48;
      do
      {
        int v52 = *v50++;
        v51 += sprintf(v51, "%02X", v52);
        --v42;
      }
      while (v42);
    }
    int v8 = v66;
    if (v66)
    {
      int v53 = v66;
      do
      {
        fwrite("                             ", 0x1DuLL, 1uLL, a3);
        --v53;
      }
      while (v53);
    }
    fwrite("   ", 3uLL, 1uLL, a3);
    fprintf(a3, "| common key part : %s (%lu bytes)\n", v49, v70);
    if (a4 && v70)
    {
      if (v66)
      {
        int v54 = v66;
        do
        {
          fwrite("                             ", 0x1DuLL, 1uLL, a3);
          --v54;
        }
        while (v54);
      }
      fwrite("   ", 3uLL, 1uLL, a3);
      fwrite("|                 : ", 0x14uLL, 1uLL, a3);
      (*(void (**)(uint64_t, char *, uint64_t, FILE *))(a4 + 16))(a4, v67, v70, a3);
      fputc(10, a3);
    }
    free(v49);
    free(v67);
    if (v32)
    {
      uint64_t v55 = v29;
      do
      {
        uint64_t v56 = *v55++;
        free(v56);
        --v32;
      }
      while (v32);
    }
    free(v29);
    __int16 v28 = *((_WORD *)a2 + 2);
    a6 = v74;
  }
  if (v28) {
    return (unsigned __int16)a6;
  }
  if (((*((unsigned __int16 *)a2 + 8) + 1) & 0x10000) != 0) {
    goto LABEL_101;
  }
  __int16 v68 = *((_WORD *)a2 + 8);
  int v75 = a6;
  unint64_t v57 = 0;
  int v58 = v8 + 1;
  unsigned int v71 = (unsigned __int16)(v8 + 1);
  do
  {
    unsigned int v59 = *(_DWORD *)(*((void *)a2 + 3) + 8 * v57);
    if ((*(unsigned char *)(a1 + 356) & 0x40) != 0)
    {
      if (!v59) {
        goto LABEL_99;
      }
      unsigned int v59 = bswap32(v59);
    }
    else if (!v59)
    {
      goto LABEL_99;
    }
    Page = _findPage(a1, v59);
    if (Page)
    {
      uint64_t v61 = Page;
      char v62 = 1;
      do
      {
        char v63 = v62;
        int v64 = v58;
        do
        {
          fwrite("                             ", 0x1DuLL, 1uLL, a3);
          --v64;
        }
        while (v64);
        fputc(124, a3);
        fputc(10, a3);
        char v62 = 0;
      }
      while ((v63 & 1) != 0);
      v75 += _BOMTreePrintPage(a1, v61, a3, a4, v71, (unsigned __int16)(v75 + 2), a7) + 2;
    }
LABEL_99:
    ++v57;
  }
  while (v57 < (unsigned __int16)(v68 + 1));
  LOWORD(a6) = v75;
  if (v68) {
LABEL_101:
  }
    LOWORD(a6) = a6 + 3;
  return (unsigned __int16)a6;
}

uint64_t BOMStreamWithBlockID(uint64_t a1, unsigned int a2, size_t a3, int a4)
{
  int v8 = BOM_malloczero(0x58uLL);
  uint64_t v9 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v22 = __error();
    strerror(*v22);
    _CUILog();
    return v9;
  }
  v8[1] = 1;
  unint64_t v10 = BOMStorageSizeOfBlock(a1, a2);
  *(void *)(v9 + 72) = BOMStorageGetSys(a1);
  *(_DWORD *)uint64_t v9 = 0;
  *(void *)(v9 + 8) = a1;
  *(_DWORD *)(v9 + 16) = a2;
  if (a3) {
    unint64_t v11 = a3;
  }
  else {
    unint64_t v11 = v10;
  }
  *(void *)(v9 + 32) = v11;
  *(_DWORD *)(v9 + 40) = a4;
  if (v10 <= a3) {
    size_t v12 = a3;
  }
  else {
    size_t v12 = v10;
  }
  int v13 = (char *)BOM_malloczero(v12);
  *(void *)(v9 + 48) = v13;
  if (!v13)
  {
    unint64_t v23 = __error();
    strerror(*v23);
    _CUILog();
    goto LABEL_16;
  }
  uint64_t v20 = (uint64_t)v13;
  *(unsigned char *)(v9 + 80) |= 1u;
  uint64_t v21 = *(void *)(v9 + 32);
  *(void *)(v9 + 56) = v13;
  *(void *)(v9 + 64) = &v13[v21];
  if ((*(_DWORD *)(v9 + 40) | 2) != 2) {
    goto LABEL_12;
  }
  if (BOMStorageCopyFromBlock(a1, a2, v13))
  {
LABEL_16:
    BOMStreamFree(v9, v14, v20, v15, v16, v17, v18, v19);
    return 0;
  }
  uint64_t v21 = *(void *)(v9 + 32);
LABEL_12:
  if (!v21) {
    goto LABEL_16;
  }
  return v9;
}

uint64_t BOMStreamFree(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    if ((*(unsigned char *)(result + 80) & 2) != 0 && BOMStreamFlush((int *)result, a2, a3, a4, a5, a6, a7, a8))
    {
      return 1;
    }
    else
    {
      uint64_t v9 = *(void **)(v8 + 48);
      if (v9)
      {
        if (*(unsigned char *)(v8 + 80)) {
          free(v9);
        }
      }
      free((void *)v8);
      return 0;
    }
  }
  return result;
}

void *BOMStreamWithFile(int a1, uint64_t a2, size_t a3, int a4, char *a5)
{
  return BOMStreamWithFileAndSys(a1, a2, a3, a4, a5, 0);
}

void *BOMStreamWithFileAndSys(int a1, uint64_t a2, size_t a3, int a4, char *a5, long long *a6)
{
  size_t v12 = BOM_malloczero(0x58uLL);
  if (v12)
  {
    if (!a6) {
      a6 = BomSys_default();
    }
    v12[9] = a6;
    void *v12 = 0x100000001;
    *((_DWORD *)v12 + 5) = a1;
    v12[3] = a2;
    v12[4] = a3;
    *((_DWORD *)v12 + 10) = a4;
    if (a5)
    {
      v12[6] = a5;
      *((unsigned char *)v12 + 80) &= ~1u;
      if ((a3 & 0x8000000000000000) != 0)
      {
LABEL_15:
        uint64_t v15 = __error();
        strerror(*v15);
        _CUILog();
LABEL_16:
        BOMStreamFree(v12);
        return 0;
      }
    }
    else
    {
      uint64_t v14 = (char *)BOM_malloczero(a3);
      v12[6] = v14;
      if (!v14) {
        goto LABEL_15;
      }
      a5 = v14;
      *((unsigned char *)v12 + 80) |= 1u;
      a3 = v12[4];
      if ((a3 & 0x8000000000000000) != 0) {
        goto LABEL_15;
      }
    }
    v12[7] = a5;
    v12[8] = &a5[a3];
    if ((*((_DWORD *)v12 + 10) | 2) == 2)
    {
      if ((*((uint64_t (**)(void, void, void, void))a6 + 7))(*((void *)a6 + 1), *((unsigned int *)v12 + 5), v12[3], 0) == -1)goto LABEL_15; {
      a3 = (*((uint64_t (**)(void, void, void, void))a6 + 5))(*((void *)a6 + 1), *((unsigned int *)v12 + 5), v12[6], v12[4]);
      }
      if (a3 != v12[4]) {
        goto LABEL_15;
      }
    }
    if (!a3) {
      goto LABEL_16;
    }
  }
  else
  {
    int v13 = __error();
    strerror(*v13);
    _CUILog();
  }
  return v12;
}

uint64_t BOMStreamWithAddress(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v6 = BOM_malloczero(0x58uLL);
  uint64_t v14 = (uint64_t)v6;
  if (v6)
  {
    void *v6 = 0x100000002;
    v6[4] = a2;
    *((_DWORD *)v6 + 10) = a3;
    v6[6] = a1;
    *((unsigned char *)v6 + 80) &= ~1u;
    if (a2 < 0)
    {
      _CUILog();
LABEL_7:
      BOMStreamFree(v14, v7, v8, v9, v10, v11, v12, v13);
      return 0;
    }
    v6[7] = a1;
    v6[8] = a1 + a2;
    if (!a2) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v15 = __error();
    strerror(*v15);
    _CUILog();
  }
  return v14;
}

uint64_t BOMStreamFlush(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    goto LABEL_7;
  }
  if (!a1[10]) {
    goto LABEL_12;
  }
  int v9 = *a1;
  if (*a1 == 2) {
    goto LABEL_12;
  }
  if (v9 == 1)
  {
    if ((*(uint64_t (**)(void, void, void, void))(*((void *)a1 + 9) + 56))(*(void *)(*((void *)a1 + 9) + 8), a1[5], *((void *)a1 + 3), 0) != -1&& (*(uint64_t (**)(void, void, void, void))(*((void *)a1 + 9) + 48))(*(void *)(*((void *)a1 + 9) + 8), a1[5], *((void *)a1 + 6), *((void *)a1 + 4)) == *((void *)a1 + 4))
    {
      goto LABEL_12;
    }
    uint64_t v11 = __error();
    strerror(*v11);
LABEL_7:
    _CUILog();
    return 1;
  }
  if (v9)
  {
    _CUILog();
LABEL_12:
    uint64_t result = 0;
    goto LABEL_13;
  }
  uint64_t result = BOMStorageCopyToBlock(*((void *)a1 + 1), a1[4], *((const void **)a1 + 6), *((void *)a1 + 4), a5, a6, a7, a8);
LABEL_13:
  *((unsigned char *)a1 + 80) &= ~2u;
  return result;
}

uint64_t BOMStreamGetByteOrder(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 4);
  }
  return result;
}

uint64_t BOMStreamReadUInt32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 40) == 1)
  {
    int v9 = BOMExceptionHandlerMessage("%s read called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt32");
    int v10 = *__error();
    uint64_t v11 = v9;
    unsigned __int8 v12 = 0;
    int v13 = 272;
LABEL_5:
    _BOMExceptionHandlerCall(v11, v12, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v13, v10);
    unsigned int v17 = 0;
    goto LABEL_7;
  }
  uint64_t v14 = *(unsigned int **)(a1 + 56);
  uint64_t v15 = v14 + 1;
  if ((unint64_t)(v14 + 1) > *(void *)(a1 + 64))
  {
    uint64_t v16 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt32");
    int v10 = *__error();
    uint64_t v11 = v16;
    unsigned __int8 v12 = 1;
    int v13 = 274;
    goto LABEL_5;
  }
  unsigned int v17 = *v14;
  *(void *)(a1 + 56) = v15;
LABEL_7:
  unsigned int v18 = bswap32(v17);
  if (*(_DWORD *)(a1 + 4) == 2) {
    return v17;
  }
  else {
    return v18;
  }
}

uint64_t BOMStreamReadUInt16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 40) == 1)
  {
    int v9 = BOMExceptionHandlerMessage("%s read called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt16");
    int v10 = *__error();
    uint64_t v11 = v9;
    unsigned __int8 v12 = 0;
    int v13 = 292;
LABEL_5:
    _BOMExceptionHandlerCall(v11, v12, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v13, v10);
    unsigned int v17 = 0;
    goto LABEL_7;
  }
  uint64_t v14 = *(unsigned __int16 **)(a1 + 56);
  uint64_t v15 = v14 + 1;
  if ((unint64_t)(v14 + 1) > *(void *)(a1 + 64))
  {
    uint64_t v16 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt16");
    int v10 = *__error();
    uint64_t v11 = v16;
    unsigned __int8 v12 = 1;
    int v13 = 294;
    goto LABEL_5;
  }
  unsigned int v17 = *v14;
  *(void *)(a1 + 56) = v15;
LABEL_7:
  unsigned int v18 = __rev16(v17);
  if (*(_DWORD *)(a1 + 4) == 2) {
    return v17;
  }
  else {
    return v18;
  }
}

uint64_t BOMStreamReadUInt8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 40) == 1)
  {
    uint64_t v8 = BOMExceptionHandlerMessage("%s read called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt8");
    int v9 = *__error();
    int v10 = v8;
    unsigned __int8 v11 = 0;
    int v12 = 312;
  }
  else
  {
    int v13 = *(unsigned __int8 **)(a1 + 56);
    uint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) <= *(void *)(a1 + 64))
    {
      uint64_t v16 = *v13;
      *(void *)(a1 + 56) = v14;
      return v16;
    }
    uint64_t v15 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt8");
    int v9 = *__error();
    int v10 = v15;
    unsigned __int8 v11 = 1;
    int v12 = 314;
  }
  _BOMExceptionHandlerCall(v10, v11, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v12, v9);
  return 0;
}

uint64_t (*BOMStreamReadBuffer(uint64_t a1, void *__dst, size_t __len, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(void *)
{
  if (*(_DWORD *)(a1 + 40) == 1)
  {
    uint64_t v8 = BOMExceptionHandlerMessage("%s read called on read-only buffer", (uint64_t)__dst, __len, a4, a5, a6, a7, a8, (char)"BOMStreamReadBuffer");
    int v9 = *__error();
    int v10 = v8;
    unsigned __int8 v11 = 0;
    int v12 = 326;
  }
  else
  {
    uint64_t v15 = *(const void **)(a1 + 56);
    if (__CFADD__(__len, v15))
    {
      unsigned int v18 = BOMExceptionHandlerMessage("%s buffer overflow", (uint64_t)__dst, __len, a4, a5, a6, a7, a8, (char)"BOMStreamReadBuffer");
      int v9 = *__error();
      int v10 = v18;
      unsigned __int8 v11 = 1;
      int v12 = 338;
    }
    else
    {
      if ((unint64_t)v15 + __len <= *(void *)(a1 + 64))
      {
        uint64_t result = (uint64_t (*)(void *))memmove(__dst, v15, __len);
        *(void *)(a1 + 56) += __len;
        return result;
      }
      uint64_t v16 = BOMExceptionHandlerMessage("%s buffer overflow", (uint64_t)__dst, __len, a4, a5, a6, a7, a8, (char)"BOMStreamReadBuffer");
      int v9 = *__error();
      int v10 = v16;
      unsigned __int8 v11 = 1;
      int v12 = 341;
    }
  }

  return _BOMExceptionHandlerCall(v10, v11, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v12, v9);
}

BOOL BOMStreamAtEOF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 40))
  {
    int v9 = BOMExceptionHandlerMessage("%s Can't check EOF on a writeable stream", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamAtEOF");
    int v10 = __error();
    _BOMExceptionHandlerCall(v9, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", 353, *v10);
  }
  return *(void *)(a1 + 56) == *(void *)(a1 + 64);
}

uint64_t (*BOMStreamWriteUInt32(uint64_t (*result)(void *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(void *)
{
  unsigned int v8 = bswap32(a2);
  if (*((_DWORD *)result + 1) == 2) {
    int v9 = a2;
  }
  else {
    int v9 = v8;
  }
  if (*((_DWORD *)result + 10))
  {
    int v10 = (_DWORD *)*((void *)result + 7);
    if ((unint64_t)(v10 + 1) <= *((void *)result + 8))
    {
      _DWORD *v10 = v9;
      *((void *)result + 7) += 4;
      *((unsigned char *)result + 80) |= 2u;
      return result;
    }
    unsigned __int8 v11 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt32");
    int v12 = *__error();
    int v13 = v11;
    unsigned __int8 v14 = 1;
    int v15 = 373;
  }
  else
  {
    uint64_t v16 = BOMExceptionHandlerMessage("%s write called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt32");
    int v12 = *__error();
    int v13 = v16;
    unsigned __int8 v14 = 0;
    int v15 = 371;
  }

  return _BOMExceptionHandlerCall(v13, v14, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v15, v12);
}

uint64_t (*BOMStreamWriteUInt16(uint64_t (*result)(void *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(void *)
{
  __int16 v8 = __rev16(a2);
  if (*((_DWORD *)result + 1) == 2) {
    __int16 v9 = a2;
  }
  else {
    __int16 v9 = v8;
  }
  if (*((_DWORD *)result + 10))
  {
    int v10 = (_WORD *)*((void *)result + 7);
    if ((unint64_t)(v10 + 1) <= *((void *)result + 8))
    {
      _WORD *v10 = v9;
      *((void *)result + 7) += 2;
      *((unsigned char *)result + 80) |= 2u;
      return result;
    }
    unsigned __int8 v11 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt16");
    int v12 = *__error();
    int v13 = v11;
    unsigned __int8 v14 = 1;
    int v15 = 392;
  }
  else
  {
    uint64_t v16 = BOMExceptionHandlerMessage("%s write called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt16");
    int v12 = *__error();
    int v13 = v16;
    unsigned __int8 v14 = 0;
    int v15 = 390;
  }

  return _BOMExceptionHandlerCall(v13, v14, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v15, v12);
}

uint64_t (*BOMStreamWriteUInt8(uint64_t (*result)(void *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(void *)
{
  if (*((_DWORD *)result + 10))
  {
    __int16 v8 = (unsigned char *)*((void *)result + 7);
    if ((unint64_t)(v8 + 1) <= *((void *)result + 8))
    {
      unsigned char *v8 = a2;
      ++*((void *)result + 7);
      *((unsigned char *)result + 80) |= 2u;
      return result;
    }
    __int16 v9 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt8");
    int v10 = *__error();
    unsigned __int8 v11 = v9;
    unsigned __int8 v12 = 1;
    int v13 = 405;
  }
  else
  {
    unsigned __int8 v14 = BOMExceptionHandlerMessage("%s write called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt8");
    int v10 = *__error();
    unsigned __int8 v11 = v14;
    unsigned __int8 v12 = 0;
    int v13 = 403;
  }

  return _BOMExceptionHandlerCall(v11, v12, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v13, v10);
}

uint64_t (*BOMStreamWriteBuffer(uint64_t a1, const void *a2, size_t __len, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(void *)
{
  if (*(_DWORD *)(a1 + 40))
  {
    int v10 = *(void **)(a1 + 56);
    if ((unint64_t)v10 + __len <= *(void *)(a1 + 64))
    {
      uint64_t result = (uint64_t (*)(void *))memmove(v10, a2, __len);
      *(void *)(a1 + 56) += __len;
      *(unsigned char *)(a1 + 80) |= 2u;
      return result;
    }
    unsigned __int8 v11 = BOMExceptionHandlerMessage("%s buffer overflow", (uint64_t)a2, __len, a4, a5, a6, a7, a8, (char)"BOMStreamWriteBuffer");
    int v12 = *__error();
    int v13 = v11;
    unsigned __int8 v14 = 1;
    int v15 = 418;
  }
  else
  {
    uint64_t v16 = BOMExceptionHandlerMessage("%s write called on read-only buffer", (uint64_t)a2, __len, a4, a5, a6, a7, a8, (char)"BOMStreamWriteBuffer");
    int v12 = *__error();
    int v13 = v16;
    unsigned __int8 v14 = 0;
    int v15 = 416;
  }

  return _BOMExceptionHandlerCall(v13, v14, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v15, v12);
}

uint64_t BOMStreamGetDataPointer(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 40)) {
    return 0;
  }
  uint64_t result = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = result + a2;
  return result;
}

void CopyImageBlockSetCallback_cold_1()
{
  __assert_rtn("CopyImageBlockSetCallback", "IFImage.m", 61, "[imageDataSource isKindOfClass:[NSData class]] == YES");
}

void ReleaseInfoCallback_cold_1()
{
}

void logAndSetError_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DC6CA000, log, OS_LOG_TYPE_ERROR, "%@ (%ld)", (uint8_t *)&v3, 0x16u);
}

void __CUISubtypeFromIndex_cold_1(uint64_t a1)
{
}

void CUIFillRenditionKeyForCARKeyArray_cold_1()
{
}

void CUIRenditionKeySetValueForAttribute_cold_1()
{
}

void CUIRenditionKeySetValueForAttribute_cold_2()
{
}

void CUIRenditionKeySetValueForAttribute_cold_3()
{
}

void CUIFillCARKeyArrayForRenditionKey2_cold_1()
{
}

void CUIRenditionKeyCopy_cold_1()
{
}

void CUIRenditionKeyCopy_cold_2()
{
}

void CUICopyKeySignatureWithPrefix_cold_1()
{
}

void _CUIRenditionKeySetIntegerValueForAttribute_cold_1(unsigned __int16 a1)
{
}

void CUIBitVectorToString_cold_1()
{
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFArrayRef CFBundleCopyResourceURLsOfType(CFBundleRef bundle, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFArrayRef)MEMORY[0x1F40D74E8](bundle, resourceType, subDirName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1F40D85A0](string);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1F40D87B0](url, key, propertyValueTypeRefPtr, error);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9988](color, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x1F40D9F78](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGContextGetFillColorAsColor()
{
  return MEMORY[0x1F40D9F98]();
}

uint64_t CGContextGetStrokeColorAsColor()
{
  return MEMORY[0x1F40DA010]();
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x1F40DA0F0]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

uint64_t CGImageBlockCreate()
{
  return MEMORY[0x1F40DA7E8]();
}

uint64_t CGImageBlockSetCreate()
{
  return MEMORY[0x1F40DA810]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1F40DA850]();
}

uint64_t CGImageBlockSetRetain()
{
  return MEMORY[0x1F40DA858]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGImageCreateWithImageProvider()
{
  return MEMORY[0x1F40DA898]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1F40DA958]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1F40DA980]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

uint64_t CGImageProviderCopyImageBlockSet()
{
  return MEMORY[0x1F40DAA00]();
}

uint64_t CGImageProviderCreate()
{
  return MEMORY[0x1F40DAA18]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x1F40DAA38]();
}

uint64_t CGImageProviderGetComponentType()
{
  return MEMORY[0x1F40DAA40]();
}

uint64_t CGImageProviderGetSize()
{
  return MEMORY[0x1F40DAA68]();
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1F40DAAB0]();
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC50](url);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DAC88](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1F40DAC90](document, pageNumber);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x1F40DAD80](page, *(void *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1F40DF370](*(void *)&uiType, language, size);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1F40DF7E8](line, context);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

uint64_t CUILogHandle()
{
  return MEMORY[0x1F4115CA8]();
}

uint64_t CUILogRenditionLogEnabled()
{
  return MEMORY[0x1F4115CB0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x1F40D8BE8]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

uint64_t _CUILog()
{
  return MEMORY[0x1F4115CB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __CFSetLastAllocationEventName()
{
  return MEMORY[0x1F40D95A0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1F40C9CC0]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40C9CD0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t __strncat_chk()
{
  return MEMORY[0x1F40C9CE0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1F40CB888]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1F40CB890](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CC038](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1F40CC2D0](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1F40CC2D8](*(void *)&a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCE28](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1F40CDD48](path, name, *(void *)&options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl stpncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE130](__dst, __src, __n);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

void uuid_clear(uuid_t uu)
{
}

void uuid_generate_random(uuid_t out)
{
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1F40CE6B8](*(void *)&target_task, source_address, size, dest_address);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}