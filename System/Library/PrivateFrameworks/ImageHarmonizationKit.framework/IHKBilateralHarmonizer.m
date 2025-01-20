@interface IHKBilateralHarmonizer
+ (id)getDefault;
- (CGImage)handleRequest:(id)a3;
- (IHKBilateralHarmonizer)initWithNetwork:(id)a3 supportsAlpha:(unsigned __int8)a4 fgName:(id)a5 bgName:(id)a6 outName:(id)a7 gatingOutName:(id)a8 gatingThreshold:(float)a9 inputResolution:(unint64_t)a10;
- (IHKBilateralHarmonizer)initWithNetwork:(id)a3 supportsAlpha:(unsigned __int8)a4 fgName:(id)a5 bgName:(id)a6 outName:(id)a7 gatingOutName:(id)a8 gatingThreshold:(float)a9 inputResolution:(unint64_t)a10 baseHarmonizationStrength:(float)a11;
- (IHKBilateralHarmonizer)initWithNetwork:(id)a3 supportsAlpha:(unsigned __int8)a4 fgName:(id)a5 bgName:(id)a6 outName:(id)a7 inputResolution:(unint64_t)a8;
- (NSString)networkPath;
- (id).cxx_construct;
- (id)harmonize:(id)a3;
- (unsigned)supportsAlpha;
- (void)load;
@end

@implementation IHKBilateralHarmonizer

+ (id)getDefault
{
  v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_bundleForClass_(v3, v5, v4, v6, v7);
  v10 = objc_msgSend_pathForResource_ofType_inDirectory_(v8, v9, @"stylotorch_1.3.0_har_5yfia6gt28_227200_gat_dkn9b63bjd_22752", @"espresso.net", @"Models");
  id v11 = objc_alloc((Class)a1);
  LODWORD(v12) = 1050253722;
  LODWORD(v13) = 0.75;
  v15 = objc_msgSend_initWithNetwork_supportsAlpha_fgName_bgName_outName_gatingOutName_gatingThreshold_inputResolution_baseHarmonizationStrength_(v11, v14, (uint64_t)v10, 1, @"subject_rgba", @"background_style", @"decoder_swapped_grid_predictor_grid", @"gating_module_subject_orig_out", v12, v13, 128);

  return v15;
}

- (IHKBilateralHarmonizer)initWithNetwork:(id)a3 supportsAlpha:(unsigned __int8)a4 fgName:(id)a5 bgName:(id)a6 outName:(id)a7 inputResolution:(unint64_t)a8
{
  return (IHKBilateralHarmonizer *)objc_msgSend_initWithNetwork_supportsAlpha_fgName_bgName_outName_gatingOutName_gatingThreshold_inputResolution_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, a6, a7, 0, 0.0, a8);
}

- (IHKBilateralHarmonizer)initWithNetwork:(id)a3 supportsAlpha:(unsigned __int8)a4 fgName:(id)a5 bgName:(id)a6 outName:(id)a7 gatingOutName:(id)a8 gatingThreshold:(float)a9 inputResolution:(unint64_t)a10
{
  LODWORD(v10) = 1.0;
  return (IHKBilateralHarmonizer *)objc_msgSend_initWithNetwork_supportsAlpha_fgName_bgName_outName_gatingOutName_gatingThreshold_inputResolution_baseHarmonizationStrength_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, a6, a7, 0, 0.0, v10);
}

