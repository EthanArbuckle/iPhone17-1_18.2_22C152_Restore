@interface LPLinkMetadata
+ (BOOL)supportsSecureCoding;
+ (LPLinkMetadata)metadataWithDataRepresentation:(id)a3;
+ (LPLinkMetadata)metadataWithDataRepresentation:(id)a3 decodingType:(unint64_t)a4;
+ (LPLinkMetadata)metadataWithDataRepresentationForLocalUseOnly:(id)a3;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)_hasAnyAsynchronousFields;
- (BOOL)_hasMedia;
- (BOOL)_isCurrentlyLoading;
- (BOOL)_isCurrentlyLoadingOrIncomplete;
- (BOOL)_isDeferringAsynchronousLoads;
- (BOOL)_isEqualIgnoringURLs:(id)a3;
- (BOOL)_isIncomplete;
- (BOOL)_isLoadingAsynchronousFields;
- (BOOL)_loadAsynchronousFieldsWithLoadGroup:(id)a3;
- (BOOL)_wasCopiedFromIncompleteMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupCollaboration;
- (BOOL)usesActivityPub;
- (LPARAsset)arAsset;
- (LPARAssetMetadata)arAssetMetadata;
- (LPAssociatedApplicationMetadata)associatedApplication;
- (LPAudio)audio;
- (LPAudioMetadata)audioMetadata;
- (LPIconMetadata)iconMetadata;
- (LPImage)icon;
- (LPImage)image;
- (LPImageMetadata)imageMetadata;
- (LPLinkMetadata)init;
- (LPLinkMetadata)initWithCoder:(id)a3;
- (LPProductMetadata)product;
- (LPSourceApplicationMetadata)sourceApplication;
- (LPSpecializationMetadata)specialization;
- (LPVideo)video;
- (LPVideoMetadata)videoMetadata;
- (NSArray)alternateImages;
- (NSArray)arAssets;
- (NSArray)audios;
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
- (NSString)originalTitle;
- (NSString)selectedText;
- (NSString)siteName;
- (NSString)summary;
- (NSString)title;
- (NSString)twitterCard;
- (NSURL)URL;
- (NSURL)originalURL;
- (NSURL)relatedURL;
- (NSURL)remoteVideoURL;
- (SYContentItem)originatingSynapseContentItem;
- (TUConversationActivity)conversationActivity;
- (UIColor)themeColor;
- (_SWCollaborationMetadata)collaborationMetadata;
- (id)_createAsynchronousLoadDeferralToken;
- (id)_initWithConversationActivity:(id)a3;
- (id)_initWithDictionary:(id)a3;
- (id)_initWithSynapseContentItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)dataRepresentationForLocalLowFidelityUseOnly;
- (id)dataRepresentationForLocalUseOnly;
- (id)dataRepresentationWithEncodingType:(unint64_t)a3 options:(unint64_t)a4;
- (id)variants;
- (int64_t)collaborationType;
- (unint64_t)_encodedSize;
- (unint64_t)hash;
- (unsigned)version;
- (void)_addFinishedDeferringAsynchronousLoadHandler:(id)a3;
- (void)_copyPropertiesFrom:(id)a3 onlyUpgradeFields:(BOOL)a4;
- (void)_copyPropertiesOnlyUpgradingFieldsFrom:(id)a3;
- (void)_decodeAllImagesWithMaximumSize:(CGSize)a3;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)_enumerateSubstitutableFields:(id)a3;
- (void)_invokePendingAsynchronousLoadUpdateHandlers;
- (void)_loadAsynchronousFieldsWithUpdateHandler:(id)a3;
- (void)_populateMetadataForBackwardCompatibility;
- (void)_reduceSizeByDroppingResourcesIfNeeded;
- (void)_resetIncompleteState;
- (void)_setIncomplete:(BOOL)a3;
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
- (void)setCollaborationMetadata:(id)a3;
- (void)setCollaborationType:(int64_t)a3;
- (void)setContentImages:(id)a3;
- (void)setContentImagesMetadata:(id)a3;
- (void)setConversationActivity:(id)a3;
- (void)setCreator:(id)a3;
- (void)setCreatorFacebookProfile:(id)a3;
- (void)setCreatorTwitterUsername:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconMetadata:(id)a3;
- (void)setIconProvider:(NSItemProvider *)iconProvider;
- (void)setIcons:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageMetadata:(id)a3;
- (void)setImageProvider:(NSItemProvider *)imageProvider;
- (void)setImages:(id)a3;
- (void)setItemType:(id)a3;
- (void)setOriginalTitle:(id)a3;
- (void)setOriginalURL:(NSURL *)originalURL;
- (void)setOriginatingSynapseContentItem:(id)a3;
- (void)setProduct:(id)a3;
- (void)setRelatedURL:(id)a3;
- (void)setRemoteVideoURL:(NSURL *)remoteVideoURL;
- (void)setSelectedText:(id)a3;
- (void)setSiteName:(id)a3;
- (void)setSourceApplication:(id)a3;
- (void)setSpecialization:(id)a3;
- (void)setStreamingVideos:(id)a3;
- (void)setSummary:(id)a3;
- (void)setThemeColor:(id)a3;
- (void)setTitle:(NSString *)title;
- (void)setTwitterCard:(id)a3;
- (void)setURL:(NSURL *)URL;
- (void)setUsesActivityPub:(BOOL)a3;
- (void)setVideo:(id)a3;
- (void)setVideoMetadata:(id)a3;
- (void)setVideoProvider:(NSItemProvider *)videoProvider;
- (void)setVideos:(id)a3;
@end

@implementation LPLinkMetadata

- (LPLinkMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPLinkMetadata;
  v2 = [(LPLinkMetadata *)&v6 init];
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
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v90 = v4;
  v5 = [(LPLinkMetadata *)self init];
  v91 = v5;
  if (!v5) {
    goto LABEL_79;
  }
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

  v89 = arrayOfStringsForKey(v4, @"LPMetadataIcons");
  id v92 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id obj = v89;
  uint64_t v33 = [obj countByEnumeratingWithState:&v125 objects:v137 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v126;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v126 != v34) {
          objc_enumerationMutation(obj);
        }
        v36 = URLFromStringIfHTTPFamily(*(void *)(*((void *)&v125 + 1) + 8 * v35));
        if (v36)
        {
          id v37 = [[LPIconMetadata alloc] _initWithURL:v36];
          if (v37) {
            [v92 addObject:v37];
          }
        }
        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [obj countByEnumeratingWithState:&v125 objects:v137 count:16];
    }
    while (v33);
  }

  objc_storeStrong((id *)&v91->_icons, v92);
  v88 = arrayOfStringsForKey(v90, @"LPMetadataContentImages");
  id v100 = [MEMORY[0x1E4F1CA48] array];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v95 = v88;
  uint64_t v38 = [v95 countByEnumeratingWithState:&v121 objects:v136 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v122;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v122 != v39) {
          objc_enumerationMutation(v95);
        }
        uint64_t v41 = *(void *)(*((void *)&v121 + 1) + 8 * v40);
        v42 = [LPImageMetadata alloc];
        v134 = @"LPMetadataImageURL";
        uint64_t v135 = v41;
        v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
        id v44 = [(LPImageMetadata *)v42 _initWithDictionary:v43];

        if (v44) {
          [v100 addObject:v44];
        }

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [v95 countByEnumeratingWithState:&v121 objects:v136 count:16];
    }
    while (v38);
  }

  objc_storeStrong((id *)&v91->_contentImagesMetadata, v100);
  v87 = arrayOfDictionariesForKey(v90, @"LPMetadataImages");
  id v99 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v94 = v87;
  uint64_t v45 = [v94 countByEnumeratingWithState:&v117 objects:v133 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v118;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v118 != v46) {
          objc_enumerationMutation(v94);
        }
        id v48 = [[LPImageMetadata alloc] _initWithDictionary:*(void *)(*((void *)&v117 + 1) + 8 * v47)];
        if (v48) {
          [v99 addObject:v48];
        }

        ++v47;
      }
      while (v45 != v47);
      uint64_t v45 = [v94 countByEnumeratingWithState:&v117 objects:v133 count:16];
    }
    while (v45);
  }

  objc_storeStrong((id *)&v91->_images, v99);
  v86 = arrayOfDictionariesForKey(v90, @"LPMetadataVideos");
  id v98 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v93 = v86;
  uint64_t v49 = [v93 countByEnumeratingWithState:&v113 objects:v132 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v114;
    do
    {
      uint64_t v51 = 0;
      do
      {
        if (*(void *)v114 != v50) {
          objc_enumerationMutation(v93);
        }
        id v52 = [[LPVideoMetadata alloc] _initWithDictionary:*(void *)(*((void *)&v113 + 1) + 8 * v51)];
        if (v52) {
          [v98 addObject:v52];
        }

        ++v51;
      }
      while (v49 != v51);
      uint64_t v49 = [v93 countByEnumeratingWithState:&v113 objects:v132 count:16];
    }
    while (v49);
  }

  objc_storeStrong((id *)&v91->_videos, v98);
  v85 = arrayOfDictionariesForKey(v90, @"LPMetadataStreamingVideos");
  id v97 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v53 = v85;
  uint64_t v54 = [v53 countByEnumeratingWithState:&v109 objects:v131 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v110;
    do
    {
      uint64_t v56 = 0;
      do
      {
        if (*(void *)v110 != v55) {
          objc_enumerationMutation(v53);
        }
        id v57 = [[LPVideoMetadata alloc] _initWithDictionary:*(void *)(*((void *)&v109 + 1) + 8 * v56)];
        if (v57) {
          [v97 addObject:v57];
        }

        ++v56;
      }
      while (v54 != v56);
      uint64_t v54 = [v53 countByEnumeratingWithState:&v109 objects:v131 count:16];
    }
    while (v54);
  }

  objc_storeStrong((id *)&v91->_streamingVideos, v97);
  v84 = arrayOfDictionariesForKey(v90, @"LPMetadataAudios");
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v59 = v84;
  uint64_t v60 = [v59 countByEnumeratingWithState:&v105 objects:v130 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v106;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v106 != v61) {
          objc_enumerationMutation(v59);
        }
        id v63 = [[LPAudioMetadata alloc] _initWithDictionary:*(void *)(*((void *)&v105 + 1) + 8 * v62)];
        if (v63) {
          [v58 addObject:v63];
        }

        ++v62;
      }
      while (v60 != v62);
      uint64_t v60 = [v59 countByEnumeratingWithState:&v105 objects:v130 count:16];
    }
    while (v60);
  }

  objc_storeStrong((id *)&v91->_audios, v58);
  v83 = arrayOfDictionariesForKey(v90, @"LPMetadataARAssets");
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v65 = v83;
  uint64_t v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v101, v129, 16, v83, v84, v85, v86, v87);
  if (v66)
  {
    uint64_t v67 = *(void *)v102;
    do
    {
      uint64_t v68 = 0;
      do
      {
        if (*(void *)v102 != v67) {
          objc_enumerationMutation(v65);
        }
        id v69 = [[LPARAssetMetadata alloc] _initWithDictionary:*(void *)(*((void *)&v101 + 1) + 8 * v68)];
        if (v69) {
          [v64 addObject:v69];
        }

        ++v68;
      }
      while (v66 != v68);
      uint64_t v66 = [v65 countByEnumeratingWithState:&v101 objects:v129 count:16];
    }
    while (v66);
  }

  objc_storeStrong((id *)&v91->_arAssets, v64);
  v70 = v90;
  v71 = [v90 objectForKey:@"LPMetadataAssociatedApplication"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v71 count])
  {
    v74 = v71;
    v71 = 0;
    goto LABEL_72;
  }
  if (v71)
  {
    v72 = objc_alloc_init(LPAssociatedApplicationMetadata);
    associatedApplication = v91->_associatedApplication;
    v91->_associatedApplication = v72;

    v74 = stringForKey(v71, @"app-clip-bundle-id");
    [(LPAssociatedApplicationMetadata *)v91->_associatedApplication setBundleIdentifier:v74];
LABEL_72:

    v70 = v90;
  }
  v75 = stringForKey(v70, @"LPMetadataProduct");
  v76 = arrayOfDictionariesForKey(v70, @"LPMetadataProductPrices");
  id v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v78 = v77;
  if (v75) {
    [v77 setObject:v75 forKeyedSubscript:@"LPMetadataProductPluralTitle"];
  }
  if (v76 && [v76 count]) {
    [v78 setObject:v76 forKeyedSubscript:@"LPMetadataProductPrices"];
  }
  v79 = [[LPProductMetadata alloc] _initWithDictionary:v78];
  product = v91->_product;
  v91->_product = v79;

  v81 = v91;
  id v4 = v90;
