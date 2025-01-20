@interface CKDPowerLogger
+ (BOOL)isEnabled;
+ (id)sharedLogger;
- (id)zoneIDsToZoneNamesString:(id)a3;
- (void)logOperationCombinedMetrics:(id)a3 forOperationID:(id)a4 operationType:(int64_t)a5 operationGroupID:(id)a6 operationGroupName:(id)a7 operationGroupQuantity:(unint64_t)a8 operationQualityOfService:(int64_t)a9 xpcActivityIdentifier:(id)a10 appContainerTuple:(id)a11;
@end

@implementation CKDPowerLogger

+ (BOOL)isEnabled
{
  v3 = objc_msgSend_currentProcess(CKDDaemonProcess, a2, v2);
  uint64_t v6 = objc_msgSend_processType(v3, v4, v5);

  BOOL result = v6 != 2
        && (objc_msgSend_currentProcess(CKDDaemonProcess, v7, v8),
            v9 = objc_claimAutoreleasedReturnValue(),
            int isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v9, v10, v11),
            v9,
            isSystemInstalledBinary)
        && (CKIsRunningInSyncBubble() & 1) == 0
        && PLShouldLogRegisteredEvent() != 0;
  return result;
}

+ (id)sharedLogger
{
  if (qword_1EBBCFCE0 != -1) {
    dispatch_once(&qword_1EBBCFCE0, &unk_1F2043830);
  }
  uint64_t v2 = (void *)qword_1EBBCFCD8;
  return v2;
}

