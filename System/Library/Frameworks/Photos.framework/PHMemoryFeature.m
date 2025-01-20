@interface PHMemoryFeature
+ (BOOL)supportsSecureCoding;
+ (id)encodedBlockableFeatures:(id)a3 photoLibrary:(id)a4;
+ (id)locationMemoryFeatureWithAreaForName:(id)a3;
+ (id)locationMemoryFeatureWithLocation:(id)a3;
+ (id)memoryFeatureWithData:(id)a3 photoLibrary:(id)a4;
+ (id)peopleMemoryFeatureWithPersonLocalIdentifier:(id)a3;
+ (id)personLocalIdentifierForPersonUniversalIdentifier:(id)a3 photoLibrary:(id)a4;
+ (id)personUniversalIdentifierForPersonLocalIdentifier:(id)a3 photoLibrary:(id)a4;
+ (id)stringForType:(unint64_t)a3;
+ (id)timeMemoryFeatureWithDate:(id)a3;
+ (id)timeMemoryFeatureWithDateInterval:(id)a3;
+ (id)timeMemoryFeatureWithHolidayForName:(id)a3;
- (BOOL)collidesWithAreaWithName:(id)a3;
- (BOOL)collidesWithDate:(id)a3;
- (BOOL)collidesWithDateInterval:(id)a3;
- (BOOL)collidesWithFeature:(id)a3;
- (BOOL)collidesWithHolidayWithName:(id)a3;
- (BOOL)collidesWithLocationAtCoordinates:(CLLocationCoordinate2D)a3;
- (BOOL)collidesWithPersonWithLocalIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PHMemoryFeature)initWithCoder:(id)a3;
- (id)_personLocalIdentifierFromSubtypeSpecificAttribute;
- (id)areaName;
- (id)date;
- (id)dateInterval;
- (id)description;
- (id)encodedDataWithPhotoLibrary:(id)a3;
- (id)holidayName;
- (id)location;
- (id)personLocalIdentifier;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHMemoryFeature

- (void).cxx_destruct
{
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)collidesWithPersonWithLocalIdentifier:(id)a3
{
  if (self->_type != 1) {
    return 0;
  }
  id v4 = a3;
  v5 = [(PHMemoryFeature *)self personLocalIdentifier];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)collidesWithAreaWithName:(id)a3
{
  if (self->_type != 0x20000) {
    return 0;
  }
  id v4 = a3;
  v5 = [(PHMemoryFeature *)self areaName];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)collidesWithLocationAtCoordinates:(CLLocationCoordinate2D)a3
{
  if (self->_type != 4096) {
    return 0;
  }
  v3 = [(PHMemoryFeature *)self location];
  [v3 coordinate];

  CLLocationCoordinate2DGetDistanceFrom();
  return v4 <= 100.0;
}

- (BOOL)collidesWithHolidayWithName:(id)a3
{
  if (self->_type != 32) {
    return 0;
  }
  id v4 = a3;
  v5 = [(PHMemoryFeature *)self holidayName];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)collidesWithDateInterval:(id)a3
{
  id v4 = a3;
  unint64_t type = self->_type;
  if (type == 512)
  {
    v11 = [(PHMemoryFeature *)self dateInterval];
    char v13 = [v4 intersectsDateInterval:v11];
  }
  else
  {
    if (type != 16)
    {
      char v13 = 0;
      goto LABEL_7;
    }
    id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
    v7 = [v4 startDate];
    v8 = [v7 dateByAddingTimeInterval:-43200.0];
    v9 = [v4 endDate];
    v10 = [v9 dateByAddingTimeInterval:43200.0];
    v11 = (void *)[v6 initWithStartDate:v8 endDate:v10];

    v12 = [(PHMemoryFeature *)self date];
    char v13 = [v11 containsDate:v12];
  }
LABEL_7:

  return v13;
}

- (BOOL)collidesWithDate:(id)a3
{
  id v4 = a3;
  unint64_t type = self->_type;
  if (type == 512)
  {
    id v6 = [(PHMemoryFeature *)self dateInterval];
    char v8 = [v6 containsDate:v4];
  }
  else
  {
    if (type != 16)
    {
      char v8 = 0;
      goto LABEL_7;
    }
    id v6 = [(PHMemoryFeature *)self date];
    [v6 timeIntervalSinceDate:v4];
    char v8 = fabs(v7) <= 43200.0;
  }

LABEL_7:
  return v8;
}

