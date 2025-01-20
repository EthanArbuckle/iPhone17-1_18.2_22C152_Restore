@interface HKDiagnosticTestResult
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)groupsByUserDomainConcept;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newDiagnosticTestResultWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 value:(id)a16 referenceRanges:(id)a17 effectiveStartDate:(id)a18 category:(id)a19 categoriesCodingCollections:(id)a20 issueDate:(id)a21 effectiveEndDate:(id)a22 statusCoding:(id)a23 interpretationCodingCollections:(id)a24 comments:(id)a25 bodySiteCodingCollection:(id)a26 methodCodingCollection:(id)a27 performers:(id)a28 referenceRangeStatus:(int64_t)a29 config:(id)a30;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)defaultDisplayString;
+ (id)diagnosticTestResultWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 diagnosticTestCodingCollection:(id)a14 value:(id)a15 referenceRanges:(id)a16 effectiveStartDate:(id)a17 category:(id)a18 categoriesCodingCollections:(id)a19 issueDate:(id)a20 effectiveEndDate:(id)a21 statusCoding:(id)a22 interpretationCodingCollections:(id)a23 comments:(id)a24 bodySiteCodingCollection:(id)a25 methodCodingCollection:(id)a26 performers:(id)a27 referenceRangeStatus:(int64_t)a28;
+ (id)diagnosticTestResultWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 value:(id)a16 referenceRanges:(id)a17 effectiveStartDate:(id)a18 category:(id)a19 categoriesCodingCollections:(id)a20 issueDate:(id)a21 effectiveEndDate:(id)a22 statusCoding:(id)a23 interpretationCodingCollections:(id)a24 comments:(id)a25 bodySiteCodingCollection:(id)a26 methodCodingCollection:(id)a27 performers:(id)a28 referenceRangeStatus:(int64_t)a29;
+ (id)indexableConceptKeyPaths;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (HKConcept)bodySite;
- (HKConcept)diagnosticTest;
- (HKConcept)method;
- (HKConcept)status;
- (HKDiagnosticTestResult)init;
- (HKDiagnosticTestResult)initWithCoder:(id)a3;
- (HKInspectableValueCollection)value;
- (HKMedicalCoding)statusCoding;
- (HKMedicalCodingCollection)bodySiteCodingCollection;
- (HKMedicalCodingCollection)diagnosticTestCodingCollection;
- (HKMedicalCodingCollection)methodCodingCollection;
- (HKMedicalDate)effectiveEndDate;
- (HKMedicalDate)effectiveStartDate;
- (HKMedicalDate)issueDate;
- (NSArray)categories;
- (NSArray)categoriesCodingCollections;
- (NSArray)interpretation;
- (NSArray)interpretationCodingCollections;
- (NSArray)performers;
- (NSArray)referenceRanges;
- (NSString)category;
- (NSString)comments;
- (NSString)description;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)medicalRecordCodings;
- (id)statusCodingCollection;
- (int64_t)recordCategoryType;
- (int64_t)referenceRangeStatus;
- (void)_setBodySite:(id)a3;
- (void)_setBodySiteCodingCollection:(id)a3;
- (void)_setCategories:(id)a3;
- (void)_setCategoriesCodingCollections:(id)a3;
- (void)_setCategory:(id)a3;
- (void)_setComments:(id)a3;
- (void)_setDiagnosticTest:(id)a3;
- (void)_setDiagnosticTestCodingCollection:(id)a3;
- (void)_setEffectiveEndDate:(id)a3;
- (void)_setEffectiveStartDate:(id)a3;
- (void)_setInterpretation:(id)a3;
- (void)_setInterpretationCodingCollections:(id)a3;
- (void)_setIssueDate:(id)a3;
- (void)_setMethod:(id)a3;
- (void)_setMethodCodingCollection:(id)a3;
- (void)_setPerformers:(id)a3;
- (void)_setReferenceRangeStatus:(int64_t)a3;
- (void)_setReferenceRanges:(id)a3;
- (void)_setStatus:(id)a3;
- (void)_setStatusCoding:(id)a3;
- (void)_setValue:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDiagnosticTestResult

