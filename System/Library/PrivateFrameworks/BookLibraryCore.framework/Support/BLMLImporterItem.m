@interface BLMLImporterItem
+ (unsigned)mediaTypeForStoreDownload:(id)a3;
- (BLDownloadMetadata)itemMetadata;
- (BLMLImporterItem)init;
- (BOOL)hasItemArtwork;
- (BOOL)isDownloading;
- (NSArray)chapters;
- (NSData)itemArtworkData;
- (NSDictionary)additionalEntityProperties;
- (NSString)itemDownloadIdentifier;
- (NSString)itemMediaPath;
- (double)durationInSeconds;
- (id)_copyChapterVideoTracksForAsset:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)assetType;
- (int64_t)downloadType;
- (int64_t)libraryPersistentIdentifier;
- (int64_t)protectionType;
- (int64_t)updateType;
- (void)loadPropertiesFromMediaPath:(id)a3 includeTracks:(BOOL)a4;
- (void)setAdditionalEntityProperties:(id)a3;
- (void)setAssetType:(int64_t)a3;
- (void)setChapters:(id)a3;
- (void)setDownloadType:(int64_t)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setItemArtworkData:(id)a3;
- (void)setItemDownloadIdentifier:(id)a3;
- (void)setItemMediaPath:(id)a3;
- (void)setItemMetadata:(id)a3;
- (void)setLibraryPersistentIdentifier:(int64_t)a3;
- (void)setProtectionType:(int64_t)a3;
- (void)setUpdateType:(int64_t)a3;
- (void)setValue:(id)a3 forAdditionalEntityProperty:(id)a4;
@end

@implementation BLMLImporterItem

- (BLMLImporterItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLMLImporterItem;
  v2 = [(BLMLImporterItem *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.bookassetd.BLMLImporterItem", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018048;
  block[3] = &unk_1001A17E0;
  id v7 = v5;
  id v11 = v7;
  v12 = self;
  v13 = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  id v8 = v7;

  return v8;
}

+ (unsigned)mediaTypeForStoreDownload:(id)a3
{
  id v3 = a3;
  v4 = [v3 kind];
  id v5 = [v3 podcastType];

  unsigned int v6 = [v5 isEqualToString:BLDownloadPodcastTypeITunesU];
  if ([v4 isEqualToString:BLDownloadKindPodcast])
  {
    BOOL v7 = v6 == 0;
    int v8 = 4;
    int v9 = 32;
  }
  else if ([v4 isEqualToString:BLDownloadKindVideoPodcast])
  {
    BOOL v7 = v6 == 0;
    int v8 = 256;
    int v9 = 4096;
  }
  else
  {
    if ([v4 isEqualToString:BLDownloadKindAudiobook])
    {
      unsigned int v10 = 2;
      goto LABEL_8;
    }
    if ([v4 isEqualToString:BLDownloadKindMovie])
    {
      unsigned int v10 = 2048;
      goto LABEL_8;
    }
    if ([v4 isEqualToString:BLDownloadKindTelevisionEpisode])
    {
      unsigned int v10 = 512;
      goto LABEL_8;
    }
    BOOL v7 = [v4 isEqualToString:BLDownloadKindMusicVideo] == 0;
    int v8 = 8;
    int v9 = 1032;
  }
  if (v7) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = v9;
  }
LABEL_8:

  return v10;
}

- (NSDictionary)additionalEntityProperties
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_10001838C;
  unsigned int v10 = sub_10001839C;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000183A4;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (int64_t)assetType
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001849C;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)chapters
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_10001838C;
  unsigned int v10 = sub_10001839C;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000185A0;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (int64_t)downloadType
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018698;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)durationInSeconds
{
  uint64_t v6 = 0;
  BOOL v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018758;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDownloading
{
  double v3 = [(BLMLImporterItem *)self itemMediaPath];
  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(BLMLImporterItem *)self updateType] == 0;
  }

  return v4;
}

- (BOOL)hasItemArtwork
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018868;
  v5[3] = &unk_1001A1830;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSData)itemArtworkData
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_10001838C;
  unsigned int v10 = sub_10001839C;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001899C;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

