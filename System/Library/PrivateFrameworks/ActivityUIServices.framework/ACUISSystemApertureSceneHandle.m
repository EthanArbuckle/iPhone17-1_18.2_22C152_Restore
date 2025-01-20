@interface ACUISSystemApertureSceneHandle
- (ACActivityDescriptor)descriptor;
- (ACUISSystemApertureSceneHandle)initWithActivitySystemApertureSceneHandle:(id)a3;
- (ACUISSystemApertureSceneHandle)initWithDescriptor:(id)a3 metricsRequest:(id)a4;
- (ACUISSystemApertureSceneHandleDelegate)delegate;
- (FBScene)scene;
- (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle)handle;
- (void)activitySystemApertureWithSceneHandle:(id)a3 requestsLaunchWithAction:(id)a4;
- (void)activitySystemApertureWithSceneHandle:(id)a3 updatedContentPayloadID:(id)a4;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setHandle:(id)a3;
@end

@implementation ACUISSystemApertureSceneHandle

- (ACUISSystemApertureSceneHandle)initWithDescriptor:(id)a3 metricsRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle alloc];
  v9 = [v6 _activityMetricsRequest];

  v10 = [(ActivitySystemApertureSceneHandle *)v8 initWithAcActivityDescritor:v7 systemMetricsRequest:v9];
  v11 = [(ACUISSystemApertureSceneHandle *)self initWithActivitySystemApertureSceneHandle:v10];

  return v11;
}

- (ACUISSystemApertureSceneHandle)initWithActivitySystemApertureSceneHandle:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACUISSystemApertureSceneHandle;
  id v6 = [(ACUISSystemApertureSceneHandle *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_handle, a3);
    [(ActivitySystemApertureSceneHandle *)v7->_handle setDelegate:v7];
    uint64_t v8 = [v5 scene];
    scene = v7->_scene;
    v7->_scene = (FBScene *)v8;

    uint64_t v10 = [v5 descriptor];
    descriptor = v7->_descriptor;
    v7->_descriptor = (ACActivityDescriptor *)v10;
  }
  return v7;
}

- (void)invalidate
{
}

- (void)activitySystemApertureWithSceneHandle:(id)a3 requestsLaunchWithAction:(id)a4
{
  id v6 = a4;
  id v5 = [(ACUISSystemApertureSceneHandle *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 activitySystemApertureSceneHandle:self requestsLaunchWithAction:v6];
  }
}

- (void)activitySystemApertureWithSceneHandle:(id)a3 updatedContentPayloadID:(id)a4
{
  id v6 = a4;
  id v5 = [(ACUISSystemApertureSceneHandle *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 activitySystemApertureSceneHandle:self updatedContentPayloadID:v6];
  }
}

- (ACUISSystemApertureSceneHandleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACUISSystemApertureSceneHandleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBScene)scene
{
  return self->_scene;
}

- (ACActivityDescriptor)descriptor
{
  return self->_descriptor;
}

- (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end