@interface AKAppleLogoMicaView
- (AKAppleLogoMicaView)init;
- (AKUIMicaPlayer)micaPlayer;
- (void)layoutSubviews;
- (void)loadMicaFile;
- (void)setMicaPlayer:(id)a3;
@end

@implementation AKAppleLogoMicaView

- (AKAppleLogoMicaView)init
{
  v5.receiver = self;
  v5.super_class = (Class)AKAppleLogoMicaView;
  v2 = [(AKAppleLogoMicaView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AKAppleLogoMicaView *)v2 loadMicaFile];
  }
  return v3;
}

- (void)loadMicaFile
{
  v3 = [AKUIMicaPlayer alloc];
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 scale];
  objc_super v5 = -[AKUIMicaPlayer initWithFileName:retinaScale:](v3, "initWithFileName:retinaScale:", @"SignInProgress");
  [(AKAppleLogoMicaView *)self setMicaPlayer:v5];

  v6 = [(AKAppleLogoMicaView *)self micaPlayer];
  v7 = [(AKAppleLogoMicaView *)self layer];
  [v6 addToLayer:v7 onTop:1 gravity:*MEMORY[0x1E4F3A3D8]];

  id v8 = [(AKAppleLogoMicaView *)self micaPlayer];
  [v8 pause];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)AKAppleLogoMicaView;
  [(AKAppleLogoMicaView *)&v5 layoutSubviews];
  micaPlayer = self->_micaPlayer;
  v4 = [(AKAppleLogoMicaView *)self layer];
  [(AKUIMicaPlayer *)micaPlayer moveAndResizeWithinParentLayer:v4 usingGravity:*MEMORY[0x1E4F3A3D8] animate:0];
}

- (AKUIMicaPlayer)micaPlayer
{
  return self->_micaPlayer;
}

- (void)setMicaPlayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end