- (void)logOperationCombinedMetrics:(id)a3 forOperationID:(id)a4 operationType:(int64_t)a5 operationGroupID:(id)a6 operationGroupName:(id)a7 operationGroupQuantity:(unint64_t)a8 operationQualityOfService:(int64_t)a9 xpcActivityIdentifier:(id)a10 appContainerTuple:(id)a11
{
  v258[38] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v17 = (__CFString *)a4;
  v18 = (__CFString *)a6;
  v19 = (__CFString *)a7;
  v20 = (__CFString *)a10;
  id v21 = a11;
  v251 = self;
  v22 = objc_opt_class();
  if (objc_msgSend_isEnabled(v22, v23, v24))
  {
    v214 = objc_msgSend_cloudKitMetrics(v16, v25, v26);
    id v250 = v16;
    v252 = objc_msgSend_MMCSMetrics(v16, v27, v28);
    v248 = v18;
    v249 = v17;
    if (v17) {
      v30 = v17;
    }
    else {
      v30 = &stru_1F2044F30;
    }
    v257[0] = @"operationID";
    v257[1] = @"operationGroupID";
    if (v18) {
      v31 = v18;
    }
    else {
      v31 = &stru_1F2044F30;
    }
    v258[0] = v30;
    v258[1] = v31;
    v247 = v19;
    if (v19) {
      v32 = v19;
    }
    else {
      v32 = &stru_1F2044F30;
    }
    v258[2] = v32;
    v257[2] = @"operationGroupName";
    v257[3] = @"operationGroupQuantity";
    v244 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v29, a8);
    v258[3] = v244;
    v257[4] = @"operationQualityOfService";
    v243 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v33, a9);
    v258[4] = v243;
    v257[5] = @"operationType";
    v242 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v34, a5);
    v258[5] = v242;
    v257[6] = @"containerIdentifier";
    v241 = objc_msgSend_containerID(v21, v35, v36);
    uint64_t v39 = objc_msgSend_containerIdentifier(v241, v37, v38);
    v240 = (void *)v39;
    if (v39) {
      v42 = (__CFString *)v39;
    }
    else {
      v42 = &stru_1F2044F30;
    }
    v258[6] = v42;
    v257[7] = @"containerEnvironment";
    v43 = (void *)MEMORY[0x1E4F28ED0];
    v239 = objc_msgSend_containerID(v21, v40, v41);
    uint64_t v46 = objc_msgSend_environment(v239, v44, v45);
    v238 = objc_msgSend_numberWithInteger_(v43, v47, v46);
    v258[7] = v238;
    v257[8] = @"bundleIdentifier";
    v237 = objc_msgSend_applicationID(v21, v48, v49);
    uint64_t v52 = objc_msgSend_applicationBundleIdentifier(v237, v50, v51);
    v236 = (void *)v52;
    if (v52) {
      v55 = (__CFString *)v52;
    }
    else {
      v55 = &stru_1F2044F30;
    }
    v258[8] = v55;
    v257[9] = @"sourceAppBundleIdentifier";
    id v245 = v21;
    v235 = objc_msgSend_applicationID(v21, v53, v54);
    uint64_t v58 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v235, v56, v57);
    v234 = (void *)v58;
    if (v58) {
      v61 = (__CFString *)v58;
    }
    else {
      v61 = &stru_1F2044F30;
    }
    v246 = v20;
    if (v20) {
      v62 = v20;
    }
    else {
      v62 = &stru_1F2044F30;
    }
    v258[9] = v61;
    v258[10] = v62;
    v257[10] = @"xpcActivityIdentifier";
    v257[11] = @"CKStartDate";
    uint64_t v65 = objc_msgSend_startDate(v214, v59, v60);
    v233 = (void *)v65;
    if (!v65)
    {
      uint64_t v65 = objc_msgSend_distantPast(MEMORY[0x1E4F1C9C8], v63, v64);
    }
    v213 = (void *)v65;
    v258[11] = v65;
    v257[12] = @"CKDuration";
    v66 = (void *)MEMORY[0x1E4F28ED0];
    objc_msgSend_duration(v214, v63, v64);
    v232 = objc_msgSend_numberWithUnsignedInteger_(v66, v68, (unint64_t)v67);
    v258[12] = v232;
    v257[13] = @"CKBytesUploaded";
    v69 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v72 = objc_msgSend_bytesUploaded(v214, v70, v71);
    v231 = objc_msgSend_numberWithUnsignedInteger_(v69, v73, v72);
    v258[13] = v231;
    v257[14] = @"CKBytesDownloaded";
    v74 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v77 = objc_msgSend_bytesDownloaded(v214, v75, v76);
    v230 = objc_msgSend_numberWithUnsignedInteger_(v74, v78, v77);
    v258[14] = v230;
    v257[15] = @"CKConnections";
    v79 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v82 = objc_msgSend_connections(v214, v80, v81);
    v229 = objc_msgSend_numberWithUnsignedInteger_(v79, v83, v82);
    v258[15] = v229;
    v257[16] = @"CKConnectionsCreated";
    v84 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v87 = objc_msgSend_connectionsCreated(v214, v85, v86);
    v228 = objc_msgSend_numberWithUnsignedInteger_(v84, v88, v87);
    v258[16] = v228;
    v257[17] = @"CKRecordsUploaded";
    v89 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v92 = objc_msgSend_recordsUploaded(v214, v90, v91);
    v227 = objc_msgSend_numberWithUnsignedInteger_(v89, v93, v92);
    v258[17] = v227;
    v257[18] = @"CKRecordsDownloaded";
    v94 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v97 = objc_msgSend_recordsDownloaded(v214, v95, v96);
    v226 = objc_msgSend_numberWithUnsignedInteger_(v94, v98, v97);
    v258[18] = v226;
    v257[19] = @"CKRecordsDeleted";
    v99 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v102 = objc_msgSend_recordsDeleted(v214, v100, v101);
    v225 = objc_msgSend_numberWithUnsignedInteger_(v99, v103, v102);
    v258[19] = v225;
    v257[20] = @"CKAssetsUploaded";
    v104 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v107 = objc_msgSend_assetsUploaded(v214, v105, v106);
    v224 = objc_msgSend_numberWithUnsignedInteger_(v104, v108, v107);
    v258[20] = v224;
    v257[21] = @"CKAssetsUploadedFileSize";
    v109 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v112 = objc_msgSend_assetsUploadedFileSize(v214, v110, v111);
    v223 = objc_msgSend_numberWithUnsignedInteger_(v109, v113, v112);
    v258[21] = v223;
    v257[22] = @"CKAssetsDownloaded";
    v114 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v117 = objc_msgSend_assetsDownloaded(v214, v115, v116);
    v222 = objc_msgSend_numberWithUnsignedInteger_(v114, v118, v117);
    v258[22] = v222;
    v257[23] = @"CKAssetsDownloadedFileSize";
    v119 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v122 = objc_msgSend_assetsDownloadedFileSize(v214, v120, v121);
    v221 = objc_msgSend_numberWithUnsignedInteger_(v119, v123, v122);
    v258[23] = v221;
    v257[24] = @"CKRetries";
    v124 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v127 = objc_msgSend_retries(v214, v125, v126);
    v220 = objc_msgSend_numberWithUnsignedInteger_(v124, v128, v127);
    v258[24] = v220;
    v257[25] = @"CKNumberOfRequests";
    v129 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v132 = objc_msgSend_requestCount(v214, v130, v131);
    v219 = objc_msgSend_numberWithUnsignedInteger_(v129, v133, v132);
    v258[25] = v219;
    v257[26] = @"CKProtoRequestOperationsByCount";
    uint64_t v136 = objc_msgSend_requestOperationCountsByType(v214, v134, v135);
    v218 = (void *)v136;
    uint64_t v139 = MEMORY[0x1E4F1CC08];
    if (v136) {
      uint64_t v140 = v136;
    }
    else {
      uint64_t v140 = MEMORY[0x1E4F1CC08];
    }
    v258[26] = v140;
    v257[27] = @"MMCSDuration";
    v141 = (void *)MEMORY[0x1E4F28ED0];
    objc_msgSend_duration(v252, v137, v138);
    v217 = objc_msgSend_numberWithUnsignedInteger_(v141, v143, (unint64_t)v142);
    v258[27] = v217;
    v257[28] = @"MMCSBytesUploaded";
    v144 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v147 = objc_msgSend_bytesUploaded(v252, v145, v146);
    v216 = objc_msgSend_numberWithUnsignedInteger_(v144, v148, v147);
    v258[28] = v216;
    v257[29] = @"MMCSBytesDownloaded";
    v149 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v152 = objc_msgSend_bytesDownloaded(v252, v150, v151);
    v215 = objc_msgSend_numberWithUnsignedInteger_(v149, v153, v152);
    v258[29] = v215;
    v257[30] = @"MMCSConnections";
    v154 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v157 = objc_msgSend_connections(v252, v155, v156);
    v159 = objc_msgSend_numberWithUnsignedInteger_(v154, v158, v157);
    v258[30] = v159;
    v257[31] = @"MMCSConnectionsCreated";
    v160 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v163 = objc_msgSend_connectionsCreated(v252, v161, v162);
    v165 = objc_msgSend_numberWithUnsignedInteger_(v160, v164, v163);
    v258[31] = v165;
    v257[32] = @"MMCSBytesFulfilledLocally";
    v166 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v169 = objc_msgSend_bytesFulfilledLocally(v252, v167, v168);
    v171 = objc_msgSend_numberWithUnsignedLongLong_(v166, v170, v169);
    v258[32] = v171;
    v257[33] = @"MMCSBytesResumed";
    v172 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v175 = objc_msgSend_bytesResumed(v252, v173, v174);
    v177 = objc_msgSend_numberWithUnsignedLongLong_(v172, v176, v175);
    v258[33] = v177;
    v257[34] = @"MMCSNumberOfRequests";
    v178 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v181 = objc_msgSend_requestCount(v252, v179, v180);
    v183 = objc_msgSend_numberWithUnsignedInteger_(v178, v182, v181);
    v258[34] = v183;
    v257[35] = @"MMCSTotalBytesByChunkProfile";
    uint64_t v186 = objc_msgSend_totalBytesByChunkProfile(v252, v184, v185);
    v189 = (void *)v186;
    if (v186) {
      uint64_t v190 = v186;
    }
    else {
      uint64_t v190 = v139;
    }
    v258[35] = v190;
    v257[36] = @"MMCSChunkCountByChunkProfile";
    uint64_t v191 = objc_msgSend_chunkCountByChunkProfile(v252, v187, v188);
    v194 = (void *)v191;
    if (v191) {
      uint64_t v195 = v191;
    }
    else {
      uint64_t v195 = v139;
    }
    v258[36] = v195;
    v257[37] = @"MMCSFileCountByChunkProfile";
    uint64_t v196 = objc_msgSend_fileCountByChunkProfile(v252, v192, v193);
    v198 = (void *)v196;
    if (v196) {
      uint64_t v199 = v196;
    }
    else {
      uint64_t v199 = v139;
    }
    v258[37] = v199;
    v254 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v197, (uint64_t)v258, v257, 38);

    if (!v233) {
    v202 = objc_msgSend_zoneIDs(v214, v200, v201);
    }
    v204 = objc_msgSend_zoneIDsToZoneNamesString_(v251, v203, (uint64_t)v202);

    id v16 = v250;
    id v21 = v245;
    if (v204)
    {
      v207 = objc_msgSend_mutableCopy(v254, v205, v206);
      objc_msgSend_setObject_forKeyedSubscript_(v207, v208, (uint64_t)v204, @"ZoneNames");
      uint64_t v211 = objc_msgSend_copy(v207, v209, v210);

      v254 = (void *)v211;
    }
    v18 = v248;
    v17 = v249;
    v20 = v246;
    v19 = v247;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v212 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v256 = v254;
      _os_log_debug_impl(&dword_1C4CFF000, v212, OS_LOG_TYPE_DEBUG, "Logging power event: %@", buf, 0xCu);
    }
    PLLogRegisteredEvent();
  }
}

