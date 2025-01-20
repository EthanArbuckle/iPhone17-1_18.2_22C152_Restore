@interface HKClinicalNoteRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newClinicalNoteRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 documentTypeCodingCollection:(id)a16 noteCreationDate:(id)a17 categoriesCodingCollections:(id)a18 relevantStartDate:(id)a19 relevantEndDate:(id)a20 authors:(id)a21 config:(id)a22;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)clinicalNoteRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 statusCoding:(id)a14 documentTypeCodingCollection:(id)a15 noteCreationDate:(id)a16 categoriesCodingCollections:(id)a17 relevantStartDate:(id)a18 relevantEndDate:(id)a19 authors:(id)a20;
+ (id)clinicalNoteRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 documentTypeCodingCollection:(id)a16 noteCreationDate:(id)a17 categoriesCodingCollections:(id)a18 relevantStartDate:(id)a19 relevantEndDate:(id)a20 authors:(id)a21;
+ (id)defaultDisplayString;
+ (id)indexableConceptKeyPaths;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (HKClinicalNoteRecord)init;
- (HKClinicalNoteRecord)initWithCoder:(id)a3;
- (HKConcept)documentType;
- (HKConcept)status;
- (HKMedicalCoding)statusCoding;
- (HKMedicalCodingCollection)documentTypeCodingCollection;
- (HKMedicalDate)noteCreationDate;
- (HKMedicalDate)relevantEndDate;
- (HKMedicalDate)relevantStartDate;
- (NSArray)authors;
- (NSArray)categories;
- (NSArray)categoriesCodingCollections;
- (NSString)description;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)medicalRecordCodings;
- (id)statusCodingCollection;
- (int64_t)recordCategoryType;
- (void)_setAuthors:(id)a3;
- (void)_setCategories:(id)a3;
- (void)_setCategoriesCodingCollections:(id)a3;
- (void)_setDocumentType:(id)a3;
- (void)_setDocumentTypeCodingCollection:(id)a3;
- (void)_setNoteCreationDate:(id)a3;
- (void)_setRelevantEndDate:(id)a3;
- (void)_setRelevantStartDate:(id)a3;
- (void)_setStatus:(id)a3;
- (void)_setStatusCoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalNoteRecord

+ (id)clinicalNoteRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 statusCoding:(id)a14 documentTypeCodingCollection:(id)a15 noteCreationDate:(id)a16 categoriesCodingCollections:(id)a17 relevantStartDate:(id)a18 relevantEndDate:(id)a19 authors:(id)a20
{
  BOOL v40 = a5;
  id v49 = a3;
  id v48 = a4;
  id v24 = a6;
  id v43 = a7;
  id v42 = a8;
  id v47 = a10;
  id v46 = a11;
  id v45 = a12;
  id v44 = a14;
  id v25 = a15;
  id v26 = a16;
  id v39 = a17;
  id v27 = a18;
  id v38 = a19;
  id v28 = a20;
  v29 = @"modifiedDate";
  id v30 = v24;
  v31 = v30;
  if (v26)
  {
    v32 = @"noteCreationDate";

    v33 = [v26 dateForUTC];

    v29 = v32;
    if (!v27) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v33 = v30;
  if (v27)
  {
LABEL_3:
    v34 = @"relevantStartDate";

    uint64_t v35 = [v27 dateForUTC];

    v33 = (void *)v35;
    v29 = v34;
  }
LABEL_4:
  v36 = +[HKSemanticDate semanticDateWithKeyPath:v29 date:v33];
  +[HKClinicalNoteRecord clinicalNoteRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:documentTypeCodingCollection:noteCreationDate:categoriesCodingCollections:relevantStartDate:relevantEndDate:authors:](HKClinicalNoteRecord, "clinicalNoteRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:documentTypeCodingCollection:noteCreationDate:categoriesCodingCollections:relevantStartDate:relevantEndDate:authors:", v49, v48, v40, v31, v43, v42, a9, v47, v46, v36, v45, a13, v44, v25, v26,
    v39,
    v27,
    v38,
    v28);
  id v41 = (id)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)medicalRecordCodings
{
  v2 = [(HKClinicalNoteRecord *)self documentTypeCodingCollection];
  v3 = [v2 codings];

  return v3;
}

+ (id)defaultDisplayString
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"UNSPECIFIED_CLINICAL_NOTE" value:&stru_1EEC60288 table:@"Localizable-Clinical-Notes"];

  return v3;
}

- (int64_t)recordCategoryType
{
  return 10;
}

