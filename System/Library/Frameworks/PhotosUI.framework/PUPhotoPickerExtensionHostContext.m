@interface PUPhotoPickerExtensionHostContext
- (BOOL)_isHEIFImageFormatFromData:(id)a3 url:(id)a4;
- (BOOL)cachedDidDisplayPhotoPickerPreview;
- (NSNumber)cachedDidDisplayPhotoPickerSourceType;
- (NSNumber)photoPickerNavigationBarHidden;
- (NSString)photoPickerViewControllerPrompt;
- (NSString)photoPickerViewControllerTitle;
- (NSUUID)requestIdentifier;
- (PUPhotoPickerHostService)delegate;
- (id)_JPEGDataFromImage:(id)a3;
- (id)_JPEGDataFromImageData:(id)a3;
- (id)_UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:(id)a3;
- (id)_createURLFromPath:(id)a3 token:(id)a4;
- (id)_pathExtensionFromData:(id)a3 url:(id)a4 exportPreset:(int64_t)a5;
- (id)_remote;
- (void)cancelPhotoPicker;
- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4;
- (void)didDisplayPhotoPickerPreview;
- (void)didDisplayPhotoPickerSourceType:(id)a3;
- (void)didSelectMediaWithInfoDictionary:(id)a3;
- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3;
- (void)didSetOnboardingHeaderDismissed:(BOOL)a3;
- (void)dismissCurrentViewControllerFromPhotoPickerAnimated:(id)a3;
- (void)initiatePhotoPickerSelection;
- (void)invalidatePhotoPickerHostServices;
- (void)performPhotoPickerPreviewOfFirstAsset;
- (void)performTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4;
- (void)setCachedDidDisplayPhotoPickerPreview:(BOOL)a3;
- (void)setCachedDidDisplayPhotoPickerSourceType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPhotoPickerNavigationBarHidden:(id)a3;
- (void)setPhotoPickerViewControllerPrompt:(id)a3;
- (void)setPhotoPickerViewControllerTitle:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation PUPhotoPickerExtensionHostContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDidDisplayPhotoPickerSourceType, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoPickerNavigationBarHidden, 0);
  objc_storeStrong((id *)&self->_photoPickerViewControllerPrompt, 0);

  objc_storeStrong((id *)&self->_photoPickerViewControllerTitle, 0);
}

- (void)setCachedDidDisplayPhotoPickerPreview:(BOOL)a3
{
  self->_cachedDidDisplayPhotoPickerPreview = a3;
}

- (BOOL)cachedDidDisplayPhotoPickerPreview
{
  return self->_cachedDidDisplayPhotoPickerPreview;
}

- (void)setCachedDidDisplayPhotoPickerSourceType:(id)a3
{
}

- (NSNumber)cachedDidDisplayPhotoPickerSourceType
{
  return self->_cachedDidDisplayPhotoPickerSourceType;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (PUPhotoPickerHostService)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PUPhotoPickerHostService *)WeakRetained;
}

- (void)setPhotoPickerNavigationBarHidden:(id)a3
{
}

- (NSNumber)photoPickerNavigationBarHidden
{
  return self->_photoPickerNavigationBarHidden;
}

- (void)setPhotoPickerViewControllerPrompt:(id)a3
{
}

- (NSString)photoPickerViewControllerPrompt
{
  return self->_photoPickerViewControllerPrompt;
}

- (void)setPhotoPickerViewControllerTitle:(id)a3
{
}

- (NSString)photoPickerViewControllerTitle
{
  return self->_photoPickerViewControllerTitle;
}

