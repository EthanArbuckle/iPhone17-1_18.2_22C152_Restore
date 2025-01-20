@interface GEOAppleMediaServicesResult
+ (BOOL)supportsSecureCoding;
+ (id)_artworkDictionaryFromResponseDictionary:(id)a3;
- (BOOL)isAppInstalled;
- (GEOAppleMediaServicesResult)initWithCoder:(id)a3;
- (GEOAppleMediaServicesResult)initWithIdentifier:(id)a3 mediaType:(int64_t)a4 displayName:(id)a5 shortName:(id)a6 artistName:(id)a7 url:(id)a8 subtitle:(id)a9 editorialSubtitle:(id)a10 iOSBundleIdentifier:(id)a11 artworkURL:(id)a12 ratingsCount:(int)a13 ratingsValue:(float)a14 transitModes:(id)a15 classType:(id)a16 episodeNumber:(int)a17 duration:(double)a18;
- (GEOAppleMediaServicesResult)initWithResponseDictionary:(id)a3 mediaType:(int64_t)a4 artworkSize:(CGSize)a5 screenScale:(double)a6;
- (NSArray)transitModes;
- (NSString)artistName;
- (NSString)classType;
- (NSString)displayName;
- (NSString)editorialSubtitle;
- (NSString)iOSBundleIdentifier;
- (NSString)identifier;
- (NSString)shortName;
- (NSString)subtitle;
- (NSURL)artworkURL;
- (NSURL)url;
- (double)duration;
- (float)ratingsValue;
- (int)episodeNumber;
- (int)ratingsCount;
- (int64_t)mediaType;
- (void)encodeWithCoder:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIOSBundleIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRatingsCount:(int)a3;
- (void)setRatingsValue:(float)a3;
- (void)setSubtitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation GEOAppleMediaServicesResult

- (GEOAppleMediaServicesResult)initWithIdentifier:(id)a3 mediaType:(int64_t)a4 displayName:(id)a5 shortName:(id)a6 artistName:(id)a7 url:(id)a8 subtitle:(id)a9 editorialSubtitle:(id)a10 iOSBundleIdentifier:(id)a11 artworkURL:(id)a12 ratingsCount:(int)a13 ratingsValue:(float)a14 transitModes:(id)a15 classType:(id)a16 episodeNumber:(int)a17 duration:(double)a18
{
  id v24 = a3;
  id v25 = a5;
  id v63 = a6;
  id v64 = a7;
  id obj = a8;
  id v26 = a8;
  id v27 = a9;
  id v28 = a10;
  id v67 = a11;
  id v29 = a12;
  id v30 = a15;
  id v31 = a16;
  v32 = v24;
  uint64_t v33 = [v24 length];
  v66 = v29;
  v34 = v30;
  if (v33)
  {
    uint64_t v35 = [v25 length];
    v36 = 0;
    v65 = v25;
    if (v26)
    {
      v37 = v63;
      if (v35)
      {
        v69.receiver = self;
        v69.super_class = (Class)GEOAppleMediaServicesResult;
        v38 = [(GEOAppleMediaServicesResult *)&v69 init];
        v39 = v38;
        v40 = v64;
        v41 = v28;
        if (v38)
        {
          v38->_mediaType = a4;
          uint64_t v42 = [v32 copy];
          identifier = v39->_identifier;
          v39->_identifier = (NSString *)v42;

          uint64_t v44 = [v65 copy];
          displayName = v39->_displayName;
          v39->_displayName = (NSString *)v44;

          uint64_t v46 = [v63 copy];
          shortName = v39->_shortName;
          v39->_shortName = (NSString *)v46;

          objc_storeStrong((id *)&v39->_url, obj);
          uint64_t v48 = [v27 copy];
          subtitle = v39->_subtitle;
          v39->_subtitle = (NSString *)v48;

          uint64_t v50 = [v28 copy];
          editorialSubtitle = v39->_editorialSubtitle;
          v39->_editorialSubtitle = (NSString *)v50;

          uint64_t v52 = [v67 copy];
          iOSBundleIdentifier = v39->_iOSBundleIdentifier;
          v39->_iOSBundleIdentifier = (NSString *)v52;

          objc_storeStrong((id *)&v39->_artworkURL, a12);
          v39->_ratingsCount = a13;
          v39->_ratingsValue = a14;
          objc_storeStrong((id *)&v39->_transitModes, a15);
          uint64_t v54 = [v64 copy];
          artistName = v39->_artistName;
          v39->_artistName = (NSString *)v54;

          uint64_t v56 = [v31 copy];
          classType = v39->_classType;
          v39->_classType = (NSString *)v56;

          v39->_episodeNumber = a17;
          v39->_duration = a18;
        }
        v36 = v39;
        self = v36;
        goto LABEL_10;
      }
    }
    else
    {
      v37 = v63;
    }
    v40 = v64;
    v41 = v28;
LABEL_10:
    v59 = v65;
    goto LABEL_11;
  }
  v36 = 0;
  id v58 = v25;
  v37 = v63;
  v40 = v64;
  v41 = v28;
  v59 = v58;
LABEL_11:

  return v36;
}