+ (id)clinicalNoteRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 documentTypeCodingCollection:(id)a16 noteCreationDate:(id)a17 categoriesCodingCollections:(id)a18 relevantStartDate:(id)a19 relevantEndDate:(id)a20 authors:(id)a21
{
  v21 = objc_msgSend(a1, "_newClinicalNoteRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:documentTypeCodingCollection:noteCreationDate:categoriesCodingCollections:relevantStartDate:relevantEndDate:authors:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17,
                  a18,
                  a19,
                  a20,
                  a21,
                  0);

  return v21;
}

+ (id)_newClinicalNoteRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 documentTypeCodingCollection:(id)a16 noteCreationDate:(id)a17 categoriesCodingCollections:(id)a18 relevantStartDate:(id)a19 relevantEndDate:(id)a20 authors:(id)a21 config:(id)a22
{
  BOOL v49 = a5;
  id v22 = a15;
  id v23 = a16;
  id v24 = a17;
  id v25 = a18;
  id v26 = a19;
  id v27 = a20;
  id v28 = a21;
  id v29 = a22;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __305__HKClinicalNoteRecord__newClinicalNoteRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_statusCoding_documentTypeCodingCollection_noteCreationDate_categoriesCodingCollections_relevantStartDate_relevantEndDate_authors_config___block_invoke;
  aBlock[3] = &unk_1E58C30B8;
  id v59 = v22;
  id v60 = v23;
  id v61 = v24;
  id v62 = v25;
  id v63 = v26;
  id v64 = v27;
  id v65 = v28;
  id v66 = v29;
  id v56 = v29;
  id v55 = v28;
  id v54 = v27;
  id v53 = v26;
  id v52 = v25;
  id v51 = v24;
  id v48 = v23;
  id v47 = v22;
  id v30 = a13;
  id v31 = a12;
  id v32 = a11;
  id v33 = a10;
  id v34 = a8;
  id v35 = a7;
  id v36 = a6;
  id v37 = a4;
  id v38 = a3;
  id v39 = _Block_copy(aBlock);
  v57.receiver = a1;
  v57.super_class = (Class)&OBJC_METACLASS___HKClinicalNoteRecord;
  id v50 = objc_msgSendSuper2(&v57, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v38, v37, v49, v36, v35, v34, a9, v33, v32, v31, v30, a14, v39);

  return v50;
}

void __305__HKClinicalNoteRecord__newClinicalNoteRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_statusCoding_documentTypeCodingCollection_noteCreationDate_categoriesCodingCollections_relevantStartDate_relevantEndDate_authors_config___block_invoke(uint64_t a1, void *a2)
{
  v18 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  v4 = (void *)v18[22];
  v18[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)v18[23];
  v18[23] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  v8 = (void *)v18[24];
  v18[24] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v18[25];
  v18[25] = v9;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v18[26];
  v18[26] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  v14 = (void *)v18[27];
  v18[27] = v13;

  uint64_t v15 = [*(id *)(a1 + 80) copy];
  v16 = (void *)v18[28];
  v18[28] = v15;

  uint64_t v17 = *(void *)(a1 + 88);
  if (v17) {
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }
}

- (HKClinicalNoteRecord)init
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
  v9.super_class = (Class)HKClinicalNoteRecord;
  v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@statusCoding = %@documentTypeCodingCollection = %@noteCreationDate = %@categoriesCodingCollections = %@relevantStartDate = %@relevantEndDate = %@authors = %@>", v5, self, v6, self->_statusCoding, self->_documentTypeCodingCollection, self->_noteCreationDate, self->_categoriesCodingCollections, self->_relevantStartDate, self->_relevantEndDate, self->_authors];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKClinicalNoteRecord;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, @"StatusCoding", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_documentTypeCodingCollection forKey:@"DocumentTypeCodingCollection"];
  [v4 encodeObject:self->_noteCreationDate forKey:@"NoteCreationDate"];
  [v4 encodeObject:self->_categoriesCodingCollections forKey:@"CategoriesCodingCollections"];
  [v4 encodeObject:self->_relevantStartDate forKey:@"RelevantStartDate"];
  [v4 encodeObject:self->_relevantEndDate forKey:@"RelevantEndDate"];
  [v4 encodeObject:self->_authors forKey:@"Authors"];
  [v4 encodeObject:self->_status forKey:@"Status"];
  [v4 encodeObject:self->_documentType forKey:@"DocumentType"];
  [v4 encodeObject:self->_categories forKey:@"Categories"];
}