- (BOOL)collidesWithFeature:(id)a3
{
  id v4 = (PHMemoryFeature *)a3;
  unint64_t type = v4->_type;
  unint64_t v6 = self->_type;
  if (v6 != type)
  {
    if (v6 != 512 && v6 != 16) {
      goto LABEL_24;
    }
    if (type != 512 && type != 16) {
      goto LABEL_24;
    }
  }
  if (![(PHMemoryFeature *)self isEqual:v4])
  {
    unint64_t v10 = self->_type;
    switch(v10)
    {
      case 0x10uLL:
        if (type == 512)
        {
          v11 = [(PHMemoryFeature *)self date];
          v15 = v4;
          goto LABEL_26;
        }
        if (type != 16) {
          goto LABEL_24;
        }
        break;
      case 0x1000uLL:
        v11 = [(PHMemoryFeature *)self location];
        char v13 = [(PHMemoryFeature *)v4 location];
        [v11 distanceFromLocation:v13];
        BOOL v9 = v14 <= 100.0;

LABEL_28:
        goto LABEL_29;
      case 0x200uLL:
        if (type != 16)
        {
          if (type == 512)
          {
            v11 = [(PHMemoryFeature *)v4 dateInterval];
            BOOL v12 = [(PHMemoryFeature *)self collidesWithDateInterval:v11];
LABEL_27:
            BOOL v9 = v12;
            goto LABEL_28;
          }
LABEL_24:
          BOOL v9 = 0;
          goto LABEL_29;
        }
        break;
      default:
        goto LABEL_24;
    }
    v11 = [(PHMemoryFeature *)v4 date];
    v15 = self;
LABEL_26:
    BOOL v12 = [(PHMemoryFeature *)v15 collidesWithDate:v11];
    goto LABEL_27;
  }
  BOOL v9 = 1;
LABEL_29:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHMemoryFeature *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t type = self->_type;
      if (type == v5->_type)
      {
        subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
        char v8 = v5->_subtypeSpecificAttribute;
        if (type == 4096)
        {
          if (subtypeSpecificAttribute != v8)
          {
            -[NSObject distanceFromLocation:](subtypeSpecificAttribute, "distanceFromLocation:");
            char v10 = v9 <= 2.22044605e-16;
LABEL_13:

            goto LABEL_14;
          }
        }
        else if (subtypeSpecificAttribute != v8)
        {
          char v10 = -[NSObject isEqual:](subtypeSpecificAttribute, "isEqual:");
          goto LABEL_13;
        }
        char v10 = 1;
        goto LABEL_13;
      }
      char v10 = 0;
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  return self->_type;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PHMemoryFeature;
  id v4 = [(PHMemoryFeature *)&v8 description];
  v5 = [(id)objc_opt_class() stringForType:self->_type];
  unint64_t v6 = [v3 stringWithFormat:@"%@: type=%@, subtypeSpecificAttribute='%@'", v4, v5, self->_subtypeSpecificAttribute];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v7 encodeObject:v4 forKey:@"type"];

  [v7 encodeObject:self->_subtypeSpecificAttribute forKey:@"attribute"];
  if (self->_type == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v7 photoLibrary];
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v6 = +[PHMemoryFeature personUniversalIdentifierForPersonLocalIdentifier:self->_subtypeSpecificAttribute photoLibrary:v5];
          [v7 encodeObject:v6 forKey:@"personUniversalIdentifier"];
        }
      }
    }
  }
}

- (PHMemoryFeature)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PHMemoryFeature;
  v5 = [(PHMemoryFeature *)&v25 init];
  if (!v5) {
    goto LABEL_27;
  }
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v5->_uint64_t type = [v6 unsignedIntegerValue];

  uint64_t type = v5->_type;
  if (type > 511)
  {
    if (type == 512 || type == 4096 || type == 0x20000) {
      goto LABEL_25;
    }
    goto LABEL_10;
  }
  if (type != 1)
  {
    if (type == 16 || type == 32)
    {
LABEL_25:
      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attribute"];
      subtypeSpecificAttribute = v5->_subtypeSpecificAttribute;
      v5->_subtypeSpecificAttribute = v20;

      goto LABEL_26;
    }
LABEL_10:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      objc_super v8 = [(id)objc_opt_class() stringForType:v5->_type];
      *(_DWORD *)buf = 134218242;
      uint64_t v27 = type;
      __int16 v28 = 2112;
      v29 = v8;
      double v9 = MEMORY[0x1E4F14500];
      char v10 = "Unsupported type %lu (%@) in PHMemoryFeature";
LABEL_30:
      _os_log_fault_impl(&dword_19B043000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0x16u);
LABEL_31:
    }
