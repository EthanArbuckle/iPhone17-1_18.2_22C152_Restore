@interface MPVolumeViewController
- (CGSize)preferredContentSize;
- (MPVolumeView)volumeView;
- (MPVolumeViewController)init;
- (void)viewDidLoad;
@end

@implementation MPVolumeViewController

- (void).cxx_destruct
{
}

- (MPVolumeView)volumeView
{
  return self->_volumeView;
}

- (CGSize)preferredContentSize
{
  double v2 = 44.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)viewDidLoad
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)MPVolumeViewController;
  [(MPVolumeViewController *)&v9 viewDidLoad];
  double v3 = [(MPVolumeViewController *)self view];
  [(MPVolumeView *)self->_volumeView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_volumeView];
  v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_volumeView attribute:7 relatedBy:0 toItem:v3 attribute:7 multiplier:1.0 constant:-31.0];
  v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_volumeView attribute:8 relatedBy:0 toItem:v3 attribute:8 multiplier:1.0 constant:0.0];
  v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_volumeView attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
  v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_volumeView attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:10.0];
  v10[0] = v4;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  [v3 addConstraints:v8];
}

- (MPVolumeViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MPVolumeViewController;
  double v2 = [(MPVolumeViewController *)&v7 init];
  if (v2)
  {
    double v3 = [MPVolumeView alloc];
    uint64_t v4 = -[MPVolumeView initWithFrame:style:](v3, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    volumeView = v2->_volumeView;
    v2->_volumeView = (MPVolumeView *)v4;
  }
  return v2;
}

@end