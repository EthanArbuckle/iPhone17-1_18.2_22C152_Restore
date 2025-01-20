@interface DOCAnimatableInfo
+ (BOOL)supportsSecureCoding;
- (CGRect)sourceFrame;
- (DOCAnimatableInfo)initWithCoder:(id)a3;
- (UIBezierPath)sourcePath;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)sourceLayerRenderId;
- (unsigned)sourceContextId;
- (void)encodeWithCoder:(id)a3;
- (void)setSourceContextId:(unsigned int)a3;
- (void)setSourceFrame:(CGRect)a3;
- (void)setSourceLayerRenderId:(unint64_t)a3;
- (void)setSourcePath:(id)a3;
@end

@implementation DOCAnimatableInfo

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 8) = self->_sourceContextId;
    *(void *)(v4 + 16) = self->_sourceLayerRenderId;
    CGSize size = self->_sourceFrame.size;
    *(CGPoint *)(v4 + 32) = self->_sourceFrame.origin;
    *(CGSize *)(v4 + 48) = size;
    objc_storeStrong((id *)(v4 + 24), self->_sourcePath);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCAnimatableInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DOCAnimatableInfo;
  v5 = [(DOCAnimatableInfo *)&v18 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_sourceContextId);
    v5->_sourceContextId = [v4 decodeInt32ForKey:v6];

    v7 = NSStringFromSelector(sel_sourceLayerRenderId);
    v5->_sourceLayerRenderId = [v4 decodeInt64ForKey:v7];

    v8 = NSStringFromSelector(sel_sourceFrame);
    [v4 decodeCGRectForKey:v8];
    v5->_sourceFrame.origin.x = v9;
    v5->_sourceFrame.origin.y = v10;
    v5->_sourceFrame.size.width = v11;
    v5->_sourceFrame.size.height = v12;

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_sourcePath);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    sourcePath = v5->_sourcePath;
    v5->_sourcePath = (UIBezierPath *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t sourceContextId = self->_sourceContextId;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_sourceContextId);
  [v5 encodeInt32:sourceContextId forKey:v6];

  unint64_t sourceLayerRenderId = self->_sourceLayerRenderId;
  v8 = NSStringFromSelector(sel_sourceLayerRenderId);
  [v5 encodeInt64:sourceLayerRenderId forKey:v8];

  CGFloat v9 = NSStringFromSelector(sel_sourceFrame);
  objc_msgSend(v5, "encodeCGRect:forKey:", v9, self->_sourceFrame.origin.x, self->_sourceFrame.origin.y, self->_sourceFrame.size.width, self->_sourceFrame.size.height);

  sourcePath = self->_sourcePath;
  NSStringFromSelector(sel_sourcePath);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:sourcePath forKey:v11];
}

- (unsigned)sourceContextId
{
  return self->_sourceContextId;
}

- (void)setSourceContextId:(unsigned int)a3
{
  self->_uint64_t sourceContextId = a3;
}

- (unint64_t)sourceLayerRenderId
{
  return self->_sourceLayerRenderId;
}

- (void)setSourceLayerRenderId:(unint64_t)a3
{
  self->_unint64_t sourceLayerRenderId = a3;
}

- (CGRect)sourceFrame
{
  double x = self->_sourceFrame.origin.x;
  double y = self->_sourceFrame.origin.y;
  double width = self->_sourceFrame.size.width;
  double height = self->_sourceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceFrame:(CGRect)a3
{
  self->_sourceFrame = a3;
}

- (UIBezierPath)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end