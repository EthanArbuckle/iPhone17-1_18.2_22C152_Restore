@interface ARPlaneWorld
+ (map<std::array<unsigned)findMergedPlanes:(std:()16>> :(std:()16>> :(std:()16> :(std:(16>>>>> *__return_ptr)retstr :(map<std:()16> :(std:()16>> :(std:()16>> :(std:()16> :(std:(16>>>>> *)result :(SEL)a3 set<std:(const void *)a4 :(const void *)a5 array<unsigned)char allocator<std::pair<const std::array<unsigned)char less<std::array<unsigned)char set<std::array<unsigned)char array<unsigned)char set<std::array<unsigned)char allocator<std::pair<const std::array<unsigned)char less<std::array<unsigned)char set<std::array<unsigned)char :;
- (ARPlaneWorld)init;
- (ARPlaneWorld)initWithTextureSize:(unint64_t)a3;
- (BOOL)isBusy;
- (id).cxx_construct;
- (id)_fullDescription;
- (map<std::array<unsigned)updatePlanes:()ARTexturedPlane withCurrentDetections:(std:()16>> :(std:()16> :(ARTexturedPlane>>> *__return_ptr)retstr allocator<std:(ARPlaneWorld *)self :(SEL)a3 pair<const std:(const void *)a4 :(const void *)a5 array<unsigned)char less<std:(BOOL)a6 :array<unsigned)char synchronous:;
- (vector<ARTexturedPlane,)planes;
- (void)updatePlanes:(simd_float4)a3 withCameraImage:(simd_float4)a4 exposureOffset:(float32x4_t)a5 transform:(simd_float4)a6 intrinsics:(float32x4_t)a7 synchronous:(float32x4_t)a8;
@end

@implementation ARPlaneWorld

- (ARPlaneWorld)init
{
  return [(ARPlaneWorld *)self initWithTextureSize:0];
}

- (ARPlaneWorld)initWithTextureSize:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ARPlaneWorld;
  v4 = [(ARPlaneWorld *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    gpuWarper = v4->_gpuWarper;
    v4->_gpuWarper = (ARGPUWarper *)v5;

    v4->_textureSize = a3;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(1);
    semaphore = v4->_semaphore;
    v4->_semaphore = (OS_dispatch_semaphore *)v7;
  }
  return v4;
}

- (BOOL)isBusy
{
  intptr_t v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0);
  if (!v3) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  }
  return v3 != 0;
}

+ (map<std::array<unsigned)findMergedPlanes:(std:()16>> :(std:()16>> :(std:()16> :(std:(16>>>>> *__return_ptr)retstr :(map<std:()16> :(std:()16>> :(std:()16>> :(std:()16> :(std:(16>>>>> *)result :(SEL)a3 set<std:(const void *)a4 :(const void *)a5 array<unsigned)char allocator<std::pair<const std::array<unsigned)char less<std::array<unsigned)char set<std::array<unsigned)char array<unsigned)char set<std::array<unsigned)char allocator<std::pair<const std::array<unsigned)char less<std::array<unsigned)char set<std::array<unsigned)char :
{
  retstr->var0.var2.var0 = 0;
  retstr->var0.var1.var0.__left_ = 0;
  retstr->var0.var0 = &retstr->var0.var1;
  v6 = (char *)a4 + 8;
  dispatch_semaphore_t v7 = *(char **)a4;
  if (*(const void **)a4 != (char *)a4 + 8)
  {
    do
    {
      keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)a5, (uint64_t)v13);
      intersect<std::array<unsigned char,16ul>>(v13, (uint64_t)(v7 + 240), (uint64_t)&v14);
      std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v13, (void *)v13[1]);
      v13[0] = v7 + 48;
      v9 = (char *)std::__tree<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul> const&>,std::tuple<>>((uint64_t **)retstr, (uint64_t)(v7 + 48), (uint64_t)&std::piecewise_construct, v13);
      std::set<std::array<unsigned char,16ul>>::insert[abi:ne180100]<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v9 + 48, v14, &v15);
      std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v14, v15);
      objc_super v10 = (char *)*((void *)v7 + 1);
      if (v10)
      {
        do
        {
          v11 = v10;
          objc_super v10 = *(char **)v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (char *)*((void *)v7 + 2);
          BOOL v12 = *(void *)v11 == (void)v7;
          dispatch_semaphore_t v7 = v11;
        }
        while (!v12);
      }
      dispatch_semaphore_t v7 = v11;
    }
    while (v11 != v6);
  }
  return result;
}

