@interface VCMediaStreamTransport
+ (BOOL)isSameSRTPKey:(id)a3 newKey:(id)a4;
+ (int)SRTPCipherSuiteForVCMediaStreamCipherSuite:(int64_t)a3;
+ (int)getSRTPMediaKeyLength:(int64_t)a3;
- (AVCBasebandCongestionDetector)basebandCongestionDetector;
- (BOOL)configureWithStreamConfig:(id)a3 setupInfo:(_VCMediaStreamTransportSetupInfo *)a4 reducedSizeRTCPPackets:(BOOL)a5 hopByHopEncryptRTCPPackets:(BOOL)a6 statisticsCollector:(id)a7 basebandCongestionDetector:(id)a8 error:(id *)a9;
- (BOOL)encryptionInfoReceived;
- (BOOL)generateRTCPXRSummaryReport:(tagVCRTCPXRSummaryReport *)a3 reportCount:(char *)a4;
- (BOOL)generateRTCPXRVoIPMetricsReport:(tagVCRTCPXRVoIPMetricsReport *)a3 reportCount:(char *)a4;
- (BOOL)generateReceptionReport:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4;
- (BOOL)isDecryptionTimeoutEnabled;
- (BOOL)isRTCPEnabled;
- (BOOL)isRTCPSendEnabled;
- (BOOL)isRTCPTimeoutEnabled;
- (BOOL)isRTCPXREnabled;
- (BOOL)isRTPTimeoutEnabled;
- (BOOL)isSameSRTPConfig:(id)a3;
- (BOOL)isSendingMedia:(id)a3;
- (BOOL)sendIntervalDidElapse:(int *)a3 remainingTime:(double *)a4;
- (BOOL)setThrottlingInterval:(double)a3;
- (BOOL)setupRTPForIDS:(id *)a3;
- (BOOL)setupRTPWithIPInfo:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4;
- (BOOL)setupRTPWithNWConnection:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4;
- (BOOL)setupRTPWithSockets:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4;
- (BOOL)setupRTPWithTransportSetupInfo:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4;
- (BOOL)setupSframeCryptorsWithError:(id *)a3;
- (VCMediaStreamConfig)streamConfig;
- (VCMediaStreamTransport)initWithHandle:(tagHANDLE *)a3 localSSRC:(unsigned int)a4;
- (double)lastReceivedRTCPPacketTime;
- (double)rtcpSendInterval;
- (double)rtcpTimeoutInterval;
- (double)rtpTimeoutInterval;
- (id)rxNetworkPayloads;
- (int)getCryptoSet:(tagSRTPExchangeInfo *)a3 withMediaKey:(id)a4;
- (int)onStart;
- (int)setupRTPWithTransportStreams;
- (int)setupSRTP;
- (int64_t)streamDirection;
- (tagHANDLE)rtpHandle;
- (tagVCCryptor)createSframeCryptorWithStreamConfig:(id)a3 ssrc:(unsigned int)a4 error:(id *)a5;
- (tagVCCryptor)receiverSframeCryptor;
- (tagVCCryptor)transmitterSframeCryptor;
- (unsigned)getExtendedSequenceNumberForSequenceNumber:(unsigned __int16)a3;
- (unsigned)getRTCPReportNTPTimeMiddle32ForReportId:(unsigned __int8)a3;
- (unsigned)idsStreamId;
- (void)dealloc;
- (void)handleEncryptionInfoChange:(id)a3;
- (void)lastReceivedRTCPPacketTime;
- (void)onStop;
- (void)registerRTPPayloadMappings;
- (void)reset;
- (void)resetPayloadMapping;
- (void)sendControlPacketWithParameters:(_RTCP_SEND_CONTROL_PARAMETERS *)a3;
- (void)setBasebandCongestionDetector:(id)a3;
- (void)setDecryptionTimeoutEnabled:(BOOL)a3;
- (void)setRtcpEnabled:(BOOL)a3;
- (void)setRtcpSendInterval:(double)a3;
- (void)setRtcpTimeoutEnabled:(BOOL)a3;
- (void)setRtcpTimeoutInterval:(double)a3;
- (void)setRtpTimeoutEnabled:(BOOL)a3;
- (void)setRtpTimeoutInterval:(double)a3;
- (void)setStreamDirection:(int64_t)a3;
- (void)setupRTPWithTransportStreams;
- (void)setupSRTP;
- (void)updateLastGeneratedKeyMaterial;
@end

@implementation VCMediaStreamTransport

- (VCMediaStreamTransport)initWithHandle:(tagHANDLE *)a3 localSSRC:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaStreamTransport;
  result = [(VCMediaStreamTransport *)&v7 init];
  if (result)
  {
    result->_payloadType = 1;
    result->_rtpHandle = a3;
    result->_localSSRC = a4;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  RTPCloseHandle();

  receiverSframeCryptor = self->_receiverSframeCryptor;
  if (receiverSframeCryptor) {
    CFRelease(receiverSframeCryptor);
  }
  transmitterSframeCryptor = self->_transmitterSframeCryptor;
  if (transmitterSframeCryptor) {
    CFRelease(transmitterSframeCryptor);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamTransport;
  [(VCMediaStreamTransport *)&v5 dealloc];
}

- (void)setBasebandCongestionDetector:(id)a3
{
  self->_basebandCongestionDetector = (AVCBasebandCongestionDetector *)a3;
  rtpHandle = self->_rtpHandle;

  RTPSetBasebandCongestionDetector((uint64_t)rtpHandle, a3);
}

- (BOOL)isSameSRTPConfig:(id)a3
{
  int64_t v5 = [(VCMediaStreamConfig *)self->_streamConfig SRTPCipherSuite];
  if (v5 != [a3 SRTPCipherSuite]) {
    return 0;
  }
  int64_t v6 = [(VCMediaStreamConfig *)self->_streamConfig SRTCPCipherSuite];
  if (v6 != [a3 SRTCPCipherSuite]
    || !+[VCMediaStreamTransport isSameSRTPKey:newKey:](VCMediaStreamTransport, "isSameSRTPKey:newKey:", -[VCMediaStreamConfig sendMediaKey](self->_streamConfig, "sendMediaKey"), [a3 sendMediaKey]))
  {
    return 0;
  }
  objc_super v7 = [(VCMediaStreamConfig *)self->_streamConfig receiveMediaKey];
  uint64_t v8 = [a3 receiveMediaKey];

  return +[VCMediaStreamTransport isSameSRTPKey:v7 newKey:v8];
}

- (void)updateLastGeneratedKeyMaterial
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Key material is not yet available", v2, v3, v4, v5, v6);
}

- (int)onStart
{
  if (self->_transportStreamInfo.creationCallback)
  {
    int v3 = [(VCMediaStreamTransport *)self setupRTPWithTransportStreams];
    if (v3 < 0) {
      return v3;
    }
  }
  else
  {
    int v3 = 0;
  }
  RTPResetHandle();
  [(VCMediaStreamTransport *)self updateLastGeneratedKeyMaterial];
  return v3;
}

- (void)onStop
{
  if (self->_transportStreamInfo.creationCallback) {
    RTPClearTransportStreams();
  }
}

