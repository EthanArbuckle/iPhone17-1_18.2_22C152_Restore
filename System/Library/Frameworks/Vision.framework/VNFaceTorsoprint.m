@interface VNFaceTorsoprint
+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)supportsSecureCoding;
+ (id)codingTypesToCodingKeys;
+ (id)currentVersion;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (unint64_t)currentSerializationVersion;
+ (unsigned)currentCodingVersion;
- (BOOL)isValidFaceprint;
- (BOOL)isValidTorsoprint;
- (VNFaceTorsoprint)initWithCoder:(id)a3;
- (VNFaceTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 faceprintConfidence:(float)a7 torsoprintConfidence:(float)a8;
- (VNFaceTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 faceprintConfidence:(float)a7 torsoprintConfidence:(float)a8 originatingRequestSpecifier:(id)a9;
- (VNFaceTorsoprint)initWithFaceprint:(id)a3 torsoPrint:(id)a4 originatingRequestSpecifier:(id)a5;
- (VNFaceTorsoprint)initWithFaceprint:(id)a3 torsoPrint:(id)a4 requestRevision:(unint64_t)a5;
- (VNFaceTorsoprint)initWithFaceprint:(id)a3 torsoprint:(id)a4;
- (VNFaceTorsoprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5;
- (VNFaceprint)faceprint;
- (VNTorsoprint)torsoprint;
- (id)computeDistance:(id)a3 withDistanceFunction:(unint64_t)a4 error:(id *)a5;
- (id)serializeStateAndReturnError:(id *)a3;
- (unint64_t)personId;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (void)encodeWithCoder:(id)a3;
- (void)setPersonId:(unint64_t)a3;
@end

@implementation VNFaceTorsoprint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoprint, 0);

  objc_storeStrong((id *)&self->_faceprint, 0);
}

- (void)setPersonId:(unint64_t)a3
{
  self->_personId = a3;
}

- (unint64_t)personId
{
  return self->_personId;
}

- (VNTorsoprint)torsoprint
{
  return self->_torsoprint;
}

- (VNFaceprint)faceprint
{
  return self->_faceprint;
}

- (unint64_t)serializedLength
{
  unint64_t v3 = [(VNFaceprint *)self->_faceprint serializedLength];
  return v3 + [(VNTorsoprint *)self->_torsoprint serializedLength] + 42;
}

- (id)serializeStateAndReturnError:(id *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", -[VNFaceTorsoprint serializedLength](self, "serializedLength"));
  if ([(VNFaceTorsoprint *)self serializeStateIntoData:v5 startingAtByteOffset:0 error:a3])
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[VNError errorWithCode:14 message:@"state cannot be nil"];
      unint64_t v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  id v10 = v8;
  uint64_t v11 = [v10 mutableBytes];
  *(void *)&v26[12] = 0;
  *(void *)&v26[20] = 0;
  *(_DWORD *)v26 = -87158511;
  int v12 = [(VNFaceTorsoprint *)self serializedLength];
  *(_DWORD *)&v26[4] = 5;
  *(_DWORD *)&v26[8] = v12;
  BOOL v13 = [(VNFaceTorsoprint *)self isValidFaceprint];
  *(unsigned char *)(v11 + a4 + 28) = v13;
  unint64_t v14 = a4 + 29;
  if (v13)
  {
    unint64_t v15 = [(VNFaceprint *)self->_faceprint serializeStateIntoData:v10 startingAtByteOffset:a4 + 29 error:a5];
    if (!v15) {
      goto LABEL_12;
    }
    v14 += v15;
  }
  BOOL v16 = [(VNFaceTorsoprint *)self isValidTorsoprint];
  *(unsigned char *)(v11 + v14) = v16;
  unint64_t v17 = v14 + 1;
  if (v16)
  {
    unint64_t v18 = [(VNTorsoprint *)self->_torsoprint serializeStateIntoData:v10 startingAtByteOffset:v17 error:a5];
    if (v18)
    {
      v17 += v18;
      goto LABEL_8;
    }
LABEL_12:
    unint64_t v21 = 0;
    goto LABEL_17;
  }
LABEL_8:
  v19 = [(VNEspressoModelImageprint *)self originatingRequestSpecifier];
  *(_DWORD *)(v11 + v17) = [v19 requestRevision];
  *(_DWORD *)(v17 + v11 + 4) = [v19 requestClassCode];
  *(_DWORD *)(v17 + v11 + 8) = [(VNFaceTorsoprint *)self personId];
  unint64_t v20 = v17 - a4;
  unint64_t v21 = v17 - a4 + 12;
  if (v21 == v12)
  {
    v22 = (_OWORD *)(v11 + a4);
    calculateChecksumMD5((char *)(v11 + a4 + 28), v20 - 16, &v26[12]);
    long long v23 = *(_OWORD *)v26;
    *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)&v26[12];
    _OWORD *v22 = v23;
  }
  else
  {
    if (a5)
    {
      v24 = [NSString stringWithFormat:@"Unexpected size of serialized state of the object of type %@", objc_opt_class()];
      *a5 = +[VNError errorWithCode:9 message:v24];
    }
    unint64_t v21 = 0;
  }

LABEL_17:
  return v21;
}

