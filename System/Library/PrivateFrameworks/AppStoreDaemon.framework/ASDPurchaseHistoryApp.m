@interface ASDPurchaseHistoryApp
+ (BOOL)supportsSecureCoding;
- (ASDPurchaseHistoryApp)initWithCoder:(id)a3;
- (BOOL)currentlyOptedInForMacOSEligibility;
- (BOOL)currentlyOptedInForXROSEligibility;
- (BOOL)hasAnyMacOSCompatibleIOSVersion;
- (BOOL)hasMessagesExtension;
- (BOOL)hasP3;
- (BOOL)is32BitOnly;
- (BOOL)isArcade;
- (BOOL)isCustomBrowserEngineApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamilyShared;
- (BOOL)isFirstParty;
- (BOOL)isHidden;
- (BOOL)isHiddenFromSpringboard;
- (BOOL)isPreorder;
- (BOOL)isVerifiedForMacOS;
- (BOOL)optedInForMacOSEligibility;
- (BOOL)optedInForXROSEligibility;
- (BOOL)requiresRosetta;
- (BOOL)runsOnAppleSilicon;
- (BOOL)runsOnIntel;
- (BOOL)supportsIPad;
- (BOOL)supportsIPhone;
- (BOOL)supportsLayeredImage;
- (BOOL)supportsMac;
- (BOOL)supportsRealityDevice;
- (BOOL)watchAppDeliveredIniOSApp;
- (BOOL)watchAppRunsIndependently;
- (BOOL)watchOnly;
- (NSArray)appCapabilities;
- (NSArray)macAppRequiredCapabilities;
- (NSArray)requiredCapabilities;
- (NSDate)datePurchased;
- (NSString)bundleID;
- (NSString)circularIconURLString;
- (NSString)developerName;
- (NSString)genreName;
- (NSString)iconURLString;
- (NSString)longTitle;
- (NSString)ovalIconURLString;
- (NSString)redownloadParams;
- (NSString)title;
- (NSURL)preflightPackageURL;
- (NSURL)productURL;
- (id)description;
- (int64_t)contentRatingFlags;
- (int64_t)genreID;
- (int64_t)purchaserDSID;
- (int64_t)storeItemID;
- (unint64_t)lockerItemID;
- (unsigned)mediaKind;
- (unsigned)purchaseToken;
- (void)encodeWithCoder:(id)a3;
- (void)setAppCapabilities:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCircularIconURLString:(id)a3;
- (void)setContentRatingFlags:(int64_t)a3;
- (void)setCurrentlyOptedInForMacOSEligibility:(BOOL)a3;
- (void)setCurrentlyOptedInForXROSEligibility:(BOOL)a3;
- (void)setCustomBrowserEngineApp:(BOOL)a3;
- (void)setDatePurchased:(id)a3;
- (void)setDeveloperName:(id)a3;
- (void)setFamilyShared:(BOOL)a3;
- (void)setFirstParty:(BOOL)a3;
- (void)setGenreID:(int64_t)a3;
- (void)setGenreName:(id)a3;
- (void)setHasMessagesExtension:(BOOL)a3;
- (void)setHasP3:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHiddenFromSpringboard:(BOOL)a3;
- (void)setIconURLString:(id)a3;
- (void)setIs32BitOnly:(BOOL)a3;
- (void)setIsArcade:(BOOL)a3;
- (void)setIsPreorder:(BOOL)a3;
- (void)setIsVerifiedForMacOS:(BOOL)a3;
- (void)setLockerItemID:(unint64_t)a3;
- (void)setLongTitle:(id)a3;
- (void)setMacAppRequiredCapabilities:(id)a3;
- (void)setMediaKind:(unsigned int)a3;
- (void)setOptedInForMacOSEligibility:(BOOL)a3;
- (void)setOptedInForXROSEligibility:(BOOL)a3;
- (void)setOvalIconURLString:(id)a3;
- (void)setPreflightPackageURL:(id)a3;
- (void)setProductURL:(id)a3;
- (void)setPurchaseToken:(unsigned int)a3;
- (void)setPurchaserDSID:(int64_t)a3;
- (void)setRedownloadParams:(id)a3;
- (void)setRequiredCapabilities:(id)a3;
- (void)setRequiresRosetta:(BOOL)a3;
- (void)setRunsOnAppleSilicon:(BOOL)a3;
- (void)setRunsOnIntel:(BOOL)a3;
- (void)setStoreItemID:(int64_t)a3;
- (void)setSupportsIPad:(BOOL)a3;
- (void)setSupportsIPhone:(BOOL)a3;
- (void)setSupportsLayeredImage:(BOOL)a3;
- (void)setSupportsMac:(BOOL)a3;
- (void)setSupportsRealityDevice:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setWatchAppDeliveredIniOSApp:(BOOL)a3;
- (void)setWatchAppRunsIndependently:(BOOL)a3;
- (void)setWatchOnly:(BOOL)a3;
@end

