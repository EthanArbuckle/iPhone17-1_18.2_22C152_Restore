@interface VNEspressoModelImageprint
+ (BOOL)isSupportedCodingVersion:(unsigned int)a3 error:(id *)a4;
+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 error:(id *)a6;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (id)originatingRequestSpecifierForRequestRevision:(unint64_t)a3 error:(id *)a4;
+ (id)printFromCSUBuffer:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5;
+ (id)printFromEspressoBuffer:(id *)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5;
+ (id)printWithDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 originatingRequestSpecifier:(id)a6 error:(id *)a7;
+ (id)printWithFloat16PrecisionFloat32Data:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5;
+ (id)printWithFloat16PrecisionFloat32Values:(const float *)a3 elementCount:(unint64_t)a4 originatingRequestSpecifier:(id)a5 error:(id *)a6;
+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3;
- (BOOL)hasEquivalentDescriptorToImageprint:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrint:(id)a3 compatibleWithOtherPrint:(id)a4 error:(id *)a5;
- (NSData)descriptorData;
- (NSString)version;
- (VNEspressoModelImageprint)initWithCoder:(id)a3;
- (VNEspressoModelImageprint)initWithCoder:(id)a3 forCodingVersion:(unsigned int)a4;
- (VNEspressoModelImageprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 requestRevision:(unint64_t)a8;
- (VNEspressoModelImageprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 requestRevision:(unint64_t)a7;
- (VNEspressoModelImageprint)initWithDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 originatingRequestSpecifier:(id)a6;
- (VNEspressoModelImageprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5;
- (VNEspressoModelImageprint)initWithState:(id)a3 error:(id *)a4;
- (VNRequestSpecifier)originatingRequestSpecifier;
- (id)VNEspressoModelImageprintMLMultiArrayWithConstraint:(id)a3 error:(id *)a4;
- (id)VNEspressoModelImageprintOneDimensionMLMultiArrayWithDataType:(int64_t)a3 error:(id *)a4;
- (id)_VNEspressoModelImageprintMLMultiArrayWithDataType:(int64_t)a3 shape:(id)a4 strides:(id)a5 error:(id *)a6;
- (id)_initWithClassKeyMappedCoder:(id)a3;
- (id)computeDistance:(id)a3 withDistanceFunction:(unint64_t)a4 error:(id *)a5;
- (id)description;
- (id)labelsAndConfidence;
- (id)serializeStateAndReturnError:(id *)a3;
- (unint64_t)_VNEspressoModelImageprintSerializedLength;
- (unint64_t)confidenceScoreType;
- (unint64_t)elementCount;
- (unint64_t)elementType;
- (unint64_t)hash;
- (unint64_t)lengthInBytes;
- (unint64_t)requestRevision;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNEspressoModelImageprint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_descriptorData, 0);

  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)confidenceScoreType
{
  return self->_confidenceScoreType;
}

- (unint64_t)elementCount
{
  return self->_elementCount;
}

- (NSData)descriptorData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(VNEspressoModelImageprint *)self version];
  unint64_t v5 = [(VNEspressoModelImageprint *)self elementCount];
  v6 = VNElementTypeToString([(VNEspressoModelImageprint *)self elementType]);
  unint64_t v7 = [(VNEspressoModelImageprint *)self lengthInBytes];
  unint64_t v8 = [(VNEspressoModelImageprint *)self confidenceScoreType];
  v9 = [(VNEspressoModelImageprint *)self originatingRequestSpecifier];
  v10 = objc_msgSend(v3, "initWithFormat:", @"Espresso print: version = %@; element count = %lu; element type = %@; length in bytes = %lu; confidence score type = %lu; originating request specifier = %@",
                  v4,
                  v5,
                  v6,
                  v7,
                  v8,
                  v9);

  return v10;
}

- (BOOL)isPrint:(id)a3 compatibleWithOtherPrint:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 originatingRequestSpecifier];
  v10 = [v8 originatingRequestSpecifier];
  char v11 = [v9 hasModelEquivalencyToRequestSpecifier:v10];

  if (a5) {
    char v12 = v11;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    v13 = NSString;
    v14 = [v7 originatingRequestSpecifier];
    v15 = [v8 originatingRequestSpecifier];
    v16 = [v13 stringWithFormat:@"cannot compare prints of %@ and %@", v14, v15];

    *a5 = +[VNError errorForInvalidOptionWithLocalizedDescription:v16];
  }
  return v11;
}

