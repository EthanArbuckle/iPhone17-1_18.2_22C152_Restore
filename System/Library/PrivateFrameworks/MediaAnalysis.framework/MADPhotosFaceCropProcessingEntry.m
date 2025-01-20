@interface MADPhotosFaceCropProcessingEntry
- (MADPhotosFaceCropProcessingEntry)initWithFaceCrop:(id)a3;
- (PHFaceCrop)faceCrop;
@end

@implementation MADPhotosFaceCropProcessingEntry

- (MADPhotosFaceCropProcessingEntry)initWithFaceCrop:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADPhotosFaceCropProcessingEntry;
  v6 = [(MADPhotosFaceCropProcessingEntry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_faceCrop, a3);
  }

  return v7;
}

- (PHFaceCrop)faceCrop
{
  return self->_faceCrop;
}

- (void).cxx_destruct
{
}

@end