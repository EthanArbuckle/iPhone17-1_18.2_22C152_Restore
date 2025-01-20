@interface IHKSliderNetCPModelV1
- (CGColorSpace)colorSpace;
- (CGSize)imageSize;
- (EspressoTensor)newTensorWithCorrectShape:(SEL)a3 shape:(EspressoTensor *)a4;
- (IHKFilterSequence)filterSequence;
- (IHKSliderNetCPModelV1)initWithModel:(id)a3;
- (IHKSliderNetCPModelV1)initWithModel:(id)a3 options:(id)a4 error:(id *)a5;
- (NSArray)adjustmentEndpoints;
- (NSArray)contentFVecShape;
- (NSArray)sliderOrder;
- (NSArray)styleFVecShape;
- (NSDictionary)sliderSpecs;
- (NSString)contentFVecEndpoint;
- (NSString)styleFVecEndpoint;
- (id).cxx_construct;
- (id)applyAdjustments:(id)a3 toCIImage:(id)a4 error:(id *)a5;
- (id)getValueForAdjustment:(id)a3 adjustments:(id)a4;
- (id)predictContentVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5;
- (id)predictSlidersForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5;
- (id)predictStyleVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5;
- (unint64_t)contentFVecSize;
- (unint64_t)styleFVecSize;
- (void)setAdjustmentEndpoints:(id)a3;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setContentFVecEndpoint:(id)a3;
- (void)setContentFVecShape:(id)a3;
- (void)setFilterSequence:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setSliderOrder:(id)a3;
- (void)setSliderSpecs:(id)a3;
- (void)setStyleFVecEndpoint:(id)a3;
- (void)setStyleFVecShape:(id)a3;
@end

@implementation IHKSliderNetCPModelV1

