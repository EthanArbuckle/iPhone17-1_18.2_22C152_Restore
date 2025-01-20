@interface VNFaceprint
+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)supportsSecureCoding;
+ (id)codingTypesToCodingKeys;
+ (id)currentVersion;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (id)emptyFaceprintDataForRevision:(unint64_t)a3;
+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3;
+ (unint64_t)currentSerializationVersion;
+ (unint64_t)serializationMagicNumber;
+ (unsigned)currentCodingVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToVNEntityIdentificationModelPrint:(id)a3;
- (NSString)description;
- (VNFaceprint)initWithCoder:(id)a3;
- (VNFaceprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 originatingRequestSpecifier:(id)a8;
- (VNFaceprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8;
- (VNFaceprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 requestRevision:(unint64_t)a7;
- (VNFaceprint)initWithRawData:(const void *)a3 confidence:(float)a4 requestRevision:(unint64_t)a5;
- (VNFaceprint)initWithRawData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8;
- (VNFaceprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5;
- (float)confidence;
- (unint64_t)hash;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNFaceprint

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
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(VNEspressoModelImageprint *)self descriptorData];
  uint64_t v5 = [v4 bytes];

  for (unint64_t i = 0; i < [(VNEspressoModelImageprint *)self elementCount]; ++i)
  {
    if (i == [(VNEspressoModelImageprint *)self elementCount] - 1) {
      v7 = &stru_1EF75C0C0;
    }
    else {
      v7 = @"\n";
    }
    v8 = v7;
    v9 = (void *)[[NSString alloc] initWithFormat:@"%f%@", *(float *)(v5 + 4 * i), v8];
    [v3 appendString:v9];
  }
  id v10 = [NSString alloc];
  v14.receiver = self;
  v14.super_class = (Class)VNFaceprint;
  v11 = [(VNEspressoModelImageprint *)&v14 description];
  v12 = (void *)[v10 initWithFormat:@"%@; pixels:\n%@", v11, v3];

  return (NSString *)v12;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNFaceprint;
  id v3 = [(VNEspressoModelImageprint *)&v7 hash];
  [(VNFaceprint *)self confidence];
  uint64_t v5 = LODWORD(v4);
  if (v4 == 0.0) {
    uint64_t v5 = 0;
  }
  return v5 ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  float v4 = (VNFaceprint *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)VNFaceprint,
          [(VNEspressoModelImageprint *)&v10 isEqual:v4]))
    {
      [(VNFaceprint *)self confidence];
      float v6 = v5;
      [(VNFaceprint *)v4 confidence];
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
  v14.super_class = (Class)VNFaceprint;
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
  if (v9 + 4 != (char *)[(VNFaceprint *)self serializedLength])
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
  v3.super_class = (Class)VNFaceprint;
  return [(VNEspressoModelImageprint *)&v3 serializedLength] + 4;
}

- (VNFaceprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      id v11 = +[VNError errorForInvalidOperationWithLocalizedDescription:@"Attempt to deserialize nil"];
      goto LABEL_7;
    }
LABEL_19:
    v12 = 0;
    goto LABEL_57;
  }
  unint64_t v10 = [v8 length];
  if (v10 > 0x1B)
  {
    id v13 = v9;
    uint64_t v14 = [v13 bytes];
    uint64_t v15 = v14;
    unint64_t v16 = *a4;
    v17 = (_OWORD *)(v14 + *a4);
    *(_OWORD *)v49 = *v17;
    *(_OWORD *)&v49[12] = *(_OWORD *)((char *)v17 + 12);
    if (*(_DWORD *)v49 == -87098674)
    {
      uint64_t v18 = *(unsigned int *)&v49[4];
      if ((*(_DWORD *)&v49[4] - 4) < 3)
      {
        v45.receiver = self;
        v45.super_class = (Class)VNFaceprint;
        v31 = [(VNEspressoModelImageprint *)&v45 initWithState:v13 byteOffset:a4 error:a5];
        if (v31)
        {
          unint64_t v33 = *a4;
          if (v16 + v10 - *a4 >= 4)
          {
            float v34 = *(float *)(v15 + v33);
            *a4 = v33 + 4;
            *(float *)&double v32 = v34;
            if (+[VNValidationUtilities validateVNConfidenceRange:a5 error:v32])
            {
              v31->_confidence = v34;
              v35 = v31;
LABEL_39:
              v31 = v35;
              v12 = v35;
LABEL_56:
              self = v31;
              goto LABEL_57;
            }
          }
        }
      }
      else
      {
        if ((*(_DWORD *)&v49[4] - 1) < 2)
        {
          if (*(_DWORD *)&v49[8] != 544 || v10 != 544)
          {
            if (a5)
            {
              id v21 = +[VNError errorWithCode:14 message:@"Serialized state data length is invalid"];
              goto LABEL_42;
            }
LABEL_45:
            v12 = 0;
            goto LABEL_46;
          }
          uint64_t v47 = 0;
          uint64_t v48 = 0;
          calculateChecksumMD5((char *)(v14 + 28), 0x204uLL, (unsigned __int8 *)&v47);
          if (*(void *)&v49[12] != v47 || *(void *)&v49[20] != v48)
          {
            if (a5)
            {
              id v21 = +[VNError errorWithCode:14 message:@"Serialized state payload data checksum mismatch"];
LABEL_42:
              v12 = 0;
              *a5 = v21;
              goto LABEL_46;
            }
            goto LABEL_45;
          }
          if (v18 == 2)
          {
            if (*(_DWORD *)(v15 + 540) == 1) {
              unint64_t v43 = 516;
            }
            else {
              unint64_t v43 = 512;
            }
            LODWORD(v19) = 1.0;
            v41 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](self, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v15 + 28, v43 >> 2, 1, v19);
            if (!v41)
            {
              if (a5)
              {
LABEL_67:
                id v21 = +[VNError errorWithCode:9 message:@"Error deserializing VNFaceprint"];
                self = 0;
                goto LABEL_42;
              }
LABEL_68:
              self = 0;
              goto LABEL_45;
            }
          }
          else
          {
            if (v18 != 1)
            {
              if (a5)
              {
                v44 = objc_msgSend(NSString, "stringWithFormat:", @"unsupported serialized state version %u", v18);
                *a5 = +[VNError errorWithCode:14 message:v44];
              }
              goto LABEL_45;
            }
            LODWORD(v19) = 1.0;
            v41 = [(VNFaceprint *)self initWithData:v15 + 28 elementCount:129 elementType:1 lengthInBytes:516 confidence:1 requestRevision:v19];
            if (!v41)
            {
              if (a5) {
                goto LABEL_67;
              }
              goto LABEL_68;
            }
          }
          v41->_confidence = 1.0;
          self = v41;
          v12 = self;
          goto LABEL_46;
        }
        if (*(_DWORD *)&v49[4] != 3)
        {
          if (a5)
          {
            v40 = objc_msgSend(NSString, "stringWithFormat:", @"Serialized state data is an unsupported version (%lu)", *(unsigned int *)&v49[4]);
            *a5 = +[VNError errorWithCode:14 message:v40];
          }
          goto LABEL_45;
        }
        v46.receiver = self;
        v46.super_class = (Class)VNFaceprint;
        v39 = [(VNEspressoModelImageprint *)&v46 initWithState:v13 byteOffset:a4 error:a5];
        if (v39)
        {
          v39->_confidence = 1.0;
          v35 = v39;
          goto LABEL_39;
        }
        v31 = 0;
      }
      v12 = 0;
      goto LABEL_56;
    }
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v13 error:a5];
    if (!v22)
    {
      v12 = 0;
LABEL_35:

LABEL_46:
      v31 = self;
      goto LABEL_56;
    }
    uint64_t v23 = objc_opt_class();
    [v22 setClass:v23 forClassName:@"CVMLFaceprint"];
    v24 = [v22 decodeObjectOfClass:v23 forKey:@"faceprint"];
    if ((v24
       || ([v22 decodeObjectOfClass:v23 forKey:@"facePrint"],
           (v24 = objc_claimAutoreleasedReturnValue()) != 0))
      && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = [v24 faceprint];
      unint64_t v26 = [v25 length];

      id v27 = [v24 faceprint];
      uint64_t v28 = [v27 bytes];
      LODWORD(v29) = 1.0;
      v30 = [(VNFaceprint *)self initWithData:v28 elementCount:v26 >> 2 elementType:1 lengthInBytes:v26 confidence:1 requestRevision:v29];

      if (v30)
      {
        self = v30;
        v12 = self;
LABEL_34:

        [v22 finishDecoding];
        goto LABEL_35;
      }
      if (a5)
      {
        +[VNError errorWithCode:14 message:@"Error deserializing VNFaceprint"];
        self = 0;
        v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      self = 0;
    }
    else if (a5)
    {
      v36 = NSString;
      v37 = [v22 error];
      v38 = [v36 stringWithFormat:@"Input data is neither VNFaceprint nor CVMLFaceprint. NSKeyedUnarchiver error = %@", v37];
      *a5 = +[VNError errorWithCode:14 message:v38];
    }
    v12 = 0;
    goto LABEL_34;
  }
  if (!a5) {
    goto LABEL_19;
  }
  id v11 = +[VNError errorWithCode:14 message:@"Input data is not a VNFaceprint"];