@implementation ASDPurchaseHistoryApp

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ASDPurchaseHistoryApp *)self title];
  v7 = [(ASDPurchaseHistoryApp *)self bundleID];
  v8 = [v3 stringWithFormat:@"<%@: %p> '%@' %@", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v17) = 0;
    goto LABEL_79;
  }
  id v5 = v4;
  v6 = [(ASDPurchaseHistoryApp *)self bundleID];
  v7 = [v5 bundleID];
  if (v6 == v7
    || ([(ASDPurchaseHistoryApp *)self bundleID],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v5 bundleID],
        v139 = objc_claimAutoreleasedReturnValue(),
        v140 = v8,
        [v8 isEqual:v139]))
  {
    uint64_t v18 = [(ASDPurchaseHistoryApp *)self circularIconURLString];
    v137 = [v5 circularIconURLString];
    v138 = (void *)v18;
    BOOL v19 = v18 != (void)v137;
    if ((void *)v18 != v137)
    {
      v20 = [(ASDPurchaseHistoryApp *)self circularIconURLString];
      v133 = [v5 circularIconURLString];
      v134 = v20;
      if (![v20 isEqual:v133])
      {
        *(void *)&v141[32] = 0;
        memset(v141, 0, 24);
        int v10 = 0;
        int v11 = 0;
        memset(v142, 0, sizeof(v142));
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[28] = 0;
        *(_DWORD *)&v141[40] = 1;
        goto LABEL_24;
      }
    }
    int64_t v21 = [(ASDPurchaseHistoryApp *)self contentRatingFlags];
    *(_DWORD *)&v141[40] = v19;
    if (v21 != [v5 contentRatingFlags])
    {
      memset(v141, 0, 24);
      int v10 = 0;
      int v11 = 0;
      memset(v142, 0, sizeof(v142));
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      LOBYTE(v17) = 0;
      *(_OWORD *)&v141[24] = 1uLL;
      goto LABEL_24;
    }
    uint64_t v22 = [(ASDPurchaseHistoryApp *)self datePurchased];
    v131 = [v5 datePurchased];
    v132 = (void *)v22;
    if ((void *)v22 != v131)
    {
      v23 = [(ASDPurchaseHistoryApp *)self datePurchased];
      v127 = [v5 datePurchased];
      v128 = v23;
      if (![v23 isEqual:v127])
      {
        *(void *)&v141[28] = 0;
        memset(v141, 0, 20);
        int v10 = 0;
        int v11 = 0;
        memset(v142, 0, sizeof(v142));
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[20] = 1;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[36] = 1;
        goto LABEL_24;
      }
    }
    uint64_t v24 = [(ASDPurchaseHistoryApp *)self developerName];
    v129 = [v5 developerName];
    v130 = (void *)v24;
    BOOL v25 = v24 != (void)v129;
    *(_DWORD *)&v141[36] = v22 != (void)v131;
    if ((void *)v24 != v129)
    {
      v26 = [(ASDPurchaseHistoryApp *)self developerName];
      v125 = [v5 developerName];
      v126 = v26;
      if (![v26 isEqual:v125])
      {
        *(void *)&v141[8] = 0;
        *(void *)v141 = 0;
        int v10 = 0;
        int v11 = 0;
        memset(v142, 0, sizeof(v142));
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[28] = 0;
        *(void *)&v141[16] = 0x100000001;
        *(_DWORD *)&v141[32] = 1;
        goto LABEL_24;
      }
    }
    int v27 = [(ASDPurchaseHistoryApp *)self isFamilyShared];
    *(_DWORD *)&v141[32] = v25;
    if (v27 != [v5 isFamilyShared]
      || (int v28 = [(ASDPurchaseHistoryApp *)self isFirstParty],
          v28 != [v5 isFirstParty])
      || (int64_t v29 = -[ASDPurchaseHistoryApp genreID](self, "genreID"), v29 != [v5 genreID]))
    {
      *(void *)&v141[8] = 0;
      *(void *)v141 = 0;
      int v10 = 0;
      int v11 = 0;
      memset(v142, 0, sizeof(v142));
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[28] = 0;
      *(void *)&v141[16] = 0x100000001;
      goto LABEL_24;
    }
    uint64_t v30 = [(ASDPurchaseHistoryApp *)self genreName];
    v123 = [v5 genreName];
    v124 = (void *)v30;
    BOOL v31 = v30 != (void)v123;
    if ((void *)v30 != v123)
    {
      v32 = [(ASDPurchaseHistoryApp *)self genreName];
      v121 = [v5 genreName];
      v122 = v32;
      if (![v32 isEqual:v121])
      {
        *(void *)v141 = 0;
        int v10 = 0;
        int v11 = 0;
        memset(v142, 0, sizeof(v142));
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(void *)&v141[16] = 0x100000001;
        *(void *)&v141[8] = 0x100000000;
        *(_DWORD *)&v141[28] = 1;
        goto LABEL_24;
      }
    }
    int v43 = [(ASDPurchaseHistoryApp *)self hasMessagesExtension];
    *(_DWORD *)&v141[28] = v31;
    if (v43 != [v5 hasMessagesExtension]
      || (int v44 = -[ASDPurchaseHistoryApp isHidden](self, "isHidden"), v44 != [v5 isHidden])
      || (int v45 = [(ASDPurchaseHistoryApp *)self isHiddenFromSpringboard],
          v45 != [v5 isHiddenFromSpringboard]))
    {
      *(void *)v141 = 0;
      int v10 = 0;
      int v11 = 0;
      memset(v142, 0, sizeof(v142));
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[24] = 1;
      *(void *)&v141[16] = 0x100000001;
      *(void *)&v141[8] = 0x100000000;
      goto LABEL_24;
    }
    uint64_t v46 = [(ASDPurchaseHistoryApp *)self iconURLString];
    v119 = [v5 iconURLString];
    v120 = (void *)v46;
    HIDWORD(v142[3]) = v46 != (void)v119;
    if ((void *)v46 != v119)
    {
      v47 = [(ASDPurchaseHistoryApp *)self iconURLString];
      v117 = [v5 iconURLString];
      v118 = v47;
      if (![v47 isEqual:v117])
      {
        *(void *)&v141[4] = 0;
        int v10 = 0;
        int v11 = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        memset(v142, 0, 28);
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[12] = 1;
        *(void *)&v141[16] = 0x100000001;
        *(_DWORD *)v141 = 1;
        HIDWORD(v142[3]) = 1;
        goto LABEL_24;
      }
    }
    int v48 = [(ASDPurchaseHistoryApp *)self isArcade];
    if (v48 != [v5 isArcade]
      || (int v49 = [(ASDPurchaseHistoryApp *)self is32BitOnly],
          v49 != [v5 is32BitOnly])
      || (int v50 = [(ASDPurchaseHistoryApp *)self isPreorder],
          v50 != [v5 isPreorder]))
    {
      *(void *)&v141[4] = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v142, 0, 28);
      int v15 = 0;
      int v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[12] = 1;
      *(void *)&v141[16] = 0x100000001;
      *(_DWORD *)v141 = 1;
      goto LABEL_24;
    }
    uint64_t v51 = [(ASDPurchaseHistoryApp *)self longTitle];
    v136 = v5;
    v115 = [v5 longTitle];
    v116 = (void *)v51;
    LODWORD(v142[3]) = v51 != (void)v115;
    if ((void *)v51 != v115)
    {
      v52 = [(ASDPurchaseHistoryApp *)self longTitle];
      v113 = [v5 longTitle];
      v114 = v52;
      if (![v52 isEqual:v113])
      {
        int v10 = 0;
        int v11 = 0;
        int v12 = 0;
        int v13 = 0;
        memset(v142, 0, 24);
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(void *)&v141[16] = 0x100000001;
        *(void *)v141 = 1;
        *(void *)&v141[8] = 0x100000001;
        LODWORD(v142[3]) = 1;
LABEL_99:
        id v5 = v136;
        goto LABEL_24;
      }
    }
    unsigned int v53 = [(ASDPurchaseHistoryApp *)self mediaKind];
    if (v53 != [v136 mediaKind])
    {
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      memset(v142, 0, 24);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[24] = 1;
      *(void *)&v141[16] = 0x100000001;
      *(void *)v141 = 1;
      *(void *)&v141[8] = 0x100000001;
      goto LABEL_99;
    }
    uint64_t v54 = [(ASDPurchaseHistoryApp *)self ovalIconURLString];
    v111 = [v136 ovalIconURLString];
    v112 = (void *)v54;
    HIDWORD(v142[2]) = v54 != (void)v111;
    if ((void *)v54 != v111)
    {
      v55 = [(ASDPurchaseHistoryApp *)self ovalIconURLString];
      v107 = [v136 ovalIconURLString];
      v108 = v55;
      if (![v55 isEqual:v107])
      {
        int v10 = 0;
        int v11 = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        memset(v142, 0, 20);
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(void *)&v141[16] = 0x100000001;
        *(void *)v141 = 0x100000001;
        *(void *)&v141[8] = 0x100000001;
        HIDWORD(v142[2]) = 1;
        goto LABEL_99;
      }
    }
    uint64_t v56 = [(ASDPurchaseHistoryApp *)self preflightPackageURL];
    v109 = [v136 preflightPackageURL];
    v110 = (void *)v56;
    LODWORD(v142[2]) = v56 != (void)v109;
    if ((void *)v56 != v109)
    {
      v57 = [(ASDPurchaseHistoryApp *)self preflightPackageURL];
      v103 = [v136 preflightPackageURL];
      v104 = v57;
      if (![v57 isEqual:v103])
      {
        int v11 = 0;
        v142[0] = 0;
        v142[1] = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[20] = 1;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[12] = 1;
        *(_DWORD *)&v141[16] = 1;
        *(_DWORD *)v141 = 1;
        *(_DWORD *)&v141[4] = 1;
        *(_DWORD *)&v141[8] = 1;
        int v10 = 1;
        LODWORD(v142[2]) = 1;
        goto LABEL_99;
      }
    }
    uint64_t v58 = [(ASDPurchaseHistoryApp *)self productURL];
    v105 = [v136 productURL];
    v106 = (void *)v58;
    HIDWORD(v142[1]) = v58 != (void)v105;
    if ((void *)v58 != v105)
    {
      v59 = [(ASDPurchaseHistoryApp *)self productURL];
      v101 = [v136 productURL];
      v102 = v59;
      if (![v59 isEqual:v101])
      {
        int v12 = 0;
        *(void *)((char *)v142 + 4) = 0;
        int v13 = 0;
        int v14 = 0;
        LODWORD(v142[0]) = 0;
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[20] = 1;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[12] = 1;
        *(_DWORD *)&v141[16] = 1;
        *(_DWORD *)v141 = 1;
        *(_DWORD *)&v141[4] = 1;
        *(_DWORD *)&v141[8] = 1;
        int v10 = 1;
        int v11 = 1;
        HIDWORD(v142[1]) = 1;
        goto LABEL_99;
      }
    }
    int64_t v60 = [(ASDPurchaseHistoryApp *)self purchaserDSID];
    if (v60 != [v136 purchaserDSID])
    {
      int v12 = 0;
      *(void *)((char *)v142 + 4) = 0;
      int v13 = 0;
      int v14 = 0;
      LODWORD(v142[0]) = 0;
      int v15 = 0;
      int v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[20] = 1;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[12] = 1;
      *(_DWORD *)&v141[16] = 1;
      *(_DWORD *)v141 = 1;
      *(_DWORD *)&v141[4] = 1;
      *(_DWORD *)&v141[8] = 1;
      int v10 = 1;
      int v11 = 1;
      goto LABEL_99;
    }
    uint64_t v61 = [(ASDPurchaseHistoryApp *)self redownloadParams];
    v99 = [v136 redownloadParams];
    v100 = (void *)v61;
    LODWORD(v142[1]) = v61 != (void)v99;
    if ((void *)v61 != v99)
    {
      v62 = [(ASDPurchaseHistoryApp *)self redownloadParams];
      v95 = [v136 redownloadParams];
      v96 = v62;
      if (![v62 isEqual:v95])
      {
        int v13 = 0;
        v142[0] = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[20] = 1;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[12] = 1;
        *(_DWORD *)&v141[16] = 1;
        *(_DWORD *)v141 = 1;
        *(_DWORD *)&v141[4] = 1;
        *(_DWORD *)&v141[8] = 1;
        int v10 = 1;
        int v11 = 1;
        int v12 = 1;
        LODWORD(v142[1]) = 1;
        goto LABEL_99;
      }
    }
    uint64_t v63 = [(ASDPurchaseHistoryApp *)self requiredCapabilities];
    v97 = [v136 requiredCapabilities];
    v98 = (void *)v63;
    HIDWORD(v142[0]) = v63 != (void)v97;
    if ((void *)v63 != v97)
    {
      v64 = [(ASDPurchaseHistoryApp *)self requiredCapabilities];
      v91 = [v136 requiredCapabilities];
      v92 = v64;
      if (![v64 isEqual:v91])
      {
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(void *)&v141[16] = 0x100000001;
        *(void *)v141 = 0x100000001;
        *(void *)&v141[8] = 0x100000001;
        int v10 = 1;
        int v11 = 1;
        int v12 = 1;
        int v13 = 1;
        v142[0] = 0x100000000;
        goto LABEL_99;
      }
    }
    uint64_t v65 = [(ASDPurchaseHistoryApp *)self appCapabilities];
    v93 = [v136 appCapabilities];
    v94 = (void *)v65;
    LODWORD(v142[0]) = v65 != (void)v93;
    if ((void *)v65 != v93)
    {
      v66 = [(ASDPurchaseHistoryApp *)self appCapabilities];
      v89 = [v136 appCapabilities];
      v90 = v66;
      if (![v66 isEqual:v89])
      {
        int v15 = 0;
        int v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[20] = 1;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[12] = 1;
        *(_DWORD *)&v141[16] = 1;
        *(_DWORD *)v141 = 1;
        *(_DWORD *)&v141[4] = 1;
        *(_DWORD *)&v141[8] = 1;
        int v10 = 1;
        int v11 = 1;
        int v12 = 1;
        int v13 = 1;
        int v14 = 1;
        LODWORD(v142[0]) = 1;
        goto LABEL_99;
      }
    }
    int v67 = [(ASDPurchaseHistoryApp *)self isCustomBrowserEngineApp];
    if (v67 != [v136 isCustomBrowserEngineApp]
      || (int64_t v68 = -[ASDPurchaseHistoryApp storeItemID](self, "storeItemID"), v68 != [v136 storeItemID])
      || (int v69 = [(ASDPurchaseHistoryApp *)self supportsIPad],
          v69 != [v136 supportsIPad])
      || (int v70 = [(ASDPurchaseHistoryApp *)self supportsIPhone],
          v70 != [v136 supportsIPhone])
      || (int v71 = [(ASDPurchaseHistoryApp *)self supportsMac],
          v71 != [v136 supportsMac])
      || (int v72 = [(ASDPurchaseHistoryApp *)self supportsRealityDevice],
          v72 != [v136 supportsRealityDevice]))
    {
      int v15 = 0;
      int v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[20] = 1;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[12] = 1;
      *(_DWORD *)&v141[16] = 1;
      *(_DWORD *)v141 = 1;
      *(_DWORD *)&v141[4] = 1;
      *(_DWORD *)&v141[8] = 1;
      int v10 = 1;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
      int v14 = 1;
      goto LABEL_99;
    }
    uint64_t v73 = [(ASDPurchaseHistoryApp *)self title];
    v87 = [v136 title];
    v88 = (void *)v73;
    BOOL v85 = v73 != (void)v87;
    if ((void *)v73 == v87
      || ([(ASDPurchaseHistoryApp *)self title],
          v74 = objc_claimAutoreleasedReturnValue(),
          [v136 title],
          v86 = v74,
          uint64_t v84 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v74, "isEqual:")))
    {
      int v75 = [(ASDPurchaseHistoryApp *)self watchAppDeliveredIniOSApp];
      if (v75 == [v136 watchAppDeliveredIniOSApp])
      {
        int v76 = [(ASDPurchaseHistoryApp *)self watchAppRunsIndependently];
        if (v76 == [v136 watchAppRunsIndependently])
        {
          int v77 = [(ASDPurchaseHistoryApp *)self watchOnly];
          if (v77 == [v136 watchOnly])
          {
            int v78 = [(ASDPurchaseHistoryApp *)self supportsLayeredImage];
            if (v78 == [v136 supportsLayeredImage])
            {
              int v79 = [(ASDPurchaseHistoryApp *)self hasP3];
              if (v79 == [v136 hasP3])
              {
                int v80 = [(ASDPurchaseHistoryApp *)self optedInForMacOSEligibility];
                if (v80 == [v136 optedInForMacOSEligibility])
                {
                  int v81 = [(ASDPurchaseHistoryApp *)self optedInForXROSEligibility];
                  if (v81 == [v136 optedInForXROSEligibility])
                  {
                    int v82 = [(ASDPurchaseHistoryApp *)self currentlyOptedInForMacOSEligibility];
                    if (v82 == [v136 currentlyOptedInForMacOSEligibility])
                    {
                      BOOL v83 = [(ASDPurchaseHistoryApp *)self currentlyOptedInForXROSEligibility];
                      id v5 = v136;
                      int v17 = v83 ^ [v136 currentlyOptedInForXROSEligibility] ^ 1;
                      *(_DWORD *)&v141[20] = 1;
                      *(_DWORD *)&v141[24] = 1;
                      *(_DWORD *)&v141[12] = 1;
                      *(_DWORD *)&v141[16] = 1;
                      *(_DWORD *)v141 = 1;
                      *(_DWORD *)&v141[4] = 1;
                      *(_DWORD *)&v141[8] = 1;
                      int v10 = 1;
                      int v11 = 1;
                      int v12 = 1;
                      int v13 = 1;
                      int v14 = 1;
                      int v15 = 1;
                      int v16 = v85;
                      goto LABEL_137;
                    }
                  }
                }
              }
            }
          }
        }
      }
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[20] = 1;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[12] = 1;
      *(_DWORD *)&v141[16] = 1;
      *(_DWORD *)v141 = 1;
      *(_DWORD *)&v141[4] = 1;
      *(_DWORD *)&v141[8] = 1;
      int v10 = 1;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
      int v14 = 1;
      int v15 = 1;
      int v16 = v85;
    }
    else
    {
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[20] = 1;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[12] = 1;
      *(_DWORD *)&v141[16] = 1;
      *(_DWORD *)v141 = 1;
      *(_DWORD *)&v141[4] = 1;
      *(_DWORD *)&v141[8] = 1;
      int v10 = 1;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
      int v14 = 1;
      int v15 = 1;
      int v16 = 1;
    }
    id v5 = v136;
