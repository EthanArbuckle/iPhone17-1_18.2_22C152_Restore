@interface AEGridOverlayConfiguration
- (AEGridOverlayConfiguration)initWithShowCloudDecoration:(BOOL)a3 showVideoDecoration:(BOOL)a4 showLoopDecoration:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)showCloudDecoration;
- (BOOL)showLoopDecoration;
- (BOOL)showVideoDecoration;
@end

@implementation AEGridOverlayConfiguration

- (BOOL)showLoopDecoration
{
  return self->_showLoopDecoration;
}

- (BOOL)showCloudDecoration
{
  return self->_showCloudDecoration;
}

- (BOOL)showVideoDecoration
{
  return self->_showVideoDecoration;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 showVideoDecoration];
    if (v6 == [(AEGridOverlayConfiguration *)self showVideoDecoration])
    {
      int v8 = [v5 showCloudDecoration];
      int v7 = v8 ^ [(AEGridOverlayConfiguration *)self showCloudDecoration] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (AEGridOverlayConfiguration)initWithShowCloudDecoration:(BOOL)a3 showVideoDecoration:(BOOL)a4 showLoopDecoration:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AEGridOverlayConfiguration;
  result = [(AEGridOverlayConfiguration *)&v9 init];
  if (result)
  {
    result->_showVideoDecoration = a4;
    result->_showCloudDecoration = a3;
    result->_showLoopDecoration = a5;
  }
  return result;
}

@end