@interface PHPTPUtilities
+ (BOOL)shouldExpungeAsset:(id)a3;
+ (BOOL)shouldExpungeAsset:(id)a3 withFileManager:(id)a4;
@end

@implementation PHPTPUtilities

+ (BOOL)shouldExpungeAsset:(id)a3 withFileManager:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 ptpProperties];
  uint64_t v6 = [v5 ptpTrashedState];

  v7 = PLPTPGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [v4 objectID];
    objc_msgSend(v8, "pl_shortURI");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v97 = v9;
    __int16 v98 = 2048;
    v99 = (__CFString *)v6;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Asset %{public}@ trashed state: 0x%llx", buf, 0x16u);
  }
  BOOL v10 = 1;
  +[PHAssetResource assetResourcesForAsset:v4 includeDerivatives:0 includeMetadata:0 includeAdjustmentOverflowDataBlob:1];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v91 objects:v95 count:16];
  if (!v12) {
    goto LABEL_124;
  }
  uint64_t v13 = v12;
  v89 = v4;
  if ((v6 & 0x10000) != 0) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  uint64_t v15 = *(void *)v92;
  if ((v6 & 0x8000) != 0) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  v75 = v16;
  v76 = v14;
  if ((v6 & 0x4000) != 0) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  if ((v6 & 0x100) != 0) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  v87 = v18;
  v88 = v17;
  if ((v6 & 0x80) != 0) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  if ((v6 & 2) != 0) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  v85 = v20;
  v86 = v19;
  if ((v6 & 0x2000) != 0) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  if ((v6 & 0x40) != 0) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  v83 = v22;
  v84 = v21;
  if ((v6 & 0x1000) != 0) {
    v23 = @"YES";
  }
  else {
    v23 = @"NO";
  }
  if ((v6 & 0x800) != 0) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  v81 = v24;
  v82 = v23;
  if ((v6 & 0x400) != 0) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  if ((v6 & 0x200) != 0) {
    v26 = @"YES";
  }
  else {
    v26 = @"NO";
  }
  v79 = v26;
  v80 = v25;
  if ((v6 & 8) != 0) {
    v27 = @"YES";
  }
  else {
    v27 = @"NO";
  }
  if ((v6 & 4) != 0) {
    v28 = @"YES";
  }
  else {
    v28 = @"NO";
  }
  v77 = v28;
  v78 = v27;
  if (v6) {
    v29 = @"YES";
  }
  else {
    v29 = @"NO";
  }
  v90 = v29;
  while (2)
  {
    uint64_t v30 = 0;
LABEL_51:
    if (*(void *)v92 != v15) {
      objc_enumerationMutation(v11);
    }
    v31 = *(void **)(*((void *)&v91 + 1) + 8 * v30);
    uint64_t v32 = [v31 type];
    char v33 = 1;
    switch(v32)
    {
      case 1:
      case 2:
        v38 = PLPTPGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"OriginalTrashed";
          __int16 v98 = 2112;
          v99 = v90;
          v39 = v90;
          _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if (v6) {
          goto LABEL_115;
        }
        goto LABEL_122;
      case 3:
        v40 = PLPTPGetLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"AudioTrashed";
          __int16 v98 = 2112;
          v99 = v79;
          v41 = v79;
          _os_log_impl(&dword_19B043000, v40, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 0x200) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 4:
        v42 = PLPTPGetLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"AlternateImageTrashed";
          __int16 v98 = 2112;
          v99 = v81;
          v43 = v81;
          _os_log_impl(&dword_19B043000, v42, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 0x800) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 5:
        v44 = PLPTPGetLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"AdjustedImageTrashed";
          __int16 v98 = 2112;
          v99 = v77;
          v45 = v77;
          _os_log_impl(&dword_19B043000, v44, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 4) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 6:
        v46 = PLPTPGetLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"AdjustedVideoTrashed";
          __int16 v98 = 2112;
          v99 = v78;
          v47 = v78;
          _os_log_impl(&dword_19B043000, v46, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 8) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 7:
        v48 = PLPTPGetLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"AdjutmentDataTrashed";
          __int16 v98 = 2112;
          v99 = v85;
          v49 = v85;
          _os_log_impl(&dword_19B043000, v48, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 2) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 8:
        v50 = PLPTPGetLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"AdjustmentBasePhotoTrashed";
          __int16 v98 = 2112;
          v99 = v86;
          v51 = v86;
          _os_log_impl(&dword_19B043000, v50, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 0x80) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 9:
        v52 = PLPTPGetLog();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"PairedVideoTrashed";
          __int16 v98 = 2112;
          v99 = v82;
          v53 = v82;
          _os_log_impl(&dword_19B043000, v52, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 0x1000) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 10:
        v54 = PLPTPGetLog();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"AdjustedPairedVideoTrashed";
          __int16 v98 = 2112;
          v99 = v80;
          v55 = v80;
          _os_log_impl(&dword_19B043000, v54, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 0x400) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 11:
        v56 = PLPTPGetLog();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"AdjustmentBasePairedVideoTrashed";
          __int16 v98 = 2112;
          v99 = v88;
          v57 = v88;
          _os_log_impl(&dword_19B043000, v56, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 0x4000) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 12:
        v58 = PLPTPGetLog();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"AdjustmentBaseVideoTrashed";
          __int16 v98 = 2112;
          v99 = v87;
          v59 = v87;
          _os_log_impl(&dword_19B043000, v58, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 0x100) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 13:
      case 14:
      case 15:
      case 19:
      case 20:
        goto LABEL_54;
      case 16:
        v60 = PLPTPGetLog();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"OriginalAdjustmentDataTrashed";
          __int16 v98 = 2112;
          v99 = v83;
          v61 = v83;
          _os_log_impl(&dword_19B043000, v60, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 0x40) == 0) {
          goto LABEL_122;
        }
        goto LABEL_115;
      case 17:
        v62 = PLPTPGetLog();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"XMPTrashed";
          __int16 v98 = 2112;
          v99 = v84;
          v63 = v84;
          _os_log_impl(&dword_19B043000, v62, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        if ((v6 & 0x2000) != 0) {
          goto LABEL_115;
        }
        goto LABEL_122;
      case 18:
        goto LABEL_130;
      default:
        if (v32 != 110)
        {
          if (v32 != 113)
          {
LABEL_130:
            v71 = PLPTPGetLog();
            id v4 = v89;
            if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
            {
              uint64_t v72 = [v31 type];
              v73 = [v89 objectID];
              objc_msgSend(v73, "pl_shortURI");
              v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v97 = (__CFString *)v72;
              __int16 v98 = 2114;
              v99 = v74;
              _os_log_impl(&dword_19B043000, v71, OS_LOG_TYPE_FAULT, "Unhandled resource type (%lu). Not expunging asset %{public}@.", buf, 0x16u);
            }
            BOOL v10 = 0;
            goto LABEL_124;
          }
          v36 = PLPTPGetLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v97 = @"DiagnosticFileTrashed";
            __int16 v98 = 2112;
            v99 = v75;
            v37 = v75;
            _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
          }
          if ((v6 & 0x8000) == 0) {
            goto LABEL_122;
          }
LABEL_115:
          if (v13 == ++v30)
          {
            uint64_t v66 = [v11 countByEnumeratingWithState:&v91 objects:v95 count:16];
            uint64_t v13 = v66;
            if (!v66)
            {
              BOOL v10 = 1;
              goto LABEL_123;
            }
            continue;
          }
          goto LABEL_51;
        }
        v64 = PLPTPGetLog();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v97 = @"AdjutmentSecondaryDataTrashed";
          __int16 v98 = 2112;
          v99 = v76;
          v65 = v76;
          _os_log_impl(&dword_19B043000, v64, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        }
        char v33 = (v6 & 0x10000) >> 16;
LABEL_54:
        v34 = PLPTPGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v35 = [v31 type];
          *(_DWORD *)buf = 134217984;
          v97 = (__CFString *)v35;
          _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
        }

        if (v33) {
          goto LABEL_115;
        }
LABEL_122:
        BOOL v10 = 0;
LABEL_123:
        id v4 = v89;
LABEL_124:

        v67 = PLPTPGetLog();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          if (v10) {
            v68 = @"YES";
          }
          else {
            v68 = @"NO";
          }
          *(_DWORD *)buf = 138412290;
          v97 = v68;
          v69 = v68;
          _os_log_impl(&dword_19B043000, v67, OS_LOG_TYPE_DEBUG, "shouldExpunge: %@", buf, 0xCu);
        }
        return v10;
    }
  }
}

+ (BOOL)shouldExpungeAsset:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28CB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultManager];
  LOBYTE(a1) = [a1 shouldExpungeAsset:v5 withFileManager:v6];

  return (char)a1;
}

@end