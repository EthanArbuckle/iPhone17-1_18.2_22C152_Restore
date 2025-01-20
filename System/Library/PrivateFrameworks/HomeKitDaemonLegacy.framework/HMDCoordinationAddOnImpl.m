@interface HMDCoordinationAddOnImpl
- (HMDCoordinationAddOnImplDelegate)delegate;
- (void)didChangeNodesForMeshController:(id)a3;
- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HMDCoordinationAddOnImpl

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (HMDCoordinationAddOnImplDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCoordinationAddOnImplDelegate *)WeakRetained;
}

- (void)didChangeNodesForMeshController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDCoordinationAddOnImpl;
  [(COMeshAddOn *)&v5 didChangeNodesForMeshController:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained meshControllerDidUpdatesNodes];
}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HMDCoordinationAddOnImpl;
  -[COMeshAddOn meshController:didTransitionToState:](&v8, sel_meshController_didTransitionToState_, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (a4 == 2)
  {
    [WeakRetained meshControllerDidStartElection];
  }
  else if (a4 == 3)
  {
    [WeakRetained meshControllerDidElectLeader];
  }
}

@end