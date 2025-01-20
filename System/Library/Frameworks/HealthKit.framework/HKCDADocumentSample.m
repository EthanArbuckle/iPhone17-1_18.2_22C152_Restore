@interface HKCDADocumentSample
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)_isValidCDAKeyPath:(id)a3;
+ (BOOL)_isValidOperatorType:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (HKCDADocumentSample)CDADocumentSampleWithData:(NSData *)documentData startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata validationError:(NSError *)validationError;
+ (id)_comparisonExpressionForValue:(id)a3 operatorType:(unint64_t)a4;
+ (id)_globStringToRegexString:(id)a3;
- (BOOL)_predicateMatchForKeyPath:(id)a3 pattern:(id)a4;
- (BOOL)_validateDocumentContentWithError:(id *)a3;
- (BOOL)prepareForDelivery:(id *)a3;
- (BOOL)prepareForSaving:(id *)a3;
- (HKCDADocument)document;
- (HKCDADocumentSample)initWithCoder:(id)a3;
- (id)_fieldValueForKeyPath:(id)a3;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)description;
- (int64_t)_omittedContentFlags;
- (void)_applyPropertiesWithOmittedFlags:(int64_t)a3 compressedDocumentData:(id)a4 title:(id)a5 patientName:(id)a6 authorName:(id)a7 custodianName:(id)a8;
- (void)_processDocumentData:(id)a3 extractedFields:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCDADocumentSample

+ (HKCDADocumentSample)CDADocumentSampleWithData:(NSData *)documentData startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata validationError:(NSError *)validationError
{
  v12 = documentData;
  v13 = startDate;
  v14 = endDate;
  v15 = metadata;
  if (v13)
  {
    [(NSDate *)v13 timeIntervalSinceReferenceDate];
    double v17 = v16;
    if (v14)
    {
LABEL_3:
      [(NSDate *)v14 timeIntervalSinceReferenceDate];
      double v19 = v18;
      goto LABEL_6;
    }
  }
  else
  {
    double v17 = 2.22507386e-308;
    if (v14) {
      goto LABEL_3;
    }
  }
  double v19 = 2.22507386e-308;
LABEL_6:
  v20 = [[_HKCDADocumentExtractedFields alloc] initWithDocumentData:v12];
  v21 = [(_HKCDADocumentExtractedFields *)v20 extractedDate];
  v22 = v21;
  if (v21)
  {
    [v21 timeIntervalSinceReferenceDate];
    double v19 = v23;
    double v17 = v23;
  }
  v24 = +[HKObjectType documentTypeForIdentifier:@"HKDocumentTypeIdentifierCDA"];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __92__HKCDADocumentSample_CDADocumentSampleWithData_startDate_endDate_metadata_validationError___block_invoke;
  v34 = &unk_1E58C0C08;
  v35 = v12;
  v36 = v20;
  v25 = v20;
  v26 = v12;
  v27 = (void *)[a1 _newSampleWithType:v24 startDate:0 endDate:v15 device:&v31 metadata:v17 config:v19];
  int v28 = objc_msgSend(v27, "_validateDocumentContentWithError:", validationError, v31, v32, v33, v34);
  id v29 = 0;
  if (v28) {
    id v29 = v27;
  }

  return (HKCDADocumentSample *)v29;
}

