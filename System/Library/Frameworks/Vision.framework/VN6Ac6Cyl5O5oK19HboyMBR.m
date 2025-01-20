@interface VN6Ac6Cyl5O5oK19HboyMBR
+ (BOOL)_signaturePrintTypeSupported:(unint64_t)a3;
+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3;
+ (BOOL)supportsSecureCoding;
+ (id)currentVersion;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (unint64_t)currentSerializationVersion;
+ (unint64_t)serializationMagicNumber;
+ (unsigned)currentCodingVersion;
- (BOOL)isEqual:(id)a3;
- (VN6Ac6Cyl5O5oK19HboyMBR)initWithCoder:(id)a3;
- (VN6Ac6Cyl5O5oK19HboyMBR)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 imageSignatureprintType:(unint64_t)a7 originatingRequestSpecifier:(id)a8;
- (VN6Ac6Cyl5O5oK19HboyMBR)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 imageSignatureprintType:(unint64_t)a7 requestRevision:(unint64_t)a8;
- (VN6Ac6Cyl5O5oK19HboyMBR)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5;
- (VN6Ac6Cyl5O5oK19HboyMBR)initWithState:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (unint64_t)imageSignatureprintType;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (void)encodeWithCoder:(id)a3;
- (void)setImageSignatureprintType:(unint64_t)a3;
@end

@implementation VN6Ac6Cyl5O5oK19HboyMBR

- (void)setImageSignatureprintType:(unint64_t)a3
{
  self->_imageSignatureprintType = a3;
}

- (unint64_t)imageSignatureprintType
{
  return self->_imageSignatureprintType;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  return COERCE_UNSIGNED_INT((float)[(VN6Ac6Cyl5O5oK19HboyMBR *)self imageSignatureprintType]) ^ __ROR8__([(VNEspressoModelImageprint *)&v3 hash], 51);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VN6Ac6Cyl5O5oK19HboyMBR *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v8.receiver = self,
          v8.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR,
          [(VNEspressoModelImageprint *)&v8 isEqual:v4]))
    {
      unint64_t v5 = [(VN6Ac6Cyl5O5oK19HboyMBR *)self imageSignatureprintType];
      BOOL v6 = v5 == [(VN6Ac6Cyl5O5oK19HboyMBR *)v4 imageSignatureprintType];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  v9 = [(VNEspressoModelImageprint *)&v14 serializeStateIntoData:v8 startingAtByteOffset:a4 error:a5];
  if (!v9)
  {
LABEL_6:
    unint64_t v11 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = [v8 mutableBytes];
  *(_DWORD *)&v9[a4 + v10] = self->_imageSignatureprintType;
  unint64_t v11 = (unint64_t)(v9 + 4);
  if (v9 + 4 != (char *)[(VN6Ac6Cyl5O5oK19HboyMBR *)self serializedLength])
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
  v3.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  return [(VNEspressoModelImageprint *)&v3 serializedLength] + 4;
}

- (VN6Ac6Cyl5O5oK19HboyMBR)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  v9 = [(VNEspressoModelImageprint *)&v14 initWithState:v8 byteOffset:a4 error:a5];
  if (!v9) {
    goto LABEL_6;
  }
  unint64_t v10 = *(unsigned int *)([v8 bytes] + *a4);
  *a4 += 4;
  v9->_imageSignatureprintType = v10;
  unint64_t v11 = *a4;
  if (v11 != [(VN6Ac6Cyl5O5oK19HboyMBR *)v9 serializedLength])
  {
    if (!a5) {
      goto LABEL_7;
    }
    v12 = [NSString stringWithFormat:@"Error deserializing object of type %@", objc_opt_class()];
    *a5 = +[VNError errorWithCode:14 message:v12];

LABEL_6:
    a5 = 0;
    goto LABEL_7;
  }
  a5 = v9;
LABEL_7:

  return (VN6Ac6Cyl5O5oK19HboyMBR *)a5;
}

- (VN6Ac6Cyl5O5oK19HboyMBR)initWithState:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  return [(VNEspressoModelImageprint *)&v5 initWithState:a3 error:a4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  [(VNEspressoModelImageprint *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_imageSignatureprintType forKey:@"sgnPrnt"];
}

- (VN6Ac6Cyl5O5oK19HboyMBR)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  objc_super v5 = [(VNEspressoModelImageprint *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_imageSignatureprintType = [v4 decodeIntegerForKey:@"sgnPrnt"];
    BOOL v6 = v5;
  }

  return v5;
}

- (VN6Ac6Cyl5O5oK19HboyMBR)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 imageSignatureprintType:(unint64_t)a7 requestRevision:(unint64_t)a8
{
  objc_super v14 = [(id)objc_opt_class() originatingRequestSpecifierForRequestRevision:a8 error:0];
  if (v14)
  {
    self = [(VN6Ac6Cyl5O5oK19HboyMBR *)self initWithData:a3 elementCount:a4 elementType:a5 lengthInBytes:a6 imageSignatureprintType:a7 originatingRequestSpecifier:v14];
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VN6Ac6Cyl5O5oK19HboyMBR)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 imageSignatureprintType:(unint64_t)a7 originatingRequestSpecifier:(id)a8
{
  id v14 = a8;
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a6];
  id v37 = 0;
  char v16 = [(id)objc_opt_class() validateDescriptorData:v15 elementType:a5 elementCount:a4 error:&v37];
  id v17 = v37;
  v18 = v17;
  if ((v16 & 1) == 0)
  {
    id v27 = [v17 localizedDescription];
    uint64_t v28 = [v27 UTF8String];
    VNValidatedLog(4, @"%s", v29, v30, v31, v32, v33, v34, v28);

LABEL_7:
    v26 = 0;
    goto LABEL_8;
  }
  v36.receiver = self;
  v36.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  v19 = [(VNEspressoModelImageprint *)&v36 initWithDescriptorData:v15 elementType:a5 elementCount:a4 originatingRequestSpecifier:v14];
  if (!v19)
  {
    self = 0;
    goto LABEL_7;
  }
  if ([(id)objc_opt_class() _signaturePrintTypeSupported:a7])
  {
    v19->_imageSignatureprintType = a7;
    self = v19;
    v26 = self;
  }
  else
  {
    VNValidatedLog(4, @"unsupported signature print type %lu", v20, v21, v22, v23, v24, v25, a7);
    v26 = 0;
    self = v19;
  }
LABEL_8:

  return v26;
}

+ (BOOL)_signaturePrintTypeSupported:(unint64_t)a3
{
  return a3 == 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  return 3514433537;
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
  return @"VN6kBnCOr2mZlSV6yV1dLwB";
}

@end