LABEL_137:
    v9 = (void *)v84;
    goto LABEL_24;
  }
  memset(v141, 0, sizeof(v141));
  int v10 = 0;
  int v11 = 0;
  memset(v142, 0, sizeof(v142));
  int v12 = 0;
  int v13 = 0;
  int v14 = 0;
  int v15 = 0;
  int v16 = 0;
  LOBYTE(v17) = 0;
LABEL_24:
  if (v16)
  {
    id v135 = v4;
    id v33 = v5;
    char v34 = v17;
    int v17 = v14;
    int v35 = v13;
    int v36 = v12;
    v37 = v7;
    v38 = v6;
    int v39 = v11;
    int v40 = v10;
    int v41 = v15;

    int v15 = v41;
    int v10 = v40;
    int v11 = v39;
    v6 = v38;
    v7 = v37;
    int v12 = v36;
    int v13 = v35;
    int v14 = v17;
    LOBYTE(v17) = v34;
    id v5 = v33;
    id v4 = v135;
  }
  if (v15)
  {
  }
  if (LODWORD(v142[0]))
  {
  }
  if (v14)
  {
  }
  if (HIDWORD(v142[0]))
  {
  }
  if (v13)
  {
  }
  if (LODWORD(v142[1]))
  {
  }
  if (v12)
  {
  }
  if (HIDWORD(v142[1]))
  {
  }
  if (v11)
  {
  }
  if (LODWORD(v142[2]))
  {
  }
  if (v10)
  {
  }
  if (HIDWORD(v142[2]))
  {
  }
  if (*(_DWORD *)&v141[4])
  {
  }
  if (LODWORD(v142[3]))
  {
  }
  if (*(_DWORD *)&v141[8])
  {
  }
  if (HIDWORD(v142[3]))
  {
  }
  if (*(_DWORD *)v141)
  {
  }
  if (*(_DWORD *)&v141[28])
  {
  }
  if (*(_DWORD *)&v141[12])
  {
  }
  if (*(_DWORD *)&v141[32])
  {
  }
  if (*(_DWORD *)&v141[16])
  {
  }
  if (*(_DWORD *)&v141[36])
  {
  }
  if (*(_DWORD *)&v141[20])
  {
  }
  if (*(_DWORD *)&v141[40])
  {
  }
  if (*(_DWORD *)&v141[24])
  {
  }
  if (v6 != v7)
  {
  }