LABEL_79:

  return v91;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPLinkMetadata)initWithCoder:(id)a3
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)LPLinkMetadata;
  v5 = [(LPLinkMetadata *)&v104 init];
  if (!v5) {
    goto LABEL_29;
  }
  v5->_version = [v4 decodeInt32ForKey:@"version"];
  if ([v4 decodeBoolForKey:@"isEncodedForLocalUse"]
    && objc_msgSend(v4, "_lp_coderType") != 1)
  {
    id v98 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v115 = *MEMORY[0x1E4F28228];
    v116[0] = @"Attemping to decode LPLinkMetadata intended for local only use.";
    id v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:&v115 count:1];
    id v100 = [v98 errorWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v99];
    [v4 failWithError:v100];

LABEL_29:
    id v97 = 0;
    goto LABEL_30;
  }
  v5->_incomplete = [v4 decodeBoolForKey:@"isIncomplete"];
  uint64_t v6 = decodeURLForKey(v4, @"originalURL");
  originalURL = v5->_originalURL;
  v5->_originalURL = (NSURL *)v6;

  uint64_t v8 = decodeURLForKey(v4, @"URL");
  URL = v5->_URL;
  v5->_URL = (NSURL *)v8;

  uint64_t v10 = decodeStringForKey(v4, @"title");
  title = v5->_title;
  v5->_title = (NSString *)v10;

  uint64_t v12 = decodeStringForKey(v4, @"originalTitle");
  originalTitle = v5->_originalTitle;
  v5->_originalTitle = (NSString *)v12;

  uint64_t v14 = decodeStringForKey(v4, @"summary");
  summary = v5->_summary;
  v5->_summary = (NSString *)v14;

  uint64_t v16 = decodeStringForKey(v4, @"selection");
  selectedText = v5->_selectedText;
  v5->_selectedText = (NSString *)v16;

  uint64_t v18 = decodeStringForKey(v4, @"siteName");
  siteName = v5->_siteName;
  v5->_siteName = (NSString *)v18;

  uint64_t v20 = decodeStringForKey(v4, @"itemType");
  itemType = v5->_itemType;
  v5->_itemType = (NSString *)v20;

  uint64_t v22 = decodeURLForKey(v4, @"relatedURL");
  relatedURL = v5->_relatedURL;
  v5->_relatedURL = (NSURL *)v22;

  uint64_t v24 = decodeStringForKey(v4, @"creator");
  creator = v5->_creator;
  v5->_creator = (NSString *)v24;

  uint64_t v26 = decodeStringForKey(v4, @"creatorFacebookProfile");
  creatorFacebookProfile = v5->_creatorFacebookProfile;
  v5->_creatorFacebookProfile = (NSString *)v26;

  uint64_t v28 = decodeStringForKey(v4, @"creatorTwitterUsername");
  creatorTwitterUsername = v5->_creatorTwitterUsername;
  v5->_creatorTwitterUsername = (NSString *)v28;

  uint64_t v30 = decodeStringForKey(v4, @"twitterCard");
  twitterCard = v5->_twitterCard;
  v5->_twitterCard = (NSString *)v30;

  v5->_usesActivityPub = [v4 decodeBoolForKey:@"usesActivityPub"];
  uint64_t v32 = decodeStringForKey(v4, @"appleContentID");
  appleContentID = v5->_appleContentID;
  v5->_appleContentID = (NSString *)v32;

  uint64_t v34 = decodeStringForKey(v4, @"appleSummary");
  appleSummary = v5->_appleSummary;
  v5->_appleSummary = (NSString *)v34;

  uint64_t v36 = objc_msgSend(v4, "_lp_strictlyDecodeColorForKey:", @"themeColor");
  themeColor = v5->_themeColor;
  v5->_themeColor = (UIColor *)v36;

  uint64_t v38 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
  [(LPLinkMetadata *)v5 setIcon:v38];

  uint64_t v39 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"iconMetadata");
  iconMetadata = v5->_iconMetadata;
  v5->_iconMetadata = (LPIconMetadata *)v39;

  uint64_t v41 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"image");
  [(LPLinkMetadata *)v5 setImage:v41];

  v42 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfLPImagesForKey:", @"alternateImages");
  [(LPLinkMetadata *)v5 setAlternateImages:v42];

  uint64_t v43 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"imageMetadata");
  imageMetadata = v5->_imageMetadata;
  v5->_imageMetadata = (LPImageMetadata *)v43;

  uint64_t v45 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfLPImagesForKey:", @"contentImages");
  contentImages = v5->_contentImages;
  v5->_contentImages = (NSArray *)v45;

  uint64_t v47 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"contentImagesMetadata");
  contentImagesMetadata = v5->_contentImagesMetadata;
  v5->_contentImagesMetadata = (NSArray *)v47;

  uint64_t v49 = objc_msgSend(v4, "_lp_strictlyDecodeLPVideoForKey:", @"video");
  [(LPLinkMetadata *)v5 setVideo:v49];

  uint64_t v50 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"videoMetadata");
  videoMetadata = v5->_videoMetadata;
  v5->_videoMetadata = (LPVideoMetadata *)v50;

  id v52 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"audio");
  [(LPLinkMetadata *)v5 setAudio:v52];

  uint64_t v53 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"audioMetadata");
  audioMetadata = v5->_audioMetadata;
  v5->_audioMetadata = (LPAudioMetadata *)v53;

  uint64_t v55 = objc_msgSend(v4, "_lp_strictlyDecodeLPARAssetForKey:", @"arAsset");
  [(LPLinkMetadata *)v5 setArAsset:v55];

  uint64_t v56 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"arAssetMetadata");
  arAssetMetadata = v5->_arAssetMetadata;
  v5->_arAssetMetadata = (LPARAssetMetadata *)v56;

  uint64_t v58 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"icons");
  icons = v5->_icons;
  v5->_icons = (NSArray *)v58;

  uint64_t v60 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"images");
  images = v5->_images;
  v5->_images = (NSArray *)v60;

  uint64_t v62 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"videos");
  videos = v5->_videos;
  v5->_videos = (NSArray *)v62;

  uint64_t v64 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"streamingVideos");
  streamingVideos = v5->_streamingVideos;
  v5->_streamingVideos = (NSArray *)v64;

  uint64_t v66 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"audios");
  audios = v5->_audios;
  v5->_audios = (NSArray *)v66;

  uint64_t v68 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"arAssets");
  arAssets = v5->_arAssets;
  v5->_arAssets = (NSArray *)v68;

  uint64_t v70 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"associatedApplication");
  associatedApplication = v5->_associatedApplication;
  v5->_associatedApplication = (LPAssociatedApplicationMetadata *)v70;

  uint64_t v72 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"sourceApplication");
  sourceApplication = v5->_sourceApplication;
  v5->_sourceApplication = (LPSourceApplicationMetadata *)v72;

  uint64_t v74 = [v4 decodeIntegerForKey:@"collaborationType"];
  if (v74 <= 2) {
    int64_t v75 = v74;
  }
  else {
    int64_t v75 = 0;
  }
  v5->_collaborationType = v75;
  uint64_t v76 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"product");
  product = v5->_product;
  v5->_product = (LPProductMetadata *)v76;

  v78 = [v4 error];

  if (v78) {
    goto LABEL_29;
  }
  if ([v4 containsValueForKey:@"conversationActivity"])
  {
    uint64_t v106 = 0;
    uint64_t v107 = (uint64_t)&v106;
    uint64_t v108 = 0x2050000000;
    v79 = (void *)getTUConversationActivityClass_softClass;
    long long v109 = (void *)getTUConversationActivityClass_softClass;
    if (!getTUConversationActivityClass_softClass)
    {
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __getTUConversationActivityClass_block_invoke;
      v105[3] = &unk_1E5B04EB8;
      v105[4] = &v106;
      __getTUConversationActivityClass_block_invoke((uint64_t)v105);
      v79 = *(void **)(v107 + 24);
    }
    id v80 = v79;
    _Block_object_dispose(&v106, 8);
    uint64_t v81 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", v80, @"conversationActivity");
    conversationActivity = v5->_conversationActivity;
    v5->_conversationActivity = (TUConversationActivity *)v81;
  }
  if ([v4 containsValueForKey:@"collaborationMetadata"])
  {
    uint64_t v111 = 0;
    long long v112 = &v111;
    uint64_t v113 = 0x2050000000;
    v83 = (void *)get_SWCollaborationMetadataClass_softClass;
    uint64_t v114 = get_SWCollaborationMetadataClass_softClass;
    if (!get_SWCollaborationMetadataClass_softClass)
    {
      uint64_t v106 = MEMORY[0x1E4F143A8];
      uint64_t v107 = 3221225472;
      uint64_t v108 = (uint64_t)__get_SWCollaborationMetadataClass_block_invoke;
      long long v109 = &unk_1E5B04EB8;
      long long v110 = &v111;
      __get_SWCollaborationMetadataClass_block_invoke((uint64_t)&v106);
      v83 = (void *)v112[3];
    }
    id v84 = v83;
    _Block_object_dispose(&v111, 8);
    uint64_t v85 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", v84, @"collaborationMetadata");
    collaborationMetadata = v5->_collaborationMetadata;
    v5->_collaborationMetadata = (_SWCollaborationMetadata *)v85;
  }
  if ([v4 containsValueForKey:@"specialization2"])
  {
    v87 = decodableSpecializationClasses(objc_msgSend(v4, "_lp_coderType"));
    id v103 = 0;
    uint64_t v88 = objc_msgSend(v4, "_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v87, @"specialization2", &v103);
    id v89 = v103;
    specialization = v5->_specialization;
    v5->_specialization = (LPSpecializationMetadata *)v88;

    if (v89)
    {
      v91 = LPLogChannelSerialization();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        -[LPLinkMetadata initWithCoder:]();
      }
    }
  }
  if (!v5->_specialization && [v4 containsValueForKey:@"specialization"])
  {
    id v92 = decodableSpecializationClasses(objc_msgSend(v4, "_lp_coderType"));
    id v102 = 0;
    uint64_t v93 = objc_msgSend(v4, "_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v92, @"specialization", &v102);
    id v94 = v102;
    id v95 = v5->_specialization;
    v5->_specialization = (LPSpecializationMetadata *)v93;

    if (v94)
    {
      v96 = LPLogChannelSerialization();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
        -[LPLinkMetadata initWithCoder:]();
      }
    }
  }
  id v97 = v5;
