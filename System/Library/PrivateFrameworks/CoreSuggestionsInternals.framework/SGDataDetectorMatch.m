@interface SGDataDetectorMatch
+ (BOOL)approximateTimeForDataDetectorResult:(__DDResult *)a3;
+ (BOOL)inferredDateForDataDetectorResult:(__DDResult *)a3;
+ (BOOL)partialDateForDataDetectorResult:(__DDResult *)a3;
+ (BOOL)stringHasDatesOrTimes:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_detectionsInPlainText:(id)a3 withEligibleRegions:(id)a4 ddSignature:(_NSRange *)a5 baseDate:(id)a6;
+ (id)detectionsAndSignatureInText:(id)a3 eligibleRegions:(id)a4 baseDate:(id)a5;
+ (id)detectionsInPlainText:(id)a3 baseDate:(id)a4;
+ (id)detectionsInPlainText:(id)a3 withEligibleRegions:(id)a4;
+ (id)detectionsInPlainText:(id)a3 withEligibleRegions:(id)a4 baseDate:(id)a5;
+ (void)resetUnusedScannersForTesting;
- (BOOL)allDay;
- (BOOL)approximateTime;
- (BOOL)inferredDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDataDetectorMatch:(id)a3;
- (BOOL)partialDate;
- (NSDate)detectedDate;
- (NSDate)detectedEndDate;
- (NSString)labelString;
- (NSString)parsecWikidataQid;
- (NSString)valueString;
- (NSTimeZone)detectedEndTimeZone;
- (NSTimeZone)detectedTimeZone;
- (SGDataDetectorMatch)initWithCoder:(id)a3;
- (SGDataDetectorMatch)initWithDetectedDate:(id)a3 detectedTimeZone:(id)a4 detectedEndDate:(id)a5 detectedEndTimeZone:(id)a6 matchType:(unsigned int)a7 range:(_NSRange)a8 labelRange:(_NSRange)a9 labelString:(id)a10 valueRange:(_NSRange)a11 valueString:(id)a12 allDay:(BOOL)a13 inferredDate:(BOOL)a14 approximateTime:(BOOL)a15 partialDate:(BOOL)a16;
- (SGDataDetectorMatch)initWithLookupHintInDomain:(int)a3 range:(_NSRange)a4 labelRange:(_NSRange)a5 labelString:(id)a6 valueRange:(_NSRange)a7 valueString:(id)a8 qid:(id)a9;
- (SGDataDetectorMatch)initWithMatchType:(unsigned int)a3 range:(_NSRange)a4 labelRange:(_NSRange)a5 labelString:(id)a6 valueRange:(_NSRange)a7 valueString:(id)a8;
- (SGDataDetectorMatch)initWithMatchType:(unsigned int)a3 range:(_NSRange)a4 labelRange:(_NSRange)a5 labelString:(id)a6 valueRange:(_NSRange)a7 valueString:(id)a8 postalAddressComponents:(id)a9;
- (SGPostalAddressComponents)postalAddressComponents;
- (_NSRange)labelRange;
- (_NSRange)range;
- (_NSRange)valueRange;
- (id)description;
- (int)parsecDomain;
- (unint64_t)hash;
- (unsigned)matchType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGDataDetectorMatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalAddressComponents, 0);
  objc_storeStrong((id *)&self->_detectedEndTimeZone, 0);
  objc_storeStrong((id *)&self->_detectedEndDate, 0);
  objc_storeStrong((id *)&self->_detectedTimeZone, 0);
  objc_storeStrong((id *)&self->_detectedDate, 0);
  objc_storeStrong((id *)&self->_parsecWikidataQid, 0);
  objc_storeStrong((id *)&self->_labelString, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
}

- (SGPostalAddressComponents)postalAddressComponents
{
  return self->_postalAddressComponents;
}

- (BOOL)partialDate
{
  return self->_partialDate;
}

- (BOOL)approximateTime
{
  return self->_approximateTime;
}

