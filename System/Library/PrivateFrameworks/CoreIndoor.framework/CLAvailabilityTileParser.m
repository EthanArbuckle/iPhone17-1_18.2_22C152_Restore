@interface CLAvailabilityTileParser
+ (BOOL)generateAvlTileFromJSON:(id)a3 atPath:(id)a4;
+ (void)_setParamOverrides:(void *)a3 fromDict:(id)a4;
- (BOOL)_openTileFileForIncrementalIO;
- (BOOL)getNextVenueBoundsIncrementally:(void *)a3;
- (BOOL)tileIsOpenForIncrementalIO;
- (CLAvailabilityTileParser)init;
- (CLAvailabilityTileParser)initWithEmptyTile;
- (CLAvailabilityTileParser)initWithTilePathIncrementalIO:(id)a3;
- (NSURL)path;
- (id).cxx_construct;
- (int)numTotalExpectedExteriorsInVenues;
- (int)numVenuesExpected;
- (unint64_t)venuesCount;
- (void)getAvlTile;
@end

@implementation CLAvailabilityTileParser

- (BOOL)tileIsOpenForIncrementalIO
{
  return *((unsigned char *)self->_avlTile.__ptr_ + 16);
}

- (int)numTotalExpectedExteriorsInVenues
{
  return sub_221E334B0((uint64_t)self->_avlTile.__ptr_);
}

- (int)numVenuesExpected
{
  if (objc_msgSend_tileIsOpenForIncrementalIO(self, a2, v2, v3, v4)) {
    return *((_DWORD *)self->_avlTile.__ptr_ + 14);
  }
  else {
    return objc_msgSend_venuesCount(self, v6, v7, v8, v9);
  }
}

- (BOOL)getNextVenueBoundsIncrementally:(void *)a3
{
  return sub_221E33130((uint64_t)self->_avlTile.__ptr_, (uint64_t)a3);
}

- (BOOL)_openTileFileForIncrementalIO
{
  path = self->_path;
  if (!path)
  {
    if (qword_26ABF4AF8 == -1)
    {
      v16 = qword_26ABF4AF0;
      if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
      v16 = qword_26ABF4AF0;
      if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    LOWORD(v29) = 0;
    _os_log_impl(&dword_221DDF000, v16, OS_LOG_TYPE_FAULT, "_openTileFileForIncrementalIO: Must specify a valid path to deserialize the availability tile!", (uint8_t *)&v29, 2u);
    return 0;
  }
  objc_msgSend_path(path, a2, v2, v3, v4);
  id v7 = objc_claimAutoreleasedReturnValue();
  v12 = (const char *)objc_msgSend_UTF8String(v7, v8, v9, v10, v11);
  size_t v13 = strlen(v12);
  if (v13 >= 0x7FFFFFFFFFFFFFF8) {
    sub_221DE2208();
  }
  std::string::size_type v14 = v13;
  if (v13 >= 0x17)
  {
    uint64_t v18 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v18 = v13 | 7;
    }
    uint64_t v19 = v18 + 1;
    p_dst = (std::string *)operator new(v18 + 1);
    __dst.__r_.__value_.__l.__size_ = v14;
    __dst.__r_.__value_.__r.__words[2] = v19 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_13;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v13;
  p_dst = &__dst;
  if (v13) {
LABEL_13:
  }
    memmove(p_dst, v12, v14);
  p_dst->__r_.__value_.__s.__data_[v14] = 0;

  sub_221DE2778((const char *)&__dst, 0, (int *)&v29);
  if (v29 > 1)
  {
    char v38 = 1;
    sub_221E32C10(&__dst, &v38, (uint64_t)&v29);
    v20 = (char *)operator new(0x80uLL);
    *((void *)v20 + 1) = 0;
    *((void *)v20 + 2) = 0;
    *(void *)v20 = &unk_26D46B7C8;
    *(_OWORD *)(v20 + 24) = v29;
    long long v29 = 0uLL;
    v20[40] = v30;
    *((void *)v20 + 6) = v31;
    *(_OWORD *)(v20 + 56) = *(_OWORD *)__p;
    *((void *)v20 + 9) = v33;
    __p[1] = 0;
    uint64_t v33 = 0;
    uint64_t v31 = 0;
    __p[0] = 0;
    *((_OWORD *)v20 + 5) = v34;
    v21 = v36;
    v36 = 0;
    *((void *)v20 + 12) = v35;
    *((void *)v20 + 13) = v21;
    *((_OWORD *)v20 + 7) = v37;
    cntrl = self->_avlTile.__cntrl_;
    self->_avlTile.__ptr_ = (AvailabilityTile *)(v20 + 24);
    self->_avlTile.__cntrl_ = (__shared_weak_count *)v20;
    if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
    v23 = v36;
    v36 = 0;
    if (v23)
    {
      v24 = sub_221E3605C(v23);
      MEMORY[0x223C92640](v24, 0x1000C4052888210);
    }
    if (SHIBYTE(v33) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v25 = v31;
    uint64_t v31 = 0;
    if (v25) {
      (*(void (**)(uint64_t))(*(void *)v25 + 8))(v25);
    }
    v26 = (std::__shared_weak_count *)*((void *)&v29 + 1);
    if (*((void *)&v29 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v29 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
    BOOL v17 = v38 != 0;
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_33;
    }
    return v17;
  }
  if (qword_26ABF4AF8 == -1)
  {
    v27 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
  v27 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR))
  {
LABEL_31:
    LOWORD(v29) = 0;
    _os_log_impl(&dword_221DDF000, v27, OS_LOG_TYPE_ERROR, "_openTileFileForIncrementalIO: tile doesn't exist on-disk. attempting to deserialize will fail", (uint8_t *)&v29, 2u);
  }
LABEL_32:
  BOOL v17 = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
LABEL_33:
  }
    operator delete(__dst.__r_.__value_.__l.__data_);
  return v17;
}

- (CLAvailabilityTileParser)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLAvailabilityTileParser;
  uint64_t v2 = [(CLAvailabilityTileParser *)&v7 init];
  uint64_t v3 = v2;
  if (!v2) {
    return v3;
  }
  path = v2->_path;
  v2->_path = 0;

  cntrl = (std::__shared_weak_count *)v3->_avlTile.__cntrl_;
  v3->_avlTile.__ptr_ = 0;
  v3->_avlTile.__cntrl_ = 0;
  if (!cntrl || atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v3;
  }
  ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
  std::__shared_weak_count::__release_weak(cntrl);
  return v3;
}

