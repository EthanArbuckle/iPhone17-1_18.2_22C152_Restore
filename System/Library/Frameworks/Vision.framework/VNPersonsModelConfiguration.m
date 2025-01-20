@interface VNPersonsModelConfiguration
+ (BOOL)supportsSecureCoding;
+ (unint64_t)maximumAllowableFaceprintsPerIdentity;
+ (unint64_t)maximumAllowableIdentities;
- (BOOL)isEqual:(id)a3;
- (VNPersonsModelAlgorithm)algorithm;
- (VNPersonsModelConfiguration)init;
- (VNPersonsModelConfiguration)initWithCoder:(id)a3;
- (id)algorithmOfClass:(Class)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resolvedAlgorithmAndReturnError:(id *)a3;
- (int)faceID2ModelMaximumElementsPerID;
- (int)faceID3IndexMode;
- (int)faceID3ModelMaximumElementsPerID;
- (int)faceID3ModelMaximumIDs;
- (int)faceID3ModelSeed;
- (unint64_t)faceprintRequestRevision;
- (unint64_t)maximumIdentities;
- (unint64_t)maximumTrainingFaceprintsPerIdentity;
- (void)encodeWithCoder:(id)a3;
- (void)setAlgorithm:(id)a3;
- (void)setFaceprintRequestRevision:(unint64_t)a3;
- (void)setMaximumIdentities:(unint64_t)a3;
- (void)setMaximumTrainingFaceprintsPerIdentity:(unint64_t)a3;
@end

@implementation VNPersonsModelConfiguration

- (int)faceID2ModelMaximumElementsPerID
{
  unint64_t v2 = [(VNPersonsModelConfiguration *)self maximumTrainingFaceprintsPerIdentity];
  if (v2 >= 0x7FFFFFFF) {
    LODWORD(v2) = 0x7FFFFFFF;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitlySetMaximumTrainingFaceprintsPerIdentity, 0);
  objc_storeStrong((id *)&self->_explicitlySetMaximumIdentities, 0);

  objc_storeStrong((id *)&self->_algorithm, 0);
}

- (void)setFaceprintRequestRevision:(unint64_t)a3
{
  self->_faceprintRequestRevision = a3;
}

- (unint64_t)faceprintRequestRevision
{
  return self->_faceprintRequestRevision;
}

- (void)setAlgorithm:(id)a3
{
}

- (VNPersonsModelAlgorithm)algorithm
{
  return self->_algorithm;
}

- (VNPersonsModelConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VNPersonsModelConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"algorithm"];
    algorithm = v5->_algorithm;
    v5->_algorithm = (VNPersonsModelAlgorithm *)v6;

    v5->_faceprintRequestRevision = [v4 decodeIntegerForKey:@"faceprintRequestRevision"];
    if ([v4 containsValueForKey:@"maxIdentities"])
    {
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "decodeIntegerForKey:", @"maxIdentities"));
      explicitlySetMaximumIdentities = v5->_explicitlySetMaximumIdentities;
      v5->_explicitlySetMaximumIdentities = (NSNumber *)v8;
    }
    if ([v4 containsValueForKey:@"faceprintsPerIdentity"])
    {
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "decodeIntegerForKey:", @"faceprintsPerIdentity"));
      explicitlySetMaximumTrainingFaceprintsPerIdentity = v5->_explicitlySetMaximumTrainingFaceprintsPerIdentity;
      v5->_explicitlySetMaximumTrainingFaceprintsPerIdentity = (NSNumber *)v10;
    }
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_algorithm forKey:@"algorithm"];
  [v6 encodeInteger:self->_faceprintRequestRevision forKey:@"faceprintRequestRevision"];
  explicitlySetMaximumIdentities = self->_explicitlySetMaximumIdentities;
  if (explicitlySetMaximumIdentities) {
    objc_msgSend(v6, "encodeInteger:forKey:", -[NSNumber integerValue](explicitlySetMaximumIdentities, "integerValue"), @"maxIdentities");
  }
  explicitlySetMaximumTrainingFaceprintsPerIdentity = self->_explicitlySetMaximumTrainingFaceprintsPerIdentity;
  if (explicitlySetMaximumTrainingFaceprintsPerIdentity) {
    objc_msgSend(v6, "encodeInteger:forKey:", -[NSNumber integerValue](explicitlySetMaximumTrainingFaceprintsPerIdentity, "integerValue"), @"faceprintsPerIdentity");
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)VNPersonsModelConfiguration;
  id v4 = [(VNPersonsModelConfiguration *)&v9 description];
  [v3 appendString:v4];

  v5 = [(VNPersonsModelConfiguration *)self resolvedAlgorithmAndReturnError:0];
  [v3 appendFormat:@"\n                              algorithm = %@", v5];

  objc_msgSend(v3, "appendFormat:", @"\n                      maximumIdentities = %lu", -[VNPersonsModelConfiguration maximumIdentities](self, "maximumIdentities"));
  objc_msgSend(v3, "appendFormat:", @"\n   maximumTrainingFaceprintsPerIdentity = %lu", -[VNPersonsModelConfiguration maximumTrainingFaceprintsPerIdentity](self, "maximumTrainingFaceprintsPerIdentity"));
  id v6 = (objc_class *)objc_opt_class();
  v7 = VNRequestRevisionString(v6, [(VNPersonsModelConfiguration *)self faceprintRequestRevision]);
  [v3 appendFormat:@"\n               faceprintRequestRevision = %@", v7];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNPersonsModelConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(VNPersonsModelConfiguration *)self algorithm];
      v7 = [(VNPersonsModelConfiguration *)v5 algorithm];
      char v8 = VisionCoreEqualOrNilObjects();

      if ((v8 & 1) != 0
        && (unint64_t v9 = [(VNPersonsModelConfiguration *)self maximumIdentities],
            v9 == [(VNPersonsModelConfiguration *)v5 maximumIdentities])
        && (unint64_t v10 = [(VNPersonsModelConfiguration *)self maximumTrainingFaceprintsPerIdentity], v10 == [(VNPersonsModelConfiguration *)v5 maximumTrainingFaceprintsPerIdentity]))
      {
        unint64_t v11 = [(VNPersonsModelConfiguration *)self faceprintRequestRevision];
        BOOL v12 = v11 == [(VNPersonsModelConfiguration *)v5 faceprintRequestRevision];
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
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(VNPersonsModelAlgorithm *)self->_algorithm copy];
    id v6 = (void *)v4[1];
    v4[1] = v5;

    v4[2] = self->_faceprintRequestRevision;
    uint64_t v7 = [(NSNumber *)self->_explicitlySetMaximumIdentities copy];
    char v8 = (void *)v4[3];
    v4[3] = v7;

    uint64_t v9 = [(NSNumber *)self->_explicitlySetMaximumTrainingFaceprintsPerIdentity copy];
    unint64_t v10 = (void *)v4[4];
    v4[4] = v9;
  }
  return v4;
}