- (map<std::array<unsigned)updatePlanes:()ARTexturedPlane withCurrentDetections:(std:()16>> :(std:()16> :(ARTexturedPlane>>> *__return_ptr)retstr allocator<std:(ARPlaneWorld *)self :(SEL)a3 pair<const std:(const void *)a4 :(const void *)a5 array<unsigned)char less<std:(BOOL)a6 :array<unsigned)char synchronous:
{
  BOOL v114 = a6;
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)a4, (uint64_t)v123);
  keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)a5, (uint64_t)v122);
  notInLeftButRight<std::array<unsigned char,16ul>>((char *)v123, v122, (uint64_t)&v120);
  intersect<std::array<unsigned char,16ul>>(v123, (uint64_t)v122, (uint64_t)&v118);
  +[ARPlaneWorld findMergedPlanes:a5 :a4];
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  dispatch_semaphore_t v7 = v120;
  unint64_t textureSize = (unint64_t)fminf(sqrtf(16777000.0 / (float)((unint64_t)v121[1] + *((void *)a4 + 2))), 1024.0);
  if (self->_textureSize) {
    unint64_t textureSize = self->_textureSize;
  }
  uint64_t v109 = textureSize;
  if (v120 != v121)
  {
    do
    {
      uint64_t v9 = std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::at((uint64_t)a5, (uint64_t)v7 + 25);
      v137.i64[0] = (uint64_t)v7 + 25;
      objc_super v10 = (uint64_t **)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>((uint64_t **)retstr, (uint64_t)v7 + 25, (uint64_t)&std::piecewise_construct, (long long **)&v137);
      v11 = v10;
      long long v12 = *(_OWORD *)v9;
      long long v13 = *(_OWORD *)(v9 + 16);
      long long v14 = *(_OWORD *)(v9 + 48);
      *((_OWORD *)v10 + 5) = *(_OWORD *)(v9 + 32);
      *((_OWORD *)v10 + 6) = v14;
      *((_OWORD *)v10 + 3) = v12;
      *((_OWORD *)v10 + 4) = v13;
      long long v15 = *(_OWORD *)(v9 + 64);
      long long v16 = *(_OWORD *)(v9 + 80);
      long long v17 = *(_OWORD *)(v9 + 112);
      *((_OWORD *)v10 + 9) = *(_OWORD *)(v9 + 96);
      *((_OWORD *)v10 + 10) = v17;
      *((_OWORD *)v10 + 7) = v15;
      *((_OWORD *)v10 + 8) = v16;
      long long v18 = *(_OWORD *)(v9 + 128);
      long long v19 = *(_OWORD *)(v9 + 144);
      long long v20 = *(_OWORD *)(v9 + 176);
      *((_OWORD *)v10 + 13) = *(_OWORD *)(v9 + 160);
      *((_OWORD *)v10 + 14) = v20;
      *((_OWORD *)v10 + 11) = v18;
      *((_OWORD *)v10 + 12) = v19;
      if (v10 + 6 != (uint64_t **)v9) {
        std::__tree<std::array<unsigned char,16ul>>::__assign_multi<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v10 + 30, *(void **)(v9 + 192), (void *)(v9 + 200));
      }
      objc_storeStrong((id *)v11 + 33, *(id *)(v9 + 216));
      uint64_t v21 = ARCreateTexture(v109);
      v137.i64[0] = (uint64_t)v7 + 25;
      v22 = std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>((uint64_t **)retstr, (uint64_t)v7 + 25, (uint64_t)&std::piecewise_construct, (long long **)&v137);
      v23 = (void *)*((void *)v22 + 33);
      *((void *)v22 + 33) = v21;

      v24 = v7[1];
      if (v24)
      {
        do
        {
          v25 = (void **)v24;
          v24 = (void *)*v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          v25 = (void **)v7[2];
          BOOL v26 = *v25 == v7;
          dispatch_semaphore_t v7 = v25;
        }
        while (!v26);
      }
      dispatch_semaphore_t v7 = v25;
    }
    while (v25 != v121);
  }
  v27 = v118;
  if (v118 != v119)
  {
    do
    {
      uint64_t v28 = std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::at((uint64_t)a5, (uint64_t)v27 + 25);
      uint64_t v29 = std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::at((uint64_t)a4, (uint64_t)v27 + 25);
      simd_float4x4 v153 = __invert_f4(*(simd_float4x4 *)(v29 + 32));
      uint64_t v31 = 0;
      long long v32 = *(_OWORD *)(v28 + 48);
      long long v33 = *(_OWORD *)(v28 + 64);
      long long v34 = *(_OWORD *)(v28 + 80);
      v124[0] = *(_OWORD *)(v28 + 32);
      v124[1] = v32;
      v124[2] = v33;
      v124[3] = v34;
      do
      {
        *(float32x4_t *)((char *)&v137 + v31 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v153.columns[0], COERCE_FLOAT(v124[v31])), (float32x4_t)v153.columns[1], *(float32x2_t *)&v124[v31], 1), (float32x4_t)v153.columns[2], (float32x4_t)v124[v31], 2), (float32x4_t)v153.columns[3], (float32x4_t)v124[v31], 3);
        ++v31;
      }
      while (v31 != 4);
      float32x4_t v111 = v140;
      *(double *)v35.i64 = ARMatrix3x3FromMatrix4x4(v30);
      float32x4_t v38 = vabsq_f32(v111);
      if (v38.f32[0] <= 0.01
        && v38.f32[1] <= 0.01
        && (float v112 = v38.f32[2],
            float v39 = acosf(COERCE_FLOAT(vmlaq_f32(vaddq_f32(v36, vmulq_f32(v35, (float32x4_t)0)), (float32x4_t)0, v37).i32[1])),
            v112 <= 0.01)
        && v39 >= 0.0
        && v39 <= 0.0
        && (uint32x4_t v40 = (uint32x4_t)vceqq_f32(*(float32x4_t *)(v29 + 96), *(float32x4_t *)(v28 + 96)),
            v40.i32[3] = v40.i32[2],
            (vminvq_u32(v40) & 0x80000000) != 0)
        && (uint32x4_t v41 = (uint32x4_t)vceqq_f32(*(float32x4_t *)(v29 + 112), *(float32x4_t *)(v28 + 112)),
            v41.i32[3] = v41.i32[2],
            (vminvq_u32(v41) & 0x80000000) != 0))
      {
        float32x4_t v91 = *(float32x4_t *)v29;
        float32x4_t v92 = *(float32x4_t *)(v29 + 16);
        float32x4_t v93 = *(float32x4_t *)(v29 + 48);
        float32x4_t v139 = *(float32x4_t *)(v29 + 32);
        float32x4_t v140 = v93;
        float32x4_t v137 = v91;
        float32x4_t v138 = v92;
        float32x4_t v94 = *(float32x4_t *)(v29 + 64);
        float32x4_t v95 = *(float32x4_t *)(v29 + 80);
        float32x4_t v96 = *(float32x4_t *)(v29 + 96);
        float32x4_t v144 = *(float32x4_t *)(v29 + 112);
        float32x4_t v143 = v96;
        float32x4_t v142 = v95;
        float32x4_t v141 = v94;
        float32x4_t v97 = *(float32x4_t *)(v29 + 128);
        float32x4_t v98 = *(float32x4_t *)(v29 + 144);
        float32x4_t v99 = *(float32x4_t *)(v29 + 160);
        float32x4_t v148 = *(float32x4_t *)(v29 + 176);
        float32x4_t v147 = v99;
        float32x4_t v146 = v98;
        float32x4_t v145 = v97;
        std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)&v149, v29 + 192);
        id obj = *(id *)(v29 + 216);
        ++v138.i64[0];
        *(void *)&v124[0] = (char *)v27 + 25;
        v100 = (uint64_t **)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>((uint64_t **)retstr, (uint64_t)v27 + 25, (uint64_t)&std::piecewise_construct, (long long **)v124);
        v81 = v100;
        float32x4_t v101 = v148;
        float32x4_t v102 = v146;
        *((float32x4_t *)v100 + 11) = v145;
        *((float32x4_t *)v100 + 12) = v102;
        *((float32x4_t *)v100 + 13) = v147;
        *((float32x4_t *)v100 + 14) = v101;
        float32x4_t v103 = v144;
        float32x4_t v104 = v142;
        *((float32x4_t *)v100 + 7) = v141;
        *((float32x4_t *)v100 + 8) = v104;
        *((float32x4_t *)v100 + 9) = v143;
        *((float32x4_t *)v100 + 10) = v103;
        float32x4_t v105 = v138;
        float32x4_t v107 = v139;
        float32x4_t v106 = v140;
        *((float32x4_t *)v100 + 3) = v137;
        *((float32x4_t *)v100 + 4) = v105;
        *((float32x4_t *)v100 + 5) = v107;
        *((float32x4_t *)v100 + 6) = v106;
        if (v100 + 6 != (uint64_t **)&v137) {
          std::__tree<std::array<unsigned char,16ul>>::__assign_multi<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v100 + 30, v149, v150);
        }
      }
      else
      {
        float32x4_t v42 = *(float32x4_t *)v28;
        float32x4_t v43 = *(float32x4_t *)(v28 + 16);
        float32x4_t v44 = *(float32x4_t *)(v28 + 48);
        float32x4_t v139 = *(float32x4_t *)(v28 + 32);
        float32x4_t v140 = v44;
        float32x4_t v137 = v42;
        float32x4_t v138 = v43;
        float32x4_t v45 = *(float32x4_t *)(v28 + 64);
        float32x4_t v46 = *(float32x4_t *)(v28 + 80);
        float32x4_t v47 = *(float32x4_t *)(v28 + 96);
        float32x4_t v144 = *(float32x4_t *)(v28 + 112);
        float32x4_t v143 = v47;
        float32x4_t v142 = v46;
        float32x4_t v141 = v45;
        float32x4_t v48 = *(float32x4_t *)(v28 + 128);
        float32x4_t v49 = *(float32x4_t *)(v28 + 144);
        float32x4_t v50 = *(float32x4_t *)(v28 + 160);
        float32x4_t v148 = *(float32x4_t *)(v28 + 176);
        float32x4_t v147 = v50;
        float32x4_t v146 = v49;
        float32x4_t v145 = v48;
        std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)&v149, v28 + 192);
        id obj = *(id *)(v28 + 216);
        v51 = ARCreateTexture(v109);
        id v52 = obj;
        id obj = v51;

        kdebug_trace();
        gpuWarper = self->_gpuWarper;
        long long v54 = *(_OWORD *)(v29 + 48);
        float32x4_t v56 = *(float32x4_t *)v29;
        long long v55 = *(_OWORD *)(v29 + 16);
        v134[2] = *(_OWORD *)(v29 + 32);
        v134[3] = v54;
        v134[0] = v56;
        v134[1] = v55;
        long long v57 = *(_OWORD *)(v29 + 112);
        long long v59 = *(_OWORD *)(v29 + 64);
        long long v58 = *(_OWORD *)(v29 + 80);
        v134[6] = *(_OWORD *)(v29 + 96);
        v134[7] = v57;
        v134[4] = v59;
        v134[5] = v58;
        long long v60 = *(_OWORD *)(v29 + 176);
        long long v62 = *(_OWORD *)(v29 + 128);
        long long v61 = *(_OWORD *)(v29 + 144);
        v134[10] = *(_OWORD *)(v29 + 160);
        v134[11] = v60;
        v134[8] = v62;
        v134[9] = v61;
        std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v135, v29 + 192);
        id v136 = *(id *)(v29 + 216);
        v131[8] = v145;
        v131[9] = v146;
        v131[10] = v147;
        v131[11] = v148;
        v131[4] = v141;
        v131[5] = v142;
        v131[6] = v143;
        v131[7] = v144;
        v131[0] = v137;
        v131[1] = v138;
        v131[2] = v139;
        v131[3] = v140;
        std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v132, (uint64_t)&v149);
        id v133 = obj;
        [(ARGPUWarper *)gpuWarper warpPlane:v134 toPlane:v131 withLoadAction:2 synchronous:v114];

        std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v132, v132[1]);
        std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v135, v135[1]);
        kdebug_trace();
        uint64_t v63 = (uint64_t)v27 + 25;
        v64 = a4;
        if (&v117 != std::__tree<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>>>::find<std::array<unsigned char,16ul>>((uint64_t)v116, (uint64_t)v27 + 25))
        {
          uint64_t v65 = std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::at((uint64_t)v116, v63);
          std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v124, v65);
          v66 = *(_OWORD **)&v124[0];
          if (*(_OWORD **)&v124[0] != (_OWORD *)((char *)v124 + 8))
          {
            do
            {
              uint64_t v67 = std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::at((uint64_t)v64, (uint64_t)v66 + 25);
              v68 = self->_gpuWarper;
              long long v69 = *(_OWORD *)(v67 + 48);
              long long v71 = *(_OWORD *)v67;
              long long v70 = *(_OWORD *)(v67 + 16);
              v128[2] = *(_OWORD *)(v67 + 32);
              v128[3] = v69;
              v128[0] = v71;
              v128[1] = v70;
              long long v72 = *(_OWORD *)(v67 + 112);
              long long v74 = *(_OWORD *)(v67 + 64);
              long long v73 = *(_OWORD *)(v67 + 80);
              v128[6] = *(_OWORD *)(v67 + 96);
              v128[7] = v72;
              v128[4] = v74;
              v128[5] = v73;
              long long v75 = *(_OWORD *)(v67 + 176);
              long long v77 = *(_OWORD *)(v67 + 128);
              long long v76 = *(_OWORD *)(v67 + 144);
              v128[10] = *(_OWORD *)(v67 + 160);
              v128[11] = v75;
              v128[8] = v77;
              v128[9] = v76;
              std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v129, v67 + 192);
              id v130 = *(id *)(v67 + 216);
              v125[8] = v145;
              v125[9] = v146;
              v125[10] = v147;
              v125[11] = v148;
              v125[4] = v141;
              v125[5] = v142;
              v125[6] = v143;
              v125[7] = v144;
              v125[0] = v137;
              v125[1] = v138;
              v125[2] = v139;
              v125[3] = v140;
              std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v126, (uint64_t)&v149);
              id v127 = obj;
              [(ARGPUWarper *)v68 warpPlane:v128 toPlane:v125 withLoadAction:1 synchronous:v114];

              v64 = a4;
              std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v126, v126[1]);

              std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v129, v129[1]);
              v78 = (void *)*((void *)v66 + 1);
              if (v78)
              {
                do
                {
                  v79 = v78;
                  v78 = (void *)*v78;
                }
                while (v78);
              }
              else
              {
                do
                {
                  v79 = (_OWORD *)*((void *)v66 + 2);
                  BOOL v26 = *(void *)v79 == (void)v66;
                  v66 = v79;
                }
                while (!v26);
              }
              v66 = v79;
            }
            while (v79 != (_OWORD *)((char *)v124 + 8));
          }
          std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v124, *((void **)&v124[0] + 1));
          uint64_t v63 = (uint64_t)v27 + 25;
        }
        *(void *)&v124[0] = v63;
        v80 = (uint64_t **)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>((uint64_t **)retstr, v63, (uint64_t)&std::piecewise_construct, (long long **)v124);
        v81 = v80;
        float32x4_t v82 = v148;
        float32x4_t v83 = v146;
        *((float32x4_t *)v80 + 11) = v145;
        *((float32x4_t *)v80 + 12) = v83;
        *((float32x4_t *)v80 + 13) = v147;
        *((float32x4_t *)v80 + 14) = v82;
        float32x4_t v84 = v144;
        float32x4_t v85 = v142;
        *((float32x4_t *)v80 + 7) = v141;
        *((float32x4_t *)v80 + 8) = v85;
        *((float32x4_t *)v80 + 9) = v143;
        *((float32x4_t *)v80 + 10) = v84;
        float32x4_t v86 = v138;
        float32x4_t v88 = v139;
        float32x4_t v87 = v140;
        *((float32x4_t *)v80 + 3) = v137;
        *((float32x4_t *)v80 + 4) = v86;
        *((float32x4_t *)v80 + 5) = v88;
        *((float32x4_t *)v80 + 6) = v87;
        if (v80 + 6 != (uint64_t **)&v137) {
          std::__tree<std::array<unsigned char,16ul>>::__assign_multi<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v80 + 30, v149, v150);
        }
      }
      objc_storeStrong((id *)v81 + 33, obj);

      std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v149, v150[0]);
      v89 = v27[1];
      if (v89)
      {
        do
        {
          v90 = (void **)v89;
          v89 = (void *)*v89;
        }
        while (v89);
      }
      else
      {
        do
        {
          v90 = (void **)v27[2];
          BOOL v26 = *v90 == v27;
          v27 = v90;
        }
        while (!v26);
      }
      v27 = v90;
    }
    while (v90 != v119);
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>>>::destroy((uint64_t)v116, v117);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v118, v119[0]);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v120, v121[0]);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v122, (void *)v122[1]);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v123, (void *)v123[1]);
  return result;
}

