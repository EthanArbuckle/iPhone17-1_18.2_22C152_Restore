@interface CKMovieBalloonView
- (AVPlayer)avPlayer;
- (AVPlayerItem)avPlayerItem;
- (AVPlayerLayer)avPlayerLayer;
- (BOOL)isCodecTypeAllowed:(unsigned int)a3;
- (CKMovieMediaObject)mediaObject;
- (id)createAVAssetAndValidateCodec;
- (id)description;
- (void)cleanupPlayerIfNeeded;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setAVPlayer:(id)a3;
- (void)setAVPlayerItem:(id)a3;
- (void)setAVPlayerLayer:(id)a3;
- (void)setMediaObject:(id)a3;
- (void)tapGestureRecognized:(id)a3;
- (void)videoDidReachEnd:(id)a3;
@end

@implementation CKMovieBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)CKMovieBalloonView;
  id v10 = a3;
  [(CKImageBalloonView *)&v11 configureForMediaObject:v10 previewWidth:v7 orientation:v6 hasInvisibleInkEffect:a4];
  -[CKMovieBalloonView setMediaObject:](self, "setMediaObject:", v10, v11.receiver, v11.super_class);
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKMovieBalloonView;
  [(CKImageBalloonView *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKMovieBalloonView;
  objc_super v4 = [(CKImageBalloonView *)&v8 description];
  v5 = [(CKMovieBalloonView *)self mediaObject];
  BOOL v6 = [v3 stringWithFormat:@"%@ mediaObject: %@", v4, v5];

  return v6;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKMovieBalloonView;
  [(CKImageBalloonView *)&v4 layoutSubviews];
  v3 = [(CKMovieBalloonView *)self avPlayerLayer];
  [(CKMovieBalloonView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKMovieBalloonView;
  [(CKImageBalloonView *)&v3 prepareForReuse];
  [(CKMovieBalloonView *)self cleanupPlayerIfNeeded];
}

- (void)prepareForDisplay
{
  v8.receiver = self;
  v8.super_class = (Class)CKMovieBalloonView;
  [(CKImageBalloonView *)&v8 prepareForDisplay];
  objc_super v3 = [(CKMovieBalloonView *)self avPlayerLayer];
  if (v3)
  {
    objc_super v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v5 = [v4 isScheduledMessagesCoreEnabled];

    BOOL v6 = [(CKMovieBalloonView *)self layer];
    uint64_t v7 = v6;
    if (v5) {
      [v6 addSublayer:v3];
    }
    else {
      [v6 insertSublayer:v3 atIndex:0];
    }
  }
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  int v5 = [(CKMovieBalloonView *)self avPlayerLayer];
  if (v5)
  {
    [(CKMovieBalloonView *)self cleanupPlayerIfNeeded];
    BOOL v6 = [(CKBalloonView *)self delegate];
    uint64_t v7 = [(CKMovieBalloonView *)self mediaObject];
    [v6 balloonView:self mediaObjectDidFinishPlaying:v7];
  }
  else
  {
    objc_super v8 = +[CKUIBehavior sharedBehaviors];
    BOOL v6 = [v8 playButtonImage];

    [(CKMovieBalloonView *)self bounds];
    -[CKMovieBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [v6 size];
    double v18 = v17;
    double v20 = v19;
    if (CKMainScreenScale_once_52 != -1) {
      dispatch_once(&CKMainScreenScale_once_52, &__block_literal_global_133);
    }
    if (*(double *)&CKMainScreenScale_sMainScreenScale_52 == 0.0) {
      double v21 = 1.0;
    }
    else {
      double v21 = *(double *)&CKMainScreenScale_sMainScreenScale_52;
    }
    uint64_t v7 = [(CKMovieBalloonView *)self createAVAssetAndValidateCodec];
    if (!v7 && IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "CKMovieBalloonView: Failed to create AVAsset and/or validate codec", buf, 2u);
      }
    }
    BOOL v23 = [(CKObscurableBalloonView *)self isObscured];
    v24 = +[CKUIBehavior sharedBehaviors];
    int v25 = [v24 playsInlineVideo];

    if (v7
      && !v23
      && v25
      && ([v4 locationInView:self],
          v44.x = v26,
          v44.y = v27,
          v45.origin.x = 1.0 / v21 * (v10 * v21 + floor((v14 * v21 - v18 * v21) * 0.5)),
          v45.origin.y = 1.0 / v21 * (v12 * v21 + floor((v16 * v21 - v20 * v21) * 0.5)),
          v45.size.width = v18 * v21 * (1.0 / v21),
          v45.size.height = v20 * v21 * (1.0 / v21),
          CGRectContainsPoint(v45, v44)))
    {
      v28 = [MEMORY[0x1E4F16620] playerItemWithAsset:v7];
      [(CKMovieBalloonView *)self setAVPlayerItem:v28];
      v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v29 addObserver:self selector:sel_videoDidReachEnd_ name:*MEMORY[0x1E4F16020] object:v28];

      v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v30 addObserver:self selector:sel_videoDidReachEnd_ name:*MEMORY[0x1E4F16030] object:v28];

      v31 = [MEMORY[0x1E4F16608] playerWithPlayerItem:v28];
      [(CKMovieBalloonView *)self setAVPlayer:v31];
      v32 = [MEMORY[0x1E4F16650] playerLayerWithPlayer:v31];
      [v32 setVideoGravity:*MEMORY[0x1E4F15AF8]];
      [(CKMovieBalloonView *)self bounds];
      objc_msgSend(v32, "setFrame:");
      [(CKMovieBalloonView *)self setAVPlayerLayer:v32];
      v33 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v34 = [v33 isScheduledMessagesCoreEnabled];

      v35 = [(CKMovieBalloonView *)self layer];
      v36 = v35;
      if (v34) {
        [v35 addSublayer:v32];
      }
      else {
        [v35 insertSublayer:v32 atIndex:0];
      }

      v37 = [(CKBalloonView *)self invisibleInkEffectController];
      [v37 setSuspended:1];

      v38 = +[CKAudioSessionController shareInstance];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __43__CKMovieBalloonView_tapGestureRecognized___block_invoke;
      v41[3] = &unk_1E5620C40;
      id v42 = v31;
      id v39 = v31;
      [v38 activateWithOptions:1 completion:v41];
    }
    else
    {
      v40.receiver = self;
      v40.super_class = (Class)CKMovieBalloonView;
      [(CKImageBalloonView *)&v40 tapGestureRecognized:v4];
    }
  }
}