- (id)computeDistance:(id)a3 withDistanceFunction:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(VNEspressoModelImageprint *)self descriptorData];
  uint64_t v10 = [v8 descriptorData];
  char v11 = (void *)v10;
  if (!v9 || !v10)
  {
    if (a5)
    {
      v13 = +[VNError errorWithCode:5 message:@"nil VNEspressoModelImageprint(s) supplied"];
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v12 = [v9 length];
  if (v12 != [v11 length])
  {
    if (a5)
    {
      v13 = +[VNError errorWithCode:5 message:@"VNEspressoModelImageprint(s) with different length supplied"];
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (![(VNEspressoModelImageprint *)self isPrint:self compatibleWithOtherPrint:v8 error:a5])
  {
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  if (a4)
  {
    if (a4 != 1)
    {
      if (a5)
      {
        v13 = +[VNError errorWithCode:5 message:@"Unknown distance funtion requested"];
LABEL_13:
        v14 = 0;
        *a5 = v13;
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else
  {
    LODWORD(a4) = 2;
  }
  uint64_t v25 = 0;
  v26 = (float *)&v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 2139095040;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __72__VNEspressoModelImageprint_computeDistance_withDistanceFunction_error___block_invoke;
  v20 = &unk_1E5B1D750;
  id v21 = v9;
  int v24 = a4;
  id v22 = v11;
  v23 = &v25;
  v16 = _Block_copy(&v17);
  if ((VNExecuteBlock(v16, (uint64_t)a5) & 1) == 0) {
    goto LABEL_23;
  }
  if (v26[6] != INFINITY)
  {
    v14 = objc_msgSend(NSNumber, "numberWithFloat:", v17, v18, v19, v20, v21);
    goto LABEL_25;
  }
  if (a5)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"could not compute faceprint distance", v17, v18, v19, v20, v21];
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_23:
    v14 = 0;
  }
LABEL_25:

  _Block_object_dispose(&v25, 8);
LABEL_15:

  return v14;
}

uint64_t __72__VNEspressoModelImageprint_computeDistance_withDistanceFunction_error___block_invoke(uint64_t a1)
{
  v2 = operator new(8uLL);
  void *v2 = 1;
  v10[1] = v2 + 1;
  v10[2] = v2 + 1;
  v10[0] = v2;
  id v3 = (void *)[*(id *)(a1 + 32) bytes];
  unint64_t v4 = [*(id *)(a1 + 32) length];
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v13, (void **)v10, v3, v4, 1, 0);
  int v14 = 1;
  v15 = 0;
  v13[0] = &unk_1EF752918;
  v13[12] = (void *)(v4 >> 2);
  operator delete(v2);
  int v14 = *(_DWORD *)(a1 + 56);
  unint64_t v5 = operator new(8uLL);
  *unint64_t v5 = 1;
  v9[1] = v5 + 1;
  v9[2] = v5 + 1;
  v9[0] = v5;
  v6 = (void *)[*(id *)(a1 + 40) bytes];
  unint64_t v7 = [*(id *)(a1 + 40) length];
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v10, v9, v6, v7, 1, 0);
  int v11 = 1;
  uint64_t v12 = 0;
  v10[0] = &unk_1EF752918;
  v10[12] = (void *)(v7 >> 2);
  operator delete(v5);
  int v11 = *(_DWORD *)(a1 + 56);
  *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = vision::mod::ImageDescriptorBufferFloat32::computeDistanceFrom((vision::mod::ImageDescriptorBufferFloat32 *)v13, (const vision::mod::ImageDescriptorBufferAbstract *)v10);
  v10[0] = &unk_1EF752918;
  free(v12);
  vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v10);
  v13[0] = &unk_1EF752918;
  free(v15);
  vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v13);
  return 1;
}

- (BOOL)hasEquivalentDescriptorToImageprint:(id)a3
{
  unint64_t v4 = (VNEspressoModelImageprint *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    unint64_t v5 = objc_opt_class();
    if (([v5 isEqual:objc_opt_class()] & 1) == 0) {
      goto LABEL_7;
    }
    v6 = [(VNEspressoModelImageprint *)self originatingRequestSpecifier];
    unint64_t v7 = [(VNEspressoModelImageprint *)v4 originatingRequestSpecifier];
    char v8 = [v6 hasModelEquivalencyToRequestSpecifier:v7];

    if ((v8 & 1) == 0) {
      goto LABEL_7;
    }
    v9 = [(VNEspressoModelImageprint *)self descriptorData];
    uint64_t v10 = [(VNEspressoModelImageprint *)v4 descriptorData];
    char v11 = VisionCoreEqualOrNilObjects();

    if ((v11 & 1) == 0) {
      goto LABEL_7;
    }
    unint64_t v12 = [(VNEspressoModelImageprint *)self elementCount];
    if (v12 == [(VNEspressoModelImageprint *)v4 elementCount])
    {
      unint64_t v13 = [(VNEspressoModelImageprint *)self lengthInBytes];
      BOOL v14 = v13 == [(VNEspressoModelImageprint *)v4 lengthInBytes];
    }
    else
    {
LABEL_7:
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VNEspressoModelImageprint *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      v6 = [(VNEspressoModelImageprint *)self originatingRequestSpecifier];
      unint64_t v7 = [(VNEspressoModelImageprint *)v5 originatingRequestSpecifier];
      char v8 = [v6 isEqual:v7];

      if ((v8 & 1) == 0) {
        goto LABEL_10;
      }
      v9 = [(VNEspressoModelImageprint *)self descriptorData];
      uint64_t v10 = [(VNEspressoModelImageprint *)v5 descriptorData];
      char v11 = VisionCoreEqualOrNilObjects();

      if ((v11 & 1) == 0) {
        goto LABEL_10;
      }
      unint64_t v12 = [(VNEspressoModelImageprint *)self elementCount];
      if (v12 == [(VNEspressoModelImageprint *)v5 elementCount]
        && (unint64_t v13 = [(VNEspressoModelImageprint *)self lengthInBytes],
            v13 == [(VNEspressoModelImageprint *)v5 lengthInBytes]))
      {
        BOOL v14 = [(VNEspressoModelImageprint *)self labelsAndConfidence];
        v15 = [(VNEspressoModelImageprint *)v5 labelsAndConfidence];
        char v16 = VisionCoreEqualOrNilObjects();
      }
      else
      {
LABEL_10:
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  id v3 = [(VNEspressoModelImageprint *)self originatingRequestSpecifier];
  uint64_t v4 = [v3 hash];

  unint64_t v5 = [(VNEspressoModelImageprint *)self descriptorData];
  uint64_t v6 = [v5 hash];

  unint64_t v7 = [(VNEspressoModelImageprint *)self elementCount];
  unint64_t v8 = [(VNEspressoModelImageprint *)self lengthInBytes];
  v9 = [(VNEspressoModelImageprint *)self labelsAndConfidence];
  unint64_t v10 = [v9 hash] ^ __ROR8__(v8 ^ __ROR8__(v7 ^ __ROR8__(v6 ^ __ROR8__(v4, 51), 51), 51), 51);

  return v10;
}

- (VNEspressoModelImageprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      id v10 = +[VNError errorWithCode:14 message:@"State cannot be nil"];
      goto LABEL_14;
    }
LABEL_17:
    char v16 = 0;
    goto LABEL_18;
  }
  if ((unint64_t)[v8 length] > 0x1B)
  {
    uint64_t v11 = [v9 bytes];
    unint64_t v12 = *a4;
    unint64_t v13 = (_OWORD *)(v11 + *a4);
    *(_OWORD *)v38 = *v13;
    *(_OWORD *)&v38[12] = *(_OWORD *)((char *)v13 + 12);
    *a4 = v12 + 28;
    if ([(id)objc_opt_class() serializationMagicNumber] != *(unsigned int *)v38)
    {
      if (a5)
      {
        uint64_t v17 = [NSString stringWithFormat:@"Invalid format of %@ serialized state", objc_opt_class()];
        *a5 = +[VNError errorForInvalidFormatErrorWithLocalizedDescription:v17];
      }
      goto LABEL_17;
    }
    unint64_t v14 = *(unsigned int *)&v38[8];
    calculateChecksumMD5((char *)(v11 + *a4), *(unsigned int *)&v38[8] - 28, (unsigned __int8 *)v37);
    if (*(void *)&v38[12] != v37[0] || *(void *)&v38[20] != v37[1])
    {
      if (a5)
      {
        id v10 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Serialized and calculated MD5s don't match"];
        goto LABEL_14;
      }
      goto LABEL_17;
    }
    uint64_t v19 = *(unsigned int *)(v11 + *a4);
    *a4 += 4;
    v20 = objc_opt_class();
    unsigned int v35 = *(_DWORD *)&v38[4];
    if (objc_msgSend(v20, "shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:"))
    {
      v36 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:v19 error:a5];
      if (!v36) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v21 = *(unsigned int *)(v11 + *a4);
      *a4 += 4;
      id v22 = +[VNClassRegistrar classNameForClassCode:v21 error:a5];
      if (!v22) {
        goto LABEL_17;
      }
      v36 = +[VNRequestSpecifier specifierForRequestClassName:v22 revision:v19 error:a5];

      if (!v36) {
        goto LABEL_17;
      }
    }
    unint64_t v23 = *a4;
    size_t v24 = *(unsigned int *)(v11 + *a4);
    unint64_t v25 = *a4 + 4;
    *a4 = v25;
    uint64_t v26 = *(unsigned int *)(v11 + v25);
    *a4 = v23 + 8;
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v24];
    v34 = v27;
    if (v27)
    {
      id v28 = v27;
      memcpy((void *)[v28 mutableBytes], (const void *)(v11 + *a4), v24);
      *a4 += v24;
      int v29 = [(id)objc_opt_class() shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:v35];
      unint64_t v30 = *a4;
      if (v29)
      {
        v30 += 241;
        *a4 = v30;
      }
      if (v30 - v12 > v14)
      {
        if (a5)
        {
          v31 = [NSString stringWithFormat:@"Unexpected size of deserialized state of the object of type %@", objc_opt_class(), v34];
          *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v31];
        }
        goto LABEL_39;
      }
      if ([(id)objc_opt_class() validateDescriptorData:v28 elementType:1 elementCount:v26 error:a5])
      {
        v33 = [(VNEspressoModelImageprint *)self initWithDescriptorData:v28 elementType:1 elementCount:v26 originatingRequestSpecifier:v36];
        if (v33)
        {
          self = v33;
          char v16 = self;
          goto LABEL_40;
        }
        if (a5)
        {
          id v32 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to initialize 'print' object"];
          self = 0;
          goto LABEL_32;
        }
        self = 0;
      }
    }
    else if (a5)
    {
      id v32 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Memory allocation failure"];
LABEL_32:
      char v16 = 0;
      *a5 = v32;
LABEL_40:

      goto LABEL_18;
    }
LABEL_39:
    char v16 = 0;
    goto LABEL_40;
  }
  if (!a5) {
    goto LABEL_17;
  }
  id v10 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Invalid input data to de-serialize a print object"];