LABEL_30:

  return v97;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPLinkMetadata allocWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [(LPLinkMetadata *)v4 _copyPropertiesFrom:self onlyUpgradeFields:0];
    uint64_t v6 = v5;
  }

  return v5;
}

- (void)_copyPropertiesOnlyUpgradingFieldsFrom:(id)a3
{
  id v156 = a3;
  self->_version = [v156 version];
  id v4 = [(LPLinkMetadata *)self originalURL];
  if (!v4
    || ([v156 originalURL],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = [v156 originalURL];
    [(LPLinkMetadata *)self setOriginalURL:v6];
  }
  v7 = [(LPLinkMetadata *)self URL];
  if (!v7
    || ([v156 URL],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = [v156 URL];
    [(LPLinkMetadata *)self setURL:v9];
  }
  uint64_t v10 = [(LPLinkMetadata *)self title];
  if (!v10
    || ([v156 title],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    uint64_t v12 = [v156 title];
    v13 = (void *)[v12 copy];
    [(LPLinkMetadata *)self setTitle:v13];
  }
  uint64_t v14 = [(LPLinkMetadata *)self originalTitle];
  if (!v14
    || ([v156 originalTitle],
        v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    uint64_t v16 = [v156 originalTitle];
    v17 = (void *)[v16 copy];
    [(LPLinkMetadata *)self setOriginalTitle:v17];
  }
  uint64_t v18 = [(LPLinkMetadata *)self summary];
  if (!v18
    || ([v156 summary],
        v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v19))
  {
    uint64_t v20 = [v156 summary];
    v21 = (void *)[v20 copy];
    [(LPLinkMetadata *)self setSummary:v21];
  }
  uint64_t v22 = [(LPLinkMetadata *)self selectedText];
  if (!v22
    || ([v156 selectedText],
        v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        v22,
        v23))
  {
    uint64_t v24 = [v156 selectedText];
    v25 = (void *)[v24 copy];
    [(LPLinkMetadata *)self setSelectedText:v25];
  }
  uint64_t v26 = [(LPLinkMetadata *)self siteName];
  if (!v26
    || ([v156 siteName],
        v27 = objc_claimAutoreleasedReturnValue(),
        v27,
        v26,
        v27))
  {
    uint64_t v28 = [v156 siteName];
    uint64_t v29 = (void *)[v28 copy];
    [(LPLinkMetadata *)self setSiteName:v29];
  }
  uint64_t v30 = [(LPLinkMetadata *)self itemType];
  if (!v30
    || ([v156 itemType],
        uint64_t v31 = objc_claimAutoreleasedReturnValue(),
        v31,
        v30,
        v31))
  {
    uint64_t v32 = [v156 itemType];
    uint64_t v33 = (void *)[v32 copy];
    [(LPLinkMetadata *)self setItemType:v33];
  }
  uint64_t v34 = [(LPLinkMetadata *)self relatedURL];
  if (!v34
    || ([v156 relatedURL],
        uint64_t v35 = objc_claimAutoreleasedReturnValue(),
        v35,
        v34,
        v35))
  {
    uint64_t v36 = [v156 relatedURL];
    [(LPLinkMetadata *)self setRelatedURL:v36];
  }
  id v37 = [(LPLinkMetadata *)self creator];
  if (!v37
    || ([v156 creator],
        uint64_t v38 = objc_claimAutoreleasedReturnValue(),
        v38,
        v37,
        v38))
  {
    uint64_t v39 = [v156 creator];
    uint64_t v40 = (void *)[v39 copy];
    [(LPLinkMetadata *)self setCreator:v40];
  }
  uint64_t v41 = [(LPLinkMetadata *)self creatorFacebookProfile];
  if (!v41
    || ([v156 creatorFacebookProfile],
        v42 = objc_claimAutoreleasedReturnValue(),
        v42,
        v41,
        v42))
  {
    uint64_t v43 = [v156 creatorFacebookProfile];
    id v44 = (void *)[v43 copy];
    [(LPLinkMetadata *)self setCreatorFacebookProfile:v44];
  }
  uint64_t v45 = [(LPLinkMetadata *)self creatorTwitterUsername];
  if (!v45
    || ([v156 creatorTwitterUsername],
        uint64_t v46 = objc_claimAutoreleasedReturnValue(),
        v46,
        v45,
        v46))
  {
    uint64_t v47 = [v156 creatorTwitterUsername];
    id v48 = (void *)[v47 copy];
    [(LPLinkMetadata *)self setCreatorTwitterUsername:v48];
  }
  uint64_t v49 = [(LPLinkMetadata *)self twitterCard];
  if (!v49
    || ([v156 twitterCard],
        uint64_t v50 = objc_claimAutoreleasedReturnValue(),
        v50,
        v49,
        v50))
  {
    uint64_t v51 = [v156 twitterCard];
    id v52 = (void *)[v51 copy];
    [(LPLinkMetadata *)self setTwitterCard:v52];
  }
  if ([(LPLinkMetadata *)self usesActivityPub]) {
    uint64_t v53 = 1;
  }
  else {
    uint64_t v53 = [v156 usesActivityPub];
  }
  [(LPLinkMetadata *)self setUsesActivityPub:v53];
  uint64_t v54 = [(LPLinkMetadata *)self appleContentID];
  if (!v54
    || ([v156 appleContentID],
        uint64_t v55 = objc_claimAutoreleasedReturnValue(),
        v55,
        v54,
        v55))
  {
    uint64_t v56 = [v156 appleContentID];
    id v57 = (void *)[v56 copy];
    [(LPLinkMetadata *)self setAppleContentID:v57];
  }
  uint64_t v58 = [(LPLinkMetadata *)self appleSummary];
  if (!v58
    || ([v156 appleSummary],
        id v59 = objc_claimAutoreleasedReturnValue(),
        v59,
        v58,
        v59))
  {
    uint64_t v60 = [v156 appleSummary];
    uint64_t v61 = (void *)[v60 copy];
    [(LPLinkMetadata *)self setAppleSummary:v61];
  }
  uint64_t v62 = [(LPLinkMetadata *)self themeColor];
  if (!v62
    || ([v156 themeColor],
        id v63 = objc_claimAutoreleasedReturnValue(),
        v63,
        v62,
        v63))
  {
    uint64_t v64 = [v156 themeColor];
    id v65 = (void *)[v64 copy];
    [(LPLinkMetadata *)self setThemeColor:v65];
  }
  uint64_t v66 = [(LPLinkMetadata *)self icon];
  if (!v66
    || ([v156 icon],
        uint64_t v67 = objc_claimAutoreleasedReturnValue(),
        v67,
        v66,
        v67))
  {
    uint64_t v68 = [v156 icon];
    [(LPLinkMetadata *)self setIcon:v68];
  }
  id v69 = [(LPLinkMetadata *)self iconMetadata];
  if (!v69
    || ([v156 iconMetadata],
        uint64_t v70 = objc_claimAutoreleasedReturnValue(),
        v70,
        v69,
        v70))
  {
    v71 = [v156 iconMetadata];
    [(LPLinkMetadata *)self setIconMetadata:v71];
  }
  uint64_t v72 = [(LPLinkMetadata *)self image];
  if (!v72
    || ([v156 image],
        v73 = objc_claimAutoreleasedReturnValue(),
        v73,
        v72,
        v73))
  {
    uint64_t v74 = [v156 image];
    [(LPLinkMetadata *)self setImage:v74];
  }
  int64_t v75 = [(LPLinkMetadata *)self imageMetadata];
  if (!v75
    || ([v156 imageMetadata],
        uint64_t v76 = objc_claimAutoreleasedReturnValue(),
        v76,
        v75,
        v76))
  {
    id v77 = [v156 imageMetadata];
    [(LPLinkMetadata *)self setImageMetadata:v77];
  }
  v78 = [(LPLinkMetadata *)self video];
  if (!v78
    || ([v156 video],
        v79 = objc_claimAutoreleasedReturnValue(),
        v79,
        v78,
        v79))
  {
    id v80 = [v156 video];
    [(LPLinkMetadata *)self setVideo:v80];
  }
  uint64_t v81 = [(LPLinkMetadata *)self videoMetadata];
  if (!v81
    || ([v156 videoMetadata],
        v82 = objc_claimAutoreleasedReturnValue(),
        v82,
        v81,
        v82))
  {
    v83 = [v156 videoMetadata];
    [(LPLinkMetadata *)self setVideoMetadata:v83];
  }
  id v84 = [(LPLinkMetadata *)self audio];
  if (!v84
    || ([v156 audio],
        uint64_t v85 = objc_claimAutoreleasedReturnValue(),
        v85,
        v84,
        v85))
  {
    v86 = [v156 audio];
    [(LPLinkMetadata *)self setAudio:v86];
  }
  v87 = [(LPLinkMetadata *)self audioMetadata];
  if (!v87
    || ([v156 audioMetadata],
        uint64_t v88 = objc_claimAutoreleasedReturnValue(),
        v88,
        v87,
        v88))
  {
    id v89 = [v156 audioMetadata];
    [(LPLinkMetadata *)self setAudioMetadata:v89];
  }
  v90 = [(LPLinkMetadata *)self arAsset];
  if (!v90
    || ([v156 arAsset],
        v91 = objc_claimAutoreleasedReturnValue(),
        v91,
        v90,
        v91))
  {
    id v92 = [v156 arAsset];
    [(LPLinkMetadata *)self setArAsset:v92];
  }
  uint64_t v93 = [(LPLinkMetadata *)self arAssetMetadata];
  if (!v93
    || ([v156 arAssetMetadata],
        id v94 = objc_claimAutoreleasedReturnValue(),
        v94,
        v93,
        v94))
  {
    id v95 = [v156 arAssetMetadata];
    [(LPLinkMetadata *)self setArAssetMetadata:v95];
  }
  v96 = [(LPLinkMetadata *)self icons];
  if (!v96
    || ([v156 icons],
        id v97 = objc_claimAutoreleasedReturnValue(),
        v97,
        v96,
        v97))
  {
    id v98 = [v156 icons];
    id v99 = (void *)[v98 copy];
    [(LPLinkMetadata *)self setIcons:v99];
  }
  id v100 = [(LPLinkMetadata *)self images];
  if (!v100
    || ([v156 images],
        long long v101 = objc_claimAutoreleasedReturnValue(),
        v101,
        v100,
        v101))
  {
    id v102 = [v156 images];
    id v103 = (void *)[v102 copy];
    [(LPLinkMetadata *)self setImages:v103];
  }
  objc_super v104 = [(LPLinkMetadata *)self contentImages];
  if (!v104
    || ([v156 contentImages],
        long long v105 = objc_claimAutoreleasedReturnValue(),
        v105,
        v104,
        v105))
  {
    uint64_t v106 = [v156 contentImages];
    uint64_t v107 = (void *)[v106 copy];
    [(LPLinkMetadata *)self setContentImages:v107];
  }
  uint64_t v108 = [(LPLinkMetadata *)self contentImagesMetadata];
  if (!v108
    || ([v156 contentImagesMetadata],
        long long v109 = objc_claimAutoreleasedReturnValue(),
        v109,
        v108,
        v109))
  {
    long long v110 = [v156 contentImagesMetadata];
    uint64_t v111 = (void *)[v110 copy];
    [(LPLinkMetadata *)self setContentImagesMetadata:v111];
  }
  long long v112 = [(LPLinkMetadata *)self alternateImages];
  if (!v112
    || ([v156 alternateImages],
        uint64_t v113 = objc_claimAutoreleasedReturnValue(),
        v113,
        v112,
        v113))
  {
    uint64_t v114 = [v156 alternateImages];
    uint64_t v115 = (void *)[v114 copy];
    [(LPLinkMetadata *)self setAlternateImages:v115];
  }
  long long v116 = [(LPLinkMetadata *)self videos];
  if (!v116
    || ([v156 videos],
        long long v117 = objc_claimAutoreleasedReturnValue(),
        v117,
        v116,
        v117))
  {
    long long v118 = [v156 videos];
    long long v119 = (void *)[v118 copy];
    [(LPLinkMetadata *)self setVideos:v119];
  }
  long long v120 = [(LPLinkMetadata *)self streamingVideos];
  if (!v120
    || ([v156 streamingVideos],
        long long v121 = objc_claimAutoreleasedReturnValue(),
        v121,
        v120,
        v121))
  {
    long long v122 = [v156 streamingVideos];
    long long v123 = (void *)[v122 copy];
    [(LPLinkMetadata *)self setStreamingVideos:v123];
  }
  long long v124 = [(LPLinkMetadata *)self audios];
  if (!v124
    || ([v156 audios],
        long long v125 = objc_claimAutoreleasedReturnValue(),
        v125,
        v124,
        v125))
  {
    long long v126 = [v156 audios];
    long long v127 = (void *)[v126 copy];
    [(LPLinkMetadata *)self setAudios:v127];
  }
  long long v128 = [(LPLinkMetadata *)self arAssets];
  if (!v128
    || ([v156 arAssets],
        v129 = objc_claimAutoreleasedReturnValue(),
        v129,
        v128,
        v129))
  {
    v130 = [v156 arAssets];
    v131 = (void *)[v130 copy];
    [(LPLinkMetadata *)self setArAssets:v131];
  }
  v132 = [(LPLinkMetadata *)self associatedApplication];
  if (!v132
    || ([v156 associatedApplication],
        v133 = objc_claimAutoreleasedReturnValue(),
        v133,
        v132,
        v133))
  {
    v134 = [v156 associatedApplication];
    uint64_t v135 = (void *)[v134 copy];
    [(LPLinkMetadata *)self setAssociatedApplication:v135];
  }
  v136 = [(LPLinkMetadata *)self sourceApplication];
  if (!v136
    || ([v156 sourceApplication],
        v137 = objc_claimAutoreleasedReturnValue(),
        v137,
        v136,
        v137))
  {
    uint64_t v138 = [v156 sourceApplication];
    v139 = (void *)[v138 copy];
    [(LPLinkMetadata *)self setSourceApplication:v139];
  }
  v140 = [(LPLinkMetadata *)self product];
  if (!v140
    || ([v156 product],
        v141 = objc_claimAutoreleasedReturnValue(),
        v141,
        v140,
        v141))
  {
    v142 = [v156 product];
    v143 = (void *)[v142 copy];
    [(LPLinkMetadata *)self setProduct:v143];
  }
  v144 = [(LPLinkMetadata *)self conversationActivity];
  if (!v144
    || ([v156 conversationActivity],
        v145 = objc_claimAutoreleasedReturnValue(),
        v145,
        v144,
        v145))
  {
    v146 = [v156 conversationActivity];
    v147 = (void *)[v146 copy];
    [(LPLinkMetadata *)self setConversationActivity:v147];
  }
  -[LPLinkMetadata setCollaborationType:](self, "setCollaborationType:", [v156 collaborationType]);
  v148 = [(LPLinkMetadata *)self collaborationMetadata];
  if (!v148
    || ([v156 collaborationMetadata],
        v149 = objc_claimAutoreleasedReturnValue(),
        v149,
        v148,
        v149))
  {
    v150 = [v156 collaborationMetadata];
    v151 = (void *)[v150 copy];
    [(LPLinkMetadata *)self setCollaborationMetadata:v151];
  }
  v152 = [(LPLinkMetadata *)self specialization];
  if (!v152
    || ([v156 specialization],
        v153 = objc_claimAutoreleasedReturnValue(),
        v153,
        v152,
        v153))
  {
    v154 = [v156 specialization];
    v155 = (void *)[v154 copy];
    [(LPLinkMetadata *)self setSpecialization:v155];
  }
}

- (void)_copyPropertiesFrom:(id)a3 onlyUpgradeFields:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v78 = v6;
  if (v4)
  {
    [(LPLinkMetadata *)self _copyPropertiesOnlyUpgradingFieldsFrom:v6];
  }
  else
  {
    self->_version = [v6 version];
    v7 = [v78 originalURL];
    [(LPLinkMetadata *)self setOriginalURL:v7];

    uint64_t v8 = [v78 URL];
    [(LPLinkMetadata *)self setURL:v8];

    v9 = [v78 title];
    uint64_t v10 = (void *)[v9 copy];
    [(LPLinkMetadata *)self setTitle:v10];

    v11 = [v78 originalTitle];
    uint64_t v12 = (void *)[v11 copy];
    [(LPLinkMetadata *)self setOriginalTitle:v12];

    v13 = [v78 summary];
    uint64_t v14 = (void *)[v13 copy];
    [(LPLinkMetadata *)self setSummary:v14];

    v15 = [v78 selectedText];
    uint64_t v16 = (void *)[v15 copy];
    [(LPLinkMetadata *)self setSelectedText:v16];

    v17 = [v78 siteName];
    uint64_t v18 = (void *)[v17 copy];
    [(LPLinkMetadata *)self setSiteName:v18];

    v19 = [v78 itemType];
    uint64_t v20 = (void *)[v19 copy];
    [(LPLinkMetadata *)self setItemType:v20];

    v21 = [v78 relatedURL];
    [(LPLinkMetadata *)self setRelatedURL:v21];

    uint64_t v22 = [v78 creator];
    v23 = (void *)[v22 copy];
    [(LPLinkMetadata *)self setCreator:v23];

    uint64_t v24 = [v78 creatorFacebookProfile];
    v25 = (void *)[v24 copy];
    [(LPLinkMetadata *)self setCreatorFacebookProfile:v25];

    uint64_t v26 = [v78 creatorTwitterUsername];
    v27 = (void *)[v26 copy];
    [(LPLinkMetadata *)self setCreatorTwitterUsername:v27];

    uint64_t v28 = [v78 twitterCard];
    uint64_t v29 = (void *)[v28 copy];
    [(LPLinkMetadata *)self setTwitterCard:v29];

    -[LPLinkMetadata setUsesActivityPub:](self, "setUsesActivityPub:", [v78 usesActivityPub]);
    uint64_t v30 = [v78 appleContentID];
    uint64_t v31 = (void *)[v30 copy];
    [(LPLinkMetadata *)self setAppleContentID:v31];

    uint64_t v32 = [v78 appleSummary];
    uint64_t v33 = (void *)[v32 copy];
    [(LPLinkMetadata *)self setAppleSummary:v33];

    uint64_t v34 = [v78 themeColor];
    uint64_t v35 = (void *)[v34 copy];
    [(LPLinkMetadata *)self setThemeColor:v35];

    uint64_t v36 = [v78 icon];
    [(LPLinkMetadata *)self setIcon:v36];

    id v37 = [v78 iconMetadata];
    [(LPLinkMetadata *)self setIconMetadata:v37];

    uint64_t v38 = [v78 image];
    [(LPLinkMetadata *)self setImage:v38];

    uint64_t v39 = [v78 imageMetadata];
    [(LPLinkMetadata *)self setImageMetadata:v39];

    uint64_t v40 = [v78 contentImages];
    uint64_t v41 = (void *)[v40 copy];
    [(LPLinkMetadata *)self setContentImages:v41];

    v42 = [v78 contentImagesMetadata];
    uint64_t v43 = (void *)[v42 copy];
    [(LPLinkMetadata *)self setContentImagesMetadata:v43];

    id v44 = [v78 video];
    [(LPLinkMetadata *)self setVideo:v44];

    uint64_t v45 = [v78 videoMetadata];
    [(LPLinkMetadata *)self setVideoMetadata:v45];

    uint64_t v46 = [v78 audio];
    [(LPLinkMetadata *)self setAudio:v46];

    uint64_t v47 = [v78 audioMetadata];
    [(LPLinkMetadata *)self setAudioMetadata:v47];

    id v48 = [v78 arAsset];
    [(LPLinkMetadata *)self setArAsset:v48];

    uint64_t v49 = [v78 arAssetMetadata];
    [(LPLinkMetadata *)self setArAssetMetadata:v49];

    uint64_t v50 = [v78 icons];
    uint64_t v51 = (void *)[v50 copy];
    [(LPLinkMetadata *)self setIcons:v51];

    id v52 = [v78 images];
    uint64_t v53 = (void *)[v52 copy];
    [(LPLinkMetadata *)self setImages:v53];

    uint64_t v54 = [v78 alternateImages];
    uint64_t v55 = (void *)[v54 copy];
    [(LPLinkMetadata *)self setAlternateImages:v55];

    uint64_t v56 = [v78 videos];
    id v57 = (void *)[v56 copy];
    [(LPLinkMetadata *)self setVideos:v57];

    uint64_t v58 = [v78 streamingVideos];
    id v59 = (void *)[v58 copy];
    [(LPLinkMetadata *)self setStreamingVideos:v59];

    uint64_t v60 = [v78 audios];
    uint64_t v61 = (void *)[v60 copy];
    [(LPLinkMetadata *)self setAudios:v61];

    uint64_t v62 = [v78 arAssets];
    id v63 = (void *)[v62 copy];
    [(LPLinkMetadata *)self setArAssets:v63];

    uint64_t v64 = [v78 associatedApplication];
    id v65 = (void *)[v64 copy];
    [(LPLinkMetadata *)self setAssociatedApplication:v65];

    uint64_t v66 = [v78 product];
    uint64_t v67 = (void *)[v66 copy];
    [(LPLinkMetadata *)self setProduct:v67];

    uint64_t v68 = [v78 sourceApplication];
    id v69 = (void *)[v68 copy];
    [(LPLinkMetadata *)self setSourceApplication:v69];

    uint64_t v70 = [v78 conversationActivity];
    v71 = (void *)[v70 copy];
    [(LPLinkMetadata *)self setConversationActivity:v71];

    -[LPLinkMetadata setCollaborationType:](self, "setCollaborationType:", [v78 collaborationType]);
    uint64_t v72 = [v78 collaborationMetadata];
    v73 = (void *)[v72 copy];
    [(LPLinkMetadata *)self setCollaborationMetadata:v73];

    uint64_t v74 = [v78 specialization];
    int64_t v75 = (void *)[v74 copy];
    [(LPLinkMetadata *)self setSpecialization:v75];

    -[LPLinkMetadata _setIncomplete:](self, "_setIncomplete:", [v78 _isIncomplete]);
    self->_wasCopiedFromIncompleteMetadata = [v78 _isCurrentlyLoadingOrIncomplete];
    uint64_t v76 = [v78 originatingSynapseContentItem];
    id v77 = (void *)[v76 copy];
    [(LPLinkMetadata *)self setOriginatingSynapseContentItem:v77];
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeInt32:self->_version forKey:@"version"];
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v4, "_lp_coderType") == 1, @"isEncodedForLocalUse");
  BOOL v5 = [(LPLinkMetadata *)self _isCurrentlyLoadingOrIncomplete];
  [v4 encodeBool:v5 forKey:@"isIncomplete"];
  if (v5)
  {
    id v6 = (id)LPLogChannelSerialization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [(LPLinkMetadata *)self _isCurrentlyLoading];
      BOOL v8 = [(LPLinkMetadata *)self _isIncomplete];
      BOOL v9 = [(LPLinkMetadata *)self _wasCopiedFromIncompleteMetadata];
      objc_opt_class();
      *(_DWORD *)buf = 67109888;
      BOOL v28 = v7;
      __int16 v29 = 1024;
      BOOL v30 = v8;
      __int16 v31 = 1024;
      BOOL v32 = v9;
      __int16 v33 = 1024;
      LOBYTE(v34) = objc_opt_isKindOfClass() & 1;
      int v34 = v34;
      _os_log_impl(&dword_1A35DC000, v6, OS_LOG_TYPE_DEFAULT, "LPLinkMetadata being encoded while incomplete (loading: %d, incomplete: %d, copiedFromIncomplete: %d, isPlaceholder: %d)!", buf, 0x1Au);
    }
  }
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_originalURL, @"originalURL");
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, @"URL");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, @"title");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_originalTitle, @"originalTitle");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_summary, @"summary");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_selectedText, @"selection");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_siteName, @"siteName");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_itemType, @"itemType");
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_relatedURL, @"relatedURL");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_creator, @"creator");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_creatorFacebookProfile, @"creatorFacebookProfile");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_creatorTwitterUsername, @"creatorTwitterUsername");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_twitterCard, @"twitterCard");
  [v4 encodeBool:self->_usesActivityPub forKey:@"usesActivityPub"];
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_appleContentID, @"appleContentID");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_appleSummary, @"appleSummary");
  objc_msgSend(v4, "_lp_encodeColorIfNotNil:forKey:", self->_themeColor, @"themeColor");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_iconMetadata, @"iconMetadata");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_image, @"image");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_alternateImages, @"alternateImages");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_contentImages, @"contentImages");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_contentImagesMetadata, @"contentImagesMetadata");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_imageMetadata, @"imageMetadata");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_video, @"video");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_videoMetadata, @"videoMetadata");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_audio, @"audio");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_audioMetadata, @"audioMetadata");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_arAsset, @"arAsset");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_arAssetMetadata, @"arAssetMetadata");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_icons, @"icons");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_images, @"images");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_videos, @"videos");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_streamingVideos, @"streamingVideos");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_audios, @"audios");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_arAssets, @"arAssets");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_associatedApplication, @"associatedApplication");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_sourceApplication, @"sourceApplication");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_product, @"product");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_conversationActivity, @"conversationActivity");
  [v4 encodeInteger:self->_collaborationType forKey:@"collaborationType"];
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_collaborationMetadata, @"collaborationMetadata");
  uint64_t v10 = objc_msgSend(v4, "_lp_coderType");
  v11 = self->_specialization;
  uint64_t v12 = v11;
  if (v10 == 1)
  {
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v13 = specializationClassesForLocalUseOnly();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:buf count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v36;
      while (2)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v13);
          }
          if (objc_opt_isKindOfClass())
          {

            goto LABEL_28;
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:buf count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  v17 = self->_specialization;
  *(void *)&long long v35 = objc_opt_class();
  *((void *)&v35 + 1) = objc_opt_class();
  *(void *)&long long v36 = objc_opt_class();
  *((void *)&v36 + 1) = objc_opt_class();
  *(void *)&long long v37 = objc_opt_class();
  *((void *)&v37 + 1) = objc_opt_class();
  *(void *)&long long v38 = objc_opt_class();
  *((void *)&v38 + 1) = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:11];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:buf count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v24;
    while (2)
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v18);
        }
        if (objc_opt_isKindOfClass())
        {

          uint64_t v22 = @"specialization";
          goto LABEL_26;
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:buf count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  uint64_t v22 = @"specialization2";
LABEL_26:
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_specialization, v22, v23);
LABEL_28:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPLinkMetadata;
  if ([(LPLinkMetadata *)&v8 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (void **)v4;
      BOOL v5 = (objectsAreEqual_0(v6[9], self->_originalURL) & 1) != 0
        && objectsAreEqual_0(v6[10], self->_URL)
        && [(LPLinkMetadata *)self _isEqualIgnoringURLs:v6];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_isEqualIgnoringURLs:(id)a3
{
  id v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPLinkMetadata;
  if ([(LPLinkMetadata *)&v7 isEqual:v4])
  {
    char v5 = 1;
  }
  else if (*((_DWORD *)v4 + 15) == self->_version {
         && objectsAreEqual_0(v4[6], self->_title)
  }
         && objectsAreEqual_0(v4[11], self->_summary)
         && objectsAreEqual_0(v4[12], self->_selectedText)
         && objectsAreEqual_0(v4[13], self->_siteName)
         && objectsAreEqual_0(v4[14], self->_itemType)
         && objectsAreEqual_0(v4[15], self->_relatedURL)
         && objectsAreEqual_0(v4[16], self->_creator)
         && objectsAreEqual_0(v4[17], self->_creatorFacebookProfile)
         && objectsAreEqual_0(v4[18], self->_creatorTwitterUsername)
         && objectsAreEqual_0(v4[19], self->_twitterCard)
         && *((unsigned __int8 *)v4 + 57) == self->_usesActivityPub
         && objectsAreEqual_0(v4[20], self->_appleContentID)
         && objectsAreEqual_0(v4[21], self->_appleSummary)
         && objectsAreEqual_0(v4[22], self->_themeColor)
         && objectsAreEqual_0(v4[25], self->_icon)
         && objectsAreEqual_0(v4[26], self->_iconMetadata)
         && objectsAreEqual_0(v4[27], self->_image)
         && objectsAreEqual_0(v4[31], self->_imageMetadata)
         && objectsAreEqual_0(v4[29], self->_contentImages)
         && objectsAreEqual_0(v4[30], self->_contentImagesMetadata)
         && objectsAreEqual_0(v4[32], self->_video)
         && objectsAreEqual_0(v4[33], self->_videoMetadata)
         && objectsAreEqual_0(v4[34], self->_audio)
         && objectsAreEqual_0(v4[35], self->_audioMetadata)
         && objectsAreEqual_0(v4[23], self->_arAsset)
         && objectsAreEqual_0(v4[24], self->_arAssetMetadata)
         && objectsAreEqual_0(v4[37], self->_icons)
         && objectsAreEqual_0(v4[38], self->_images)
         && objectsAreEqual_0(v4[28], self->_alternateImages)
         && objectsAreEqual_0(v4[39], self->_videos)
         && objectsAreEqual_0(v4[40], self->_streamingVideos)
         && objectsAreEqual_0(v4[41], self->_audios)
         && objectsAreEqual_0(v4[36], self->_arAssets)
         && objectsAreEqual_0(v4[42], self->_associatedApplication)
         && objectsAreEqual_0(v4[47], self->_sourceApplication)
         && objectsAreEqual_0(v4[44], self->_conversationActivity)
         && v4[45] == (void *)self->_collaborationType
         && objectsAreEqual_0(v4[46], self->_collaborationMetadata))
  {
    char v5 = objectsAreEqual_0(v4[49], self->_specialization);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_originalURL hash];
  return [(NSURL *)self->_URL hash] ^ v3;
}

+ (LPLinkMetadata)metadataWithDataRepresentation:(id)a3 decodingType:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a4 == 1 || (unint64_t)[v5 length] <= 0xA00000)
  {
    BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v6 error:0];
    [v9 _enableStrictSecureDecodingMode];
    [v9 setDecodingFailurePolicy:1];
    objc_msgSend(v9, "_lp_setCoderType:", a4);
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = *MEMORY[0x1E4F284E8];
    id v18 = 0;
    uint64_t v14 = objc_msgSend(v9, "_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v12, v13, &v18);
    id v15 = v18;

    [v9 finishDecoding];
    if (v15)
    {
      uint64_t v16 = LPLogChannelSerialization();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[LPLinkMetadata metadataWithDataRepresentation:decodingType:]();
      }
      id v8 = 0;
    }
    else
    {
      id v8 = v14;
    }
  }
  else
  {
    objc_super v7 = (id)LPLogChannelSerialization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[LPLinkMetadata metadataWithDataRepresentation:decodingType:](buf, [v6 length], v7);
    }

    id v8 = 0;
  }

  return (LPLinkMetadata *)v8;
}

