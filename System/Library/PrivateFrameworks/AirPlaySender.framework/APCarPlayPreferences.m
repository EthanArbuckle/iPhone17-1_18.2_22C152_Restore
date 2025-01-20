@interface APCarPlayPreferences
- (APCarPlayPreferences)init;
- (APCarPlayPreferencesDelegate)delegate;
- (BOOL)isCarPlayEnabled;
- (void)dealloc;
- (void)handleCarPlayAllowedDidChange;
- (void)setDelegate:(id)a3;
@end

@implementation APCarPlayPreferences

- (APCarPlayPreferences)init
{
  v5.receiver = self;
  v5.super_class = (Class)APCarPlayPreferences;
  v2 = [(APCarPlayPreferences *)&v5 init];
  if (v2)
  {
    v3 = (CRCarPlayPreferences *)objc_alloc_init(getCRCarPlayPreferencesClass());
    v2->_preferences = v3;
    [(CRCarPlayPreferences *)v3 setPreferencesDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  self->_preferences = 0;
  v3.receiver = self;
  v3.super_class = (Class)APCarPlayPreferences;
  [(APCarPlayPreferences *)&v3 dealloc];
}

- (BOOL)isCarPlayEnabled
{
  return [(CRCarPlayPreferences *)self->_preferences isCarPlayAllowed];
}

- (void)handleCarPlayAllowedDidChange
{
  uint64_t v3 = [(CRCarPlayPreferences *)self->_preferences isCarPlayAllowed];
  if (gLogCategory_APCarPlayPreferences <= 50
    && (gLogCategory_APCarPlayPreferences != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  delegate = self->_delegate;
  [(APCarPlayPreferencesDelegate *)delegate setCarPlayEnabled:v3];
}

- (APCarPlayPreferencesDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (APCarPlayPreferencesDelegate *)a3;
}

@end