@interface ConnectionProtocolIdentifier
@end

@implementation ConnectionProtocolIdentifier

uint64_t ___ConnectionProtocolIdentifier_block_invoke()
{
  qword_1EB2A2E90 = 0;
  g_ConnectionProtocolIdentifier = 0u;
  unk_1EB2A2E80 = 0u;
  g_ConnectionProtocolCallbacks = 0u;
  *(_OWORD *)algn_1EB2A2D48 = 0u;
  xmmword_1EB2A2D58 = 0u;
  unk_1EB2A2D68 = 0u;
  xmmword_1EB2A2D78 = 0u;
  *(_OWORD *)&qword_1EB2A2D88 = 0u;
  xmmword_1EB2A2D98 = 0u;
  unk_1EB2A2DA8 = 0u;
  xmmword_1EB2A2DB8 = 0u;
  unk_1EB2A2DC8 = 0u;
  xmmword_1EB2A2DD8 = 0u;
  *(_OWORD *)&qword_1EB2A2DE8 = 0u;
  xmmword_1EB2A2DF8 = 0u;
  unk_1EB2A2E08 = 0u;
  xmmword_1EB2A2E18 = 0u;
  unk_1EB2A2E28 = 0u;
  xmmword_1EB2A2E38 = 0u;
  uint32_t v0 = arc4random();
  snprintf((char *)&g_ConnectionProtocolIdentifier, 0x20uLL, "CFNetworkConnection-%u", v0);
  qword_1EB2A2E90 = 0x100000004;
  nw_protocol_set_default_one_to_one_callbacks();
  *(void *)&g_ConnectionProtocolCallbacks = ConnectionProtocolAddInputHandler;
  *((void *)&g_ConnectionProtocolCallbacks + 1) = ConnectionProtocolRemoveInputHandler;
  qword_1EB2A2D88 = (uint64_t)ConnectionProtocolGetInputFrames;
  qword_1EB2A2D90 = (uint64_t)ConnectionProtocolGetOutputFrames;
  *(void *)&xmmword_1EB2A2D98 = ConnectionProtocolFinalizeOutputFrames;
  *((void *)&xmmword_1EB2A2D58 + 1) = ConnectionProtocolConnected;
  qword_1EB2A2DE8 = (uint64_t)ConnectionProtocolSupportsExternalData;
  qword_1EB2A2D50 = (uint64_t)ConnectionProtocolConnect;

  return MEMORY[0x1F40F3B18](&g_ConnectionProtocolIdentifier, ConnectionProtocolCreate);
}

@end