- (id)dataRepresentationWithEncodingType:(unint64_t)a3 options:(unint64_t)a4
{
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  objc_msgSend(v7, "_lp_setCoderType:", a3);
  objc_msgSend(v7, "_lp_setCoderOptions:", a4);
  if (a3 == 1)
  {
    id v8 = objc_alloc_init(LPLocalMetadataArchiverDelegate);
    [v7 setDelegate:v8];
  }
  else
  {
    id v8 = 0;
  }
  [v7 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  BOOL v9 = [v7 encodedData];

  return v9;
}

+ (LPLinkMetadata)metadataWithDataRepresentation:(id)a3
{
  uint64_t v3 = [a1 metadataWithDataRepresentation:a3 decodingType:0];

  return (LPLinkMetadata *)v3;
}

- (id)dataRepresentation
{
  return [(LPLinkMetadata *)self dataRepresentationWithEncodingType:0 options:0];
}

+ (LPLinkMetadata)metadataWithDataRepresentationForLocalUseOnly:(id)a3
{
  uint64_t v3 = [a1 metadataWithDataRepresentation:a3 decodingType:1];

  return (LPLinkMetadata *)v3;
}

- (id)dataRepresentationForLocalUseOnly
{
  return [(LPLinkMetadata *)self dataRepresentationWithEncodingType:1 options:0];
}

- (id)dataRepresentationForLocalLowFidelityUseOnly
{
  return [(LPLinkMetadata *)self dataRepresentationWithEncodingType:1 options:1];
}

- (unint64_t)_encodedSize
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = self->_alternateImages;
  uint64_t v4 = 0;
  uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += [*(id *)(*((void *)&v21 + 1) + 8 * v7++) _encodedSize];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_contentImages;
  uint64_t v9 = 0;
  uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v9 += objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12++), "_encodedSize", (void)v17);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v10);
  }

  unint64_t v13 = [(LPImage *)self->_icon _encodedSize];
  unint64_t v14 = [(LPImage *)self->_image _encodedSize];
  unint64_t v15 = [(LPVisualMedia *)self->_video _encodedSize];
  return v9 + v4 + v13 + v14 + v15 + [(LPAudio *)self->_audio _encodedSize];
}