- (id)_pathExtensionFromData:(id)a3 url:(id)a4 exportPreset:(int64_t)a5
{
  CFDataRef v9 = (const __CFData *)a3;
  unint64_t v10 = (unint64_t)a4;
  v11 = (void *)v10;
  if ((unint64_t)v9 | v10)
  {
    if (v9)
    {
      v12 = CGImageSourceCreateWithData(v9, 0);
LABEL_6:
      v13 = v12;
      if (v12)
      {
        v14 = CGImageSourceGetType(v12);
        v15 = [MEMORY[0x263F5DF98] typeWithIdentifier:v14];
        v16 = [v15 preferredFilenameExtension];

        CFRelease(v13);
        if (v16) {
          goto LABEL_12;
        }
      }
      goto LABEL_8;
    }
    if (v10)
    {
      v12 = CGImageSourceCreateWithURL((CFURLRef)v10, 0);
      goto LABEL_6;
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerExtensionHostContext.m" lineNumber:431 description:@"Provide one of data or url"];
  }
LABEL_8:
  v16 = [v11 pathExtension];
  if (!v16)
  {
    v17 = (id *)MEMORY[0x263F1DAF8];
    if (a5 != 1) {
      v17 = (id *)MEMORY[0x263F1DB40];
    }
    v16 = [*v17 preferredFilenameExtension];
  }
LABEL_12:

  return v16;
}

- (id)_JPEGDataFromImage:(id)a3
{
  return UIImageJPEGRepresentation((UIImage *)a3, 0.9);
}

- (id)_JPEGDataFromImageData:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F827E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithData:v5];

  v7 = [(PUPhotoPickerExtensionHostContext *)self _JPEGDataFromImage:v6];

  return v7;
}

- (BOOL)_isHEIFImageFormatFromData:(id)a3 url:(id)a4
{
  CFDataRef v7 = (const __CFData *)a3;
  unint64_t v8 = (unint64_t)a4;
  CFDataRef v9 = (void *)v8;
  if (!((unint64_t)v7 | v8))
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerExtensionHostContext.m" lineNumber:406 description:@"Provide one of data or url"];
    char v13 = 0;
    goto LABEL_8;
  }
  if (v7)
  {
    unint64_t v10 = CGImageSourceCreateWithData(v7, 0);
  }
  else
  {
    if (!v8)
    {
LABEL_9:
      char v13 = 0;
      goto LABEL_10;
    }
    unint64_t v10 = CGImageSourceCreateWithURL((CFURLRef)v8, 0);
  }
  v11 = v10;
  if (!v10) {
    goto LABEL_9;
  }
  v12 = [MEMORY[0x263F5DF98] typeWithIdentifier:CGImageSourceGetType(v10)];
  char v13 = [v12 conformsToType:*MEMORY[0x263F1DE10]];
  CFRelease(v11);
LABEL_8:

LABEL_10:
  return v13;
}

- (id)_createURLFromPath:(id)a3 token:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  CFDataRef v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    char v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerExtensionHostContext.m" lineNumber:395 description:@"path cannot be nil"];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerExtensionHostContext.m" lineNumber:396 description:@"token cannot be nil"];

LABEL_3:
  unint64_t v10 = [NSURL fileURLWithPath:v7];
  v11 = (void *)[objc_alloc(MEMORY[0x263F5DB80]) initWithURL:v10 sandboxExtensionToken:v9 consume:1];
  if (!v11)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUPhotoPickerExtensionHostContext.m", 399, @"A sandboxed url could not be created for %@ %@", v10, v9 object file lineNumber description];
  }

  return v11;
}

