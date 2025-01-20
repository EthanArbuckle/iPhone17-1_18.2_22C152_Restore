@interface HUIncomingInvitationResponseController
- (HMIncomingHomeInvitation)invitation;
- (HUIncomingInvitationResponseController)init;
- (HUIncomingInvitationResponseController)initWithDelegate:(id)a3 invitation:(id)a4;
- (HUIncomingInvitationResponseControllerDelegate)delegate;
- (NSError)error;
- (id)_acceptInvitation;
- (id)_declineInvitation;
- (id)_ignoreInvitation;
- (id)_reportJunk;
- (unint64_t)response;
- (unint64_t)state;
- (void)respondToInvitationWithResponse:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setResponse:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation HUIncomingInvitationResponseController

- (HUIncomingInvitationResponseController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithDelegate_invitation_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUIncomingInvitationResponseController.m", 40, @"%s is unavailable; use %@ instead",
    "-[HUIncomingInvitationResponseController init]",
    v5);

  return 0;
}

- (HUIncomingInvitationResponseController)initWithDelegate:(id)a3 invitation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUIncomingInvitationResponseController;
  v8 = [(HUIncomingInvitationResponseController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_invitation, a4);
  }

  return v9;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = [(HUIncomingInvitationResponseController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(HUIncomingInvitationResponseController *)self delegate];
      [v7 invitationResponseController:self stateDidChange:a3];
    }
  }
}

- (void)respondToInvitationWithResponse:(unint64_t)a3
{
  if ([(HUIncomingInvitationResponseController *)self state])
  {
    NSLog(&cfstr_RespondingTwic.isa);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke;
    v10[3] = &unk_1E638B820;
    v10[4] = self;
    v10[5] = a3;
    v5 = __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke((uint64_t)v10);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke_2;
    v9[3] = &unk_1E6387DC8;
    v9[4] = self;
    char v6 = [v5 addSuccessBlock:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke_3;
    v8[3] = &unk_1E6386978;
    v8[4] = self;
    v8[5] = a3;
    id v7 = (id)[v6 addFailureBlock:v8];
  }
}

id __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setResponse:*(void *)(a1 + 40)];
  switch(*(void *)(a1 + 40))
  {
    case 0:
      uint64_t v2 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
      goto LABEL_8;
    case 1:
      uint64_t v2 = [*(id *)(a1 + 32) _acceptInvitation];
      goto LABEL_8;
    case 2:
      uint64_t v2 = [*(id *)(a1 + 32) _declineInvitation];
      goto LABEL_8;
    case 3:
      uint64_t v2 = [*(id *)(a1 + 32) _ignoreInvitation];
      goto LABEL_8;
    case 4:
      uint64_t v2 = [*(id *)(a1 + 32) _reportJunk];
LABEL_8:
      char v6 = (void *)v2;
      break;
    default:
      v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
      NSLog(&cfstr_UnknownRespons.isa, v3);

      v4 = (void *)MEMORY[0x1E4F7A0D8];
      v5 = objc_msgSend(MEMORY[0x1E4F28C58], "na_genericError");
      char v6 = [v4 futureWithError:v5];

      break;
  }

  return v6;
}

uint64_t __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:2];
}

void __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ((unint64_t)(*(void *)(a1 + 40) - 1) > 3) {
    id v3 = 0;
  }
  else {
    id v3 = (id)*MEMORY[0x1E4F68810];
  }
  v4 = [MEMORY[0x1E4F69110] sharedHandler];
  [v4 handleError:v5 operationType:v3 options:0 retryBlock:0 cancelBlock:0];

  [*(id *)(a1 + 32) setError:v5];
  [*(id *)(a1 + 32) setState:3];
}

- (id)_ignoreInvitation
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__HUIncomingInvitationResponseController__ignoreInvitation__block_invoke;
  v4[3] = &unk_1E6385090;
  v4[4] = self;
  uint64_t v2 = [MEMORY[0x1E4F7A0D8] futureWithErrorOnlyHandlerAdapterBlock:v4];

  return v2;
}

void __59__HUIncomingInvitationResponseController__ignoreInvitation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) invitation];
    char v6 = objc_msgSend(v5, "hf_prettyDescription");
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring invite %@", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) setState:1];
  id v7 = [*(id *)(a1 + 32) invitation];
  [v7 ignoreInviteWithCompletionHandler:v3];
}

- (id)_declineInvitation
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__HUIncomingInvitationResponseController__declineInvitation__block_invoke;
  v4[3] = &unk_1E6385090;
  v4[4] = self;
  uint64_t v2 = [MEMORY[0x1E4F7A0D8] futureWithErrorOnlyHandlerAdapterBlock:v4];

  return v2;
}

void __60__HUIncomingInvitationResponseController__declineInvitation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) invitation];
    char v6 = objc_msgSend(v5, "hf_prettyDescription");
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Declining invite %@", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) setState:1];
  id v7 = [*(id *)(a1 + 32) invitation];
  [v7 cancelInviteWithCompletionHandler:v3];
}

- (id)_acceptInvitation
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__HUIncomingInvitationResponseController__acceptInvitation__block_invoke;
  v4[3] = &unk_1E6385090;
  v4[4] = self;
  uint64_t v2 = [MEMORY[0x1E4F7A0D8] futureWithErrorOnlyHandlerAdapterBlock:v4];

  return v2;
}

void __59__HUIncomingInvitationResponseController__acceptInvitation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) invitation];
    char v6 = objc_msgSend(v5, "hf_prettyDescription");
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Accepting invite %@", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) setState:1];
  id v7 = [*(id *)(a1 + 32) invitation];
  [v7 acceptInviteWithCompletionHandler:v3];
}

- (id)_reportJunk
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__HUIncomingInvitationResponseController__reportJunk__block_invoke;
  v4[3] = &unk_1E6385090;
  v4[4] = self;
  uint64_t v2 = [MEMORY[0x1E4F7A0D8] futureWithErrorOnlyHandlerAdapterBlock:v4];

  return v2;
}

void __53__HUIncomingInvitationResponseController__reportJunk__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) invitation];
    char v6 = objc_msgSend(v5, "hf_prettyDescription");
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Reporting invite as junk %@", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) setState:1];
  id v7 = [*(id *)(a1 + 32) invitation];
  [v7 reportJunkInviteWithCompletionHandler:v3];
}

- (HUIncomingInvitationResponseControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUIncomingInvitationResponseControllerDelegate *)WeakRetained;
}

- (HMIncomingHomeInvitation)invitation
{
  return self->_invitation;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)response
{
  return self->_response;
}

- (void)setResponse:(unint64_t)a3
{
  self->_response = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_invitation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end