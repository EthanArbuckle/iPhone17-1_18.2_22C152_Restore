@interface ThreadNetworkManagerInstance(SM_extension)
- (void)clearProvideEmacTracker;
- (void)handleAdv;
- (void)handleRouterModeFailSafeTrigger;
- (void)notifyOnNodeStatusChange;
- (void)transitionToChildNodeHelper;
@end

@implementation ThreadNetworkManagerInstance(SM_extension)

- (void)validateExtendedMACAddress:()SM_extension .cold.1(const char *a1, NSObject *a2)
{
  strlen(a1);
  OUTLINED_FUNCTION_2();
  int v7 = 29;
  __int16 v8 = 2080;
  v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = v4;
  OUTLINED_FUNCTION_11_2((void *)&_mh_execute_header, a2, v5, "%s:%d  extendedMACAddress : %s, Length = %ld", v6);
}

- (void)startPairing:()SM_extension isWED:output:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set kWPANTUNDProperty_ThreadPairingStatus property res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)startPairing:()SM_extension isWED:output:.cold.2()
{
  OUTLINED_FUNCTION_7_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_13_1(v2, (uint64_t)v1);
  OUTLINED_FUNCTION_12_0(v3, v4);
  *(void *)(v5 + 20) = "true";
  *(_WORD *)(v5 + 28) = v6;
  *(void *)(v5 + 30) = v7;
  OUTLINED_FUNCTION_11_2((void *)&_mh_execute_header, v8, (uint64_t)v8, "%s:%d isWed = [%s] Current Node = [%s] no-op", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)startPairing:()SM_extension isWED:output:.cold.3()
{
  OUTLINED_FUNCTION_7_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_13_1(v2, (uint64_t)v1);
  OUTLINED_FUNCTION_12_0(v3, v4);
  *(void *)(v5 + 20) = "false";
  *(_WORD *)(v5 + 28) = v6;
  *(void *)(v5 + 30) = v7;
  OUTLINED_FUNCTION_11_2((void *)&_mh_execute_header, v8, (uint64_t)v8, "%s:%d isWed = [%s] Current Node = [%s] no-op", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)startPairing:()SM_extension isWED:output:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to get the network Node Type", v2, v3, v4, v5, v6);
}

- (void)stopPairing:()SM_extension .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Failed to stop pairing", v2, v3, v4, v5, v6);
}

- (void)stopPairing:()SM_extension .cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to set the network Node Type", v2, v3, v4, v5, v6);
}

- (void)stopPairing:()SM_extension .cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d stopPairingRequest is set, ready to transition to SSED on receiving ADV", v2, v3, v4, v5, v6);
}

- (void)stopPairing:()SM_extension .cold.5()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set kWPANTUNDProperty_ThreadPairingStatus property res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)startFWUpdate:()SM_extension isWED:output:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_6(a1, a2, a3);
  if (v12) {
    __int16 v8 = "true";
  }
  *(_DWORD *)(v5 + 14) = 327;
  *(_DWORD *)uint64_t v5 = v11;
  *(_WORD *)(v5 + 18) = 2080;
  *(void *)(v5 + 20) = v8;
  if (v9 >= 0) {
    uint64_t v13 = v4;
  }
  else {
    uint64_t v13 = v10;
  }
  *(_WORD *)(v5 + 28) = 2080;
  *(void *)(v5 + 30) = v13;
  OUTLINED_FUNCTION_11_2((void *)&_mh_execute_header, v7, v5, "%s:%d isWed = [%s] Device Current Node = [%s] no-op for Starting FW Update", v6);
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

