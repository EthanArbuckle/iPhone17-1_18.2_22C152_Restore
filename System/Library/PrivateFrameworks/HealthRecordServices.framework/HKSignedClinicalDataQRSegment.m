@interface HKSignedClinicalDataQRSegment
+ (BOOL)supportsSecureCoding;
+ (id)segmentFromQRCodeValue:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (HKSignedClinicalDataQRSegment)init;
- (HKSignedClinicalDataQRSegment)initWithCoder:(id)a3;
- (HKSignedClinicalDataQRSegment)initWithDataValue:(id)a3 position:(int64_t)a4 numberOfExpectedSiblings:(int64_t)a5;
- (NSString)dataValue;
- (NSString)fullQRCodeValue;
- (int64_t)numberOfExpectedSiblings;
- (int64_t)position;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataQRSegment

- (HKSignedClinicalDataQRSegment)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSignedClinicalDataQRSegment)initWithDataValue:(id)a3 position:(int64_t)a4 numberOfExpectedSiblings:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSignedClinicalDataQRSegment;
  v9 = [(HKSignedClinicalDataQRSegment *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    dataValue = v9->_dataValue;
    v9->_dataValue = (NSString *)v10;

    v9->_position = a4;
    v9->_numberOfExpectedSiblings = a5;
  }

  return v9;
}

+ (id)segmentFromQRCodeValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 hasPrefix:@"HC1:"])
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithDataValue:v6 position:1 numberOfExpectedSiblings:1];
    goto LABEL_19;
  }
  if (([v6 hasPrefix:@"shc:/"] & 1) == 0)
  {
    v15 = (void *)MEMORY[0x263F087E8];
    v16 = [v6 substringToIndex:3];
    objc_msgSend(v15, "hk_assignError:code:format:", a4, 3, @"unsupported code value \"%@\"", v16);

    v7 = 0;
    goto LABEL_19;
  }
  id v8 = [v6 componentsSeparatedByString:@"/"];
  if ([v8 count] != 2)
  {
    if ([v8 count] == 4)
    {
      v17 = [v8 objectAtIndexedSubscript:1];
      uint64_t v18 = [v17 integerValue];

      if (v18 <= 0)
      {
        v24 = (void *)MEMORY[0x263F087E8];
        v22 = [v8 objectAtIndexedSubscript:1];
        objc_msgSend(v24, "hk_assignError:code:format:", a4, 3, @"invalid chunk position \"%@\"", v22);
      }
      else
      {
        v19 = [v8 objectAtIndexedSubscript:2];
        uint64_t v20 = [v19 integerValue];

        if (v20 <= 0)
        {
          v25 = (void *)MEMORY[0x263F087E8];
          v22 = [v8 objectAtIndexedSubscript:2];
          objc_msgSend(v25, "hk_assignError:code:format:", a4, 3, @"invalid number of chunks \"%@\"", v22);
        }
        else
        {
          if (v18 <= (unint64_t)v20)
          {
            id v27 = objc_alloc((Class)a1);
            uint64_t v10 = [v8 objectAtIndexedSubscript:3];
            v11 = v27;
            v12 = v10;
            uint64_t v13 = v18;
            uint64_t v14 = v20;
            goto LABEL_6;
          }
          v21 = (void *)MEMORY[0x263F087E8];
          v22 = [v8 objectAtIndexedSubscript:1];
          v23 = [v8 objectAtIndexedSubscript:2];
          objc_msgSend(v21, "hk_assignError:code:format:", a4, 3, @"invalid number of chunks \"%@\" for total \"%@\"", v22, v23);
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"invalid QR code segment with %ld segments", objc_msgSend(v8, "count"));
    }
    v7 = 0;
    goto LABEL_18;
  }
  id v9 = objc_alloc((Class)a1);
  uint64_t v10 = [v8 objectAtIndexedSubscript:1];
  v11 = v9;
  v12 = v10;
  uint64_t v13 = 1;
  uint64_t v14 = 1;
LABEL_6:
  v7 = (void *)[v11 initWithDataValue:v12 position:v13 numberOfExpectedSiblings:v14];

LABEL_18:
LABEL_19:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKSignedClinicalDataQRSegment *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dataValue = self->_dataValue;
      id v8 = [(HKSignedClinicalDataQRSegment *)v6 dataValue];
      if (dataValue == v8)
      {
        int64_t position = self->_position;
        if (position == [(HKSignedClinicalDataQRSegment *)v6 position])
        {
          int64_t numberOfExpectedSiblings = self->_numberOfExpectedSiblings;
          BOOL v14 = numberOfExpectedSiblings == [(HKSignedClinicalDataQRSegment *)v6 numberOfExpectedSiblings];
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        id v9 = [(HKSignedClinicalDataQRSegment *)v6 dataValue];
        if (v9)
        {
          uint64_t v10 = self->_dataValue;
          v11 = [(HKSignedClinicalDataQRSegment *)v6 dataValue];
          if ([(NSString *)v10 isEqualToString:v11]
            && (int64_t v12 = self->_position, v12 == [(HKSignedClinicalDataQRSegment *)v6 position]))
          {
            int64_t v13 = self->_numberOfExpectedSiblings;
            BOOL v14 = v13 == [(HKSignedClinicalDataQRSegment *)v6 numberOfExpectedSiblings];
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  return v14;
}

- (NSString)fullQRCodeValue
{
  if ([(NSString *)self->_dataValue hasPrefix:@"HC1:"])
  {
    v3 = self->_dataValue;
  }
  else
  {
    if (self->_numberOfExpectedSiblings < 2) {
      [NSString stringWithFormat:@"%@%@", @"shc:/", self->_dataValue, v5, v6];
    }
    else {
    v3 = [NSString stringWithFormat:@"%@%lu/%lu/%@", @"shc:/", self->_position, self->_numberOfExpectedSiblings, self->_dataValue];
    }
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dataValue = self->_dataValue;
  id v5 = a3;
  [v5 encodeObject:dataValue forKey:@"DataValue"];
  [v5 encodeInteger:self->_position forKey:@"Position"];
  [v5 encodeInteger:self->_numberOfExpectedSiblings forKey:@"NumberOfExpectedSiblings"];
}

- (HKSignedClinicalDataQRSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataValue"];
  if (v5
    && [v4 containsValueForKey:@"Position"]
    && ([v4 containsValueForKey:@"NumberOfExpectedSiblings"] & 1) != 0)
  {
    uint64_t v6 = (HKSignedClinicalDataQRSegment *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDataValue:position:numberOfExpectedSiblings:", v5, objc_msgSend(v4, "decodeIntegerForKey:", @"Position"), objc_msgSend(v4, "decodeIntegerForKey:", @"NumberOfExpectedSiblings"));
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSString)dataValue
{
  return self->_dataValue;
}

- (int64_t)position
{
  return self->_position;
}

- (int64_t)numberOfExpectedSiblings
{
  return self->_numberOfExpectedSiblings;
}

- (void).cxx_destruct
{
}

@end