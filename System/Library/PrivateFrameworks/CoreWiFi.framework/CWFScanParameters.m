@interface CWFScanParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)cacheOnly;
- (BOOL)exclude6GChannels;
- (BOOL)includeBackgroundScanCacheResults;
- (BOOL)includeBeaconCacheResults;
- (BOOL)includeHiddenNetworks;
- (BOOL)includeMatchingKnownNetworkProfiles;
- (BOOL)invalidPredicate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScanParameters:(id)a3;
- (BOOL)mergeScanResults;
- (CWFScanParameters)initWithCoder:(id)a3;
- (NSArray)ANQPElementIDListForPasspointScanResults;
- (NSArray)SSIDList;
- (NSArray)channels;
- (NSArray)includeScanResults;
- (NSPredicate)filterPredicate;
- (NSSet)includeProperties;
- (NSString)BSSID;
- (NSString)SSID;
- (NSString)matchNetworkNamePrefix;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)BSSType;
- (int)PHYMode;
- (int)scanFlags;
- (int)scanType;
- (int64_t)minimumRSSI;
- (unint64_t)acceptableANQPCacheAgeForPasspointScanResults;
- (unint64_t)acceptableCacheAge;
- (unint64_t)dwellTime;
- (unint64_t)hash;
- (unint64_t)maximumANQPAgeForPasspointScanResults;
- (unint64_t)maximumANQPCacheAgeForPasspointScanResults;
- (unint64_t)maximumAge;
- (unint64_t)maximumCacheAge;
- (unint64_t)minimumTimestamp;
- (unint64_t)numberOfScans;
- (unint64_t)restTime;
- (unint64_t)shortSSID;
- (void)encodeWithCoder:(id)a3;
- (void)setANQPElementIDListForPasspointScanResults:(id)a3;
- (void)setAcceptableANQPCacheAgeForPasspointScanResults:(unint64_t)a3;
- (void)setAcceptableCacheAge:(unint64_t)a3;
- (void)setBSSID:(id)a3;
- (void)setBSSType:(int)a3;
- (void)setCacheOnly:(BOOL)a3;
- (void)setChannels:(id)a3;
- (void)setDwellTime:(unint64_t)a3;
- (void)setExclude6GChannels:(BOOL)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setIncludeBackgroundScanCacheResults:(BOOL)a3;
- (void)setIncludeBeaconCacheResults:(BOOL)a3;
- (void)setIncludeHiddenNetworks:(BOOL)a3;
- (void)setIncludeMatchingKnownNetworkProfiles:(BOOL)a3;
- (void)setIncludeProperties:(id)a3;
- (void)setIncludeScanResults:(id)a3;
- (void)setInvalidPredicate:(BOOL)a3;
- (void)setMatchNetworkNamePrefix:(id)a3;
- (void)setMaximumANQPAgeForPasspointScanResults:(unint64_t)a3;
- (void)setMaximumANQPCacheAgeForPasspointScanResults:(unint64_t)a3;
- (void)setMaximumAge:(unint64_t)a3;
- (void)setMaximumCacheAge:(unint64_t)a3;
- (void)setMergeScanResults:(BOOL)a3;
- (void)setMinimumRSSI:(int64_t)a3;
- (void)setMinimumTimestamp:(unint64_t)a3;
- (void)setNumberOfScans:(unint64_t)a3;
- (void)setPHYMode:(int)a3;
- (void)setRestTime:(unint64_t)a3;
- (void)setSSID:(id)a3;
- (void)setSSIDList:(id)a3;
- (void)setScanFlags:(int)a3;
- (void)setScanType:(int)a3;
- (void)setShortSSID:(unint64_t)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation CWFScanParameters

- (unint64_t)maximumCacheAge
{
  return self->_acceptableCacheAge / 0x3E8;
}

- (void)setMaximumCacheAge:(unint64_t)a3
{
  self->_acceptableCacheAge = 1000 * a3;
}

- (BOOL)cacheOnly
{
  return self->_acceptableCacheAge == -1;
}

- (void)setCacheOnly:(BOOL)a3
{
  self->_acceptableCacheAge = a3 << 63 >> 63;
}

- (unint64_t)maximumANQPCacheAgeForPasspointScanResults
{
  return self->_acceptableANQPCacheAgeForPasspointScanResults / 0x3E8;
}

- (void)setMaximumANQPCacheAgeForPasspointScanResults:(unint64_t)a3
{
  self->_acceptableANQPCacheAgeForPasspointScanResults = 1000 * a3;
}

