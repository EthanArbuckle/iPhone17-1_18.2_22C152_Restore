@interface PHImportLibraryAsset
+ (BOOL)isValidAsSidecar:(id)a3;
- (BOOL)canDelete;
- (BOOL)canReference;
- (BOOL)isBase;
- (BOOL)isRender;
- (BOOL)isSidecar;
- (BOOL)shouldPreserveUUID;
- (PHImportLibraryAsset)initWithSource:(id)a3 url:(id)a4 type:(id)a5 supportedMediaType:(unsigned __int8)a6 uuid:(id)a7;
- (id)makeImportIdentifier;
- (id)nameKey;
- (void)configureSidecarTypeForExtension:(id)a3;
@end

@implementation PHImportLibraryAsset

+ (BOOL)isValidAsSidecar:(id)a3
{
  id v4 = a3;
  v5 = [v4 pathExtension];
  v6 = [v5 uppercaseString];

  if ([v6 isEqualToString:@"PLIST"])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___PHImportLibraryAsset;
    unsigned __int8 v7 = objc_msgSendSuper2(&v9, sel_isValidAsSidecar_, v4);
  }

  return v7;
}

- (id)nameKey
{
  v3 = [(PHImportAsset *)self createdFileName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHImportLibraryAsset;
    id v5 = [(PHImportAsset *)&v8 nameKey];
  }
  v6 = v5;

  return v6;
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)canReference
{
  return 0;
}

- (BOOL)isRender
{
  return [(PHImportAsset *)self resourceType] == 5
      || [(PHImportAsset *)self resourceType] == 6;
}

- (BOOL)isSidecar
{
  if (([(PHImportAsset *)self resourceSubType] & 0x10000) != 0) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PHImportLibraryAsset;
  return [(PHImportAsset *)&v4 isSidecar];
}

- (BOOL)isBase
{
  return self->_isPenultimate;
}

- (BOOL)shouldPreserveUUID
{
  return 1;
}

- (void)configureSidecarTypeForExtension:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"PLIST"])
  {
    [(PHImportAsset *)self setResourceType:7];
    [(PHImportAsset *)self setResourceSubType:0x10000];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PHImportLibraryAsset;
    [(PHImportAsset *)&v5 configureSidecarTypeForExtension:v4];
  }
}

- (id)makeImportIdentifier
{
  v2 = (void *)MEMORY[0x1E4F8B978];
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [(PHImportAsset *)self url];
  objc_super v5 = [v4 path];
  v6 = [v3 fileURLWithPath:v5];
  unsigned __int8 v7 = [v2 uuidFromURL:v6];

  return v7;
}

