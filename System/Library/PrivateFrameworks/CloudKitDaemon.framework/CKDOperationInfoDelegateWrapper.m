@interface CKDOperationInfoDelegateWrapper
- (CKDOperationInfoDelegate)delegate;
- (CKDOperationInfoDelegateWrapper)initWithDelegate:(id)a3;
- (NSString)personaID;
- (void)performWithDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPersonaID:(id)a3;
@end

@implementation CKDOperationInfoDelegateWrapper

- (CKDOperationInfoDelegateWrapper)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKDOperationInfoDelegateWrapper;
  v5 = [(CKDOperationInfoDelegateWrapper *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = CKCurrentPersonaID();
    personaID = v6->_personaID;
    v6->_personaID = (NSString *)v7;
  }
  return v6;
}

- (void)performWithDelegate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4F60DE0;
  v6[3] = &unk_1E64F0E18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  CKMuckingWithPersonas(v6);
}

- (CKDOperationInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CKDOperationInfoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end