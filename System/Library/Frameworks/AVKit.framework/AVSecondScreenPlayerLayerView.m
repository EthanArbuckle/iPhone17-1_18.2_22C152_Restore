@interface AVSecondScreenPlayerLayerView
+ (Class)layerClass;
- (AVObservationController)observationController;
- (AVPlayerLayer)activeSourcePlayerLayer;
- (void)dealloc;
- (void)setActiveSourcePlayerLayer:(id)a3;
- (void)setObservationController:(id)a3;
- (void)startShowingContentFromSourcePlayerLayer:(id)a3;
- (void)stopShowingContentFromActiveSourcePlayerLayer;
@end

@implementation AVSecondScreenPlayerLayerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);

  objc_destroyWeak((id *)&self->_activeSourcePlayerLayer);
}

- (void)setObservationController:(id)a3
{
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setActiveSourcePlayerLayer:(id)a3
{
}

- (AVPlayerLayer)activeSourcePlayerLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeSourcePlayerLayer);

  return (AVPlayerLayer *)WeakRetained;
}

- (void)stopShowingContentFromActiveSourcePlayerLayer
{
  v3 = [(AVSecondScreenPlayerLayerView *)self observationController];
  [v3 stopAllObservation];

  [(AVSecondScreenPlayerLayerView *)self setObservationController:0];
  v4 = [(AVSecondScreenPlayerLayerView *)self activeSourcePlayerLayer];
  v5 = [(AVSecondScreenPlayerLayerView *)self layer];
  [v4 stopRedirectingVideoToLayer:v5];

  [(AVSecondScreenPlayerLayerView *)self setActiveSourcePlayerLayer:0];
  id v6 = [(AVSecondScreenPlayerLayerView *)self layer];
  [v6 setPlayer:0];
}

- (void)startShowingContentFromSourcePlayerLayer:(id)a3
{
  id v11 = a3;
  v4 = [(AVSecondScreenPlayerLayerView *)self activeSourcePlayerLayer];
  char v5 = [v4 isEqual:v11];

  if ((v5 & 1) == 0)
  {
    [(AVSecondScreenPlayerLayerView *)self stopShowingContentFromActiveSourcePlayerLayer];
    [(AVSecondScreenPlayerLayerView *)self setActiveSourcePlayerLayer:v11];
    id v6 = [(AVSecondScreenPlayerLayerView *)self layer];
    [v11 startRedirectingVideoToLayer:v6 forMode:1];

    v7 = [(AVSecondScreenPlayerLayerView *)self observationController];

    if (!v7)
    {
      v8 = [[AVObservationController alloc] initWithOwner:self];
      [(AVSecondScreenPlayerLayerView *)self setObservationController:v8];

      v9 = [(AVSecondScreenPlayerLayerView *)self observationController];
      id v10 = (id)[v9 startObserving:self keyPath:@"layer.videoRect" includeInitialValue:1 observationHandler:&__block_literal_global_21511];
    }
  }
}

void __74__AVSecondScreenPlayerLayerView_startShowingContentFromSourcePlayerLayer___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"AVSecondScreenConnectionVideoDisplaySizeChanged" object:0];
}

- (void)dealloc
{
  [(AVSecondScreenPlayerLayerView *)self stopShowingContentFromActiveSourcePlayerLayer];
  v3.receiver = self;
  v3.super_class = (Class)AVSecondScreenPlayerLayerView;
  [(AVSecondScreenPlayerLayerView *)&v3 dealloc];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end