- (id)_UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:(id)a3
{
  v141[1] = *MEMORY[0x263EF8340];
  v4 = (void *)[a3 mutableCopy];
  uint64_t v5 = *MEMORY[0x263F83D58];
  v115 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83D58]];
  if (v115)
  {
    [v4 setObject:0 forKeyedSubscript:v5];
    if ((unint64_t)([MEMORY[0x263F14E98] authorizationStatusForAccessLevel:2] - 3) <= 1)
    {
      v6 = [MEMORY[0x263F14E98] imagePickerPhotoLibrary];
      id v7 = [MEMORY[0x263F14E18] fetchOptionsWithInclusiveDefaultsForPhotoLibrary:v6];
      id v8 = (void *)MEMORY[0x263F14D18];
      v141[0] = v115;
      CFDataRef v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:1];
      unint64_t v10 = [v8 fetchAssetsWithLocalIdentifiers:v9 options:v7];

      v11 = [v10 firstObject];
      if (v11) {
        [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x263F836A8]];
      }
    }
  }
  v12 = [v4 objectForKeyedSubscript:@"PUPhotoPickerSavingOptions"];
  char v13 = [v12 integerValue];

  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerSavingOptions"];
  uint64_t v14 = *MEMORY[0x263F83D30];
  v15 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83D30]];
  v113 = v15;
  if (v15) {
    uint64_t v16 = [v15 integerValue];
  }
  else {
    uint64_t v16 = 0;
  }
  [v4 setObject:0 forKeyedSubscript:v14];
  uint64_t v17 = *MEMORY[0x263F836A0];
  v18 = [v4 objectForKeyedSubscript:*MEMORY[0x263F836A0]];
  if (v18)
  {
    id v131 = 0;
    v19 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v18 error:&v131];
    id v20 = v131;
    if (v20)
    {
      v21 = PLUIGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        __int16 v135 = 2112;
        id v136 = v20;
        _os_log_impl(&dword_217C33000, v21, OS_LOG_TYPE_ERROR, "%s Unable to create image %@", buf, 0x16u);
      }
    }
    [v4 setObject:v19 forKeyedSubscript:v17];
  }
  v22 = NSURL;
  v23 = NSTemporaryDirectory();
  v120 = [v22 fileURLWithPath:v23];

  v24 = [MEMORY[0x263F08C38] UUID];
  v119 = [v24 UUIDString];

  uint64_t v25 = [v4 objectForKeyedSubscript:@"PUPhotoPickerOriginalImagePath"];
  v114 = v18;
  v112 = (void *)v25;
  if (!v25)
  {
    v121 = 0;
    v31 = 0;
    goto LABEL_57;
  }
  uint64_t v26 = v25;
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerOriginalImagePath"];
  uint64_t v27 = [NSURL fileURLWithPath:v26];
  [v4 objectForKeyedSubscript:@"PUPhotoPickerOriginalImagePathSandboxExtensionToken"];
  v117 = v122 = (void *)v27;
  v28 = (void *)[objc_alloc(MEMORY[0x263F5DB80]) initWithURL:v27 sandboxExtensionToken:v117 consume:1];
  id v29 = 0;
  if ((v13 & 2) != 0)
  {
    v30 = [v4 objectForKeyedSubscript:v17];

    if (v30)
    {
      id v29 = 0;
    }
    else
    {
      id v29 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v28];
      if (v29)
      {
        v32 = self;
        v33 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithData:v29];
        if (v33) {
          [v4 setObject:v33 forKeyedSubscript:v17];
        }

        self = v32;
      }
    }
  }
  if ((v13 & 4) == 0)
  {
    if (v16)
    {
      v34 = 0;
LABEL_35:
      v36 = self;
      id v37 = v29;
      v38 = v28;
      uint64_t v39 = v16;
LABEL_45:
      uint64_t v42 = [(PUPhotoPickerExtensionHostContext *)v36 _pathExtensionFromData:v37 url:v38 exportPreset:v39];
      v41 = 0;
      goto LABEL_46;
    }
LABEL_37:
    v34 = objc_msgSend(NSNumber, "numberWithBool:", -[PUPhotoPickerExtensionHostContext _isHEIFImageFormatFromData:url:](self, "_isHEIFImageFormatFromData:url:", v29, v28));
    goto LABEL_38;
  }
  if (!v29)
  {
    id v29 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v28];
  }
  id v29 = v29;
  if (v16)
  {
    v34 = 0;
  }
  else
  {
    v34 = objc_msgSend(NSNumber, "numberWithBool:", -[PUPhotoPickerExtensionHostContext _isHEIFImageFormatFromData:url:](self, "_isHEIFImageFormatFromData:url:", v29, v28));
    if ([v34 BOOLValue])
    {
      v35 = [(PUPhotoPickerExtensionHostContext *)self _JPEGDataFromImageData:v29];

      goto LABEL_34;
    }
  }
  v35 = v29;
