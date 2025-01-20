@interface CLIndoorSettings
+ (id)settingToSet:(id)a3;
- (BOOL)pipelinedEnabled;
- (CLGpsPosition)fakeLastFix;
- (CLIndoorSettings)init;
- (CLIndoorSettings)initWithSettings:(id)a3;
- (NSSet)disabledVenues;
- (NSSet)forcedVenues;
- (NSString)indoorAvailabilityTilesServerUrl;
- (const)prefetchClusterMergeRadius;
- (const)tilePrefetchMaxCount;
- (const)tilePrefetchRadius;
- (double)debounceInterval;
- (double)venueGroupDistance;
- (duration<long)errorBackoffDuration;
- (duration<long)tilePrefetchActivityInterval;
- (duration<long)tilePrefetchRelevancyWindow;
- (id).cxx_construct;
- (optional<double>)indoorPrefetchClusterMergeRadius;
- (optional<double>)indoorTilePrefetchRadius;
- (optional<double>)regionalPrefetchClusterMergeRadius;
- (optional<double>)regionalTilePrefetchRadius;
- (optional<unsigned)indoorTilePrefetchMaxCount;
- (optional<unsigned)regionalTilePrefetchMaxCount;
- (optional<unsigned)tilePrefetchPredictionActivityCycleAllowance;
- (uint64_t)setDebounceInterval:(uint64_t)result;
- (void)setDisabledVenues:(id)a3;
- (void)setErrorBackoffDuration:(duration<long)long;
- (void)setFakeLastFix:(id)a3;
- (void)setForcedVenues:(id)a3;
- (void)setIndoorAvailabilityTilesServerUrl:(id)a3;
- (void)setIndoorPrefetchClusterMergeRadius:(optional<double>)a3;
- (void)setIndoorTilePrefetchMaxCount:(optional<unsigned long>)a3;
- (void)setIndoorTilePrefetchRadius:(optional<double>)a3;
- (void)setPipelinedEnabled:(BOOL)a3;
- (void)setPrefetchClusterMergeRadius:(optional<double>)a3;
- (void)setRegionalPrefetchClusterMergeRadius:(optional<double>)a3;
- (void)setRegionalTilePrefetchMaxCount:(optional<unsigned long>)a3;
- (void)setRegionalTilePrefetchRadius:(optional<double>)a3;
- (void)setTilePrefetchActivityInterval:(duration<long)long;
- (void)setTilePrefetchMaxCount:(optional<unsigned long>)a3;
- (void)setTilePrefetchPredictionActivityCycleAllowance:(optional<unsigned int>)a3;
- (void)setTilePrefetchRadius:(optional<double>)a3;
- (void)setTilePrefetchRelevancyWindow:(duration<long)long;
- (void)setVenueGroupDistance:(double)a3;
@end

@implementation CLIndoorSettings

- (CLIndoorSettings)init
{
  return (CLIndoorSettings *)((uint64_t (*)(CLIndoorSettings *, char *, void))MEMORY[0x270F9A6D0])(self, sel_initWithSettings_, MEMORY[0x263EFFA78]);
}

+ (id)settingToSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v4, (uint64_t)v3, v5, v6);
LABEL_9:
      id v8 = (id)v7;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v3;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v7 = objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], v9, (uint64_t)v3, v10, v11);
      goto LABEL_9;
    }
    if (qword_26ABF4AF8 != -1) {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B5B8);
    }
    v12 = (id)qword_26ABF4AF0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend_description(v3, v13, v14, v15, v16);
      int v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_221DDF000, v12, OS_LOG_TYPE_ERROR, "Cannot cast %{public}@ to a set", (uint8_t *)&v19, 0xCu);
    }
  }
  id v8 = 0;
LABEL_16:

  return v8;
}

