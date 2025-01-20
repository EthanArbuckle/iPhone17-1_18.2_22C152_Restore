@interface AKBringDeviceCloseMicaView
- (AKBringDeviceCloseMicaView)init;
- (AKUIMicaPlayer)micaPlayer;
- (BOOL)arePhonesApart;
- (BOOL)arePhonesTogether;
- (BOOL)didBeginShowingDotCloud;
- (BOOL)shouldshowDotCloud;
- (CALayer)dotCloudLayer;
- (void)AKUIMicaPlayerDidChangePlaybackTime:(id)a3;
- (void)layoutSubviews;
- (void)loadMicaFile;
- (void)setDidBeginShowingDotCloud:(BOOL)a3;
- (void)setDotCloudLayer:(id)a3;
- (void)setMicaPlayer:(id)a3;
- (void)setShouldshowDotCloud:(BOOL)a3;
@end

@implementation AKBringDeviceCloseMicaView

- (AKBringDeviceCloseMicaView)init
{
  v5.receiver = self;
  v5.super_class = (Class)AKBringDeviceCloseMicaView;
  v2 = [(AKBringDeviceCloseMicaView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AKBringDeviceCloseMicaView *)v2 loadMicaFile];
  }
  return v3;
}

- (void)loadMicaFile
{
  v3 = [AKUIMicaPlayer alloc];
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 scale];
  objc_super v5 = -[AKUIMicaPlayer initWithFileName:retinaScale:](v3, "initWithFileName:retinaScale:", @"SignInProximity");
  [(AKBringDeviceCloseMicaView *)self setMicaPlayer:v5];

  v6 = [(AKBringDeviceCloseMicaView *)self micaPlayer];
  v7 = [(AKBringDeviceCloseMicaView *)self layer];
  [v6 addToLayer:v7 onTop:1 gravity:*MEMORY[0x1E4F3A3D8]];

  v8 = [(AKBringDeviceCloseMicaView *)self micaPlayer];
  [v8 play];

  v9 = [(AKBringDeviceCloseMicaView *)self micaPlayer];
  v10 = [v9 publishedLayerWithKey:@"Dot Cloud" required:1];
  [(AKBringDeviceCloseMicaView *)self setDotCloudLayer:v10];

  id v11 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v12 = [v11 CGColor];
  v13 = [(AKBringDeviceCloseMicaView *)self dotCloudLayer];
  [v13 setBackgroundColor:v12];

  id v19 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/AuthKitUI.framework"];
  v14 = (void *)MEMORY[0x1E4F42A80];
  v15 = [v19 pathForResource:@"DotCloud@2x" ofType:@"png"];
  v16 = [v14 imageWithContentsOfFile:v15];
  v17 = [(AKBringDeviceCloseMicaView *)self dotCloudLayer];
  [v17 setContents:v16];

  v18 = [(AKBringDeviceCloseMicaView *)self micaPlayer];
  [v18 setDelegate:self];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)AKBringDeviceCloseMicaView;
  [(AKBringDeviceCloseMicaView *)&v5 layoutSubviews];
  micaPlayer = self->_micaPlayer;
  v4 = [(AKBringDeviceCloseMicaView *)self layer];
  [(AKUIMicaPlayer *)micaPlayer moveAndResizeWithinParentLayer:v4 usingGravity:*MEMORY[0x1E4F3A3D8] animate:0];
}

- (void)AKUIMicaPlayerDidChangePlaybackTime:(id)a3
{
  id v8 = a3;
  if (self->_shouldshowDotCloud)
  {
    if (self->_didBeginShowingDotCloud)
    {
      [(AKUIMicaPlayer *)self->_micaPlayer playbackTime];
      if (v4 >= *(double *)&timeToPauseAfterShowingDotCloud) {
        [(AKUIMicaPlayer *)self->_micaPlayer pause];
      }
    }
    else
    {
      if ([(AKBringDeviceCloseMicaView *)self arePhonesTogether])
      {
        [(AKUIMicaPlayer *)self->_micaPlayer setPlaybackTime:7.0];
        p_opt_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSCoding + 40);
        uint64_t v7 = 0x401F1EB851EB851FLL;
      }
      else
      {
        if (![(AKBringDeviceCloseMicaView *)self arePhonesApart]) {
          goto LABEL_12;
        }
        [(AKUIMicaPlayer *)self->_micaPlayer setPlaybackTime:5.0];
        p_opt_inst_meths = &OBJC_PROTOCOL___NSCoding.opt_inst_meths;
        uint64_t v7 = 0x40171EB851EB851FLL;
      }
      p_opt_inst_meths[259] = (__objc2_meth_list *)v7;
      self->_didBeginShowingDotCloud = 1;
    }
  }
  else
  {
    [(AKUIMicaPlayer *)self->_micaPlayer playbackTime];
    if (v5 >= 4.94999981) {
      [(AKUIMicaPlayer *)self->_micaPlayer setPlaybackTime:0.0];
    }
  }
LABEL_12:
}

- (BOOL)arePhonesTogether
{
  [(AKUIMicaPlayer *)self->_micaPlayer playbackTime];
  BOOL result = 0;
  if (v3 >= 1.5)
  {
    [(AKUIMicaPlayer *)self->_micaPlayer playbackTime];
    if (v4 <= 1.5) {
      return 1;
    }
  }
  return result;
}

- (BOOL)arePhonesApart
{
  [(AKUIMicaPlayer *)self->_micaPlayer playbackTime];
  BOOL result = 0;
  if (v3 >= 5.0)
  {
    [(AKUIMicaPlayer *)self->_micaPlayer playbackTime];
    if (v4 <= 5.78) {
      return 1;
    }
  }
  return result;
}

- (BOOL)shouldshowDotCloud
{
  return self->_shouldshowDotCloud;
}

- (void)setShouldshowDotCloud:(BOOL)a3
{
  self->_shouldshowDotCloud = a3;
}

- (AKUIMicaPlayer)micaPlayer
{
  return self->_micaPlayer;
}

- (void)setMicaPlayer:(id)a3
{
}

- (CALayer)dotCloudLayer
{
  return self->_dotCloudLayer;
}

- (void)setDotCloudLayer:(id)a3
{
}

- (BOOL)didBeginShowingDotCloud
{
  return self->_didBeginShowingDotCloud;
}

- (void)setDidBeginShowingDotCloud:(BOOL)a3
{
  self->_didBeginShowingDotCloud = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotCloudLayer, 0);

  objc_storeStrong((id *)&self->_micaPlayer, 0);
}

@end