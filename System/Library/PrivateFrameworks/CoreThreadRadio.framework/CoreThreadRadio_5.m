void sub_1003C9FE4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *otbr::DnsUtils::CheckHostnameSanity(uint64_t *result)
{
  if (*((char *)result + 23) < 0)
  {
    uint64_t v1 = result[1];
    if (!v1) {
      goto LABEL_8;
    }
    result = (uint64_t *)*result;
  }
  else
  {
    uint64_t v1 = *((unsigned __int8 *)result + 23);
    if (!*((unsigned char *)result + 23)) {
LABEL_8:
    }
      otbr::DnsUtils::CheckHostnameSanity();
  }
  if (*((unsigned char *)result + v1 - 1) != 46) {
    otbr::DnsUtils::CheckHostnameSanity();
  }
  return result;
}

std::string::size_type otbr::DnsUtils::CheckServiceNameSanity(std::string *this)
{
  if ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*((unsigned char *)&this->__r_.__value_.__s + 23))
    {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      goto LABEL_5;
    }
LABEL_12:
    otbr::DnsUtils::CheckServiceNameSanity();
  }
  std::string::size_type size = this->__r_.__value_.__l.__size_;
  if (!size) {
    goto LABEL_12;
  }
LABEL_5:
  if ((this->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = this;
  }
  else {
    v3 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  if (v3->__r_.__value_.__s.__data_[size - 1] == 46) {
    otbr::DnsUtils::CheckServiceNameSanity();
  }
  std::string::size_type v4 = std::string::find(this, 46, 0);
  if (v4 == -1) {
    otbr::DnsUtils::CheckServiceNameSanity();
  }
  std::string::size_type v5 = v4;
  std::string::size_type result = std::string::rfind(this, 46, 0xFFFFFFFFFFFFFFFFLL);
  if (v5 != result) {
    otbr::DnsUtils::CheckServiceNameSanity();
  }
  return result;
}

void ThreadPowerAssertDispatchTask_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to assert power", v1, 2u);
}

uint64_t __ThreadPowerAssertDispatchTask_block_invoke_cold_3(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::apply_visitor<boost::signals2::detail::lock_weak_ptr_visitor const>(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void FaultInfo::setControlInterface()
{
  int v0 = 136315394;
  uint64_t v1 = "com.apple.wpantund.ncp";
  __int16 v2 = 2080;
  v3 = "default";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Logging1 Module is not defined for SubSystem: %s, Category: %s", (uint8_t *)&v0, 0x16u);
}

void CAMetricsHandlers_handle_getprop_joinerRssi()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_joinerRssi - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_bbrCounters()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_bbrCounters - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_linkLossCounters()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_linkLossCounters - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_nbrRssi()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_nbrRssi - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_macPktLqi()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_macPktLqi - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_macPktSize()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_macPktSize - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_frameTxPowerHist()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_frameTxPowerHist - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_neighborTxPowerHist()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_neighborTxPowerHist - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_neighborEnergySavingsFactorHist()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_neighborEnergySavingsFactorHist - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_radiocounters()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_radiocounters - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_radiostat()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_radiostat - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_generic_function()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_generic_function - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_macerror()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_macerror - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_macretry()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_macretry - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_ccaEnergyDetect()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_ccaEnergyDetect - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_csmaBackoff()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_csmaBackoff - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_allmac()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_allmac - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_vendorcoex_histograms()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_vendorcoex_histograms - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_vendorcoex()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_vendorcoex - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_threadmle()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_threadmle - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_allipv6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_allipv6 - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_trel_link_counters()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_trel_link_counters - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_vendorcoex_RCP2_counters()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_vendorcoex_RCP2_counters - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_vendorcoex_RCP2_histograms()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_vendorcoex_RCP2_histograms - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_BTWifiLoadInfo()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_BTWifiLoadInfo - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void CAMetricsHandlers_handle_getprop_allTriggerMetrics_accessory_specific()
{
  OUTLINED_FUNCTION_2();
  int v2 = 3256;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d: inner msg is not of type XPC_ARRAY", v1, 0x12u);
}

{
  os_log_t v0;
  uint8_t v1[14];
  int v2;

  OUTLINED_FUNCTION_2();
  int v2 = 3264;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d: msg is not of type XPC_ARRAY", v1, 0x12u);
}

void CAMetricsHandlers_handle_getprop_connectednodes()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "CAMetrics : CAMetricsHandlers_handle_getprop_connectednodes - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void PcapManager::start_pcap_capture()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v0, "Logging1 Module is not defined for SubSystem: %s, Category: %s", v1, v2, v3, v4, 2u);
}

{
  int *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  uint64_t v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x1Cu);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "SNIFFER_TLF::start_pcap_capture: pcap already in progress\n", v2, v3, v4, v5, v6);
}

{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "SNIFFER_TLF::Starting pcap, checking descriptor", v1, 2u);
}

void PcapManager::start_pcap_capture(char *a1, void *a2, NSObject *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  LODWORD(v3) = 136315138;
  HIDWORD(v3) = a2;
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, (uint64_t)a2, a3, "SNIFFER_TLF::Starting pcap, checking fd path : %s", v3);
}

void PcapManager::stop_pcap_capture()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "SNIFFER_TLF::stop_pcap_capture: already stopped\n", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "SNIFFER_TLF::stop_pcap_capture\n", v2, v3, v4, v5, v6);
}

void PcapManager::insert_fd()
{
  uint64_t v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x18u);
}

void PcapManager::new_fd()
{
  uint64_t v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x12u);
}

void PcapManager::remove_old_pcap_files(char *a1, uint64_t *a2, NSObject *a3)
{
  if (*a1 >= 0) {
    LODWORD(v3) = a2;
  }
  else {
    uint64_t v3 = *a2;
  }
  LODWORD(v4) = 136315138;
  HIDWORD(v4) = v3;
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, (uint64_t)a2, a3, "PcapManager::remove_old_pcap_files => oldest file deleted : %s", v4);
}

void PcapManager::remove_old_pcap_files()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "PcapManager::remove_old_pcap_files => invalid oldest filepath saved!", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "PcapManager::remove_old_pcap_files => Packet directory path is invalid!", v2, v3, v4, v5, v6);
}

void PcapManager::push_packet_to_file(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = (void *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    uint64_t v2 = (void *)*v2;
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "SNIFFER_TLF:: Could not get file size :%s for sniffer file.", (uint8_t *)&v3, 0xCu);
}

void PcapManager::push_packet_to_file(char *a1, void *a2, os_log_t log)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SNIFFER_TLF:: Failed to open sniffer file : %s for writing after backup sniff file.", (uint8_t *)&v3, 0xCu);
}

uint64_t awdmetricsclient_convert_ValMap_to_xpc_object()
{
  OUTLINED_FUNCTION_0_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void AWDMetricsClient_TriggerAutoBugCaptures(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "AWDMetricsClient_TriggerAutoBugCaptures";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "AWDMetrics : %s", (uint8_t *)&v1, 0xCu);
}

void AWDMetricsClient_TriggerAutoBugCaptures_internal(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "AWDMetricsClient_TriggerAutoBugCaptures_internal";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : error creating SDRDiagnosticReporter", (uint8_t *)&v1, 0xCu);
}

{
  uint8_t v1[16];

  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "AWDMetricsClient_TriggerAutoBugCapture : signatureWithDomain API failed", v1, 2u);
}

{
  int v1;
  const char *v2;

  int v1 = 136315138;
  uint64_t v2 = "AWDMetricsClient_TriggerAutoBugCaptures_internal";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "AWDMetrics : %s", (uint8_t *)&v1, 0xCu);
}

void ___Z48AWDMetricsClient_TriggerAutoBugCaptures_internalNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES5_S5_S5_S5_S5_Pc_block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "AWDMetricsClient_TriggerAutoBugCaptures_internal_block_invoke";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : SDR rejected snapshotWithSignature. Reason %@", buf, 0x16u);
}

void AWDMetricsClient_TriggerAutoBugCapture(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "AWDMetrics : AWDMetricsClient_TriggerAutoBugCapture", v1, 2u);
}

void AWDMetricsHandlers_handle_getprop_joinerRssi()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_joinerRssi - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_linkLossCounters()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_linkLossCounters - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_nbrRssi()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_nbrRssi - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_macPktLqi()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_macPktLqi - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_macPktSize()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_macPktSize - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_frameTxPowerHist()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_frameTxPowerHist - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_neighborTxPowerHist()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_neighborTxPowerHist - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_neighborEnergySavingsFactorHist()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_neighborEnergySavingsFactorHist - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_radiocounters()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_radiocounters - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_radiostat()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_radiostat - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_otradiocounters()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_otradiocounters - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_macerror()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_macerror - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_macretry()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_macretry - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_ccaEnergyDetect()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_ccaEnergyDetect - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_csmaBackoff()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_csmaBackoff - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_allmac()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_allmac - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_vendorcoex_histograms()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_vendorcoex_histograms - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_vendorcoex()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_vendorcoex - ERROR : type not a dictionary", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_threadmle()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_threadmle - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_allipv6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMetricsHandlers_handle_getprop_allipv6 - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void AWDMetricsHandlers_handle_getprop_connectednodes()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetrics : AWDMMetricsHandlers_handle_getprop_connectednodes - ERROR : type not an array", v2, v3, v4, v5, v6);
}

void ne_tunnel_open_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "RETRY of NEVirtualInterfaceCreateNexus returned NULL", v1, 2u);
}

void ne_tunnel_name_cold_2(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to update AdHoc service on %s", (uint8_t *)&v2, 0xCu);
}

void ne_tunnel_name_cold_5(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to set rank on %s", (uint8_t *)&v2, 0xCu);
}

void boost::any_cast<std::list<std::map<std::string,boost::any>>>(uint64_t **a1, uint64_t *a2, void *a3, uint64_t a4, int a5, uint64_t a6)
{
  v9 = *a1;
  uint64_t v10 = *a2;
  uint64_t v11 = **a1;
  *(void *)(v11 + 8) = *(void *)(*a2 + 8);
  **(void **)(v10 + 8) = v11;
  *a3 = 0;
  if (v9 != a2)
  {
    do
    {
      v13 = (uint64_t *)v9[1];
      std::__tree<std::__value_type<std::string,boost::any>,std::__map_value_compare<std::string,std::__value_type<std::string,boost::any>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,boost::any>>>::destroy((uint64_t)(v9 + 2), (char *)v9[3]);
      operator delete(v9);
      v9 = v13;
    }
    while (v13 != a2);
  }
  *(void *)a6 = a4;
  *(_DWORD *)(a6 + 8) = a5;
}

void postFollowUpNotification(os_log_t log)
{
  int v1 = 136315394;
  int v2 = "postFollowUpNotification";
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: FAULT detected, Failed Post Followup Notification : %d, asserting !!! ", (uint8_t *)&v1, 0x12u);
}

{
  int v1;
  const char *v2;

  int v1 = 136315138;
  int v2 = "postFollowUpNotification";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : Failed to allocate Follow up controller asserting...", (uint8_t *)&v1, 0xCu);
}

void clearFollowUpNotification(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "clearFollowUpNotification";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : Failed to allocate Follow up controller asserting...", (uint8_t *)&v1, 0xCu);
}

void dskeychainRcp::printCFData()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "------------------------------------------------------------", v1, 2u);
}

{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, " %s", v1, 0xCu);
}

void dskeychainRcp::AddKeychainItem()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "dskeychain::AddKeychainItem Failed adding keychain item: %p", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "dskeychain::AddKeychainItem Credential exists. Will update instead.", v2, v3, v4, v5, v6);
}

void dskeychainRcp::FindKeychainItem()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "dskeychain::FindKeychainItem: CFData/Dictionary is NULL", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "dskeychain::FindKeychainItem: Keychain item not found: %p", v2, v3, v4, v5, v6);
}

void dskeychainRcp::DeleteKeychainItem()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "dskeychain::DeleteKeychainItem: %p", v2, v3, v4, v5, v6);
}

void dskeychainRcp::AddDataSet(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "dskeychain::AddDataSet: Empty data, len = %d", (uint8_t *)v1, 8u);
}

void dskeychainRcp::AddDataSet()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Pending dataset: SecItemPersistKeychainWritesAtHighPerformanceCost Error", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "dskeychain::AddDataSet: Pending Dataset: Invoking SecItemPersistKeychainWritesAtHighPerformanceCost", v2, v3, v4, v5, v6);
}

void dskeychainRcp::FindDataSet()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "dskeychain::FindDataSet: Incorrect DataSet Type specified", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "dskeychain::FindDataSet: Unable to find the keychain item", v2, v3, v4, v5, v6);
}

void dskeychainRcp::FindAndGetDataSet()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "dskeychain::FindAndGetDataSet: Unable to find the keychain item", v2, v3, v4, v5, v6);
}

void XPCIPCAPI_v1_rcp::interface_update_accessory_addr(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a1, a3, "Missing ipaddr_lookup", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a1, a3, "Missing host_info", a5, a6, a7, a8, 0);
}

void XPCIPCAPI_v1_rcp::interface_update_accessory_addr(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 50;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "String size exceeded for inputs [max= %d]", (uint8_t *)v1, 8u);
}

void XPCIPCAPI_v1_rcp::interface_prop_get_handler(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "interface_prop_get_handler";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: reconnect_thread_network", (uint8_t *)&v1, 0xCu);
}

void boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::string const&,boost::any const&),boost::function<void ()(std::string const&,boost::any const&)>>,boost::signals2::mutex>::connection_body(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)OUTLINED_FUNCTION_2_1(a1, a2);
  if (!v6)
  {
    do
    {
      v4 -= 24;
      boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v4);
    }
    while (v4 != v2);
    uint64_t v5 = *(void **)v3;
  }
  *(void *)(v3 + 8) = v2;

  operator delete(v5);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t vars8;

  uint64_t v5 = (void *)OUTLINED_FUNCTION_2_1(a1, a2);
  if (!v6)
  {
    do
      OUTLINED_FUNCTION_4_1();
    while (v4 != v2);
    uint64_t v5 = *(void **)v3;
  }
  *(void *)(v3 + 8) = v2;

  operator delete(v5);
}

void std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::vector(uint64_t *a1, void *a2, void **a3)
{
  uint64_t v5 = *a1;
  char v6 = a2;
  if ((void *)v5 != a2)
  {
    do
    {
      v5 -= 24;
      boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v5);
    }
    while ((void *)v5 != a2);
    char v6 = *a3;
  }
  *a1 = (uint64_t)a2;

  operator delete(v6);
}

uint64_t boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::apply_visitor<boost::signals2::detail::lock_weak_ptr_visitor const>()
{
  OUTLINED_FUNCTION_0_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t boost::detail::sp_pointer_construct<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::string const&,boost::any const&),boost::function<void ()(std::string const&,boost::any const&)>>,boost::signals2::mutex>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::string const&,boost::any const&),boost::function<void ()(std::string const&,boost::any const&)>>,boost::signals2::mutex>>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void InternalClientsInterface::InternalClientsInterface(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "OTD InternalClientsInterface Server - Started", v1, 2u);
}

void HostCmdTask::free_apidata(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RcpHostContext::GetThreadStartMetrics()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %d", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %d", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %d", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %u ms", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %u ms", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %u ms", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %u ms", v2, v3, v4, v5, 2u);
}

void RcpHostContext::is_device_state_valid_for_service_or_route_modification()
{
  OUTLINED_FUNCTION_6_0(__stack_chk_guard);
  int v2 = 136315138;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "wrong NCP state for service/route add: %s", (uint8_t *)&v2, 0xCu);
}

void RcpHostContext::handle_rcp_reset(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "handle_rcp_reset:: status[%d]", (uint8_t *)v2, 8u);
}

void RcpHostContext::handle_hard_reset(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RcpHostContext::captureABC()
{
  OUTLINED_FUNCTION_6_0(__stack_chk_guard);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "%s:: rcp state[%s]", v2, v3, v4, v5, 2u);
}

void RcpHostContext::too_many_partitions(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RcpHostContext::too_many_partitions(uint64_t a1, uint64_t *a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 776);
  uint64_t v4 = *(void *)(a1 + 768);
  uint64_t v5 = *a2;
  v6[0] = 67109632;
  v6[1] = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "numPartitions=%d, Partition-time-Sec=%ld, Curr-Time-Sec=%ld", (uint8_t *)v6, 0x1Cu);
}

void InternalIPCAPI::received_network_diagnostics_response(void *a1, uint64_t *a2, os_log_t log)
{
  int v3 = *a1 - *a2;
  if (*a2 == *a1) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *a2;
  }
  int v5 = 136315650;
  char v6 = "received_network_diagnostics_response";
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 2080;
  uint64_t v10 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ERROR %s got empty data in response length=%d data=%s", (uint8_t *)&v5, 0x1Cu);
}

void InternalIPCAPI::received_network_diagnostics_response(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "received_network_diagnostics_response";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s any_cast to convert the value to type Data failed \n", (uint8_t *)&v1, 0xCu);
}

void InternalIPCAPI::interface_send_network_diagnostics_req(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "TDM: WPANTUND_v1 Error dest_addr_len=%d does not match sizeof(dest)=%d\n", (uint8_t *)v2, 0xEu);
}

uint64_t boost::_bi::storage6<boost::_bi::value<InternalIPCAPI *>,boost::arg<1>,boost::_bi::value<boost::any>,boost::_bi::value<std::string>,boost::_bi::value<std::string>,boost::_bi::value<std::string>>::storage6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void boost::signals2::slot<void ()(std::string const&,boost::any const&),boost::function<void ()(std::string const&,boost::any const&)>>::slot<boost::_bi::bind_t<void,void (*)(std::string const&,boost::any const&),boost::_bi::list2<boost::arg<1>,boost::arg<2>>>>(void **a1)
{
  int v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    int v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 24;
        boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v3);
      }
      while ((void *)v3 != v1);
      int v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
  }
}

void createTmpSubDir(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set user directory suffix: com.apple.threadradiod", v1, 2u);
}

void boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::string const&,boost::any const&),boost::function<void ()(std::string const&,boost::any const&)>>,boost::signals2::mutex>::connection_body(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  int v5 = a2;
  if ((void *)v4 != a2)
  {
    do
    {
      v4 -= 24;
      boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v4);
    }
    while ((void *)v4 != a2);
    int v5 = *(void **)a1;
  }
  *(void *)(a1 + 8) = a2;

  operator delete(v5);
}

void ___Z17create_xpc_serverP16dispatch_queue_sS0__block_invoke_cold_2(const std::exception *a1)
{
  std::exception::what(a1);
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v1, v2, "xpc_server_helper: Unable to start InternalClient-IPC \"%s\"", v3, v4, v5, v6, 2u);
}

void ___Z17create_xpc_serverP16dispatch_queue_sS0__block_invoke_cold_4(const std::exception *a1)
{
  std::exception::what(a1);
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v1, v2, "xpc_server_helper: Unable to start XPCIPCServer_rcp \"%s\"", v3, v4, v5, v6, 2u);
}

void delete_xpc_server(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "xpc_server_helper: delete_xpc_server called", v1, 2u);
}

void setDaemonExit_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void log_create_log_domain_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, &_os_log_default, a3, "%s: Input is null, return", a5, a6, a7, a8, 2u);
}

void log_get_logging_obg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, &_os_log_default, a3, "%s: Input is null, return default logObj", a5, a6, a7, a8, 2u);
}

