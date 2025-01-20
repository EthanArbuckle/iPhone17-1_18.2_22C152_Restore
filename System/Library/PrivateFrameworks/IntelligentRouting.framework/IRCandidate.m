@interface IRCandidate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IRCandidate)initWithCandidateIdentifier:(id)a3;
- (IRCandidate)initWithCoder:(id)a3;
- (NSSet)nodes;
- (NSString)avOutpuDeviceIdentifier;
- (NSString)candidateIdentifier;
- (NSString)idsIdentifier;
- (NSString)rapportIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAvOutpuDeviceIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setRapportIdentifier:(id)a3;
- (void)updateNodes:(id)a3;
@end

@implementation IRCandidate

- (IRCandidate)initWithCandidateIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRCandidate;
  v6 = [(IRCandidate *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_candidateIdentifier, a3);
    uint64_t v8 = objc_opt_new();
    nodes = v7->_nodes;
    v7->_nodes = (NSSet *)v8;
  }
  return v7;
}

- (void)updateNodes:(id)a3
{
  self->_nodes = (NSSet *)[a3 copy];
  MEMORY[0x270F9A758]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCandidateIdentifier:self->_candidateIdentifier];
  uint64_t v6 = [(NSString *)self->_candidateIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSSet *)self->_nodes copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  uint64_t v10 = [(IRCandidate *)self avOutpuDeviceIdentifier];
  objc_super v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(IRCandidate *)self rapportIdentifier];
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(IRCandidate *)self idsIdentifier];
  v15 = (void *)v5[4];
  v5[4] = v14;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  candidateIdentifier = self->_candidateIdentifier;
  id v5 = a3;
  [v5 encodeObject:candidateIdentifier forKey:@"candidateIdentifier"];
  [v5 encodeObject:self->_nodes forKey:@"nodes"];
  [v5 encodeObject:self->_avOutpuDeviceIdentifier forKey:@"avOutpuDeviceIdentifier"];
  [v5 encodeObject:self->_rapportIdentifier forKey:@"rapportIdentifier"];
  [v5 encodeObject:self->_idsIdentifier forKey:@"idsIdentifier"];
}

- (IRCandidate)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IRCandidate;
  id v5 = [(IRCandidate *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidateIdentifier"];
    if (v6)
    {
      uint64_t v7 = self;

      candidateIdentifier = v5->_candidateIdentifier;
      v5->_candidateIdentifier = (NSString *)v7;

      v9 = (void *)MEMORY[0x263EFFA08];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
      objc_super v11 = [v9 setWithArray:v10];
      uint64_t v6 = [v4 decodeObjectOfClasses:v11 forKey:@"nodes"];

      if (v6)
      {
        uint64_t v12 = self;

        nodes = v5->_nodes;
        v5->_nodes = (NSSet *)v12;

        uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avOutpuDeviceIdentifier"];
        uint64_t v15 = self;

        avOutpuDeviceIdentifier = v5->_avOutpuDeviceIdentifier;
        v5->_avOutpuDeviceIdentifier = (NSString *)v15;

        v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rapportIdentifier"];
        uint64_t v18 = self;

        rapportIdentifier = v5->_rapportIdentifier;
        v5->_rapportIdentifier = (NSString *)v18;

        v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsIdentifier"];
        uint64_t v21 = self;

        idsIdentifier = v5->_idsIdentifier;
        v5->_idsIdentifier = (NSString *)v21;

        uint64_t v6 = v5;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", candidateIdentifier: %@", self->_candidateIdentifier];
  [v6 appendFormat:@", avOutpuDeviceIdentifier: %@", self->_avOutpuDeviceIdentifier];
  [v6 appendFormat:@", rapportIdentifier: %@", self->_rapportIdentifier];
  [v6 appendFormat:@", idsIdentifier: %@", self->_idsIdentifier];
  [v6 appendFormat:@", nodes: %@", self->_nodes];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(IRCandidate *)self candidateIdentifier];
    uint64_t v7 = [v5 candidateIdentifier];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      v9 = [(IRCandidate *)self candidateIdentifier];
      uint64_t v10 = [v5 candidateIdentifier];

      if (v9 != v10) {
        goto LABEL_15;
      }
    }
    objc_super v11 = [(IRCandidate *)self nodes];
    uint64_t v12 = [v5 nodes];
    if ([v11 isEqual:v12])
    {
    }
    else
    {
      v13 = [(IRCandidate *)self nodes];
      uint64_t v14 = [v5 nodes];

      if (v13 != v14) {
        goto LABEL_15;
      }
    }
    uint64_t v15 = [(IRCandidate *)self avOutpuDeviceIdentifier];
    v16 = [v5 avOutpuDeviceIdentifier];
    if ([v15 isEqual:v16])
    {
    }
    else
    {
      v17 = [(IRCandidate *)self avOutpuDeviceIdentifier];
      uint64_t v18 = [v5 avOutpuDeviceIdentifier];

      if (v17 != v18) {
        goto LABEL_15;
      }
    }
    v19 = [(IRCandidate *)self rapportIdentifier];
    v20 = [v5 rapportIdentifier];
    if ([v19 isEqual:v20])
    {

      goto LABEL_18;
    }
    uint64_t v21 = [(IRCandidate *)self rapportIdentifier];
    v22 = [v5 rapportIdentifier];

    if (v21 == v22)
    {
LABEL_18:
      objc_super v24 = [(IRCandidate *)self idsIdentifier];
      v25 = [v5 idsIdentifier];
      if ([v24 isEqual:v25])
      {

        char v8 = 1;
      }
      else
      {
        v26 = [(IRCandidate *)self idsIdentifier];
        v27 = [v5 idsIdentifier];
        BOOL v28 = v26 != v27;

        char v8 = !v28;
      }
      goto LABEL_16;
    }
LABEL_15:
    char v8 = 0;
LABEL_16:

    goto LABEL_17;
  }
  char v8 = 0;
LABEL_17:

  return v8 & 1;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_candidateIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_avOutpuDeviceIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_rapportIdentifier hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_idsIdentifier hash];
  return v6 ^ [(NSSet *)self->_nodes hash];
}

- (NSString)candidateIdentifier
{
  return self->_candidateIdentifier;
}

- (NSString)avOutpuDeviceIdentifier
{
  return self->_avOutpuDeviceIdentifier;
}

- (void)setAvOutpuDeviceIdentifier:(id)a3
{
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (void)setRapportIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSSet)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
  objc_storeStrong((id *)&self->_avOutpuDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_candidateIdentifier, 0);
}

@end