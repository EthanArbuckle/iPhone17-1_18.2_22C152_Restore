@interface LPLinkSnapshotConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)showDebugIndicators;
- (CGSize)maximumSize;
- (CGSize)size;
- (LPLinkRendererSizeClassParameters)sizeClassParameters;
- (LPLinkSnapshotConfiguration)init;
- (LPLinkSnapshotConfiguration)initWithCoder:(id)a3;
- (LPLinkSnapshotConfiguration)initWithTraitCollection:(id)a3 preferredSizeClass:(unint64_t)a4 maximumSize:(CGSize)a5 scale:(double)a6;
- (LPLinkSnapshotConfiguration)initWithTraitCollection:(id)a3 preferredSizeClass:(unint64_t)a4 size:(CGSize)a5 scale:(double)a6;
- (UITraitCollection)traitCollection;
- (double)scale;
- (unint64_t)preferredSizeClass;
- (void)encodeWithCoder:(id)a3;
- (void)setShowDebugIndicators:(BOOL)a3;
- (void)setSizeClassParameters:(id)a3;
@end

@implementation LPLinkSnapshotConfiguration

- (LPLinkSnapshotConfiguration)init
{
  return 0;
}

- (LPLinkSnapshotConfiguration)initWithTraitCollection:(id)a3 preferredSizeClass:(unint64_t)a4 maximumSize:(CGSize)a5 scale:(double)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LPLinkSnapshotConfiguration;
  v13 = [(LPLinkSnapshotConfiguration *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_traitCollection, a3);
    v14->_preferredSizeClass = a4;
    v14->_maximumSize.CGFloat width = width;
    v14->_maximumSize.CGFloat height = height;
    v14->_scale = a6;
    v15 = v14;
  }

  return v14;
}

- (LPLinkSnapshotConfiguration)initWithTraitCollection:(id)a3 preferredSizeClass:(unint64_t)a4 size:(CGSize)a5 scale:(double)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LPLinkSnapshotConfiguration;
  v13 = [(LPLinkSnapshotConfiguration *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_traitCollection, a3);
    v14->_preferredSizeClass = a4;
    v14->_size.CGFloat width = width;
    v14->_size.CGFloat height = height;
    v14->_scale = a6;
    v15 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPLinkSnapshotConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)LPLinkSnapshotConfiguration;
  v5 = [(LPLinkSnapshotConfiguration *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"traitCollection");
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v6;

    v5->_preferredSizeClass = [v4 decodeIntegerForKey:@"preferredSizeClass"];
    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"sizeClassParameters");
    sizeClassParameters = v5->_sizeClassParameters;
    v5->_sizeClassParameters = (LPLinkRendererSizeClassParameters *)v8;

    [v4 decodeFloatForKey:@"maximumWidth"];
    float v11 = v10;
    [v4 decodeFloatForKey:@"maximumHeight"];
    v5->_maximumSize.CGFloat width = v11;
    v5->_maximumSize.CGFloat height = v12;
    [v4 decodeFloatForKey:@"sizeWidth"];
    float v14 = v13;
    [v4 decodeFloatForKey:@"sizeHeight"];
    v5->_size.CGFloat width = v14;
    v5->_size.CGFloat height = v15;
    [v4 decodeFloatForKey:@"scale"];
    v5->_scale = v16;
    objc_super v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "_lp_encodeObjectIfNotNil:forKey:", self->_traitCollection, @"traitCollection");
  [v9 encodeInteger:self->_preferredSizeClass forKey:@"preferredSizeClass"];
  objc_msgSend(v9, "_lp_encodeObjectIfNotNil:forKey:", self->_sizeClassParameters, @"sizeClassParameters");
  CGFloat width = self->_maximumSize.width;
  *(float *)&CGFloat width = width;
  [v9 encodeFloat:@"maximumWidth" forKey:width];
  CGFloat height = self->_maximumSize.height;
  *(float *)&CGFloat height = height;
  [v9 encodeFloat:@"maximumHeight" forKey:height];
  CGFloat v6 = self->_size.width;
  *(float *)&CGFloat v6 = v6;
  [v9 encodeFloat:@"sizeWidth" forKey:v6];
  CGFloat v7 = self->_size.height;
  *(float *)&CGFloat v7 = v7;
  [v9 encodeFloat:@"sizeHeight" forKey:v7];
  double scale = self->_scale;
  *(float *)&double scale = scale;
  [v9 encodeFloat:@"scale" forKey:scale];
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (unint64_t)preferredSizeClass
{
  return self->_preferredSizeClass;
}

- (LPLinkRendererSizeClassParameters)sizeClassParameters
{
  return self->_sizeClassParameters;
}

- (void)setSizeClassParameters:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)showDebugIndicators
{
  return self->_showDebugIndicators;
}

- (void)setShowDebugIndicators:(BOOL)a3
{
  self->_showDebugIndicators = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClassParameters, 0);

  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end