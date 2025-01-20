@interface VNEntityIdentificationModelConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)newConfigurationForEntityPrintsGeneratedByRequest:(id)a3 error:(id *)a4;
+ (unint64_t)maximumAllowableEntities;
+ (unint64_t)maximumAllowableFaceprintsPerIdentity;
- (BOOL)isEqual:(id)a3;
- (NSArray)acceptableEntityPrintOriginatingRequestSpecifiers;
- (VNEntityIdentificationModelAlgorithm)algorithm;
- (VNEntityIdentificationModelConfiguration)initWithCoder:(id)a3;
- (VNEntityIdentificationModelConfiguration)initWithEntityPrintOriginatingRequestSpecifier:(id)a3;
- (VNRequestSpecifier)entityPrintOriginatingRequestSpecifier;
- (id)algorithmOfClass:(Class)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resolvedAlgorithmAndReturnError:(id *)a3;
- (int)faceID3IndexMode;
- (int)faceID3ModelMaximumElementsPerID;
- (int)faceID3ModelMaximumIDs;
- (int)faceID3ModelSeed;
- (int)faceIDModelMaximumElementsPerID;
- (unint64_t)hash;
- (unint64_t)maximumEntities;
- (unint64_t)maximumTrainingPrintsPerEntity;
- (void)encodeWithCoder:(id)a3;
- (void)setAlgorithm:(id)a3;
- (void)setMaximumEntities:(unint64_t)a3;
- (void)setMaximumTrainingPrintsPerEntity:(unint64_t)a3;
@end

@implementation VNEntityIdentificationModelConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithm, 0);

  objc_storeStrong((id *)&self->_entityPrintOriginatingRequestSpecifier, 0);
}

- (void)setAlgorithm:(id)a3
{
}

- (VNEntityIdentificationModelAlgorithm)algorithm
{
  return self->_algorithm;
}

- (VNRequestSpecifier)entityPrintOriginatingRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 24, 1);
}

- (VNEntityIdentificationModelConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VNEntityIdentificationModelConfiguration *)self init];
  if (v5)
  {
    v5->_maximumEntities = [v4 decodeIntegerForKey:@"maximumEntities"];
    v5->_maximumTrainingPrintsPerEntity = [v4 decodeIntegerForKey:@"printsPerEntity"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"printOriginatingRequest"];
    entityPrintOriginatingRequestSpecifier = v5->_entityPrintOriginatingRequestSpecifier;
    v5->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"algorithm"];
    algorithm = v5->_algorithm;
    v5->_algorithm = (VNEntityIdentificationModelAlgorithm *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t maximumEntities = self->_maximumEntities;
  id v5 = a3;
  [v5 encodeInteger:maximumEntities forKey:@"maximumEntities"];
  [v5 encodeInteger:self->_maximumTrainingPrintsPerEntity forKey:@"printsPerEntity"];
  [v5 encodeObject:self->_entityPrintOriginatingRequestSpecifier forKey:@"printOriginatingRequest"];
  [v5 encodeObject:self->_algorithm forKey:@"algorithm"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)VNEntityIdentificationModelConfiguration;
  id v4 = [(VNEntityIdentificationModelConfiguration *)&v7 description];
  [v3 appendString:v4];

  id v5 = [(VNEntityIdentificationModelConfiguration *)self resolvedAlgorithmAndReturnError:0];
  [v3 appendFormat:@"\n                        algorithm = %@", v5];

  objc_msgSend(v3, "appendFormat:", @"\n                  unint64_t maximumEntities = %lu", -[VNEntityIdentificationModelConfiguration maximumEntities](self, "maximumEntities"));
  objc_msgSend(v3, "appendFormat:", @"\n   maximumTrainingPrintsPerEntity = %lu", -[VNEntityIdentificationModelConfiguration maximumTrainingPrintsPerEntity](self, "maximumTrainingPrintsPerEntity"));
  [v3 appendFormat:@"\n    entityPrintOriginatingRequest = %@", self->_entityPrintOriginatingRequestSpecifier];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNEntityIdentificationModelConfiguration *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(VNEntityIdentificationModelConfiguration *)self algorithm];
      objc_super v7 = [(VNEntityIdentificationModelConfiguration *)v5 algorithm];
      int v8 = VisionCoreEqualOrNilObjects();

      if (v8
        && (unint64_t v9 = [(VNEntityIdentificationModelConfiguration *)self maximumEntities],
            v9 == [(VNEntityIdentificationModelConfiguration *)v5 maximumEntities])
        && (unint64_t v10 = [(VNEntityIdentificationModelConfiguration *)self maximumTrainingPrintsPerEntity], v10 == [(VNEntityIdentificationModelConfiguration *)v5 maximumTrainingPrintsPerEntity]))
      {
        v11 = [(VNEntityIdentificationModelConfiguration *)self entityPrintOriginatingRequestSpecifier];
        v12 = [(VNEntityIdentificationModelConfiguration *)v5 entityPrintOriginatingRequestSpecifier];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  id v3 = [(VNEntityIdentificationModelConfiguration *)self entityPrintOriginatingRequestSpecifier];
  uint64_t v4 = [v3 hash];

  unint64_t v5 = [(VNEntityIdentificationModelConfiguration *)self maximumTrainingPrintsPerEntity] ^ __ROR8__([(VNEntityIdentificationModelConfiguration *)self maximumEntities] ^ __ROR8__(v4, 51), 51);
  uint64_t v6 = [(VNEntityIdentificationModelConfiguration *)self algorithm];
  unint64_t v7 = [v6 hash] ^ __ROR8__(v5, 51);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = (void *)v4;
  if (v4)
  {
    *(void *)(v4 + 8) = self->_maximumEntities;
    *(void *)(v4 + 16) = self->_maximumTrainingPrintsPerEntity;
    uint64_t v6 = [(VNRequestSpecifier *)self->_entityPrintOriginatingRequestSpecifier copy];
    unint64_t v7 = (void *)v5[3];
    v5[3] = v6;

    uint64_t v8 = [(VNEntityIdentificationModelAlgorithm *)self->_algorithm copy];
    unint64_t v9 = (void *)v5[4];
    v5[4] = v8;
  }
  return v5;
}