- (BOOL)configureWithStreamConfig:(id)a3 setupInfo:(_VCMediaStreamTransportSetupInfo *)a4 reducedSizeRTCPPackets:(BOOL)a5 hopByHopEncryptRTCPPackets:(BOOL)a6 statisticsCollector:(id)a7 basebandCongestionDetector:(id)a8 error:(id *)a9
{
  LODWORD(v11) = a6;
  BOOL v12 = a5;
  v15 = self;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  LODWORD(v91) = -[VCMediaStreamTransport isSameSRTPConfig:](self, "isSameSRTPConfig:");

  v15->_streamConfig = (VCMediaStreamConfig *)a3;
  v92 = (uint64_t *)a9;
  if (![(VCMediaStreamTransport *)v15 setupRTPWithTransportSetupInfo:a4 error:a9])
  {
    if ((VCMediaStreamTransport *)objc_opt_class() == v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
        goto LABEL_137;
      }
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v35 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        BOOL v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v36) {
          return v36;
        }
        if (v92)
        {
          if (*v92) {
            v37 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
          }
          else {
            v37 = "<nil>";
          }
        }
        else
        {
          v37 = "";
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByH"
                              "opEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 150;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v37;
        v70 = " [%s] %s:%d Setup error[%s]";
        goto LABEL_135;
      }
      BOOL v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
      if (!v36) {
        return v36;
      }
      if (v92)
      {
        if (*v92) {
          v71 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
        }
        else {
          v71 = "<nil>";
        }
      }
      else
      {
        v71 = "";
      }
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHop"
                            "EncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 150;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v71;
      v81 = " [%s] %s:%d Setup error[%s]";
      v82 = v35;
      uint32_t v83 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v32 = (__CFString *)[(VCMediaStreamTransport *)v15 performSelector:sel_logPrefix];
      }
      else {
        v32 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
        goto LABEL_137;
      }
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      char v39 = VRTraceIsOSFaultDisabled();
      v40 = *MEMORY[0x1E4F47A50];
      if (v39)
      {
        BOOL v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v36) {
          return v36;
        }
        if (v92)
        {
          if (*v92) {
            v41 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
          }
          else {
            v41 = "<nil>";
          }
        }
        else
        {
          v41 = "";
        }
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByH"
                              "opEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 150;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v32;
        *(_WORD *)&buf[38] = 2048;
        *(void *)&buf[40] = v15;
        __int16 v104 = 2080;
        v105 = v41;
        v70 = " [%s] %s:%d %@(%p) Setup error[%s]";
        v80 = v40;
