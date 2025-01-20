@interface PHUserFeedback
+ (BOOL)supportsSecureCoding;
+ (id)_contextForMemoryFeature:(id)a3;
+ (id)_contextForSongIdentifiers:(id)a3;
+ (id)negativeAutonamingUserFeedbackForPerson:(id)a3 rejectedContactIdentifier:(id)a4;
+ (id)negativeAutonamingUserFeedbackForPerson:(id)a3 rejectedName:(id)a4;
+ (id)negativeUserFeedbackForMemoryFeature:(id)a3 existingFeedback:(id)a4;
+ (id)negativeUserFeedbackForMemoryMusicWithSongIdentifier:(id)a3 existingFeedback:(id)a4;
+ (id)negativeUserFeedbackForPerson:(id)a3;
+ (unint64_t)_feedbackFeatureForMemoryFeature:(id)a3;
+ (unint64_t)mergeFeedbackType:(unint64_t)a3 withOtherFeedbackType:(unint64_t)a4;
+ (unint64_t)sumFeedbackType:(unint64_t)a3 withOtherFeedbackType:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualWithoutUUID:(id)a3;
- (NSDate)lastModifiedDate;
- (NSString)context;
- (NSString)uuid;
- (PHUserFeedback)initWithCoder:(id)a3;
- (PHUserFeedback)initWithType:(unint64_t)a3 feature:(unint64_t)a4 context:(id)a5;
- (PHUserFeedback)initWithType:(unint64_t)a3 feature:(unint64_t)a4 context:(id)a5 lastModifiedDate:(id)a6;
- (PHUserFeedback)initWithUUID:(id)a3 type:(unint64_t)a4 feature:(unint64_t)a5 creationType:(unint64_t)a6 context:(id)a7 lastModifiedDate:(id)a8;
- (id)contextAsDateIntervalWithError:(id *)a3;
- (id)contextAsDateWithError:(id *)a3;
- (id)contextAsListOfSongIdentifiersWithError:(id *)a3;
- (id)contextAsLocationWithError:(id *)a3;
- (id)contextAsStringWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)creationType;
- (unint64_t)feature;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHUserFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)context
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)creationType
{
  return self->_creationType;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)description
{
  unint64_t v3 = [(PHUserFeedback *)self type];
  if (v3 > 3) {
    v4 = 0;
  }
  else {
    v4 = off_1E58464D0[v3];
  }
  unint64_t v5 = [(PHUserFeedback *)self feature];
  if (v5 > 6) {
    v6 = 0;
  }
  else {
    v6 = off_1E58464F0[v5];
  }
  unint64_t v7 = [(PHUserFeedback *)self creationType];
  if (v7 > 2) {
    v8 = 0;
  }
  else {
    v8 = off_1E5846528[v7];
  }
  v17.receiver = self;
  v17.super_class = (Class)PHUserFeedback;
  v9 = [(PHUserFeedback *)&v17 description];
  v10 = [(PHUserFeedback *)self uuid];
  unint64_t v11 = [(PHUserFeedback *)self type];
  unint64_t v12 = [(PHUserFeedback *)self feature];
  v13 = [(PHUserFeedback *)self lastModifiedDate];
  v14 = [(PHUserFeedback *)self context];
  v15 = [v9 stringByAppendingFormat:@" UUID: %@, type: %tu (%@), feature: %tu (%@), creationType: %@, lastModifiedDate: %@, context: %@", v10, v11, v4, v12, v6, v8, v13, v14];

  return v15;
}