LABEL_7:
  v12 = 0;
  *a5 = v11;
LABEL_57:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNFaceprint;
  [(VNEspressoModelImageprint *)&v6 encodeWithCoder:v4];
  *(float *)&double v5 = self->_confidence;
  objc_msgSend(v4, "vn_encodeValidatedConfidence:forKey:", @"fp_conf", v5);
}

- (VNFaceprint)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"VNFaceprint"])
  {
    uint64_t v5 = objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNFaceprint");
    id v42 = 0;
    char v6 = [(id)objc_opt_class() isSupportedCodingVersion:v5 error:&v42];
    id v7 = v42;
    id v8 = v7;
    if (v6)
    {
      if (v5)
      {

        v9 = 0;
        goto LABEL_27;
      }
      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
      if ([v18 isEqualToString:@"VNFaceprintGeneratorTypeEspressoCPU"])
      {
        unint64_t v19 = [v4 decodeIntegerForKey:@"requestRevision"];
        unint64_t v20 = v19;
        if (v19 <= 1) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = v19;
        }
        v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
        uint64_t v23 = v22;
        if (v20 >= 2) {
          unint64_t v24 = 512;
        }
        else {
          unint64_t v24 = 516;
        }
        if ([v22 length] == v24)
        {
          uint64_t v31 = [v23 bytes];
          LODWORD(v32) = 1.0;
          unint64_t v33 = [(VNFaceprint *)self initWithData:v31 elementCount:v24 >> 2 elementType:1 lengthInBytes:v24 confidence:v21 requestRevision:v32];
          if (v33)
          {
            self = v33;
            v9 = self;
          }
          else
          {
            self = 0;
            VNValidatedLog(4, @"Unexpected error while decoding VNFaceprint object state", v34, v35, v36, v37, v38, v39, v41);
            v9 = 0;
          }
        }
        else
        {
          VNValidatedLog(4, @"Unexpected error while decoding VNFaceprint object state", v25, v26, v27, v28, v29, v30, v41);
          v9 = 0;
        }
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      [v4 failWithError:v7];
      v9 = 0;
    }

    goto LABEL_27;
  }
  v43.receiver = self;
  v43.super_class = (Class)VNFaceprint;
  v9 = [(VNEspressoModelImageprint *)&v43 initWithCoder:v4];
  if (v9)
  {
    int v16 = [v4 containsValueForKey:@"fp_conf"];
    LODWORD(v17) = 1.0;
    if (v16) {
      objc_msgSend(v4, "vn_decodeValidatedConfidenceForKey:", @"fp_conf", v17);
    }
    v9->_confidence = *(float *)&v17;
  }
  else
  {
    VNValidatedLog(4, @"Unexpected error while decoding VNFaceprint object state", v10, v11, v12, v13, v14, v15, v41);
  }