- (id)medicalRecordCodings
{
  v2 = [(HKDiagnosticTestResult *)self diagnosticTestCodingCollection];
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
  v2 = [(HKDiagnosticTestResult *)self category];
  HKDiagnosticTestResultCategoryFromNSString(v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = 3;
  if (v3 != @"vital-signs") {
    uint64_t v4 = 0;
  }
  if (v3 == @"laboratory") {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = v4;
  }

  return v5;
}

+ (id)diagnosticTestResultWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 diagnosticTestCodingCollection:(id)a14 value:(id)a15 referenceRanges:(id)a16 effectiveStartDate:(id)a17 category:(id)a18 categoriesCodingCollections:(id)a19 issueDate:(id)a20 effectiveEndDate:(id)a21 statusCoding:(id)a22 interpretationCodingCollections:(id)a23 comments:(id)a24 bodySiteCodingCollection:(id)a25 methodCodingCollection:(id)a26 performers:(id)a27 referenceRangeStatus:(int64_t)a28
{
  BOOL v59 = a5;
  id v70 = a3;
  id v69 = a4;
  id v32 = a6;
  id v68 = a7;
  id v67 = a8;
  id v66 = a10;
  id v65 = a11;
  id v64 = a12;
  id v63 = a14;
  id v62 = a15;
  id v58 = a16;
  id v33 = a17;
  id v57 = a18;
  id v61 = a19;
  id v34 = a20;
  id v35 = a21;
  id v56 = a22;
  id v55 = a23;
  id v36 = a24;
  id v54 = a25;
  id v37 = a26;
  id v53 = a27;
  v38 = @"modifiedDate";
  id v39 = v32;
  v40 = v34;
  v41 = v39;
  v42 = v35;
  if (v40)
  {
    v43 = @"issueDate";

    v44 = [v40 dateForUTC];

    v38 = v43;
    id v35 = v42;
    if (!v42) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v44 = v39;
  if (v35)
  {
LABEL_3:
    v45 = @"effectiveEndDate";

    uint64_t v46 = [v35 dateForUTC];

    v44 = (void *)v46;
    v38 = v45;
  }
LABEL_4:
  if (v33)
  {
    v47 = @"effectiveStartDate";

    uint64_t v48 = [v33 dateForUTC];

    v44 = (void *)v48;
    v38 = v47;
  }
  id v49 = v33;
  v52 = v33;
  v50 = +[HKSemanticDate semanticDateWithKeyPath:v38 date:v44];
  +[HKDiagnosticTestResult diagnosticTestResultWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:value:referenceRanges:effectiveStartDate:category:categoriesCodingCollections:issueDate:effectiveEndDate:statusCoding:interpretationCodingCollections:comments:bodySiteCodingCollection:methodCodingCollection:performers:referenceRangeStatus:](HKDiagnosticTestResult, "diagnosticTestResultWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:value:referenceRanges:effectiveStartDate:category:categoriesCodingCollections:issueDate:effectiveEndDate:statusCoding:interpretationCodingCollections:comments:bodySiteCodingCollection:methodCodingCollection:performers:referenceRangeStatus:", v70, v69, v59, v41, v68, v67, a9, v66, v65, v50, v64, a13, v63, v62,
    v58,
    v49,
    v57,
    v61,
    v40,
    v42,
    v56,
    v55,
    v36,
    v54,
    v37,
    v53,
  v60 = a28);

  return v60;
}

+ (id)diagnosticTestResultWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 value:(id)a16 referenceRanges:(id)a17 effectiveStartDate:(id)a18 category:(id)a19 categoriesCodingCollections:(id)a20 issueDate:(id)a21 effectiveEndDate:(id)a22 statusCoding:(id)a23 interpretationCodingCollections:(id)a24 comments:(id)a25 bodySiteCodingCollection:(id)a26 methodCodingCollection:(id)a27 performers:(id)a28 referenceRangeStatus:(int64_t)a29
{
  v29 = objc_msgSend(a1, "_newDiagnosticTestResultWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:value:referenceRanges:effectiveStartDate:category:categoriesCodingCollections:issueDate:effectiveEndDate:statusCoding:interpretationCodingCollections:comments:bodySiteCodingCollection:methodCodingCollection:performers:referenceRangeStatus:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
                  a16,
                  a17,
                  a18,
                  a19,
                  a20,
                  a21,
                  a22,
                  a23,
                  a24,
                  a25,
                  a26,
                  a27,
                  a28,
                  a29,
                  0);

  return v29;
}

+ (id)_newDiagnosticTestResultWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 value:(id)a16 referenceRanges:(id)a17 effectiveStartDate:(id)a18 category:(id)a19 categoriesCodingCollections:(id)a20 issueDate:(id)a21 effectiveEndDate:(id)a22 statusCoding:(id)a23 interpretationCodingCollections:(id)a24 comments:(id)a25 bodySiteCodingCollection:(id)a26 methodCodingCollection:(id)a27 performers:(id)a28 referenceRangeStatus:(int64_t)a29 config:(id)a30
{
  BOOL v69 = a5;
  id v77 = a15;
  id v75 = a16;
  id v73 = a17;
  id v71 = a18;
  id v30 = a19;
  id v31 = a20;
  id v32 = a21;
  id v33 = a22;
  id v34 = a23;
  id v35 = a24;
  id v36 = a25;
  id v37 = a26;
  id v38 = a27;
  id v39 = a28;
  id v40 = a30;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __450__HKDiagnosticTestResult__newDiagnosticTestResultWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_diagnosticTestCodingCollection_value_referenceRanges_effectiveStartDate_category_categoriesCodingCollections_issueDate_effectiveEndDate_statusCoding_interpretationCodingCollections_comments_bodySiteCodingCollection_methodCodingCollection_performers_referenceRangeStatus_config___block_invoke;
  aBlock[3] = &unk_1E58C4898;
  id v81 = v77;
  id v82 = v75;
  id v83 = v73;
  id v84 = v71;
  id v85 = v30;
  id v86 = v31;
  id v87 = v32;
  id v88 = v33;
  id v89 = v34;
  id v90 = v35;
  id v91 = v36;
  id v92 = v37;
  id v93 = v38;
  id v94 = v39;
  id v95 = v40;
  int64_t v96 = a29;
  id v68 = v40;
  id v67 = v39;
  id v66 = v38;
  id v65 = v37;
  id v64 = v36;
  id v63 = v35;
  id v62 = v34;
  id v61 = v33;
  id v60 = v32;
  id v59 = v31;
  id v58 = v30;
  id v72 = v71;
  id v74 = v73;
  id v76 = v75;
  id v78 = v77;
  id v41 = a13;
  id v42 = a12;
  id v43 = a11;
  id v44 = a10;
  id v45 = a8;
  id v46 = a7;
  id v47 = a6;
  id v48 = a4;
  id v49 = a3;
  v50 = _Block_copy(aBlock);
  v79.receiver = a1;
  v79.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestResult;
  id v70 = objc_msgSendSuper2(&v79, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v49, v48, v69, v47, v46, v45, a9, v44, v43, v42, v41, a14, v50);

  return v70;
}

uint64_t __450__HKDiagnosticTestResult__newDiagnosticTestResultWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_diagnosticTestCodingCollection_value_referenceRanges_effectiveStartDate_category_categoriesCodingCollections_issueDate_effectiveEndDate_statusCoding_interpretationCodingCollections_comments_bodySiteCodingCollection_methodCodingCollection_performers_referenceRangeStatus_config___block_invoke(uint64_t a1, void *a2)
{
  id v33 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  uint64_t v4 = (void *)v33[22];
  v33[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)v33[23];
  v33[23] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  v8 = (void *)v33[24];
  v33[24] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v33[25];
  v33[25] = v9;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v33[26];
  v33[26] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  v14 = (void *)v33[27];
  v33[27] = v13;

  uint64_t v15 = [*(id *)(a1 + 80) copy];
  v16 = (void *)v33[28];
  v33[28] = v15;

  uint64_t v17 = [*(id *)(a1 + 88) copy];
  v18 = (void *)v33[29];
  v33[29] = v17;

  uint64_t v19 = [*(id *)(a1 + 96) copy];
  v20 = (void *)v33[30];
  v33[30] = v19;

  uint64_t v21 = [*(id *)(a1 + 104) copy];
  v22 = (void *)v33[31];
  v33[31] = v21;

  uint64_t v23 = [*(id *)(a1 + 112) copy];
  v24 = (void *)v33[32];
  v33[32] = v23;

  uint64_t v25 = [*(id *)(a1 + 120) copy];
  v26 = (void *)v33[33];
  v33[33] = v25;

  uint64_t v27 = [*(id *)(a1 + 128) copy];
  v28 = (void *)v33[34];
  v33[34] = v27;

  uint64_t v29 = [*(id *)(a1 + 136) copy];
  id v30 = (void *)v33[35];
  v33[35] = v29;

  v33[36] = *(void *)(a1 + 152);
  uint64_t v31 = *(void *)(a1 + 144);
  if (v31) {
    (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v33);
  }

  return MEMORY[0x1F41817F8]();
}

- (HKDiagnosticTestResult)init
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
  v9.super_class = (Class)HKDiagnosticTestResult;
  v6 = [(HKSample *)&v9 description];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p super=%@diagnosticTestCodingCollection = %@value = %@referenceRanges = %@effectiveStartDate = %@category = %@categoriesCodingCollections = %@issueDate = %@effectiveEndDate = %@statusCoding = %@interpretationCodingCollections = %@comments = %@bodySiteCodingCollection = %@methodCodingCollection = %@performers = %@referenceRangeStatus = %ld>", v5, self, v6, self->_diagnosticTestCodingCollection, self->_value, self->_referenceRanges, self->_effectiveStartDate, self->_category, self->_categoriesCodingCollections, self->_issueDate, self->_effectiveEndDate, self->_statusCoding, self->_interpretationCodingCollections, self->_comments, self->_bodySiteCodingCollection, self->_methodCodingCollection,
    self->_performers,
  uint64_t v7 = self->_referenceRangeStatus);

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKDiagnosticTestResult;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_diagnosticTestCodingCollection, @"DiagnosticTestCodingCollection", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_value forKey:@"Value"];
  [v4 encodeObject:self->_referenceRanges forKey:@"ReferenceRanges"];
  [v4 encodeObject:self->_effectiveStartDate forKey:@"EffectiveStartDate"];
  [v4 encodeObject:self->_category forKey:@"Category"];
  [v4 encodeObject:self->_categoriesCodingCollections forKey:@"CategoriesCodingCollections"];
  [v4 encodeObject:self->_issueDate forKey:@"IssueDate"];
  [v4 encodeObject:self->_effectiveEndDate forKey:@"EffectiveEndDate"];
  [v4 encodeObject:self->_statusCoding forKey:@"StatusCoding"];
  [v4 encodeObject:self->_interpretationCodingCollections forKey:@"InterpretationCodingCollections"];
  [v4 encodeObject:self->_comments forKey:@"Comments"];
  [v4 encodeObject:self->_bodySiteCodingCollection forKey:@"BodySiteCodingCollection"];
  [v4 encodeObject:self->_methodCodingCollection forKey:@"MethodCodingCollection"];
  [v4 encodeObject:self->_performers forKey:@"Performers"];
  [v4 encodeInteger:self->_referenceRangeStatus forKey:@"ReferenceRangeStatus"];
  [v4 encodeObject:self->_diagnosticTest forKey:@"DiagnosticTest"];
  [v4 encodeObject:self->_categories forKey:@"Categories"];
  [v4 encodeObject:self->_status forKey:@"Status"];
  [v4 encodeObject:self->_interpretation forKey:@"Interpretation"];
  [v4 encodeObject:self->_bodySite forKey:@"BodySite"];
  [v4 encodeObject:self->_method forKey:@"Method"];
}

