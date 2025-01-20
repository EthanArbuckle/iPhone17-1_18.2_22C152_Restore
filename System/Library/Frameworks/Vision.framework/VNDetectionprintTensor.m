@interface VNDetectionprintTensor
+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)supportsSecureCoding;
+ (id)currentVersion;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (id)tensorFromCSUBuffer:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5;
+ (id)tensorFromEspressoBuffer:(id *)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5;
+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3;
+ (unint64_t)currentSerializationVersion;
+ (unint64_t)serializationMagicNumber;
+ (unsigned)currentCodingVersion;
- (VNDetectionprintTensor)initWithCoder:(id)a3;
- (VNDetectionprintTensor)initWithDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 originatingRequestSpecifier:(id)a6;
- (VisionCoreEspressoTensorShape)shape;
- (id)VNEspressoModelImageprintMLMultiArrayWithConstraint:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNDetectionprintTensor

- (void).cxx_destruct
{
}

- (VisionCoreEspressoTensorShape)shape
{
  return self->_shape;
}

- (VNDetectionprintTensor)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNDetectionprintTensor;
  v5 = [(VNEspressoModelImageprint *)&v15 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"shape"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shape"];
      shape = v5->_shape;
      v5->_shape = (VisionCoreEspressoTensorShape *)v6;

      if (!v5->_shape) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v8 = [(VNEspressoModelImageprint *)v5 elementCount];
      if (v8 == 221952)
      {
        uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB3E98]) initWithBatchNumber:1 channels:768 height:17 width:17];
      }
      else
      {
        if (v8 != 352800)
        {
          v12 = [NSString stringWithFormat:@"Unsupported %@", v5];
          v13 = +[VNError errorForOperationFailedErrorWithLocalizedDescription:v12];
          [v4 failWithError:v13];

LABEL_12:
          v11 = 0;
          goto LABEL_13;
        }
        uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB3E98]) initWithBatchNumber:1 channels:288 height:35 width:35];
      }
      v10 = v5->_shape;
      v5->_shape = (VisionCoreEspressoTensorShape *)v9;
    }
  }
  v11 = v5;
LABEL_13:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNDetectionprintTensor;
  [(VNEspressoModelImageprint *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_shape forKey:@"shape"];
}

- (VNDetectionprintTensor)initWithDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 originatingRequestSpecifier:(id)a6
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VNDetectionprintTensor;
  v7 = [(VNEspressoModelImageprint *)&v11 initWithDescriptorData:a3 elementType:a4 elementCount:a5 originatingRequestSpecifier:a6];
  if (v7)
  {
    v12[0] = a5;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB3E98]) initWithSizes:v12 rank:1];
    shape = v7->_shape;
    v7->_shape = (VisionCoreEspressoTensorShape *)v8;
  }
  return v7;
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
  return a3 < 3;
}

+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 == 1;
}

+ (unint64_t)currentSerializationVersion
{
  return 3;
}

+ (unint64_t)serializationMagicNumber
{
  return 1685349236;
}

+ (unsigned)currentCodingVersion
{
  return 2;
}

+ (id)currentVersion
{
  return @"1";
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNCreateDetectionprintRequest";
}

+ (id)tensorFromEspressoBuffer:(id *)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (a3->var14 == 65568)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3->var0 length:4 * a3->var13];
    a5 = [(id)objc_opt_class() printWithDescriptorData:v8 elementType:1 elementCount:a3->var13 originatingRequestSpecifier:v7 error:a5];
    if (a5)
    {
      uint64_t v15 = 0;
      long long v9 = *(_OWORD *)&a3->var6;
      long long v16 = *(_OWORD *)&a3->var4;
      long long v17 = v9;
      v10 = [MEMORY[0x1E4FB3E98] shapeForBlobDimensions:&v15];
      id v11 = a5[8];
      a5[8] = v10;

      v12 = a5;
    }
  }
  else if (a5)
  {
    v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unsupported element storage type of 0x%04X", a3->var14);
    *a5 = +[VNError errorForInvalidOperationWithLocalizedDescription:v13];

    a5 = 0;
  }

  return a5;
}