LABEL_32:
    v22 = 0;
    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personUniversalIdentifier"];
    if (v11)
    {
      BOOL v12 = [v4 photoLibrary];
      if (v12)
      {
        char v13 = +[PHMemoryFeature personLocalIdentifierForPersonUniversalIdentifier:v11 photoLibrary:v12];
        if (v13) {
          objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, v13);
        }
      }
    }
  }
  if (!v5->_subtypeSpecificAttribute)
  {
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attribute"];
    v15 = v5->_subtypeSpecificAttribute;
    v5->_subtypeSpecificAttribute = v14;
  }
  v16 = [(PHMemoryFeature *)v5 _personLocalIdentifierFromSubtypeSpecificAttribute];

  if (!v16)
  {
    objc_super v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v17 = v5->_subtypeSpecificAttribute;
      unint64_t v18 = v5->_type;
      v19 = [(id)objc_opt_class() stringForType:v18];
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = (uint64_t)v17;
      __int16 v28 = 2048;
      v29 = v18;
      __int16 v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_FAULT, "Unable to retrieve person local identifier from %@ for type %lu (%@) in PHMemoryFeature", buf, 0x20u);
    }
    goto LABEL_31;
  }
LABEL_26:
  if (!v5->_subtypeSpecificAttribute)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      unint64_t v23 = v5->_type;
      objc_super v8 = [(id)objc_opt_class() stringForType:v23];
      *(_DWORD *)buf = 134218242;
      uint64_t v27 = v23;
      __int16 v28 = 2112;
      v29 = v8;
      double v9 = MEMORY[0x1E4F14500];
      char v10 = "Unable to retrieve subtypeSpecificAttribute for type %lu (%@) in PHMemoryFeature";
      goto LABEL_30;
    }
    goto LABEL_32;
  }
LABEL_27:
  v22 = v5;
LABEL_33:

  return v22;
}

- (id)areaName
{
  if (self->_type != 0x20000)
  {
    v5 = NSString;
    unint64_t v6 = [(id)objc_opt_class() stringForType:self->_type];
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    objc_super v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    uint64_t v10 = [v5 stringWithFormat:@"areaName called on non-Area PHMemoryFeature, (got type %@, %@ of class %@)", v6, subtypeSpecificAttribute, v9];

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = NSString;
    BOOL v12 = self->_subtypeSpecificAttribute;
    char v13 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v13);
    uint64_t v10 = [v11 stringWithFormat:@"Invalid class for Area PHMemoryFeature's _subtypeSpecificAttribute, expected CLLocation, (got %@ of class %@)", v12, v6];
LABEL_8:

    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v10 userInfo:0];
    objc_exception_throw(v14);
  }
  v3 = self->_subtypeSpecificAttribute;

  return v3;
}

- (id)location
{
  if (self->_type != 4096)
  {
    v5 = NSString;
    unint64_t v6 = [(id)objc_opt_class() stringForType:self->_type];
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    objc_super v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    uint64_t v10 = [v5 stringWithFormat:@"location called on non-Address PHMemoryFeature, (got type %@, %@ of class %@)", v6, subtypeSpecificAttribute, v9];

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = NSString;
    BOOL v12 = self->_subtypeSpecificAttribute;
    char v13 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v13);
    uint64_t v10 = [v11 stringWithFormat:@"Invalid class for Address PHMemoryFeature's _subtypeSpecificAttribute, expected CLLocation, (got %@ of class %@)", v12, v6];
LABEL_8:

    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v10 userInfo:0];
    objc_exception_throw(v14);
  }
  v3 = self->_subtypeSpecificAttribute;

  return v3;
}

- (id)holidayName
{
  if (self->_type != 32)
  {
    v5 = NSString;
    unint64_t v6 = [(id)objc_opt_class() stringForType:self->_type];
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    objc_super v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    uint64_t v10 = [v5 stringWithFormat:@"holidayName called on non-Holiday PHMemoryFeature, (got type %@, %@ of class %@)", v6, subtypeSpecificAttribute, v9];

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = NSString;
    BOOL v12 = self->_subtypeSpecificAttribute;
    char v13 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v13);
    uint64_t v10 = [v11 stringWithFormat:@"Invalid class for Holiday PHMemoryFeature's _subtypeSpecificAttribute, expected NSDate, (got %@ of class %@)", v12, v6];
LABEL_8:

    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v10 userInfo:0];
    objc_exception_throw(v14);
  }
  v3 = self->_subtypeSpecificAttribute;

  return v3;
}