LABEL_34:
  [v4 setObject:v35 forKeyedSubscript:*MEMORY[0x263F83D50]];

  if (v16) {
    goto LABEL_35;
  }
  if (!v34) {
    goto LABEL_37;
  }
LABEL_38:
  if (![v34 BOOLValue])
  {
    v36 = self;
    id v37 = v29;
    v38 = v28;
    uint64_t v39 = 0;
    goto LABEL_45;
  }
  uint64_t v40 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83D50]];
  if (!v40)
  {
    if (!v29)
    {
      id v29 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v28];
    }
    uint64_t v40 = [(PUPhotoPickerExtensionHostContext *)self _JPEGDataFromImageData:v29];
  }
  v41 = (void *)v40;
  uint64_t v42 = [(PUPhotoPickerExtensionHostContext *)self _pathExtensionFromData:v40 url:0 exportPreset:0];
LABEL_46:
  v43 = self;
  v44 = [v120 URLByAppendingPathComponent:v119];
  v31 = (void *)v42;
  uint64_t v45 = [v44 URLByAppendingPathExtension:v42];

  v121 = (void *)v45;
  if (v41)
  {
    id v130 = 0;
    char v46 = [v41 writeToURL:v45 options:1 error:&v130];
    id v47 = v130;
    if ((v46 & 1) == 0)
    {
      v48 = PLUIGetLog();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
LABEL_55:

        goto LABEL_56;
      }
      [v47 localizedDescription];
      v50 = v49 = v34;
      *(_DWORD *)buf = 136315394;
      v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
      __int16 v135 = 2112;
      id v136 = v50;
      _os_log_impl(&dword_217C33000, v48, OS_LOG_TYPE_ERROR, "%s Unable to copy data with error: %@", buf, 0x16u);

LABEL_54:
      v34 = v49;
      goto LABEL_55;
    }
  }
  else
  {
    v49 = v34;
    v51 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v52 = v45;
    v53 = v51;
    id v129 = 0;
    char v54 = [v51 copyItemAtURL:v28 toURL:v52 error:&v129];
    id v47 = v129;

    if ((v54 & 1) == 0)
    {
      v48 = PLUIGetLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        __int16 v135 = 2112;
        id v136 = v28;
        __int16 v137 = 2112;
        v138 = v121;
        __int16 v139 = 2112;
        id v140 = v47;
        _os_log_impl(&dword_217C33000, v48, OS_LOG_TYPE_ERROR, "%s Unable to copy from %@ to %@ %@", buf, 0x2Au);
      }
      goto LABEL_54;
    }
    v34 = v49;
  }
LABEL_56:

  [v4 setObject:v121 forKeyedSubscript:*MEMORY[0x263F83678]];
  v18 = v114;
  self = v43;