- (VNFaceTorsoprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      id v15 = +[VNError errorWithCode:14 message:@"state cannot be nil"];
      goto LABEL_10;
    }
LABEL_15:
    BOOL v16 = 0;
    goto LABEL_39;
  }
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  unint64_t v12 = *a4;
  BOOL v13 = (_OWORD *)(v11 + *a4);
  *(_OWORD *)v35 = *v13;
  *(_OWORD *)&v35[12] = *(_OWORD *)((char *)v13 + 12);
  *a4 = v12 + 28;
  calculateChecksumMD5((char *)(v11 + v12 + 28), [v10 length] - 28, (unsigned __int8 *)v34);
  if (*(void *)&v35[12] == v34[0] && *(void *)&v35[20] == v34[1])
  {
    uint64_t v17 = *(unsigned int *)&v35[4];
    if (*(_DWORD *)&v35[4] < 4u || (int v18 = *(unsigned __int8 *)(v11 + *a4), v19 = *a4 + 1, *a4 = v19, v18))
    {
      v33 = [[VNFaceprint alloc] initWithState:v10 byteOffset:a4 error:a5];
      if (!v33) {
        goto LABEL_15;
      }
      unint64_t v19 = *a4;
    }
    else
    {
      v33 = 0;
    }
    int v20 = *(unsigned __int8 *)(v11 + v19);
    unint64_t v21 = v19 + 1;
    *a4 = v21;
    if (v20)
    {
      v22 = [[VNTorsoprint alloc] initWithState:v10 byteOffset:a4 error:a5];
      if (!v22)
      {
        BOOL v16 = 0;
LABEL_38:

        goto LABEL_39;
      }
      unint64_t v21 = *a4;
    }
    else
    {
      v22 = 0;
    }
    v32 = v22;
    uint64_t v23 = *(unsigned int *)(v11 + v21);
    *a4 = v21 + 4;
    if ([(id)objc_opt_class() shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:v17])
    {
      v24 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:v23 error:a5];
      if (!v24) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v25 = *(unsigned int *)(v11 + *a4);
      *a4 += 4;
      v26 = +[VNClassRegistrar classNameForClassCode:v25 error:a5];
      if (!v26
        || (+[VNRequestSpecifier specifierForRequestClassName:v26 revision:v23 error:a5], v24 = objc_claimAutoreleasedReturnValue(), v26, !v24))
      {
        v24 = 0;
        goto LABEL_36;
      }
    }
    unint64_t v27 = *a4;
    if (v17 < 5)
    {
      unint64_t v28 = 0;
    }
    else
    {
      unint64_t v28 = *(unsigned int *)(v11 + v27);
      v27 += 4;
      *a4 = v27;
    }
    if (v27 - v12 == *(unsigned int *)&v35[8])
    {
      v29 = [(VNFaceTorsoprint *)self initWithFaceprint:v33 torsoPrint:v32 originatingRequestSpecifier:v24];
      if (v29)
      {
        v29->_personId = v28;
        self = v29;
        BOOL v16 = self;
LABEL_37:

        goto LABEL_38;
      }
      if (a5)
      {
        +[VNError errorWithCode:9 message:@"Failed to initialize VNFaceTorsoprint object"];
        self = 0;
        BOOL v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
      self = 0;
    }
    else if (a5)
    {
      v30 = [NSString stringWithFormat:@"Unexpected size of deserialized state of the object of type %@", objc_opt_class()];
      *a5 = +[VNError errorWithCode:9 message:v30];
    }
LABEL_36:
    BOOL v16 = 0;
    goto LABEL_37;
  }
  if (!a5) {
    goto LABEL_15;
  }
  id v15 = +[VNError errorWithCode:9 message:@"Serialized and calculated MD5s don't match"];
