@interface MADPersonIdentificationResultItem
+ (BOOL)supportsSecureCoding;
- (BOOL)verified;
- (CGRect)boundingBox;
- (MADPersonIdentificationResultItem)initWithCoder:(id)a3;
- (MADPersonIdentificationResultItem)initWithPersonIdentifier:(id)a3 personName:(id)a4 mdID:(id)a5 verified:(BOOL)a6 boundingBox:(CGRect)a7 andConfidence:(float)a8;
- (NSString)mdID;
- (NSString)personIdentifier;
- (NSString)personName;
- (float)confidence;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADPersonIdentificationResultItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADPersonIdentificationResultItem)initWithPersonIdentifier:(id)a3 personName:(id)a4 mdID:(id)a5 verified:(BOOL)a6 boundingBox:(CGRect)a7 andConfidence:(float)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MADPersonIdentificationResultItem;
  v21 = [(MADPersonIdentificationResultItem *)&v24 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_personIdentifier, a3);
    objc_storeStrong((id *)&v22->_personName, a4);
    objc_storeStrong((id *)&v22->_mdID, a5);
    v22->_verified = a6;
    v22->_boundingBox.origin.CGFloat x = x;
    v22->_boundingBox.origin.CGFloat y = y;
    v22->_boundingBox.size.CGFloat width = width;
    v22->_boundingBox.size.CGFloat height = height;
    v22->_confidence = a8;
  }

  return v22;
}

- (MADPersonIdentificationResultItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MADPersonIdentificationResultItem;
  v5 = [(MADPersonIdentificationResultItem *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersonIdentifier"];
    personIdentifier = v5->_personIdentifier;
    v5->_personIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersonName"];
    personName = v5->_personName;
    v5->_personName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MegadomeIdentifier"];
    mdID = v5->_mdID;
    v5->_mdID = (NSString *)v10;

    v5->_verified = [v4 decodeBoolForKey:@"Verified"];
    [v4 decodeRectForKey:@"BoundingBox"];
    v5->_boundingBox.origin.CGFloat x = v12;
    v5->_boundingBox.origin.CGFloat y = v13;
    v5->_boundingBox.size.CGFloat width = v14;
    v5->_boundingBox.size.CGFloat height = v15;
    [v4 decodeFloatForKey:@"Confidence"];
    v5->_confidence = v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_personIdentifier forKey:@"PersonIdentifier"];
  [v5 encodeObject:self->_personName forKey:@"PersonName"];
  [v5 encodeObject:self->_mdID forKey:@"MegadomeIdentifier"];
  [v5 encodeBool:self->_verified forKey:@"Verified"];
  objc_msgSend(v5, "encodeRect:forKey:", @"BoundingBox", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  *(float *)&double v4 = self->_confidence;
  [v5 encodeFloat:@"Confidence" forKey:v4];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  double v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"person-identifier: %@, ", self->_personIdentifier];
  [v3 appendFormat:@"person-name: %@, ", self->_personName];
  [v3 appendFormat:@"megadome-identifier: %@, ", self->_mdID];
  if (self->_verified) {
    uint64_t v6 = @"verified";
  }
  else {
    uint64_t v6 = @"unverified";
  }
  [v3 appendFormat:@"verified: %@, ", v6];
  v7 = [NSString stringWithFormat:@"{{x:%.*f, y:%.*f}, {width:%.*f, height:%.*f}} ", 2, *(void *)&self->_boundingBox.origin.x, 2, *(void *)&self->_boundingBox.origin.y, 2, *(void *)&self->_boundingBox.size.width, 2, *(void *)&self->_boundingBox.size.height];
  [v3 appendFormat:@"bounding-box: %@, ", v7];

  objc_msgSend(v3, "appendFormat:", @"confidence: %.*f>", 2, self->_confidence);
  return v3;
}

- (NSString)mdID
{
  return self->_mdID;
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (NSString)personName
{
  return self->_personName;
}

- (BOOL)verified
{
  return self->_verified;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personName, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
  objc_storeStrong((id *)&self->_mdID, 0);
}

@end