LABEL_130:
        uint32_t v84 = 58;
        goto LABEL_136;
      }
      BOOL v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
      if (!v36) {
        return v36;
      }
      if (v92)
      {
        if (*v92) {
          v60 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
        }
        else {
          v60 = "<nil>";
        }
      }
      else
      {
        v60 = "";
      }
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHop"
                            "EncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 150;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v32;
      *(_WORD *)&buf[38] = 2048;
      *(void *)&buf[40] = v15;
      __int16 v104 = 2080;
      v105 = v60;
      v81 = " [%s] %s:%d %@(%p) Setup error[%s]";
      v82 = v40;
      uint32_t v83 = 58;
    }
    _os_log_fault_impl(&dword_1E1EA4000, v82, OS_LOG_TYPE_FAULT, v81, buf, v83);
    goto LABEL_137;
  }
  int setupType = a4->setupType;
  id v90 = a7;
  switch(setupType)
  {
    case 0:
    case 3:
      goto LABEL_10;
    case 1:
      if (![(NSString *)[(VCNetworkAddress *)[(VCMediaStreamConfig *)v15->_streamConfig remoteAddress] ip] length])
      {
        id v88 = a8;
        *(void *)&v102.sa_len = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&v102.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
        socklen_t v93 = 16;
        if (getpeername(a4->var0.socketInfo.rtpSocket, &v102, &v93) != -1)
        {
          unint64_t v101 = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v99 = v17;
          long long v100 = v17;
          *(_OWORD *)&buf[16] = v17;
          *(_OWORD *)&buf[32] = v17;
          *(_OWORD *)buf = v17;
          SAToIPPORT();
          IPToString();
          v18 = [(VCMediaStreamConfig *)v15->_streamConfig remoteAddress];
          -[VCNetworkAddress setIp:](v18, "setIp:", [NSString stringWithUTF8String:buf]);
          [(VCNetworkAddress *)v18 setPort:WORD2(v101)];
          -[VCNetworkAddress setInterfaceName:](v18, "setInterfaceName:", [NSString stringWithUTF8String:(char *)&v99 + 4]);
          if (v99) {
            uint64_t v19 = 6;
          }
          else {
            uint64_t v19 = 4;
          }
          [(VCNetworkAddress *)v18 setIpVersion:v19];
        }
        a8 = v88;
      }
LABEL_10:
      v20 = [(VCMediaStreamConfig *)v15->_streamConfig remoteAddress];
      if ([(NSString *)[(VCNetworkAddress *)v20 ip] length])
      {
        unint64_t v101 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v99 = v21;
        long long v100 = v21;
        *(_OWORD *)&buf[16] = v21;
        *(_OWORD *)&buf[32] = v21;
        *(_OWORD *)buf = v21;
        [(NSString *)[(VCNetworkAddress *)v20 ip] UTF8String];
        v89 = a4;
        BOOL v22 = v12;
        int v23 = v11;
        [(VCNetworkAddress *)v20 port];
        MakeIPPORT();
        IPToString();
        int v24 = RTPGetPacketMultiplexMode();
        id v25 = a8;
        id v26 = a3;
        rtpHandle = v15->_rtpHandle;
        int v28 = [(VCNetworkAddress *)v20 isIPv6];
        BOOL v29 = v24 == 2;
        LODWORD(v11) = v23;
        BOOL v12 = v22;
        a4 = v89;
        if (v29) {
          unsigned __int16 v30 = WORD2(v101);
        }
        else {
          unsigned __int16 v30 = WORD2(v101) + 1;
        }
        uint64_t v31 = (uint64_t)rtpHandle;
        a3 = v26;
        a8 = v25;
        RTPSetDestination(v31, v28, buf, WORD2(v101), v30, 0, 1);
LABEL_34:
        RTPSetStreamDirection((uint64_t)v15->_rtpHandle, [(VCMediaStreamConfig *)v15->_streamConfig direction]);
        v15->_rtcpXREnabled = VCDefaults_GetBoolValueForKey(@"rtcpXrEnabled", [(VCMediaStreamConfig *)v15->_streamConfig isRTCPXREnabled]);
        RTPSetRTCPEnabled((uint64_t)v15->_rtpHandle, [(VCMediaStreamConfig *)v15->_streamConfig isRTCPEnabled]);
        RTPSetRTCPXREnabled((uint64_t)v15->_rtpHandle, v15->_rtcpXREnabled);
        [(VCMediaStreamConfig *)v15->_streamConfig rtcpSendInterval];
        RTPSetRTCPSendInterval(v44);
        BOOL isSRTPInitialized = v15->_isSRTPInitialized;
        if (v15->_isSRTPInitialized) {
          char v46 = (char)v91;
        }
        else {
          char v46 = 1;
        }
        if ((v46 & 1) == 0)
        {
          SRTPCleanUpEncryption();
          BOOL isSRTPInitialized = v15->_isSRTPInitialized;
        }
        if (isSRTPInitialized) {
          char v47 = (char)v91;
        }
        else {
          char v47 = 0;
        }
        if (v47) {
          goto LABEL_45;
        }
        uint64_t v48 = [(VCMediaStreamTransport *)v15 setupSRTP];
        if ((v48 & 0x80000000) == 0)
        {
          v15->_BOOL isSRTPInitialized = 1;
LABEL_45:
          if ([(VCMediaStreamTransport *)v15 setupSframeCryptorsWithError:v92])
          {
            if ([(NSString *)[(VCMediaStreamConfig *)v15->_streamConfig cName] length]) {
              RTPSetCName((int)v15->_rtpHandle, (unsigned char *)[(NSString *)[(VCMediaStreamConfig *)v15->_streamConfig cName] UTF8String]);
            }
            id v88 = a8;
            if ([(VCMediaStreamConfig *)v15->_streamConfig remoteSSRC]) {
              RTPSetRemoteSSRC((uint64_t)v15->_rtpHandle, [(VCMediaStreamConfig *)[(VCMediaStreamTransport *)v15 streamConfig] remoteSSRC]);
            }
            [(VCMediaStreamTransport *)v15 registerRTPPayloadMappings];
            id v49 = [(VCMediaStreamTransport *)v15 rxNetworkPayloads];
            uint64_t v50 = [v49 count];
            v92 = (uint64_t *)&v86;
            unint64_t v51 = (4 * v50 + 15) & 0xFFFFFFFFFFFFFFF0;
            v52 = (char *)&v86 - v51;
            if (v50) {
              memset((char *)&v86 - v51, 170, 4 * v50);
            }
            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            uint64_t v53 = [v49 countByEnumeratingWithState:&v95 objects:v94 count:16];
            if (v53)
            {
              uint64_t v54 = v53;
              id v86 = a3;
              v89 = a4;
              unint64_t v87 = __PAIR64__(v11, v12);
              v91 = v15;
              int v55 = 0;
              uint64_t v56 = *(void *)v96;
              do
              {
                uint64_t v11 = 0;
                int v57 = v55;
                uint64_t v58 = v55;
                do
                {
                  if (*(void *)v96 != v56) {
                    objc_enumerationMutation(v49);
                  }
                  int v55 = v58 + 1;
                  *(_DWORD *)&v52[4 * v58++] = objc_msgSend(*(id *)(*((void *)&v95 + 1) + 8 * v11++), "intValue", v86, v87);
                }
                while (v54 != v11);
                uint64_t v54 = [v49 countByEnumeratingWithState:&v95 objects:v94 count:16];
              }
              while (v54);
              v15 = v91;
              RTPSetRxPayloadList((uint64_t)v91->_rtpHandle, v57 + v11, v52);
              LOBYTE(v12) = v87;
              LOBYTE(v11) = BYTE4(v87);
              a4 = v89;
              a3 = v86;
            }
            if ([a3 cellularUniqueTag]) {
              RTPSetCellularUniqueTag((uint64_t)v15->_rtpHandle, [a3 cellularUniqueTag]);
            }
            RTPSetSourceRate((uint64_t)v15->_rtpHandle, a4->sourceRate);
            RTCPReducedSizePackets((uint64_t)v15->_rtpHandle, v12);
            RTCPSetHopByHopEncryptionEnabled((uint64_t)v15->_rtpHandle, v11);
            RTPSetStatisticsCollector((uint64_t)v15->_rtpHandle, v90);
            [(VCMediaStreamTransport *)v15 setBasebandCongestionDetector:v88];
            LOBYTE(v36) = 1;
            return v36;
          }
          if ((VCMediaStreamTransport *)objc_opt_class() != v15)
          {
            if (objc_opt_respondsToSelector()) {
              v59 = (__CFString *)[(VCMediaStreamTransport *)v15 performSelector:sel_logPrefix];
            }
            else {
              v59 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v67 = VRTraceErrorLogLevelToCSTR();
              v68 = *MEMORY[0x1E4F47A50];
              BOOL v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v36) {
                return v36;
              }
              v69 = (const char *)*v92;
              *(_DWORD *)buf = 136316418;
              *(void *)&buf[4] = v67;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:"
                                    "hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 241;
              *(_WORD *)&buf[28] = 2112;
              *(void *)&buf[30] = v59;
              *(_WORD *)&buf[38] = 2048;
              *(void *)&buf[40] = v15;
              __int16 v104 = 2112;
              v105 = v69;
              v70 = " [%s] %s:%d %@(%p) SFrame cryptors setup error[%@]";
LABEL_129:
              v80 = v68;
              goto LABEL_130;
            }
            goto LABEL_137;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_137;
          }
          uint64_t v65 = VRTraceErrorLogLevelToCSTR();
          v66 = *MEMORY[0x1E4F47A50];
          BOOL v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v36)
          {
            -[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:](v65, v92, v66);
            goto LABEL_137;
          }
          return v36;
        }
        uint64_t v61 = v48;
        uint64_t v62 = (int)v48;
        uint64_t v63 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", 230);
        +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", v92, 32018, 238, v62, v63, @"Failed to setup SRTP encryption", objc_msgSend(NSString, "stringWithFormat:", @"setupSRTP failed with error %d", v61));
        if ((VCMediaStreamTransport *)objc_opt_class() != v15)
        {
          if (objc_opt_respondsToSelector()) {
            v64 = (__CFString *)[(VCMediaStreamTransport *)v15 performSelector:sel_logPrefix];
          }
          else {
            v64 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v78 = VRTraceErrorLogLevelToCSTR();
            v68 = *MEMORY[0x1E4F47A50];
            BOOL v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v36) {
              return v36;
            }
            if (v92)
            {
              if (*v92) {
                v79 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
              }
              else {
                v79 = "<nil>";
              }
            }
            else
            {
              v79 = "";
            }
            *(_DWORD *)buf = 136316418;
            *(void *)&buf[4] = v78;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:ho"
                                  "pByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 233;
            *(_WORD *)&buf[28] = 2112;
            *(void *)&buf[30] = v64;
            *(_WORD *)&buf[38] = 2048;
            *(void *)&buf[40] = v15;
            __int16 v104 = 2080;
            v105 = v79;
            v70 = " [%s] %s:%d %@(%p) SRTP setup error[%s]";
            goto LABEL_129;
          }
          goto LABEL_137;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_137;
        }
        uint64_t v76 = VRTraceErrorLogLevelToCSTR();
        v35 = *MEMORY[0x1E4F47A50];
        BOOL v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v36) {
          return v36;
        }
        if (v92)
        {
          if (*v92) {
            v77 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
          }
          else {
            v77 = "<nil>";
          }
        }
        else
        {
          v77 = "";
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v76;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByH"
                              "opEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 233;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v77;
        v70 = " [%s] %s:%d SRTP setup error[%s]";
        goto LABEL_135;
      }
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v92, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", 188), @"Invalid Parameter", @"Call with empty remoteIP address");
      if ((VCMediaStreamTransport *)objc_opt_class() != v15)
      {
        if (objc_opt_respondsToSelector()) {
          v42 = (__CFString *)[(VCMediaStreamTransport *)v15 performSelector:sel_logPrefix];
        }
        else {
          v42 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v74 = VRTraceErrorLogLevelToCSTR();
          v68 = *MEMORY[0x1E4F47A50];
          BOOL v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v36) {
            return v36;
          }
          if (v92)
          {
            if (*v92) {
              v75 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
            }
            else {
              v75 = "<nil>";
            }
          }
          else
          {
            v75 = "";
          }
          *(_DWORD *)buf = 136316418;
          *(void *)&buf[4] = v74;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopB"
                                "yHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 191;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v42;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&buf[40] = v15;
          __int16 v104 = 2080;
          v105 = v75;
          v70 = " [%s] %s:%d %@(%p) error[%s]";
          goto LABEL_129;
        }
LABEL_137:
        LOBYTE(v36) = 0;
        return v36;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_137;
      }
      uint64_t v72 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E4F47A50];
      BOOL v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v36)
      {
        if (v92)
        {
          if (*v92) {
            v73 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
          }
          else {
            v73 = "<nil>";
          }
        }
        else
        {
          v73 = "";
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByH"
                              "opEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 191;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v73;
        v70 = " [%s] %s:%d error[%s]";
LABEL_135:
        v80 = v35;
        uint32_t v84 = 38;
LABEL_136:
        _os_log_error_impl(&dword_1E1EA4000, v80, OS_LOG_TYPE_ERROR, v70, buf, v84);
        goto LABEL_137;
      }
      return v36;
    case 2:
      uint64_t datagramChannelToken = a4->datagramChannelToken;
      if (datagramChannelToken) {
        RTPSetDestinationWithToken((uint64_t)v15->_rtpHandle, datagramChannelToken, 0);
      }
      goto LABEL_34;
    default:
      goto LABEL_34;
  }
}

- (BOOL)isSendingMedia:(id)a3
{
  uint64_t v4 = [a3 direction];
  if (v4 != 1) {
    LOBYTE(v4) = [a3 direction] == 3;
  }
  return v4;
}

