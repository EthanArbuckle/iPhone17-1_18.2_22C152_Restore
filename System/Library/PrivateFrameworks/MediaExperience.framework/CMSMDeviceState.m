@interface CMSMDeviceState
@end

@implementation CMSMDeviceState

void __CMSMDeviceState_UpdateDeviceConfiguration_block_invoke()
{
  v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "infoDictionary"), "objectForKey:", @"CFBundleIdentifier");
  gDeviceState = 0;
  if ([v0 isEqualToString:@"com.apple.mediaserverd"])
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    LOBYTE(gDeviceState) = 1;
  }
  else if ([v0 isEqualToString:@"com.apple.audiomxd"])
  {
    if (dword_1E9359ED0)
    {
      v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    HIBYTE(gDeviceState) = 1;
  }
  else
  {
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = (const void *)MGCopyAnswer();
  if (FigCFEqual())
  {
    byte_1E9358934 = 1;
  }
  else if (FigCFEqual())
  {
    byte_1E9358933 = 1;
  }
  else if (FigCFEqual())
  {
    byte_1E9358935 = 1;
  }
  else if (FigCFEqual())
  {
    byte_1E9358936 = 1;
  }
  else if (FigCFEqual())
  {
    byte_1E9358937 = 1;
  }
  if (MGGetProductType() == 4231109337)
  {
    if (dword_1E9359ED0)
    {
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    byte_1E935893A = 1;
  }
  if (MGGetProductType() == 1908832379)
  {
    if (dword_1E9359ED0)
    {
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    byte_1E935893A = 1;
  }
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t __CMSMDeviceState_SupportsBeacon_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CMSMDeviceState_SupportsBeacon_supportsBeaconMode = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

void __CMSMDeviceState_CopyHardwareSafetySession_block_invoke()
{
  if (CMSessionCreate(&qword_1E93589D8)) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = qword_1E93589D8 == 0;
  }
  if (v0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (qword_1E93589D8)
    {
      CFRelease((CFTypeRef)qword_1E93589D8);
      qword_1E93589D8 = 0;
    }
  }
  else
  {
    _CMSessionSetProperty((void *)qword_1E93589D8, @"ClientName", @"HardwareSafetySession");
    v2 = (void *)qword_1E93589D8;
    uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:getpid()];
    _CMSessionSetProperty(v2, @"ClientPID", v3);
    _CMSessionSetProperty((void *)qword_1E93589D8, @"AudioHardwareControlFlags", [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:0]);
    _CMSessionSetProperty((void *)qword_1E93589D8, @"IAmHardwareSafetySession", [MEMORY[0x1E4F28ED0] numberWithBool:1]);
    _CMSessionSetProperty((void *)qword_1E93589D8, @"DoesntActuallyPlayAudio", [MEMORY[0x1E4F28ED0] numberWithBool:1]);
    _CMSessionSetProperty((void *)qword_1E93589D8, @"InterruptionStyle", [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1]);
    _CMSessionSetProperty((void *)qword_1E93589D8, @"ClientPriority", [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:10]);
    _CMSessionSetProperty((void *)qword_1E93589D8, @"PrefersSpeechDetectEnabled", [MEMORY[0x1E4F28ED0] numberWithBool:0]);
    v4 = (void *)qword_1E93589D8;
    LODWORD(v5) = 1036831949;
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithFloat:v5];
    _CMSessionSetProperty(v4, @"InterruptionFadeDuration", v6);
  }
}

uint64_t __CMSMDeviceState_DeviceHasHardwareRingerSwitch_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CMSMDeviceState_DeviceHasHardwareRingerSwitch_hasPhysicalSwitch = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

void __CMSMDeviceState_UpdateSmartCoverState_block_invoke()
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSMUtility_UpdateSecureMicrophonePolicy(0);
}

uint64_t __CMSMDeviceState_IsHomePodHub_block_invoke()
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __CMSMDeviceState_DeviceHasExclaveCapability_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CMSMDeviceState_DeviceHasExclaveCapability_deviceHasExclaveCapability = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end