LABEL_14:
  char v16 = 0;
  *a5 = v10;
LABEL_18:

  return v16;
}

- (VNEspressoModelImageprint)initWithState:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0;
  return [(VNEspressoModelImageprint *)self initWithState:a3 byteOffset:&v5 error:a4];
}

- (id)serializeStateAndReturnError:(id *)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", -[VNEspressoModelImageprint serializedLength](self, "serializedLength"));
  if ([(VNEspressoModelImageprint *)self serializeStateIntoData:v5 startingAtByteOffset:0 error:a3])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 mutableBytes];
    *(_DWORD *)&v20[16] = 0;
    *(void *)&v20[20] = 0;
    *(_DWORD *)v20 = [(id)objc_opt_class() serializationMagicNumber];
    *(void *)&v20[8] = [(VNEspressoModelImageprint *)self serializedLength];
    *(_DWORD *)&v20[4] = [(id)objc_opt_class() currentSerializationVersion];
    uint64_t v11 = [(VNEspressoModelImageprint *)self originatingRequestSpecifier];
    *(_DWORD *)(v10 + a4 + 28) = [v11 requestRevision];
    unint64_t v12 = a4 + v10;
    *(_DWORD *)(a4 + v10 + 32) = [v11 requestClassCode];
    *(_DWORD *)(v12 + 36) = [(VNEspressoModelImageprint *)self lengthInBytes];
    *(_DWORD *)(v12 + 40) = self->_elementCount;
    unint64_t v13 = [(NSData *)self->_descriptorData bytes];
    size_t v14 = [(NSData *)self->_descriptorData length];
    memcpy((void *)(v10 + a4 + 44), v13, v14);
    unint64_t v15 = v14 + 44;
    if (v15 == [(VNEspressoModelImageprint *)self _VNEspressoModelImageprintSerializedLength])
    {
      char v16 = (_OWORD *)(v10 + a4);
      calculateChecksumMD5((char *)(v10 + a4 + 28), v15 - 28, &v20[12]);
      long long v17 = *(_OWORD *)v20;
      *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)&v20[12];
      _OWORD *v16 = v17;
    }
    else
    {
      if (a5)
      {
        uint64_t v18 = [NSString stringWithFormat:@"Unexpected size of serialized state of the object of type %@", objc_opt_class()];
        *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v18];
      }
      unint64_t v15 = 0;
    }
  }
  else if (a5)
  {
    +[VNError errorWithCode:14 message:@"state cannot be nil"];
    unint64_t v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (unint64_t)_VNEspressoModelImageprintSerializedLength
{
  id v3 = (uint64_t (*)(VNEspressoModelImageprint *, char *))[(id)objc_opt_class() instanceMethodForSelector:sel_serializedLength];

  return v3(self, sel_serializedLength);
}

- (unint64_t)serializedLength
{
  return [(NSData *)self->_descriptorData length] + 44;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", objc_msgSend((id)objc_opt_class(), "currentCodingVersion"), @"version");
  [v4 encodeObject:self->_originatingRequestSpecifier forKey:@"request"];
  [v4 encodeObject:self->_version forKey:@"algorithmVersion"];
  [v4 encodeInteger:self->_elementCount forKey:@"elementCount"];
  if (self->_elementType == 1 && (self->_serializationOptions & 1) != 0)
  {
    descriptorData = self->_descriptorData;
    id v8 = 0;
    id v6 = VNFloat16DataForFloat32Data(descriptorData, &v8);
    id v7 = v8;
    if (v6)
    {
      [v4 encodeObject:v6 forKey:@"f16Desc"];
    }
    else
    {
      [v4 failWithError:v7];
    }
  }
  else
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    [v4 encodeObject:self->_descriptorData forKey:@"descriptorData"];
    objc_msgSend(v4, "encodeInteger:forKey:", -[NSData length](self->_descriptorData, "length"), @"descriptorByteLength");
  }
}

