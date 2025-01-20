@interface AVCMediaStreamNegotiatorSettingsRemoteCamera
+ (BOOL)isOfferSupported;
- (AVCMediaStreamNegotiatorSettingsRemoteCamera)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5;
- (int)operatingMode;
- (int64_t)captureSource;
- (int64_t)videoStreamMode;
- (unint64_t)maxBandwidth;
- (unint64_t)minBandwidth;
- (unsigned)featureListStringType;
@end

@implementation AVCMediaStreamNegotiatorSettingsRemoteCamera

+ (BOOL)isOfferSupported
{
  return +[VCHardwareSettings isRemoteCameraSenderSupported];
}

- (AVCMediaStreamNegotiatorSettingsRemoteCamera)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)AVCMediaStreamNegotiatorSettingsRemoteCamera;
  v8 = [(AVCMediaStreamNegotiatorSettings *)&v17 init];
  if (v8)
  {
    v9 = +[VCVideoRuleCollectionsRemoteCamera sharedInstance];
    v8->super._videoRuleCollections = &v9->super;
    if (v9)
    {
      v8->super._tilesPerFrame = +[VCVideoRuleCollectionsRemoteCamera tilesPerFrame];
      if (v6 == 2
        || v6 == 1
        && +[AVCMediaStreamNegotiatorSettingsRemoteCamera isOfferSupported])
      {
        if (a3
          && objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCMediaStreamNegotiatorRemoteCameraDisparityFormat"), "BOOLValue"))
        {
          v8->_isDisparityPixelFormat = 1;
        }
        uint64_t v10 = 2;
        if (v6 == 1) {
          uint64_t v10 = 3;
        }
        v8->_captureSource = v10;
        uint64_t v11 = 1;
        if (v6 != 1) {
          uint64_t v11 = 2;
        }
        v8->super._mediaStreamDirection = v11;
        unint64_t v12 = +[AVCMediaStreamNegotiatorSettings hdrModeWithNegotiatorInitOptions:a3];
        if (v12 > 1)
        {
          v15 = @"HDR mode is not supported";
        }
        else
        {
          if (v12 != 1) {
            return v8;
          }
          uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", &unk_1F3DC4C08, &unk_1F3DC4C20, 0);
          v8->super._hdrModesSupported = (NSMutableSet *)v13;
          if (v13)
          {
            uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", &unk_1F3DC4C38, 0);
            v8->super._hdrModePixelFormats = (NSArray *)v14;
            if (v14) {
              return v8;
            }
            v15 = @"Failed to create _hdrModePixelFormats";
          }
          else
          {
            v15 = @"Failed to create _hdrModesSupported";
          }
        }
      }
      else
      {
        v15 = @"Hardware does not support offerer device role";
      }
    }
    else
    {
      v15 = @"no _videoRuleCollections is created";
    }
    if (a5) {
      *a5 = v15;
    }

    return 0;
  }
  return v8;
}

- (int64_t)videoStreamMode
{
  return 3;
}

- (int64_t)captureSource
{
  return self->_captureSource;
}

- (int)operatingMode
{
  return 10;
}

- (unint64_t)minBandwidth
{
  if (self->_isDisparityPixelFormat) {
    return 500000;
  }
  else {
    return 5000000;
  }
}

- (unint64_t)maxBandwidth
{
  return 20000000;
}

- (unsigned)featureListStringType
{
  return 5;
}

@end