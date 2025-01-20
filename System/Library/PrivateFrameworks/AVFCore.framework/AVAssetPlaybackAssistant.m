@interface AVAssetPlaybackAssistant
+ (AVAssetPlaybackAssistant)assetPlaybackAssistantWithAsset:(AVAsset *)asset;
- (AVAssetPlaybackAssistant)initWithAsset:(id)a3;
- (id)_playbackConfigurationOptions;
- (void)dealloc;
- (void)loadPlaybackConfigurationOptionsWithCompletionHandler:(void *)completionHandler;
@end

@implementation AVAssetPlaybackAssistant

- (AVAssetPlaybackAssistant)initWithAsset:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAssetPlaybackAssistant;
  v4 = [(AVAssetPlaybackAssistant *)&v6 init];
  if (v4) {
    v4->_asset = (AVAsset *)a3;
  }
  return v4;
}

+ (AVAssetPlaybackAssistant)assetPlaybackAssistantWithAsset:(AVAsset *)asset
{
  v3 = [[AVAssetPlaybackAssistant alloc] initWithAsset:asset];
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetPlaybackAssistant;
  [(AVAssetPlaybackAssistant *)&v3 dealloc];
}

- (id)_playbackConfigurationOptions
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v56 = self;
  if (objc_opt_isKindOfClass())
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    obuint64_t j = (id)[(AVAsset *)self->_asset variants];
    CFStringRef v74 = (CFStringRef)[obj countByEnumeratingWithState:&v98 objects:v107 count:16];
    int v3 = 0;
    int v4 = 0;
    if (v74)
    {
      CFStringRef v72 = *(CFStringRef *)v99;
      do
      {
        for (CFStringRef i = 0; i != v74; CFStringRef i = (CFStringRef)((char *)i + 1))
        {
          if (*(CFStringRef *)v99 != v72) {
            objc_enumerationMutation(obj);
          }
          objc_super v6 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          v7 = objc_msgSend((id)objc_msgSend(v6, "videoAttributes"), "videoLayoutAttributes");
          uint64_t v8 = [v7 countByEnumeratingWithState:&v94 objects:v106 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            id v70 = v6;
            CFStringRef extensionKey = i;
            int v10 = 0;
            int v11 = 0;
            uint64_t v12 = *(void *)v95;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v95 != v12) {
                  objc_enumerationMutation(v7);
                }
                v14 = *(void **)(*((void *)&v94 + 1) + 8 * j);
                v10 |= [v14 stereoViewComponents] == 3;
                v11 |= [v14 packingType] == 1852796517;
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v94 objects:v106 count:16];
            }
            while (v9);
            if (v10 & v11)
            {
              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              v15 = objc_msgSend((id)objc_msgSend(v70, "videoAttributes"), "codecTypes");
              uint64_t v16 = [v15 countByEnumeratingWithState:&v90 objects:v105 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v91;
                do
                {
                  for (uint64_t k = 0; k != v17; ++k)
                  {
                    if (*(void *)v91 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    if (isSupportedStereoMultiviewCodec([*(id *)(*((void *)&v90 + 1) + 8 * k) unsignedIntValue]))
                    {
                      int v3 = 1;
                      int v4 = 1;
                    }
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v90 objects:v105 count:16];
                }
                while (v17);
              }
            }
            if (v11) {
              int v20 = v4;
            }
            else {
              int v20 = 1;
            }
            if (((v3 | v10 ^ 1) & 1) == 0) {
              int v4 = v20;
            }
            CFStringRef i = extensionKey;
          }
        }
        CFStringRef v74 = (CFStringRef)[obj countByEnumeratingWithState:&v98 objects:v107 count:16];
      }
      while (v74);
    }
    uint64_t v21 = v4 & 1;
  }
  else
  {
    int v3 = 0;
    uint64_t v21 = 0;
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v57 = [(AVAsset *)v56->_asset tracksWithMediaType:@"vide"];
  uint64_t v59 = [(NSArray *)v57 countByEnumeratingWithState:&v86 objects:v104 count:16];
  if (!v59)
  {
    char obja = 0;
    goto LABEL_76;
  }
  char obja = 0;
  uint64_t v58 = *(void *)v87;
  CFStringRef extensionKeya = (const __CFString *)*MEMORY[0x1E4F21620];
  CFPropertyListRef v22 = (CFPropertyListRef)*MEMORY[0x1E4F1CFD0];
  CFStringRef v75 = (const __CFString *)*MEMORY[0x1E4F21628];
  CFStringRef v73 = (const __CFString *)*MEMORY[0x1E4F21668];
  uint64_t v67 = *MEMORY[0x1E4F21698];
  uint64_t v62 = *MEMORY[0x1E4F216A0];
  CFStringRef v66 = (const __CFString *)*MEMORY[0x1E4F1EDE8];
  CFStringRef v65 = (const __CFString *)*MEMORY[0x1E4F1EE30];
  CFStringRef v64 = (const __CFString *)*MEMORY[0x1E4F1EDE0];
  CFStringRef v63 = (const __CFString *)*MEMORY[0x1E4F21648];
  uint64_t v61 = *MEMORY[0x1E4F21690];
  do
  {
    uint64_t v23 = 0;
    do
    {
      if (*(void *)v87 != v58) {
        objc_enumerationMutation(v57);
      }
      uint64_t v60 = v23;
      v24 = (void *)[*(id *)(*((void *)&v86 + 1) + 8 * v23) formatDescriptions];
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v71 = v24;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v82 objects:v103 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v83;
        do
        {
          for (uint64_t m = 0; m != v26; ++m)
          {
            if (*(void *)v83 != v27) {
              objc_enumerationMutation(v71);
            }
            v29 = *(const opaqueCMFormatDescription **)(*((void *)&v82 + 1) + 8 * m);
            if (v29)
            {
              CFPropertyListRef Extension = CMFormatDescriptionGetExtension(*(CMFormatDescriptionRef *)(*((void *)&v82 + 1) + 8 * m), extensionKeya);
              CFPropertyListRef v31 = CMFormatDescriptionGetExtension(v29, v75);
              BOOL v33 = Extension == v22 && v31 == v22;
              FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v29);
              v35 = (void *)CMFormatDescriptionGetExtension(v29, v73);
              if (v35
                && ((v36 = v35, [v35 isEqual:v67])
                 || ([v36 isEqual:v62] & 1) != 0))
              {
                uint64_t v21 = v33 | v21;
LABEL_58:
                if ((v3 & 1) == 0)
                {
LABEL_57:
                  int v3 = 0;
                  continue;
                }
              }
              else
              {
                if (!isSupportedStereoMultiviewCodec(MediaSubType)) {
                  goto LABEL_58;
                }
                BOOL v37 = FigVideoFormatDescriptionContainsStereoMultiviewVideo() != 0;
                uint64_t v21 = v37 | v21;
                if (((v37 | v3) & 1) == 0) {
                  goto LABEL_57;
                }
              }
              uint64_t v38 = v21;
              CFPropertyListRef v39 = CMFormatDescriptionGetExtension(v29, v66);
              CFPropertyListRef v40 = CMFormatDescriptionGetExtension(v29, v65);
              CFPropertyListRef v41 = CMFormatDescriptionGetExtension(v29, v64);
              v42 = (void *)CMFormatDescriptionGetExtension(v29, v63);
              if (v42) {
                char v43 = [v42 isEqual:v61];
              }
              else {
                char v43 = 1;
              }
              char obja = 0;
              if (v33 && v39 && v40)
              {
                if (v41) {
                  char v44 = v43;
                }
                else {
                  char v44 = 0;
                }
                char obja = v44;
              }
              uint64_t v21 = v38;
              int v3 = 1;
              continue;
            }
          }
          uint64_t v26 = [v71 countByEnumeratingWithState:&v82 objects:v103 count:16];
        }
        while (v26);
      }
      uint64_t v23 = v60 + 1;
    }
    while (v60 + 1 != v59);
    uint64_t v59 = [(NSArray *)v57 countByEnumeratingWithState:&v86 objects:v104 count:16];
  }
  while (v59);
