@interface PHAbstractDialerView
- (BOOL)isHostedInRemoteViewController;
- (DialerLCDFieldProtocol)lcdView;
- (DialerViewDelegate)delegate;
- (TPDialerKeypadProtocol)phonePadView;
- (UIControl)addContactButton;
- (UIControl)callButton;
- (UIControl)contactCountButton;
- (UIControl)deleteButton;
- (UIControl)searchButton;
- (id)senderIdentityMenuForDialerField:(id)a3 selectedSenderIdentity:(id)a4;
- (void)dealloc;
- (void)dialerField:(id)a3 stringWasPasted:(id)a4;
- (void)dialerLCDFieldTextDidChange:(id)a3;
- (void)setAddContactButton:(id)a3;
- (void)setCallButton:(id)a3;
- (void)setContactCountButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setIsHostedInRemoteViewController:(BOOL)a3;
- (void)setLcdView:(id)a3;
- (void)setPhonePadView:(id)a3;
- (void)setSearchButton:(id)a3;
- (void)updateIDSStatus;
@end

@implementation PHAbstractDialerView

- (void)dealloc
{
  [(DialerLCDFieldProtocol *)self->_lcdView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PHAbstractDialerView;
  [(PHAbstractDialerView *)&v3 dealloc];
}

- (void)dialerLCDFieldTextDidChange:(id)a3
{
  if (self->_lcdView == a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    [(DialerViewDelegate *)delegate dialerViewTextDidChange:self];
  }
}

- (void)dialerField:(id)a3 stringWasPasted:(id)a4
{
  id v6 = a4;
  if (self->_lcdView == a3)
  {
    id v7 = v6;
    if (objc_opt_respondsToSelector()) {
      [(DialerViewDelegate *)self->_delegate dialerView:self stringWasPasted:v7];
    }
  }

  _objc_release_x2();
}

- (id)senderIdentityMenuForDialerField:(id)a3 selectedSenderIdentity:(id)a4
{
  id v6 = a4;
  if (self->_lcdView == a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [(DialerViewDelegate *)self->_delegate senderIdentityMenuForDialerView:self selectedSenderIdentity:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)updateIDSStatus
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(DialerViewDelegate *)delegate updateIDSStatus];
  }
}

- (DialerLCDFieldProtocol)lcdView
{
  return self->_lcdView;
}

- (void)setLcdView:(id)a3
{
}

- (TPDialerKeypadProtocol)phonePadView
{
  return self->_phonePadView;
}

- (void)setPhonePadView:(id)a3
{
}

- (DialerViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (DialerViewDelegate *)a3;
}

- (UIControl)addContactButton
{
  return self->_addContactButton;
}

- (void)setAddContactButton:(id)a3
{
}

- (UIControl)callButton
{
  return self->_callButton;
}

- (void)setCallButton:(id)a3
{
}

- (UIControl)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (UIControl)searchButton
{
  return (UIControl *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSearchButton:(id)a3
{
}

- (UIControl)contactCountButton
{
  return (UIControl *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContactCountButton:(id)a3
{
}

- (BOOL)isHostedInRemoteViewController
{
  return self->_isHostedInRemoteViewController;
}

- (void)setIsHostedInRemoteViewController:(BOOL)a3
{
  self->_isHostedInRemoteViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCountButton, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_callButton, 0);
  objc_storeStrong((id *)&self->_addContactButton, 0);
  objc_storeStrong((id *)&self->_phonePadView, 0);

  objc_storeStrong((id *)&self->_lcdView, 0);
}

@end