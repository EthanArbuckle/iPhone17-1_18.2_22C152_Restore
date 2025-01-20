@interface CKDMMCSPackageSignatureGenerator
- (BOOL)isValid;
- (CKDMMCSPackageSignatureGenerator)initWithBoundaryKey:(id)a3;
- (id)_finishGenerator;
- (id)dataByFinishingSignature;
- (id)dataByFinishingVerificationKey;
- (void)dealloc;
- (void)generator;
- (void)setGenerator:(void *)a3;
- (void)setValid:(BOOL)a3;
- (void)updateWithData:(id)a3;
@end

@implementation CKDMMCSPackageSignatureGenerator

- (CKDMMCSPackageSignatureGenerator)initWithBoundaryKey:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKDMMCSPackageSignatureGenerator;
  v5 = [(CKDMMCSPackageSignatureGenerator *)&v8 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = MMCSPackageSectionSignatureGeneratorCreateWithBoundaryKey();
      v5->_usesMMCSV2 = 1;
    }
    else
    {
      uint64_t v6 = MMCSPackageSectionSignatureGeneratorCreate();
    }
    v5->_generator = (void *)v6;
    v5->_valid = 1;
  }

  return v5;
}

- (void)dealloc
{
  id v4 = (id)objc_msgSend__finishGenerator(self, a2, v2);
  v5.receiver = self;
  v5.super_class = (Class)CKDMMCSPackageSignatureGenerator;
  [(CKDMMCSPackageSignatureGenerator *)&v5 dealloc];
}

- (id)_finishGenerator
{
  if (objc_msgSend_isValid(self, a2, v2))
  {
    objc_msgSend_setValid_(self, v4, 0);
    objc_msgSend_generator(self, v5, v6);
    v7 = (NSDictionary *)MMCSPackageSectionSignatureGeneratorFinishWithResults();
    if (v7)
    {
      generatorResults = self->_generatorResults;
      self->_generatorResults = v7;
    }
  }
  v9 = self->_generatorResults;
  return v9;
}

- (void)updateWithData:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend_isValid(self, v6, v7) & 1) == 0)
  {
    v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CKDMMCSPackageSignatureGenerator.m", 54, @"Attempted to update an invalidated signature generator");
  }
  id v21 = v5;
  uint64_t v12 = objc_msgSend_generator(self, v10, v11);
  uint64_t v15 = objc_msgSend_bytes(v21, v13, v14);
  uint64_t v18 = objc_msgSend_length(v21, v16, v17);
  MEMORY[0x1C8788A90](v12, v15, v18);
}

- (id)dataByFinishingSignature
{
  v3 = objc_msgSend__finishGenerator(self, a2, v2);
  id v5 = objc_msgSend_objectForKey_(v3, v4, *MEMORY[0x1E4F739E0]);

  return v5;
}

- (id)dataByFinishingVerificationKey
{
  if (self->_usesMMCSV2)
  {
    v3 = objc_msgSend__finishGenerator(self, a2, v2);
    id v5 = objc_msgSend_objectForKey_(v3, v4, *MEMORY[0x1E4F739F0]);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)generator
{
  return self->_generator;
}

- (void)setGenerator:(void *)a3
{
  self->_generator = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
}

@end