LABEL_79:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    int v4 = self->_currentlyOptedInForMacOSEligibility << 16;
    if (self->_currentlyOptedInForXROSEligibility) {
      v4 |= 0x200000u;
    }
    unsigned int v5 = v4 | self->_familyShared;
    if (self->_firstParty) {
      v5 |= 2u;
    }
    if (self->_hasMessagesExtension) {
      v5 |= 4u;
    }
    if (self->_hasP3) {
      v5 |= 0x2000u;
    }
    if (self->_hidden) {
      v5 |= 8u;
    }
    if (self->_hiddenFromSpringboard) {
      v5 |= 0x10u;
    }
    if (self->_isArcade) {
      v5 |= 0x2000000u;
    }
    if (self->_is32BitOnly) {
      v5 |= 0x20u;
    }
    if (self->_isPreorder) {
      v5 |= 0x40u;
    }
    if (self->_optedInForMacOSEligibility) {
      v5 |= 0x4000u;
    }
    if (self->_optedInForXROSEligibility) {
      v5 |= 0x400000u;
    }
    if (self->_requiresRosetta) {
      v5 |= 0x80000u;
    }
    if (self->_runsOnAppleSilicon) {
      v5 |= 0x40000u;
    }
    if (self->_runsOnIntel) {
      v5 |= 0x20000u;
    }
    if (self->_supportsIPad) {
      v5 |= 0x80u;
    }
    if (self->_supportsIPhone) {
      v5 |= 0x100u;
    }
    if (self->_supportsLayeredImage) {
      v5 |= 0x1000u;
    }
    if (self->_supportsMac) {
      v5 |= 0x8000u;
    }
    if (self->_supportsRealityDevice) {
      v5 |= 0x800000u;
    }
    if (self->_watchAppDeliveredIniOSApp) {
      v5 |= 0x200u;
    }
    if (self->_watchAppRunsIndependently) {
      v5 |= 0x400u;
    }
    if (self->_watchOnly) {
      v5 |= 0x800u;
    }
    if (self->_customBrowserEngineApp) {
      uint64_t v6 = v5 | 0x1000000;
    }
    else {
      uint64_t v6 = v5;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  [v7 encodeInt32:v6 forKey:@"A"];
  [v7 encodeObject:self->_bundleID forKey:@"B"];
  [v7 encodeObject:self->_circularIconURLString forKey:@"T"];
  [v7 encodeInteger:self->_contentRatingFlags forKey:@"C"];
  [v7 encodeObject:self->_datePurchased forKey:@"D"];
  [v7 encodeObject:self->_developerName forKey:@"E"];
  [v7 encodeObject:self->_iconURLString forKey:@"F"];
  [v7 encodeObject:self->_longTitle forKey:@"G"];
  [v7 encodeInt32:self->_mediaKind forKey:@"U"];
  [v7 encodeObject:self->_ovalIconURLString forKey:@"H"];
  [v7 encodeObject:self->_preflightPackageURL forKey:@"I"];
  [v7 encodeInt64:self->_purchaserDSID forKey:@"J"];
  [v7 encodeObject:self->_redownloadParams forKey:@"K"];
  [v7 encodeObject:self->_requiredCapabilities forKey:@"L"];
  [v7 encodeInt64:self->_storeItemID forKey:@"M"];
  [v7 encodeInt32:self->_purchaseToken forKey:@"N"];
  [v7 encodeInt64:self->_lockerItemID forKey:@"O"];
  [v7 encodeObject:self->_productURL forKey:@"P"];
  [v7 encodeInt64:self->_genreID forKey:@"Q"];
  [v7 encodeObject:self->_genreName forKey:@"R"];
  [v7 encodeObject:self->_title forKey:@"S"];
  [v7 encodeObject:self->_appCapabilities forKey:@"Z"];
}

