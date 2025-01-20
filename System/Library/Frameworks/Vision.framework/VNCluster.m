@interface VNCluster
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldUpdateRepresentative;
- (NSArray)objects;
- (NSArray)suggestedIdsForRepresentative;
- (NSDictionary)representativenessById;
- (VNCluster)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)clusterId;
- (unint64_t)hash;
- (unint64_t)totalObjectCount;
- (void)encodeWithCoder:(id)a3;
- (void)setClusterId:(unint64_t)a3;
- (void)setObjects:(id)a3;
- (void)setRepresentativenessById:(id)a3;
- (void)setShouldUpdateRepresentative:(BOOL)a3;
- (void)setSuggestedIdsForRepresentative:(id)a3;
- (void)setTotalObjectCount:(unint64_t)a3;
@end

@implementation VNCluster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativenessById, 0);
  objc_storeStrong((id *)&self->_suggestedIdsForRepresentative, 0);

  objc_storeStrong((id *)&self->_objects, 0);
}

- (void)setRepresentativenessById:(id)a3
{
}

- (NSDictionary)representativenessById
{
  return self->_representativenessById;
}

- (void)setSuggestedIdsForRepresentative:(id)a3
{
}

- (NSArray)suggestedIdsForRepresentative
{
  return self->_suggestedIdsForRepresentative;
}

- (void)setShouldUpdateRepresentative:(BOOL)a3
{
  self->_shouldUpdateRepresentative = a3;
}

- (BOOL)shouldUpdateRepresentative
{
  return self->_shouldUpdateRepresentative;
}

- (void)setTotalObjectCount:(unint64_t)a3
{
  self->_totalObjectCount = a3;
}

- (unint64_t)totalObjectCount
{
  return self->_totalObjectCount;
}

- (void)setClusterId:(unint64_t)a3
{
  self->_clusterId = a3;
}

- (unint64_t)clusterId
{
  return self->_clusterId;
}

- (void)setObjects:(id)a3
{
}

- (NSArray)objects
{
  return self->_objects;
}