- (HKDiagnosticTestResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)HKDiagnosticTestResult;
  objc_super v5 = [(HKMedicalRecord *)&v53 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DiagnosticTestCodingCollection"];
    diagnosticTestCodingCollection = v5->_diagnosticTestCodingCollection;
    v5->_diagnosticTestCodingCollection = (HKMedicalCodingCollection *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Value"];
    value = v5->_value;
    v5->_value = (HKInspectableValueCollection *)v8;

    v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"ReferenceRanges"];
    referenceRanges = v5->_referenceRanges;
    v5->_referenceRanges = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EffectiveStartDate"];
    effectiveStartDate = v5->_effectiveStartDate;
    v5->_effectiveStartDate = (HKMedicalDate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Category"];
    category = v5->_category;
    v5->_category = (NSString *)v15;

    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"CategoriesCodingCollections"];
    categoriesCodingCollections = v5->_categoriesCodingCollections;
    v5->_categoriesCodingCollections = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IssueDate"];
    issueDate = v5->_issueDate;
    v5->_issueDate = (HKMedicalDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EffectiveEndDate"];
    effectiveEndDate = v5->_effectiveEndDate;
    v5->_effectiveEndDate = (HKMedicalDate *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusCoding"];
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v24;

    v26 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"InterpretationCodingCollections"];
    interpretationCodingCollections = v5->_interpretationCodingCollections;
    v5->_interpretationCodingCollections = (NSArray *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Comments"];
    comments = v5->_comments;
    v5->_comments = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BodySiteCodingCollection"];
    bodySiteCodingCollection = v5->_bodySiteCodingCollection;
    v5->_bodySiteCodingCollection = (HKMedicalCodingCollection *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MethodCodingCollection"];
    methodCodingCollection = v5->_methodCodingCollection;
    v5->_methodCodingCollection = (HKMedicalCodingCollection *)v33;

    id v35 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"Performers"];
    performers = v5->_performers;
    v5->_performers = (NSArray *)v36;

    v5->_referenceRangeStatus = [v4 decodeIntegerForKey:@"ReferenceRangeStatus"];
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DiagnosticTest"];
    diagnosticTest = v5->_diagnosticTest;
    v5->_diagnosticTest = (HKConcept *)v38;

    id v40 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"Categories"];
    categories = v5->_categories;
    v5->_categories = (NSArray *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Status"];
    status = v5->_status;
    v5->_status = (HKConcept *)v43;

    id v45 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"Interpretation"];
    interpretation = v5->_interpretation;
    v5->_interpretation = (NSArray *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BodySite"];
    bodySite = v5->_bodySite;
    v5->_bodySite = (HKConcept *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Method"];
    method = v5->_method;
    v5->_method = (HKConcept *)v50;
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
    v131.receiver = self;
    v131.super_class = (Class)HKDiagnosticTestResult;
    if (![(HKMedicalRecord *)&v131 isEquivalent:v5]) {
      goto LABEL_105;
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self diagnosticTestCodingCollection];
    uint64_t v7 = [v5 diagnosticTestCodingCollection];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v5 diagnosticTestCodingCollection];
      if (!v9) {
        goto LABEL_104;
      }
      v10 = (void *)v9;
      uint64_t v11 = [(HKDiagnosticTestResult *)self diagnosticTestCodingCollection];
      v12 = [v5 diagnosticTestCodingCollection];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self value];
    uint64_t v15 = [v5 value];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      uint64_t v8 = (void *)v15;
      uint64_t v16 = [v5 value];
      if (!v16) {
        goto LABEL_104;
      }
      uint64_t v17 = (void *)v16;
      uint64_t v18 = [(HKDiagnosticTestResult *)self value];
      uint64_t v19 = [v5 value];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self referenceRanges];
    uint64_t v21 = [v5 referenceRanges];
    if (v6 == (void *)v21)
    {
    }
    else
    {
      uint64_t v8 = (void *)v21;
      uint64_t v22 = [v5 referenceRanges];
      if (!v22) {
        goto LABEL_104;
      }
      uint64_t v23 = (void *)v22;
      uint64_t v24 = [(HKDiagnosticTestResult *)self referenceRanges];
      uint64_t v25 = [v5 referenceRanges];
      int v26 = [v24 isEqualToArray:v25];

      if (!v26) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self effectiveStartDate];
    uint64_t v27 = [v5 effectiveStartDate];
    if (v6 == (void *)v27)
    {
    }
    else
    {
      uint64_t v8 = (void *)v27;
      uint64_t v28 = [v5 effectiveStartDate];
      if (!v28) {
        goto LABEL_104;
      }
      uint64_t v29 = (void *)v28;
      id v30 = [(HKDiagnosticTestResult *)self effectiveStartDate];
      uint64_t v31 = [v5 effectiveStartDate];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self category];
    uint64_t v33 = [v5 category];
    if (v6 == (void *)v33)
    {
    }
    else
    {
      uint64_t v8 = (void *)v33;
      uint64_t v34 = [v5 category];
      if (!v34) {
        goto LABEL_104;
      }
      id v35 = (void *)v34;
      uint64_t v36 = [(HKDiagnosticTestResult *)self category];
      id v37 = [v5 category];
      int v38 = [v36 isEqualToString:v37];

      if (!v38) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self categoriesCodingCollections];
    uint64_t v39 = [v5 categoriesCodingCollections];
    if (v6 == (void *)v39)
    {
    }
    else
    {
      uint64_t v8 = (void *)v39;
      uint64_t v40 = [v5 categoriesCodingCollections];
      if (!v40) {
        goto LABEL_104;
      }
      uint64_t v41 = (void *)v40;
      id v42 = [(HKDiagnosticTestResult *)self categoriesCodingCollections];
      uint64_t v43 = [v5 categoriesCodingCollections];
      int v44 = [v42 isEqualToArray:v43];

      if (!v44) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self issueDate];
    uint64_t v45 = [v5 issueDate];
    if (v6 == (void *)v45)
    {
    }
    else
    {
      uint64_t v8 = (void *)v45;
      uint64_t v46 = [v5 issueDate];
      if (!v46) {
        goto LABEL_104;
      }
      id v47 = (void *)v46;
      uint64_t v48 = [(HKDiagnosticTestResult *)self issueDate];
      id v49 = [v5 issueDate];
      int v50 = [v48 isEqual:v49];

      if (!v50) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self effectiveEndDate];
    uint64_t v51 = [v5 effectiveEndDate];
    if (v6 == (void *)v51)
    {
    }
    else
    {
      uint64_t v8 = (void *)v51;
      uint64_t v52 = [v5 effectiveEndDate];
      if (!v52) {
        goto LABEL_104;
      }
      objc_super v53 = (void *)v52;
      id v54 = [(HKDiagnosticTestResult *)self effectiveEndDate];
      id v55 = [v5 effectiveEndDate];
      int v56 = [v54 isEqual:v55];

      if (!v56) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self statusCoding];
    uint64_t v57 = [v5 statusCoding];
    if (v6 == (void *)v57)
    {
    }
    else
    {
      uint64_t v8 = (void *)v57;
      uint64_t v58 = [v5 statusCoding];
      if (!v58) {
        goto LABEL_104;
      }
      id v59 = (void *)v58;
      id v60 = [(HKDiagnosticTestResult *)self statusCoding];
      id v61 = [v5 statusCoding];
      int v62 = [v60 isEqual:v61];

      if (!v62) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self interpretationCodingCollections];
    uint64_t v63 = [v5 interpretationCodingCollections];
    if (v6 == (void *)v63)
    {
    }
    else
    {
      uint64_t v8 = (void *)v63;
      uint64_t v64 = [v5 interpretationCodingCollections];
      if (!v64) {
        goto LABEL_104;
      }
      id v65 = (void *)v64;
      id v66 = [(HKDiagnosticTestResult *)self interpretationCodingCollections];
      id v67 = [v5 interpretationCodingCollections];
      int v68 = [v66 isEqualToArray:v67];

      if (!v68) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self comments];
    uint64_t v69 = [v5 comments];
    if (v6 == (void *)v69)
    {
    }
    else
    {
      uint64_t v8 = (void *)v69;
      uint64_t v70 = [v5 comments];
      if (!v70) {
        goto LABEL_104;
      }
      id v71 = (void *)v70;
      id v72 = [(HKDiagnosticTestResult *)self comments];
      id v73 = [v5 comments];
      int v74 = [v72 isEqualToString:v73];

      if (!v74) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self bodySiteCodingCollection];
    uint64_t v75 = [v5 bodySiteCodingCollection];
    if (v6 == (void *)v75)
    {
    }
    else
    {
      uint64_t v8 = (void *)v75;
      uint64_t v76 = [v5 bodySiteCodingCollection];
      if (!v76) {
        goto LABEL_104;
      }
      id v77 = (void *)v76;
      id v78 = [(HKDiagnosticTestResult *)self bodySiteCodingCollection];
      objc_super v79 = [v5 bodySiteCodingCollection];
      int v80 = [v78 isEqual:v79];

      if (!v80) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self methodCodingCollection];
    uint64_t v81 = [v5 methodCodingCollection];
    if (v6 == (void *)v81)
    {
    }
    else
    {
      uint64_t v8 = (void *)v81;
      uint64_t v82 = [v5 methodCodingCollection];
      if (!v82) {
        goto LABEL_104;
      }
      id v83 = (void *)v82;
      id v84 = [(HKDiagnosticTestResult *)self methodCodingCollection];
      id v85 = [v5 methodCodingCollection];
      int v86 = [v84 isEqual:v85];

      if (!v86) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self performers];
    uint64_t v87 = [v5 performers];
    if (v6 == (void *)v87)
    {
    }
    else
    {
      uint64_t v8 = (void *)v87;
      uint64_t v88 = [v5 performers];
      if (!v88) {
        goto LABEL_104;
      }
      id v89 = (void *)v88;
      id v90 = [(HKDiagnosticTestResult *)self performers];
      id v91 = [v5 performers];
      int v92 = [v90 isEqualToArray:v91];

      if (!v92) {
        goto LABEL_105;
      }
    }
    int64_t v93 = [(HKDiagnosticTestResult *)self referenceRangeStatus];
    if (v93 != [v5 referenceRangeStatus]) {
      goto LABEL_105;
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self diagnosticTest];
    uint64_t v94 = [v5 diagnosticTest];
    if (v6 == (void *)v94)
    {
    }
    else
    {
      uint64_t v8 = (void *)v94;
      uint64_t v95 = [v5 diagnosticTest];
      if (!v95) {
        goto LABEL_104;
      }
      int64_t v96 = (void *)v95;
      v97 = [(HKDiagnosticTestResult *)self diagnosticTest];
      v98 = [v5 diagnosticTest];
      int v99 = [v97 isEqual:v98];

      if (!v99) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self categories];
    uint64_t v100 = [v5 categories];
    if (v6 == (void *)v100)
    {
    }
    else
    {
      uint64_t v8 = (void *)v100;
      uint64_t v101 = [v5 categories];
      if (!v101) {
        goto LABEL_104;
      }
      v102 = (void *)v101;
      v103 = [(HKDiagnosticTestResult *)self categories];
      v104 = [v5 categories];
      int v105 = [v103 isEqualToArray:v104];

      if (!v105) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self status];
    uint64_t v106 = [v5 status];
    if (v6 == (void *)v106)
    {
    }
    else
    {
      uint64_t v8 = (void *)v106;
      uint64_t v107 = [v5 status];
      if (!v107) {
        goto LABEL_104;
      }
      v108 = (void *)v107;
      v109 = [(HKDiagnosticTestResult *)self status];
      v110 = [v5 status];
      int v111 = [v109 isEqual:v110];

      if (!v111) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self interpretation];
    uint64_t v112 = [v5 interpretation];
    if (v6 == (void *)v112)
    {
    }
    else
    {
      uint64_t v8 = (void *)v112;
      uint64_t v113 = [v5 interpretation];
      if (!v113) {
        goto LABEL_104;
      }
      v114 = (void *)v113;
      v115 = [(HKDiagnosticTestResult *)self interpretation];
      v116 = [v5 interpretation];
      int v117 = [v115 isEqualToArray:v116];

      if (!v117) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self bodySite];
    uint64_t v118 = [v5 bodySite];
    if (v6 == (void *)v118)
    {
    }
    else
    {
      uint64_t v8 = (void *)v118;
      uint64_t v119 = [v5 bodySite];
      if (!v119) {
        goto LABEL_104;
      }
      v120 = (void *)v119;
      v121 = [(HKDiagnosticTestResult *)self bodySite];
      v122 = [v5 bodySite];
      int v123 = [v121 isEqual:v122];

      if (!v123) {
        goto LABEL_105;
      }
    }
    uint64_t v6 = [(HKDiagnosticTestResult *)self method];
    uint64_t v124 = [v5 method];
    if (v6 == (void *)v124)
    {

LABEL_109:
      BOOL v14 = 1;
      goto LABEL_106;
    }
    uint64_t v8 = (void *)v124;
    uint64_t v125 = [v5 method];
    if (v125)
    {
      v126 = (void *)v125;
      v127 = [(HKDiagnosticTestResult *)self method];
      v128 = [v5 method];
      char v129 = [v127 isEqual:v128];

      if (v129) {
        goto LABEL_109;
      }
LABEL_105:
      BOOL v14 = 0;
LABEL_106:

      goto LABEL_107;
    }
LABEL_104:

    goto LABEL_105;
  }
  BOOL v14 = 0;