LABEL_10:
  BOOL v16 = 0;
  *a5 = v15;
LABEL_39:

  return v16;
}

- (BOOL)isValidTorsoprint
{
  v2 = [(VNFaceTorsoprint *)self torsoprint];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isValidFaceprint
{
  v2 = [(VNFaceTorsoprint *)self faceprint];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)computeDistance:(id)a3 withDistanceFunction:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Wrong type of print object"];
      BOOL v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  int v9 = [(VNFaceTorsoprint *)self isValidFaceprint];
  int v10 = [v8 isValidFaceprint];
  BOOL v11 = [(VNFaceTorsoprint *)self isValidTorsoprint];
  int v12 = [v8 isValidTorsoprint];
  if (v9 != v10 && ((v11 ^ v12) & 1) != 0)
  {
    BOOL v13 = &unk_1EF7A7F70;
    goto LABEL_21;
  }
  int v14 = v9 & v10;
  int v15 = v11 & v12;
  if ((v9 & v10 | v11 & v12) != 1)
  {
    BOOL v13 = &unk_1EF7A7F80;
    goto LABEL_21;
  }
  if (!v14)
  {
    id v18 = 0;
    BOOL v13 = 0;
    if (!v15) {
      goto LABEL_20;
    }
LABEL_15:
    unint64_t v19 = [(VNFaceTorsoprint *)self torsoprint];
    int v20 = [v8 torsoprint];
    BOOL v13 = [v19 computeDistance:v20 withDistanceFunction:a4 error:a5];

    if (v13) {
      char v21 = v14;
    }
    else {
      char v21 = 0;
    }
    if (v21)
    {
      v22 = NSNumber;
      [v18 floatValue];
      float v24 = v23;
      [v13 floatValue];
      *(float *)&double v26 = (float)(v25 * 0.5) + (float)(v24 * 0.5);
      uint64_t v27 = [v22 numberWithFloat:v26];

      BOOL v13 = (void *)v27;
    }
    goto LABEL_20;
  }
  BOOL v16 = [(VNFaceTorsoprint *)self faceprint];
  uint64_t v17 = [v8 faceprint];
  id v18 = [v16 computeDistance:v17 withDistanceFunction:a4 error:a5];

  if (!v18)
  {
LABEL_12:
    BOOL v13 = 0;
    goto LABEL_21;
  }
  if (v15) {
    goto LABEL_15;
  }
  id v18 = v18;
  BOOL v13 = v18;
LABEL_20:

LABEL_21:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[VNEspressoModelImageprint requestRevision](self, "requestRevision"), @"FTp_rev");
  [v4 encodeObject:self->_faceprint forKey:@"FTp_fp"];
  [v4 encodeObject:self->_torsoprint forKey:@"FTp_tp"];
  [v4 encodeInteger:self->_personId forKey:@"FTp_pid"];
}

