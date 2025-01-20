@interface VNSceneprint
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
- (VNSceneprint)initWithCoder:(id)a3;
- (VNSceneprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 requestRevision:(unint64_t)a8;
- (VNSceneprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNSceneprint

- (void).cxx_destruct
{
}

- (NSDictionary)labelsAndConfidence
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (VNSceneprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNSceneprint;
  v9 = [(VNEspressoModelImageprint *)&v18 initWithState:v8 byteOffset:a4 error:a5];
  if (v9)
  {
    uint64_t v10 = [v8 bytes];
    size_t v11 = *(unsigned int *)(v10 + *a4);
    *a4 += 4;
    if (v11)
    {
      id v12 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v11];
      memcpy((void *)[v12 mutableBytes], (const void *)(v10 + *a4), v11);
      *a4 += v11;
      uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:a5];
      labelsAndConfidence = v9->_labelsAndConfidence;
      v9->_labelsAndConfidence = (NSDictionary *)v13;

      v15 = (VNSceneprint *)v9->_labelsAndConfidence;
      if (!v15) {
        goto LABEL_7;
      }
    }
    else
    {
      v16 = v9->_labelsAndConfidence;
      v9->_labelsAndConfidence = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
  }
  v15 = v9;
LABEL_7:

  return v15;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VNSceneprint;
  v9 = [(VNEspressoModelImageprint *)&v22 serializeStateIntoData:v8 startingAtByteOffset:a4 error:a5];
  if (v9)
  {
    uint64_t v10 = [v8 mutableBytes];
    size_t v11 = &v9[a4];
    if ([(NSDictionary *)self->_labelsAndConfidence count])
    {
      id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_labelsAndConfidence requiringSecureCoding:1 error:a5];
      uint64_t v13 = v12;
      if (!v12) {
        goto LABEL_12;
      }
      int v14 = [v12 length];
      *(_DWORD *)&v11[v10] = v14;
      v15 = v11 + 4;
      if (v14)
      {
        id v16 = v13;
        v17 = (const void *)[v16 bytes];
        size_t v18 = [v16 length];
        memcpy(&v15[v10], v17, v18);
        v15 += v18;
        uint64_t v13 = v16;
      }
    }
    else
    {
      uint64_t v13 = 0;
      *(_DWORD *)&v11[v10] = 0;
      v15 = v11 + 4;
    }
    unint64_t v19 = (unint64_t)&v15[-a4];
    if (&v15[-a4] == (char *)[(VNSceneprint *)self serializedLength])
    {
      calculateChecksumMD5((char *)(v10 + a4 + 28), v19 - 28, (unsigned __int8 *)(v10 + a4 + 12));
LABEL_13:

      goto LABEL_14;
    }
    if (a5)
    {
      v20 = [NSString stringWithFormat:@"Unexpected size of serialized state of the object of type %@", objc_opt_class()];
      *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v20];
    }
LABEL_12:
    unint64_t v19 = 0;
    goto LABEL_13;
  }
  unint64_t v19 = 0;
LABEL_14:

  return v19;
}

- (unint64_t)serializedLength
{
  v6.receiver = self;
  v6.super_class = (Class)VNSceneprint;
  v3 = (char *)[(VNEspressoModelImageprint *)&v6 serializedLength] + 4;
  if ([(NSDictionary *)self->_labelsAndConfidence count])
  {
    v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_labelsAndConfidence requiringSecureCoding:1 error:0];
    v3 += [v4 length];
  }
  return (unint64_t)v3;
}

- (VNSceneprint)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNSceneprint;
  v5 = [(VNEspressoModelImageprint *)&v14 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"labelsConfidences"])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      v9 = (NSDictionary *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
      uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"labelsConfidences"];
      labelsAndConfidence = v5->_labelsAndConfidence;
      v5->_labelsAndConfidence = (NSDictionary *)v10;
    }
    else
    {
      v9 = v5->_labelsAndConfidence;
      v5->_labelsAndConfidence = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }

    id v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNSceneprint;
  [(VNEspressoModelImageprint *)&v7 encodeWithCoder:v4];
  NSUInteger v5 = [(NSDictionary *)self->_labelsAndConfidence count];
  labelsAndConfidence = self->_labelsAndConfidence;
  if (v5)
  {
    [v4 encodeObject:labelsAndConfidence forKey:@"labelsConfidences"];
  }
  else
  {
    self->_labelsAndConfidence = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
}

- (VNSceneprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 requestRevision:(unint64_t)a8
{
  id v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)VNSceneprint;
  v15 = [(VNEspressoModelImageprint *)&v19 initWithData:a3 elementCount:a4 elementType:a5 lengthInBytes:a6 requestRevision:a8];
  if (v15)
  {
    if (v14) {
      id v16 = (void *)[v14 copy];
    }
    else {
      id v16 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v15->_labelsAndConfidence, v16);
    if (v14) {

    }
    v17 = v15;
  }

  return v15;
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
  return 1558503424;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 2;
}

+ (id)codingTypesToCodingKeys
{
  if (+[VNSceneprint codingTypesToCodingKeys]::onceToken != -1) {
    dispatch_once(&+[VNSceneprint codingTypesToCodingKeys]::onceToken, &__block_literal_global_8661);
  }
  v2 = (void *)+[VNSceneprint codingTypesToCodingKeys]::codingTypesToCodingKeys;

  return v2;
}

void __39__VNSceneprint_codingTypesToCodingKeys__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"emp_data";
  v2[1] = @"emp_elementsCount";
  v3[0] = @"data";
  v3[1] = @"elementsCount";
  v2[2] = @"emp_elementsType";
  v2[3] = @"emp_length";
  v3[2] = @"elementsType";
  v3[3] = @"length";
  v2[4] = @"emp_labelsAndConfidence";
  v2[5] = @"VNEspressoModelImageprint";
  v3[4] = @"labelsAndConfidence";
  v3[5] = @"VNSceneprint";
  v2[6] = @"emp_algorithmVersionCodingKey";
  v2[7] = @"emp_algorithmVersion";
  v3[6] = @"algorithmVersion";
  v3[7] = @"1.0";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)+[VNSceneprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
  +[VNSceneprint codingTypesToCodingKeys]::codingTypesToCodingKeys = v0;
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
  return @"VNCreateSceneprintRequest";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end