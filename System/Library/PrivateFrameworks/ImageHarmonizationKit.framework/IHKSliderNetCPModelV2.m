@interface IHKSliderNetCPModelV2
- (CGColorSpace)colorSpace;
- (CGSize)imageSize;
- (IHKFilterSequence)filterSequence;
- (IHKSliderNetCPModelV2)initWithModel:(id)a3;
- (IHKSliderNetCPModelV2)initWithModel:(id)a3 options:(id)a4 error:(id *)a5;
- (NSArray)adjustmentEndpoints;
- (NSArray)contentFVecShape;
- (NSArray)sliderOrder;
- (NSArray)styleFVecShape;
- (NSDictionary)sliderSpecs;
- (NSString)contentFVecEndpoint;
- (NSString)stemType;
- (NSString)styleFVecEndpoint;
- (id).cxx_construct;
- (id)applyAdjustments:(id)a3 toCIImage:(id)a4 error:(id *)a5;
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
- (void)setStemType:(id)a3;
- (void)setStyleFVecEndpoint:(id)a3;
- (void)setStyleFVecShape:(id)a3;
@end

@implementation IHKSliderNetCPModelV2

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

- (IHKSliderNetCPModelV2)initWithModel:(id)a3
{
  return (IHKSliderNetCPModelV2 *)objc_msgSend_initWithModel_options_error_(self, a2, (uint64_t)a3, 0, 0);
}