- (HKClinicalNoteRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HKClinicalNoteRecord;
  objc_super v5 = [(HKMedicalRecord *)&v30 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusCoding"];
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentTypeCodingCollection"];
    documentTypeCodingCollection = v5->_documentTypeCodingCollection;
    v5->_documentTypeCodingCollection = (HKMedicalCodingCollection *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NoteCreationDate"];
    noteCreationDate = v5->_noteCreationDate;
    v5->_noteCreationDate = (HKMedicalDate *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"CategoriesCodingCollections"];
    categoriesCodingCollections = v5->_categoriesCodingCollections;
    v5->_categoriesCodingCollections = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RelevantStartDate"];
    relevantStartDate = v5->_relevantStartDate;
    v5->_relevantStartDate = (HKMedicalDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RelevantEndDate"];
    relevantEndDate = v5->_relevantEndDate;
    v5->_relevantEndDate = (HKMedicalDate *)v17;

    v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"Authors"];
    authors = v5->_authors;
    v5->_authors = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Status"];
    status = v5->_status;
    v5->_status = (HKConcept *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentType"];
    documentType = v5->_documentType;
    v5->_documentType = (HKConcept *)v24;

    id v26 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"Categories"];
    categories = v5->_categories;
    v5->_categories = (NSArray *)v27;
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
    v70.receiver = self;
    v70.super_class = (Class)HKClinicalNoteRecord;
    if (![(HKMedicalRecord *)&v70 isEquivalent:v5]) {
      goto LABEL_54;
    }
    uint64_t v6 = [(HKClinicalNoteRecord *)self statusCoding];
    uint64_t v7 = [v5 statusCoding];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v5 statusCoding];
      if (!v9) {
        goto LABEL_53;
      }
      uint64_t v10 = (void *)v9;
      uint64_t v11 = [(HKClinicalNoteRecord *)self statusCoding];
      v12 = [v5 statusCoding];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_54;
      }
    }
    uint64_t v6 = [(HKClinicalNoteRecord *)self documentTypeCodingCollection];
    uint64_t v15 = [v5 documentTypeCodingCollection];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      uint64_t v8 = (void *)v15;
      uint64_t v16 = [v5 documentTypeCodingCollection];
      if (!v16) {
        goto LABEL_53;
      }
      uint64_t v17 = (void *)v16;
      v18 = [(HKClinicalNoteRecord *)self documentTypeCodingCollection];
      v19 = [v5 documentTypeCodingCollection];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_54;
      }
    }
    uint64_t v6 = [(HKClinicalNoteRecord *)self noteCreationDate];
    uint64_t v21 = [v5 noteCreationDate];
    if (v6 == (void *)v21)
    {
    }
    else
    {
      uint64_t v8 = (void *)v21;
      uint64_t v22 = [v5 noteCreationDate];
      if (!v22) {
        goto LABEL_53;
      }
      id v23 = (void *)v22;
      uint64_t v24 = [(HKClinicalNoteRecord *)self noteCreationDate];
      id v25 = [v5 noteCreationDate];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_54;
      }
    }
    uint64_t v6 = [(HKClinicalNoteRecord *)self categoriesCodingCollections];
    uint64_t v27 = [v5 categoriesCodingCollections];
    if (v6 == (void *)v27)
    {
    }
    else
    {
      uint64_t v8 = (void *)v27;
      uint64_t v28 = [v5 categoriesCodingCollections];
      if (!v28) {
        goto LABEL_53;
      }
      id v29 = (void *)v28;
      objc_super v30 = [(HKClinicalNoteRecord *)self categoriesCodingCollections];
      id v31 = [v5 categoriesCodingCollections];
      int v32 = [v30 isEqualToArray:v31];

      if (!v32) {
        goto LABEL_54;
      }
    }
    uint64_t v6 = [(HKClinicalNoteRecord *)self relevantStartDate];
    uint64_t v33 = [v5 relevantStartDate];
    if (v6 == (void *)v33)
    {
    }
    else
    {
      uint64_t v8 = (void *)v33;
      uint64_t v34 = [v5 relevantStartDate];
      if (!v34) {
        goto LABEL_53;
      }
      id v35 = (void *)v34;
      id v36 = [(HKClinicalNoteRecord *)self relevantStartDate];
      id v37 = [v5 relevantStartDate];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_54;
      }
    }
    uint64_t v6 = [(HKClinicalNoteRecord *)self relevantEndDate];
    uint64_t v39 = [v5 relevantEndDate];
    if (v6 == (void *)v39)
    {
    }
    else
    {
      uint64_t v8 = (void *)v39;
      uint64_t v40 = [v5 relevantEndDate];
      if (!v40) {
        goto LABEL_53;
      }
      id v41 = (void *)v40;
      id v42 = [(HKClinicalNoteRecord *)self relevantEndDate];
      id v43 = [v5 relevantEndDate];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_54;
      }
    }
    uint64_t v6 = [(HKClinicalNoteRecord *)self authors];
    uint64_t v45 = [v5 authors];
    if (v6 == (void *)v45)
    {
    }
    else
    {
      uint64_t v8 = (void *)v45;
      uint64_t v46 = [v5 authors];
      if (!v46) {
        goto LABEL_53;
      }
      id v47 = (void *)v46;
      id v48 = [(HKClinicalNoteRecord *)self authors];
      BOOL v49 = [v5 authors];
      int v50 = [v48 isEqualToArray:v49];

      if (!v50) {
        goto LABEL_54;
      }
    }
    uint64_t v6 = [(HKClinicalNoteRecord *)self status];
    uint64_t v51 = [v5 status];
    if (v6 == (void *)v51)
    {
    }
    else
    {
      uint64_t v8 = (void *)v51;
      uint64_t v52 = [v5 status];
      if (!v52) {
        goto LABEL_53;
      }
      id v53 = (void *)v52;
      id v54 = [(HKClinicalNoteRecord *)self status];
      id v55 = [v5 status];
      int v56 = [v54 isEqual:v55];

      if (!v56) {
        goto LABEL_54;
      }
    }
    uint64_t v6 = [(HKClinicalNoteRecord *)self documentType];
    uint64_t v57 = [v5 documentType];
    if (v6 == (void *)v57)
    {
    }
    else
    {
      uint64_t v8 = (void *)v57;
      uint64_t v58 = [v5 documentType];
      if (!v58) {
        goto LABEL_53;
      }
      id v59 = (void *)v58;
      id v60 = [(HKClinicalNoteRecord *)self documentType];
      id v61 = [v5 documentType];
      int v62 = [v60 isEqual:v61];

      if (!v62) {
        goto LABEL_54;
      }
    }
    uint64_t v6 = [(HKClinicalNoteRecord *)self categories];
    uint64_t v63 = [v5 categories];
    if (v6 == (void *)v63)
    {

LABEL_58:
      BOOL v14 = 1;
      goto LABEL_55;
    }
    uint64_t v8 = (void *)v63;
    uint64_t v64 = [v5 categories];
    if (v64)
    {
      id v65 = (void *)v64;
      id v66 = [(HKClinicalNoteRecord *)self categories];
      v67 = [v5 categories];
      char v68 = [v66 isEqualToArray:v67];

      if (v68) {
        goto LABEL_58;
      }
LABEL_54:
      BOOL v14 = 0;
LABEL_55:

      goto LABEL_56;
    }
