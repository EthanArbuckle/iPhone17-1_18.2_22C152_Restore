@interface HMSoftwareUpdateDocumentation(Asset)
- (id)initWithAsset:()Asset;
@end

@implementation HMSoftwareUpdateDocumentation(Asset)

- (id)initWithAsset:()Asset
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 bundleURL];

  if (v5)
  {
    char v74 = 0;
    v6 = [v4 fileManager];
    v7 = [v4 bundleURL];
    v8 = [v7 path];
    char v9 = [v6 fileExistsAtPath:v8 isDirectory:&v74];

    if (v9)
    {
      if (v74 || ![v4 extractionEnteredPassThrough])
      {
        id v19 = 0;
      }
      else
      {
        v10 = (void *)MEMORY[0x230FBD990]();
        id v11 = a1;
        v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = HMFGetLogIdentifier();
          v14 = [v4 bundleURL];
          *(_DWORD *)buf = 138543618;
          v76 = v13;
          __int16 v77 = 2112;
          id v78 = v14;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Unarchiving the non-streamable asset: %@", buf, 0x16u);
        }
        v15 = [v4 fileManager];
        v16 = [v4 bundleURL];
        v17 = [v4 bundleURL];
        id v73 = 0;
        char v18 = [v15 unzipItemAtURL:v16 toURL:v17 error:&v73];
        id v19 = v73;

        if ((v18 & 1) == 0)
        {
          v20 = (void *)MEMORY[0x230FBD990]();
          a1 = v11;
          v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = HMFGetLogIdentifier();
            v23 = [v4 bundleURL];
            *(_DWORD *)buf = 138543874;
            v76 = v22;
            __int16 v77 = 2112;
            id v78 = v23;
            __int16 v79 = 2112;
            id v80 = v19;
            _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive contents of asset: %@ with error: %@", buf, 0x20u);
          }

          goto LABEL_17;
        }
      }
      v30 = [v4 fileManager];
      v31 = [v4 bundleURL];
      id v72 = v19;
      v32 = [v30 contentsOfDirectoryAtURL:v31 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:4 error:&v72];
      id v33 = v72;

      if (![v32 count])
      {
        v43 = (void *)MEMORY[0x230FBD990]();
        a1 = a1;
        v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v76 = v45;
          __int16 v77 = 2112;
          id v78 = v33;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@No release notes found. Error: %@", buf, 0x16u);
        }
        id v29 = 0;
        goto LABEL_46;
      }
      v34 = [MEMORY[0x263F08A98] predicateWithFormat:@"self.lastPathComponent MATCHES %@", @"(^[a-z]{2}(-|_)[A-Za-z0-9]+).txt"];
      v35 = [v32 filteredArrayUsingPredicate:v34];
      if (![v35 count])
      {
        v46 = (void *)MEMORY[0x230FBD990]();
        a1 = a1;
        v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v76 = v48;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@No valid release notes found.", buf, 0xCu);
        }
        id v29 = 0;
        goto LABEL_45;
      }
      v64 = v34;
      v36 = [MEMORY[0x263EFF960] currentLocale];
      v37 = [v36 languageCode];

      v38 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v39 = [v38 localeIdentifier];

      v40 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v41 = [v40 languageIdentifier];

      if (v39 | v41)
      {
        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = __54__HMSoftwareUpdateDocumentation_Asset__initWithAsset___block_invoke;
        v69[3] = &unk_264A235B8;
        id v70 = (id)v41;
        id v71 = (id)v39;
        v42 = objc_msgSend(v35, "na_firstObjectPassingTest:", v69);
      }
      else
      {
        v42 = 0;
      }
      if (!v42 && v37)
      {
        v67[0] = MEMORY[0x263EF8330];
        v67[1] = 3221225472;
        v67[2] = __54__HMSoftwareUpdateDocumentation_Asset__initWithAsset___block_invoke_2;
        v67[3] = &unk_264A235E0;
        id v68 = v37;
        v42 = objc_msgSend(v35, "na_firstObjectPassingTest:", v67);
      }
      v62 = (void *)v41;
      v63 = (void *)v39;
      if (v42
        || (objc_msgSend(v35, "na_firstObjectPassingTest:", &__block_literal_global_173856),
            (v42 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v49 = [v4 testDocumentData];

        id v50 = objc_alloc(MEMORY[0x263F0E658]);
        if (v49)
        {
          v51 = [v4 testDocumentData];
          id v66 = v33;
          v52 = &v66;
          uint64_t v53 = [v50 initWithData:v51 error:&v66];
        }
        else
        {
          v51 = [v4 fileManager];
          id v65 = v33;
          v52 = &v65;
          uint64_t v53 = [v50 initWithURL:v42 fileManager:v51 error:&v65];
        }
        v54 = (void *)v53;
        id v55 = *v52;

        if (v54)
        {
          a1 = (id)[a1 initWithReleaseNotesSummary:0 releaseNotes:0 textReleaseNotes:v54 licenseAgreement:0 licenseAgreementVersion:0];

          id v33 = v55;
          id v29 = a1;
LABEL_44:

          v34 = v64;
LABEL_45:

LABEL_46:
          goto LABEL_47;
        }
        id v33 = v55;
      }
      v56 = (void *)MEMORY[0x230FBD990]();
      id v57 = v4;
      v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v59 = v61 = v37;
        *(_DWORD *)buf = 138543874;
        v76 = v59;
        __int16 v77 = 2112;
        id v78 = v42;
        __int16 v79 = 2112;
        id v80 = v33;
        _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@Unable to load release note document, %@, with error: %@", buf, 0x20u);

        v37 = v61;
      }

      id v29 = 0;
      goto LABEL_44;
    }
    v24 = (void *)MEMORY[0x230FBD990]();
    a1 = a1;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      v27 = [v4 bundleURL];
      v28 = [v27 path];
      *(_DWORD *)buf = 138543618;
      v76 = v26;
      __int16 v77 = 2112;
      id v78 = v28;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@No asset in path: %@", buf, 0x16u);

      goto LABEL_15;
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x230FBD990]();
    a1 = a1;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v76 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@The asset url is required", buf, 0xCu);
LABEL_15:
    }
  }

LABEL_17:
  id v29 = 0;
LABEL_47:

  return v29;
}

@end