- (id)description
{
  v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  objc_msgSend_appendFormat_(v6, v7, @"channels=%@, ", v8, v9, self->_channels);
  v14 = objc_msgSend_redactedForWiFi(self->_SSID, v10, v11, v12, v13);
  objc_msgSend_appendFormat_(v6, v15, @"SSID=%@, ", v16, v17, v14);

  v22 = objc_msgSend_redactedForWiFi(self->_BSSID, v18, v19, v20, v21);
  objc_msgSend_appendFormat_(v6, v23, @"BSSID=%@, ", v24, v25, v22);

  objc_msgSend_appendFormat_(v6, v26, @"shortSSID=%lu, ", v27, v28, self->_shortSSID);
  v32 = objc_msgSend_componentsJoinedByString_(self->_SSIDList, v29, @", ", v30, v31);
  v37 = objc_msgSend_redactedForWiFi(v32, v33, v34, v35, v36);
  objc_msgSend_appendFormat_(v6, v38, @"SSIDList=[%@], ", v39, v40, v37);

  objc_msgSend_appendFormat_(v6, v41, @"numberOfScans=%lu, ", v42, v43, self->_numberOfScans);
  objc_msgSend_appendFormat_(v6, v44, @"restTime=%lu, ", v45, v46, self->_restTime);
  objc_msgSend_appendFormat_(v6, v47, @"dwellTime=%lu, ", v48, v49, self->_dwellTime);
  objc_msgSend_appendFormat_(v6, v50, @"acceptableCacheAge=%lu, ", v51, v52, self->_acceptableCacheAge);
  objc_msgSend_appendFormat_(v6, v53, @"BSSType=%u, ", v54, v55, self->_BSSType);
  objc_msgSend_appendFormat_(v6, v56, @"PHYMode=%u, ", v57, v58, self->_PHYMode);
  objc_msgSend_appendFormat_(v6, v59, @"scanType=%u, ", v60, v61, self->_scanType);
  objc_msgSend_appendFormat_(v6, v62, @"minRSSI=%ld, ", v63, v64, self->_minimumRSSI);
  objc_msgSend_appendFormat_(v6, v65, @"maxAge=%lu, ", v66, v67, self->_maximumAge);
  objc_msgSend_appendFormat_(v6, v68, @"minTimestamp=%llu, ", v69, v70, self->_minimumTimestamp);
  objc_msgSend_appendFormat_(v6, v71, @"scanFlags=0x%x, ", v72, v73, self->_scanFlags);
  objc_msgSend_appendFormat_(v6, v74, @"merge=%d, ", v75, v76, self->_mergeScanResults);
  objc_msgSend_appendFormat_(v6, v77, @"includeHidden=%d, ", v78, v79, self->_includeHiddenNetworks);
  objc_msgSend_appendFormat_(v6, v80, @"includeProperties=%@, ", v81, v82, self->_includeProperties);
  objc_msgSend_appendFormat_(v6, v83, @"includeScanResults=%@, ", v84, v85, self->_includeScanResults);
  objc_msgSend_appendFormat_(v6, v86, @"includeMatchingKnownNetworks=%d, ", v87, v88, self->_includeMatchingKnownNetworkProfiles);
  objc_msgSend_appendFormat_(v6, v89, @"ANQPElementIDList=%@, ", v90, v91, self->_ANQPElementIDListForPasspointScanResults);
  objc_msgSend_appendFormat_(v6, v92, @"acceptableANQPCacheAge=%lu, ", v93, v94, self->_acceptableANQPCacheAgeForPasspointScanResults);
  objc_msgSend_appendFormat_(v6, v95, @"maxANQPAge=%lu, ", v96, v97, self->_maximumANQPAgeForPasspointScanResults);
  objc_msgSend_appendFormat_(v6, v98, @"exclude6GChannels=%d, ", v99, v100, self->_exclude6GChannels);
  objc_msgSend_appendFormat_(v6, v101, @"matchNetworkNamePrefix=%@, ", v102, v103, self->_matchNetworkNamePrefix);
  objc_msgSend_appendFormat_(v6, v104, @"filterPredicate=%@, ", v105, v106, self->_filterPredicate);
  objc_msgSend_appendFormat_(v6, v107, @"includeBeaconCache=%d, ", v108, v109, self->_includeBeaconCacheResults);
  objc_msgSend_appendFormat_(v6, v110, @"includeBackgroundCache=%d", v111, v112, self->_includeBackgroundScanCacheResults);
  return v6;
}

