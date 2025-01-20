@interface COMeshAddOn
- (COMeshAddOn)init;
- (COMeshController)meshController;
- (OS_dispatch_queue)meshControllerQueue;
- (void)didAddToMeshController:(id)a3;
- (void)didChangeNodesForMeshController:(id)a3;
- (void)didRemoveFromMeshController:(id)a3;
- (void)didStartMeshController:(id)a3;
- (void)didStopMeshController:(id)a3;
- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)meshController:(id)a3 willTransitionToState:(unint64_t)a4;
- (void)setMeshController:(id)a3;
- (void)setMeshControllerQueue:(id)a3;
- (void)willStartMeshController:(id)a3;
- (void)willStopMeshController:(id)a3;
@end

@implementation COMeshAddOn

- (COMeshAddOn)init
{
  v5.receiver = self;
  v5.super_class = (Class)COMeshAddOn;
  v2 = [(COMeshAddOn *)&v5 init];
  v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_meshControllerQueue, MEMORY[0x263EF83A0]);
  }
  return v3;
}

- (void)didAddToMeshController:(id)a3
{
  id v4 = a3;
  [(COMeshAddOn *)self setMeshController:v4];
  id v5 = [v4 dispatchQueue];

  [(COMeshAddOn *)self setMeshControllerQueue:v5];
}

- (void)didRemoveFromMeshController:(id)a3
{
}

- (void)willStartMeshController:(id)a3
{
  v3 = [a3 dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)didStartMeshController:(id)a3
{
  v3 = [a3 dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)willStopMeshController:(id)a3
{
  v3 = [a3 dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)didStopMeshController:(id)a3
{
  v3 = [a3 dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)meshController:(id)a3 willTransitionToState:(unint64_t)a4
{
  id v4 = [a3 dispatchQueue];
  dispatch_assert_queue_V2(v4);
}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  id v4 = [a3 dispatchQueue];
  dispatch_assert_queue_V2(v4);
}

- (void)didChangeNodesForMeshController:(id)a3
{
  v3 = [a3 dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (COMeshController)meshController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_meshController);
  return (COMeshController *)WeakRetained;
}

- (void)setMeshController:(id)a3
{
}

- (OS_dispatch_queue)meshControllerQueue
{
  return self->_meshControllerQueue;
}

- (void)setMeshControllerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meshControllerQueue, 0);
  objc_destroyWeak((id *)&self->_meshController);
}

@end