- (CLAvailabilityTileParser)initWithEmptyTile
{
  v9.receiver = self;
  v9.super_class = (Class)CLAvailabilityTileParser;
  uint64_t v2 = [(CLAvailabilityTileParser *)&v9 init];
  uint64_t v3 = v2;
  if (!v2) {
    return v3;
  }
  path = v2->_path;
  v2->_path = 0;

  v5 = (__shared_weak_count *)operator new(0x80uLL);
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)v5 = &unk_26D46B7C8;
  uint64_t v6 = sub_221E330A8((uint64_t)v5 + 24);
  cntrl = (std::__shared_weak_count *)v3->_avlTile.__cntrl_;
  v3->_avlTile.__ptr_ = (AvailabilityTile *)v6;
  v3->_avlTile.__cntrl_ = v5;
  if (!cntrl || atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v3;
  }
  ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
  std::__shared_weak_count::__release_weak(cntrl);
  return v3;
}

- (CLAvailabilityTileParser)initWithTilePathIncrementalIO:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLAvailabilityTileParser;
  uint64_t v6 = [(CLAvailabilityTileParser *)&v14 init];
  objc_super v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_path, a3),
        (objc_msgSend__openTileFileForIncrementalIO(v7, v8, v9, v10, v11) & 1) == 0))
  {
    v12 = 0;
  }
  else
  {
    v12 = v7;
  }

  return v12;
}

- (unint64_t)venuesCount
{
  return (int)sub_221E33B40((uint64_t)self->_avlTile.__ptr_);
}

- (void)getAvlTile
{
  return self->_avlTile.__ptr_;
}