void log_get_logging_obg_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, &_os_log_default, a3, "%s: Input memory is corrupt, return default logObj", a5, a6, a7, a8, 2u);
}

void log_get_logging_obg_cold_3(uint64_t a1, uint64_t a2)
{
  int v2 = 136315394;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Logging Module is not defined for SubSystem: %s, Category: %s, using default logObj", (uint8_t *)&v2, 0x16u);
}

void OpenFile1M()
{
  perror("tcsetattr");
  uint64_t v0 = "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/Rcp/host-ot-adaptation/RcpConfigHelper.cpp";
  uint64_t v1 = strrchr[abi:ne180100]("/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/Rcp/host-ot-adaptation/RcpConfigHelper.cpp", 47);
  if (v1) {
    uint64_t v0 = v1 + 1;
  }
  int v2 = otExitCodeToString(1u);
  otLogCritPlat("%s() at %s:%d: %s", "OpenFile1M", v0, 85, v2);
  handle_daemon_exit();
  exit(1);
}

void XPCIPCServer_rcp::xpc_message_handler(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Message is not a Dictionary", v1, 2u);
}

void CtrXPC::Server::create(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void CtrXPC::Server::State::create(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not create CtrXPCServer, verify parameters\n", v1, 2u);
}

uint64_t std::shared_ptr<CtrXPC::Server::State>::shared_ptr[abi:ne180100]<CtrXPC::Server::State,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 32))();
}

void HostInterpreter::ProcessDatasetUpdate()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0xEu);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessDatasetUpdate: UNKNOWN DATASET TYPE", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessDatasetUpdate: Pending Dataset Len[%d]", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessGeneratePSKc()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessGeneratePSKc: error[%d]", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessGetRcpCrashDump()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "SaveCrashLogs returned error %d", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "otPlatVendorGetVersion Error = %d", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessInitialize(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "%s, BT Load, Audio detection: current load during initialization = 0x%llx", a5, a6, a7, a8, 2u);
}

void HostInterpreter::ProcessInitialize()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "otPlatVendorGetAssignedHwMac error[%d]", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessPeekCmd()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Count value is invalid", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Process peek cmd", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessPrefixAdd()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessPrefixAdd: otBorderRouterRegister error[%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessPrefixAdd: otBorderRouterAddOnMeshPrefix error[%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessPrefixAdd: Prefix already exists", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessPrefixAdd: ParseAsIp6Prefix error[%d]", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessPrefixRemove()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessPrefixRemove: otBorderRouterRegister error[%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessPrefixRemove: otBorderRouterRemoveOnMeshPrefix error[%d]", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessPropertyGet()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "NETDATA FULL [%d]", v2, v3, v4, v5, v6);
}

{
  int v0;
  os_log_t v1;
  _DWORD v2[6];

  v2[0] = 136315394;
  OUTLINED_FUNCTION_18();
  *(_DWORD *)((char *)&v2[3] + 2) = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "HostInterpreter::ProcessPropertyGet[E(0)]: %s Leader extended address cannot be determined] leaderInfoUpdateStatus:%d", (uint8_t *)v2, 0x12u);
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_17();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0xCu);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "NO UNICAST SERVICE, NETDATA FULL [%d]:", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Leader re-election Initiated", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Leader re-election Failed err[%d]", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessPropertySet()
{
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

void HostInterpreter::ProcessRcpReportCrashInfo()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: Crash type in stability_settings = %d", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "ProcessRcpReportCrashInfo cmd", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessRcpReportCrashInfo(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HostInterpreter::ProcessRouteAdd()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessRouteAdd: otBorderRouterRegister error[%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessRouteAdd: otBorderRouterAddRoute error[%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessRouteAdd: Offmesh Prefix already exists", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessRouteAdd: ParseAsIp6Prefix error[%d]", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessRouteRemove()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessRouteRemove: otBorderRouterRegister error[%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessRouteRemove: ParseAsIp6Prefix error[%d]", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessServiceAdd()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessServiceAdd: otBorderRouterRegister error[%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessServiceAdd: otServerAddService error[%d]", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessServiceRemove(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HostInterpreter::ProcessServiceRemove()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessServiceRemove: otBorderRouterRegister error[%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessServiceRemove: otServerRemoveService error[%d]", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessThreadStop(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HostInterpreter::ProcessWedStart(char a1, char a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "ProcessWedStart";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a1 & 1;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Wed operation is in progress, reject %s request Peer Unlinking = [%d], Peer linking = [%d]", buf, 0x18u);
}

void HostInterpreter::ProcessWedStart(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  int v4 = a1[2];
  int v5 = a1[3];
  int v6 = a1[4];
  int v7 = a1[5];
  int v8 = a1[6];
  int v9 = a1[7];
  int v10 = 136317186;
  uint64_t v11 = "ProcessWedStart";
  __int16 v12 = 1024;
  int v13 = v2;
  __int16 v14 = 1024;
  int v15 = v3;
  __int16 v16 = 1024;
  int v17 = v4;
  __int16 v18 = 1024;
  int v19 = v5;
  __int16 v20 = 1024;
  int v21 = v6;
  __int16 v22 = 1024;
  int v23 = v7;
  __int16 v24 = 1024;
  int v25 = v8;
  __int16 v26 = 1024;
  int v27 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s, Attach to Peripheral, PeripheralHWMac=%x:%x:%x:%x:%x:%x:%x:%x", (uint8_t *)&v10, 0x3Cu);
}

void HostInterpreter::ProcessWedStart()
{
  v1[0] = 136315394;
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s, Attach request rejected as Peer:%s linked", (uint8_t *)v1, 0x16u);
}

{
  os_log_t v0;
  int v1[6];

  v1[0] = 136315394;
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s, RCP state = %s", (uint8_t *)v1, 0x16u);
}

void HostInterpreter::ProcessWedStart(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HostInterpreter::ProcessWedStop(uint64_t *a1, NSObject *a2)
{
  int IsEnhCslPeerUnlinking = otThreadIsEnhCslPeerUnlinking(*a1);
  otThreadIsEnhCslPeerLinking(*a1);
  *(_DWORD *)int v7 = 136315650;
  OUTLINED_FUNCTION_18();
  *(_DWORD *)&v7[7] = IsEnhCslPeerUnlinking;
  v7[9] = v5;
  int v8 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Wed operation is in progress, reject %s request Peer Unlinking = [%d], Peer linking = [%d]", (uint8_t *)v7, 0x18u);
}

void HostInterpreter::ProcessWedStop(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, a1, a3, "Not in Sleepy router mode, %s not supported", a5, a6, a7, a8, 2u);
}

void HostInterpreter::setRcpSrpSignalMeshLocalAddressTimer(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, a1, a3, "%s: Already set MeshLocalAddressTimer", a5, a6, a7, a8, 2u);
}

void HostInterpreter::clearRcpSrpSignalMeshLocalAddressTimer(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HostInterpreter::clearRcpSrpServiceABCTimer(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HostInterpreter::checkAnycastSrpServiceConvergence()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Timer Expiry: rcpSrpAnycastServiceCovergenceTimer, anycast SRP services multiple sequence did not converge", v2, v3, v4, v5, v6);
}

void HostInterpreter::checkSrpAdvertisedWithoutPrefix()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Timer Expiry: rcpSrpAdvertisedWithoutPrefixTimer, srp advertised without prefix for 1 hour", v2, v3, v4, v5, v6);
}

void HostInterpreter::checkChildRoleDetection()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Timer Expiry: childRoleDetectionTimer, device should have upgraded to router", v2, v3, v4, v5, v6);
}

void HostInterpreter::checkUnicastSrpServiceConvergence()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Timer Expiry: rcpSrpUnicastServiceCovergenceTimer, unicast SRP services did not converge", v2, v3, v4, v5, v6);
}

void HostInterpreter::checkSrpPrefixCovergence()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Timer Expiry: checkSrpPrefixCovergence, onmesh prefixes did not converge", v2, v3, v4, v5, v6);
}

void HostInterpreter::force_leader_reelection()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Leader re-election Discarded: Invalid Trigger Time", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessUpdateAccessoryAddr()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "ipaddr_add parsing error[%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "ipaddr_lookup parsing error[%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessUpdateAccessoryAddr", v2, v3, v4, v5, v6);
}

void HostInterpreter::DeviceModeConfig()
{
  *(_DWORD *)uint64_t v2 = 136315650;
  OUTLINED_FUNCTION_18();
  *(_DWORD *)&v2[7] = 9819;
  v2[9] = 2080;
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "ThreadConnection: %s:%d: Node Type:%s", (uint8_t *)v2, 0x1Cu);
}

void HostInterpreter::restore_health_metrics_from_persisted_db()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "restore_health_metrics_from_persisted_db: Copy over persisted health metrics", v2, v3, v4, v5, v6);
}

void HostInterpreter::restore_awd_stability_counters_from_persisted_db()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "restore_awd_stability_counters_from_persisted_db: Copy over persisted stability counters", v2, v3, v4, v5, v6);
}

void HostInterpreter::setExtendedMACAddressInDataSetIfAvailableinDB(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HostInterpreter::HandleDiagnosticGetResponseFromLeader(uint64_t *a1, int a2, NSObject *a3)
{
  otThreadGetLeaderRouterId(*a1);
  OUTLINED_FUNCTION_21();
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "HostInterpreter::HandleDiagnosticGetResponseFromLeader Leader rloc16:0x%x does not match DIAG rsp rloc16:0x%x", v5, 0xEu);
}

void HostInterpreter::HandleDiagGetSingleHopPeerResponseIPAddr(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HostInterpreter::HandleDiagGetSingleHopPeerResponseIPAddr()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "%s: for peer:%s", v2, v3, v4, v5, 2u);
}

void HostInterpreter::HandleDiagnosticGetResponse()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "TDM HostInterpreter::HandleDiagnosticGetResponse MessageInfo is nullptr", v2, v3, v4, v5, v6);
}

void HostInterpreter::HandleDiagnosticGetResponse(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HostInterpreter::remove_all_address_prefix_route_entries(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "HostInterpreter::remove_all_address_prefix_route_entries: otBorderRouterRemoveRoute success", buf, 2u);
}

{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "HostInterpreter::remove_all_address_prefix_route_entries: otBorderRouterRemoveOnMeshPrefix success", buf, 2u);
}

void HostInterpreter::ProcessUpdateLeaderInfo()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessUpdateLeaderInfo Leader info did not change, return here leaderRloc16=0x%x", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "HostInterpreter::ProcessUpdateLeaderInfo Leader is current node, return here rloc16=0x%x", v2, v3, v4, v5, v6);
}

void HostInterpreter::ProcessDiagGetSingleHopPeerMeshLocalIPAddr()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: Neighbours Found count=[%d]", v2, v3, v4, v5, 2u);
}

void HostInterpreter::ProcessDiagGetSingleHopPeerMeshLocalIPAddr(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *((unsigned __int16 *)a1 + 4);
  int v3 = *a1;
  int v4 = a1[1];
  int v5 = a1[2];
  int v6 = a1[3];
  int v7 = a1[4];
  int v8 = a1[5];
  int v9 = a1[6];
  int v10 = a1[7];
  int v11 = 136317442;
  __int16 v12 = "ProcessDiagGetSingleHopPeerMeshLocalIPAddr";
  __int16 v13 = 1024;
  int v14 = v2;
  __int16 v15 = 1024;
  int v16 = v3;
  __int16 v17 = 1024;
  int v18 = v4;
  __int16 v19 = 1024;
  int v20 = v5;
  __int16 v21 = 1024;
  int v22 = v6;
  __int16 v23 = 1024;
  int v24 = v7;
  __int16 v25 = 1024;
  int v26 = v8;
  __int16 v27 = 1024;
  int v28 = v9;
  __int16 v29 = 1024;
  int v30 = v10;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: DUT Child Role, New Parent Rloc: 0x%04x , Extaddr: %02X%02X%02X%02X%02X%02X%02X%02X", (uint8_t *)&v11, 0x42u);
}

void HostInterpreter::ProcessDiagGetSingleHopPeerMeshLocalIPAddr(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "ProcessDiagGetSingleHopPeerMeshLocalIPAddr";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: start setRcpSrpSignalMeshLocalAddressTimer", buf, 0xCu);
}

void HostInterpreter::GetRcpStateInfo()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "RCP status dump end", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "Role Leader: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "Role Router: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "Role Child: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "Role Detached: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "Role Disabled: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "MLE Counters:", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "HomeKitMsgErrorRatePercent: %u%%", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "MatterMsgErrorRatePercent: %u%%", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "IP Counters:", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "| Role | RLOC16 | ExtendedAddress  | Avg RSSI | Last RSSI | Age | ThreadVersion|Router IdSeq|Leader fDataV|Leader sDataV| MMER | HMER", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "Neighbours and Children:", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "CoapQueue.mNumBuffers: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "CoapQueue.mNumMessages: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "MleQueue.mNumBuffers: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "MleQueue.mNumMessages: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "MplQueue.mNumBuffers: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "MplQueue.mNumMessages: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "Ip6Queue.mNumBuffers: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "Ip6Queue.mNumMessages: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "6loReassemblyQueue.mNumBuffers: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "6loReassemblyQueue.mNumMessages: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "6loSendQueue.mNumBuffers: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "6loSendQueue.mNumMessages: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "FreeBuffers: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "TotalBuffers: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "Message Buffers:", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "IPv6 Addresses:", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "partition_id: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "ExtendedAddress: %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "RCP status dump begin", v2, v3, v4, v5, v6);
}

void HostInterpreter::GetThreadHealthMetrics()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %u", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %u", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %u", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %u", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %u", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "%s: %u", v2, v3, v4, v5, 2u);
}

void HostInterpreter::persist_awd_stability_counters()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "persist_awd_stability_counters: Persist updated stability counters", v2, v3, v4, v5, v6);
}

void HostInterpreter::save_awd_stability_counters(const __CFString *a1, int a2, os_log_t log)
{
  int v6 = xmmword_1004B5FE8;
  int v5 = DWORD1(xmmword_1004B5FE8);
  uint64_t v7 = *((void *)&xmmword_1004B5FE8 + 1);
  if (a1)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    CStringPtr = CFStringGetCStringPtr(a1, SystemEncoding);
  }
  else
  {
    CStringPtr = " ";
  }
  v11[0] = 67110914;
  v11[1] = v6;
  __int16 v12 = 1024;
  int v13 = v5;
  __int16 v14 = 2048;
  uint64_t v15 = v7;
  __int16 v16 = 2080;
  __int16 v17 = CStringPtr;
  __int16 v18 = 1024;
  int v19 = a2;
  __int16 v20 = 1024;
  int v21 = xmmword_1004B5FF8;
  __int16 v22 = 1024;
  int v23 = DWORD1(xmmword_1004B5FF8);
  __int16 v24 = 1024;
  int v25 = WORD4(xmmword_1004B5FF8);
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "\nFault Block Random Id: %u \nCrash Type: %d \nTimestamp(ms): %llu \nTimestamp(format): [%s.%03d]\nAddress: 0x%0x \nLine: %d \nCrash Count: %d", (uint8_t *)v11, 0x3Au);
}

void HostInterpreter::SaveCrashLogs()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Crash dumps not saved. Failed to get radio version", v2, v3, v4, v5, v6);
}

void HostInterpreter::processCommand()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "HostInterpreter::processCommand [%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "=====> processHostCmd[HOST_CMD_NULL/HOST_CMD_DEFAULT_OTCTL]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "=====> processHostCmd[HOST_CMD_CONFIG_DEEP_SLEEP]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "=====> processHostCmd[HOST_CMD_DIAG_GET_DEVICE_DATA]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "=====> processHostCmd[HOST_CMD_UPDATE_ACCESSORY_ADDR]", v2, v3, v4, v5, v6);
}

void HostInterpreter::rcp_ot_dataset_update()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "rcp_ot_dataset_update: Invalid data_in/length", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Invalid dataset type [%d]", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Dataset format changed", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Conversion to RCP dataset failed", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Spinel Data decode failure, trying conversion to RCP", v2, v3, v4, v5, v6);
}

void processXpcOtctl()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "processXpcOtctl, aBuf is NULL. aBufLength[%d]", v2, v3, v4, v5, v6);
}

void boost::any::any<std::list<std::map<std::string,boost::any>> &>(uint64_t **a1, uint64_t *a2, void *a3)
{
  OUTLINED_FUNCTION_13(a1, a2, a3);
  if (!v5)
  {
    uint64_t v6 = v4;
    do
    {
      uint64_t v7 = *(void *)(v3 + 8);
      std::__tree<std::__value_type<std::string,boost::any>,std::__map_value_compare<std::string,std::__value_type<std::string,boost::any>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,boost::any>>>::destroy(v3 + 16, *(char **)(v3 + 24));
      operator delete((void *)v3);
      uint64_t v3 = v7;
    }
    while (v7 != v6);
  }
}

uint64_t std::vector<ServiceEntry>::__init_with_size[abi:ne180100]<ServiceEntry*,ServiceEntry*>()
{
  OUTLINED_FUNCTION_14();
  do
  {
    v3 -= 80;
    uint64_t v4 = OUTLINED_FUNCTION_15();
    uint64_t result = v5(v4);
    v2 -= 80;
    BOOL v7 = v1 == v0;
    uint64_t v1 = v3;
  }
  while (!v7);
  return result;
}

void (***std::vector<ServiceEntry>::__push_back_slow_path<ServiceEntry const&>(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    char v5 = *v4;
    v4 += 10;
    (*v5)();
    v3 += 10;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

void __main_block_invoke(uint64_t a1)
{
  do
  {
    while (1)
    {
      otTaskletsProcess(*(void *)(a1 + 32));
      bzero(buf, 0x180uLL);
      int v23 = -1;
      uint64_t v24 = 10;
      int v25 = 0;
      otSysMainloopUpdate(*(ot::Posix::Mainloop::Manager **)(a1 + 32), (uint64_t)buf);
      int v2 = gPfdX;
      if (__darwin_check_fd_set_overflow(gPfdX, buf, 0)) {
        *(_DWORD *)&buf[((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFFCLL] |= 1 << v2;
      }
      int v3 = v23 <= gPfdX + 1 ? gPfdX + 1 : v23;
      int v23 = v3;
      if (hostCmdPending())
      {
        uint64_t v24 = 0;
        int v25 = 0;
      }
      if ((otSysMainloopPoll((uint64_t)buf) & 0x80000000) != 0) {
        break;
      }
      otSysMainloopProcess(*(ot::Posix::Mainloop::Manager **)(a1 + 32), buf);
      processHostCmd();
    }
  }
  while (*__error() == 4);
  perror("select");
  logging_obg = log_get_logging_obg("com.apple.threadradiod", "default");
  if (!logging_obg)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v15 = 136315394;
    __int16 v16 = "com.apple.wpantund.ncp";
    __int16 v17 = 2080;
    __int16 v18 = "default";
    BOOL v7 = &_os_log_default;
    uint64_t v6 = "Logging1 Module is not defined for SubSystem: %s, Category: %s";
    uint32_t v8 = 22;
    goto LABEL_23;
  }
  char v5 = logging_obg;
  if (syslog_is_the_mask_enabled(3) && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v15) = 0;
    uint64_t v6 = "Main Loop:: Select() fail";
    BOOL v7 = v5;
    uint32_t v8 = 2;
LABEL_23:
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v15, v8);
  }
LABEL_16:
  Main = CFRunLoopGetMain();
  int v10 = log_get_logging_obg("com.apple.threadradiod", "default");
  if (v10)
  {
    int v11 = v10;
    if (syslog_is_the_mask_enabled(3) && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v12 = "Exit Main run loop";
      int v13 = v11;
      uint32_t v14 = 2;
LABEL_25:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "com.apple.wpantund.ncp";
    __int16 v21 = 2080;
    __int16 v22 = "default";
    int v13 = &_os_log_default;
    __int16 v12 = "Logging1 Module is not defined for SubSystem: %s, Category: %s";
    uint32_t v14 = 22;
    goto LABEL_25;
  }
  CFRunLoopStop(Main);
}

void handle_captureABC()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "[-RCP-]: TX grant denied too many times", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "[-RCP-]: Invalid argument received", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "[-RCP-]: Got a corrupted RCP Vendor version", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "[-RCP-]: RCP critical log received", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "[-RCP-]: STREAM_DEBUG when TX Transmission in progress", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "[-RCP-]: RCP INVALID STATE", v2, v3, v4, v5, v6);
}

