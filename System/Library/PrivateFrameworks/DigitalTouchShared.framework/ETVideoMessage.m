@interface ETVideoMessage
+ (unsigned)messageType;
- (BOOL)canCompressTime;
- (BOOL)isAnimated;
- (BOOL)pauseTimeCompression;
- (BOOL)shouldLoopDuringPlayback;
- (ETSketchMessage)introMessage;
- (ETVideoMessage)init;
- (ETVideoMessage)initWithArchiveData:(id)a3;
- (NSArray)playingMessages;
- (NSURL)mediaURL;
- (UIImage)stillImage;
- (double)compressTimeSinceStartOfMessage:(double)a3;
- (double)messageDuration;
- (id)archiveData;
- (id)messageTypeAsString;
- (int)_etpMediaTypeFromETMediaType:(unint64_t)a3;
- (unint64_t)_mediaTypeFromETPVideoType:(int)a3;
- (unint64_t)mediaType;
- (void)setIntroMessage:(id)a3;
- (void)setMediaType:(unint64_t)a3;
- (void)setMediaURL:(id)a3;
- (void)setPauseTimeCompression:(BOOL)a3;
- (void)setPlayingMessages:(id)a3;
- (void)setStillImage:(id)a3;
@end

@implementation ETVideoMessage

- (ETVideoMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)ETVideoMessage;
  v2 = [(ETMessage *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    playingMessages = v2->_playingMessages;
    v2->_playingMessages = (NSMutableArray *)v3;

    v2->_mediaType = 1;
    v5 = v2;
  }

  return v2;
}

+ (unsigned)messageType
{
  return 8;
}

- (ETVideoMessage)initWithArchiveData:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ETVideoMessage;
  v5 = [(ETMessage *)&v34 initWithArchiveData:v4];
  if (v5)
  {
    v6 = [[ETPVideo alloc] initWithData:v4];
    objc_super v7 = [(ETPVideo *)v6 introMessageData];
    uint64_t v8 = +[ETMessage unarchive:v7];
    introMessage = v5->_introMessage;
    v5->_introMessage = (ETSketchMessage *)v8;

    [(ETSketchMessage *)v5->_introMessage setParentMessage:v5];
    [(ETMessage *)v5->_introMessage setDelayWisp:1];
    [(ETSketchMessage *)v5->_introMessage setHideComet:1];
    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v27 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)MEMORY[0x263F08928];
    v15 = [(ETPVideo *)v6 playingMessagesData];
    id v33 = 0;
    v16 = [v14 _strictlyUnarchivedObjectOfClasses:v27 fromData:v15 error:&v33];
    id v28 = v33;

    if (v28 && IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v28;
        _os_log_impl(&dword_23B55A000, v17, OS_LOG_TYPE_INFO, "Error unarchiving ETVideoMessage: %@", buf, 0xCu);
      }
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v30;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = +[ETMessage unarchive:*(void *)(*((void *)&v29 + 1) + 8 * v21)];
          v23 = v22;
          if (v22)
          {
            [v22 setParentMessage:v5];
            [(NSMutableArray *)v5->_playingMessages addObject:v23];
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v19);
    }

    if ([(ETPVideo *)v6 hasMediaType]) {
      uint64_t v24 = [(ETVideoMessage *)v5 _mediaTypeFromETPVideoType:[(ETPVideo *)v6 mediaType]];
    }
    else {
      uint64_t v24 = 1;
    }
    v5->_mediaType = v24;
    v25 = v5;
  }
  return v5;
}

- (unint64_t)_mediaTypeFromETPVideoType:(int)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int)_etpMediaTypeFromETMediaType:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)archiveData
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_alloc_init(ETPVideo);
  introMessage = self->_introMessage;
  if (introMessage)
  {
    v5 = [(ETMessage *)introMessage archive];
    [(ETPVideo *)v3 setIntroMessageData:v5];
  }
  v6 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v7 = self->_playingMessages;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "archive", (void)v16);
        [v6 addObject:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  [(ETPVideo *)v3 setPlayingMessagesData:v13];

  [(ETPVideo *)v3 setMediaType:[(ETVideoMessage *)self _etpMediaTypeFromETMediaType:self->_mediaType]];
  v14 = [(ETPVideo *)v3 data];

  return v14;
}

- (id)messageTypeAsString
{
  return @"Video";
}

- (void)setPlayingMessages:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] arrayWithArray:v4];
  playingMessages = self->_playingMessages;
  self->_playingMessages = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setSupportsPlaybackTimeOffset:", 1, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)setIntroMessage:(id)a3
{
  objc_storeStrong((id *)&self->_introMessage, a3);
  id v4 = a3;
  [v4 setSupportsPlaybackTimeOffset:1];
}