- (PHImportLibraryAsset)initWithSource:(id)a3 url:(id)a4 type:(id)a5 supportedMediaType:(unsigned __int8)a6 uuid:(id)a7
{
  uint64_t v8 = a6;
  id v12 = a4;
  v62.receiver = self;
  v62.super_class = (Class)PHImportLibraryAsset;
  v13 = [(PHImportAsset *)&v62 initWithSource:a3 url:v12 type:a5 supportedMediaType:v8 uuid:a7];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F8B900] persistedAttributesForFileAtURL:v12 exists:0 includeUnknownAttributes:0];
    id v60 = [v14 stringForKey:*MEMORY[0x1E4F8C400]];
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v69[0] = 0;
    if ([v14 getUInt16:v69 forKey:*MEMORY[0x1E4F8C3A8]]) {
      BOOL v16 = v69[0] == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16)
    {
      v17 = objc_msgSend(NSNumber, "numberWithUnsignedShort:");
      [v15 setObject:v17 forKeyedSubscript:@"importedBy"];
    }
    uint64_t v18 = [v14 stringForKey:*MEMORY[0x1E4F8C398]];
    if (v18) {
      [v15 setObject:v18 forKeyedSubscript:@"importedByBundleIdentifier"];
    }
    uint64_t v19 = [v14 stringForKey:*MEMORY[0x1E4F8C3A0]];
    if (v19) {
      [v15 setObject:v19 forKeyedSubscript:@"importedByDisplayName"];
    }
    unsigned __int16 v68 = 0;
    if ([v14 getUInt16:&v68 forKey:*MEMORY[0x1E4F8C390]])
    {
      v20 = [NSNumber numberWithUnsignedShort:v68];
      [v15 setObject:v20 forKeyedSubscript:@"hidden"];
    }
    unsigned __int16 v67 = 0;
    if ([v14 getUInt16:&v67 forKey:*MEMORY[0x1E4F8C388]])
    {
      v21 = [NSNumber numberWithUnsignedShort:v67];
      [v15 setObject:v21 forKeyedSubscript:@"favorite"];
    }
    unsigned __int16 v66 = 0;
    if ([v14 getUInt16:&v66 forKey:*MEMORY[0x1E4F8C460]])
    {
      v22 = [NSNumber numberWithUnsignedShort:v66];
      [v15 setObject:v22 forKeyedSubscript:@"trashedState"];

      LOWORD(v65.value) = 0;
      [v14 getUInt16:&v65 forKey:*MEMORY[0x1E4F8C468]];
      v23 = [NSNumber numberWithUnsignedShort:LOWORD(v65.value)];
      [v15 setObject:v23 forKeyedSubscript:@"trashedReason"];
    }
    uint64_t v24 = [v14 dataForKey:*MEMORY[0x1E4F8C380]];
    if (v24)
    {
      CMTime v65 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      CMTime v64 = v65;
      [MEMORY[0x1E4F8A670] fromExtraDurationData:v24 getStillDisplayTime:&v65 videoDuration:&v64];
      CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CMTime time = v64;
      CFDictionaryRef v26 = CMTimeCopyAsDictionary(&time, v25);
      [v15 setObject:v26 forKeyedSubscript:@"photoIrisVideoDuration"];

      CMTime time = v65;
      CFDictionaryRef v27 = CMTimeCopyAsDictionary(&time, v25);
      [v15 setObject:v27 forKeyedSubscript:@"photoIrisStillDisplayTime"];
    }
    LOWORD(v64.value) = 0;
    if ([v14 getUInt16:&v64 forKey:*MEMORY[0x1E4F8C478]])
    {
      v28 = [NSNumber numberWithUnsignedShort:LOWORD(v64.value)];
      [v15 setObject:v28 forKeyedSubscript:@"videoCpVisibilityState"];
    }
    uint64_t v29 = [v14 stringForKey:*MEMORY[0x1E4F8C458]];
    if (v29) {
      [v15 setObject:v29 forKeyedSubscript:@"title"];
    }
    v30 = [v14 stringForKey:*MEMORY[0x1E4F8C308]];
    if (v30) {
      [v15 setObject:v30 forKeyedSubscript:@"accessibilityDescription"];
    }
    id v61 = v12;
    v31 = [v14 stringForKey:*MEMORY[0x1E4F8C378]];
    if (v31) {
      [v15 setObject:v31 forKeyedSubscript:@"additionalAttributes.longDescription"];
    }
    v32 = objc_msgSend(v14, "stringForKey:", *MEMORY[0x1E4F8C448], v29);
    if (v32) {
      [v15 setObject:v32 forKeyedSubscript:@"additionalAttributes.timeZoneName"];
    }
    v59 = (void *)v18;
    LODWORD(v65.value) = 0;
    if ([v14 getInt32:&v65 forKey:*MEMORY[0x1E4F8C450]])
    {
      v33 = [NSNumber numberWithInt:LODWORD(v65.value)];
      [v15 setObject:v33 forKeyedSubscript:@"additionalAttributes.timeZoneOffset"];
    }
    v57 = v13;
    v58 = (void *)v19;
    v34 = [v14 dataForKey:*MEMORY[0x1E4F8C348]];
    if (v34)
    {
      uint64_t v35 = [MEMORY[0x1E4F28F98] propertyListWithData:v34 options:0 format:0 error:0];
      if (v35)
      {
        v36 = (void *)v35;
        [v15 setObject:v35 forKeyedSubscript:@"dateCreated"];
      }
    }
    v37 = (void *)v24;
    v38 = [v14 dataForKey:*MEMORY[0x1E4F8C408]];
    if (v38) {
      [v15 setObject:v38 forKeyedSubscript:@"placeAnnotationData"];
    }
    v39 = [v14 dataForKey:*MEMORY[0x1E4F8C350]];
    if (v39) {
      [v15 setObject:v39 forKeyedSubscript:@"location"];
    }
    if ([v15 count]) {
      v40 = v15;
    }
    else {
      v40 = 0;
    }
    id v41 = v40;

    id v42 = v60;
    v13 = v57;
    [(PHImportAsset *)v57 setCustomAssetProperties:v41];

    if (v42)
    {
      [(PHImportAsset *)v57 setCreatedFileName:v42];
    }
    else
    {
      v43 = [(PHImportAsset *)v57 fileName];
      [(PHImportAsset *)v57 setCreatedFileName:v43];
    }
    id v44 = objc_alloc(MEMORY[0x1E4F8B978]);
    v45 = [(PHImportAsset *)v57 uuid];
    v46 = [(PHImportAsset *)v57 contentType];
    v47 = [v46 identifier];
    v48 = (void *)[v44 initWithAssetUuid:v45 bundleScope:0 uti:v47 resourceVersion:1 recipeID:0];

    v49 = [(PHImportAsset *)v57 source];
    v50 = [v49 pathManager];
    v51 = [v50 readOnlyUrlWithIdentifier:v48];

    v52 = [(PHImportAsset *)v57 url];
    v53 = [v52 lastPathComponent];
    v54 = [v51 lastPathComponent];
    v57->_isPenultimate = [v53 isEqualToString:v54];

    id v12 = v61;
  }

  return v13;
}

@end