- (GEOAppleMediaServicesResult)initWithResponseDictionary:(id)a3 mediaType:(int64_t)a4 artworkSize:(CGSize)a5 screenScale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  v81 = [v10 objectForKeyedSubscript:@"id"];
  v11 = [v10 objectForKeyedSubscript:@"attributes"];
  v12 = [v11 objectForKeyedSubscript:@"name"];
  v13 = v12;
  if (v12)
  {
    id v80 = v12;
  }
  else
  {
    v14 = [v10 objectForKeyedSubscript:@"attributes"];
    v15 = [v14 objectForKeyedSubscript:@"editorialNotes"];
    id v80 = [v15 objectForKeyedSubscript:@"name"];
  }
  v16 = [v10 objectForKeyedSubscript:@"attributes"];
  v74 = [v16 objectForKeyedSubscript:@"artistName"];

  v17 = [v10 objectForKeyedSubscript:@"attributes"];
  v18 = [v17 objectForKeyedSubscript:@"url"];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    v21 = [v10 objectForKeyedSubscript:@"attributes"];
    id v20 = [v21 objectForKeyedSubscript:@"postUrl"];
  }
  v71 = v20;
  if ([v20 length])
  {
    v79 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
  }
  else
  {
    v79 = 0;
  }
  v22 = [v10 objectForKeyedSubscript:@"attributes"];
  v23 = [v22 objectForKeyedSubscript:@"platformAttributes"];
  id v24 = [v23 objectForKeyedSubscript:@"ios"];
  v78 = [v24 objectForKeyedSubscript:@"subtitle"];

  id v25 = [v10 objectForKeyedSubscript:@"attributes"];
  id v26 = [v25 objectForKeyedSubscript:@"platformAttributes"];
  id v27 = [v26 objectForKeyedSubscript:@"ios"];
  v77 = [v27 objectForKeyedSubscript:@"shortName"];

  id v28 = [v10 objectForKeyedSubscript:@"attributes"];
  id v29 = [v28 objectForKeyedSubscript:@"editorialNotes"];
  v76 = [v29 objectForKeyedSubscript:@"short"];

  id v30 = [v10 objectForKeyedSubscript:@"attributes"];
  id v31 = [v30 objectForKeyedSubscript:@"platformAttributes"];
  v32 = [v31 objectForKeyedSubscript:@"ios"];
  v75 = [v32 objectForKeyedSubscript:@"bundleId"];

  uint64_t v33 = [v10 objectForKeyedSubscript:@"attributes"];
  v34 = [v33 objectForKeyedSubscript:@"episodeNumber"];
  int v35 = [v34 intValue];

  v36 = [v10 objectForKeyedSubscript:@"attributes"];
  v37 = [v36 objectForKeyedSubscript:@"durationInMilliseconds"];
  [v37 doubleValue];
  double v39 = v38;

  v40 = 0;
  int v72 = v35;
  if (a6 > 0.0 && height > 0.0 && width > 0.0)
  {
    v41 = [(id)objc_opt_class() _artworkDictionaryFromResponseDictionary:v10];
    if (v41 && AppleMediaServicesLibraryCore())
    {
      uint64_t v42 = (void *)[objc_alloc((Class)getAMSMediaArtworkClass()) initWithDictionary:v41];
      uint64_t v88 = 0;
      v89 = &v88;
      uint64_t v90 = 0x2020000000;
      v43 = (id *)_MergedGlobals_342;
      uint64_t v91 = _MergedGlobals_342;
      if (!_MergedGlobals_342)
      {
        uint64_t v83 = MEMORY[0x1E4F143A8];
        uint64_t v84 = 3221225472;
        uint64_t v85 = (uint64_t)__getAMSMediaArtworkCropStyleSquareCenterCropSymbolLoc_block_invoke_0;
        v86 = &unk_1E53DB3C8;
        v87 = &v88;
        uint64_t v44 = (void *)AppleMediaServicesLibrary();
        v89[3] = (uint64_t)dlsym(v44, "AMSMediaArtworkCropStyleSquareCenterCrop");
        _MergedGlobals_342 = *(void *)(v87[1] + 24);
        v43 = (id *)v89[3];
      }
      v45 = self;
      _Block_object_dispose(&v88, 8);
      if (!v43) {
        goto LABEL_27;
      }
      id v46 = *v43;
      uint64_t v88 = 0;
      v89 = &v88;
      uint64_t v90 = 0x2020000000;
      v47 = (void *)qword_1EB2A0828;
      uint64_t v91 = qword_1EB2A0828;
      if (!qword_1EB2A0828)
      {
        uint64_t v83 = MEMORY[0x1E4F143A8];
        uint64_t v84 = 3221225472;
        uint64_t v85 = (uint64_t)__getAMSMediaArtworkFormatJPGSymbolLoc_block_invoke_0;
        v86 = &unk_1E53DB3C8;
        v87 = &v88;
        uint64_t v48 = (void *)AppleMediaServicesLibrary();
        v89[3] = (uint64_t)dlsym(v48, "AMSMediaArtworkFormatJPG");
        qword_1EB2A0828 = *(void *)(v87[1] + 24);
        v47 = (void *)v89[3];
      }
      _Block_object_dispose(&v88, 8);
      if (!v47)
      {
LABEL_27:
        dlerror();
        v68 = (_Unwind_Exception *)abort_report_np();
        _Block_object_dispose(&v88, 8);
        _Unwind_Resume(v68);
      }
      v40 = objc_msgSend(v42, "URLWithSize:cropStyle:format:", v46, *v47, width * a6, height * a6);

      self = v45;
    }
    else
    {
      v40 = 0;
    }
  }
  v49 = self;
  uint64_t v50 = [v10 objectForKeyedSubscript:@"attributes"];
  v51 = [v50 objectForKeyedSubscript:@"userRating"];

  uint64_t v52 = [v51 objectForKeyedSubscript:@"ratingCount"];
  int v53 = [v52 intValue];

  uint64_t v54 = [v51 objectForKeyedSubscript:@"value"];
  [v54 floatValue];
  int v56 = v55;

  v57 = [v10 objectForKeyedSubscript:@"attributes"];
  id v58 = [v57 objectForKeyedSubscript:@"transitModes"];

  uint64_t v83 = 0;
  uint64_t v84 = (uint64_t)&v83;
  uint64_t v85 = 0x2020000000;
  LOBYTE(v86) = 1;
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __92__GEOAppleMediaServicesResult_initWithResponseDictionary_mediaType_artworkSize_screenScale___block_invoke;
  v82[3] = &unk_1E53F6450;
  v82[4] = &v83;
  [v58 enumerateObjectsUsingBlock:v82];
  if (!*(unsigned char *)(v84 + 24))
  {

    id v58 = 0;
  }
  v59 = [v10 objectForKeyedSubscript:@"relationships"];
  v60 = [v59 objectForKeyedSubscript:@"modalities"];
  v61 = [v60 objectForKeyedSubscript:@"data"];
  v62 = [v61 firstObject];

  id v63 = [v62 objectForKeyedSubscript:@"attributes"];
  id v64 = [v63 objectForKeyedSubscript:@"name"];

  LODWORD(v70) = v72;
  LODWORD(v69) = v53;
  LODWORD(v65) = v56;
  v66 = [(GEOAppleMediaServicesResult *)v49 initWithIdentifier:v81 mediaType:a4 displayName:v80 shortName:v77 artistName:v74 url:v79 subtitle:v65 editorialSubtitle:v39 iOSBundleIdentifier:v78 artworkURL:v76 ratingsCount:v75 ratingsValue:v40 transitModes:v69 classType:v58 episodeNumber:v64 duration:v70];

  _Block_object_dispose(&v83, 8);
  return v66;
}