void handle_settings_captureABC(char a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "handle_settings_captureABC: platformSettingsDelete firstWrite[%d] rVal[%d]", (uint8_t *)v3, 0xEu);
}

void handle_host_reset_dueto_rcp_captureABC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_getnextframe_captureABC()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "handle_getnextframe_captureABC", v2, v3, v4, v5, v6);
}

void handle_hdlc_waitforframe_captureABC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_hdlc_write_captureABC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_daemon_exit()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "handle_daemon_exit called", v2, v3, v4, v5, v6);
}

void host_clear_health_metrics(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void host_crash_dump_collection()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "host_crash_dump_collection called", v2, v3, v4, v5, v6);
}

void resetThreadWedSession()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup due to Device startup, setting ThreadSession OFF", v2, v3, v4, v5, v6);
}

void processHostSystemStartActionsBasedOnTime()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup due to Device startup", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup after a prior Threadradiod crash", v2, v3, v4, v5, v6);
}

void processHostSystemStartActions()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup: Fall back to processHostSystemStartActionsBasedOnTime", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup: System Boot Session UUID not present in persistence", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup: startup after a prior Threadradiod crash", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup: startup on Boot", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup: System Boot Session UUID persisted = %s", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup: System Boot Session UUID parsed = %s", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup: System Boot Session UUID parse Failure", v2, v3, v4, v5, v6);
}

void update_stabilitymetrics_host_for_periodic_ca_metrics()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "update_stabilitymetrics_host_for_periodic_ca_metrics numHostResets:%s", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "update_stabilitymetrics_host_for_periodic_ca_metrics numHostReboots:%s", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "Size of kCAPeriodicCounters_Num_Daemon_Restart_Reboots : %d, String is : %s. Reseting it to 1.", v2, v3);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "Size of kCAPeriodicCounters_Num_Daemon_Restart_Crashes : %d, String is : %s. Reseting it to 1.", v2, v3);
}

void update_stabilitymetrics_host_for_triggerbased_ca_metrics()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "update_stabilitymetrics_host_for_triggerbased_ca_metrics numHostResets:%s", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "update_stabilitymetrics_host_for_triggerbased_ca_metrics numHostReboots:%s", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "Size of kCATriggerBasedCounters_Num_Daemon_Restart_Reboots : %d, String is : %s. Reseting it to 1.", v2, v3);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11_0((void *)&_mh_execute_header, v0, v1, "Size of kCATriggerBasedCounters_Num_Daemon_Restart_Crashes : %d, String is : %s. Reseting it to 1.", v2, v3);
}

void handle_xpc_output_nobuff(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void isiPad(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void isMac(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void main_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void main_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "otInstanceFinalize:: Exit Main run loop", v2, v3, v4, v5, v6);
}

void main_cold_11()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Threadradiod startup: Feature flag: Init", v2, v3, v4, v5, v6);
}

void main_cold_13(const std::runtime_error *a1)
{
  std::runtime_error::what(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v1, v2, "Runtime error thrown while starting up, \"%s\"", v3, v4, v5, v6, v7);
}

void main_cold_15(const std::exception *a1)
{
  std::exception::what(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v1, v2, "Exception thrown while starting up, \"%s\"", v3, v4, v5, v6, v7);
}

void main_cold_17()
{
  OUTLINED_FUNCTION_5_0();
  __int16 v2 = 1024;
  int v3 = 20;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Flash contains Tx power value(%s) which is invalid. Restoring to new default(%d)", v1, 0x12u);
}

void main_cold_20()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "Size of kAWDStabilityCounters_Num_Daemon_Restart : %d, String is : %s. Reseting it to 1.", v2, v3);
}

void main_cold_24()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "kAWDStabilityCounters_Num_Daemon_Restart setting to 0", v2, v3, v4, v5, v6);
}

void main_cold_26()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "kAWDStabilityCounters_Num_Daemon_Restart", v2, v3, v4, v5, v6);
}

void main_cold_28()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "KB_DEBUG : Error write fcntl-F_SETFL", v2, v3, v4, v5, v6);
}

void main_cold_30()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "KB_DEBUG : Error write fcntl-F_GETFL", v2, v3, v4, v5, v6);
}

void main_cold_32()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "KB_DEBUG : Error read fcntl-F_SETFL", v2, v3, v4, v5, v6);
}

void main_cold_34()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "KB_DEBUG : Error read fcntl-F_GETFL", v2, v3, v4, v5, v6);
}

void main_cold_36()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, " KB_DEBUG : Error opening pipe, bailing out\n", v2, v3, v4, v5, v6);
}

void main_cold_38()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Time since system start: %llu sec", v2, v3, v4, v5, v6);
}

void main_cold_40()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "Couldn't remove TC and HomeKey related keys from Plist file", v2, v3, v4, v5, v6);
}

void main_cold_42(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Thread feature is disabled, threadservice : %d", buf, 8u);
}

void main_cold_44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void main_cold_46(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t boost::filesystem::detail::recursive_directory_iterator_construct(void *a1, char a2, uint64_t *a3)
{
  __cxa_begin_catch(a1);
  if (a2) {
    return 1;
  }
  OUTLINED_FUNCTION_0_2();
  if (v7 || ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 48))(v6, 12) & 1) != 0) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 2;
  }
  uint64_t result = 0;
  *a3 = v8;
  return result;
}

void boost::filesystem::detail::recursive_directory_iterator_increment(void *a1, uint64_t *a2)
{
  __cxa_begin_catch(a1);
  OUTLINED_FUNCTION_0_2();
  if (v4 || ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 48))(v3, 12) & 1) != 0) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  *a2 = v5;
}

void otbr::Mdns::PublisherMDnsSd::Update()
{
  __assert_rtn("Update", "mdns_mdnssd.cpp", 305, "fd != -1");
}

{
  __assert_rtn("Update", "mdns_mdnssd.cpp", 290, "serviceReg.GetServiceRef() != nullptr");
}

void otbr::Mdns::PublisherMDnsSd::ServiceRef::Update()
{
  __assert_rtn("Update", "mdns_mdnssd.cpp", 855, "fd != -1");
}

void otbr::Mdns::PublisherMDnsSd::ServiceRef::Process()
{
  __assert_rtn("Process", "mdns_mdnssd.cpp", 870, "fd != -1");
}

void otbr::Mdns::DNSErrorToString()
{
}

uint64_t otbr::Mdns::PublisherMDnsSd::PublishServiceImpl(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void otbr::Mdns::PublisherMDnsSd::ServiceSubscription::Browse()
{
  __assert_rtn("Browse", "mdns_mdnssd.cpp", 881, "mServiceRef == nullptr");
}

void otbr::Mdns::PublisherMDnsSd::UnsubscribeService()
{
  __assert_rtn("UnsubscribeService", "mdns_mdnssd.cpp", 764, "it != mSubscribedServices.end()");
}

void otbr::Mdns::PublisherMDnsSd::UnsubscribeHost()
{
  __assert_rtn("UnsubscribeHost", "mdns_mdnssd.cpp", 814, "it != mSubscribedHosts.end()");
}

void otbr::Mdns::PublisherMDnsSd::ServiceInstanceResolution::Resolve()
{
  __assert_rtn("Resolve", "mdns_mdnssd.cpp", 1072, "mServiceRef == nullptr");
}

void otbr::Mdns::PublisherMDnsSd::ServiceSubscription::RemoveInstanceResolution()
{
  __assert_rtn("RemoveInstanceResolution", "mdns_mdnssd.cpp", 976, "it != mResolvingInstances.end()");
}

void otbr::Mdns::PublisherMDnsSd::ServiceInstanceResolution::GetAddrInfo()
{
  __assert_rtn("GetAddrInfo", "mdns_mdnssd.cpp", 1148, "mServiceRef == nullptr");
}

void otbr::Mdns::Publisher::RemoveSubscriptionCallbacks()
{
}

{
  __assert_rtn("RemoveSubscriptionCallbacks", "mdns.cpp", 164, "erased == 1");
}

void otbr::Mdns::Publisher::AddSubscriptionCallbacks()
{
}

void otbr::Ncp::ControllerOpenThread::Init()
{
  __assert_rtn("Init", "ncp_openthread.cpp", 247, "mInstance != nullptr");
}

void otbr::Ncp::ControllerOpenThread::Deinit()
{
  __assert_rtn("Deinit", "ncp_openthread.cpp", 320, "mInstance != nullptr");
}

void otbr::agent::ThreadHelper::AttachAllNodesTo()
{
}

void otbr::MainloopManager::AddMainloopProcessor()
{
  __assert_rtn("AddMainloopProcessor", "mainloop_manager.cpp", 36, "aMainloopProcessor != nullptr");
}

void otbr::Ncp::ControllerOpenThread::GetInstance()
{
  __assert_rtn("GetInstance", "ncp_openthread.hpp", 118, "mInstance != nullptr");
}

void otbrLogSetLevel()
{
  __assert_rtn("otbrLogSetLevel", "logging.cpp", 79, "aLevel >= OTBR_LOG_EMERG && aLevel <= OTBR_LOG_DEBUG");
}

void otbrLogInit()
{
}

{
  __assert_rtn("otbrLogInit", "logging.cpp", 87, "aLevel >= OTBR_LOG_EMERG && aLevel <= OTBR_LOG_DEBUG");
}

void otbrLog()
{
}

void otbrLog(const char *a1, uint64_t a2, NSObject *a3)
{
  GetPrefix(a1);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)v4, 0x16u);
}

{
  int v4[6];

  GetPrefix(a1);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: %s", (uint8_t *)v4, 0x16u);
}

void otbrLogv()
{
}

void otbrDump()
{
  __assert_rtn("otbrDump", "logging.cpp", 187, "aPrefix && (aMemory || aSize == 0)");
}

void otbr::DnsUtils::CheckHostnameSanity()
{
}

{
  __assert_rtn("CheckHostnameSanity", "dns_utils.cpp", 81, "aHostName.back() == '.'");
}

void otbr::DnsUtils::CheckServiceNameSanity()
{
}

{
  __assert_rtn("CheckServiceNameSanity", "dns_utils.cpp", 92, "aServiceName[aServiceName.length() - 1] != '.'");
}

{
  __assert_rtn("CheckServiceNameSanity", "dns_utils.cpp", 94, "dotpos != std::string::npos");
}

{
  __assert_rtn("CheckServiceNameSanity", "dns_utils.cpp", 95, "dotpos == aServiceName.find_last_of('.')");
}