+ (void)_setParamOverrides:(void *)a3 fromDict:(id)a4
{
  id v5 = a4;
  uint64_t v9 = objc_msgSend_valueForKey_(v5, v6, @"notifyIntervalNanos", v7, v8);

  if (v9)
  {
    size_t v13 = objc_msgSend_objectForKeyedSubscript_(v5, v10, @"notifyIntervalNanos", v11, v12);
    unsigned int v18 = objc_msgSend_unsignedIntValue(v13, v14, v15, v16, v17);
    *((_DWORD *)a3 + 75) |= 1u;
    *((void *)a3 + 2) = v18;
  }
  uint64_t v19 = objc_msgSend_valueForKey_(v5, v10, @"numParticles", v11, v12);

  if (v19)
  {
    v23 = objc_msgSend_objectForKeyedSubscript_(v5, v20, @"numParticles", v21, v22);
    int v28 = objc_msgSend_unsignedIntValue(v23, v24, v25, v26, v27);
    *((_DWORD *)a3 + 75) |= 2u;
    *((_DWORD *)a3 + 6) = v28;
  }
  long long v29 = objc_msgSend_valueForKey_(v5, v20, @"localizerType", v21, v22);

  if (v29)
  {
    uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v5, v30, @"localizerType", v31, v32);
    int v38 = objc_msgSend_unsignedIntValue(v33, v34, v35, v36, v37);
    *((_DWORD *)a3 + 75) |= 4u;
    *((_DWORD *)a3 + 7) = v38;
  }
  v39 = objc_msgSend_valueForKey_(v5, v30, @"modeEstimator", v31, v32);

  if (v39)
  {
    v43 = objc_msgSend_objectForKeyedSubscript_(v5, v40, @"modeEstimator", v41, v42);
    int v48 = objc_msgSend_unsignedIntValue(v43, v44, v45, v46, v47);
    *((_DWORD *)a3 + 75) |= 0x10u;
    *((_DWORD *)a3 + 9) = v48;
  }
  v49 = objc_msgSend_valueForKey_(v5, v40, @"confidenceFactor", v41, v42);

  if (v49)
  {
    v53 = objc_msgSend_objectForKeyedSubscript_(v5, v50, @"confidenceFactor", v51, v52);
    objc_msgSend_floatValue(v53, v54, v55, v56, v57);
    *((_DWORD *)a3 + 75) |= 0x20u;
    *((_DWORD *)a3 + 10) = v58;
  }
  v59 = objc_msgSend_valueForKey_(v5, v50, @"motionPdrUnmodelledHeadingVariancePerSecond", v51, v52);

  if (v59)
  {
    v63 = objc_msgSend_objectForKeyedSubscript_(v5, v60, @"motionPdrUnmodelledHeadingVariancePerSecond", v61, v62);
    objc_msgSend_floatValue(v63, v64, v65, v66, v67);
    *((_DWORD *)a3 + 75) |= 0x40u;
    *((_DWORD *)a3 + 11) = v68;
  }
  v69 = objc_msgSend_valueForKey_(v5, v60, @"time2dMotionVariancePerSecond", v61, v62);

  if (v69)
  {
    v73 = objc_msgSend_objectForKeyedSubscript_(v5, v70, @"time2dMotionVariancePerSecond", v71, v72);
    objc_msgSend_floatValue(v73, v74, v75, v76, v77);
    *((_DWORD *)a3 + 75) |= 0x800u;
    *((_DWORD *)a3 + 24) = v78;
  }
  v79 = objc_msgSend_valueForKey_(v5, v70, @"secondsBetweenVenueTransitions", v71, v72);

  if (v79)
  {
    v83 = objc_msgSend_objectForKeyedSubscript_(v5, v80, @"secondsBetweenVenueTransitions", v81, v82);
    objc_msgSend_doubleValue(v83, v84, v85, v86, v87);
    *((_DWORD *)a3 + 75) |= 0x8000u;
    *((void *)a3 + 14) = v88;
  }
  v89 = objc_msgSend_valueForKey_(v5, v80, @"coarseIndoorFloorSelection", v81, v82);

  if (v89)
  {
    v93 = objc_msgSend_objectForKeyedSubscript_(v5, v90, @"coarseIndoorFloorSelection", v91, v92);
    unsigned int v98 = objc_msgSend_unsignedIntValue(v93, v94, v95, v96, v97);
    *((_DWORD *)a3 + 75) |= 1u;
    *((void *)a3 + 2) = v98;
  }
  v99 = objc_msgSend_valueForKey_(v5, v90, @"gpsStrobeDistance", v91, v92);

  if (v99)
  {
    v103 = objc_msgSend_objectForKeyedSubscript_(v5, v100, @"gpsStrobeDistance", v101, v102);
    objc_msgSend_floatValue(v103, v104, v105, v106, v107);
    *((_DWORD *)a3 + 75) |= 0x20000u;
    *((_DWORD *)a3 + 30) = v108;
  }
  v109 = objc_msgSend_valueForKey_(v5, v100, @"lifespanDeepIndoors", v101, v102);

  if (v109)
  {
    v113 = objc_msgSend_objectForKeyedSubscript_(v5, v110, @"lifespanDeepIndoors", v111, v112);
    objc_msgSend_floatValue(v113, v114, v115, v116, v117);
    *((_DWORD *)a3 + 75) |= 0x40000u;
    *((_DWORD *)a3 + 31) = v118;
  }
  v119 = objc_msgSend_valueForKey_(v5, v110, @"lifespanNearVenueEdge", v111, v112);

  if (v119)
  {
    v123 = objc_msgSend_objectForKeyedSubscript_(v5, v120, @"lifespanNearVenueEdge", v121, v122);
    objc_msgSend_floatValue(v123, v124, v125, v126, v127);
    *((_DWORD *)a3 + 75) |= 0x80000u;
    *((_DWORD *)a3 + 32) = v128;
  }
  v129 = objc_msgSend_valueForKey_(v5, v120, @"lifespanAuxiliary", v121, v122);

  if (v129)
  {
    v133 = objc_msgSend_objectForKeyedSubscript_(v5, v130, @"lifespanAuxiliary", v131, v132);
    objc_msgSend_floatValue(v133, v134, v135, v136, v137);
    *((_DWORD *)a3 + 75) |= 0x100000u;
    *((_DWORD *)a3 + 33) = v138;
  }
  v139 = objc_msgSend_valueForKey_(v5, v130, @"wifiLikelihoodOnMapPriorFactor", v131, v132);

  if (v139)
  {
    v143 = objc_msgSend_objectForKeyedSubscript_(v5, v140, @"wifiLikelihoodOnMapPriorFactor", v141, v142);
    objc_msgSend_floatValue(v143, v144, v145, v146, v147);
    *((_DWORD *)a3 + 75) |= 0x200000u;
    *((_DWORD *)a3 + 34) = v148;
  }
  v149 = objc_msgSend_valueForKey_(v5, v140, @"coarseIndoorRadioOddsTransform", v141, v142);

  if (v149)
  {
    v153 = objc_msgSend_objectForKeyedSubscript_(v5, v150, @"coarseIndoorRadioOddsTransform", v151, v152);
    int v158 = objc_msgSend_unsignedIntValue(v153, v154, v155, v156, v157);
    *((_DWORD *)a3 + 75) |= 0x800000u;
    *((_DWORD *)a3 + 35) = v158;
  }
  v159 = objc_msgSend_valueForKey_(v5, v150, @"feasibleLocationRequiredPrbIndoor", v151, v152);

  if (v159)
  {
    v163 = objc_msgSend_objectForKeyedSubscript_(v5, v160, @"feasibleLocationRequiredPrbIndoor", v161, v162);
    objc_msgSend_doubleValue(v163, v164, v165, v166, v167);
    *((_DWORD *)a3 + 75) |= 0x1000000u;
    *((void *)a3 + 19) = v168;
  }
  v169 = objc_msgSend_valueForKey_(v5, v160, @"assignFloorWeightsByLikelihood", v161, v162);

  if (v169)
  {
    v173 = objc_msgSend_objectForKeyedSubscript_(v5, v170, @"assignFloorWeightsByLikelihood", v171, v172);
    char v178 = objc_msgSend_BOOLValue(v173, v174, v175, v176, v177);
    *((_DWORD *)a3 + 75) |= 0x10000000u;
    *((unsigned char *)a3 + 192) = v178;
  }
  v179 = objc_msgSend_valueForKey_(v5, v170, @"priorOnMapWeightFraction", v171, v172);

  if (v179)
  {
    v183 = objc_msgSend_objectForKeyedSubscript_(v5, v180, @"priorOnMapWeightFraction", v181, v182);
    objc_msgSend_doubleValue(v183, v184, v185, v186, v187);
    *((_DWORD *)a3 + 75) |= 0x20000000u;
    *((void *)a3 + 23) = v188;
  }
  v189 = objc_msgSend_valueForKey_(v5, v180, @"enableBaroAidedFloorTransition", v181, v182);

  if (v189)
  {
    v193 = objc_msgSend_objectForKeyedSubscript_(v5, v190, @"enableBaroAidedFloorTransition", v191, v192);
    char v198 = objc_msgSend_BOOLValue(v193, v194, v195, v196, v197);
    *((_DWORD *)a3 + 75) |= 0x40000000u;
    *((unsigned char *)a3 + 193) = v198;
  }
  v199 = objc_msgSend_valueForKey_(v5, v190, @"time2dMotionVariancePerSecondWifi2", v191, v192);

  if (v199)
  {
    v203 = objc_msgSend_objectForKeyedSubscript_(v5, v200, @"time2dMotionVariancePerSecondWifi2", v201, v202);
    objc_msgSend_floatValue(v203, v204, v205, v206, v207);
    *((_DWORD *)a3 + 75) |= 0x80000000;
    *((_DWORD *)a3 + 49) = v208;
  }
  v209 = objc_msgSend_valueForKey_(v5, v200, @"bilinearObservations", v201, v202);

  if (v209)
  {
    v213 = objc_msgSend_objectForKeyedSubscript_(v5, v210, @"bilinearObservations", v211, v212);
    char v218 = objc_msgSend_BOOLValue(v213, v214, v215, v216, v217);
    *((_DWORD *)a3 + 76) |= 2u;
    *((unsigned char *)a3 + 194) = v218;
  }
  v219 = objc_msgSend_valueForKey_(v5, v210, @"walkableBlueDotSearchRadius", v211, v212);

  if (v219)
  {
    v223 = objc_msgSend_objectForKeyedSubscript_(v5, v220, @"walkableBlueDotSearchRadius", v221, v222);
    objc_msgSend_floatValue(v223, v224, v225, v226, v227);
    *((_DWORD *)a3 + 76) |= 0x10u;
    *((_DWORD *)a3 + 56) = v228;
  }
  v229 = objc_msgSend_valueForKey_(v5, v220, @"motionPdrUnmodelledHeadingVariancePerSecondWifi2", v221, v222);

  if (v229)
  {
    v233 = objc_msgSend_objectForKeyedSubscript_(v5, v230, @"motionPdrUnmodelledHeadingVariancePerSecondWifi2", v231, v232);
    objc_msgSend_floatValue(v233, v234, v235, v236, v237);
    *((_DWORD *)a3 + 76) |= 0x40u;
    *((_DWORD *)a3 + 57) = v238;
  }
  v239 = objc_msgSend_valueForKey_(v5, v230, @"particleFilterOffMapProbabilityFloor", v231, v232);

  if (v239)
  {
    v243 = objc_msgSend_objectForKeyedSubscript_(v5, v240, @"particleFilterOffMapProbabilityFloor", v241, v242);
    objc_msgSend_floatValue(v243, v244, v245, v246, v247);
    *((_DWORD *)a3 + 76) |= 0x100u;
    *((_DWORD *)a3 + 62) = v248;
  }
  v249 = objc_msgSend_valueForKey_(v5, v240, @"coarseOutdoorProbabilityFloor", v241, v242);

  if (v249)
  {
    v253 = objc_msgSend_objectForKeyedSubscript_(v5, v250, @"coarseOutdoorProbabilityFloor", v251, v252);
    objc_msgSend_floatValue(v253, v254, v255, v256, v257);
    *((_DWORD *)a3 + 76) |= 0x200u;
    *((_DWORD *)a3 + 63) = v258;
  }
  v259 = objc_msgSend_valueForKey_(v5, v250, @"pdr", v251, v252);

  if (v259)
  {
    if (qword_26ABF4AF8 == -1)
    {
      v263 = (id)qword_26ABF4AF0;
      if (!os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
      {
LABEL_55:

        goto LABEL_56;
      }
    }
    else
    {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
      v263 = (id)qword_26ABF4AF0;
      if (!os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_55;
      }
    }
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v263, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pdr is not currently supported", v336, 2u);
    goto LABEL_55;
  }
LABEL_56:
  v264 = objc_msgSend_valueForKey_(v5, v260, @"pedomCompassMotionWifi2", v261, v262);

  if (!v264) {
    goto LABEL_61;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v268 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  v268 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
  {
LABEL_59:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v268, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pedomCompassMotionWifi2 is not currently supported", v336, 2u);
  }
LABEL_60:

LABEL_61:
  v269 = objc_msgSend_valueForKey_(v5, v265, @"deadReckoning", v266, v267);

  if (!v269) {
    goto LABEL_66;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v273 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  v273 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
  {
LABEL_64:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v273, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning deadReckoning is not currently supported", v336, 2u);
  }
LABEL_65:

LABEL_66:
  v274 = objc_msgSend_valueForKey_(v5, v270, @"coarseIndoor", v271, v272);

  if (!v274) {
    goto LABEL_71;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v278 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v278, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
  v278 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v278, OS_LOG_TYPE_DEFAULT))
  {
LABEL_69:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v278, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning coarseIndoor is not currently supported", v336, 2u);
  }
LABEL_70:

LABEL_71:
  v279 = objc_msgSend_valueForKey_(v5, v275, @"gpsFusionGlobalParams", v276, v277);

  if (!v279) {
    goto LABEL_76;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v283 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v283, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
  v283 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v283, OS_LOG_TYPE_DEFAULT))
  {
LABEL_74:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v283, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning gpsFusionGlobalParams is not currently supported", v336, 2u);
  }
LABEL_75:

LABEL_76:
  v284 = objc_msgSend_valueForKey_(v5, v280, @"wifi", v281, v282);

  if (!v284) {
    goto LABEL_81;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v288 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v288, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  v288 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v288, OS_LOG_TYPE_DEFAULT))
  {
LABEL_79:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v288, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning wifi is not currently supported", v336, 2u);
  }