- (tagVCCryptor)createSframeCryptorWithStreamConfig:(id)a3 ssrc:(unsigned int)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned int v14 = a4;
  v13 = 0;
  if (![a3 securityKeyHolder])
  {
    v10 = @"Invalid SecurityKeyHolder";
    int v9 = -2143748095;
LABEL_6:
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a5, 32038, 118, v9, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", 296), @"Create SFrame cryptor failed", v10);
    return v13;
  }
  unsigned int v14 = bswap32(a4);
  uint64_t v8 = (const void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v14 length:4];
  int v9 = VCCryptor_Create(*MEMORY[0x1E4F1CF80], [a3 sframeCipherSuite], v8, (const void *)objc_msgSend(a3, "securityKeyHolder"), 0, (uint64_t *)&v13);
  if (v9 < 0) {
    v10 = @"VCCryptor_Create failed";
  }
  else {
    v10 = 0;
  }
  uint64_t v11 = v13;
  if (!v13) {
    goto LABEL_6;
  }
  return v11;
}

- (BOOL)setupSframeCryptorsWithError:(id *)a3
{
  receiverSframeCryptor = self->_receiverSframeCryptor;
  if (receiverSframeCryptor)
  {
    CFRelease(receiverSframeCryptor);
    self->_receiverSframeCryptor = 0;
  }
  transmitterSframeCryptor = self->_transmitterSframeCryptor;
  if (transmitterSframeCryptor)
  {
    CFRelease(transmitterSframeCryptor);
    self->_transmitterSframeCryptor = 0;
  }
  if (![(VCMediaStreamConfig *)self->_streamConfig sframeCipherSuite]) {
    goto LABEL_9;
  }
  objc_super v7 = [(VCMediaStreamTransport *)self createSframeCryptorWithStreamConfig:self->_streamConfig ssrc:[(VCMediaStreamConfig *)self->_streamConfig remoteSSRC] error:a3];
  self->_receiverSframeCryptor = v7;
  if (v7)
  {
    if (![(VCMediaStreamTransport *)self isSendingMedia:self->_streamConfig]
      || (uint64_t v8 = [(VCMediaStreamTransport *)self createSframeCryptorWithStreamConfig:self->_streamConfig ssrc:self->_localSSRC error:a3], (self->_transmitterSframeCryptor = v8) != 0))
    {
LABEL_9:
      LOBYTE(v9) = 1;
      return (char)v9;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamTransport setupSframeCryptorsWithError:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaStreamTransport setupSframeCryptorsWithError:]();
    }
  }
  v10 = self->_receiverSframeCryptor;
  if (v10)
  {
    CFRelease(v10);
    self->_receiverSframeCryptor = 0;
  }
  int v9 = self->_transmitterSframeCryptor;
  if (v9)
  {
    CFRelease(v9);
    LOBYTE(v9) = 0;
    self->_transmitterSframeCryptor = 0;
  }
  return (char)v9;
}

- (void)reset
{
}

- (void)resetPayloadMapping
{
}

- (void)sendControlPacketWithParameters:(_RTCP_SEND_CONTROL_PARAMETERS *)a3
{
}

+ (int)getSRTPMediaKeyLength:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0xA) {
    return 0;
  }
  else {
    return dword_1E25A1B1C[a3 + 1];
  }
}

+ (int)SRTPCipherSuiteForVCMediaStreamCipherSuite:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) >= 0xB) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (BOOL)isSameSRTPKey:(id)a3 newKey:(id)a4
{
  if (a3) {
    return [a3 isEqualToData:a4];
  }
  else {
    return a4 == 0;
  }
}

- (int)getCryptoSet:(tagSRTPExchangeInfo *)a3 withMediaKey:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int64_t v7 = [(VCMediaStreamConfig *)self->_streamConfig SRTPCipherSuite];
  int64_t v8 = [(VCMediaStreamConfig *)self->_streamConfig SRTCPCipherSuite];
  int v9 = +[VCMediaStreamTransport getSRTPMediaKeyLength:v7];
  if (v9 <= +[VCMediaStreamTransport getSRTPMediaKeyLength:v8])int64_t v10 = v8; {
  else
  }
    int64_t v10 = v7;
  int v11 = +[VCMediaStreamTransport getSRTPMediaKeyLength:v10];
  size_t v12 = (v11 + 14);
  uint64_t v13 = (v12 + 15) & 0x1FFFFFFF0;
  unsigned int v14 = &buf[-v13];
  if (v11 != -14) {
    memset(&buf[-v13], 170, v12);
  }
  if (!(v7 | v8))
  {
    bzero(v14, (int)v12);
LABEL_10:
    ByteToHex((unint64_t)a3, 65, v14, v11);
    ByteToHex((unint64_t)a3->var1, 29, &v14[v11], 14);
    int v15 = 0;
    a3->var2 = 0;
    return v15;
  }
  if (v12 == [a4 length])
  {
    [a4 getBytes:v14 length:(int)v12];
    goto LABEL_10;
  }
  int v15 = -2145255423;
  if ((VCMediaStreamTransport *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v20 = [a4 length];
        *(_DWORD *)buf = 136316162;
        uint64_t v28 = v18;
        __int16 v29 = 2080;
        unsigned __int16 v30 = "-[VCMediaStreamTransport getCryptoSet:withMediaKey:]";
        __int16 v31 = 1024;
        int v32 = 404;
        __int16 v33 = 1024;
        *(_DWORD *)v34 = v12;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = v20;
        long long v21 = " [%s] %s:%d unexpected media key/salt length (expected[%d], given[%d])";
        BOOL v22 = v19;
        uint32_t v23 = 40;
LABEL_22:
        _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v17 = (__CFString *)[(VCMediaStreamTransport *)self performSelector:sel_logPrefix];
    }
    else {
      long long v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      id v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v26 = [a4 length];
        *(_DWORD *)buf = 136316674;
        uint64_t v28 = v24;
        __int16 v29 = 2080;
        unsigned __int16 v30 = "-[VCMediaStreamTransport getCryptoSet:withMediaKey:]";
        __int16 v31 = 1024;
        int v32 = 404;
        __int16 v33 = 2112;
        *(void *)v34 = v17;
        *(_WORD *)&v34[8] = 2048;
        v35 = self;
        __int16 v36 = 1024;
        int v37 = v12;
        __int16 v38 = 1024;
        int v39 = v26;
        long long v21 = " [%s] %s:%d %@(%p) unexpected media key/salt length (expected[%d], given[%d])";
        BOOL v22 = v25;
        uint32_t v23 = 60;
        goto LABEL_22;
      }
    }
  }
  return v15;
}