uint64_t AWDPostMetric()
{
  return _AWDPostMetric();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t AnalyticsSendExplodingEventLazy()
{
  return _AnalyticsSendExplodingEventLazy();
}

uint64_t AppleConvergedTransportRegisterEventBlockQ()
{
  return _AppleConvergedTransportRegisterEventBlockQ();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return _CFDateFormatterCreate(allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return _CFDateFormatterCreateStringWithDate(allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

uint64_t CFDictionaryGetTypedValue()
{
  return _CFDictionaryGetTypedValue();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNetServiceBrowserRef CFNetServiceBrowserCreate(CFAllocatorRef alloc, CFNetServiceBrowserClientCallBack clientCB, CFNetServiceClientContext *clientContext)
{
  return _CFNetServiceBrowserCreate(alloc, clientCB, clientContext);
}

void CFNetServiceBrowserInvalidate(CFNetServiceBrowserRef browser)
{
}

void CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowserRef browser, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

Boolean CFNetServiceBrowserSearchForServices(CFNetServiceBrowserRef browser, CFStringRef domain, CFStringRef serviceType, CFStreamError *error)
{
  return _CFNetServiceBrowserSearchForServices(browser, domain, serviceType, error);
}

void CFNetServiceBrowserStopSearch(CFNetServiceBrowserRef browser, CFStreamError *error)
{
}

void CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowserRef browser, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void CFNetServiceCancel(CFNetServiceRef theService)
{
}

CFNetServiceRef CFNetServiceCreate(CFAllocatorRef alloc, CFStringRef domain, CFStringRef serviceType, CFStringRef name, SInt32 port)
{
  return _CFNetServiceCreate(alloc, domain, serviceType, name, port);
}

CFArrayRef CFNetServiceGetAddressing(CFNetServiceRef theService)
{
  return _CFNetServiceGetAddressing(theService);
}

CFStringRef CFNetServiceGetDomain(CFNetServiceRef theService)
{
  return _CFNetServiceGetDomain(theService);
}

CFStringRef CFNetServiceGetName(CFNetServiceRef theService)
{
  return _CFNetServiceGetName(theService);
}

CFStringRef CFNetServiceGetTargetHost(CFNetServiceRef theService)
{
  return _CFNetServiceGetTargetHost(theService);
}

CFStringRef CFNetServiceGetType(CFNetServiceRef theService)
{
  return _CFNetServiceGetType(theService);
}

Boolean CFNetServiceResolveWithTimeout(CFNetServiceRef theService, CFTimeInterval timeout, CFStreamError *error)
{
  return _CFNetServiceResolveWithTimeout(theService, timeout, error);
}

Boolean CFNetServiceSetClient(CFNetServiceRef theService, CFNetServiceClientCallBack clientCB, CFNetServiceClientContext *clientContext)
{
  return _CFNetServiceSetClient(theService, clientCB, clientContext);
}

void CFNetServiceUnscheduleFromRunLoop(CFNetServiceRef theService, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return _CFStringGetSystemEncoding();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t CUPrintNSError()
{
  return _CUPrintNSError();
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return _DNSServiceBrowse(sdRef, flags, interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return _DNSServiceCreateConnection(sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return _DNSServiceGetAddrInfo(sdRef, flags, interfaceIndex, protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return _DNSServiceProcessResult(sdRef);
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return _DNSServiceQueryRecord(sdRef, flags, interfaceIndex, fullname, rrtype, rrclass, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

dnssd_sock_t DNSServiceRefSockFD(DNSServiceRef sdRef)
{
  return _DNSServiceRefSockFD(sdRef);
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return _DNSServiceRegister(sdRef, flags, interfaceIndex, name, regtype, domain, host, port, txtLen, txtRecord, callBack, context);
}

DNSServiceErrorType DNSServiceRegisterRecord(DNSServiceRef sdRef, DNSRecordRef *RecordRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata, uint32_t ttl, DNSServiceRegisterRecordReply callBack, void *context)
{
  return _DNSServiceRegisterRecord(sdRef, RecordRef, flags, interfaceIndex, fullname, rrtype, rrclass, rdlen, rdata, ttl, callBack, context);
}

DNSServiceErrorType DNSServiceRemoveRecord(DNSServiceRef sdRef, DNSRecordRef RecordRef, DNSServiceFlags flags)
{
  return _DNSServiceRemoveRecord(sdRef, RecordRef, flags);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return _DNSServiceResolve(sdRef, flags, interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceUpdateRecord(DNSServiceRef sdRef, DNSRecordRef recordRef, DNSServiceFlags flags, uint16_t rdlen, const void *rdata, uint32_t ttl)
{
  return _DNSServiceUpdateRecord(sdRef, recordRef, flags, rdlen, rdata, ttl);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t MGIsDeviceOfType()
{
  return _MGIsDeviceOfType();
}

uint64_t NEVirtualInterfaceAddAddress()
{
  return _NEVirtualInterfaceAddAddress();
}

uint64_t NEVirtualInterfaceAddAddressWithLifetime()
{
  return _NEVirtualInterfaceAddAddressWithLifetime();
}

uint64_t NEVirtualInterfaceCopyName()
{
  return _NEVirtualInterfaceCopyName();
}

uint64_t NEVirtualInterfaceCreateNexus()
{
  return _NEVirtualInterfaceCreateNexus();
}

uint64_t NEVirtualInterfaceDupSocket()
{
  return _NEVirtualInterfaceDupSocket();
}

uint64_t NEVirtualInterfaceEnableFlowswitch()
{
  return _NEVirtualInterfaceEnableFlowswitch();
}

uint64_t NEVirtualInterfaceGetIndex()
{
  return _NEVirtualInterfaceGetIndex();
}

uint64_t NEVirtualInterfaceRemoveAddress()
{
  return _NEVirtualInterfaceRemoveAddress();
}

uint64_t NEVirtualInterfaceRemoveAllAddresses()
{
  return _NEVirtualInterfaceRemoveAllAddresses();
}

uint64_t NEVirtualInterfaceSetMTU()
{
  return _NEVirtualInterfaceSetMTU();
}

uint64_t NEVirtualInterfaceSetRankNever()
{
  return _NEVirtualInterfaceSetRankNever();
}

uint64_t NEVirtualInterfaceUpdateAdHocService()
{
  return _NEVirtualInterfaceUpdateAdHocService();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteFloatField()
{
  return _PBDataWriterWriteFloatField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t PBRepeatedUInt32Add()
{
  return _PBRepeatedUInt32Add();
}

uint64_t PBRepeatedUInt32Clear()
{
  return _PBRepeatedUInt32Clear();
}

uint64_t PBRepeatedUInt32Copy()
{
  return _PBRepeatedUInt32Copy();
}

uint64_t PBRepeatedUInt32Hash()
{
  return _PBRepeatedUInt32Hash();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return _PBRepeatedUInt32IsEqual();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return _PBRepeatedUInt32NSArray();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return _SecCopyErrorMessageString(status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

uint64_t SecItemPersistKeychainWritesAtHighPerformanceCost()
{
  return _SecItemPersistKeychainWritesAtHighPerformanceCost();
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

uint64_t TelephonyUtilGetSystemTime()
{
  return _TelephonyUtilGetSystemTime();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return _TelephonyUtilIsInternalBuild();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return _WiFiCopyCurrentNetworkInfoEx();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _SecItemAddAndNotifyOnSync()
{
  return __SecItemAddAndNotifyOnSync();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ot::AsCoreType<otInstance>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otSockAddr>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otSockAddr>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otChildInfo>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otIp6Prefix>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otIp6Prefix>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otUdpSocket>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otUdpSocket>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otBufferInfo>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otExtAddress>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otExtAddress>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otIp4Address>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otIp4Address>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otIp6Address>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otIp6Address>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otLeaderData>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otNetworkKey>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otNetworkKey>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otRouterInfo>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otDnsTxtEntry>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otIcmp6Header>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otMessageInfo>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otMessageInfo>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otNetworkName>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otNetworkName>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otUdpReceiver>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otCoapResource>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otIcmp6Handler>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otMessageQueue>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otNeighborInfo>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otNetifAddress>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otSteeringData>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otSteeringData>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otExtendedPanId>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otExtendedPanId>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otServiceConfig>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otCacheEntryInfo>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otSecurityPolicy>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otSecurityPolicy>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otJoinerDiscerner>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otJoinerDiscerner>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otMessageSettings>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otDeviceProperties>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otIp6NetworkPrefix>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otIp6NetworkPrefix>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otPingSenderConfig>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otLowpanContextInfo>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otMeshDiagChildInfo>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otBorderRouterConfig>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otBorderRouterConfig>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otCacheEntryIterator>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otCoapOptionIterator>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otOperationalDataset>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otOperationalDataset>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otDnsTxtEntryIterator>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otExternalRouteConfig>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otExternalRouteConfig>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otCommissioningDataset>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otMeshDiagChildIterator>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otNetifMulticastAddress>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otHistoryTrackerIterator>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otIp6InterfaceIdentifier>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otLinkMetricsSeriesFlags>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otMeshDiagIp6AddrIterator>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otOperationalDatasetComponents>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otPskc>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otPskc>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otMacKey>(uint64_t a1)
{
  return a1;
}

uint64_t ot::AsCoreType<otIp4Cidr>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otIp4Cidr>(a1);
  return a1;
}

uint64_t ot::AsCoreType<otMessage>(uint64_t a1)
{
  return a1;
}

{
  ot::AsCoreType<otMessage>(a1);
  return a1;
}

void ot::AsNonConst<otNetifMulticastAddress>()
{
}

{
  ot::AsNonConst<otNetifMulticastAddress>();
}

void ot::AsNonConst<ot::LinkMetrics::SeriesInfo>()
{
}

void ot::AsNonConst<ot::NetworkData::ServiceTlv>()
{
}

void ot::AsNonConst<ot::NetworkData::NetworkDataTlv>()
{
}

void ot::AsNonConst<ot::NetworkData::CommissioningDataTlv>()
{
}

void ot::AsNonConst<ot::NetworkData::PrefixTlv>()
{
}

void ot::AsNonConst<ot::AddressResolver::CacheEntry>()
{
}

void ot::AsNonConst<ot::Ip6::Udp::SocketHandle>()
{
}

void ot::AsNonConst<ot::Ip6::Netif::UnicastAddress>()
{
}

void ot::AsNonConst<ot::Ip6::Netif::MulticastAddress>()
{
}

void ot::AsNonConst<ot::Ip6::Netif::ExternalMulticastAddress>()
{
}

void ot::AsNonConst<ot::Mac::ConnectionIe>()
{
}

void ot::AsNonConst<ot::Mac::RendezvousTimeIe>()
{
}

void ot::AsNonConst<ot::Mac::Filter::FilterEntry>()
{
}

void ot::AsNonConst<ot::Coap::Message::HelpData>()
{
}

void ot::AsNonConst<ot::Child>()
{
}

void ot::AsNonConst<ot::Router>()
{
}

void ot::AsNonConst<ot::MeshCoP::ChannelMaskEntryBase>()
{
}

void ot::AsNonConst<ot::MeshCoP::Tlv>()
{
}

void ot::AsNonConst<ot::Message>()
{
}

void ot::AsNonConst<unsigned char>()
{
}

void ot::AsNonConst<unsigned short>()
{
}

void ot::LinkMetrics::MetricsValues::GetMetrics(ot::LinkMetrics::MetricsValues *this)
{
}

void ot::NetworkData::As<ot::NetworkData::ContextTlv>()
{
}

{
  ot::NetworkData::As<ot::NetworkData::ContextTlv>();
}

void ot::NetworkData::As<ot::NetworkData::ServiceTlv>()
{
}

{
  ot::NetworkData::As<ot::NetworkData::ServiceTlv>();
}

void ot::NetworkData::As<ot::NetworkData::HasRouteTlv>()
{
}

{
  ot::NetworkData::As<ot::NetworkData::HasRouteTlv>();
}

void ot::NetworkData::As<ot::NetworkData::BorderRouterTlv>()
{
}

{
  ot::NetworkData::As<ot::NetworkData::BorderRouterTlv>();
}

void ot::NetworkData::As<ot::NetworkData::CommissioningDataTlv>()
{
}

{
  ot::NetworkData::As<ot::NetworkData::CommissioningDataTlv>();
}

void ot::NetworkData::As<ot::NetworkData::PrefixTlv>()
{
}

{
  ot::NetworkData::As<ot::NetworkData::PrefixTlv>();
}

void ot::NetworkData::As<ot::NetworkData::ServerTlv>()
{
}

{
  ot::NetworkData::As<ot::NetworkData::ServerTlv>();
}

void *ot::MessageQueue::SetTail(void *this, uint64_t a2)
{
  return ot::MessageQueue::SetTail(this, a2);
}

void ot::SettingsBase::BorderAgentId::GetId(ot::SettingsBase::BorderAgentId *this)
{
}

{
  ot::SettingsBase::BorderAgentId::GetId(this);
}

void ot::AsCoapMessage()
{
}

{
  ot::AsCoapMessage();
}

void ot::AsCoreTypePtr<otIp6Address>()
{
}

void ot::AsCoreTypePtr<otLinkMetrics>()
{
}

void ot::AsCoreTypePtr<otMessageInfo>()
{
}

void ot::AsCoreTypePtr<otNetifMulticastAddress>()
{
}

double ot::BackboneRouter::MulticastListenersTable::Listener::SetAddress(__n128 *this, __n128 *a2)
{
  *(void *)&double result = ot::BackboneRouter::MulticastListenersTable::Listener::SetAddress(this, a2).n128_u64[0];
  return result;
}

double ot::AddressResolver::CacheEntry::SetTarget(__n128 *this, __n128 *a2)
{
  *(void *)&double result = ot::AddressResolver::CacheEntry::SetTarget(this, a2).n128_u64[0];
  return result;
}

void ot::AsCoapMessagePtr()
{
}

void ot::InstanceLocatorInit::Init(ot::InstanceLocatorInit *this, ot::Instance *a2)
{
}

void ot::As<ot::ExtendedTlv>()
{
}

void ot::As<ot::MeshCoP::ChannelTlv>()
{
}

{
  ot::As<ot::MeshCoP::ChannelTlv>();
}

{
  ot::As<ot::MeshCoP::ChannelTlv>();
}

void ot::As<ot::MeshCoP::DelayTimerTlv>()
{
}

{
  ot::As<ot::MeshCoP::DelayTimerTlv>();
}

{
  ot::As<ot::MeshCoP::DelayTimerTlv>();
}

void ot::As<ot::MeshCoP::NetworkKeyTlv>()
{
}

{
  ot::As<ot::MeshCoP::NetworkKeyTlv>();
}

{
  ot::As<ot::MeshCoP::NetworkKeyTlv>();
}

void ot::As<ot::MeshCoP::ChannelMaskTlv>()
{
}

{
  ot::As<ot::MeshCoP::ChannelMaskTlv>();
}

{
  ot::As<ot::MeshCoP::ChannelMaskTlv>();
}

void ot::As<ot::MeshCoP::NetworkNameTlv>()
{
}

{
  ot::As<ot::MeshCoP::NetworkNameTlv>();
}

{
  ot::As<ot::MeshCoP::NetworkNameTlv>();
}

void ot::As<ot::MeshCoP::SteeringDataTlv>()
{
}

void ot::As<ot::MeshCoP::ExtendedPanIdTlv>()
{
}

{
  ot::As<ot::MeshCoP::ExtendedPanIdTlv>();
}

{
  ot::As<ot::MeshCoP::ExtendedPanIdTlv>();
}

void ot::As<ot::MeshCoP::JoinerUdpPortTlv>()
{
}

void ot::As<ot::MeshCoP::WakeupChannelTlv>()
{
}

{
  ot::As<ot::MeshCoP::WakeupChannelTlv>();
}

{
  ot::As<ot::MeshCoP::WakeupChannelTlv>();
}

void ot::As<ot::MeshCoP::SecurityPolicyTlv>()
{
}

{
  ot::As<ot::MeshCoP::SecurityPolicyTlv>();
}

{
  ot::As<ot::MeshCoP::SecurityPolicyTlv>();
}

void ot::As<ot::MeshCoP::ActiveTimestampTlv>()
{
}

{
  ot::As<ot::MeshCoP::ActiveTimestampTlv>();
}

void ot::As<ot::MeshCoP::MeshLocalPrefixTlv>()
{
}

{
  ot::As<ot::MeshCoP::MeshLocalPrefixTlv>();
}

{
  ot::As<ot::MeshCoP::MeshLocalPrefixTlv>();
}

void ot::As<ot::MeshCoP::PendingTimestampTlv>()
{
}

void ot::As<ot::MeshCoP::BorderAgentLocatorTlv>()
{
}

void ot::As<ot::MeshCoP::CommissionerSessionIdTlv>()
{
}

void ot::As<ot::MeshCoP::Tlv>()
{
}

{
  ot::As<ot::MeshCoP::Tlv>();
}

void ot::As<ot::MeshCoP::PskcTlv>()
{
}

{
  ot::As<ot::MeshCoP::PskcTlv>();
}

{
  ot::As<ot::MeshCoP::PskcTlv>();
}

void ot::As<ot::MeshCoP::PanIdTlv>()
{
}

{
  ot::As<ot::MeshCoP::PanIdTlv>();
}

{
  ot::As<ot::MeshCoP::PanIdTlv>();
}

void ot::Cli::OutputImplementer::SetEmittingCommandOutput(ot::Cli::OutputImplementer *this)
{
}

void ot::Cli::Output::LogInput(ot::Cli::Output *this, const ot::Utils::CmdLineParser::Arg *a2)
{
}

double ot::Ip6::MessageInfo::SetPeerAddr(__n128 *this, __n128 *a2)
{
  *(void *)&double result = ot::Ip6::MessageInfo::SetPeerAddr(this, a2).n128_u64[0];
  return result;
}

double ot::Ip6::MessageInfo::SetSockAddr(__n128 *this, __n128 *a2)
{
  *(void *)&double result = ot::Ip6::MessageInfo::SetSockAddr(this, a2).n128_u64[0];
  return result;
}

double ot::Ip6::Header::SetDestination(ot::Ip6::Header *this, __n128 *a2)
{
  *(void *)&double result = ot::Ip6::Header::SetDestination(this, a2).n128_u64[0];
  return result;
}

double ot::Ip6::Header::SetSource(ot::Ip6::Header *this, __n128 *a2)
{
  *(void *)&double result = ot::Ip6::Header::SetSource(this, a2).n128_u64[0];
  return result;
}

double ot::Ip6::Address::SetBytes(__n128 *this, __n128 *a2)
{
  *(void *)&double result = ot::Ip6::Address::SetBytes(this, a2).n128_u64[0];
  return result;
}

double ot::Ip6::SockAddr::SetAddress(__n128 *this, __n128 *a2)
{
  *(void *)&double result = ot::Ip6::SockAddr::SetAddress(this, a2).n128_u64[0];
  return result;
}

void ot::Mac::KeyMaterial::GetKey(ot::Mac::KeyMaterial *this)
{
}

{
  ot::Mac::KeyMaterial::GetKey(this);
}

double ot::Mac::KeyMaterial::SetKey(__n128 *this, __n128 *a2)
{
  *(void *)&double result = ot::Mac::KeyMaterial::SetKey(this, a2).n128_u64[0];
  return result;
}

void ot::Mac::Address::GetExtended(ot::Mac::Address *this)
{
}

{
  ot::Mac::Address::GetExtended(this);
}

uint64_t ot::Mac::Address::SetExtended(uint64_t this, void *a2)
{
  return ot::Mac::Address::SetExtended(this, a2);
}

uint64_t ot::Coap::CoapBase::SetResourceHandler(uint64_t this, uint64_t a2)
{
  return ot::Coap::CoapBase::SetResourceHandler(this, a2);
}

void ot::Array<ot::Router,(unsigned short)32,unsigned char>::begin()
{
}

{
  ot::Array<ot::Router,(unsigned short)32,unsigned char>::begin();
}

void ot::Array<unsigned char,(unsigned short)32,unsigned char>::GetArrayBuffer()
{
}

void ot::Dhcp6::Server::PrefixAgent::GetAloc(ot::Dhcp6::Server::PrefixAgent *this)
{
}

double ot::Dhcp6::IaAddress::SetAddress(ot::Dhcp6::IaAddress *this, __n128 *a2)
{
  *(void *)&double result = ot::Dhcp6::IaAddress::SetAddress(this, a2).n128_u64[0];
  return result;
}

double ot::Utils::FifoHistogram<unsigned char,(short)24>::Update(uint64_t a1, char a2)
{
  *(void *)&double result = ot::Utils::FifoHistogram<unsigned char,(short)24>::Update(a1, a2).n128_u64[0];
  return result;
}

BOOL ot::Lowpan::Lowpan::IsLowpanHc(uint64_t this, const ot::FrameData *a2)
{
  return ot::Lowpan::Lowpan::IsLowpanHc(this);
}

void ot::AsConst<ot::ChildTable>()
{
}

void ot::AsConst<ot::LinkedList<ot::LinkMetrics::SeriesInfo>>()
{
}

void ot::AsConst<ot::LinkedList<ot::AddressResolver::CacheEntry>>()
{
}

void ot::AsConst<ot::LinkedList<ot::Ip6::Udp::SocketHandle>>()
{
}

void ot::AsConst<ot::LinkedList<ot::Ip6::Udp::Receiver>>()
{
}

void ot::AsConst<ot::LinkedList<ot::Ip6::Netif::UnicastAddress>>()
{
}

void ot::AsConst<ot::LinkedList<ot::Ip6::Netif::MulticastAddress>>()
{
}

void ot::AsConst<ot::LinkedList<ot::Coap::Resource>>()
{
}

void ot::AsConst<ot::LinkedList<ot::Timer>>()
{
}

void ot::AsConst<ot::NetworkData::LeaderBase>()
{
}

void ot::AsConst<ot::NetworkData::NetworkDataTlv>()
{
}

void ot::AsConst<ot::NetworkData::MutableNetworkData>()
{
}

void ot::AsConst<ot::NetworkData::PrefixTlv>()
{
}

void ot::AsConst<ot::NetworkData::ServerTlv>()
{
}

void ot::AsConst<ot::RouterTable>()
{
}

void ot::AsConst<ot::PriorityQueue>()
{
}

void ot::AsConst<ot::Mac::Frame>()
{
}

void ot::AsConst<ot::Mac::Filter>()
{
}

void ot::AsConst<ot::Coap::Message>()
{
}

void ot::AsConst<ot::Array<unsigned short,(unsigned short)2,unsigned char>>()
{
}

void ot::AsConst<ot::MeshCoP::ChannelMaskBaseTlv>()
{
}

void ot::AsConst<ot::MeshCoP::Dataset>()
{
}

void ot::AsConst<ot::Message>()
{
}

void ot::MeshCoP::Dataset::GetTlvsStart(ot::MeshCoP::Dataset *this)
{
}

{
  ot::MeshCoP::Dataset::GetTlvsStart(this);
}

double ot::MeshCoP::Dataset::Info::SetNetworkKey(__n128 *a1, __n128 *a2)
{
  *(void *)&double result = ot::MeshCoP::Dataset::Info::SetNetworkKey(a1, a2).n128_u64[0];
  return result;
}

uint64_t ot::MeshCoP::Dataset::Info::SetSecurityPolicy(uint64_t this, _DWORD *a2)
{
  return ot::MeshCoP::Dataset::Info::SetSecurityPolicy(this, a2);
}

double ot::MeshCoP::Dataset::Info::SetPskc(uint64_t a1, __n128 *a2)
{
  *(void *)&double result = ot::MeshCoP::Dataset::Info::SetPskc(a1, a2).n128_u64[0];
  return result;
}

void ot::MeshCoP::Dataset::GetBytes(ot::MeshCoP::Dataset *this)
{
}

{
  ot::MeshCoP::Dataset::GetBytes(this);
}

void ot::Neighbor::GetExtAddress(ot::Neighbor *this)
{
}

{
  ot::Neighbor::GetExtAddress(this);
}

uint64_t ctu::cf::assign()
{
  return ctu::cf::assign();
}

uint64_t ctu::hex(ctu *this, const void *a2, unint64_t a3)
{
  return ctu::hex(this, a2, a3);
}

uint64_t ctu::XpcServer::startListener_sync(ctu::XpcServer *this)
{
  return ctu::XpcServer::startListener_sync(this);
}

uint64_t ctu::XpcServer::XpcServer()
{
  return ctu::XpcServer::XpcServer();
}

void ctu::XpcServer::~XpcServer(ctu::XpcServer *this)
{
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, const char *a3)
{
  return xpc::dyn_cast_or_default(this, (const xpc::object *)a2, a3);
}

uint64_t xpc::dyn_cast_or_default()
{
  return xpc::dyn_cast_or_default();
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, BOOL a3)
{
  return xpc::dyn_cast_or_default(this, (const xpc::object *)a2, a3);
}

uint64_t xpc::bridge(xpc *this, const object *a2)
{
  return xpc::bridge(this, (const xpc::object *)a2);
}

uint64_t ot::ChildTable::GetChildIndex(uint64_t this, uint64_t a2)
{
  return ot::ChildTable::GetChildIndex(this, a2);
}

void ot::KeyManager::HashKeys::GetMleKey(ot::KeyManager::HashKeys *this)
{
}

void ot::SettingsBase::ChildInfo::GetExtAddress(ot::SettingsBase::ChildInfo *this)
{
}

void ot::AddressResolver::CacheEntry::GetTarget(ot::AddressResolver::CacheEntry *this)
{
}

void ot::Ip4::Cidr::GetBytes(ot::Ip4::Cidr *this)
{
}

void ot::Ip4::Address::GetBytes(ot::Ip4::Address *this)
{
}

void ot::Ip6::Netif::GetUnicastAddresses(ot::Ip6::Netif *this)
{
}

void ot::Ip6::Prefix::GetBytes(ot::Ip6::Prefix *this)
{
}

void ot::Ip6::Address::GetBytes(ot::Ip6::Address *this)
{
}

void ot::Ip6::Address::GetPrefix(ot::Ip6::Address *this)
{
}

void ot::Ip6::Headers::GetIp6Header(ot::Ip6::Headers *this)
{
}

void ot::Mac::Key::GetBytes(ot::Mac::Key *this)
{
}

void ot::Coap::ResponsesQueue::GetResponses(ot::Coap::ResponsesQueue *this)
{
}

void ot::Coap::CoapBase::GetRequestMessages(ot::Coap::CoapBase *this)
{
}

uint64_t ot::Coap::Resource::HandleRequest(uint64_t this, uint64_t a2, uint64_t a3)
{
  return ot::Coap::Resource::HandleRequest(this, a2, a3);
}

void ot::Array<unsigned char,(unsigned short)32,unsigned char>::begin()
{
}

void ot::Array<unsigned short,(unsigned short)2,unsigned char>::begin()
{
}

void ot::Posix::Ip6Utils::Ip6AddressString::AsCString(ot::Posix::Ip6Utils::Ip6AddressString *this)
{
}

void ot::Power::RawPowerSetting::GetData(ot::Power::RawPowerSetting *this)
{
}

void ot::Utils::FifoHistogram<unsigned char,(short)24>::GetData()
{
}

void ot::Utils::CountHistogram<(short)0,(short)127,(short)5>::GetData()
{
}

void ot::Utils::CountHistogram<(short)0,(short)255,(short)4>::GetData()
{
}

void ot::Utils::CountHistogram<(short)-41,(short)-110,(short)5>::GetData()
{
}

void ot::Crypto::Sha256::Hash::GetBytes(ot::Crypto::Sha256::Hash *this)
{
}

void ot::MeshCoP::JoinerPskd::GetAsCString(ot::MeshCoP::JoinerPskd *this)
{
}

void ot::MeshCoP::NetworkName::GetAsCString(ot::MeshCoP::NetworkName *this)
{
}

void ot::MeshCoP::NetworkNameManager::GetNetworkName(ot::MeshCoP::NetworkNameManager *this)
{
}

void ot::MeshCoP::ExtendedPanIdManager::GetExtPanId(ot::MeshCoP::ExtendedPanIdManager *this)
{
}

void ot::MeshCoP::Joiner::GetId(ot::MeshCoP::Joiner *this)
{
}

void ot::Settings::ChildInfoIterator::GetChildInfo(ot::Settings::ChildInfoIterator *this)
{
}

void ot::Settings::ChildInfoIterator::operator*()
{
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return xpc::object::to_string(this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return std::runtime_error::what(this);
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return std::error_code::message(retstr, this);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return std::string::find(this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return std::string::rfind(this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return std::string::compare(this, __s);
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

{
  return std::stringbuf::str();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return std::exception::what(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

{
  return std::runtime_error::runtime_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

{
  std::runtime_error::~runtime_error(this);
}

std::runtime_error *__cdecl std::runtime_error::operator=(std::runtime_error *this, const std::runtime_error *a2)
{
  return std::runtime_error::operator=(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::erase(this, __pos, __n);
}

void std::string::__init(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
}

void std::string::__init(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return std::string::insert(this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::insert(this, __pos, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, std::string::size_type __n, std::string::value_type __c)
{
  return std::string::insert(this, __pos, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str)
{
  return std::string::basic_string(this, __str);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

void std::string::~string(std::string *this)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::close()
{
  return std::filebuf::close();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

uint64_t std::ostream::put()
{
  return std::ostream::put();
}

uint64_t std::ostream::flush()
{
  return std::ostream::flush();
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return std::random_device::random_device(this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return std::random_device::operator()(this);
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

uint64_t std::ofstream::open()
{
  return std::ofstream::open();
}

void std::error_category::~error_category(std::error_category *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

const std::error_category *std::system_category(void)
{
  return std::system_category();
}

const std::error_category *std::generic_category(void)
{
  return std::generic_category();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return std::__shared_weak_count::lock(this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return std::stoi(__str, __idx, __base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return std::stoul(__str, __idx, __base);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return std::chrono::steady_clock::now();
}

std::chrono::system_clock::time_point std::chrono::system_clock::from_time_t(time_t __t)
{
  return std::chrono::system_clock::from_time_t(__t);
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return std::chrono::system_clock::now();
}

void std::locale::__install_ctor(std::locale *this, const std::locale *a2, std::locale::facet *a3, uint64_t a4)
{
}

uint64_t std::locale::id::__get(std::locale::id *this)
{
  return std::locale::id::__get(this);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return std::locale::locale(this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return std::locale::locale(this);
}

void std::locale::~locale(std::locale *this)
{
}

std::codecvt<wchar_t, char, mbstate_t> *__cdecl std::codecvt<wchar_t,char,__mbstate_t>::codecvt(std::codecvt<wchar_t, char, mbstate_t> *this, size_t __refs)
{
  return std::codecvt<wchar_t,char,__mbstate_t>::codecvt(this, __refs);
}

void std::codecvt<wchar_t,char,__mbstate_t>::~codecvt(std::codecvt<wchar_t, char, mbstate_t> *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

double std::allocator<ot::Ip6::Address>::construct[abi:nn180100]<ot::Ip6::Address,ot::Ip6::Address const&>(uint64_t a1, __n128 *a2, __n128 *a3)
{
  *(void *)&double result = std::allocator<ot::Ip6::Address>::construct[abi:nn180100]<ot::Ip6::Address,ot::Ip6::Address const&>(a1, a2, a3).n128_u64[0];
  return result;
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return std::to_string(retstr, __val);
}

void *std::operator<<[abi:nn180100]<std::char_traits<char>>(void *a1, char *a2)
{
  return a1;
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  return std::bad_cast::bad_cast(this);
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

{
  std::exception::~exception(this);
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return ___cxa_get_exception_ptr(a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)___dynamic_cast(lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return ___error();
}

double __exp10(double a1)
{
  return ___exp10(a1);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

uint64_t __udivti3()
{
  return ___udivti3();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

uint64_t advertising_proxy_enable()
{
  return _advertising_proxy_enable();
}

uint64_t advertising_proxy_ref_dealloc()
{
  return _advertising_proxy_ref_dealloc();
}

unsigned int alarm(unsigned int a1)
{
  return _alarm(a1);
}

uint64_t analytics_send_event_lazy()
{
  return _analytics_send_event_lazy();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bcopy(const void *a1, void *a2, size_t a3)
{
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

void cfmakeraw(termios *a1)
{
}

int chdir(const char *a1)
{
  return _chdir(a1);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void closelog(void)
{
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

double difftime(time_t a1, time_t a2)
{
  return _difftime(a1, a2);
}

char *__cdecl dirname(char *a1)
{
  return _dirname(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return _dispatch_get_current_queue();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int execvp(const char *__file, char *const *__argv)
{
  return _execvp(__file, __argv);
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return _fchmodat(a1, a2, a3, a4);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

int flock(int a1, int a2)
{
  return _flock(a1, a2);
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

pid_t forkpty(int *a1, char *a2, termios *a3, winsize *a4)
{
  return _forkpty(a1, a2, a3, a4);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return _getcwd(a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

hostent *__cdecl gethostbyname2(const char *a1, int a2)
{
  return _gethostbyname2(a1, a2);
}

int gethostname(char *a1, size_t a2)
{
  return _gethostname(a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return _kevent(kq, changelist, nchanges, eventlist, nevents, timeout);
}

int kqueue(void)
{
  return _kqueue();
}

int link(const char *a1, const char *a2)
{
  return _link(a1, a2);
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

long double log10(long double __x)
{
  return _log10(__x);
}

void longjmp(jmp_buf a1, int a2)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return _nw_interface_get_name(interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return _nw_interface_get_type(interface);
}

uint64_t nw_path_copy_interface()
{
  return _nw_path_copy_interface();
}

uint64_t nw_path_create_default_evaluator()
{
  return _nw_path_create_default_evaluator();
}

uint64_t nw_path_evaluator_copy_path()
{
  return _nw_path_evaluator_copy_path();
}

uint64_t nw_path_get_ipv4_network_signature()
{
  return _nw_path_get_ipv4_network_signature();
}

uint64_t nw_path_get_ipv6_network_signature()
{
  return _nw_path_get_ipv6_network_signature();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return _nw_path_has_ipv4(path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return _nw_path_has_ipv6(path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return _nw_path_monitor_create();
}

void nw_path_monitor_prohibit_interface_type(nw_path_monitor_t monitor, nw_interface_type_t interface_type)
{
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

uint64_t os_channel_advance_slot()
{
  return _os_channel_advance_slot();
}

uint64_t os_channel_attr_create()
{
  return _os_channel_attr_create();
}

uint64_t os_channel_attr_destroy()
{
  return _os_channel_attr_destroy();
}

uint64_t os_channel_attr_get()
{
  return _os_channel_attr_get();
}

uint64_t os_channel_create()
{
  return _os_channel_create();
}

uint64_t os_channel_destroy()
{
  return _os_channel_destroy();
}

uint64_t os_channel_get_fd()
{
  return _os_channel_get_fd();
}

uint64_t os_channel_get_next_slot()
{
  return _os_channel_get_next_slot();
}

uint64_t os_channel_read_attr()
{
  return _os_channel_read_attr();
}

uint64_t os_channel_ring_id()
{
  return _os_channel_ring_id();
}

uint64_t os_channel_rx_ring()
{
  return _os_channel_rx_ring();
}

uint64_t os_channel_set_slot_properties()
{
  return _os_channel_set_slot_properties();
}

uint64_t os_channel_sync()
{
  return _os_channel_sync();
}

uint64_t os_channel_tx_ring()
{
  return _os_channel_tx_ring();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t j__otPlatCryptoAesEncrypt(uint64_t a1, unsigned __int8 *a2, _OWORD *a3)
{
  return otPlatCryptoAesEncrypt(a1, a2, a3);
}

uint64_t j__otPlatCryptoAesFree(uint64_t a1)
{
  return otPlatCryptoAesFree(a1);
}

uint64_t j__otPlatCryptoAesInit(uint64_t a1)
{
  return otPlatCryptoAesInit(a1);
}

uint64_t j__otPlatCryptoAesSetKey(uint64_t a1, const ot::Crypto::Key *a2)
{
  return otPlatCryptoAesSetKey(a1, a2);
}

uint64_t j__otPlatCryptoHmacSha256Deinit(uint64_t a1)
{
  return otPlatCryptoHmacSha256Deinit(a1);
}

uint64_t j__otPlatCryptoHmacSha256Finish(uint64_t a1, unsigned char *a2)
{
  return otPlatCryptoHmacSha256Finish(a1, a2);
}

uint64_t j__otPlatCryptoHmacSha256Init(uint64_t a1)
{
  return otPlatCryptoHmacSha256Init(a1);
}

uint64_t j__otPlatCryptoHmacSha256Start(uint64_t a1, const ot::Crypto::Key *a2)
{
  return otPlatCryptoHmacSha256Start(a1, a2);
}

uint64_t j__otPlatCryptoHmacSha256Update(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  return otPlatCryptoHmacSha256Update(a1, a2, a3);
}

uint64_t j__otPlatCryptoInit()
{
  return otPlatCryptoInit();
}

void *j__otPlatCryptoPbkdf2GenerateKey(long long *a1, unsigned __int16 a2, const void *a3, unsigned __int16 a4, unsigned int a5, unsigned __int16 a6, char *a7)
{
  return otPlatCryptoPbkdf2GenerateKey(a1, a2, a3, a4, a5, a6, a7);
}

_DWORD *j__otPlatCryptoRandomDeinit()
{
  return otPlatCryptoRandomDeinit();
}

uint64_t j__otPlatCryptoRandomGet(uint64_t a1, unsigned __int16 a2)
{
  return otPlatCryptoRandomGet(a1, a2);
}

uint64_t j__otPlatCryptoRandomInit()
{
  return otPlatCryptoRandomInit();
}

uint64_t j__otPlatCryptoSha256Deinit(uint64_t a1)
{
  return otPlatCryptoSha256Deinit(a1);
}

uint64_t j__otPlatCryptoSha256Finish(uint64_t a1, unsigned char *a2)
{
  return otPlatCryptoSha256Finish(a1, a2);
}

uint64_t j__otPlatCryptoSha256Init(uint64_t a1)
{
  return otPlatCryptoSha256Init(a1);
}

uint64_t j__otPlatCryptoSha256Start(uint64_t a1)
{
  return otPlatCryptoSha256Start(a1);
}

uint64_t j__otPlatCryptoSha256Update(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  return otPlatCryptoSha256Update(a1, a2, a3);
}

uint64_t pathconf(const char *a1, int a2)
{
  return _pathconf(a1, a2);
}

void perror(const char *a1)
{
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int rand(void)
{
  return _rand();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return _readdir_r(a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return _readlink(a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return _recvmsg(a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return _sendmsg(a1, a2, a3);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int setjmp(jmp_buf a1)
{
  return _setjmp(a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return _socketpair(a1, a2, a3, a4);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return _strcat(__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return _strcspn(__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return _strtok(__str, __sep);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return _strtok_r(__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int tcflush(int a1, int a2)
{
  return _tcflush(a1, a2);
}

int tcgetattr(int a1, termios *a2)
{
  return _tcgetattr(a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return _tcsetattr(a1, a2, a3);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int truncate(const char *a1, off_t a2)
{
  return _truncate(a1, a2);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int utime(const char *a1, const utimbuf *a2)
{
  return _utime(a1, a2);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_dictionary(xarray, index);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

xpc_object_t xpc_null_create(void)
{
  return _xpc_null_create();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return _xpc_uint64_create(value);
}

id objc_msgSend_CAgetCoexCounter(void *a1, const char *a2, ...)
{
  return [a1 CAgetCoexCounter];
}

id objc_msgSend_CAgetPrevValidDeviceRole(void *a1, const char *a2, ...)
{
  return [a1 CAgetPrevValidDeviceRole];
}

id objc_msgSend_CtrInternalClientPtr(void *a1, const char *a2, ...)
{
  return [a1 CtrInternalClientPtr];
}

id objc_msgSend_DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation(void *a1, const char *a2, ...)
{
  return [a1 DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation];
}

id objc_msgSend_DEBUGkeyChainQueryForpreferredNetworkUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 DEBUGkeyChainQueryForpreferredNetworkUpdateOperation];
}

id objc_msgSend_PANID(void *a1, const char *a2, ...)
{
  return [a1 PANID];
}

id objc_msgSend_PSKc(void *a1, const char *a2, ...)
{
  return [a1 PSKc];
}

id objc_msgSend_TXTRecordData(void *a1, const char *a2, ...)
{
  return [a1 TXTRecordData];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_accessoryNodesCountHistograms(void *a1, const char *a2, ...)
{
  return [a1 accessoryNodesCountHistograms];
}

id objc_msgSend_accessoryNodesCountHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 accessoryNodesCountHistogramsCount];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_addresses(void *a1, const char *a2, ...)
{
  return [a1 addresses];
}

id objc_msgSend_agentChanged(void *a1, const char *a2, ...)
{
  return [a1 agentChanged];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachAttempts(void *a1, const char *a2, ...)
{
  return [a1 attachAttempts];
}

id objc_msgSend_attachFailLatencyHistograms(void *a1, const char *a2, ...)
{
  return [a1 attachFailLatencyHistograms];
}

id objc_msgSend_attachFailLatencyHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 attachFailLatencyHistogramsCount];
}

id objc_msgSend_attachLatencyHistograms(void *a1, const char *a2, ...)
{
  return [a1 attachLatencyHistograms];
}

id objc_msgSend_attachLatencyHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 attachLatencyHistogramsCount];
}

id objc_msgSend_awdServerConnection(void *a1, const char *a2, ...)
{
  return [a1 awdServerConnection];
}

id objc_msgSend_baFinderSemaphore(void *a1, const char *a2, ...)
{
  return [a1 baFinderSemaphore];
}

id objc_msgSend_backingStore(void *a1, const char *a2, ...)
{
  return [a1 backingStore];
}

id objc_msgSend_betterPartitionAttachAttempts(void *a1, const char *a2, ...)
{
  return [a1 betterPartitionAttachAttempts];
}

id objc_msgSend_bluetoothState(void *a1, const char *a2, ...)
{
  return [a1 bluetoothState];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_borderAgent(void *a1, const char *a2, ...)
{
  return [a1 borderAgent];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cachedLinkDownStatus(void *a1, const char *a2, ...)
{
  return [a1 cachedLinkDownStatus];
}

id objc_msgSend_ccaFailedAttempts(void *a1, const char *a2, ...)
{
  return [a1 ccaFailedAttempts];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_channelSelectionsHistograms(void *a1, const char *a2, ...)
{
  return [a1 channelSelectionsHistograms];
}

id objc_msgSend_channelSelectionsHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 channelSelectionsHistogramsCount];
}

id objc_msgSend_checkAndResumeNW(void *a1, const char *a2, ...)
{
  return [a1 checkAndResumeNW];
}

id objc_msgSend_checkIfMdnsIsPublishedForBAID(void *a1, const char *a2, ...)
{
  return [a1 checkIfMdnsIsPublishedForBAID];
}

id objc_msgSend_checkPreferredThreadNetworkTimerHandler(void *a1, const char *a2, ...)
{
  return [a1 checkPreferredThreadNetworkTimerHandler];
}

id objc_msgSend_checkWiFiStatus(void *a1, const char *a2, ...)
{
  return [a1 checkWiFiStatus];
}

id objc_msgSend_childNodesCount(void *a1, const char *a2, ...)
{
  return [a1 childNodesCount];
}

id objc_msgSend_childRoleCount(void *a1, const char *a2, ...)
{
  return [a1 childRoleCount];
}

id objc_msgSend_cleanBorderAgents(void *a1, const char *a2, ...)
{
  return [a1 cleanBorderAgents];
}

id objc_msgSend_cleanPreferred(void *a1, const char *a2, ...)
{
  return [a1 cleanPreferred];
}

id objc_msgSend_cleanUpThreadKeychainEntries(void *a1, const char *a2, ...)
{
  return [a1 cleanUpThreadKeychainEntries];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_clearAccessoryNodesCountHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearAccessoryNodesCountHistograms];
}

id objc_msgSend_clearAttachFailLatencyHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearAttachFailLatencyHistograms];
}

id objc_msgSend_clearAttachLatencyHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearAttachLatencyHistograms];
}

id objc_msgSend_clearChannelSelectionsHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearChannelSelectionsHistograms];
}

id objc_msgSend_clearCoexAbortsDueToGrantRevokesHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearCoexAbortsDueToGrantRevokesHistograms];
}

id objc_msgSend_clearCoexRxGrantTimeHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearCoexRxGrantTimeHistograms];
}

id objc_msgSend_clearCoexRxTotalGrantDutyCycleHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearCoexRxTotalGrantDutyCycleHistograms];
}

id objc_msgSend_clearCoexRxUnsolicitedGrantDutyCycleHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearCoexRxUnsolicitedGrantDutyCycleHistograms];
}

id objc_msgSend_clearCoexTotalGrantTimeHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearCoexTotalGrantTimeHistograms];
}

id objc_msgSend_clearCoexTxGrantTimeHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearCoexTxGrantTimeHistograms];
}

id objc_msgSend_clearCoexTxTotalGrantDutyCycleHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearCoexTxTotalGrantDutyCycleHistograms];
}

id objc_msgSend_clearCoexTxUnsolicitedGrantDutyCycleHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearCoexTxUnsolicitedGrantDutyCycleHistograms];
}

id objc_msgSend_clearFEDCounts(void *a1, const char *a2, ...)
{
  return [a1 clearFEDCounts];
}

id objc_msgSend_clearFrameTxpowerHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearFrameTxpowerHistograms];
}

id objc_msgSend_clearHostWakeupsCountHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearHostWakeupsCountHistograms];
}

id objc_msgSend_clearJoinerFailLatencyHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearJoinerFailLatencyHistograms];
}

id objc_msgSend_clearJoinerLatencyHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearJoinerLatencyHistograms];
}

id objc_msgSend_clearNbrBatteryExtensionFactorHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearNbrBatteryExtensionFactorHistograms];
}

id objc_msgSend_clearNbrTxpowerHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearNbrTxpowerHistograms];
}

id objc_msgSend_clearNodeCounts(void *a1, const char *a2, ...)
{
  return [a1 clearNodeCounts];
}

id objc_msgSend_clearPacketLqiHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearPacketLqiHistograms];
}

id objc_msgSend_clearPacketRssiNbrAccessoryHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearPacketRssiNbrAccessoryHistograms];
}

id objc_msgSend_clearPacketRssiNbrRouterHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearPacketRssiNbrRouterHistograms];
}

id objc_msgSend_clearProvideEmacTracker(void *a1, const char *a2, ...)
{
  return [a1 clearProvideEmacTracker];
}

id objc_msgSend_clearRouterCounts(void *a1, const char *a2, ...)
{
  return [a1 clearRouterCounts];
}

id objc_msgSend_clearRxPacketCountHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearRxPacketCountHistograms];
}

id objc_msgSend_clearSEDCounts(void *a1, const char *a2, ...)
{
  return [a1 clearSEDCounts];
}

id objc_msgSend_clearThreadCredentials(void *a1, const char *a2, ...)
{
  return [a1 clearThreadCredentials];
}

id objc_msgSend_clearTxCcaEnergyDetectedHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearTxCcaEnergyDetectedHistograms];
}

id objc_msgSend_clearTxCsmaBackoffHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearTxCsmaBackoffHistograms];
}

id objc_msgSend_clearTxDirectChannelaccessfailureHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearTxDirectChannelaccessfailureHistograms];
}

id objc_msgSend_clearTxDirectNoackHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearTxDirectNoackHistograms];
}

id objc_msgSend_clearTxDirectRetryAttemptsHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearTxDirectRetryAttemptsHistograms];
}

id objc_msgSend_clearTxIndirectRetryAttemptsHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearTxIndirectRetryAttemptsHistograms];
}

id objc_msgSend_clearTxPacketCountHistograms(void *a1, const char *a2, ...)
{
  return [a1 clearTxPacketCountHistograms];
}

id objc_msgSend_clearWedDevice(void *a1, const char *a2, ...)
{
  return [a1 clearWedDevice];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_coexAbortsDueToGrantRevokesHistograms(void *a1, const char *a2, ...)
{
  return [a1 coexAbortsDueToGrantRevokesHistograms];
}

id objc_msgSend_coexAbortsDueToGrantRevokesHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 coexAbortsDueToGrantRevokesHistogramsCount];
}

id objc_msgSend_coexRxDeniedRequests(void *a1, const char *a2, ...)
{
  return [a1 coexRxDeniedRequests];
}

id objc_msgSend_coexRxGrantTimeHistograms(void *a1, const char *a2, ...)
{
  return [a1 coexRxGrantTimeHistograms];
}

id objc_msgSend_coexRxGrantTimeHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 coexRxGrantTimeHistogramsCount];
}

id objc_msgSend_coexRxGrantedRequests(void *a1, const char *a2, ...)
{
  return [a1 coexRxGrantedRequests];
}

id objc_msgSend_coexRxRequests(void *a1, const char *a2, ...)
{
  return [a1 coexRxRequests];
}

id objc_msgSend_coexRxTotalGrantDutyCycleHistograms(void *a1, const char *a2, ...)
{
  return [a1 coexRxTotalGrantDutyCycleHistograms];
}

id objc_msgSend_coexRxTotalGrantDutyCycleHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 coexRxTotalGrantDutyCycleHistogramsCount];
}

id objc_msgSend_coexRxUnsolicitedGrantDutyCycleHistograms(void *a1, const char *a2, ...)
{
  return [a1 coexRxUnsolicitedGrantDutyCycleHistograms];
}

id objc_msgSend_coexRxUnsolicitedGrantDutyCycleHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 coexRxUnsolicitedGrantDutyCycleHistogramsCount];
}

id objc_msgSend_coexTotalGrantTimeHistograms(void *a1, const char *a2, ...)
{
  return [a1 coexTotalGrantTimeHistograms];
}

id objc_msgSend_coexTotalGrantTimeHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 coexTotalGrantTimeHistogramsCount];
}

id objc_msgSend_coexTxDeniedRequests(void *a1, const char *a2, ...)
{
  return [a1 coexTxDeniedRequests];
}

id objc_msgSend_coexTxGrantTimeHistograms(void *a1, const char *a2, ...)
{
  return [a1 coexTxGrantTimeHistograms];
}

id objc_msgSend_coexTxGrantTimeHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 coexTxGrantTimeHistogramsCount];
}

id objc_msgSend_coexTxGrantedRequests(void *a1, const char *a2, ...)
{
  return [a1 coexTxGrantedRequests];
}

id objc_msgSend_coexTxRequests(void *a1, const char *a2, ...)
{
  return [a1 coexTxRequests];
}

id objc_msgSend_coexTxTotalGrantDutyCycleHistograms(void *a1, const char *a2, ...)
{
  return [a1 coexTxTotalGrantDutyCycleHistograms];
}

id objc_msgSend_coexTxTotalGrantDutyCycleHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 coexTxTotalGrantDutyCycleHistogramsCount];
}

id objc_msgSend_coexTxUnsolicitedGrantDutyCycleHistograms(void *a1, const char *a2, ...)
{
  return [a1 coexTxUnsolicitedGrantDutyCycleHistograms];
}

id objc_msgSend_coexTxUnsolicitedGrantDutyCycleHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 coexTxUnsolicitedGrantDutyCycleHistogramsCount];
}

