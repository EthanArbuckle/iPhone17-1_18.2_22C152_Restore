@interface GEOMapDataSubscription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOMapDataSubscription)init;
- (GEOMapDataSubscription)initWithCoder:(id)a3;
- (GEOMapDataSubscription)initWithIdentifier:(id)a3 originatingBundleIdentifier:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 expirationDate:(id)a7 region:(id)a8 displayName:(id)a9;
- (GEOMapDataSubscription)initWithIdentifier:(id)a3 originatingBundleIdentifier:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 expirationDate:(id)a7 region:(id)a8 displayName:(id)a9 regulatoryRegionID:(id)a10;
- (GEOMapRegion)region;
- (NSDate)expirationDate;
- (NSNumber)regulatoryRegionID;
- (NSString)_originatingBundleIdentifier;
- (NSString)displayName;
- (NSString)identifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)debugDescription;
- (int64_t)policy;
- (unint64_t)dataTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOMapDataSubscription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOMapDataSubscription)init
{
  result = (GEOMapDataSubscription *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMapDataSubscription)initWithIdentifier:(id)a3 originatingBundleIdentifier:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 expirationDate:(id)a7 region:(id)a8 displayName:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v31.receiver = self;
  v31.super_class = (Class)GEOMapDataSubscription;
  v20 = [(GEOMapDataSubscription *)&v31 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    originatingBundleIdentifier = v20->_originatingBundleIdentifier;
    v20->_originatingBundleIdentifier = (NSString *)v23;

    v20->_dataTypes = a5;
    v20->_policy = a6;
    objc_storeStrong((id *)&v20->_expirationDate, a7);
    uint64_t v25 = [v18 copy];
    region = v20->_region;
    v20->_region = (GEOMapRegion *)v25;

    uint64_t v27 = [v19 copy];
    displayName = v20->_displayName;
    v20->_displayName = (NSString *)v27;

    v29 = v20;
  }

  return v20;
}

- (GEOMapDataSubscription)initWithIdentifier:(id)a3 originatingBundleIdentifier:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 expirationDate:(id)a7 region:(id)a8 displayName:(id)a9 regulatoryRegionID:(id)a10
{
  id v17 = a10;
  id v18 = [(GEOMapDataSubscription *)self initWithIdentifier:a3 originatingBundleIdentifier:a4 dataTypes:a5 policy:a6 expirationDate:a7 region:a8 displayName:a9];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_regulatoryRegionID, a10);
    v20 = v19;
  }

  return v19;
}

- (GEOMapDataSubscription)initWithCoder:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)GEOMapDataSubscription;
  v5 = [(GEOMapDataSubscription *)&v31 init];
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_dataTypes = [v4 decodeIntegerForKey:@"dataTypes"];
  v5->_policy = [v4 decodeIntegerForKey:@"policy"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
  region = v5->_region;
  v5->_region = (GEOMapRegion *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingBundleIdentifier"];
  originatingBundleIdentifier = v5->_originatingBundleIdentifier;
  v5->_originatingBundleIdentifier = (NSString *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v14;

  uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regulatoryRegionID"];
  regulatoryRegionID = v5->_regulatoryRegionID;
  v5->_regulatoryRegionID = (NSNumber *)v16;

  if (!v5->_identifier)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)
      || (*(_WORD *)buf = 0,
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _identifier != nil", buf, 2u), !v5->_identifier))
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F281F8];
      uint64_t v34 = *MEMORY[0x1E4F28588];
      uint64_t v21 = [NSString stringWithFormat:@"Failed to decode %@: missing value for key %@", objc_opt_class(), @"identifier"];
      v35[0] = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      uint64_t v23 = [v19 errorWithDomain:v20 code:4865 userInfo:v22];
      [v4 failWithError:v23];

LABEL_9:
      id v18 = 0;
      goto LABEL_10;
    }
  }
  if (!v5->_region)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)
      || (*(_WORD *)buf = 0,
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _region != nil", buf, 2u), !v5->_region))
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F281F8];
      uint64_t v32 = *MEMORY[0x1E4F28588];
      v26 = [NSString stringWithFormat:@"Failed to decode %@: missing value for key %@", objc_opt_class(), @"region"];
      v33 = v26;
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      v28 = [v24 errorWithDomain:v25 code:4865 userInfo:v27];
      [v4 failWithError:v28];

      goto LABEL_9;
    }
  }
  id v18 = v5;
