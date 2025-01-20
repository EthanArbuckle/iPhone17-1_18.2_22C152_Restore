@interface HKDiagnosticTestReport
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newDiagnosticTestReportWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 results:(id)a16 effectiveStartDate:(id)a17 statusCoding:(id)a18 effectiveEndDate:(id)a19 issueDate:(id)a20 config:(id)a21;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)defaultDisplayString;
+ (id)diagnosticTestReportWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 diagnosticTestCodingCollection:(id)a14 results:(id)a15 effectiveStartDate:(id)a16 statusCoding:(id)a17 effectiveEndDate:(id)a18 issueDate:(id)a19;
+ (id)diagnosticTestReportWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 results:(id)a16 effectiveStartDate:(id)a17 statusCoding:(id)a18 effectiveEndDate:(id)a19 issueDate:(id)a20;
+ (id)indexableConceptKeyPaths;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (HKConcept)diagnosticTest;
- (HKConcept)status;
- (HKDiagnosticTestReport)init;
- (HKDiagnosticTestReport)initWithCoder:(id)a3;
- (HKMedicalCoding)statusCoding;
- (HKMedicalCodingCollection)diagnosticTestCodingCollection;
- (HKMedicalDate)effectiveEndDate;
- (HKMedicalDate)effectiveStartDate;
- (HKMedicalDate)issueDate;
- (NSArray)results;
- (NSString)description;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)medicalRecordCodings;
- (id)statusCodingCollection;
- (int64_t)recordCategoryType;
- (void)_setDiagnosticTest:(id)a3;
- (void)_setDiagnosticTestCodingCollection:(id)a3;
- (void)_setEffectiveEndDate:(id)a3;
- (void)_setEffectiveStartDate:(id)a3;
- (void)_setIssueDate:(id)a3;
- (void)_setResults:(id)a3;
- (void)_setStatus:(id)a3;
- (void)_setStatusCoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDiagnosticTestReport

+ (id)indexableConceptKeyPaths
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestReport;
  v2 = objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"diagnosticTest"];
  [v3 addObject:@"status"];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestReport;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  v8 = v7;
  if (!v7)
  {
    v11 = 0;
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"diagnosticTest"])
  {
    v9 = [(HKDiagnosticTestReport *)self diagnosticTestCodingCollection];
    v10 = +[HKIndexableObject indexableObjectWithObject:v9];
    v16[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
LABEL_7:

    goto LABEL_9;
  }
  if ([v8 isEqualToString:@"status"])
  {
    v9 = [(HKDiagnosticTestReport *)self statusCoding];
    v10 = +[HKMedicalCodingCollection collectionWithCoding:v9];
    v12 = +[HKIndexableObject indexableObjectWithObject:v10];
    v15 = v12;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

    goto LABEL_7;
  }
  v14.receiver = self;
  v14.super_class = (Class)HKDiagnosticTestReport;
  v11 = [(HKMedicalRecord *)&v14 codingsForKeyPath:v6 error:a4];
LABEL_9:

  return v11;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_9;
  }
  if (![v10 isEqualToString:@"diagnosticTest"])
  {
    if (![v11 isEqualToString:@"status"])
    {
      v16.receiver = self;
      v16.super_class = (Class)HKDiagnosticTestReport;
      BOOL v14 = [(HKMedicalRecord *)&v16 applyConcepts:v8 forKeyPath:v9 error:a5];
      goto LABEL_10;
    }
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      v12 = [v8 firstObject];
      v13 = [v12 object];
      [(HKDiagnosticTestReport *)self _setStatus:v13];
      goto LABEL_8;
    }
LABEL_9:
    BOOL v14 = 0;
    goto LABEL_10;
  }
  if (!HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5)) {
    goto LABEL_9;
  }
  v12 = [v8 firstObject];
  v13 = [v12 object];
  [(HKDiagnosticTestReport *)self _setDiagnosticTest:v13];
