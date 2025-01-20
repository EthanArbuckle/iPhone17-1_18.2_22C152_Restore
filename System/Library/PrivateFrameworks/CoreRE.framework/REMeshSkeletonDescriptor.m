@interface REMeshSkeletonDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)validateWithError:(id *)a3;
- (MeshAssetSkeleton)meshAssetSkeleton;
- (NSArray)jointNames;
- (NSArray)parentIndices;
- (NSString)name;
- (REMeshSkeletonDescriptor)initWithCoder:(id)a3;
- (REMeshSkeletonDescriptor)initWithMeshAssetSkeleton:(const void *)a3;
- (REMeshSkeletonDescriptor)initWithMeshSkeletonDefinition:(const void *)a3;
- (REMeshSkeletonDescriptor)initWithName:(id)a3 jointNames:(id)a4 parentIndices:(id)a5 localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:;
- (const)inverseBindPose;
- (const)localRestPoseRotations;
- (id).cxx_construct;
- (uint64_t)localRestPoseScales;
- (uint64_t)localRestPoseTranslations;
- (unint64_t)estimateContainerSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMeshSkeletonDescriptor

- (REMeshSkeletonDescriptor)initWithMeshAssetSkeleton:(const void *)a3
{
  uint64_t v4 = *((void *)a3 + 3);
  if (v4 != *((void *)a3 + 6))
  {
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.parentIndices.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1731);
    _os_crash();
    __break(1u);
    goto LABEL_23;
  }
  if (v4 != *((void *)a3 + 9))
  {
LABEL_23:
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.localBindPoses.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1732);
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  if (v4 != *((void *)a3 + 12))
  {
LABEL_24:
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.inverseBindPoses.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1733);
    _os_crash();
    __break(1u);
    goto LABEL_25;
  }
  if (v4 != v19)
  {
LABEL_25:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.scales.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1736);
    _os_crash();
    __break(1u);
    goto LABEL_26;
  }
  if (v4 != v22)
  {
LABEL_26:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.rotations.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1737);
    _os_crash();
    __break(1u);
    goto LABEL_27;
  }
  if (v4 != v25)
  {
LABEL_27:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.translations.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1738);
    result = (REMeshSkeletonDescriptor *)_os_crash();
    __break(1u);
    return result;
  }
  v9 = v8 = v7 = [NSString stringWithUTF8String:*((void *)a3 + 1)];
  v10 = (char *)a3 + 88;
  uint64_t v11 = v20;
  uint64_t v12 = v23;
  uint64_t v13 = v26;
  v15 = -[REMeshSkeletonDescriptor initWithName:jointNames:parentIndices:localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:](self, "initWithName:jointNames:parentIndices:localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:", v7, v8, v9, v11, v12, v13, v14, v17[2]);
  if (v17[0] && v17[1]) {
    (*(void (**)(void))(*(void *)v17[0] + 40))();
  }

  if (v24)
  {
    if (v25)
    {
      (*(void (**)(void))(*(void *)v24 + 40))();
      uint64_t v25 = 0;
      uint64_t v26 = 0;
    }
    uint64_t v24 = 0;
  }
  if (v21)
  {
    if (v22)
    {
      (*(void (**)(void))(*(void *)v21 + 40))();
      uint64_t v22 = 0;
      uint64_t v23 = 0;
    }
    uint64_t v21 = 0;
  }
  if (v18)
  {
    if (v19) {
      (*(void (**)(void))(*(void *)v18 + 40))();
    }
  }

  return v15;
}