- (id)dateInterval
{
  if (self->_type != 512)
  {
    v5 = NSString;
    unint64_t v6 = [(id)objc_opt_class() stringForType:self->_type];
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    objc_super v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    uint64_t v10 = [v5 stringWithFormat:@"dateInterval called on non-DateInterval PHMemoryFeature, (got type %@, %@ of class %@)", v6, subtypeSpecificAttribute, v9];

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = NSString;
    BOOL v12 = self->_subtypeSpecificAttribute;
    char v13 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v13);
    uint64_t v10 = [v11 stringWithFormat:@"Invalid class for DateInterval PHMemoryFeature's _subtypeSpecificAttribute, expected NSDateInterval, (got %@ of class %@)", v12, v6];
LABEL_8:

    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v10 userInfo:0];
    objc_exception_throw(v14);
  }
  v3 = self->_subtypeSpecificAttribute;

  return v3;
}

- (id)date
{
  if (self->_type != 16)
  {
    v5 = NSString;
    unint64_t v6 = [(id)objc_opt_class() stringForType:self->_type];
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    objc_super v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    uint64_t v10 = [v5 stringWithFormat:@"Date called on non-Date PHMemoryFeature, (got type %@, %@ of class %@)", v6, subtypeSpecificAttribute, v9];

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = NSString;
    BOOL v12 = self->_subtypeSpecificAttribute;
    char v13 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v13);
    uint64_t v10 = [v11 stringWithFormat:@"Invalid class for Date PHMemoryFeature's _subtypeSpecificAttribute, expected NSDate, (got %@ of class %@)", v12, v6];
LABEL_8:

    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v10 userInfo:0];
    objc_exception_throw(v14);
  }
  v3 = self->_subtypeSpecificAttribute;

  return v3;
}

- (id)_personLocalIdentifierFromSubtypeSpecificAttribute
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = self->_subtypeSpecificAttribute;
  v3 = +[PHObject uuidFromLocalIdentifier:v2];
  if (v3 || (PLUUIDFromLocalMercuryLocalIdentifier(), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = PLConvertMercuryUUIDString();

    if (v4)
    {
      v5 = +[PHObject localIdentifierWithUUID:v4];

      unint64_t v6 = v5;
      goto LABEL_11;
    }
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138543362;
      v11 = v2;
      objc_super v8 = "UUID conversion for person local identifier %{public}@ returned nil.";
LABEL_9:
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138543362;
      v11 = v2;
      objc_super v8 = "Unknown UUID embedded in the person local identifier %{public}@ for memory feature.";
      goto LABEL_9;
    }
  }

  unint64_t v6 = v2;
LABEL_11:

  return v6;
}

- (id)personLocalIdentifier
{
  if (self->_type != 1)
  {
    id v4 = NSString;
    v5 = [(id)objc_opt_class() stringForType:self->_type];
    unint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = [v4 stringWithFormat:@"-[PHMemoryFeature personLocalIdentifier] called on non-Person PHMemoryFeature, (got: %@, %@)", v5, v7];

    double v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    uint64_t v11 = v8;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = NSString;
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    id v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    uint64_t v16 = [v12 stringWithFormat:@"Invalid class for Person PHMemoryFeature's _subtypeSpecificAttribute, expected NSString, (got: %@, %@)", subtypeSpecificAttribute, v15];

    double v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    uint64_t v11 = v16;
LABEL_8:
    id v17 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    objc_exception_throw(v17);
  }

  return [(PHMemoryFeature *)self _personLocalIdentifierFromSubtypeSpecificAttribute];
}

- (id)encodedDataWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [(NSKeyedArchiver *)[PHMemoryFeatureEncoder alloc] initRequiringSecureCoding:1];
  [v5 setPhotoLibrary:v4];

  [v5 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  unint64_t v6 = [v5 encodedData];

  return v6;
}

+ (id)personUniversalIdentifierForPersonLocalIdentifier:(id)a3 photoLibrary:(id)a4
{
  return +[PHObject uuidFromLocalIdentifier:](PHPerson, "uuidFromLocalIdentifier:", a3, a4);
}