- (BOOL)inferredDate
{
  return self->_inferredDate;
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (NSTimeZone)detectedEndTimeZone
{
  return self->_detectedEndTimeZone;
}

- (NSDate)detectedEndDate
{
  return self->_detectedEndDate;
}

- (NSTimeZone)detectedTimeZone
{
  return self->_detectedTimeZone;
}

- (NSDate)detectedDate
{
  return self->_detectedDate;
}

- (NSString)parsecWikidataQid
{
  return self->_parsecWikidataQid;
}

- (int)parsecDomain
{
  return self->_parsecDomain;
}

- (NSString)labelString
{
  return self->_labelString;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (_NSRange)valueRange
{
  NSUInteger length = self->_valueRange.length;
  NSUInteger location = self->_valueRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)labelRange
{
  NSUInteger length = self->_labelRange.length;
  NSUInteger location = self->_labelRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unsigned)matchType
{
  return self->_matchType;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SGDataDetectorMatch *)self matchType];
  uint64_t v4 = [(SGDataDetectorMatch *)self range];
  [(SGDataDetectorMatch *)self range];
  return (v5 ^ v4) - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SGDataDetectorMatch *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGDataDetectorMatch *)self isEqualToDataDetectorMatch:v5];

  return v6;
}

- (BOOL)isEqualToDataDetectorMatch:(id)a3
{
  id v7 = a3;
  if (v7
    && (unsigned int v8 = -[SGDataDetectorMatch matchType](self, "matchType"), v8 == [v7 matchType]))
  {
    uint64_t v9 = [(SGDataDetectorMatch *)self range];
    uint64_t v11 = v10;
    char v13 = 0;
    if (v9 == [v7 range] && v11 == v12)
    {
      uint64_t v14 = [(SGDataDetectorMatch *)self labelRange];
      uint64_t v16 = v15;
      char v13 = 0;
      if (v14 == [v7 labelRange] && v16 == v17)
      {
        uint64_t v18 = [(SGDataDetectorMatch *)self valueRange];
        uint64_t v20 = v19;
        char v13 = 0;
        if (v18 == [v7 valueRange] && v20 == v21)
        {
          v22 = [(SGDataDetectorMatch *)self labelString];
          v23 = [v7 labelString];
          if (v22 != v23)
          {
            uint64_t v3 = [(SGDataDetectorMatch *)self labelString];
            uint64_t v4 = [v7 labelString];
            if (![v3 isEqual:v4])
            {
              char v13 = 0;
              goto LABEL_24;
            }
          }
          v25 = [(SGDataDetectorMatch *)self valueString];
          v26 = [v7 valueString];
          if (v25 != v26)
          {
            v27 = [(SGDataDetectorMatch *)self valueString];
            uint64_t v5 = [v7 valueString];
            v84 = v27;
            if (![v27 isEqual:v5])
            {
              char v13 = 0;
              goto LABEL_22;
            }
          }
          int v28 = [(SGDataDetectorMatch *)self parsecDomain];
          if (v28 != [v7 parsecDomain])
          {
            char v13 = 0;
            if (v25 == v26) {
              goto LABEL_23;
            }
            goto LABEL_22;
          }
          uint64_t v29 = [(SGDataDetectorMatch *)self parsecWikidataQid];
          v81 = [v7 parsecWikidataQid];
          v82 = v3;
          v83 = v5;
          if ((void *)v29 == v81)
          {
            v80 = (void *)v29;
          }
          else
          {
            v76 = v22;
            v30 = v26;
            v31 = v25;
            v32 = v4;
            v33 = [(SGDataDetectorMatch *)self parsecWikidataQid];
            [v7 parsecWikidataQid];
            v78 = v79 = v33;
            if (!objc_msgSend(v33, "isEqual:"))
            {
              v40 = (void *)v29;
              char v13 = 0;
              v39 = v81;
              uint64_t v4 = v32;
              v25 = v31;
              v26 = v30;
              v22 = v76;
              goto LABEL_35;
            }
            v80 = (void *)v29;
            uint64_t v4 = v32;
            v25 = v31;
            v26 = v30;
            v22 = v76;
          }
          int v34 = [(SGDataDetectorMatch *)self allDay];
          if (v34 != [v7 allDay]
            || (int v35 = [(SGDataDetectorMatch *)self inferredDate],
                v35 != [v7 inferredDate])
            || (int v36 = [(SGDataDetectorMatch *)self approximateTime],
                v36 != [v7 approximateTime])
            || (int v37 = [(SGDataDetectorMatch *)self partialDate],
                v37 != [v7 partialDate]))
          {
            char v13 = 0;
            char v38 = 0;
            goto LABEL_32;
          }
          uint64_t v41 = [(SGDataDetectorMatch *)self postalAddressComponents];
          uint64_t v74 = [v7 postalAddressComponents];
          v75 = (void *)v41;
          if (v41 != v74)
          {
            v42 = [(SGDataDetectorMatch *)self postalAddressComponents];
            v70 = [v7 postalAddressComponents];
            v71 = v42;
            if (!objc_msgSend(v42, "isEqual:"))
            {
              char v13 = 0;
              v44 = (void *)v74;
              v43 = v75;
              goto LABEL_60;
            }
          }
          uint64_t v45 = [(SGDataDetectorMatch *)self detectedDate];
          uint64_t v72 = [v7 detectedDate];
          v73 = (void *)v45;
          if (v45 != v72)
          {
            v46 = [(SGDataDetectorMatch *)self detectedDate];
            v66 = [v7 detectedDate];
            v67 = v46;
            if (!objc_msgSend(v46, "isEqual:"))
            {
              v47 = (void *)v72;
              v48 = v73;
              char v13 = 0;
              v44 = (void *)v74;
LABEL_58:

LABEL_59:
              v43 = v75;
              if (v75 == v44)
              {
LABEL_61:

                char v38 = v13;
LABEL_32:
                v40 = v80;
                v39 = v81;
                if (v80 == v81)
                {

                  char v13 = v38;
                  goto LABEL_36;
                }
LABEL_35:

LABEL_36:
                uint64_t v3 = v82;
                uint64_t v5 = v83;
                if (v25 == v26)
                {
LABEL_23:

                  if (v22 == v23)
                  {
LABEL_25:

                    goto LABEL_13;
                  }
LABEL_24:

                  goto LABEL_25;
                }
LABEL_22:

                goto LABEL_23;
              }
LABEL_60:

              goto LABEL_61;
            }
          }
          uint64_t v49 = [(SGDataDetectorMatch *)self detectedTimeZone];
          uint64_t v68 = [v7 detectedTimeZone];
          v69 = (void *)v49;
          if (v49 != v68)
          {
            v50 = [(SGDataDetectorMatch *)self detectedTimeZone];
            v62 = [v7 detectedTimeZone];
            v63 = v50;
            if (!objc_msgSend(v50, "isEqual:"))
            {
              char v13 = 0;
              v48 = v73;
              v44 = (void *)v74;
              v51 = (void *)v68;
LABEL_56:

LABEL_57:
              v47 = (void *)v72;
              if (v48 == (void *)v72) {
                goto LABEL_59;
              }
              goto LABEL_58;
            }
          }
          v52 = [(SGDataDetectorMatch *)self detectedEndDate];
          [v7 detectedEndDate];
          uint64_t v65 = v64 = v23;
          v77 = v22;
          if (v52 == (void *)v65
            || ([(SGDataDetectorMatch *)self detectedEndDate],
                v53 = objc_claimAutoreleasedReturnValue(),
                [v7 detectedEndDate],
                v60 = objc_claimAutoreleasedReturnValue(),
                v61 = v53,
                objc_msgSend(v53, "isEqual:")))
          {
            v55 = [(SGDataDetectorMatch *)self detectedEndTimeZone];
            uint64_t v56 = [v7 detectedEndTimeZone];
            if (v55 == (void *)v56)
            {

              char v13 = 1;
            }
            else
            {
              v57 = (void *)v56;
              v58 = [(SGDataDetectorMatch *)self detectedEndTimeZone];
              v59 = [v7 detectedEndTimeZone];
              char v13 = [v58 isEqual:v59];
            }
            v23 = v64;
            v54 = (void *)v65;
            v22 = v77;
            v44 = (void *)v74;
            if (v52 == (void *)v65)
            {
LABEL_55:

              v51 = (void *)v68;
              v48 = v73;
              if (v69 == (void *)v68) {
                goto LABEL_57;
              }
              goto LABEL_56;
            }
          }
          else
          {
            char v13 = 0;
            v54 = (void *)v65;
            v44 = (void *)v74;
          }

          goto LABEL_55;
        }
      }
    }
  }
  else
  {
    char v13 = 0;
  }
LABEL_13:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t matchType = self->_matchType;
  id v5 = a3;
  [v5 encodeInt64:matchType forKey:@"matchType"];
  [v5 encodeInteger:self->_range.location forKey:@"range_location"];
  [v5 encodeInteger:self->_range.length forKey:@"range_length"];
  [v5 encodeInteger:self->_labelRange.location forKey:@"labelRange_location"];
  [v5 encodeInteger:self->_labelRange.length forKey:@"labelRange_length"];
  [v5 encodeInteger:self->_valueRange.location forKey:@"valueRange_location"];
  [v5 encodeInteger:self->_valueRange.length forKey:@"valueRange_length"];
  [v5 encodeObject:self->_labelString forKey:@"labelString"];
  [v5 encodeObject:self->_valueString forKey:@"valueString"];
  [v5 encodeInt64:self->_parsecDomain forKey:@"parsecDomain"];
  [v5 encodeObject:self->_parsecWikidataQid forKey:@"parsecWikidataQid"];
  [v5 encodeBool:self->_allDay forKey:@"allDay"];
  [v5 encodeBool:self->_inferredDate forKey:@"inferredDate"];
  [v5 encodeBool:self->_approximateTime forKey:@"approximateTime"];
  [v5 encodeBool:self->_partialDate forKey:@"partialDate"];
  [v5 encodeObject:self->_postalAddressComponents forKey:@"postalAddressComponents"];
  [v5 encodeObject:self->_detectedDate forKey:@"detectedDate"];
  [v5 encodeObject:self->_detectedTimeZone forKey:@"detectedTimeZone"];
  [v5 encodeObject:self->_detectedEndDate forKey:@"detectedEndDate"];
  [v5 encodeObject:self->_detectedEndTimeZone forKey:@"detectedEndTimeZone"];
}

