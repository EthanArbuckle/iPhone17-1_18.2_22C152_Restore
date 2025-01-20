@interface VNTorsoprint
+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)supportsSecureCoding;
+ (id)codingTypesToCodingKeys;
+ (id)currentVersion;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (id)emptyTorsoprintDataForRevision:(unint64_t)a3;
+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3;
+ (unint64_t)currentSerializationVersion;
+ (unint64_t)serializationMagicNumber;
+ (unsigned)currentCodingVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToVNEntityIdentificationModelPrint:(id)a3;
- (NSString)description;
- (VNTorsoprint)initWithCoder:(id)a3;
- (VNTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 originatingRequestSpecifier:(id)a8;
- (VNTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8;
- (VNTorsoprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5;
- (float)confidence;
- (unint64_t)hash;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNTorsoprint

- (BOOL)isEquivalentToVNEntityIdentificationModelPrint:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(VNEspressoModelImageprint *)self hasEquivalentDescriptorToImageprint:v4];

  return v5;
}

- (float)confidence
{
  return self->_confidence;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)VNTorsoprint;
  id v4 = [(VNEspressoModelImageprint *)&v8 description];
  [(VNTorsoprint *)self confidence];
  v6 = (void *)[v3 initWithFormat:@"%@; coinfidence = %f", v4, v5];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNTorsoprint;
  id v3 = [(VNEspressoModelImageprint *)&v7 hash];
  [(VNTorsoprint *)self confidence];
  uint64_t v5 = LODWORD(v4);
  if (v4 == 0.0) {
    uint64_t v5 = 0;
  }
  return v5 ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  float v4 = (VNTorsoprint *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)VNTorsoprint,
          [(VNEspressoModelImageprint *)&v10 isEqual:v4]))
    {
      [(VNTorsoprint *)self confidence];
      float v6 = v5;
      [(VNTorsoprint *)v4 confidence];
      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNTorsoprint;
  v9 = [(VNEspressoModelImageprint *)&v14 serializeStateIntoData:v8 startingAtByteOffset:a4 error:a5];
  if (!v9)
  {
LABEL_6:
    unint64_t v11 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = [v8 mutableBytes];
  *(float *)&v9[a4 + v10] = self->_confidence;
  unint64_t v11 = (unint64_t)(v9 + 4);
  if (v9 + 4 != (char *)[(VNTorsoprint *)self serializedLength])
  {
    if (a5)
    {
      v12 = [NSString stringWithFormat:@"Unexpected size of serialized state of the object of type %@", objc_opt_class()];
      *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v12];
    }
    goto LABEL_6;
  }
  calculateChecksumMD5((char *)(v10 + a4 + 28), (unint64_t)(v9 - 24), (unsigned __int8 *)(v10 + a4 + 12));
LABEL_7:

  return v11;
}

- (unint64_t)serializedLength
{
  v3.receiver = self;
  v3.super_class = (Class)VNTorsoprint;
  return [(VNEspressoModelImageprint *)&v3 serializedLength] + 4;
}

- (VNTorsoprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 bytes];
  unint64_t v10 = *a4;
  uint64_t v11 = [v8 length];
  v21.receiver = self;
  v21.super_class = (Class)VNTorsoprint;
  v12 = [(VNEspressoModelImageprint *)&v21 initWithState:v8 byteOffset:a4 error:a5];
  objc_super v14 = v12;
  if (!v12) {
    goto LABEL_12;
  }
  unsigned int v15 = *(_DWORD *)(v9 + v10 + 4);
  v12->_confidence = 1.0;
  if (v15 >= 4)
  {
    unint64_t v16 = *a4;
    if (v11 + v10 - *a4 <= 3)
    {
      if (a5)
      {
        v17 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error desrializing torsoprint"];
LABEL_11:
        v19 = 0;
        *a5 = v17;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    float v18 = *(float *)(v9 + v16);
    *a4 = v16 + 4;
    *(float *)&double v13 = v18;
    if (!+[VNValidationUtilities validateVNConfidenceRange:a5 error:v13])
    {
      if (a5)
      {
        v17 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Deserialized confidence is outside of the valid range"];
        goto LABEL_11;
      }
LABEL_12:
      v19 = 0;
      goto LABEL_13;
    }
    v14->_confidence = v18;
  }
  v19 = v14;
LABEL_13:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNTorsoprint;
  [(VNEspressoModelImageprint *)&v6 encodeWithCoder:v4];
  *(float *)&double v5 = self->_confidence;
  objc_msgSend(v4, "vn_encodeValidatedConfidence:forKey:", @"tp_conf", v5);
}

- (VNTorsoprint)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNTorsoprint;
  uint64_t v11 = [(VNEspressoModelImageprint *)&v16 initWithCoder:v4];
  if (v11)
  {
    int v12 = [v4 containsValueForKey:@"tp_conf"];
    LODWORD(v13) = 1.0;
    if (v12) {
      objc_msgSend(v4, "vn_decodeValidatedConfidenceForKey:", @"tp_conf", v13);
    }
    v11->_confidence = *(float *)&v13;
    objc_super v14 = v11;
  }
  else
  {
    VNValidatedLog(4, @"Unexpected error while decoding VNTorsoprint object state", v5, v6, v7, v8, v9, v10, (uint64_t)v16.receiver);
  }

  return v11;
}

