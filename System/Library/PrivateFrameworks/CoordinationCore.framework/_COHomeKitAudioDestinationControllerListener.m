@interface _COHomeKitAudioDestinationControllerListener
- (HMAccessory)accessory;
- (HMHome)home;
- (_COHomeKitAudioDestinationControllerListenerDelegate)delegate;
- (id)initWitAccessory:(id)a3 home:(id)a4 delegate:(id)a5;
- (void)accessoryDidUpdateAudioDestinationController:(id)a3;
@end

@implementation _COHomeKitAudioDestinationControllerListener

- (id)initWitAccessory:(id)a3 home:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_COHomeKitAudioDestinationControllerListener;
  v12 = [(_COHomeKitAudioDestinationControllerListener *)&v16 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong(p_isa + 1, a3);
    objc_storeStrong(p_isa + 2, a4);
    [p_isa[1] setDelegate:p_isa];
    v14 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[_COHomeKitAudioDestinationControllerListener initWitAccessory:home:delegate:]();
    }
  }
  return p_isa;
}

- (void)accessoryDidUpdateAudioDestinationController:(id)a3
{
  id v6 = a3;
  v4 = [(_COHomeKitAudioDestinationControllerListener *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = [(_COHomeKitAudioDestinationControllerListener *)self home];
    [v4 audioDestinationControllerDidUpdateForAccessory:v6 inHome:v5];
  }
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMHome)home
{
  return self->_home;
}

- (_COHomeKitAudioDestinationControllerListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_COHomeKitAudioDestinationControllerListenerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (void)initWitAccessory:home:delegate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_2217C1000, v0, OS_LOG_TYPE_DEBUG, "%p listening for audio destination controller on %@", v1, 0x16u);
}

@end