- (BOOL)isEqualToScanParameters:(id)a3
{
  id v5 = a3;
  channels = self->_channels;
  objc_msgSend_channels(v5, v7, v8, v9, v10);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (channels != v15)
  {
    if (!self->_channels
      || (objc_msgSend_channels(v5, v11, v12, v13, v14), (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v26 = 0;
      goto LABEL_67;
    }
    uint64_t v3 = (void *)v16;
    uint64_t v21 = self->_channels;
    v22 = objc_msgSend_channels(v5, v17, v18, v19, v20);
    if (!objc_msgSend_isEqual_(v21, v23, (uint64_t)v22, v24, v25))
    {
      BOOL v26 = 0;
LABEL_66:

      goto LABEL_67;
    }
    v284 = v22;
  }
  SSID = self->_SSID;
  objc_msgSend_SSID(v5, v11, v12, v13, v14);
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (SSID != v32)
  {
    if (!self->_SSID)
    {
      BOOL v26 = 0;
      goto LABEL_65;
    }
    uint64_t v33 = objc_msgSend_SSID(v5, v28, v29, v30, v31);
    if (!v33) {
      goto LABEL_31;
    }
    v38 = (void *)v33;
    uint64_t v39 = self->_SSID;
    uint64_t v40 = objc_msgSend_SSID(v5, v34, v35, v36, v37);
    v41 = v39;
    uint64_t v42 = (void *)v40;
    if ((objc_msgSend_isEqual_(v41, v43, v40, v44, v45) & 1) == 0)
    {

LABEL_31:
LABEL_32:
      BOOL v26 = 0;
      goto LABEL_33;
    }
    v282 = v42;
    v283 = v38;
  }
  BSSID = self->_BSSID;
  objc_msgSend_BSSID(v5, v28, v29, v30, v31);
  uint64_t v51 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (BSSID == v51)
  {
    unint64_t shortSSID = self->_shortSSID;
    if (shortSSID == objc_msgSend_shortSSID(v5, v47, v48, v49, v50))
    {
LABEL_21:
      SSIDList = self->_SSIDList;
      objc_msgSend_SSIDList(v5, v69, v70, v71, v72);
      uint64_t v75 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (SSIDList != v75)
      {
        if (!self->_SSIDList)
        {
          BOOL v26 = 0;
          goto LABEL_61;
        }
        v280 = v75;
        uint64_t v80 = objc_msgSend_SSIDList(v5, v76, v77, v78, v79);
        if (v80)
        {
          v277 = (void *)v80;
          v278 = SSIDList;
          uint64_t v85 = self->_SSIDList;
          uint64_t v86 = objc_msgSend_SSIDList(v5, v81, v82, v83, v84);
          uint64_t v87 = v85;
          uint64_t v88 = (void *)v86;
          if (objc_msgSend_isEqual_(v87, v89, v86, v90, v91))
          {
            v276 = v88;
LABEL_37:
            unint64_t numberOfScans = self->_numberOfScans;
            if (numberOfScans != objc_msgSend_numberOfScans(v5, v76, v77, v78, v79)) {
              goto LABEL_57;
            }
            unint64_t restTime = self->_restTime;
            if (restTime != objc_msgSend_restTime(v5, v93, v94, v95, v96)) {
              goto LABEL_57;
            }
            unint64_t dwellTime = self->_dwellTime;
            if (dwellTime != objc_msgSend_dwellTime(v5, v98, v99, v100, v101)) {
              goto LABEL_57;
            }
            unint64_t acceptableCacheAge = self->_acceptableCacheAge;
            if (acceptableCacheAge != objc_msgSend_acceptableCacheAge(v5, v103, v104, v105, v106)) {
              goto LABEL_57;
            }
            int BSSType = self->_BSSType;
            if (BSSType != objc_msgSend_BSSType(v5, v108, v109, v110, v111)) {
              goto LABEL_57;
            }
            int PHYMode = self->_PHYMode;
            if (PHYMode != objc_msgSend_PHYMode(v5, v113, v114, v115, v116)
              || (int scanType = self->_scanType, scanType != objc_msgSend_scanType(v5, v118, v119, v120, v121))|| (minimumRSSI = self->_minimumRSSI, minimumRSSI != objc_msgSend_minimumRSSI(v5, v123, v124, v125, v126))|| (maximumAge = self->_maximumAge, maximumAge != objc_msgSend_maximumAge(v5, v128, v129, v130, v131))|| (minimumTimestamp = self->_minimumTimestamp, minimumTimestamp != objc_msgSend_minimumTimestamp(v5, v133, v134, v135, v136))|| (mergeScanResults = self->_mergeScanResults, mergeScanResults != objc_msgSend_mergeScanResults(v5, v138, v139, v140, v141))|| (includeHiddenNetworks = self->_includeHiddenNetworks, includeHiddenNetworks != objc_msgSend_includeHiddenNetworks(v5, v143, v144, v145, v146))|| (scanFlags = self->_scanFlags, scanFlags != objc_msgSend_scanFlags(v5, v148, v149, v150, v151)))
            {
LABEL_57:
              BOOL v171 = 0;
              BOOL v26 = 0;
              goto LABEL_58;
            }
            includeProperties = self->_includeProperties;
            objc_msgSend_includeProperties(v5, v153, v154, v155, v156);
            v274 = includeProperties;
            v275 = (NSSet *)objc_claimAutoreleasedReturnValue();
            if (includeProperties != v275)
            {
              if (!self->_includeProperties)
              {
                BOOL v171 = 0;
LABEL_113:

                BOOL v26 = v171;
LABEL_58:
                uint64_t v75 = v280;
                if (v278 != v280)
                {

                  uint64_t v75 = v280;
                  BOOL v26 = v171;
                }
LABEL_61:

                if (BSSID == v51) {
                  goto LABEL_63;
                }
                goto LABEL_62;
              }
              v272 = objc_msgSend_includeProperties(v5, v158, v159, v160, v161);
              if (!v272) {
                goto LABEL_55;
              }
              v166 = self->_includeProperties;
              v270 = objc_msgSend_includeProperties(v5, v162, v163, v164, v165);
              if ((objc_msgSend_isEqual_(v166, v167, (uint64_t)v270, v168, v169) & 1) == 0)
              {

LABEL_55:
                if (v278 == v280)
                {
                  v170 = v278;
                  goto LABEL_121;
                }
                goto LABEL_119;
              }
            }
            includeScanResults = self->_includeScanResults;
            objc_msgSend_includeScanResults(v5, v158, v159, v160, v161);
            v273 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v271 = includeScanResults;
            if (includeScanResults != v273)
            {
              if (!self->_includeScanResults)
              {
                BOOL v171 = 0;
LABEL_111:

                if (v274 != v275)
                {
                }
                goto LABEL_113;
              }
              v269 = objc_msgSend_includeScanResults(v5, v175, v176, v177, v178);
              if (!v269) {
                goto LABEL_81;
              }
              v183 = self->_includeScanResults;
              v268 = objc_msgSend_includeScanResults(v5, v179, v180, v181, v182);
              if ((objc_msgSend_isEqual_(v183, v184, (uint64_t)v268, v185, v186) & 1) == 0)
              {

LABEL_81:
                if (v274 == v275)
                {
                  v187 = v274;
                  goto LABEL_118;
                }
                goto LABEL_116;
              }
            }
            int includeMatchingKnownNetworkProfiles = self->_includeMatchingKnownNetworkProfiles;
            if (includeMatchingKnownNetworkProfiles != objc_msgSend_includeMatchingKnownNetworkProfiles(v5, v175, v176, v177, v178))
            {
              BOOL v171 = 0;
              goto LABEL_109;
            }
            ANQPElementIDListForPasspointScanResults = self->_ANQPElementIDListForPasspointScanResults;
            objc_msgSend_ANQPElementIDListForPasspointScanResults(v5, v189, v190, v191, v192);
            v266 = ANQPElementIDListForPasspointScanResults;
            v267 = (NSArray *)objc_claimAutoreleasedReturnValue();
            if (ANQPElementIDListForPasspointScanResults != v267)
            {
              if (!self->_ANQPElementIDListForPasspointScanResults)
              {
                BOOL v171 = 0;
LABEL_108:

LABEL_109:
                if (v271 != v273)
                {
                }
                goto LABEL_111;
              }
              v265 = objc_msgSend_ANQPElementIDListForPasspointScanResults(v5, v194, v195, v196, v197);
              if (!v265) {
                goto LABEL_90;
              }
              v202 = self->_ANQPElementIDListForPasspointScanResults;
              v264 = objc_msgSend_ANQPElementIDListForPasspointScanResults(v5, v198, v199, v200, v201);
              if ((objc_msgSend_isEqual_(v202, v203, (uint64_t)v264, v204, v205) & 1) == 0)
              {

LABEL_90:
                if (v271 == v273)
                {
                  v206 = v271;
LABEL_115:

                  if (v274 == v275)
                  {
LABEL_117:
                    v187 = v275;
LABEL_118:

                    if (v278 == v280)
                    {
LABEL_120:
                      v170 = v280;
LABEL_121:

                      if (BSSID == v51) {
                        goto LABEL_72;
                      }
                      goto LABEL_69;
                    }
LABEL_119:

                    goto LABEL_120;
                  }
LABEL_116:

                  goto LABEL_117;
                }
LABEL_91:

LABEL_92:
                v206 = v273;
                goto LABEL_115;
              }
            }
            unint64_t acceptableANQPCacheAgeForPasspointScanResults = self->_acceptableANQPCacheAgeForPasspointScanResults;
            if (acceptableANQPCacheAgeForPasspointScanResults != objc_msgSend_acceptableANQPCacheAgeForPasspointScanResults(v5, v194, v195, v196, v197)|| (unint64_t maximumANQPAgeForPasspointScanResults = self->_maximumANQPAgeForPasspointScanResults, maximumANQPAgeForPasspointScanResults != objc_msgSend_maximumANQPAgeForPasspointScanResults(v5, v208, v209, v210, v211))|| (exclude6GChannels = self->_exclude6GChannels, exclude6GChannels != objc_msgSend_exclude6GChannels(v5, v213, v214, v215, v216)))
            {
              BOOL v171 = 0;
              goto LABEL_105;
            }
            matchNetworkNamePrefix = self->_matchNetworkNamePrefix;
            objc_msgSend_matchNetworkNamePrefix(v5, v218, v219, v220, v221);
            v262 = matchNetworkNamePrefix;
            v263 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (matchNetworkNamePrefix != v263)
            {
              if (!self->_matchNetworkNamePrefix)
              {
                BOOL v171 = 0;
LABEL_155:

LABEL_105:
                if (v266 != v267)
                {
                }
                goto LABEL_108;
              }
              v260 = objc_msgSend_matchNetworkNamePrefix(v5, v223, v224, v225, v226);
              if (!v260)
              {
                BOOL v26 = 0;
                goto LABEL_134;
              }
              v231 = self->_matchNetworkNamePrefix;
              v258 = objc_msgSend_matchNetworkNamePrefix(v5, v227, v228, v229, v230);
              if ((objc_msgSend_isEqual_(v231, v232, (uint64_t)v258, v233, v234) & 1) == 0)
              {

                if (v266 == v267)
                {
                  v235 = v266;
                }
                else
                {

                  v235 = v267;
                }

                if (v271 == v273) {
                  goto LABEL_92;
                }
                goto LABEL_91;
              }
            }
            filterPredicate = self->_filterPredicate;
            objc_msgSend_filterPredicate(v5, v223, v224, v225, v226);
            v261 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
            v259 = filterPredicate;
            if (filterPredicate != v261)
            {
              if (!self->_filterPredicate) {
                goto LABEL_151;
              }
              v257 = objc_msgSend_filterPredicate(v5, v237, v238, v239, v240);
              if (!v257)
              {
LABEL_150:

                BOOL v171 = 0;
                goto LABEL_153;
              }
              v245 = self->_filterPredicate;
              v256 = objc_msgSend_filterPredicate(v5, v241, v242, v243, v244);
              if (!objc_msgSend_isEqual_(v245, v246, (uint64_t)v256, v247, v248))
              {
                BOOL v26 = 0;
LABEL_131:

                if (v262 == v263)
                {
                  v255 = v262;
                  goto LABEL_135;
                }

LABEL_134:
                v255 = v263;
LABEL_135:

                if (v266 != v267)
                {
                }
                if (v271 != v273)
                {
                }
                if (v274 != v275)
                {
                }
                if (v278 != v280)
                {
                }
                if (BSSID != v51)
                {
                }
                if (SSID != v32)
                {
                }
LABEL_33:
                v22 = v284;
                if (channels == v15) {
                  goto LABEL_67;
                }
                goto LABEL_66;
              }
            }
            int includeBeaconCacheResults = self->_includeBeaconCacheResults;
            if (includeBeaconCacheResults == objc_msgSend_includeBeaconCacheResults(v5, v237, v238, v239, v240))
            {
              int includeBackgroundScanCacheResults = self->_includeBackgroundScanCacheResults;
              BOOL v26 = includeBackgroundScanCacheResults == objc_msgSend_includeBackgroundScanCacheResults(v5, v250, v251, v252, v253);
              BOOL v171 = v26;
              if (v259 != v261) {
                goto LABEL_131;
              }
              goto LABEL_152;
            }
            if (v259 != v261)
            {

              goto LABEL_150;
            }
LABEL_151:
            BOOL v171 = 0;
LABEL_152:

LABEL_153:
            if (v262 != v263)
            {
            }
            goto LABEL_155;
          }

          v173 = v279;
          if (BSSID != v51) {
            goto LABEL_71;
          }
        }
        else
        {

          if (BSSID != v51)
          {
LABEL_69:
            v173 = v279;
LABEL_71:

LABEL_72:
            goto LABEL_74;
          }
        }

LABEL_74:
        if (SSID == v32) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      v278 = SSIDList;
      v280 = v75;
      goto LABEL_37;
    }
LABEL_26:
    BOOL v26 = 0;
    goto LABEL_63;
  }
  if (!self->_BSSID) {
    goto LABEL_26;
  }
  uint64_t v52 = objc_msgSend_BSSID(v5, v47, v48, v49, v50);
  if (!v52) {
    goto LABEL_29;
  }
  v281 = (void *)v52;
  uint64_t v57 = self->_BSSID;
  uint64_t v58 = objc_msgSend_BSSID(v5, v53, v54, v55, v56);
  v59 = v57;
  uint64_t v60 = (void *)v58;
  if ((objc_msgSend_isEqual_(v59, v61, v58, v62, v63) & 1) == 0)
  {

LABEL_29:
    if (SSID == v32)
    {

      goto LABEL_32;
    }
LABEL_30:

    goto LABEL_31;
  }
  v279 = v60;
  unint64_t v68 = self->_shortSSID;
  if (v68 == objc_msgSend_shortSSID(v5, v64, v65, v66, v67)) {
    goto LABEL_21;
  }
  BOOL v26 = 0;
LABEL_62:

LABEL_63:
  if (SSID != v32)
  {
  }
LABEL_65:
  v22 = v284;

  if (channels != v15) {
    goto LABEL_66;
  }
LABEL_67:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFScanParameters *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToScanParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToScanParameters = objc_msgSend_isEqualToScanParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToScanParameters = 0;
  }

  return isEqualToScanParameters;
}

- (unint64_t)hash
{
  uint64_t v82 = objc_msgSend_hash(self->_channels, a2, v2, v3, v4);
  uint64_t v81 = objc_msgSend_hash(self->_SSID, v6, v7, v8, v9);
  uint64_t v80 = objc_msgSend_hash(self->_BSSID, v10, v11, v12, v13);
  unint64_t shortSSID = self->_shortSSID;
  uint64_t v78 = objc_msgSend_hash(self->_SSIDList, v14, v15, v16, v17);
  int8x16_t v71 = *(int8x16_t *)&self->_numberOfScans;
  int8x16_t v72 = *(int8x16_t *)&self->_dwellTime;
  int PHYMode = self->_PHYMode;
  int BSSType = self->_BSSType;
  int scanType = self->_scanType;
  uint64_t v79 = objc_msgSend_numberWithInteger_(NSNumber, v18, self->_minimumRSSI, v19, v20);
  uint64_t v73 = objc_msgSend_hash(v79, v21, v22, v23, v24);
  uint64_t v28 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v25, self->_maximumAge, v26, v27);
  uint64_t v33 = objc_msgSend_hash(v28, v29, v30, v31, v32);
  BOOL mergeScanResults = self->_mergeScanResults;
  BOOL includeHiddenNetworks = self->_includeHiddenNetworks;
  uint64_t scanFlags = self->_scanFlags;
  uint64_t v70 = v33;
  unint64_t minimumTimestamp = self->_minimumTimestamp;
  uint64_t v67 = objc_msgSend_hash(self->_includeProperties, v35, v36, v37, v38);
  uint64_t v43 = objc_msgSend_hash(self->_includeScanResults, v39, v40, v41, v42);
  BOOL includeMatchingKnownNetworkProfiles = self->_includeMatchingKnownNetworkProfiles;
  uint64_t v49 = objc_msgSend_hash(self->_ANQPElementIDListForPasspointScanResults, v45, v46, v47, v48);
  unint64_t acceptableANQPCacheAgeForPasspointScanResults = self->_acceptableANQPCacheAgeForPasspointScanResults;
  unint64_t maximumANQPAgeForPasspointScanResults = self->_maximumANQPAgeForPasspointScanResults;
  BOOL exclude6GChannels = self->_exclude6GChannels;
  uint64_t v57 = objc_msgSend_hash(self->_matchNetworkNamePrefix, v53, v54, v55, v56);
  uint64_t v62 = objc_msgSend_hash(self->_filterPredicate, v58, v59, v60, v61);
  int8x16_t v63 = veorq_s8(v71, v72);
  unint64_t v64 = *(void *)&veor_s8(*(int8x8_t *)v63.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v63, v63, 8uLL)) ^ shortSSID ^ minimumTimestamp ^ acceptableANQPCacheAgeForPasspointScanResults ^ maximumANQPAgeForPasspointScanResults ^ mergeScanResults ^ includeHiddenNetworks ^ includeMatchingKnownNetworkProfiles ^ v62 ^ scanFlags ^ PHYMode ^ scanType ^ BSSType ^ self->_includeBackgroundScanCacheResults ^ exclude6GChannels ^ self->_includeBeaconCacheResults ^ v57 ^ v49 ^ v43 ^ v67 ^ v81 ^ v82 ^ v70 ^ v73 ^ v78 ^ v80;

  return v64;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = objc_msgSend_allocWithZone_(CWFScanParameters, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setSSID_(v11, v12, (uint64_t)self->_SSID, v13, v14);
  objc_msgSend_setBSSID_(v11, v15, (uint64_t)self->_BSSID, v16, v17);
  objc_msgSend_setShortSSID_(v11, v18, self->_shortSSID, v19, v20);
  objc_msgSend_setSSIDList_(v11, v21, (uint64_t)self->_SSIDList, v22, v23);
  objc_msgSend_setChannels_(v11, v24, (uint64_t)self->_channels, v25, v26);
  objc_msgSend_setBSSType_(v11, v27, self->_BSSType, v28, v29);
  objc_msgSend_setScanType_(v11, v30, self->_scanType, v31, v32);
  objc_msgSend_setAcceptableCacheAge_(v11, v33, self->_acceptableCacheAge, v34, v35);
  objc_msgSend_setMergeScanResults_(v11, v36, self->_mergeScanResults, v37, v38);
  objc_msgSend_setRestTime_(v11, v39, self->_restTime, v40, v41);
  objc_msgSend_setDwellTime_(v11, v42, self->_dwellTime, v43, v44);
  objc_msgSend_setNumberOfScans_(v11, v45, self->_numberOfScans, v46, v47);
  objc_msgSend_setPHYMode_(v11, v48, self->_PHYMode, v49, v50);
  objc_msgSend_setMinimumRSSI_(v11, v51, self->_minimumRSSI, v52, v53);
  objc_msgSend_setMaximumAge_(v11, v54, self->_maximumAge, v55, v56);
  objc_msgSend_setMinimumTimestamp_(v11, v57, self->_minimumTimestamp, v58, v59);
  objc_msgSend_setIncludeHiddenNetworks_(v11, v60, self->_includeHiddenNetworks, v61, v62);
  objc_msgSend_setScanFlags_(v11, v63, self->_scanFlags, v64, v65);
  objc_msgSend_setIncludeProperties_(v11, v66, (uint64_t)self->_includeProperties, v67, v68);
  objc_msgSend_setIncludeScanResults_(v11, v69, (uint64_t)self->_includeScanResults, v70, v71);
  objc_msgSend_setIncludeMatchingKnownNetworkProfiles_(v11, v72, self->_includeMatchingKnownNetworkProfiles, v73, v74);
  objc_msgSend_setANQPElementIDListForPasspointScanResults_(v11, v75, (uint64_t)self->_ANQPElementIDListForPasspointScanResults, v76, v77);
  objc_msgSend_setAcceptableANQPCacheAgeForPasspointScanResults_(v11, v78, self->_acceptableANQPCacheAgeForPasspointScanResults, v79, v80);
  objc_msgSend_setMaximumANQPAgeForPasspointScanResults_(v11, v81, self->_maximumANQPAgeForPasspointScanResults, v82, v83);
  objc_msgSend_setExclude6GChannels_(v11, v84, self->_exclude6GChannels, v85, v86);
  objc_msgSend_setMatchNetworkNamePrefix_(v11, v87, (uint64_t)self->_matchNetworkNamePrefix, v88, v89);
  objc_msgSend_setFilterPredicate_(v11, v90, (uint64_t)self->_filterPredicate, v91, v92);
  objc_msgSend_setIncludeBeaconCacheResults_(v11, v93, self->_includeBeaconCacheResults, v94, v95);
  objc_msgSend_setIncludeBackgroundScanCacheResults_(v11, v96, self->_includeBackgroundScanCacheResults, v97, v98);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  SSID = self->_SSID;
  id v99 = a3;
  objc_msgSend_encodeObject_forKey_(v99, v5, (uint64_t)SSID, @"_SSID", v6);
  objc_msgSend_encodeObject_forKey_(v99, v7, (uint64_t)self->_BSSID, @"_BSSID", v8);
  uint64_t v12 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v9, self->_shortSSID, v10, v11);
  objc_msgSend_encodeObject_forKey_(v99, v13, (uint64_t)v12, @"_shortSSID", v14);

  objc_msgSend_encodeObject_forKey_(v99, v15, (uint64_t)self->_SSIDList, @"_SSIDList", v16);
  objc_msgSend_encodeObject_forKey_(v99, v17, (uint64_t)self->_channels, @"_channels", v18);
  objc_msgSend_encodeInteger_forKey_(v99, v19, self->_scanType, @"_scanType", v20);
  objc_msgSend_encodeInteger_forKey_(v99, v21, self->_PHYMode, @"_PHYMode", v22);
  objc_msgSend_encodeInteger_forKey_(v99, v23, self->_BSSType, @"_BSSType", v24);
  objc_msgSend_encodeInteger_forKey_(v99, v25, self->_minimumRSSI, @"_minimumRSSI", v26);
  uint64_t v30 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v27, self->_maximumAge, v28, v29);
  objc_msgSend_encodeObject_forKey_(v99, v31, (uint64_t)v30, @"_maximumAge", v32);

  uint64_t v36 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v33, self->_minimumTimestamp, v34, v35);
  objc_msgSend_encodeObject_forKey_(v99, v37, (uint64_t)v36, @"_minimumTimestamp", v38);

  objc_msgSend_encodeBool_forKey_(v99, v39, self->_includeHiddenNetworks, @"_includeHiddenNetworks", v40);
  objc_msgSend_encodeBool_forKey_(v99, v41, self->_mergeScanResults, @"_mergeScanResults", v42);
  uint64_t v46 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v43, self->_restTime, v44, v45);
  objc_msgSend_encodeObject_forKey_(v99, v47, (uint64_t)v46, @"_restTime", v48);

  uint64_t v52 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v49, self->_dwellTime, v50, v51);
  objc_msgSend_encodeObject_forKey_(v99, v53, (uint64_t)v52, @"_dwellTime", v54);

  uint64_t v58 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v55, self->_numberOfScans, v56, v57);
  objc_msgSend_encodeObject_forKey_(v99, v59, (uint64_t)v58, @"_numberOfScans", v60);

  uint64_t v64 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v61, self->_acceptableCacheAge, v62, v63);
  objc_msgSend_encodeObject_forKey_(v99, v65, (uint64_t)v64, @"_acceptableCacheAge", v66);

  objc_msgSend_encodeInteger_forKey_(v99, v67, self->_scanFlags, @"_scanFlags", v68);
  objc_msgSend_encodeObject_forKey_(v99, v69, (uint64_t)self->_includeProperties, @"_includeProperties", v70);
  objc_msgSend_encodeObject_forKey_(v99, v71, (uint64_t)self->_includeScanResults, @"_includeScanResults", v72);
  objc_msgSend_encodeBool_forKey_(v99, v73, self->_includeMatchingKnownNetworkProfiles, @"_includeMatchingKnownNetworkProfiles", v74);
  objc_msgSend_encodeObject_forKey_(v99, v75, (uint64_t)self->_ANQPElementIDListForPasspointScanResults, @"_ANQPElementIDListForPasspointScanResults", v76);
  uint64_t v80 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v77, self->_acceptableANQPCacheAgeForPasspointScanResults, v78, v79);
  objc_msgSend_encodeObject_forKey_(v99, v81, (uint64_t)v80, @"_acceptableANQPCacheAgeForPasspointScanResults", v82);

  uint64_t v86 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v83, self->_maximumANQPAgeForPasspointScanResults, v84, v85);
  objc_msgSend_encodeObject_forKey_(v99, v87, (uint64_t)v86, @"_maximumANQPAgeForPasspointScanResults", v88);

  objc_msgSend_encodeBool_forKey_(v99, v89, self->_exclude6GChannels, @"_exclude6GChannels", v90);
  objc_msgSend_encodeObject_forKey_(v99, v91, (uint64_t)self->_matchNetworkNamePrefix, @"_matchNetworkNamePrefix", v92);
  objc_msgSend_encodeObject_forKey_(v99, v93, (uint64_t)self->_filterPredicate, @"_filterPredicate", v94);
  objc_msgSend_encodeBool_forKey_(v99, v95, self->_includeBeaconCacheResults, @"_includeBeaconCacheResults", v96);
  objc_msgSend_encodeBool_forKey_(v99, v97, self->_includeBackgroundScanCacheResults, @"_includeBackgroundScanCacheResults", v98);
}