id objc_msgSend_coexUnsolicitedGrants(void *a1, const char *a2, ...)
{
  return [a1 coexUnsolicitedGrants];
}

id objc_msgSend_computedUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 computedUniqueIdentifier];
}

id objc_msgSend_configureRCP2PeriodicEvents(void *a1, const char *a2, ...)
{
  return [a1 configureRCP2PeriodicEvents];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_credentials(void *a1, const char *a2, ...)
{
  return [a1 credentials];
}

id objc_msgSend_credentialsDataSet(void *a1, const char *a2, ...)
{
  return [a1 credentialsDataSet];
}

id objc_msgSend_credentialsDataSetRecord(void *a1, const char *a2, ...)
{
  return [a1 credentialsDataSetRecord];
}

id objc_msgSend_cslLossOfSyncDueToCslTimeout(void *a1, const char *a2, ...)
{
  return [a1 cslLossOfSyncDueToCslTimeout];
}

id objc_msgSend_cslLossOfSyncDueToMaxRetx(void *a1, const char *a2, ...)
{
  return [a1 cslLossOfSyncDueToMaxRetx];
}

id objc_msgSend_cslTxErrAbort(void *a1, const char *a2, ...)
{
  return [a1 cslTxErrAbort];
}

id objc_msgSend_cslTxErrBusyChannel(void *a1, const char *a2, ...)
{
  return [a1 cslTxErrBusyChannel];
}

id objc_msgSend_cslTxErrCca(void *a1, const char *a2, ...)
{
  return [a1 cslTxErrCca];
}

id objc_msgSend_cslTxErrNoack(void *a1, const char *a2, ...)
{
  return [a1 cslTxErrNoack];
}

id objc_msgSend_cslTxTotal(void *a1, const char *a2, ...)
{
  return [a1 cslTxTotal];
}

id objc_msgSend_daemonVersion(void *a1, const char *a2, ...)
{
  return [a1 daemonVersion];
}

id objc_msgSend_dataSetArray(void *a1, const char *a2, ...)
{
  return [a1 dataSetArray];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultBackingStore(void *a1, const char *a2, ...)
{
  return [a1 defaultBackingStore];
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return [a1 defaultCStringEncoding];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultChildNode(void *a1, const char *a2, ...)
{
  return [a1 defaultChildNode];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detachedRoleCount(void *a1, const char *a2, ...)
{
  return [a1 detachedRoleCount];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_disabledRoleCount(void *a1, const char *a2, ...)
{
  return [a1 disabledRoleCount];
}

id objc_msgSend_disconnectActiveWedConnection(void *a1, const char *a2, ...)
{
  return [a1 disconnectActiveWedConnection];
}

id objc_msgSend_discriminatorId(void *a1, const char *a2, ...)
{
  return [a1 discriminatorId];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_energyDetectedEvents(void *a1, const char *a2, ...)
{
  return [a1 energyDetectedEvents];
}

id objc_msgSend_energyDetectedRequests(void *a1, const char *a2, ...)
{
  return [a1 energyDetectedRequests];
}

id objc_msgSend_extendedPANID(void *a1, const char *a2, ...)
{
  return [a1 extendedPANID];
}

id objc_msgSend_fEDCounts(void *a1, const char *a2, ...)
{
  return [a1 fEDCounts];
}

id objc_msgSend_fEDCountsCount(void *a1, const char *a2, ...)
{
  return [a1 fEDCountsCount];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_findNWs(void *a1, const char *a2, ...)
{
  return [a1 findNWs];
}

id objc_msgSend_foundAdvDuringPairing(void *a1, const char *a2, ...)
{
  return [a1 foundAdvDuringPairing];
}

id objc_msgSend_foundAdvDuringWedConnectionAttempt(void *a1, const char *a2, ...)
{
  return [a1 foundAdvDuringWedConnectionAttempt];
}

id objc_msgSend_frameTxpowerHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 frameTxpowerHistogramsCount];
}

id objc_msgSend_generateAPLifeInfoMetrics(void *a1, const char *a2, ...)
{
  return [a1 generateAPLifeInfoMetrics];
}

id objc_msgSend_generateCredentials(void *a1, const char *a2, ...)
{
  return [a1 generateCredentials];
}

id objc_msgSend_generateStateInfoEventMetrics(void *a1, const char *a2, ...)
{
  return [a1 generateStateInfoEventMetrics];
}

id objc_msgSend_geoAvailable(void *a1, const char *a2, ...)
{
  return [a1 geoAvailable];
}

id objc_msgSend_getAllMacMetrics(void *a1, const char *a2, ...)
{
  return [a1 getAllMacMetrics];
}

id objc_msgSend_getAllPrefEntries(void *a1, const char *a2, ...)
{
  return [a1 getAllPrefEntries];
}

id objc_msgSend_getAndReset2GDuration(void *a1, const char *a2, ...)
{
  return [a1 getAndReset2GDuration];
}

id objc_msgSend_getAndReset5GDuration(void *a1, const char *a2, ...)
{
  return [a1 getAndReset5GDuration];
}

id objc_msgSend_getAndReset6GDuration(void *a1, const char *a2, ...)
{
  return [a1 getAndReset6GDuration];
}

id objc_msgSend_getAndResetEthernetDuration(void *a1, const char *a2, ...)
{
  return [a1 getAndResetEthernetDuration];
}

id objc_msgSend_getAndResetOdeonDuration(void *a1, const char *a2, ...)
{
  return [a1 getAndResetOdeonDuration];
}

id objc_msgSend_getAndResetUnknownDuration(void *a1, const char *a2, ...)
{
  return [a1 getAndResetUnknownDuration];
}

id objc_msgSend_getBTAudioCallStatus(void *a1, const char *a2, ...)
{
  return [a1 getBTAudioCallStatus];
}

id objc_msgSend_getChannel(void *a1, const char *a2, ...)
{
  return [a1 getChannel];
}

id objc_msgSend_getCounterThreadSessionStoppedDueToAPOff(void *a1, const char *a2, ...)
{
  return [a1 getCounterThreadSessionStoppedDueToAPOff];
}

id objc_msgSend_getCounterThreadSessionStoppedDueToBluetoothOff(void *a1, const char *a2, ...)
{
  return [a1 getCounterThreadSessionStoppedDueToBluetoothOff];
}

id objc_msgSend_getCounterThreadSessionStoppedDueToEscoOn(void *a1, const char *a2, ...)
{
  return [a1 getCounterThreadSessionStoppedDueToEscoOn];
}

id objc_msgSend_getCounterThreadStartFailDueToBluetoothOff(void *a1, const char *a2, ...)
{
  return [a1 getCounterThreadStartFailDueToBluetoothOff];
}

id objc_msgSend_getCounterThreadStartFailDueToEscoOn(void *a1, const char *a2, ...)
{
  return [a1 getCounterThreadStartFailDueToEscoOn];
}

id objc_msgSend_getCurrentBackhaul(void *a1, const char *a2, ...)
{
  return [a1 getCurrentBackhaul];
}

id objc_msgSend_getCurrentBorderAgent(void *a1, const char *a2, ...)
{
  return [a1 getCurrentBorderAgent];
}

id objc_msgSend_getCurrentCredentialsDataSet(void *a1, const char *a2, ...)
{
  return [a1 getCurrentCredentialsDataSet];
}

id objc_msgSend_getCurrentNetworkNameAndXpanid(void *a1, const char *a2, ...)
{
  return [a1 getCurrentNetworkNameAndXpanid];
}

id objc_msgSend_getCurrentWEDInfoMetrics(void *a1, const char *a2, ...)
{
  return [a1 getCurrentWEDInfoMetrics];
}

id objc_msgSend_getDaemonAndVendorVersions(void *a1, const char *a2, ...)
{
  return [a1 getDaemonAndVendorVersions];
}

id objc_msgSend_getDefaultChildNode(void *a1, const char *a2, ...)
{
  return [a1 getDefaultChildNode];
}

id objc_msgSend_getHardwareAddress(void *a1, const char *a2, ...)
{
  return [a1 getHardwareAddress];
}

id objc_msgSend_getInterfaceName(void *a1, const char *a2, ...)
{
  return [a1 getInterfaceName];
}

id objc_msgSend_getIsAssociatedFirstTimeAfterThreadStart(void *a1, const char *a2, ...)
{
  return [a1 getIsAssociatedFirstTimeAfterThreadStart];
}

id objc_msgSend_getLeaderRouterID(void *a1, const char *a2, ...)
{
  return [a1 getLeaderRouterID];
}

id objc_msgSend_getMLAddress(void *a1, const char *a2, ...)
{
  return [a1 getMLAddress];
}

id objc_msgSend_getMLPrefix(void *a1, const char *a2, ...)
{
  return [a1 getMLPrefix];
}

id objc_msgSend_getMetricsBetweenRoleChanges(void *a1, const char *a2, ...)
{
  return [a1 getMetricsBetweenRoleChanges];
}

id objc_msgSend_getNCPChannel(void *a1, const char *a2, ...)
{
  return [a1 getNCPChannel];
}

id objc_msgSend_getNCPState(void *a1, const char *a2, ...)
{
  return [a1 getNCPState];
}

id objc_msgSend_getNCPStatusInDict(void *a1, const char *a2, ...)
{
  return [a1 getNCPStatusInDict];
}

id objc_msgSend_getNetworkPath(void *a1, const char *a2, ...)
{
  return [a1 getNetworkPath];
}

id objc_msgSend_getNetworkSignature(void *a1, const char *a2, ...)
{
  return [a1 getNetworkSignature];
}

id objc_msgSend_getNumberOfBorderAgents(void *a1, const char *a2, ...)
{
  return [a1 getNumberOfBorderAgents];
}

id objc_msgSend_getNwName(void *a1, const char *a2, ...)
{
  return [a1 getNwName];
}

id objc_msgSend_getPairingStatus(void *a1, const char *a2, ...)
{
  return [a1 getPairingStatus];
}

id objc_msgSend_getPanId(void *a1, const char *a2, ...)
{
  return [a1 getPanId];
}

id objc_msgSend_getPartitionId(void *a1, const char *a2, ...)
{
  return [a1 getPartitionId];
}

id objc_msgSend_getPersistedWedAddr(void *a1, const char *a2, ...)
{
  return [a1 getPersistedWedAddr];
}

id objc_msgSend_getPersistedWedMleid(void *a1, const char *a2, ...)
{
  return [a1 getPersistedWedMleid];
}

id objc_msgSend_getPreferredNetwork(void *a1, const char *a2, ...)
{
  return [a1 getPreferredNetwork];
}

id objc_msgSend_getPreferredNetworkWithNoScan(void *a1, const char *a2, ...)
{
  return [a1 getPreferredNetworkWithNoScan];
}

id objc_msgSend_getRCPProperties(void *a1, const char *a2, ...)
{
  return [a1 getRCPProperties];
}

id objc_msgSend_getThreadSessionStatus(void *a1, const char *a2, ...)
{
  return [a1 getThreadSessionStatus];
}

id objc_msgSend_getXPanId(void *a1, const char *a2, ...)
{
  return [a1 getXPanId];
}

id objc_msgSend_handleAdv(void *a1, const char *a2, ...)
{
  return [a1 handleAdv];
}

id objc_msgSend_handlePeriodicTimer(void *a1, const char *a2, ...)
{
  return [a1 handlePeriodicTimer];
}

id objc_msgSend_handleRouterModeFailSafeTrigger(void *a1, const char *a2, ...)
{
  return [a1 handleRouterModeFailSafeTrigger];
}

id objc_msgSend_hasDaemonVersion(void *a1, const char *a2, ...)
{
  return [a1 hasDaemonVersion];
}

id objc_msgSend_hasHeader(void *a1, const char *a2, ...)
{
  return [a1 hasHeader];
}

id objc_msgSend_hasMaxChangeinNodeCount(void *a1, const char *a2, ...)
{
  return [a1 hasMaxChangeinNodeCount];
}

id objc_msgSend_hasNumberOfPreferredNwByAppleBorderRouters(void *a1, const char *a2, ...)
{
  return [a1 hasNumberOfPreferredNwByAppleBorderRouters];
}

id objc_msgSend_hasNumberOfPreferredNwByThirdPartyBorderRouters(void *a1, const char *a2, ...)
{
  return [a1 hasNumberOfPreferredNwByThirdPartyBorderRouters];
}

id objc_msgSend_hasNumberOfThirdPartyBorderRouters(void *a1, const char *a2, ...)
{
  return [a1 hasNumberOfThirdPartyBorderRouters];
}

id objc_msgSend_hasPercTopologyChangeTimeInstances(void *a1, const char *a2, ...)
{
  return [a1 hasPercTopologyChangeTimeInstances];
}

id objc_msgSend_hasSCntrsCoex(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsCoex];
}

id objc_msgSend_hasSCntrsDiscoveryJoin(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsDiscoveryJoin];
}

id objc_msgSend_hasSCntrsEngagement(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsEngagement];
}

id objc_msgSend_hasSCntrsIp(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsIp];
}

id objc_msgSend_hasSCntrsJoiner(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsJoiner];
}