LABEL_8:

  BOOL v14 = 1;
LABEL_10:

  return v14;
}

+ (id)diagnosticTestReportWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 diagnosticTestCodingCollection:(id)a14 results:(id)a15 effectiveStartDate:(id)a16 statusCoding:(id)a17 effectiveEndDate:(id)a18 issueDate:(id)a19
{
  BOOL v46 = a5;
  id v49 = a16;
  id v20 = a18;
  v21 = @"issueDate";
  id v22 = a19;
  id v45 = a17;
  id v44 = a15;
  id v43 = a14;
  v23 = v20;
  id v35 = a12;
  id v42 = a11;
  id v41 = a10;
  id v40 = a8;
  id v48 = a7;
  id v24 = a6;
  id v39 = a4;
  id v37 = a3;
  v25 = [v22 dateForUTC];
  if (v23)
  {
    v26 = @"effectiveEndDate";

    uint64_t v27 = [v23 dateForUTC];

    v25 = (void *)v27;
    v21 = v26;
  }
  if (v49)
  {
    v28 = @"effectiveStartDate";

    uint64_t v29 = [v49 dateForUTC];

    v25 = (void *)v29;
    v21 = v28;
  }
  v34 = v21;
  v32 = +[HKSemanticDate semanticDateWithKeyPath:v21 date:v25];
  +[HKDiagnosticTestReport diagnosticTestReportWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:results:effectiveStartDate:statusCoding:effectiveEndDate:issueDate:](HKDiagnosticTestReport, "diagnosticTestReportWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:results:effectiveStartDate:statusCoding:effectiveEndDate:issueDate:", v37, v39, v46, v24, v48, v40, a9, v41, v42, v32, v35, a13, v43, v44, v49, v45,
    v23,
  v30 = v22);

  return v30;
}

- (id)medicalRecordCodings
{
  v2 = [(HKDiagnosticTestReport *)self diagnosticTestCodingCollection];
  v3 = [v2 codings];

  return v3;
}

+ (id)defaultDisplayString
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"UNSPECIFIED_DIAGNOSTIC_TEST_RESULT" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];

  return v3;
}

- (int64_t)recordCategoryType
{
  return 2;
}

+ (id)diagnosticTestReportWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 results:(id)a16 effectiveStartDate:(id)a17 statusCoding:(id)a18 effectiveEndDate:(id)a19 issueDate:(id)a20
{
  id v20 = objc_msgSend(a1, "_newDiagnosticTestReportWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:results:effectiveStartDate:statusCoding:effectiveEndDate:issueDate:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17,
                  a18,
                  a19,
                  a20,
                  0);

  return v20;
}

+ (id)_newDiagnosticTestReportWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 results:(id)a16 effectiveStartDate:(id)a17 statusCoding:(id)a18 effectiveEndDate:(id)a19 issueDate:(id)a20 config:(id)a21
{
  BOOL v45 = a5;
  id v21 = a15;
  id v22 = a16;
  id v23 = a17;
  id v24 = a18;
  id v25 = a19;
  id v26 = a20;
  id v27 = a21;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __278__HKDiagnosticTestReport__newDiagnosticTestReportWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_diagnosticTestCodingCollection_results_effectiveStartDate_statusCoding_effectiveEndDate_issueDate_config___block_invoke;
  aBlock[3] = &unk_1E58C57F8;
  id v56 = v21;
  id v57 = v22;
  id v58 = v23;
  id v59 = v24;
  id v60 = v25;
  id v61 = v26;
  id v62 = v27;
  id v53 = v27;
  id v52 = v26;
  id v51 = v25;
  id v50 = v24;
  id v49 = v23;
  id v48 = v22;
  id v47 = v21;
  id v28 = a13;
  id v29 = a12;
  id v30 = a11;
  id v31 = a10;
  id v32 = a8;
  id v33 = a7;
  id v34 = a6;
  id v35 = a4;
  id v36 = a3;
  id v37 = _Block_copy(aBlock);
  v54.receiver = a1;
  v54.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestReport;
  id v46 = objc_msgSendSuper2(&v54, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v36, v35, v45, v34, v33, v32, a9, v31, v30, v29, v28, a14, v37);

  return v46;
}