- (VNEspressoModelImageprint)initWithCoder:(id)a3 forCodingVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v39 = 0;
  LOBYTE(v4) = [(id)objc_opt_class() isSupportedCodingVersion:v4 error:&v39];
  id v7 = v39;
  if (v4)
  {
    id v8 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"algorithmVersion"];
    v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"request"];
    if (!v9)
    {
      if ([v6 containsValueForKey:@"request"])
      {
        unint64_t v12 = 0;
LABEL_38:

        goto LABEL_39;
      }
      id v38 = 0;
      uint64_t v24 = objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", objc_msgSend(v6, "decodeIntegerForKey:", @"requestRevision"), &v38);
      id v25 = v38;
      v9 = v25;
      if (!v24)
      {
        [v6 failWithError:v25];
        unint64_t v12 = 0;
LABEL_37:

        goto LABEL_38;
      }

      v9 = (void *)v24;
    }
    char v10 = [v6 containsValueForKey:@"f16Desc"];
    if (v10) {
      unint64_t v11 = 1;
    }
    else {
      unint64_t v11 = [v6 decodeIntegerForKey:@"elementsType"];
    }
    uint64_t v13 = [v6 decodeIntegerForKey:@"elementCount"];
    if ([v6 containsValueForKey:@"descriptorByteLength"]) {
      uint64_t v14 = [v6 decodeIntegerForKey:@"descriptorByteLength"];
    }
    else {
      uint64_t v14 = 0;
    }
    if (v11 == 1) {
      char v15 = v10;
    }
    else {
      char v15 = 0;
    }
    if (v15)
    {
      char v16 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"f16Desc"];
      if ([v16 length] != 2 * v13)
      {
        id v19 = (id)[[NSString alloc] initWithFormat:@"The '%@' data is not the expected length of %lu", @"f16Desc", 2 * v13];
        uint64_t v26 = +[VNError errorForInvalidOperationWithLocalizedDescription:v19];
        [v6 failWithError:v26];

        unint64_t v12 = 0;
LABEL_35:

        goto LABEL_36;
      }
      unsigned int v35 = v8;
      id v37 = 0;
      uint64_t v17 = VNFloat32DataForFloat16Data(v16, &v37);
      id v18 = v37;
      id v19 = v18;
      if (!v17)
      {
        [v6 failWithError:v18];
        unint64_t v12 = 0;
        goto LABEL_34;
      }
      uint64_t v14 = 4 * v13;

      uint64_t v33 = 1;
      if (!(4 * v13)) {
        goto LABEL_19;
      }
    }
    else
    {
      unsigned int v35 = v8;
      uint64_t v17 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"descriptorData"];
      if (!v17)
      {
        char v16 = +[VNError errorForInvalidOperationWithLocalizedDescription:@"descriptor data is unavailable"];
        id v8 = v35;
        [v6 failWithError:v16];
        unint64_t v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
      uint64_t v33 = 0;
      if (!v14)
      {
LABEL_19:
        id v19 = +[VNError errorForInvalidOperationWithLocalizedDescription:@"descriptor length is unavailable"];
        [v6 failWithError:v19];
        goto LABEL_31;
      }
    }
    id v36 = 0;
    char v20 = [(id)objc_opt_class() validateDescriptorData:v17 elementType:v11 elementCount:v13 error:&v36];
    id v19 = v36;
    if ((v20 & 1) == 0) {
      [v6 failWithError:v19];
    }
    uint64_t v21 = [(VNEspressoModelImageprint *)self initWithDescriptorData:v17 elementType:v11 elementCount:v13 originatingRequestSpecifier:v9];
    if (v21)
    {
      v21->_serializationOptions = v33;
      uint64_t v22 = [v35 copy];
      version = v21->_version;
      v21->_version = (NSString *)v22;

      self = v21;
      char v16 = (void *)v17;
      unint64_t v12 = self;
LABEL_34:
      id v8 = v35;
      goto LABEL_35;
    }
    id v27 = [NSString alloc];
    v34 = [NSNumber numberWithUnsignedInteger:v13];
    id v28 = VNElementTypeToString(v11);
    int v29 = [NSNumber numberWithUnsignedInteger:v14];
    unint64_t v30 = (void *)[v27 initWithFormat:@"unable to create a %@ %@ %@ descriptor with length %@", v9, v34, v28, v29];

    v31 = +[VNError errorForInternalErrorWithLocalizedDescription:v30];
    [v6 failWithError:v31];

    self = 0;