id objc_msgSend_hasSCntrsMacRx(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsMacRx];
}

id objc_msgSend_hasSCntrsMacTx(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsMacTx];
}

id objc_msgSend_hasSCntrsMle(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsMle];
}

id objc_msgSend_hasSCntrsNetwork(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsNetwork];
}

id objc_msgSend_hasSCntrsPower(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsPower];
}

id objc_msgSend_hasSCntrsRadio(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsRadio];
}

id objc_msgSend_hasSCntrsReachability(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsReachability];
}

id objc_msgSend_hasSCntrsStability(void *a1, const char *a2, ...)
{
  return [a1 hasSCntrsStability];
}

id objc_msgSend_hasSHistCoex(void *a1, const char *a2, ...)
{
  return [a1 hasSHistCoex];
}

id objc_msgSend_hasVendorVersion(void *a1, const char *a2, ...)
{
  return [a1 hasVendorVersion];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_header(void *a1, const char *a2, ...)
{
  return [a1 header];
}

id objc_msgSend_hostName(void *a1, const char *a2, ...)
{
  return [a1 hostName];
}

id objc_msgSend_hostWakeupsCount(void *a1, const char *a2, ...)
{
  return [a1 hostWakeupsCount];
}

id objc_msgSend_hostWakeupsCountHistograms(void *a1, const char *a2, ...)
{
  return [a1 hostWakeupsCountHistograms];
}

id objc_msgSend_hostWakeupsCountHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 hostWakeupsCountHistogramsCount];
}

id objc_msgSend_incrementCounterThreadSessionStoppedDueToAPOff(void *a1, const char *a2, ...)
{
  return [a1 incrementCounterThreadSessionStoppedDueToAPOff];
}

id objc_msgSend_incrementCounterThreadSessionStoppedDueToBluetoothOff(void *a1, const char *a2, ...)
{
  return [a1 incrementCounterThreadSessionStoppedDueToBluetoothOff];
}