void __278__HKDiagnosticTestReport__newDiagnosticTestReportWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_diagnosticTestCodingCollection_results_effectiveStartDate_statusCoding_effectiveEndDate_issueDate_config___block_invoke(uint64_t a1, void *a2)
{
  objc_super v16 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  objc_super v4 = (void *)v16[22];
  v16[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  id v6 = (void *)v16[23];
  v16[23] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  id v8 = (void *)v16[24];
  v16[24] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v16[25];
  v16[25] = v9;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v16[26];
  v16[26] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  BOOL v14 = (void *)v16[27];
  v16[27] = v13;

  uint64_t v15 = *(void *)(a1 + 80);
  if (v15) {
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }
}

- (HKDiagnosticTestReport)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v9.receiver = self;
  v9.super_class = (Class)HKDiagnosticTestReport;
  id v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@diagnosticTestCodingCollection = %@results = %@effectiveStartDate = %@statusCoding = %@effectiveEndDate = %@issueDate = %@>", v5, self, v6, self->_diagnosticTestCodingCollection, self->_results, self->_effectiveStartDate, self->_statusCoding, self->_effectiveEndDate, self->_issueDate];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKDiagnosticTestReport;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_diagnosticTestCodingCollection, @"DiagnosticTestCodingCollection", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_results forKey:@"Results"];
  [v4 encodeObject:self->_effectiveStartDate forKey:@"EffectiveStartDate"];
  [v4 encodeObject:self->_statusCoding forKey:@"StatusCoding"];
  [v4 encodeObject:self->_effectiveEndDate forKey:@"EffectiveEndDate"];
  [v4 encodeObject:self->_issueDate forKey:@"IssueDate"];
  [v4 encodeObject:self->_diagnosticTest forKey:@"DiagnosticTest"];
  [v4 encodeObject:self->_status forKey:@"Status"];
}