- (ASDPurchaseHistoryApp)initWithCoder:(id)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ASDPurchaseHistoryApp;
  unsigned int v5 = [(ASDPurchaseHistoryApp *)&v42 init];
  if (v5)
  {
    unsigned int v6 = [v4 decodeInt32ForKey:@"A"];
    v5[8] = v6 & 1;
    v5[9] = (v6 & 2) != 0;
    v5[10] = (v6 & 4) != 0;
    v5[11] = (v6 & 0x2000) != 0;
    v5[12] = (v6 & 8) != 0;
    v5[13] = (v6 & 0x10) != 0;
    v5[15] = (v6 & 0x2000000) != 0;
    v5[16] = (v6 & 0x20) != 0;
    v5[17] = (v6 & 0x40) != 0;
    uint32x4_t v7 = (uint32x4_t)vdupq_n_s32(v6);
    int16x8_t v8 = (int16x8_t)vshlq_u32(v7, (uint32x4_t)xmmword_19BFFAE70);
    *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v8), (int8x8_t)0x1000100010001);
    *(_DWORD *)(v5 + 18) = vmovn_s16(v8).u32[0];
    v5[23] = (v6 & 0x80000) != 0;
    v5[25] = (v6 & 0x40000) != 0;
    v5[24] = (v6 & 0x20000) != 0;
    v5[26] = (v6 & 0x80) != 0;
    int16x8_t v9 = (int16x8_t)vshlq_u32(v7, (uint32x4_t)xmmword_19BFFAE80);
    *(int8x8_t *)v9.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v9), (int8x8_t)0x1000100010001);
    *(_DWORD *)(v5 + 27) = vmovn_s16(v9).u32[0];
    v5[31] = (v6 & 0x200) != 0;
    v5[32] = (v6 & 0x400) != 0;
    v5[33] = (v6 & 0x800) != 0;
    v5[14] = HIBYTE(v6) & 1;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"B"];
    int v11 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"T"];
    int v13 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v12;

    *((void *)v5 + 9) = [v4 decodeIntegerForKey:@"C"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"D"];
    int v15 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"E"];
    int v17 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"F"];
    BOOL v19 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"G"];
    int64_t v21 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v20;

    *((_DWORD *)v5 + 9) = [v4 decodeInt32ForKey:@"U"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"H"];
    v23 = (void *)*((void *)v5 + 17);
    *((void *)v5 + 17) = v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"I"];
    BOOL v25 = (void *)*((void *)v5 + 18);
    *((void *)v5 + 18) = v24;

    *((void *)v5 + 20) = [v4 decodeInt64ForKey:@"J"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"K"];
    int v27 = (void *)*((void *)v5 + 21);
    *((void *)v5 + 21) = v26;

    int v28 = (void *)MEMORY[0x1E4F1CAD0];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    int64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    uint64_t v30 = [v28 setWithArray:v29];
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"L"];
    v32 = (void *)*((void *)v5 + 22);
    *((void *)v5 + 22) = v31;

    *((void *)v5 + 23) = [v4 decodeInt64ForKey:@"M"];
    *((_DWORD *)v5 + 10) = [v4 decodeInt32ForKey:@"N"];
    *((void *)v5 + 25) = [v4 decodeInt64ForKey:@"O"];
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"P"];
    char v34 = (void *)*((void *)v5 + 19);
    *((void *)v5 + 19) = v33;

    *((void *)v5 + 12) = [v4 decodeInt64ForKey:@"Q"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"R"];
    int v36 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"S"];
    v38 = (void *)*((void *)v5 + 24);
    *((void *)v5 + 24) = v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Z"];
    int v40 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v39;
  }
  return (ASDPurchaseHistoryApp *)v5;
}

