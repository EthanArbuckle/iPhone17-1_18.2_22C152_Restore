@interface BMPhotosPhotoViewStream
- (BMPhotosPhotoViewStream)init;
- (id)identifier;
@end

@implementation BMPhotosPhotoViewStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"PhotosPhotoView"];
}

- (BMPhotosPhotoViewStream)init
{
  v3 = [(BMPhotosPhotoViewStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end