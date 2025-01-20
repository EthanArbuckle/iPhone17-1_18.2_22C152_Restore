@interface MADTextInputEntitySegment
+ (BOOL)supportsSecureCoding;
- (MADTextInputEntitySegment)initWithCoder:(id)a3;
- (MADTextInputEntitySegment)initWithEntityUUID:(id)a3;
- (NSUUID)entityUUID;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADTextInputEntitySegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextInputEntitySegment)initWithEntityUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADTextInputEntitySegment;
  v6 = [(MADTextInputEntitySegment *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entityUUID, a3);
  }

  return v7;
}

- (MADTextInputEntitySegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADTextInputEntitySegment;
  id v5 = [(MADTextInputSegment *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EntityUUID"];
    entityUUID = v5->_entityUUID;
    v5->_entityUUID = (NSUUID *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADTextInputEntitySegment;
  id v4 = a3;
  [(MADTextInputSegment *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_entityUUID, @"EntityUUID", v5.receiver, v5.super_class);
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

  [v3 appendFormat:@"entityUUID: %@>", self->_entityUUID];
  return v3;
}

- (NSUUID)entityUUID
{
  return self->_entityUUID;
}

- (void).cxx_destruct
{
}

@end