@interface ASOServiceOverlay
- (ASCViewMetrics)viewMetrics;
- (ASOServiceOverlay)initWithContentView:(id)a3 containerConfiguration:(id)a4;
- (ASOServiceOverlayContainerConfiguration)containerConfiguration;
- (ASOServiceOverlayContentView)contentView;
- (void)setContainerConfiguration:(id)a3;
- (void)setContentView:(id)a3;
@end

@implementation ASOServiceOverlay

- (ASOServiceOverlay)initWithContentView:(id)a3 containerConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASOServiceOverlay;
  v9 = [(ASOServiceOverlay *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentView, a3);
    objc_storeStrong((id *)&v10->_containerConfiguration, a4);
  }

  return v10;
}

- (ASCViewMetrics)viewMetrics
{
  v3 = [(ASOServiceOverlay *)self contentView];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___ASOServiceOverlayMetricsProvider];

  if (v4)
  {
    v5 = [(ASOServiceOverlay *)self contentView];
    v6 = [v5 viewMetrics];
  }
  else
  {
    v6 = 0;
  }

  return (ASCViewMetrics *)v6;
}

- (ASOServiceOverlayContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (ASOServiceOverlayContainerConfiguration)containerConfiguration
{
  return self->_containerConfiguration;
}

- (void)setContainerConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerConfiguration, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end