- (CLIndoorSettings)initWithSettings:(id)a3
{
  uint64_t v233 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v230.receiver = self;
  v230.super_class = (Class)CLIndoorSettings;
  id v8 = [(CLIndoorSettings *)&v230 init];
  if (!v8) {
    goto LABEL_53;
  }
  v9 = objc_msgSend_objectForKeyedSubscript_(v4, v5, qword_267F74298, v6, v7);
  v218 = v9;
  if (v9) {
    char v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);
  }
  else {
    char v14 = 1;
  }
  v8->_pipelinedEnabled = v14;
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v4, v10, qword_267F742A0, v12, v13);
  int v19 = objc_msgSend_settingToSet_(CLIndoorSettings, v16, (uint64_t)v15, v17, v18);
  objc_msgSend_setDisabledVenues_(v8, v20, (uint64_t)v19, v21, v22);

  v26 = objc_msgSend_objectForKeyedSubscript_(v4, v23, qword_267F742A8, v24, v25);
  v217 = v26;
  if (v26) {
    objc_msgSend_doubleValue(v26, v27, v28, v29, v30);
  }
  else {
    double v31 = 10.0;
  }
  objc_msgSend_setDebounceInterval_(v8, v27, v28, v29, v30, v31);
  v35 = objc_msgSend_objectForKeyedSubscript_(v4, v32, qword_267F742B0, v33, v34);
  v216 = v35;
  if (v35) {
    objc_msgSend_doubleValue(v35, v36, v37, v38, v39);
  }
  else {
    double v40 = 5.0;
  }
  objc_msgSend_setErrorBackoffDuration_(v8, v36, (uint64_t)(v40 * 1000000000.0), v38, v39);
  v44 = objc_msgSend_objectForKeyedSubscript_(v4, v41, qword_267F74310, v42, v43);
  v215 = v44;
  if (v44) {
    uint64_t v49 = (int)objc_msgSend_intValue(v44, v45, v46, v47, v48);
  }
  else {
    uint64_t v49 = 86400;
  }
  v8->_tilePrefetchActivityInterval.__rep_ = v49;
  v224 = objc_msgSend_objectForKeyedSubscript_(v4, v45, qword_267F74318, v47, v48);
  if (v224)
  {
    v8->_tilePrefetchPredictionActivityCycleAllowance.m_storage = objc_msgSend_unsignedIntValue(v224, v50, v51, v52, v53);
    v8->_tilePrefetchPredictionActivityCycleAllowance.m_initialized = 1;
  }
  v223 = objc_msgSend_objectForKeyedSubscript_(v4, v50, qword_267F742B8, v52, v53);
  if (v223)
  {
    objc_msgSend_doubleValue(v223, v54, v55, v56, v57);
    objc_msgSend_setTilePrefetchRadius_(v8, v58, 1, v60, v59);
  }
  v222 = objc_msgSend_objectForKeyedSubscript_(v4, v54, qword_267F742C0, v56, v57);
  if (v222)
  {
    objc_msgSend_doubleValue(v222, v61, v62, v63, v64);
    objc_msgSend_setTilePrefetchMaxCount_(v8, v66, 1, (unint64_t)v65, v67);
  }
  v221 = objc_msgSend_objectForKeyedSubscript_(v4, v61, qword_267F742C8, v63, v64);
  if (v221)
  {
    objc_msgSend_doubleValue(v221, v68, v69, v70, v71);
    objc_msgSend_setPrefetchClusterMergeRadius_(v8, v72, 1, v74, v73);
  }
  v220 = objc_msgSend_objectForKeyedSubscript_(v4, v68, qword_267F742D0, v70, v71);
  if (v220)
  {
    objc_msgSend_doubleValue(v220, v75, v76, v77, v78);
    objc_msgSend_setTilePrefetchRadius_(v8, v79, 1, v81, v80);
  }
  v82 = objc_msgSend_objectForKeyedSubscript_(v4, v75, qword_267F742D8, v77, v78);
  v87 = v82;
  if (v82)
  {
    objc_msgSend_doubleValue(v82, v83, v84, v85, v86);
    objc_msgSend_setTilePrefetchMaxCount_(v8, v89, 1, (unint64_t)v88, v90);
  }
  v91 = objc_msgSend_objectForKeyedSubscript_(v4, v83, qword_267F742E0, v85, v86);
  v96 = v91;
  if (v91)
  {
    objc_msgSend_doubleValue(v91, v92, v93, v94, v95);
    objc_msgSend_setPrefetchClusterMergeRadius_(v8, v97, 1, v99, v98);
  }
  v100 = objc_msgSend_objectForKeyedSubscript_(v4, v92, qword_267F742E8, v94, v95);
  v105 = v100;
  if (v100)
  {
    objc_msgSend_doubleValue(v100, v101, v102, v103, v104);
    objc_msgSend_setRegionalTilePrefetchRadius_(v8, v106, 1, v108, v107);
  }
  v219 = objc_msgSend_objectForKeyedSubscript_(v4, v101, qword_267F742F0, v103, v104);
  if (v87)
  {
    objc_msgSend_doubleValue(v219, v109, v110, v111, v112);
    objc_msgSend_setRegionalTilePrefetchMaxCount_(v8, v114, 1, (unint64_t)v113, v115);
  }
  v116 = objc_msgSend_objectForKeyedSubscript_(v4, v109, qword_267F742F8, v111, v112);
  v121 = v116;
  if (v116)
  {
    objc_msgSend_doubleValue(v116, v117, v118, v119, v120);
    objc_msgSend_setRegionalPrefetchClusterMergeRadius_(v8, v122, 1, v124, v123);
  }
  v8->_tilePrefetchRelevancyWindow.__rep_ = 604800;
  v125 = objc_msgSend_objectForKeyedSubscript_(v4, v117, qword_267F74290, v119, v120);
  v130 = objc_msgSend_sharedConfiguration(MEMORY[0x263F41770], v126, v127, v128, v129);
  v133 = objc_msgSend_defaultForKey_defaultValue_(v130, v131, @"CLPipelineAvailabilityServer", @"https://cl4.apple.com/2/m2/a.1/", v132);

  if (v125) {
    objc_msgSend_setIndoorAvailabilityTilesServerUrl_(v8, v134, (uint64_t)v125, v135, v136);
  }
  else {
    objc_msgSend_setIndoorAvailabilityTilesServerUrl_(v8, v134, (uint64_t)v133, v135, v136);
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B5B8);
    v137 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  v137 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_39:
    indoorAvailabilityTilesServerUrl = v8->_indoorAvailabilityTilesServerUrl;
    *(_DWORD *)buf = 138477827;
    v232 = indoorAvailabilityTilesServerUrl;
    _os_log_impl(&dword_221DDF000, v137, OS_LOG_TYPE_DEBUG, "indoorAvailabilityTilesServerUrl = %{private}@", buf, 0xCu);
  }
