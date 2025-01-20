@interface FedStatsCohortFactory
+ (id)cohortQueryFieldByName:(id)a3;
+ (id)sharedInstance;
- (FedStatsCohortFactory)init;
- (NSDictionary)cohortObjects;
@end

@implementation FedStatsCohortFactory

- (FedStatsCohortFactory)init
{
  v93[85] = *MEMORY[0x263EF8340];
  v91.receiver = self;
  v91.super_class = (Class)FedStatsCohortFactory;
  result = [(FedStatsCohortFactory *)&v91 init];
  if (result)
  {
    v92[0] = @"locale";
    v90 = result;
    v89 = +[FedStatsCohortQueryLocale cohortInstance];
    v93[0] = v89;
    v92[1] = @"deviceType";
    v88 = +[FedStatsCohortQueryDeviceType cohortInstance];
    v93[1] = v88;
    v92[2] = @"numOfMediaApps";
    v87 = +[FedStatsCohortQueryInstalledApps cohortInstance];
    v93[2] = v87;
    v92[3] = @"numOfPhoneApps";
    v86 = +[FedStatsCohortQueryInstalledApps cohortInstance];
    v93[3] = v86;
    v92[4] = @"bundleID";
    v85 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[4] = v85;
    v92[5] = @"sessionType";
    v84 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[5] = v84;
    v92[6] = @"sessionState";
    v83 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[6] = v83;
    v92[7] = @"supportsBackgrounding";
    v82 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[7] = v82;
    v92[8] = @"supportsStateRestoration";
    v81 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[8] = v81;
    v92[9] = @"eventName";
    v80 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[9] = v80;
    v92[10] = @"measure";
    v79 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[10] = v79;
    v92[11] = @"extra";
    v78 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[11] = v78;
    v92[12] = @"issuer";
    v77 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[12] = v77;
    v92[13] = @"dayOfWeek";
    v76 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[13] = v76;
    v92[14] = @"hourOfDay";
    v75 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[14] = v75;
    v92[15] = @"geohash";
    v74 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[15] = v74;
    v92[16] = @"country";
    v73 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[16] = v73;
    v92[17] = @"timeZone";
    v72 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[17] = v72;
    v92[18] = @"interfaceType";
    v71 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[18] = v71;
    v92[19] = @"radioType";
    v70 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[19] = v70;
    v92[20] = @"radioBand";
    v69 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[20] = v69;
    v92[21] = @"addressFamily";
    v68 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[21] = v68;
    v92[22] = @"lang";
    v67 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[22] = v67;
    v92[23] = @"platform";
    v66 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[23] = v66;
    v92[24] = @"performanceEvent";
    v65 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[24] = v65;
    v92[25] = @"signal";
    v64 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[25] = v64;
    v92[26] = @"userAgent";
    v63 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[26] = v63;
    v92[27] = @"countryCode";
    v62 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[27] = v62;
    v92[28] = @"error";
    v61 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[28] = v61;
    v92[29] = @"localeIdentifier";
    v60 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[29] = v60;
    v92[30] = @"contentType";
    v59 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[30] = v59;
    v92[31] = @"ageGroup";
    v58 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[31] = v58;
    v92[32] = @"eventDirection";
    v57 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[32] = v57;
    v92[33] = @"isNativeArchitecture";
    v56 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[33] = v56;
    v92[34] = @"dyldPlatform";
    v55 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[34] = v55;
    v92[35] = @"type";
    v54 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[35] = v54;
    v92[36] = @"screenDistance";
    v53 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[36] = v53;
    v92[37] = @"action";
    v52 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[37] = v52;
    v92[38] = @"gestureAssessment";
    v51 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[38] = v51;
    v92[39] = @"livenessAssessment";
    v50 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[39] = v50;
    v92[40] = @"passiveGestureAssessment";
    v49 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[40] = v49;
    v92[41] = @"passiveLivenessAssessment";
    v48 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[41] = v48;
    v92[42] = @"property";
    v47 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[42] = v47;
    v92[43] = @"accessedPropertyDirectly";
    v46 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[43] = v46;
    v92[44] = @"geohash1";
    v45 = +[FedStatsCohortGeohash cohortInstanceWithPrecision:1];
    v93[44] = v45;
    v92[45] = @"geohash2";
    v44 = +[FedStatsCohortGeohash cohortInstanceWithPrecision:2];
    v93[45] = v44;
    v92[46] = @"geohash3";
    v43 = +[FedStatsCohortGeohash cohortInstanceWithPrecision:3];
    v93[46] = v43;
    v92[47] = @"geohash4";
    v42 = +[FedStatsCohortGeohash cohortInstanceWithPrecision:4];
    v93[47] = v42;
    v92[48] = @"suggestionType";
    v41 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[48] = v41;
    v92[49] = @"footprint";
    v40 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[49] = v40;
    v92[50] = @"pageCount";
    v39 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[50] = v39;
    v92[51] = @"bitsOfURL";
    v38 = +[FedStatsCohortQueryURLBits cohortQueryFieldWithKey:](FedStatsCohortQueryURLBits, "cohortQueryFieldWithKey:");
    v93[51] = v38;
    v92[52] = @"protocol";
    v37 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[52] = v37;
    v92[53] = @"MCC";
    v36 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[53] = v36;
    v92[54] = @"MNC";
    v35 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[54] = v35;
    v92[55] = @"matchedEmNumSource";
    v34 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[55] = v34;
    v92[56] = @"sip380Procedure";
    v33 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[56] = v33;
    v92[57] = @"sip380RedirectedURN";
    v32 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[57] = v32;
    v92[58] = @"category";
    v31 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[58] = v31;
    v92[59] = @"previous";
    v30 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[59] = v30;
    v92[60] = @"scope";
    v29 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[60] = v29;
    v92[61] = @"language";
    v28 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[61] = v28;
    v92[62] = @"memoryGenerated";
    v27 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[62] = v27;
    v92[63] = @"memoryShared";
    v26 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[63] = v26;
    v92[64] = @"memoryWatched";
    v25 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[64] = v25;
    v92[65] = @"focusRegionType";
    v24 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[65] = v24;
    v92[66] = @"styleSelectionType";
    v23 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[66] = v23;
    v92[67] = @"userLibraryAgeInDays";
    v22 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[67] = v22;
    v92[68] = @"cardShownOrEngaged";
    v21 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[68] = v21;
    v92[69] = @"advertisedItemID";
    v20 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[69] = v20;
    v92[70] = @"conversionType";
    v19 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[70] = v19;
    v92[71] = @"adNetworkID";
    v18 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[71] = v18;
    v92[72] = @"publisherItemID";
    v17 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[72] = v17;
    v92[73] = @"marketplaceID";
    v16 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[73] = v16;
    v92[74] = @"storefrontID";
    v15 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[74] = v15;
    v92[75] = @"sourceDomain";
    v3 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[75] = v3;
    v92[76] = @"inAppPurchaseType";
    v4 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[76] = v4;
    v92[77] = @"currencyCode";
    v5 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[77] = v5;
    v92[78] = @"inAppPurchaseSubscriptionISO8601Duration";
    v6 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[78] = v6;
    v92[79] = @"tokenLength";
    v7 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[79] = v7;
    v92[80] = @"usage";
    v8 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[80] = v8;
    v92[81] = @"userInterfaceLanguage";
    v9 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[81] = v9;
    v92[82] = @"userSetRegionFormat";
    v10 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[82] = v10;
    v92[83] = @"result";
    v11 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[83] = v11;
    v92[84] = @"feature";
    v12 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v93[84] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:85];
    cohortObjects = v90->_cohortObjects;
    v90->_cohortObjects = (NSDictionary *)v13;

    return v90;
  }
  return result;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__FedStatsCohortFactory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __39__FedStatsCohortFactory_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

+ (id)cohortQueryFieldByName:(id)a3
{
  id v3 = a3;
  v4 = +[FedStatsCohortFactory sharedInstance];
  v5 = [v4 cohortObjects];
  v6 = [v5 objectForKey:v3];

  return v6;
}

- (NSDictionary)cohortObjects
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end