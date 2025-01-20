@interface HMSoftwareUpdateDocumentation
+ (BOOL)supportsSecureCoding;
+ (id)localizationsForBundle:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMHTMLDocument)licenseAgreement;
- (HMHTMLDocument)releaseNotes;
- (HMHTMLDocument)releaseNotesSummary;
- (HMPlainTextDocument)textReleaseNotes;
- (HMSoftwareUpdateDocumentation)init;
- (HMSoftwareUpdateDocumentation)initWithBundle:(id)a3;
- (HMSoftwareUpdateDocumentation)initWithCoder:(id)a3;
- (HMSoftwareUpdateDocumentation)initWithReleaseNotesSummary:(id)a3 releaseNotes:(id)a4 textReleaseNotes:(id)a5 licenseAgreement:(id)a6 licenseAgreementVersion:(id)a7;
- (NSNumber)licenseAgreementVersion;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMSoftwareUpdateDocumentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_licenseAgreementVersion, 0);
  objc_storeStrong((id *)&self->_licenseAgreement, 0);
  objc_storeStrong((id *)&self->_textReleaseNotes, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);

  objc_storeStrong((id *)&self->_releaseNotesSummary, 0);
}

- (NSNumber)licenseAgreementVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (HMHTMLDocument)licenseAgreement
{
  return (HMHTMLDocument *)objc_getProperty(self, a2, 32, 1);
}

- (HMPlainTextDocument)textReleaseNotes
{
  return (HMPlainTextDocument *)objc_getProperty(self, a2, 24, 1);
}

- (HMHTMLDocument)releaseNotes
{
  return (HMHTMLDocument *)objc_getProperty(self, a2, 16, 1);
}

- (HMHTMLDocument)releaseNotesSummary
{
  return (HMHTMLDocument *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMSoftwareUpdateDocumentation *)self releaseNotesSummary];
  [v4 encodeObject:v5 forKey:@"HM.summary"];

  v6 = [(HMSoftwareUpdateDocumentation *)self releaseNotes];
  [v4 encodeObject:v6 forKey:@"HM.releaseNotes"];

  v7 = [(HMSoftwareUpdateDocumentation *)self textReleaseNotes];
  [v4 encodeObject:v7 forKey:@"HM.textReleaseNotes"];

  v8 = [(HMSoftwareUpdateDocumentation *)self licenseAgreement];
  [v4 encodeObject:v8 forKey:@"HM.licenseAgreement"];

  id v9 = [(HMSoftwareUpdateDocumentation *)self licenseAgreementVersion];
  [v4 encodeObject:v9 forKey:@"HM.slaVersion"];
}

- (HMSoftwareUpdateDocumentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.summary"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.releaseNotes"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.textReleaseNotes"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.licenseAgreement"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.slaVersion"];

  v10 = [(HMSoftwareUpdateDocumentation *)self initWithReleaseNotesSummary:v5 releaseNotes:v6 textReleaseNotes:v7 licenseAgreement:v8 licenseAgreementVersion:v9];
  return v10;
}

- (id)description
{
  return __secureDescription(self, 1);
}

- (id)debugDescription
{
  return __secureDescription(self, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMSoftwareUpdateDocumentation *)a3;
  if (self == v4)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (!v6) {
      goto LABEL_11;
    }
    v7 = [(HMSoftwareUpdateDocumentation *)self releaseNotesSummary];
    v8 = [(HMSoftwareUpdateDocumentation *)v6 releaseNotesSummary];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_11;
    }
    v10 = [(HMSoftwareUpdateDocumentation *)self releaseNotes];
    v11 = [(HMSoftwareUpdateDocumentation *)v6 releaseNotes];
    int v12 = HMFEqualObjects();

    if (!v12) {
      goto LABEL_11;
    }
    v13 = [(HMSoftwareUpdateDocumentation *)self textReleaseNotes];
    v14 = [(HMSoftwareUpdateDocumentation *)v6 textReleaseNotes];
    int v15 = HMFEqualObjects();

    if (!v15) {
      goto LABEL_11;
    }
    v16 = [(HMSoftwareUpdateDocumentation *)self licenseAgreement];
    v17 = [(HMSoftwareUpdateDocumentation *)v6 licenseAgreement];
    int v18 = HMFEqualObjects();

    if (v18)
    {
      v19 = [(HMSoftwareUpdateDocumentation *)self licenseAgreementVersion];
      v20 = [(HMSoftwareUpdateDocumentation *)v6 licenseAgreementVersion];
      char v21 = HMFEqualObjects();
    }
    else
    {
LABEL_11:
      char v21 = 0;
    }
  }
  return v21;
}

