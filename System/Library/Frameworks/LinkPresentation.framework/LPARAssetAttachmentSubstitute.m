@interface LPARAssetAttachmentSubstitute
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSubstitute;
- (LPARAssetAttachmentSubstitute)initWithARAsset:(id)a3;
- (LPARAssetAttachmentSubstitute)initWithCoder:(id)a3;
- (int64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(int64_t)a3;
@end

@implementation LPARAssetAttachmentSubstitute

- (LPARAssetAttachmentSubstitute)initWithARAsset:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LPARAssetAttachmentSubstitute;
  v3 = [(LPARAsset *)&v7 _initWithARAsset:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (LPARAssetAttachmentSubstitute)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPARAssetAttachmentSubstitute;
  v5 = [(LPARAsset *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_index = [v4 decodeIntegerForKey:@"richLinkARAssetAttachmentSubstituteIndex"];
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LPARAssetAttachmentSubstitute;
  [(LPARAsset *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_index forKey:@"richLinkARAssetAttachmentSubstituteIndex"];
}

- (BOOL)_isSubstitute
{
  return 1;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

@end