+ (id)personLocalIdentifierForPersonUniversalIdentifier:(id)a3 photoLibrary:(id)a4
{
  return +[PHObject localIdentifierWithUUID:](PHPerson, "localIdentifierWithUUID:", a3, a4);
}

+ (id)stringForType:(unint64_t)a3
{
  if (!a3)
  {
    id v4 = @"None";
    goto LABEL_119;
  }
  int v3 = a3;
  if (a3 == -1)
  {
    id v4 = @"Any";
    goto LABEL_119;
  }
  if ((~a3 & 3) == 0)
  {
    id v4 = @"People";
LABEL_7:
    if ((~v3 & 0x3F0) == 0)
    {
      if (v4)
      {
        id v5 = @"+Time";
LABEL_62:
        uint64_t v11 = [(__CFString *)v4 stringByAppendingString:v5];

        id v4 = (__CFString *)v11;
        goto LABEL_63;
      }
      goto LABEL_13;
    }
    if ((v3 & 0x10) == 0)
    {
LABEL_17:
      if ((v3 & 0x200) == 0)
      {
LABEL_46:
        if ((v3 & 0x20) == 0) {
          goto LABEL_49;
        }
        if (v4)
        {
          uint64_t v8 = [(__CFString *)v4 stringByAppendingString:@"+Holiday"];

          id v4 = (__CFString *)v8;
LABEL_49:
          if ((v3 & 0x40) == 0)
          {
LABEL_54:
            if ((v3 & 0x80) == 0) {
              goto LABEL_57;
            }
            if (v4)
            {
              uint64_t v10 = [(__CFString *)v4 stringByAppendingString:@"+Season"];

              id v4 = (__CFString *)v10;
LABEL_57:
              if ((v3 & 0x100) == 0) {
                goto LABEL_63;
              }
              if (!v4)
              {
LABEL_59:
                id v4 = @"Weekend";
                goto LABEL_63;
              }
LABEL_61:
              id v5 = @"+Weekend";
              goto LABEL_62;
            }
LABEL_60:
            id v4 = @"Season";
            if ((v3 & 0x100) == 0) {
              goto LABEL_63;
            }
            goto LABEL_61;
          }
          if (!v4)
          {
LABEL_51:
            id v4 = @"Year";
            goto LABEL_54;
          }
LABEL_53:
          uint64_t v9 = [(__CFString *)v4 stringByAppendingString:@"+Year"];

          id v4 = (__CFString *)v9;
          goto LABEL_54;
        }
LABEL_52:
        id v4 = @"Holiday";
        if ((v3 & 0x40) == 0) {
          goto LABEL_54;
        }
        goto LABEL_53;
      }
      if (!v4)
      {
LABEL_19:
        id v4 = @"DateInterval";
        goto LABEL_46;
      }
LABEL_45:
      uint64_t v7 = [(__CFString *)v4 stringByAppendingString:@"+DateInterval"];

      id v4 = (__CFString *)v7;
      goto LABEL_46;
    }
    if (v4)
    {
      uint64_t v6 = [(__CFString *)v4 stringByAppendingString:@"+Date"];

      id v4 = (__CFString *)v6;
      goto LABEL_17;
    }
LABEL_44:
    id v4 = @"Date";
    if ((v3 & 0x200) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (a3)
  {
    if ((a3 & 2) != 0)
    {
      id v4 = [@"Person" stringByAppendingString:@"+SocialGroup"];
    }
    else
    {
      id v4 = @"Person";
    }
    goto LABEL_7;
  }
  if ((a3 & 2) != 0)
  {
    id v4 = @"SocialGroup";
    goto LABEL_7;
  }
  if ((~a3 & 0x3F0) == 0)
  {
LABEL_13:
    id v4 = @"Time";
LABEL_63:
    if ((~v3 & 0x7F000) == 0)
    {
      if (v4)
      {
        uint64_t v12 = @"+Location";
LABEL_94:
        uint64_t v19 = [(__CFString *)v4 stringByAppendingString:v12];

        id v4 = (__CFString *)v19;
        goto LABEL_95;
      }
      goto LABEL_72;
    }
    if ((v3 & 0x1000) == 0)
    {
LABEL_69:
      if ((v3 & 0x2000) == 0)
      {
LABEL_75:
        if ((v3 & 0x4000) == 0) {
          goto LABEL_78;
        }
        if (v4)
        {
          uint64_t v15 = [(__CFString *)v4 stringByAppendingString:@"+County"];

          id v4 = (__CFString *)v15;
LABEL_78:
          if ((v3 & 0x8000) == 0)
          {
LABEL_83:
            if ((v3 & 0x10000) == 0) {
              goto LABEL_86;
            }
            if (v4)
            {
              uint64_t v17 = [(__CFString *)v4 stringByAppendingString:@"+Country"];

              id v4 = (__CFString *)v17;
LABEL_86:
              if ((v3 & 0x40000) == 0)
              {
LABEL_91:
                if ((v3 & 0x20000) == 0) {
                  goto LABEL_95;
                }
                if (v4)
                {
                  uint64_t v12 = @"+Area";
                  goto LABEL_94;
                }
LABEL_105:
                id v4 = @"Area";
                goto LABEL_95;
              }
              if (!v4)
              {
LABEL_88:
                id v4 = @"HomeWork";
                goto LABEL_91;
              }
LABEL_90:
              uint64_t v18 = [(__CFString *)v4 stringByAppendingString:@"+HomeWork"];

              id v4 = (__CFString *)v18;
              goto LABEL_91;
            }
LABEL_89:
            id v4 = @"Country";
            if ((v3 & 0x40000) == 0) {
              goto LABEL_91;
            }
            goto LABEL_90;
          }
          if (!v4)
          {
LABEL_80:
            id v4 = @"State";
            goto LABEL_83;
          }
LABEL_82:
          uint64_t v16 = [(__CFString *)v4 stringByAppendingString:@"+State"];

          id v4 = (__CFString *)v16;
          goto LABEL_83;
        }
LABEL_81:
        id v4 = @"County";
        if ((v3 & 0x8000) == 0) {
          goto LABEL_83;
        }
        goto LABEL_82;
      }
      if (!v4)
      {
LABEL_71:
        id v4 = @"City";
        goto LABEL_75;
      }
LABEL_74:
      uint64_t v14 = [(__CFString *)v4 stringByAppendingString:@"+City"];

      id v4 = (__CFString *)v14;
      goto LABEL_75;
    }
    if (v4)
    {
      uint64_t v13 = [(__CFString *)v4 stringByAppendingString:@"+Address"];

      id v4 = (__CFString *)v13;
      goto LABEL_69;
    }
LABEL_73:
    id v4 = @"Address";
    if ((v3 & 0x2000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
  if ((a3 & 0x10) != 0) {
    goto LABEL_44;
  }
  if ((a3 & 0x200) != 0) {
    goto LABEL_19;
  }
  if ((a3 & 0x20) != 0) {
    goto LABEL_52;
  }
  if ((a3 & 0x40) != 0) {
    goto LABEL_51;
  }
  if ((a3 & 0x80) != 0) {
    goto LABEL_60;
  }
  if ((a3 & 0x100) != 0) {
    goto LABEL_59;
  }
  if ((~a3 & 0x7F000) == 0)
  {
LABEL_72:
    id v4 = @"Location";
LABEL_95:
    if ((~v3 & 0x3000000) == 0)
    {
      if (v4)
      {
        uint64_t v20 = @"+Place";
LABEL_108:
        uint64_t v22 = [(__CFString *)v4 stringByAppendingString:v20];

        id v4 = (__CFString *)v22;
        goto LABEL_109;
      }
      goto LABEL_104;
    }
    if ((v3 & 0x1000000) == 0)
    {
LABEL_101:
      if ((v3 & 0x2000000) == 0)
      {
LABEL_109:
        if ((v3 & 0x10000000) == 0)
        {
LABEL_112:
          if ((v3 & 0x40000000) == 0) {
            goto LABEL_117;
          }
          if (!v4) {
            goto LABEL_114;
          }
LABEL_116:
          uint64_t v24 = [(__CFString *)v4 stringByAppendingString:@"+Meaning"];

          id v4 = (__CFString *)v24;
LABEL_117:
          if (v4) {
            goto LABEL_119;
          }
          goto LABEL_118;
        }
        if (v4)
        {
          uint64_t v23 = [(__CFString *)v4 stringByAppendingString:@"+Scene"];

          id v4 = (__CFString *)v23;
          goto LABEL_112;
        }
LABEL_115:
        id v4 = @"Scene";
        if ((v3 & 0x40000000) == 0) {
          goto LABEL_119;
        }
        goto LABEL_116;
      }
      if (!v4)
      {
LABEL_103:
        id v4 = @"ROI";
        goto LABEL_109;
      }
LABEL_107:
      uint64_t v20 = @"+ROI";
      goto LABEL_108;
    }
    if (v4)
    {
      uint64_t v21 = [(__CFString *)v4 stringByAppendingString:@"+POI"];

      id v4 = (__CFString *)v21;
      goto LABEL_101;
    }
LABEL_106:
    id v4 = @"POI";
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_107;
  }
  if ((a3 & 0x1000) != 0) {
    goto LABEL_73;
  }
  if ((a3 & 0x2000) != 0) {
    goto LABEL_71;
  }
  if ((a3 & 0x4000) != 0) {
    goto LABEL_81;
  }
  if ((a3 & 0x8000) != 0) {
    goto LABEL_80;
  }
  if ((a3 & 0x10000) != 0) {
    goto LABEL_89;
  }
  if ((a3 & 0x40000) != 0) {
    goto LABEL_88;
  }
  if ((a3 & 0x20000) != 0) {
    goto LABEL_105;
  }
  if ((~a3 & 0x3000000) == 0)
  {
LABEL_104:
    id v4 = @"Place";
    goto LABEL_109;
  }
  if ((a3 & 0x1000000) != 0) {
    goto LABEL_106;
  }
  if ((a3 & 0x2000000) != 0) {
    goto LABEL_103;
  }
  if ((a3 & 0x10000000) != 0) {
    goto LABEL_115;
  }
  if ((a3 & 0x40000000) != 0)
  {
LABEL_114:
    id v4 = @"Meaning";
    goto LABEL_119;
  }
LABEL_118:
  id v4 = @"Unknown";
LABEL_119:

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)encodedBlockableFeatures:(id)a3 photoLibrary:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "encodedDataWithPhotoLibrary:", v6, (void)v15);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)memoryFeatureWithData:(id)a3 photoLibrary:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v11 = 0;
  uint64_t v7 = (void *)[[PHMemoryFeatureDecoder alloc] initForReadingFromData:v6 error:&v11];

  id v8 = v11;
  if (v7)
  {
    [v7 setPhotoLibrary:v5];
    uint64_t v9 = [v7 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't unarchive memory feature: error %@", buf, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)locationMemoryFeatureWithAreaForName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc_init(PHMemoryFeature);
    v5->_uint64_t type = 0x20000;
    objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, a3);
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature locationMemoryFeatureWithAreaForName:] Failed to generate feature with invalid areaName %{public}@.", (uint8_t *)&v8, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

+ (id)locationMemoryFeatureWithLocation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 coordinate], CLLocationCoordinate2DIsValid(v13)))
  {
    id v6 = objc_alloc_init(PHMemoryFeature);
    v6->_uint64_t type = 4096;
    objc_storeStrong((id *)&v6->_subtypeSpecificAttribute, a3);
  }
  else
  {
    uint64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature locationMemoryFeatureWithLocation:] Failed to generate feature with invalid location %{public}@.", (uint8_t *)&v9, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