- (SGDataDetectorMatch)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SGDataDetectorMatch;
  id v5 = [(SGDataDetectorMatch *)&v37 init];
  if (v5)
  {
    v5->_uint64_t matchType = [v4 decodeInt64ForKey:@"matchType"];
    uint64_t v6 = [v4 decodeIntegerForKey:@"range_location"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"range_length"];
    v5->_range.NSUInteger location = v6;
    v5->_range.NSUInteger length = v7;
    uint64_t v8 = [v4 decodeIntegerForKey:@"labelRange_location"];
    uint64_t v9 = [v4 decodeIntegerForKey:@"labelRange_length"];
    v5->_labelRange.NSUInteger location = v8;
    v5->_labelRange.NSUInteger length = v9;
    uint64_t v10 = [v4 decodeIntegerForKey:@"valueRange_location"];
    uint64_t v11 = [v4 decodeIntegerForKey:@"valueRange_length"];
    v5->_valueRange.NSUInteger location = v10;
    v5->_valueRange.NSUInteger length = v11;
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"labelString"];
    labelString = v5->_labelString;
    v5->_labelString = (NSString *)v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"valueString"];
    valueString = v5->_valueString;
    v5->_valueString = (NSString *)v16;

    v5->_parsecDomain = [v4 decodeInt64ForKey:@"parsecDomain"];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"parsecWikidataQid"];
    parsecWikidataQid = v5->_parsecWikidataQid;
    v5->_parsecWikidataQid = (NSString *)v19;

    v5->_allDay = [v4 decodeBoolForKey:@"allDay"];
    v5->_inferredDate = [v4 decodeBoolForKey:@"inferredDate"];
    v5->_approximateTime = [v4 decodeBoolForKey:@"approximateTime"];
    v5->_partialDate = [v4 decodeBoolForKey:@"partialDate"];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"postalAddressComponents"];
    postalAddressComponents = v5->_postalAddressComponents;
    v5->_postalAddressComponents = (SGPostalAddressComponents *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"detectedDate"];
    detectedDate = v5->_detectedDate;
    v5->_detectedDate = (NSDate *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"detectedTimeZone"];
    detectedTimeZone = v5->_detectedTimeZone;
    v5->_detectedTimeZone = (NSTimeZone *)v28;

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"detectedEndDate"];
    detectedEndDate = v5->_detectedEndDate;
    v5->_detectedEndDate = (NSDate *)v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"detectedEndTimeZone"];
    detectedEndTimeZone = v5->_detectedEndTimeZone;
    v5->_detectedEndTimeZone = (NSTimeZone *)v34;
  }
  return v5;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<SGDataDetectorMatch/%i %i-%i", self->_matchType, self->_range.location, self->_range.length + self->_range.location);
  return v2;
}