LABEL_53:

    goto LABEL_54;
  }
  BOOL v14 = 0;
LABEL_56:

  return v14;
}

- (id)statusCodingCollection
{
  v2 = [(HKClinicalNoteRecord *)self statusCoding];
  uint64_t v3 = +[HKMedicalCodingCollection collectionWithCoding:v2];

  return v3;
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

  id v8 = [(HKClinicalNoteRecord *)self statusCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  status = self->_status;
  self->_status = v6;
}

- (HKMedicalCodingCollection)documentTypeCodingCollection
{
  return self->_documentTypeCodingCollection;
}

- (void)_setDocumentTypeCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  documentTypeCodingCollection = self->_documentTypeCodingCollection;
  self->_documentTypeCodingCollection = v4;

  id v8 = [(HKClinicalNoteRecord *)self documentTypeCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  documentType = self->_documentType;
  self->_documentType = v6;
}

- (HKMedicalDate)noteCreationDate
{
  return self->_noteCreationDate;
}

- (void)_setNoteCreationDate:(id)a3
{
  self->_noteCreationDate = (HKMedicalDate *)[a3 copy];

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

  id v8 = [(HKClinicalNoteRecord *)self categoriesCodingCollections];
  objc_msgSend(v8, "hk_map:", &__block_literal_global_53);
  uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  categories = self->_categories;
  self->_categories = v6;
}

id __56__HKClinicalNoteRecord__setCategoriesCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (HKMedicalDate)relevantStartDate
{
  return self->_relevantStartDate;
}

- (void)_setRelevantStartDate:(id)a3
{
  self->_relevantStartDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKMedicalDate)relevantEndDate
{
  return self->_relevantEndDate;
}

- (void)_setRelevantEndDate:(id)a3
{
  self->_relevantEndDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSArray)authors
{
  return self->_authors;
}

- (void)_setAuthors:(id)a3
{
  self->_authors = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
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
    id v4 = [(HKClinicalNoteRecord *)self statusCodingCollection];
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
      -[HKClinicalNoteRecord _setStatus:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  int v13 = (HKConcept *)[v4 copy];
  status = self->_status;
  self->_status = v13;
}

- (HKConcept)documentType
{
  documentType = self->_documentType;
  if (documentType)
  {
    uint64_t v3 = documentType;
  }
  else
  {
    id v4 = [(HKClinicalNoteRecord *)self documentTypeCodingCollection];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setDocumentType:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKClinicalNoteRecord _setDocumentType:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  int v13 = (HKConcept *)[v4 copy];
  documentType = self->_documentType;
  self->_documentType = v13;
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
    id v4 = [(HKClinicalNoteRecord *)self categoriesCodingCollections];
    objc_msgSend(v4, "hk_map:", &__block_literal_global_89);
    uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id __34__HKClinicalNoteRecord_categories__block_invoke(uint64_t a1, uint64_t a2)
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
      -[HKClinicalNoteRecord _setCategories:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  int v13 = (NSArray *)[v4 copy];
  categories = self->_categories;
  self->_categories = v13;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKClinicalNoteRecord;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (self->_statusCoding)
    {
      if (self->_documentTypeCodingCollection)
      {
        if (self->_categoriesCodingCollections)
        {
          uint64_t v8 = 0;
          goto LABEL_12;
        }
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = @"%@: categoriesCodingCollections must not be nil";
      }
      else
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = @"%@: documentTypeCodingCollection must not be nil";
      }
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: statusCoding must not be nil";
    }
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v10, a2, v11, self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;
LABEL_12:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_documentType, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_relevantEndDate, 0);
  objc_storeStrong((id *)&self->_relevantStartDate, 0);
  objc_storeStrong((id *)&self->_categoriesCodingCollections, 0);
  objc_storeStrong((id *)&self->_noteCreationDate, 0);
  objc_storeStrong((id *)&self->_documentTypeCodingCollection, 0);

  objc_storeStrong((id *)&self->_statusCoding, 0);
}

+ (id)indexableConceptKeyPaths
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKClinicalNoteRecord;
  v2 = objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"status"];
  [v3 addObject:@"documentType"];
  [v3 addObject:@"categories"];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKClinicalNoteRecord;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"status"])
  {
    uint64_t v9 = [(HKClinicalNoteRecord *)self statusCoding];
    uint64_t v10 = +[HKMedicalCodingCollection collectionWithCoding:v9];
    uint64_t v11 = +[HKIndexableObject indexableObjectWithObject:v10];
    v16[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

LABEL_7:
LABEL_8:

    goto LABEL_9;
  }
  if ([v8 isEqualToString:@"documentType"])
  {
    uint64_t v9 = [(HKClinicalNoteRecord *)self documentTypeCodingCollection];
    uint64_t v10 = +[HKIndexableObject indexableObjectWithObject:v9];
    uint64_t v15 = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"categories"])
  {
    uint64_t v9 = [(HKClinicalNoteRecord *)self categoriesCodingCollections];
    uint64_t v12 = +[HKConceptIndexUtilities indexedCodingsForCodingCollections:v9 context:v6 error:a4];
    goto LABEL_8;
  }
  v14.receiver = self;
  v14.super_class = (Class)HKClinicalNoteRecord;
  uint64_t v12 = [(HKMedicalRecord *)&v14 codingsForKeyPath:v6 error:a4];
