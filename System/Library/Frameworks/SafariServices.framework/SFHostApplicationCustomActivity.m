@interface SFHostApplicationCustomActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (SFCustomActivityProxy)activityProxy;
- (SFHostApplicationCustomActivity)initWithActivityProxy:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
@end

@implementation SFHostApplicationCustomActivity

- (SFHostApplicationCustomActivity)initWithActivityProxy:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFHostApplicationCustomActivity;
  v6 = [(UIActivity *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityProxy, a3);
    v8 = v7;
  }

  return v7;
}

- (id)activityType
{
  return [(SFCustomActivityProxy *)self->_activityProxy activityType];
}

- (id)activityTitle
{
  return [(SFCustomActivityProxy *)self->_activityProxy activityTitle];
}

- (id)activityImage
{
  return [(SFCustomActivityProxy *)self->_activityProxy activityImage];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (SFCustomActivityProxy)activityProxy
{
  return self->_activityProxy;
}

- (void).cxx_destruct
{
}

@end