uint64_t __43__CKMovieBalloonView_tapGestureRecognized___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) play];
}

- (BOOL)isCodecTypeAllowed:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v11 = 67109888;
      unsigned int v12 = HIBYTE(a3);
      __int16 v13 = 1024;
      int v14 = BYTE2(a3);
      __int16 v15 = 1024;
      int v16 = BYTE1(a3);
      __int16 v17 = 1024;
      int v18 = a3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Validating Video CodecType: '%c%c%c%c'", (uint8_t *)&v11, 0x1Au);
    }
  }
  if (a3 == 1748121139)
  {
    BOOL v5 = 1;
LABEL_11:
    if (IMOSLoggingEnabled())
    {
      objc_super v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 67109888;
        unsigned int v12 = HIBYTE(a3);
        __int16 v13 = 1024;
        int v14 = BYTE2(a3);
        __int16 v15 = 1024;
        int v16 = BYTE1(a3);
        __int16 v17 = 1024;
        int v18 = a3;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Video CodecType '%c%c%c%c' is allowed", (uint8_t *)&v11, 0x1Au);
      }
    }
  }
  else
  {
    uint64_t v6 = 1;
    while (v6 != 6)
    {
      int v7 = isCodecTypeAllowed__allowableCodecTypes[v6++];
      if (v7 == a3)
      {
        BOOL v5 = (unint64_t)(v6 - 2) < 5;
        goto LABEL_11;
      }
    }
    if (IMOSLoggingEnabled())
    {
      double v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 67109888;
        unsigned int v12 = HIBYTE(a3);
        __int16 v13 = 1024;
        int v14 = BYTE2(a3);
        __int16 v15 = 1024;
        int v16 = BYTE1(a3);
        __int16 v17 = 1024;
        int v18 = a3;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "CKMovieBalloonView: Video CodecType '%c%c%c%c' is not allowed", (uint8_t *)&v11, 0x1Au);
      }
    }
    return 0;
  }
  return v5;
}