- (void)startFWUpdate:()SM_extension isWED:output:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set kWPANTUNDProperty_ThreadEmacId property res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)startFWUpdate:()SM_extension isWED:output:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set kWPANTUNDProperty_ThreadEmacId property res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)startFWUpdate:()SM_extension isWED:output:.cold.4()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set the network Node Type to router res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)startFWUpdate:()SM_extension isWED:output:.cold.5()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set the network Node Type to router res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)startFWUpdate:()SM_extension isWED:output:.cold.6()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set kWPANTUNDProperty_ThreadEmacId property res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)startFWUpdateHelper:()SM_extension .cold.1()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set kWPANTUNDProperty_ThreadEmacId property res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)startFWUpdateHelper:()SM_extension .cold.2()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set kWPANTUNDProperty_ThreadFWUpdate property res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)stopFWUpdate:()SM_extension .cold.1()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set the network Node Type to router res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)stopFWUpdate:()SM_extension .cold.2()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set the network Node Type to router res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)nodeChangeToChildStatus:()SM_extension .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to get the Extended Address Property", v2, v3, v4, v5, v6);
}

- (void)nodeChangeToChildStatus:()SM_extension .cold.2()
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set the network Node Type to sleepy router res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)handleRouterModeFailSafeTrigger
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Failed to get the network Node Type", v2, v3, v4, v5, v6);
}

- (void)handleAdv
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Failed to get the network Node Type", v2, v3, v4, v5, v6);
}

- (void)notifyOnWedStatusChange:()SM_extension .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to get the Wed MleId Property", v2, v3, v4, v5, v6);
}

- (void)notifyOnWedStatusChange:()SM_extension .cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to get the Wed Extended Address Property", v2, v3, v4, v5, v6);
}

- (void)notifyOnNodeStatusChange
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to fetch neighbor MLEID", v2, v3, v4, v5, v6);
}

- (void)transitionToChildNodeHelper
{
  OUTLINED_FUNCTION_0_3();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_2_6(v2, v3, (uint64_t)v1);
  OUTLINED_FUNCTION_1_2(v4, v5, v6);
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, "%s:%d: Failed to set the network Node Type to child res.errorCode() : %s(%d)", v7, v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)clearProvideEmacTracker
{
  int v1 = 136315138;
  uint64_t v2 = "-[ThreadNetworkManagerInstance(SM_extension) clearProvideEmacTracker]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:", (uint8_t *)&v1, 0xCu);
}

- (void)eraseKeyFromProvideEmacTracker:()SM_extension .cold.1(char *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "-[ThreadNetworkManagerInstance(SM_extension) eraseKeyFromProvideEmacTracker:]";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a3;
  *((_WORD *)buf + 11) = 2080;
  *((void *)buf + 3) = v5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Already erase complete, wedAddr=[%s], Wed Status=[%s]", buf, 0x20u);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

- (void)provideExtendedMACAddress:()SM_extension output:.cold.3()
{
  OUTLINED_FUNCTION_7_3();
  _DWORD *v1 = 136315650;
  OUTLINED_FUNCTION_13_1(v2, (uint64_t)v1);
  OUTLINED_FUNCTION_12_0(v3, v4);
  *(void *)(v5 + 20) = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s:%d Cmd received in state %s, Detach request rejected as there is no Wed Connected no-op", v8, 0x1Cu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

- (void)provideExtendedMACAddress:()SM_extension output:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)provideExtendedMACAddress:()SM_extension output:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)provideExtendedMACAddress:()SM_extension output:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)provideExtendedMACAddress:()SM_extension output:.cold.7(char *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  if (a1[23] >= 0) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = *(char **)a1;
  }
  *(_DWORD *)a3 = 136315906;
  *(void *)(a3 + 4) = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = 1299;
  *(_WORD *)(a3 + 18) = 2080;
  *(void *)(a3 + 20) = v5;
  *(_WORD *)(a3 + 28) = 2080;
  *(void *)(a3 + 30) = a2;
  OUTLINED_FUNCTION_11_2((void *)&_mh_execute_header, a4, a3, "%s:%d State Machine Disabled Cmd received in state %s, extendedMACAddress : %s", (uint8_t *)a3);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

@end