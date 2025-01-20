@interface AVOutputDeviceGroup
+ (void)initialize;
- (AVOutputDevice)groupLeader;
- (AVOutputDeviceGroup)initWithOutputDeviceGroupImpl:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)receivesLongFormAudioFromLocalDevice;
- (NSArray)outputDevices;
- (float)volume;
- (id)description;
- (id)impl;
- (int64_t)volumeControlType;
- (unint64_t)hash;
- (void)addOutputDevice:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)outputDeviceGroupImpl:(id)a3 didChangeOutputDevicesWithInitiator:(id)a4;
- (void)outputDeviceGroupImplDidChangeVolume:(id)a3;
- (void)outputDeviceGroupImplDidChangeVolumeControlType:(id)a3;
- (void)removeOutputDevice:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)setVolume:(float)a3;
@end

@implementation AVOutputDeviceGroup

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVOutputDeviceGroup)initWithOutputDeviceGroupImpl:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceGroup;
  v4 = [(AVOutputDeviceGroup *)&v8 init];
  if (v4 && (id v5 = a3, (v4->_impl = (AVOutputDeviceGroupImpl *)v5) != 0))
  {
    [v5 setParentOutputDeviceGroup:v4];
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceGroup;
  [(AVOutputDeviceGroup *)&v3 dealloc];
}

- (id)impl
{
  return self->_impl;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(AVOutputDeviceGroup *)self impl];
  uint64_t v6 = [a3 impl];
  return [v5 isEqual:v6];
}

- (unint64_t)hash
{
  return [(AVOutputDeviceGroupImpl *)self->_impl hash];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p>", NSStringFromClass(v4), self];
}

- (BOOL)receivesLongFormAudioFromLocalDevice
{
  return [(AVOutputDeviceGroupImpl *)self->_impl receivesLongFormAudioFromLocalDevice];
}

- (AVOutputDevice)groupLeader
{
  return (AVOutputDevice *)[(AVOutputDeviceGroupImpl *)self->_impl groupLeader];
}

- (NSArray)outputDevices
{
  return (NSArray *)[(AVOutputDeviceGroupImpl *)self->_impl outputDevices];
}

- (void)outputDeviceGroupImpl:(id)a3 didChangeOutputDevicesWithInitiator:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v9 = @"AVOutputDeviceGroupMembershipChangeInitiator";
    v10[0] = a4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (dword_1E9356AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v7, v8), "postNotificationName:object:userInfo:", @"AVOutputDeviceGroupOutputDevicesDidChangeNotification", self, v5);
}

- (void)addOutputDevice:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a4 objectForKeyedSubscript:@"AVOutputDeviceGroupAddOutputDeviceOptionAuthorizationToken"];
  [a4 objectForKeyedSubscript:@"AVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequiredKey"];
  [a4 objectForKeyedSubscript:@"AVOutputDeviceGroupAddOutputDeviceOptionInitiator"];
  if (dword_1E9356AF0)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  impl = self->_impl;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__AVOutputDeviceGroup_addOutputDevice_withOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E57B4B38;
  v13[4] = a5;
  -[AVOutputDeviceGroupImpl addOutputDevice:withOptions:completionHandler:](impl, "addOutputDevice:withOptions:completionHandler:", a3, a4, v13, v11, v12);
}

uint64_t __69__AVOutputDeviceGroup_addOutputDevice_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (dword_1E9356AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)removeOutputDevice:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356AF0)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  impl = self->_impl;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__AVOutputDeviceGroup_removeOutputDevice_withOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E57B4B38;
  v13[4] = a5;
  -[AVOutputDeviceGroupImpl removeOutputDevice:withOptions:completionhandler:](impl, "removeOutputDevice:withOptions:completionhandler:", a3, a4, v13, v11, v12);
}

uint64_t __72__AVOutputDeviceGroup_removeOutputDevice_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (dword_1E9356AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (float)volume
{
  [(AVOutputDeviceGroupImpl *)self->_impl volume];
  return result;
}

- (void)outputDeviceGroupImplDidChangeVolume:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputDeviceGroupVolumeDidChangeNotification", self);
}

- (void)setVolume:(float)a3
{
}

- (int64_t)volumeControlType
{
  return [(AVOutputDeviceGroupImpl *)self->_impl volumeControlType];
}

- (void)outputDeviceGroupImplDidChangeVolumeControlType:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputDeviceGroupVolumeControlTypeDidChangeNotification", self);
}

@end