- (SGDataDetectorMatch)initWithMatchType:(unsigned int)a3 range:(_NSRange)a4 labelRange:(_NSRange)a5 labelString:(id)a6 valueRange:(_NSRange)a7 valueString:(id)a8 postalAddressComponents:(id)a9
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v11 = a4.length;
  NSUInteger v12 = a4.location;
  id v21 = a6;
  id v15 = a8;
  id v16 = a9;
  v22.receiver = self;
  v22.super_class = (Class)SGDataDetectorMatch;
  uint64_t v17 = [(SGDataDetectorMatch *)&v22 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_uint64_t matchType = a3;
    v17->_range.NSUInteger location = v12;
    v17->_range.NSUInteger length = v11;
    v17->_labelRange.NSUInteger location = location;
    v17->_labelRange.NSUInteger length = length;
    v17->_valueRange = a7;
    objc_storeStrong((id *)&v17->_labelString, a6);
    objc_storeStrong((id *)&v18->_valueString, a8);
    v18->_parsecDomain = -1;
    objc_storeStrong((id *)&v18->_postalAddressComponents, a9);
  }

  return v18;
}

- (SGDataDetectorMatch)initWithDetectedDate:(id)a3 detectedTimeZone:(id)a4 detectedEndDate:(id)a5 detectedEndTimeZone:(id)a6 matchType:(unsigned int)a7 range:(_NSRange)a8 labelRange:(_NSRange)a9 labelString:(id)a10 valueRange:(_NSRange)a11 valueString:(id)a12 allDay:(BOOL)a13 inferredDate:(BOOL)a14 approximateTime:(BOOL)a15 partialDate:(BOOL)a16
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id obj = a6;
  id v24 = a6;
  id v25 = a10;
  id v31 = a12;
  v32.receiver = self;
  v32.super_class = (Class)SGDataDetectorMatch;
  v26 = [(SGDataDetectorMatch *)&v32 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_detectedDate, a3);
    objc_storeStrong((id *)&v27->_detectedTimeZone, a4);
    objc_storeStrong((id *)&v27->_detectedEndDate, a5);
    objc_storeStrong((id *)&v27->_detectedEndTimeZone, obj);
    v27->_uint64_t matchType = a7;
    v27->_range = a8;
    v27->_labelRange = a9;
    v27->_valueRange = a11;
    objc_storeStrong((id *)&v27->_labelString, a10);
    objc_storeStrong((id *)&v27->_valueString, a12);
    v27->_parsecDomain = -1;
    v27->_allDay = a13;
    v27->_inferredDate = a14;
    v27->_approximateTime = a15;
    v27->_partialDate = a16;
  }

  return v27;
}

