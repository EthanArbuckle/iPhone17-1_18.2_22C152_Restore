@interface _FBSSnapshotContext
- (BOOL)allowsProtectedContent;
- (BOOL)isOpaque;
- (CGSize)snapshotSize;
- (FBSDisplayConfiguration)displayConfiguration;
- (NSOrderedSet)layers;
- (_FBSSnapshotContext)initWithDisplayConfiguration:(id)a3 layer:(id)a4;
- (_FBSSnapshotContext)initWithDisplayConfiguration:(id)a3 layers:(id)a4;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowsProtectedContent:(BOOL)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setSnapshotSize:(CGSize)a3;
@end

@implementation _FBSSnapshotContext

- (_FBSSnapshotContext)initWithDisplayConfiguration:(id)a3 layer:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CAA0];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithObject:v7];

  v10 = [(_FBSSnapshotContext *)self initWithDisplayConfiguration:v8 layers:v9];
  return v10;
}

- (_FBSSnapshotContext)initWithDisplayConfiguration:(id)a3 layers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_FBSSnapshotContext;
  v9 = [(_FBSSnapshotContext *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayConfiguration, a3);
    uint64_t v11 = [v8 copy];
    layers = v10->_layers;
    v10->_layers = (NSOrderedSet *)v11;

    [v7 pointScale];
    v10->_scale = v13;
    [v7 bounds];
    v10->_snapshotSize.width = v14;
    v10->_snapshotSize.height = v15;
    v10->_opaque = 1;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[_FBSSnapshotContext alloc] initWithDisplayConfiguration:self->_displayConfiguration layers:self->_layers];
  [(_FBSSnapshotContext *)v4 setOpaque:self->_opaque];
  [(_FBSSnapshotContext *)v4 setScale:self->_scale];
  -[_FBSSnapshotContext setSnapshotSize:](v4, "setSnapshotSize:", self->_snapshotSize.width, self->_snapshotSize.height);
  [(_FBSSnapshotContext *)v4 setAllowsProtectedContent:self->_allowsProtectedContent];
  return v4;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (NSOrderedSet)layers
{
  return self->_layers;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)snapshotSize
{
  double width = self->_snapshotSize.width;
  double height = self->_snapshotSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSnapshotSize:(CGSize)a3
{
  self->_snapshotSize = a3;
}

- (BOOL)allowsProtectedContent
{
  return self->_allowsProtectedContent;
}

- (void)setAllowsProtectedContent:(BOOL)a3
{
  self->_allowsProtectedContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);

  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

@end