- (unint64_t)hash
{
  v3 = [(HMSoftwareUpdateDocumentation *)self releaseNotesSummary];
  uint64_t v4 = [v3 hash];
  v5 = [(HMSoftwareUpdateDocumentation *)self releaseNotes];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HMSoftwareUpdateDocumentation *)self textReleaseNotes];
  uint64_t v8 = [v7 hash];
  int v9 = [(HMSoftwareUpdateDocumentation *)self licenseAgreement];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(HMSoftwareUpdateDocumentation *)self licenseAgreementVersion];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (HMSoftwareUpdateDocumentation)initWithReleaseNotesSummary:(id)a3 releaseNotes:(id)a4 textReleaseNotes:(id)a5 licenseAgreement:(id)a6 licenseAgreementVersion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)HMSoftwareUpdateDocumentation;
  v17 = [(HMSoftwareUpdateDocumentation *)&v31 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    releaseNotesSummary = v17->_releaseNotesSummary;
    v17->_releaseNotesSummary = (HMHTMLDocument *)v18;

    uint64_t v20 = [v13 copy];
    releaseNotes = v17->_releaseNotes;
    v17->_releaseNotes = (HMHTMLDocument *)v20;

    uint64_t v22 = [v14 copy];
    textReleaseNotes = v17->_textReleaseNotes;
    v17->_textReleaseNotes = (HMPlainTextDocument *)v22;

    uint64_t v24 = [v15 copy];
    licenseAgreement = v17->_licenseAgreement;
    v17->_licenseAgreement = (HMHTMLDocument *)v24;

    uint64_t v26 = [v16 copy];
    licenseAgreementVersion = v17->_licenseAgreementVersion;
    v17->_licenseAgreementVersion = (NSNumber *)v26;

    uint64_t v28 = [v12 copy];
    v29 = v17->_releaseNotesSummary;
    v17->_releaseNotesSummary = (HMHTMLDocument *)v28;
  }
  return v17;
}

