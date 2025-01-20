@interface SAEmergencyResponseManager
- (SAClient)client;
- (SAEmergencyResponseManager)init;
- (id)delegate;
- (void)dialVoiceCallToPhoneNumber:(NSString *)phoneNumber completionHandler:(void *)handler;
- (void)setDelegate:(id)delegate;
- (void)updateVoiceCallStatus:(int64_t)a3;
@end

@implementation SAEmergencyResponseManager

- (SAEmergencyResponseManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SAEmergencyResponseManager;
  v2 = [(SAEmergencyResponseManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(SAEmergencyResponseManager *)v2 client];
    [v4 setEmergencyResponseClientDelegate:v3];
  }
  return v3;
}

- (void)dialVoiceCallToPhoneNumber:(NSString *)phoneNumber completionHandler:(void *)handler
{
  objc_super v6 = phoneNumber;
  v7 = handler;
  v8 = sa_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SAEmergencyResponseManager dialVoiceCallToPhoneNumber:completionHandler:]((uint64_t)v6, v8);
  }

  v9 = [(SAEmergencyResponseManager *)self client];
  [v9 dialVoiceCallToPhoneNumber:v6 completionHandler:v7];
}

- (SAClient)client
{
  return +[SAClient sharedInstance];
}

- (void)updateVoiceCallStatus:(int64_t)a3
{
  v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SAEmergencyResponseManager updateVoiceCallStatus:](a3, v5);
  }

  objc_super v6 = [(SAEmergencyResponseManager *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 emergencyResponseManager:self didUpdateVoiceCallStatus:a3];
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (void).cxx_destruct
{
}

- (void)dialVoiceCallToPhoneNumber:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[SAEmergencyResponseManager dialVoiceCallToPhoneNumber:completionHandler:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_245182000, a2, OS_LOG_TYPE_DEBUG, "%s, phoneNumber: %@", (uint8_t *)&v2, 0x16u);
}

- (void)updateVoiceCallStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[SAEmergencyResponseManager updateVoiceCallStatus:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_245182000, a2, OS_LOG_TYPE_DEBUG, "%s, status: %ld", (uint8_t *)&v2, 0x16u);
}

@end