LABEL_27:

  return v9;
}

- (VNFaceprint)initWithRawData:(const void *)a3 confidence:(float)a4 requestRevision:(unint64_t)a5
{
  return -[VNFaceprint initWithRawData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](self, "initWithRawData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", a3, 128, 1, 512, a5);
}

- (VNFaceprint)initWithRawData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8
{
  uint64_t v15 = +[VNRequest allSupportedRevisions];
  if (([v15 containsIndex:a8] & 1) == 0)
  {
    VNValidatedLog(4, @"Faceprint Initialization Failure: Unsupported Faceprint revision", v16, v17, v18, v19, v20, v21, v34);
LABEL_13:
    uint64_t v31 = 0;
    goto LABEL_14;
  }
  if (a5 == 1)
  {
    uint64_t v22 = 4;
  }
  else
  {
    if (a5 != 2)
    {
      double v32 = @"Faceprint Initialization Failure: Unsupported Faceprint element type";
      goto LABEL_12;
    }
    uint64_t v22 = 8;
  }
  if (v22 * a4 != a6)
  {
    double v32 = @"Faceprint Initialization Failure: Mismatch between Faceprint parameters: element type, element count and length in bytes";
LABEL_12:
    VNValidatedLog(4, (uint64_t)v32, v16, v17, v18, v19, v20, v21, v34);
    goto LABEL_13;
  }
  HIBYTE(v34) = 48;
  std::vector<unsigned char>::vector(__p, a6, (unsigned char *)&v34 + 7);
  if (vision::mod::FaceprintAndAttributes::normalizeFacePrintData((vision::mod::FaceprintAndAttributes *)a3, (const void *)a4, 1, (float *)__p[0], v23) == 128)
  {
    *(float *)&double v30 = a7;
    self = [(VNFaceprint *)self initWithData:__p[0] elementCount:a4 elementType:1 lengthInBytes:a6 confidence:a8 requestRevision:v30];
    uint64_t v31 = self;
  }
  else
  {
    VNValidatedLog(4, @"Faceprint Initialization Failure: Faceprint normalization failed", v24, v25, v26, v27, v28, v29, v34);
    uint64_t v31 = 0;
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_14:

  return v31;
}

- (VNFaceprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 originatingRequestSpecifier:(id)a8
{
  id v14 = a8;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a6];
  id v43 = 0;
  char v16 = [(id)objc_opt_class() validateDescriptorData:v15 elementType:a5 elementCount:a4 error:&v43];
  id v17 = v43;
  uint64_t v18 = v17;
  if ((v16 & 1) == 0)
  {
    id v23 = [v17 localizedDescription];
    uint64_t v25 = [v23 UTF8String];
    VNValidatedLog(4, @"%s", v26, v27, v28, v29, v30, v31, v25);
    uint64_t v24 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v42.receiver = self;
  v42.super_class = (Class)VNFaceprint;
  uint64_t v19 = [(VNEspressoModelImageprint *)&v42 initWithDescriptorData:v15 elementType:a5 elementCount:a4 originatingRequestSpecifier:v14];
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
      uint64_t v24 = self;
    }
    else
    {
      id v32 = [v22 localizedDescription];
      uint64_t v33 = [v32 UTF8String];
      VNValidatedLog(4, @"%s", v34, v35, v36, v37, v38, v39, v33);

      uint64_t v24 = 0;
      self = v19;
    }
    goto LABEL_8;
  }
  self = 0;
  uint64_t v24 = 0;
LABEL_9:

  return v24;
}