- (void)setMaximumTrainingPrintsPerEntity:(unint64_t)a3
{
  unint64_t v5 = [(id)objc_opt_class() maximumAllowableFaceprintsPerIdentity];
  unint64_t v6 = 20;
  if (a3) {
    unint64_t v6 = a3;
  }
  if (v6 >= v5) {
    unint64_t v6 = v5;
  }
  self->_maximumTrainingPrintsPerEntity = v6;
}

- (unint64_t)maximumTrainingPrintsPerEntity
{
  return self->_maximumTrainingPrintsPerEntity;
}

- (void)setMaximumEntities:(unint64_t)a3
{
  unint64_t v5 = [(id)objc_opt_class() maximumAllowableEntities];
  if (a3 - 1 >= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = a3;
  }
  self->_unint64_t maximumEntities = v6;
}

- (unint64_t)maximumEntities
{
  return self->_maximumEntities;
}

- (NSArray)acceptableEntityPrintOriginatingRequestSpecifiers
{
  v2 = [(VNEntityIdentificationModelConfiguration *)self entityPrintOriginatingRequestSpecifier];
  id v3 = [v2 allModelEquivalents];

  return (NSArray *)v3;
}

- (id)algorithmOfClass:(Class)a3 error:(id *)a4
{
  uint64_t v4 = a4;
  unint64_t v6 = [(VNEntityIdentificationModelConfiguration *)self resolvedAlgorithmAndReturnError:a4];
  if (!v6) {
    goto LABEL_6;
  }
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = v6;
    goto LABEL_7;
  }
  if (v4)
  {
    id v7 = [NSString alloc];
    uint64_t v8 = (objc_class *)objc_opt_class();
    unint64_t v9 = NSStringFromClass(v8);
    unint64_t v10 = NSStringFromClass(a3);
    v11 = (void *)[v7 initWithFormat:@"configuration %@ cannot provide a %@", v9, v10];

    *uint64_t v4 = +[VNError errorForInvalidOperationWithLocalizedDescription:v11];

LABEL_6:
    uint64_t v4 = 0;
  }
LABEL_7:

  return v4;
}

- (id)resolvedAlgorithmAndReturnError:(id *)a3
{
  id v3 = [(VNEntityIdentificationModelConfiguration *)self algorithm];
  if (!v3) {
    id v3 = objc_alloc_init(VNEntityIdentificationModelAlgorithmVIPv2);
  }

  return v3;
}

- (VNEntityIdentificationModelConfiguration)initWithEntityPrintOriginatingRequestSpecifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNEntityIdentificationModelConfiguration;
  unint64_t v5 = [(VNEntityIdentificationModelConfiguration *)&v10 init];
  unint64_t v6 = (VNEntityIdentificationModelConfiguration *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_1A410C210;
    uint64_t v7 = [v4 copy];
    entityPrintOriginatingRequestSpecifier = v6->_entityPrintOriginatingRequestSpecifier;
    v6->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v7;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newConfigurationForEntityPrintsGeneratedByRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = VNEntityUniqueIdentifierSupportedRequestSpecifiers();
  uint64_t v8 = [v6 specifier];
  if ([v7 containsObject:v8])
  {
    id v9 = objc_alloc((Class)a1);
    objc_super v10 = [v6 specifier];
    v11 = (void *)[v9 initWithEntityPrintOriginatingRequestSpecifier:v10];
  }
  else
  {
    if (!a4)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_super v10 = [NSString stringWithFormat:@"%@ is not supported", v8];
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(2, v10, 0);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v11;
}

+ (unint64_t)maximumAllowableFaceprintsPerIdentity
{
  return 10000;
}

+ (unint64_t)maximumAllowableEntities
{
  return 524272;
}

- (int)faceID3IndexMode
{
  v2 = [(VNEntityIdentificationModelConfiguration *)self algorithmOfClass:objc_opt_class() error:0];
  id v3 = v2;
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
  unint64_t v2 = [(VNEntityIdentificationModelConfiguration *)self maximumTrainingPrintsPerEntity];
  if (v2 >= 0x7FFFFFFF) {
    LODWORD(v2) = 0x7FFFFFFF;
  }
  return v2;
}

- (int)faceID3ModelMaximumIDs
{
  unint64_t v2 = [(VNEntityIdentificationModelConfiguration *)self maximumEntities];
  if (v2 >= 0x7FFFFFFF) {
    LODWORD(v2) = 0x7FFFFFFF;
  }
  return v2;
}

- (int)faceIDModelMaximumElementsPerID
{
  unint64_t v2 = [(VNEntityIdentificationModelConfiguration *)self maximumTrainingPrintsPerEntity];
  if (v2 >= 0x7FFFFFFF) {
    LODWORD(v2) = 0x7FFFFFFF;
  }
  return v2;
}

@end