- (REMeshSkeletonDescriptor)initWithMeshSkeletonDefinition:(const void *)a3
{
  uint64_t v4 = *((void *)a3 + 6);
  if (v4 != *((void *)a3 + 9))
  {
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.parentIndices.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1752);
    _os_crash();
    __break(1u);
    goto LABEL_23;
  }
  if (v4 != *((void *)a3 + 12))
  {
LABEL_23:
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.localRestPose.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1753);
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  if (v4 != *((void *)a3 + 15))
  {
LABEL_24:
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.inverseBindPoses.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1754);
    _os_crash();
    __break(1u);
    goto LABEL_25;
  }
  if (v4 != v19)
  {
LABEL_25:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.scales.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1757);
    _os_crash();
    __break(1u);
    goto LABEL_26;
  }
  if (v4 != v22)
  {
LABEL_26:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.rotations.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1758);
    _os_crash();
    __break(1u);
    goto LABEL_27;
  }
  if (v4 != v25)
  {
LABEL_27:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.translations.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1759);
    result = (REMeshSkeletonDescriptor *)_os_crash();
    __break(1u);
    return result;
  }
  v9 = v8 = v7 = [NSString stringWithUTF8String:*((void *)a3 + 4)];
  v10 = (char *)a3 + 112;
  uint64_t v11 = v20;
  uint64_t v12 = v23;
  uint64_t v13 = v26;
  v15 = -[REMeshSkeletonDescriptor initWithName:jointNames:parentIndices:localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:](self, "initWithName:jointNames:parentIndices:localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:", v7, v8, v9, v11, v12, v13, v14, v17[2]);
  if (v17[0] && v17[1]) {
    (*(void (**)(void))(*(void *)v17[0] + 40))();
  }

  if (v24)
  {
    if (v25)
    {
      (*(void (**)(void))(*(void *)v24 + 40))();
      uint64_t v25 = 0;
      uint64_t v26 = 0;
    }
    uint64_t v24 = 0;
  }
  if (v21)
  {
    if (v22)
    {
      (*(void (**)(void))(*(void *)v21 + 40))();
      uint64_t v22 = 0;
      uint64_t v23 = 0;
    }
    uint64_t v21 = 0;
  }
  if (v18)
  {
    if (v19) {
      (*(void (**)(void))(*(void *)v18 + 40))();
    }
  }

  return v15;
}

