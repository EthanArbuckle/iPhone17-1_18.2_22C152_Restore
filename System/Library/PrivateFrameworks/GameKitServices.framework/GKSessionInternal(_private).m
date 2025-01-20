@interface GKSessionInternal(_private)
- (void)lock;
- (void)unlock;
@end

@implementation GKSessionInternal(_private)

- (void)tellDelegate_sessionDidFailWithError:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate session error after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_didConnectPeer:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate peer connect after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_didDisconnectPeer:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate peer disconnect after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_isConnectingPeer:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate peer is connecting after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_peerDidBecomeAvailable:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate peer is available after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_peerDidBecomeUnavailable:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate peer is unavailable after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_didReceiveBand_RetryICE:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate retry ice band receive after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_didReceiveData:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate data receive after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_didReceiveDataFromPeerWithContext:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate data receive after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_gotInvited:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate got invited after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_connectionRequestToPeerFailed:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate connection request to peer failed after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_peerDidBecomeBusy:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate peer did become busy after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_initiateRelay:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate relay initiate after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_updateRelay:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate relay update after reset", v2, v3, v4, v5, v6);
}

- (void)tellDelegate_networkStatisticsChanged:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot delegate network statistics changed after reset", v2, v3, v4, v5, v6);
}

- (void)didPublishWithError:()_private .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d ** Stop resolving ALL: publish error", v2, v3, v4, v5, v6);
}

- (void)didPublishWithError:()_private .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [a2 localizedDescription];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  OUTLINED_FUNCTION_2_0();
  int v9 = 1334;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_221563000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Error: %@.", (uint8_t *)&v6, 0x26u);
}

- (void)lock
{
  OUTLINED_FUNCTION_7();
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_221563000, v0, v1, " [%s] %s:%d GKSessionInternal[%p] lock error: %d", v2, v3, v4, v5, v6);
}

- (void)unlock
{
  OUTLINED_FUNCTION_7();
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_221563000, v0, v1, " [%s] %s:%d GKSessionInternal[%p] unlock error: %d", v2, v3, v4, v5, v6);
}

@end