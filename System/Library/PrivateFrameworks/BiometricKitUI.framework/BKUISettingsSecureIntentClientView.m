@interface BKUISettingsSecureIntentClientView
- (BKMesaSecureIntentProvider)secureIntentProvider;
- (void)setSecureIntentProvider:(id)a3;
@end

@implementation BKUISettingsSecureIntentClientView

- (BKMesaSecureIntentProvider)secureIntentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secureIntentProvider);

  return (BKMesaSecureIntentProvider *)WeakRetained;
}

- (void)setSecureIntentProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end