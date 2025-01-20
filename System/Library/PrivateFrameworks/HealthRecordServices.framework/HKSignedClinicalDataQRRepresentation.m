@interface HKSignedClinicalDataQRRepresentation
+ (BOOL)supportsSecureCoding;
+ (HKSignedClinicalDataQRRepresentation)representationWithQRSegment:(id)a3;
+ (HKSignedClinicalDataQRRepresentation)representationWithSMARTHealthCardQRSegmentData:(id)a3;
+ (id)representationForEUDCCPayloadData:(id)a3 error:(id *)a4;
+ (id)representationForJWSPayload:(id)a3 error:(id *)a4;
+ (id)representationForJWSPayloadData:(id)a3 error:(id *)a4;
+ (id)representationForRawContent:(id)a3 sourceType:(int64_t)a4 error:(id *)a5;
- (BOOL)hasAllExpectedSegments;
- (BOOL)isEqual:(id)a3;
- (HKSignedClinicalDataQRRepresentation)init;
- (HKSignedClinicalDataQRRepresentation)initWithCoder:(id)a3;
- (HKSignedClinicalDataQRRepresentation)initWithSourceType:(int64_t)a3;
- (NSArray)alreadyScannedSegments;
- (NSNumber)expectedNumberOfSegments;
- (id)orderedSegmentsWithError:(id *)a3;
- (id)representationByAddingQRSegment:(id)a3 error:(id *)a4;
- (int64_t)sourceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataQRRepresentation

- (HKSignedClinicalDataQRRepresentation)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSignedClinicalDataQRRepresentation)initWithSourceType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSignedClinicalDataQRRepresentation;
  result = [(HKSignedClinicalDataQRRepresentation *)&v5 init];
  if (result) {
    result->_sourceType = a3;
  }
  return result;
}

+ (HKSignedClinicalDataQRRepresentation)representationWithQRSegment:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"HKSignedClinicalDataQRRepresentation.m", 30, @"Invalid parameter not satisfying: %@", @"segment" object file lineNumber description];
  }
  v6 = [v5 dataValue];
  int v7 = [v6 hasPrefix:@"HC1:"];

  id v8 = objc_alloc((Class)a1);
  if (v7)
  {
    v9 = (void *)[v8 initWithSourceType:2];
    v17[0] = v5;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = (id *)v17;
  }
  else
  {
    v9 = (void *)[v8 initWithSourceType:1];
    id v16 = v5;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = &v16;
  }
  uint64_t v12 = [v10 arrayWithObjects:v11 count:1];
  v13 = (void *)v9[2];
  v9[2] = v12;

  return (HKSignedClinicalDataQRRepresentation *)v9;
}

+ (HKSignedClinicalDataQRRepresentation)representationWithSMARTHealthCardQRSegmentData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      int v7 = [HKSignedClinicalDataQRSegment alloc];
      id v8 = [v4 objectAtIndexedSubscript:v6];
      v9 = -[HKSignedClinicalDataQRSegment initWithDataValue:position:numberOfExpectedSiblings:](v7, "initWithDataValue:position:numberOfExpectedSiblings:", v8, ++v6, [v4 count]);

      [v5 addObject:v9];
    }
    while (v6 < [v4 count]);
  }
  v10 = (void *)[objc_alloc((Class)a1) initWithSourceType:1];
  uint64_t v11 = [v5 copy];
  uint64_t v12 = (void *)v10[2];
  v10[2] = v11;

  return (HKSignedClinicalDataQRRepresentation *)v10;
}