LABEL_57:
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerOriginalImagePathSandboxExtensionToken"];
  uint64_t v55 = *MEMORY[0x263F83670];
  v118 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83670]];
  if (v118)
  {
    id v128 = 0;
    v56 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v118 error:&v128];
    id v57 = v128;
    if (v57)
    {
      v58 = PLUIGetLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        __int16 v135 = 2112;
        id v136 = v57;
        _os_log_impl(&dword_217C33000, v58, OS_LOG_TYPE_ERROR, "%s Unable to create edited image %@", buf, 0x16u);
      }
    }
    [v4 setObject:v56 forKeyedSubscript:v55];
  }
  uint64_t v59 = *MEMORY[0x263F83D28];
  v60 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83D28]];
  if (v60)
  {
    id v127 = 0;
    v61 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v60 error:&v127];
    id v62 = v127;
    if (v62)
    {
      v63 = v31;
      v64 = v60;
      v65 = PLUIGetLog();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        __int16 v135 = 2112;
        id v136 = v62;
        _os_log_impl(&dword_217C33000, v65, OS_LOG_TYPE_ERROR, "%s Unable to create fullScreenImage %@", buf, 0x16u);
      }

      v60 = v64;
      v31 = v63;
    }
    [v4 setObject:v61 forKeyedSubscript:v59];
  }
  v66 = [v4 objectForKeyedSubscript:@"PUPhotoPickerCropRectData"];
  if (v66)
  {
    id v126 = 0;
    v67 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v66 error:&v126];
    id v68 = v126;
    if (v68)
    {
      v69 = PLUIGetLog();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        __int16 v135 = 2112;
        id v136 = v68;
        _os_log_impl(&dword_217C33000, v69, OS_LOG_TYPE_ERROR, "%s Unable to create crop rect %@", buf, 0x16u);
      }
    }
    [v4 setObject:v67 forKeyedSubscript:*MEMORY[0x263F83668]];
    [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerCropRectData"];
  }
  v70 = [v4 objectForKeyedSubscript:@"PUPhotoPickerReferencePath"];
  if (v70)
  {
    v71 = [NSURL URLWithString:v70];
    [v4 setObject:v71 forKeyedSubscript:*MEMORY[0x263F836B0]];
    [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerReferencePath"];
  }
  v72 = [v4 objectForKeyedSubscript:@"PUPhotoPickerMediaPath"];
  v123 = v72;
  if (v72)
  {
    v73 = [v4 objectForKeyedSubscript:@"PUPhotoPickerMediaPathSandboxExtensionToken"];
    v74 = [(PUPhotoPickerExtensionHostContext *)self _createURLFromPath:v72 token:v73];
    [v4 setObject:v74 forKeyedSubscript:*MEMORY[0x263F83690]];

    v72 = v123;
  }
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerMediaPath"];
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerMediaPathSandboxExtensionToken"];
  uint64_t v75 = [v4 objectForKeyedSubscript:@"PUPhotoPickerOriginalIrisVideoFilePath"];
  if (v75)
  {
    v76 = [v4 objectForKeyedSubscript:@"PUPhotoPickerOriginalIrisVideoFilePathSandboxExtensionToken"];
    v77 = [(PUPhotoPickerExtensionHostContext *)self _createURLFromPath:v75 token:v76];
    [v4 setObject:v77 forKeyedSubscript:*MEMORY[0x263F83D38]];

    v72 = v123;
  }
  v111 = (void *)v75;
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerOriginalIrisVideoFilePath"];
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerOriginalIrisVideoFilePathSandboxExtensionToken"];
  uint64_t v78 = [v4 objectForKeyedSubscript:@"PUPhotoPickerGIFPath"];
  if (v78)
  {
    v79 = [NSURL fileURLWithPath:v78];
    [v4 setObject:v79 forKeyedSubscript:*MEMORY[0x263F83CE0]];
  }
  v110 = (void *)v78;
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerGIFPath"];
  v116 = [v4 objectForKeyedSubscript:@"_UIImagePickerDebugSidecarFileURLsData"];
  if (v116)
  {
    v80 = self;
    v81 = v31;
    v82 = v70;
    v83 = (void *)MEMORY[0x263F08928];
    v84 = (void *)MEMORY[0x263EFFA08];
    uint64_t v85 = objc_opt_class();
    v86 = objc_msgSend(v84, "setWithObjects:", v85, objc_opt_class(), 0);
    id v125 = 0;
    v87 = [v83 unarchivedObjectOfClasses:v86 fromData:v116 error:&v125];
    id v88 = v125;
    [v4 setObject:v87 forKeyedSubscript:@"_UIImagePickerDebugSidecarFileURLs"];

    if (v88)
    {
      v89 = PLUIGetLog();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        __int16 v135 = 2112;
        id v136 = v88;
        _os_log_impl(&dword_217C33000, v89, OS_LOG_TYPE_ERROR, "%s Unable to create debug sidecar files %@", buf, 0x16u);
      }
    }
    [v4 removeObjectForKey:@"_UIImagePickerDebugSidecarFileURLsData"];

    v70 = v82;
    v31 = v81;
    self = v80;
    v72 = v123;
  }
  v90 = [v4 objectForKeyedSubscript:@"PUPhotoPickerLivePhotoExists"];
  if (v90)
  {
    v107 = v70;
    v108 = v66;
    v109 = v60;
    v91 = [v4 objectForKeyedSubscript:@"PUPhotoPickerLivePhotoImagePath"];
    uint64_t v92 = [v4 objectForKeyedSubscript:@"PUPhotoPickerLivePhotoImagePathSandboxExtensionToken"];
    uint64_t v93 = [v4 objectForKeyedSubscript:@"PUPhotoPickerLivePhotoVideoPath"];
    v94 = [v4 objectForKeyedSubscript:@"PUPhotoPickerLivePhotoVideoPathSandboxExtensionToken"];
    v106 = (void *)v92;
    v95 = [(PUPhotoPickerExtensionHostContext *)self _createURLFromPath:v91 token:v92];
    v105 = (void *)v93;
    v96 = [(PUPhotoPickerExtensionHostContext *)self _createURLFromPath:v93 token:v94];
    v132[0] = v95;
    v132[1] = v96;
    v97 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:2];
    id v124 = 0;
    v98 = [MEMORY[0x263F14E50] livePhotoWithResourceFileURLs:v97 error:&v124];
    id v99 = v124;
    if (v99)
    {
      v104 = v91;
      v100 = v31;
      v101 = PLUIGetLog();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        __int16 v135 = 2112;
        id v136 = v99;
        _os_log_impl(&dword_217C33000, v101, OS_LOG_TYPE_ERROR, "%s Unable to create live photo - %@", buf, 0x16u);
      }

      v31 = v100;
      v91 = v104;
    }
    if (v98) {
      [v4 setObject:v98 forKeyedSubscript:*MEMORY[0x263F83680]];
    }

    v18 = v114;
    v66 = v108;
    v60 = v109;
    v70 = v107;
    v72 = v123;
  }
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerLivePhotoExists"];
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerLivePhotoImagePath"];
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerLivePhotoImagePathSandboxExtensionToken"];
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerLivePhotoVideoPath"];
  [v4 setObject:0 forKeyedSubscript:@"PUPhotoPickerLivePhotoVideoPathSandboxExtensionToken"];
  v102 = (void *)[v4 copy];

  return v102;
}

