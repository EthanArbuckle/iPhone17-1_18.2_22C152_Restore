@interface MTRDevicePairingDelegateShim
- (BOOL)respondsToSelector:(SEL)a3;
- (MTRDevicePairingDelegate)delegate;
- (MTRDevicePairingDelegateShim)initWithDelegate:(id)a3;
- (void)controller:(id)a3 commissioningComplete:(id)a4;
- (void)controller:(id)a3 commissioningSessionEstablishmentDone:(id)a4;
- (void)controller:(id)a3 statusUpdate:(int64_t)a4;
- (void)onPairingDeleted:(id)a3;
@end

@implementation MTRDevicePairingDelegateShim

- (MTRDevicePairingDelegateShim)initWithDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTRDevicePairingDelegateShim;
  v6 = [(MTRDevicePairingDelegateShim *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_controller_statusUpdate_ == a3
    || sel_controller_commissioningSessionEstablishmentDone_ == a3
    || sel_controller_commissioningComplete_ == a3)
  {
    v4 = objc_msgSend_delegate(self, a2, (uint64_t)a3);
    unsigned __int8 v3 = objc_opt_respondsToSelector();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MTRDevicePairingDelegateShim;
    unsigned __int8 v3 = -[MTRDevicePairingDelegateShim respondsToSelector:](&v6, sel_respondsToSelector_);
  }
  return v3 & 1;
}

- (void)controller:(id)a3 statusUpdate:(int64_t)a4
{
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_onStatusUpdate_(v6, v5, a4);
}

- (void)controller:(id)a3 commissioningSessionEstablishmentDone:(id)a4
{
  id v9 = a4;
  v7 = objc_msgSend_delegate(self, v5, v6);
  objc_msgSend_onPairingComplete_(v7, v8, (uint64_t)v9);
}

- (void)controller:(id)a3 commissioningComplete:(id)a4
{
  id v9 = a4;
  v7 = objc_msgSend_delegate(self, v5, v6);
  objc_msgSend_onCommissioningComplete_(v7, v8, (uint64_t)v9);
}

- (void)onPairingDeleted:(id)a3
{
  id v8 = a3;
  uint64_t v6 = objc_msgSend_delegate(self, v4, v5);
  objc_msgSend_onPairingDeleted_(v6, v7, (uint64_t)v8);
}

- (MTRDevicePairingDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
}

@end