LABEL_31:
    unint64_t v12 = 0;
    char v16 = (void *)v17;
    goto LABEL_34;
  }
  [v6 failWithError:v7];
  unint64_t v12 = 0;
LABEL_39:

  return v12;
}

- (VNEspressoModelImageprint)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"1.0"]) {
    uint64_t v5 = [(VNEspressoModelImageprint *)self _initWithClassKeyMappedCoder:v4];
  }
  else {
    uint64_t v5 = -[VNEspressoModelImageprint initWithCoder:forCodingVersion:](self, "initWithCoder:forCodingVersion:", v4, objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"version"));
  }
  id v6 = v5;

  return v6;
}

- (id)_initWithClassKeyMappedCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() codingTypesToCodingKeys];
  uint64_t v6 = objc_opt_class();
  id v7 = [v5 objectForKeyedSubscript:@"emp_algorithmVersion"];
  id obj = [v4 decodeObjectOfClass:v6 forKey:v7];

  uint64_t v8 = objc_opt_class();
  v9 = [v5 objectForKeyedSubscript:@"emp_data"];
  char v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  unint64_t v11 = [v5 objectForKeyedSubscript:@"emp_elementsCount"];
  uint64_t v12 = [v4 decodeIntegerForKey:v11];

  uint64_t v13 = [v5 objectForKeyedSubscript:@"emp_length"];
  uint64_t v14 = [v4 decodeIntegerForKey:v13];

  if ([v10 length] == v14)
  {
    char v15 = [v5 objectForKeyedSubscript:@"emp_elementsType"];
    if ([v4 containsValueForKey:v15])
    {
      unint64_t v16 = [v4 decodeIntegerForKey:v15];
      id v32 = 0;
      BOOL v17 = _validateVNElementType(v16, &v32);
      id v18 = v32;
      id v19 = v18;
      if (!v17)
      {
        [v4 failWithError:v18];
        uint64_t v22 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      unint64_t v16 = 1;
    }
    if ([v4 containsValueForKey:@"VNEspressoModelImageprintRequestRevision"]) {
      uint64_t v23 = [v4 decodeIntegerForKey:@"VNEspressoModelImageprintRequestRevision"];
    }
    else {
      uint64_t v23 = 1;
    }
    id v31 = 0;
    id v19 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:v23 error:&v31];
    id v24 = v31;
    id v25 = v24;
    if (v19)
    {

      id v30 = 0;
      char v26 = [(id)objc_opt_class() validateDescriptorData:v10 elementType:v16 elementCount:v12 error:&v30];
      id v25 = v30;
      if (v26)
      {
        id v27 = [(VNEspressoModelImageprint *)self initWithDescriptorData:v10 elementType:v16 elementCount:v12 originatingRequestSpecifier:v19];
        uint64_t v22 = v27;
        if (v27)
        {
          objc_storeStrong((id *)&v27->_version, obj);
          self = v22;
          uint64_t v22 = self;
        }
        else
        {
          self = 0;
        }
        goto LABEL_18;
      }
      [v4 failWithError:v25];
    }
    else
    {
      [v4 failWithError:v24];
    }
    uint64_t v22 = 0;
LABEL_18:

    goto LABEL_19;
  }
  char v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"descriptor data length (%lu) / expected length (%lu) mismatch", objc_msgSend(v10, "length"), v14, obj);
  uint64_t v21 = +[VNError errorForDataUnavailableWithLocalizedDescription:v20];
  [v4 failWithError:v21];

  uint64_t v22 = 0;