id objc_msgSend_incrementCounterThreadSessionStoppedDueToEscoOn(void *a1, const char *a2, ...)
{
  return [a1 incrementCounterThreadSessionStoppedDueToEscoOn];
}

id objc_msgSend_incrementCounterThreadStartFailDueToBluetoothOff(void *a1, const char *a2, ...)
{
  return [a1 incrementCounterThreadStartFailDueToBluetoothOff];
}

id objc_msgSend_incrementCounterThreadStartFailDueToEscoOn(void *a1, const char *a2, ...)
{
  return [a1 incrementCounterThreadStartFailDueToEscoOn];
}

id objc_msgSend_incrementNumberOfRoleChangeInCurrentThreadSession(void *a1, const char *a2, ...)
{
  return [a1 incrementNumberOfRoleChangeInCurrentThreadSession];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initSelfHealThreadNetworkTimer(void *a1, const char *a2, ...)
{
  return [a1 initSelfHealThreadNetworkTimer];
}

id objc_msgSend_initSyslogDumpInfo(void *a1, const char *a2, ...)
{
  return [a1 initSyslogDumpInfo];
}

id objc_msgSend_initializeKeyChainStore(void *a1, const char *a2, ...)
{
  return [a1 initializeKeyChainStore];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return [a1 interfaceName];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_ipv4NwSignature(void *a1, const char *a2, ...)
{
  return [a1 ipv4NwSignature];
}

id objc_msgSend_ipv6NwSignature(void *a1, const char *a2, ...)
{
  return [a1 ipv6NwSignature];
}

id objc_msgSend_is2GHz(void *a1, const char *a2, ...)
{
  return [a1 is2GHz];
}

id objc_msgSend_is5GHz(void *a1, const char *a2, ...)
{
  return [a1 is5GHz];
}

id objc_msgSend_is6GHz(void *a1, const char *a2, ...)
{
  return [a1 is6GHz];
}

id objc_msgSend_isActiveDevice(void *a1, const char *a2, ...)
{
  return [a1 isActiveDevice];
}

id objc_msgSend_isAudioNoThreadFeatureEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAudioNoThreadFeatureEnabled];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isCurrentBTCoExLoadAvailable(void *a1, const char *a2, ...)
{
  return [a1 isCurrentBTCoExLoadAvailable];
}

id objc_msgSend_isDiscoveryScanAllowed(void *a1, const char *a2, ...)
{
  return [a1 isDiscoveryScanAllowed];
}

id objc_msgSend_isEthernetNetwork(void *a1, const char *a2, ...)
{
  return [a1 isEthernetNetwork];
}

id objc_msgSend_isFWUpdateInProgress(void *a1, const char *a2, ...)
{
  return [a1 isFWUpdateInProgress];
}

id objc_msgSend_isGeoAvailable(void *a1, const char *a2, ...)
{
  return [a1 isGeoAvailable];
}

id objc_msgSend_isLinkDown(void *a1, const char *a2, ...)
{
  return [a1 isLinkDown];
}

id objc_msgSend_isMtbfQualified(void *a1, const char *a2, ...)
{
  return [a1 isMtbfQualified];
}

id objc_msgSend_isNonWedFWUpdateProgressInChildRole(void *a1, const char *a2, ...)
{
  return [a1 isNonWedFWUpdateProgressInChildRole];
}

id objc_msgSend_isPairing(void *a1, const char *a2, ...)
{
  return [a1 isPairing];
}

id objc_msgSend_isPeriodicDiscoveryScanInProgress(void *a1, const char *a2, ...)
{
  return [a1 isPeriodicDiscoveryScanInProgress];
}

id objc_msgSend_isStateMachineWedEnabled(void *a1, const char *a2, ...)
{
  return [a1 isStateMachineWedEnabled];
}

id objc_msgSend_isThreadAlwaysOnFeatureEnabled(void *a1, const char *a2, ...)
{
  return [a1 isThreadAlwaysOnFeatureEnabled];
}

id objc_msgSend_isWedFWUpdateProgressInChildRole(void *a1, const char *a2, ...)
{
  return [a1 isWedFWUpdateProgressInChildRole];
}

id objc_msgSend_isWedSessionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWedSessionEnabled];
}

id objc_msgSend_isWiFiNetwork(void *a1, const char *a2, ...)
{
  return [a1 isWiFiNetwork];
}

id objc_msgSend_joinAttempts(void *a1, const char *a2, ...)
{
  return [a1 joinAttempts];
}

id objc_msgSend_joinSuccessRate(void *a1, const char *a2, ...)
{
  return [a1 joinSuccessRate];
}

id objc_msgSend_joinerFailLatencyHistograms(void *a1, const char *a2, ...)
{
  return [a1 joinerFailLatencyHistograms];
}

id objc_msgSend_joinerFailLatencyHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 joinerFailLatencyHistogramsCount];
}

id objc_msgSend_joinerLatencyHistograms(void *a1, const char *a2, ...)
{
  return [a1 joinerLatencyHistograms];
}

id objc_msgSend_joinerLatencyHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 joinerLatencyHistogramsCount];
}

id objc_msgSend_keyChainItemRepresentationForActiveDataSetRecordAddOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForActiveDataSetRecordAddOperation];
}

id objc_msgSend_keyChainItemRepresentationForActiveDataSetRecordUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
}

id objc_msgSend_keyChainItemRepresentationForAddOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForAddOperation];
}

id objc_msgSend_keyChainItemRepresentationForFrozenThreadNetworkAddOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForFrozenThreadNetworkAddOperation];
}

id objc_msgSend_keyChainItemRepresentationForUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForUpdateOperation];
}

id objc_msgSend_keyChainItemRepresentationForpreferredNetworkAddOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForpreferredNetworkAddOperation];
}

id objc_msgSend_keyChainItemRepresentationForpreferredNetworkUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForpreferredNetworkUpdateOperation];
}

id objc_msgSend_keyChainQueryForActiveDataSetRecordUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForActiveDataSetRecordUpdateOperation];
}

id objc_msgSend_keyChainQueryForDeleteAllCredentialsRecord(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForDeleteAllCredentialsRecord];
}

id objc_msgSend_keyChainQueryForDeleteAllPreferredNetworks(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForDeleteAllPreferredNetworks];
}

id objc_msgSend_keyChainQueryForDeleteFrozenThreadNetworkRecordsOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForDeleteFrozenThreadNetworkRecordsOperation];
}

id objc_msgSend_keyChainQueryForFetchAllActiveDataSetRecordsOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForFetchAllActiveDataSetRecordsOperation];
}

id objc_msgSend_keyChainQueryForFetchAllOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForFetchAllOperation];
}

id objc_msgSend_keyChainQueryForFetchPreferredNetworkRecordsOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForFetchPreferredNetworkRecordsOperation];
}

id objc_msgSend_keyChainQueryForFrozenThreadNetworkUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForFrozenThreadNetworkUpdateOperation];
}

id objc_msgSend_keyChainQueryForUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForUpdateOperation];
}

id objc_msgSend_keyChainQueryForpreferredNetworkUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForpreferredNetworkUpdateOperation];
}

id objc_msgSend_keychainAccessGroup(void *a1, const char *a2, ...)
{
  return [a1 keychainAccessGroup];
}

id objc_msgSend_lastKnownNCPState(void *a1, const char *a2, ...)
{
  return [a1 lastKnownNCPState];
}

id objc_msgSend_lastKnownNodeType(void *a1, const char *a2, ...)
{
  return [a1 lastKnownNodeType];
}

id objc_msgSend_lastModificationDate(void *a1, const char *a2, ...)
{
  return [a1 lastModificationDate];
}

id objc_msgSend_leaderRoleCount(void *a1, const char *a2, ...)
{
  return [a1 leaderRoleCount];
}

id objc_msgSend_leave(void *a1, const char *a2, ...)
{
  return [a1 leave];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkLossNbrChildCount(void *a1, const char *a2, ...)
{
  return [a1 linkLossNbrChildCount];
}

id objc_msgSend_linkLossNbrRouterCount(void *a1, const char *a2, ...)
{
  return [a1 linkLossNbrRouterCount];
}

id objc_msgSend_listeningTime(void *a1, const char *a2, ...)
{
  return [a1 listeningTime];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_masterKey(void *a1, const char *a2, ...)
{
  return [a1 masterKey];
}

id objc_msgSend_maxChangeinNodeCount(void *a1, const char *a2, ...)
{
  return [a1 maxChangeinNodeCount];
}

id objc_msgSend_modeChangeInProgress(void *a1, const char *a2, ...)
{
  return [a1 modeChangeInProgress];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_monitorQueue(void *a1, const char *a2, ...)
{
  return [a1 monitorQueue];
}

id objc_msgSend_msgQueue(void *a1, const char *a2, ...)
{
  return [a1 msgQueue];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nbrBatteryExtensionFactorHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 nbrBatteryExtensionFactorHistogramsCount];
}

id objc_msgSend_nbrTxpowerHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 nbrTxpowerHistogramsCount];
}

id objc_msgSend_ncpCrashReason(void *a1, const char *a2, ...)
{
  return [a1 ncpCrashReason];
}

id objc_msgSend_ncpResetType(void *a1, const char *a2, ...)
{
  return [a1 ncpResetType];
}

id objc_msgSend_network(void *a1, const char *a2, ...)
{
  return [a1 network];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return [a1 networkName];
}

id objc_msgSend_networkNodeTypeChangeNotify(void *a1, const char *a2, ...)
{
  return [a1 networkNodeTypeChangeNotify];
}

id objc_msgSend_networkSignature(void *a1, const char *a2, ...)
{
  return [a1 networkSignature];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nodeCounts(void *a1, const char *a2, ...)
{
  return [a1 nodeCounts];
}

id objc_msgSend_nodeCountsCount(void *a1, const char *a2, ...)
{
  return [a1 nodeCountsCount];
}

id objc_msgSend_noteTimeAPOn(void *a1, const char *a2, ...)
{
  return [a1 noteTimeAPOn];
}

id objc_msgSend_noteTimeWhenWEDDetachStart(void *a1, const char *a2, ...)
{
  return [a1 noteTimeWhenWEDDetachStart];
}

id objc_msgSend_notifyOnNodeStatusChange(void *a1, const char *a2, ...)
{
  return [a1 notifyOnNodeStatusChange];
}

id objc_msgSend_notifyWedUnsolictedDisconnect(void *a1, const char *a2, ...)
{
  return [a1 notifyWedUnsolictedDisconnect];
}

id objc_msgSend_numAdvDuringPairing(void *a1, const char *a2, ...)
{
  return [a1 numAdvDuringPairing];
}

id objc_msgSend_numberOfPreferredNwByAppleBorderRouters(void *a1, const char *a2, ...)
{
  return [a1 numberOfPreferredNwByAppleBorderRouters];
}

id objc_msgSend_numberOfThirdPartyBorderRouters(void *a1, const char *a2, ...)
{
  return [a1 numberOfThirdPartyBorderRouters];
}

id objc_msgSend_onThreadStartPerformDiscoveryScan(void *a1, const char *a2, ...)
{
  return [a1 onThreadStartPerformDiscoveryScan];
}

id objc_msgSend_opMode(void *a1, const char *a2, ...)
{
  return [a1 opMode];
}

id objc_msgSend_packetLqiHistograms(void *a1, const char *a2, ...)
{
  return [a1 packetLqiHistograms];
}

id objc_msgSend_packetLqiHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 packetLqiHistogramsCount];
}

id objc_msgSend_packetRssiNbrAccessoryHistograms(void *a1, const char *a2, ...)
{
  return [a1 packetRssiNbrAccessoryHistograms];
}

id objc_msgSend_packetRssiNbrAccessoryHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 packetRssiNbrAccessoryHistogramsCount];
}

id objc_msgSend_packetRssiNbrRouterHistograms(void *a1, const char *a2, ...)
{
  return [a1 packetRssiNbrRouterHistograms];
}

id objc_msgSend_packetRssiNbrRouterHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 packetRssiNbrRouterHistogramsCount];
}

id objc_msgSend_parentChangesCount(void *a1, const char *a2, ...)
{
  return [a1 parentChangesCount];
}

id objc_msgSend_partitionIdChangesCount(void *a1, const char *a2, ...)
{
  return [a1 partitionIdChangesCount];
}

id objc_msgSend_passPhrase(void *a1, const char *a2, ...)
{
  return [a1 passPhrase];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_percTopologyChangeTimeInstances(void *a1, const char *a2, ...)
{
  return [a1 percTopologyChangeTimeInstances];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_preferredRecord(void *a1, const char *a2, ...)
{
  return [a1 preferredRecord];
}

id objc_msgSend_printProvideEmacTracker(void *a1, const char *a2, ...)
{
  return [a1 printProvideEmacTracker];
}

id objc_msgSend_radioReceivedFrames(void *a1, const char *a2, ...)
{
  return [a1 radioReceivedFrames];
}

id objc_msgSend_radioStatusDoubleNotification(void *a1, const char *a2, ...)
{
  return [a1 radioStatusDoubleNotification];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_receivedEnergyEvents(void *a1, const char *a2, ...)
{
  return [a1 receivedEnergyEvents];
}

id objc_msgSend_receivedFrames(void *a1, const char *a2, ...)
{
  return [a1 receivedFrames];
}

id objc_msgSend_receivedPreambles(void *a1, const char *a2, ...)
{
  return [a1 receivedPreambles];
}

id objc_msgSend_receivingTime(void *a1, const char *a2, ...)
{
  return [a1 receivingTime];
}

id objc_msgSend_registerForEvents(void *a1, const char *a2, ...)
{
  return [a1 registerForEvents];
}

id objc_msgSend_registerStateMachineWedEventHandlers(void *a1, const char *a2, ...)
{
  return [a1 registerStateMachineWedEventHandlers];
}

id objc_msgSend_regulatoryAreaGeoChanged(void *a1, const char *a2, ...)
{
  return [a1 regulatoryAreaGeoChanged];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetCounterThreadSessionStoppedDueToAPOff(void *a1, const char *a2, ...)
{
  return [a1 resetCounterThreadSessionStoppedDueToAPOff];
}

id objc_msgSend_resetCounterThreadSessionStoppedDueToBluetoothOff(void *a1, const char *a2, ...)
{
  return [a1 resetCounterThreadSessionStoppedDueToBluetoothOff];
}

id objc_msgSend_resetCounterThreadSessionStoppedDueToEscoOn(void *a1, const char *a2, ...)
{
  return [a1 resetCounterThreadSessionStoppedDueToEscoOn];
}

id objc_msgSend_resetCounterThreadStartFailDueToBluetoothOff(void *a1, const char *a2, ...)
{
  return [a1 resetCounterThreadStartFailDueToBluetoothOff];
}

id objc_msgSend_resetCounterThreadStartFailDueToEscoOn(void *a1, const char *a2, ...)
{
  return [a1 resetCounterThreadStartFailDueToEscoOn];
}

id objc_msgSend_resetCurrentWEDInfoMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetCurrentWEDInfoMetrics];
}

id objc_msgSend_resetEngagementMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetEngagementMetrics];
}

id objc_msgSend_resetFWUpdateStatus(void *a1, const char *a2, ...)
{
  return [a1 resetFWUpdateStatus];
}

id objc_msgSend_resetFoundAdvFlags(void *a1, const char *a2, ...)
{
  return [a1 resetFoundAdvFlags];
}

id objc_msgSend_resetIPMLEMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetIPMLEMetrics];
}

id objc_msgSend_resetMacMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetMacMetrics];
}

id objc_msgSend_resetMetricsBetweenRoleChanges(void *a1, const char *a2, ...)
{
  return [a1 resetMetricsBetweenRoleChanges];
}

id objc_msgSend_resetNetworkRadioHistogramMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetNetworkRadioHistogramMetrics];
}

id objc_msgSend_resetNetworkRadioMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetNetworkRadioMetrics];
}

id objc_msgSend_resetPairingStatus(void *a1, const char *a2, ...)
{
  return [a1 resetPairingStatus];
}

id objc_msgSend_resetPowerMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetPowerMetrics];
}

id objc_msgSend_resetRCP2CoexMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetRCP2CoexMetrics];
}

id objc_msgSend_resetStreamRawResponseHistogramMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetStreamRawResponseHistogramMetrics];
}

id objc_msgSend_resetThreadSessionMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetThreadSessionMetrics];
}

id objc_msgSend_resetThreadSessionWEDConnectionHistory(void *a1, const char *a2, ...)
{
  return [a1 resetThreadSessionWEDConnectionHistory];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeNetwork(void *a1, const char *a2, ...)
{
  return [a1 resumeNetwork];
}

id objc_msgSend_retrieveAndPostThirdPartyInfo(void *a1, const char *a2, ...)
{
  return [a1 retrieveAndPostThirdPartyInfo];
}

id objc_msgSend_retryInterval90perc(void *a1, const char *a2, ...)
{
  return [a1 retryInterval90perc];
}

id objc_msgSend_retryIntervalAvg(void *a1, const char *a2, ...)
{
  return [a1 retryIntervalAvg];
}

id objc_msgSend_retryIntervalMax(void *a1, const char *a2, ...)
{
  return [a1 retryIntervalMax];
}

id objc_msgSend_retryIntervalMin(void *a1, const char *a2, ...)
{
  return [a1 retryIntervalMin];
}

id objc_msgSend_routerCounts(void *a1, const char *a2, ...)
{
  return [a1 routerCounts];
}

id objc_msgSend_routerCountsCount(void *a1, const char *a2, ...)
{
  return [a1 routerCountsCount];
}

id objc_msgSend_routerNodesCount(void *a1, const char *a2, ...)
{
  return [a1 routerNodesCount];
}

id objc_msgSend_routerRoleCount(void *a1, const char *a2, ...)
{
  return [a1 routerRoleCount];
}

id objc_msgSend_rtt90perc(void *a1, const char *a2, ...)
{
  return [a1 rtt90perc];
}

id objc_msgSend_rttAvgVal(void *a1, const char *a2, ...)
{
  return [a1 rttAvgVal];
}

id objc_msgSend_rttMaxVal(void *a1, const char *a2, ...)
{
  return [a1 rttMaxVal];
}

id objc_msgSend_rttMinVal(void *a1, const char *a2, ...)
{
  return [a1 rttMinVal];
}

id objc_msgSend_rxBroadcast(void *a1, const char *a2, ...)
{
  return [a1 rxBroadcast];
}

id objc_msgSend_rxData(void *a1, const char *a2, ...)
{
  return [a1 rxData];
}

id objc_msgSend_rxDeniedReqPercentage(void *a1, const char *a2, ...)
{
  return [a1 rxDeniedReqPercentage];
}

id objc_msgSend_rxErrDuplicated(void *a1, const char *a2, ...)
{
  return [a1 rxErrDuplicated];
}

id objc_msgSend_rxErrFcs(void *a1, const char *a2, ...)
{
  return [a1 rxErrFcs];
}

id objc_msgSend_rxErrInvalidSrcAddr(void *a1, const char *a2, ...)
{
  return [a1 rxErrInvalidSrcAddr];
}

id objc_msgSend_rxErrNoframe(void *a1, const char *a2, ...)
{
  return [a1 rxErrNoframe];
}

id objc_msgSend_rxErrOther(void *a1, const char *a2, ...)
{
  return [a1 rxErrOther];
}

id objc_msgSend_rxErrPercentage(void *a1, const char *a2, ...)
{
  return [a1 rxErrPercentage];
}

id objc_msgSend_rxErrSecurity(void *a1, const char *a2, ...)
{
  return [a1 rxErrSecurity];
}

id objc_msgSend_rxErrUnknownNeighbor(void *a1, const char *a2, ...)
{
  return [a1 rxErrUnknownNeighbor];
}

id objc_msgSend_rxErrorAborted(void *a1, const char *a2, ...)
{
  return [a1 rxErrorAborted];
}

id objc_msgSend_rxErrorAckAborted(void *a1, const char *a2, ...)
{
  return [a1 rxErrorAckAborted];
}

id objc_msgSend_rxErrorAckDenied(void *a1, const char *a2, ...)
{
  return [a1 rxErrorAckDenied];
}

id objc_msgSend_rxErrorAckFailedRadioDelay(void *a1, const char *a2, ...)
{
  return [a1 rxErrorAckFailedRadioDelay];
}

id objc_msgSend_rxErrorAckFailedRadioState(void *a1, const char *a2, ...)
{
  return [a1 rxErrorAckFailedRadioState];
}

id objc_msgSend_rxErrorDelayedTimeout(void *a1, const char *a2, ...)
{
  return [a1 rxErrorDelayedTimeout];
}

id objc_msgSend_rxErrorDelayedTimeslotEnded(void *a1, const char *a2, ...)
{
  return [a1 rxErrorDelayedTimeslotEnded];
}

id objc_msgSend_rxErrorDestAddrFiltered(void *a1, const char *a2, ...)
{
  return [a1 rxErrorDestAddrFiltered];
}

id objc_msgSend_rxErrorInvalidData(void *a1, const char *a2, ...)
{
  return [a1 rxErrorInvalidData];
}

id objc_msgSend_rxErrorInvalidFcs(void *a1, const char *a2, ...)
{
  return [a1 rxErrorInvalidFcs];
}

id objc_msgSend_rxErrorInvalidFrame(void *a1, const char *a2, ...)
{
  return [a1 rxErrorInvalidFrame];
}

id objc_msgSend_rxErrorInvalidLength(void *a1, const char *a2, ...)
{
  return [a1 rxErrorInvalidLength];
}

id objc_msgSend_rxErrorReceiveFailed(void *a1, const char *a2, ...)
{
  return [a1 rxErrorReceiveFailed];
}

id objc_msgSend_rxErrorRuntimeDelay(void *a1, const char *a2, ...)
{
  return [a1 rxErrorRuntimeDelay];
}

id objc_msgSend_rxErrorTimeslotEnded(void *a1, const char *a2, ...)
{
  return [a1 rxErrorTimeslotEnded];
}

id objc_msgSend_rxFailure(void *a1, const char *a2, ...)
{
  return [a1 rxFailure];
}

id objc_msgSend_rxGrantedReqPercentage(void *a1, const char *a2, ...)
{
  return [a1 rxGrantedReqPercentage];
}

id objc_msgSend_rxPacketCountHistograms(void *a1, const char *a2, ...)
{
  return [a1 rxPacketCountHistograms];
}

id objc_msgSend_rxPacketCountHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 rxPacketCountHistogramsCount];
}