- (MeshAssetSkeleton)meshAssetSkeleton
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v3 = [(REMeshSkeletonDescriptor *)self jointNames];
  unint64_t v45 = [v3 count];

  id v42 = [(REMeshSkeletonDescriptor *)self name];
  uint64_t v4 = (_anonymous_namespace_ *)[v42 UTF8String];
  *(void *)&retstr->var0.var0 = 0;
  retstr->var0.unint64_t var1 = "";
  id v5 = [(REMeshSkeletonDescriptor *)self jointNames];
  retstr->var1.unint64_t var1 = 0;
  retstr->var1.var2 = 0;
  retstr->var1.var0 = 0;
  id v43 = v5;
  uint64_t v6 = (_anonymous_namespace_ *)[v5 count];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v43;
  uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:&v55 count:16];
  if (v7)
  {
    unint64_t i = 0;
    p_var4 = *(FixedArray<re::Matrix4x4<float>> **)v52;
    do
    {
      uint64_t v10 = 0;
      unint64_t v11 = i;
      do
      {
        if (*(FixedArray<re::Matrix4x4<float>> **)v52 != p_var4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = (_anonymous_namespace_ *)[*(id *)(*((void *)&v51 + 1) + 8 * v10) UTF8String];
        uint64_t v48 = 0;
        v49 = "";
        unint64_t var1 = retstr->var1.var1;
        if (var1 <= i + v10)
        {
          uint64_t v50 = 0;
          unint64_t v23 = (unint64_t)&v55;
          long long v69 = 0u;
          long long v70 = 0u;
          memset(v68, 0, sizeof(v68));
          os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          int v60 = 136315906;
          v61 = "operator[]";
          __int16 v62 = 1024;
          int v63 = 468;
          __int16 v64 = 2048;
          unint64_t v65 = i + v10;
          __int16 v66 = 2048;
          v67 = (FixedArray<re::Matrix4x4<float>> *)var1;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_29:
          uint64_t v48 = 0;
          v35 = &v55;
          long long v69 = 0u;
          long long v70 = 0u;
          memset(v68, 0, sizeof(v68));
          os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          int v60 = 136315906;
          v61 = "operator[]";
          __int16 v62 = 1024;
          int v63 = 468;
          __int16 v64 = 2048;
          unint64_t v65 = v23;
          __int16 v66 = 2048;
          v67 = p_var4;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_30:
          *(void *)&long long v51 = 0;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v55 = 0u;
          os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          LODWORD(v68[0]) = 136315906;
          *(void *)((char *)v68 + 4) = "operator[]";
          WORD2(v68[1]) = 1024;
          *(_DWORD *)((char *)&v68[1] + 6) = 468;
          WORD1(v68[2]) = 2048;
          *(void *)((char *)&v68[2] + 4) = v35;
          WORD2(v68[3]) = 2048;
          *(void *)((char *)&v68[3] + 6) = v23;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_31:
          *(void *)&long long v51 = 0;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v55 = 0u;
          os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          LODWORD(v68[0]) = 136315906;
          *(void *)((char *)v68 + 4) = "operator[]";
          WORD2(v68[1]) = 1024;
          *(_DWORD *)((char *)&v68[1] + 6) = 468;
          WORD1(v68[2]) = 2048;
          *(void *)((char *)&v68[2] + 4) = i;
          WORD2(v68[3]) = 2048;
          *(void *)((char *)&v68[3] + 6) = p_var4;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_32:
          *(void *)&long long v51 = 0;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v55 = 0u;
          os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          LODWORD(v68[0]) = 136315906;
          *(void *)((char *)v68 + 4) = "operator[]";
          WORD2(v68[1]) = 1024;
          *(_DWORD *)((char *)&v68[1] + 6) = 468;
          WORD1(v68[2]) = 2048;
          *(void *)((char *)&v68[2] + 4) = i;
          WORD2(v68[3]) = 2048;
          *(void *)((char *)&v68[3] + 6) = p_var4;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_33:
          *(void *)&long long v51 = 0;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v55 = 0u;
          os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          LODWORD(v68[0]) = 136315906;
          *(void *)((char *)v68 + 4) = "operator[]";
          WORD2(v68[1]) = 1024;
          *(_DWORD *)((char *)&v68[1] + 6) = 468;
          WORD1(v68[2]) = 2048;
          *(void *)((char *)&v68[2] + 4) = i;
          WORD2(v68[3]) = 2048;
          *(void *)((char *)&v68[3] + 6) = p_var4;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
        }
        double v14 = &retstr->var1.var2[v11];
        uint64_t v15 = v48;
        v16 = (char *)v49;
        uint64_t v48 = 0;
        v49 = "";
        v17 = v14->var1;
        unint64_t v18 = v15 & 0xFFFFFFFFFFFFFFFELL | *(void *)&v14->var0 & 1;
        v14->unint64_t var1 = v16;
        v68[0] = v18;
        v68[1] = v17;
        *(void *)&v14->var0 = v15;
        re::StringID::destroyString((re::StringID *)v68);
        re::StringID::destroyString((re::StringID *)&v48);
        ++v10;
        ++v11;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:&v55 count:16];
      i += v10;
    }
    while (v7);
  }

  id v19 = [(REMeshSkeletonDescriptor *)self parentIndices];
  retstr->var2.unint64_t var1 = 0;
  retstr->var2.var2 = 0;
  retstr->var2.var0 = 0;
  uint64_t v20 = (_anonymous_namespace_ *)[v19 count];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:&v55 count:16];
  if (v22)
  {
    unint64_t v23 = 0;
    uint64_t v24 = *(void *)v52;
    do
    {
      for (unint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v52 != v24) {
          objc_enumerationMutation(v21);
        }
        unsigned int v25 = [*(id *)(*((void *)&v51 + 1) + 8 * i) unsignedIntValue];
        p_var4 = (FixedArray<re::Matrix4x4<float>> *)retstr->var2.var1;
        if ((unint64_t)p_var4 <= v23) {
          goto LABEL_29;
        }
        retstr->var2.var2[v23++] = v25;
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:&v55 count:16];
    }
    while (v22);
  }

  uint64_t v26 = [(REMeshSkeletonDescriptor *)self localRestPoseScales];
  v27 = [(REMeshSkeletonDescriptor *)self localRestPoseRotations];
  v28 = [(REMeshSkeletonDescriptor *)self localRestPoseTranslations];
  retstr->var3.var0 = 0;
  retstr->var3.unint64_t var1 = 0;
  retstr->var3.var2 = 0;
  unint64_t i = v45;
  if (v45)
  {
    uint64_t v29 = 0;
    unint64_t i = 0;
    do
    {
      p_var4 = (FixedArray<re::Matrix4x4<float>> *)retstr->var3.var1;
      if ((unint64_t)p_var4 <= i) {
        goto LABEL_31;
      }
      *(_OWORD *)((char *)retstr->var3.var2 + v29) = *(_OWORD *)(v26 + 16 * i);
      p_var4 = (FixedArray<re::Matrix4x4<float>> *)retstr->var3.var1;
      if ((unint64_t)p_var4 <= i) {
        goto LABEL_32;
      }
      *(_OWORD *)((char *)retstr->var3.var2 + v29 + 16) = *((_OWORD *)v27 + i);
      p_var4 = (FixedArray<re::Matrix4x4<float>> *)retstr->var3.var1;
      if ((unint64_t)p_var4 <= i) {
        goto LABEL_33;
      }
      *(_OWORD *)((char *)retstr->var3.var2 + v29 + 32) = *((_OWORD *)v28 + i++);
      v29 += 48;
    }
    while (v45 != i);
  }
  v30 = [(REMeshSkeletonDescriptor *)self inverseBindPose];
  v31 = [(REMeshSkeletonDescriptor *)self inverseBindPose];
  p_var4 = &retstr->var4;
  v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v31 + 64 * v45);
  unint64_t v33 = (v32 - v30) >> 6;
  retstr->var4.var0 = 0;
  retstr->var4.unint64_t var1 = 0;
  retstr->var4.var2 = 0;
  if (v32 != v30)
  {
    uint64_t v34 = 0;
    v35 = 0;
    v36 = (char *)v30 + 48;
    do
    {
      unint64_t v23 = retstr->var4.var1;
      if (v23 <= (unint64_t)v35) {
        goto LABEL_30;
      }
      long long v38 = *(_OWORD *)&v36[v34 - 16];
      long long v37 = *(_OWORD *)&v36[v34];
      long long v39 = *(_OWORD *)&v36[v34 - 32];
      v40 = (char *)retstr->var4.var2 + v34;
      _OWORD *v40 = *(_OWORD *)&v36[v34 - 48];
      v40[1] = v39;
      v40[2] = v38;
      v40[3] = v37;
      v35 = (long long *)((char *)v35 + 1);
      v34 += 64;
    }
    while ((long long *)v33 != v35);
  }

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshSkeletonDescriptor)initWithName:(id)a3 jointNames:(id)a4 parentIndices:(id)a5 localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:
{
  v8 = v7;
  v9 = v6;
  uint64_t v10 = v5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v62.receiver = self;
  v62.super_class = (Class)REMeshSkeletonDescriptor;
  id v17 = [(REMeshSkeletonDescriptor *)&v62 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    v61 = v9;
    id v19 = v8;
    uint64_t v20 = (void *)*((void *)v17 + 13);
    *((void *)v17 + 13) = v18;

    objc_storeStrong((id *)v17 + 14, a4);
    objc_storeStrong((id *)v17 + 15, a5);
    unint64_t v21 = [v15 count];
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((void *)v17 + 1, v21);
    uint64_t v22 = *((void *)v17 + 4);
    uint64_t v23 = *((void *)v17 + 5);
    unint64_t v24 = (v23 - v22) >> 4;
    if (v21 <= v24)
    {
      if (v21 >= v24) {
        goto LABEL_19;
      }
      uint64_t v37 = v22 + 16 * v21;
    }
    else
    {
      unint64_t v25 = v21 - v24;
      uint64_t v26 = *((void *)v17 + 6);
      if (v21 - v24 > (v26 - v23) >> 4)
      {
        if (v21 >> 60) {
          goto LABEL_37;
        }
        uint64_t v27 = v26 - v22;
        uint64_t v28 = v27 >> 3;
        if (v27 >> 3 <= v21) {
          uint64_t v28 = v21;
        }
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v29 = v28;
        }
        v30 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<simd_quatf>>(v29);
        v31 = &v30[16 * v24];
        unint64_t v33 = &v30[16 * v32];
        bzero(v31, 16 * v25);
        uint64_t v34 = &v31[16 * v25];
        v36 = (char *)*((void *)v17 + 4);
        v35 = (char *)*((void *)v17 + 5);
        if (v35 != v36)
        {
          do
          {
            *((_OWORD *)v31 - 1) = *((_OWORD *)v35 - 1);
            v31 -= 16;
            v35 -= 16;
          }
          while (v35 != v36);
          v35 = (char *)*((void *)v17 + 4);
        }
        *((void *)v17 + 4) = v31;
        *((void *)v17 + 5) = v34;
        *((void *)v17 + 6) = v33;
        if (v35) {
          operator delete(v35);
        }
LABEL_19:
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((void *)v17 + 7, v21);
        uint64_t v38 = *((void *)v17 + 10);
        uint64_t v39 = *((void *)v17 + 11);
        unint64_t v40 = (v39 - v38) >> 6;
        if (v21 <= v40)
        {
          BOOL v58 = v21 >= v40;
          long long v56 = v19;
          long long v57 = v61;
          if (!v58) {
            *((void *)v17 + 11) = v38 + (v21 << 6);
          }
          goto LABEL_35;
        }
        unint64_t v41 = v21 - v40;
        uint64_t v42 = *((void *)v17 + 12);
        if (v21 - v40 <= (v42 - v39) >> 6)
        {
          bzero(*((void **)v17 + 11), v41 << 6);
          *((void *)v17 + 11) = v39 + (v41 << 6);
          long long v56 = v19;
          long long v57 = v61;
LABEL_35:
          memcpy(*((void **)v17 + 1), v10, 16 * v21);
          memcpy(*((void **)v17 + 4), v57, 16 * v21);
          memcpy(*((void **)v17 + 7), v56, 16 * v21);
          memcpy(*((void **)v17 + 10), v63, v21 << 6);
          goto LABEL_36;
        }
        if (!(v21 >> 58))
        {
          uint64_t v43 = v42 - v38;
          uint64_t v44 = v43 >> 5;
          if (v43 >> 5 <= v21) {
            uint64_t v44 = v21;
          }
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFC0) {
            unint64_t v45 = 0x3FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v45 = v44;
          }
          v46 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<simd_float4x4>>(v45);
          int v60 = v10;
          v47 = &v46[64 * v40];
          v49 = &v46[64 * v48];
          bzero(v47, v41 << 6);
          uint64_t v50 = &v47[64 * v41];
          long long v52 = (char *)*((void *)v17 + 10);
          long long v51 = (char *)*((void *)v17 + 11);
          if (v51 != v52)
          {
            do
            {
              long long v53 = *((_OWORD *)v51 - 4);
              long long v54 = *((_OWORD *)v51 - 3);
              long long v55 = *((_OWORD *)v51 - 1);
              *((_OWORD *)v47 - 2) = *((_OWORD *)v51 - 2);
              *((_OWORD *)v47 - 1) = v55;
              *((_OWORD *)v47 - 4) = v53;
              *((_OWORD *)v47 - 3) = v54;
              v47 -= 64;
              v51 -= 64;
            }
            while (v51 != v52);
            long long v51 = (char *)*((void *)v17 + 10);
          }
          long long v56 = v19;
          *((void *)v17 + 10) = v47;
          *((void *)v17 + 11) = v50;
          *((void *)v17 + 12) = v49;
          uint64_t v10 = v60;
          long long v57 = v61;
          if (v51) {
            operator delete(v51);
          }
          goto LABEL_35;
        }
LABEL_37:
        abort();
      }
      bzero(*((void **)v17 + 5), 16 * v25);
      uint64_t v37 = v23 + 16 * v25;
    }
    *((void *)v17 + 5) = v37;
    goto LABEL_19;
  }