LABEL_20:

  return v22;
}

- (id)labelsAndConfidence
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (unint64_t)requestRevision
{
  v2 = [(VNEspressoModelImageprint *)self originatingRequestSpecifier];
  unint64_t v3 = [v2 requestRevision];

  return v3;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (unint64_t)lengthInBytes
{
  return [(NSData *)self->_descriptorData length];
}

- (VNEspressoModelImageprint)initWithDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 originatingRequestSpecifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VNEspressoModelImageprint;
  uint64_t v12 = [(VNEspressoModelImageprint *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [(id)objc_opt_class() currentVersion];
    version = v12->_version;
    v12->_version = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    descriptorData = v12->_descriptorData;
    v12->_descriptorData = (NSData *)v15;

    v12->_elementCount = a5;
    v12->_elementType = a4;
    v12->_confidenceScoreType = [(id)objc_opt_class() confidenceTypeForOriginatingRequestSpecifier:v11];
    objc_storeStrong((id *)&v12->_originatingRequestSpecifier, a6);
  }

  return v12;
}

- (VNEspressoModelImageprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 requestRevision:(unint64_t)a7
{
  uint64_t v12 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:a7 error:0];
  if (v12)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a6];
    id v27 = 0;
    char v14 = [(id)objc_opt_class() validateDescriptorData:v13 elementType:a5 elementCount:a4 error:&v27];
    id v15 = v27;
    unint64_t v16 = v15;
    if (v14)
    {
      self = [(VNEspressoModelImageprint *)self initWithDescriptorData:v13 elementType:a5 elementCount:a4 originatingRequestSpecifier:v12];
      BOOL v17 = self;
    }
    else
    {
      id v18 = [v15 localizedDescription];
      uint64_t v19 = [v18 UTF8String];
      VNValidatedLog(4, @"%s", v20, v21, v22, v23, v24, v25, v19);

      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (VNEspressoModelImageprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 requestRevision:(unint64_t)a8
{
  return 0;
}

+ (BOOL)isSupportedCodingVersion:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (!+[VisionCoreRuntimeUtilities item:overridesSelector:](VNRuntimeUtilities, "item:overridesSelector:", a1, a2)&& [a1 currentCodingVersion] >= v5)
  {
    return 1;
  }
  if (a4)
  {
    id v7 = [NSString alloc];
    uint64_t v8 = NSStringFromClass((Class)a1);
    v9 = (void *)[v7 initWithFormat:@"%@ does not support a coding version of %u", v8, v5];

    *a4 = +[VNError errorForInvalidOperationWithLocalizedDescription:v9];
  }
  return 0;
}

+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3
{
  return 0;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)originatingRequestSpecifierForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  id v7 = objc_msgSend(a1, "defaultOriginatingRequestClassNameForRequestRevision:");
  if (v7)
  {
    id v18 = 0;
    uint64_t v8 = +[VNRequestSpecifier specifierForRequestClassName:v7 revision:a3 error:&v18];
    id v9 = v18;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      char v14 = NSString;
      id v15 = NSStringFromClass((Class)a1);
      unint64_t v16 = [v14 stringWithFormat:@"%@ could not resolve originating request class of %@: %@", v15, v7, v9];
      +[VNError VNAssert:0 log:v16];

      if (a4) {
        *a4 = v9;
      }
    }
  }
  else
  {
    id v11 = NSString;
    uint64_t v12 = NSStringFromClass((Class)a1);
    uint64_t v13 = [v11 stringWithFormat:@"%@ does not specify a default originating request class", v12];

    +[VNError VNAssert:0 log:v13];
    if (a4)
    {
      *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v13];
    }

    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return 0;
}