- (void)performTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUPhotoPickerExtensionHostContext *)self _remote];
  [v8 performTraitCollectionUpdateUsingData:v7 completion:v6];
}

- (void)performPhotoPickerPreviewOfFirstAsset
{
  id v2 = [(PUPhotoPickerExtensionHostContext *)self _remote];
  [v2 performPhotoPickerPreviewOfFirstAsset];
}

- (void)initiatePhotoPickerSelection
{
  id v2 = [(PUPhotoPickerExtensionHostContext *)self _remote];
  [v2 initiatePhotoPickerSelection];
}

- (void)didSelectMediaWithInfoDictionary:(id)a3
{
  id v7 = [(PUPhotoPickerExtensionHostContext *)self _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:a3];
  v4 = [(PUPhotoPickerExtensionHostContext *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PUPhotoPickerExtensionHostContext *)self delegate];
    [v6 didSelectMediaWithInfoDictionary:v7];
  }
}

- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = PLPhotoPickerGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v28 = [v4 count];
    _os_signpost_emit_with_name_impl(&dword_217C33000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ReceivingSelections", "%{public}ld", buf, 0xCu);
  }

  CFDataRef v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = -[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:](self, "_UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  uint64_t v16 = v8;
  uint64_t v17 = v16;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217C33000, v17, OS_SIGNPOST_INTERVAL_END, v6, "ReceivingSelections", (const char *)&unk_217C679D1, buf, 2u);
  }

  v18 = [(PUPhotoPickerExtensionHostContext *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v20 = (void *)[v9 copy];
    v21 = [(PUPhotoPickerExtensionHostContext *)self delegate];
    [v21 didSelectMultipleMediaItemsWithInfoDictionaries:v20];
  }
}