LABEL_80:

LABEL_81:
  v289 = objc_msgSend_valueForKey_(v5, v285, @"bodyFixed", v286, v287);

  if (!v289) {
    goto LABEL_86;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v293 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v293, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_85;
    }
    goto LABEL_84;
  }
  v293 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v293, OS_LOG_TYPE_DEFAULT))
  {
LABEL_84:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v293, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning bodyFixed is not currently supported", v336, 2u);
  }
LABEL_85:

LABEL_86:
  v294 = objc_msgSend_valueForKey_(v5, v290, @"motionTruth", v291, v292);

  if (!v294) {
    goto LABEL_91;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v298 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v298, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }
  v298 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v298, OS_LOG_TYPE_DEFAULT))
  {
LABEL_89:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v298, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning motionTruth is not currently supported", v336, 2u);
  }
LABEL_90:

LABEL_91:
  v299 = objc_msgSend_valueForKey_(v5, v295, @"multiphoneDbm", v296, v297);

  if (!v299) {
    goto LABEL_96;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v303 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v303, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_95;
    }
    goto LABEL_94;
  }
  v303 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v303, OS_LOG_TYPE_DEFAULT))
  {
LABEL_94:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v303, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning multiphoneDbm is not currently supported", v336, 2u);
  }
LABEL_95:

LABEL_96:
  v304 = objc_msgSend_valueForKey_(v5, v300, @"pedomCompassMotion", v301, v302);

  if (!v304) {
    goto LABEL_101;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v308 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v308, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_100;
    }
    goto LABEL_99;
  }
  v308 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v308, OS_LOG_TYPE_DEFAULT))
  {
LABEL_99:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v308, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pedomCompassMotion is not currently supported", v336, 2u);
  }
LABEL_100:

LABEL_101:
  v309 = objc_msgSend_valueForKey_(v5, v305, @"injection", v306, v307);

  if (!v309) {
    goto LABEL_106;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v313 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  v313 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
  {
LABEL_104:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v313, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning injection is not currently supported", v336, 2u);
  }
LABEL_105:

LABEL_106:
  v314 = objc_msgSend_valueForKey_(v5, v310, @"beacon", v311, v312);

  if (!v314) {
    goto LABEL_111;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v318 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_110;
    }
    goto LABEL_109;
  }
  v318 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
  {
LABEL_109:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v318, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning beacon is not currently supported", v336, 2u);
  }
LABEL_110:

LABEL_111:
  v319 = objc_msgSend_valueForKey_(v5, v315, @"wallBehavior", v316, v317);

  if (!v319) {
    goto LABEL_116;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v323 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v323, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_115;
    }
    goto LABEL_114;
  }
  v323 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v323, OS_LOG_TYPE_DEFAULT))
  {
LABEL_114:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v323, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning wallBehavior is not currently supported", v336, 2u);
  }
LABEL_115:

LABEL_116:
  v324 = objc_msgSend_valueForKey_(v5, v320, @"dynamicUniverseParameters", v321, v322);

  if (!v324) {
    goto LABEL_121;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v328 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v328, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_120;
    }
    goto LABEL_119;
  }
  v328 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v328, OS_LOG_TYPE_DEFAULT))
  {
LABEL_119:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v328, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning dynamicUniverseParameters is not currently supported", v336, 2u);
  }
LABEL_120:

LABEL_121:
  v329 = objc_msgSend_valueForKey_(v5, v325, @"dynamicUniverseParameters", v326, v327);

  if (!v329) {
    goto LABEL_126;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
    v333 = (id)qword_26ABF4AF0;
    if (!os_log_type_enabled(v333, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_125;
    }
    goto LABEL_124;
  }
  v333 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v333, OS_LOG_TYPE_DEFAULT))
  {
LABEL_124:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v333, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning dynamicUniverseParameters is not currently supported", v336, 2u);
  }
LABEL_125:

LABEL_126:
  v334 = objc_msgSend_valueForKey_(v5, v330, @"altitude", v331, v332);

  if (v334)
  {
    if (qword_26ABF4AF8 == -1)
    {
      v335 = (id)qword_26ABF4AF0;
      if (!os_log_type_enabled(v335, OS_LOG_TYPE_DEFAULT))
      {
LABEL_130:

        goto LABEL_131;
      }
    }
    else
    {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
      v335 = (id)qword_26ABF4AF0;
      if (!os_log_type_enabled(v335, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_130;
      }
    }
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_221DDF000, v335, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning altitude is not currently supported", v336, 2u);
    goto LABEL_130;
  }
LABEL_131:
}

