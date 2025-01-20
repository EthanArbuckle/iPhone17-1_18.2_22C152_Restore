@interface StartRelayForT56
@end

@implementation StartRelayForT56

uint64_t __mfi4Auth_relay_StartRelayForT56_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (gLogObjects && gNumLogObjects >= 56)
  {
    v6 = *(id *)(gLogObjects + 440);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    uint64_t v10 = a2;
    __int16 v11 = 2112;
    uint64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "processOutgoingSecureTunnelDataForClient: %@, data %@", (uint8_t *)&v9, 0x16u);
  }

  return acc_manager_processIncomingDataForEndpointWithUUID(*(void *)(a1 + 32), a3);
}

@end