- (void)_reduceSizeByDroppingResourcesIfNeeded
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  if (+[LPTestingOverrides forceUseSmallerMaximumMetadataSize])
  {
    unint64_t v3 = 0x100000;
  }
  else
  {
    unint64_t v3 = 10485760;
  }
  long long v24 = 0uLL;
  long long v25 = 0uLL;
  uint64_t v21 = [&unk_1EF712918 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v21)
  {
    uint64_t v4 = *(void *)v23;
    uint64_t v18 = *(void *)v23;
    long long v19 = self;
LABEL_6:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v23 != v4) {
        objc_enumerationMutation(&unk_1EF712918);
      }
      uint64_t v6 = *(void *)(*((void *)&v22 + 1) + 8 * v5);
      if ([(LPLinkMetadata *)self _encodedSize] <= v3) {
        break;
      }
      uint64_t v7 = [(LPLinkMetadata *)self valueForKeyPath:v6];
      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v8 = [(LPLinkMetadata *)self _encodedSize];
          id v20 = v7;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v9 = [v20 reverseObjectEnumerator];
          uint64_t v10 = 0;
          uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v27 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = [*(id *)(*((void *)&v26 + 1) + 8 * i) _encodedSize];
                uint64_t v15 = (v14 != 0) & (v8 > v3);
                if (v14 != 0 && v8 > v3) {
                  uint64_t v16 = v14;
                }
                else {
                  uint64_t v16 = 0;
                }
                v8 -= v16;
                v10 += v15;
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
            }
            while (v11);
          }

          uint64_t v4 = v18;
          self = v19;
          long long v17 = objc_msgSend(v20, "subarrayWithRange:", 0, objc_msgSend(v20, "count") - v10);

          [(LPLinkMetadata *)v19 setValue:v17 forKeyPath:v6];
        }
        else if ([v7 _encodedSize])
        {
          [(LPLinkMetadata *)self setValue:0 forKeyPath:v6];
        }
      }

      if (++v5 == v21)
      {
        uint64_t v21 = [&unk_1EF712918 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v21) {
          goto LABEL_6;
        }
        return;
      }
    }
  }
}