- (NSString)itemDownloadIdentifier
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_10001838C;
  unsigned int v10 = sub_10001839C;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018AA0;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)itemMediaPath
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_10001838C;
  unsigned int v10 = sub_10001839C;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018BA4;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (BLDownloadMetadata)itemMetadata
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_10001838C;
  unsigned int v10 = sub_10001839C;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018CA8;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BLDownloadMetadata *)v3;
}

- (int64_t)libraryPersistentIdentifier
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018EA0;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)loadPropertiesFromMediaPath:(id)a3 includeTracks:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)AVURLAsset);
  uint64_t v8 = +[NSURL fileURLWithPath:v6];

  id v9 = [v7 initWithURL:v8 options:0];
  if (v9)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = +[NSArray arrayWithObjects:@"duration", @"tracks", 0];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100019128;
    v26[3] = &unk_1001A0FE8;
    dispatch_semaphore_t v27 = v10;
    v12 = v10;
    [v9 loadValuesAsynchronouslyForKeys:v11 completionHandler:v26];

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    v13 = [v9 tracksWithMediaType:AVMediaTypeVideo];
    if ([v13 count])
    {
      id v14 = [(BLMLImporterItem *)self _copyChapterVideoTracksForAsset:v9];
      id v15 = [v14 count];
      if (v15 >= [v13 count]) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = 2;
      }
    }
    else
    {
      id v14 = [v9 tracksWithMediaType:AVMediaTypeAudio];
      uint64_t v16 = [v14 count] != 0;
    }

    if (v4)
    {
      v17 = +[ML3Track importChaptersByParsingAsset:v9];
    }
    else
    {
      v17 = 0;
    }
    [v9 duration];
    Float64 Seconds = CMTimeGetSeconds(&time);
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019130;
    block[3] = &unk_1001A1858;
    id v22 = v17;
    uint64_t v23 = v16;
    Float64 v24 = Seconds;
    void block[4] = self;
    id v20 = v17;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);
  }
}

- (int64_t)protectionType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100019238;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAdditionalEntityProperties:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000192E4;
  v7[3] = &unk_1001A11A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v7);
}

- (void)setAssetType:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000193B4;
  v4[3] = &unk_1001A1408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setChapters:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019458;
  v7[3] = &unk_1001A11A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)setDownloadType:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019528;
  v4[3] = &unk_1001A1408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setDurationInSeconds:(double)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000195AC;
  v4[3] = &unk_1001A1408;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setItemArtworkData:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019654;
  v7[3] = &unk_1001A11A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v7);
}

- (void)setItemDownloadIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019748;
  v7[3] = &unk_1001A11A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v7);
}

- (void)setItemMediaPath:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001983C;
  v7[3] = &unk_1001A11A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v7);
}

- (void)setItemMetadata:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019930;
  v7[3] = &unk_1001A11A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v7);
}

- (void)setLibraryPersistentIdentifier:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019A00;
  v4[3] = &unk_1001A1408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setProtectionType:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019A80;
  v4[3] = &unk_1001A1408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setUpdateType:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019B00;
  v4[3] = &unk_1001A1408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setValue:(id)a3 forAdditionalEntityProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019BD0;
  block[3] = &unk_1001A10C8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
}

- (int64_t)updateType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100019D04;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_copyChapterVideoTracksForAsset:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [v3 trackReferences];
  uint64_t v6 = [v5 objectForKey:AVAssetChapterListTrackReferencesKey];
  if ((unint64_t)[v6 count] >= 2)
  {
    unint64_t v7 = 1;
    do
    {
      uint64_t v8 = [v6 objectAtIndex:v7];
      uint64_t v9 = objc_msgSend(v3, "trackWithTrackID:", objc_msgSend(v8, "intValue"));
      id v10 = [v9 mediaType];
      unsigned int v11 = [v10 isEqualToString:AVMediaTypeVideo];

      if (v11) {
        [v4 addObject:v9];
      }

      v7 += 2;
    }
    while (v7 < (unint64_t)[v6 count]);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_mediaPath, 0);
  objc_storeStrong((id *)&self->_downloadIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);

  objc_storeStrong((id *)&self->_additionalEntityProperties, 0);
}

@end