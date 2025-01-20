@interface ARSpatialMappingPointCloud
+ (id)dictionaryFromArray:(id)a3;
- (NSUUID)identifier;
- (char)semantics;
- (double)cameraPose;
- (double)timestamp;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithPointCloud:(__n128)a3 transform:(__n128)a4 identifier:(__n128)a5 timestamp:(double)a6;
- (int64_t)count;
- (uint64_t)colors;
- (uint64_t)normals;
- (uint64_t)points;
- (uint64_t)pointsToWorld;
- (uint64_t)semanticLabels;
- (uint64_t)semanticVotes;
- (uint64_t)updateTransform:(void *)a1;
- (unint64_t)semanticsBinSize;
- (void)setCameraPose:(__n128)a3;
@end

@implementation ARSpatialMappingPointCloud

- (id)initWithPointCloud:(__n128)a3 transform:(__n128)a4 identifier:(__n128)a5 timestamp:(double)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a9;
  v42.receiver = a1;
  v42.super_class = (Class)ARSpatialMappingPointCloud;
  id v13 = [(ARSpatialMappingPointCloud *)&v42 init];
  if (!v13)
  {
LABEL_6:
    id v18 = 0;
    goto LABEL_7;
  }
  *((void *)v13 + 22) = CV3DReconPointCloudGetPointsCount();
  uint64_t v14 = *MEMORY[0x1E4F94860];
  if (*MEMORY[0x1E4F94860] != 4)
  {
    v15 = _ARLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543874;
      v44 = v17;
      __int16 v45 = 2048;
      id v46 = v13;
      __int16 v47 = 2048;
      uint64_t v48 = v14;
      _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Compressed semantics bin size must be 4, found %lu", buf, 0x20u);
    }
    goto LABEL_6;
  }
  uint64_t PointsRawPtr = CV3DReconPointCloudGetPointsRawPtr();
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v13 + 8, *((void *)v13 + 22));
  if (*((void *)v13 + 22))
  {
    unint64_t v22 = 0;
    v23 = (_DWORD *)(PointsRawPtr + 8);
    do
    {
      *(void *)&long long v21 = *((void *)v23 - 1);
      DWORD2(v21) = *v23;
      *(_OWORD *)(*((void *)v13 + 1) + 16 * v22++) = v21;
      v23 += 3;
    }
    while (v22 < *((void *)v13 + 22));
  }
  uint64_t ColorRawPtr = CV3DReconPointCloudGetColorRawPtr();
  if (ColorRawPtr)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v13 + 56, *((void *)v13 + 22));
    if (*((void *)v13 + 22))
    {
      unint64_t v26 = 0;
      v27 = (_DWORD *)(ColorRawPtr + 8);
      do
      {
        *(void *)&long long v25 = *((void *)v27 - 1);
        DWORD2(v25) = *v27;
        *(_OWORD *)(*((void *)v13 + 7) + 16 * v26++) = v25;
        v27 += 3;
      }
      while (v26 < *((void *)v13 + 22));
    }
  }
  uint64_t NormalsRawPtr = CV3DReconPointCloudGetNormalsRawPtr();
  if (NormalsRawPtr)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v13 + 32, *((void *)v13 + 22));
    if (*((void *)v13 + 22))
    {
      unint64_t v30 = 0;
      v31 = (_DWORD *)(NormalsRawPtr + 8);
      do
      {
        *(void *)&long long v29 = *((void *)v31 - 1);
        DWORD2(v29) = *v31;
        *(_OWORD *)(*((void *)v13 + 4) + 16 * v30++) = v29;
        v31 += 3;
      }
      while (v30 < *((void *)v13 + 22));
    }
  }
  uint64_t SemanticHistogramLabelsRawPtr = CV3DReconPointCloudGetSemanticHistogramLabelsRawPtr();
  uint64_t SemanticHistogramVotesRawPtr = CV3DReconPointCloudGetSemanticHistogramVotesRawPtr();
  if (SemanticHistogramLabelsRawPtr)
  {
    uint64_t v34 = SemanticHistogramVotesRawPtr;
    if (!SemanticHistogramVotesRawPtr) {
      __assert_rtn("-[ARSpatialMappingPointCloud initWithPointCloud:transform:identifier:timestamp:]", "ARSpatialMappingPointCloud.mm", 106, "votes");
    }
    std::vector<unsigned char>::resize((unint64_t *)v13 + 10, *((void *)v13 + 22));
    *((void *)v13 + 23) = 4;
    _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE6resizeEm((uint64_t)v13 + 104, *((void *)v13 + 22));
    _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEE6resizeEm((uint64_t)v13 + 128, *((void *)v13 + 22));
    if (*((void *)v13 + 22))
    {
      unint64_t v36 = 0;
      do
      {
        *(_DWORD *)(*((void *)v13 + 13) + 4 * v36) = *(_DWORD *)(SemanticHistogramLabelsRawPtr
                                                                 + *((void *)v13 + 23) * v36);
        v35.i32[0] = *(_DWORD *)(v34 + *((void *)v13 + 23) * v36);
        uint8x8_t v37 = (uint8x8_t)vmovl_u8(*(uint8x8_t *)v35.i8).u64[0];
        *(uint8x8_t *)(*((void *)v13 + 16) + 8 * v36) = v37;
        v37.i32[0] = *(_DWORD *)(*((void *)v13 + 13) + 4 * v36);
        uint16x8_t v35 = vmovl_u8(v37);
        *(unsigned char *)(*((void *)v13 + 10) + v36++) = v35.i8[0];
      }
      while (v36 < *((void *)v13 + 22));
    }
  }
  *((__n128 *)v13 + 13) = a2;
  *((__n128 *)v13 + 14) = a3;
  *((__n128 *)v13 + 15) = a4;
  *((__n128 *)v13 + 16) = a5;
  objc_storeStrong((id *)v13 + 24, a9);
  *((double *)v13 + 25) = a6;
  id v18 = v13;