- (PHUserFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PHUserFeedback *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHUserFeedbackPropertyUUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHUserFeedbackPropertyType"];
    v5->_type = [v8 unsignedIntegerValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHUserFeedbackPropertyFeature"];
    v5->_feature = [v9 unsignedIntegerValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHUserFeedbackPropertyCreationType"];
    v5->_creationType = [v10 unsignedIntegerValue];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHUserFeedbackPropertyContext"];
    context = v5->_context;
    v5->_context = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHUserFeedbackPropertyLastModifiedDate"];
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v8 = a3;
  [v8 encodeObject:uuid forKey:@"PHUserFeedbackPropertyUUID"];
  unint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v8 encodeObject:v5 forKey:@"PHUserFeedbackPropertyType"];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_feature];
  [v8 encodeObject:v6 forKey:@"PHUserFeedbackPropertyFeature"];

  unint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_creationType];
  [v8 encodeObject:v7 forKey:@"PHUserFeedbackPropertyCreationType"];

  [v8 encodeObject:self->_context forKey:@"PHUserFeedbackPropertyContext"];
  [v8 encodeObject:self->_lastModifiedDate forKey:@"PHUserFeedbackPropertyLastModifiedDate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_uuid copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_type;
  v5[3] = self->_feature;
  v5[4] = self->_creationType;
  uint64_t v8 = [(NSString *)self->_context copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  uint64_t v10 = [(NSDate *)self->_lastModifiedDate copyWithZone:a3];
  uint64_t v11 = (void *)v5[6];
  v5[6] = v10;

  return v5;
}

- (unint64_t)hash
{
  v2 = [(PHUserFeedback *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHUserFeedback *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else if ([(NSString *)self->_uuid isEqualToString:v4->_uuid])
  {
    BOOL v5 = [(PHUserFeedback *)self isEqualWithoutUUID:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualWithoutUUID:(id)a3
{
  id v4 = (PHUserFeedback *)a3;
  BOOL v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = self->_type == v4->_type
  }
      && self->_feature == v4->_feature
      && self->_creationType == v4->_creationType
      && [(NSString *)self->_context isEqualToString:v4->_context]
      && [(NSDate *)self->_lastModifiedDate isEqualToDate:v5->_lastModifiedDate];

  return v6;
}

- (id)contextAsListOfSongIdentifiersWithError:(id *)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if ([(PHUserFeedback *)self feature] == 6)
  {
    BOOL v5 = [(PHUserFeedback *)self context];
    BOOL v6 = [v5 dataUsingEncoding:4];

    id v18 = 0;
    unint64_t v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:1 error:&v18];
    id v8 = v18;
    if (v7
      && ([v7 objectForKeyedSubscript:@"songIdentifiers"],
          v9 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          (isKindOfClass & 1) != 0))
    {
      uint64_t v11 = [v7 objectForKeyedSubscript:@"songIdentifiers"];
    }
    else
    {
      if (a3)
      {
        v19[0] = *MEMORY[0x1E4F28568];
        uint64_t v13 = NSString;
        v14 = [(PHUserFeedback *)self context];
        v15 = [v13 stringWithFormat:@"Error parsing context as list of song identifiers. Context: %@.", v14];
        v19[1] = *MEMORY[0x1E4F28A50];
        v20[0] = v15;
        v20[1] = v8;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

        *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotoKit.PHUserFeedback" code:1 userInfo:v16];
      }
      uint64_t v11 = 0;
    }

    goto LABEL_11;
  }
  if (a3)
  {
    unint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"User Feedback feature not supported for parsing context as song identifiers.";
    BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [v12 errorWithDomain:@"com.apple.PhotoKit.PHUserFeedback" code:2 userInfo:v6];
    uint64_t v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v11 = 0;
LABEL_12:

  return v11;
}

- (id)contextAsLocationWithError:(id *)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  if ([(PHUserFeedback *)self feature] == 3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    BOOL v6 = [(PHUserFeedback *)self context];
    unint64_t v7 = [v6 dataUsingEncoding:4];

    id v48 = 0;
    id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:1 error:&v48];
    id v9 = v48;
    if (v8)
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:@"coordinate"];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"latitude"];
      [v11 doubleValue];
      CLLocationDegrees latitude = v12;

      uint64_t v13 = [v10 objectForKeyedSubscript:@"longitude"];
      [v13 doubleValue];
      CLLocationDegrees v15 = v14;

      v16 = [v8 objectForKeyedSubscript:@"altitude"];
      [v16 doubleValue];
      double v18 = v17;

      v19 = [v8 objectForKeyedSubscript:@"horizontalAccuracy"];
      [v19 doubleValue];
      double v21 = v20;

      v22 = [v8 objectForKeyedSubscript:@"verticalAccuracy"];
      [v22 doubleValue];
      double v24 = v23;

      v25 = [v8 objectForKeyedSubscript:@"course"];
      [v25 doubleValue];
      double v27 = v26;

      v28 = [v8 objectForKeyedSubscript:@"courseAccuracy"];
      [v28 doubleValue];
      double v30 = v29;

      v31 = [v8 objectForKeyedSubscript:@"speed"];
      [v31 doubleValue];
      double v33 = v32;

      v34 = [v8 objectForKeyedSubscript:@"speedAccuracy"];
      [v34 doubleValue];
      uint64_t v36 = v35;

      v37 = [v8 objectForKeyedSubscript:@"timestamp"];
      v38 = [v5 dateFromString:v37];

      id v39 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      CLLocationCoordinate2D v40 = CLLocationCoordinate2DMake(latitude, v15);
      v41 = objc_msgSend(v39, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:", v38, v40.latitude, v40.longitude, v18, v21, v24, v27, v30, v33, v36);
    }
    else
    {
      if (!a3)
      {
        v41 = 0;
        goto LABEL_9;
      }
      v49[0] = *MEMORY[0x1E4F28568];
      v43 = NSString;
      v44 = [(PHUserFeedback *)self context];
      v45 = [v43 stringWithFormat:@"Error parsing context as location. Context: '%@'.", v44];
      v49[1] = *MEMORY[0x1E4F28A50];
      v50[0] = v45;
      v50[1] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];

      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotoKit.PHUserFeedback" code:1 userInfo:v10];
      v41 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_9:
    goto LABEL_10;
  }
  if (a3)
  {
    v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52[0] = @"User Feedback feature not supported for parsing context as CLLocation.";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    [v42 errorWithDomain:@"com.apple.PhotoKit.PHUserFeedback" code:2 userInfo:v5];
    v41 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  v41 = 0;
LABEL_11:

  return v41;
}

- (id)contextAsDateIntervalWithError:(id *)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if ([(PHUserFeedback *)self feature] == 5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    BOOL v6 = [(PHUserFeedback *)self context];
    unint64_t v7 = [v6 componentsSeparatedByString:@" - "];

    if ([v7 count] == 2)
    {
      id v8 = [v7 objectAtIndexedSubscript:0];
      id v9 = [v5 dateFromString:v8];

      uint64_t v10 = [v7 objectAtIndexedSubscript:1];
      uint64_t v11 = [v5 dateFromString:v10];

      if (v9 && v11)
      {
        double v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v11];
      }
      else
      {
        if (a3)
        {
          double v17 = NSString;
          double v18 = [(PHUserFeedback *)self context];
          v19 = [v17 stringWithFormat:@"Error parsing context '%@' as date interval.", v18];

          double v20 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v23 = *MEMORY[0x1E4F28568];
          double v24 = v19;
          double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          *a3 = [v20 errorWithDomain:@"com.apple.PhotoKit.PHUserFeedback" code:1 userInfo:v21];
        }
        double v12 = 0;
      }
    }
    else
    {
      if (!a3)
      {
        double v12 = 0;
        goto LABEL_15;
      }
      double v14 = NSString;
      CLLocationDegrees v15 = [(PHUserFeedback *)self context];
      id v9 = [v14 stringWithFormat:@"Error parsing context '%@' as date interval.", v15];

      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      double v26 = v9;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [v16 errorWithDomain:@"com.apple.PhotoKit.PHUserFeedback" code:1 userInfo:v11];
      double v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_15:
    goto LABEL_16;
  }
  if (!a3)
  {
    double v12 = 0;
    goto LABEL_17;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v27 = *MEMORY[0x1E4F28568];
  v28[0] = @"User Feedback feature not supported for parsing context as date interval.";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  [v13 errorWithDomain:@"com.apple.PhotoKit.PHUserFeedback" code:2 userInfo:v5];
  double v12 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_17:

  return v12;
}

- (id)contextAsDateWithError:(id *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if ([(PHUserFeedback *)self feature] == 1)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    BOOL v6 = [(PHUserFeedback *)self context];
    unint64_t v7 = [v5 dateFromString:v6];

    if (v7)
    {
      id v8 = v7;
    }
    else if (a3)
    {
      uint64_t v10 = NSString;
      uint64_t v11 = [(PHUserFeedback *)self context];
      double v12 = [v10 stringWithFormat:@"Error parsing context '%@' as date.", v11];

      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      double v17 = v12;
      double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      *a3 = [v13 errorWithDomain:@"com.apple.PhotoKit.PHUserFeedback" code:1 userInfo:v14];
    }
    goto LABEL_9;
  }
  if (a3)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"User Feedback feature not supported for parsing context as date.";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v9 errorWithDomain:@"com.apple.PhotoKit.PHUserFeedback" code:2 userInfo:v5];
    unint64_t v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  unint64_t v7 = 0;