- (CWFScanParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v194.receiver = self;
  v194.super_class = (Class)CWFScanParameters;
  id v5 = [(CWFScanParameters *)&v194 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_SSID", v8);
    SSID = v5->_SSID;
    v5->_SSID = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_BSSID", v13);
    BSSID = v5->_BSSID;
    v5->_BSSID = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"_shortSSID", v18);
    v5->_unint64_t shortSSID = objc_msgSend_unsignedIntegerValue(v19, v20, v21, v22, v23);

    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v30 = objc_msgSend_setWithObjects_(v24, v27, v25, v28, v29, v26, 0);
    uint64_t v33 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, @"_SSIDList", v32);
    SSIDList = v5->_SSIDList;
    v5->_SSIDList = (NSArray *)v33;

    uint64_t v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v41 = objc_msgSend_setWithObjects_(v35, v38, v36, v39, v40, v37, 0);
    uint64_t v44 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v42, (uint64_t)v41, @"_channels", v43);
    channels = v5->_channels;
    v5->_channels = (NSArray *)v44;

    v5->_int scanType = objc_msgSend_decodeIntegerForKey_(v4, v46, @"_scanType", v47, v48);
    v5->_int BSSType = objc_msgSend_decodeIntegerForKey_(v4, v49, @"_BSSType", v50, v51);
    v5->_int PHYMode = objc_msgSend_decodeIntegerForKey_(v4, v52, @"_PHYMode", v53, v54);
    v5->_int64_t minimumRSSI = objc_msgSend_decodeIntegerForKey_(v4, v55, @"_minimumRSSI", v56, v57);
    uint64_t v58 = objc_opt_class();
    uint64_t v61 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, @"_maximumAge", v60);
    v5->_unint64_t maximumAge = objc_msgSend_unsignedIntegerValue(v61, v62, v63, v64, v65);

    uint64_t v66 = objc_opt_class();
    uint64_t v69 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, @"_minimumTimestamp", v68);
    v5->_unint64_t minimumTimestamp = objc_msgSend_unsignedLongLongValue(v69, v70, v71, v72, v73);

    v5->_BOOL includeHiddenNetworks = objc_msgSend_decodeBoolForKey_(v4, v74, @"_includeHiddenNetworks", v75, v76);
    v5->_BOOL mergeScanResults = objc_msgSend_decodeBoolForKey_(v4, v77, @"_mergeScanResults", v78, v79);
    uint64_t v80 = objc_opt_class();
    uint64_t v83 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, @"_restTime", v82);
    v5->_unint64_t restTime = objc_msgSend_unsignedIntegerValue(v83, v84, v85, v86, v87);

    uint64_t v88 = objc_opt_class();
    uint64_t v91 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v89, v88, @"_dwellTime", v90);
    v5->_unint64_t dwellTime = objc_msgSend_unsignedIntegerValue(v91, v92, v93, v94, v95);

    uint64_t v96 = objc_opt_class();
    id v99 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, v96, @"_numberOfScans", v98);
    v5->_unint64_t numberOfScans = objc_msgSend_unsignedIntegerValue(v99, v100, v101, v102, v103);

    uint64_t v104 = objc_opt_class();
    v107 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v105, v104, @"_acceptableCacheAge", v106);
    v5->_unint64_t acceptableCacheAge = objc_msgSend_unsignedIntegerValue(v107, v108, v109, v110, v111);

    v5->_uint64_t scanFlags = objc_msgSend_decodeIntegerForKey_(v4, v112, @"_scanFlags", v113, v114);
    uint64_t v115 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v116 = objc_opt_class();
    uint64_t v117 = objc_opt_class();
    uint64_t v121 = objc_msgSend_setWithObjects_(v115, v118, v116, v119, v120, v117, 0);
    uint64_t v124 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v122, (uint64_t)v121, @"_includeProperties", v123);
    includeProperties = v5->_includeProperties;
    v5->_includeProperties = (NSSet *)v124;

    uint64_t v126 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v127 = objc_opt_class();
    uint64_t v128 = objc_opt_class();
    v132 = objc_msgSend_setWithObjects_(v126, v129, v127, v130, v131, v128, 0);
    uint64_t v135 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v133, (uint64_t)v132, @"_includeScanResults", v134);
    includeScanResults = v5->_includeScanResults;
    v5->_includeScanResults = (NSArray *)v135;

    v5->_BOOL includeMatchingKnownNetworkProfiles = objc_msgSend_decodeBoolForKey_(v4, v137, @"_includeMatchingKnownNetworkProfiles", v138, v139);
    uint64_t v140 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v141 = objc_opt_class();
    uint64_t v142 = objc_opt_class();
    uint64_t v146 = objc_msgSend_setWithObjects_(v140, v143, v141, v144, v145, v142, 0);
    uint64_t v149 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v147, (uint64_t)v146, @"_ANQPElementIDListForPasspointScanResults", v148);
    ANQPElementIDListForPasspointScanResults = v5->_ANQPElementIDListForPasspointScanResults;
    v5->_ANQPElementIDListForPasspointScanResults = (NSArray *)v149;

    uint64_t v151 = objc_opt_class();
    uint64_t v154 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v152, v151, @"_acceptableANQPCacheAgeForPasspointScanResults", v153);
    v5->_unint64_t acceptableANQPCacheAgeForPasspointScanResults = objc_msgSend_unsignedIntegerValue(v154, v155, v156, v157, v158);

    uint64_t v159 = objc_opt_class();
    v162 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v160, v159, @"_maximumANQPAgeForPasspointScanResults", v161);
    v5->_unint64_t maximumANQPAgeForPasspointScanResults = objc_msgSend_unsignedIntegerValue(v162, v163, v164, v165, v166);

    v5->_BOOL exclude6GChannels = objc_msgSend_decodeBoolForKey_(v4, v167, @"_exclude6GChannels", v168, v169);
    uint64_t v170 = objc_opt_class();
    uint64_t v173 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v171, v170, @"_matchNetworkNamePrefix", v172);
    matchNetworkNamePrefix = v5->_matchNetworkNamePrefix;
    v5->_matchNetworkNamePrefix = (NSString *)v173;

    uint64_t v175 = objc_opt_class();
    uint64_t v178 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v176, v175, @"_filterPredicate", v177);
    filterPredicate = v5->_filterPredicate;
    v5->_filterPredicate = (NSPredicate *)v178;

    objc_msgSend_acceptVisitor_flags_(v5->_filterPredicate, v180, (uint64_t)v5, 3, v181);
    if ((objc_msgSend_invalidPredicate(v5, v182, v183, v184, v185) & 1) == 0) {
      objc_msgSend_allowEvaluation(v5->_filterPredicate, v186, v187, v188, v189);
    }
    v5->_int includeBeaconCacheResults = objc_msgSend_decodeBoolForKey_(v4, v186, @"_includeBeaconCacheResults", v188, v189);
    v5->_int includeBackgroundScanCacheResults = objc_msgSend_decodeBoolForKey_(v4, v190, @"_includeBackgroundScanCacheResults", v191, v192);
  }

  return v5;
}