- (int)setupSRTP
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  int v3 = SRTPPrepareEncryption();
  if ((v3 & 0x80000000) == 0)
  {
    if (![+[VCDefaults sharedInstance] forceDisableMediaEncryption])goto LABEL_25; {
    if ((VCMediaStreamTransport *)objc_opt_class() == self)
    }
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int64_t v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCMediaStreamTransport setupSRTP]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 446;
      int v9 = " [%s] %s:%d Disabling rtp and rtcp encryption";
      int64_t v10 = v8;
      uint32_t v11 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[(VCMediaStreamTransport *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCMediaStreamTransport setupSRTP]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 446;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v4;
      *(_WORD *)&buf[38] = 2048;
      *(void *)&buf[40] = self;
      int v9 = " [%s] %s:%d %@(%p) Disabling rtp and rtcp encryption";
      int64_t v10 = v15;
      uint32_t v11 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_24:
    [(VCMediaStreamConfig *)self->_streamConfig setSRTPCipherSuite:0];
    [(VCMediaStreamConfig *)self->_streamConfig setSRTCPCipherSuite:0];
LABEL_25:
    unint64_t v78 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v76 = v16;
    long long v77 = v16;
    *(_OWORD *)&buf[32] = v16;
    long long v75 = v16;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&buf[16] = v16;
    unint64_t v73 = 0xAAAAAAAAAAAAAAAALL;
    v72[4] = v16;
    v72[5] = v16;
    v72[2] = v16;
    v72[3] = v16;
    v72[0] = v16;
    v72[1] = v16;
    int v17 = [(VCMediaStreamTransport *)self getCryptoSet:buf withMediaKey:[(VCMediaStreamConfig *)self->_streamConfig sendMediaKey]];
    if (v17 < 0)
    {
      int v5 = v17;
      if ((VCMediaStreamTransport *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaStreamTransport setupSRTP]();
          }
        }
        goto LABEL_82;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v48 = (__CFString *)[(VCMediaStreamTransport *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v48 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_82;
      }
      uint64_t v51 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_82;
      }
      int v56 = 136316162;
      uint64_t v57 = v51;
      __int16 v58 = 2080;
      v59 = "-[VCMediaStreamTransport setupSRTP]";
      __int16 v60 = 1024;
      int v61 = 456;
      __int16 v62 = 2112;
      uint64_t v63 = v48;
      __int16 v64 = 2048;
      uint64_t v65 = self;
      uint64_t v53 = " [%s] %s:%d %@(%p) create send crypto set failed";
      goto LABEL_84;
    }
    int v18 = [(VCMediaStreamTransport *)self getCryptoSet:v72 withMediaKey:[(VCMediaStreamConfig *)[(VCMediaStreamTransport *)self streamConfig] receiveMediaKey]];
    if (v18 < 0)
    {
      int v5 = v18;
      if ((VCMediaStreamTransport *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaStreamTransport setupSRTP]();
          }
        }
        goto LABEL_82;
      }
      if (objc_opt_respondsToSelector()) {
        id v49 = (__CFString *)[(VCMediaStreamTransport *)self performSelector:sel_logPrefix];
      }
      else {
        id v49 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_82;
      }
      uint64_t v54 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_82;
      }
      int v56 = 136316162;
      uint64_t v57 = v54;
      __int16 v58 = 2080;
      v59 = "-[VCMediaStreamTransport setupSRTP]";
      __int16 v60 = 1024;
      int v61 = 459;
      __int16 v62 = 2112;
      uint64_t v63 = v49;
      __int16 v64 = 2048;
      uint64_t v65 = self;
      uint64_t v53 = " [%s] %s:%d %@(%p) create receive crypto set failed";
      goto LABEL_84;
    }
    uint64_t v19 = +[VCMediaStreamTransport SRTPCipherSuiteForVCMediaStreamCipherSuite:[(VCMediaStreamConfig *)self->_streamConfig SRTPCipherSuite]];
    uint64_t v20 = +[VCMediaStreamTransport SRTPCipherSuiteForVCMediaStreamCipherSuite:[(VCMediaStreamConfig *)self->_streamConfig SRTCPCipherSuite]];
    if ((VCMediaStreamTransport *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_38;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint32_t v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      uint64_t v24 = _VCMediaStreamTransport_CipherSuiteAsString(v19);
      id v25 = _VCMediaStreamTransport_CipherSuiteAsString(v20);
      BOOL v26 = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)self->_streamConfig multiwayConfig] isOneToOne];
      v27 = FourccToCStr([(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)self->_streamConfig multiwayConfig] streamGroupID]);
      int v56 = 136316674;
      uint64_t v57 = v22;
      __int16 v58 = 2080;
      v59 = "-[VCMediaStreamTransport setupSRTP]";
      __int16 v60 = 1024;
      int v61 = 463;
      __int16 v62 = 2112;
      uint64_t v63 = v24;
      __int16 v64 = 2112;
      uint64_t v65 = (VCMediaStreamTransport *)v25;
      __int16 v66 = 1024;
      *(_DWORD *)uint64_t v67 = v26;
      *(_WORD *)&v67[4] = 2080;
      *(void *)&v67[6] = v27;
      uint64_t v28 = " [%s] %s:%d Configuring srtpCipherSuite=%@, srtcpCipherSuite=%@, isOneToOne=%{BOOL}d, streamGroupID=%s";
      __int16 v29 = v23;
      uint32_t v30 = 64;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v21 = (__CFString *)[(VCMediaStreamTransport *)self performSelector:sel_logPrefix];
      }
      else {
        long long v21 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_38;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      int v32 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      __int16 v33 = _VCMediaStreamTransport_CipherSuiteAsString(v19);
      v34 = _VCMediaStreamTransport_CipherSuiteAsString(v20);
      BOOL v35 = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)self->_streamConfig multiwayConfig] isOneToOne];
      __int16 v36 = FourccToCStr([(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)self->_streamConfig multiwayConfig] streamGroupID]);
      int v56 = 136317186;
      uint64_t v57 = v31;
      __int16 v58 = 2080;
      v59 = "-[VCMediaStreamTransport setupSRTP]";
      __int16 v60 = 1024;
      int v61 = 463;
      __int16 v62 = 2112;
      uint64_t v63 = v21;
      __int16 v64 = 2048;
      uint64_t v65 = self;
      __int16 v66 = 2112;
      *(void *)uint64_t v67 = v33;
      *(_WORD *)&v67[8] = 2112;
      *(void *)&v67[10] = v34;
      __int16 v68 = 1024;
      BOOL v69 = v35;
      __int16 v70 = 2080;
      v71 = v36;
      uint64_t v28 = " [%s] %s:%d %@(%p) Configuring srtpCipherSuite=%@, srtcpCipherSuite=%@, isOneToOne=%{BOOL}d, streamGroupID=%s";
      __int16 v29 = v32;
      uint32_t v30 = 84;
    }
    _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v56, v30);
LABEL_38:
    SRTPUseEncryption((uint64_t)self->_rtpHandle, (uint64_t)buf, (uint64_t)v72, v19, v20, 2u);
    int v5 = v37;
    __int16 v38 = (VCMediaStreamTransport *)objc_opt_class();
    if ((v5 & 0x80000000) == 0)
    {
      if (v38 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_50;
        }
        uint64_t v40 = VRTraceErrorLogLevelToCSTR();
        v41 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        int v56 = 136315650;
        uint64_t v57 = v40;
        __int16 v58 = 2080;
        v59 = "-[VCMediaStreamTransport setupSRTP]";
        __int16 v60 = 1024;
        int v61 = 472;
        v42 = " [%s] %s:%d SRTPUseEncryption completed";
        v43 = v41;
        uint32_t v44 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v39 = (__CFString *)[(VCMediaStreamTransport *)self performSelector:sel_logPrefix];
        }
        else {
          int v39 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_50;
        }
        uint64_t v45 = VRTraceErrorLogLevelToCSTR();
        char v46 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        int v56 = 136316162;
        uint64_t v57 = v45;
        __int16 v58 = 2080;
        v59 = "-[VCMediaStreamTransport setupSRTP]";
        __int16 v60 = 1024;
        int v61 = 472;
        __int16 v62 = 2112;
        uint64_t v63 = v39;
        __int16 v64 = 2048;
        uint64_t v65 = self;
        v42 = " [%s] %s:%d %@(%p) SRTPUseEncryption completed";
        v43 = v46;
        uint32_t v44 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, v42, (uint8_t *)&v56, v44);
LABEL_50:
      self->_encryptionInfoReceived = 0;
LABEL_51:
      SRTPClearExchangeInfo((uint64_t)buf);
      SRTPClearExchangeInfo((uint64_t)v72);
      return v5;
    }
    if (v38 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamTransport setupSRTP].cold.4();
        }
      }
      goto LABEL_82;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v50 = (__CFString *)[(VCMediaStreamTransport *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v50 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v55 = VRTraceErrorLogLevelToCSTR(),
          v52 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_82:
      SRTPCancelEncryption();
      goto LABEL_51;
    }
    int v56 = 136316162;
    uint64_t v57 = v55;
    __int16 v58 = 2080;
    v59 = "-[VCMediaStreamTransport setupSRTP]";
    __int16 v60 = 1024;
    int v61 = 466;
    __int16 v62 = 2112;
    uint64_t v63 = v50;
    __int16 v64 = 2048;
    uint64_t v65 = self;
    uint64_t v53 = " [%s] %s:%d %@(%p) SRTPUseEncryption failed";
LABEL_84:
    _os_log_error_impl(&dword_1E1EA4000, v52, OS_LOG_TYPE_ERROR, v53, (uint8_t *)&v56, 0x30u);
    goto LABEL_82;
  }
  int v5 = v3;
  if ((VCMediaStreamTransport *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamTransport setupSRTP]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint8_t v6 = (__CFString *)[(VCMediaStreamTransport *)self performSelector:sel_logPrefix];
    }
    else {
      uint8_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCMediaStreamTransport setupSRTP]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 440;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v6;
        *(_WORD *)&buf[38] = 2048;
        *(void *)&buf[40] = self;
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) SRTPPrepareEncryption failed", buf, 0x30u);
      }
    }
  }
  return v5;
}