- (VNTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 originatingRequestSpecifier:(id)a8
{
  id v14 = a8;
  unsigned int v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a6];
  id v43 = 0;
  char v16 = [(id)objc_opt_class() validateDescriptorData:v15 elementType:a5 elementCount:a4 error:&v43];
  id v17 = v43;
  float v18 = v17;
  if ((v16 & 1) == 0)
  {
    id v23 = [v17 localizedDescription];
    uint64_t v25 = [v23 UTF8String];
    VNValidatedLog(4, @"%s", v26, v27, v28, v29, v30, v31, v25);
    v24 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v42.receiver = self;
  v42.super_class = (Class)VNTorsoprint;
  v19 = [(VNEspressoModelImageprint *)&v42 initWithDescriptorData:v15 elementType:a5 elementCount:a4 originatingRequestSpecifier:v14];
  if (v19)
  {
    id v41 = 0;
    *(float *)&double v20 = a7;
    BOOL v21 = +[VNValidationUtilities validateVNConfidenceRange:&v41 error:v20];
    id v22 = v41;
    id v23 = v22;
    if (v21)
    {
      v19->_confidence = a7;
      self = v19;
      v24 = self;
    }
    else
    {
      id v32 = [v22 localizedDescription];
      uint64_t v33 = [v32 UTF8String];
      VNValidatedLog(4, @"%s", v34, v35, v36, v37, v38, v39, v33);

      v24 = 0;
      self = v19;
    }
    goto LABEL_8;
  }
  self = 0;
  v24 = 0;
LABEL_9:

  return v24;
}

- (VNTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8
{
  id v14 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:a8 error:0];
  if (v14)
  {
    *(float *)&double v15 = a7;
    self = [(VNTorsoprint *)self initWithData:a3 elementCount:a4 elementType:a5 lengthInBytes:a6 confidence:v14 originatingRequestSpecifier:v15];
    char v16 = self;
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3
{
  return 2 * ([a3 requestRevision] == 3737841670);
}

+ (id)emptyTorsoprintDataForRevision:(unint64_t)a3
{
  if (+[VNTorsoprint emptyTorsoprintDataForRevision:]::onceToken != -1) {
    dispatch_once(&+[VNTorsoprint emptyTorsoprintDataForRevision:]::onceToken, &__block_literal_global_94);
  }
  objc_super v3 = (void *)+[VNTorsoprint emptyTorsoprintDataForRevision:]::emptyVNTorsoprint;

  return v3;
}

uint64_t __47__VNTorsoprint_emptyTorsoprintDataForRevision___block_invoke()
{
  +[VNTorsoprint emptyTorsoprintDataForRevision:]::emptyVNTorsoprint = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:512];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 3;
}

+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 == 1;
}

+ (unint64_t)currentSerializationVersion
{
  return 4;
}

+ (unint64_t)serializationMagicNumber
{
  return 2966487040;
}

+ (id)codingTypesToCodingKeys
{
  if (+[VNTorsoprint codingTypesToCodingKeys]::onceToken != -1) {
    dispatch_once(&+[VNTorsoprint codingTypesToCodingKeys]::onceToken, &__block_literal_global_22676);
  }
  v2 = (void *)+[VNTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys;

  return v2;
}

void __39__VNTorsoprint_codingTypesToCodingKeys__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"emp_data";
  v2[1] = @"emp_elementsCount";
  v3[0] = @"Tp_data";
  v3[1] = @"Tp_elementsCount";
  v2[2] = @"emp_elementsType";
  v2[3] = @"emp_length";
  v3[2] = @"Tp_elementsType";
  v3[3] = @"Tp_length";
  v2[4] = @"emp_labelsAndConfidence";
  v2[5] = @"VNEspressoModelImageprint";
  v3[4] = @"Tp_labelsAndConfidence";
  v3[5] = @"Tp_VNTorsoprint";
  v2[6] = @"emp_algorithmVersionCodingKey";
  v2[7] = @"emp_algorithmVersion";
  v3[6] = @"Tp_algorithmVersion";
  v3[7] = @"1.0";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)+[VNTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
  +[VNTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys = v0;
}

+ (unsigned)currentCodingVersion
{
  return 1;
}

+ (id)currentVersion
{
  return @"1.0";
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNCreateTorsoprintRequest";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end