- (IHKSliderNetCPModelV2)initWithModel:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v282.receiver = self;
  v282.super_class = (Class)IHKSliderNetCPModelV2;
  v13 = [(IHKSliderNetCPModel *)&v282 initWithModel:v8 options:v9 error:a5];
  if (!v13) {
    goto LABEL_23;
  }
  objc_msgSend_stringByAppendingPathComponent_(v8, v10, @"net_info.json", v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_loadJSonFrom_(IHKSliderNetCPModel, v15, (uint64_t)v14, v16, v17);
  objc_msgSend_setInfo_(v13, v19, (uint64_t)v18, v20, v21);

  v26 = objc_msgSend_info(v13, v22, v23, v24, v25);
  v30 = objc_msgSend_objectForKeyedSubscript_(v26, v27, @"input_image_shape", v28, v29);

  v34 = objc_msgSend_objectAtIndexedSubscript_(v30, v31, 1, v32, v33);
  objc_msgSend_doubleValue(v34, v35, v36, v37, v38);
  double v40 = v39;
  v44 = objc_msgSend_objectAtIndexedSubscript_(v30, v41, 2, v42, v43);
  objc_msgSend_doubleValue(v44, v45, v46, v47, v48);
  objc_msgSend_setImageSize_(v13, v49, v50, v51, v52, v40, v53);

  v58 = objc_msgSend_info(v13, v54, v55, v56, v57);
  v13->_colorSpace = (CGColorSpace *)objc_msgSend_extractColorSpaceFromInfo_(v13, v59, (uint64_t)v58, v60, v61);

  objc_msgSend_setStemType_(v13, v62, @"dual_stem", v63, v64);
  v69 = objc_msgSend_info(v13, v65, v66, v67, v68);
  v73 = objc_msgSend_objectForKeyedSubscript_(v69, v70, @"stem_type", v71, v72);

  if (v73)
  {
    v78 = objc_msgSend_info(v13, v74, v75, v76, v77);
    v82 = objc_msgSend_objectForKeyedSubscript_(v78, v79, @"stem_type", v80, v81);
    objc_msgSend_setStemType_(v13, v83, (uint64_t)v82, v84, v85);
  }
  v86 = objc_msgSend_stemType(v13, v74, v75, v76, v77);
  int isEqualToString = objc_msgSend_isEqualToString_(v86, v87, @"dual_stem", v88, v89);

  if (isEqualToString)
  {
    v95 = objc_msgSend_info(v13, v91, v92, v93, v94);
    v99 = objc_msgSend_objectForKeyedSubscript_(v95, v96, @"content_fvec_endpoint", v97, v98);
    objc_msgSend_setContentFVecEndpoint_(v13, v100, (uint64_t)v99, v101, v102);

    v107 = objc_msgSend_info(v13, v103, v104, v105, v106);
    v111 = objc_msgSend_objectForKeyedSubscript_(v107, v108, @"style_fvec_endpoint", v109, v110);
    objc_msgSend_setStyleFVecEndpoint_(v13, v112, (uint64_t)v111, v113, v114);

    v119 = objc_msgSend_info(v13, v115, v116, v117, v118);
    v123 = objc_msgSend_objectForKeyedSubscript_(v119, v120, @"content_vector_shape", v121, v122);
    objc_msgSend_setContentFVecShape_(v13, v124, (uint64_t)v123, v125, v126);

    v131 = objc_msgSend_info(v13, v127, v128, v129, v130);
    v135 = objc_msgSend_objectForKeyedSubscript_(v131, v132, @"style_vector_shape", v133, v134);
    objc_msgSend_setStyleFVecShape_(v13, v136, (uint64_t)v135, v137, v138);

    v142 = objc_msgSend_stringByAppendingPathComponent_(v8, v139, @"contentFVec.espresso.net", v140, v141);

    id v143 = v142;
    v281 = (const char *)objc_msgSend_UTF8String(v143, v144, v145, v146, v147);
    v148 = operator new(0x30uLL);
    v148[1] = 0;
    v148[2] = 0;
    void *v148 = &unk_2702DD840;
    sub_2529CA980((uint64_t)&v283, v148 + 3, &v281);
    cntrl = (std::__shared_weak_count *)v13->contentFVecNet.__cntrl_;
    v13->contentFVecNet.__ptr_ = (EspressoNet *)(v148 + 3);
    v13->contentFVecNet.__cntrl_ = (__shared_weak_count *)v148;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v153 = objc_msgSend_stringByAppendingPathComponent_(v8, v149, @"styleFVec.espresso.net", v150, v151, v281);

    id v14 = v153;
    v281 = (const char *)objc_msgSend_UTF8String(v14, v154, v155, v156, v157);
    v158 = operator new(0x30uLL);
    v158[1] = 0;
    v158[2] = 0;
    void *v158 = &unk_2702DD840;
    sub_2529CA980((uint64_t)&v283, v158 + 3, &v281);
    v162 = (std::__shared_weak_count *)v13->styleFVecNet.__cntrl_;
    v13->styleFVecNet.__ptr_ = (EspressoNet *)(v158 + 3);
    v13->styleFVecNet.__cntrl_ = (__shared_weak_count *)v158;
    if (!v162) {
      goto LABEL_19;
    }
  }
  else
  {
    v163 = objc_msgSend_stemType(v13, v91, v92, v93, v94);
    int v167 = objc_msgSend_isEqualToString_(v163, v164, @"unified_stem", v165, v166);

    if (!v167) {
      goto LABEL_19;
    }
    v169 = objc_msgSend_info(v13, v159, v168, v160, v161);
    v173 = objc_msgSend_objectForKeyedSubscript_(v169, v170, @"style_and_content_fvec_endpoint", v171, v172);
    objc_msgSend_setContentFVecEndpoint_(v13, v174, (uint64_t)v173, v175, v176);

    v181 = objc_msgSend_contentFVecEndpoint(v13, v177, v178, v179, v180);
    objc_msgSend_setStyleFVecEndpoint_(v13, v182, (uint64_t)v181, v183, v184);

    v189 = objc_msgSend_info(v13, v185, v186, v187, v188);
    v193 = objc_msgSend_objectForKeyedSubscript_(v189, v190, @"style_and_content_vector_shape", v191, v192);
    objc_msgSend_setContentFVecShape_(v13, v194, (uint64_t)v193, v195, v196);

    v201 = objc_msgSend_contentFVecShape(v13, v197, v198, v199, v200);
    objc_msgSend_setStyleFVecShape_(v13, v202, (uint64_t)v201, v203, v204);

    v208 = objc_msgSend_stringByAppendingPathComponent_(v8, v205, @"styleAndContentFVec.espresso.net", v206, v207);

    id v14 = v208;
    v281 = (const char *)objc_msgSend_UTF8String(v14, v209, v210, v211, v212);
    v213 = operator new(0x30uLL);
    v213[1] = 0;
    v213[2] = 0;
    void *v213 = &unk_2702DD840;
    sub_2529CA980((uint64_t)&v283, v213 + 3, &v281);
    v214 = (std::__shared_weak_count *)v13->contentFVecNet.__cntrl_;
    v13->contentFVecNet.__ptr_ = (EspressoNet *)(v213 + 3);
    v13->contentFVecNet.__cntrl_ = (__shared_weak_count *)v213;
    if (v214 && !atomic_fetch_add(&v214->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v214->__on_zero_shared)(v214);
      std::__shared_weak_count::__release_weak(v214);
    }
    ptr = v13->contentFVecNet.__ptr_;
    v215 = v13->contentFVecNet.__cntrl_;
    if (v215) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v215 + 1, 1uLL, memory_order_relaxed);
    }
    v162 = (std::__shared_weak_count *)v13->styleFVecNet.__cntrl_;
    v13->styleFVecNet.__ptr_ = ptr;
    v13->styleFVecNet.__cntrl_ = v215;
    if (!v162) {
      goto LABEL_19;
    }
  }
  if (!atomic_fetch_add(&v162->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v162->__on_zero_shared)(v162);
    std::__shared_weak_count::__release_weak(v162);
  }
