@interface MADMultiModalInputFaceprintSegment
+ (BOOL)supportsSecureCoding;
- (MADMultiModalInputFaceprintSegment)initWithCoder:(id)a3;
- (MADMultiModalInputFaceprintSegment)initWithFaceprint:(id)a3;
- (VNFaceprint)faceprint;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADMultiModalInputFaceprintSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInputFaceprintSegment)initWithFaceprint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADMultiModalInputFaceprintSegment;
  v6 = [(MADMultiModalInputFaceprintSegment *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_faceprint, a3);
  }

  return v7;
}

- (MADMultiModalInputFaceprintSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADMultiModalInputFaceprintSegment;
  id v5 = [(MADMultiModalInputSegment *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v6 = (void *)getVNFaceprintClass_softClass;
    uint64_t v16 = getVNFaceprintClass_softClass;
    if (!getVNFaceprintClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getVNFaceprintClass_block_invoke;
      v12[3] = &unk_1E6CAD0C8;
      v12[4] = &v13;
      __getVNFaceprintClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v13, 8);
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Faceprint"];
    faceprint = v5->_faceprint;
    v5->_faceprint = (VNFaceprint *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADMultiModalInputFaceprintSegment;
  id v4 = a3;
  [(MADMultiModalInputSegment *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceprint, @"Faceprint", v5.receiver, v5.super_class);
}

- (int64_t)type
{
  return 5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"faceprint: %@", self->_faceprint];
  [v3 appendFormat:@">"];
  return v3;
}

- (VNFaceprint)faceprint
{
  return self->_faceprint;
}

- (void).cxx_destruct
{
}

@end