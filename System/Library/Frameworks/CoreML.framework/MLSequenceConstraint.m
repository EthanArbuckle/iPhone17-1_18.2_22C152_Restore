@interface MLSequenceConstraint
+ (BOOL)supportsSecureCoding;
- (BOOL)isAllowedValue:(id)a3 error:(id *)a4;
- (MLFeatureDescription)valueDescription;
- (MLSequenceConstraint)initWithCoder:(id)a3;
- (MLSequenceConstraint)initWithValueDescription:(id)a3 countRange:(_NSRange)a4;
- (NSRange)countRange;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLSequenceConstraint

- (void).cxx_destruct
{
}

- (NSRange)countRange
{
  NSUInteger length = self->_countRange.length;
  NSUInteger location = self->_countRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (MLFeatureDescription)valueDescription
{
  return self->_valueDescription;
}

- (MLSequenceConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueDescription"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countRange_loc"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countRange_len"];

  uint64_t v9 = [v8 unsignedIntegerValue];
  v10 = -[MLSequenceConstraint initWithValueDescription:countRange:](self, "initWithValueDescription:countRange:", v5, v7, v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MLSequenceConstraint *)self valueDescription];
  [v4 encodeObject:v5 forKey:@"valueDescription"];

  v6 = NSNumber;
  [(MLSequenceConstraint *)self countRange];
  v8 = [v6 numberWithUnsignedInteger:v7];
  [v4 encodeObject:v8 forKey:@"countRange_len"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLSequenceConstraint countRange](self, "countRange"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"countRange_loc"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[MLSequenceConstraint allocWithZone:a3];
  v5 = [(MLSequenceConstraint *)self valueDescription];
  uint64_t v6 = [(MLSequenceConstraint *)self countRange];
  v8 = -[MLSequenceConstraint initWithValueDescription:countRange:](v4, "initWithValueDescription:countRange:", v5, v6, v7);

  return v8;
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([v6 isUndefined] & 1) == 0)
  {
    uint64_t v7 = [v6 sequenceValue];

    if (v7)
    {
      if ([v6 type] == 7)
      {
        v8 = [v6 sequenceValue];
        id v9 = [v8 values];
        unint64_t v10 = [v9 count];
        NSUInteger location = self->_countRange.location;
        NSUInteger length = self->_countRange.length;

        if (v10 < location || v10 - location >= length)
        {
          if (a4)
          {
            v26 = NSNumber;
            v27 = [v8 values];
            v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
            *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"MLSequenceConstraint count constraint does not allow count of %@", v28];
          }
        }
        else
        {
          uint64_t v13 = [v8 type];
          if (v13 == [(MLFeatureDescription *)self->_valueDescription type])
          {
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id obj = [v8 values];
            uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              unsigned int v16 = 0;
              uint64_t v17 = *(void *)v37;
              while (2)
              {
                uint64_t v18 = 0;
                uint64_t v32 = v16;
                unsigned int v33 = v16 + v15;
                do
                {
                  if (*(void *)v37 != v17) {
                    objc_enumerationMutation(obj);
                  }
                  v19 = +[MLFeatureValue featureValueOfType:fromObject:error:](MLFeatureValue, "featureValueOfType:fromObject:error:", [v8 type], *(void *)(*((void *)&v36 + 1) + 8 * v18), 0);
                  valueDescription = self->_valueDescription;
                  id v35 = 0;
                  BOOL v21 = [(MLFeatureDescription *)valueDescription isAllowedValue:v19 error:&v35];
                  id v22 = v35;
                  v23 = v22;
                  if (!v21)
                  {
                    if (a4)
                    {
                      *a4 = +[MLModelErrorUtils errorWithCode:1, v22, @"Value at index %d of sequence is not allowed", v32 + v18 underlyingError format];
                    }

                    BOOL v24 = 0;
                    goto LABEL_30;
                  }

                  ++v18;
                }
                while (v15 != v18);
                uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
                unsigned int v16 = v33;
                if (v15) {
                  continue;
                }
                break;
              }
            }
            BOOL v24 = 1;
LABEL_30:

            goto LABEL_31;
          }
          if (a4)
          {
            v29 = +[MLFeatureTypeUtils descriptionForType:[(MLFeatureDescription *)self->_valueDescription type]];
            v30 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v8 type]);
            *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"MLSequenceConstraint only allows sequence value of type %@. This sequence is type %@", v29, v30];
          }
        }
        BOOL v24 = 0;
LABEL_31:

        goto LABEL_32;
      }
      if (a4)
      {
        v25 = @"MLSequenceConstraint only allows MLSequence values";
        goto LABEL_18;
      }
LABEL_21:
      BOOL v24 = 0;
      goto LABEL_32;
    }
  }
  if (!a4) {
    goto LABEL_21;
  }
  v25 = @"MLSequenceConstraint cannot check undefined values";
LABEL_18:
  +[MLModelErrorUtils featureTypeErrorWithFormat:v25];
  BOOL v24 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v24;
}

- (MLSequenceConstraint)initWithValueDescription:(id)a3 countRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLSequenceConstraint;
  id v9 = [(MLSequenceConstraint *)&v12 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_valueDescription, a3);
    v10->_countRange.NSUInteger location = location;
    v10->_countRange.NSUInteger length = length;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end