- (BOOL)hasAnyMacOSCompatibleIOSVersion
{
  return self->_optedInForMacOSEligibility;
}

- (NSArray)appCapabilities
{
  return self->_appCapabilities;
}

- (void)setAppCapabilities:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)circularIconURLString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCircularIconURLString:(id)a3
{
}

- (int64_t)contentRatingFlags
{
  return self->_contentRatingFlags;
}

- (void)setContentRatingFlags:(int64_t)a3
{
  self->_contentRatingFlags = a3;
}

- (NSDate)datePurchased
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDatePurchased:(id)a3
{
}

- (NSString)developerName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeveloperName:(id)a3
{
}

- (BOOL)isFamilyShared
{
  return self->_familyShared;
}

- (void)setFamilyShared:(BOOL)a3
{
  self->_familyShared = a3;
}

- (BOOL)isFirstParty
{
  return self->_firstParty;
}

- (void)setFirstParty:(BOOL)a3
{
  self->_firstParty = a3;
}

- (int64_t)genreID
{
  return self->_genreID;
}

- (void)setGenreID:(int64_t)a3
{
  self->_genreID = a3;
}

- (NSString)genreName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setGenreName:(id)a3
{
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  self->_hasMessagesExtension = a3;
}

- (BOOL)hasP3
{
  return self->_hasP3;
}