- (id)representationByAddingQRSegment:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKSignedClinicalDataQRRepresentation.m", 59, @"Invalid parameter not satisfying: %@", @"segment" object file lineNumber description];
  }
  id v8 = [(NSArray *)self->_alreadyScannedSegments firstObject];
  v9 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v10 = [v8 numberOfExpectedSiblings];
  if (v10 == [v7 numberOfExpectedSiblings])
  {
    uint64_t v11 = [v9 position];
    if (v11 == [v7 position])
    {
      uint64_t v12 = self;
      goto LABEL_12;
    }
LABEL_7:
    uint64_t v12 = (HKSignedClinicalDataQRRepresentation *)[objc_alloc((Class)objc_opt_class()) initWithSourceType:self->_sourceType];
    if (self->_alreadyScannedSegments) {
      alreadyScannedSegments = self->_alreadyScannedSegments;
    }
    else {
      alreadyScannedSegments = (NSArray *)MEMORY[0x263EFFA68];
    }
    uint64_t v14 = [(NSArray *)alreadyScannedSegments arrayByAddingObject:v7];
    v15 = v12->_alreadyScannedSegments;
    v12->_alreadyScannedSegments = (NSArray *)v14;

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"attempting to add a segment with a different number of expected siblings, aborting");
  uint64_t v12 = 0;
LABEL_12:

  return v12;
}