- (unint64_t)contentFVecSize
{
  v6 = objc_msgSend_contentFVecShape(self, a2, v2, v3, v4);
  unint64_t v10 = objc_msgSend_product_(self, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (unint64_t)styleFVecSize
{
  v6 = objc_msgSend_styleFVecShape(self, a2, v2, v3, v4);
  unint64_t v10 = objc_msgSend_product_(self, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (IHKSliderNetCPModelV1)initWithModel:(id)a3
{
  return (IHKSliderNetCPModelV1 *)objc_msgSend_initWithModel_options_error_(self, a2, (uint64_t)a3, 0, 0);
}

- (IHKSliderNetCPModelV1)initWithModel:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v325 = *MEMORY[0x263EF8340];
  v321.receiver = self;
  v321.super_class = (Class)IHKSliderNetCPModelV1;
  id v290 = a3;
  id v288 = a4;
  v295 = -[IHKSliderNetCPModel initWithModel:options:error:](&v321, sel_initWithModel_options_error_, v290);
  if (!v295) {
    goto LABEL_147;
  }
  v291 = objc_msgSend_stringByAppendingPathComponent_(v290, v6, @"net_info.json", v7, v8);
  v12 = objc_msgSend_loadJSonFrom_(IHKSliderNetCPModel, v9, (uint64_t)v291, v10, v11);
  objc_msgSend_setInfo_(v295, v13, (uint64_t)v12, v14, v15);

  v20 = objc_msgSend_info(v295, v16, v17, v18, v19);
  v289 = objc_msgSend_objectForKeyedSubscript_(v20, v21, @"input_image_shape", v22, v23);

  v27 = objc_msgSend_objectAtIndexedSubscript_(v289, v24, 1, v25, v26);
  objc_msgSend_doubleValue(v27, v28, v29, v30, v31);
  double v33 = v32;
  v37 = objc_msgSend_objectAtIndexedSubscript_(v289, v34, 2, v35, v36);
  objc_msgSend_doubleValue(v37, v38, v39, v40, v41);
  objc_msgSend_setImageSize_(v295, v42, v43, v44, v45, v33, v46);

  v51 = objc_msgSend_info(v295, v47, v48, v49, v50);
  v55 = objc_msgSend_objectForKeyedSubscript_(v51, v52, @"adjustment_endpoints", v53, v54);
  objc_msgSend_setAdjustmentEndpoints_(v295, v56, (uint64_t)v55, v57, v58);

  v63 = objc_msgSend_info(v295, v59, v60, v61, v62);
  v67 = objc_msgSend_objectForKeyedSubscript_(v63, v64, @"content_fvec_endpoint", v65, v66);
  objc_msgSend_setContentFVecEndpoint_(v295, v68, (uint64_t)v67, v69, v70);

  v75 = objc_msgSend_info(v295, v71, v72, v73, v74);
  v79 = objc_msgSend_objectForKeyedSubscript_(v75, v76, @"style_fvec_endpoint", v77, v78);
  objc_msgSend_setStyleFVecEndpoint_(v295, v80, (uint64_t)v79, v81, v82);

  v87 = objc_msgSend_info(v295, v83, v84, v85, v86);
  v91 = objc_msgSend_objectForKeyedSubscript_(v87, v88, @"content_vector_shape", v89, v90);
  objc_msgSend_setContentFVecShape_(v295, v92, (uint64_t)v91, v93, v94);

  v99 = objc_msgSend_info(v295, v95, v96, v97, v98);
  v103 = objc_msgSend_objectForKeyedSubscript_(v99, v100, @"style_vector_shape", v101, v102);
  objc_msgSend_setStyleFVecShape_(v295, v104, (uint64_t)v103, v105, v106);

  v111 = objc_msgSend_info(v295, v107, v108, v109, v110);
  v295->_colorSpace = (CGColorSpace *)objc_msgSend_extractColorSpaceFromInfo_(v295, v112, (uint64_t)v111, v113, v114);

  v118 = objc_msgSend_stringByAppendingPathComponent_(v290, v115, @"contentFVec.espresso.net", v116, v117);

  id v292 = v118;
  *(void *)__s1 = objc_msgSend_UTF8String(v292, v119, v120, v121, v122);
  v123 = operator new(0x30uLL);
  v123[1] = 0;
  v123[2] = 0;
  void *v123 = &unk_2702DD840;
  sub_2529CA980((uint64_t)__p, v123 + 3, (const char **)__s1);
  cntrl = (std::__shared_weak_count *)v295->contentFVecNet.__cntrl_;
  v295->contentFVecNet.__ptr_ = (EspressoNet *)(v123 + 3);
  v295->contentFVecNet.__cntrl_ = (__shared_weak_count *)v123;
  if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
    std::__shared_weak_count::__release_weak(cntrl);
  }
  v128 = objc_msgSend_stringByAppendingPathComponent_(v290, v124, @"styleFVec.espresso.net", v125, v126);

  id v293 = v128;
  *(void *)__s1 = objc_msgSend_UTF8String(v293, v129, v130, v131, v132);
  v133 = operator new(0x30uLL);
  v133[1] = 0;
  v133[2] = 0;
  void *v133 = &unk_2702DD840;
  sub_2529CA980((uint64_t)__p, v133 + 3, (const char **)__s1);
  v137 = (std::__shared_weak_count *)v295->styleFVecNet.__cntrl_;
  v295->styleFVecNet.__ptr_ = (EspressoNet *)(v133 + 3);
  v295->styleFVecNet.__cntrl_ = (__shared_weak_count *)v133;
  if (v137 && !atomic_fetch_add(&v137->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v137->__on_zero_shared)(v137);
    std::__shared_weak_count::__release_weak(v137);
  }
  v138 = objc_msgSend_stringByAppendingPathComponent_(v290, v134, @"styleTransfer.espresso.net", v135, v136);

  id v294 = v138;
  *(void *)__s1 = objc_msgSend_UTF8String(v294, v139, v140, v141, v142);
  v143 = operator new(0x30uLL);
  v143[1] = 0;
  v143[2] = 0;
  void *v143 = &unk_2702DD840;
  sub_2529CA980((uint64_t)__p, v143 + 3, (const char **)__s1);
  v148 = (std::__shared_weak_count *)v295->styleTransferNet.__cntrl_;
  v295->styleTransferNet.__ptr_ = (EspressoNet *)(v143 + 3);
  v295->styleTransferNet.__cntrl_ = (__shared_weak_count *)v143;
  if (v148 && !atomic_fetch_add(&v148->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
    std::__shared_weak_count::__release_weak(v148);
  }
  long long v317 = 0u;
  long long v318 = 0u;
  long long v319 = 0u;
  long long v320 = 0u;
  v149 = objc_msgSend_info(v295, v144, v145, v146, v147);
  objc_msgSend_objectForKeyedSubscript_(v149, v150, @"adjustment_endpoints", v151, v152);
  v153 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v155 = objc_msgSend_countByEnumeratingWithState_objects_count_(v153, v154, (uint64_t)&v317, (uint64_t)v324, 16);
  if (!v155)
  {
    LOBYTE(v157) = 0;
    char v158 = 0;
    LOBYTE(v159) = 0;
    LOBYTE(v160) = 0;
    uint64_t v303 = 0;
    v205 = &stru_2702DDB30;
    v206 = &stru_2702DDB30;
LABEL_98:

    goto LABEL_99;
  }
  char v156 = 0;
  int v157 = 0;
  char v158 = 0;
  int v159 = 0;
  int v160 = 0;
  uint64_t v303 = 0;
  int v300 = 0;
  v296 = v153;
  uint64_t v297 = *(void *)v318;
  do
  {
    uint64_t v161 = 0;
    uint64_t v298 = v155;
    do
    {
      if (*(void *)v318 != v297) {
        objc_enumerationMutation(v153);
      }
      uint64_t v299 = v161;
      id v172 = *(id *)(*((void *)&v317 + 1) + 8 * v161);
      v177 = (const char *)objc_msgSend_UTF8String(v172, v173, v174, v175, v176);
      size_t v178 = strlen(v177);
      if (v178 > 0x7FFFFFFFFFFFFFF7) {
        sub_2529C1D00();
      }
      v179 = (void *)v178;
      if (v178 >= 0x17)
      {
        uint64_t v181 = (v178 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v178 | 7) != 0x17) {
          uint64_t v181 = v178 | 7;
        }
        uint64_t v182 = v181 + 1;
        v180 = (void **)operator new(v181 + 1);
        __dst[1] = v179;
        unint64_t v313 = v182 | 0x8000000000000000;
        __dst[0] = v180;
LABEL_55:
        memmove(v180, v177, (size_t)v179);
        goto LABEL_56;
      }
      HIBYTE(v313) = v178;
      v180 = __dst;
      if (v178) {
        goto LABEL_55;
      }
LABEL_56:
      *((unsigned char *)v179 + (void)v180) = 0;
      sub_2529CEDC0(__dst, (uint64_t)__p);
      if (v315 >= 0) {
        v183 = __p;
      }
      else {
        v183 = (void **)__p[0];
      }
      size_t v184 = strlen((const char *)v183);
      if (v184 > 0x7FFFFFFFFFFFFFF7) {
        sub_2529C1D00();
      }
      size_t v185 = v184;
      if (v184 >= 0x17)
      {
        uint64_t v194 = (v184 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v184 | 7) != 0x17) {
          uint64_t v194 = v184 | 7;
        }
        uint64_t v195 = v194 + 1;
        v186 = operator new(v194 + 1);
        *(void *)&__s1[8] = v185;
        *(void *)&__s1[16] = v195 | 0x8000000000000000;
        *(void *)__s1 = v186;
      }
      else
      {
        __s1[23] = v184;
        v186 = __s1;
        if (!v184)
        {
          __s1[0] = 0;
          if ((v315 & 0x80000000) == 0) {
            goto LABEL_63;
          }
          goto LABEL_81;
        }
      }
      memmove(v186, v183, v185);
      v186[v185] = 0;
      if ((v315 & 0x80000000) == 0)
      {
LABEL_63:
        if ((SHIBYTE(v313) & 0x80000000) == 0) {
          goto LABEL_64;
        }
        goto LABEL_82;
      }
LABEL_81:
      operator delete(__p[0]);
      if ((SHIBYTE(v313) & 0x80000000) == 0)
      {
LABEL_64:
        int v187 = __s1[23];
        if ((__s1[23] & 0x80000000) != 0) {
          goto LABEL_83;
        }
        goto LABEL_65;
      }
LABEL_82:
      operator delete(__dst[0]);
      int v187 = __s1[23];
      if ((__s1[23] & 0x80000000) != 0)
      {
LABEL_83:
        v196 = *(const char **)__s1;
        v300 |= strcmp(*(const char **)__s1, "WhiteBalanceTempTintCI") == 0;
        int v193 = strcmp(v196, "HighKeyCI");
        goto LABEL_89;
      }
LABEL_65:
      BOOL v190 = *(void *)__s1 == 0x6C61426574696857
          && *(void *)&__s1[8] == 0x706D655465636E61
          && *(void *)&__s1[15] == 0x4943746E695470;
      v300 |= v190;
      unint64_t v191 = bswap64(*(unint64_t *)__s1);
      unint64_t v192 = 0x486967684B657943;
      if (v191 != 0x486967684B657943) {
        goto LABEL_85;
      }
      unint64_t v191 = bswap32(*(unsigned __int16 *)&__s1[8]) >> 16;
      if (v191 != 18688)
      {
        unint64_t v192 = 18688;
LABEL_85:
        if (v191 < v192) {
          int v193 = -1;
        }
        else {
          int v193 = 1;
        }
        goto LABEL_88;
      }
      int v193 = 0;
LABEL_88:
      v196 = __s1;
LABEL_89:
      BOOL v197 = v193 == 0;
      BOOL v199 = strcmp(v196, "ExposureAndBlackPointCI") == 0;
      int v200 = v199 | v157;
      if (v187 < 0)
      {
        v201 = *(char **)__s1;
        int v157 = (strcmp(*(const char **)__s1, "ExposureCI") == 0) | v200;
        v159 |= strcmp(v201, "HighlightsCI") == 0;
        v160 |= strcmp(v201, "ContrastCI") == 0;
        LODWORD(v303) = (strcmp(v201, "ColorCastCI") == 0) | v303;
        HIDWORD(v303) |= strcmp(v201, "VibrancyCI") == 0;
        operator delete(v201);
      }
      else
      {
        BOOL v163 = *(void *)__s1 == 0x657275736F707845 && *(void *)&__s1[3] == 0x4943657275736FLL;
        int v157 = v163 | v200;
        BOOL v165 = *(void *)__s1 == 0x6867696C68676948 && *(void *)&__s1[5] == 0x49437374686769;
        v159 |= v165;
        BOOL v167 = *(void *)__s1 == 0x74736172746E6F43 && *(void *)&__s1[3] == 0x49437473617274;
        v160 |= v167;
        BOOL v169 = *(void *)__s1 == 0x736143726F6C6F43 && *(_DWORD *)&__s1[8] == 4801396;
        BOOL v171 = *(void *)__s1 == 0x79636E6172626956 && *(void *)&__s1[3] == 0x494379636E6172;
        LODWORD(v303) = v169 | v303;
        HIDWORD(v303) |= v171;
      }
      v156 |= v197;
      v158 |= v199;
      uint64_t v161 = v299 + 1;
      v153 = v296;
    }
    while (v298 != v299 + 1);
    uint64_t v155 = objc_msgSend_countByEnumeratingWithState_objects_count_(v296, v198, (uint64_t)&v317, (uint64_t)v324, 16);
  }
  while (v155);

  if ((v300 & 1) == 0)
  {
    v206 = &stru_2702DDB30;
    v153 = &stru_2702DDB30;
    if ((v156 & 1) == 0)
    {
      v205 = &stru_2702DDB30;
      if ((v157 & 1) == 0) {
        goto LABEL_100;
      }
      goto LABEL_123;
    }
    goto LABEL_97;
  }
  objc_msgSend_stringByAppendingString_(&stru_2702DDB30, v202, @"PITempTintFilter", v203, v204);
  v205 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v206 = @"->";
  v153 = v205;
  if (v156)
  {
LABEL_97:
    objc_msgSend_stringWithFormat_(NSString, v202, @"%@%@CIHighKey", v203, v204, v153, v206);
    v205 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v206 = @"->";
    goto LABEL_98;
  }
LABEL_99:
  if ((v157 & 1) == 0)
  {
LABEL_100:
    if ((v158 & 1) == 0 && (v160 & 1) == 0 && (v159 & 1) == 0)
    {
      if ((v303 | HIDWORD(v303))) {
        goto LABEL_104;
      }
LABEL_145:
      v229 = v205;
      goto LABEL_146;
    }
  }
LABEL_123:
  v230 = objc_opt_new();
  v234 = v230;
  if (v157) {
    objc_msgSend_addObject_(v230, v231, @"exposure", v232, v233);
  }
  if (v158) {
    objc_msgSend_addObject_(v234, v231, @"black", v232, v233);
  }
  if (v160) {
    objc_msgSend_addObject_(v234, v231, @"contrast", v232, v233);
  }
  if (v159) {
    objc_msgSend_addObject_(v234, v231, @"highlights", v232, v233);
  }
  long long v310 = 0u;
  long long v311 = 0u;
  long long v308 = 0u;
  long long v309 = 0u;
  id v235 = v234;
  unint64_t v240 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v236, (uint64_t)&v308, (uint64_t)v323, 16);
  v302 = v206;
  if (v240)
  {
    uint64_t v241 = *(void *)v309;
    v242 = &stru_2702DDB30;
    v243 = &stru_2702DDB30;
    do
    {
      if (*(void *)v309 != v241) {
        objc_enumerationMutation(v235);
      }
      objc_msgSend_stringWithFormat_(NSString, v237, @"%@%@%@", v238, v239, v242, v243, **((void **)&v308 + 1));
      v244 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v240 >= 2)
      {
        for (uint64_t i = 1; i != v240; ++i)
        {
          if (*(void *)v309 != v241) {
            objc_enumerationMutation(v235);
          }
          objc_msgSend_stringWithFormat_(NSString, v245, @"%@%@%@", v246, v247, v244, @",", *(void *)(*((void *)&v308 + 1) + 8 * i));
          v242 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v244 = v242;
        }
      }
      else
      {
        v242 = v244;
      }
      unint64_t v240 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v245, (uint64_t)&v308, (uint64_t)v323, 16);
      v243 = @",";
    }
    while (v240);
  }
  else
  {
    v242 = &stru_2702DDB30;
  }

  uint64_t v252 = objc_msgSend_stringWithFormat_(NSString, v249, @"%@%@CISmartToneFilter[%@]", v250, v251, v205, v302, v242);

  v206 = @"->";
  v205 = (__CFString *)v252;
  if (((v303 | HIDWORD(v303)) & 1) == 0) {
    goto LABEL_145;
  }
