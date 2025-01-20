@interface HMSoftwareUpdateDocumentation(NSBundle)
+ (id)localizationsForBundle:()NSBundle;
- (id)initWithBundle:()NSBundle;
@end

@implementation HMSoftwareUpdateDocumentation(NSBundle)

- (id)initWithBundle:()NSBundle
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = __resourceBundleForBundle(v4);
    v7 = v6;
    if (!v6)
    {
      v31 = (void *)MEMORY[0x1D9452090]();
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v94 = v33;
        __int16 v95 = 2112;
        v96 = v5;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid bundle: %@", buf, 0x16u);
      }
      id v27 = 0;
      goto LABEL_40;
    }
    v8 = (void *)MEMORY[0x1E4F28B50];
    v9 = [v6 localizations];
    v10 = [v8 preferredLocalizationsFromArray:v9];

    if (![v10 count])
    {

      v10 = &unk_1F2DC6EE0;
    }
    v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = a1;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v94 = v14;
      __int16 v95 = 2112;
      v96 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Parsing using preferred localizations: %@", buf, 0x16u);
    }
    v15 = __htmlDocumentForResource(v7, v10, @"ReadMeSummary");
    v16 = __htmlDocumentForResource(v7, v10, @"ReadMe");
    v17 = __htmlDocumentForResource(v7, v10, @"License");
    id v18 = v7;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v19 = v10;
    v20 = (void *)[v19 countByEnumeratingWithState:&v83 objects:buf count:16];
    if (v20)
    {
      v73 = v17;
      v76 = v16;
      v78 = v15;
      id v80 = v12;
      uint64_t v21 = *(void *)v84;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v84 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = [v18 URLForResource:@"ReadMe" withExtension:@"txt" subdirectory:0 localization:*(void *)(*((void *)&v83 + 1) + 8 * i)];
          if (v23)
          {
            v28 = (void *)v23;
            id v82 = 0;
            v20 = (void *)[objc_alloc(MEMORY[0x1E4F2EA18]) initWithURL:v23 error:&v82];
            id v29 = v82;
            if (v20)
            {
              id v30 = v20;
              v15 = v78;
              id v12 = v80;
            }
            else
            {
              v34 = (void *)MEMORY[0x1D9452090]();
              v35 = HMFGetOSLogHandle();
              v15 = v78;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                contexta = HMFGetLogIdentifier();
                [v28 path];
                v36 = v70 = v34;
                *(_DWORD *)v87 = 138543874;
                v88 = contexta;
                __int16 v89 = 2112;
                v90 = v36;
                __int16 v91 = 2112;
                id v92 = v29;
                _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Unable to load document, %@, with error: %@", v87, 0x20u);

                v34 = v70;
              }

              id v12 = v80;
            }

            goto LABEL_28;
          }
        }
        v20 = (void *)[v19 countByEnumeratingWithState:&v83 objects:buf count:16];
        if (v20) {
          continue;
        }
        break;
      }
      v15 = v78;
      id v12 = v80;
LABEL_28:
      v17 = v73;
      v16 = v76;
    }

    v81 = v20;
    if (v16 && v20)
    {
      v37 = v16;
      v38 = (void *)MEMORY[0x1D9452090]();
      id v39 = v12;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v74 = v7;
        v41 = v5;
        v42 = v17;
        v43 = v15;
        v45 = id v44 = v12;
        *(_DWORD *)buf = 138543362;
        v94 = v45;
        _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Both html and text release notes provided, using text notes", buf, 0xCu);

        id v12 = v44;
        v15 = v43;
        v17 = v42;
        v5 = v41;
        v7 = v74;
      }

      v16 = 0;
      v15 = 0;
      v20 = v81;
    }
    if (!v17)
    {
      v50 = 0;
      goto LABEL_39;
    }
    v46 = v17;
    v47 = [v5 infoDictionary];
    v48 = objc_msgSend(v47, "hmf_dictionaryForKey:", @"MobileAssetProperties");
    v49 = v48;
    if (v48)
    {
      v50 = objc_msgSend(v48, "hmf_numberForKey:", @"SUSLAVersionRequired");
      if (v50)
      {
LABEL_37:

        v17 = v46;
        v20 = v81;
LABEL_39:
        a1 = (id)[v12 initWithReleaseNotesSummary:v15 releaseNotes:v16 textReleaseNotes:v20 licenseAgreement:v17 licenseAgreementVersion:v50];

        id v27 = a1;
LABEL_40:

        goto LABEL_41;
      }
      v75 = v7;
      v77 = v16;
      v79 = v15;
      v63 = (void *)MEMORY[0x1D9452090]();
      id v53 = v12;
      id v64 = v12;
      v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
      {
        v66 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v94 = v66;
        _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Missing SLA version", buf, 0xCu);
      }
      v67 = [[HMDAssertionLogEvent alloc] initWithReason:@"Missing SLA version"];
      v68 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v68 submitLogEvent:v67];

      context = (void *)MEMORY[0x1D9452090]();
      id v69 = v64;
      v60 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
LABEL_51:
        id v12 = v53;
        v7 = v75;
        v16 = v77;

        v50 = 0;
        v15 = v79;
        goto LABEL_37;
      }
      v61 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v94 = v61;
      __int16 v95 = 2112;
      v96 = v49;
      v62 = "%{public}@Missing SLA version from asset properties: %@";
    }
    else
    {
      v75 = v7;
      v77 = v16;
      v79 = v15;
      v52 = (void *)MEMORY[0x1D9452090]();
      id v53 = v12;
      id v54 = v12;
      v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
      {
        v56 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v94 = v56;
        _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Missing asset properties", buf, 0xCu);
      }
      v57 = [[HMDAssertionLogEvent alloc] initWithReason:@"Missing asset properties"];
      v58 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v58 submitLogEvent:v57];

      context = (void *)MEMORY[0x1D9452090]();
      id v59 = v54;
      v60 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      v61 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v94 = v61;
      __int16 v95 = 2112;
      v96 = v47;
      v62 = "%{public}@Missing asset properites from asset info: %@";
    }
    _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_ERROR, v62, buf, 0x16u);

    goto LABEL_51;
  }
  v24 = (void *)MEMORY[0x1D9452090]();
  a1 = a1;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v94 = v26;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@The bundle parameter is required", buf, 0xCu);
  }
  id v27 = 0;
LABEL_41:

  return v27;
}

+ (id)localizationsForBundle:()NSBundle
{
  v3 = __resourceBundleForBundle(a3);
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 localizations];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

@end