id objc_msgSend_rxSuccess(void *a1, const char *a2, ...)
{
  return [a1 rxSuccess];
}

id objc_msgSend_rxSuccessRate(void *a1, const char *a2, ...)
{
  return [a1 rxSuccessRate];
}

id objc_msgSend_rxTotal(void *a1, const char *a2, ...)
{
  return [a1 rxTotal];
}

id objc_msgSend_rxUnicast(void *a1, const char *a2, ...)
{
  return [a1 rxUnicast];
}

id objc_msgSend_sCntrsCoex(void *a1, const char *a2, ...)
{
  return [a1 sCntrsCoex];
}

id objc_msgSend_sCntrsDiscoveryJoin(void *a1, const char *a2, ...)
{
  return [a1 sCntrsDiscoveryJoin];
}

id objc_msgSend_sCntrsEngagement(void *a1, const char *a2, ...)
{
  return [a1 sCntrsEngagement];
}

id objc_msgSend_sCntrsIp(void *a1, const char *a2, ...)
{
  return [a1 sCntrsIp];
}

id objc_msgSend_sCntrsJoiner(void *a1, const char *a2, ...)
{
  return [a1 sCntrsJoiner];
}

id objc_msgSend_sCntrsMacRx(void *a1, const char *a2, ...)
{
  return [a1 sCntrsMacRx];
}

id objc_msgSend_sCntrsMacTx(void *a1, const char *a2, ...)
{
  return [a1 sCntrsMacTx];
}

id objc_msgSend_sCntrsMle(void *a1, const char *a2, ...)
{
  return [a1 sCntrsMle];
}

id objc_msgSend_sCntrsNetwork(void *a1, const char *a2, ...)
{
  return [a1 sCntrsNetwork];
}

id objc_msgSend_sCntrsPower(void *a1, const char *a2, ...)
{
  return [a1 sCntrsPower];
}

id objc_msgSend_sCntrsRadio(void *a1, const char *a2, ...)
{
  return [a1 sCntrsRadio];
}

id objc_msgSend_sCntrsReachability(void *a1, const char *a2, ...)
{
  return [a1 sCntrsReachability];
}

id objc_msgSend_sCntrsStability(void *a1, const char *a2, ...)
{
  return [a1 sCntrsStability];
}

id objc_msgSend_sEDCounts(void *a1, const char *a2, ...)
{
  return [a1 sEDCounts];
}

id objc_msgSend_sEDCountsCount(void *a1, const char *a2, ...)
{
  return [a1 sEDCountsCount];
}

id objc_msgSend_sHistCoex(void *a1, const char *a2, ...)
{
  return [a1 sHistCoex];
}

id objc_msgSend_selfHealThreadNetworkTimerHandler(void *a1, const char *a2, ...)
{
  return [a1 selfHealThreadNetworkTimerHandler];
}

id objc_msgSend_semaphoreNetworkNodeTypeChange(void *a1, const char *a2, ...)
{
  return [a1 semaphoreNetworkNodeTypeChange];
}

id objc_msgSend_semaphoreWakeOnDeviceChange(void *a1, const char *a2, ...)
{
  return [a1 semaphoreWakeOnDeviceChange];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setFoundAdvFlags(void *a1, const char *a2, ...)
{
  return [a1 setFoundAdvFlags];
}

id objc_msgSend_setIsAssociatedFirstTimeAfterThreadStart(void *a1, const char *a2, ...)
{
  return [a1 setIsAssociatedFirstTimeAfterThreadStart];
}

id objc_msgSend_setLogTimestampBase(void *a1, const char *a2, ...)
{
  return [a1 setLogTimestampBase];
}

id objc_msgSend_setupAWDMetricsServerConnections(void *a1, const char *a2, ...)
{
  return [a1 setupAWDMetricsServerConnections];
}

id objc_msgSend_setupCleanupTimer(void *a1, const char *a2, ...)
{
  return [a1 setupCleanupTimer];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_shouldDefer(void *a1, const char *a2, ...)
{
  return [a1 shouldDefer];
}

id objc_msgSend_shouldRunDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 shouldRunDiagnostics];
}

id objc_msgSend_sleepState(void *a1, const char *a2, ...)
{
  return [a1 sleepState];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startNetworkMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startNetworkMonitoring];
}

id objc_msgSend_startPeriodicDiscoveryScanInSRMode(void *a1, const char *a2, ...)
{
  return [a1 startPeriodicDiscoveryScanInSRMode];
}

id objc_msgSend_startQuickDiscoveryScanInSRMode(void *a1, const char *a2, ...)
{
  return [a1 startQuickDiscoveryScanInSRMode];
}

id objc_msgSend_startThreadDiagnosticsTimer(void *a1, const char *a2, ...)
{
  return [a1 startThreadDiagnosticsTimer];
}

id objc_msgSend_startTimeAndGetCurrentDimension(void *a1, const char *a2, ...)
{
  return [a1 startTimeAndGetCurrentDimension];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopNetworkMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopNetworkMonitoring];
}

id objc_msgSend_stopPairingRequest(void *a1, const char *a2, ...)
{
  return [a1 stopPairingRequest];
}

id objc_msgSend_stopPeriodicDiscoveryScanInSRMode(void *a1, const char *a2, ...)
{
  return [a1 stopPeriodicDiscoveryScanInSRMode];
}

id objc_msgSend_stopScan(void *a1, const char *a2, ...)
{
  return [a1 stopScan];
}

id objc_msgSend_stopTimeAndCalculateCurrentDuration(void *a1, const char *a2, ...)
{
  return [a1 stopTimeAndCalculateCurrentDuration];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_threadLeave(void *a1, const char *a2, ...)
{
  return [a1 threadLeave];
}

id objc_msgSend_threadStop(void *a1, const char *a2, ...)
{
  return [a1 threadStop];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_tnmNodeTypeChangeQueue(void *a1, const char *a2, ...)
{
  return [a1 tnmNodeTypeChangeQueue];
}

id objc_msgSend_tnmWedStatusChangeQueue(void *a1, const char *a2, ...)
{
  return [a1 tnmWedStatusChangeQueue];
}

id objc_msgSend_transitionToChildNodeHelper(void *a1, const char *a2, ...)
{
  return [a1 transitionToChildNodeHelper];
}

id objc_msgSend_transmittedFrames(void *a1, const char *a2, ...)
{
  return [a1 transmittedFrames];
}

id objc_msgSend_transmittingTime(void *a1, const char *a2, ...)
{
  return [a1 transmittingTime];
}

id objc_msgSend_triggerBTWifiLoadInfoEvent(void *a1, const char *a2, ...)
{
  return [a1 triggerBTWifiLoadInfoEvent];
}

id objc_msgSend_txAppPktSucess(void *a1, const char *a2, ...)
{
  return [a1 txAppPktSucess];
}

id objc_msgSend_txBroadcast(void *a1, const char *a2, ...)
{
  return [a1 txBroadcast];
}

id objc_msgSend_txCcaEnergyDetectedHistograms(void *a1, const char *a2, ...)
{
  return [a1 txCcaEnergyDetectedHistograms];
}

id objc_msgSend_txCcaEnergyDetectedHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 txCcaEnergyDetectedHistogramsCount];
}

id objc_msgSend_txCsmaBackoffHistograms(void *a1, const char *a2, ...)
{
  return [a1 txCsmaBackoffHistograms];
}

id objc_msgSend_txCsmaBackoffHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 txCsmaBackoffHistogramsCount];
}

id objc_msgSend_txData(void *a1, const char *a2, ...)
{
  return [a1 txData];
}

id objc_msgSend_txDelay90perc(void *a1, const char *a2, ...)
{
  return [a1 txDelay90perc];
}

id objc_msgSend_txDelayAvg(void *a1, const char *a2, ...)
{
  return [a1 txDelayAvg];
}

id objc_msgSend_txDelayMax(void *a1, const char *a2, ...)
{
  return [a1 txDelayMax];
}

id objc_msgSend_txDelayMin(void *a1, const char *a2, ...)
{
  return [a1 txDelayMin];
}

id objc_msgSend_txDelayavg(void *a1, const char *a2, ...)
{
  return [a1 txDelayavg];
}

id objc_msgSend_txDelaymax(void *a1, const char *a2, ...)
{
  return [a1 txDelaymax];
}

id objc_msgSend_txDelaymin(void *a1, const char *a2, ...)
{
  return [a1 txDelaymin];
}

id objc_msgSend_txDeniedReqPercentage(void *a1, const char *a2, ...)
{
  return [a1 txDeniedReqPercentage];
}

id objc_msgSend_txDirectChannelaccessfailureHistograms(void *a1, const char *a2, ...)
{
  return [a1 txDirectChannelaccessfailureHistograms];
}

id objc_msgSend_txDirectChannelaccessfailureHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 txDirectChannelaccessfailureHistogramsCount];
}

id objc_msgSend_txDirectMaxRetryExpiry(void *a1, const char *a2, ...)
{
  return [a1 txDirectMaxRetryExpiry];
}

id objc_msgSend_txDirectNoackHistograms(void *a1, const char *a2, ...)
{
  return [a1 txDirectNoackHistograms];
}

id objc_msgSend_txDirectNoackHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 txDirectNoackHistogramsCount];
}

id objc_msgSend_txDirectRetryAttemptsHistograms(void *a1, const char *a2, ...)
{
  return [a1 txDirectRetryAttemptsHistograms];
}

id objc_msgSend_txDirectRetryAttemptsHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 txDirectRetryAttemptsHistogramsCount];
}

id objc_msgSend_txErrAbort(void *a1, const char *a2, ...)
{
  return [a1 txErrAbort];
}

id objc_msgSend_txErrAbortPercentage(void *a1, const char *a2, ...)
{
  return [a1 txErrAbortPercentage];
}

id objc_msgSend_txErrBusyChannel(void *a1, const char *a2, ...)
{
  return [a1 txErrBusyChannel];
}

id objc_msgSend_txErrBusyChannelPercentage(void *a1, const char *a2, ...)
{
  return [a1 txErrBusyChannelPercentage];
}

id objc_msgSend_txErrCca(void *a1, const char *a2, ...)
{
  return [a1 txErrCca];
}

id objc_msgSend_txErrCcaPercentage(void *a1, const char *a2, ...)
{
  return [a1 txErrCcaPercentage];
}

id objc_msgSend_txErrPercentage(void *a1, const char *a2, ...)
{
  return [a1 txErrPercentage];
}

id objc_msgSend_txErrorAckNoMem(void *a1, const char *a2, ...)
{
  return [a1 txErrorAckNoMem];
}

id objc_msgSend_txErrorBusyChannelCcaNotStarted(void *a1, const char *a2, ...)
{
  return [a1 txErrorBusyChannelCcaNotStarted];
}

id objc_msgSend_txErrorChannelAccessCcaBusy(void *a1, const char *a2, ...)
{
  return [a1 txErrorChannelAccessCcaBusy];
}

id objc_msgSend_txErrorChannelAccessFailure(void *a1, const char *a2, ...)
{
  return [a1 txErrorChannelAccessFailure];
}

id objc_msgSend_txErrorInvalidAck(void *a1, const char *a2, ...)
{
  return [a1 txErrorInvalidAck];
}

id objc_msgSend_txErrorNoAck(void *a1, const char *a2, ...)
{
  return [a1 txErrorNoAck];
}

id objc_msgSend_txErrorNotGranted(void *a1, const char *a2, ...)
{
  return [a1 txErrorNotGranted];
}

id objc_msgSend_txErrorTimeslotDenied(void *a1, const char *a2, ...)
{
  return [a1 txErrorTimeslotDenied];
}

id objc_msgSend_txErrorTimeslotEnded(void *a1, const char *a2, ...)
{
  return [a1 txErrorTimeslotEnded];
}

id objc_msgSend_txErrorTxAborted(void *a1, const char *a2, ...)
{
  return [a1 txErrorTxAborted];
}

id objc_msgSend_txErrorTxAbortedCcaTx(void *a1, const char *a2, ...)
{
  return [a1 txErrorTxAbortedCcaTx];
}

id objc_msgSend_txErrorTxAbortedCsmaBackoff(void *a1, const char *a2, ...)
{
  return [a1 txErrorTxAbortedCsmaBackoff];
}

id objc_msgSend_txErrorTxAbortedCsmaCfgBackoff(void *a1, const char *a2, ...)
{
  return [a1 txErrorTxAbortedCsmaCfgBackoff];
}

id objc_msgSend_txErrorTxAbortedCsmaPrepare(void *a1, const char *a2, ...)
{
  return [a1 txErrorTxAbortedCsmaPrepare];
}

id objc_msgSend_txErrorTxAbortedIfs(void *a1, const char *a2, ...)
{
  return [a1 txErrorTxAbortedIfs];
}

id objc_msgSend_txErrorTxAbortedRxAck(void *a1, const char *a2, ...)
{
  return [a1 txErrorTxAbortedRxAck];
}

id objc_msgSend_txErrorTxAbortedTx(void *a1, const char *a2, ...)
{
  return [a1 txErrorTxAbortedTx];
}

id objc_msgSend_txFailure(void *a1, const char *a2, ...)
{
  return [a1 txFailure];
}

id objc_msgSend_txGrantedReqPercentage(void *a1, const char *a2, ...)
{
  return [a1 txGrantedReqPercentage];
}

id objc_msgSend_txIndirectMaxRetryExpiry(void *a1, const char *a2, ...)
{
  return [a1 txIndirectMaxRetryExpiry];
}

id objc_msgSend_txIndirectRetryAttemptsHistograms(void *a1, const char *a2, ...)
{
  return [a1 txIndirectRetryAttemptsHistograms];
}

id objc_msgSend_txIndirectRetryAttemptsHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 txIndirectRetryAttemptsHistogramsCount];
}

id objc_msgSend_txPacketCountHistograms(void *a1, const char *a2, ...)
{
  return [a1 txPacketCountHistograms];
}

id objc_msgSend_txPacketCountHistogramsCount(void *a1, const char *a2, ...)
{
  return [a1 txPacketCountHistogramsCount];
}

id objc_msgSend_txSuccess(void *a1, const char *a2, ...)
{
  return [a1 txSuccess];
}

id objc_msgSend_txSuccessRate(void *a1, const char *a2, ...)
{
  return [a1 txSuccessRate];
}

id objc_msgSend_txTotal(void *a1, const char *a2, ...)
{
  return [a1 txTotal];
}

id objc_msgSend_txUnicast(void *a1, const char *a2, ...)
{
  return [a1 txUnicast];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unregisterForEvents(void *a1, const char *a2, ...)
{
  return [a1 unregisterForEvents];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateKeychainWithThreadActiveDataSet(void *a1, const char *a2, ...)
{
  return [a1 updateKeychainWithThreadActiveDataSet];
}

id objc_msgSend_updateLinkFailureCount(void *a1, const char *a2, ...)
{
  return [a1 updateLinkFailureCount];
}

id objc_msgSend_updateNCPProperties(void *a1, const char *a2, ...)
{
  return [a1 updateNCPProperties];
}

id objc_msgSend_updatePreferredNetwork(void *a1, const char *a2, ...)
{
  return [a1 updatePreferredNetwork];
}

id objc_msgSend_updatePreferredNetworkForDatasetChange(void *a1, const char *a2, ...)
{
  return [a1 updatePreferredNetworkForDatasetChange];
}

id objc_msgSend_updateThreadSessionStartTime(void *a1, const char *a2, ...)
{
  return [a1 updateThreadSessionStartTime];
}

id objc_msgSend_updateWEDConnectionCount(void *a1, const char *a2, ...)
{
  return [a1 updateWEDConnectionCount];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_vendorVersion(void *a1, const char *a2, ...)
{
  return [a1 vendorVersion];
}

id objc_msgSend_wakeOnDeviceChangeNotify(void *a1, const char *a2, ...)
{
  return [a1 wakeOnDeviceChangeNotify];
}

id objc_msgSend_wedAttachRequest(void *a1, const char *a2, ...)
{
  return [a1 wedAttachRequest];
}

id objc_msgSend_wedStatus(void *a1, const char *a2, ...)
{
  return [a1 wedStatus];
}

id objc_msgSend_wedStop(void *a1, const char *a2, ...)
{
  return [a1 wedStop];
}

id objc_msgSend_wifiPassword(void *a1, const char *a2, ...)
{
  return [a1 wifiPassword];
}

id objc_msgSend_wifiSSID(void *a1, const char *a2, ...)
{
  return [a1 wifiSSID];
}