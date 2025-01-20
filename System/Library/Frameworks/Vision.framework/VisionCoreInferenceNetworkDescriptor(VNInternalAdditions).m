@interface VisionCoreInferenceNetworkDescriptor(VNInternalAdditions)
- (BOOL)getVNEspressoModelImageprintData:()VNInternalAdditions elementType:elementCount:fromTensorData:descriptor:error:;
- (id)URLForComputeDevice:()VNInternalAdditions error:;
- (id)VNEspressoModelImageprintOfClass:()VNInternalAdditions fromData:tensorDescriptor:originatingRequestSpecifier:fromBlock:error:;
@end

@implementation VisionCoreInferenceNetworkDescriptor(VNInternalAdditions)

- (id)URLForComputeDevice:()VNInternalAdditions error:
{
  id v6 = a3;
  v7 = [a1 URL];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    *a4 = +[VNError errorForUnsupportedComputeDevice:v6];
  }

  return v8;
}

- (id)VNEspressoModelImageprintOfClass:()VNInternalAdditions fromData:tensorDescriptor:originatingRequestSpecifier:fromBlock:error:
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = a7;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  id v23 = 0;
  LOBYTE(a1) = [a1 getVNEspressoModelImageprintData:&v23 elementType:&v25 elementCount:&v24 fromTensorData:v14 descriptor:v15 error:a8];
  id v18 = v23;
  if (a1)
  {
    if (v17)
    {
      v19 = v17[2](v17, a3, v18, v25, v24, v16, a8);
    }
    else
    {
      v20 = [a3 printWithDescriptorData:v18 elementType:v25 elementCount:v24 originatingRequestSpecifier:v16 error:a8];
      v19 = v20;
      if (v20) {
        id v21 = v20;
      }
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)getVNEspressoModelImageprintData:()VNInternalAdditions elementType:elementCount:fromTensorData:descriptor:error:
{
  id v13 = a6;
  id v14 = a7;
  id v15 = [v14 shape];
  uint64_t v43 = 0;
  if (([v15 getOneDimensionalArrayDimensionIndex:&v43 error:a8] & 1) == 0)
  {
LABEL_23:
    BOOL v21 = 0;
    goto LABEL_33;
  }
  uint64_t v16 = [v14 dataType];
  uint64_t v17 = v16;
  uint64_t v40 = 1;
  uint64_t v18 = 4;
  if (v16 == 65552 || v16 == 65568) {
    goto LABEL_6;
  }
  if (v16 != 65600)
  {
    if (a8)
    {
      id v30 = [NSString alloc];
      v31 = NSStringFromVisionCoreTensorDataType();
      v32 = (void *)[v30 initWithFormat:@"tensor data type %@ is not supported", v31];

      *a8 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v32];
    }
    goto LABEL_23;
  }
  uint64_t v40 = 2;
  uint64_t v18 = 8;
LABEL_6:
  unint64_t v19 = [v15 elementCount];
  unint64_t v20 = v18 * v19;
  if (v20 == [v14 storageByteCount])
  {
    *a3 = (id)[v13 copy];
    *a4 = v40;
    *a5 = v19;
    BOOL v21 = 1;
    goto LABEL_33;
  }
  v37 = a3;
  id v39 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v20];
  uint64_t v22 = [v39 mutableBytes];
  if (!v22)
  {
    if (a8)
    {
      +[VNError errorForMemoryAllocationFailure];
      BOOL v21 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v21 = 0;
    }
    v29 = v39;
    goto LABEL_32;
  }
  id v36 = v13;
  unint64_t v23 = [v15 rank];
  v34 = a4;
  v35 = a5;
  src.data = 0;
  std::vector<unsigned long>::vector(__p, v23, &src);
  uint64_t v24 = [v13 bytes];
  if (!v19)
  {
LABEL_20:
    v29 = v39;
    void *v37 = v39;
    uint64_t *v34 = v40;
    unint64_t *v35 = v19;
    BOOL v21 = 1;
    goto LABEL_27;
  }
  uint64_t v25 = v24;
  BOOL v21 = 0;
  uint64_t v26 = 0;
  int64x2_t v38 = vdupq_n_s64(1uLL);
  while (1)
  {
    *((void *)__p[0] + v43) = v26;
    uint64_t v41 = 0;
    if ((objc_msgSend(v14, "getByteOffset:forPosition:rank:error:", &v41) & 1) == 0) {
      break;
    }
    v27 = (void *)(v25 + v41);
    switch(v17)
    {
      case 65600:
        *(void *)(v22 + 8 * v26) = *v27;
        break;
      case 65568:
        int v28 = *(_DWORD *)v27;
        goto LABEL_18;
      case 65552:
        src.data = (void *)(v25 + v41);
        *(int64x2_t *)&src.height = v38;
        src.rowBytes = 2;
        int v45 = 2143289344;
        dest.data = &v45;
        *(int64x2_t *)&dest.height = v38;
        dest.rowBytes = 4;
        vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
        int v28 = v45;
LABEL_18:
        *(_DWORD *)(v22 + 4 * v26) = v28;
        break;
    }
    BOOL v21 = ++v26 >= v19;
    if (v19 == v26) {
      goto LABEL_20;
    }
  }
  v29 = v39;
LABEL_27:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  id v13 = v36;
LABEL_32:

LABEL_33:
  return v21;
}

@end