LABEL_19:
  v217 = objc_msgSend_stringByAppendingPathComponent_(v8, v159, @"styleTransfer.espresso.net", v160, v161, v281);

  id v218 = v217;
  v281 = (const char *)objc_msgSend_UTF8String(v218, v219, v220, v221, v222);
  v223 = operator new(0x30uLL);
  v223[1] = 0;
  v223[2] = 0;
  void *v223 = &unk_2702DD840;
  sub_2529CA980((uint64_t)&v283, v223 + 3, &v281);
  v228 = (std::__shared_weak_count *)v13->styleTransferNet.__cntrl_;
  v13->styleTransferNet.__ptr_ = (EspressoNet *)(v223 + 3);
  v13->styleTransferNet.__cntrl_ = (__shared_weak_count *)v223;
  if (v228 && !atomic_fetch_add(&v228->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v228->__on_zero_shared)(v228);
    std::__shared_weak_count::__release_weak(v228);
  }
  v229 = objc_msgSend_info(v13, v224, v225, v226, v227);
  v233 = objc_msgSend_objectForKeyedSubscript_(v229, v230, @"adjustment_endpoints", v231, v232);
  objc_msgSend_setAdjustmentEndpoints_(v13, v234, (uint64_t)v233, v235, v236);

  v241 = objc_msgSend_info(v13, v237, v238, v239, v240);
  v245 = objc_msgSend_objectForKeyedSubscript_(v241, v242, @"ci_filter_sequence", v243, v244);

  v246 = [IHKFilterSequence alloc];
  v250 = objc_msgSend_initWithFilterSpec_(v246, v247, (uint64_t)v245, v248, v249);
  objc_msgSend_setFilterSequence_(v13, v251, (uint64_t)v250, v252, v253);

  v258 = objc_msgSend_filterSequence(v13, v254, v255, v256, v257);
  v263 = objc_msgSend_sliderOrder(v258, v259, v260, v261, v262);
  objc_msgSend_setSliderOrder_(v13, v264, (uint64_t)v263, v265, v266);

  v271 = objc_msgSend_filterSequence(v13, v267, v268, v269, v270);
  v276 = objc_msgSend_sliderSpecs(v271, v272, v273, v274, v275);
  objc_msgSend_setSliderSpecs_(v13, v277, (uint64_t)v276, v278, v279);