LABEL_40:
  v142 = objc_msgSend_objectForKeyedSubscript_(v4, v138, qword_267F74300, v139, v140);
  v146 = objc_msgSend_settingToSet_(CLIndoorSettings, v143, (uint64_t)v142, v144, v145);
  objc_msgSend_setForcedVenues_(v8, v147, (uint64_t)v146, v148, v149);

  v153 = objc_msgSend_objectForKeyedSubscript_(v4, v150, qword_267F74308, v151, v152);
  v157 = v153;
  if (v153)
  {
    v158 = objc_msgSend_objectForKeyedSubscript_(v153, v154, @"lat", v155, v156);
    objc_msgSend_doubleValue(v158, v159, v160, v161, v162);
    uint64_t v228 = v163;

    uint64_t v167 = objc_msgSend_objectForKeyedSubscript_(v157, v164, @"lon", v165, v166);
    objc_msgSend_doubleValue((void *)v167, v168, v169, v170, v171);
    uint64_t v229 = v172;

    v176 = objc_msgSend_objectForKeyedSubscript_(v157, v173, @"horizontalAccuracy", v174, v175);
    LOBYTE(v167) = v176 == 0;

    if (v167)
    {
      uint64_t v226 = 0x4049000000000000;
    }
    else
    {
      v180 = objc_msgSend_objectForKeyedSubscript_(v157, v177, @"horizontalAccuracy", v178, v179);
      objc_msgSend_doubleValue(v180, v181, v182, v183, v184);
      uint64_t v226 = v185;
    }
    v190 = objc_msgSend_objectForKeyedSubscript_(v157, v177, @"lifespan", v178, v179);
    BOOL v191 = v190 == 0;

    if (v191)
    {
      unint64_t v227 = 0xBFF0000000000000;
    }
    else
    {
      v195 = objc_msgSend_objectForKeyedSubscript_(v157, v192, @"lifespan", v193, v194);
      objc_msgSend_doubleValue(v195, v196, v197, v198, v199);
      unint64_t v227 = v200;
    }
    v201 = [CLGpsPosition alloc];
    uint64_t v204 = objc_msgSend_initWithLocation_andPrivateLocation_(v201, v202, (uint64_t)v225, (uint64_t)buf, v203);
    fakeLastFix = v8->_fakeLastFix;
    v8->_fakeLastFix = (CLGpsPosition *)v204;
  }
  else
  {
    v186 = v8->_fakeLastFix;
    v8->_fakeLastFix = 0;
  }
  v206 = objc_msgSend_objectForKeyedSubscript_(v4, v187, qword_267F74320, v188, v189);
  v211 = v206;
  if (v206) {
    objc_msgSend_doubleValue(v206, v207, v208, v209, v210);
  }
  else {
    double v212 = 250.0;
  }
  objc_msgSend_setVenueGroupDistance_(v8, v207, v208, v209, v210, v212);
  v213 = v8;