- (void)setHasP3:(BOOL)a3
{
  self->_hasP3 = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isHiddenFromSpringboard
{
  return self->_hiddenFromSpringboard;
}

- (void)setHiddenFromSpringboard:(BOOL)a3
{
  self->_hiddenFromSpringboard = a3;
}

- (BOOL)isCustomBrowserEngineApp
{
  return self->_customBrowserEngineApp;
}

- (void)setCustomBrowserEngineApp:(BOOL)a3
{
  self->_customBrowserEngineApp = a3;
}

- (NSString)iconURLString
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIconURLString:(id)a3
{
}

- (BOOL)isArcade
{
  return self->_isArcade;
}

- (void)setIsArcade:(BOOL)a3
{
  self->_isArcade = a3;
}

- (BOOL)is32BitOnly
{
  return self->_is32BitOnly;
}

- (void)setIs32BitOnly:(BOOL)a3
{
  self->_is32BitOnly = a3;
}

- (BOOL)isPreorder
{
  return self->_isPreorder;
}

- (void)setIsPreorder:(BOOL)a3
{
  self->_isPreorder = a3;
}

- (BOOL)currentlyOptedInForMacOSEligibility
{
  return self->_currentlyOptedInForMacOSEligibility;
}

- (void)setCurrentlyOptedInForMacOSEligibility:(BOOL)a3
{
  self->_currentlyOptedInForMacOSEligibility = a3;
}

- (BOOL)currentlyOptedInForXROSEligibility
{
  return self->_currentlyOptedInForXROSEligibility;
}

- (void)setCurrentlyOptedInForXROSEligibility:(BOOL)a3
{
  self->_currentlyOptedInForXROSEligibility = a3;
}

- (BOOL)optedInForMacOSEligibility
{
  return self->_optedInForMacOSEligibility;
}

- (void)setOptedInForMacOSEligibility:(BOOL)a3
{
  self->_optedInForMacOSEligibility = a3;
}

- (BOOL)optedInForXROSEligibility
{
  return self->_optedInForXROSEligibility;
}

- (void)setOptedInForXROSEligibility:(BOOL)a3
{
  self->_optedInForXROSEligibility = a3;
}

- (BOOL)isVerifiedForMacOS
{
  return self->_isVerifiedForMacOS;
}

- (void)setIsVerifiedForMacOS:(BOOL)a3
{
  self->_isVerifiedForMacOS = a3;
}

- (NSString)longTitle
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLongTitle:(id)a3
{
}

- (NSArray)macAppRequiredCapabilities
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMacAppRequiredCapabilities:(id)a3
{
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

- (void)setMediaKind:(unsigned int)a3
{
  self->_mediaKind = a3;
}

- (BOOL)requiresRosetta
{
  return self->_requiresRosetta;
}

- (void)setRequiresRosetta:(BOOL)a3
{
  self->_requiresRosetta = a3;
}

- (BOOL)runsOnIntel
{
  return self->_runsOnIntel;
}

- (void)setRunsOnIntel:(BOOL)a3
{
  self->_runsOnIntel = a3;
}

- (BOOL)runsOnAppleSilicon
{
  return self->_runsOnAppleSilicon;
}

- (void)setRunsOnAppleSilicon:(BOOL)a3
{
  self->_runsOnAppleSilicon = a3;
}

- (NSString)ovalIconURLString
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setOvalIconURLString:(id)a3
{
}

- (NSURL)preflightPackageURL
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPreflightPackageURL:(id)a3
{
}

- (NSURL)productURL
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (void)setProductURL:(id)a3
{
}

- (int64_t)purchaserDSID
{
  return self->_purchaserDSID;
}

- (void)setPurchaserDSID:(int64_t)a3
{
  self->_purchaserDSID = a3;
}

- (NSString)redownloadParams
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRedownloadParams:(id)a3
{
}

- (NSArray)requiredCapabilities
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (int64_t)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(int64_t)a3
{
  self->_storeItemID = a3;
}

- (BOOL)supportsIPad
{
  return self->_supportsIPad;
}

- (void)setSupportsIPad:(BOOL)a3
{
  self->_supportsIPad = a3;
}

- (BOOL)supportsIPhone
{
  return self->_supportsIPhone;
}

- (void)setSupportsIPhone:(BOOL)a3
{
  self->_supportsIPhone = a3;
}

- (BOOL)supportsLayeredImage
{
  return self->_supportsLayeredImage;
}

- (void)setSupportsLayeredImage:(BOOL)a3
{
  self->_supportsLayeredImage = a3;
}

- (BOOL)supportsMac
{
  return self->_supportsMac;
}

- (void)setSupportsMac:(BOOL)a3
{
  self->_supportsMac = a3;
}

- (BOOL)supportsRealityDevice
{
  return self->_supportsRealityDevice;
}

- (void)setSupportsRealityDevice:(BOOL)a3
{
  self->_supportsRealityDevice = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setTitle:(id)a3
{
}

- (BOOL)watchAppDeliveredIniOSApp
{
  return self->_watchAppDeliveredIniOSApp;
}

- (void)setWatchAppDeliveredIniOSApp:(BOOL)a3
{
  self->_watchAppDeliveredIniOSApp = a3;
}

- (BOOL)watchAppRunsIndependently
{
  return self->_watchAppRunsIndependently;
}

- (void)setWatchAppRunsIndependently:(BOOL)a3
{
  self->_watchAppRunsIndependently = a3;
}

- (BOOL)watchOnly
{
  return self->_watchOnly;
}

- (void)setWatchOnly:(BOOL)a3
{
  self->_watchOnly = a3;
}

- (unsigned)purchaseToken
{
  return self->_purchaseToken;
}

- (void)setPurchaseToken:(unsigned int)a3
{
  self->_purchaseToken = a3;
}

- (unint64_t)lockerItemID
{
  return self->_lockerItemID;
}

- (void)setLockerItemID:(unint64_t)a3
{
  self->_lockerItemID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_redownloadParams, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_preflightPackageURL, 0);
  objc_storeStrong((id *)&self->_ovalIconURLString, 0);
  objc_storeStrong((id *)&self->_macAppRequiredCapabilities, 0);
  objc_storeStrong((id *)&self->_longTitle, 0);
  objc_storeStrong((id *)&self->_iconURLString, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_developerName, 0);
  objc_storeStrong((id *)&self->_datePurchased, 0);
  objc_storeStrong((id *)&self->_circularIconURLString, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appCapabilities, 0);
}

@end