LABEL_104:
  v207 = objc_opt_new();
  v211 = v207;
  if (v303) {
    objc_msgSend_addObject_(v207, v208, @"cast", v209, v210);
  }
  if ((v303 & 0x100000000) != 0) {
    objc_msgSend_addObject_(v211, v208, @"vibrancy", v209, v210);
  }
  long long v306 = 0u;
  long long v307 = 0u;
  long long v304 = 0u;
  long long v305 = 0u;
  id v212 = v211;
  unint64_t v217 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v213, (uint64_t)&v304, (uint64_t)v322, 16);
  v301 = v206;
  if (v217)
  {
    uint64_t v218 = *(void *)v305;
    v219 = &stru_2702DDB30;
    v220 = &stru_2702DDB30;
    do
    {
      if (*(void *)v305 != v218) {
        objc_enumerationMutation(v212);
      }
      objc_msgSend_stringWithFormat_(NSString, v214, @"%@%@%@", v215, v216, v219, v220, **((void **)&v304 + 1));
      v221 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v217 >= 2)
      {
        for (uint64_t j = 1; j != v217; ++j)
        {
          if (*(void *)v305 != v218) {
            objc_enumerationMutation(v212);
          }
          objc_msgSend_stringWithFormat_(NSString, v222, @"%@%@%@", v223, v224, v221, @",", *(void *)(*((void *)&v304 + 1) + 8 * j));
          v219 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v221 = v219;
        }
      }
      else
      {
        v219 = v221;
      }
      unint64_t v217 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v222, (uint64_t)&v304, (uint64_t)v322, 16);
      v220 = @",";
    }
    while (v217);
  }
  else
  {
    v219 = &stru_2702DDB30;
  }

  v229 = objc_msgSend_stringWithFormat_(NSString, v226, @"%@%@CISmartColorFilter[%@]", v227, v228, v205, v301, v219);

LABEL_146:
  v253 = [IHKFilterSequence alloc];
  v257 = objc_msgSend_initWithFilterSpec_(v253, v254, (uint64_t)v229, v255, v256);
  objc_msgSend_setFilterSequence_(v295, v258, (uint64_t)v257, v259, v260);

  v265 = objc_msgSend_filterSequence(v295, v261, v262, v263, v264);
  v270 = objc_msgSend_sliderOrder(v265, v266, v267, v268, v269);
  objc_msgSend_setSliderOrder_(v295, v271, (uint64_t)v270, v272, v273);

  v278 = objc_msgSend_filterSequence(v295, v274, v275, v276, v277);
  v283 = objc_msgSend_sliderSpecs(v278, v279, v280, v281, v282);
  objc_msgSend_setSliderSpecs_(v295, v284, (uint64_t)v283, v285, v286);

