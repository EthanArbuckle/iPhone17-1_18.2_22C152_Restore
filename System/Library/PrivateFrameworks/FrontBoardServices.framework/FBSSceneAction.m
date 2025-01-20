@interface FBSSceneAction
- (FBSScene)scene;
- (FBSSerialQueue)callOutQueue;
- (void)setCallOutQueue:(id)a3;
- (void)setScene:(id)a3;
@end

@implementation FBSSceneAction

- (FBSScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (FBSSerialQueue)callOutQueue
{
  return self->_callOutQueue;
}

- (void)setCallOutQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);

  objc_storeStrong((id *)&self->_scene, 0);
}

@end