void __92__GEOAppleMediaServicesResult_initWithResponseDictionary_mediaType_artworkSize_screenScale___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (GEOAppleMediaServicesResult)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v23 = [v3 decodeIntegerForKey:@"mediaType"];
  id v27 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  id v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"shortName"];
  id v26 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  id v24 = [MEMORY[0x1E4F1CB10] URLWithString:v26];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"editorialSubtitle"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"iOSBundleIdentifier"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"artworkURL"];
  id v20 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
  int v7 = [v3 decodeIntForKey:@"ratingsCount"];
  [v3 decodeFloatForKey:@"ratingsValue"];
  int v9 = v8;
  id v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"classType"];
  int v11 = [v3 decodeIntForKey:@"episodeNumber"];
  [v3 decodeDoubleForKey:@"duration"];
  double v13 = v12;
  v14 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"transitModes"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"artistName"];

  LODWORD(v19) = v11;
  LODWORD(v18) = v7;
  LODWORD(v16) = v9;
  id v29 = [(GEOAppleMediaServicesResult *)self initWithIdentifier:v27 mediaType:v23 displayName:v22 shortName:v25 artistName:v15 url:v24 subtitle:v16 editorialSubtitle:v13 iOSBundleIdentifier:v4 artworkURL:v5 ratingsCount:v6 ratingsValue:v20 transitModes:v18 classType:v14 episodeNumber:v10 duration:v19];

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  objc_msgSend(v17, "encodeInteger:forKey:", -[GEOAppleMediaServicesResult mediaType](self, "mediaType"), @"mediaType");
  v4 = [(GEOAppleMediaServicesResult *)self identifier];
  [v17 encodeObject:v4 forKey:@"identifier"];

  v5 = [(GEOAppleMediaServicesResult *)self displayName];
  [v17 encodeObject:v5 forKey:@"displayName"];

  id v6 = [(GEOAppleMediaServicesResult *)self shortName];
  [v17 encodeObject:v6 forKey:@"shortName"];

  int v7 = [(GEOAppleMediaServicesResult *)self url];
  int v8 = [v7 absoluteString];
  [v17 encodeObject:v8 forKey:@"url"];

  int v9 = [(GEOAppleMediaServicesResult *)self subtitle];
  [v17 encodeObject:v9 forKey:@"subtitle"];

  id v10 = [(GEOAppleMediaServicesResult *)self editorialSubtitle];
  [v17 encodeObject:v10 forKey:@"editorialSubtitle"];

  int v11 = [(GEOAppleMediaServicesResult *)self iOSBundleIdentifier];
  [v17 encodeObject:v11 forKey:@"iOSBundleIdentifier"];

  double v12 = [(GEOAppleMediaServicesResult *)self artworkURL];
  double v13 = [v12 absoluteString];
  [v17 encodeObject:v13 forKey:@"artworkURL"];

  objc_msgSend(v17, "encodeInt:forKey:", -[GEOAppleMediaServicesResult ratingsCount](self, "ratingsCount"), @"ratingsCount");
  [(GEOAppleMediaServicesResult *)self ratingsValue];
  objc_msgSend(v17, "encodeFloat:forKey:", @"ratingsValue");
  v14 = [(GEOAppleMediaServicesResult *)self transitModes];
  [v17 encodeObject:v14 forKey:@"transitModes"];

  v15 = [(GEOAppleMediaServicesResult *)self artistName];
  [v17 encodeObject:v15 forKey:@"artistName"];

  double v16 = [(GEOAppleMediaServicesResult *)self classType];
  [v17 encodeObject:v16 forKey:@"classType"];

  objc_msgSend(v17, "encodeInt:forKey:", -[GEOAppleMediaServicesResult episodeNumber](self, "episodeNumber"), @"episodeNumber");
  [(GEOAppleMediaServicesResult *)self duration];
  objc_msgSend(v17, "encodeDouble:forKey:", @"duration");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isAppInstalled
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  v4 = [(GEOAppleMediaServicesResult *)self iOSBundleIdentifier];
  v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
  id v6 = [v5 applicationState];
  char v7 = [v6 isInstalled];

  return v7;
}

+ (id)_artworkDictionaryFromResponseDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"attributes"];
  v5 = [v4 objectForKeyedSubscript:@"platformAttributes"];
  id v6 = [v5 objectForKeyedSubscript:@"ios"];
  char v7 = [v6 objectForKeyedSubscript:@"artwork"];

  int v8 = [v3 objectForKeyedSubscript:@"attributes"];
  int v9 = [v8 objectForKeyedSubscript:@"artwork"];

  id v10 = [v3 objectForKeyedSubscript:@"attributes"];
  int v11 = [v10 objectForKeyedSubscript:@"artworks"];
  double v12 = [v11 firstObject];

  double v13 = [v3 objectForKeyedSubscript:@"attributes"];
  v14 = [v13 objectForKeyedSubscript:@"editorialVideo"];
  v15 = [v14 objectForKeyedSubscript:@"storeFrontVideo4x3"];
  double v16 = [v15 objectForKeyedSubscript:@"previewFrame"];

  id v17 = [v3 objectForKeyedSubscript:@"relationships"];

  uint64_t v18 = [v17 objectForKeyedSubscript:@"books"];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"data"];
  id v20 = [v19 firstObject];

  v21 = [v20 objectForKeyedSubscript:@"attributes"];
  v22 = [v21 objectForKeyedSubscript:@"artwork"];

  if (v16) {
    uint64_t v23 = v16;
  }
  else {
    uint64_t v23 = v22;
  }
  if (v12) {
    uint64_t v23 = v12;
  }
  if (v9) {
    uint64_t v23 = v9;
  }
  if (v7) {
    id v24 = v7;
  }
  else {
    id v24 = v23;
  }
  id v25 = v24;

  return v25;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)iOSBundleIdentifier
{
  return self->_iOSBundleIdentifier;
}

- (void)setIOSBundleIdentifier:(id)a3
{
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (int)ratingsCount
{
  return self->_ratingsCount;
}

- (void)setRatingsCount:(int)a3
{
  self->_ratingsCount = a3;
}

- (float)ratingsValue
{
  return self->_ratingsValue;
}

- (void)setRatingsValue:(float)a3
{
  self->_ratingsValue = a3;
}

- (NSArray)transitModes
{
  return self->_transitModes;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)editorialSubtitle
{
  return self->_editorialSubtitle;
}

- (int)episodeNumber
{
  return self->_episodeNumber;
}

- (NSString)classType
{
  return self->_classType;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_classType, 0);
  objc_storeStrong((id *)&self->_editorialSubtitle, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_transitModes, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_iOSBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end