LABEL_36:

  return (REMeshSkeletonDescriptor *)v17;
}

- (REMeshSkeletonDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v5;

  uint64_t v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"jointNames"];
  jointNames = self->_jointNames;
  self->_jointNames = v7;

  v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"parentIndices"];
  parentIndices = self->_parentIndices;
  self->_parentIndices = v9;

  unint64_t v11 = [(NSArray *)self->_jointNames count];
  size_t v51 = 0;
  id v12 = v4;
  uint64_t v13 = [v12 decodeBytesForKey:@"localRestPose.scale" returnedLength:&v51];
  int v14 = validateLocalRestPoseFloat3(v11, v13, v51, self->_anon_8);
  id v15 = v12;
  uint64_t v16 = [v15 decodeBytesForKey:@"localRestPose.rotation" returnedLength:&v51];
  if (!v14) {
    goto LABEL_26;
  }
  size_t v17 = v51;
  if (v51 != 16 * v11) {
    goto LABEL_25;
  }
  if (!v11)
  {
    id v19 = 0;
    uint64_t v34 = 0;
    unint64_t v33 = 0;
    goto LABEL_21;
  }
  if (v11 >> 60) {
    goto LABEL_40;
  }
  uint64_t v18 = v16;
  id v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)std::__allocate_at_least[abi:nn180100]<std::allocator<simd_quatf>>(v11);
  uint64_t v21 = v20;
  bzero(v19, v17);
  uint64_t v22 = 0;
  char v23 = 1;
  do
  {
    float32x4_t v24 = *(float32x4_t *)(v18 + 16 * v22);
    int v25 = HIDWORD(*(void *)(v18 + 16 * v22));
    int v26 = *(void *)(v18 + 16 * v22 + 8);
    *((float32x4_t *)v19 + v22) = v24;
    int8x16_t v27 = (int8x16_t)vmulq_f32(v24, v24);
    BOOL v28 = (v26 & 0x7FFFFFFFu) <= 0x7F7FFFFF && (v24.i32[3] & 0x7FFFFFFFu) < 0x7F800000;
    BOOL v29 = (v25 & 0x7FFFFFFFu) <= 0x7F7FFFFF && v28;
    BOOL v30 = (v24.i32[0] & 0x7FFFFFFFu) <= 0x7F7FFFFF && v29;
    float v31 = vaddv_f32(vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v27, v27, 8uLL)));
    BOOL v32 = v31 == 1.0;
    if (fabsf(v31 + -1.0) <= 0.00001) {
      BOOL v32 = 1;
    }
    v23 &= v32 && v30;
    ++v22;
  }
  while (v11 != v22);
  if ((v23 & 1) == 0)
  {
    self->_localRestPoseRotations.__end_ = self->_localRestPoseRotations.__begin_;
    operator delete(v19);
LABEL_25:
    int v14 = 0;
    goto LABEL_26;
  }
  unint64_t v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v19 + 16 * v21);
  uint64_t v34 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v19 + v17);