- (NSNumber)expectedNumberOfSegments
{
  v2 = [(NSArray *)self->_alreadyScannedSegments firstObject];
  v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "numberOfExpectedSiblings"));
  }
  else
  {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (BOOL)hasAllExpectedSegments
{
  v3 = [(HKSignedClinicalDataQRRepresentation *)self expectedNumberOfSegments];
  id v4 = v3;
  if (v3 && (int)[v3 intValue] >= 1)
  {
    int v5 = [v4 intValue];
    BOOL v6 = [(NSArray *)self->_alreadyScannedSegments count] == v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)orderedSegmentsWithError:(id *)a3
{
  if ([(HKSignedClinicalDataQRRepresentation *)self hasAllExpectedSegments])
  {
    int v5 = [(NSArray *)self->_alreadyScannedSegments sortedArrayUsingComparator:&__block_literal_global_4];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 118, @"not all segments have been scanned yet");
    int v5 = 0;
  }

  return v5;
}

uint64_t __65__HKSignedClinicalDataQRRepresentation_orderedSegmentsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 position];
  if (v6 >= [v5 position])
  {
    uint64_t v8 = [v4 position];
    uint64_t v7 = v8 > [v5 position];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSignedClinicalDataQRRepresentation *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      alreadyScannedSegments = self->_alreadyScannedSegments;
      uint64_t v8 = [(HKSignedClinicalDataQRRepresentation *)v6 alreadyScannedSegments];
      if (alreadyScannedSegments == v8)
      {
        char v12 = 1;
      }
      else
      {
        v9 = [(HKSignedClinicalDataQRRepresentation *)v6 alreadyScannedSegments];
        if (v9)
        {
          uint64_t v10 = self->_alreadyScannedSegments;
          uint64_t v11 = [(HKSignedClinicalDataQRRepresentation *)v6 alreadyScannedSegments];
          char v12 = [(NSArray *)v10 isEqualToArray:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  alreadyScannedSegments = self->_alreadyScannedSegments;
  id v5 = a3;
  [v5 encodeObject:alreadyScannedSegments forKey:@"AlreadyScannedSegments"];
  [v5 encodeInteger:self->_sourceType forKey:@"SourceType"];
}

- (HKSignedClinicalDataQRRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"SourceType"])
  {
    id v5 = -[HKSignedClinicalDataQRRepresentation initWithSourceType:](self, "initWithSourceType:", [v4 decodeIntegerForKey:@"SourceType"]);
    if (!v5)
    {
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = v5;
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"AlreadyScannedSegments"];
    alreadyScannedSegments = v6->_alreadyScannedSegments;
    v6->_alreadyScannedSegments = (NSArray *)v8;

    self = v6;
    uint64_t v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v10 = 0;
  }

LABEL_7:
  return v10;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (NSArray)alreadyScannedSegments
{
  return self->_alreadyScannedSegments;
}

- (void).cxx_destruct
{
}

+ (id)representationForRawContent:(id)a3 sourceType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4 == 2)
  {
    uint64_t v9 = [a1 representationForEUDCCPayloadData:v8 error:a5];
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    uint64_t v9 = [a1 representationForJWSPayloadData:v8 error:a5];
LABEL_5:
    uint64_t v10 = (void *)v9;
    goto LABEL_7;
  }
  uint64_t v11 = (void *)MEMORY[0x263F087E8];
  char v12 = NSStringForSignedClinicalDataSourceType();
  objc_msgSend(v11, "hk_assignError:code:format:", a5, 3, @"source type \"%@\" (%lld) is not supported for QR representation generation", v12, a4);

  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

+ (id)representationForJWSPayloadData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithData:v7 encoding:4];

  if (v8)
  {
    uint64_t v9 = [a1 representationForJWSPayload:v8 error:a4];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"failed to convert JWS data to NSString");
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)representationForJWSPayload:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 length];
  if ((unint64_t)[v5 length] < 0x4AC) {
    unint64_t v7 = 2390;
  }
  else {
    unint64_t v7 = (int)(2
  }
             * vcvtpd_s64_f64((double)(unint64_t)[v5 length] / (double)(int)vcvtpd_s64_f64((double)v6 / 1191.0)));
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_alloc_init(MEMORY[0x263F089D8]);
  v25 = v8;
  if ([v5 length])
  {
    v24 = a4;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [v5 rangeOfComposedCharacterSequenceAtIndex:v10];
      uint64_t v13 = v12;
      if (v12) {
        break;
      }
LABEL_13:
      v10 += v13;
      if (v10 >= [v5 length]) {
        goto LABEL_14;
      }
    }
    uint64_t v14 = v11;
    uint64_t v15 = v12;
    while (1)
    {
      unsigned int v16 = [v5 characterAtIndex:v14];
      if (v16 <= 0x2C)
      {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", v24, 3, @"JWS character at index %d cannot be represented an a SMART Health Card QR code because its ASCII value of %0d is below the offset", v10 + v13 + 0xFFFFFFFF, v16);
        goto LABEL_19;
      }
      unsigned __int16 v17 = v16 - 45;
      if (v16 - 45 >= 0x64) {
        break;
      }
      if ([v9 length] >= v7)
      {
        v18 = (void *)[v9 copy];
        [v25 addObject:v18];

        id v19 = objc_alloc_init(MEMORY[0x263F089D8]);
        id v9 = v19;
      }
      objc_msgSend(v9, "appendFormat:", @"%02d", v17);
      ++v14;
      if (!--v15) {
        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", v24, 3, @"JWS character at index %d cannot be represented an a SMART Health Card QR code because its ASCII value of %0d is unexpectedly high", v10 + v13 + 0xFFFFFFFF, v16);
LABEL_19:
    v22 = 0;
    v20 = v25;
  }
  else
  {
LABEL_14:
    v20 = v25;
    if ([v9 length])
    {
      v21 = (void *)[v9 copy];
      [v25 addObject:v21];
    }
    v22 = +[HKSignedClinicalDataQRRepresentation representationWithSMARTHealthCardQRSegmentData:v25];
  }

  return v22;
}

+ (id)representationForEUDCCPayloadData:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v16 = 0;
  unint64_t v6 = objc_msgSend(a3, "hk_zlibCompressedIncludingHeaderAndTrailer:errorOut:", 1, &v16);
  id v7 = v16;
  id v8 = v7;
  if (v6)
  {
    id v9 = objc_msgSend(v6, "hk_base45Encoded");
    if (v9)
    {
      unint64_t v10 = [MEMORY[0x263F089D8] stringWithString:@"HC1:"];
      [v10 appendString:v9];
      v17[0] = v10;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      uint64_t v12 = +[HKSignedClinicalDataQRRepresentation representationWithSMARTHealthCardQRSegmentData:v11];

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"%@: error base45 encoding data", a1, v15);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    id v9 = [v7 localizedDescription];
    objc_msgSend(v13, "hk_assignError:code:format:", a4, 3, @"%@: error zlib compressing data: %@", a1, v9);
  }
  uint64_t v12 = 0;
LABEL_7:

  return v12;
}

@end