uint64_t __92__HKCDADocumentSample_CDADocumentSampleWithData_startDate_endDate_metadata_validationError___block_invoke(uint64_t a1, _DWORD *a2)
{
  a2[26] = 0;
  return [a2 _processDocumentData:*(void *)(a1 + 32) extractedFields:*(void *)(a1 + 40)];
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)description
{
  v3 = [(HKCDADocumentSample *)self document];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9.receiver = self;
  v9.super_class = (Class)HKCDADocumentSample;
  v5 = [(HKSample *)&v9 description];
  [v4 addObject:v5];

  if (v3)
  {
    v6 = [v3 description];
    [v4 addObject:v6];
  }
  v7 = [v4 componentsJoinedByString:@" "];

  return v7;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKCDADocumentSample;
  id v4 = -[HKSample _validateWithConfiguration:](&v8, sel__validateWithConfiguration_, a3.var0, a3.var1);
  if (!v4)
  {
    v5 = [(HKCDADocumentSample *)self document];
    v6 = v5;
    if (v5)
    {
      id v4 = [v5 _validateConfiguration];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (BOOL)prepareForSaving:(id *)a3
{
  p_contentLock = &self->_contentLock;
  os_unfair_lock_assert_not_owner(&self->_contentLock);
  os_unfair_lock_lock(p_contentLock);
  v12.receiver = self;
  v12.super_class = (Class)HKCDADocumentSample;
  if ([(HKObject *)&v12 prepareForSaving:a3])
  {
    v6 = [(HKCDADocumentSample *)self document];
    v7 = v6;
    if (v6)
    {
      char v8 = [v6 _compressDocumentDataForTransfer:a3];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"HKCDADocumentSample has no document data and can not be saved");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        if (a3) {
          *a3 = v9;
        }
        else {
          _HKLogDroppedError(v9);
        }
      }

      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }
  os_unfair_lock_unlock(p_contentLock);
  return v8;
}

- (BOOL)prepareForDelivery:(id *)a3
{
  p_contentLock = &self->_contentLock;
  os_unfair_lock_assert_not_owner(&self->_contentLock);
  os_unfair_lock_lock(p_contentLock);
  v10.receiver = self;
  v10.super_class = (Class)HKCDADocumentSample;
  if ([(HKObject *)&v10 prepareForDelivery:a3])
  {
    v6 = [(HKCDADocumentSample *)self document];
    v7 = v6;
    if (!v6 || (self->_omittedContentFlags & 2) != 0) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 _decompressDocumentDataForDelivery:a3];
    }
  }
  else
  {
    char v8 = 0;
  }
  os_unfair_lock_unlock(p_contentLock);
  return v8;
}

- (BOOL)_validateDocumentContentWithError:(id *)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(HKCDADocumentSample *)self document];
  v5 = [v4 documentData];

  if (_HKPathToValidationSchema_onceToken != -1) {
    dispatch_once(&_HKPathToValidationSchema_onceToken, &__block_literal_global_33);
  }
  v6 = +[_HKXMLValidator validatorWithPathToXSD:_HKPathToValidationSchema__pathToValidationSchema];
  id v15 = 0;
  id v16 = 0;
  char v7 = [v6 validateXML:v5 simpleError:&v16 detailedErrors:&v15];
  id v8 = v16;
  id v9 = v15;
  objc_super v10 = v9;
  if ((v7 & 1) == 0 && v8 && v9)
  {
    v17[0] = *MEMORY[0x1E4F28568];
    v17[1] = @"HKDetailedCDAValidationErrorKey";
    v18[0] = v8;
    v18[1] = v9;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v11];
    v13 = v12;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError(v12);
      }
    }
  }
  return v7;
}

- (int64_t)_omittedContentFlags
{
  return self->_omittedContentFlags;
}

- (void)_processDocumentData:(id)a3 extractedFields:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v7 = a4;
  id v8 = a3;
  id v16 = (id)[[v6 alloc] initWithData:v8];

  os_unfair_lock_lock(&self->_contentLock);
  self->_omittedContentFlags = 0;
  id v9 = [HKCDADocument alloc];
  objc_super v10 = [v7 extractedTitle];
  v11 = [v7 extractedPatient];
  id v12 = [v7 extractedAuthorName];
  v13 = [v7 extractedCustodianName];

  v14 = [(HKCDADocument *)v9 initWithDocumentData:v16 compressedDocumentData:0 title:v10 patientName:v11 authorName:v12 custodianName:v13];
  document = self->_document;
  self->_document = v14;

  os_unfair_lock_unlock(&self->_contentLock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCDADocumentSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKCDADocumentSample;
  v5 = [(HKSample *)&v11 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v5->_contentLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 decodeIntegerForKey:@"omittedContentFlags"];
    v6->_omittedContentFlags = v7;
    if (v7)
    {
      document = v6->_document;
      v6->_document = 0;
    }
    else
    {
      id v8 = [[HKCDADocument alloc] initWithCoder:v4 omittedContentFlags:v6->_omittedContentFlags];
      document = v6->_document;
      v6->_document = v8;
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKCDADocumentSample;
  [(HKSample *)&v8 encodeWithCoder:v5];
  [v5 encodeInteger:self->_omittedContentFlags forKey:@"omittedContentFlags"];
  if ((self->_omittedContentFlags & 1) == 0)
  {
    v6 = [(HKCDADocumentSample *)self document];
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"HKCDADocumentSample.m" lineNumber:275 description:@"HKCDADocumentSample: attempt to transmit document that is marked as omitted."];
    }
    [v6 encodeWithCoder:v5 omittedContentFlags:self->_omittedContentFlags];
  }
}