LABEL_53:
  return v8;
}

- (const)tilePrefetchRadius
{
  return &self->_tilePrefetchRadius;
}

- (const)tilePrefetchMaxCount
{
  return &self->_tilePrefetchMaxCount;
}

- (const)prefetchClusterMergeRadius
{
  return &self->_prefetchClusterMergeRadius;
}

- (BOOL)pipelinedEnabled
{
  return self->_pipelinedEnabled;
}

- (void)setPipelinedEnabled:(BOOL)a3
{
  self->_pipelinedEnabled = a3;
}

- (NSSet)disabledVenues
{
  return self->_disabledVenues;
}

- (void)setDisabledVenues:(id)a3
{
}

- (double)debounceInterval
{
  return *(double *)(a1 + 24);
}

- (uint64_t)setDebounceInterval:(uint64_t)result
{
  *(double *)(result + 24) = a2;
  return result;
}

- (duration<long)errorBackoffDuration
{
  return self->_errorBackoffDuration;
}

- (void)setErrorBackoffDuration:(duration<long)long
{
  self->_errorBackoffDuration = a3;
}

- (duration<long)tilePrefetchActivityInterval
{
  return self->_tilePrefetchActivityInterval;
}

- (void)setTilePrefetchActivityInterval:(duration<long)long
{
  self->_tilePrefetchActivityInterval = a3;
}

- (optional<unsigned)tilePrefetchPredictionActivityCycleAllowance
{
  return self->_tilePrefetchPredictionActivityCycleAllowance;
}

- (void)setTilePrefetchPredictionActivityCycleAllowance:(optional<unsigned int>)a3
{
  self->_tilePrefetchPredictionActivityCycleAllowance = a3;
}

- (void)setTilePrefetchRadius:(optional<double>)a3
{
  self->_tilePrefetchRadius = a3;
}

- (void)setTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_tilePrefetchMaxCount = a3;
}