+ (id)tensorFromCSUBuffer:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__20174;
  v28 = __Block_byref_object_dispose__20175;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__20174;
  v22 = __Block_byref_object_dispose__20175;
  id v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__VNDetectionprintTensor_tensorFromCSUBuffer_originatingRequestSpecifier_error___block_invoke;
  v13[3] = &unk_1E5B1DF30;
  uint64_t v15 = &v24;
  id v17 = a1;
  id v9 = v8;
  id v14 = v9;
  long long v16 = &v18;
  [a3 accessDataUsingBlock:v13];
  v10 = (void *)v25[5];
  if (v10)
  {
    id v11 = v10;
  }
  else if (a5)
  {
    *a5 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

void __80__VNDetectionprintTensor_tensorFromCSUBuffer_originatingRequestSpecifier_error___block_invoke(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a2 length:a3];
  v10 = objc_opt_class();
  unint64_t v11 = a3 >> 2;
  uint64_t v12 = a1[4];
  uint64_t v13 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v13 + 40);
  uint64_t v14 = [v10 printWithDescriptorData:v9 elementType:1 elementCount:v11 originatingRequestSpecifier:v12 error:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);
  uint64_t v15 = *(void *)(a1[5] + 8);
  long long v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4FB3F50]) initWithByteOffsets:a5 rank:a4];
    uint64_t v18 = *(void *)(a1[6] + 8);
    id v26 = *(id *)(v18 + 40);
    v19 = [v17 shapeForPackedElementsOfType:65568 error:&v26];
    objc_storeStrong((id *)(v18 + 40), v26);
    if (v19)
    {
      id v20 = objc_alloc(MEMORY[0x1E4FB3E98]);
      id v21 = v19;
      uint64_t v22 = objc_msgSend(v20, "initWithSizes:rank:", objc_msgSend(v21, "sizes"), objc_msgSend(v21, "rank"));
      uint64_t v23 = *(void *)(*(void *)(a1[5] + 8) + 40);
      uint64_t v24 = *(void **)(v23 + 64);
      *(void *)(v23 + 64) = v22;
    }
    else
    {
      uint64_t v25 = *(void *)(a1[5] + 8);
      uint64_t v24 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = 0;
    }
  }
}

- (id)VNEspressoModelImageprintMLMultiArrayWithConstraint:(id)a3 error:(id *)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(VNDetectionprintTensor *)self shape];
  if ([v7 rank] == 4 && objc_msgSend(v7, "batchNumber") == 1)
  {
    id v8 = [v6 shape];
    if ([v8 count] != 3)
    {
      if (!a4) {
        goto LABEL_17;
      }
      id v18 = [NSString alloc];
      v19 = [v8 componentsJoinedByString:@", "];
      id v20 = (void *)[v18 initWithFormat:@"MLMultiArrayConstraint has an unexpected shape of [ %@ ]", v19];

      id v21 = +[VNError errorForInvalidModelWithLocalizedDescription:v20];
LABEL_16:
      *a4 = v21;

      a4 = 0;
      goto LABEL_17;
    }
    id v9 = v7;
    v10 = (void *)[v9 sizes];
    unint64_t v11 = [v8 objectAtIndexedSubscript:0];
    if ([v11 integerValue] == v10[1])
    {
      uint64_t v12 = [v8 objectAtIndexedSubscript:1];
      if ([v12 integerValue] == v10[2])
      {
        uint64_t v13 = [v8 objectAtIndexedSubscript:2];
        uint64_t v26 = [v13 integerValue];
        uint64_t v25 = v10[3];

        if (v26 == v25)
        {
          uint64_t v14 = [NSNumber numberWithUnsignedLong:v10[3] * v10[2]];
          v27[0] = v14;
          uint64_t v15 = [NSNumber numberWithUnsignedLong:v10[3]];
          v27[1] = v15;
          v27[2] = &unk_1EF7A7358;
          long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];

          -[VNEspressoModelImageprint _VNEspressoModelImageprintMLMultiArrayWithDataType:shape:strides:error:](self, "_VNEspressoModelImageprintMLMultiArrayWithDataType:shape:strides:error:", [v6 dataType], v8, v16, a4);
          a4 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_17:
          goto LABEL_18;
        }
        goto LABEL_14;
      }
    }
LABEL_14:
    if (!a4) {
      goto LABEL_17;
    }
    id v22 = [NSString alloc];
    uint64_t v23 = [v8 componentsJoinedByString:@", "];
    id v20 = (void *)[v22 initWithFormat:@"MLMultiArrayConstraint sizes of [ %@ ] does not align with tensor shape of %@", v23, v9];

    id v21 = +[VNError errorForInvalidModelWithLocalizedDescription:v20];
    goto LABEL_16;
  }
  if (a4)
  {
    id v17 = (void *)[[NSString alloc] initWithFormat:@"%@ has an unsupported shape of %@", self, v7];
    *a4 = +[VNError errorForOperationFailedErrorWithLocalizedDescription:v17];

    a4 = 0;
  }
LABEL_18:

  return a4;
}

@end