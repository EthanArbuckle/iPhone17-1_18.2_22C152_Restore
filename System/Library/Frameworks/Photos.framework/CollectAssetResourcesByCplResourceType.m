@interface CollectAssetResourcesByCplResourceType
@end

@implementation CollectAssetResourcesByCplResourceType

void ___CollectAssetResourcesByCplResourceType_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = *(id *)(a1 + 32);
  id v8 = v6;
  v9 = v8;
  if (!v7)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    v31 = objc_msgSend(NSString, "stringWithUTF8String:", "_PHResourceLocalAvailabilityRequestResourceType _ResourceTypeForAssetResource(PHAsset *__strong, PHAssetResource *__strong)");
    [v30 handleFailureInFunction:v31, @"PHResourceLocalAvailabilityRequest.m", 1413, @"Invalid parameter not satisfying: %@", @"asset" file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_37:
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    v33 = objc_msgSend(NSString, "stringWithUTF8String:", "_PHResourceLocalAvailabilityRequestResourceType _ResourceTypeForAssetResource(PHAsset *__strong, PHAssetResource *__strong)");
    [v32 handleFailureInFunction:v33, @"PHResourceLocalAvailabilityRequest.m", 1414, @"Invalid parameter not satisfying: %@", @"resource" file lineNumber description];

    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    v35 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _CPLResourceTypeForAssetResource(PHAssetResource *__strong, CPLResourceType *)");
    [v34 handleFailureInFunction:v35, @"PHResourceLocalAvailabilityRequest.m", 1316, @"Invalid parameter not satisfying: %@", @"resource" file lineNumber description];

    goto LABEL_4;
  }
  if (!v8) {
    goto LABEL_37;
  }
LABEL_3:
  id v10 = v9;
LABEL_4:
  if ([v9 conformsToProtocol:&unk_1EEB55F08]
    && (uint64_t v11 = [v9 cplResourceType]) != 0)
  {
    unint64_t v12 = v11;

    if (v12 < 0x1D)
    {
      unint64_t v13 = v12 - 1;
      if ((0x9DFE07Fu >> (v12 - 1)))
      {
        v14 = &unk_19B2CC818;
LABEL_26:
        unint64_t v16 = v14[v13];
        goto LABEL_27;
      }
    }
  }
  else
  {
  }
  uint64_t v15 = [v9 type];
  unint64_t v16 = v15;
  if (v15 > 107)
  {
    if (v15 == 108)
    {
      unint64_t v16 = 20;
      goto LABEL_27;
    }
    if (v15 == 110)
    {
      unint64_t v16 = 22;
      goto LABEL_27;
    }
  }
  else
  {
    if (v15 == 7)
    {
      unint64_t v16 = 21;
      goto LABEL_27;
    }
    if (v15 == 16)
    {
      unint64_t v16 = 19;
      goto LABEL_27;
    }
  }
  if (![v7 isCloudSharedAsset])
  {
    unint64_t v13 = v16 - 1;
    if (v16 - 1 < 0x13 && ((0x4FFFFu >> v13) & 1) != 0)
    {
      v14 = &unk_19B2CC8F8;
      goto LABEL_26;
    }
LABEL_34:

    v28 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v29;
      __int16 v38 = 2112;
      v39 = v9;
      _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Ignoring resource for sharing asset: %@, resource: %@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  if (v16 == 1) {
    goto LABEL_27;
  }
  if ([v9 type] == 2)
  {
    unint64_t v16 = 1;
    goto LABEL_27;
  }
  if (v16 != 9) {
    goto LABEL_34;
  }
  unint64_t v16 = 13;
LABEL_27:

  v17 = *(void **)(a1 + 40);
  v18 = [NSNumber numberWithInteger:v16];
  v19 = [v17 objectForKeyedSubscript:v18];

  if (!v19)
  {
    v27 = *(void **)(a1 + 40);
    v28 = [NSNumber numberWithInteger:v16];
    [v27 setObject:v9 forKeyedSubscript:v28];
LABEL_30:

    goto LABEL_31;
  }
  v20 = NSString;
  uint64_t v21 = *(void *)(a1 + 32);
  v22 = _PHResourceLocalAvailabilityRequestResourceTypeDescription(v16);
  v23 = [v20 stringWithFormat:@"Trying to collect resource for already used _PHResourceLocalAvailabilityRequestResourceType while sharing asset: %@, cplResourceType: %@, resource: %@, all resources: %@", v21, v22, v9, *(void *)(a1 + 48)];

  uint64_t v24 = _PHResourceLocalAvailabilityRequestError(0, 0, v23);
  uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
  v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;

  *a4 = 1;
LABEL_31:
}

@end