+ (BOOL)generateAvlTileFromJSON:(id)a3 atPath:(id)a4
{
  uint64_t v462 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v413 = v5;
  v408 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend_dataUsingEncoding_(v5, v7, 4, v8, v9);
      v407 = id v439 = 0;
      v414 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v10, (uint64_t)v407, 0, (uint64_t)&v439);
      id v410 = v439;
      if (v410)
      {
        if (qword_26ABF4AF8 != -1) {
          dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
        }
        log = (id)qword_26ABF4AF0;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_description(v410, v14, v15, v16, v17);
          id v18 = objc_claimAutoreleasedReturnValue();
          uint64_t v23 = objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
          id v24 = v413;
          uint64_t v29 = objc_msgSend_UTF8String(v24, v25, v26, v27, v28);
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = v23;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v29;
          _os_log_impl(&dword_221DDF000, log, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, failed to generate, error=%s, str=\n%s\n", buf, 0x16u);
        }
        BOOL v30 = 0;
        goto LABEL_154;
      }
      uint64_t v31 = objc_msgSend_objectForKey_(v414, v11, @"venues", v12, v13);
      uint64_t v36 = v31;
      if (v31)
      {
        if (objc_msgSend_count(v31, v32, v33, v34, v35))
        {
          sub_221E3838C((uint64_t)buf);
          v404 = v36;
          if (qword_26ABF4AF8 != -1) {
            dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
          }
          uint64_t v37 = (id)qword_26ABF4AF0;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v42 = objc_msgSend_count(v404, v38, v39, v40, v41);
            LODWORD(v440[0]) = 134217984;
            *(void **)((char *)v440 + 4) = v42;
            _os_log_impl(&dword_221DDF000, v37, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, adding %lu venues", (uint8_t *)v440, 0xCu);
          }

          long long v437 = 0u;
          long long v438 = 0u;
          long long v435 = 0u;
          long long v436 = 0u;
          log = v404;
          uint64_t v405 = objc_msgSend_countByEnumeratingWithState_objects_count_(log, v43, (uint64_t)&v435, (uint64_t)v444, 16);
          if (v405)
          {
            uint64_t v406 = *(void *)v436;
            do
            {
              for (uint64_t i = 0; i != v405; ++i)
              {
                if (*(void *)v436 != v406) {
                  objc_enumerationMutation(log);
                }
                v412 = *(void **)(*((void *)&v435 + 1) + 8 * i);
                int v47 = *(_DWORD *)v446;
                uint64_t v48 = *(int *)&buf[24];
                if (*(int *)&buf[24] >= *(int *)v446)
                {
                  if (*(_DWORD *)v446 == *(_DWORD *)&v446[4])
                  {
                    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)&buf[16]);
                    int v47 = *(_DWORD *)v446;
                  }
                  *(_DWORD *)v446 = v47 + 1;
                  operator new();
                }
                ++*(_DWORD *)&buf[24];
                uint64_t v49 = *(void *)(*(void *)&buf[16] + 8 * v48);
                v50 = objc_msgSend_objectForKey_(v412, v44, @"exteriors", v45, v46);
                long long v433 = 0u;
                long long v434 = 0u;
                long long v431 = 0u;
                long long v432 = 0u;
                obunint64_t j = v50;
                uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v431, (uint64_t)v443, 16);
                uint64_t v56 = v52;
                if (v52)
                {
                  uint64_t v416 = *(void *)v432;
                  do
                  {
                    uint64_t v57 = 0;
                    do
                    {
                      if (*(void *)v432 != v416) {
                        objc_enumerationMutation(obj);
                      }
                      int v58 = *(void **)(*((void *)&v431 + 1) + 8 * v57);
                      int v59 = *(_DWORD *)(v49 + 52);
                      uint64_t v60 = *(int *)(v49 + 48);
                      if ((int)v60 >= v59)
                      {
                        if (v59 == *(_DWORD *)(v49 + 56))
                        {
                          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(v49 + 40));
                          int v59 = *(_DWORD *)(v49 + 52);
                        }
                        *(_DWORD *)(v49 + 52) = v59 + 1;
                        operator new();
                      }
                      uint64_t v61 = *(void *)(v49 + 40);
                      *(_DWORD *)(v49 + 48) = v60 + 1;
                      uint64_t v62 = *(void *)(v61 + 8 * v60);
                      v63 = objc_msgSend_objectForKey_(v58, v53, @"latitude", v54, v55);
                      v417 = v58;
                      uint64_t v67 = objc_msgSend_objectForKey_(v58, v64, @"longitude", v65, v66);
                      if (qword_26ABF4AF8 != -1) {
                        dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
                      }
                      int v68 = (id)qword_26ABF4AF0;
                      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                      {
                        v73 = objc_msgSend_count(v63, v69, v70, v71, v72);
                        LODWORD(v440[0]) = 134217984;
                        *(void **)((char *)v440 + 4) = v73;
                        _os_log_impl(&dword_221DDF000, v68, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, adding %lu exterior points", (uint8_t *)v440, 0xCu);
                      }

                      for (unint64_t j = 0; j < objc_msgSend_count(v63, v74, v75, v76, v77); ++j)
                      {
                        uint64_t v82 = objc_msgSend_objectAtIndex_(v63, v79, j, v80, v81);
                        objc_msgSend_doubleValue(v82, v83, v84, v85, v86);
                        int v88 = *(_DWORD *)(v62 + 24);
                        if (v88 == *(_DWORD *)(v62 + 28))
                        {
                          if (2 * v88 <= v88 + 1) {
                            int v89 = v88 + 1;
                          }
                          else {
                            int v89 = 2 * v88;
                          }
                          if (v89 <= 4) {
                            int v89 = 4;
                          }
                          *(_DWORD *)(v62 + 28) = v89;
                          operator new[]();
                        }
                        uint64_t v90 = *(void *)(v62 + 16);
                        *(_DWORD *)(v62 + 24) = v88 + 1;
                        *(void *)(v90 + 8 * v88) = v87;

                        v94 = objc_msgSend_objectAtIndex_(v67, v91, j, v92, v93);
                        objc_msgSend_doubleValue(v94, v95, v96, v97, v98);
                        int v100 = *(_DWORD *)(v62 + 48);
                        if (v100 == *(_DWORD *)(v62 + 52))
                        {
                          if (2 * v100 <= v100 + 1) {
                            int v101 = v100 + 1;
                          }
                          else {
                            int v101 = 2 * v100;
                          }
                          if (v101 <= 4) {
                            int v101 = 4;
                          }
                          *(_DWORD *)(v62 + 52) = v101;
                          operator new[]();
                        }
                        uint64_t v102 = *(void *)(v62 + 40);
                        *(_DWORD *)(v62 + 48) = v100 + 1;
                        *(void *)(v102 + 8 * v100) = v99;
                      }
                      v103 = objc_msgSend_valueForKey_(v417, v79, @"tolerance", v80, v81);
                      objc_msgSend_doubleValue(v103, v104, v105, v106, v107);
                      *(_DWORD *)(v62 + 76) |= 4u;
                      *(void *)(v62 + 64) = v108;

                      ++v57;
                    }
                    while (v57 != v56);
                    uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v431, (uint64_t)v443, 16);
                  }
                  while (v56);
                }

                long long v429 = 0u;
                long long v430 = 0u;
                long long v428 = 0u;
                long long v427 = 0u;
                uint64_t v112 = objc_msgSend_objectForKey_(v412, v109, @"ids", v110, v111);
                uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v113, (uint64_t)&v427, (uint64_t)v442, 16);
                if (v114)
                {
                  uint64_t v115 = *(void *)v428;
                  do
                  {
                    for (uint64_t k = 0; k != v114; ++k)
                    {
                      if (*(void *)v428 != v115) {
                        objc_enumerationMutation(v112);
                      }
                      id v117 = *(id *)(*((void *)&v427 + 1) + 8 * k);
                      uint64_t v122 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)objc_msgSend_UTF8String(v117, v118, v119, v120, v121);
                      v123 = v122;
                      int v124 = *(_DWORD *)(v49 + 28);
                      uint64_t v125 = *(int *)(v49 + 24);
                      if ((int)v125 >= v124)
                      {
                        if (v124 == *(_DWORD *)(v49 + 32))
                        {
                          uint64_t v122 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(v49 + 16));
                          int v124 = *(_DWORD *)(v49 + 28);
                        }
                        *(_DWORD *)(v49 + 28) = v124 + 1;
                        uint64_t v127 = wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(v122);
                        uint64_t v128 = *(void *)(v49 + 16);
                        uint64_t v129 = *(int *)(v49 + 24);
                        *(_DWORD *)(v49 + 24) = v129 + 1;
                        *(void *)(v128 + 8 * v129) = v127;
                      }
                      else
                      {
                        uint64_t v126 = *(void *)(v49 + 16);
                        *(_DWORD *)(v49 + 24) = v125 + 1;
                        uint64_t v127 = *(void *)(v126 + 8 * v125);
                      }
                      MEMORY[0x223C92530](v127, v123);
                      if (qword_26ABF4AF8 != -1) {
                        dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
                      }
                      v130 = (id)qword_26ABF4AF0;
                      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
                      {
                        id v131 = v117;
                        uint64_t v136 = objc_msgSend_UTF8String(v131, v132, v133, v134, v135);
                        LODWORD(v440[0]) = 136315138;
                        *(void **)((char *)v440 + 4) = v136;
                        _os_log_impl(&dword_221DDF000, v130, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, added venue ID %s", (uint8_t *)v440, 0xCu);
                      }
                    }
                    uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v137, (uint64_t)&v427, (uint64_t)v442, 16);
                  }
                  while (v114);
                }

                uint64_t v141 = objc_msgSend_valueForKey_(v412, v138, @"context", v139, v140);
                int v146 = objc_msgSend_intValue(v141, v142, v143, v144, v145);

                if ((v146 - 1) < 2)
                {
                  *(_DWORD *)(v49 + 104) |= 8u;
                  *(_DWORD *)(v49 + 96) = v146;
                }
                v150 = objc_msgSend_objectForKey_(v412, v147, @"tileDownloadConfiguration", v148, v149);
                v154 = objc_msgSend_objectForKey_(v150, v151, @"floorIdxsForWifiDownloadOnly", v152, v153);
                *(_DWORD *)(v49 + 104) |= 4u;
                uint64_t v155 = *(void *)(v49 + 64);
                if (!v155) {
                  operator new();
                }
                long long v425 = 0u;
                long long v426 = 0u;
                long long v423 = 0u;
                long long v424 = 0u;
                id v156 = v154;
                uint64_t v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v156, v157, (uint64_t)&v423, (uint64_t)v441, 16);
                if (v162)
                {
                  uint64_t v163 = *(void *)v424;
                  do
                  {
                    for (uint64_t m = 0; m != v162; ++m)
                    {
                      if (*(void *)v424 != v163) {
                        objc_enumerationMutation(v156);
                      }
                      int v166 = objc_msgSend_unsignedIntValue(*(void **)(*((void *)&v423 + 1) + 8 * m), v158, v159, v160, v161);
                      int v167 = *(_DWORD *)(v155 + 24);
                      if (v167 == *(_DWORD *)(v155 + 28))
                      {
                        if (2 * v167 <= v167 + 1) {
                          int v168 = v167 + 1;
                        }
                        else {
                          int v168 = 2 * v167;
                        }
                        if (v168 <= 4) {
                          int v168 = 4;
                        }
                        *(_DWORD *)(v155 + 28) = v168;
                        operator new[]();
                      }
                      uint64_t v165 = *(void *)(v155 + 16);
                      *(_DWORD *)(v155 + 24) = v167 + 1;
                      *(_DWORD *)(v165 + 4 * v167) = v166;
                    }
                    uint64_t v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v156, v158, (uint64_t)&v423, (uint64_t)v441, 16);
                  }
                  while (v162);
                }
              }
              uint64_t v405 = objc_msgSend_countByEnumeratingWithState_objects_count_(log, v44, (uint64_t)&v435, (uint64_t)v444, 16);
            }
            while (v405);
          }

          uint64_t v172 = objc_msgSend_valueForKey_(v414, v169, @"parameterOverrides", v170, v171);
          BOOL v173 = v172 == 0;

          if (!v173)
          {
            v461 |= 2u;
            uint64_t v177 = v447;
            if (!v447) {
              operator new();
            }
            char v178 = objc_msgSend_objectForKeyedSubscript_(v414, v174, @"parameterOverrides", v175, v176);
            objc_msgSend__setParamOverrides_fromDict_(CLAvailabilityTileParser, v179, v177, (uint64_t)v178, v180);
          }
          uint64_t v181 = objc_msgSend_objectForKey_(v414, v174, @"motionActivityDebounceParameters", v175, v176);
          BOOL v182 = v181 == 0;

          if (!v182)
          {
            uint64_t v186 = objc_msgSend_objectForKey_(v414, v183, @"motionActivityDebounceParameters", v184, v185);
            v190 = objc_msgSend_valueForKey_(v186, v187, @"nonFitnessToCyclingSeconds", v188, v189);
            BOOL v191 = v190 == 0;

            if (!v191)
            {
              v461 |= 0x4000u;
              uint64_t v195 = v459;
              if (!v459) {
                operator new();
              }
              uint64_t v196 = objc_msgSend_valueForKey_(v186, v192, @"nonFitnessToCyclingSeconds", v193, v194);
              int v201 = objc_msgSend_unsignedIntValue(v196, v197, v198, v199, v200);
              *(_DWORD *)(v195 + 36) |= 1u;
              *(_DWORD *)(v195 + 16) = v201;
            }
            uint64_t v202 = objc_msgSend_valueForKey_(v186, v192, @"nonFitnessToRunningSeconds", v193, v194);
            BOOL v203 = v202 == 0;

            if (!v203)
            {
              v461 |= 0x4000u;
              uint64_t v207 = v459;
              if (!v459) {
                operator new();
              }
              int v208 = objc_msgSend_valueForKey_(v186, v204, @"nonFitnessToRunningSeconds", v205, v206);
              int v213 = objc_msgSend_unsignedIntValue(v208, v209, v210, v211, v212);
              *(_DWORD *)(v207 + 36) |= 2u;
              *(_DWORD *)(v207 + 20) = v213;
            }
            v214 = objc_msgSend_valueForKey_(v186, v204, @"runningToNonFitnessSeconds", v205, v206);
            BOOL v215 = v214 == 0;

            if (!v215)
            {
              v461 |= 0x4000u;
              uint64_t v219 = v459;
              if (!v459) {
                operator new();
              }
              v220 = objc_msgSend_valueForKey_(v186, v216, @"runningToNonFitnessSeconds", v217, v218);
              int v225 = objc_msgSend_unsignedIntValue(v220, v221, v222, v223, v224);
              *(_DWORD *)(v219 + 36) |= 4u;
              *(_DWORD *)(v219 + 24) = v225;
            }
            uint64_t v226 = objc_msgSend_valueForKey_(v186, v216, @"cyclingToNonFitnessSeconds", v217, v218);
            BOOL v227 = v226 == 0;

            if (!v227)
            {
              v461 |= 0x4000u;
              uint64_t v231 = v459;
              if (!v459) {
                operator new();
              }
              uint64_t v232 = objc_msgSend_valueForKey_(v186, v228, @"cyclingToNonFitnessSeconds", v229, v230);
              int v237 = objc_msgSend_unsignedIntValue(v232, v233, v234, v235, v236);
              *(_DWORD *)(v231 + 36) |= 8u;
              *(_DWORD *)(v231 + 28) = v237;
            }
          }
          int v238 = objc_msgSend_valueForKey_(v414, v183, @"availabilityZScoreConfidenceInterval", v184, v185);
          BOOL v239 = v238 == 0;

          if (!v239)
          {
            v243 = objc_msgSend_valueForKey_(v414, v240, @"availabilityZScoreConfidenceInterval", v241, v242);
            objc_msgSend_doubleValue(v243, v244, v245, v246, v247);
            v461 |= 4u;
            uint64_t v448 = v248;
          }
          v249 = objc_msgSend_valueForKey_(v414, v240, @"indoorPrefetchRadiusKM", v241, v242);
          BOOL v250 = v249 == 0;

          if (!v250)
          {
            v254 = objc_msgSend_valueForKey_(v414, v251, @"indoorPrefetchRadiusKM", v252, v253);
            int v259 = objc_msgSend_unsignedIntValue(v254, v255, v256, v257, v258);
            v461 |= 8u;
            int v449 = v259;
          }
          v260 = objc_msgSend_valueForKey_(v414, v251, @"regionalPrefetchRadiusKM", v252, v253);
          BOOL v261 = v260 == 0;

          if (!v261)
          {
            v265 = objc_msgSend_valueForKey_(v414, v262, @"regionalPrefetchRadiusKM", v263, v264);
            int v270 = objc_msgSend_unsignedIntValue(v265, v266, v267, v268, v269);
            v461 |= 0x10u;
            int v450 = v270;
          }
          uint64_t v271 = objc_msgSend_valueForKey_(v414, v262, @"indoorPrefetchMaxFloorCount", v263, v264);
          BOOL v272 = v271 == 0;

          if (!v272)
          {
            uint64_t v276 = objc_msgSend_valueForKey_(v414, v273, @"indoorPrefetchMaxFloorCount", v274, v275);
            int v281 = objc_msgSend_unsignedIntValue(v276, v277, v278, v279, v280);
            v461 |= 0x20u;
            int v451 = v281;
          }
          uint64_t v282 = objc_msgSend_valueForKey_(v414, v273, @"regionalPrefetchMaxFloorCount", v274, v275);
          BOOL v283 = v282 == 0;

          if (!v283)
          {
            uint64_t v287 = objc_msgSend_valueForKey_(v414, v284, @"regionalPrefetchMaxFloorCount", v285, v286);
            int v292 = objc_msgSend_unsignedIntValue(v287, v288, v289, v290, v291);
            v461 |= 0x40u;
            int v452 = v292;
          }
          v293 = objc_msgSend_valueForKey_(v414, v284, @"indoorPrefetchMaxTotalBytes", v285, v286);
          BOOL v294 = v293 == 0;

          if (!v294)
          {
            v298 = objc_msgSend_valueForKey_(v414, v295, @"indoorPrefetchMaxTotalBytes", v296, v297);
            int v303 = objc_msgSend_unsignedIntValue(v298, v299, v300, v301, v302);
            v461 |= 0x80u;
            int v453 = v303;
          }
          v304 = objc_msgSend_valueForKey_(v414, v295, @"regionalPrefetchMaxTotalBytes", v296, v297);
          BOOL v305 = v304 == 0;

          if (!v305)
          {
            v309 = objc_msgSend_valueForKey_(v414, v306, @"regionalPrefetchMaxTotalBytes", v307, v308);
            int v314 = objc_msgSend_unsignedIntValue(v309, v310, v311, v312, v313);
            v461 |= 0x100u;
            int v454 = v314;
          }
          v315 = objc_msgSend_valueForKey_(v414, v306, @"indoorLocationOfInterestMergeRadiusKM", v307, v308);
          BOOL v316 = v315 == 0;

          if (!v316)
          {
            v320 = objc_msgSend_valueForKey_(v414, v317, @"indoorLocationOfInterestMergeRadiusKM", v318, v319);
            int v325 = objc_msgSend_unsignedIntValue(v320, v321, v322, v323, v324);
            v461 |= 0x200u;
            int v455 = v325;
          }
          uint64_t v326 = objc_msgSend_valueForKey_(v414, v317, @"regionalLocationOfInterestMergeRadiusKM", v318, v319);
          BOOL v327 = v326 == 0;

          if (!v327)
          {
            uint64_t v331 = objc_msgSend_valueForKey_(v414, v328, @"regionalLocationOfInterestMergeRadiusKM", v329, v330);
            int v336 = objc_msgSend_unsignedIntValue(v331, v332, v333, v334, v335);
            v461 |= 0x400u;
            int v456 = v336;
          }
          v337 = objc_msgSend_valueForKey_(v414, v328, @"preferPredictionWithinNActivityCycles", v329, v330);
          BOOL v338 = v337 == 0;

          if (!v338)
          {
            v342 = objc_msgSend_valueForKey_(v414, v339, @"preferPredictionWithinNActivityCycles", v340, v341);
            int v347 = objc_msgSend_unsignedIntValue(v342, v343, v344, v345, v346);
            v461 |= 0x800u;
            int v457 = v347;
          }
          v348 = objc_msgSend_valueForKey_(v414, v339, @"indoorNumberOfDaysBeforeTileRedownload", v340, v341);
          BOOL v349 = v348 == 0;

          if (!v349)
          {
            v353 = objc_msgSend_valueForKey_(v414, v350, @"indoorNumberOfDaysBeforeTileRedownload", v351, v352);
            objc_msgSend_floatValue(v353, v354, v355, v356, v357);
            v461 |= 0x1000u;
            int v458 = v358;
          }
          v359 = objc_msgSend_valueForKey_(v414, v350, @"regionalNumberOfDaysBeforeTileRedownload", v351, v352);
          BOOL v360 = v359 == 0;

          if (!v360)
          {
            v365 = objc_msgSend_valueForKey_(v414, v361, @"regionalNumberOfDaysBeforeTileRedownload", v363, v364);
            objc_msgSend_floatValue(v365, v366, v367, v368, v369);
            v461 |= 0x2000u;
            int v460 = v370;
          }
          objc_msgSend_path(v408, v361, v362, v363, v364);
          id v371 = objc_claimAutoreleasedReturnValue();
          v376 = (const char *)objc_msgSend_UTF8String(v371, v372, v373, v374, v375);
          size_t v377 = strlen(v376);
          if (v377 >= 0x7FFFFFFFFFFFFFF8) {
            sub_221DE2208();
          }
          size_t v378 = v377;
          if (v377 >= 0x17)
          {
            uint64_t v395 = (v377 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v377 | 7) != 0x17) {
              uint64_t v395 = v377 | 7;
            }
            uint64_t v396 = v395 + 1;
            p_dst = (long long *)operator new(v395 + 1);
            *((void *)&__dst + 1) = v378;
            int64_t v422 = v396 | 0x8000000000000000;
            *(void *)&long long __dst = p_dst;
          }
          else
          {
            HIBYTE(v422) = v377;
            p_dst = &__dst;
            if (!v377) {
              goto LABEL_159;
            }
          }
          memmove(p_dst, v376, v378);