LABEL_9:

  return v12;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_9;
  }
  if ([v10 isEqualToString:@"status"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      uint64_t v12 = [v8 firstObject];
      objc_super v13 = [v12 object];
      [(HKClinicalNoteRecord *)self _setStatus:v13];
LABEL_8:

      unsigned __int8 v14 = 1;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ([v11 isEqualToString:@"documentType"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      uint64_t v12 = [v8 firstObject];
      objc_super v13 = [v12 object];
      [(HKClinicalNoteRecord *)self _setDocumentType:v13];
      goto LABEL_8;
    }
LABEL_9:
    unsigned __int8 v14 = 0;
    goto LABEL_10;
  }
  if ([v11 isEqualToString:@"categories"])
  {
    uint64_t v16 = [(HKClinicalNoteRecord *)self categoriesCodingCollections];
    uint64_t v17 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v16 count], v9, a5);

    unsigned __int8 v14 = v17 != 0;
    if (v17) {
      [(HKClinicalNoteRecord *)self _setCategories:v17];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HKClinicalNoteRecord;
    unsigned __int8 v14 = [(HKMedicalRecord *)&v18 applyConcepts:v8 forKeyPath:v9 error:a5];
  }
LABEL_10:

  return v14;
}

- (void)_setStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setDocumentType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setCategories:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end