- (NSItemProvider)iconProvider
{
  return [(LPImage *)self->_icon _itemProvider];
}

- (void)setIconProvider:(NSItemProvider *)iconProvider
{
  uint64_t v5 = iconProvider;
  if (v5) {
    uint64_t v4 = [[LPImage alloc] initWithItemProvider:v5 properties:0 placeholderImage:0];
  }
  else {
    uint64_t v4 = 0;
  }
  [(LPLinkMetadata *)self setIcon:v4];
  if (v5) {
}
  }

- (NSItemProvider)imageProvider
{
  return [(LPImage *)self->_image _itemProvider];
}

- (void)setImageProvider:(NSItemProvider *)imageProvider
{
  uint64_t v5 = imageProvider;
  if (v5) {
    uint64_t v4 = [[LPImage alloc] initWithItemProvider:v5 properties:0 placeholderImage:0];
  }
  else {
    uint64_t v4 = 0;
  }
  [(LPLinkMetadata *)self setImage:v4];
  if (v5) {
}
  }

- (NSString)title
{
  title = self->_title;
  if (title)
  {
    unint64_t v3 = title;
  }
  else
  {
    uint64_t v5 = [(NSURL *)self->_URL _title];

    if (v5)
    {
      unint64_t v3 = [(NSURL *)self->_URL _title];
    }
    else
    {
      unint64_t v3 = 0;
    }
  }

  return v3;
}

- (void)setTitle:(NSString *)title
{
  uint64_t v6 = title;
  objc_storeStrong((id *)&self->_title, title);
  uint64_t v5 = [(NSURL *)self->_URL _title];

  if (!v5) {
    [(NSURL *)self->_URL _setTitle:self->_title];
  }
}

- (NSItemProvider)videoProvider
{
  return [(LPVideo *)self->_video _itemProvider];
}

- (void)setVideoProvider:(NSItemProvider *)videoProvider
{
  uint64_t v5 = videoProvider;
  if (v5) {
    uint64_t v4 = [[LPVideo alloc] initWithItemProvider:v5 properties:0];
  }
  else {
    uint64_t v4 = 0;
  }
  [(LPLinkMetadata *)self setVideo:v4];
  if (v5) {
}
  }