- (void)updatePlanes:(simd_float4)a3 withCameraImage:(simd_float4)a4 exposureOffset:(float32x4_t)a5 transform:(simd_float4)a6 intrinsics:(float32x4_t)a7 synchronous:(float32x4_t)a8
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  long long v16 = (dispatch_semaphore_t *)(a1 + 112);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 112), 0xFFFFFFFFFFFFFFFFLL);
  std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::map[abi:ne180100](v91, (uint64_t)(v16 - 13));
  dispatch_semaphore_signal(*v16);
  [(id)a1 updatePlanes:v91 withCurrentDetections:a11 synchronous:a13];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 112), 0xFFFFFFFFFFFFFFFFLL);
  if (v16 - 13 != (dispatch_semaphore_t *)&v89) {
    std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__tree_node<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,void *> *,long>>((uint64_t **)v16 - 13, v89, &v90);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 112));
  keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)v91, (uint64_t)v87);
  keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)&v89, (uint64_t)v86);
  notInLeftButRight<std::array<unsigned char,16ul>>(v87, v86, (uint64_t)v84);
  std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::map[abi:ne180100]((uint64_t *)&v82, (uint64_t)&v89);
  v96.i64[0] = 0;
  v95.i64[1] = 0;
  v95.i64[0] = (uint64_t)&v95.i64[1];
  long long v17 = (float32x4_t *)v82.i64[0];
  if ((unsigned __int32 *)v82.i64[0] != &v82.u32[2])
  {
    float32x4_t v80 = vnegq_f32(a5);
    do
    {
      int8x16_t v18 = (int8x16_t)vmulq_f32(v17[6], v80);
      if (acosf(vaddv_f32(vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)))) > 2.04203522) {
        std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::pair<std::array<unsigned char,16ul> const,ARTexturedPlane> const&>((uint64_t **)&v95, (uint64_t)&v17[2], (uint64_t)&v17[2]);
      }
      long long v19 = (float32x4_t *)v17->i64[1];
      if (v19)
      {
        do
        {
          long long v20 = v19;
          long long v19 = (float32x4_t *)v19->i64[0];
        }
        while (v19);
      }
      else
      {
        do
        {
          long long v20 = (float32x4_t *)v17[1].i64[0];
          BOOL v21 = v20->i64[0] == (void)v17;
          long long v17 = v20;
        }
        while (!v21);
      }
      long long v17 = v20;
    }
    while (v20 != (float32x4_t *)&v82.u32[2]);
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v82, (void *)v82.i64[1]);
  v22 = (void *)v95.i64[1];
  float32x4_t v82 = v95;
  uint64_t v83 = v96.i64[0];
  if (v96.i64[0])
  {
    *(void *)(v95.i64[1] + 16) = &v82.i64[1];
    v95.i64[0] = (uint64_t)&v95.i64[1];
    v95.i64[1] = 0;
    v96.i64[0] = 0;
    v22 = 0;
  }
  else
  {
    v82.i64[0] = (uint64_t)&v82.i64[1];
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v95, v22);
  v112.columns[0] = a3;
  v112.columns[1] = a4;
  v112.columns[2] = (simd_float4)a5;
  v112.columns[3] = a6;
  simd_float4x4 v113 = __invert_f4(v112);
  float32x4_t v79 = (float32x4_t)v113.columns[1];
  float32x4_t v81 = (float32x4_t)v113.columns[0];
  float32x4_t v77 = (float32x4_t)v113.columns[3];
  float32x4_t v78 = (float32x4_t)v113.columns[2];
  size_t Width = CVPixelBufferGetWidth(a12);
  size_t Height = CVPixelBufferGetHeight(a12);
  v96.i64[0] = 0;
  v95.i64[1] = 0;
  v95.i64[0] = (uint64_t)&v95.i64[1];
  v25 = (uint64_t **)v82.i64[0];
  if ((unsigned __int32 *)v82.i64[0] != &v82.u32[2])
  {
    float v26 = (float)Height;
    do
    {
      int v27 = 100;
      while (1)
      {
        *(double *)v28.i64 = randomPlanePointInWorldCoordinates((const ARTexturedPlane *)(v25 + 6));
        float32x4_t v110 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, v28.f32[0]), v79, *(float32x2_t *)v28.f32, 1), v78, v28, 2), v77, v28, 3);
        *(float32x2_t *)v29.f32 = dehomogenize((float32x2_t *)&v110, *(double *)v28.i64, *(int32x2_t *)v110.f32);
        if (v29.f32[2] < 0.0)
        {
          float32x4_t v110 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a7, v29.f32[0]), a8, *(float32x2_t *)v29.f32, 1), a9, v29, 2);
          float32x2_t v30 = dehomogenize((uint64_t)&v110);
          if (v30.f32[0] >= 0.0 && v30.f32[0] < (float)Width && v30.f32[1] >= 0.0 && v30.f32[1] < v26) {
            break;
          }
        }
        if (!--v27) {
          goto LABEL_34;
        }
      }
      v110.i64[0] = (uint64_t)(v25 + 4);
      long long v33 = (uint64_t **)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>((uint64_t **)&v95, (uint64_t)(v25 + 4), (uint64_t)&std::piecewise_construct, (long long **)&v110);
      long long v34 = v33;
      long long v35 = *((_OWORD *)v25 + 3);
      long long v36 = *((_OWORD *)v25 + 4);
      long long v37 = *((_OWORD *)v25 + 6);
      *((_OWORD *)v33 + 5) = *((_OWORD *)v25 + 5);
      *((_OWORD *)v33 + 6) = v37;
      *((_OWORD *)v33 + 3) = v35;
      *((_OWORD *)v33 + 4) = v36;
      long long v38 = *((_OWORD *)v25 + 7);
      long long v39 = *((_OWORD *)v25 + 8);
      long long v40 = *((_OWORD *)v25 + 10);
      *((_OWORD *)v33 + 9) = *((_OWORD *)v25 + 9);
      *((_OWORD *)v33 + 10) = v40;
      *((_OWORD *)v33 + 7) = v38;
      *((_OWORD *)v33 + 8) = v39;
      long long v41 = *((_OWORD *)v25 + 11);
      long long v42 = *((_OWORD *)v25 + 12);
      long long v43 = *((_OWORD *)v25 + 14);
      *((_OWORD *)v33 + 13) = *((_OWORD *)v25 + 13);
      *((_OWORD *)v33 + 14) = v43;
      *((_OWORD *)v33 + 11) = v41;
      *((_OWORD *)v33 + 12) = v42;
      if (v25 != v33) {
        std::__tree<std::array<unsigned char,16ul>>::__assign_multi<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v33 + 30, v25[30], v25 + 31);
      }
      objc_storeStrong((id *)v34 + 33, v25[33]);
