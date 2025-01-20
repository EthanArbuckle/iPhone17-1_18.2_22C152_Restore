@interface CHSynthesisStyleInventoryStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAllDigits;
- (BOOL)isPersonalizationAvailable;
- (CHSynthesisStyleInventoryStatus)initWithCoder:(id)a3;
- (CHSynthesisStyleInventoryStatus)initWithIsPersonalizationAvailable:(BOOL)a3 personalizedSynthesisModelState:(int64_t)a4 personalizedSynthesisModelVersion:(id)a5;
- (CHSynthesisStyleInventoryStatus)initWithIsPersonalizationAvailable:(BOOL)a3 personalizedSynthesisModelState:(int64_t)a4 personalizedSynthesisModelVersion:(id)a5 hasAllDigits:(BOOL)a6 styleSampleCount:(int64_t)a7 samplesWithoutStylePredictionCount:(int64_t)a8 characterCoverage:(id)a9 inventoryStorageURL:(id)a10 inventoryRelativePath:(id)a11;
- (NSSet)characterCoverage;
- (NSString)inventoryRelativePath;
- (NSString)personalizedSynthesisModelVersion;
- (NSURL)inventoryStorageURL;
- (id)description;
- (int64_t)personalizedSynthesisModelState;
- (int64_t)samplesWithoutStylePredictionCount;
- (int64_t)styleSampleCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSynthesisStyleInventoryStatus

- (CHSynthesisStyleInventoryStatus)initWithIsPersonalizationAvailable:(BOOL)a3 personalizedSynthesisModelState:(int64_t)a4 personalizedSynthesisModelVersion:(id)a5
{
  return (CHSynthesisStyleInventoryStatus *)objc_msgSend_initWithIsPersonalizationAvailable_personalizedSynthesisModelState_personalizedSynthesisModelVersion_hasAllDigits_styleSampleCount_samplesWithoutStylePredictionCount_characterCoverage_inventoryStorageURL_inventoryRelativePath_(self, a2, a3, a4, (uint64_t)a5, 0, 0, 0, 0, 0, 0);
}

- (CHSynthesisStyleInventoryStatus)initWithIsPersonalizationAvailable:(BOOL)a3 personalizedSynthesisModelState:(int64_t)a4 personalizedSynthesisModelVersion:(id)a5 hasAllDigits:(BOOL)a6 styleSampleCount:(int64_t)a7 samplesWithoutStylePredictionCount:(int64_t)a8 characterCoverage:(id)a9 inventoryStorageURL:(id)a10 inventoryRelativePath:(id)a11
{
  id v15 = a5;
  id v16 = a9;
  id v17 = a10;
  id v18 = a11;
  v32.receiver = self;
  v32.super_class = (Class)CHSynthesisStyleInventoryStatus;
  v19 = [(CHSynthesisStyleInventoryStatus *)&v32 init];
  v20 = v19;
  if (v19)
  {
    v19->_isPersonalizationAvailable = a3;
    v19->_personalizedSynthesisModelState = a4;
    objc_storeStrong((id *)&v19->_personalizedSynthesisModelVersion, a5);
    if (os_variant_has_internal_diagnostics())
    {
      v20->_hasAllDigits = a6;
      v20->_styleSampleCount = a7;
      v20->_samplesWithoutStylePredictionCount = a8;
      uint64_t v26 = objc_msgSend_copy(v16, v21, v22, v23, v24, v25);
      characterCoverage = v20->_characterCoverage;
      v20->_characterCoverage = (NSSet *)v26;

      objc_storeStrong((id *)&v20->_inventoryStorageURL, a10);
      objc_storeStrong((id *)&v20->_inventoryRelativePath, a11);
    }
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v31 = a3;
  objc_msgSend_encodeBool_forKey_(v31, v4, self->_isPersonalizationAvailable, @"isPersonalizationAvailable", v5, v6);
  objc_msgSend_encodeInteger_forKey_(v31, v7, self->_personalizedSynthesisModelState, @"personalizedSynthesisModelState", v8, v9);
  objc_msgSend_encodeObject_forKey_(v31, v10, (uint64_t)self->_personalizedSynthesisModelVersion, @"personalizedSynthesisModelVersion", v11, v12);
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend_encodeBool_forKey_(v31, v13, self->_hasAllDigits, @"hasAllDigits", v14, v15);
    objc_msgSend_encodeInteger_forKey_(v31, v16, self->_styleSampleCount, @"styleSampleCount", v17, v18);
    objc_msgSend_encodeInteger_forKey_(v31, v19, self->_samplesWithoutStylePredictionCount, @"sampleWithoutStylePredictionCount", v20, v21);
    objc_msgSend_encodeObject_forKey_(v31, v22, (uint64_t)self->_characterCoverage, @"characterCoverage", v23, v24);
    objc_msgSend_encodeObject_forKey_(v31, v25, (uint64_t)self->_inventoryStorageURL, @"inventoryStorageURL", v26, v27);
    objc_msgSend_encodeObject_forKey_(v31, v28, (uint64_t)self->_inventoryRelativePath, @"inventoryRelativePath", v29, v30);
  }
}

- (CHSynthesisStyleInventoryStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CHSynthesisStyleInventoryStatus;
  uint64_t v9 = [(CHSynthesisStyleInventoryStatus *)&v58 init];
  if (v9)
  {
    v9->_isPersonalizationAvailable = objc_msgSend_decodeBoolForKey_(v4, v5, @"isPersonalizationAvailable", v6, v7, v8);
    v9->_personalizedSynthesisModelState = objc_msgSend_decodeIntegerForKey_(v4, v10, @"personalizedSynthesisModelState", v11, v12, v13);
    uint64_t v14 = objc_opt_class();
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"personalizedSynthesisModelVersion", v16, v17);
    personalizedSynthesisModelVersion = v9->_personalizedSynthesisModelVersion;
    v9->_personalizedSynthesisModelVersion = (NSString *)v18;

    if (os_variant_has_internal_diagnostics())
    {
      v9->_hasAllDigits = objc_msgSend_decodeBoolForKey_(v4, v20, @"hasAllDigits", v21, v22, v23);
      v9->_styleSampleCount = objc_msgSend_decodeIntegerForKey_(v4, v24, @"styleSampleCount", v25, v26, v27);
      v9->_samplesWithoutStylePredictionCount = objc_msgSend_decodeIntegerForKey_(v4, v28, @"sampleWithoutStylePredictionCount", v29, v30, v31);
      objc_super v32 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v33 = objc_opt_class();
      uint64_t v34 = objc_opt_class();
      v39 = objc_msgSend_setWithObjects_(v32, v35, v33, v36, v37, v38, v34, 0);
      uint64_t v43 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v40, (uint64_t)v39, @"characterCoverage", v41, v42);
      characterCoverage = v9->_characterCoverage;
      v9->_characterCoverage = (NSSet *)v43;

      uint64_t v45 = objc_opt_class();
      uint64_t v49 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, @"inventoryStorageURL", v47, v48);
      inventoryStorageURL = v9->_inventoryStorageURL;
      v9->_inventoryStorageURL = (NSURL *)v49;

      uint64_t v51 = objc_opt_class();
      uint64_t v55 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, @"inventoryRelativePath", v53, v54);
      inventoryRelativePath = v9->_inventoryRelativePath;
      v9->_inventoryRelativePath = (NSString *)v55;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v85 = NSString;
  if (objc_msgSend_isPersonalizationAvailable(self, a2, v2, v3, v4, v5)) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  v84 = v12;
  uint64_t v83 = objc_msgSend_personalizedSynthesisModelState(self, v7, v8, v9, v10, v11);
  v82 = objc_msgSend_personalizedSynthesisModelVersion(self, v13, v14, v15, v16, v17);
  if (objc_msgSend_hasAllDigits(self, v18, v19, v20, v21, v22)) {
    v28 = @"YES";
  }
  else {
    v28 = @"NO";
  }
  uint64_t v29 = objc_msgSend_styleSampleCount(self, v23, v24, v25, v26, v27);
  uint64_t v35 = objc_msgSend_samplesWithoutStylePredictionCount(self, v30, v31, v32, v33, v34);
  uint64_t v41 = objc_msgSend_inventoryRelativePath(self, v36, v37, v38, v39, v40);
  uint64_t v47 = objc_msgSend_characterCoverage(self, v42, v43, v44, v45, v46);
  uint64_t v53 = objc_msgSend_count(v47, v48, v49, v50, v51, v52);
  v59 = objc_msgSend_characterCoverage(self, v54, v55, v56, v57, v58);
  v65 = objc_msgSend_allObjects(v59, v60, v61, v62, v63, v64);
  v70 = objc_msgSend_sortedArrayUsingSelector_(v65, v66, (uint64_t)sel_compare_, v67, v68, v69);
  v75 = objc_msgSend_componentsJoinedByString_(v70, v71, @",", v72, v73, v74);
  v80 = objc_msgSend_stringWithFormat_(v85, v76, @"isPersonalizationAvailable: %@, personalizedSynthesisModelState: %ld, personalizedSynthesisModelVersion: %@, hasAllDigits: %@, styleSampleCount: %ld, samplesWithoutStylePredictionCount: %ld, inventory relative path: %@, character coverage (len %ld): %@", v77, v78, v79, v84, v83, v82, v28, v29, v35, v41, v53, v75);

  return v80;
}

- (BOOL)isPersonalizationAvailable
{
  return self->_isPersonalizationAvailable;
}

- (int64_t)personalizedSynthesisModelState
{
  return self->_personalizedSynthesisModelState;
}

- (NSString)personalizedSynthesisModelVersion
{
  return self->_personalizedSynthesisModelVersion;
}

- (BOOL)hasAllDigits
{
  return self->_hasAllDigits;
}

- (int64_t)styleSampleCount
{
  return self->_styleSampleCount;
}

- (int64_t)samplesWithoutStylePredictionCount
{
  return self->_samplesWithoutStylePredictionCount;
}

- (NSSet)characterCoverage
{
  return self->_characterCoverage;
}

- (NSURL)inventoryStorageURL
{
  return self->_inventoryStorageURL;
}

- (NSString)inventoryRelativePath
{
  return self->_inventoryRelativePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inventoryRelativePath, 0);
  objc_storeStrong((id *)&self->_inventoryStorageURL, 0);
  objc_storeStrong((id *)&self->_characterCoverage, 0);
  objc_storeStrong((id *)&self->_personalizedSynthesisModelVersion, 0);
}

@end