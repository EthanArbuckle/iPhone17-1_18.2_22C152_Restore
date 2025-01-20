@interface ATXFaceGalleryBiomeStream
- (ATXFaceGalleryBiomeStream)init;
- (ATXFaceGalleryBiomeStream)initWithStoreConfig:(id)a3;
- (NSString)identifier;
- (id)publisherFromStartTime:(double)a3;
- (id)source;
- (void)deleteAllEvents;
@end

@implementation ATXFaceGalleryBiomeStream

- (NSString)identifier
{
  return (NSString *)@"faceGallery";
}

- (ATXFaceGalleryBiomeStream)init
{
  return [(ATXFaceGalleryBiomeStream *)self initWithStoreConfig:0];
}

- (ATXFaceGalleryBiomeStream)initWithStoreConfig:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXFaceGalleryBiomeStream;
  v5 = [(ATXFaceGalleryBiomeStream *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F50278], "atx_storeConfig");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"faceGallery" storeConfig:v6 eventDataClass:objc_opt_class()];
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;
  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)[(BMStoreStream *)self->_inner publisherFromStartTime:a3];
}

- (id)source
{
  return (id)[(BMStoreStream *)self->_inner source];
}

- (void)deleteAllEvents
{
}

uint64_t __44__ATXFaceGalleryBiomeStream_deleteAllEvents__block_invoke()
{
  return 1;
}

- (void).cxx_destruct
{
}

@end