- (void)setPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_prefetchClusterMergeRadius = a3;
}

- (optional<double>)indoorTilePrefetchRadius
{
  double m_storage = self->_indoorTilePrefetchRadius.m_storage;
  uint64_t v3 = *(void *)&self->_indoorTilePrefetchRadius.m_initialized;
  result.double m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorTilePrefetchRadius:(optional<double>)a3
{
  self->_indoorTilePrefetchRadius = a3;
}

- (optional<unsigned)indoorTilePrefetchMaxCount
{
  unint64_t m_storage = self->_indoorTilePrefetchMaxCount.m_storage;
  uint64_t v3 = *(void *)&self->_indoorTilePrefetchMaxCount.m_initialized;
  result.unint64_t m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_indoorTilePrefetchMaxCount = a3;
}

- (optional<double>)indoorPrefetchClusterMergeRadius
{
  double m_storage = self->_indoorPrefetchClusterMergeRadius.m_storage;
  uint64_t v3 = *(void *)&self->_indoorPrefetchClusterMergeRadius.m_initialized;
  result.double m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_indoorPrefetchClusterMergeRadius = a3;
}

- (optional<double>)regionalTilePrefetchRadius
{
  double m_storage = self->_regionalTilePrefetchRadius.m_storage;
  uint64_t v3 = *(void *)&self->_regionalTilePrefetchRadius.m_initialized;
  result.double m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalTilePrefetchRadius:(optional<double>)a3
{
  self->_regionalTilePrefetchRadius = a3;
}

- (optional<unsigned)regionalTilePrefetchMaxCount
{
  unint64_t m_storage = self->_regionalTilePrefetchMaxCount.m_storage;
  uint64_t v3 = *(void *)&self->_regionalTilePrefetchMaxCount.m_initialized;
  result.unint64_t m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_regionalTilePrefetchMaxCount = a3;
}

- (optional<double>)regionalPrefetchClusterMergeRadius
{
  double m_storage = self->_regionalPrefetchClusterMergeRadius.m_storage;
  uint64_t v3 = *(void *)&self->_regionalPrefetchClusterMergeRadius.m_initialized;
  result.double m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_regionalPrefetchClusterMergeRadius = a3;
}

- (duration<long)tilePrefetchRelevancyWindow
{
  return self->_tilePrefetchRelevancyWindow;
}

- (void)setTilePrefetchRelevancyWindow:(duration<long)long
{
  self->_tilePrefetchRelevancyWindow = a3;
}

- (NSString)indoorAvailabilityTilesServerUrl
{
  return self->_indoorAvailabilityTilesServerUrl;
}

- (void)setIndoorAvailabilityTilesServerUrl:(id)a3
{
}

- (NSSet)forcedVenues
{
  return self->_forcedVenues;
}

- (void)setForcedVenues:(id)a3
{
}

- (CLGpsPosition)fakeLastFix
{
  return self->_fakeLastFix;
}

- (void)setFakeLastFix:(id)a3
{
}

- (double)venueGroupDistance
{
  return self->_venueGroupDistance;
}

- (void)setVenueGroupDistance:(double)a3
{
  self->_venueGroupDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeLastFix, 0);
  objc_storeStrong((id *)&self->_forcedVenues, 0);
  objc_storeStrong((id *)&self->_indoorAvailabilityTilesServerUrl, 0);
  objc_storeStrong((id *)&self->_disabledVenues, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 48) = 0;
  *((unsigned char *)self + 96) = 0;
  *((unsigned char *)self + 112) = 0;
  *((unsigned char *)self + 128) = 0;
  *((unsigned char *)self + 144) = 0;
  *((unsigned char *)self + 160) = 0;
  *((unsigned char *)self + 176) = 0;
  *((unsigned char *)self + 192) = 0;
  *((unsigned char *)self + 208) = 0;
  *((unsigned char *)self + 224) = 0;
  return self;
}

@end