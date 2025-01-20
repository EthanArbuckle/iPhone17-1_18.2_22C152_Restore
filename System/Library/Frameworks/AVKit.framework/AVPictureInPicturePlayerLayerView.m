@interface AVPictureInPicturePlayerLayerView
- (AVPlayerLayer)playerLayer;
- (void)attachPlayerLayer;
- (void)detachPlayerLayer;
@end

@implementation AVPictureInPicturePlayerLayerView

- (void).cxx_destruct
{
}

- (void)detachPlayerLayer
{
  if (self->_simplePlayerLayerView)
  {
    [(AVPictureInPicturePlayerLayerView *)self willChangeValueForKey:@"playerLayer"];
    [(_AVSimplePlayerLayerView *)self->_simplePlayerLayerView removeFromSuperview];
    simplePlayerLayerView = self->_simplePlayerLayerView;
    self->_simplePlayerLayerView = 0;

    [(AVPictureInPicturePlayerLayerView *)self didChangeValueForKey:@"playerLayer"];
  }
}

- (void)attachPlayerLayer
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (!self->_simplePlayerLayerView)
  {
    [(AVPictureInPicturePlayerLayerView *)self willChangeValueForKey:@"playerLayer"];
    v3 = [_AVSimplePlayerLayerView alloc];
    [(AVPictureInPicturePlayerLayerView *)self bounds];
    v4 = -[_AVSimplePlayerLayerView initWithFrame:](v3, "initWithFrame:");
    simplePlayerLayerView = self->_simplePlayerLayerView;
    self->_simplePlayerLayerView = v4;

    [(_AVSimplePlayerLayerView *)self->_simplePlayerLayerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AVPictureInPicturePlayerLayerView *)self addSubview:self->_simplePlayerLayerView];
    v6 = (void *)MEMORY[0x1E4F28DC8];
    v7 = self->_simplePlayerLayerView;
    v16 = @"simplePlayerLayerView";
    v17[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v9 = [v6 constraintsWithVisualFormat:@"H:|[simplePlayerLayerView]|" options:0 metrics:0 views:v8];
    [v6 activateConstraints:v9];

    v10 = (void *)MEMORY[0x1E4F28DC8];
    v11 = self->_simplePlayerLayerView;
    v14 = @"simplePlayerLayerView";
    v15 = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v13 = [v10 constraintsWithVisualFormat:@"V:|[simplePlayerLayerView]|" options:0 metrics:0 views:v12];
    [v10 activateConstraints:v13];

    [(AVPictureInPicturePlayerLayerView *)self didChangeValueForKey:@"playerLayer"];
  }
}

- (AVPlayerLayer)playerLayer
{
  return [(_AVSimplePlayerLayerView *)self->_simplePlayerLayerView playerLayer];
}

@end