LABEL_147:
  return v295;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (id)predictStyleVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v72.receiver = self;
  v72.super_class = (Class)IHKSliderNetCPModelV1;
  id v11 = [(IHKSliderNetCPModel *)&v72 predictStyleVectorForPixelBuffer:a3 scenePrint:v8 error:a5];
  if (a5 && *a5
    || (v12 = (__CVBuffer *)objc_msgSend_preprocessPixelBuffer_error_(self, v9, (uint64_t)a3, (uint64_t)a5, v10), a5)
    && *a5)
  {
    v13 = 0;
    goto LABEL_52;
  }
  sub_2529C6860((uint64_t)v68, v12);
  ptr = self->styleFVecNet.__ptr_;
  sub_2529D3124((uint64_t)&v73, "style_image:0", (uint64_t)v68);
  memset(v56, 0, sizeof(v56));
  int v57 = 1065353216;
  sub_2529CA1B0((uint64_t)v56, (uint64_t)&v73, &v73);
  objc_msgSend_styleFVecEndpoint(self, v15, v16, v17, v18);
  id v19 = objc_claimAutoreleasedReturnValue();
  v24 = (const char *)objc_msgSend_UTF8String(v19, v20, v21, v22, v23);
  size_t v25 = strlen(v24);
  if (v25 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  uint64_t v26 = (void *)v25;
  if (v25 >= 0x17)
  {
    uint64_t v28 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17) {
      uint64_t v28 = v25 | 7;
    }
    uint64_t v29 = v28 + 1;
    v27 = (void **)operator new(v28 + 1);
    __dst[1] = v26;
    unint64_t v55 = v29 | 0x8000000000000000;
    __dst[0] = v27;
    goto LABEL_13;
  }
  HIBYTE(v55) = v25;
  v27 = __dst;
  if (v25) {
LABEL_13:
  }
    memmove(v27, v24, (size_t)v26);
  *((unsigned char *)v26 + (void)v27) = 0;
  sub_2529C4AAC((uint64_t)ptr, (uint64_t)v56, (uint64_t)__dst, (uint64_t)v58);
  sub_2529C4DBC((uint64_t)v58, (uint64_t)&v62);
  v58[0] = &unk_2702DD568;
  uint64_t v30 = v61;
  if (v61 && !atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
  if (__p)
  {
    uint64_t v60 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v55) < 0) {
    operator delete(__dst[0]);
  }

  sub_2529C988C((uint64_t)v56);
  v75 = &unk_2702DD568;
  uint64_t v31 = v78;
  if (v78 && !atomic_fetch_add(&v78->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
  }
  if (v76)
  {
    uint64_t v77 = v76;
    operator delete(v76);
  }
  if (v74 < 0) {
    operator delete((void *)v73);
  }
  uint64_t v35 = [IHKFeatureVector alloc];
  v47 = &unk_2702DD568;
  LODWORD(v48) = v63;
  uint64_t v50 = 0;
  v51 = 0;
  uint64_t v49 = 0;
  uint64_t v36 = v64;
  int64_t v37 = v65 - (unsigned char *)v64;
  if (v65 != v64)
  {
    if (v37 < 0) {
      sub_2529C1558();
    }
    uint64_t v49 = operator new(v65 - (unsigned char *)v64);
    v51 = (char *)v49 + 8 * (v37 >> 3);
    memcpy(v49, v36, v37);
    uint64_t v50 = v51;
  }
  uint64_t v52 = v66;
  uint64_t v53 = v67;
  if (v67) {
    atomic_fetch_add_explicit(&v67->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v47 = &unk_2702DD520;
  uint64_t v41 = objc_msgSend_initWithTensor_(v35, v32, (uint64_t)&v47, v33, v34);
  v47 = &unk_2702DD568;
  v42 = v53;
  if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
  }
  if (v49)
  {
    uint64_t v50 = v49;
    operator delete(v49);
  }
  if (v11)
  {
    objc_msgSend_featureVectorByAppendingFeatureVector_(v11, v38, (uint64_t)v41, v39, v40, v47, v48);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v43 = v41;
  }
  id v11 = v43;

  uint64_t v62 = &unk_2702DD568;
  uint64_t v44 = v67;
  if (v67 && !atomic_fetch_add(&v67->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  if (v64)
  {
    uint64_t v65 = v64;
    operator delete(v64);
  }
  v68[0] = &unk_2702DD568;
  uint64_t v45 = v71;
  if (v71 && !atomic_fetch_add(&v71->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
  }
  if (v69)
  {
    uint64_t v70 = v69;
    operator delete(v69);
  }
  v13 = v11;
LABEL_52:

  return v13;
}

- (id)predictContentVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v72.receiver = self;
  v72.super_class = (Class)IHKSliderNetCPModelV1;
  id v11 = [(IHKSliderNetCPModel *)&v72 predictContentVectorForPixelBuffer:a3 scenePrint:v8 error:a5];
  if (a5 && *a5
    || (v12 = (__CVBuffer *)objc_msgSend_preprocessPixelBuffer_error_(self, v9, (uint64_t)a3, (uint64_t)a5, v10), a5)
    && *a5)
  {
    v13 = 0;
    goto LABEL_52;
  }
  sub_2529C6860((uint64_t)v68, v12);
  ptr = self->contentFVecNet.__ptr_;
  sub_2529D3290((uint64_t)&v73, "image:0", (uint64_t)v68);
  memset(v56, 0, sizeof(v56));
  int v57 = 1065353216;
  sub_2529CA1B0((uint64_t)v56, (uint64_t)&v73, &v73);
  objc_msgSend_contentFVecEndpoint(self, v15, v16, v17, v18);
  id v19 = objc_claimAutoreleasedReturnValue();
  v24 = (const char *)objc_msgSend_UTF8String(v19, v20, v21, v22, v23);
  size_t v25 = strlen(v24);
  if (v25 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  uint64_t v26 = (void *)v25;
  if (v25 >= 0x17)
  {
    uint64_t v28 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17) {
      uint64_t v28 = v25 | 7;
    }
    uint64_t v29 = v28 + 1;
    v27 = (void **)operator new(v28 + 1);
    __dst[1] = v26;
    unint64_t v55 = v29 | 0x8000000000000000;
    __dst[0] = v27;
    goto LABEL_13;
  }
  HIBYTE(v55) = v25;
  v27 = __dst;
  if (v25) {
LABEL_13:
  }
    memmove(v27, v24, (size_t)v26);
  *((unsigned char *)v26 + (void)v27) = 0;
  sub_2529C4AAC((uint64_t)ptr, (uint64_t)v56, (uint64_t)__dst, (uint64_t)v58);
  sub_2529C4DBC((uint64_t)v58, (uint64_t)&v62);
  v58[0] = &unk_2702DD568;
  uint64_t v30 = v61;
  if (v61 && !atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
  if (__p)
  {
    uint64_t v60 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v55) < 0) {
    operator delete(__dst[0]);
  }

  sub_2529C988C((uint64_t)v56);
  v75 = &unk_2702DD568;
  uint64_t v31 = v78;
  if (v78 && !atomic_fetch_add(&v78->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
  }
  if (v76)
  {
    uint64_t v77 = v76;
    operator delete(v76);
  }
  if (v74 < 0) {
    operator delete((void *)v73);
  }
  uint64_t v35 = [IHKFeatureVector alloc];
  v47 = &unk_2702DD568;
  LODWORD(v48) = v63;
  uint64_t v50 = 0;
  v51 = 0;
  uint64_t v49 = 0;
  uint64_t v36 = v64;
  int64_t v37 = v65 - (unsigned char *)v64;
  if (v65 != v64)
  {
    if (v37 < 0) {
      sub_2529C1558();
    }
    uint64_t v49 = operator new(v65 - (unsigned char *)v64);
    v51 = (char *)v49 + 8 * (v37 >> 3);
    memcpy(v49, v36, v37);
    uint64_t v50 = v51;
  }
  uint64_t v52 = v66;
  uint64_t v53 = v67;
  if (v67) {
    atomic_fetch_add_explicit(&v67->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v47 = &unk_2702DD520;
  v38 = objc_msgSend_initWithTensor_(v35, v32, (uint64_t)&v47, v33, v34);
  v47 = &unk_2702DD568;
  uint64_t v39 = v53;
  if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
    std::__shared_weak_count::__release_weak(v39);
  }
  if (v49)
  {
    uint64_t v50 = v49;
    operator delete(v49);
  }
  NSLog(&cfstr_DebugContentFv.isa, *(void *)v64, *((void *)v64 + 1), *((void *)v64 + 2), *((void *)v64 + 3), v47, v48);
  if (v11)
  {
    objc_msgSend_featureVectorByAppendingFeatureVector_(v11, v40, (uint64_t)v38, v41, v42);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v43 = v38;
  }
  id v11 = v43;

  uint64_t v62 = &unk_2702DD568;
  uint64_t v44 = v67;
  if (v67 && !atomic_fetch_add(&v67->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  if (v64)
  {
    uint64_t v65 = v64;
    operator delete(v64);
  }
  v68[0] = &unk_2702DD568;
  uint64_t v45 = v71;
  if (v71 && !atomic_fetch_add(&v71->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
  }
  if (v69)
  {
    uint64_t v70 = v69;
    operator delete(v69);
  }
  v13 = v11;
LABEL_52:

  return v13;
}

- (EspressoTensor)newTensorWithCorrectShape:(SEL)a3 shape:(EspressoTensor *)a4
{
  id v7 = a5;
  unint64_t v12 = objc_msgSend_count(v7, v8, v9, v10, v11);
  unint64_t v16 = v12;
  char v74 = 0;
  v75 = 0;
  v76 = 0;
  if (v12)
  {
    if (v12 >> 61) {
      sub_2529C1558();
    }
    uint64_t v17 = 8 * v12;
    uint64_t v18 = (char *)operator new(8 * v12);
    char v74 = v18;
    v76 = &v18[8 * v16];
    bzero(v18, 8 * v16);
    id v19 = &v18[v17];
    v75 = &v18[v17];
  }
  else
  {
    id v19 = 0;
    uint64_t v18 = 0;
  }
  v20 = objc_msgSend_objectAtIndexedSubscript_(v7, v13, 0, v14, v15);
  *(void *)uint64_t v18 = objc_msgSend_unsignedIntValue(v20, v21, v22, v23, v24);

  uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(v7, v25, 3, v26, v27);
  *((void *)v18 + 1) = objc_msgSend_unsignedIntValue(v28, v29, v30, v31, v32);

  uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(v7, v33, 1, v34, v35);
  *((void *)v18 + 2) = objc_msgSend_unsignedIntValue(v36, v37, v38, v39, v40);

  uint64_t v44 = objc_msgSend_objectAtIndexedSubscript_(v7, v41, 2, v42, v43);
  *((void *)v18 + 3) = objc_msgSend_unsignedIntValue(v44, v45, v46, v47, v48);

  unint64_t v53 = 0;
  uint64_t v54 = 1;
  while (v53 < objc_msgSend_count(v7, v49, v50, v51, v52))
  {
    uint64_t v58 = objc_msgSend_objectAtIndexedSubscript_(v7, v55, v53, v56, v57);
    uint64_t v63 = objc_msgSend_unsignedIntValue(v58, v59, v60, v61, v62);

    v54 *= v63;
    ++v53;
  }
  int v73 = 4;
  __p = 0;
  v71 = 0;
  objc_super v72 = 0;
  uint64_t v64 = v19 - v18;
  if (v19 != v18)
  {
    if (v64 < 0) {
      sub_2529C1558();
    }
    uint64_t v65 = (char *)operator new(v19 - v18);
    uint64_t v66 = &v65[8 * (v64 >> 3)];
    __p = v65;
    objc_super v72 = v66;
    memcpy(v65, v18, v19 - v18);
    v71 = v66;
  }
  sub_2529C0C94((uint64_t)retstr, &v73, (uint64_t)&__p);
  if (__p)
  {
    v71 = __p;
    operator delete(__p);
  }
  v67 = (void *)(*(uint64_t (**)(TensorStorage *))(*(void *)retstr->storage_.__ptr_ + 24))(retstr->storage_.__ptr_);
  v68 = (const void *)(*(uint64_t (**)(TensorStorage *))(*(void *)a4->storage_.__ptr_ + 24))(a4->storage_.__ptr_);
  memcpy(v67, v68, 4 * v54);
  operator delete(v18);

  return result;
}

- (id)predictSlidersForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5
{
  uint64_t v274 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v259 = 4;
  long long v260 = 0u;
  long long v261 = 0u;
  uint64_t v262 = 0;
  v257 = 0;
  v258 = &unk_2702DD520;
  int v254 = 4;
  *(_OWORD *)uint64_t v255 = 0u;
  long long v256 = 0u;
  v253 = &unk_2702DD520;
  if (objc_msgSend_useClipEmbedding(self, v9, v10, v11, v12))
  {
    uint64_t v17 = objc_msgSend_size(v7, v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_styleFVecSize(self, v18, v19, v20, v21);
    uint64_t v27 = objc_msgSend_styleFVecSize(self, v23, v24, v25, v26);
    v230 = objc_msgSend_subFeatureVectorWithRange_(v7, v28, v17 - v22, v27, v29);

    uint64_t v34 = objc_msgSend_size(v8, v30, v31, v32, v33);
    uint64_t v39 = objc_msgSend_contentFVecSize(self, v35, v36, v37, v38);
    uint64_t v44 = objc_msgSend_contentFVecSize(self, v40, v41, v42, v43);
    uint64_t v47 = objc_msgSend_subFeatureVectorWithRange_(v8, v45, v34 - v39, v44, v46);

    if (v230)
    {
      objc_msgSend_tensor(v230, v48, v49, v50, v51);
    }
    else
    {
      uint64_t v252 = 0;
      *(_OWORD *)uint64_t v250 = 0u;
      long long v251 = 0u;
      long long v249 = 0u;
    }
    char v74 = objc_msgSend_styleFVecShape(self, v48, v49, v50, v51);
    objc_msgSend_newTensorWithCorrectShape_shape_(self, v75, (uint64_t)&v249, (uint64_t)v74, v76);
    int v259 = DWORD2(__dst[0]);
    sub_2529C1824(&v260, *(char **)&__dst[1], *((char **)&__dst[1] + 1), (uint64_t)(*((void *)&__dst[1] + 1) - *(void *)&__dst[1]) >> 3);
    uint64_t v78 = v264[1];
    uint64_t v77 = v265;
    if (v265) {
      atomic_fetch_add_explicit(&v265->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v79 = v262;
    *((void *)&v261 + 1) = v78;
    uint64_t v262 = v77;
    if (v79 && !atomic_fetch_add(&v79->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
      std::__shared_weak_count::__release_weak(v79);
    }
    *(void *)&__dst[0] = &unk_2702DD568;
    v80 = v265;
    if (v265 && !atomic_fetch_add(&v265->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
    if (*(void *)&__dst[1])
    {
      *((void *)&__dst[1] + 1) = *(void *)&__dst[1];
      operator delete(*(void **)&__dst[1]);
    }

    *(void *)&long long v249 = &unk_2702DD568;
    uint64_t v85 = v252;
    if (v252 && !atomic_fetch_add(&v252->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
      std::__shared_weak_count::__release_weak(v85);
    }
    if (v250[0])
    {
      v250[1] = v250[0];
      operator delete(v250[0]);
    }
    if (v47)
    {
      objc_msgSend_tensor(v47, v81, v82, v83, v84);
    }
    else
    {
      v248 = 0;
      *(_OWORD *)uint64_t v246 = 0u;
      long long v247 = 0u;
      long long v245 = 0u;
    }
    uint64_t v86 = objc_msgSend_contentFVecShape(self, v81, v82, v83, v84);
    objc_msgSend_newTensorWithCorrectShape_shape_(self, v87, (uint64_t)&v245, (uint64_t)v86, v88);
    int v254 = DWORD2(__dst[0]);
    sub_2529C1824(v255, *(char **)&__dst[1], *((char **)&__dst[1] + 1), (uint64_t)(*((void *)&__dst[1] + 1) - *(void *)&__dst[1]) >> 3);
    uint64_t v90 = v264[1];
    uint64_t v89 = v265;
    if (v265) {
      atomic_fetch_add_explicit(&v265->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v91 = v257;
    *((void *)&v256 + 1) = v90;
    v257 = v89;
    if (v91 && !atomic_fetch_add(&v91->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
      std::__shared_weak_count::__release_weak(v91);
    }
    *(void *)&__dst[0] = &unk_2702DD568;
    v92 = v265;
    if (v265 && !atomic_fetch_add(&v265->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
    }
    if (*(void *)&__dst[1])
    {
      *((void *)&__dst[1] + 1) = *(void *)&__dst[1];
      operator delete(*(void **)&__dst[1]);
    }

    *(void *)&long long v245 = &unk_2702DD568;
    uint64_t v93 = v248;
    if (v248 && !atomic_fetch_add(&v248->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
      std::__shared_weak_count::__release_weak(v93);
    }
    id v7 = v230;
    if (v246[0])
    {
      v246[1] = v246[0];
      operator delete(v246[0]);
    }
    id v8 = v47;
  }
  else
  {
    if (v7)
    {
      objc_msgSend_tensor(v7, v13, v14, v15, v16);
      int v52 = DWORD2(__dst[0]);
      uint64_t v54 = (char *)*((void *)&__dst[1] + 1);
      unint64_t v53 = *(char **)&__dst[1];
    }
    else
    {
      uint64_t v54 = 0;
      unint64_t v53 = 0;
      int v52 = 0;
      v265 = 0;
      *(_OWORD *)uint64_t v264 = 0u;
      memset(__dst, 0, sizeof(__dst));
    }
    int v259 = v52;
    sub_2529C1824(&v260, v53, v54, (v54 - v53) >> 3);
    uint64_t v60 = v264[1];
    v59 = v265;
    if (v265) {
      atomic_fetch_add_explicit(&v265->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v61 = v262;
    *((void *)&v261 + 1) = v60;
    uint64_t v262 = v59;
    if (v61 && !atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
    *(void *)&__dst[0] = &unk_2702DD568;
    uint64_t v62 = v265;
    if (v265 && !atomic_fetch_add(&v265->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
    if (*(void *)&__dst[1])
    {
      *((void *)&__dst[1] + 1) = *(void *)&__dst[1];
      operator delete(*(void **)&__dst[1]);
    }
    if (v8)
    {
      objc_msgSend_tensor(v8, v55, v56, v57, v58);
      int v63 = DWORD2(__dst[0]);
      uint64_t v65 = (char *)*((void *)&__dst[1] + 1);
      uint64_t v64 = *(char **)&__dst[1];
    }
    else
    {
      uint64_t v65 = 0;
      uint64_t v64 = 0;
      int v63 = 0;
      v265 = 0;
      *(_OWORD *)uint64_t v264 = 0u;
      memset(__dst, 0, sizeof(__dst));
    }
    int v254 = v63;
    sub_2529C1824(v255, v64, v65, (v65 - v64) >> 3);
    v71 = v264[1];
    uint64_t v70 = v265;
    if (v265) {
      atomic_fetch_add_explicit(&v265->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    objc_super v72 = v257;
    *((void *)&v256 + 1) = v71;
    v257 = v70;
    if (v72 && !atomic_fetch_add(&v72->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
      std::__shared_weak_count::__release_weak(v72);
    }
    *(void *)&__dst[0] = &unk_2702DD568;
    int v73 = v265;
    if (v265 && !atomic_fetch_add(&v265->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
    if (*(void *)&__dst[1])
    {
      *((void *)&__dst[1] + 1) = *(void *)&__dst[1];
      operator delete(*(void **)&__dst[1]);
    }
  }
  v242 = 0;
  v243 = 0;
  unint64_t v244 = 0;
  long long v238 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  v231 = v7;
  uint64_t v94 = objc_msgSend_adjustmentEndpoints(self, v66, v67, v68, v69, v8);
  uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v238, (uint64_t)v273, 16);
  if (v96)
  {
    uint64_t v97 = *(void *)v239;
    do
    {
      for (uint64_t i = 0; i != v96; ++i)
      {
        if (*(void *)v239 != v97) {
          objc_enumerationMutation(v94);
        }
        id v100 = *(id *)(*((void *)&v238 + 1) + 8 * i);
        uint64_t v105 = (const char *)objc_msgSend_UTF8String(v100, v101, v102, v103, v104);
        size_t v106 = strlen(v105);
        if (v106 >= 0x7FFFFFFFFFFFFFF8) {
          sub_2529C1D00();
        }
        size_t v108 = v106;
        if (v106 >= 0x17)
        {
          uint64_t v111 = (v106 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v106 | 7) != 0x17) {
            uint64_t v111 = v106 | 7;
          }
          uint64_t v112 = v111 + 1;
          uint64_t v109 = (long long *)operator new(v111 + 1);
          *((void *)&__dst[0] + 1) = v108;
          *(void *)&__dst[1] = v112 | 0x8000000000000000;
          *(void *)&__dst[0] = v109;
        }
        else
        {
          BYTE7(__dst[1]) = v106;
          uint64_t v109 = __dst;
          if (!v106)
          {
            LOBYTE(__dst[0]) = 0;
            uint64_t v110 = v243;
            if ((unint64_t)v243 < v244) {
              goto LABEL_68;
            }
            goto LABEL_81;
          }
        }
        memmove(v109, v105, v108);
        *((unsigned char *)v109 + v108) = 0;
        uint64_t v110 = v243;
        if ((unint64_t)v243 < v244)
        {
LABEL_68:
          long long v99 = __dst[0];
          *((void *)v110 + 2) = *(void *)&__dst[1];
          *(_OWORD *)uint64_t v110 = v99;
          v243 = v110 + 24;
          continue;
        }
LABEL_81:
        v243 = sub_2529D36EC(&v242, (uint64_t)__dst);
        if (SBYTE7(__dst[1]) < 0) {
          operator delete(*(void **)&__dst[0]);
        }
      }
      uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v107, (uint64_t)&v238, (uint64_t)v273, 16);
    }
    while (v96);
  }

  ptr = self->styleTransferNet.__ptr_;
  sub_2529D33FC((uint64_t)__dst, "content_fvec:0", (uint64_t)&v253);
  sub_2529D3568((uint64_t)v267, "style_fvec:0", (uint64_t)&v258);
  memset(v234, 0, sizeof(v234));
  int v235 = 1065353216;
  sub_2529CA1B0((uint64_t)v234, (uint64_t)__dst, __dst);
  sub_2529CA1B0((uint64_t)v234, (uint64_t)v267, (long long *)v267);
  sub_2529C5EBC((uint64_t)ptr, (uint64_t)v234, (long long **)&v242, (uint64_t)v236);
  sub_2529C988C((uint64_t)v234);
  uint64_t v269 = &unk_2702DD568;
  uint64_t v114 = v272;
  if (v272 && !atomic_fetch_add(&v272->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
    std::__shared_weak_count::__release_weak(v114);
  }
  if (v270)
  {
    v271 = v270;
    operator delete(v270);
  }
  if (v268 < 0) {
    operator delete(v267[0]);
  }
  *((void *)&__dst[1] + 1) = &unk_2702DD568;
  v115 = v266;
  if (v266 && !atomic_fetch_add(&v266->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
    std::__shared_weak_count::__release_weak(v115);
  }
  if (v264[1])
  {
    v265 = (std::__shared_weak_count *)v264[1];
    operator delete(v264[1]);
  }
  if (SBYTE7(__dst[1]) < 0) {
    operator delete(*(void **)&__dst[0]);
  }
  uint64_t v116 = objc_opt_new();
  for (uint64_t j = v237; j; uint64_t j = (uint64_t *)*j)
  {
    if (*((char *)j + 39) < 0)
    {
      sub_2529C9C60(__s, (void *)j[2], j[3]);
    }
    else
    {
      *(_OWORD *)__s = *((_OWORD *)j + 1);
      uint64_t v233 = j[4];
    }
    sub_2529CEDC0(__s, (uint64_t)__dst);
    if (SHIBYTE(v233) < 0)
    {
      operator delete(__s[0]);
      int v118 = SBYTE7(__dst[1]);
      if (SBYTE7(__dst[1]) < 0)
      {
LABEL_142:
        v128 = *(const char **)&__dst[0];
        if (!strcmp(*(const char **)&__dst[0], "WhiteBalanceTempTintCI")) {
          goto LABEL_152;
        }
        if (!strcmp(v128, "ExposureAndBlackPointCI"))
        {
LABEL_155:
          if (*((_DWORD *)j + 12) != 4)
          {
            exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
            __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
          }
          uint64_t v155 = NSNumber;
          LODWORD(v156) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)j[10] + 24))(j[10]);
          uint64_t v161 = objc_msgSend_numberWithFloat_(v155, v157, v158, v159, v160, v156);
          objc_msgSend_setObject_forKeyedSubscript_(v116, v162, (uint64_t)v161, @"Exposure", v163);

          if (*((_DWORD *)j + 12) != 4)
          {
            v221 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(v221, "Incorrect data type requested.");
            __cxa_throw(v221, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
          }
          v164 = NSNumber;
          LODWORD(v165) = *(_DWORD *)((*(uint64_t (**)(uint64_t))(*(void *)j[10] + 24))(j[10]) + 4);
          uint64_t v135 = objc_msgSend_numberWithFloat_(v164, v166, v167, v168, v169, v165);
          objc_msgSend_setObject_forKeyedSubscript_(v116, v170, (uint64_t)v135, @"Black", v171);
          goto LABEL_168;
        }
        if (!strcmp(v128, "ExposureCI")) {
          goto LABEL_158;
        }
        if (!strcmp(v128, "ColorCastCI"))
        {
LABEL_160:
          if (*((_DWORD *)j + 12) != 4)
          {
            uint64_t v224 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(v224, "Incorrect data type requested.");
            __cxa_throw(v224, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
          }
          v180 = NSNumber;
          LODWORD(v181) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)j[10] + 24))(j[10]);
          uint64_t v135 = objc_msgSend_numberWithFloat_(v180, v182, v183, v184, v185, v181);
          objc_msgSend_setObject_forKeyedSubscript_(v116, v186, (uint64_t)v135, @"Cast", v187);
          goto LABEL_168;
        }
        if (!strcmp(v128, "VibrancyCI")) {
          goto LABEL_162;
        }
        if (!strcmp(v128, "HighlightsCI"))
        {
LABEL_164:
          if (*((_DWORD *)j + 12) != 4)
          {
            v226 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(v226, "Incorrect data type requested.");
            __cxa_throw(v226, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
          }
          v196 = NSNumber;
          LODWORD(v197) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)j[10] + 24))(j[10]);
          uint64_t v135 = objc_msgSend_numberWithFloat_(v196, v198, v199, v200, v201, v197);
          objc_msgSend_setObject_forKeyedSubscript_(v116, v202, (uint64_t)v135, @"Highlights", v203);
          goto LABEL_168;
        }
        if (!strcmp(v128, "HighKeyCI")) {
          goto LABEL_166;
        }
        goto LABEL_149;
      }
    }
    else
    {
      int v118 = SBYTE7(__dst[1]);
      if (SBYTE7(__dst[1]) < 0) {
        goto LABEL_142;
      }
    }
    if (*(void *)&__dst[0] == 0x6C61426574696857
      && *((void *)&__dst[0] + 1) == 0x706D655465636E61
      && *(void *)((char *)__dst + 15) == 0x4943746E695470)
    {
LABEL_152:
      if (*((_DWORD *)j + 12) != 4)
      {
        v219 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v219, "Incorrect data type requested.");
        __cxa_throw(v219, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      v138 = NSNumber;
      LODWORD(v139) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)j[10] + 24))(j[10]);
      v144 = objc_msgSend_numberWithFloat_(v138, v140, v141, v142, v143, v139);
      objc_msgSend_setObject_forKeyedSubscript_(v116, v145, (uint64_t)v144, @"Temperature", v146);

      if (*((_DWORD *)j + 12) != 4)
      {
        v220 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v220, "Incorrect data type requested.");
        __cxa_throw(v220, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      uint64_t v147 = NSNumber;
      LODWORD(v148) = *(_DWORD *)((*(uint64_t (**)(uint64_t))(*(void *)j[10] + 24))(j[10]) + 4);
      uint64_t v135 = objc_msgSend_numberWithFloat_(v147, v149, v150, v151, v152, v148);
      objc_msgSend_setObject_forKeyedSubscript_(v116, v153, (uint64_t)v135, @"Tint", v154);
      goto LABEL_168;
    }
    if (*(void *)&__dst[0] == 0x657275736F707845
      && *((void *)&__dst[0] + 1) == 0x6B63616C42646E41
      && *(void *)&__dst[1] == 0x4943746E696F50)
    {
      goto LABEL_155;
    }
    if (*(void *)&__dst[0] == 0x657275736F707845 && *(void *)((char *)__dst + 3) == 0x4943657275736FLL)
    {
LABEL_158:
      if (*((_DWORD *)j + 12) != 4)
      {
        uint64_t v223 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v223, "Incorrect data type requested.");
        __cxa_throw(v223, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      id v172 = NSNumber;
      LODWORD(v173) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)j[10] + 24))(j[10]);
      uint64_t v135 = objc_msgSend_numberWithFloat_(v172, v174, v175, v176, v177, v173);
      objc_msgSend_setObject_forKeyedSubscript_(v116, v178, (uint64_t)v135, @"Exposure", v179);
      goto LABEL_168;
    }
    if (*(void *)&__dst[0] == 0x736143726F6C6F43 && DWORD2(__dst[0]) == 4801396) {
      goto LABEL_160;
    }
    if (*(void *)&__dst[0] == 0x79636E6172626956 && *(void *)((char *)__dst + 3) == 0x494379636E6172)
    {
LABEL_162:
      if (*((_DWORD *)j + 12) != 4)
      {
        v225 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v225, "Incorrect data type requested.");
        __cxa_throw(v225, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      v188 = NSNumber;
      LODWORD(v189) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)j[10] + 24))(j[10]);
      uint64_t v135 = objc_msgSend_numberWithFloat_(v188, v190, v191, v192, v193, v189);
      objc_msgSend_setObject_forKeyedSubscript_(v116, v194, (uint64_t)v135, @"Vibrancy", v195);
      goto LABEL_168;
    }
    if (*(void *)&__dst[0] == 0x6867696C68676948 && *(void *)((char *)__dst + 5) == 0x49437374686769) {
      goto LABEL_164;
    }
    if (*(void *)&__dst[0] == 0x4379654B68676948 && WORD4(__dst[0]) == 73)
    {
LABEL_166:
      if (*((_DWORD *)j + 12) != 4)
      {
        uint64_t v227 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v227, "Incorrect data type requested.");
        __cxa_throw(v227, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      uint64_t v204 = NSNumber;
      LODWORD(v205) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)j[10] + 24))(j[10]);
      uint64_t v135 = objc_msgSend_numberWithFloat_(v204, v206, v207, v208, v209, v205);
      objc_msgSend_setObject_forKeyedSubscript_(v116, v210, (uint64_t)v135, @"High Key", v211);
      goto LABEL_168;
    }
    v128 = (const char *)__dst;
LABEL_149:
    if (!strcmp(v128, "ContrastCI"))
    {
      if (*((_DWORD *)j + 12) != 4)
      {
        uint64_t v228 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v228, "Incorrect data type requested.");
        __cxa_throw(v228, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      v129 = NSNumber;
      LODWORD(v130) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)j[10] + 24))(j[10]);
      uint64_t v135 = objc_msgSend_numberWithFloat_(v129, v131, v132, v133, v134, v130);
      objc_msgSend_setObject_forKeyedSubscript_(v116, v136, (uint64_t)v135, @"Contrast", v137);
LABEL_168:
    }
    if (v118 < 0) {
      operator delete(*(void **)&__dst[0]);
    }
  }
  id v212 = v116;

  sub_2529C988C((uint64_t)v236);
  v213 = (char *)v242;
  if (v242)
  {
    v214 = v243;
    uint64_t v215 = v242;
    if (v243 != v242)
    {
      do
      {
        if (*(v214 - 1) < 0) {
          operator delete(*((void **)v214 - 3));
        }
        v214 -= 24;
      }
      while (v214 != v213);
      uint64_t v215 = v242;
    }
    v243 = v213;
    operator delete(v215);
  }
  v253 = &unk_2702DD568;
  uint64_t v216 = v257;
  if (v257 && !atomic_fetch_add(&v257->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v216->__on_zero_shared)(v216);
    std::__shared_weak_count::__release_weak(v216);
  }
  if (v255[0])
  {
    v255[1] = v255[0];
    operator delete(v255[0]);
  }
  v258 = &unk_2702DD568;
  unint64_t v217 = v262;
  if (v262 && !atomic_fetch_add(&v262->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v217->__on_zero_shared)(v217);
    std::__shared_weak_count::__release_weak(v217);
  }
  if ((void)v260)
  {
    *((void *)&v260 + 1) = v260;
    operator delete((void *)v260);
  }

  return v212;
}

- (id)getValueForAdjustment:(id)a3 adjustments:(id)a4
{
  id v6 = a3;
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(a4, v7, (uint64_t)v6, v8, v9);
  if (!v14)
  {
    uint64_t v15 = NSNumber;
    uint64_t v16 = objc_msgSend_sliderSpecs(self, v10, v11, v12, v13);
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v6, v18, v19);
    objc_msgSend_identity(v20, v21, v22, v23, v24);
    uint64_t v14 = objc_msgSend_numberWithDouble_(v15, v25, v26, v27, v28);
  }

  return v14;
}

- (id)applyAdjustments:(id)a3 toCIImage:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = objc_msgSend_filterSequence(self, v10, v11, v12, v13);
  uint64_t v16 = objc_msgSend_applySliders_image_error_(v14, v15, (uint64_t)v8, (uint64_t)v9, (uint64_t)a5);

  return v16;
}

- (CGSize)imageSize
{
  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_imageSize, &v3, 16, 1, 0);
}

- (NSArray)sliderOrder
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSliderOrder:(id)a3
{
}

- (NSDictionary)sliderSpecs
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSliderSpecs:(id)a3
{
}

- (IHKFilterSequence)filterSequence
{
  return (IHKFilterSequence *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFilterSequence:(id)a3
{
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  self->_colorSpace = a3;
}

- (NSArray)adjustmentEndpoints
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAdjustmentEndpoints:(id)a3
{
}

- (NSString)contentFVecEndpoint
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setContentFVecEndpoint:(id)a3
{
}

- (NSString)styleFVecEndpoint
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setStyleFVecEndpoint:(id)a3
{
}

- (NSArray)contentFVecShape
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setContentFVecShape:(id)a3
{
}

- (NSArray)styleFVecShape
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setStyleFVecShape:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleFVecShape, 0);
  objc_storeStrong((id *)&self->_contentFVecShape, 0);
  objc_storeStrong((id *)&self->_styleFVecEndpoint, 0);
  objc_storeStrong((id *)&self->_contentFVecEndpoint, 0);
  objc_storeStrong((id *)&self->_adjustmentEndpoints, 0);
  objc_storeStrong((id *)&self->_filterSequence, 0);
  objc_storeStrong((id *)&self->_sliderSpecs, 0);
  objc_storeStrong((id *)&self->_sliderOrder, 0);
  cntrl = self->styleFVecNet.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    uint64_t v4 = self->contentFVecNet.__cntrl_;
    if (!v4) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = self->contentFVecNet.__cntrl_;
    if (!v4) {
      goto LABEL_7;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
LABEL_7:
  v5 = self->styleTransferNet.__cntrl_;
  if (v5 && !atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v5 + 16))(v5);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  return self;
}

@end