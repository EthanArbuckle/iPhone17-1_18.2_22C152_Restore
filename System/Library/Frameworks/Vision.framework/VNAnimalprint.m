@interface VNAnimalprint
+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)supportsSecureCoding;
+ (id)currentVersion;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (unint64_t)confidenceTypeForRevision:(unint64_t)a3;
+ (unint64_t)currentSerializationVersion;
+ (unint64_t)serializationMagicNumber;
+ (unsigned)currentCodingVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToVNEntityIdentificationModelPrint:(id)a3;
- (NSString)description;
- (VNAnimalprint)initWithCoder:(id)a3;
- (VNAnimalprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8;
- (VNAnimalprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5;
- (VNAnimalprint)initWithState:(id)a3 error:(id *)a4;
- (float)confidence;
- (unint64_t)hash;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNAnimalprint

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
  v14.super_class = (Class)VNAnimalprint;
  v11 = [(VNEspressoModelImageprint *)&v14 description];
  v12 = (void *)[v10 initWithFormat:@"%@; pixels:\n%@", v11, v3];

  return (NSString *)v12;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNAnimalprint;
  id v3 = [(VNEspressoModelImageprint *)&v7 hash];
  [(VNAnimalprint *)self confidence];
  uint64_t v5 = LODWORD(v4);
  if (v4 == 0.0) {
    uint64_t v5 = 0;
  }
  return v5 ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  float v4 = (VNAnimalprint *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)VNAnimalprint,
          [(VNEspressoModelImageprint *)&v10 isEqual:v4]))
    {
      [(VNAnimalprint *)self confidence];
      float v6 = v5;
      [(VNAnimalprint *)v4 confidence];
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
  v14.super_class = (Class)VNAnimalprint;
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
  if (v9 + 4 != (char *)[(VNAnimalprint *)self serializedLength])
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
  v3.super_class = (Class)VNAnimalprint;
  return [(VNEspressoModelImageprint *)&v3 serializedLength] + 4;
}

- (VNAnimalprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNAnimalprint;
  v9 = [(VNEspressoModelImageprint *)&v15 initWithState:v8 byteOffset:a4 error:a5];
  if (!v9) {
    goto LABEL_7;
  }
  float v10 = *(float *)([v8 bytes] + *a4);
  *a4 += 4;
  *(float *)&double v11 = v10;
  if (!+[VNValidationUtilities validateVNConfidenceRange:a5 error:v11])goto LABEL_7; {
  v9->_confidence = v10;
  }
  unint64_t v12 = *a4;
  if (v12 != [(VNAnimalprint *)v9 serializedLength])
  {
    if (!a5) {
      goto LABEL_8;
    }
    v13 = [NSString stringWithFormat:@"Error deserializing object of type %@", objc_opt_class()];
    *a5 = +[VNError errorWithCode:14 message:v13];

LABEL_7:
    a5 = 0;
    goto LABEL_8;
  }
  a5 = v9;
LABEL_8:

  return (VNAnimalprint *)a5;
}

- (VNAnimalprint)initWithState:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VNAnimalprint;
  return [(VNEspressoModelImageprint *)&v5 initWithState:a3 error:a4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNAnimalprint;
  [(VNEspressoModelImageprint *)&v6 encodeWithCoder:v4];
  *(float *)&double v5 = self->_confidence;
  objc_msgSend(v4, "vn_encodeValidatedConfidence:forKey:", @"ap_conf", v5);
}

- (VNAnimalprint)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNAnimalprint;
  double v5 = [(VNEspressoModelImageprint *)&v9 initWithCoder:v4];
  if (v5)
  {
    objc_msgSend(v4, "vn_decodeValidatedConfidenceForKey:", @"ap_conf");
    v5->_confidence = v6;
    float v7 = v5;
  }

  return v5;
}

- (VNAnimalprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8
{
  v25.receiver = self;
  v25.super_class = (Class)VNAnimalprint;
  objc_super v9 = [(VNEspressoModelImageprint *)&v25 initWithData:a3 elementCount:a4 elementType:a5 lengthInBytes:a6 requestRevision:a8];
  if (v9)
  {
    id v24 = 0;
    *(float *)&double v10 = a7;
    BOOL v11 = +[VNValidationUtilities validateVNConfidenceRange:&v24 error:v10];
    id v12 = v24;
    v13 = v12;
    if (v11)
    {
      v9->_confidence = a7;
      objc_super v14 = v9;
    }
    else
    {
      id v15 = [v12 localizedDescription];
      uint64_t v16 = [v15 UTF8String];
      VNValidatedLog(4, @"%s", v17, v18, v19, v20, v21, v22, v16);

      objc_super v14 = 0;
    }
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)confidenceTypeForRevision:(unint64_t)a3
{
  return 0;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 2;
}

+ (unint64_t)currentSerializationVersion
{
  return 2;
}

+ (unint64_t)serializationMagicNumber
{
  return 3198488576;
}

+ (unsigned)currentCodingVersion
{
  return 0;
}

+ (id)currentVersion
{
  return @"1.0";
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNCreateAnimalprintRequest";
}

@end