LABEL_7:

  return v18;
}

- (uint64_t)updateTransform:(void *)a1
{
  uint64_t result = objc_msgSend(a1, "setCameraPose:");
  a1[20] = a1[19];
  return result;
}

- (uint64_t)points
{
  return *(void *)(a1 + 8);
}

- (uint64_t)normals
{
  return *(void *)(a1 + 32);
}

- (uint64_t)colors
{
  return *(void *)(a1 + 56);
}

- (char)semantics
{
  return self->_semantics.__begin_;
}

- (uint64_t)semanticLabels
{
  return *(void *)(a1 + 104);
}

- (uint64_t)semanticVotes
{
  return *(void *)(a1 + 128);
}

- (uint64_t)pointsToWorld
{
  uint64_t v2 = (uint64_t)(a1 + 19);
  uint64_t v3 = a1[20] - a1[19];
  if ([a1 count] != v3 >> 4)
  {
    v4 = a1;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(v2, [v4 count]);
    v5 = (float32x4_t *)v4[1];
    v6 = (float32x4_t *)v4[2];
    v7 = *(float32x4_t **)v2;
    v8 = v4;
    while (v5 != v6)
    {
      [v8 cameraPose];
      float32x4_t v9 = *v5++;
      *v7++ = vaddq_f32(v13, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, v9.f32[0]), v11, *(float32x2_t *)v9.f32, 1), v12, v9, 2));
    }
  }
  return *(void *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)(v4 + 176) = self->_count;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__insert_with_sizeB8ne180100INS_11__wrap_iterIPS1_EES8_EES8_NS6_IPKS1_EET_T0_l(v4 + 8, *(void *)(v4 + 16), (char *)self->_points.var0, *(char **)self->_anon_10, (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_points.var0) >> 4);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__insert_with_sizeB8ne180100INS_11__wrap_iterIPS1_EES8_EES8_NS6_IPKS1_EET_T0_l(v5 + 32, *(void *)(v5 + 40), (char *)self->_normals.var0, *(char **)self->_anon_28, (uint64_t)(*(void *)self->_anon_28 - (unint64_t)self->_normals.var0) >> 4);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__insert_with_sizeB8ne180100INS_11__wrap_iterIPS1_EES8_EES8_NS6_IPKS1_EET_T0_l(v5 + 56, *(void *)(v5 + 64), (char *)self->_colors.var0, *(char **)self->_anon_40, (uint64_t)(*(void *)self->_anon_40 - (unint64_t)self->_colors.var0) >> 4);
    *(void *)(v5 + 184) = self->_semanticsBinSize;
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(v5 + 80, *(char **)(v5 + 88), self->_semantics.__begin_, self->_semantics.__end_, self->_semantics.__end_ - self->_semantics.__begin_);
    _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE18__insert_with_sizeB8ne180100INS_11__wrap_iterIPS1_EES8_EES8_NS6_IPKS1_EET_T0_l(v5 + 104, *(void *)(v5 + 112), *(char **)self->_anon_68, *(char **)&self->_anon_68[8], (uint64_t)(*(void *)&self->_anon_68[8] - *(void *)self->_anon_68) >> 2);
    _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEE18__insert_with_sizeB8ne180100INS_11__wrap_iterIPS1_EES8_EES8_NS6_IPKS1_EET_T0_l(v5 + 128, *(void *)(v5 + 136), *(char **)self->_anon_80, *(char **)&self->_anon_80[8], (uint64_t)(*(void *)&self->_anon_80[8] - *(void *)self->_anon_80) >> 3);
    long long v6 = *(_OWORD *)&self[1].super.isa;
    long long v7 = *(_OWORD *)self[1]._anon_10;
    long long v8 = *(_OWORD *)&self[1]._anon_28[8];
    *(_OWORD *)(v5 + 240) = *(_OWORD *)&self[1]._normals.var0;
    *(_OWORD *)(v5 + 256) = v8;
    *(_OWORD *)(v5 + 208) = v6;
    *(_OWORD *)(v5 + 224) = v7;
    objc_storeStrong((id *)(v5 + 192), self->_identifier);
    *(double *)(v5 + 200) = self->_timestamp;
  }
  return (id)v5;
}

