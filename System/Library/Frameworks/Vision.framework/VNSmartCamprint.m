@interface VNSmartCamprint
+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)supportsSecureCoding;
+ (id)codingTypesToCodingKeys;
+ (id)currentVersion;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3;
+ (unint64_t)currentSerializationVersion;
+ (unint64_t)serializationMagicNumber;
+ (unsigned)currentCodingVersion;
- (NSDictionary)labelsAndConfidence;
- (VNSmartCamprint)initWithCoder:(id)a3;
- (VNSmartCamprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 originatingRequestSpecifier:(id)a8;
- (VNSmartCamprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 requestRevision:(unint64_t)a8;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNSmartCamprint

- (void).cxx_destruct
{
}

- (NSDictionary)labelsAndConfidence
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VNSmartCamprint;
  v9 = [(VNEspressoModelImageprint *)&v20 serializeStateIntoData:v8 startingAtByteOffset:a4 error:a5];
  if (v9)
  {
    uint64_t v10 = [v8 mutableBytes];
    v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_labelsAndConfidence requiringSecureCoding:1 error:a5];
    v12 = v11;
    if (v11)
    {
      v13 = &v9[a4];
      if ([v11 length])
      {
        *(_DWORD *)&v13[v10] = [v12 length];
        id v14 = v12;
        v15 = (const void *)[v14 bytes];
        size_t v16 = [v14 length];
        v17 = v13 + 4;
        memcpy(&v17[v10], v15, v16);
        v13 = &v17[v16];
      }
      v9 = &v13[-a4];
      if (&v13[-a4] == (char *)[(VNSmartCamprint *)self serializedLength])
      {
        calculateChecksumMD5((char *)(v10 + a4 + 28), (unint64_t)(v9 - 28), (unsigned __int8 *)(v10 + a4 + 12));
LABEL_10:

        goto LABEL_11;
      }
      if (a5)
      {
        v18 = [NSString stringWithFormat:@"Unexpected size of serialized state of the object of type %@", objc_opt_class()];
        *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v18];
      }
    }
    v9 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return (unint64_t)v9;
}

- (unint64_t)serializedLength
{
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_labelsAndConfidence requiringSecureCoding:1 error:0];
  unint64_t v3 = [v2 length] + 4;

  return v3;
}

- (VNSmartCamprint)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNSmartCamprint;
  v5 = [(VNEspressoModelImageprint *)&v14 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"labelsConfidences"];
    labelsAndConfidence = v5->_labelsAndConfidence;
    v5->_labelsAndConfidence = (NSDictionary *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNSmartCamprint;
  [(VNEspressoModelImageprint *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_labelsAndConfidence forKey:@"labelsConfidences"];
}

- (VNSmartCamprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 originatingRequestSpecifier:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  size_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a6];
  id v34 = 0;
  char v17 = [(id)objc_opt_class() validateDescriptorData:v16 elementType:a5 elementCount:a4 error:&v34];
  id v18 = v34;
  v19 = v18;
  if (v17)
  {
    v33.receiver = self;
    v33.super_class = (Class)VNSmartCamprint;
    objc_super v20 = [(VNEspressoModelImageprint *)&v33 initWithDescriptorData:v16 elementType:a5 elementCount:a4 originatingRequestSpecifier:v15];
    if (v20)
    {
      uint64_t v21 = [v14 copy];
      labelsAndConfidence = v20->_labelsAndConfidence;
      v20->_labelsAndConfidence = (NSDictionary *)v21;
    }
    self = v20;
    v23 = self;
  }
  else
  {
    id v24 = [v18 localizedDescription];
    uint64_t v25 = [v24 UTF8String];
    VNValidatedLog(4, @"%s", v26, v27, v28, v29, v30, v31, v25);

    v23 = 0;
  }

  return v23;
}

- (VNSmartCamprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 requestRevision:(unint64_t)a8
{
  id v14 = a7;
  id v15 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:a8 error:0];
  if (v15)
  {
    self = [(VNSmartCamprint *)self initWithData:a3 elementCount:a4 elementType:a5 lengthInBytes:a6 labelsAndConfidence:v14 originatingRequestSpecifier:v15];
    size_t v16 = self;
  }
  else
  {
    size_t v16 = 0;
  }

  return v16;
}

+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 specifiesRequestClass:objc_opt_class()]
    && [v3 requestRevision] == 1;

  return v4;
}

+ (unint64_t)currentSerializationVersion
{
  return 2;
}

+ (unint64_t)serializationMagicNumber
{
  return 3394132480;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 2;
}

+ (id)codingTypesToCodingKeys
{
  if (+[VNSmartCamprint codingTypesToCodingKeys]::onceToken != -1) {
    dispatch_once(&+[VNSmartCamprint codingTypesToCodingKeys]::onceToken, &__block_literal_global_10569);
  }
  v2 = (void *)+[VNSmartCamprint codingTypesToCodingKeys]::codingTypesToCodingKeys;

  return v2;
}

void __42__VNSmartCamprint_codingTypesToCodingKeys__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"emp_data";
  v2[1] = @"emp_elementsCount";
  v3[0] = @"sc_d";
  v3[1] = @"sc_ec";
  v2[2] = @"emp_elementsType";
  v2[3] = @"emp_length";
  v3[2] = @"sc_et";
  v3[3] = @"sc_l";
  v2[4] = @"emp_labelsAndConfidence";
  v2[5] = @"VNEspressoModelImageprint";
  v3[4] = @"sc_lac";
  v3[5] = @"VNSmartCamprint";
  v2[6] = @"emp_algorithmVersionCodingKey";
  v2[7] = @"emp_algorithmVersion";
  v3[6] = @"sc_av";
  v3[7] = @"1.0";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)+[VNSmartCamprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
  +[VNSmartCamprint codingTypesToCodingKeys]::codingTypesToCodingKeys = v0;
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
  return @"VNCreateSmartCamprintRequest";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end