- (id)zoneIDsToZoneNamesString:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (CKMainBundleIsAppleExecutable())
  {
    if (objc_msgSend_count(v3, v4, v5))
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v7 = v3;
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v36, v40, 16);
      if (v9)
      {
        uint64_t v12 = v9;
        uint64_t v13 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v37 != v13) {
              objc_enumerationMutation(v7);
            }
            v15 = objc_msgSend_zoneName(*(void **)(*((void *)&v36 + 1) + 8 * i), v10, v11);
            objc_msgSend_addObject_(v6, v16, (uint64_t)v15);
          }
          uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v36, v40, 16);
        }
        while (v12);
      }

      v19 = objc_msgSend_allObjects(v6, v17, v18);
      id v21 = objc_msgSend_sortedArrayUsingSelector_(v19, v20, (uint64_t)sel_localizedCaseInsensitiveCompare_);

      v23 = objc_msgSend_componentsJoinedByString_(v21, v22, @",");
      uint64_t v24 = NSString;
      uint64_t v27 = objc_msgSend_count(v7, v25, v26);
      v29 = objc_msgSend_stringWithFormat_(v24, v28, @"zoneNames:%lu:%@", v27, v23, (void)v36);
      if ((unint64_t)objc_msgSend_length(v29, v30, v31) < 0x101)
      {
        v33 = v29;
      }
      else
      {
        objc_msgSend_substringToIndex_(v29, v32, 256);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v34 = v33;
    }
    else
    {
      v34 = &stru_1F2044F30;
    }
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

@end