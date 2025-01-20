@interface _BlastDoorLPLinkMetadata
+ (BOOL)supportsSecureCoding;
+ (_BlastDoorLPLinkMetadata)metadataWithDataRepresentation:(id)a3;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesActivityPub;
- (NSArray)alternateImages;
- (NSArray)arAssets;
- (NSArray)audios;
- (NSArray)availableContentImages;
- (NSArray)contentImages;
- (NSArray)contentImagesMetadata;
- (NSArray)icons;
- (NSArray)images;
- (NSArray)streamingVideos;
- (NSArray)videos;
- (NSItemProvider)iconProvider;
- (NSItemProvider)imageProvider;
- (NSItemProvider)videoProvider;
- (NSString)appleContentID;
- (NSString)appleSummary;
- (NSString)creator;
- (NSString)creatorFacebookProfile;
- (NSString)creatorTwitterUsername;
- (NSString)itemType;
- (NSString)selectedText;
- (NSString)siteName;
- (NSString)summary;
- (NSString)title;
- (NSString)twitterCard;
- (NSURL)URL;
- (NSURL)originalURL;
- (NSURL)relatedURL;
- (NSURL)remoteVideoURL;
- (_BlastDoorLPARAsset)arAsset;
- (_BlastDoorLPARAssetMetadata)arAssetMetadata;
- (_BlastDoorLPAssociatedApplicationMetadata)associatedApplication;
- (_BlastDoorLPAudio)audio;
- (_BlastDoorLPAudioMetadata)audioMetadata;
- (_BlastDoorLPIconMetadata)iconMetadata;
- (_BlastDoorLPImage)icon;
- (_BlastDoorLPImage)image;
- (_BlastDoorLPImageMetadata)imageMetadata;
- (_BlastDoorLPLinkMetadata)init;
- (_BlastDoorLPLinkMetadata)initWithCoder:(id)a3;
- (_BlastDoorLPPlatformColor)themeColor;
- (_BlastDoorLPSpecializationMetadata)specialization;
- (_BlastDoorLPVideo)video;
- (_BlastDoorLPVideoMetadata)videoMetadata;
- (_SWCollaborationMetadata)collaborationMetadata;
- (id)_initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (unint64_t)_encodedSize;
- (unint64_t)hash;
- (unsigned)version;
- (void)_copyPropertiesFrom:(id)a3 onlyUpgradeFields:(BOOL)a4;
- (void)_copyPropertiesOnlyUpgradingFieldsFrom:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateImages:(id)a3;
- (void)setAppleContentID:(id)a3;
- (void)setAppleSummary:(id)a3;
- (void)setArAsset:(id)a3;
- (void)setArAssetMetadata:(id)a3;
- (void)setArAssets:(id)a3;
- (void)setAssociatedApplication:(id)a3;
- (void)setAudio:(id)a3;
- (void)setAudioMetadata:(id)a3;
- (void)setAudios:(id)a3;
- (void)setAvailableContentImages:(id)a3;
- (void)setCollaborationMetadata:(id)a3;
- (void)setContentImages:(id)a3;
- (void)setContentImagesMetadata:(id)a3;
- (void)setCreator:(id)a3;
- (void)setCreatorFacebookProfile:(id)a3;
- (void)setCreatorTwitterUsername:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconMetadata:(id)a3;
- (void)setIconProvider:(id)a3;
- (void)setIcons:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageMetadata:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setImages:(id)a3;
- (void)setItemType:(id)a3;
- (void)setOriginalURL:(id)a3;
- (void)setRelatedURL:(id)a3;
- (void)setRemoteVideoURL:(id)a3;
- (void)setSelectedText:(id)a3;
- (void)setSiteName:(id)a3;
- (void)setSpecialization:(id)a3;
- (void)setStreamingVideos:(id)a3;
- (void)setSummary:(id)a3;
- (void)setThemeColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTwitterCard:(id)a3;
- (void)setURL:(id)a3;
- (void)setUsesActivityPub:(BOOL)a3;
- (void)setVideo:(id)a3;
- (void)setVideoMetadata:(id)a3;
- (void)setVideoProvider:(id)a3;
- (void)setVideos:(id)a3;
@end

@implementation _BlastDoorLPLinkMetadata

- (_BlastDoorLPLinkMetadata)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorLPLinkMetadata;
  v2 = [(_BlastDoorLPLinkMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = v2;
  }

  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_BlastDoorLPLinkMetadata *)self init];
  if (v5)
  {
    uint64_t v6 = URLForKey(v4, @"LPMetadataURL");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    uint64_t v8 = stringForKey(v4, @"LPMetadataTitle");
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = stringForKey(v4, @"LPMetadataDescription");
    summary = v5->_summary;
    v5->_summary = (NSString *)v10;

    uint64_t v12 = stringForKey(v4, @"LPMetadataSelectedText");
    selectedText = v5->_selectedText;
    v5->_selectedText = (NSString *)v12;

    uint64_t v14 = stringForKey(v4, @"LPMetadataSiteName");
    siteName = v5->_siteName;
    v5->_siteName = (NSString *)v14;

    uint64_t v16 = stringForKey(v4, @"LPMetadataItemType");
    itemType = v5->_itemType;
    v5->_itemType = (NSString *)v16;

    uint64_t v18 = URLForKey(v4, @"LPMetadataRelatedURL");
    relatedURL = v5->_relatedURL;
    v5->_relatedURL = (NSURL *)v18;

    uint64_t v20 = stringForKey(v4, @"LPMetadataCreator");
    creator = v5->_creator;
    v5->_creator = (NSString *)v20;

    uint64_t v22 = stringForKey(v4, @"LPMetadataCreatorFacebookProfile");
    creatorFacebookProfile = v5->_creatorFacebookProfile;
    v5->_creatorFacebookProfile = (NSString *)v22;

    uint64_t v24 = stringForKey(v4, @"LPMetadataCreatorTwitterUsername");
    creatorTwitterUsername = v5->_creatorTwitterUsername;
    v5->_creatorTwitterUsername = (NSString *)v24;

    uint64_t v26 = stringForKey(v4, @"LPMetadataTwitterCard");
    twitterCard = v5->_twitterCard;
    v5->_twitterCard = (NSString *)v26;

    v28 = numberForKey(v4, @"LPMetadataUsesActivityPub");
    v5->_usesActivityPub = [v28 BOOLValue];

    uint64_t v29 = stringForKey(v4, @"LPMetadataAppleContentID");
    appleContentID = v5->_appleContentID;
    v5->_appleContentID = (NSString *)v29;

    uint64_t v31 = stringForKey(v4, @"LPMetadataAppleDescription");
    appleSummary = v5->_appleSummary;
    v5->_appleSummary = (NSString *)v31;

    id v33 = v4;
    v34 = [v33 objectForKey:@"LPMetadataIcons"];
    if (v34)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        -[_BlastDoorLPLinkMetadata _initWithDictionary:]();
      }
    }
    objc_opt_class();
    p_isa = (id *)&v5->super.isa;
    id v100 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v34 count])
    {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v138 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v36 = v34;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v138 objects:v137 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v139;
        while (2)
        {
          id v40 = v33;
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v139 != v39) {
              objc_enumerationMutation(v36);
            }
            v42 = *(void **)(*((void *)&v138 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              -[_BlastDoorLPLinkMetadata _initWithDictionary:]();
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              id v44 = 0;
              id v33 = v40;
              goto LABEL_18;
            }
            v43 = truncatedStringAtMaximumMetadataLength(v42);
            [v35 addObject:v43];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v138 objects:v137 count:16];
          id v33 = v40;
          if (v38) {
            continue;
          }
          break;
        }
      }

      id v44 = v35;