LABEL_21:
  begin = self->_localRestPoseRotations.__begin_;
  if (begin)
  {
    self->_localRestPoseRotations.__end_ = begin;
    operator delete(begin);
  }
  self->_localRestPoseRotations.__begin_ = v19;
  self->_localRestPoseRotations.__end_ = v34;
  int v14 = 1;
  self->_localRestPoseRotations.__end_cap_.__value_ = v33;
LABEL_26:
  id v36 = v15;
  uint64_t v37 = [v36 decodeBytesForKey:@"localRestPose.translation" returnedLength:&v51];
  if (v14) {
    int v38 = validateLocalRestPoseFloat3(v11, v37, v51, self->_anon_38);
  }
  else {
    int v38 = 0;
  }
  id v39 = v36;
  uint64_t v40 = [v39 decodeBytesForKey:@"inverseBindPose" returnedLength:&v51];
  if (!v38 || (size_t v42 = v51, v51 != v11 << 6)) {
    v47 = {;
  }
    [v39 failWithError:v47];

    uint64_t v48 = 0;
    goto LABEL_39;
  }
  uint64_t v43 = (const void *)v40;
  if (!v11)
  {
    v46 = 0;
    unint64_t v45 = 0;
    goto LABEL_36;
  }
  if (v11 >> 58) {
LABEL_40:
  }
    abort();
  unint64_t v11 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<simd_float4x4>>(v11);
  unint64_t v45 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v11 + (v44 << 6));
  bzero((void *)v11, v42);
  v46 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v11 + v42);