LABEL_159:
          *((unsigned char *)p_dst + v378) = 0;

          if (SHIBYTE(v422) < 0)
          {
            sub_221DE22DC(__p, (void *)__dst, *((unint64_t *)&__dst + 1));
          }
          else
          {
            *(_OWORD *)__p = __dst;
            int64_t v420 = v422;
          }
          HIBYTE(v440[2]) = 16;
          strcpy((char *)v440, ".protoToFile-tmp");
          sub_221DE2CBC((uint64_t)__p, (uint64_t)v440);
          if (SHIBYTE(v440[2]) < 0) {
            operator delete(v440[0]);
          }
          sub_221E35DC8((uint64_t)__p, 2, (int *)&v418);
          MEMORY[0x223C921A0](v440, v418, 0xFFFFFFFFLL);
          sub_221E2CD94((uint64_t)buf);
          MEMORY[0x223C921B0](v440);
          sub_221E3605C((int *)&v418);
          sub_221DE2AB0((uint64_t)__p, (uint64_t)&__dst, 0);
          if (qword_26ABF4AF8 != -1) {
            dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
          }
          v397 = (id)qword_26ABF4AF0;
          if (os_log_type_enabled(v397, OS_LOG_TYPE_DEBUG))
          {
            v398 = &__dst;
            if (v422 < 0) {
              v398 = (long long *)__dst;
            }
            LODWORD(v440[0]) = 136315138;
            *(void **)((char *)v440 + 4) = v398;
            _os_log_impl(&dword_221DDF000, v397, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, find tile at %s", (uint8_t *)v440, 0xCu);
          }

          if (SHIBYTE(v420) < 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(v422) < 0) {
            operator delete((void *)__dst);
          }
          sub_221E3C2E0((uint64_t)buf);
          BOOL v30 = 1;
          goto LABEL_154;
        }
        if (qword_26ABF4AF8 != -1) {
          dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
        }
        v380 = v36;
        v381 = (id)qword_26ABF4AF0;
        if (os_log_type_enabled(v381, OS_LOG_TYPE_ERROR))
        {
          id v388 = v413;
          uint64_t v393 = objc_msgSend_UTF8String(v388, v389, v390, v391, v392);
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v393;
          _os_log_impl(&dword_221DDF000, v381, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, expected at least one venue, str=\n%s\n", buf, 0xCu);
        }
      }
      else
      {
        if (qword_26ABF4AF8 != -1) {
          dispatch_once(&qword_26ABF4AF8, &unk_26D46B798);
        }
        v380 = 0;
        v381 = (id)qword_26ABF4AF0;
        if (os_log_type_enabled(v381, OS_LOG_TYPE_ERROR))
        {
          id v382 = v413;
          uint64_t v387 = objc_msgSend_UTF8String(v382, v383, v384, v385, v386);
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v387;
          _os_log_impl(&dword_221DDF000, v381, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, no venues given in avl tile json??, str=\n%s\n", buf, 0xCu);
        }
      }

      BOOL v30 = 0;
      log = v380;
LABEL_154:

      return v30;
    }
    v402 = sub_221E298D0();
    if (os_log_type_enabled(v402, OS_LOG_TYPE_FAULT))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v446 = 2081;
      *(void *)&v446[2] = "path != nullptr";
      _os_log_impl(&dword_221DDF000, v402, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v403 = sub_221E298D0();
    if (os_signpost_enabled(v403))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v446 = 2081;
      *(void *)&v446[2] = "path != nullptr";
      _os_signpost_emit_with_name_impl(&dword_221DDF000, v403, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path", "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v401 = sub_221E298D0();
    if (os_log_type_enabled(v401, OS_LOG_TYPE_INFO))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v446 = 2081;
      *(void *)&v446[2] = "path != nullptr";
      _os_log_impl(&dword_221DDF000, v401, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
  }
  else
  {
    v399 = sub_221E298D0();
    if (os_log_type_enabled(v399, OS_LOG_TYPE_FAULT))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v446 = 2081;
      *(void *)&v446[2] = "jsonStr != nullptr";
      _os_log_impl(&dword_221DDF000, v399, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v400 = sub_221E298D0();
    if (os_signpost_enabled(v400))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v446 = 2081;
      *(void *)&v446[2] = "jsonStr != nullptr";
      _os_signpost_emit_with_name_impl(&dword_221DDF000, v400, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string", "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v401 = sub_221E298D0();
    if (os_log_type_enabled(v401, OS_LOG_TYPE_INFO))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v446 = 2081;
      *(void *)&v446[2] = "jsonStr != nullptr";
      _os_log_impl(&dword_221DDF000, v401, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
  }

  BOOL result = abort_report_np();
  __break(1u);
  return result;
}

- (NSURL)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  cntrl = self->_avlTile.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end