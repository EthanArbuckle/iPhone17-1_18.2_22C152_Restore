@interface GetTypeID
@end

@implementation GetTypeID

uint64_t __memoryOrigin_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  memoryOrigin_GetTypeID_sMemoryOriginTypeID = result;
  return result;
}

uint64_t __memoryRecipient_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  memoryRecipient_GetTypeID_sMemoryRecipientTypeID = result;
  return result;
}

uint64_t __figOSEventLinkRemote_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figOSEventLinkRemote_GetTypeID_sFigOSEventLinkRemoteID = result;
  return result;
}

uint64_t __figOSEventLinkMemoryObjects_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figOSEventLinkMemoryObjects_GetTypeID_sFigOSEventLinkMemoryObjectsID = result;
  return result;
}

uint64_t __figOSEventLinkServer_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figOSEventLinkServer_GetTypeID_sFigOSEventLinkServerID = result;
  return result;
}

uint64_t __pixelBufferOrigin_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  pixelBufferOrigin_GetTypeID_sPixelBufferOriginTypeID = result;
  return result;
}

uint64_t __pixelBufferRecipient_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  pixelBufferRecipient_GetTypeID_sPixelBufferRecipientTypeID = result;
  return result;
}

uint64_t __figRPCTimeoutDetector_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figRPCTimeoutDetector_GetTypeID_sFigRPCTimeoutDetectorID = result;
  return result;
}

uint64_t __figProcessInfo_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figProcessInfo_GetTypeID_sFigProcessInfoID = result;
  return result;
}

void __figProcessStateMonitorRemote_GetTypeID_block_invoke()
{
  figProcessStateMonitorRemote_GetTypeID_sFigProcessStateMonitorMonitorRemoteInfoID = _CFRuntimeRegisterClass();
  unsigned int v0 = FigNote_AllowInternalDefaultLogs() != 0;
  fig_note_initialize_category_with_default_work_cf((uint64_t)&gFigProcessStateMonitorRemoteTrace[1], @"figprocessstatemonitor_trace", @"com.apple.coremedia", (uint64_t)", (uint64_t)"com.apple.coremedia"", v0, 0, gFigProcessStateMonitorRemoteTrace);

  fig_note_initialize_category_with_default_work_cf((uint64_t)&dword_1EB28B670, @"figprocessstatemonitor_trace", @"com.apple.coremedia", (uint64_t)", (uint64_t)"com.apple.coremedia"", 1u, 0, &qword_1EB28B668);
}

uint64_t __figXPCRemoteClient_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figXPCRemoteClient_GetTypeID_sFigXPCRemoteClientID = result;
  return result;
}

uint64_t __figXPCClientConnectionInfo_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figXPCClientConnectionInfo_GetTypeID_sFigXPCClientConnectionInfoID = result;
  return result;
}

uint64_t __figXPCConnection_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figXPCConnection_GetTypeID_sFigXPCConnectionID = result;
  return result;
}

uint64_t __figXPCPerProcessInfo_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figXPCPerProcessInfo_GetTypeID_sPerProcessInfoTypeID = result;
  return result;
}

uint64_t __figXPCServedObject_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figXPCServedObject_GetTypeID_sServedObjectID = result;
  return result;
}

uint64_t __figXPCEnqueuedNotifications_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figXPCEnqueuedNotifications_GetTypeID_sEnqueuedNotificationsTypeID = result;
  return result;
}

uint64_t __figXPCConnectionInfo_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  figXPCConnectionInfo_GetTypeID_sConnectionInfoID = result;
  return result;
}

uint64_t __delegateCallbackParameters_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  delegateCallbackParameters_GetTypeID_sDelegateCallbackParametersTypeID = result;
  return result;
}

@end