- (BOOL)setupRTPWithSockets:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4
{
  int rtcpSocket = a3->var0.socketInfo.rtcpSocket;
  int rtpSocket = a3->var0.socketInfo.rtpSocket;
  if (rtcpSocket == rtpSocket)
  {
    int v9 = RTPSetPacketMultiplexMode((uint64_t)self->_rtpHandle, 2);
    if (v9 < 0)
    {
      uint64_t v11 = 492;
      goto LABEL_8;
    }
    int rtpSocket = a3->var0.socketInfo.rtpSocket;
    int rtcpSocket = a3->var0.socketInfo.rtcpSocket;
  }
  int v9 = RTPSetSockets((uint64_t)self->_rtpHandle, rtpSocket, rtcpSocket);
  if ((v9 & 0x80000000) == 0) {
    return 1;
  }
  uint64_t v11 = 505;
LABEL_8:
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, 32016, 105, v9, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", v11), @"Could not setup RTP", @"RTPSetSockets failed");
  return 0;
}

- (int)setupRTPWithTransportStreams
{
  cf[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  CFTypeRef v12 = 0;
  cf[0] = 0;
  CFTypeRef v11 = 0;
  if (self->_transportStreamInfo.creationCallback)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = v3;
    if (self->_payloadType == 1) {
      uint64_t v5 = 6;
    }
    else {
      uint64_t v5 = 4;
    }
    if (self->_payloadType == 1) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = 3;
    }
    if (self->_transportStreamInfo.isReceiveExternallyScheduled) {
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsReceiveExternallyScheduled"];
    }
    if ([(VCMediaStreamConfig *)self->_streamConfig dscpTag]) {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[VCMediaStreamConfig dscpTag](self->_streamConfig, "dscpTag")), @"DSCPTag");
    }
    int v7 = ((uint64_t (*)(void *, uint64_t, void *, CFTypeRef *))self->_transportStreamInfo.creationCallback)(self->_transportStreamInfo.context, v6, v4, cf);
    if (v7 < 0) {
      goto LABEL_20;
    }
    int v7 = ((uint64_t (*)(void *, uint64_t, void *, CFTypeRef *))self->_transportStreamInfo.creationCallback)(self->_transportStreamInfo.context, v5, v4, &v12);
    if (v7 < 0) {
      goto LABEL_20;
    }
    if (self->_payloadType || ![(VCMediaStreamConfig *)self->_streamConfig cellularUniqueTag])
    {
      CFTypeRef v8 = 0;
    }
    else
    {
      int v7 = ((uint64_t (*)(void *, uint64_t, void *, CFTypeRef *))self->_transportStreamInfo.creationCallback)(self->_transportStreamInfo.context, 1, v4, &v11);
      if (v7 < 0)
      {
LABEL_20:
        int v9 = v7;
        goto LABEL_21;
      }
      CFTypeRef v8 = v11;
    }
    int v7 = RTPSetTransportStreams((uint64_t)self->_rtpHandle, cf[0], v12, v8);
    goto LABEL_20;
  }
  int v9 = -2143748035;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaStreamTransport setupRTPWithTransportStreams]();
    }
  }
  uint64_t v4 = 0;
LABEL_21:
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v11) {
    CFRelease(v11);
  }

  return v9;
}

- (BOOL)setupRTPWithNWConnection:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4
{
  int v7 = RTPSetPacketMultiplexMode((uint64_t)self->_rtpHandle, 2);
  if (v7 < 0)
  {
    int v9 = @"RTPSetSockets failed";
    uint64_t v10 = 571;
  }
  else
  {
    int v7 = RTPSetNWConnections((uint64_t)self->_rtpHandle, a3->var0.transportStreamInfo.context);
    if ((v7 & 0x80000000) == 0) {
      return 1;
    }
    int v9 = @"RTPSetNWConnections failed";
    uint64_t v10 = 583;
  }
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, 32016, 105, v7, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", v10), @"Could not setup RTP", v9);
  return 0;
}

- (BOOL)setupRTPForIDS:(id *)a3
{
  int v4 = RTPSetPacketMultiplexMode((uint64_t)self->_rtpHandle, 2);
  if (v4 < 0)
  {
    uint64_t v6 = @"RTP set multiplex mode failed";
    uint64_t v7 = 599;
  }
  else
  {
    int v4 = RTPCreateSocketsForIDS();
    if ((v4 & 0x80000000) == 0) {
      return 1;
    }
    uint64_t v6 = @"RTP set IDS descriptor";
    uint64_t v7 = 611;
  }
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32016, 105, v4, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", v7), @"Could not setup RTP", v6);
  return 0;
}

- (BOOL)setupRTPWithIPInfo:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4
{
  RTPCreateSocketsRetryBind((uint64_t)self->_rtpHandle, (long long *)&a3->var0.socketInfo, (uint64_t)(&a3->var0.nwConnection + 5), 0);
  int v6 = v5;
  if (v5 < 0) {
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, 32016, 105, v5, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", 626), @"Could not setup RTP", @"RTPCreateSocketsRetryBind failed");
  }
  return v6 >= 0;
}

- (BOOL)setupRTPWithTransportSetupInfo:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4
{
  switch(a3->setupType)
  {
    case 1u:
      BOOL result = -[VCMediaStreamTransport setupRTPWithSockets:error:](self, "setupRTPWithSockets:error:");
      break;
    case 2u:
      BOOL result = [(VCMediaStreamTransport *)self setupRTPForIDS:a4];
      break;
    case 3u:
      BOOL result = -[VCMediaStreamTransport setupRTPWithIPInfo:error:](self, "setupRTPWithIPInfo:error:");
      break;
    case 4u:
      BOOL result = -[VCMediaStreamTransport setupRTPWithNWConnection:error:](self, "setupRTPWithNWConnection:error:");
      break;
    case 5u:
      long long v5 = *(_OWORD *)&a3->var0.socketInfo.rtpSocket;
      *(void *)&self->_transportStreamInfo.isReceiveExternallyScheduled = *((void *)&a3->var0.nwConnection + 2);
      *(_OWORD *)&self->_transportStreamInfo.context = v5;
      BOOL result = 1;
      break;
    default:
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", 657), @"Setup type not set", @"Invalid setup type");
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)registerRTPPayloadMappings
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  RTPResetPayloadMapping();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = [(VCMediaStreamConfig *)self->_streamConfig allTxPayloadMap];
  uint64_t v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v3);
        }
        CFTypeRef v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        int v9 = [v8 unsignedIntValue];
        int v10 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCMediaStreamConfig allTxPayloadMap](self->_streamConfig, "allTxPayloadMap"), "objectForKeyedSubscript:", v8), "unsignedShortValue");
        if (v10 == 0xFFFF) {
          unsigned __int16 v11 = v9;
        }
        else {
          unsigned __int16 v11 = v10;
        }
        int v12 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCMediaStreamConfig allRxPayloadMap](self->_streamConfig, "allRxPayloadMap"), "objectForKeyedSubscript:", v8), "unsignedShortValue");
        if (v12 == 0xFFFF) {
          unsigned __int16 v13 = v9;
        }
        else {
          unsigned __int16 v13 = v12;
        }
        RTPAddMappingForPayload((uint64_t)self->_rtpHandle, v11, v13, v9);
      }
      uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v31 objects:v30 count:16];
    }
    while (v5);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v14 = [(VCMediaStreamConfig *)self->_streamConfig allRxPayloadMap];
  uint64_t v15 = [(NSDictionary *)v14 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        int v20 = [v19 unsignedIntValue];
        int v21 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCMediaStreamConfig allRxPayloadMap](self->_streamConfig, "allRxPayloadMap"), "objectForKeyedSubscript:", v19), "unsignedShortValue");
        if (v21 == 0xFFFF) {
          unsigned __int16 v22 = v20;
        }
        else {
          unsigned __int16 v22 = v21;
        }
        int v23 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCMediaStreamConfig allTxPayloadMap](self->_streamConfig, "allTxPayloadMap"), "objectForKeyedSubscript:", v19), "unsignedShortValue");
        if (v23 == 0xFFFF) {
          unsigned __int16 v24 = v20;
        }
        else {
          unsigned __int16 v24 = v23;
        }
        RTPAddMappingForPayload((uint64_t)self->_rtpHandle, v24, v22, v20);
      }
      uint64_t v16 = [(NSDictionary *)v14 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v16);
  }
}