LABEL_76:
  v45 = [(AVAsset *)v56->_asset metadata];
  if ([(NSArray *)v45 count])
  {
    v46 = +[AVMetadataItem metadataItemsFromArray:v45 filteredByIdentifier:@"mdta/com.apple.private.content-type"];
    if ([(NSArray *)v46 count]
      && (long long v80 = 0u,
          long long v81 = 0u,
          long long v78 = 0u,
          long long v79 = 0u,
          (uint64_t v47 = [(NSArray *)v46 countByEnumeratingWithState:&v78 objects:v102 count:16]) != 0))
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v79;
      while (2)
      {
        for (uint64_t n = 0; n != v48; ++n)
        {
          if (*(void *)v79 != v49) {
            objc_enumerationMutation(v46);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * n), "stringValue"), "isEqualToString:", @"Fully Immersive"))
          {
            int v51 = 1;
            goto LABEL_90;
          }
        }
        uint64_t v48 = [(NSArray *)v46 countByEnumeratingWithState:&v78 objects:v102 count:16];
        int v51 = 0;
        if (v48) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v51 = 0;
    }
LABEL_90:
    if ([(NSArray *)+[AVMetadataItem metadataItemsFromArray:v45 filteredByIdentifier:@"mdta/com.apple.quicktime.aime-data"] count])
    {
      int v52 = 1;
    }
    else
    {
      int v52 = v51;
    }
  }
  else
  {
    int v52 = 0;
  }
  v53 = (void *)[MEMORY[0x1E4F1CA48] array];
  v54 = v53;
  if ((v21 & 1) == 0)
  {
    if ((v3 & 1) == 0) {
      goto LABEL_95;
    }
LABEL_101:
    [v54 addObject:@"AVAssetPlaybackConfigurationOptionStereoMultiviewVideo"];
    if (!v52) {
      goto LABEL_97;
    }
LABEL_96:
    [v54 addObject:@"AVAssetPlaybackConfigurationOptionAppleImmersiveVideo"];
    goto LABEL_97;
  }
  [v53 addObject:@"AVAssetPlaybackConfigurationOptionStereoVideo"];
  if (v3) {
    goto LABEL_101;
  }
LABEL_95:
  if (v52) {
    goto LABEL_96;
  }
LABEL_97:
  if (obja) {
    [v54 addObject:@"AVAssetPlaybackConfigurationOptionSpatialVideo"];
  }
  return v54;
}

- (void)loadPlaybackConfigurationOptionsWithCompletionHandler:(void *)completionHandler
{
  asset = self->_asset;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__AVAssetPlaybackAssistant_loadPlaybackConfigurationOptionsWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E57B4540;
  v4[4] = self;
  v4[5] = completionHandler;
  [(AVAsset *)asset loadValuesAsynchronouslyForKeys:&unk_1EE5E1A58 completionHandler:v4];
}

uint64_t __82__AVAssetPlaybackAssistant_loadPlaybackConfigurationOptionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) _playbackConfigurationOptions];
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

@end