+ (id)printFromEspressoBuffer:(id *)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3->var7 == 1)
  {
    if (a3->var14 == 65568)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3->var0 length:4 * a3->var13];
      id v10 = (void *)[objc_alloc((Class)a1) initWithDescriptorData:v9 elementType:1 elementCount:a3->var13 originatingRequestSpecifier:v8];
      id v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else if (a5)
      {
        id v16 = [NSString alloc];
        BOOL v17 = NSStringFromClass((Class)a1);
        id v18 = (void *)[v16 initWithFormat:@"Unable to create %@ from %ld element float data %p", v17, a3->var13, a3->var0];

        *a5 = +[VNError errorForInvalidOperationWithLocalizedDescription:v18];
      }
      goto LABEL_14;
    }
    if (a5)
    {
      id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unsupported element storage type of 0x%04X", a3->var14);
      id v15 = +[VNError errorForInvalidOperationWithLocalizedDescription:v9];
      goto LABEL_9;
    }
LABEL_10:
    id v11 = 0;
    goto LABEL_15;
  }
  if (!a5) {
    goto LABEL_10;
  }
  id v13 = [NSString alloc];
  char v14 = NSStringFromClass((Class)a1);
  id v9 = (void *)[v13 initWithFormat:@"Unable to create %@ from from a tensor buffer of dimension [%lu %lu %lu %lu]", v14, a3->var7, a3->var6, a3->var5, a3->var4];

  id v15 = +[VNError errorForInvalidOperationWithLocalizedDescription:v9];
LABEL_9:
  id v11 = 0;
  *a5 = v15;
LABEL_14:

LABEL_15:

  return v11;
}

+ (id)printWithFloat16PrecisionFloat32Data:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = VNFloat16DataForFloat32Data(v8, a5);
  id v11 = v10;
  if (v10)
  {
    id v12 = VNFloat32DataForFloat16Data(v10, a5);
    id v13 = v12;
    if (v12)
    {
      unint64_t v14 = (unint64_t)[v12 length] >> 2;
      id v15 = [a1 printWithDescriptorData:v13 elementType:1 elementCount:v14 originatingRequestSpecifier:v9 error:a5];
      id v16 = v15;
      if (v15)
      {
        v15[3] |= 1uLL;
        BOOL v17 = v15;
      }
      else if (a5)
      {
        id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"unable to create float16 descriptor with %lu elements", v14);
        *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v18 underlyingError:0];
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)printWithFloat16PrecisionFloat32Values:(const float *)a3 elementCount:(unint64_t)a4 originatingRequestSpecifier:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a3 length:4 * a4 freeWhenDone:0];
  id v12 = [a1 printWithFloat16PrecisionFloat32Data:v11 originatingRequestSpecifier:v10 error:a6];

  return v12;
}

+ (id)printWithDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 originatingRequestSpecifier:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  if ([a1 validateDescriptorData:v12 elementType:a4 elementCount:a5 error:a7]) {
    unint64_t v14 = (void *)[objc_alloc((Class)a1) initWithDescriptorData:v12 elementType:a4 elementCount:a5 originatingRequestSpecifier:v13];
  }
  else {
    unint64_t v14 = 0;
  }

  return v14;
}

+ (BOOL)validateDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  if (!_validateVNElementType(a4, a6)) {
    goto LABEL_11;
  }
  if (a5)
  {
    if (a4 == 1) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = 8 * (a4 == 2);
    }
    unint64_t v11 = v10 * a5;
    BOOL v12 = [v9 length] == v10 * a5;
    BOOL v13 = v12;
    if (a6 && !v12)
    {
      id v14 = [NSString alloc];
      id v15 = VNElementTypeToString(a4);
      id v16 = (void *)[v14 initWithFormat:@"%lu elements of type %@ with length of %lu mismatch to descriptor data length %lu", a5, v15, v11, objc_msgSend(v9, "length")];

      *a6 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v16];

LABEL_11:
      BOOL v13 = 0;
    }
  }
  else
  {
    if (!a6) {
      goto LABEL_11;
    }
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"element count must be non-zero"];
    BOOL v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3
{
  return 0;
}

- (id)VNEspressoModelImageprintOneDimensionMLMultiArrayWithDataType:(int64_t)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNEspressoModelImageprint elementCount](self, "elementCount"));
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  id v9 = [(VNEspressoModelImageprint *)self _VNEspressoModelImageprintMLMultiArrayWithDataType:a3 shape:v8 strides:&unk_1EF7A7E38 error:a4];

  return v9;
}

- (id)VNEspressoModelImageprintMLMultiArrayWithConstraint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"%@ cannot be represented as %@", self, v6];
    *a4 = +[VNError errorForInvalidModelWithLocalizedDescription:v7];
  }
  return 0;
}

