@interface NSArray(PHAssetResource)
- (float)vcp_getFpsRate;
- (id)mad_computeSyncResource;
- (id)vcp_adjustmentsResource;
- (id)vcp_avAsset:()PHAssetResource;
- (id)vcp_highResImageResourcesForAsset:()PHAssetResource;
- (id)vcp_localMovieResourcesSorted:()PHAssetResource;
- (id)vcp_localPhotoResourcesSorted:()PHAssetResource;
- (id)vcp_movieResourcesSorted:()PHAssetResource;
- (id)vcp_originalResource;
- (id)vcp_originalVideoResource;
- (id)vcp_photoResourcesSorted:()PHAssetResource;
- (id)vcp_resourceWithType:()PHAssetResource;
- (id)vcp_smallResourceMeetingCriteria:()PHAssetResource;
- (uint64_t)vcp_hasLocalAdjustments;
- (uint64_t)vcp_hasLocalMovie:()PHAssetResource;
- (uint64_t)vcp_hasLocalPhoto:()PHAssetResource;
- (uint64_t)vcp_hasLocalSlowmo:()PHAssetResource;
- (uint64_t)vcp_isOriginalLocal;
- (uint64_t)vcp_smallMovieDerivativeResource;
- (uint64_t)vcp_thumbnailResource;
@end

@implementation NSArray(PHAssetResource)

- (id)vcp_resourceWithType:()PHAssetResource
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (void)v11) == a3)
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (uint64_t)vcp_isOriginalLocal
{
  v1 = objc_msgSend(a1, "vcp_originalResource");
  uint64_t v2 = objc_msgSend(v1, "vcp_isLocallyAvailable");

  return v2;
}

- (uint64_t)vcp_hasLocalPhoto:()PHAssetResource
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "vcp_isDecodable", (void)v11)
          && objc_msgSend(v8, "vcp_isPhotoResourceUsable:", a3)
          && (objc_msgSend(v8, "vcp_isLocallyAvailable") & 1) != 0)
        {
          uint64_t v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_13:

  return v9;
}

- (uint64_t)vcp_hasLocalMovie:()PHAssetResource
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "vcp_isMovie", (void)v11)
          && objc_msgSend(v8, "vcp_isVideoResourceUsable:", a3)
          && (objc_msgSend(v8, "vcp_isLocallyAvailable") & 1) != 0)
        {
          uint64_t v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_13:

  return v9;
}

- (uint64_t)vcp_hasLocalAdjustments
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v5, "type", (void)v7) == 7)
        {
          uint64_t v2 = objc_msgSend(v5, "vcp_isLocallyAvailable");
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)vcp_hasLocalSlowmo:()PHAssetResource
{
  if (a3 & 1) == 0 && (objc_msgSend(a1, "vcp_isOriginalLocal")) {
    return 1;
  }
  uint64_t result = objc_msgSend(a1, "vcp_hasLocalMovie:", a3);
  if (result)
  {
    return objc_msgSend(a1, "vcp_hasLocalAdjustments");
  }
  return result;
}

- (uint64_t)vcp_thumbnailResource
{
  return objc_msgSend(a1, "vcp_resourceWithType:", 102);
}

- (id)vcp_smallResourceMeetingCriteria:()PHAssetResource
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = a1;
  uint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (v4[2](v4, v10))
        {
          if (!v6
            || (objc_msgSend(v10, "vcp_size", (void)v19),
                double v12 = v11,
                double v14 = v13,
                objc_msgSend(v6, "vcp_size"),
                v12 * v14 < v15 * v16))
          {
            id v17 = v10;

            uint64_t v6 = v17;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v6;
}

- (uint64_t)vcp_smallMovieDerivativeResource
{
  return objc_msgSend(a1, "vcp_smallResourceMeetingCriteria:", &__block_literal_global_229);
}

- (id)vcp_originalResource
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v5, "type", (void)v8) == 2 || objc_msgSend(v5, "type") == 1)
        {
          id v6 = v5;
          goto LABEL_13;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v6 = 0;
      if (v2) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_13:

  return v6;
}

- (id)vcp_originalVideoResource
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v5, "type", (void)v8) == 2 || objc_msgSend(v5, "type") == 9)
        {
          id v6 = v5;
          goto LABEL_13;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v6 = 0;
      if (v2) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_13:

  return v6;
}

- (id)vcp_adjustmentsResource
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = a1;
  id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v5, "type", (void)v7) == 7)
        {
          id v2 = v5;
          goto LABEL_11;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (id)mad_computeSyncResource
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = a1;
  id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v5, "type", (void)v7) == 112)
        {
          id v2 = v5;
          goto LABEL_11;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (id)vcp_localPhotoResourcesSorted:()PHAssetResource
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "vcp_isPhoto", (void)v12)
          && objc_msgSend(v10, "vcp_isPhotoResourceUsable:", a3)
          && objc_msgSend(v10, "vcp_isLocallyAvailable"))
        {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_msgSend(v5, "vcp_sortBySize");
  return v5;
}

- (id)vcp_photoResourcesSorted:()PHAssetResource
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "vcp_isPhoto", (void)v12)
          && objc_msgSend(v10, "vcp_isPhotoResourceUsable:", a3))
        {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_msgSend(v5, "vcp_sortBySize");
  return v5;
}

- (id)vcp_localMovieResourcesSorted:()PHAssetResource
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "vcp_isMovie", (void)v12)
          && objc_msgSend(v10, "vcp_isVideoResourceUsable:", a3)
          && objc_msgSend(v10, "vcp_isLocallyAvailable"))
        {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_msgSend(v5, "vcp_sortBySize");
  return v5;
}

- (id)vcp_movieResourcesSorted:()PHAssetResource
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "vcp_isMovie", (void)v12)
          && objc_msgSend(v10, "vcp_isVideoResourceUsable:", a3))
        {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_msgSend(v5, "vcp_sortBySize");
  return v5;
}

- (id)vcp_avAsset:()PHAssetResource
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = objc_msgSend(a1, "vcp_localMovieResourcesSorted:");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(v1, "reverseObjectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v9 != v4) {
        objc_enumerationMutation(v2);
      }
      id v6 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v5), "vcp_avAsset");
      if (v6) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v6 = 0;
  }

  return v6;
}

- (float)vcp_getFpsRate
{
  float v2 = 1.0;
  if (objc_msgSend(a1, "vcp_hasLocalAdjustments"))
  {
    uint64_t v3 = objc_msgSend(a1, "vcp_adjustmentsResource");
    uint64_t v4 = [v3 privateFileURL];

    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F8CE10]) initWithURL:v4];
    id v6 = v5;
    if (v5 && ([v5 hasSlowMotionAdjustments] & 1) != 0)
    {
      [v6 slowMotionRate];
      float v2 = v7;
    }
  }
  return v2;
}

- (id)vcp_highResImageResourcesForAsset:()PHAssetResource
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasAdjustments])
  {
    int v5 = 0;
  }
  else
  {
    id v6 = [v4 photoLibrary];
    int v5 = objc_msgSend(v6, "vcp_isSyndicationLibrary") ^ 1;
  }
  float v7 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = a1;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v12, "vcp_isPhoto", (void)v16) & 1) != 0
          && [v12 type] != 13
          && [v12 type] != 8)
        {
          int v13 = [v12 type] == 1 ? v5 : 1;
          if (v13 == 1 && ([v12 analysisType] == 2 || objc_msgSend(v12, "analysisType") == 1)) {
            [v7 addObject:v12];
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  long long v14 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_ascendingSizeComparator");
  [v7 sortUsingComparator:v14];

  return v7;
}

@end