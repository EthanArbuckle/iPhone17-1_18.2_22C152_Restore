@interface HKMedicalDownloadableAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFHIRVersion)FHIRVersion;
- (HKMedicalDownloadableAttachment)init;
- (HKMedicalDownloadableAttachment)initWithCoder:(id)a3;
- (HKMedicalDownloadableAttachment)initWithIdentifier:(id)a3 medicalRecordIdentifier:(id)a4 clinicalRecordIdentifier:(id)a5 accountIdentifier:(id)a6 FHIRVersion:(id)a7 type:(int64_t)a8 status:(int64_t)a9 errorStatus:(int64_t)a10 title:(id)a11 webURL:(id)a12 sizeInBytes:(id)a13 contentType:(id)a14 locale:(id)a15 expectedHash:(id)a16 creationDate:(id)a17 retryCount:(int64_t)a18 nextRetryDate:(id)a19 lastUpdatedDate:(id)a20 lastError:(id)a21 fileURL:(id)a22 inlineData:(id)a23 inlineDataChecksum:(id)a24 attachmentIdentifier:(id)a25 metadata:(id)a26;
- (NSData)expectedHash;
- (NSData)inlineData;
- (NSData)inlineDataChecksum;
- (NSDate)creationDate;
- (NSDate)lastUpdatedDate;
- (NSDate)nextRetryDate;
- (NSDictionary)metadata;
- (NSError)lastError;
- (NSLocale)locale;
- (NSNumber)sizeInBytes;
- (NSString)contentType;
- (NSString)title;
- (NSURL)fileURL;
- (NSURL)webURL;
- (NSUUID)accountIdentifier;
- (NSUUID)attachmentIdentifier;
- (NSUUID)clinicalRecordIdentifier;
- (NSUUID)identifier;
- (NSUUID)medicalRecordIdentifier;
- (id)copyForAccountWithIdentifier:(id)a3 medicalRecordIdentifier:(id)a4 clinicalRecordIdentifier:(id)a5;
- (int64_t)errorStatus;
- (int64_t)retryCount;
- (int64_t)status;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicalDownloadableAttachment

- (HKMedicalDownloadableAttachment)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicalDownloadableAttachment)initWithIdentifier:(id)a3 medicalRecordIdentifier:(id)a4 clinicalRecordIdentifier:(id)a5 accountIdentifier:(id)a6 FHIRVersion:(id)a7 type:(int64_t)a8 status:(int64_t)a9 errorStatus:(int64_t)a10 title:(id)a11 webURL:(id)a12 sizeInBytes:(id)a13 contentType:(id)a14 locale:(id)a15 expectedHash:(id)a16 creationDate:(id)a17 retryCount:(int64_t)a18 nextRetryDate:(id)a19 lastUpdatedDate:(id)a20 lastError:(id)a21 fileURL:(id)a22 inlineData:(id)a23 inlineDataChecksum:(id)a24 attachmentIdentifier:(id)a25 metadata:(id)a26
{
  id v93 = a3;
  id v92 = a4;
  id v91 = a5;
  id v90 = a6;
  id v89 = a7;
  id v30 = a11;
  id v31 = a12;
  id v32 = a13;
  id v33 = a14;
  id v34 = a15;
  id v35 = a16;
  id v36 = a17;
  id v37 = a19;
  id v38 = a20;
  id v88 = a21;
  id v87 = a22;
  id v86 = a23;
  id v85 = a24;
  id v84 = a25;
  id v83 = a26;
  v94.receiver = self;
  v94.super_class = (Class)HKMedicalDownloadableAttachment;
  v39 = [(HKMedicalDownloadableAttachment *)&v94 init];
  if (v39)
  {
    uint64_t v40 = [v93 copy];
    identifier = v39->_identifier;
    v39->_identifier = (NSUUID *)v40;

    uint64_t v42 = [v92 copy];
    medicalRecordIdentifier = v39->_medicalRecordIdentifier;
    v39->_medicalRecordIdentifier = (NSUUID *)v42;

    uint64_t v44 = [v91 copy];
    clinicalRecordIdentifier = v39->_clinicalRecordIdentifier;
    v39->_clinicalRecordIdentifier = (NSUUID *)v44;

    uint64_t v46 = [v90 copy];
    accountIdentifier = v39->_accountIdentifier;
    v39->_accountIdentifier = (NSUUID *)v46;

    uint64_t v48 = [v89 copy];
    FHIRVersion = v39->_FHIRVersion;
    v39->_FHIRVersion = (HKFHIRVersion *)v48;

    v39->_type = a8;
    v39->_status = a9;
    v39->_errorStatus = a10;
    uint64_t v50 = [v30 copy];
    title = v39->_title;
    v39->_title = (NSString *)v50;

    uint64_t v52 = [v31 copy];
    webURL = v39->_webURL;
    v39->_webURL = (NSURL *)v52;

    uint64_t v54 = [v32 copy];
    sizeInBytes = v39->_sizeInBytes;
    v39->_sizeInBytes = (NSNumber *)v54;

    uint64_t v56 = [v33 copy];
    contentType = v39->_contentType;
    v39->_contentType = (NSString *)v56;

    uint64_t v58 = [v34 copy];
    locale = v39->_locale;
    v39->_locale = (NSLocale *)v58;

    uint64_t v60 = [v35 copy];
    expectedHash = v39->_expectedHash;
    v39->_expectedHash = (NSData *)v60;

    uint64_t v62 = [v36 copy];
    creationDate = v39->_creationDate;
    v39->_creationDate = (NSDate *)v62;

    v39->_retryCount = a18;
    uint64_t v64 = [v37 copy];
    nextRetryDate = v39->_nextRetryDate;
    v39->_nextRetryDate = (NSDate *)v64;

    uint64_t v66 = [v38 copy];
    lastUpdatedDate = v39->_lastUpdatedDate;
    v39->_lastUpdatedDate = (NSDate *)v66;

    uint64_t v68 = [v88 copy];
    lastError = v39->_lastError;
    v39->_lastError = (NSError *)v68;

    uint64_t v70 = [v87 copy];
    fileURL = v39->_fileURL;
    v39->_fileURL = (NSURL *)v70;

    uint64_t v72 = [v86 copy];
    inlineData = v39->_inlineData;
    v39->_inlineData = (NSData *)v72;

    uint64_t v74 = [v85 copy];
    inlineDataChecksum = v39->_inlineDataChecksum;
    v39->_inlineDataChecksum = (NSData *)v74;

    uint64_t v76 = [v84 copy];
    attachmentIdentifier = v39->_attachmentIdentifier;
    v39->_attachmentIdentifier = (NSUUID *)v76;

    uint64_t v78 = [v83 copy];
    metadata = v39->_metadata;
    v39->_metadata = (NSDictionary *)v78;
  }
  return v39;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicalDownloadableAttachment *)a3;
  if (self == v4)
  {
    char v16 = 1;
    goto LABEL_158;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v16 = 0;
    goto LABEL_158;
  }
  v5 = v4;
  identifier = self->_identifier;
  v7 = [(HKMedicalDownloadableAttachment *)v5 identifier];
  v162 = identifier;
  if (identifier != v7)
  {
    uint64_t v8 = [(HKMedicalDownloadableAttachment *)v5 identifier];
    if (!v8)
    {
      v136 = 0;
      int v168 = 0;
      memset(v161, 0, sizeof(v161));
      int v10 = 0;
      unint64_t v152 = 0;
      int v11 = 0;
      int v159 = 0;
      int v155 = 0;
      int v157 = 0;
      unint64_t v154 = 0;
      memset(v171, 0, 28);
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      goto LABEL_39;
    }
    v136 = (void *)v8;
    v9 = self->_identifier;
    v134 = [(HKMedicalDownloadableAttachment *)v5 identifier];
    if (!-[NSUUID isEqual:](v9, "isEqual:"))
    {
      int v168 = 0;
      int v10 = 0;
      unint64_t v152 = 0;
      int v11 = 0;
      int v159 = 0;
      memset(v161, 0, 28);
      int v155 = 0;
      int v157 = 0;
      unint64_t v154 = 0;
      memset(v171, 0, 28);
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      HIDWORD(v161[3]) = 1;
      goto LABEL_39;
    }
  }
  medicalRecordIdentifier = self->_medicalRecordIdentifier;
  v135 = [(HKMedicalDownloadableAttachment *)v5 medicalRecordIdentifier];
  BOOL v18 = medicalRecordIdentifier != v135;
  HIDWORD(v161[3]) = identifier != v7;
  if (medicalRecordIdentifier != v135)
  {
    uint64_t v19 = [(HKMedicalDownloadableAttachment *)v5 medicalRecordIdentifier];
    if (!v19)
    {
      v133 = 0;
      int v10 = 0;
      memset(v161, 0, 24);
      unint64_t v152 = 0;
      int v11 = 0;
      int v159 = 0;
      int v155 = 0;
      int v157 = 0;
      unint64_t v154 = 0;
      memset(v171, 0, 28);
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      LODWORD(v161[3]) = 1;
      int v168 = 1;
      goto LABEL_39;
    }
    v133 = (void *)v19;
    v20 = self->_medicalRecordIdentifier;
    v131 = [(HKMedicalDownloadableAttachment *)v5 medicalRecordIdentifier];
    if (!-[NSUUID isEqual:](v20, "isEqual:"))
    {
      *(void *)((char *)&v161[2] + 4) = 0x100000000;
      v161[0] = 0;
      v161[1] = 0;
      int v10 = 0;
      unint64_t v152 = 0;
      int v11 = 0;
      int v159 = 0;
      int v155 = 0;
      int v157 = 0;
      unint64_t v154 = 0;
      memset(v171, 0, 28);
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      int v168 = 1;
      LODWORD(v161[2]) = 1;
      goto LABEL_39;
    }
  }
  clinicalRecordIdentifier = self->_clinicalRecordIdentifier;
  uint64_t v22 = [(HKMedicalDownloadableAttachment *)v5 clinicalRecordIdentifier];
  LODWORD(v171[3]) = clinicalRecordIdentifier != (NSUUID *)v22;
  int v168 = v18;
  v132 = (void *)v22;
  if (clinicalRecordIdentifier != (NSUUID *)v22)
  {
    uint64_t v23 = [(HKMedicalDownloadableAttachment *)v5 clinicalRecordIdentifier];
    if (!v23)
    {
      v130 = 0;
      v161[0] = 0;
      v161[1] = 0;
      int v10 = 0;
      unint64_t v152 = 0;
      int v11 = 0;
      int v159 = 0;
      int v155 = 0;
      int v157 = 0;
      memset(v171, 0, 24);
      unint64_t v154 = 0;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      LODWORD(v171[3]) = 1;
      goto LABEL_39;
    }
    v130 = (void *)v23;
    v24 = self->_clinicalRecordIdentifier;
    v128 = [(HKMedicalDownloadableAttachment *)v5 clinicalRecordIdentifier];
    if (!-[NSUUID isEqual:](v24, "isEqual:"))
    {
      int v10 = 0;
      v161[0] = 0;
      unint64_t v152 = 0;
      int v11 = 0;
      int v159 = 0;
      int v155 = 0;
      int v157 = 0;
      memset(v171, 0, 24);
      unint64_t v154 = 0;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      LODWORD(v171[3]) = 1;
      v161[1] = 1;
      goto LABEL_39;
    }
  }
  accountIdentifier = self->_accountIdentifier;
  v129 = [(HKMedicalDownloadableAttachment *)v5 accountIdentifier];
  HIDWORD(v171[2]) = accountIdentifier != v129;
  if (accountIdentifier != v129)
  {
    uint64_t v26 = [(HKMedicalDownloadableAttachment *)v5 accountIdentifier];
    if (!v26)
    {
      v127 = 0;
      int v10 = 0;
      v161[0] = 0;
      unint64_t v152 = 0;
      int v11 = 0;
      int v159 = 0;
      int v155 = 0;
      int v157 = 0;
      unint64_t v154 = 0;
      memset(v171, 0, 20);
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v171[2]) = 1;
      goto LABEL_39;
    }
    v127 = (void *)v26;
    v27 = self->_accountIdentifier;
    v125 = [(HKMedicalDownloadableAttachment *)v5 accountIdentifier];
    if (!-[NSUUID isEqual:](v27, "isEqual:"))
    {
      v161[0] = 0;
      unint64_t v152 = 0;
      int v11 = 0;
      int v159 = 0;
      int v155 = 0;
      int v157 = 0;
      unint64_t v154 = 0;
      memset(v171, 0, 20);
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v171[2]) = 1;
      int v10 = 1;
      goto LABEL_39;
    }
  }
  FHIRVersion = self->_FHIRVersion;
  v126 = [(HKMedicalDownloadableAttachment *)v5 FHIRVersion];
  LODWORD(v171[2]) = FHIRVersion != v126;
  if (FHIRVersion != v126)
  {
    uint64_t v29 = [(HKMedicalDownloadableAttachment *)v5 FHIRVersion];
    if (!v29)
    {
      v124 = 0;
      unint64_t v152 = 0;
      int v11 = 0;
      v171[1] = 0;
      int v159 = 0;
      v161[0] = 0x100000000;
      int v155 = 0;
      int v157 = 0;
      v171[0] = 0;
      unint64_t v154 = 0;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      LODWORD(v171[2]) = 1;
      goto LABEL_39;
    }
    v124 = (void *)v29;
    id v30 = self->_FHIRVersion;
    v123 = [(HKMedicalDownloadableAttachment *)v5 FHIRVersion];
    if (!-[HKFHIRVersion isEqual:](v30, "isEqual:"))
    {
      int v11 = 0;
      v171[1] = 0;
      int v159 = 0;
      v161[0] = 0x100000000;
      int v155 = 0;
      int v157 = 0;
      v171[0] = 0;
      LODWORD(v152) = 0;
      unint64_t v154 = 0;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      LODWORD(v171[2]) = 1;
      int v31 = 1;
LABEL_37:
      HIDWORD(v152) = v31;
      goto LABEL_39;
    }
  }
  int64_t type = self->_type;
  if (type != [(HKMedicalDownloadableAttachment *)v5 type]
    || (int64_t status = self->_status, status != [(HKMedicalDownloadableAttachment *)v5 status])
    || (int64_t errorStatus = self->_errorStatus,
        errorStatus != [(HKMedicalDownloadableAttachment *)v5 errorStatus]))
  {
    int v11 = 0;
    v171[1] = 0;
    int v159 = 0;
    v161[0] = 0x100000000;
    int v155 = 0;
    int v157 = 0;
    v171[0] = 0;
    LODWORD(v152) = 0;
    unint64_t v154 = 0;
    int v144 = 0;
    int v150 = 0;
    BOOL v170 = 0;
    int v139 = 0;
    int v143 = 0;
    BOOL v169 = 0;
    int v138 = 0;
    int v141 = 0;
    BOOL v167 = 0;
    int v137 = 0;
    int v145 = 0;
    BOOL v166 = 0;
    int v140 = 0;
    int v147 = 0;
    BOOL v165 = 0;
    int v142 = 0;
    int v148 = 0;
    BOOL v164 = 0;
    int v146 = 0;
    int v151 = 0;
    long long v163 = 0uLL;
    int v149 = 0;
    int v153 = 0;
    int v156 = 0;
    int v158 = 0;
    int v160 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
    *(void *)((char *)&v161[2] + 4) = 0x100000001;
    LODWORD(v161[2]) = v18;
    int v12 = 0;
    int v10 = HIDWORD(v171[2]);
    v161[1] = LODWORD(v171[3]) | 0x100000000;
    int v31 = v171[2];
    goto LABEL_37;
  }
  title = self->_title;
  v122 = [(HKMedicalDownloadableAttachment *)v5 title];
  HIDWORD(v171[1]) = title != v122;
  if (title != v122)
  {
    uint64_t v36 = [(HKMedicalDownloadableAttachment *)v5 title];
    if (!v36)
    {
      v121 = 0;
      int v159 = 0;
      v161[0] = 0x100000000;
      *(void *)((char *)v171 + 4) = 0;
      int v155 = 0;
      int v157 = 0;
      LODWORD(v152) = 0;
      unint64_t v154 = 0;
      LODWORD(v171[0]) = 0;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      int v11 = 1;
      HIDWORD(v171[1]) = 1;
      goto LABEL_39;
    }
    v121 = (void *)v36;
    id v37 = self->_title;
    v119 = [(HKMedicalDownloadableAttachment *)v5 title];
    if (!-[NSString isEqualToString:](v37, "isEqualToString:"))
    {
      v161[0] = 0x100000000;
      *(void *)((char *)v171 + 4) = 0;
      int v155 = 0;
      int v157 = 0;
      LODWORD(v152) = 0;
      unint64_t v154 = 0;
      LODWORD(v171[0]) = 0;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      int v11 = 1;
      HIDWORD(v171[1]) = 1;
      int v159 = 1;
      goto LABEL_39;
    }
  }
  webURL = self->_webURL;
  v120 = [(HKMedicalDownloadableAttachment *)v5 webURL];
  LODWORD(v171[1]) = webURL != v120;
  if (webURL != v120)
  {
    uint64_t v46 = [(HKMedicalDownloadableAttachment *)v5 webURL];
    if (!v46)
    {
      v118 = 0;
      int v155 = 0;
      int v157 = 0;
      v171[0] = 0;
      LODWORD(v152) = 0;
      unint64_t v154 = 0;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      LODWORD(v171[1]) = 1;
      goto LABEL_39;
    }
    v118 = (void *)v46;
    v47 = self->_webURL;
    v116 = [(HKMedicalDownloadableAttachment *)v5 webURL];
    if (!-[NSURL isEqual:](v47, "isEqual:"))
    {
      int v157 = 0;
      v171[0] = 0;
      LODWORD(v152) = 0;
      unint64_t v154 = 0;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      LODWORD(v171[1]) = 1;
      int v155 = 1;
      goto LABEL_39;
    }
  }
  sizeInBytes = self->_sizeInBytes;
  v117 = [(HKMedicalDownloadableAttachment *)v5 sizeInBytes];
  HIDWORD(v171[0]) = sizeInBytes != v117;
  if (sizeInBytes != v117)
  {
    uint64_t v49 = [(HKMedicalDownloadableAttachment *)v5 sizeInBytes];
    if (!v49)
    {
      v115 = 0;
      LODWORD(v152) = 0;
      unint64_t v154 = 0;
      v171[0] = 0x100000000;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      goto LABEL_39;
    }
    v115 = (void *)v49;
    uint64_t v50 = self->_sizeInBytes;
    v112 = [(HKMedicalDownloadableAttachment *)v5 sizeInBytes];
    if (!-[NSNumber isEqual:](v50, "isEqual:"))
    {
      unint64_t v154 = 0;
      v171[0] = 0x100000000;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      LODWORD(v152) = 1;
      goto LABEL_39;
    }
  }
  contentType = self->_contentType;
  v114 = [(HKMedicalDownloadableAttachment *)v5 contentType];
  LODWORD(v171[0]) = contentType != v114;
  if (contentType != v114)
  {
    v113 = [(HKMedicalDownloadableAttachment *)v5 contentType];
    if (!v113)
    {
      v113 = 0;
      int v144 = 0;
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      unint64_t v154 = 1;
      LODWORD(v171[0]) = 1;
      goto LABEL_39;
    }
    uint64_t v52 = self->_contentType;
    v110 = [(HKMedicalDownloadableAttachment *)v5 contentType];
    if (!-[NSString isEqualToString:](v52, "isEqualToString:"))
    {
      int v150 = 0;
      BOOL v170 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      unint64_t v154 = 1;
      LODWORD(v171[0]) = 1;
      int v144 = 1;
      goto LABEL_39;
    }
  }
  locale = self->_locale;
  v111 = [(HKMedicalDownloadableAttachment *)v5 locale];
  BOOL v170 = locale != v111;
  if (locale != v111)
  {
    uint64_t v54 = [(HKMedicalDownloadableAttachment *)v5 locale];
    if (!v54)
    {
      v109 = 0;
      int v139 = 0;
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      unint64_t v154 = 1;
      int v144 = v171[0];
      int v150 = 1;
      BOOL v170 = 1;
      goto LABEL_39;
    }
    v109 = (void *)v54;
    v55 = self->_locale;
    v106 = [(HKMedicalDownloadableAttachment *)v5 locale];
    if (!-[NSLocale isEqual:](v55, "isEqual:"))
    {
      int v143 = 0;
      BOOL v169 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      unint64_t v154 = 1;
      int v144 = v171[0];
      int v150 = 1;
      BOOL v170 = 1;
      int v139 = 1;
      goto LABEL_39;
    }
  }
  expectedHash = self->_expectedHash;
  uint64_t v57 = [(HKMedicalDownloadableAttachment *)v5 expectedHash];
  BOOL v169 = expectedHash != (NSData *)v57;
  v108 = (void *)v57;
  if (expectedHash != (NSData *)v57)
  {
    v107 = [(HKMedicalDownloadableAttachment *)v5 expectedHash];
    if (!v107)
    {
      v107 = 0;
      int v138 = 0;
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      int v12 = 0;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      unint64_t v154 = 1;
      int v144 = v171[0];
      int v150 = 1;
      int v139 = v170;
      int v143 = 1;
      BOOL v169 = 1;
      goto LABEL_39;
    }
    uint64_t v58 = self->_expectedHash;
    v103 = [(HKMedicalDownloadableAttachment *)v5 expectedHash];
    if (!-[NSData isEqual:](v58, "isEqual:"))
    {
      int v141 = 0;
      BOOL v167 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      LODWORD(v161[2]) = v168;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      unint64_t v154 = 1;
      int v144 = v171[0];
      int v150 = 1;
      int v139 = v170;
      int v143 = 1;
      BOOL v169 = 1;
      int v138 = 1;
      goto LABEL_39;
    }
  }
  creationDate = self->_creationDate;
  v105 = [(HKMedicalDownloadableAttachment *)v5 creationDate];
  BOOL v167 = creationDate != v105;
  if (creationDate != v105)
  {
    v104 = [(HKMedicalDownloadableAttachment *)v5 creationDate];
    if (!v104)
    {
      v104 = 0;
      int v137 = 0;
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      LODWORD(v161[2]) = v168;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      unint64_t v154 = 1;
      int v144 = v171[0];
      int v150 = 1;
      int v139 = v170;
      int v143 = 1;
      int v138 = v169;
      int v141 = 1;
      BOOL v167 = 1;
      goto LABEL_39;
    }
    uint64_t v60 = self->_creationDate;
    v102 = [(HKMedicalDownloadableAttachment *)v5 creationDate];
    if (!-[NSDate isEqualToDate:](v60, "isEqualToDate:"))
    {
      int v145 = 0;
      BOOL v166 = 0;
      int v140 = 0;
      int v147 = 0;
      BOOL v165 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      LODWORD(v161[2]) = v168;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      unint64_t v154 = 1;
      int v144 = v171[0];
      int v150 = 1;
      int v139 = v170;
      int v143 = 1;
      int v138 = v169;
      int v141 = 1;
      BOOL v167 = 1;
      int v61 = 1;
LABEL_195:
      int v137 = v61;
      goto LABEL_39;
    }
  }
  int64_t retryCount = self->_retryCount;
  if (retryCount != [(HKMedicalDownloadableAttachment *)v5 retryCount])
  {
    int v145 = 0;
    BOOL v166 = 0;
    int v140 = 0;
    int v147 = 0;
    BOOL v165 = 0;
    int v142 = 0;
    int v148 = 0;
    BOOL v164 = 0;
    int v146 = 0;
    int v151 = 0;
    long long v163 = 0uLL;
    int v149 = 0;
    int v153 = 0;
    int v156 = 0;
    int v158 = 0;
    int v160 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
    LODWORD(v161[2]) = v168;
    *(void *)((char *)&v161[2] + 4) = 0x100000001;
    int v10 = HIDWORD(v171[2]);
    v161[1] = LODWORD(v171[3]) | 0x100000000;
    int v11 = 1;
    int v159 = HIDWORD(v171[1]);
    v161[0] = 0x100000001;
    int v155 = v171[1];
    int v157 = 1;
    unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
    unint64_t v154 = 1;
    int v144 = v171[0];
    int v150 = 1;
    int v139 = v170;
    int v143 = 1;
    int v138 = v169;
    int v141 = 1;
    int v61 = v167;
    goto LABEL_195;
  }
  nextRetryDate = self->_nextRetryDate;
  v101 = [(HKMedicalDownloadableAttachment *)v5 nextRetryDate];
  BOOL v166 = nextRetryDate != v101;
  if (nextRetryDate == v101) {
    goto LABEL_197;
  }
  v100 = [(HKMedicalDownloadableAttachment *)v5 nextRetryDate];
  if (!v100)
  {
    v100 = 0;
    int v140 = 0;
    int v147 = 0;
    BOOL v165 = 0;
    int v142 = 0;
    int v148 = 0;
    BOOL v164 = 0;
    int v146 = 0;
    int v151 = 0;
    long long v163 = 0uLL;
    int v149 = 0;
    int v153 = 0;
    int v156 = 0;
    int v158 = 0;
    int v160 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
    LODWORD(v161[2]) = v168;
    *(void *)((char *)&v161[2] + 4) = 0x100000001;
    int v10 = HIDWORD(v171[2]);
    v161[1] = LODWORD(v171[3]) | 0x100000000;
    int v11 = 1;
    int v159 = HIDWORD(v171[1]);
    v161[0] = 0x100000001;
    int v155 = v171[1];
    int v157 = 1;
    unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
    unint64_t v154 = 1;
    int v144 = v171[0];
    int v150 = 1;
    int v139 = v170;
    int v143 = 1;
    int v138 = v169;
    int v141 = 1;
    int v137 = v167;
    int v145 = 1;
    BOOL v166 = 1;
    goto LABEL_39;
  }
  uint64_t v64 = self->_nextRetryDate;
  v97 = [(HKMedicalDownloadableAttachment *)v5 nextRetryDate];
  if (-[NSDate isEqualToDate:](v64, "isEqualToDate:"))
  {
LABEL_197:
    lastUpdatedDate = self->_lastUpdatedDate;
    v99 = [(HKMedicalDownloadableAttachment *)v5 lastUpdatedDate];
    BOOL v165 = lastUpdatedDate != v99;
    if (lastUpdatedDate == v99) {
      goto LABEL_202;
    }
    v98 = [(HKMedicalDownloadableAttachment *)v5 lastUpdatedDate];
    if (!v98)
    {
      v98 = 0;
      int v142 = 0;
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      LODWORD(v161[2]) = v168;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      unint64_t v154 = 1;
      int v144 = v171[0];
      int v150 = 1;
      int v139 = v170;
      int v143 = 1;
      int v138 = v169;
      int v141 = 1;
      int v137 = v167;
      int v145 = 1;
      int v140 = v166;
      int v147 = 1;
      BOOL v165 = 1;
      goto LABEL_39;
    }
    uint64_t v66 = self->_lastUpdatedDate;
    objc_super v94 = [(HKMedicalDownloadableAttachment *)v5 lastUpdatedDate];
    if (-[NSDate isEqualToDate:](v66, "isEqualToDate:"))
    {
LABEL_202:
      lastError = self->_lastError;
      v96 = [(HKMedicalDownloadableAttachment *)v5 lastError];
      BOOL v164 = lastError != v96;
      if (lastError == v96) {
        goto LABEL_207;
      }
      v95 = [(HKMedicalDownloadableAttachment *)v5 lastError];
      if (!v95)
      {
        v95 = 0;
        int v146 = 0;
        int v151 = 0;
        long long v163 = 0uLL;
        int v149 = 0;
        int v153 = 0;
        int v156 = 0;
        int v158 = 0;
        int v160 = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        LODWORD(v161[2]) = v168;
        *(void *)((char *)&v161[2] + 4) = 0x100000001;
        int v10 = HIDWORD(v171[2]);
        v161[1] = LODWORD(v171[3]) | 0x100000000;
        int v11 = 1;
        int v159 = HIDWORD(v171[1]);
        v161[0] = 0x100000001;
        int v155 = v171[1];
        int v157 = 1;
        unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
        unint64_t v154 = 1;
        int v144 = v171[0];
        int v150 = 1;
        int v139 = v170;
        int v143 = 1;
        int v138 = v169;
        int v141 = 1;
        int v137 = v167;
        int v145 = 1;
        int v140 = v166;
        int v147 = 1;
        int v142 = v165;
        int v148 = 1;
        BOOL v164 = 1;
        goto LABEL_39;
      }
      uint64_t v68 = self->_lastError;
      id v91 = [(HKMedicalDownloadableAttachment *)v5 lastError];
      if (-[NSError isEqual:](v68, "isEqual:"))
      {
LABEL_207:
        fileURL = self->_fileURL;
        id v93 = [(HKMedicalDownloadableAttachment *)v5 fileURL];
        HIDWORD(v163) = fileURL != v93;
        if (fileURL == v93) {
          goto LABEL_212;
        }
        id v92 = [(HKMedicalDownloadableAttachment *)v5 fileURL];
        if (!v92)
        {
          id v92 = 0;
          int v149 = 0;
          int v153 = 0;
          *(void *)((char *)&v163 + 4) = 0;
          int v156 = 0;
          int v158 = 0;
          int v160 = 0;
          LODWORD(v163) = 0;
          int v12 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          char v16 = 0;
          LODWORD(v161[2]) = v168;
          *(void *)((char *)&v161[2] + 4) = 0x100000001;
          int v10 = HIDWORD(v171[2]);
          v161[1] = LODWORD(v171[3]) | 0x100000000;
          int v11 = 1;
          int v159 = HIDWORD(v171[1]);
          v161[0] = 0x100000001;
          int v155 = v171[1];
          int v157 = 1;
          unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
          unint64_t v154 = 1;
          int v144 = v171[0];
          int v150 = 1;
          int v139 = v170;
          int v143 = 1;
          int v138 = v169;
          int v141 = 1;
          int v137 = v167;
          int v145 = 1;
          int v140 = v166;
          int v147 = 1;
          int v142 = v165;
          int v148 = 1;
          int v146 = v164;
          int v151 = 1;
          HIDWORD(v163) = 1;
          goto LABEL_39;
        }
        uint64_t v70 = self->_fileURL;
        id v88 = [(HKMedicalDownloadableAttachment *)v5 fileURL];
        if (-[NSURL isEqual:](v70, "isEqual:"))
        {
LABEL_212:
          inlineData = self->_inlineData;
          id v90 = [(HKMedicalDownloadableAttachment *)v5 inlineData];
          DWORD2(v163) = inlineData != v90;
          if (inlineData == v90) {
            goto LABEL_217;
          }
          id v89 = [(HKMedicalDownloadableAttachment *)v5 inlineData];
          if (!v89)
          {
            id v89 = 0;
            int v156 = 0;
            *(void *)&long long v163 = 0;
            int v158 = 0;
            int v160 = 0;
            int v12 = 0;
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            char v16 = 0;
            LODWORD(v161[2]) = v168;
            *(void *)((char *)&v161[2] + 4) = 0x100000001;
            int v10 = HIDWORD(v171[2]);
            v161[1] = LODWORD(v171[3]) | 0x100000000;
            int v11 = 1;
            int v159 = HIDWORD(v171[1]);
            v161[0] = 0x100000001;
            int v155 = v171[1];
            int v157 = 1;
            unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
            unint64_t v154 = 1;
            int v144 = v171[0];
            int v150 = 1;
            int v139 = v170;
            int v143 = 1;
            int v138 = v169;
            int v141 = 1;
            int v137 = v167;
            int v145 = 1;
            int v140 = v166;
            int v147 = 1;
            int v142 = v165;
            int v148 = 1;
            int v146 = v164;
            int v151 = 1;
            int v149 = HIDWORD(v163);
            int v153 = 1;
            DWORD2(v163) = 1;
            goto LABEL_39;
          }
          uint64_t v72 = self->_inlineData;
          id v85 = [(HKMedicalDownloadableAttachment *)v5 inlineData];
          if (-[NSData isEqual:](v72, "isEqual:"))
          {
LABEL_217:
            inlineDataChecksum = self->_inlineDataChecksum;
            id v87 = [(HKMedicalDownloadableAttachment *)v5 inlineDataChecksum];
            DWORD1(v163) = inlineDataChecksum != v87;
            if (inlineDataChecksum == v87) {
              goto LABEL_222;
            }
            id v86 = [(HKMedicalDownloadableAttachment *)v5 inlineDataChecksum];
            if (!v86)
            {
              id v86 = 0;
              int v158 = 0;
              int v160 = 0;
              *(void *)&long long v163 = 0x100000000;
              int v12 = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              char v16 = 0;
              LODWORD(v161[2]) = v168;
              *(void *)((char *)&v161[2] + 4) = 0x100000001;
              int v10 = HIDWORD(v171[2]);
              v161[1] = LODWORD(v171[3]) | 0x100000000;
              int v11 = 1;
              int v159 = HIDWORD(v171[1]);
              v161[0] = 0x100000001;
              int v155 = v171[1];
              int v157 = 1;
              unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
              unint64_t v154 = __PAIR64__(DWORD2(v163), 1);
              int v144 = v171[0];
              int v150 = 1;
              int v139 = v170;
              int v143 = 1;
              int v138 = v169;
              int v141 = 1;
              int v137 = v167;
              int v145 = 1;
              int v140 = v166;
              int v147 = 1;
              int v142 = v165;
              int v148 = 1;
              int v146 = v164;
              int v151 = 1;
              int v149 = HIDWORD(v163);
              int v153 = 1;
              int v156 = 1;
              goto LABEL_39;
            }
            uint64_t v74 = self->_inlineDataChecksum;
            v81 = [(HKMedicalDownloadableAttachment *)v5 inlineDataChecksum];
            if (-[NSData isEqual:](v74, "isEqual:"))
            {
LABEL_222:
              attachmentIdentifier = self->_attachmentIdentifier;
              id v84 = [(HKMedicalDownloadableAttachment *)v5 attachmentIdentifier];
              LODWORD(v163) = attachmentIdentifier != v84;
              if (attachmentIdentifier == v84) {
                goto LABEL_227;
              }
              id v83 = [(HKMedicalDownloadableAttachment *)v5 attachmentIdentifier];
              if (!v83)
              {
                id v83 = 0;
                int v12 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                char v16 = 0;
                LODWORD(v161[2]) = v168;
                *(void *)((char *)&v161[2] + 4) = 0x100000001;
                int v10 = HIDWORD(v171[2]);
                v161[1] = LODWORD(v171[3]) | 0x100000000;
                int v11 = 1;
                int v159 = HIDWORD(v171[1]);
                v161[0] = 0x100000001;
                int v155 = v171[1];
                int v157 = 1;
                unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
                LODWORD(v154) = 1;
                int v144 = v171[0];
                int v150 = 1;
                int v139 = v170;
                int v143 = 1;
                int v138 = v169;
                int v141 = 1;
                int v137 = v167;
                int v145 = 1;
                int v140 = v166;
                int v147 = 1;
                int v142 = v165;
                int v148 = 1;
                int v146 = v164;
                int v151 = 1;
                int v149 = HIDWORD(v163);
                int v153 = 1;
                HIDWORD(v154) = DWORD2(v163);
                int v156 = 1;
                int v158 = DWORD1(v163);
                int v160 = 1;
                LODWORD(v163) = 1;
                goto LABEL_39;
              }
              uint64_t v76 = self->_attachmentIdentifier;
              v79 = [(HKMedicalDownloadableAttachment *)v5 attachmentIdentifier];
              if (-[NSUUID isEqual:](v76, "isEqual:"))
              {
LABEL_227:
                metadata = self->_metadata;
                v82 = [(HKMedicalDownloadableAttachment *)v5 metadata];
                if (metadata == v82)
                {
                  int v14 = 0;
                  int v15 = 0;
                  LODWORD(v161[2]) = v18;
                  *(void *)((char *)&v161[2] + 4) = 0x100000001;
                  int v10 = HIDWORD(v171[2]);
                  v161[1] = LODWORD(v171[3]) | 0x100000000;
                  int v11 = 1;
                  int v159 = HIDWORD(v171[1]);
                  v161[0] = 0x100000001;
                  int v155 = v171[1];
                  int v157 = 1;
                  unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
                  LODWORD(v154) = 1;
                  int v144 = v171[0];
                  int v150 = 1;
                  int v139 = v170;
                  int v143 = 1;
                  int v138 = v169;
                  int v141 = 1;
                  int v137 = v167;
                  int v145 = 1;
                  int v140 = v166;
                  int v147 = 1;
                  int v142 = v165;
                  int v148 = 1;
                  int v146 = v164;
                  v82 = metadata;
                  int v151 = 1;
                  int v149 = HIDWORD(v163);
                  int v153 = 1;
                  HIDWORD(v154) = DWORD2(v163);
                  int v156 = 1;
                  int v12 = v163;
                  int v158 = DWORD1(v163);
                  int v160 = 1;
                  int v13 = 1;
                  char v16 = 1;
                }
                else
                {
                  v80 = [(HKMedicalDownloadableAttachment *)v5 metadata];
                  if (v80)
                  {
                    uint64_t v78 = self->_metadata;
                    identifier = [(HKMedicalDownloadableAttachment *)v5 metadata];
                    char v16 = [(NSDictionary *)v78 isEqual:identifier];
                    *(void *)((char *)&v161[2] + 4) = 0x100000001;
                    int v10 = HIDWORD(v171[2]);
                    LODWORD(v161[2]) = v18;
                    v161[1] = LODWORD(v171[3]) | 0x100000000;
                    int v11 = 1;
                    int v159 = HIDWORD(v171[1]);
                    v161[0] = 0x100000001;
                    int v155 = v171[1];
                    int v157 = 1;
                    unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
                    LODWORD(v154) = 1;
                    int v144 = v171[0];
                    int v150 = 1;
                    int v139 = v170;
                    int v143 = 1;
                    int v138 = v169;
                    int v141 = 1;
                    int v137 = v167;
                    int v145 = 1;
                    int v140 = v166;
                    int v147 = 1;
                    int v142 = v165;
                    int v148 = 1;
                    int v146 = v164;
                    int v151 = 1;
                    int v149 = HIDWORD(v163);
                    int v153 = 1;
                    HIDWORD(v154) = DWORD2(v163);
                    int v156 = 1;
                    int v12 = v163;
                    int v158 = DWORD1(v163);
                    int v15 = 1;
                  }
                  else
                  {
                    v80 = 0;
                    int v15 = 0;
                    char v16 = 0;
                    *(void *)((char *)&v161[2] + 4) = 0x100000001;
                    int v10 = HIDWORD(v171[2]);
                    LODWORD(v161[2]) = v18;
                    v161[1] = LODWORD(v171[3]) | 0x100000000;
                    int v11 = 1;
                    int v159 = HIDWORD(v171[1]);
                    v161[0] = 0x100000001;
                    int v155 = v171[1];
                    int v157 = 1;
                    unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
                    LODWORD(v154) = 1;
                    int v144 = v171[0];
                    int v150 = 1;
                    int v139 = v170;
                    int v143 = 1;
                    int v138 = v169;
                    int v141 = 1;
                    int v137 = v167;
                    int v145 = 1;
                    int v140 = v166;
                    int v147 = 1;
                    int v142 = v165;
                    int v148 = 1;
                    int v146 = v164;
                    int v151 = 1;
                    int v149 = HIDWORD(v163);
                    int v153 = 1;
                    HIDWORD(v154) = DWORD2(v163);
                    int v156 = 1;
                    int v12 = v163;
                    int v158 = DWORD1(v163);
                  }
                  int v160 = 1;
                  int v13 = 1;
                  int v14 = 1;
                }
                goto LABEL_39;
              }
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              char v16 = 0;
              LODWORD(v161[2]) = v18;
              *(void *)((char *)&v161[2] + 4) = 0x100000001;
              int v10 = HIDWORD(v171[2]);
              v161[1] = LODWORD(v171[3]) | 0x100000000;
              int v11 = 1;
              int v159 = HIDWORD(v171[1]);
              v161[0] = 0x100000001;
              int v155 = v171[1];
              int v157 = 1;
              unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
              LODWORD(v154) = 1;
              int v144 = v171[0];
              int v150 = 1;
              int v139 = v170;
              int v143 = 1;
              int v138 = v169;
              int v141 = 1;
              int v137 = v167;
              int v145 = 1;
              int v140 = v166;
              int v147 = 1;
              int v142 = v165;
              int v148 = 1;
              int v146 = v164;
              int v151 = 1;
              int v149 = HIDWORD(v163);
              int v153 = 1;
              HIDWORD(v154) = DWORD2(v163);
              int v156 = 1;
              int v158 = DWORD1(v163);
              int v160 = 1;
              LODWORD(v163) = 1;
              int v12 = 1;
            }
            else
            {
              int v160 = 0;
              *(void *)&long long v163 = 0x100000000;
              int v12 = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              char v16 = 0;
              LODWORD(v161[2]) = v168;
              *(void *)((char *)&v161[2] + 4) = 0x100000001;
              int v10 = HIDWORD(v171[2]);
              v161[1] = LODWORD(v171[3]) | 0x100000000;
              int v11 = 1;
              int v159 = HIDWORD(v171[1]);
              v161[0] = 0x100000001;
              int v155 = v171[1];
              int v157 = 1;
              unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
              unint64_t v154 = __PAIR64__(DWORD2(v163), 1);
              int v144 = v171[0];
              int v150 = 1;
              int v139 = v170;
              int v143 = 1;
              int v138 = v169;
              int v141 = 1;
              int v137 = v167;
              int v145 = 1;
              int v140 = v166;
              int v147 = 1;
              int v142 = v165;
              int v148 = 1;
              int v146 = v164;
              int v151 = 1;
              int v149 = HIDWORD(v163);
              int v153 = 1;
              int v156 = 1;
              int v158 = 1;
            }
          }
          else
          {
            int v156 = 0;
            *(void *)&long long v163 = 0;
            int v158 = 0;
            int v160 = 0;
            int v12 = 0;
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            char v16 = 0;
            LODWORD(v161[2]) = v168;
            *(void *)((char *)&v161[2] + 4) = 0x100000001;
            int v10 = HIDWORD(v171[2]);
            v161[1] = LODWORD(v171[3]) | 0x100000000;
            int v11 = 1;
            int v159 = HIDWORD(v171[1]);
            v161[0] = 0x100000001;
            int v155 = v171[1];
            int v157 = 1;
            unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
            unint64_t v154 = 0x100000001;
            int v144 = v171[0];
            int v150 = 1;
            int v139 = v170;
            int v143 = 1;
            int v138 = v169;
            int v141 = 1;
            int v137 = v167;
            int v145 = 1;
            int v140 = v166;
            int v147 = 1;
            int v142 = v165;
            int v148 = 1;
            int v146 = v164;
            int v151 = 1;
            int v149 = HIDWORD(v163);
            int v153 = 1;
            DWORD2(v163) = 1;
          }
        }
        else
        {
          int v153 = 0;
          *(void *)((char *)&v163 + 4) = 0;
          int v156 = 0;
          int v158 = 0;
          int v160 = 0;
          LODWORD(v163) = 0;
          int v12 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          char v16 = 0;
          LODWORD(v161[2]) = v168;
          *(void *)((char *)&v161[2] + 4) = 0x100000001;
          int v10 = HIDWORD(v171[2]);
          v161[1] = LODWORD(v171[3]) | 0x100000000;
          int v11 = 1;
          int v159 = HIDWORD(v171[1]);
          v161[0] = 0x100000001;
          int v155 = v171[1];
          int v157 = 1;
          unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
          unint64_t v154 = 1;
          int v144 = v171[0];
          int v150 = 1;
          int v139 = v170;
          int v143 = 1;
          int v138 = v169;
          int v141 = 1;
          int v137 = v167;
          int v145 = 1;
          int v140 = v166;
          int v147 = 1;
          int v142 = v165;
          int v148 = 1;
          int v146 = v164;
          int v151 = 1;
          HIDWORD(v163) = 1;
          int v149 = 1;
        }
      }
      else
      {
        int v151 = 0;
        long long v163 = 0uLL;
        int v149 = 0;
        int v153 = 0;
        int v156 = 0;
        int v158 = 0;
        int v160 = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        LODWORD(v161[2]) = v168;
        *(void *)((char *)&v161[2] + 4) = 0x100000001;
        int v10 = HIDWORD(v171[2]);
        v161[1] = LODWORD(v171[3]) | 0x100000000;
        int v11 = 1;
        int v159 = HIDWORD(v171[1]);
        v161[0] = 0x100000001;
        int v155 = v171[1];
        int v157 = 1;
        unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
        unint64_t v154 = 1;
        int v144 = v171[0];
        int v150 = 1;
        int v139 = v170;
        int v143 = 1;
        int v138 = v169;
        int v141 = 1;
        int v137 = v167;
        int v145 = 1;
        int v140 = v166;
        int v147 = 1;
        int v142 = v165;
        int v148 = 1;
        BOOL v164 = 1;
        int v146 = 1;
      }
    }
    else
    {
      int v148 = 0;
      BOOL v164 = 0;
      int v146 = 0;
      int v151 = 0;
      long long v163 = 0uLL;
      int v149 = 0;
      int v153 = 0;
      int v156 = 0;
      int v158 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      LODWORD(v161[2]) = v168;
      *(void *)((char *)&v161[2] + 4) = 0x100000001;
      int v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      int v11 = 1;
      int v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      int v155 = v171[1];
      int v157 = 1;
      unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      unint64_t v154 = 1;
      int v144 = v171[0];
      int v150 = 1;
      int v139 = v170;
      int v143 = 1;
      int v138 = v169;
      int v141 = 1;
      int v137 = v167;
      int v145 = 1;
      int v140 = v166;
      int v147 = 1;
      BOOL v165 = 1;
      int v142 = 1;
    }
  }
  else
  {
    int v147 = 0;
    BOOL v165 = 0;
    int v142 = 0;
    int v148 = 0;
    BOOL v164 = 0;
    int v146 = 0;
    int v151 = 0;
    long long v163 = 0uLL;
    int v149 = 0;
    int v153 = 0;
    int v156 = 0;
    int v158 = 0;
    int v160 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
    LODWORD(v161[2]) = v168;
    *(void *)((char *)&v161[2] + 4) = 0x100000001;
    int v10 = HIDWORD(v171[2]);
    v161[1] = LODWORD(v171[3]) | 0x100000000;
    int v11 = 1;
    int v159 = HIDWORD(v171[1]);
    v161[0] = 0x100000001;
    int v155 = v171[1];
    int v157 = 1;
    unint64_t v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
    unint64_t v154 = 1;
    int v144 = v171[0];
    int v150 = 1;
    int v139 = v170;
    int v143 = 1;
    int v138 = v169;
    int v141 = 1;
    int v137 = v167;
    int v145 = 1;
    BOOL v166 = 1;
    int v140 = 1;
  }