- (HMSoftwareUpdateDocumentation)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMSoftwareUpdateDocumentation)initWithBundle:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = __resourceBundleForBundle(v4);
    id v7 = v6;
    if (!v6)
    {
      v30 = (void *)MEMORY[0x19F3A64A0]();
      objc_super v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v70 = v32;
        __int16 v71 = 2112;
        v72 = v5;
        _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid bundle: %@", buf, 0x16u);
      }
      uint64_t v26 = 0;
      goto LABEL_46;
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F28B50];
    int v9 = [v6 localizations];
    uint64_t v10 = [v8 preferredLocalizationsFromArray:v9];

    if (![v10 count])
    {

      uint64_t v10 = &unk_1EEF08F78;
    }
    v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v70 = v14;
      __int16 v71 = 2112;
      v72 = v10;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Parsing using preferred localizations: %@", buf, 0x16u);
    }
    id v15 = __htmlDocumentForResource(v7, v10, @"ReadMeSummary");
    id v16 = __htmlDocumentForResource(v7, v10, @"ReadMe");
    v57 = __htmlDocumentForResource(v7, v10, @"License");
    id v17 = v7;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v18 = v10;
    v19 = (HMPlainTextDocument *)[v18 countByEnumeratingWithState:&v59 objects:buf count:16];
    if (v19)
    {
      v52 = v12;
      v54 = v16;
      v51 = v15;
      uint64_t v20 = *(void *)v60;
      while (2)
      {
        for (i = 0; i != v19; i = (HMPlainTextDocument *)((char *)i + 1))
        {
          if (*(void *)v60 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = [v17 URLForResource:@"ReadMe" withExtension:@"txt" subdirectory:0 localization:*(void *)(*((void *)&v59 + 1) + 8 * i)];
          if (v22)
          {
            v27 = (void *)v22;
            id v58 = 0;
            v19 = [[HMPlainTextDocument alloc] initWithURL:v22 error:&v58];
            id v28 = v58;
            if (v19)
            {
              v29 = v19;
              id v15 = v51;
              id v12 = v52;
            }
            else
            {
              context = (void *)MEMORY[0x19F3A64A0]();
              v33 = HMFGetOSLogHandle();
              id v15 = v51;
              id v12 = v52;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                v49 = HMFGetLogIdentifier();
                v48 = [v27 path];
                *(_DWORD *)v63 = 138543874;
                v64 = v49;
                __int16 v65 = 2112;
                v66 = v48;
                __int16 v67 = 2112;
                id v68 = v28;
                _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_INFO, "%{public}@Unable to load document, %@, with error: %@", v63, 0x20u);
              }
            }

            goto LABEL_28;
          }
        }
        v19 = (HMPlainTextDocument *)[v18 countByEnumeratingWithState:&v59 objects:buf count:16];
        if (v19) {
          continue;
        }
        break;
      }
      id v15 = v51;
      id v12 = v52;
LABEL_28:
      id v16 = v54;
    }

    if (v16 && v19)
    {
      v34 = (void *)MEMORY[0x19F3A64A0]();
      v35 = v12;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v37 = v55 = v16;
        *(_DWORD *)buf = 138543362;
        v70 = v37;
        _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Both html and text release notes provided, using text notes", buf, 0xCu);

        id v16 = v55;
      }

      id v16 = 0;
      id v15 = 0;
    }
    if (!v57)
    {
      v41 = 0;
LABEL_45:
      self = -[HMSoftwareUpdateDocumentation initWithReleaseNotesSummary:releaseNotes:textReleaseNotes:licenseAgreement:licenseAgreementVersion:](v12, "initWithReleaseNotesSummary:releaseNotes:textReleaseNotes:licenseAgreement:licenseAgreementVersion:", v15, v16, v19, v57, v41, v48);

      uint64_t v26 = self;
LABEL_46:

      goto LABEL_47;
    }
    v56 = v16;
    v38 = [v5 infoDictionary];
    v39 = objc_msgSend(v38, "hmf_dictionaryForKey:", @"MobileAssetProperties");
    v40 = v39;
    if (v39)
    {
      v41 = objc_msgSend(v39, "hmf_numberForKey:", @"SUSLAVersionRequired");
      if (v41)
      {
LABEL_44:

        id v16 = v56;
        goto LABEL_45;
      }
      v53 = (void *)MEMORY[0x19F3A64A0]();
      v42 = v12;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v70 = v44;
        __int16 v71 = 2112;
        v72 = v40;
        v45 = "%{public}@Missing SLA version from asset properties: %@";
LABEL_42:
        _os_log_impl(&dword_19D1A8000, v43, OS_LOG_TYPE_ERROR, v45, buf, 0x16u);
      }
    }
    else
    {
      v53 = (void *)MEMORY[0x19F3A64A0]();
      v46 = v12;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v70 = v44;
        __int16 v71 = 2112;
        v72 = v38;
        v45 = "%{public}@Missing asset properties from asset info: %@";
        goto LABEL_42;
      }
    }

    v41 = 0;
    goto LABEL_44;
  }
  v23 = (void *)MEMORY[0x19F3A64A0]();
  self = self;
  uint64_t v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v70 = v25;
    _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@The bundle parameter is required", buf, 0xCu);
  }
  uint64_t v26 = 0;
LABEL_47:

  return v26;
}

+ (id)localizationsForBundle:(id)a3
{
  uint64_t v3 = __resourceBundleForBundle(a3);
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