LABEL_36:
  memcpy((void *)v11, v43, v42);
  v49 = self->_inverseBindPose.__begin_;
  if (v49)
  {
    self->_inverseBindPose.__end_ = v49;
    operator delete(v49);
  }
  self->_inverseBindPose.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v11;
  self->_inverseBindPose.__end_ = v46;
  self->_inverseBindPose.__end_cap_.__value_ = v45;
  uint64_t v48 = self;
LABEL_39:

  return v48;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeObject:self->_jointNames forKey:@"jointNames"];
  [v4 encodeObject:self->_parentIndices forKey:@"parentIndices"];
  [v4 encodeBytes:*(void *)self->_anon_8 length:*(void *)&self->_anon_8[8] - *(void *)self->_anon_8 forKey:@"localRestPose.scale"];
  [v4 encodeBytes:self->_localRestPoseRotations.__begin_ length:self->_localRestPoseRotations.__end_ - self->_localRestPoseRotations.__begin_ forKey:@"localRestPose.rotation"];
  [v4 encodeBytes:*(void *)self->_anon_38 length:*(void *)&self->_anon_38[8] - *(void *)self->_anon_38 forKey:@"localRestPose.translation"];
  [v4 encodeBytes:self->_inverseBindPose.__begin_ length:self->_inverseBindPose.__end_ - self->_inverseBindPose.__begin_ forKey:@"inverseBindPose"];
}

