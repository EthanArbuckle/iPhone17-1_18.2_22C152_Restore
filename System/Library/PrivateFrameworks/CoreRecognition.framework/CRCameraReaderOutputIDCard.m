@interface CRCameraReaderOutputIDCard
- (NSArray)targetVertices;
- (NSArray)vertices;
- (NSString)capturePath;
- (UIImage)imageValue;
@end

@implementation CRCameraReaderOutputIDCard

- (UIImage)imageValue
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  v3 = [v2 imageValue];

  return (UIImage *)v3;
}

- (NSArray)vertices
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  v3 = [v2 vertices];

  return (NSArray *)v3;
}

- (NSArray)targetVertices
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  v3 = [v2 targetVertices];

  return (NSArray *)v3;
}

- (NSString)capturePath
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  v3 = [v2 capturePath];

  return (NSString *)v3;
}

@end