LABEL_18:
    }
    else
    {
      id v44 = 0;
    }

    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    obuint64_t j = v44;
    uint64_t v46 = [obj countByEnumeratingWithState:&v133 objects:v132 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v134;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v134 != v48) {
            objc_enumerationMutation(obj);
          }
          v50 = URLFromStringIfHTTPFamily(*(void *)(*((void *)&v133 + 1) + 8 * j));
          if (v50)
          {
            id v51 = [[_BlastDoorLPIconMetadata alloc] _initWithURL:v50];
            if (v51) {
              [v45 addObject:v51];
            }
          }
        }
        uint64_t v47 = [obj countByEnumeratingWithState:&v133 objects:v132 count:16];
      }
      while (v47);
    }

    objc_storeStrong((id *)&v5->_icons, v45);
    v52 = arrayOfDictionariesForKey(v33, @"LPMetadataARAssets");
    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v104 = v52;
    uint64_t v54 = [v104 countByEnumeratingWithState:&v128 objects:v127 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v129;
      do
      {
        for (uint64_t k = 0; k != v55; ++k)
        {
          if (*(void *)v129 != v56) {
            objc_enumerationMutation(v104);
          }
          id v58 = [[_BlastDoorLPARAssetMetadata alloc] _initWithDictionary:*(void *)(*((void *)&v128 + 1) + 8 * k)];
          if (v58) {
            [v53 addObject:v58];
          }
        }
        uint64_t v55 = [v104 countByEnumeratingWithState:&v128 objects:v127 count:16];
      }
      while (v55);
    }

    objc_storeStrong((id *)&v5->_arAssets, v53);
    v59 = arrayOfDictionariesForKey(v33, @"LPMetadataImages");
    id v106 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v103 = v59;
    uint64_t v60 = [v103 countByEnumeratingWithState:&v123 objects:v122 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v124;
      do
      {
        for (uint64_t m = 0; m != v61; ++m)
        {
          if (*(void *)v124 != v62) {
            objc_enumerationMutation(v103);
          }
          id v64 = [[_BlastDoorLPImageMetadata alloc] _initWithDictionary:*(void *)(*((void *)&v123 + 1) + 8 * m)];
          if (v64) {
            [v106 addObject:v64];
          }
        }
        uint64_t v61 = [v103 countByEnumeratingWithState:&v123 objects:v122 count:16];
      }
      while (v61);
    }
    v98 = v53;
    v99 = v45;

    objc_storeStrong((id *)&v5->_images, v106);
    v65 = arrayOfDictionariesForKey(v33, @"LPMetadataVideos");
    id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v67 = v65;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v118 objects:v117 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v119;
      do
      {
        for (uint64_t n = 0; n != v69; ++n)
        {
          if (*(void *)v119 != v70) {
            objc_enumerationMutation(v67);
          }
          id v72 = [[_BlastDoorLPVideoMetadata alloc] _initWithDictionary:*(void *)(*((void *)&v118 + 1) + 8 * n)];
          if (v72) {
            [v66 addObject:v72];
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v118 objects:v117 count:16];
      }
      while (v69);
    }

    objc_storeStrong((id *)&v5->_videos, v66);
    v101 = v33;
    v73 = arrayOfDictionariesForKey(v33, @"LPMetadataStreamingVideos");
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v75 = v73;
    uint64_t v76 = [v75 countByEnumeratingWithState:&v113 objects:v112 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v114;
      do
      {
        for (iuint64_t i = 0; ii != v77; ++ii)
        {
          if (*(void *)v114 != v78) {
            objc_enumerationMutation(v75);
          }
          id v80 = [[_BlastDoorLPVideoMetadata alloc] _initWithDictionary:*(void *)(*((void *)&v113 + 1) + 8 * ii)];
          if (v80) {
            [v74 addObject:v80];
          }
        }
        uint64_t v77 = [v75 countByEnumeratingWithState:&v113 objects:v112 count:16];
      }
      while (v77);
    }
    v97 = v67;

    objc_storeStrong(p_isa + 39, v74);
    v81 = arrayOfDictionariesForKey(v101, @"LPMetadataAudios");
    id v82 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v83 = v81;
    uint64_t v84 = [v83 countByEnumeratingWithState:&v108 objects:v107 count:16];
    if (v84)
    {
      uint64_t v85 = v84;
      uint64_t v86 = *(void *)v109;
      do
      {
        for (juint64_t j = 0; jj != v85; ++jj)
        {
          if (*(void *)v109 != v86) {
            objc_enumerationMutation(v83);
          }
          id v88 = -[_BlastDoorLPAudioMetadata _initWithDictionary:]([_BlastDoorLPAudioMetadata alloc], "_initWithDictionary:", *(void *)(*((void *)&v108 + 1) + 8 * jj), v97, v98, v99);
          if (v88) {
            [v82 addObject:v88];
          }
        }
        uint64_t v85 = [v83 countByEnumeratingWithState:&v108 objects:v107 count:16];
      }
      while (v85);
    }

    v5 = (_BlastDoorLPLinkMetadata *)p_isa;
    objc_storeStrong(p_isa + 40, v82);
    id v89 = v101;
    v90 = [v89 objectForKey:@"LPMetadataAssociatedApplication"];
    if (v90)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        -[_BlastDoorLPLinkMetadata _initWithDictionary:]();
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v100;
      if ([v90 count]) {
        id v91 = v90;
      }
      else {
        id v91 = 0;
      }
    }
    else
    {
      id v91 = 0;
      id v4 = v100;
    }

    if (v91)
    {
      v92 = objc_alloc_init(_BlastDoorLPAssociatedApplicationMetadata);
      id v93 = p_isa[41];
      p_isa[41] = v92;

      v94 = stringForKey(v91, @"app-clip-bundle-id");
      [p_isa[41] setBundleIdentifier:v94];
    }
    v95 = p_isa;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPLinkMetadata)initWithCoder:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v92.receiver = self;
  v92.super_class = (Class)_BlastDoorLPLinkMetadata;
  v5 = [(_BlastDoorLPLinkMetadata *)&v92 init];
  if (!v5) {
    goto LABEL_3;
  }
  v5->_versiouint64_t n = [v4 decodeInt32ForKey:@"version"];
  uint64_t v6 = decodeURLForKey(v4, @"originalURL");
  originalURL = v5->_originalURL;
  v5->_originalURL = (NSURL *)v6;

  uint64_t v8 = decodeURLForKey(v4, @"URL");
  URL = v5->_URL;
  v5->_URL = (NSURL *)v8;

  uint64_t v10 = decodeStringForKey(v4, @"title");
  title = v5->_title;
  v5->_title = (NSString *)v10;

  uint64_t v12 = decodeStringForKey(v4, @"summary");
  summary = v5->_summary;
  v5->_summary = (NSString *)v12;

  uint64_t v14 = decodeStringForKey(v4, @"selection");
  selectedText = v5->_selectedText;
  v5->_selectedText = (NSString *)v14;

  uint64_t v16 = decodeStringForKey(v4, @"siteName");
  siteName = v5->_siteName;
  v5->_siteName = (NSString *)v16;

  uint64_t v18 = decodeStringForKey(v4, @"itemType");
  itemType = v5->_itemType;
  v5->_itemType = (NSString *)v18;

  uint64_t v20 = decodeURLForKey(v4, @"relatedURL");
  relatedURL = v5->_relatedURL;
  v5->_relatedURL = (NSURL *)v20;

  uint64_t v22 = decodeStringForKey(v4, @"creator");
  creator = v5->_creator;
  v5->_creator = (NSString *)v22;

  uint64_t v24 = decodeStringForKey(v4, @"creatorFacebookProfile");
  creatorFacebookProfile = v5->_creatorFacebookProfile;
  v5->_creatorFacebookProfile = (NSString *)v24;

  uint64_t v26 = decodeStringForKey(v4, @"creatorTwitterUsername");
  creatorTwitterUsername = v5->_creatorTwitterUsername;
  v5->_creatorTwitterUsername = (NSString *)v26;

  uint64_t v28 = decodeStringForKey(v4, @"twitterCard");
  twitterCard = v5->_twitterCard;
  v5->_twitterCard = (NSString *)v28;

  v5->_usesActivityPub = [v4 decodeBoolForKey:@"usesActivityPub"];
  uint64_t v30 = decodeStringForKey(v4, @"appleContentID");
  appleContentID = v5->_appleContentID;
  v5->_appleContentID = (NSString *)v30;

  uint64_t v32 = decodeStringForKey(v4, @"appleSummary");
  appleSummary = v5->_appleSummary;
  v5->_appleSummary = (NSString *)v32;

  uint64_t v34 = objc_msgSend(v4, "_bd_lp_strictlyDecodeColorForKey:", @"themeColor");
  themeColor = v5->_themeColor;
  v5->_themeColor = (_BlastDoorLPPlatformColor *)v34;

  id v36 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
  [(_BlastDoorLPLinkMetadata *)v5 setIcon:v36];

  uint64_t v37 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"iconMetadata");
  iconMetadata = v5->_iconMetadata;
  v5->_iconMetadata = (_BlastDoorLPIconMetadata *)v37;

  uint64_t v39 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"image");
  [(_BlastDoorLPLinkMetadata *)v5 setImage:v39];

  id v40 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfLPImagesForKey:", @"alternateImages");
  [(_BlastDoorLPLinkMetadata *)v5 setAlternateImages:v40];

  uint64_t v41 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"imageMetadata");
  imageMetadata = v5->_imageMetadata;
  v5->_imageMetadata = (_BlastDoorLPImageMetadata *)v41;

  v43 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfLPImagesForKey:", @"contentImages");
  [(_BlastDoorLPLinkMetadata *)v5 setContentImages:v43];

  uint64_t v44 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"contentImagesMetadata");
  contentImagesMetadata = v5->_contentImagesMetadata;
  v5->_contentImagesMetadata = (NSArray *)v44;

  uint64_t v46 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPVideoForKey:", @"video");
  [(_BlastDoorLPLinkMetadata *)v5 setVideo:v46];

  uint64_t v47 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"videoMetadata");
  videoMetadata = v5->_videoMetadata;
  v5->_videoMetadata = (_BlastDoorLPVideoMetadata *)v47;

  v49 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"audio");
  [(_BlastDoorLPLinkMetadata *)v5 setAudio:v49];

  uint64_t v50 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"audioMetadata");
  audioMetadata = v5->_audioMetadata;
  v5->_audioMetadata = (_BlastDoorLPAudioMetadata *)v50;

  v52 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPARAssetForKey:", @"arAsset");
  [(_BlastDoorLPLinkMetadata *)v5 setArAsset:v52];

  uint64_t v53 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"arAssetMetadata");
  arAssetMetadata = v5->_arAssetMetadata;
  v5->_arAssetMetadata = (_BlastDoorLPARAssetMetadata *)v53;

  uint64_t v55 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"icons");
  icons = v5->_icons;
  v5->_icons = (NSArray *)v55;

  uint64_t v57 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"images");
  images = v5->_images;
  v5->_images = (NSArray *)v57;

  uint64_t v59 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"availableContentImages");
  availableContentImages = v5->_availableContentImages;
  v5->_availableContentImages = (NSArray *)v59;

  uint64_t v61 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"videos");
  videos = v5->_videos;
  v5->_videos = (NSArray *)v61;

  uint64_t v63 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"streamingVideos");
  streamingVideos = v5->_streamingVideos;
  v5->_streamingVideos = (NSArray *)v63;

  uint64_t v65 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"audios");
  audios = v5->_audios;
  v5->_audios = (NSArray *)v65;

  uint64_t v67 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"arAssets");
  arAssets = v5->_arAssets;
  v5->_arAssets = (NSArray *)v67;

  uint64_t v69 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"associatedApplication");
  associatedApplicatiouint64_t n = v5->_associatedApplication;
  v5->_associatedApplicatiouint64_t n = (_BlastDoorLPAssociatedApplicationMetadata *)v69;

  v71 = [v4 error];

  if (!v71)
  {
    if ([v4 containsValueForKey:@"collaborationMetadata"])
    {
      v73 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v98 = 0;
      v99 = &v98;
      uint64_t v100 = 0x2050000000;
      id v74 = (void *)get_SWCollaborationMetadataClass_softClass;
      uint64_t v101 = get_SWCollaborationMetadataClass_softClass;
      if (!get_SWCollaborationMetadataClass_softClass)
      {
        uint64_t v93 = MEMORY[0x1E4F143A8];
        uint64_t v94 = 3221225472;
        v95 = __get_SWCollaborationMetadataClass_block_invoke;
        v96 = &unk_1E5FF6880;
        v97 = &v98;
        __get_SWCollaborationMetadataClass_block_invoke((uint64_t)&v93);
        id v74 = (void *)v99[3];
      }
      id v75 = v74;
      _Block_object_dispose(&v98, 8);
      uint64_t v98 = 0;
      v99 = &v98;
      uint64_t v100 = 0x2050000000;
      uint64_t v76 = (void *)get_SWMutableCollaborationMetadataClass_softClass;
      uint64_t v101 = get_SWMutableCollaborationMetadataClass_softClass;
      if (!get_SWMutableCollaborationMetadataClass_softClass)
      {
        uint64_t v93 = MEMORY[0x1E4F143A8];
        uint64_t v94 = 3221225472;
        v95 = __get_SWMutableCollaborationMetadataClass_block_invoke;
        v96 = &unk_1E5FF6880;
        v97 = &v98;
        __get_SWMutableCollaborationMetadataClass_block_invoke((uint64_t)&v93);
        uint64_t v76 = (void *)v99[3];
      }
      id v77 = v76;
      _Block_object_dispose(&v98, 8);
      uint64_t v78 = objc_msgSend(v73, "setWithObjects:", v75, v77, 0);
      uint64_t v79 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v78, @"collaborationMetadata");
      collaborationMetadata = v5->_collaborationMetadata;
      v5->_collaborationMetadata = (_SWCollaborationMetadata *)v79;
    }
    if ([v4 containsValueForKey:@"specialization2"])
    {
      v81 = allKnownSpecializationClasses();
      id v91 = 0;
      uint64_t v82 = objc_msgSend(v4, "_bd_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v81, @"specialization2", &v91);
      id v83 = v91;
      specializatiouint64_t n = v5->_specialization;
      v5->_specializatiouint64_t n = (_BlastDoorLPSpecializationMetadata *)v82;
    }
    if (!v5->_specialization && [v4 containsValueForKey:@"specialization"])
    {
      uint64_t v85 = allKnownSpecializationClasses();
      id v90 = 0;
      uint64_t v86 = objc_msgSend(v4, "_bd_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v85, @"specialization", &v90);
      id v87 = v90;
      id v88 = v5->_specialization;
      v5->_specializatiouint64_t n = (_BlastDoorLPSpecializationMetadata *)v86;
    }
    id v72 = v5;
  }
  else
  {
LABEL_3:
    id v72 = 0;
  }

  return v72;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPLinkMetadata allocWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [(_BlastDoorLPLinkMetadata *)v4 _copyPropertiesFrom:self onlyUpgradeFields:0];
    uint64_t v6 = v5;
  }

  return v5;
}