- (VNFaceTorsoprint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FTp_fp"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FTp_tp"];
  v7 = objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", objc_msgSend(v4, "decodeIntegerForKey:", @"FTp_rev"), 0);
  if (v7)
  {
    id v8 = [(VNFaceTorsoprint *)self initWithFaceprint:v5 torsoPrint:v6 originatingRequestSpecifier:v7];
    if (v8)
    {
      if ([v4 containsValueForKey:@"FTp_pid"]) {
        uint64_t v9 = [v4 decodeIntegerForKey:@"FTp_pid"];
      }
      else {
        uint64_t v9 = 0;
      }
      v8->_personId = v9;
      self = v8;
      id v8 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (VNFaceTorsoprint)initWithFaceprint:(id)a3 torsoPrint:(id)a4 originatingRequestSpecifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v16 = a5;
  if (v8)
  {
    uint64_t v17 = [v8 elementType];
    if (v9)
    {
LABEL_3:
      uint64_t v18 = [v9 elementType];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v17 = 1;
    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = 1;
LABEL_6:
  if (v17 == v18)
  {
    v42 = +[VNFaceprint emptyFaceprintDataForRevision:](VNFaceprint, "emptyFaceprintDataForRevision:", [v8 requestRevision]);
    if (v8)
    {
      uint64_t v19 = [v8 elementCount];
      uint64_t v20 = [v8 lengthInBytes];
    }
    else
    {
      unint64_t v23 = [v42 length];
      uint64_t v20 = [v42 length];
      uint64_t v19 = v23 >> 2;
    }
    float v24 = +[VNTorsoprint emptyTorsoprintDataForRevision:](VNTorsoprint, "emptyTorsoprintDataForRevision:", [v9 requestRevision]);
    float v25 = v24;
    if (v9)
    {
      uint64_t v26 = [v9 elementCount];
      uint64_t v27 = [v9 lengthInBytes];
    }
    else
    {
      unint64_t v28 = [v24 length];
      uint64_t v27 = [v25 length];
      uint64_t v26 = v28 >> 2;
    }
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v27 + v20];
    if (v8)
    {
      v30 = [v8 descriptorData];
    }
    else
    {
      v30 = v42;
    }
    [v29 appendData:v30];
    if (v8) {

    }
    if (v9)
    {
      v31 = [v9 descriptorData];
    }
    else
    {
      v31 = v25;
    }
    [v29 appendData:v31];
    uint64_t v32 = v26 + v19;
    if (v9)
    {

      BOOL v33 = v8 == 0;
    }
    else
    {
      BOOL v33 = 1;
    }
    if (v33) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = v17;
    }
    v43.receiver = self;
    v43.super_class = (Class)VNFaceTorsoprint;
    v22 = [(VNEspressoModelImageprint *)&v43 initWithDescriptorData:v29 elementType:v34 elementCount:v32 originatingRequestSpecifier:v16];
    if (v22)
    {
      uint64_t v35 = [v8 copy];
      faceprint = v22->_faceprint;
      v22->_faceprint = (VNFaceprint *)v35;

      uint64_t v37 = [v9 copy];
      torsoprint = v22->_torsoprint;
      v22->_torsoprint = (VNTorsoprint *)v37;

      v22->_personId = 0;
      v39 = v22;
    }

    char v21 = v22;
  }
  else
  {
    VNValidatedLog(4, @"faceprint and torsoprint must have the same element types", v10, v11, v12, v13, v14, v15, v41);
    char v21 = 0;
    v22 = self;
  }

  return v21;
}

- (VNFaceTorsoprint)initWithFaceprint:(id)a3 torsoPrint:(id)a4 requestRevision:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:a5 error:0];
  if (v10)
  {
    self = [(VNFaceTorsoprint *)self initWithFaceprint:v8 torsoPrint:v9 originatingRequestSpecifier:v10];
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (VNFaceTorsoprint)initWithFaceprint:(id)a3 torsoprint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:1 error:0];
  if (v8)
  {
    self = [(VNFaceTorsoprint *)self initWithFaceprint:v6 torsoPrint:v7 originatingRequestSpecifier:v8];
    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (VNFaceTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 faceprintConfidence:(float)a7 torsoprintConfidence:(float)a8 originatingRequestSpecifier:(id)a9
{
  id v16 = a9;
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a6];
  id v46 = 0;
  char v18 = [(id)objc_opt_class() validateDescriptorData:v17 elementType:a5 elementCount:a4 error:&v46];
  id v19 = v46;
  uint64_t v20 = v19;
  if ((v18 & 1) == 0)
  {
    id v22 = [v19 localizedDescription];
    uint64_t v26 = [v22 UTF8String];
    VNValidatedLog(4, @"%s", v27, v28, v29, v30, v31, v32, v26);
    BOOL v33 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v45.receiver = self;
  v45.super_class = (Class)VNFaceTorsoprint;
  char v21 = [(VNEspressoModelImageprint *)&v45 initWithDescriptorData:v17 elementType:a5 elementCount:a4 originatingRequestSpecifier:v16];
  self = v21;
  if (v21)
  {
    id v44 = v16;
    id v22 = +[VNFaceprint emptyFaceprintDataForRevision:3737841667];
    size_t v23 = a6 >> 1;
    unint64_t v43 = a6 >> 3;
    int v24 = memcmp((const void *)[v22 bytes], a3, a6 >> 1);
    if (v24)
    {
      float v25 = 0;
    }
    else
    {
      uint64_t v34 = [VNFaceprint alloc];
      *(float *)&double v35 = a7;
      float v25 = [(VNFaceprint *)v34 initWithData:a3 elementCount:v43 elementType:a5 lengthInBytes:v23 confidence:v44 originatingRequestSpecifier:v35];
    }
    objc_storeStrong((id *)&v21->_faceprint, v25);
    if (!v24) {

    }
    id v36 = +[VNTorsoprint emptyTorsoprintDataForRevision:1];
    uint64_t v37 = (char *)a3 + v23;
    int v38 = memcmp((const void *)[v36 bytes], (char *)a3 + v23, v23);
    if (v38)
    {
      v39 = 0;
    }
    else
    {
      v40 = [VNTorsoprint alloc];
      *(float *)&double v41 = a8;
      v39 = [(VNTorsoprint *)v40 initWithData:v37 elementCount:v43 elementType:a5 lengthInBytes:v23 confidence:v44 originatingRequestSpecifier:v41];
    }
    objc_storeStrong((id *)&v21->_torsoprint, v39);
    id v16 = v44;
    if (!v38) {

    }
    v21->_personId = 0;
    self = v21;

    BOOL v33 = self;
    goto LABEL_16;
  }
  BOOL v33 = 0;
LABEL_17:

  return v33;
}

- (VNFaceTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 faceprintConfidence:(float)a7 torsoprintConfidence:(float)a8
{
  uint64_t v15 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:1 error:0];
  if (v15)
  {
    *(float *)&double v16 = a7;
    *(float *)&double v17 = a8;
    self = [(VNFaceTorsoprint *)self initWithData:a3 elementCount:a4 elementType:a5 lengthInBytes:a6 faceprintConfidence:v15 torsoprintConfidence:v16 originatingRequestSpecifier:v17];
    char v18 = self;
  }
  else
  {
    char v18 = 0;
  }

  return v18;
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
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)codingTypesToCodingKeys
{
  if (+[VNFaceTorsoprint codingTypesToCodingKeys]::onceToken != -1) {
    dispatch_once(&+[VNFaceTorsoprint codingTypesToCodingKeys]::onceToken, &__block_literal_global_6202);
  }
  v2 = (void *)+[VNFaceTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys;

  return v2;
}

void __43__VNFaceTorsoprint_codingTypesToCodingKeys__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"emp_data";
  v2[1] = @"emp_elementsCount";
  v3[0] = @"FTp_data";
  v3[1] = @"FTp_elementsCount";
  v2[2] = @"emp_elementsType";
  v2[3] = @"emp_length";
  v3[2] = @"FTp_elementsType";
  v3[3] = @"FTp_length";
  v2[4] = @"emp_labelsAndConfidence";
  v2[5] = @"VNEspressoModelImageprint";
  v3[4] = @"FTp_labelsAndConfidence";
  v3[5] = @"FTp_VNFaceTorsoprint";
  v2[6] = @"emp_algorithmVersionCodingKey";
  v2[7] = @"emp_algorithmVersion";
  v3[6] = @"FTp_algorithmVersion";
  v3[7] = @"1.0";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)+[VNFaceTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
  +[VNFaceTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys = v0;
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
  if (a3 - 1 >= 2) {
    return @"VNNOPRequest";
  }
  else {
    return @"VNCreateFaceTorsoprintRequest";
  }
}

@end