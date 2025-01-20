@interface ETTranscriptPluginView
- (ETTranscriptPluginView)init;
- (id)interactiveViews;
- (void)trackInteractiveSubview:(id)a3;
@end

@implementation ETTranscriptPluginView

- (ETTranscriptPluginView)init
{
  v6.receiver = self;
  v6.super_class = (Class)ETTranscriptPluginView;
  v2 = [(ETTranscriptPluginView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(ETTranscriptPluginView *)v2 setUserInteractionEnabled:0];
    [(ETTranscriptPluginView *)v3 setAccessibilityIgnoresInvertColors:1];
    v4 = v3;
  }

  return v3;
}

- (void)trackInteractiveSubview:(id)a3
{
  id v4 = a3;
  interactiveViews = self->_interactiveViews;
  id v8 = v4;
  if (!interactiveViews)
  {
    objc_super v6 = +[NSMutableArray array];
    v7 = self->_interactiveViews;
    self->_interactiveViews = v6;

    id v4 = v8;
    interactiveViews = self->_interactiveViews;
  }
  [(NSMutableArray *)interactiveViews addObject:v4];
}

- (id)interactiveViews
{
  return self->_interactiveViews;
}

- (void).cxx_destruct
{
}

@end