- (void)_copyPropertiesOnlyUpgradingFieldsFrom:(id)a3
{
  id v181 = a3;
  self->_versiouint64_t n = [v181 version];
  uint64_t v4 = [(_BlastDoorLPLinkMetadata *)self originalURL];
  if (!v4
    || (v5 = (void *)v4,
        [v181 originalURL],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    uint64_t v7 = [v181 originalURL];
    [(_BlastDoorLPLinkMetadata *)self setOriginalURL:v7];
  }
  uint64_t v8 = [(_BlastDoorLPLinkMetadata *)self URL];
  if (!v8
    || (v9 = (void *)v8,
        [v181 URL],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v11 = [v181 URL];
    [(_BlastDoorLPLinkMetadata *)self setURL:v11];
  }
  uint64_t v12 = [(_BlastDoorLPLinkMetadata *)self title];
  if (!v12
    || (v13 = (void *)v12,
        [v181 title],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    v15 = [v181 title];
    uint64_t v16 = (void *)[v15 copy];
    [(_BlastDoorLPLinkMetadata *)self setTitle:v16];
  }
  uint64_t v17 = [(_BlastDoorLPLinkMetadata *)self summary];
  if (!v17
    || (uint64_t v18 = (void *)v17,
        [v181 summary],
        v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v19))
  {
    uint64_t v20 = [v181 summary];
    v21 = (void *)[v20 copy];
    [(_BlastDoorLPLinkMetadata *)self setSummary:v21];
  }
  uint64_t v22 = [(_BlastDoorLPLinkMetadata *)self selectedText];
  if (!v22
    || (v23 = (void *)v22,
        [v181 selectedText],
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        v24,
        v23,
        v24))
  {
    v25 = [v181 selectedText];
    uint64_t v26 = (void *)[v25 copy];
    [(_BlastDoorLPLinkMetadata *)self setSelectedText:v26];
  }
  uint64_t v27 = [(_BlastDoorLPLinkMetadata *)self siteName];
  if (!v27
    || (uint64_t v28 = (void *)v27,
        [v181 siteName],
        uint64_t v29 = objc_claimAutoreleasedReturnValue(),
        v29,
        v28,
        v29))
  {
    uint64_t v30 = [v181 siteName];
    uint64_t v31 = (void *)[v30 copy];
    [(_BlastDoorLPLinkMetadata *)self setSiteName:v31];
  }
  uint64_t v32 = [(_BlastDoorLPLinkMetadata *)self itemType];
  if (!v32
    || (id v33 = (void *)v32,
        [v181 itemType],
        uint64_t v34 = objc_claimAutoreleasedReturnValue(),
        v34,
        v33,
        v34))
  {
    id v35 = [v181 itemType];
    id v36 = (void *)[v35 copy];
    [(_BlastDoorLPLinkMetadata *)self setItemType:v36];
  }
  uint64_t v37 = [(_BlastDoorLPLinkMetadata *)self relatedURL];
  if (!v37
    || (uint64_t v38 = (void *)v37,
        [v181 relatedURL],
        uint64_t v39 = objc_claimAutoreleasedReturnValue(),
        v39,
        v38,
        v39))
  {
    id v40 = [v181 relatedURL];
    [(_BlastDoorLPLinkMetadata *)self setRelatedURL:v40];
  }
  uint64_t v41 = [(_BlastDoorLPLinkMetadata *)self creator];
  if (!v41
    || (v42 = (void *)v41,
        [v181 creator],
        v43 = objc_claimAutoreleasedReturnValue(),
        v43,
        v42,
        v43))
  {
    uint64_t v44 = [v181 creator];
    id v45 = (void *)[v44 copy];
    [(_BlastDoorLPLinkMetadata *)self setCreator:v45];
  }
  uint64_t v46 = [(_BlastDoorLPLinkMetadata *)self creatorFacebookProfile];
  if (!v46
    || (uint64_t v47 = (void *)v46,
        [v181 creatorFacebookProfile],
        uint64_t v48 = objc_claimAutoreleasedReturnValue(),
        v48,
        v47,
        v48))
  {
    v49 = [v181 creatorFacebookProfile];
    uint64_t v50 = (void *)[v49 copy];
    [(_BlastDoorLPLinkMetadata *)self setCreatorFacebookProfile:v50];
  }
  uint64_t v51 = [(_BlastDoorLPLinkMetadata *)self creatorTwitterUsername];
  if (!v51
    || (v52 = (void *)v51,
        [v181 creatorTwitterUsername],
        uint64_t v53 = objc_claimAutoreleasedReturnValue(),
        v53,
        v52,
        v53))
  {
    uint64_t v54 = [v181 creatorTwitterUsername];
    uint64_t v55 = (void *)[v54 copy];
    [(_BlastDoorLPLinkMetadata *)self setCreatorTwitterUsername:v55];
  }
  uint64_t v56 = [(_BlastDoorLPLinkMetadata *)self twitterCard];
  if (!v56
    || (uint64_t v57 = (void *)v56,
        [v181 twitterCard],
        id v58 = objc_claimAutoreleasedReturnValue(),
        v58,
        v57,
        v58))
  {
    uint64_t v59 = [v181 twitterCard];
    uint64_t v60 = (void *)[v59 copy];
    [(_BlastDoorLPLinkMetadata *)self setTwitterCard:v60];
  }
  if ([(_BlastDoorLPLinkMetadata *)self usesActivityPub]) {
    uint64_t v61 = 1;
  }
  else {
    uint64_t v61 = [v181 usesActivityPub];
  }
  [(_BlastDoorLPLinkMetadata *)self setUsesActivityPub:v61];
  uint64_t v62 = [(_BlastDoorLPLinkMetadata *)self appleContentID];
  if (!v62
    || (uint64_t v63 = (void *)v62,
        [v181 appleContentID],
        id v64 = objc_claimAutoreleasedReturnValue(),
        v64,
        v63,
        v64))
  {
    uint64_t v65 = [v181 appleContentID];
    id v66 = (void *)[v65 copy];
    [(_BlastDoorLPLinkMetadata *)self setAppleContentID:v66];
  }
  uint64_t v67 = [(_BlastDoorLPLinkMetadata *)self appleSummary];
  if (!v67
    || (uint64_t v68 = (void *)v67,
        [v181 appleSummary],
        uint64_t v69 = objc_claimAutoreleasedReturnValue(),
        v69,
        v68,
        v69))
  {
    uint64_t v70 = [v181 appleSummary];
    v71 = (void *)[v70 copy];
    [(_BlastDoorLPLinkMetadata *)self setAppleSummary:v71];
  }
  uint64_t v72 = [(_BlastDoorLPLinkMetadata *)self themeColor];
  if (!v72
    || (v73 = (void *)v72,
        [v181 themeColor],
        id v74 = objc_claimAutoreleasedReturnValue(),
        v74,
        v73,
        v74))
  {
    id v75 = [v181 themeColor];
    uint64_t v76 = (void *)[v75 copy];
    [(_BlastDoorLPLinkMetadata *)self setThemeColor:v76];
  }
  uint64_t v77 = [(_BlastDoorLPLinkMetadata *)self icon];
  if (!v77
    || (uint64_t v78 = (void *)v77,
        [v181 icon],
        uint64_t v79 = objc_claimAutoreleasedReturnValue(),
        v79,
        v78,
        v79))
  {
    id v80 = [v181 icon];
    [(_BlastDoorLPLinkMetadata *)self setIcon:v80];
  }
  uint64_t v81 = [(_BlastDoorLPLinkMetadata *)self iconMetadata];
  if (!v81
    || (uint64_t v82 = (void *)v81,
        [v181 iconMetadata],
        id v83 = objc_claimAutoreleasedReturnValue(),
        v83,
        v82,
        v83))
  {
    uint64_t v84 = [v181 iconMetadata];
    [(_BlastDoorLPLinkMetadata *)self setIconMetadata:v84];
  }
  uint64_t v85 = [(_BlastDoorLPLinkMetadata *)self arAsset];
  if (!v85
    || (uint64_t v86 = (void *)v85,
        [v181 arAsset],
        id v87 = objc_claimAutoreleasedReturnValue(),
        v87,
        v86,
        v87))
  {
    id v88 = [v181 arAsset];
    [(_BlastDoorLPLinkMetadata *)self setArAsset:v88];
  }
  uint64_t v89 = [(_BlastDoorLPLinkMetadata *)self arAssetMetadata];
  if (!v89
    || (id v90 = (void *)v89,
        [v181 arAssetMetadata],
        id v91 = objc_claimAutoreleasedReturnValue(),
        v91,
        v90,
        v91))
  {
    objc_super v92 = [v181 arAssetMetadata];
    [(_BlastDoorLPLinkMetadata *)self setArAssetMetadata:v92];
  }
  uint64_t v93 = [(_BlastDoorLPLinkMetadata *)self arAsset];
  if (!v93
    || (uint64_t v94 = (void *)v93,
        [v181 arAsset],
        v95 = objc_claimAutoreleasedReturnValue(),
        v95,
        v94,
        v95))
  {
    v96 = [v181 image];
    [(_BlastDoorLPLinkMetadata *)self setImage:v96];
  }
  uint64_t v97 = [(_BlastDoorLPLinkMetadata *)self imageMetadata];
  if (!v97
    || (uint64_t v98 = (void *)v97,
        [v181 imageMetadata],
        v99 = objc_claimAutoreleasedReturnValue(),
        v99,
        v98,
        v99))
  {
    uint64_t v100 = [v181 imageMetadata];
    [(_BlastDoorLPLinkMetadata *)self setImageMetadata:v100];
  }
  uint64_t v101 = [(_BlastDoorLPLinkMetadata *)self contentImages];
  if (!v101
    || (uint64_t v102 = (void *)v101,
        [v181 contentImages],
        id v103 = objc_claimAutoreleasedReturnValue(),
        v103,
        v102,
        v103))
  {
    id v104 = [v181 contentImages];
    [(_BlastDoorLPLinkMetadata *)self setContentImages:v104];
  }
  uint64_t v105 = [(_BlastDoorLPLinkMetadata *)self contentImagesMetadata];
  if (!v105
    || (id v106 = (void *)v105,
        [v181 contentImagesMetadata],
        v107 = objc_claimAutoreleasedReturnValue(),
        v107,
        v106,
        v107))
  {
    long long v108 = [v181 contentImagesMetadata];
    [(_BlastDoorLPLinkMetadata *)self setContentImagesMetadata:v108];
  }
  uint64_t v109 = [(_BlastDoorLPLinkMetadata *)self video];
  if (!v109
    || (long long v110 = (void *)v109,
        [v181 video],
        long long v111 = objc_claimAutoreleasedReturnValue(),
        v111,
        v110,
        v111))
  {
    v112 = [v181 video];
    [(_BlastDoorLPLinkMetadata *)self setVideo:v112];
  }
  uint64_t v113 = [(_BlastDoorLPLinkMetadata *)self videoMetadata];
  if (!v113
    || (long long v114 = (void *)v113,
        [v181 videoMetadata],
        long long v115 = objc_claimAutoreleasedReturnValue(),
        v115,
        v114,
        v115))
  {
    long long v116 = [v181 videoMetadata];
    [(_BlastDoorLPLinkMetadata *)self setVideoMetadata:v116];
  }
  uint64_t v117 = [(_BlastDoorLPLinkMetadata *)self audio];
  if (!v117
    || (long long v118 = (void *)v117,
        [v181 audio],
        long long v119 = objc_claimAutoreleasedReturnValue(),
        v119,
        v118,
        v119))
  {
    long long v120 = [v181 audio];
    [(_BlastDoorLPLinkMetadata *)self setAudio:v120];
  }
  uint64_t v121 = [(_BlastDoorLPLinkMetadata *)self audioMetadata];
  if (!v121
    || (v122 = (void *)v121,
        [v181 audioMetadata],
        long long v123 = objc_claimAutoreleasedReturnValue(),
        v123,
        v122,
        v123))
  {
    long long v124 = [v181 audioMetadata];
    [(_BlastDoorLPLinkMetadata *)self setAudioMetadata:v124];
  }
  uint64_t v125 = [(_BlastDoorLPLinkMetadata *)self icons];
  if (!v125
    || (long long v126 = (void *)v125,
        [v181 icons],
        v127 = objc_claimAutoreleasedReturnValue(),
        v127,
        v126,
        v127))
  {
    long long v128 = [v181 icons];
    long long v129 = (void *)[v128 copy];
    [(_BlastDoorLPLinkMetadata *)self setIcons:v129];
  }
  uint64_t v130 = [(_BlastDoorLPLinkMetadata *)self arAssets];
  if (!v130
    || (long long v131 = (void *)v130,
        [v181 arAssets],
        v132 = objc_claimAutoreleasedReturnValue(),
        v132,
        v131,
        v132))
  {
    long long v133 = [v181 arAssets];
    long long v134 = (void *)[v133 copy];
    [(_BlastDoorLPLinkMetadata *)self setArAssets:v134];
  }
  uint64_t v135 = [(_BlastDoorLPLinkMetadata *)self images];
  if (!v135
    || (long long v136 = (void *)v135,
        [v181 images],
        v137 = objc_claimAutoreleasedReturnValue(),
        v137,
        v136,
        v137))
  {
    long long v138 = [v181 images];
    long long v139 = (void *)[v138 copy];
    [(_BlastDoorLPLinkMetadata *)self setImages:v139];
  }
  uint64_t v140 = [(_BlastDoorLPLinkMetadata *)self alternateImages];
  if (!v140
    || (long long v141 = (void *)v140,
        [v181 alternateImages],
        uint64_t v142 = objc_claimAutoreleasedReturnValue(),
        v142,
        v141,
        v142))
  {
    v143 = [v181 alternateImages];
    v144 = (void *)[v143 copy];
    [(_BlastDoorLPLinkMetadata *)self setAlternateImages:v144];
  }
  uint64_t v145 = [(_BlastDoorLPLinkMetadata *)self availableContentImages];
  if (!v145
    || (v146 = (void *)v145,
        [v181 availableContentImages],
        v147 = objc_claimAutoreleasedReturnValue(),
        v147,
        v146,
        v147))
  {
    v148 = [v181 availableContentImages];
    v149 = (void *)[v148 copy];
    [(_BlastDoorLPLinkMetadata *)self setAvailableContentImages:v149];
  }
  uint64_t v150 = [(_BlastDoorLPLinkMetadata *)self videos];
  if (!v150
    || (v151 = (void *)v150,
        [v181 videos],
        v152 = objc_claimAutoreleasedReturnValue(),
        v152,
        v151,
        v152))
  {
    v153 = [v181 videos];
    v154 = (void *)[v153 copy];
    [(_BlastDoorLPLinkMetadata *)self setVideos:v154];
  }
  uint64_t v155 = [(_BlastDoorLPLinkMetadata *)self streamingVideos];
  if (!v155
    || (v156 = (void *)v155,
        [v181 streamingVideos],
        v157 = objc_claimAutoreleasedReturnValue(),
        v157,
        v156,
        v157))
  {
    v158 = [v181 streamingVideos];
    v159 = (void *)[v158 copy];
    [(_BlastDoorLPLinkMetadata *)self setStreamingVideos:v159];
  }
  uint64_t v160 = [(_BlastDoorLPLinkMetadata *)self audios];
  if (!v160
    || (v161 = (void *)v160,
        [v181 audios],
        v162 = objc_claimAutoreleasedReturnValue(),
        v162,
        v161,
        v162))
  {
    v163 = [v181 audios];
    v164 = (void *)[v163 copy];
    [(_BlastDoorLPLinkMetadata *)self setAudios:v164];
  }
  uint64_t v165 = [(_BlastDoorLPLinkMetadata *)self associatedApplication];
  if (!v165
    || (v166 = (void *)v165,
        [v181 associatedApplication],
        v167 = objc_claimAutoreleasedReturnValue(),
        v167,
        v166,
        v167))
  {
    v168 = [v181 associatedApplication];
    v169 = (void *)[v168 copy];
    [(_BlastDoorLPLinkMetadata *)self setAssociatedApplication:v169];
  }
  uint64_t v170 = [(_BlastDoorLPLinkMetadata *)self collaborationMetadata];
  if (!v170
    || (v171 = (void *)v170,
        [v181 collaborationMetadata],
        v172 = objc_claimAutoreleasedReturnValue(),
        v172,
        v171,
        v172))
  {
    v173 = [v181 collaborationMetadata];
    v174 = (void *)[v173 copy];
    [(_BlastDoorLPLinkMetadata *)self setCollaborationMetadata:v174];
  }
  uint64_t v175 = [(_BlastDoorLPLinkMetadata *)self specialization];
  if (!v175
    || (v176 = (void *)v175,
        [v181 specialization],
        v177 = objc_claimAutoreleasedReturnValue(),
        v177,
        v176,
        v178 = v181,
        v177))
  {
    v179 = [v181 specialization];
    v180 = (void *)[v179 copy];
    [(_BlastDoorLPLinkMetadata *)self setSpecialization:v180];

    v178 = v181;
  }
}

- (void)_copyPropertiesFrom:(id)a3 onlyUpgradeFields:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v69 = v6;
  if (v4)
  {
    [(_BlastDoorLPLinkMetadata *)self _copyPropertiesOnlyUpgradingFieldsFrom:v6];
    uint64_t v7 = v69;
  }
  else
  {
    self->_versiouint64_t n = [v6 version];
    uint64_t v8 = [v69 originalURL];
    [(_BlastDoorLPLinkMetadata *)self setOriginalURL:v8];

    v9 = [v69 URL];
    [(_BlastDoorLPLinkMetadata *)self setURL:v9];

    uint64_t v10 = [v69 title];
    v11 = (void *)[v10 copy];
    [(_BlastDoorLPLinkMetadata *)self setTitle:v11];

    uint64_t v12 = [v69 summary];
    v13 = (void *)[v12 copy];
    [(_BlastDoorLPLinkMetadata *)self setSummary:v13];

    uint64_t v14 = [v69 selectedText];
    v15 = (void *)[v14 copy];
    [(_BlastDoorLPLinkMetadata *)self setSelectedText:v15];

    uint64_t v16 = [v69 siteName];
    uint64_t v17 = (void *)[v16 copy];
    [(_BlastDoorLPLinkMetadata *)self setSiteName:v17];

    uint64_t v18 = [v69 itemType];
    v19 = (void *)[v18 copy];
    [(_BlastDoorLPLinkMetadata *)self setItemType:v19];

    uint64_t v20 = [v69 relatedURL];
    [(_BlastDoorLPLinkMetadata *)self setRelatedURL:v20];

    v21 = [v69 creator];
    uint64_t v22 = (void *)[v21 copy];
    [(_BlastDoorLPLinkMetadata *)self setCreator:v22];

    v23 = [v69 creatorFacebookProfile];
    uint64_t v24 = (void *)[v23 copy];
    [(_BlastDoorLPLinkMetadata *)self setCreatorFacebookProfile:v24];

    v25 = [v69 creatorTwitterUsername];
    uint64_t v26 = (void *)[v25 copy];
    [(_BlastDoorLPLinkMetadata *)self setCreatorTwitterUsername:v26];

    uint64_t v27 = [v69 twitterCard];
    uint64_t v28 = (void *)[v27 copy];
    [(_BlastDoorLPLinkMetadata *)self setTwitterCard:v28];

    -[_BlastDoorLPLinkMetadata setUsesActivityPub:](self, "setUsesActivityPub:", [v69 usesActivityPub]);
    uint64_t v29 = [v69 appleContentID];
    uint64_t v30 = (void *)[v29 copy];
    [(_BlastDoorLPLinkMetadata *)self setAppleContentID:v30];

    uint64_t v31 = [v69 appleSummary];
    uint64_t v32 = (void *)[v31 copy];
    [(_BlastDoorLPLinkMetadata *)self setAppleSummary:v32];

    id v33 = [v69 themeColor];
    uint64_t v34 = (void *)[v33 copy];
    [(_BlastDoorLPLinkMetadata *)self setThemeColor:v34];

    id v35 = [v69 icon];
    [(_BlastDoorLPLinkMetadata *)self setIcon:v35];

    id v36 = [v69 iconMetadata];
    [(_BlastDoorLPLinkMetadata *)self setIconMetadata:v36];

    uint64_t v37 = [v69 arAsset];
    [(_BlastDoorLPLinkMetadata *)self setArAsset:v37];

    uint64_t v38 = [v69 arAssetMetadata];
    [(_BlastDoorLPLinkMetadata *)self setArAssetMetadata:v38];

    uint64_t v39 = [v69 image];
    [(_BlastDoorLPLinkMetadata *)self setImage:v39];

    id v40 = [v69 imageMetadata];
    [(_BlastDoorLPLinkMetadata *)self setImageMetadata:v40];

    uint64_t v41 = [v69 contentImages];
    [(_BlastDoorLPLinkMetadata *)self setContentImages:v41];

    v42 = [v69 contentImagesMetadata];
    [(_BlastDoorLPLinkMetadata *)self setContentImagesMetadata:v42];

    v43 = [v69 video];
    [(_BlastDoorLPLinkMetadata *)self setVideo:v43];

    uint64_t v44 = [v69 videoMetadata];
    [(_BlastDoorLPLinkMetadata *)self setVideoMetadata:v44];

    id v45 = [v69 audio];
    [(_BlastDoorLPLinkMetadata *)self setAudio:v45];

    uint64_t v46 = [v69 audioMetadata];
    [(_BlastDoorLPLinkMetadata *)self setAudioMetadata:v46];

    uint64_t v47 = [v69 icons];
    uint64_t v48 = (void *)[v47 copy];
    [(_BlastDoorLPLinkMetadata *)self setIcons:v48];

    v49 = [v69 arAssets];
    uint64_t v50 = (void *)[v49 copy];
    [(_BlastDoorLPLinkMetadata *)self setArAssets:v50];

    uint64_t v51 = [v69 images];
    v52 = (void *)[v51 copy];
    [(_BlastDoorLPLinkMetadata *)self setImages:v52];

    uint64_t v53 = [v69 alternateImages];
    uint64_t v54 = (void *)[v53 copy];
    [(_BlastDoorLPLinkMetadata *)self setAlternateImages:v54];

    uint64_t v55 = [v69 availableContentImages];
    uint64_t v56 = (void *)[v55 copy];
    [(_BlastDoorLPLinkMetadata *)self setAvailableContentImages:v56];

    uint64_t v57 = [v69 videos];
    id v58 = (void *)[v57 copy];
    [(_BlastDoorLPLinkMetadata *)self setVideos:v58];

    uint64_t v59 = [v69 streamingVideos];
    uint64_t v60 = (void *)[v59 copy];
    [(_BlastDoorLPLinkMetadata *)self setStreamingVideos:v60];

    uint64_t v61 = [v69 audios];
    uint64_t v62 = (void *)[v61 copy];
    [(_BlastDoorLPLinkMetadata *)self setAudios:v62];

    uint64_t v63 = [v69 associatedApplication];
    id v64 = (void *)[v63 copy];
    [(_BlastDoorLPLinkMetadata *)self setAssociatedApplication:v64];

    uint64_t v65 = [v69 collaborationMetadata];
    id v66 = (void *)[v65 copy];
    [(_BlastDoorLPLinkMetadata *)self setCollaborationMetadata:v66];

    uint64_t v67 = [v69 specialization];

    uint64_t v68 = (void *)[v67 copy];
    [(_BlastDoorLPLinkMetadata *)self setSpecialization:v68];

    uint64_t v7 = v67;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v17[11] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeInt32:self->_version forKey:@"version"];
  objc_msgSend(v4, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_originalURL, @"originalURL");
  objc_msgSend(v4, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, @"URL");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, @"title");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_summary, @"summary");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_selectedText, @"selection");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_siteName, @"siteName");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_itemType, @"itemType");
  objc_msgSend(v4, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_relatedURL, @"relatedURL");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_creator, @"creator");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_creatorFacebookProfile, @"creatorFacebookProfile");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_creatorTwitterUsername, @"creatorTwitterUsername");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_twitterCard, @"twitterCard");
  [v4 encodeBool:self->_usesActivityPub forKey:@"usesActivityPub"];
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_appleContentID, @"appleContentID");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_appleSummary, @"appleSummary");
  objc_msgSend(v4, "_bd_lp_encodeColorIfNotNil:forKey:", self->_themeColor, @"themeColor");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_iconMetadata, @"iconMetadata");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_arAsset, @"arAsset");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_arAssetMetadata, @"arAssetMetadata");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_image, @"image");
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_alternateImages, @"alternateImages");
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_contentImages, @"contentImages");
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_contentImagesMetadata, @"contentImagesMetadata");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_imageMetadata, @"imageMetadata");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_video, @"video");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_videoMetadata, @"videoMetadata");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_audio, @"audio");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_audioMetadata, @"audioMetadata");
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_icons, @"icons");
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_images, @"images");
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_availableContentImages, @"availableContentImages");
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_videos, @"videos");
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_streamingVideos, @"streamingVideos");
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_audios, @"audios");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_associatedApplication, @"associatedApplication");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_collaborationMetadata, @"collaborationMetadata");
  v5 = self->_specialization;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v17[6] = objc_opt_class();
  v17[7] = objc_opt_class();
  v17[8] = objc_opt_class();
  v17[9] = objc_opt_class();
  v17[10] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:11];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_opt_isKindOfClass())
        {

          v11 = @"specialization";
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v11 = @"specialization2";
LABEL_11:
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_specialization, v11);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)_BlastDoorLPLinkMetadata;
  if ([(_BlastDoorLPLinkMetadata *)&v47 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (unint64_t *)v4;
      uint64_t v7 = v6;
      if (*((_DWORD *)v6 + 3) != self->_version) {
        goto LABEL_83;
      }
      unint64_t v8 = v6[20];
      if (v8 | (unint64_t)self->_themeColor)
      {
        if (!objc_msgSend((id)v8, "isEqual:")) {
          goto LABEL_83;
        }
      }
      unint64_t v9 = v7[2];
      if (v9 | (unint64_t)self->_originalURL && !objc_msgSend((id)v9, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v10 = v7[3];
      if (v10 | (unint64_t)self->_URL && !objc_msgSend((id)v10, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v11 = v7[4];
      if (v11 | (unint64_t)self->_title && !objc_msgSend((id)v11, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v12 = v7[9];
      if (v12 | (unint64_t)self->_summary && !objc_msgSend((id)v12, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v13 = v7[10];
      if (v13 | (unint64_t)self->_selectedText && !objc_msgSend((id)v13, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v14 = v7[11];
      if (v14 | (unint64_t)self->_siteName && !objc_msgSend((id)v14, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v15 = v7[12];
      if (v15 | (unint64_t)self->_itemType && !objc_msgSend((id)v15, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v16 = v7[13];
      if (v16 | (unint64_t)self->_relatedURL && !objc_msgSend((id)v16, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v17 = v7[14];
      if (v17 | (unint64_t)self->_creator && !objc_msgSend((id)v17, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v18 = v7[15];
      if (v18 | (unint64_t)self->_creatorFacebookProfile && !objc_msgSend((id)v18, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v19 = v7[16];
      if (v19 | (unint64_t)self->_creatorTwitterUsername && !objc_msgSend((id)v19, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v20 = v7[17];
      if (v20 | (unint64_t)self->_twitterCard && !objc_msgSend((id)v20, "isEqual:")) {
        goto LABEL_83;
      }
      if (*((unsigned __int8 *)v7 + 8) != self->_usesActivityPub) {
        goto LABEL_83;
      }
      unint64_t v21 = v7[18];
      if (v21 | (unint64_t)self->_appleContentID)
      {
        if (!objc_msgSend((id)v21, "isEqual:")) {
          goto LABEL_83;
        }
      }
      unint64_t v22 = v7[19];
      if (v22 | (unint64_t)self->_appleSummary && !objc_msgSend((id)v22, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v23 = v7[23];
      if (v23 | (unint64_t)self->_icon && !objc_msgSend((id)v23, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v24 = v7[24];
      if (v24 | (unint64_t)self->_iconMetadata && !objc_msgSend((id)v24, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v25 = v7[21];
      if (v25 | (unint64_t)self->_arAsset && !objc_msgSend((id)v25, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v26 = v7[22];
      if (v26 | (unint64_t)self->_arAssetMetadata && !objc_msgSend((id)v26, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v27 = v7[25];
      if (v27 | (unint64_t)self->_image && !objc_msgSend((id)v27, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v28 = v7[29];
      if (v28 | (unint64_t)self->_imageMetadata && !objc_msgSend((id)v28, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v29 = v7[27];
      if (v29 | (unint64_t)self->_contentImages && !objc_msgSend((id)v29, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v30 = v7[28];
      if (v30 | (unint64_t)self->_contentImagesMetadata && !objc_msgSend((id)v30, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v31 = v7[30];
      if (v31 | (unint64_t)self->_video && !objc_msgSend((id)v31, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v32 = v7[31];
      if (v32 | (unint64_t)self->_videoMetadata && !objc_msgSend((id)v32, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v33 = v7[32];
      if (v33 | (unint64_t)self->_audio && !objc_msgSend((id)v33, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v34 = v7[33];
      if (v34 | (unint64_t)self->_audioMetadata && !objc_msgSend((id)v34, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v35 = v7[35];
      if (v35 | (unint64_t)self->_icons && !objc_msgSend((id)v35, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v36 = v7[34];
      if (v36 | (unint64_t)self->_arAssets && !objc_msgSend((id)v36, "isEqual:")) {
        goto LABEL_83;
      }
      unint64_t v37 = v7[36];
      if (v37 | (unint64_t)self->_images && !objc_msgSend((id)v37, "isEqual:")) {
        goto LABEL_83;
      }
      if (((unint64_t v38 = v7[26], !(v38 | (unint64_t)self->_alternateImages))
         || objc_msgSend((id)v38, "isEqual:"))
        && ((unint64_t v39 = v7[37], !(v39 | (unint64_t)self->_availableContentImages))
         || objc_msgSend((id)v39, "isEqual:"))
        && ((unint64_t v40 = v7[38], !(v40 | (unint64_t)self->_videos)) || objc_msgSend((id)v40, "isEqual:"))
        && ((unint64_t v41 = v7[39], !(v41 | (unint64_t)self->_streamingVideos))
         || objc_msgSend((id)v41, "isEqual:"))
        && ((unint64_t v42 = v7[40], !(v42 | (unint64_t)self->_audios)) || objc_msgSend((id)v42, "isEqual:"))
        && ((unint64_t v43 = v7[41], !(v43 | (unint64_t)self->_associatedApplication))
         || objc_msgSend((id)v43, "isEqual:"))
        && ((unint64_t v44 = v7[42], !(v44 | (unint64_t)self->_collaborationMetadata))
         || objc_msgSend((id)v44, "isEqual:")))
      {
        unint64_t v45 = v7[43];
        if (v45 | (unint64_t)self->_specialization) {
          char v5 = objc_msgSend((id)v45, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
      else
      {
LABEL_83:
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_originalURL hash];
  return [(NSURL *)self->_URL hash] ^ v3;
}

+ (_BlastDoorLPLinkMetadata)metadataWithDataRepresentation:(id)a3
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 length] <= 0xA00000)
  {
    char v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:0];
    [v5 _enableStrictSecureDecodingMode];
    [v5 setDecodingFailurePolicy:1];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *MEMORY[0x1E4F284E8];
    v11[0] = 0;
    unint64_t v8 = objc_msgSend(v5, "_bd_lp_strictlyDecodeTopLevelObjectOfClass:forKey:error:", v6, v7, v11);
    id v9 = v11[0];
    [v5 finishDecoding];
    if (v9) {
      id v4 = 0;
    }
    else {
      id v4 = v8;
    }
  }
  else
  {
    id v4 = 0;
  }

  return (_BlastDoorLPLinkMetadata *)v4;
}

- (id)dataRepresentation
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  id v4 = [v3 encodedData];

  return v4;
}

- (unint64_t)_encodedSize
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = self->_alternateImages;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v14 + 1) + 8 * i) _encodedSize];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  unint64_t v9 = [(_BlastDoorLPImage *)self->_icon _encodedSize];
  unint64_t v10 = [(_BlastDoorLPImage *)self->_image _encodedSize];
  unint64_t v11 = [(_BlastDoorLPVideo *)self->_video _encodedSize];
  return v9 + v6 + v10 + v11 + [(_BlastDoorLPAudio *)self->_audio _encodedSize];
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"originalURL", @"URL", @"title", @"summary", @"selectedText", @"siteName", @"itemType", @"relatedURL", @"creator", @"creatorFacebookProfile", @"creatorTwitterUsername", @"twitterCard", @"usesActivityPub", @"appleContentID", @"appleSummary", @"themeColor", @"icon",
               @"iconMetadata",
               @"arAsset",
               @"arAssetMetadata",
               @"image",
               @"alternateImages",
               @"contentImages",
               @"contentImagesMetadata",
               @"imageMetadata",
               @"video",
               @"videoMetadata",
               @"audio",
               @"audioMetadata",
               @"icons",
               @"images",
               @"availableContentImages",
               @"videos",
               @"streamingVideos",
               @"audios",
               @"associatedApplication",
               @"collaborationMetadata",
               @"specialization",
               @"specialization._dummyPropertyForObservation",
               0);
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSItemProvider)iconProvider
{
  return self->_iconProvider;
}

- (void)setIconProvider:(id)a3
{
}

- (NSItemProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (NSItemProvider)videoProvider
{
  return self->_videoProvider;
}

- (void)setVideoProvider:(id)a3
{
}

- (NSURL)remoteVideoURL
{
  return self->_remoteVideoURL;
}

- (void)setRemoteVideoURL:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
}

- (NSString)siteName
{
  return self->_siteName;
}

- (void)setSiteName:(id)a3
{
}

- (NSString)itemType
{
  return self->_itemType;
}

- (void)setItemType:(id)a3
{
}

- (NSURL)relatedURL
{
  return self->_relatedURL;
}

- (void)setRelatedURL:(id)a3
{
}

- (NSString)creator
{
  return self->_creator;
}

- (void)setCreator:(id)a3
{
}

- (NSString)creatorFacebookProfile
{
  return self->_creatorFacebookProfile;
}

- (void)setCreatorFacebookProfile:(id)a3
{
}

- (NSString)creatorTwitterUsername
{
  return self->_creatorTwitterUsername;
}

- (void)setCreatorTwitterUsername:(id)a3
{
}

- (NSString)twitterCard
{
  return self->_twitterCard;
}

- (void)setTwitterCard:(id)a3
{
}

- (BOOL)usesActivityPub
{
  return self->_usesActivityPub;
}

- (void)setUsesActivityPub:(BOOL)a3
{
  self->_usesActivityPub = a3;
}

- (NSString)appleContentID
{
  return self->_appleContentID;
}

- (void)setAppleContentID:(id)a3
{
}

- (NSString)appleSummary
{
  return self->_appleSummary;
}

- (void)setAppleSummary:(id)a3
{
}

- (_BlastDoorLPPlatformColor)themeColor
{
  return self->_themeColor;
}

- (void)setThemeColor:(id)a3
{
}

- (_BlastDoorLPARAsset)arAsset
{
  return self->_arAsset;
}

- (void)setArAsset:(id)a3
{
}

- (_BlastDoorLPARAssetMetadata)arAssetMetadata
{
  return self->_arAssetMetadata;
}

- (void)setArAssetMetadata:(id)a3
{
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (_BlastDoorLPIconMetadata)iconMetadata
{
  return self->_iconMetadata;
}

- (void)setIconMetadata:(id)a3
{
}

- (_BlastDoorLPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSArray)alternateImages
{
  return self->_alternateImages;
}

- (void)setAlternateImages:(id)a3
{
}

- (NSArray)contentImages
{
  return self->_contentImages;
}

- (void)setContentImages:(id)a3
{
}

- (NSArray)contentImagesMetadata
{
  return self->_contentImagesMetadata;
}

- (void)setContentImagesMetadata:(id)a3
{
}

- (_BlastDoorLPImageMetadata)imageMetadata
{
  return self->_imageMetadata;
}

- (void)setImageMetadata:(id)a3
{
}

- (_BlastDoorLPVideo)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
}

- (_BlastDoorLPVideoMetadata)videoMetadata
{
  return self->_videoMetadata;
}

- (void)setVideoMetadata:(id)a3
{
}

- (_BlastDoorLPAudio)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
}

- (_BlastDoorLPAudioMetadata)audioMetadata
{
  return self->_audioMetadata;
}

- (void)setAudioMetadata:(id)a3
{
}

- (NSArray)arAssets
{
  return self->_arAssets;
}

- (void)setArAssets:(id)a3
{
}

- (NSArray)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
}

- (NSArray)availableContentImages
{
  return self->_availableContentImages;
}

- (void)setAvailableContentImages:(id)a3
{
}

- (NSArray)videos
{
  return self->_videos;
}

- (void)setVideos:(id)a3
{
}

- (NSArray)streamingVideos
{
  return self->_streamingVideos;
}

- (void)setStreamingVideos:(id)a3
{
}

- (NSArray)audios
{
  return self->_audios;
}

- (void)setAudios:(id)a3
{
}

- (_BlastDoorLPAssociatedApplicationMetadata)associatedApplication
{
  return self->_associatedApplication;
}

- (void)setAssociatedApplication:(id)a3
{
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
}

- (_BlastDoorLPSpecializationMetadata)specialization
{
  return self->_specialization;
}

- (void)setSpecialization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialization, 0);
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_associatedApplication, 0);
  objc_storeStrong((id *)&self->_audios, 0);
  objc_storeStrong((id *)&self->_streamingVideos, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_availableContentImages, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_arAssets, 0);
  objc_storeStrong((id *)&self->_audioMetadata, 0);
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_videoMetadata, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_imageMetadata, 0);
  objc_storeStrong((id *)&self->_contentImagesMetadata, 0);
  objc_storeStrong((id *)&self->_contentImages, 0);
  objc_storeStrong((id *)&self->_alternateImages, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_iconMetadata, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_arAssetMetadata, 0);
  objc_storeStrong((id *)&self->_arAsset, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_appleSummary, 0);
  objc_storeStrong((id *)&self->_appleContentID, 0);
  objc_storeStrong((id *)&self->_twitterCard, 0);
  objc_storeStrong((id *)&self->_creatorTwitterUsername, 0);
  objc_storeStrong((id *)&self->_creatorFacebookProfile, 0);
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_relatedURL, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_remoteVideoURL, 0);
  objc_storeStrong((id *)&self->_videoProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_iconProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
}

- (void)_initWithDictionary:.cold.1()
{
}

- (void)_initWithDictionary:.cold.2()
{
}

- (void)_initWithDictionary:.cold.3()
{
}

@end