- (NSURL)remoteVideoURL
{
  unint64_t v3 = [(LPVideo *)self->_video streamingURL];

  video = self->_video;
  if (v3)
  {
    uint64_t v5 = [(LPVideo *)video streamingURL];
  }
  else
  {
    uint64_t v6 = [(LPVideo *)video youTubeURL];

    if (v6)
    {
      uint64_t v5 = [(LPVideo *)self->_video youTubeURL];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return (NSURL *)v5;
}

- (void)setRemoteVideoURL:(NSURL *)remoteVideoURL
{
  uint64_t v5 = remoteVideoURL;
  if (+[LPPresentationSpecializations isYouTubeEmbedURL:](LPPresentationSpecializations, "isYouTubeEmbedURL:"))
  {
    uint64_t v4 = [[LPVideo alloc] initWithYouTubeURL:v5];
    [(LPLinkMetadata *)self setVideo:v4];
LABEL_5:

    goto LABEL_7;
  }
  if ([(NSURL *)v5 _lp_isHTTPFamilyURL])
  {
    uint64_t v4 = [[LPVideo alloc] initWithStreamingURL:v5 hasAudio:1];
    [(LPLinkMetadata *)self setVideo:v4];
    goto LABEL_5;
  }
  [(LPLinkMetadata *)self setVideo:0];
LABEL_7:
}

- (BOOL)isGroupCollaboration
{
  if (self->_collaborationType == 2) {
    return 1;
  }
  unint64_t v3 = [(TUConversationActivity *)self->_conversationActivity metadata];
  uint64_t v4 = [v3 context];
  uint64_t v5 = [v4 typedIdentifier];
  char v2 = [v5 isEqualToString:@"CPGroupActivityCollaborationContext"];

  return v2;
}

- (BOOL)_isLoadingAsynchronousFields
{
  return [(NSMutableArray *)self->_pendingAsynchronousLoadHandlers count] != 0;
}

- (BOOL)_isDeferringAsynchronousLoads
{
  return self->_asynchronousLoadDeferralTokenCount != 0;
}

- (BOOL)_wasCopiedFromIncompleteMetadata
{
  return self->_wasCopiedFromIncompleteMetadata;
}

- (BOOL)_isCurrentlyLoading
{
  if ([(LPLinkMetadata *)self _isDeferringAsynchronousLoads])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(LPLinkMetadata *)self _isLoadingAsynchronousFields];
    if (v3)
    {
      LOBYTE(v3) = [(LPLinkMetadata *)self _hasAnyAsynchronousFields];
    }
  }
  return v3;
}

- (BOOL)_isCurrentlyLoadingOrIncomplete
{
  if ([(LPLinkMetadata *)self _isCurrentlyLoading]
    || [(LPLinkMetadata *)self _isIncomplete]
    || [(LPLinkMetadata *)self _wasCopiedFromIncompleteMetadata])
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)_resetIncompleteState
{
  self->_incomplete = 0;
  self->_wasCopiedFromIncompleteMetadata = 0;
}

- (BOOL)_hasAnyAsynchronousFields
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__LPLinkMetadata__hasAnyAsynchronousFields__block_invoke;
  v4[3] = &unk_1E5B050E8;
  v4[4] = self;
  v4[5] = &v5;
  [(LPLinkMetadata *)self _enumerateAsynchronousFields:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __43__LPLinkMetadata__hasAnyAsynchronousFields__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(a1 + 32) valueForKeyPath:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v7 = v3;
    int v5 = [v3 conformsToProtocol:&unk_1EF721F50];
    uint64_t v4 = v7;
    if (v5)
    {
      int v6 = [v7 needsAsynchronousLoad];
      uint64_t v4 = v7;
      if (v6) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
}

- (void)_addFinishedDeferringAsynchronousLoadHandler:(id)a3
{
  id v4 = a3;
  finishedDeferringAsynchronousLoadHandlers = self->_finishedDeferringAsynchronousLoadHandlers;
  aBlock = v4;
  if (!finishedDeferringAsynchronousLoadHandlers)
  {
    int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_finishedDeferringAsynchronousLoadHandlers;
    self->_finishedDeferringAsynchronousLoadHandlers = v6;

    finishedDeferringAsynchronousLoadHandlers = self->_finishedDeferringAsynchronousLoadHandlers;
    id v4 = aBlock;
  }
  char v8 = _Block_copy(v4);
  [(NSMutableArray *)finishedDeferringAsynchronousLoadHandlers addObject:v8];
}

- (void)_loadAsynchronousFieldsWithUpdateHandler:(id)a3
{
  id v4 = a3;
  asynchronousLoadGroup = self->_asynchronousLoadGroup;
  int v6 = asynchronousLoadGroup;
  if (!asynchronousLoadGroup)
  {
    uint64_t v7 = (OS_dispatch_group *)dispatch_group_create();
    char v8 = self->_asynchronousLoadGroup;
    self->_asynchronousLoadGroup = v7;

    int v6 = self->_asynchronousLoadGroup;
  }
  if ([(LPLinkMetadata *)self _loadAsynchronousFieldsWithLoadGroup:v6]
    || ((BOOL v9 = [(LPLinkMetadata *)self _isDeferringAsynchronousLoads],
         asynchronousLoadGroup)
      ? (char v10 = 1)
      : (char v10 = v9),
        (v10 & 1) != 0))
  {
    pendingAsynchronousLoadHandlers = self->_pendingAsynchronousLoadHandlers;
    if (!pendingAsynchronousLoadHandlers)
    {
      uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v13 = self->_pendingAsynchronousLoadHandlers;
      self->_pendingAsynchronousLoadHandlers = v12;

      pendingAsynchronousLoadHandlers = self->_pendingAsynchronousLoadHandlers;
    }
    uint64_t v14 = _Block_copy(v4);
    [(NSMutableArray *)pendingAsynchronousLoadHandlers addObject:v14];

    uint64_t v15 = self->_asynchronousLoadGroup;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__LPLinkMetadata__loadAsynchronousFieldsWithUpdateHandler___block_invoke;
    v17[3] = &unk_1E5B04F80;
    v17[4] = self;
    uint64_t v18 = (OS_dispatch_group *)v4;
    dispatch_group_notify(v15, MEMORY[0x1E4F14428], v17);
    uint64_t v16 = v18;
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    uint64_t v16 = self->_asynchronousLoadGroup;
    self->_asynchronousLoadGroup = 0;
  }
}

void __59__LPLinkMetadata__loadAsynchronousFieldsWithUpdateHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

- (id)_createAsynchronousLoadDeferralToken
{
  asynchronousLoadGroup = self->_asynchronousLoadGroup;
  if (!asynchronousLoadGroup)
  {
    uint64_t v4 = (OS_dispatch_group *)dispatch_group_create();
    int v5 = self->_asynchronousLoadGroup;
    self->_asynchronousLoadGroup = v4;

    asynchronousLoadGroup = self->_asynchronousLoadGroup;
  }
  dispatch_group_enter(asynchronousLoadGroup);
  ++self->_asynchronousLoadDeferralTokenCount;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__LPLinkMetadata__createAsynchronousLoadDeferralToken__block_invoke;
  aBlock[3] = &unk_1E5B04DF0;
  aBlock[4] = self;
  int v6 = _Block_copy(aBlock);

  return v6;
}

void __54__LPLinkMetadata__createAsynchronousLoadDeferralToken__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  --*(void *)(*(void *)(a1 + 32) + 16);
  if (([*(id *)(a1 + 32) _isDeferringAsynchronousLoads] & 1) == 0)
  {
    uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadAsynchronousFieldsWithLoadGroup:", *(void *)(*(void *)(a1 + 32) + 8), (void)v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
}

- (void)_invokePendingAsynchronousLoadUpdateHandlers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[(NSMutableArray *)self->_pendingAsynchronousLoadHandlers copy];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)_loadAsynchronousFieldsWithLoadGroup:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke;
  v7[3] = &unk_1E5B05188;
  id v8 = v4;
  long long v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  [(LPLinkMetadata *)self _enumerateAsynchronousFields:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) valueForKeyPath:v3];
  id v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:&unk_1EF721F50])
    {
      id v6 = v5;
      if ([v6 needsAsynchronousLoad])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_2;
        v22[3] = &unk_1E5B05110;
        v22[4] = *(void *)(a1 + 32);
        id v23 = v3;
        id v24 = v6;
        id v25 = *(id *)(a1 + 40);
        [v24 loadAsynchronouslyWithCompletionHandler:v22];
      }
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
      id v8 = [MEMORY[0x1E4F28F50] strongObjectsPointerArray];
      for (unsigned int i = 0; [v7 count] > (unint64_t)i; ++i)
        objc_msgSend(v8, "addPointer:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_3;
      v15[3] = &unk_1E5B05160;
      id v10 = v8;
      uint64_t v12 = *(void **)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      id v16 = v10;
      uint64_t v21 = v11;
      id v13 = v12;
      uint64_t v14 = *(void *)(a1 + 32);
      id v17 = v13;
      uint64_t v18 = v14;
      id v19 = v3;
      id v20 = v7;
      [v20 enumerateObjectsUsingBlock:v15];

LABEL_10:
    }
  }
}

void __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) valueForKeyPath:*(void *)(a1 + 40)];
  id v4 = *(void **)(a1 + 48);

  if (v3 == v4) {
    [*(id *)(a1 + 32) setValue:v5 forKeyPath:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 needsAsynchronousLoad])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_4;
    v9[3] = &unk_1E5B05138;
    id v6 = *(id *)(a1 + 32);
    uint64_t v15 = a3;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = *(void **)(a1 + 56);
    id v10 = v6;
    uint64_t v11 = v7;
    id v12 = v8;
    id v13 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 40);
    [v5 loadAsynchronouslyWithCompletionHandler:v9];
  }
  else
  {
    [*(id *)(a1 + 32) replacePointerAtIndex:a3 withPointer:v5];
  }
}

void __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) replacePointerAtIndex:*(void *)(a1 + 72) withPointer:a2];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v4)
  {

LABEL_11:
    id v10 = objc_msgSend(*(id *)(a1 + 40), "valueForKeyPath:", *(void *)(a1 + 48), (void)v14);
    BOOL v11 = v10 == *(void **)(a1 + 56);

    if (v11)
    {
      id v12 = *(void **)(a1 + 40);
      id v13 = [*(id *)(a1 + 32) allObjects];
      [v12 setValue:v13 forKeyPath:*(void *)(a1 + 48)];
    }
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)v15;
  int v6 = 1;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v15 != v5) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      long long v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v14);
      LODWORD(v8) = [v8 isEqual:v9];

      v6 &= v8 ^ 1;
    }
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v4);

  if (v6) {
    goto LABEL_11;
  }
LABEL_13:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (void)_enumerateSubstitutableFields:(id)a3
{
  uint64_t v4 = (void (**)(id, __CFString *))a3;
  v4[2](v4, @"arAsset");
  [(LPLinkMetadata *)self _enumerateAsynchronousFields:v4];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  uint64_t v4 = (void (**)(id, __CFString *))a3;
  v4[2](v4, @"icon");
  v4[2](v4, @"image");
  v4[2](v4, @"video");
  v4[2](v4, @"alternateImages");
  specialization = self->_specialization;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__LPLinkMetadata__enumerateAsynchronousFields___block_invoke;
  v7[3] = &unk_1E5B051B0;
  int v6 = v4;
  id v8 = v6;
  [(LPSpecializationMetadata *)specialization _enumerateAsynchronousFields:v7];
}