- (VNCluster)initWithCoder:(id)a3
{
  id v4 = a3;
  if (![v4 decodeIntegerForKey:@"vncluster"])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vncObjects"];
    objects = self->_objects;
    self->_objects = v5;

    self->_clusterId = [v4 decodeIntegerForKey:@"vncCId"];
    unint64_t v7 = [v4 decodeIntegerForKey:@"vncTotObjCount"];
    self->_totalObjectCount = v7;
    if (v7 >= [(NSArray *)self->_objects count])
    {
      self->_shouldUpdateRepresentative = [v4 decodeIntegerForKey:@"vncRepUpdate"] != 0;
      v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vncRepIds"];
      suggestedIdsForRepresentative = self->_suggestedIdsForRepresentative;
      self->_suggestedIdsForRepresentative = v12;

      v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vncRepnessById"];
      representativenessById = self->_representativenessById;
      self->_representativenessById = v14;

      v10 = self;
      goto LABEL_5;
    }
    v8 = (void *)[[NSString alloc] initWithFormat:@"Data integrity check failed when unarchiving an object of type: %@", objc_opt_class()];
    v9 = +[VNError errorForInternalErrorWithLocalizedDescription:v8];
    [v4 failWithError:v9];
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:0 forKey:@"vncluster"];
  [v4 encodeObject:self->_objects forKey:@"vncObjects"];
  [v4 encodeInteger:self->_clusterId forKey:@"vncCId"];
  [v4 encodeInteger:self->_totalObjectCount forKey:@"vncTotObjCount"];
  [v4 encodeInteger:self->_shouldUpdateRepresentative forKey:@"vncRepUpdate"];
  [v4 encodeObject:self->_suggestedIdsForRepresentative forKey:@"vncRepIds"];
  [v4 encodeObject:self->_representativenessById forKey:@"vncRepnessById"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = [(VNCluster *)self objects];
    v6 = (void *)[v5 copy];
    [v4 setObjects:v6];

    objc_msgSend(v4, "setClusterId:", -[VNCluster clusterId](self, "clusterId"));
    objc_msgSend(v4, "setTotalObjectCount:", -[VNCluster totalObjectCount](self, "totalObjectCount"));
    objc_msgSend(v4, "setShouldUpdateRepresentative:", -[VNCluster shouldUpdateRepresentative](self, "shouldUpdateRepresentative"));
    unint64_t v7 = [(VNCluster *)self suggestedIdsForRepresentative];
    v8 = (void *)[v7 copy];
    [v4 setSuggestedIdsForRepresentative:v8];

    v9 = [(VNCluster *)self representativenessById];
    v10 = (void *)[v9 copy];
    [v4 setRepresentativenessById:v10];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNCluster *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(VNCluster *)self clusterId];
      if (v6 != [(VNCluster *)v5 clusterId]) {
        goto LABEL_11;
      }
      unint64_t v7 = [(VNCluster *)self totalObjectCount];
      if (v7 != [(VNCluster *)v5 totalObjectCount]) {
        goto LABEL_11;
      }
      v8 = [(VNCluster *)self objects];
      v9 = [(VNCluster *)v5 objects];
      char v10 = VisionCoreEqualOrNilObjects();

      if ((v10 & 1) == 0) {
        goto LABEL_11;
      }
      BOOL v11 = [(VNCluster *)self shouldUpdateRepresentative];
      if (v11 != [(VNCluster *)v5 shouldUpdateRepresentative]) {
        goto LABEL_11;
      }
      v12 = [(VNCluster *)self suggestedIdsForRepresentative];
      v13 = [(VNCluster *)v5 suggestedIdsForRepresentative];
      char v14 = VisionCoreEqualOrNilObjects();

      if (v14)
      {
        v15 = [(VNCluster *)self representativenessById];
        v16 = [(VNCluster *)v5 representativenessById];
        char v17 = VisionCoreEqualOrNilObjects();
      }
      else
      {
LABEL_11:
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VNCluster *)self clusterId];
  unint64_t v4 = [(VNCluster *)self totalObjectCount];
  v5 = [(VNCluster *)self objects];
  uint64_t v6 = [v5 hash];

  BOOL v7 = [(VNCluster *)self shouldUpdateRepresentative];
  v8 = [(VNCluster *)self suggestedIdsForRepresentative];
  uint64_t v9 = [v8 hash];

  char v10 = [(VNCluster *)self representativenessById];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = 21845;
  if (v7) {
    uint64_t v12 = 43690;
  }
  unint64_t v13 = v11 ^ __ROR8__(v9 ^ __ROR8__(v12 ^ __ROR8__(v6 ^ __ROR8__(v4 ^ __ROR8__(v3, 51), 51), 51), 51), 51);

  return v13;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:1024];
  [v3 appendString:@"{\n"];
  unint64_t v4 = [(VNCluster *)self clusterId];
  if (v4) {
    objc_msgSend(v3, "appendFormat:", @"  clusterId = %lu;\n", v4);
  }
  unint64_t v5 = [(VNCluster *)self totalObjectCount];
  if (v5) {
    objc_msgSend(v3, "appendFormat:", @"  totalObjCount = %lu;\n", v5);
  }
  uint64_t v6 = [(VNCluster *)self objects];
  if ([v6 count]) {
    [v3 appendFormat:@"  objects = %@;\n", v6];
  }
  BOOL v7 = [(VNCluster *)self shouldUpdateRepresentative];
  objc_msgSend(v3, "appendFormat:", @"  shouldUpdateRep = %d;\n", v7);
  if (v7)
  {
    v8 = [(VNCluster *)self suggestedIdsForRepresentative];
    [v3 appendFormat:@"  suggestedIdsForRep = %@;\n", v8];
  }
  uint64_t v9 = [(VNCluster *)self representativenessById];
  if ([v9 count]) {
    [v3 appendFormat:@"  representativenessById = %@;\n", v9];
  }
  [v3 appendString:@"}\n"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end