- (void)_applyPropertiesWithOmittedFlags:(int64_t)a3 compressedDocumentData:(id)a4 title:(id)a5 patientName:(id)a6 authorName:(id)a7 custodianName:(id)a8
{
  id v20 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  os_unfair_lock_lock(&self->_contentLock);
  self->_omittedContentFlags = a3;
  if (a3)
  {
    document = self->_document;
    self->_document = 0;
  }
  else
  {
    double v18 = [[HKCDADocument alloc] initWithDocumentData:0 compressedDocumentData:v20 title:v14 patientName:v15 authorName:v16 custodianName:v17];
    document = self->_document;
    self->_document = v18;
  }

  os_unfair_lock_unlock(&self->_contentLock);
}

+ (BOOL)_isValidCDAKeyPath:(id)a3
{
  return [&unk_1EECE6B28 containsObject:a3];
}

+ (BOOL)_isValidOperatorType:(unint64_t)a3
{
  BOOL result = 1;
  if (a3 > 9 || ((1 << a3) & 0x3B0) == 0) {
    return a3 == 99;
  }
  return result;
}

+ (id)_globStringToRegexString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HKCDADocumentSample__globStringToRegexString___block_invoke;
  v8[3] = &unk_1E58C0C30;
  objc_super v10 = v11;
  id v6 = v5;
  id v9 = v6;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v8);

  _Block_object_dispose(v11, 8);

  return v6;
}

void __48__HKCDADocumentSample__globStringToRegexString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if ([(__CFString *)v3 isEqualToString:@"*"])
    {
      uint64_t v4 = *(void **)(a1 + 32);
      id v5 = @".*";
    }
    else
    {
      int v6 = [(__CFString *)v7 isEqualToString:@"?"];
      uint64_t v4 = *(void **)(a1 + 32);
      if (v6)
      {
        id v5 = @"?";
      }
      else
      {
        [v4 appendString:@"\\""];
        uint64_t v4 = *(void **)(a1 + 32);
        id v5 = v7;
      }
    }
    [v4 appendString:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else if ([(__CFString *)v3 isEqualToString:@"\\""])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    [*(id *)(a1 + 32) appendString:v7];
  }
}

+ (id)_comparisonExpressionForValue:(id)a3 operatorType:(unint64_t)a4
{
  int v6 = [MEMORY[0x1E4F28FD8] escapedPatternForString:a3];
  uint64_t v7 = &stru_1EEC60288;
  switch(a4)
  {
    case 4uLL:
    case 5uLL:
      [NSString stringWithFormat:@"^%@$", v6];
      goto LABEL_8;
    case 6uLL:
      goto LABEL_10;
    case 7uLL:
      uint64_t v8 = [a1 _globStringToRegexString:v6];
      goto LABEL_9;
    case 8uLL:
      [NSString stringWithFormat:@"^%@.*$", v6];
      goto LABEL_8;
    case 9uLL:
      [NSString stringWithFormat:@"^.*%@$", v6];
      goto LABEL_8;
    default:
      if (a4 != 99) {
        goto LABEL_10;
      }
      [NSString stringWithFormat:@"^.*?%@.*$", v6];
      uint64_t v8 = LABEL_8:;
LABEL_9:
      uint64_t v7 = (__CFString *)v8;
LABEL_10:
      uint64_t v11 = 0;
      id v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v7 options:0 error:&v11];
      if (!v9)
      {
        id v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:&stru_1EEC60288 options:0 error:0];
      }

      return v9;
  }
}

- (id)_fieldValueForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HKCDADocumentSample *)self document];
  if (v5)
  {
    if ([v4 isEqualToString:@"title"])
    {
      uint64_t v6 = [v5 title];
LABEL_10:
      uint64_t v7 = (__CFString *)v6;
      goto LABEL_12;
    }
    if ([v4 isEqualToString:@"patient_name"])
    {
      uint64_t v6 = [v5 patientName];
      goto LABEL_10;
    }
    if ([v4 isEqualToString:@"author_name"])
    {
      uint64_t v6 = [v5 authorName];
      goto LABEL_10;
    }
    if ([v4 isEqualToString:@"custodian_name"])
    {
      uint64_t v6 = [v5 custodianName];
      goto LABEL_10;
    }
  }
  uint64_t v7 = @"NoFieldValue";
LABEL_12:

  return v7;
}

- (BOOL)_predicateMatchForKeyPath:(id)a3 pattern:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HKCDADocumentSample *)self _fieldValueForKeyPath:a3];
  uint64_t v8 = objc_msgSend(v6, "numberOfMatchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));

  return v8 == 1;
}

- (HKCDADocument)document
{
  return (HKCDADocument *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
}

@end