- (void)visitPredicateExpression:(id)a3
{
  unint64_t v6 = objc_msgSend_expressionType(a3, a2, (uint64_t)a3, v3, v4);
  if (v6 <= 0x13 && ((1 << v6) & 0x8001C) != 0)
  {
    MEMORY[0x1F4181798](self, sel_setInvalidPredicate_, 1, v7, v8);
  }
}

- (void)visitPredicateOperator:(id)a3
{
  uint64_t v6 = objc_msgSend_operatorType(a3, a2, (uint64_t)a3, v3, v4);
  if (v6 == 11 || v6 == 6)
  {
    MEMORY[0x1F4181798](self, sel_setInvalidPredicate_, 1, v7, v8);
  }
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (unint64_t)shortSSID
{
  return self->_shortSSID;
}

- (void)setShortSSID:(unint64_t)a3
{
  self->_unint64_t shortSSID = a3;
}

- (NSArray)SSIDList
{
  return self->_SSIDList;
}

- (void)setSSIDList:(id)a3
{
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
}

- (unint64_t)numberOfScans
{
  return self->_numberOfScans;
}

- (void)setNumberOfScans:(unint64_t)a3
{
  self->_unint64_t numberOfScans = a3;
}

- (unint64_t)restTime
{
  return self->_restTime;
}

- (void)setRestTime:(unint64_t)a3
{
  self->_unint64_t restTime = a3;
}

- (unint64_t)dwellTime
{
  return self->_dwellTime;
}

- (void)setDwellTime:(unint64_t)a3
{
  self->_unint64_t dwellTime = a3;
}

- (unint64_t)acceptableCacheAge
{
  return self->_acceptableCacheAge;
}

- (void)setAcceptableCacheAge:(unint64_t)a3
{
  self->_unint64_t acceptableCacheAge = a3;
}

- (int)BSSType
{
  return self->_BSSType;
}

- (void)setBSSType:(int)a3
{
  self->_int BSSType = a3;
}

- (int)PHYMode
{
  return self->_PHYMode;
}

- (void)setPHYMode:(int)a3
{
  self->_int PHYMode = a3;
}

- (int)scanType
{
  return self->_scanType;
}

- (void)setScanType:(int)a3
{
  self->_int scanType = a3;
}

- (int64_t)minimumRSSI
{
  return self->_minimumRSSI;
}

- (void)setMinimumRSSI:(int64_t)a3
{
  self->_int64_t minimumRSSI = a3;
}

- (unint64_t)maximumAge
{
  return self->_maximumAge;
}

- (void)setMaximumAge:(unint64_t)a3
{
  self->_unint64_t maximumAge = a3;
}

- (unint64_t)minimumTimestamp
{
  return self->_minimumTimestamp;
}

- (void)setMinimumTimestamp:(unint64_t)a3
{
  self->_unint64_t minimumTimestamp = a3;
}

- (BOOL)mergeScanResults
{
  return self->_mergeScanResults;
}

- (void)setMergeScanResults:(BOOL)a3
{
  self->_BOOL mergeScanResults = a3;
}

- (BOOL)includeHiddenNetworks
{
  return self->_includeHiddenNetworks;
}

- (void)setIncludeHiddenNetworks:(BOOL)a3
{
  self->_BOOL includeHiddenNetworks = a3;
}

- (int)scanFlags
{
  return self->_scanFlags;
}

- (void)setScanFlags:(int)a3
{
  self->_uint64_t scanFlags = a3;
}

- (NSSet)includeProperties
{
  return self->_includeProperties;
}

- (void)setIncludeProperties:(id)a3
{
}

- (NSArray)includeScanResults
{
  return self->_includeScanResults;
}

- (void)setIncludeScanResults:(id)a3
{
}

- (BOOL)includeMatchingKnownNetworkProfiles
{
  return self->_includeMatchingKnownNetworkProfiles;
}

- (void)setIncludeMatchingKnownNetworkProfiles:(BOOL)a3
{
  self->_BOOL includeMatchingKnownNetworkProfiles = a3;
}

- (NSArray)ANQPElementIDListForPasspointScanResults
{
  return self->_ANQPElementIDListForPasspointScanResults;
}

- (void)setANQPElementIDListForPasspointScanResults:(id)a3
{
}

- (unint64_t)acceptableANQPCacheAgeForPasspointScanResults
{
  return self->_acceptableANQPCacheAgeForPasspointScanResults;
}

- (void)setAcceptableANQPCacheAgeForPasspointScanResults:(unint64_t)a3
{
  self->_unint64_t acceptableANQPCacheAgeForPasspointScanResults = a3;
}

- (unint64_t)maximumANQPAgeForPasspointScanResults
{
  return self->_maximumANQPAgeForPasspointScanResults;
}

- (void)setMaximumANQPAgeForPasspointScanResults:(unint64_t)a3
{
  self->_unint64_t maximumANQPAgeForPasspointScanResults = a3;
}

- (BOOL)exclude6GChannels
{
  return self->_exclude6GChannels;
}

- (void)setExclude6GChannels:(BOOL)a3
{
  self->_BOOL exclude6GChannels = a3;
}

- (NSString)matchNetworkNamePrefix
{
  return self->_matchNetworkNamePrefix;
}

- (void)setMatchNetworkNamePrefix:(id)a3
{
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
}

- (BOOL)includeBeaconCacheResults
{
  return self->_includeBeaconCacheResults;
}

- (void)setIncludeBeaconCacheResults:(BOOL)a3
{
  self->_int includeBeaconCacheResults = a3;
}

- (BOOL)includeBackgroundScanCacheResults
{
  return self->_includeBackgroundScanCacheResults;
}

- (void)setIncludeBackgroundScanCacheResults:(BOOL)a3
{
  self->_int includeBackgroundScanCacheResults = a3;
}

- (BOOL)invalidPredicate
{
  return self->_invalidPredicate;
}

- (void)setInvalidPredicate:(BOOL)a3
{
  self->_invalidPredicate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_matchNetworkNamePrefix, 0);
  objc_storeStrong((id *)&self->_ANQPElementIDListForPasspointScanResults, 0);
  objc_storeStrong((id *)&self->_includeScanResults, 0);
  objc_storeStrong((id *)&self->_includeProperties, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_SSIDList, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_channels, 0);
}

@end