LABEL_23:
  return v13;
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
  v72.super_class = (Class)IHKSliderNetCPModelV2;
  id v11 = [(IHKSliderNetCPModel *)&v72 predictStyleVectorForPixelBuffer:a3 scenePrint:v8 error:a5];
  if (a5 && *a5
    || (uint64_t v12 = (__CVBuffer *)objc_msgSend_preprocessPixelBuffer_error_(self, v9, (uint64_t)a3, (uint64_t)a5, v10), a5)
    && *a5)
  {
    v13 = 0;
    goto LABEL_52;
  }
  sub_2529C6860((uint64_t)v68, v12);
  ptr = self->styleFVecNet.__ptr_;
  sub_2529C7EC8((uint64_t)&v73, "image", (uint64_t)v68);
  memset(v56, 0, sizeof(v56));
  int v57 = 1065353216;
  sub_2529CA1B0((uint64_t)v56, (uint64_t)&v73, &v73);
  objc_msgSend_styleFVecEndpoint(self, v15, v16, v17, v18);
  id v19 = objc_claimAutoreleasedReturnValue();
  uint64_t v24 = (const char *)objc_msgSend_UTF8String(v19, v20, v21, v22, v23);
  size_t v25 = strlen(v24);
  if (v25 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  v26 = (void *)v25;
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
  v30 = v61;
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
  uint64_t v75 = &unk_2702DD568;
  v31 = v78;
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
  v35 = [IHKFeatureVector alloc];
  uint64_t v47 = &unk_2702DD568;
  LODWORD(v48) = v63;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  v49 = 0;
  uint64_t v36 = v64;
  int64_t v37 = v65 - (unsigned char *)v64;
  if (v65 != v64)
  {
    if (v37 < 0) {
      sub_2529C1558();
    }
    v49 = operator new(v65 - (unsigned char *)v64);
    uint64_t v51 = (char *)v49 + 8 * (v37 >> 3);
    memcpy(v49, v36, v37);
    uint64_t v50 = v51;
  }
  uint64_t v52 = v66;
  double v53 = v67;
  if (v67) {
    atomic_fetch_add_explicit(&v67->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v47 = &unk_2702DD520;
  v41 = objc_msgSend_initWithTensor_(v35, v32, (uint64_t)&v47, v33, v34);
  uint64_t v47 = &unk_2702DD568;
  uint64_t v42 = v53;
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

  v62 = &unk_2702DD568;
  v44 = v67;
  if (v67 && !atomic_fetch_add(&v67->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  v68[0] = &unk_2702DD568;
  v45 = v71;
  if (v71 && !atomic_fetch_add(&v71->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
  }
  if (v69)
  {
    v70 = v69;
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
  v72.super_class = (Class)IHKSliderNetCPModelV2;
  id v11 = [(IHKSliderNetCPModel *)&v72 predictContentVectorForPixelBuffer:a3 scenePrint:v8 error:a5];
  if (a5 && *a5
    || (uint64_t v12 = (__CVBuffer *)objc_msgSend_preprocessPixelBuffer_error_(self, v9, (uint64_t)a3, (uint64_t)a5, v10), a5)
    && *a5)
  {
    v13 = 0;
    goto LABEL_52;
  }
  sub_2529C6860((uint64_t)v68, v12);
  ptr = self->contentFVecNet.__ptr_;
  sub_2529C7EC8((uint64_t)&v73, "image", (uint64_t)v68);
  memset(v56, 0, sizeof(v56));
  int v57 = 1065353216;
  sub_2529CA1B0((uint64_t)v56, (uint64_t)&v73, &v73);
  objc_msgSend_contentFVecEndpoint(self, v15, v16, v17, v18);
  id v19 = objc_claimAutoreleasedReturnValue();
  uint64_t v24 = (const char *)objc_msgSend_UTF8String(v19, v20, v21, v22, v23);
  size_t v25 = strlen(v24);
  if (v25 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  v26 = (void *)v25;
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
  v30 = v61;
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
  uint64_t v75 = &unk_2702DD568;
  v31 = v78;
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
  v35 = [IHKFeatureVector alloc];
  uint64_t v47 = &unk_2702DD568;
  LODWORD(v48) = v63;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  v49 = 0;
  uint64_t v36 = v64;
  int64_t v37 = v65 - (unsigned char *)v64;
  if (v65 != v64)
  {
    if (v37 < 0) {
      sub_2529C1558();
    }
    v49 = operator new(v65 - (unsigned char *)v64);
    uint64_t v51 = (char *)v49 + 8 * (v37 >> 3);
    memcpy(v49, v36, v37);
    uint64_t v50 = v51;
  }
  uint64_t v52 = v66;
  double v53 = v67;
  if (v67) {
    atomic_fetch_add_explicit(&v67->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v47 = &unk_2702DD520;
  v41 = objc_msgSend_initWithTensor_(v35, v32, (uint64_t)&v47, v33, v34);
  uint64_t v47 = &unk_2702DD568;
  uint64_t v42 = v53;
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

  v62 = &unk_2702DD568;
  v44 = v67;
  if (v67 && !atomic_fetch_add(&v67->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  v68[0] = &unk_2702DD568;
  v45 = v71;
  if (v71 && !atomic_fetch_add(&v71->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
  }
  if (v69)
  {
    v70 = v69;
    operator delete(v69);
  }
  v13 = v11;
LABEL_52:

  return v13;
}

- (id)predictSlidersForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend_useClipEmbedding(self, v9, v10, v11, v12))
  {
    uint64_t v17 = objc_msgSend_size(v7, v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_styleFVecSize(self, v18, v19, v20, v21);
    uint64_t v27 = objc_msgSend_styleFVecSize(self, v23, v24, v25, v26);
    v30 = objc_msgSend_subFeatureVectorWithRange_(v7, v28, v17 - v22, v27, v29);

    uint64_t v35 = objc_msgSend_size(v8, v31, v32, v33, v34);
    uint64_t v40 = objc_msgSend_contentFVecSize(self, v36, v37, v38, v39);
    uint64_t v45 = objc_msgSend_contentFVecSize(self, v41, v42, v43, v44);
    uint64_t v48 = objc_msgSend_subFeatureVectorWithRange_(v8, v46, v35 - v40, v45, v47);

    id v8 = (id)v48;
  }
  else
  {
    v30 = v7;
  }
  v49 = objc_msgSend_adjustmentEndpoints(self, v13, v14, v15, v16);
  objc_msgSend_objectAtIndexedSubscript_(v49, v50, 0, v51, v52);
  id v53 = objc_claimAutoreleasedReturnValue();
  v58 = (const char *)objc_msgSend_UTF8String(v53, v54, v55, v56, v57);
  size_t v59 = strlen(v58);
  if (v59 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v60 = v59;
  if (v59 >= 0x17)
  {
    uint64_t v62 = (v59 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v59 | 7) != 0x17) {
      uint64_t v62 = v59 | 7;
    }
    uint64_t v63 = v62 + 1;
    p_dst = (long long *)operator new(v62 + 1);
    *((void *)&__dst + 1) = v60;
    unint64_t v128 = v63 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_11;
  }
  HIBYTE(v128) = v59;
  p_dst = &__dst;
  if (v59) {
LABEL_11:
  }
    memmove(p_dst, v58, v60);
  *((unsigned char *)p_dst + v60) = 0;

  ptr = self->styleTransferNet.__ptr_;
  if (v30)
  {
    objc_msgSend_tensor(v30, v64, v65, v66, v67);
  }
  else
  {
    v123 = 0;
    *(_OWORD *)uint64_t v121 = 0u;
    long long v122 = 0u;
    long long v120 = 0u;
  }
  sub_2529C9988((uint64_t)&v131, "fvec_style", (uint64_t)&v120);
  if (v8)
  {
    objc_msgSend_tensor(v8, v69, v70, v71, v72);
  }
  else
  {
    v119 = 0;
    *(_OWORD *)uint64_t v117 = 0u;
    long long v118 = 0u;
    long long v116 = 0u;
  }
  sub_2529C9AF4((uint64_t)&v137, "fvec_content", (uint64_t)&v116);
  memset(v124, 0, sizeof(v124));
  int v125 = 1065353216;
  sub_2529CA1B0((uint64_t)v124, (uint64_t)&v131, &v131);
  sub_2529CA1B0((uint64_t)v124, (uint64_t)&v137, &v137);
  if (SHIBYTE(v128) < 0)
  {
    sub_2529C9C60(&v129, (void *)__dst, *((unint64_t *)&__dst + 1));
  }
  else
  {
    long long v129 = __dst;
    unint64_t v130 = v128;
  }
  sub_2529CA720(&__p, (uint64_t)&v129, 1uLL);
  sub_2529C5EBC((uint64_t)ptr, (uint64_t)v124, (long long **)&__p, (uint64_t)v126);
  long long v73 = (void **)__p;
  if (__p)
  {
    char v74 = v115;
    uint64_t v75 = __p;
    if (v115 != __p)
    {
      do
      {
        if (*((char *)v74 - 1) < 0) {
          operator delete(*(v74 - 3));
        }
        v74 -= 3;
      }
      while (v74 != v73);
      uint64_t v75 = __p;
    }
    v115 = v73;
    operator delete(v75);
  }
  if (SHIBYTE(v130) < 0) {
    operator delete((void *)v129);
  }
  sub_2529C988C((uint64_t)v124);
  v139 = &unk_2702DD568;
  uint64_t v76 = v142;
  if (v142 && !atomic_fetch_add(&v142->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
    std::__shared_weak_count::__release_weak(v76);
  }
  if (v140)
  {
    uint64_t v141 = v140;
    operator delete(v140);
  }
  if (v138 < 0) {
    operator delete((void *)v137);
  }
  uint64_t v133 = &unk_2702DD568;
  uint64_t v77 = v136;
  if (v136 && !atomic_fetch_add(&v136->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
    std::__shared_weak_count::__release_weak(v77);
  }
  if (v134)
  {
    v135 = v134;
    operator delete(v134);
  }
  if (SHIBYTE(v132) < 0) {
    operator delete((void *)v131);
  }
  *(void *)&long long v116 = &unk_2702DD568;
  v78 = v119;
  if (v119 && !atomic_fetch_add(&v119->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
    std::__shared_weak_count::__release_weak(v78);
  }
  if (v117[0])
  {
    v117[1] = v117[0];
    operator delete(v117[0]);
  }
  *(void *)&long long v120 = &unk_2702DD568;
  uint64_t v79 = v123;
  if (v123 && !atomic_fetch_add(&v123->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
    std::__shared_weak_count::__release_weak(v79);
  }
  if (v121[0])
  {
    v121[1] = v121[0];
    operator delete(v121[0]);
  }
  *(void *)&long long v120 = &__dst;
  uint64_t v80 = sub_2529C9D00((uint64_t)v126, (uint64_t)&__dst, (uint64_t)&unk_2529D9AA5, (long long **)&v120);
  sub_2529C4DBC((uint64_t)(v80 + 5), (uint64_t)&v131);
  uint64_t v85 = objc_opt_new();
  for (unint64_t i = 0; ; ++i)
  {
    v87 = objc_msgSend_sliderOrder(self, v81, v82, v83, v84);
    BOOL v92 = i < objc_msgSend_count(v87, v88, v89, v90, v91);

    if (!v92) {
      break;
    }
    if (DWORD2(v131) != 4)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    uint64_t v93 = NSNumber;
    LODWORD(v94) = *(_DWORD *)(((uint64_t (*)(std::__shared_weak_count *))v134->__get_deleter)(v134) + 4 * i);
    v99 = objc_msgSend_numberWithFloat_(v93, v95, v96, v97, v98, v94);
    uint64_t v104 = objc_msgSend_sliderOrder(self, v100, v101, v102, v103);
    v108 = objc_msgSend_objectAtIndexedSubscript_(v104, v105, i, v106, v107);
    objc_msgSend_setObject_forKeyedSubscript_(v85, v109, (uint64_t)v99, (uint64_t)v108, v110);
  }
  *(void *)&long long v131 = &unk_2702DD568;
  v111 = v135;
  if (v135 && !atomic_fetch_add(&v135->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
    std::__shared_weak_count::__release_weak(v111);
  }
  if (v132)
  {
    uint64_t v133 = v132;
    operator delete(v132);
  }
  sub_2529C988C((uint64_t)v126);
  if (SHIBYTE(v128) < 0) {
    operator delete((void *)__dst);
  }

  return v85;
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

- (NSString)stemType
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setStemType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stemType, 0);
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