LABEL_10:

  return v7;
}

- (id)contextAsStringWithError:(id *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(PHUserFeedback *)self feature]
    && [(PHUserFeedback *)self feature]
    && [(PHUserFeedback *)self feature] != 2
    && [(PHUserFeedback *)self feature] != 4)
  {
    if (a3)
    {
      unint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28568];
      v10[0] = @"User Feedback feature not supported for parsing context as string.";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      *a3 = [v7 errorWithDomain:@"com.apple.PhotoKit.PHUserFeedback" code:2 userInfo:v8];
    }
    id v5 = 0;
  }
  else
  {
    id v5 = [(PHUserFeedback *)self context];
  }

  return v5;
}

- (PHUserFeedback)initWithUUID:(id)a3 type:(unint64_t)a4 feature:(unint64_t)a5 creationType:(unint64_t)a6 context:(id)a7 lastModifiedDate:(id)a8
{
  id v15 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_uuid, a3);
    id v16 = a8;
    id v17 = a7;
    self->_type = a4;
    self->_feature = a5;
    self->_creationType = a6;
    uint64_t v18 = (NSString *)[v17 copy];

    context = self->_context;
    self->_context = v18;

    double v20 = (NSDate *)[v16 copy];
    lastModifiedDate = self->_lastModifiedDate;
    self->_lastModifiedDate = v20;
  }
  return self;
}