- (BOOL)shouldLoopDuringPlayback
{
  return self->_mediaType == 1;
}

- (NSArray)playingMessages
{
  return (NSArray *)self->_playingMessages;
}

- (BOOL)canCompressTime
{
  return self->_mediaType == 2;
}

- (double)compressTimeSinceStartOfMessage:(double)a3
{
  double v3 = a3 - self->_compressedTimeLastEventTime;
  if (!self->_pauseTimeCompression && v3 > 0.5) {
    self->_compressedTimeTotal = v3 + -0.5 + self->_compressedTimeTotal;
  }
  self->_compressedTimeLastEventTime = a3;
  return a3 - self->_compressedTimeTotal;
}

- (UIImage)stillImage
{
  v29[1] = *MEMORY[0x263EF8340];
  stillImage = self->_stillImage;
  if (!stillImage)
  {
    unint64_t mediaType = self->_mediaType;
    if (mediaType == 1)
    {
      id v10 = objc_alloc(MEMORY[0x263EFA8D0]);
      mediaURL = self->_mediaURL;
      uint64_t v28 = *MEMORY[0x263EFA288];
      v29[0] = MEMORY[0x263EFFA88];
      long long v12 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v7 = (void *)[v10 initWithURL:mediaURL options:v12];

      long long v13 = (void *)[objc_alloc(MEMORY[0x263EFA4B0]) initWithAsset:v7];
      [v13 setAppliesPreferredTrackTransform:1];
      long long v26 = *MEMORY[0x263F010E0];
      long long v21 = v26;
      uint64_t v27 = *(void *)(MEMORY[0x263F010E0] + 16);
      uint64_t v14 = v27;
      [v13 setRequestedTimeToleranceAfter:&v26];
      long long v26 = v21;
      uint64_t v27 = v14;
      [v13 setRequestedTimeToleranceBefore:&v26];
      if (v7) {
        [v7 duration];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      CMTimeMake(&rhs, 1, 30);
      CMTimeSubtract(&v25, &lhs, &rhs);
      id v22 = 0;
      long long v15 = (CGImage *)[v13 copyCGImageAtTime:&v25 actualTime:0 error:&v22];
      id v16 = v22;
      if (!v16)
      {
        uint64_t v17 = (UIImage *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v15];
        long long v18 = self->_stillImage;
        self->_stillImage = v17;
      }
      CGImageRelease(v15);
    }
    else
    {
      if (mediaType != 2)
      {
LABEL_12:
        stillImage = self->_stillImage;
        goto LABEL_13;
      }
      v5 = (void *)MEMORY[0x263EFF8F8];
      v6 = [(NSURL *)self->_mediaURL path];
      id v7 = [v5 dataWithContentsOfFile:v6];

      uint64_t v8 = [MEMORY[0x263F1C6B0] imageWithData:v7];
      uint64_t v9 = self->_stillImage;
      self->_stillImage = v8;
    }
    goto LABEL_12;
  }
LABEL_13:
  long long v19 = stillImage;

  return v19;
}

- (BOOL)isAnimated
{
  return self->_mediaType != 2 || [(NSMutableArray *)self->_playingMessages count] != 0;
}

- (double)messageDuration
{
  if (self->_mediaType != 1)
  {
    id v4 = [(NSMutableArray *)self->_playingMessages lastObject];
    [v4 startDelay];
    double v6 = v5;
    [v4 messageDuration];
    Float64 Seconds = v6 + v7;
LABEL_8:
    self->_messageDuration = Seconds;

    return self->_messageDuration;
  }
  if (self->_messageDuration == 0.0)
  {
    double v3 = [MEMORY[0x263EFA8D0] URLAssetWithURL:self->_mediaURL options:0];
    id v4 = v3;
    if (v3) {
      [v3 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);
    goto LABEL_8;
  }
  return self->_messageDuration;
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (void)setMediaURL:(id)a3
{
}

- (void)setStillImage:(id)a3
{
}

- (ETSketchMessage)introMessage
{
  return self->_introMessage;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_unint64_t mediaType = a3;
}

- (BOOL)pauseTimeCompression
{
  return self->_pauseTimeCompression;
}

- (void)setPauseTimeCompression:(BOOL)a3
{
  self->_pauseTimeCompression = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_introMessage, 0);
  objc_storeStrong((id *)&self->_stillImage, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);

  objc_storeStrong((id *)&self->_playingMessages, 0);
}

@end