LABEL_34:
      float32x4_t v44 = v25[1];
      if (v44)
      {
        do
        {
          float32x4_t v45 = (uint64_t **)v44;
          float32x4_t v44 = (uint64_t *)*v44;
        }
        while (v44);
      }
      else
      {
        do
        {
          float32x4_t v45 = (uint64_t **)v25[2];
          BOOL v21 = *v45 == (uint64_t *)v25;
          v25 = v45;
        }
        while (!v21);
      }
      v25 = v45;
    }
    while (v45 != (uint64_t **)&v82.u32[2]);
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v82, (void *)v82.i64[1]);
  float32x4_t v46 = (void *)v95.i64[1];
  float32x4_t v82 = v95;
  uint64_t v83 = v96.i64[0];
  if (v96.i64[0])
  {
    *(void *)(v95.i64[1] + 16) = &v82.i64[1];
    v95.i64[0] = (uint64_t)&v95.i64[1];
    v95.i64[1] = 0;
    v96.i64[0] = 0;
    float32x4_t v46 = 0;
  }
  else
  {
    v82.i64[0] = (uint64_t)&v82.i64[1];
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v95, v46);
  float32x4_t v47 = (unsigned __int32 *)v82.i64[0];
  if ((unsigned __int32 *)v82.i64[0] != &v82.u32[2])
  {
    do
    {
      ARPlaneUpdateQueue::insert((void *)(a1 + 40), *((void *)v47 + 4), *((void *)v47 + 5), (id *)v47 + 6);
      float32x4_t v48 = (unsigned __int32 *)*((void *)v47 + 1);
      if (v48)
      {
        do
        {
          float32x4_t v49 = v48;
          float32x4_t v48 = *(unsigned __int32 **)v48;
        }
        while (v48);
      }
      else
      {
        do
        {
          float32x4_t v49 = (unsigned __int32 *)*((void *)v47 + 2);
          BOOL v21 = *(void *)v49 == (void)v47;
          float32x4_t v47 = v49;
        }
        while (!v21);
      }
      float32x4_t v47 = v49;
    }
    while (v49 != &v82.u32[2]);
  }
  if (*(void *)(a1 + 80))
  {
    int v50 = -3;
    do
    {
      if (__CFADD__(v50++, 1)) {
        break;
      }
      unint64_t v52 = *(void *)(a1 + 72);
      uint64_t v53 = *(void *)(*(void *)(a1 + 48) + 8 * (v52 / 0x11));
      unint64_t v54 = v52 % 0x11;
      long long v55 = (float32x4_t *)(v53 + 240 * (v52 % 0x11));
      float32x4_t v95 = *v55;
      float32x4_t v57 = v55[3];
      float32x4_t v56 = v55[4];
      float32x4_t v58 = v55[2];
      float32x4_t v96 = v55[1];
      float32x4_t v97 = v58;
      float32x4_t v98 = v57;
      float32x4_t v99 = v56;
      float32x4_t v59 = v55[8];
      float32x4_t v61 = v55[5];
      float32x4_t v60 = v55[6];
      float32x4_t v102 = v55[7];
      float32x4_t v103 = v59;
      float32x4_t v100 = v61;
      float32x4_t v101 = v60;
      float32x4_t v62 = v55[12];
      float32x4_t v64 = v55[9];
      float32x4_t v63 = v55[10];
      float32x4_t v106 = v55[11];
      float32x4_t v107 = v62;
      float32x4_t v104 = v64;
      float32x4_t v105 = v63;
      std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v108, (uint64_t)&v55[13]);
      id v109 = *(id *)(v53 + 240 * v54 + 232);
      float32x4_t v110 = v95;
      std::__tree<std::array<unsigned char,16ul>>::__erase_unique<std::array<unsigned char,16ul>>((uint64_t **)(a1 + 88), *(void *)(*(void *)(a1 + 48) + 8 * (*(void *)(a1 + 72) / 0x11uLL))+ 240 * (*(void *)(a1 + 72) % 0x11uLL));
      std::deque<std::pair<std::array<unsigned char,16ul>,ARTexturedPlane>>::pop_front((int64x2_t *)(a1 + 40));
      uint64_t v65 = &v85 == std::__tree<std::array<unsigned char,16ul>>::find<std::array<unsigned char,16ul>>((uint64_t)v84, (uint64_t)&v110)? 1: 2;
      kdebug_trace();
      v66 = *(void **)(a1 + 32);
      v92[8] = v104;
      v92[9] = v105;
      v92[10] = v106;
      v92[11] = v107;
      v92[4] = v100;
      v92[5] = v101;
      v92[6] = v102;
      v92[7] = v103;
      v92[0] = v96;
      v92[1] = v97;
      v92[2] = v98;
      v92[3] = v99;
      std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v93, (uint64_t)v108);
      id v94 = v109;
      *(float *)&double v67 = a2;
      objc_msgSend(v66, "warpCameraImage:withExposureOffset:withCameraIntrinsics:withCameraTransform:toPlane:withLoadAction:synchronous:", a12, v92, v65, a13, v67, *(double *)a7.i64, *(double *)a8.i64, *(double *)a9.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64, *(double *)a6.i64);

      std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v93, v93[1]);
      kdebug_trace();

      std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v108, v108[1]);
    }
    while (*(void *)(a1 + 80));
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v82, (void *)v82.i64[1]);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v84, v85);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v86, (void *)v86[1]);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v87, v88);
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v89, v90);
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)v91, (void *)v91[1]);
}

