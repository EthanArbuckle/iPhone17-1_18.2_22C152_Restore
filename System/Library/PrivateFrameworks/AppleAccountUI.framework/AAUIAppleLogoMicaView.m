@interface AAUIAppleLogoMicaView
- (AAUIAppleLogoMicaView)init;
- (AAUIMicaPlayer)micaPlayer;
- (void)layoutSubviews;
- (void)loadMicaFile;
- (void)setMicaPlayer:(id)a3;
@end

@implementation AAUIAppleLogoMicaView

- (AAUIAppleLogoMicaView)init
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIAppleLogoMicaView;
  v2 = [(AAUIAppleLogoMicaView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AAUIAppleLogoMicaView *)v2 loadMicaFile];
  }
  return v3;
}

- (void)loadMicaFile
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v3 pathForResource:@"SignInProgress" ofType:@"caar"];

  v4 = [AAUIMicaPlayer alloc];
  objc_super v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 scale];
  v6 = -[AAUIMicaPlayer initWithPath:retinaScale:](v4, "initWithPath:retinaScale:", v10);
  [(AAUIAppleLogoMicaView *)self setMicaPlayer:v6];

  v7 = [(AAUIAppleLogoMicaView *)self micaPlayer];
  v8 = [(AAUIAppleLogoMicaView *)self layer];
  [v7 addToLayer:v8 onTop:1 gravity:*MEMORY[0x263F15E18]];

  v9 = [(AAUIAppleLogoMicaView *)self micaPlayer];
  [v9 pause];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIAppleLogoMicaView;
  [(AAUIAppleLogoMicaView *)&v5 layoutSubviews];
  micaPlayer = self->_micaPlayer;
  v4 = [(AAUIAppleLogoMicaView *)self layer];
  [(AAUIMicaPlayer *)micaPlayer moveAndResizeWithinParentLayer:v4 usingGravity:*MEMORY[0x263F15E18] animate:0];
}

- (AAUIMicaPlayer)micaPlayer
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