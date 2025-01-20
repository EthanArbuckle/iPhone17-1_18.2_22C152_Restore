@interface PKMovieView
+ (Class)layerClass;
- (id)initWithURL:(id *)a1;
- (void)_playbackEnded;
- (void)didMoveToWindow;
@end

@implementation PKMovieView

- (id)initWithURL:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)PKMovieView;
    a1 = (id *)objc_msgSendSuper2(&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (a1)
    {
      uint64_t v4 = [MEMORY[0x1E4F16608] playerWithURL:v3];
      id v5 = a1[51];
      a1[51] = (id)v4;

      [a1[51] setRate:0.0];
      [a1[51] setAllowsExternalPlayback:0];
      v6 = [a1 layer];
      [v6 setVideoGravity:*MEMORY[0x1E4F15AF0]];
      [v6 setPlayer:a1[51]];
    }
  }

  return a1;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)didMoveToWindow
{
  v9.receiver = self;
  v9.super_class = (Class)PKMovieView;
  [(PKMovieView *)&v9 didMoveToWindow];
  id v3 = [(PKMovieView *)self window];

  LODWORD(v4) = 1.0;
  if (!v3) {
    *(float *)&double v4 = 0.0;
  }
  [(AVPlayer *)self->_moviePlayer setRate:v4];
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F153E0] sharedInstance];
    [v5 setCategory:*MEMORY[0x1E4F14F68] error:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4F16020];
    objc_super v8 = [(AVPlayer *)self->_moviePlayer currentItem];
    [v6 addObserver:self selector:sel__playbackEnded name:v7 object:v8];
  }
}

- (void)_playbackEnded
{
  moviePlayer = self->_moviePlayer;
  long long v5 = *MEMORY[0x1E4F1FA48];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [(AVPlayer *)moviePlayer seekToTime:&v5];
  LODWORD(v4) = 1.0;
  [(AVPlayer *)self->_moviePlayer setRate:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieLayer, 0);

  objc_storeStrong((id *)&self->_moviePlayer, 0);
}

@end