- (id)rxNetworkPayloads
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(VCMediaStreamConfig *)self->_streamConfig rxPayloadMap];
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned __int16 v10 = [v9 unsignedIntValue];
        int v11 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCMediaStreamConfig rxPayloadMap](self->_streamConfig, "rxPayloadMap"), "objectForKeyedSubscript:", v9), "unsignedShortValue");
        if (v11 == 0xFFFF) {
          unsigned __int16 v12 = v10;
        }
        else {
          unsigned __int16 v12 = v11;
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v12));
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (double)lastReceivedRTCPPacketTime
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v9 = NAN;
  int v3 = RTPGetLatestRTCPTimestamp((uint64_t)self->_rtpHandle, &v9);
  if (v3 < 0)
  {
    int v5 = v3;
    if ((VCMediaStreamTransport *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamTransport lastReceivedRTCPPacketTime]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCMediaStreamTransport *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        CFTypeRef v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v11 = v7;
          __int16 v12 = 2080;
          unsigned __int16 v13 = "-[VCMediaStreamTransport lastReceivedRTCPPacketTime]";
          __int16 v14 = 1024;
          int v15 = 711;
          __int16 v16 = 2112;
          long long v17 = v6;
          __int16 v18 = 2048;
          uint64_t v19 = self;
          __int16 v20 = 1024;
          int v21 = v5;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to retrieve last RTCP timesamp. error=%d", buf, 0x36u);
        }
      }
    }
  }
  return v9;
}

- (void)handleEncryptionInfoChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_isSRTPInitialized)
  {
    if ([(VCMediaStreamConfig *)self->_streamConfig SRTPCipherSuite]) {
      BOOL v5 = SRTPUpdateKeyMaterial((uint64_t)self->_rtpHandle, (const __CFDictionary *)a3) == 0;
    }
    else {
      BOOL v5 = 1;
    }
    self->_encryptionInfoReceived = v5;
  }
  else
  {
    if ((VCMediaStreamTransport *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamTransport handleEncryptionInfoChange:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCMediaStreamTransport *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        CFTypeRef v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v9 = 136316162;
          uint64_t v10 = v7;
          __int16 v11 = 2080;
          __int16 v12 = "-[VCMediaStreamTransport handleEncryptionInfoChange:]";
          __int16 v13 = 1024;
          int v14 = 720;
          __int16 v15 = 2112;
          __int16 v16 = v6;
          __int16 v17 = 2048;
          __int16 v18 = self;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) SRTP should be initialized first before we can update security key material", (uint8_t *)&v9, 0x30u);
        }
      }
    }
    self->_encryptionInfoReceived = 0;
  }
}

- (void)setRtcpEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VCMediaStreamConfig *)self->_streamConfig isRTCPEnabled] != a3)
  {
    [(VCMediaStreamConfig *)self->_streamConfig setRtcpEnabled:v3];
    rtpHandle = self->_rtpHandle;
    RTPSetRTCPEnabled((uint64_t)rtpHandle, v3);
  }
}

- (BOOL)isRTCPEnabled
{
  return [(VCMediaStreamConfig *)self->_streamConfig isRTCPEnabled];
}

- (BOOL)isRTCPXREnabled
{
  return self->_rtcpXREnabled;
}

- (double)rtcpSendInterval
{
  [(VCMediaStreamConfig *)self->_streamConfig rtcpSendInterval];
  return result;
}

- (void)setRtcpSendInterval:(double)a3
{
  [(VCMediaStreamConfig *)self->_streamConfig rtcpSendInterval];
  if (v5 != a3)
  {
    [(VCMediaStreamConfig *)self->_streamConfig setRtcpSendInterval:a3];
    RTPSetRTCPSendInterval(a3);
  }
}

- (BOOL)isRTCPSendEnabled
{
  BOOL v3 = [(VCMediaStreamConfig *)self->_streamConfig isRTCPEnabled];
  if (v3)
  {
    [(VCMediaStreamConfig *)self->_streamConfig rtcpSendInterval];
    LOBYTE(v3) = v4 > 0.0;
  }
  return v3;
}

- (BOOL)isRTPTimeoutEnabled
{
  BOOL v3 = [(VCMediaStreamConfig *)self->_streamConfig isRTPTimeOutEnabled];
  if (v3)
  {
    [(VCMediaStreamConfig *)self->_streamConfig rtpTimeOutInterval];
    LOBYTE(v3) = v4 > 0.0;
  }
  return v3;
}

- (void)setRtpTimeoutEnabled:(BOOL)a3
{
}

- (void)setRtpTimeoutInterval:(double)a3
{
}

- (double)rtpTimeoutInterval
{
  [(VCMediaStreamConfig *)self->_streamConfig rtpTimeOutInterval];
  return result;
}

- (BOOL)isRTCPTimeoutEnabled
{
  BOOL v3 = [(VCMediaStreamConfig *)self->_streamConfig isRTCPTimeOutEnabled];
  if (v3)
  {
    [(VCMediaStreamConfig *)self->_streamConfig rtcpTimeOutInterval];
    LOBYTE(v3) = v4 > 0.0;
  }
  return v3;
}

- (void)setRtcpTimeoutEnabled:(BOOL)a3
{
}

- (void)setRtcpTimeoutInterval:(double)a3
{
}

- (double)rtcpTimeoutInterval
{
  [(VCMediaStreamConfig *)self->_streamConfig rtcpTimeOutInterval];
  return result;
}

- (BOOL)isDecryptionTimeoutEnabled
{
  BOOL v3 = [(VCMediaStreamConfig *)self->_streamConfig isDecryptionTimeOutEnabled];
  if (v3)
  {
    [(VCMediaStreamConfig *)self->_streamConfig decryptionTimeOutInterval];
    LOBYTE(v3) = v4 > 0.0;
  }
  return v3;
}

- (void)setDecryptionTimeoutEnabled:(BOOL)a3
{
}

- (BOOL)sendIntervalDidElapse:(int *)a3 remainingTime:(double *)a4
{
  return (int)RTPCheckRTCPSendIntervalElapsed((uint64_t)self->_rtpHandle, a3, a4) >= 0;
}

- (BOOL)setThrottlingInterval:(double)a3
{
  return (int)RTPSetThrottlingAudioInterval(a3) >= 0;
}

- (int64_t)streamDirection
{
  return [(VCMediaStreamConfig *)self->_streamConfig direction];
}

- (void)setStreamDirection:(int64_t)a3
{
  RTPSetStreamDirection((uint64_t)self->_rtpHandle, a3);
  streamConfig = self->_streamConfig;

  [(VCMediaStreamConfig *)streamConfig setDirection:a3];
}

- (unsigned)idsStreamId
{
  uint64_t v2 = [(VCMediaStreamConfig *)self->_streamConfig multiwayConfig];

  return [(VCMediaStreamMultiwayConfig *)v2 idsStreamID];
}