- (PHUserFeedback)initWithType:(unint64_t)a3 feature:(unint64_t)a4 context:(id)a5 lastModifiedDate:(id)a6
{
  uint64_t v9 = (void *)MEMORY[0x1E4F29128];
  id v10 = a5;
  uint64_t v11 = [v9 UUID];
  double v12 = [v11 UUIDString];
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  double v14 = [(PHUserFeedback *)self initWithUUID:v12 type:a3 feature:a4 creationType:1 context:v10 lastModifiedDate:v13];

  return v14;
}

- (PHUserFeedback)initWithType:(unint64_t)a3 feature:(unint64_t)a4 context:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a5;
  id v10 = [v8 date];
  uint64_t v11 = [(PHUserFeedback *)self initWithType:a3 feature:a4 context:v9 lastModifiedDate:v10];

  return v11;
}

+ (unint64_t)_feedbackFeatureForMemoryFeature:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 16)
  {
    unint64_t v4 = 1;
  }
  else if ([v3 type] == 512)
  {
    unint64_t v4 = 5;
  }
  else if ([v3 type] == 32)
  {
    unint64_t v4 = 2;
  }
  else if ([v3 type] == 4096)
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 4 * ([v3 type] == 0x20000);
  }

  return v4;
}

+ (id)_contextForSongIdentifiers:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v10 = @"songIdentifiers";
  v11[0] = a3;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  id v5 = [v3 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:8 error:0];
  id v7 = [NSString alloc];

  id v8 = (void *)[v7 initWithData:v6 encoding:4];

  return v8;
}