+ (id)timeMemoryFeatureWithHolidayForName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc_init(PHMemoryFeature);
    v5->_uint64_t type = 32;
    objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, a3);
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature timeMemoryFeatureWithHolidayForName:] Failed to generate feature with invalid holidayName %{public}@.", (uint8_t *)&v8, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

+ (id)timeMemoryFeatureWithDateInterval:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(PHMemoryFeature);
    v5->_uint64_t type = 512;
    objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, a3);
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature timeMemoryFeatureWithDateInterval:] Failed to generate feature with nil dateInterval.", v8, 2u);
    }

    id v5 = 0;
  }

  return v5;
}

+ (id)timeMemoryFeatureWithDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(PHMemoryFeature);
    v5->_uint64_t type = 16;
    objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, a3);
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature timeMemoryFeatureWithDate:] Failed to generate feature with nil date.", v8, 2u);
    }

    id v5 = 0;
  }

  return v5;
}

+ (id)peopleMemoryFeatureWithPersonLocalIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc_init(PHMemoryFeature);
    v5->_uint64_t type = 1;
    objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, a3);
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature peopleMemoryFeatureWithPersonLocalIdentifier:] Failed to generate feature with invalid personLocalIdentifier %{public}@.", (uint8_t *)&v8, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

@end