- (SGDataDetectorMatch)initWithLookupHintInDomain:(int)a3 range:(_NSRange)a4 labelRange:(_NSRange)a5 labelString:(id)a6 valueRange:(_NSRange)a7 valueString:(id)a8 qid:(id)a9
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v12 = a4.length;
  NSUInteger v13 = a4.location;
  id v21 = a6;
  id v15 = a8;
  id v16 = a9;
  v22.receiver = self;
  v22.super_class = (Class)SGDataDetectorMatch;
  uint64_t v17 = [(SGDataDetectorMatch *)&v22 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_uint64_t matchType = 6;
    v17->_range.NSUInteger location = v13;
    v17->_range.NSUInteger length = v12;
    v17->_labelRange.NSUInteger location = location;
    v17->_labelRange.NSUInteger length = length;
    v17->_valueRange = a7;
    objc_storeStrong((id *)&v17->_labelString, a6);
    objc_storeStrong((id *)&v18->_valueString, a8);
    v18->_parsecDomain = a3;
    objc_storeStrong((id *)&v18->_parsecWikidataQid, a9);
  }

  return v18;
}

- (SGDataDetectorMatch)initWithMatchType:(unsigned int)a3 range:(_NSRange)a4 labelRange:(_NSRange)a5 labelString:(id)a6 valueRange:(_NSRange)a7 valueString:(id)a8
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v11 = a4.length;
  NSUInteger v12 = a4.location;
  id v15 = a6;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SGDataDetectorMatch;
  uint64_t v17 = [(SGDataDetectorMatch *)&v20 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_uint64_t matchType = a3;
    v17->_range.NSUInteger location = v12;
    v17->_range.NSUInteger length = v11;
    v17->_labelRange.NSUInteger location = location;
    v17->_labelRange.NSUInteger length = length;
    v17->_valueRange = a7;
    objc_storeStrong((id *)&v17->_labelString, a6);
    objc_storeStrong((id *)&v18->_valueString, a8);
    v18->_parsecDomain = -1;
  }

  return v18;
}