LABEL_107:

  return v14;
}

- (id)statusCodingCollection
{
  v2 = [(HKDiagnosticTestResult *)self statusCoding];
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

  id v8 = [(HKDiagnosticTestResult *)self diagnosticTestCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  diagnosticTest = self->_diagnosticTest;
  self->_diagnosticTest = v6;
}

- (HKInspectableValueCollection)value
{
  return self->_value;
}

- (void)_setValue:(id)a3
{
  self->_value = (HKInspectableValueCollection *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSArray)referenceRanges
{
  return self->_referenceRanges;
}

- (void)_setReferenceRanges:(id)a3
{
  self->_referenceRanges = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKMedicalDate)effectiveStartDate
{
  return self->_effectiveStartDate;
}

- (void)_setEffectiveStartDate:(id)a3
{
  self->_effectiveStartDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)category
{
  return self->_category;
}

- (void)_setCategory:(id)a3
{
  self->_category = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSArray)categoriesCodingCollections
{
  return self->_categoriesCodingCollections;
}

- (void)_setCategoriesCodingCollections:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  categoriesCodingCollections = self->_categoriesCodingCollections;
  self->_categoriesCodingCollections = v4;

  id v8 = [(HKDiagnosticTestResult *)self categoriesCodingCollections];
  objc_msgSend(v8, "hk_map:", &__block_literal_global_71);
  uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  categories = self->_categories;
  self->_categories = v6;
}

id __58__HKDiagnosticTestResult__setCategoriesCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (HKMedicalDate)issueDate
{
  return self->_issueDate;
}

- (void)_setIssueDate:(id)a3
{
  self->_issueDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKMedicalDate)effectiveEndDate
{
  return self->_effectiveEndDate;
}

- (void)_setEffectiveEndDate:(id)a3
{
  self->_effectiveEndDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
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

  id v8 = [(HKDiagnosticTestResult *)self statusCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  status = self->_status;
  self->_status = v6;
}

- (NSArray)interpretationCodingCollections
{
  return self->_interpretationCodingCollections;
}

- (void)_setInterpretationCodingCollections:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  interpretationCodingCollections = self->_interpretationCodingCollections;
  self->_interpretationCodingCollections = v4;

  if (self->_interpretationCodingCollections)
  {
    uint64_t v9 = [(HKDiagnosticTestResult *)self interpretationCodingCollections];
    uint64_t v6 = [(NSArray *)v9 hk_map:&__block_literal_global_157];
    interpretation = self->_interpretation;
    self->_interpretation = v6;

    id v8 = v9;
  }
  else
  {
    id v8 = self->_interpretation;
    self->_interpretation = 0;
  }
}

id __62__HKDiagnosticTestResult__setInterpretationCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (NSString)comments
{
  return self->_comments;
}

- (void)_setComments:(id)a3
{
  self->_comments = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKMedicalCodingCollection)bodySiteCodingCollection
{
  return self->_bodySiteCodingCollection;
}

- (void)_setBodySiteCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  bodySiteCodingCollection = self->_bodySiteCodingCollection;
  self->_bodySiteCodingCollection = v4;

  if (self->_bodySiteCodingCollection)
  {
    uint64_t v9 = [(HKDiagnosticTestResult *)self bodySiteCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    bodySite = self->_bodySite;
    self->_bodySite = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_bodySite;
    self->_bodySite = 0;
  }
}

- (HKMedicalCodingCollection)methodCodingCollection
{
  return self->_methodCodingCollection;
}

- (void)_setMethodCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  methodCodingCollection = self->_methodCodingCollection;
  self->_methodCodingCollection = v4;

  if (self->_methodCodingCollection)
  {
    uint64_t v9 = [(HKDiagnosticTestResult *)self methodCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    method = self->_method;
    self->_method = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_method;
    self->_method = 0;
  }
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)_setPerformers:(id)a3
{
  self->_performers = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int64_t)referenceRangeStatus
{
  return self->_referenceRangeStatus;
}

- (void)_setReferenceRangeStatus:(int64_t)a3
{
  self->_referenceRangeStatus = a3;
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
    id v4 = [(HKDiagnosticTestResult *)self diagnosticTestCodingCollection];
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
      -[HKDiagnosticTestResult _setDiagnosticTest:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  int v13 = (HKConcept *)[v4 copy];
  diagnosticTest = self->_diagnosticTest;
  self->_diagnosticTest = v13;
}

- (NSArray)categories
{
  categories = self->_categories;
  if (categories)
  {
    uint64_t v3 = categories;
  }
  else
  {
    id v4 = [(HKDiagnosticTestResult *)self categoriesCodingCollections];
    objc_msgSend(v4, "hk_map:", &__block_literal_global_159);
    uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id __36__HKDiagnosticTestResult_categories__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setCategories:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKDiagnosticTestResult _setCategories:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  int v13 = (NSArray *)[v4 copy];
  categories = self->_categories;
  self->_categories = v13;
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
    id v4 = [(HKDiagnosticTestResult *)self statusCodingCollection];
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
      -[HKDiagnosticTestResult _setStatus:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  int v13 = (HKConcept *)[v4 copy];
  status = self->_status;
  self->_status = v13;
}

- (NSArray)interpretation
{
  if (self->_interpretationCodingCollections)
  {
    interpretation = self->_interpretation;
    if (interpretation)
    {
      uint64_t v3 = interpretation;
    }
    else
    {
      id v4 = [(HKDiagnosticTestResult *)self interpretationCodingCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_161);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __40__HKDiagnosticTestResult_interpretation__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setInterpretation:(id)a3
{
  self->_interpretation = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKConcept)bodySite
{
  if (self->_bodySiteCodingCollection)
  {
    bodySite = self->_bodySite;
    if (bodySite)
    {
      uint64_t v3 = bodySite;
    }
    else
    {
      id v4 = [(HKDiagnosticTestResult *)self bodySiteCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setBodySite:(id)a3
{
  self->_bodySite = (HKConcept *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKConcept)method
{
  if (self->_methodCodingCollection)
  {
    method = self->_method;
    if (method)
    {
      uint64_t v3 = method;
    }
    else
    {
      id v4 = [(HKDiagnosticTestResult *)self methodCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setMethod:(id)a3
{
  self->_method = (HKConcept *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKDiagnosticTestResult;
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
      if (self->_category)
      {
        if (self->_categoriesCodingCollections)
        {
          if (self->_statusCoding)
          {
            uint64_t v8 = 0;
            goto LABEL_14;
          }
          uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v10 = objc_opt_class();
          uint64_t v11 = @"%@: statusCoding must not be nil";
        }
        else
        {
          uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v10 = objc_opt_class();
          uint64_t v11 = @"%@: categoriesCodingCollections must not be nil";
        }
      }
      else
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = @"%@: category must not be nil";
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
  uint64_t v8 = v7;
LABEL_14:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_bodySite, 0);
  objc_storeStrong((id *)&self->_interpretation, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_diagnosticTest, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_methodCodingCollection, 0);
  objc_storeStrong((id *)&self->_bodySiteCodingCollection, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_interpretationCodingCollections, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_effectiveEndDate, 0);
  objc_storeStrong((id *)&self->_issueDate, 0);
  objc_storeStrong((id *)&self->_categoriesCodingCollections, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_effectiveStartDate, 0);
  objc_storeStrong((id *)&self->_referenceRanges, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_diagnosticTestCodingCollection, 0);
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

+ (id)indexableConceptKeyPaths
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestResult;
  v2 = objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"diagnosticTest"];
  [v3 addObject:@"categories"];
  [v3 addObject:@"status"];
  [v3 addObject:@"interpretation"];
  [v3 addObject:@"bodySite"];
  [v3 addObject:@"method"];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestResult;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  uint64_t v8 = v7;
  if (!v7)
  {
    objc_super v13 = 0;
    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"diagnosticTest"])
  {
    uint64_t v9 = [(HKDiagnosticTestResult *)self diagnosticTestCodingCollection];
    uint64_t v10 = +[HKIndexableObject indexableObjectWithObject:v9];
    v26[0] = v10;
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = (void **)v26;
LABEL_4:
    objc_super v13 = [v11 arrayWithObjects:v12 count:1];

    goto LABEL_12;
  }
  if ([v8 isEqualToString:@"categories"])
  {
    uint64_t v14 = [(HKDiagnosticTestResult *)self categoriesCodingCollections];
LABEL_8:
    uint64_t v15 = (void *)v14;
    objc_super v13 = +[HKConceptIndexUtilities indexedCodingsForCodingCollections:v14 context:v6 error:a4];
LABEL_11:

    goto LABEL_12;
  }
  if ([v8 isEqualToString:@"status"])
  {
    uint64_t v15 = [(HKDiagnosticTestResult *)self statusCoding];
    uint64_t v16 = +[HKMedicalCodingCollection collectionWithCoding:v15];
    uint64_t v17 = +[HKIndexableObject indexableObjectWithObject:v16];
    uint64_t v25 = v17;
    objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];

    goto LABEL_11;
  }
  if ([v8 isEqualToString:@"interpretation"])
  {
    uint64_t v19 = [(HKDiagnosticTestResult *)self interpretationCodingCollections];

    if (v19)
    {
      uint64_t v14 = [(HKDiagnosticTestResult *)self interpretationCodingCollections];
      goto LABEL_8;
    }
    goto LABEL_24;
  }
  if ([v8 isEqualToString:@"bodySite"])
  {
    int v20 = [(HKDiagnosticTestResult *)self bodySiteCodingCollection];

    if (v20)
    {
      uint64_t v9 = [(HKDiagnosticTestResult *)self bodySiteCodingCollection];
      uint64_t v10 = +[HKIndexableObject indexableObjectWithObject:v9];
      uint64_t v24 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = &v24;
      goto LABEL_4;
    }
    goto LABEL_24;
  }
  if ([v8 isEqualToString:@"method"])
  {
    uint64_t v21 = [(HKDiagnosticTestResult *)self methodCodingCollection];

    if (v21)
    {
      uint64_t v9 = [(HKDiagnosticTestResult *)self methodCodingCollection];
      uint64_t v10 = +[HKIndexableObject indexableObjectWithObject:v9];
      uint64_t v23 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = &v23;
      goto LABEL_4;
    }
LABEL_24:
    objc_super v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_12;
  }
  v22.receiver = self;
  v22.super_class = (Class)HKDiagnosticTestResult;
  objc_super v13 = [(HKMedicalRecord *)&v22 codingsForKeyPath:v6 error:a4];
LABEL_12:

  return v13;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_13;
  }
  if (![v10 isEqualToString:@"diagnosticTest"])
  {
    if ([v11 isEqualToString:@"categories"])
    {
      objc_super v13 = [(HKDiagnosticTestResult *)self categoriesCodingCollections];
      uint64_t v14 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v13 count], v9, a5);

      LOBYTE(a5) = v14 != 0;
      if (v14) {
        [(HKDiagnosticTestResult *)self _setCategories:v14];
      }
LABEL_9:

      goto LABEL_14;
    }
    if ([v11 isEqualToString:@"status"])
    {
      if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
      {
        a5 = [v8 firstObject];
        uint64_t v12 = [a5 object];
        [(HKDiagnosticTestResult *)self _setStatus:v12];
        goto LABEL_5;
      }
LABEL_13:
      LOBYTE(a5) = 0;
      goto LABEL_14;
    }
    if ([v11 isEqualToString:@"interpretation"])
    {
      uint64_t v16 = [(HKDiagnosticTestResult *)self interpretationCodingCollections];

      if (v16)
      {
        uint64_t v17 = [(HKDiagnosticTestResult *)self interpretationCodingCollections];
        uint64_t v14 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v17 count], v9, a5);

        LOBYTE(a5) = v14 != 0;
        if (v14) {
          [(HKDiagnosticTestResult *)self _setInterpretation:v14];
        }
        goto LABEL_9;
      }
      BOOL v22 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
    }
    else
    {
      if ([v11 isEqualToString:@"bodySite"])
      {
        uint64_t v18 = [v8 count];
        uint64_t v19 = [(HKDiagnosticTestResult *)self bodySiteCodingCollection];
        LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v18, v19 != 0, (uint64_t)v9, (uint64_t)a5);

        if (!a5) {
          goto LABEL_14;
        }
        a5 = [v8 firstObject];
        uint64_t v12 = [a5 object];
        [(HKDiagnosticTestResult *)self _setBodySite:v12];
        goto LABEL_5;
      }
      if ([v11 isEqualToString:@"method"])
      {
        uint64_t v20 = [v8 count];
        uint64_t v21 = [(HKDiagnosticTestResult *)self methodCodingCollection];
        LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v20, v21 != 0, (uint64_t)v9, (uint64_t)a5);

        if (!a5) {
          goto LABEL_14;
        }
        a5 = [v8 firstObject];
        uint64_t v12 = [a5 object];
        [(HKDiagnosticTestResult *)self _setMethod:v12];
        goto LABEL_5;
      }
      v23.receiver = self;
      v23.super_class = (Class)HKDiagnosticTestResult;
      BOOL v22 = [(HKMedicalRecord *)&v23 applyConcepts:v8 forKeyPath:v9 error:a5];
    }
    LOBYTE(a5) = v22;
    goto LABEL_14;
  }
  if (!HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5)) {
    goto LABEL_13;
  }
  a5 = [v8 firstObject];
  uint64_t v12 = [a5 object];
  [(HKDiagnosticTestResult *)self _setDiagnosticTest:v12];
LABEL_5:

  LOBYTE(a5) = 1;
LABEL_14:

  return (char)a5;
}

- (void)_setDiagnosticTest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setCategories:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end