+ (id)_contextForMemoryFeature:(id)a3
{
  v41[9] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  if ([v3 type] == 16)
  {
    id v5 = [v3 date];
    BOOL v6 = [v4 stringFromDate:v5];
LABEL_9:

    goto LABEL_10;
  }
  if ([v3 type] == 512)
  {
    id v5 = [v3 dateInterval];
    id v7 = NSString;
    id v8 = [v5 startDate];
    id v9 = [v4 stringFromDate:v8];
    id v10 = [v5 endDate];
    uint64_t v11 = [v4 stringFromDate:v10];
    BOOL v6 = [v7 stringWithFormat:@"%@%@%@", v9, @" - ", v11];

    goto LABEL_9;
  }
  if ([v3 type] == 32)
  {
    uint64_t v12 = [v3 holidayName];
LABEL_15:
    BOOL v6 = (void *)v12;
    goto LABEL_10;
  }
  if ([v3 type] == 4096)
  {
    id v5 = [v3 location];
    v40[0] = @"coordinate";
    v38[0] = @"latitude";
    uint64_t v13 = NSNumber;
    [v5 coordinate];
    v37 = objc_msgSend(v13, "numberWithDouble:");
    v38[1] = @"longitude";
    v39[0] = v37;
    double v14 = NSNumber;
    [v5 coordinate];
    uint64_t v36 = [v14 numberWithDouble:v15];
    v39[1] = v36;
    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    v41[0] = v35;
    v40[1] = @"altitude";
    id v16 = NSNumber;
    [v5 altitude];
    v34 = objc_msgSend(v16, "numberWithDouble:");
    v41[1] = v34;
    v40[2] = @"horizontalAccuracy";
    id v17 = NSNumber;
    [v5 horizontalAccuracy];
    double v33 = objc_msgSend(v17, "numberWithDouble:");
    v41[2] = v33;
    v40[3] = @"verticalAccuracy";
    uint64_t v18 = NSNumber;
    [v5 verticalAccuracy];
    double v32 = objc_msgSend(v18, "numberWithDouble:");
    v41[3] = v32;
    v40[4] = @"course";
    v19 = NSNumber;
    [v5 course];
    double v20 = objc_msgSend(v19, "numberWithDouble:");
    v41[4] = v20;
    v40[5] = @"courseAccuracy";
    double v21 = NSNumber;
    [v5 courseAccuracy];
    v22 = objc_msgSend(v21, "numberWithDouble:");
    v41[5] = v22;
    v40[6] = @"speed";
    uint64_t v23 = NSNumber;
    [v5 speed];
    double v24 = objc_msgSend(v23, "numberWithDouble:");
    v41[6] = v24;
    v40[7] = @"speedAccuracy";
    uint64_t v25 = NSNumber;
    [v5 speedAccuracy];
    double v26 = objc_msgSend(v25, "numberWithDouble:");
    v41[7] = v26;
    v40[8] = @"timestamp";
    uint64_t v27 = [v5 timestamp];
    v28 = [v4 stringFromDate:v27];
    v41[8] = v28;
    double v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:9];

    double v30 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v29 options:8 error:0];
    BOOL v6 = (void *)[[NSString alloc] initWithData:v30 encoding:4];

    goto LABEL_9;
  }
  if ([v3 type] == 0x20000)
  {
    uint64_t v12 = [v3 areaName];
    goto LABEL_15;
  }
  BOOL v6 = 0;