LABEL_10:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_dataTypes forKey:@"dataTypes"];
  [v5 encodeInteger:self->_policy forKey:@"policy"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeObject:self->_region forKey:@"region"];
  [v5 encodeObject:self->_originatingBundleIdentifier forKey:@"originatingBundleIdentifier"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_regulatoryRegionID forKey:@"regulatoryRegionID"];
}

- (id)debugDescription
{
  return [(GEOMapDataSubscription *)self _descriptionWithIndent:0];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)GEOMapDataSubscription;
  id v5 = [(GEOMapDataSubscription *)&v22 debugDescription];
  uint64_t v6 = (void *)[v5 mutableCopy];

  identifier = self->_identifier;
  uint64_t v8 = @"<unknown>";
  unint64_t dataTypes = self->_dataTypes;
  int64_t policy = self->_policy;
  if (policy == 1) {
    uint64_t v8 = @"user-initiated";
  }
  if (!policy) {
    uint64_t v8 = @"opportunistic";
  }
  v11 = v8;
  uint64_t v12 = GEOMapDataSubscriptionDataTypeAsString(dataTypes);
  [v6 appendFormat:@" [%@] (%@: %@) {\n", identifier, v11, v12];

  if ([(NSString *)self->_displayName length])
  {
    v13 = [&stru_1ED51F370 stringByPaddingToLength:4 * a3 withString:@" " startingAtIndex:0];
    [v6 appendString:v13];

    [v6 appendFormat:@"displayName: %@", self->_displayName];
  }
  uint64_t v14 = [NSString stringWithFormat:@"region: %@\n", self->_region];
  id v15 = [v14 componentsSeparatedByString:@"\n"];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __49__GEOMapDataSubscription__descriptionWithIndent___block_invoke;
  v19[3] = &unk_1E53DDB88;
  id v16 = v6;
  id v20 = v16;
  unint64_t v21 = a3;
  [v15 enumerateObjectsUsingBlock:v19];

  if (self->_expirationDate)
  {
    id v17 = [&stru_1ED51F370 stringByPaddingToLength:4 * a3 withString:@" " startingAtIndex:0];
    [v16 appendString:v17];

    [v16 appendFormat:@"expiration: %@", self->_expirationDate];
  }

  return v16;
}

void __49__GEOMapDataSubscription__descriptionWithIndent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = 4 * *(void *)(a1 + 40);
  id v8 = a2;
  v9 = [&stru_1ED51F370 stringByPaddingToLength:v7 withString:@" " startingAtIndex:0];
  [v6 appendString:v9];

  [*(id *)(a1 + 32) appendFormat:@"%@\n", v8];
  *a4 = 0;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v8 = 0;
    goto LABEL_18;
  }
  id v5 = v4;
  if ([*((id *)v5 + 1) isEqualToString:self->_identifier]
    && *((void *)v5 + 3) == self->_dataTypes
    && *((void *)v5 + 4) == self->_policy)
  {
    uint64_t v6 = (NSDate *)*((void *)v5 + 5);
    expirationDate = self->_expirationDate;
    if (v6 == expirationDate) {
      goto LABEL_23;
    }
    char v8 = 0;
    if (!v6 || !expirationDate) {
      goto LABEL_17;
    }
    [(NSDate *)expirationDate timeIntervalSinceReferenceDate];
    double v10 = v9;
    [*((id *)v5 + 5) timeIntervalSinceReferenceDate];
    double v12 = v10 - v11;
    [(NSDate *)self->_expirationDate timeIntervalSinceReferenceDate];
    double v14 = v13;
    [*((id *)v5 + 5) timeIntervalSinceReferenceDate];
    double v16 = v14 - v15;
    if (v12 < 0.0) {
      double v16 = -v16;
    }
    if (v16 < 1.0)
    {
LABEL_23:
      if ([*((id *)v5 + 6) isEqual:self->_region])
      {
        id v17 = (NSString *)*((void *)v5 + 7);
        displayName = self->_displayName;
        if (v17 == displayName)
        {
          char v8 = 1;
        }
        else
        {
          char v8 = 0;
          if (v17 && displayName) {
            char v8 = -[NSString isEqualToString:](v17, "isEqualToString:");
          }
        }
        goto LABEL_17;
      }
    }
  }
  char v8 = 0;
LABEL_17:

LABEL_18:
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)_originatingBundleIdentifier
{
  return self->_originatingBundleIdentifier;
}

- (unint64_t)dataTypes
{
  return self->_dataTypes;
}

- (int64_t)policy
{
  return self->_policy;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSNumber)regulatoryRegionID
{
  return self->_regulatoryRegionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regulatoryRegionID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end