LABEL_39:
  if (v15)
  {
    int v38 = v12;
    v39 = v7;
    int v40 = v13;
    int v41 = v11;
    int v42 = v10;
    int v43 = v14;

    int v14 = v43;
    int v10 = v42;
    int v11 = v41;
    int v13 = v40;
    v7 = v39;
    int v12 = v38;
  }
  if (v14) {

  }
  if (v13) {
  if (v12)
  }

  if (v163) {
  if (v160)
  }

  if (v158) {
  if (DWORD1(v163))
  }

  if (v156) {
  if (HIDWORD(v154))
  }

  if (DWORD2(v163)) {
  if (v153)
  }

  if (v149) {
  if (HIDWORD(v163))
  }

  if (v151) {
  if (v146)
  }

  if (v164) {
  if (v148)
  }

  if (v142) {
  if (v165)
  }

  if (v147) {
  if (v140)
  }

  if (v166) {
  if (v145)
  }

  if (v137) {
  if (v167)
  }

  if (v141) {
  if (v138)
  }

  if (v169) {
  if (v143)
  }

  if (v139) {
  if (v170)
  }

  if (v150) {
  if (v144)
  }

  if (LODWORD(v171[0])) {
  if (v154)
  }

  if (v152) {
  if (HIDWORD(v171[0]))
  }

  if (v157) {
  if (v155)
  }

  if (LODWORD(v171[1])) {
  if (LODWORD(v161[0]))
  }

  if (v159) {
  if (HIDWORD(v171[1]))
  }

  if (v11) {
  if (HIDWORD(v152))
  }

  if (LODWORD(v171[2])) {
  if (HIDWORD(v161[0]))
  }

  if (v10) {
  if (HIDWORD(v171[2]))
  }

  if (HIDWORD(v161[1])) {
  if (LODWORD(v161[1]))
  }

  if (LODWORD(v171[3])) {
  if (HIDWORD(v161[2]))
  }

  if (LODWORD(v161[2])) {
  if (v168)
  }

  if (LODWORD(v161[3])) {
  if (HIDWORD(v161[3]))
  }

  if (v162 != v7) {
LABEL_158:
  }

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  uint64_t v4 = [(NSUUID *)self->_medicalRecordIdentifier hash] ^ v3;
  uint64_t v5 = [(NSUUID *)self->_clinicalRecordIdentifier hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSUUID *)self->_accountIdentifier hash];
  uint64_t v7 = v6 ^ [(HKFHIRVersion *)self->_FHIRVersion hash] ^ self->_type ^ self->_status;
  int64_t errorStatus = self->_errorStatus;
  NSUInteger v9 = errorStatus ^ [(NSString *)self->_title hash];
  uint64_t v10 = v9 ^ [(NSURL *)self->_webURL hash];
  uint64_t v11 = v7 ^ v10 ^ [(NSNumber *)self->_sizeInBytes hash];
  NSUInteger v12 = [(NSString *)self->_contentType hash];
  uint64_t v13 = v12 ^ [(NSLocale *)self->_locale hash];
  uint64_t v14 = v13 ^ [(NSData *)self->_expectedHash hash];
  uint64_t v15 = v11 ^ v14 ^ [(NSDate *)self->_creationDate hash] ^ self->_retryCount;
  uint64_t v16 = [(NSDate *)self->_nextRetryDate hash];
  uint64_t v17 = v16 ^ [(NSDate *)self->_lastUpdatedDate hash];
  uint64_t v18 = v17 ^ [(NSError *)self->_lastError hash];
  uint64_t v19 = v18 ^ [(NSURL *)self->_fileURL hash];
  uint64_t v20 = v19 ^ [(NSData *)self->_inlineData hash];
  uint64_t v21 = v15 ^ v20 ^ [(NSData *)self->_inlineDataChecksum hash];
  uint64_t v22 = [(NSUUID *)self->_attachmentIdentifier hash];
  return v21 ^ v22 ^ [(NSDictionary *)self->_metadata hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeObject:self->_medicalRecordIdentifier forKey:@"MedicalRecordIdentifier"];
  [v5 encodeObject:self->_clinicalRecordIdentifier forKey:@"ClinicalRecordIdentifier"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"AccountIdentifier"];
  [v5 encodeObject:self->_FHIRVersion forKey:@"FHIRVersion"];
  [v5 encodeInteger:self->_type forKey:@"Type"];
  [v5 encodeInteger:self->_status forKey:@"Status"];
  [v5 encodeInteger:self->_errorStatus forKey:@"ErrorStatus"];
  [v5 encodeObject:self->_title forKey:@"Title"];
  [v5 encodeObject:self->_webURL forKey:@"WebURL"];
  [v5 encodeObject:self->_sizeInBytes forKey:@"SizeInBytes"];
  [v5 encodeObject:self->_contentType forKey:@"ContentType"];
  [v5 encodeObject:self->_locale forKey:@"Locale"];
  [v5 encodeObject:self->_expectedHash forKey:@"ExpectedHash"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
  [v5 encodeInteger:self->_retryCount forKey:@"RetryCount"];
  [v5 encodeObject:self->_nextRetryDate forKey:@"NextRetryDate"];
  [v5 encodeObject:self->_lastUpdatedDate forKey:@"LastUpdatedDate"];
  [v5 encodeObject:self->_lastError forKey:@"LastError"];
  [v5 encodeObject:self->_fileURL forKey:@"FileURL"];
  [v5 encodeObject:self->_inlineData forKey:@"InlineData"];
  [v5 encodeObject:self->_inlineDataChecksum forKey:@"InlineDataChecksum"];
  [v5 encodeObject:self->_attachmentIdentifier forKey:@"AttachmentIdentifierKey"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
}

- (HKMedicalDownloadableAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicalRecordIdentifier"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FHIRVersion"];
  uint64_t v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = v9 || v7 == 0;
  if (!v10
    && [v4 containsValueForKey:@"Type"]
    && [v4 containsValueForKey:@"Status"]
    && [v4 containsValueForKey:@"ErrorStatus"]
    && ([v4 containsValueForKey:@"RetryCount"] & 1) != 0)
  {
    id v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClinicalRecordIdentifier"];
    int v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccountIdentifier"];
    uint64_t v23 = [v4 decodeIntegerForKey:@"Type"];
    uint64_t v22 = [v4 decodeIntegerForKey:@"Status"];
    uint64_t v21 = [v4 decodeIntegerForKey:@"ErrorStatus"];
    id v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Title"];
    id v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebURL"];
    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SizeInBytes"];
    id v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContentType"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Locale"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExpectedHash"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
    uint64_t v18 = [v4 decodeIntegerForKey:@"RetryCount"];
    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NextRetryDate"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastUpdatedDate"];
    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastError"];
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FileURL"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InlineData"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InlineDataChecksum"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AttachmentIdentifierKey"];
    NSUInteger v12 = objc_msgSend(NSDictionary, "hk_secureCodingClasses");
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"Metadata"];
    self = objc_retain(-[HKMedicalDownloadableAttachment initWithIdentifier:medicalRecordIdentifier:clinicalRecordIdentifier:accountIdentifier:FHIRVersion:type:status:errorStatus:title:webURL:sizeInBytes:contentType:locale:expectedHash:creationDate:retryCount:nextRetryDate:lastUpdatedDate:lastError:fileURL:inlineData:inlineDataChecksum:attachmentIdentifier:metadata:](self, "initWithIdentifier:medicalRecordIdentifier:clinicalRecordIdentifier:accountIdentifier:FHIRVersion:type:status:errorStatus:title:webURL:sizeInBytes:contentType:locale:expectedHash:creationDate:retryCount:nextRetryDate:lastUpdatedDate:lastError:fileURL:inlineData:inlineDataChecksum:attachmentIdentifier:metadata:", v5, v6, v34, v31, v8, v23, v22, v21, v33, v32, v28, v30, v20, v29,
               v19,
               v18,
               v27,
               v26,
               v25,
               v24,
               v17,
               v16,
               v11,
               v13));

    uint64_t v14 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)copyForAccountWithIdentifier:(id)a3 medicalRecordIdentifier:(id)a4 clinicalRecordIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKMedicalDownloadableAttachment.m", 255, @"Invalid parameter not satisfying: %@", @"accountIdentifier" object file lineNumber description];
  }
  NSUInteger v12 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:medicalRecordIdentifier:clinicalRecordIdentifier:accountIdentifier:FHIRVersion:type:status:errorStatus:title:webURL:sizeInBytes:contentType:locale:expectedHash:creationDate:retryCount:nextRetryDate:lastUpdatedDate:lastError:fileURL:inlineData:inlineDataChecksum:attachmentIdentifier:metadata:", self->_identifier, v10, v11, v9, self->_FHIRVersion, self->_type, self->_status, self->_errorStatus, self->_title, self->_webURL, self->_sizeInBytes, self->_contentType, self->_locale, self->_expectedHash, self->_creationDate,
                  self->_retryCount,
                  self->_nextRetryDate,
                  self->_lastUpdatedDate,
                  self->_lastError,
                  self->_fileURL,
                  self->_inlineData,
                  self->_inlineDataChecksum,
                  self->_attachmentIdentifier,
                  self->_metadata);

  return v12;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)medicalRecordIdentifier
{
  return self->_medicalRecordIdentifier;
}

- (NSUUID)clinicalRecordIdentifier
{
  return self->_clinicalRecordIdentifier;
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)errorStatus
{
  return self->_errorStatus;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (NSNumber)sizeInBytes
{
  return self->_sizeInBytes;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSData)expectedHash
{
  return self->_expectedHash;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (NSDate)nextRetryDate
{
  return self->_nextRetryDate;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSData)inlineData
{
  return self->_inlineData;
}

- (NSData)inlineDataChecksum
{
  return self->_inlineDataChecksum;
}

- (NSUUID)attachmentIdentifier
{
  return self->_attachmentIdentifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
  objc_storeStrong((id *)&self->_inlineDataChecksum, 0);
  objc_storeStrong((id *)&self->_inlineData, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_nextRetryDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_expectedHash, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_sizeInBytes, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_FHIRVersion, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_clinicalRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_medicalRecordIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end