+ (BOOL)stringHasDatesOrTimes:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    ScannerRefAndAcquire = (const void *)getScannerRefAndAcquire();
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    uint64_t v5 = *MEMORY[0x1E4F5F128];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__SGDataDetectorMatch_stringHasDatesOrTimes___block_invoke;
    v8[3] = &unk_1E65BB498;
    v8[4] = &v9;
    SGDataDetectorsScan((uint64_t)ScannerRefAndAcquire, v3, v5, v8);
    releaseScannerRef(ScannerRefAndAcquire);
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

BOOL __45__SGDataDetectorMatch_stringHasDatesOrTimes___block_invoke(uint64_t a1)
{
  int Category = DDResultGetCategory();
  if (Category == 4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return Category != 4;
}

+ (id)_detectionsInPlainText:(id)a3 withEligibleRegions:(id)a4 ddSignature:(_NSRange *)a5 baseDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F1C9C8] now];
  }
  char v12 = objc_opt_new();
  ScannerRefAndAcquire = (const void *)getScannerRefAndAcquire();
  if (a5)
  {
    *a5 = (_NSRange)xmmword_1CA8CB4A0;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    if (!Mutable)
    {
      id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v15);
    }
  }
  else
  {
    CFMutableArrayRef Mutable = 0;
  }
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __87__SGDataDetectorMatch__detectionsInPlainText_withEligibleRegions_ddSignature_baseDate___block_invoke;
  id v24 = &unk_1E65B70A8;
  uint64_t v28 = ScannerRefAndAcquire;
  id v16 = v9;
  id v25 = v16;
  CFMutableArrayRef v29 = Mutable;
  id v17 = v11;
  id v26 = v17;
  id v18 = v12;
  id v27 = v18;
  v30 = a5;
  [v10 enumerateRangesUsingBlock:&v21];

  releaseScannerRef(ScannerRefAndAcquire);
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t v19 = objc_msgSend(v18, "matches", v21, v22, v23, v24);

  return v19;
}