void __47__LPLinkMetadata__enumerateAsynchronousFields___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [@"specialization." stringByAppendingString:a2];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (void)_populateMetadataForBackwardCompatibility
{
  id v6 = [(LPLinkMetadata *)self specialization];
  if (v6)
  {
    id v3 = [(LPLinkMetadata *)self specialization];
    if ([v3 conformsToProtocol:&unk_1EF724770])
    {
      uint64_t v4 = [(LPLinkMetadata *)self specialization];
      char v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) == 0) {
        return;
      }
      id v6 = [(LPLinkMetadata *)self specialization];
      [v6 populateMetadataForBackwardCompatibility:self];
    }
    else
    {
    }
  }
}

- (void)_decodeAllImagesWithMaximumSize:(CGSize)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__LPLinkMetadata__decodeAllImagesWithMaximumSize___block_invoke;
  v3[3] = &unk_1E5B051F8;
  v3[4] = self;
  CGSize v4 = a3;
  [(LPLinkMetadata *)self _enumerateAsynchronousFields:v3];
}

void __50__LPLinkMetadata__decodeAllImagesWithMaximumSize___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) valueForKeyPath:a2];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v3, "_synchronouslyDecodePlatformImageWithMaximumSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v4[0] = MEMORY[0x1E4F143A8];
        v4[1] = 3221225472;
        v4[2] = __50__LPLinkMetadata__decodeAllImagesWithMaximumSize___block_invoke_2;
        v4[3] = &__block_descriptor_48_e41_v32__0___LPAsynchronousResource__8Q16_B24l;
        long long v5 = *(_OWORD *)(a1 + 40);
        [v3 enumerateObjectsUsingBlock:v4];
      }
    }
  }
}

void __50__LPLinkMetadata__decodeAllImagesWithMaximumSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v3, "_synchronouslyDecodePlatformImageWithMaximumSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  }
}

- (id)_initWithSynapseContentItem:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 linkPreviewMetadata];

  if (!v5
    || ([v4 linkPreviewMetadata],
        id v6 = objc_claimAutoreleasedReturnValue(),
        +[LPLinkMetadata metadataWithDataRepresentation:v6], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    id v8 = [(LPLinkMetadata *)self init];
    if (!v8)
    {
      id v12 = 0;
      goto LABEL_7;
    }
    self = v8;
    long long v9 = [v4 itemURL];
    [(LPLinkMetadata *)self setOriginalURL:v9];

    id v10 = [v4 itemURL];
    [(LPLinkMetadata *)self setURL:v10];

    BOOL v11 = [v4 displayTitle];
    [(LPLinkMetadata *)self setTitle:v11];

    uint64_t v7 = self;
  }
  [v7 setOriginatingSynapseContentItem:v4];
  id v12 = v7;

LABEL_7:
  return v12;
}

- (id)_initWithConversationActivity:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 metadata];
  id v6 = [v5 linkMetadatablob];

  if (!v6
    || ([v5 linkMetadatablob],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        +[LPLinkMetadata metadataWithDataRepresentation:v7], id v8 = objc_claimAutoreleasedReturnValue(), v7, !v8))
  {
    long long v9 = [(LPLinkMetadata *)self init];
    if (!v9)
    {
      id v18 = 0;
      goto LABEL_9;
    }
    self = v9;
    id v10 = [v5 title];
    [(LPLinkMetadata *)self setTitle:v10];

    BOOL v11 = [v5 subTitle];
    [(LPLinkMetadata *)self setSummary:v11];

    id v12 = [v5 imageData];

    if (v12)
    {
      id v13 = [LPImage alloc];
      id v14 = objc_alloc(MEMORY[0x1E4FB1818]);
      long long v15 = [v5 imageData];
      long long v16 = (void *)[v14 initWithData:v15];
      long long v17 = [(LPImage *)v13 initWithPlatformImage:v16];
      [(LPLinkMetadata *)self setImage:v17];
    }
    id v8 = self;
  }
  [v8 setConversationActivity:v4];
  id v18 = v8;

LABEL_9:
  return v18;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"originalURL", @"URL", @"title", @"originalTitle", @"summary", @"selectedText", @"siteName", @"itemType", @"relatedURL", @"creator", @"creatorFacebookProfile", @"creatorTwitterUsername", @"twitterCard", @"usesActivityPub", @"appleContentID", @"appleSummary", @"themeColor",
               @"icon",
               @"iconMetadata",
               @"image",
               @"alternateImages",
               @"contentImages",
               @"contentImagesMetadata",
               @"imageMetadata",
               @"video",
               @"videoMetadata",
               @"audio",
               @"audioMetadata",
               @"arAsset",
               @"arAssetMetadata",
               @"icons",
               @"images",
               @"videos",
               @"streamingVideos",
               @"audios",
               @"arAssets",
               @"associatedApplication",
               @"sourceApplication",
               @"originatingSynapseContentItem",
               @"conversationActivity",
               @"collaborationType",
               @"collaborationMetadata",
               @"product",
               @"specialization",
               @"specialization._dummyPropertyForObservation",
               0);
}

- (NSString)originalTitle
{
  originalTitle = self->_originalTitle;
  if (!originalTitle) {
    originalTitle = self->_title;
  }
  return originalTitle;
}

- (void)setOriginalTitle:(id)a3
{
}

- (BOOL)_isIncomplete
{
  return self->_incomplete;
}

- (void)_setIncomplete:(BOOL)a3
{
  self->_incomplete = a3;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(NSURL *)originalURL
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(NSURL *)URL
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

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (void)setThemeColor:(id)a3
{
}

- (LPARAsset)arAsset
{
  return self->_arAsset;
}

- (void)setArAsset:(id)a3
{
}

- (LPARAssetMetadata)arAssetMetadata
{
  return self->_arAssetMetadata;
}

- (void)setArAssetMetadata:(id)a3
{
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (LPIconMetadata)iconMetadata
{
  return self->_iconMetadata;
}

- (void)setIconMetadata:(id)a3
{
}

- (LPImage)image
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

- (LPImageMetadata)imageMetadata
{
  return self->_imageMetadata;
}

- (void)setImageMetadata:(id)a3
{
}

- (LPVideo)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
}

- (LPVideoMetadata)videoMetadata
{
  return self->_videoMetadata;
}

- (void)setVideoMetadata:(id)a3
{
}

- (LPAudio)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
}

- (LPAudioMetadata)audioMetadata
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

- (LPAssociatedApplicationMetadata)associatedApplication
{
  return self->_associatedApplication;
}

- (void)setAssociatedApplication:(id)a3
{
}

- (SYContentItem)originatingSynapseContentItem
{
  return self->_originatingSynapseContentItem;
}

- (void)setOriginatingSynapseContentItem:(id)a3
{
}

- (TUConversationActivity)conversationActivity
{
  return self->_conversationActivity;
}

- (void)setConversationActivity:(id)a3
{
}

- (int64_t)collaborationType
{
  return self->_collaborationType;
}

- (void)setCollaborationType:(int64_t)a3
{
  self->_collaborationType = a3;
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
}

- (LPSourceApplicationMetadata)sourceApplication
{
  return self->_sourceApplication;
}

- (void)setSourceApplication:(id)a3
{
}

- (LPProductMetadata)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (LPSpecializationMetadata)specialization
{
  return self->_specialization;
}

- (void)setSpecialization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialization, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_conversationActivity, 0);
  objc_storeStrong((id *)&self->_originatingSynapseContentItem, 0);
  objc_storeStrong((id *)&self->_associatedApplication, 0);
  objc_storeStrong((id *)&self->_audios, 0);
  objc_storeStrong((id *)&self->_streamingVideos, 0);
  objc_storeStrong((id *)&self->_videos, 0);
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
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_originalTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_pendingAsynchronousLoadHandlers, 0);
  objc_storeStrong((id *)&self->_finishedDeferringAsynchronousLoadHandlers, 0);

  objc_storeStrong((id *)&self->_asynchronousLoadGroup, 0);
}

- (BOOL)_hasMedia
{
  uint64_t v2 = self;
  id v3 = [(LPLinkMetadata *)v2 video];

  if (v3 || (id v4 = [(LPLinkMetadata *)v2 arAsset], v4, v4))
  {

    return 1;
  }
  else
  {
    id v6 = [(LPLinkMetadata *)v2 image];
    if (v6)
    {
      uint64_t v7 = v6;
      unsigned __int8 v8 = [(LPImage *)v6 _isLowResolutionAsImage];

      return v8 ^ 1;
    }
    else
    {

      return 0;
    }
  }
}

- (id)variants
{
  uint64_t v2 = self;
  LPLinkMetadata.variants()();

  sub_1A36BBBCC(0, &qword_1EB3C8D70);
  id v3 = (void *)sub_1A36D6ED8();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A35DC000, v0, v1, "Failed to decode LPLinkMetadata 'specialization' with error: %@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A35DC000, v0, v1, "Failed to decode LPLinkMetadata 'specialization' with exception: %@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A35DC000, v0, v1, "Failed to decode LPLinkMetadata 'specialization2' with error: %@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A35DC000, v0, v1, "Failed to decode LPLinkMetadata 'specialization2' with exception: %@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A35DC000, v0, v1, "Failed to decode LPLinkMetadata 'collaborationMetadata' with exception: %@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A35DC000, v0, v1, "Failed to decode LPLinkMetadata 'conversationActivity' with exception: %@", v2, v3, v4, v5, v6);
}

+ (void)metadataWithDataRepresentation:decodingType:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A35DC000, v0, v1, "LPLinkMetadata: Failed to decode with error: %@", v2, v3, v4, v5, v6);
}

+ (void)metadataWithDataRepresentation:decodingType:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A35DC000, v0, v1, "LPLinkMetadata: Failed to decode with exception: %@", v2, v3, v4, v5, v6);
}

+ (void)metadataWithDataRepresentation:(os_log_t)log decodingType:.cold.3(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "LPLinkMetadata: Failed to decode: excessive size (%{iec-bytes}lu)", buf, 0xCu);
}

@end