- (BOOL)generateReceptionReport:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*a4)
  {
    int v6 = RTCPInitializeReceptionReportBlock((uint64_t)self->_rtpHandle, (uint64_t)a3);
    BOOL v7 = v6 >= 0;
    if ((v6 & 0x80000000) == 0)
    {
      char v8 = 1;
LABEL_12:
      *a4 = v8;
      return v7;
    }
    int v9 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      char v8 = 0;
      if (!v12) {
        goto LABEL_12;
      }
      if (objc_opt_class()) {
        __int16 v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        __int16 v13 = "<nil>";
      }
      int v15 = 136316674;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCMediaStreamTransport generateReceptionReport:reportCount:]";
      __int16 v19 = 1024;
      int v20 = 859;
      __int16 v21 = 2080;
      uint64_t v22 = v13;
      __int16 v23 = 2048;
      unsigned __int16 v24 = self;
      __int16 v25 = 2080;
      long long v26 = "-[VCMediaStreamTransport generateReceptionReport:reportCount:]";
      __int16 v27 = 1024;
      int v28 = v9;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s[%p] %s failed to generate the reception report: status=%d", (uint8_t *)&v15, 0x40u);
    }
    char v8 = 0;
    goto LABEL_12;
  }
  return 0;
}

- (BOOL)generateRTCPXRSummaryReport:(tagVCRTCPXRSummaryReport *)a3 reportCount:(char *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*a4)
  {
    int v5 = RTCPGetSummaryReportBlock((uint64_t)self->_rtpHandle, (int32x2_t *)a3, 50);
    BOOL v6 = v5 >= 0;
    if ((v5 & 0x80000000) == 0)
    {
      char v7 = 1;
LABEL_12:
      *a4 = v7;
      return v6;
    }
    int v10 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      BOOL v12 = *MEMORY[0x1E4F47A50];
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      char v7 = 0;
      if (!v13) {
        goto LABEL_12;
      }
      int v15 = 136315906;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCMediaStreamTransport generateRTCPXRSummaryReport:reportCount:]";
      __int16 v19 = 1024;
      int v20 = 875;
      __int16 v21 = 1024;
      int v22 = v10;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to generate the RTCP XR Statistics Summary Report: status=%d", (uint8_t *)&v15, 0x22u);
    }
    char v7 = 0;
    goto LABEL_12;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
    return 0;
  }
  uint64_t v8 = VRTraceErrorLogLevelToCSTR();
  int v9 = *MEMORY[0x1E4F47A50];
  BOOL v6 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = "-[VCMediaStreamTransport generateRTCPXRSummaryReport:reportCount:]";
    __int16 v19 = 1024;
    int v20 = 867;
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No slot available for RTCP XR Statistics Summary Report Block", (uint8_t *)&v15, 0x1Cu);
    return 0;
  }
  return v6;
}

- (BOOL)generateRTCPXRVoIPMetricsReport:(tagVCRTCPXRVoIPMetricsReport *)a3 reportCount:(char *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*a4)
  {
    int v5 = RTCPGetVoIPMetricsReportBlock((uint64_t)self->_rtpHandle, (uint64_t)a3);
    BOOL v6 = v5 >= 0;
    if ((v5 & 0x80000000) == 0)
    {
      char v7 = 1;
LABEL_12:
      *a4 = v7;
      return v6;
    }
    int v10 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      BOOL v12 = *MEMORY[0x1E4F47A50];
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      char v7 = 0;
      if (!v13) {
        goto LABEL_12;
      }
      int v15 = 136315906;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCMediaStreamTransport generateRTCPXRVoIPMetricsReport:reportCount:]";
      __int16 v19 = 1024;
      int v20 = 891;
      __int16 v21 = 1024;
      int v22 = v10;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to generate the RTCP XR VoIP Metrics Report: status=%d", (uint8_t *)&v15, 0x22u);
    }
    char v7 = 0;
    goto LABEL_12;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
    return 0;
  }
  uint64_t v8 = VRTraceErrorLogLevelToCSTR();
  int v9 = *MEMORY[0x1E4F47A50];
  BOOL v6 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = "-[VCMediaStreamTransport generateRTCPXRVoIPMetricsReport:reportCount:]";
    __int16 v19 = 1024;
    int v20 = 883;
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No slot available for RTCP XR VoIP Metrics Report Block", (uint8_t *)&v15, 0x1Cu);
    return 0;
  }
  return v6;
}

- (unsigned)getRTCPReportNTPTimeMiddle32ForReportId:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v11 = 0;
  int v5 = RTCPGetReportNTPTimeMiddle32((uint64_t)self->_rtpHandle, a3, &v11);
  if (v5 < 0)
  {
    int v6 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class()) {
          int v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          int v9 = "<nil>";
        }
        *(_DWORD *)buf = 136316930;
        uint64_t v13 = v7;
        __int16 v14 = 2080;
        int v15 = "-[VCMediaStreamTransport getRTCPReportNTPTimeMiddle32ForReportId:]";
        __int16 v16 = 1024;
        int v17 = 901;
        __int16 v18 = 2080;
        __int16 v19 = v9;
        __int16 v20 = 2048;
        __int16 v21 = self;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCMediaStreamTransport getRTCPReportNTPTimeMiddle32ForReportId:]";
        __int16 v24 = 1024;
        int v25 = v3;
        __int16 v26 = 1024;
        int v27 = v6;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s[%p] %s failed to retrieve the report[%d] time: status=%d", buf, 0x46u);
      }
    }
  }
  return v11;
}

- (unsigned)getExtendedSequenceNumberForSequenceNumber:(unsigned __int16)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned int v10 = 0;
  int v4 = RTPGetExtendedSequenceNumber((uint64_t)self->_rtpHandle, a3, &v10);
  if (v4 < 0)
  {
    int v5 = v4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class()) {
          uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          uint64_t v8 = "<nil>";
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCMediaStreamTransport getExtendedSequenceNumberForSequenceNumber:]";
        __int16 v15 = 1024;
        int v16 = 910;
        __int16 v17 = 2080;
        __int16 v18 = v8;
        __int16 v19 = 2048;
        __int16 v20 = self;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCMediaStreamTransport getExtendedSequenceNumberForSequenceNumber:]";
        __int16 v23 = 1024;
        int v24 = v5;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s[%p] %s failed to retrieve extended sequence number: status=%d", buf, 0x40u);
      }
    }
  }
  return v10;
}

- (VCMediaStreamConfig)streamConfig
{
  return self->_streamConfig;
}

- (tagHANDLE)rtpHandle
{
  return self->_rtpHandle;
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (tagVCCryptor)receiverSframeCryptor
{
  return self->_receiverSframeCryptor;
}

- (tagVCCryptor)transmitterSframeCryptor
{
  return self->_transmitterSframeCryptor;
}

- (BOOL)encryptionInfoReceived
{
  return self->_encryptionInfoReceived;
}

- (void)configureWithStreamConfig:(os_log_t)log setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:st"
       "atisticsCollector:basebandCongestionDetector:error:]";
  __int16 v8 = 1024;
  int v9 = 241;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d SFrame cryptors setup error[%@]", (uint8_t *)&v4, 0x26u);
}

- (void)setupSframeCryptorsWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create SFrame receiver cryptor", v2, v3, v4, v5, v6);
}

- (void)setupSframeCryptorsWithError:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create SFrame transmitter cryptor", v2, v3, v4, v5, v6);
}

- (void)setupSRTP
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d SRTPUseEncryption failed", v2, v3, v4, v5, v6);
}

- (void)setupRTPWithTransportStreams
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NULL creationCallback", v2, v3, v4, v5, v6);
}

- (void)lastReceivedRTCPPacketTime
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCMediaStreamTransport lastReceivedRTCPPacketTime]";
  __int16 v6 = 1024;
  int v7 = 711;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to retrieve last RTCP timesamp. error=%d", v3, 0x22u);
}

- (void)handleEncryptionInfoChange:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d SRTP should be initialized first before we can update security key material", v2, v3, v4, v5, v6);
}

@end