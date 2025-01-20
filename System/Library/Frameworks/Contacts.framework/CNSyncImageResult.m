@interface CNSyncImageResult
- (CGRect)cropRect;
- (CNSyncImageResult)initWithType:(unint64_t)a3 imageData:(id)a4 cropRect:(CGRect)a5 imageHash:(id)a6;
- (NSData)imageData;
- (NSData)imageHash;
- (unint64_t)type;
@end

@implementation CNSyncImageResult

- (CNSyncImageResult)initWithType:(unint64_t)a3 imageData:(id)a4 cropRect:(CGRect)a5 imageHash:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a4;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CNSyncImageResult;
  v16 = [(CNSyncImageResult *)&v20 init];
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    objc_storeStrong((id *)&v16->_imageData, a4);
    v17->_cropRect.origin.CGFloat x = x;
    v17->_cropRect.origin.CGFloat y = y;
    v17->_cropRect.size.CGFloat width = width;
    v17->_cropRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v17->_imageHash, a6);
    v18 = v17;
  }

  return v17;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSData)imageHash
{
  return self->_imageHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHash, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

@end