- (BOOL)validateWithError:(id *)a3
{
  NSUInteger v5 = [(NSArray *)self->_jointNames count];
  if ([(NSArray *)self->_parentIndices count] == v5
    && v5 == (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4
    && v5 == (self->_localRestPoseRotations.__end_ - self->_localRestPoseRotations.__begin_) >> 4
    && v5 == (uint64_t)(*(void *)&self->_anon_38[8] - *(void *)self->_anon_38) >> 4
    && v5 == (self->_inverseBindPose.__end_ - self->_inverseBindPose.__begin_) >> 6)
  {
    return 1;
  }
  return 0;
}

- (uint64_t)localRestPoseScales
{
  return *(void *)(a1 + 8);
}

- (const)localRestPoseRotations
{
  return self->_localRestPoseRotations.__begin_;
}

- (uint64_t)localRestPoseTranslations
{
  return *(void *)(a1 + 56);
}

- (const)inverseBindPose
{
  return self->_inverseBindPose.__begin_;
}

- (unint64_t)estimateContainerSize
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v3);
  NSUInteger v5 = (objc_class *)objc_opt_class();
  size_t v6 = class_getInstanceSize(v5);
  name = self->_name;
  if (name) {
    size_t v8 = v6;
  }
  else {
    size_t v8 = 0;
  }
  if (name) {
    uint64_t v9 = [(NSString *)name lengthOfBytesUsingEncoding:4] + 1;
  }
  else {
    uint64_t v9 = 0;
  }
  if (self->_jointNames)
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    size_t v11 = class_getInstanceSize(v10);
    jointNames = self->_jointNames;
  }
  else
  {
    jointNames = 0;
    size_t v11 = 0;
  }
  uint64_t v13 = [(NSArray *)jointNames count];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int v14 = self->_jointNames;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
  uint64_t v16 = v8 + InstanceSize + v9 + v11 + 8 * v13;
  if (v15)
  {
    uint64_t v17 = *(void *)v40;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v39 + 1) + 8 * v18);
        if (v19) {
          size_t v20 = v6;
        }
        else {
          size_t v20 = 0;
        }
        if (v19) {
          uint64_t v21 = [v19 lengthOfBytesUsingEncoding:4] + 1;
        }
        else {
          uint64_t v21 = 0;
        }
        v16 += v20 + v21;
        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v15);
  }

  if (self->_parentIndices)
  {
    uint64_t v22 = (objc_class *)objc_opt_class();
    size_t v23 = class_getInstanceSize(v22);
    parentIndices = self->_parentIndices;
  }
  else
  {
    parentIndices = 0;
    size_t v23 = 0;
  }
  uint64_t v25 = [(NSArray *)parentIndices count];
  int v26 = (objc_class *)objc_opt_class();
  size_t v27 = class_getInstanceSize(v26);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  BOOL v28 = self->_parentIndices;
  uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
  uint64_t v30 = v23 + v16 + 8 * v25;
  if (v29)
  {
    uint64_t v31 = *(void *)v36;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        if (*(void *)(*((void *)&v35 + 1) + 8 * v32)) {
          size_t v33 = v27;
        }
        else {
          size_t v33 = 0;
        }
        v30 += v33;
        ++v32;
      }
      while (v29 != v32);
      uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v29);
  }

  return ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)self->_localRestPoseRotations.__end_cap_.__value_
                                             + *(void *)&self->_anon_8[16]
                                             + *(void *)&self->_anon_38[16]
                                             + (unint64_t)self->_inverseBindPose.__end_cap_.__value_
                                             + v30)
       - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)self->_localRestPoseRotations.__begin_
                                             + *(void *)self->_anon_8
                                             + (unint64_t)self->_inverseBindPose.__begin_
                                             + *(void *)self->_anon_38);
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)jointNames
{
  return self->_jointNames;
}

- (NSArray)parentIndices
{
  return self->_parentIndices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIndices, 0);
  objc_storeStrong((id *)&self->_jointNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
  begin = self->_inverseBindPose.__begin_;
  if (begin)
  {
    self->_inverseBindPose.__end_ = begin;
    operator delete(begin);
  }
  id v4 = *(void **)self->_anon_38;
  if (v4)
  {
    *(void *)&self->_anon_38[8] = v4;
    operator delete(v4);
  }
  NSUInteger v5 = self->_localRestPoseRotations.__begin_;
  if (v5)
  {
    self->_localRestPoseRotations.__end_ = v5;
    operator delete(v5);
  }
  size_t v6 = *(void **)self->_anon_8;
  if (v6)
  {
    *(void *)&self->_anon_8[8] = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end