- (IHKBilateralHarmonizer)initWithNetwork:(id)a3 supportsAlpha:(unsigned __int8)a4 fgName:(id)a5 bgName:(id)a6 outName:(id)a7 gatingOutName:(id)a8 gatingThreshold:(float)a9 inputResolution:(unint64_t)a10 baseHarmonizationStrength:(float)a11
{
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  id v38 = a7;
  id v37 = a8;
  v51.receiver = self;
  v51.super_class = (Class)IHKBilateralHarmonizer;
  v22 = [(IHKBilateralHarmonizer *)&v51 init];
  if (v22)
  {
    id v35 = v20;
    unint64_t v39 = a10;
    unint64_t v40 = a10;
    int v41 = 1111970369;
    char v42 = 1;
    char v43 = 0;
    char v44 = 0;
    sub_2529CD154((uint64_t)&v45, (uint64_t)&v39);
    v22->_fgInput.type_ = v46;
    if (&v22->_fgInput != (PixelBufferTensor *)&v45) {
      sub_2529C1824(&v22->_fgInput.shape_.sizes_.__begin_, (char *)__p, v48, (v48 - (unsigned char *)__p) >> 3);
    }
    v24 = v49;
    v23 = (__shared_weak_count *)v50;
    if (v50) {
      atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v22->_fgInput.storage_.__cntrl_;
    v22->_fgInput.storage_.__ptr_ = v24;
    v22->_fgInput.storage_.__cntrl_ = v23;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v45 = &unk_2702DD568;
    v26 = v50;
    if (v50 && !atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
    if (__p)
    {
      v48 = (char *)__p;
      operator delete(__p);
    }
    unint64_t v39 = a10;
    unint64_t v40 = a10;
    int v41 = 1111970369;
    char v42 = 1;
    char v43 = 0;
    char v44 = 0;
    sub_2529CD154((uint64_t)&v45, (uint64_t)&v39);
    v22->_bgInput.type_ = v46;
    if (&v22->_bgInput != (PixelBufferTensor *)&v45) {
      sub_2529C1824(&v22->_bgInput.shape_.sizes_.__begin_, (char *)__p, v48, (v48 - (unsigned char *)__p) >> 3);
    }
    v28 = v49;
    v27 = (__shared_weak_count *)v50;
    if (v50) {
      atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v29 = (std::__shared_weak_count *)v22->_bgInput.storage_.__cntrl_;
    v22->_bgInput.storage_.__ptr_ = v28;
    v22->_bgInput.storage_.__cntrl_ = v27;
    if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
    v45 = &unk_2702DD568;
    v30 = v50;
    if (v50 && !atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
    if (__p)
    {
      v48 = (char *)__p;
      operator delete(__p);
    }
    objc_storeStrong((id *)&v22->_networkPath, a3);
    v22->_supportsAlpha = a4;
    objc_storeStrong((id *)&v22->_fgName, a5);
    objc_storeStrong((id *)&v22->_bgName, a6);
    objc_storeStrong((id *)&v22->_outName, a7);
    objc_storeStrong((id *)&v22->_gatingOutName, a8);
    v22->_gatingThreshold = a9;
    id v20 = v35;
    v31 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v22->_lock;
    v22->_lock = v31;

    v22->_baseHarmonizationStrength = a11;
    v33 = v22;
  }

  return v22;
}

- (void)load
{
  objc_msgSend_UTF8String(self->_networkPath, a2, v2, v3, v4);
  sub_2529D4548();
}

- (CGImage)handleRequest:(id)a3
{
  id v4 = a3;
  v5 = [IHKHarmonizationRequest alloc];
  uint64_t v10 = objc_msgSend_fg(v4, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_bg(v4, v11, v12, v13, v14);
  objc_msgSend_harmonizationStrength(v4, v16, v17, v18, v19);
  id v21 = objc_msgSend_initWithForeground_background_forceHarmonization_harmonizationStrength_(v5, v20, v10, v15, 1);
  v25 = objc_msgSend_harmonize_(self, v22, (uint64_t)v21, v23, v24);
  v30 = (CGImage *)objc_msgSend_harmonized(v25, v26, v27, v28, v29);

  CGImageRetain(v30);
  return v30;
}

- (id)harmonize:(id)a3
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_fg(v4, v5, v6, v7, v8);
  uint64_t v13 = (__CVBuffer *)objc_msgSend_convertCGImageToBGRA_sRGB_PixelBuffer_(IHKImageUtils, v10, v9, v11, v12);
  uint64_t v18 = objc_msgSend_bg(v4, v14, v15, v16, v17);
  v22 = (__CVBuffer *)objc_msgSend_convertCGImageToBGRA_sRGB_PixelBuffer_(IHKImageUtils, v19, v18, v20, v21);
  CGImageRef imageOut = 0;
  VTCreateCGImageFromCVPixelBuffer(v13, 0, &imageOut);
  objc_msgSend_lock(self->_lock, v23, v24, v25, v26);
  objc_msgSend_rescaleCVPixelBuffers_dest_(IHKImageUtils, v27, (uint64_t)v13, *((void *)self->_fgInput.storage_.__ptr_ + 1), v28);
  objc_msgSend_rescaleCVPixelBuffers_dest_(IHKImageUtils, v29, (uint64_t)v22, *((void *)self->_bgInput.storage_.__ptr_ + 1), v30);
  CVPixelBufferRelease(v13);
  CVPixelBufferRelease(v22);
  value = self->_net.__ptr_.__value_;
  v107 = (const char *)objc_msgSend_UTF8String(self->_fgName, v32, v33, v34, v35);
  sub_2529D57F4((uint64_t)&v113, &v107, (uint64_t)&self->_fgInput);
  v106 = (const char *)objc_msgSend_UTF8String(self->_bgName, v36, v37, v38, v39);
  sub_2529D57F4((uint64_t)v120, &v106, (uint64_t)&self->_bgInput);
  long long __dst = 0u;
  long long v109 = 0u;
  int v110 = 1065353216;
  sub_2529CA1B0((uint64_t)&__dst, (uint64_t)&v113, &v113);
  sub_2529CA1B0((uint64_t)&__dst, (uint64_t)v120, (long long *)v120);
  sub_2529D50E8((uint64_t)value, (uint64_t)&__dst, (uint64_t)v111);
  sub_2529C988C((uint64_t)&__dst);
  v122 = &unk_2702DD568;
  char v44 = v125;
  if (v125 && !atomic_fetch_add(&v125->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  if (__p)
  {
    v124 = __p;
    operator delete(__p);
  }
  if (v121 < 0) {
    operator delete(v120[0]);
  }
  v115 = (char *)&unk_2702DD568;
  v45 = v119;
  if (v119 && !atomic_fetch_add(&v119->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
  }
  if (v117)
  {
    v118 = (std::__shared_weak_count *)v117;
    operator delete(v117);
  }
  if ((SHIBYTE(v114) & 0x80000000) == 0)
  {
    gatingOutName = self->_gatingOutName;
    if (gatingOutName) {
      goto LABEL_15;
    }
LABEL_20:
    BOOL v51 = 1;
    float v52 = 1.0;
    goto LABEL_38;
  }
  operator delete((void *)v113);
  gatingOutName = self->_gatingOutName;
  if (!gatingOutName) {
    goto LABEL_20;
  }
LABEL_15:
  v47 = (const char *)objc_msgSend_UTF8String(gatingOutName, v40, v41, v42, v43);
  size_t v48 = strlen(v47);
  if (v48 > 0x7FFFFFFFFFFFFFF7) {
    sub_2529C1D00();
  }
  size_t v49 = v48;
  if (v48 >= 0x17)
  {
    uint64_t v53 = (v48 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v48 | 7) != 0x17) {
      uint64_t v53 = v48 | 7;
    }
    uint64_t v54 = v53 + 1;
    p_dst = (long long *)operator new(v53 + 1);
    *((void *)&__dst + 1) = v49;
    *(void *)&long long v109 = v54 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
  }
  else
  {
    BYTE7(v109) = v48;
    p_dst = &__dst;
    if (!v48) {
      goto LABEL_25;
    }
  }
  memmove(p_dst, v47, v49);
LABEL_25:
  *((unsigned char *)p_dst + v49) = 0;
  v55 = sub_2529C7818(v111, (uint64_t)&__dst);
  v56 = v55;
  if (!v55) {
    sub_2529C77BC("unordered_map::at: key not found");
  }
  *(void *)&long long v113 = &unk_2702DD568;
  DWORD2(v113) = *((_DWORD *)v55 + 12);
  v115 = 0;
  v116 = 0;
  v114 = 0;
  v58 = (unsigned char *)v55[7];
  v57 = (unsigned char *)v55[8];
  int64_t v59 = v57 - v58;
  if (v57 != v58)
  {
    if (v59 < 0) {
      sub_2529C1558();
    }
    v114 = (char *)operator new(v57 - v58);
    v115 = v114;
    v60 = &v114[8 * (v59 >> 3)];
    v116 = v60;
    memcpy(v114, v58, v59);
    v115 = v60;
  }
  v61 = (atomic_ullong *)v56[11];
  v117 = (void *)v56[10];
  v118 = (std::__shared_weak_count *)v61;
  if (v61) {
    atomic_fetch_add_explicit(v61 + 1, 1uLL, memory_order_relaxed);
  }
  *(void *)&long long v113 = &unk_2702DD520;
  if (SBYTE7(v109) < 0) {
    operator delete((void *)__dst);
  }
  v62 = v118;
  float v52 = **((float **)v117 + 1);
  BOOL v51 = v52 > self->_gatingThreshold;
  *(void *)&long long v113 = &unk_2702DD568;
  if (v118 && !atomic_fetch_add(&v118->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
    std::__shared_weak_count::__release_weak(v62);
  }
  if (v114)
  {
    v115 = v114;
    operator delete(v114);
  }
LABEL_38:
  if (!(objc_msgSend_forceHarmonization(v4, v40, v41, v42, v43) | v51))
  {
    objc_msgSend_unlock(self->_lock, v63, v64, v65, v66);
    uint64_t v71 = 0;
    goto LABEL_61;
  }
  v67 = (const char *)objc_msgSend_UTF8String(self->_outName, v63, v64, v65, v66);
  size_t v68 = strlen(v67);
  if (v68 > 0x7FFFFFFFFFFFFFF7) {
    sub_2529C1D00();
  }
  size_t v69 = v68;
  if (v68 >= 0x17)
  {
    uint64_t v72 = (v68 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v68 | 7) != 0x17) {
      uint64_t v72 = v68 | 7;
    }
    uint64_t v73 = v72 + 1;
    v70 = (long long *)operator new(v72 + 1);
    *((void *)&__dst + 1) = v69;
    *(void *)&long long v109 = v73 | 0x8000000000000000;
    *(void *)&long long __dst = v70;
  }
  else
  {
    BYTE7(v109) = v68;
    v70 = &__dst;
    if (!v68) {
      goto LABEL_48;
    }
  }
  memmove(v70, v67, v69);
LABEL_48:
  *((unsigned char *)v70 + v69) = 0;
  v74 = sub_2529C7818(v111, (uint64_t)&__dst);
  v75 = v74;
  if (!v74) {
    sub_2529C77BC("unordered_map::at: key not found");
  }
  *(void *)&long long v113 = &unk_2702DD568;
  DWORD2(v113) = *((_DWORD *)v74 + 12);
  v115 = 0;
  v116 = 0;
  v114 = 0;
  v77 = (unsigned char *)v74[7];
  v76 = (unsigned char *)v74[8];
  int64_t v78 = v76 - v77;
  if (v76 != v77)
  {
    if (v78 < 0) {
      sub_2529C1558();
    }
    v114 = (char *)operator new(v76 - v77);
    v115 = v114;
    v79 = &v114[8 * (v78 >> 3)];
    v116 = v79;
    memcpy(v114, v77, v78);
    v115 = v79;
  }
  v80 = (atomic_ullong *)v75[11];
  v117 = (void *)v75[10];
  v118 = (std::__shared_weak_count *)v80;
  if (v80) {
    atomic_fetch_add_explicit(v80 + 1, 1uLL, memory_order_relaxed);
  }
  *(void *)&long long v113 = &unk_2702DD520;
  if (SBYTE7(v109) < 0) {
    operator delete((void *)__dst);
  }
  v81 = (const void *)*((void *)v117 + 1);
  uint64_t v82 = *((void *)v117 + 11);
  uint64_t v83 = *((void *)v117 + 12);
  uint64_t v84 = 4 * v82 * *((void *)v117 + 13) * *((void *)v117 + 14);
  v85 = malloc_type_malloc(v84 * v83, 0xF7FFCDC5uLL);
  memcpy(v85, v81, v84 * v83);
  objc_msgSend_unlock(self->_lock, v86, v87, v88, v89);
  CGImageRef v90 = imageOut;
  objc_msgSend_harmonizationStrength(v4, v91, v92, v93, v94, v85, v83, v82, v84);
  *(float *)&double v96 = v95 * self->_baseHarmonizationStrength;
  uint64_t v71 = objc_msgSend_autoApplyGridBufferWithGridBuffer_image_assume_BGRA_sRGB_gridStrength_(_TtC21ImageHarmonizationKit21IHKBilateralGridUtils, v97, (uint64_t)&v105, (uint64_t)v90, 1, v96);
  free(v85);
  *(void *)&long long v113 = &unk_2702DD568;
  v98 = v118;
  if (v118 && !atomic_fetch_add(&v118->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
    std::__shared_weak_count::__release_weak(v98);
  }
  if (v114)
  {
    v115 = v114;
    operator delete(v114);
  }
LABEL_61:
  CGImageRelease(imageOut);
  v99 = [IHKHarmonizationResult alloc];
  *(float *)&double v100 = v52;
  shouldHarmonize = objc_msgSend_initWithHarmonized_gatingScore_shouldHarmonize_(v99, v101, v71, v51, v102, v100);
  sub_2529C988C((uint64_t)v111);

  return shouldHarmonize;
}

- (NSString)networkPath
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (unsigned)supportsAlpha
{
  return self->_supportsAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkPath, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_gatingOutName, 0);
  objc_storeStrong((id *)&self->_outName, 0);
  objc_storeStrong((id *)&self->_bgName, 0);
  objc_storeStrong((id *)&self->_fgName, 0);
  self->_bgInput._vptr$Tensor = (void **)&unk_2702DD568;
  cntrl = self->_bgInput.storage_.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    begin = self->_bgInput.shape_.sizes_.__begin_;
    if (!begin) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  begin = self->_bgInput.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_4:
    self->_bgInput.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
LABEL_5:
  self->_fgInput._vptr$Tensor = (void **)&unk_2702DD568;
  v5 = self->_fgInput.storage_.__cntrl_;
  if (!v5 || atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v6 = self->_fgInput.shape_.sizes_.__begin_;
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  (*(void (**)(__shared_weak_count *))(*(void *)v5 + 16))(v5);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  uint64_t v6 = self->_fgInput.shape_.sizes_.__begin_;
  if (v6)
  {
LABEL_8:
    self->_fgInput.shape_.sizes_.__end_ = v6;
    operator delete(v6);
  }
LABEL_9:
  value = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)value + 8);
    v8();
  }
}

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 4;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = &unk_2702DD690;
  *((_DWORD *)self + 20) = 4;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((void *)self + 15) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = &unk_2702DD690;
  return self;
}

@end