- (VNFaceprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8
{
  id v14 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:a8 error:0];
  if (v14)
  {
    *(float *)&double v15 = a7;
    self = [(VNFaceprint *)self initWithData:a3 elementCount:a4 elementType:a5 lengthInBytes:a6 confidence:v14 originatingRequestSpecifier:v15];
    char v16 = self;
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (VNFaceprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 requestRevision:(unint64_t)a7
{
  LODWORD(v7) = 1.0;
  return [(VNFaceprint *)self initWithData:a3 elementCount:a4 elementType:a5 lengthInBytes:a6 confidence:a7 requestRevision:v7];
}

+ (id)emptyFaceprintDataForRevision:(unint64_t)a3
{
  if (+[VNFaceprint emptyFaceprintDataForRevision:]::onceToken != -1) {
    dispatch_once(&+[VNFaceprint emptyFaceprintDataForRevision:]::onceToken, &__block_literal_global_157);
  }
  objc_super v3 = (void *)+[VNFaceprint emptyFaceprintDataForRevision:]::emptyFaceprintData;

  return v3;
}

uint64_t __45__VNFaceprint_emptyFaceprintDataForRevision___block_invoke()
{
  +[VNFaceprint emptyFaceprintDataForRevision:]::emptyFaceprintData = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:512];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3
{
  return 0;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 6;
}

+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 5;
}

+ (unint64_t)currentSerializationVersion
{
  return 6;
}

+ (unint64_t)serializationMagicNumber
{
  return 4207868622;
}

+ (id)codingTypesToCodingKeys
{
  if (+[VNFaceprint codingTypesToCodingKeys]::onceToken != -1) {
    dispatch_once(&+[VNFaceprint codingTypesToCodingKeys]::onceToken, &__block_literal_global_7189);
  }
  v2 = (void *)+[VNFaceprint codingTypesToCodingKeys]::codingTypesToCodingKeys;

  return v2;
}

void __38__VNFaceprint_codingTypesToCodingKeys__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"emp_data";
  v2[1] = @"emp_elementsCount";
  v3[0] = @"data";
  v3[1] = @"fp_ec";
  v2[2] = @"emp_elementsType";
  v2[3] = @"emp_length";
  v3[2] = @"fp_et";
  v3[3] = @"fp_l";
  v2[4] = @"emp_labelsAndConfidence";
  v2[5] = @"VNEspressoModelImageprint";
  v3[4] = @"fp_lac";
  v3[5] = @"VNFaceprint";
  v2[6] = @"emp_algorithmVersionCodingKey";
  v2[7] = @"emp_algorithmVersion";
  v3[6] = @"fp_av";
  v3[7] = @"1.0";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)+[VNFaceprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
  +[VNFaceprint codingTypesToCodingKeys]::codingTypesToCodingKeys = v0;
}

+ (unsigned)currentCodingVersion
{
  return 2;
}

+ (id)currentVersion
{
  return @"1.0";
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNCreateFaceprintRequest";
}

@end