- (vector<ARTexturedPlane,)planes
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  begin_node = (ARPlaneWorld *)self->_planes.__tree_.__begin_node_;
  if (begin_node != (ARPlaneWorld *)&self->_planes.__tree_.__pair1_)
  {
    v6 = 0;
    do
    {
      p_begin = (id *)&begin_node->_queue.queue.c.__map_.__begin_;
      if (v6 >= retstr->__end_cap_.__value_)
      {
        v6 = (ARTexturedPlane *)std::vector<ARTexturedPlane>::__push_back_slow_path<ARTexturedPlane const&>((uint64_t *)retstr, p_begin);
      }
      else
      {
        std::vector<ARTexturedPlane>::__construct_one_at_end[abi:ne180100]<ARTexturedPlane const&>((uint64_t)retstr, p_begin);
        v6 += 4;
      }
      retstr->__end_ = v6;
      isa = (ARPlaneWorld *)begin_node->_planes.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (ARPlaneWorld *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (ARPlaneWorld *)begin_node->_planes.__tree_.__pair1_.__value_.__left_;
          BOOL v10 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v10);
      }
      begin_node = left;
    }
    while (left != (ARPlaneWorld *)&self->_planes.__tree_.__pair1_);
  }
  semaphore = self->_semaphore;
  return (vector<ARTexturedPlane, std::allocator<ARTexturedPlane>> *)dispatch_semaphore_signal(semaphore);
}

- (id)_fullDescription
{
  intptr_t v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(ARPlaneWorld *)self description];
  uint64_t v5 = [v3 stringWithFormat:@"%@\n", v4];

  BOOL v6 = [(ARPlaneWorld *)self isBusy];
  dispatch_semaphore_t v7 = @"NotBusy";
  if (v6) {
    dispatch_semaphore_t v7 = @"Busy";
  }
  [v5 appendFormat:@"State: %@\n", v7];
  objc_msgSend(v5, "appendFormat:", @"Queue Size: %d\n", self->_queue.queue.c.__size_.__value_);
  [v5 appendFormat:@"GPU Warper: %@\n", self->_gpuWarper];
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&self->_queue.elements, (void *)self->_queue.elements.__tree_.__pair1_.__value_.__left_);
  std::deque<std::pair<std::array<unsigned char,16ul>,ARTexturedPlane>>::~deque[abi:ne180100](&self->_queue.queue.c.__map_.__first_);
  objc_storeStrong((id *)&self->_gpuWarper, 0);
  left = self->_planes.__tree_.__pair1_.__value_.__left_;
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&self->_planes, left);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((void *)self + 13) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 11) = (char *)self + 96;
  return self;
}

@end