LABEL_10:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)sumFeedbackType:(unint64_t)a3 withOtherFeedbackType:(unint64_t)a4
{
  if (a3 <= a4) {
    unint64_t v4 = a4;
  }
  else {
    unint64_t v4 = a3;
  }
  if (a4 == 2 && a3 == 2) {
    return 3;
  }
  else {
    return v4;
  }
}

+ (unint64_t)mergeFeedbackType:(unint64_t)a3 withOtherFeedbackType:(unint64_t)a4
{
  if (a3 <= a4) {
    return a4;
  }
  else {
    return a3;
  }
}

+ (id)negativeAutonamingUserFeedbackForPerson:(id)a3 rejectedContactIdentifier:(id)a4
{
  id v4 = a4;
  id v5 = [[PHUserFeedback alloc] initWithType:3 feature:2 context:v4];

  return v5;
}

+ (id)negativeAutonamingUserFeedbackForPerson:(id)a3 rejectedName:(id)a4
{
  id v4 = a4;
  id v5 = [[PHUserFeedback alloc] initWithType:3 feature:1 context:v4];

  return v5;
}

+ (id)negativeUserFeedbackForPerson:(id)a3
{
  id v3 = [a3 userFeedbackProperties];
  id v4 = [v3 userFeedback];

  if ([v4 type] == 2)
  {
    uint64_t v5 = 3;
  }
  else if ([v4 type] == 3)
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 2;
  }
  BOOL v6 = [[PHUserFeedback alloc] initWithType:v5 feature:0 context:0];

  return v6;
}

+ (id)negativeUserFeedbackForMemoryMusicWithSongIdentifier:(id)a3 existingFeedback:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7 || [v7 feature] == 6)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v8 feature] == 6)
    {
      id v17 = 0;
      id v10 = [v8 contextAsListOfSongIdentifiersWithError:&v17];
      id v11 = v17;
      uint64_t v12 = [v10 mutableCopy];

      if (!v12)
      {
        uint64_t v13 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v11;
          _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "PHUserFeedback: Error retrieving song identifiers from existing feedback: %@", buf, 0xCu);
        }
        double v14 = 0;
        goto LABEL_7;
      }

      id v9 = (id)v12;
    }
    [v9 addObject:v6];
    uint64_t v13 = [a1 _contextForSongIdentifiers:v9];
    double v14 = [[PHUserFeedback alloc] initWithType:2 feature:6 context:v13];
    id v11 = v9;
LABEL_7:

    goto LABEL_11;
  }
  double v15 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "PHUserFeedback: Adding multiple pieces of feedback to the same memory is not supported. Will not add feedback for song identifier %@", buf, 0xCu);
  }

  double v14 = v8;
LABEL_11:

  return v14;
}

+ (id)negativeUserFeedbackForMemoryFeature:(id)a3 existingFeedback:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "PHUserFeedback: Adding multiple pieces of feedback to the same memory is not supported. Will not add feedback for memory feature %@", (uint8_t *)&v14, 0xCu);
    }

    id v9 = (PHUserFeedback *)v7;
    goto LABEL_5;
  }
  if (!v6)
  {
    id v9 = [[PHUserFeedback alloc] initWithType:2 feature:0 context:0];
LABEL_5:
    id v10 = v9;
    goto LABEL_6;
  }
  if ([v6 type] == 1)
  {
    uint64_t v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "PHUserFeedback: Negative feedback for person should not be generated on a PHMemory. Create a feedback on PHPerson instead. negativeUserFeedbackForMemoryFeature function will return nil.", (uint8_t *)&v14, 2u);
    }

    id v10 = 0;
  }
  else
  {
    uint64_t v13 = [a1 _contextForMemoryFeature:v6];
    id v10 = -[PHUserFeedback initWithType:feature:context:]([PHUserFeedback alloc], "initWithType:feature:context:", 2, [a1 _feedbackFeatureForMemoryFeature:v6], v13);
  }
LABEL_6:

  return v10;
}

@end