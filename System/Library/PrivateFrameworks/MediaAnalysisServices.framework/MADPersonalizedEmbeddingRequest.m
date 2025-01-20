@interface MADPersonalizedEmbeddingRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)bypassFaceDetection;
- (CGRect)targetBounds;
- (MADPersonalizedEmbeddingRequest)init;
- (MADPersonalizedEmbeddingRequest)initWithCoder:(id)a3;
- (VUWGalleryPersonalizationOptions)personalizationOptions;
- (id)description;
- (int64_t)revision;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBypassFaceDetection:(BOOL)a3;
- (void)setPersonalizationOptions:(id)a3;
- (void)setRevision:(int64_t)a3;
- (void)setTargetBounds:(CGRect)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MADPersonalizedEmbeddingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADPersonalizedEmbeddingRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)MADPersonalizedEmbeddingRequest;
  v2 = [(MADPersonalizedEmbeddingRequest *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_revision = 1;
    v2->_bypassFaceDetection = 0;
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v2->_targetBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v2->_targetBounds.size = v4;
    personalizationOptions = v2->_personalizationOptions;
    v2->_personalizationOptions = 0;
  }
  return v3;
}

- (MADPersonalizedEmbeddingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MADPersonalizedEmbeddingRequest;
  v5 = [(MADMultiModalRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    v5->_revision = [v4 decodeIntegerForKey:@"Revision"];
    v5->_bypassFaceDetection = [v4 decodeBoolForKey:@"BypassFaceDetection"];
    [v4 decodeRectForKey:@"TargetBounds"];
    v5->_targetBounds.origin.x = v6;
    v5->_targetBounds.origin.y = v7;
    v5->_targetBounds.size.width = v8;
    v5->_targetBounds.size.height = v9;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v10 = (void *)getVUWGalleryPersonalizationOptionsClass_softClass;
    uint64_t v20 = getVUWGalleryPersonalizationOptionsClass_softClass;
    if (!getVUWGalleryPersonalizationOptionsClass_softClass)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getVUWGalleryPersonalizationOptionsClass_block_invoke;
      v16[3] = &unk_1E6CAD0C8;
      v16[4] = &v17;
      __getVUWGalleryPersonalizationOptionsClass_block_invoke((uint64_t)v16);
      v10 = (void *)v18[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v17, 8);
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersonalizationOptions"];
    personalizationOptions = v5->_personalizationOptions;
    v5->_personalizationOptions = (VUWGalleryPersonalizationOptions *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADPersonalizedEmbeddingRequest;
  id v4 = a3;
  [(MADMultiModalRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_revision, @"Revision", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_bypassFaceDetection forKey:@"BypassFaceDetection"];
  objc_msgSend(v4, "encodeRect:forKey:", @"TargetBounds", self->_targetBounds.origin.x, self->_targetBounds.origin.y, self->_targetBounds.size.width, self->_targetBounds.size.height);
  [v4 encodeObject:self->_personalizationOptions forKey:@"PersonalizationOptions"];
}

- (void)setType:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v4 = 3;
    goto LABEL_5;
  }
  int v3 = a3;
  if (a3 == 1)
  {
    uint64_t v4 = 1;
LABEL_5:
    [(MADPersonalizedEmbeddingRequest *)self setRevision:v4];
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[MADPersonalizedEmbeddingRequest setType:](v3);
  }
}

- (int64_t)type
{
  int64_t revision = self->_revision;
  if (revision == 1) {
    return 1;
  }
  else {
    return 2 * (revision == 3);
  }
}

- (id)description
{
  int v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"revision: %d, ", self->_revision];
  [v3 appendFormat:@"bypassFaceDetection: %d, ", self->_bypassFaceDetection];
  if (!CGRectIsEmpty(self->_targetBounds)) {
    [v3 appendFormat:@"targetBounds: (%0.2f, %0.2f) %0.2fx%0.2f,", *(void *)&self->_targetBounds.origin.x, *(void *)&self->_targetBounds.origin.y, *(void *)&self->_targetBounds.size.width, *(void *)&self->_targetBounds.size.height];
  }
  if (self->_personalizationOptions) {
    [v3 appendFormat:@"personalization options: %@,", self->_personalizationOptions];
  }
  CGFloat v6 = [(MADMultiModalRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  CGFloat v7 = [(MADMultiModalRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_int64_t revision = a3;
}

- (BOOL)bypassFaceDetection
{
  return self->_bypassFaceDetection;
}

- (void)setBypassFaceDetection:(BOOL)a3
{
  self->_bypassFaceDetection = a3;
}

- (CGRect)targetBounds
{
  double x = self->_targetBounds.origin.x;
  double y = self->_targetBounds.origin.y;
  double width = self->_targetBounds.size.width;
  double height = self->_targetBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetBounds:(CGRect)a3
{
  self->_targetBounds = a3;
}

- (VUWGalleryPersonalizationOptions)personalizationOptions
{
  return self->_personalizationOptions;
}

- (void)setPersonalizationOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setType:(int)a1 .cold.1(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to set unsupported personalization type (%d)", (uint8_t *)v1, 8u);
}

@end