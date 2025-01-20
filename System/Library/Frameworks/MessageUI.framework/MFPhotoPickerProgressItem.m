@interface MFPhotoPickerProgressItem
- (AVAssetExportSession)exportSession;
- (double)progress;
- (id)description;
- (int)imageRequestID;
- (void)setExportSession:(id)a3;
- (void)setImageRequestID:(int)a3;
- (void)setProgress:(double)a3;
@end

@implementation MFPhotoPickerProgressItem

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)MFPhotoPickerProgressItem;
  v3 = [(MFPhotoPickerProgressItem *)&v14 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = NSString;
  [(MFPhotoPickerProgressItem *)self progress];
  v7 = objc_msgSend(v5, "stringWithFormat:", @" progress: %f ", v6);
  [v4 appendString:v7];

  v8 = objc_msgSend(NSString, "stringWithFormat:", @"imageRequestID: %d ", -[MFPhotoPickerProgressItem imageRequestID](self, "imageRequestID"));
  [v4 appendString:v8];

  v9 = NSString;
  v10 = [(MFPhotoPickerProgressItem *)self exportSession];
  v11 = [v9 stringWithFormat:@"exportSession: %@", v10];
  [v4 appendString:v11];

  v12 = (void *)[v4 copy];

  return v12;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (int)imageRequestID
{
  return self->_imageRequestID;
}

- (void)setImageRequestID:(int)a3
{
  self->_imageRequestID = a3;
}

- (AVAssetExportSession)exportSession
{
  return self->_exportSession;
}

- (void)setExportSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end