+ (id)dictionaryFromArray:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  __int16 v47 = [MEMORY[0x1E4F1CA48] array];
  v52 = [MEMORY[0x1E4F1CA48] array];
  v51 = [MEMORY[0x1E4F1CA48] array];
  v53 = [MEMORY[0x1E4F1CA48] array];
  v50 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v49 = [MEMORY[0x1E4F1CA48] array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v44;
  uint64_t v3 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v3)
  {
    uint64_t v46 = *(void *)v58;
    do
    {
      uint64_t v48 = 0;
      uint64_t v54 = v3;
      do
      {
        if (*(void *)v58 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v57 + 1) + 8 * v48);
        uint64_t v5 = +[ARQAHelper arrayOf3dPoints:count:](ARQAHelper, "arrayOf3dPoints:count:", [v4 pointsToWorld], objc_msgSend(v4, "count"));
        [v47 addObjectsFromArray:v5];

        uint64_t v55 = 0;
        unint64_t v56 = 0;
        uint64_t v6 = 0;
        uint64_t v7 = 0;
        while (v56 < [v4 count])
        {
          uint64_t v8 = [v4 semanticLabels];
          uint64_t v9 = [v4 semanticVotes];
          float32x4_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", *(unsigned __int8 *)(objc_msgSend(v4, "semantics") + v56));
          [v53 addObject:v10];

          float32x4_t v11 = NSNumber;
          LODWORD(v12) = *(_DWORD *)([v4 normals] + v55);
          float32x4_t v13 = [v11 numberWithFloat:v12];
          v66[0] = v13;
          uint64_t v14 = NSNumber;
          LODWORD(v15) = *(_DWORD *)([v4 normals] + 4 * v7 + 4);
          v16 = [v14 numberWithFloat:v15];
          v66[1] = v16;
          v17 = NSNumber;
          LODWORD(v18) = *(_DWORD *)([v4 normals] + 4 * v7 + 8);
          v19 = [v17 numberWithFloat:v18];
          v66[2] = v19;
          v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
          [v52 addObject:v20];

          long long v21 = NSNumber;
          LODWORD(v22) = *(_DWORD *)([v4 colors] + v55);
          v23 = [v21 numberWithFloat:v22];
          v65[0] = v23;
          v24 = NSNumber;
          LODWORD(v25) = *(_DWORD *)([v4 colors] + 4 * v7 + 4);
          unint64_t v26 = [v24 numberWithFloat:v25];
          v65[1] = v26;
          v27 = NSNumber;
          LODWORD(v28) = *(_DWORD *)([v4 colors] + 4 * v7 + 8);
          long long v29 = [v27 numberWithFloat:v28];
          v65[2] = v29;
          unint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];
          [v51 addObject:v30];

          v31 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v8 + v7)];
          v64[0] = v31;
          v32 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v8 + v7 + 1)];
          v64[1] = v32;
          v33 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v8 + v7 + 2)];
          v64[2] = v33;
          uint64_t v34 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v8 + v7 + 3)];
          v64[3] = v34;
          uint16x8_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
          [v50 addObject:v35];

          unint64_t v36 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + v6)];
          v63[0] = v36;
          uint8x8_t v37 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + v6 + 1)];
          v63[1] = v37;
          v38 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + v6 + 2)];
          v63[2] = v38;
          v39 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + v6 + 3)];
          v63[3] = v39;
          v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:4];
          [v49 addObject:v40];

          v7 += 4;
          v6 += 8;
          v55 += 16;
          ++v56;
        }
        ++v48;
      }
      while (v48 != v54);
      uint64_t v3 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
    }
    while (v3);
  }

  v62[0] = @"V8A";
  v61[0] = @"semanticVersion";
  v61[1] = @"count";
  v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v47, "count"));
  v62[1] = v41;
  v62[2] = v47;
  v61[2] = @"points";
  v61[3] = @"normals";
  v62[3] = v52;
  v62[4] = v51;
  v61[4] = @"colors";
  v61[5] = @"semantics";
  v62[5] = v53;
  v62[6] = v50;
  v61[6] = @"semanticLabels";
  v61[7] = @"semanticVotes";
  v62[7] = v49;
  objc_super v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:8];

  return v42;
}