- (id)algorithmOfClass:(Class)a3 error:(id *)a4
{
  id v4 = a4;
  id v6 = [(VNPersonsModelConfiguration *)self resolvedAlgorithmAndReturnError:a4];
  if (!v6) {
    goto LABEL_6;
  }
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
    goto LABEL_7;
  }
  if (v4)
  {
    id v7 = [NSString alloc];
    char v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    unint64_t v10 = NSStringFromClass(a3);
    unint64_t v11 = (void *)[v7 initWithFormat:@"configuration %@ cannot provide a %@", v9, v10];

    *id v4 = +[VNError errorForInvalidOperationWithLocalizedDescription:v11];

LABEL_6:
    id v4 = 0;
  }
LABEL_7:

  return v4;
}

- (id)resolvedAlgorithmAndReturnError:(id *)a3
{
  id v3 = [(VNPersonsModelConfiguration *)self algorithm];
  if (!v3) {
    id v3 = objc_alloc_init(VNPersonsModelAlgorithmVIPv2);
  }

  return v3;
}

- (void)setMaximumTrainingFaceprintsPerIdentity:(unint64_t)a3
{
  self->_explicitlySetMaximumTrainingFaceprintsPerIdentity = [NSNumber numberWithUnsignedInteger:a3];

  MEMORY[0x1F41817F8]();
}

- (unint64_t)maximumTrainingFaceprintsPerIdentity
{
  explicitlySetMaximumTrainingFaceprintsPerIdentity = self->_explicitlySetMaximumTrainingFaceprintsPerIdentity;
  if (explicitlySetMaximumTrainingFaceprintsPerIdentity) {
    return [(NSNumber *)explicitlySetMaximumTrainingFaceprintsPerIdentity unsignedIntegerValue];
  }
  else {
    return 20;
  }
}

- (void)setMaximumIdentities:(unint64_t)a3
{
  self->_explicitlySetMaximumIdentities = [NSNumber numberWithUnsignedInteger:a3];

  MEMORY[0x1F41817F8]();
}

- (unint64_t)maximumIdentities
{
  explicitlySetMaximumIdentities = self->_explicitlySetMaximumIdentities;
  if (explicitlySetMaximumIdentities) {
    return [(NSNumber *)explicitlySetMaximumIdentities unsignedIntegerValue];
  }
  else {
    return 10000;
  }
}

- (VNPersonsModelConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)VNPersonsModelConfiguration;
  result = [(VNPersonsModelConfiguration *)&v3 init];
  if (result) {
    result->_faceprintRequestRevision = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)maximumAllowableFaceprintsPerIdentity
{
  return 10000;
}

+ (unint64_t)maximumAllowableIdentities
{
  return 0x3FFFFFFFLL;
}

- (int)faceID3IndexMode
{
  unint64_t v2 = [(VNPersonsModelConfiguration *)self algorithmOfClass:objc_opt_class() error:0];
  objc_super v3 = v2;
  if (v2) {
    BOOL v4 = [v2 indexType] == 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (int)faceID3ModelSeed
{
  return 1;
}

- (int)faceID3ModelMaximumElementsPerID
{
  unint64_t v2 = [(VNPersonsModelConfiguration *)self maximumTrainingFaceprintsPerIdentity];
  if (v2 >= 0x7FFFFFFF) {
    LODWORD(v2) = 0x7FFFFFFF;
  }
  return v2;
}

- (int)faceID3ModelMaximumIDs
{
  unint64_t v2 = [(VNPersonsModelConfiguration *)self maximumIdentities];
  if (v2 >= 0x7FFFFFFF) {
    LODWORD(v2) = 0x7FFFFFFF;
  }
  return v2;
}

@end