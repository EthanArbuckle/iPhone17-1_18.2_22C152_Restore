@interface RTTripSegmentMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)formOfWay;
- (NSArray)locationType;
- (NSArray)roadClass;
- (NSString)endLocationName;
- (NSString)startLocationName;
- (RTTripSegmentMetadata)initWithCoder:(id)a3;
- (RTTripSegmentMetadata)initWithRoadClass:(id)a3 formOfWay:(id)a4 locationType:(id)a5 startLocationName:(id)a6 endLocationName:(id)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTTripSegmentMetadata

- (RTTripSegmentMetadata)initWithRoadClass:(id)a3 formOfWay:(id)a4 locationType:(id)a5 startLocationName:(id)a6 endLocationName:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)RTTripSegmentMetadata;
  v17 = [(RTTripSegmentMetadata *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_roadClass, a3);
    objc_storeStrong((id *)&v18->_formOfWay, a4);
    objc_storeStrong((id *)&v18->_locationType, a5);
    objc_storeStrong((id *)&v18->_startLocationName, a6);
    objc_storeStrong((id *)&v18->_endLocationName, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  roadClass = self->_roadClass;
  id v5 = a3;
  [v5 encodeObject:roadClass forKey:@"roadClass"];
  [v5 encodeObject:self->_formOfWay forKey:@"formOfWay"];
  [v5 encodeObject:self->_locationType forKey:@"locationType"];
  [v5 encodeObject:self->_startLocationName forKey:@"startLocationName"];
  [v5 encodeObject:self->_endLocationName forKey:@"endLocationName"];
}

- (RTTripSegmentMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"roadClass"];

  objc_opt_class();
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"formOfWay"];

  objc_opt_class();
  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  id v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  id v16 = [v4 decodeObjectOfClasses:v15 forKey:@"locationType"];

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startLocationName"];
  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endLocationName"];

  v19 = [(RTTripSegmentMetadata *)self initWithRoadClass:v8 formOfWay:v12 locationType:v16 startLocationName:v17 endLocationName:v18];
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  char v25 = [v6 isMemberOfClass:objc_opt_class()];
  roadClass = self->_roadClass;
  v8 = roadClass;
  if (roadClass)
  {
LABEL_4:
    id v4 = [v6 roadClass];
    char v9 = [(NSArray *)v8 isEqualToArray:v4];

    if (roadClass) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v3 = [v6 roadClass];
  if (v3)
  {
    v8 = self->_roadClass;
    goto LABEL_4;
  }
  char v9 = 1;
LABEL_7:

LABEL_8:
  formOfWay = self->_formOfWay;
  v11 = formOfWay;
  if (formOfWay) {
    goto LABEL_11;
  }
  id v4 = [v6 formOfWay];
  if (v4)
  {
    v11 = self->_formOfWay;
LABEL_11:
    roadClass = [v6 formOfWay];
    char v12 = [(NSArray *)v11 isEqualToArray:roadClass];

    if (formOfWay) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v12 = 1;
LABEL_14:

LABEL_15:
  locationType = self->_locationType;
  uint64_t v14 = locationType;
  if (locationType) {
    goto LABEL_18;
  }
  roadClass = [v6 locationType];
  if (roadClass)
  {
    uint64_t v14 = self->_locationType;
LABEL_18:
    formOfWay = [v6 locationType];
    char v15 = [(NSArray *)v14 isEqualToArray:formOfWay];

    if (locationType) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  char v15 = 1;
LABEL_21:

LABEL_22:
  startLocationName = self->_startLocationName;
  v17 = startLocationName;
  if (startLocationName) {
    goto LABEL_25;
  }
  formOfWay = [v6 startLocationName];
  if (formOfWay)
  {
    v17 = self->_startLocationName;
LABEL_25:
    v18 = [v6 startLocationName];
    char v19 = [(NSString *)v17 isEqualToString:v18];

    if (startLocationName) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  char v19 = 1;
LABEL_28:

LABEL_29:
  endLocationName = self->_endLocationName;
  objc_super v21 = endLocationName;
  if (!endLocationName)
  {
    formOfWay = [v6 endLocationName];
    if (!formOfWay)
    {
      char v23 = 1;
LABEL_35:

      goto LABEL_36;
    }
    objc_super v21 = self->_endLocationName;
  }
  v22 = [v6 endLocationName];
  char v23 = [(NSString *)v21 isEqualToString:v22];

  if (!endLocationName) {
    goto LABEL_35;
  }
LABEL_36:

  return v25 & v9 & v12 & v15 & v19 & v23;
}

- (NSArray)roadClass
{
  return self->_roadClass;
}

- (NSArray)formOfWay
{
  return self->_formOfWay;
}

- (NSArray)locationType
{
  return self->_locationType;
}

- (NSString)startLocationName
{
  return self->_startLocationName;
}

- (NSString)endLocationName
{
  return self->_endLocationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endLocationName, 0);
  objc_storeStrong((id *)&self->_startLocationName, 0);
  objc_storeStrong((id *)&self->_locationType, 0);
  objc_storeStrong((id *)&self->_formOfWay, 0);
  objc_storeStrong((id *)&self->_roadClass, 0);
}

@end