- (int64_t)count
{
  return self->_count;
}

- (double)cameraPose
{
  objc_copyStruct(&v2, (const void *)(a1 + 208), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setCameraPose:(__n128)a3
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 208), v5, 64, 1, 0);
}

- (unint64_t)semanticsBinSize
{
  return self->_semanticsBinSize;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  var0 = self->_pointsToWorld.var0;
  if (var0)
  {
    *(void *)self->_anon_a0 = var0;
    operator delete(var0);
  }
  uint64_t v4 = *(void **)self->_anon_80;
  if (v4)
  {
    *(void *)&self->_anon_80[8] = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)self->_anon_68;
  if (v5)
  {
    *(void *)&self->_anon_68[8] = v5;
    operator delete(v5);
  }
  begin = self->_semantics.__begin_;
  if (begin)
  {
    self->_semantics.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v7 = self->_colors.var0;
  if (v7)
  {
    *(void *)self->_anon_40 = v7;
    operator delete(v7);
  }
  uint64_t v8 = self->_normals.var0;
  if (v8)
  {
    *(void *)self->_anon_28 = v8;
    operator delete(v8);
  }
  uint64_t v9 = self->_points.var0;
  if (v9)
  {
    *(void *)self->_anon_10 = v9;
    operator delete(v9);
  }
}

- (id).cxx_construct
{
  *((void *)self + 21) = 0;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end