- (id)_VNEspressoModelImageprintMLMultiArrayWithDataType:(int64_t)a3 shape:(id)a4 strides:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if ([(VNEspressoModelImageprint *)self elementType] == 1)
  {
    BOOL v12 = [(VNEspressoModelImageprint *)self descriptorData];
    id v13 = v10;
    id v14 = v11;
    id v15 = v12;
    id v16 = v15;
    if (self)
    {
      switch(a3)
      {
        case 65552:
          uint64_t v22 = VNFloat16DataForFloat32Data(v15, a6);
          uint64_t v23 = v22;
          if (v22)
          {
            uint64_t v37 = 0;
            id v38 = &v37;
            uint64_t v39 = 0x3032000000;
            v40 = __Block_byref_object_copy__23083;
            v41 = __Block_byref_object_dispose__23084;
            id v24 = v22;
            id v42 = v24;
            uint64_t aBlock = MEMORY[0x1E4F143A8];
            uint64_t v33 = 3221225472;
            v34 = __137__VNEspressoModelImageprint_VNCoreMLTransformer___VNEspressoModelImageprintMLMultiArrayWithDataType_shape_strides_fromFloat32Data_error___block_invoke_2;
            unsigned int v35 = &unk_1E5B1E1C8;
            id v36 = &v37;
            uint64_t v25 = _Block_copy(&aBlock);
            uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E9A8]), "initWithDataPointer:shape:dataType:strides:deallocator:error:", objc_msgSend(v24, "bytes"), v13, 65552, v14, v25, a6);

            _Block_object_dispose(&v37, 8);
          }
          else
          {
            uint64_t v19 = 0;
          }

          goto LABEL_18;
        case 65600:
          size_t v26 = (unint64_t)[v15 length] >> 2;
          id v27 = (double *)malloc_type_calloc(8uLL, v26, 0x2B955FCAuLL);
          vDSP_vspdp((const float *)[v16 bytes], 1, v27, 1, v26);
          uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithDataPointer:v27 shape:v13 dataType:65600 strides:v14 deallocator:&__block_literal_global_23085 error:a6];
          goto LABEL_18;
        case 65568:
          uint64_t v37 = 0;
          id v38 = &v37;
          uint64_t v39 = 0x3032000000;
          v40 = __Block_byref_object_copy__23083;
          v41 = __Block_byref_object_dispose__23084;
          id v17 = v15;
          id v42 = v17;
          uint64_t aBlock = MEMORY[0x1E4F143A8];
          uint64_t v33 = 3221225472;
          v34 = __137__VNEspressoModelImageprint_VNCoreMLTransformer___VNEspressoModelImageprintMLMultiArrayWithDataType_shape_strides_fromFloat32Data_error___block_invoke;
          unsigned int v35 = &unk_1E5B1E1C8;
          id v36 = &v37;
          id v18 = _Block_copy(&aBlock);
          uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E9A8]), "initWithDataPointer:shape:dataType:strides:deallocator:error:", objc_msgSend(v17, "bytes"), v13, 65568, v14, v18, a6);

          _Block_object_dispose(&v37, 8);
LABEL_18:

          goto LABEL_19;
      }
      if (a6)
      {
        id v28 = [NSString alloc];
        int v29 = [MEMORY[0x1E4F1E9C0] stringForDataType:a3];
        id v30 = (void *)[v28 initWithFormat:@"%@ cannot be represented as %@", self, v29];

        *a6 = +[VNError errorForDataUnavailableWithLocalizedDescription:v30];
      }
    }
    uint64_t v19 = 0;
    goto LABEL_18;
  }
  if (!a6)
  {
    uint64_t v19 = 0;
    goto LABEL_20;
  }
  id v20 = [NSString alloc];
  uint64_t v21 = [MEMORY[0x1E4F1E9C0] stringForDataType:a3];
  id v16 = (void *)[v20 initWithFormat:@"%@ cannot be represented as %@", self, v21];

  +[VNError errorForDataUnavailableWithLocalizedDescription:v16];
  uint64_t v19 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:

  return v19;
}

void __137__VNEspressoModelImageprint_VNCoreMLTransformer___VNEspressoModelImageprintMLMultiArrayWithDataType_shape_strides_fromFloat32Data_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) bytes] == a2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __137__VNEspressoModelImageprint_VNCoreMLTransformer___VNEspressoModelImageprintMLMultiArrayWithDataType_shape_strides_fromFloat32Data_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) bytes] == a2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __137__VNEspressoModelImageprint_VNCoreMLTransformer___VNEspressoModelImageprintMLMultiArrayWithDataType_shape_strides_fromFloat32Data_error___block_invoke_3(int a1, void *a2)
{
}

+ (id)printFromCSUBuffer:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__39_26522;
  id v17 = __Block_byref_object_dispose__40_26523;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __116__VNEspressoModelImageprint_VNCoreSceneUnderstandingDetector__printFromCSUBuffer_originatingRequestSpecifier_error___block_invoke;
  v12[3] = &unk_1E5B1E788;
  v12[4] = &v13;
  v12[5] = &v19;
  [v7 accessDataUsingBlock:v12];
  id v9 = objc_alloc((Class)a1);
  id v10 = (void *)[v9 initWithDescriptorData:v14[5] elementType:1 elementCount:v20[3] originatingRequestSpecifier:v8];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __116__VNEspressoModelImageprint_VNCoreSceneUnderstandingDetector__printFromCSUBuffer_originatingRequestSpecifier_error___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a2 length:a3];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 >> 2;
}

@end