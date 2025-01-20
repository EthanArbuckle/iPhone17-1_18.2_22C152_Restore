@interface MADMultiModalInputEntitySegment
+ (BOOL)supportsSecureCoding;
- (MADMultiModalInputEntitySegment)initWithCoder:(id)a3;
- (MADMultiModalInputEntitySegment)initWithEntityUUID:(id)a3 seed:(id)a4;
- (NSNumber)seed;
- (NSUUID)entityUUID;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADMultiModalInputEntitySegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInputEntitySegment)initWithEntityUUID:(id)a3 seed:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADMultiModalInputEntitySegment;
  v9 = [(MADMultiModalInputEntitySegment *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityUUID, a3);
    objc_storeStrong((id *)&v10->_seed, a4);
  }

  return v10;
}

- (MADMultiModalInputEntitySegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADMultiModalInputEntitySegment;
  v5 = [(MADMultiModalInputSegment *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EntityUUID"];
    entityUUID = v5->_entityUUID;
    v5->_entityUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Seed"];
    seed = v5->_seed;
    v5->_seed = (NSNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADMultiModalInputEntitySegment;
  id v4 = a3;
  [(MADMultiModalInputSegment *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_entityUUID, @"EntityUUID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_seed forKey:@"Seed"];
}

- (int64_t)type
{
  return 2;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"entityUUID: %@", self->_entityUUID];
  if (self->_seed) {
    [v3 appendFormat:@", seed: %@", self->_seed];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (NSUUID)entityUUID
{
  return self->_entityUUID;
}

- (NSNumber)seed
{
  return self->_seed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_entityUUID, 0);
}

@end