- (HKDiagnosticTestReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HKDiagnosticTestReport;
  objc_super v5 = [(HKMedicalRecord *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DiagnosticTestCodingCollection"];
    diagnosticTestCodingCollection = v5->_diagnosticTestCodingCollection;
    v5->_diagnosticTestCodingCollection = (HKMedicalCodingCollection *)v6;

    id v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Results"];
    results = v5->_results;
    v5->_results = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EffectiveStartDate"];
    effectiveStartDate = v5->_effectiveStartDate;
    v5->_effectiveStartDate = (HKMedicalDate *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusCoding"];
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EffectiveEndDate"];
    effectiveEndDate = v5->_effectiveEndDate;
    v5->_effectiveEndDate = (HKMedicalDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IssueDate"];
    issueDate = v5->_issueDate;
    v5->_issueDate = (HKMedicalDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DiagnosticTest"];
    diagnosticTest = v5->_diagnosticTest;
    v5->_diagnosticTest = (HKConcept *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Status"];
    status = v5->_status;
    v5->_status = (HKConcept *)v21;
  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v58.receiver = self;
    v58.super_class = (Class)HKDiagnosticTestReport;
    if (![(HKMedicalRecord *)&v58 isEquivalent:v5]) {
      goto LABEL_44;
    }
    uint64_t v6 = [(HKDiagnosticTestReport *)self diagnosticTestCodingCollection];
    uint64_t v7 = [v5 diagnosticTestCodingCollection];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      id v8 = (void *)v7;
      uint64_t v9 = [v5 diagnosticTestCodingCollection];
      if (!v9) {
        goto LABEL_43;
      }
      v10 = (void *)v9;
      uint64_t v11 = [(HKDiagnosticTestReport *)self diagnosticTestCodingCollection];
      v12 = [v5 diagnosticTestCodingCollection];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_44;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestReport *)self results];
    uint64_t v15 = [v5 results];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      id v8 = (void *)v15;
      uint64_t v16 = [v5 results];
      if (!v16) {
        goto LABEL_43;
      }
      uint64_t v17 = (void *)v16;
      v18 = [(HKDiagnosticTestReport *)self results];
      uint64_t v19 = [v5 results];
      int v20 = [v18 isEqualToArray:v19];

      if (!v20) {
        goto LABEL_44;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestReport *)self effectiveStartDate];
    uint64_t v21 = [v5 effectiveStartDate];
    if (v6 == (void *)v21)
    {
    }
    else
    {
      id v8 = (void *)v21;
      uint64_t v22 = [v5 effectiveStartDate];
      if (!v22) {
        goto LABEL_43;
      }
      id v23 = (void *)v22;
      objc_super v24 = [(HKDiagnosticTestReport *)self effectiveStartDate];
      id v25 = [v5 effectiveStartDate];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_44;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestReport *)self statusCoding];
    uint64_t v27 = [v5 statusCoding];
    if (v6 == (void *)v27)
    {
    }
    else
    {
      id v8 = (void *)v27;
      uint64_t v28 = [v5 statusCoding];
      if (!v28) {
        goto LABEL_43;
      }
      id v29 = (void *)v28;
      id v30 = [(HKDiagnosticTestReport *)self statusCoding];
      id v31 = [v5 statusCoding];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_44;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestReport *)self effectiveEndDate];
    uint64_t v33 = [v5 effectiveEndDate];
    if (v6 == (void *)v33)
    {
    }
    else
    {
      id v8 = (void *)v33;
      uint64_t v34 = [v5 effectiveEndDate];
      if (!v34) {
        goto LABEL_43;
      }
      id v35 = (void *)v34;
      id v36 = [(HKDiagnosticTestReport *)self effectiveEndDate];
      id v37 = [v5 effectiveEndDate];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_44;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestReport *)self issueDate];
    uint64_t v39 = [v5 issueDate];
    if (v6 == (void *)v39)
    {
    }
    else
    {
      id v8 = (void *)v39;
      uint64_t v40 = [v5 issueDate];
      if (!v40) {
        goto LABEL_43;
      }
      id v41 = (void *)v40;
      id v42 = [(HKDiagnosticTestReport *)self issueDate];
      id v43 = [v5 issueDate];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_44;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestReport *)self diagnosticTest];
    uint64_t v45 = [v5 diagnosticTest];
    if (v6 == (void *)v45)
    {
    }
    else
    {
      id v8 = (void *)v45;
      uint64_t v46 = [v5 diagnosticTest];
      if (!v46) {
        goto LABEL_43;
      }
      id v47 = (void *)v46;
      id v48 = [(HKDiagnosticTestReport *)self diagnosticTest];
      id v49 = [v5 diagnosticTest];
      int v50 = [v48 isEqual:v49];

      if (!v50) {
        goto LABEL_44;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestReport *)self status];
    uint64_t v51 = [v5 status];
    if (v6 == (void *)v51)
    {

LABEL_48:
      BOOL v14 = 1;
      goto LABEL_45;
    }
    id v8 = (void *)v51;
    uint64_t v52 = [v5 status];
    if (v52)
    {
      id v53 = (void *)v52;
      objc_super v54 = [(HKDiagnosticTestReport *)self status];
      v55 = [v5 status];
      char v56 = [v54 isEqual:v55];

      if (v56) {
        goto LABEL_48;
      }
LABEL_44:
      BOOL v14 = 0;
LABEL_45:

      goto LABEL_46;
    }
LABEL_43:

    goto LABEL_44;
  }
  BOOL v14 = 0;
LABEL_46:

  return v14;
}