void __87__SGDataDetectorMatch__detectionsInPlainText_withEligibleRegions_ddSignature_baseDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __87__SGDataDetectorMatch__detectionsInPlainText_withEligibleRegions_ddSignature_baseDate___block_invoke_2;
  v48[3] = &unk_1E65B7080;
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v51 = *(void *)(a1 + 64);
  uint64_t v7 = *(void **)(a1 + 32);
  id v49 = *(id *)(a1 + 40);
  id v50 = *(id *)(v5 + 48);
  SGDataDetectorsScanRange(v6, v7, a2, a3, 3, v48);
  CFArrayRef v8 = *(const __CFArray **)(v5 + 64);
  if (v8 && *(void *)(v5 + 72))
  {
    CFIndex Count = CFArrayGetCount(v8);
    if (Count == 1)
    {
      id v10 = *(uint64_t **)(v5 + 72);
      CFArrayGetValueAtIndex(*(CFArrayRef *)(v5 + 64), 0);
      uint64_t Range = DDResultGetRange();
      *id v10 = SGRangeFromCFRange(Range, v12);
      v10[1] = v13;
    }
    else
    {
      CFIndex v14 = Count;
      if (Count >= 2)
      {
        id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
        CFIndex v16 = 0;
        uint64_t v17 = 0;
        CFIndex v18 = 0;
        uint64_t v42 = v5;
        CFIndex v43 = v14;
        uint64_t v41 = v15;
        do
        {
          uint64_t v19 = objc_opt_new();
          CFArrayGetValueAtIndex(*(CFArrayRef *)(v5 + 64), v18);
          CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
          if (SubResults)
          {
            CFArrayRef v21 = SubResults;
            CFIndex v22 = CFArrayGetCount(SubResults);
            if (v22 > v17)
            {
              uint64_t v17 = v22;
              CFIndex v16 = v18;
            }
            if (v22 >= 1)
            {
              CFIndex v23 = v22;
              uint64_t v24 = v17;
              CFIndex v25 = v16;
              for (CFIndex i = 0; i != v23; ++i)
              {
                CFArrayGetValueAtIndex(v21, i);
                if (DDResultHasType())
                {
                  *(void *)buf = 0;
                  if (DDResultCopyPhoneValue())
                  {
                    id v27 = *(void **)buf;
                    if (*(void *)buf)
                    {
                      uint64_t v28 = SGNormalizePhoneNumber();
                      [v19 addObject:v28];
                    }
                  }
                }
              }
              CFIndex v16 = v25;
              uint64_t v17 = v24;
              uint64_t v5 = v42;
              CFIndex v14 = v43;
              id v15 = v41;
            }
          }
          [v15 addObject:v19];

          ++v18;
        }
        while (v18 != v14);
        uint64_t v29 = v17;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v30 = v15;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v44 objects:v57 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          v33 = 0;
          uint64_t v34 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v45 != v34) {
                objc_enumerationMutation(v30);
              }
              if (v33) {
                [v33 intersectSet:*(void *)(*((void *)&v44 + 1) + 8 * j)];
              }
              else {
                v33 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * j) mutableCopy];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v44 objects:v57 count:16];
          }
          while (v32);
        }
        else
        {
          v33 = 0;
        }

        if ([v33 count] && v29 >= 1)
        {
          int v36 = sgLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)&buf[4] = v43;
            __int16 v53 = 1024;
            int v54 = v16;
            __int16 v55 = 1024;
            int v56 = v29;
            _os_log_debug_impl(&dword_1CA650000, v36, OS_LOG_TYPE_DEBUG, "Found %i DD sigs for same person. Using sig %i with %i subresults", buf, 0x14u);
          }

          objc_super v37 = *(uint64_t **)(v5 + 72);
          CFArrayGetValueAtIndex(*(CFArrayRef *)(v5 + 64), v16);
          uint64_t v38 = DDResultGetRange();
          *objc_super v37 = SGRangeFromCFRange(v38, v39);
          v37[1] = v40;
        }
      }
    }
  }
}

uint64_t __87__SGDataDetectorMatch__detectionsInPlainText_withEligibleRegions_ddSignature_baseDate___block_invoke_2(uint64_t a1, const void *a2)
{
  if (DDResultHasType())
  {
    id v4 = *(__CFArray **)(a1 + 48);
    if (v4) {
      CFArrayAppendValue(v4, a2);
    }
    CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
    if (SubResults)
    {
      CFArrayRef v6 = SubResults;
      CFIndex Count = CFArrayGetCount(SubResults);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        for (CFIndex i = 0; i != v8; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, i);
          id v11 = matchFromSimpleDDResult((uint64_t)ValueAtIndex, *(void **)(a1 + 32));
          if (v11) {
            [*(id *)(a1 + 40) coalesceAddress:ValueAtIndex orAppendMatch:v11];
          }
        }
      }
    }
  }
  else
  {
    uint64_t v12 = matchFromSimpleDDResult((uint64_t)a2, *(void **)(a1 + 32));
    if (v12) {
      [*(id *)(a1 + 40) coalesceAddress:a2 orAppendMatch:v12];
    }
  }
  return 1;
}