- (void)didDisplayPhotoPickerPreview
{
  v3 = [(PUPhotoPickerExtensionHostContext *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PUPhotoPickerExtensionHostContext *)self delegate];
    [v5 didDisplayPhotoPickerPreview];
  }
  else
  {
    [(PUPhotoPickerExtensionHostContext *)self setCachedDidDisplayPhotoPickerPreview:1];
  }
}

- (void)didDisplayPhotoPickerSourceType:(id)a3
{
  id v7 = a3;
  char v4 = [(PUPhotoPickerExtensionHostContext *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    os_signpost_id_t v6 = [(PUPhotoPickerExtensionHostContext *)self delegate];
    [v6 didDisplayPhotoPickerSourceType:v7];
  }
  else
  {
    [(PUPhotoPickerExtensionHostContext *)self setCachedDidDisplayPhotoPickerSourceType:v7];
  }
}

- (void)dismissCurrentViewControllerFromPhotoPickerAnimated:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotoPickerExtensionHostContext *)self delegate];
  [v5 dismissCurrentViewControllerFromPhotoPickerAnimated:v4];
}

- (void)didSetOnboardingHeaderDismissed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 setBool:v3 forKey:@"com.apple.photos.picker.header"];
}

- (void)invalidatePhotoPickerHostServices
{
  BOOL v3 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.mobileslideshow.photo-picker" code:0 userInfo:MEMORY[0x263EFFA78]];
  [(PUPhotoPickerExtensionHostContext *)self cancelRequestWithError:v3];
  id v4 = [(PUPhotoPickerExtensionHostContext *)self _remote];
  [v4 invalidatePhotoPickerRemoteServices];

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoPickerExtensionHostContext;
  [(PUPhotoPickerAbstractExtensionContext *)&v5 invalidateContext];
}

- (void)cancelPhotoPicker
{
  id v2 = [(PUPhotoPickerExtensionHostContext *)self delegate];
  [v2 cancelPhotoPicker];
}

- (id)_remote
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoPickerExtensionHostContext;
  id v2 = [(PUPhotoPickerAbstractExtensionContext *)&v4 proxy];

  return v2;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_super v5 = [(PUPhotoPickerExtensionHostContext *)self cachedDidDisplayPhotoPickerSourceType];
    if (v5)
    {
      os_signpost_id_t v6 = [(PUPhotoPickerExtensionHostContext *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = [(PUPhotoPickerExtensionHostContext *)self delegate];
        [v8 didDisplayPhotoPickerSourceType:v5];
      }
    }
    if ([(PUPhotoPickerExtensionHostContext *)self cachedDidDisplayPhotoPickerPreview])
    {
      CFDataRef v9 = [(PUPhotoPickerExtensionHostContext *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        uint64_t v11 = [(PUPhotoPickerExtensionHostContext *)self delegate];
        [v11 didDisplayPhotoPickerPreview];
      }
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __85__PUPhotoPickerExtensionHostContext_completeRequestReturningItems_completionHandler___block_invoke;
  v9[3] = &unk_2642C5220;
  id v8 = v7;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  [(PUPhotoPickerAbstractExtensionContext *)self firstPayloadFromExtensionItems:v6 completion:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __85__PUPhotoPickerExtensionHostContext_completeRequestReturningItems_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained delegate];
    [v6 didSelectMediaWithInfoDictionary:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end