- (id)createAVAssetAndValidateCodec
{
  v39[1] = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Creating AVAsset…", buf, 2u);
    }
  }
  v39[0] = *MEMORY[0x1E4F15AB0];
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  id v4 = [(CKMovieBalloonView *)self mediaObject];
  v31 = [v4 fileURL];

  BOOL v5 = CKAVURLAssetForURLWithAllowableTypeCategories(v31, v29);
  v28 = [v31 pathExtension];
  v30 = [v5 tracks];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v28;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Validating FileType: %@", buf, 0xCu);
    }
  }
  BOOL v7 = [v30 count] == 0;
  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      int v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "CKMovieBalloonView: Unsupported FileType: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v8)
    {
      double v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Supported FileType: %@", buf, 0xCu);
      }
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v30;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      uint64_t v13 = *MEMORY[0x1E4F15C18];
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v10);
          }
          __int16 v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ([v15 isEnabled])
          {
            int v16 = [v15 mediaType];
            int v17 = [v16 isEqual:v13];

            if (v17)
            {
              uint64_t v19 = [v15 formatDescriptions];
              uint64_t v20 = [v19 count];
              if (v20)
              {
                uint64_t v21 = 0;
                while (1)
                {
                  v22 = [v19 objectAtIndexedSubscript:v21];

                  if (![(CKMovieBalloonView *)self isCodecTypeAllowed:CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v22)])break; {
                  if (v20 == ++v21)
                  }
                    goto LABEL_34;
                }
                BOOL v23 = [MEMORY[0x1E4F28F80] processInfo];
                v24 = [v23 processName];
                IMLogSimulateCrashForProcess();

                BOOL v5 = 0;
              }
LABEL_34:

              goto LABEL_35;
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_35:
  }
  int v25 = IMOSLoggingEnabled();
  if (v5)
  {
    if (!v25) {
      goto LABEL_45;
    }
    CGFloat v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Succesfully created AVAsset", buf, 2u);
    }
  }
  else
  {
    if (!v25) {
      goto LABEL_45;
    }
    CGFloat v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "CKMovieBalloonView: Failed to create AVAsset", buf, 2u);
    }
  }

LABEL_45:

  return v5;
}

- (void)videoDidReachEnd:(id)a3
{
  [(CKMovieBalloonView *)self cleanupPlayerIfNeeded];
  id v5 = [(CKBalloonView *)self delegate];
  id v4 = [(CKMovieBalloonView *)self mediaObject];
  [v5 balloonView:self mediaObjectDidFinishPlaying:v4];
}

- (void)cleanupPlayerIfNeeded
{
  id v8 = [(CKMovieBalloonView *)self avPlayerItem];
  if (v8)
  {
    objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4F16020] object:v8];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4F16030] object:v8];

    id v5 = [(CKMovieBalloonView *)self avPlayerLayer];
    [v5 removeFromSuperlayer];
    [(CKMovieBalloonView *)self setAVPlayerItem:0];
    [(CKMovieBalloonView *)self setAVPlayer:0];
    [(CKMovieBalloonView *)self setAVPlayerLayer:0];
    uint64_t v6 = [(CKBalloonView *)self invisibleInkEffectController];
    [v6 setSuspended:0];

    BOOL v7 = +[CKAudioSessionController shareInstance];
    [v7 deactivate];
  }
}

- (CKMovieMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
}

- (AVPlayerItem)avPlayerItem
{
  return self->_avPlayerItem;
}

- (void)setAVPlayerItem:(id)a3
{
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAVPlayer:(id)a3
{
}

- (AVPlayerLayer)avPlayerLayer
{
  return self->_avPlayerLayer;
}

- (void)setAVPlayerLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avPlayerLayer, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_avPlayerItem, 0);

  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end