- (id)statusCodingCollection
{
  v2 = [(HKDiagnosticTestReport *)self statusCoding];
  uint64_t v3 = +[HKMedicalCodingCollection collectionWithCoding:v2];

  return v3;
}

- (HKMedicalCodingCollection)diagnosticTestCodingCollection
{
  return self->_diagnosticTestCodingCollection;
}

- (void)_setDiagnosticTestCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  diagnosticTestCodingCollection = self->_diagnosticTestCodingCollection;
  self->_diagnosticTestCodingCollection = v4;

  id v8 = [(HKDiagnosticTestReport *)self diagnosticTestCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  diagnosticTest = self->_diagnosticTest;
  self->_diagnosticTest = v6;
}

- (NSArray)results
{
  return self->_results;
}

- (void)_setResults:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  results = self->_results;
  self->_results = v4;

  MEMORY[0x1F41817F8](v4, results);
}

- (HKMedicalDate)effectiveStartDate
{
  return self->_effectiveStartDate;
}

- (void)_setEffectiveStartDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  effectiveStartDate = self->_effectiveStartDate;
  self->_effectiveStartDate = v4;

  MEMORY[0x1F41817F8](v4, effectiveStartDate);
}

- (HKMedicalCoding)statusCoding
{
  return self->_statusCoding;
}

- (void)_setStatusCoding:(id)a3
{
  id v4 = (HKMedicalCoding *)[a3 copy];
  statusCoding = self->_statusCoding;
  self->_statusCoding = v4;

  id v8 = [(HKDiagnosticTestReport *)self statusCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  status = self->_status;
  self->_status = v6;
}

- (HKMedicalDate)effectiveEndDate
{
  return self->_effectiveEndDate;
}

- (void)_setEffectiveEndDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  effectiveEndDate = self->_effectiveEndDate;
  self->_effectiveEndDate = v4;

  MEMORY[0x1F41817F8](v4, effectiveEndDate);
}

- (HKMedicalDate)issueDate
{
  return self->_issueDate;
}

- (void)_setIssueDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  issueDate = self->_issueDate;
  self->_issueDate = v4;

  MEMORY[0x1F41817F8](v4, issueDate);
}

- (HKConcept)diagnosticTest
{
  diagnosticTest = self->_diagnosticTest;
  if (diagnosticTest)
  {
    uint64_t v3 = diagnosticTest;
  }
  else
  {
    id v4 = [(HKDiagnosticTestReport *)self diagnosticTestCodingCollection];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setDiagnosticTest:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKDiagnosticTestReport _setDiagnosticTest:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  diagnosticTest = self->_diagnosticTest;
  self->_diagnosticTest = v6;
}

- (HKConcept)status
{
  status = self->_status;
  if (status)
  {
    uint64_t v3 = status;
  }
  else
  {
    id v4 = [(HKDiagnosticTestReport *)self statusCodingCollection];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setStatus:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKDiagnosticTestReport _setStatus:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  status = self->_status;
  self->_status = v6;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKDiagnosticTestReport;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (self->_diagnosticTestCodingCollection)
    {
      if (self->_statusCoding)
      {
        if (self->_issueDate)
        {
          id v8 = 0;
          goto LABEL_12;
        }
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = @"%@: issueDate must not be nil";
      }
      else
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = @"%@: statusCoding must not be nil";
      }
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: diagnosticTestCodingCollection must not be nil";
    }
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v10, a2, v11, self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;
LABEL_12:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_diagnosticTest, 0);
  objc_storeStrong((id *)&self->_issueDate, 0);
  objc_storeStrong((id *)&self->_effectiveEndDate, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_effectiveStartDate, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_diagnosticTestCodingCollection, 0);
}

- (void)_setDiagnosticTest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property diagnosticTest for record type HKDiagnosticTestReport.", v1, 2u);
}

- (void)_setStatus:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property status for record type HKDiagnosticTestReport.", v1, 2u);
}

@end