+ (id)detectionsAndSignatureInText:(id)a3 eligibleRegions:(id)a4 baseDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  long long v14 = xmmword_1CA8CB4A0;
  uint64_t v12 = [a1 _detectionsInPlainText:v10 withEligibleRegions:v9 ddSignature:&v14 baseDate:v8];

  [v11 setMatches:v12];
  [v11 setSignatureRange:v14];
  return v11;
}

+ (id)detectionsInPlainText:(id)a3 baseDate:(id)a4
{
  CFArrayRef v6 = (objc_class *)MEMORY[0x1E4F28D60];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_msgSend([v6 alloc], "initWithIndexesInRange:", 0, objc_msgSend(v8, "length"));
  id v10 = [a1 _detectionsInPlainText:v8 withEligibleRegions:v9 ddSignature:0 baseDate:v7];

  return v10;
}

+ (id)detectionsInPlainText:(id)a3 withEligibleRegions:(id)a4 baseDate:(id)a5
{
  return (id)[a1 _detectionsInPlainText:a3 withEligibleRegions:a4 ddSignature:0 baseDate:a5];
}

+ (id)detectionsInPlainText:(id)a3 withEligibleRegions:(id)a4
{
  return (id)[a1 _detectionsInPlainText:a3 withEligibleRegions:a4 ddSignature:0 baseDate:0];
}

+ (void)resetUnusedScannersForTesting
{
  pthread_mutex_lock(&scannerPoolLock);
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    char v4 = v3;
    uint64_t v5 = (void *)sharedScanners[v2];
    if (v5 && !scannerInUse[v2])
    {
      sharedScanners[v2] = 0;
    }
    char v3 = 0;
    uint64_t v2 = 1u;
  }
  while ((v4 & 1) != 0);
  pthread_mutex_unlock(&scannerPoolLock);
}

+ (BOOL)approximateTimeForDataDetectorResult:(__DDResult *)a3
{
  CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
  if (SubResults)
  {
    CFArrayRef v4 = SubResults;
    CFIndex Count = CFArrayGetCount(SubResults);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      BOOL v8 = 1;
      do
      {
        CFArrayGetValueAtIndex(v4, v7);
        if (DDResultTimeIsApprox()) {
          break;
        }
        BOOL v8 = ++v7 < v6;
      }
      while (v6 != v7);
    }
  }
  else
  {
    return DDResultTimeIsApprox() != 0;
  }
  return v8;
}

+ (BOOL)partialDateForDataDetectorResult:(__DDResult *)a3
{
  if (DDResultHasType()) {
    DDResultGetSubresultWithType();
  }
  CFStringRef v3 = CFStringCreateWithCString(0, "PartialDate", 0x8000100u);
  CFStringRef v4 = CFStringCreateWithCString(0, "RelativeDayOfWeek", 0x8000100u);
  BOOL v5 = 1;
  if (!DDResultGetSubresultWithType() && !DDResultGetSubresultWithType())
  {
    DDResultGetSubresultWithType();
    if (!DDResultGetSubresultWithType()) {
      BOOL v5 = 0;
    }
  }
  CFRelease(v3);
  CFRelease(v4);
  return v5;
}

+ (BOOL)inferredDateForDataDetectorResult:(__DDResult *)a3
{
  CFTimeZoneRef v3 = CFTimeZoneCopyDefault();
  if (calendarsAndFormatters_onceToken != -1) {
    dispatch_once(&calendarsAndFormatters_onceToken, &__block_literal_global_9161);
  }
  id v4 = (id)calendarsAndFormatters_result_0;
  BOOL v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  CFIndex v6 = [v4 components:28 fromDate:v5];
  CFIndex v7 = SGDataDetectorsGetDate();
  CFRelease(v3);
  if (v7)
  {
    BOOL v8 = [v4 components:28 fromDate:v7];
    uint64_t v9 = [v8 year];
    if (v9 == [v6 year] && (uint64_t v10 = objc_msgSend(v8, "month"), v10 == objc_msgSend(v6, "month")))
    {
      uint64_t v11 = [v8 day];
      BOOL v12 = v11 == [v6 day];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end