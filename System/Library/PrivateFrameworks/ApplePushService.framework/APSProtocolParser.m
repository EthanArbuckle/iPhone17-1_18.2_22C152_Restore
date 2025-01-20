@interface APSProtocolParser
- (APNSPackDecoder)decoderWrapper;
- (APNSPackEncoder)encoderWrapper;
- (APSProtocolParser)init;
- (APSProtocolParserDelegate)delegate;
- (BOOL)_parseSerialMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6;
- (BOOL)isPackedFormat;
- (BOOL)parseMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6;
- (id)copyConnectMessageWithToken:(id)a3 interface:(int64_t)a4 interfaceConstraint:(int64_t)a5 activeInterval:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 redirectCount:(unsigned __int8)a11 tcpHandshakeTimeMilliseconds:(double)a12 dnsResolveTimeMilliseconds:(double)a13 tlsHandshakeTimeMilliseconds:(double)a14 consecutiveConnectionFailureReason:(id)a15 lastConnected:(id)a16 disconnectReason:(unsigned int)a17;
- (id)copyConnectMessageWithToken:(id)a3 interface:(int64_t)a4 interfaceConstraint:(int64_t)a5 presenceFlags:(unsigned int)a6 activeInterval:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 hostCertificateInfo:(id)a12 redirectCount:(unsigned __int8)a13 tcpHandshakeTimeMilliseconds:(double)a14 dnsResolveTimeMilliseconds:(double)a15 tlsHandshakeTimeMilliseconds:(double)a16 consecutiveConnectionFailureReason:(id)a17 lastConnected:(id)a18 disconnectReason:(unsigned int)a19;
- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4;
- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 interfaceConstraint:(int64_t)a7 activeInterval:(unsigned int)a8 metadata:(id)a9 certificates:(id)a10 nonce:(id)a11 signature:(id)a12 hostCertificateInfo:(id)a13 redirectCount:(unsigned __int8)a14 tcpHandshakeTimeMilliseconds:(double)a15 dnsResolveTimeMilliseconds:(double)a16 tlsHandshakeTimeMilliseconds:(double)a17 consecutiveConnectionFailureReason:(id)a18 lastConnected:(id)a19 disconnectReason:(unsigned int)a20;
- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 interfaceConstraint:(int64_t)a7 activeInterval:(unsigned int)a8 metadata:(id)a9 certificates:(id)a10 nonce:(id)a11 signature:(id)a12 redirectCount:(unsigned __int8)a13 lastConnected:(id)a14 disconnectReason:(unsigned int)a15;
- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 lastConnected:(id)a12 disconnectReason:(unsigned int)a13;
- (id)copyFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9;
- (id)copyFlushMessageWithWantPaddingLength:(unint64_t)a3 paddingLength:(unint64_t)a4;
- (id)copyFlushResponseMessageWithPaddingLength:(unint64_t)a3;
- (id)copyKeepAliveMessageWithMetadata:(id)a3;
- (id)copyMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4;
- (id)copyMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5;
- (id)copyMessageTracingAckWithTopicHash:(id)a3 status:(int)a4 tracingUUID:(id)a5 token:(id)a6;
- (id)copyMessageTransportAcknowledgeMessage;
- (id)copyMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8;
- (id)copyPresenceTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7;
- (id)copyPubSubChannelListWithInput:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5;
- (id)copySetActiveIntervalMessageWithInterval:(unsigned int)a3;
- (id)copySetActiveState:(BOOL)a3 forInterval:(unsigned int)a4;
- (id)copyTaskControlMessageWithInput:(id)a3 messageId:(unint64_t)a4;
- (id)copyTaskNotificationMessageWithInput:(id)a3;
- (id)copyTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8;
- (unint64_t)identifier;
- (void)APNSPackDecoder:(id)a3 ReceivedError:(int)a4;
- (void)APNSPackEncoder:(id)a3 receivedError:(int)a4;
- (void)setDecoderWrapper:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncoderWrapper:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIsPackedFormat:(BOOL)a3;
- (void)setIsPackedFormat:(BOOL)a3 maxEncoderTableSize:(unint64_t)a4 maxDecoderTableSize:(unint64_t)a5 interface:(int64_t)a6;
- (void)setSerialItemInParameters:(id)a3 commandID:(unint64_t)a4 itemID:(unint64_t)a5 itemData:(id)a6;
- (void)setSerialNumberInParameters:(id)a3 commandID:(unint64_t)a4 itemID:(unint64_t)a5 Integer:(int64_t)a6;
@end

@implementation APSProtocolParser

- (APSProtocolParser)init
{
  v3.receiver = self;
  v3.super_class = (Class)APSProtocolParser;
  result = [(APSProtocolParser *)&v3 init];
  if (result) {
    result->_identifier = (int)atomic_fetch_add(dword_100159968, 1u);
  }
  return result;
}

- (BOOL)isPackedFormat
{
  return self->_isPackedFormat;
}

- (void)setIsPackedFormat:(BOOL)a3 maxEncoderTableSize:(unint64_t)a4 maxDecoderTableSize:(unint64_t)a5 interface:(int64_t)a6
{
  BOOL v9 = a3;
  if (!self->_isPackedFormat && a3)
  {
    v12 = [[APNSPackEncoder alloc] initWithMaxTableSize:a4];
    encoderWrapper = self->_encoderWrapper;
    self->_encoderWrapper = v12;

    [(APNSPackEncoder *)self->_encoderWrapper setDelegate:self];
    v14 = [[APNSPackDecoder alloc] initWithMaxTableSize:a5];
    decoderWrapper = self->_decoderWrapper;
    self->_decoderWrapper = v14;

    [(APNSPackDecoder *)self->_decoderWrapper setDelegate:self];
  }
  self->_isPackedFormat = v9;
  v16 = +[APSLog protocolParser];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    uint64_t v18 = sub_100040D80(a6);
    v19 = (void *)v18;
    int v21 = 134219010;
    CFStringRef v20 = @"NO";
    unint64_t v22 = identifier;
    __int16 v23 = 2112;
    if (v9) {
      CFStringRef v20 = @"YES";
    }
    uint64_t v24 = v18;
    __int16 v25 = 2112;
    CFStringRef v26 = v20;
    __int16 v27 = 2048;
    unint64_t v28 = a4;
    __int16 v29 = 2048;
    unint64_t v30 = a5;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "P%04llu <config> interface: %@ isPacked: %@ maxEncoderTableSize: %llu maxDecoderTableSize: %llu", (uint8_t *)&v21, 0x34u);
  }
}

- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4
{
  LODWORD(v6) = 1010;
  LOBYTE(v5) = 0;
  return [(APSProtocolParser *)self copyConnectMessageWithToken:a3 state:*(void *)&a4 presenceFlags:0 metadata:0 certificates:0 nonce:0 signature:0 hostCertificateInfo:0 redirectCount:v5 lastConnected:0 disconnectReason:v6];
}

- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 lastConnected:(id)a12 disconnectReason:(unsigned int)a13
{
  LODWORD(v15) = a13;
  LOBYTE(v14) = a11;
  return -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:](self, "copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:", a3, *(void *)&a4, *(void *)&a5, 3, 0, 0, -1.0, -1.0, -1.0, a6, a7, a8, a9, a10, v14,
           0,
           a12,
           v15);
}

- (id)copyConnectMessageWithToken:(id)a3 interface:(int64_t)a4 interfaceConstraint:(int64_t)a5 activeInterval:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 redirectCount:(unsigned __int8)a11 tcpHandshakeTimeMilliseconds:(double)a12 dnsResolveTimeMilliseconds:(double)a13 tlsHandshakeTimeMilliseconds:(double)a14 consecutiveConnectionFailureReason:(id)a15 lastConnected:(id)a16 disconnectReason:(unsigned int)a17
{
  LODWORD(v19) = a17;
  LOBYTE(v18) = a11;
  return -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:](self, "copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:", a3, 1, 0, a4, a5, *(void *)&a6, a12, a13, a14, a7, a8, a9, a10, 0, v18,
           a15,
           a16,
           v19);
}

- (id)copyConnectMessageWithToken:(id)a3 interface:(int64_t)a4 interfaceConstraint:(int64_t)a5 presenceFlags:(unsigned int)a6 activeInterval:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 hostCertificateInfo:(id)a12 redirectCount:(unsigned __int8)a13 tcpHandshakeTimeMilliseconds:(double)a14 dnsResolveTimeMilliseconds:(double)a15 tlsHandshakeTimeMilliseconds:(double)a16 consecutiveConnectionFailureReason:(id)a17 lastConnected:(id)a18 disconnectReason:(unsigned int)a19
{
  LODWORD(v21) = a19;
  LOBYTE(v20) = a13;
  return -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:](self, "copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:", a3, 1, *(void *)&a6, a4, a5, *(void *)&a7, a14, a15, a16, a8, a9, a10, a11, a12, v20,
           a17,
           a18,
           v21);
}

- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 interfaceConstraint:(int64_t)a7 activeInterval:(unsigned int)a8 metadata:(id)a9 certificates:(id)a10 nonce:(id)a11 signature:(id)a12 redirectCount:(unsigned __int8)a13 lastConnected:(id)a14 disconnectReason:(unsigned int)a15
{
  LODWORD(v17) = a15;
  LOBYTE(v16) = a13;
  return -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:](self, "copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:", a3, *(void *)&a4, *(void *)&a5, a6, a7, *(void *)&a8, -1.0, -1.0, -1.0, a9, a10, a11, a12, 0, v16,
           0,
           a14,
           v17);
}

- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 interfaceConstraint:(int64_t)a7 activeInterval:(unsigned int)a8 metadata:(id)a9 certificates:(id)a10 nonce:(id)a11 signature:(id)a12 hostCertificateInfo:(id)a13 redirectCount:(unsigned __int8)a14 tcpHandshakeTimeMilliseconds:(double)a15 dnsResolveTimeMilliseconds:(double)a16 tlsHandshakeTimeMilliseconds:(double)a17 consecutiveConnectionFailureReason:(id)a18 lastConnected:(id)a19 disconnectReason:(unsigned int)a20
{
  uint64_t v20 = *(void *)&a8;
  id v98 = a3;
  id v26 = a9;
  id v99 = a10;
  id v102 = a11;
  id v101 = a12;
  id v100 = a13;
  id v105 = a18;
  id v27 = a19;
  if (self->_isPackedFormat) {
    unint64_t v28 = 0;
  }
  else {
    unint64_t v28 = [[APSProtocolMessage alloc] initWithCommand:7];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:7];
  __int16 v29 = v98;
  if (v98)
  {
    [(APSProtocolMessage *)v28 appendItem:1 data:v98];
    [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:1 data:v98 isIndexable:1];
  }
  [(APSProtocolMessage *)v28 appendOneByteItem:2 byte:a4];
  [(APNSPackEncoder *)self->_encoderWrapper addInt8WithAttributeId:2 number:a4 isIndexable:0];
  if (a4 != 2)
  {
    v95 = v27;
    if (sub_10007E748()) {
      int v30 = 32848;
    }
    else {
      int v30 = 32832;
    }
    if (a6 == 1) {
      int v31 = 522;
    }
    else {
      int v31 = 514;
    }
    LODWORD(v32) = v31 | a5 | v30;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
      LODWORD(v32) = v32 | 0x20;
    }
    if (+[APSSimulatorSupport isSimulator]) {
      uint64_t v32 = v32 | 0x1000;
    }
    else {
      uint64_t v32 = v32;
    }
    [(APSProtocolMessage *)v28 appendFourByteItem:5 bytes:v32];
    a5 = v32;
    [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:5 number:v32 isIndexable:0];
    if (a6 <= 1)
    {
      if (((a7 == 1) & _os_feature_enabled_impl()) != 0) {
        uint64_t v33 = 3;
      }
      else {
        uint64_t v33 = a6 != 0;
      }
      [(APSProtocolMessage *)v28 appendOneByteItem:6 byte:v33];
      [(APNSPackEncoder *)self->_encoderWrapper addInt8WithAttributeId:6 number:v33 isIndexable:0];
    }
    [(APSProtocolMessage *)v28 appendFourByteItem:7 bytes:v20];
    [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:7 number:v20 isIndexable:0];
    v34 = [v26 carrier];
    id v35 = [v34 length];

    if (v35)
    {
      v36 = [v26 carrier];
      [(APSProtocolMessage *)v28 appendItem:8 string:v36];

      encoderWrapper = self->_encoderWrapper;
      v38 = [v26 carrier];
      [(APNSPackEncoder *)encoderWrapper addStringWithAttributId:8 string:v38 isIndexable:0];
    }
    v39 = [v26 softwareVersion];
    id v40 = [v39 length];

    if (v40)
    {
      v41 = [v26 softwareVersion];
      [(APSProtocolMessage *)v28 appendItem:9 string:v41];

      v42 = self->_encoderWrapper;
      v43 = [v26 softwareVersion];
      [(APNSPackEncoder *)v42 addStringWithAttributId:9 string:v43 isIndexable:0];
    }
    v44 = [v26 softwareBuild];
    id v45 = [v44 length];

    if (v45)
    {
      v46 = [v26 softwareBuild];
      [(APSProtocolMessage *)v28 appendItem:10 string:v46];

      v47 = self->_encoderWrapper;
      v48 = [v26 softwareBuild];
      [(APNSPackEncoder *)v47 addStringWithAttributId:10 string:v48 isIndexable:0];
    }
    v49 = [v26 hardwareVersion];
    id v50 = [v49 length];

    if (v50)
    {
      v51 = [v26 hardwareVersion];
      [(APSProtocolMessage *)v28 appendItem:11 string:v51];

      v52 = self->_encoderWrapper;
      v53 = [v26 hardwareVersion];
      [(APNSPackEncoder *)v52 addStringWithAttributId:11 string:v53 isIndexable:0];
    }
    if (v99 && v102 && v101)
    {
      id v54 = v26;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v55 = v99;
      id v56 = [v55 countByEnumeratingWithState:&v116 objects:v134 count:16];
      if (v56)
      {
        id v57 = v56;
        uint64_t v58 = *(void *)v117;
        do
        {
          for (i = 0; i != v57; i = (char *)i + 1)
          {
            if (*(void *)v117 != v58) {
              objc_enumerationMutation(v55);
            }
            [(APSProtocolMessage *)v28 appendItem:12 data:*(void *)(*((void *)&v116 + 1) + 8 * i)];
          }
          id v57 = [v55 countByEnumeratingWithState:&v116 objects:v134 count:16];
        }
        while (v57);
      }

      [(APSProtocolMessage *)v28 appendItem:13 data:v102];
      [(APSProtocolMessage *)v28 appendItem:14 data:v101];
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v60 = v55;
      id v61 = [v60 countByEnumeratingWithState:&v112 objects:v133 count:16];
      if (v61)
      {
        id v62 = v61;
        uint64_t v63 = *(void *)v113;
        do
        {
          for (j = 0; j != v62; j = (char *)j + 1)
          {
            if (*(void *)v113 != v63) {
              objc_enumerationMutation(v60);
            }
            [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:12 data:*(void *)(*((void *)&v112 + 1) + 8 * (void)j) isIndexable:0];
          }
          id v62 = [v60 countByEnumeratingWithState:&v112 objects:v133 count:16];
        }
        while (v62);
      }

      [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:13 data:v102 isIndexable:0];
      [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:14 data:v101 isIndexable:0];
      id v26 = v54;
    }
    if (v100)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Presence contains hostCertificateInfo!", (uint8_t *)&buf, 2u);
      }
      v65 = [v100 data];
      [(APSProtocolMessage *)v28 appendItem:29 data:v65];

      v66 = self->_encoderWrapper;
      v67 = [v100 data];
      [(APNSPackEncoder *)v66 addDataWithAttributeId:29 data:v67 isIndexable:0];
    }
    [(APSProtocolMessage *)v28 appendTwoByteItem:16 bytes:12];
    [(APSProtocolMessage *)v28 appendTwoByteItem:17 bytes:a14];
    [(APNSPackEncoder *)self->_encoderWrapper addInt16WithAttributeId:16 number:12 isIndexable:0];
    [(APNSPackEncoder *)self->_encoderWrapper addInt16WithAttributeId:17 number:a14 isIndexable:0];
    if (a15 >= 0.0)
    {
      double v68 = 65000.0;
      if (a15 <= 65000.0) {
        double v68 = a15;
      }
      uint64_t v69 = (int)v68;
      [(APSProtocolMessage *)v28 appendTwoByteItem:25 bytes:v69];
      [(APNSPackEncoder *)self->_encoderWrapper addInt16WithAttributeId:25 number:v69 isIndexable:0];
    }
    if (a16 >= 0.0)
    {
      double v70 = 65000.0;
      if (a16 <= 65000.0) {
        double v70 = a16;
      }
      uint64_t v71 = (int)v70;
      [(APSProtocolMessage *)v28 appendTwoByteItem:19 bytes:v71];
      [(APNSPackEncoder *)self->_encoderWrapper addInt16WithAttributeId:19 number:v71 isIndexable:0];
    }
    if (a17 >= 0.0)
    {
      double v72 = 65000.0;
      if (a17 <= 65000.0) {
        double v72 = a17;
      }
      uint64_t v73 = (int)v72;
      [(APSProtocolMessage *)v28 appendTwoByteItem:20 bytes:v73];
      [(APNSPackEncoder *)self->_encoderWrapper addInt16WithAttributeId:20 number:v73 isIndexable:0];
    }
    if (v105)
    {
      id v94 = v26;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id obja = [v105 allObjects];
      id v74 = [obja countByEnumeratingWithState:&v108 objects:v132 count:16];
      if (v74)
      {
        id v75 = v74;
        uint64_t v76 = 0;
        uint64_t v77 = *(void *)v109;
        while (2)
        {
          for (k = 0; k != v75; k = (char *)k + 1)
          {
            if (*(void *)v109 != v77) {
              objc_enumerationMutation(obja);
            }
            v79 = *(void **)(*((void *)&v108 + 1) + 8 * (void)k);
            unsigned int v107 = 0;
            uint64_t v80 = (uint64_t)[v79 integerValue];
            if (v80 >= 0) {
              LODWORD(v81) = v80;
            }
            else {
              uint64_t v81 = -v80;
            }
            unsigned int v107 = bswap32(v81);
            __int16 v106 = 0;
            __int16 v106 = bswap32([v105 countForObject:v79]) >> 16;
            id v82 = objc_alloc_init((Class)NSMutableData);
            [v82 appendBytes:&v107 length:4];
            [v82 appendBytes:&v106 length:2];
            [(APSProtocolMessage *)v28 appendItem:21 data:v82];
            [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:21 data:v82 isIndexable:0];
            if ((char *)k + v76 == (void *)9)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v83 = [v105 allObjects];
                int buf = 138412546;
                v121 = self;
                __int16 v122 = 2112;
                v123 = v83;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ reached 10 different failure reasons, {all failure reasons: %@} ", (uint8_t *)&buf, 0x16u);
              }
              goto LABEL_81;
            }
          }
          id v75 = [obja countByEnumeratingWithState:&v108 objects:v132 count:16];
          v76 += (uint64_t)k;
          if (v75) {
            continue;
          }
          break;
        }
      }
LABEL_81:

      __int16 v29 = v98;
      id v26 = v94;
    }
    id v27 = v95;
    if (v95)
    {
      [v95 timeIntervalSince1970];
      unint64_t v85 = (unint64_t)(v84 * 1000.0);
      [(APSProtocolMessage *)v28 appendEightByteItem:22 bytes:v85];
      [(APNSPackEncoder *)self->_encoderWrapper addInt64WithAttributeId:22 number:v85 isIndexable:0];
    }
    if (a20 != 1000)
    {
      [(APSProtocolMessage *)v28 appendFourByteItem:26 bytes:a20];
      [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:26 number:a20 isIndexable:0];
    }
  }
  if (self->_isPackedFormat) {
    id v86 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v86 = [(APSProtocolMessage *)v28 copyMessageData];
  }
  v87 = v86;
  v88 = +[APSLog protocolParser];
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
  {
    id v90 = v27;
    unint64_t identifier = self->_identifier;
    v92 = [v29 debugDescription];
    id v93 = [v87 length];
    int buf = 134219266;
    v121 = (APSProtocolParser *)identifier;
    id v27 = v90;
    __int16 v122 = 2112;
    v123 = v92;
    __int16 v124 = 1024;
    int v125 = 12;
    __int16 v126 = 1024;
    unsigned int v127 = a5;
    __int16 v128 = 2048;
    int64_t v129 = a6;
    __int16 v130 = 2048;
    id v131 = v93;
    _os_log_debug_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEBUG, "P%04llu <out:connect> token: %@ version: %hu flags: %x interface: %lld -- data.len: %llu", (uint8_t *)&buf, 0x36u);
  }
  return v87;
}

- (id)copyFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (self->_isPackedFormat) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = [[APSProtocolMessage alloc] initWithCommand:9];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:9];
  if (a9)
  {
    [(APSProtocolMessage *)v21 appendEightByteItem:12 bytes:a9];
    [(APNSPackEncoder *)self->_encoderWrapper addInt64WithAttributeId:12 number:a9 isIndexable:0];
  }
  if (v20)
  {
    [(APSProtocolMessage *)v21 appendItem:1 data:v20];
    [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:1 data:v20 isIndexable:1];
  }
  v83 = self;
  unint64_t v22 = [(APNSPackEncoder *)self->_encoderWrapper maxTableSize];
  v152[0] = 0;
  v152[1] = v152;
  v152[2] = 0x2020000000;
  v152[3] = 0;
  v150[0] = 0;
  v150[1] = v150;
  v150[2] = 0x2020000000;
  char v151 = 0;
  v141[0] = _NSConcreteStackBlock;
  v141[1] = 3221225472;
  v141[2] = sub_10004D9A4;
  v141[3] = &unk_10012B1D0;
  unint64_t v149 = (unint64_t)((double)v22 * 0.5 / 53.0);
  v147 = v152;
  v148 = v150;
  id v81 = v20;
  id v142 = v81;
  id v23 = v15;
  id v143 = v23;
  id v24 = v16;
  id v144 = v24;
  id v25 = v17;
  id v145 = v25;
  id v87 = v19;
  id v146 = v87;
  id v26 = objc_retainBlock(v141);
  v137[0] = _NSConcreteStackBlock;
  v137[1] = 3221225472;
  v137[2] = sub_10004DB08;
  v137[3] = &unk_10012B1F8;
  unint64_t v85 = v21;
  v138 = v85;
  v139 = self;
  v79 = v26;
  id v140 = v79;
  id v27 = objc_retainBlock(v137);
  id v28 = objc_alloc_init((Class)NSMutableArray);
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = v23;
  id v29 = [obj countByEnumeratingWithState:&v133 objects:v180 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v134;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v134 != v30) {
          objc_enumerationMutation(obj);
        }
        ((void (*)(void *, void, uint64_t, id))v27[2])(v27, *(void *)(*((void *)&v133 + 1) + 8 * i), 2, v28);
      }
      id v29 = [obj countByEnumeratingWithState:&v133 objects:v180 count:16];
    }
    while (v29);
  }

  id v32 = objc_alloc_init((Class)NSMutableArray);
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v91 = v24;
  id v33 = [v91 countByEnumeratingWithState:&v129 objects:v179 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v130;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v130 != v34) {
          objc_enumerationMutation(v91);
        }
        ((void (*)(void *, void, uint64_t, id))v27[2])(v27, *(void *)(*((void *)&v129 + 1) + 8 * (void)j), 3, v32);
      }
      id v33 = [v91 countByEnumeratingWithState:&v129 objects:v179 count:16];
    }
    while (v33);
  }

  id v36 = objc_alloc_init((Class)NSMutableArray);
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v90 = v25;
  id v37 = [v90 countByEnumeratingWithState:&v125 objects:v178 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v126;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v126 != v38) {
          objc_enumerationMutation(v90);
        }
        ((void (*)(void *, void, uint64_t, id))v27[2])(v27, *(void *)(*((void *)&v125 + 1) + 8 * (void)k), 4, v36);
      }
      id v37 = [v90 countByEnumeratingWithState:&v125 objects:v178 count:16];
    }
    while (v37);
  }

  id v40 = objc_alloc_init((Class)NSMutableArray);
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v89 = v18;
  id v41 = [v89 countByEnumeratingWithState:&v121 objects:v177 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v122;
    do
    {
      for (m = 0; m != v41; m = (char *)m + 1)
      {
        if (*(void *)v122 != v42) {
          objc_enumerationMutation(v89);
        }
        ((void (*)(void *, void, uint64_t, id))v27[2])(v27, *(void *)(*((void *)&v121 + 1) + 8 * (void)m), 6, v40);
      }
      id v41 = [v89 countByEnumeratingWithState:&v121 objects:v177 count:16];
    }
    while (v41);
  }

  id v44 = objc_alloc_init((Class)NSMutableArray);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v88 = v87;
  id v45 = [v88 countByEnumeratingWithState:&v117 objects:v176 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v118;
    do
    {
      for (n = 0; n != v45; n = (char *)n + 1)
      {
        if (*(void *)v118 != v46) {
          objc_enumerationMutation(v88);
        }
        ((void (*)(void *, void, uint64_t, id))v27[2])(v27, *(void *)(*((void *)&v117 + 1) + 8 * (void)n), 5, v44);
      }
      id v45 = [v88 countByEnumeratingWithState:&v117 objects:v176 count:16];
    }
    while (v45);
  }

  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_10004DBC4;
  v113[3] = &unk_10012B220;
  id v82 = v85;
  long long v114 = v82;
  long long v115 = v83;
  uint64_t v80 = v79;
  id v116 = v80;
  v48 = objc_retainBlock(v113);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v86 = v28;
  id v49 = [v86 countByEnumeratingWithState:&v109 objects:v175 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v110;
    do
    {
      for (ii = 0; ii != v49; ii = (char *)ii + 1)
      {
        if (*(void *)v110 != v50) {
          objc_enumerationMutation(v86);
        }
        ((void (*)(void *, void, uint64_t))v48[2])(v48, *(void *)(*((void *)&v109 + 1) + 8 * (void)ii), 7);
      }
      id v49 = [v86 countByEnumeratingWithState:&v109 objects:v175 count:16];
    }
    while (v49);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v52 = v32;
  id v53 = [v52 countByEnumeratingWithState:&v105 objects:v174 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v106;
    do
    {
      for (jj = 0; jj != v53; jj = (char *)jj + 1)
      {
        if (*(void *)v106 != v54) {
          objc_enumerationMutation(v52);
        }
        ((void (*)(void *, void, uint64_t))v48[2])(v48, *(void *)(*((void *)&v105 + 1) + 8 * (void)jj), 8);
      }
      id v53 = [v52 countByEnumeratingWithState:&v105 objects:v174 count:16];
    }
    while (v53);
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v56 = v36;
  id v57 = [v56 countByEnumeratingWithState:&v101 objects:v173 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v102;
    do
    {
      for (kk = 0; kk != v57; kk = (char *)kk + 1)
      {
        if (*(void *)v102 != v58) {
          objc_enumerationMutation(v56);
        }
        ((void (*)(void *, void, uint64_t))v48[2])(v48, *(void *)(*((void *)&v101 + 1) + 8 * (void)kk), 9);
      }
      id v57 = [v56 countByEnumeratingWithState:&v101 objects:v173 count:16];
    }
    while (v57);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v60 = v40;
  id v61 = [v60 countByEnumeratingWithState:&v97 objects:v172 count:16];
  if (v61)
  {
    uint64_t v62 = *(void *)v98;
    do
    {
      for (mm = 0; mm != v61; mm = (char *)mm + 1)
      {
        if (*(void *)v98 != v62) {
          objc_enumerationMutation(v60);
        }
        ((void (*)(void *, void, uint64_t))v48[2])(v48, *(void *)(*((void *)&v97 + 1) + 8 * (void)mm), 11);
      }
      id v61 = [v60 countByEnumeratingWithState:&v97 objects:v172 count:16];
    }
    while (v61);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v64 = v44;
  id v65 = [v64 countByEnumeratingWithState:&v93 objects:v171 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v94;
    do
    {
      for (nn = 0; nn != v65; nn = (char *)nn + 1)
      {
        if (*(void *)v94 != v66) {
          objc_enumerationMutation(v64);
        }
        ((void (*)(void *, void, uint64_t))v48[2])(v48, *(void *)(*((void *)&v93 + 1) + 8 * (void)nn), 10);
      }
      id v65 = [v64 countByEnumeratingWithState:&v93 objects:v171 count:16];
    }
    while (v65);
  }

  if (v83->_isPackedFormat) {
    id v68 = [(APNSPackEncoder *)v83->_encoderWrapper copyMessage];
  }
  else {
    id v68 = [(APSProtocolMessage *)v82 copyMessageData];
  }
  uint64_t v69 = v68;
  double v70 = +[APSLog protocolParser];
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = v83->_identifier;
    id v78 = [v81 debugDescription];
    id v77 = [obj count];
    id v76 = [v91 count];
    id v75 = [v90 count];
    id v74 = [v89 count];
    id v72 = [v88 count];
    id v73 = [v69 length];
    *(_DWORD *)int buf = 134220034;
    unint64_t v154 = identifier;
    __int16 v155 = 2112;
    id v156 = v78;
    __int16 v157 = 2048;
    unint64_t v158 = a9;
    __int16 v159 = 2048;
    id v160 = v77;
    __int16 v161 = 2048;
    id v162 = v76;
    __int16 v163 = 2048;
    id v164 = v75;
    __int16 v165 = 2048;
    id v166 = v74;
    __int16 v167 = 2048;
    id v168 = v72;
    __int16 v169 = 2048;
    id v170 = v73;
    _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "P%04llu <out:filter> token: %@ version: %llu; enabled.len: %llu ignoredHashes.len: %llu opportunistic.len: %llu no"
      "nWaking.len: %llu paused.len: %llu  -- data.len: %llu",
      buf,
      0x5Cu);
  }
  _Block_object_dispose(v150, 8);
  _Block_object_dispose(v152, 8);

  return v69;
}

- (id)copyMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4
{
  return [(APSProtocolParser *)self copyMessageAcknowledgeMessageWithResponse:a3 messageId:a4 token:0];
}

- (id)copyMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_isPackedFormat) {
    v10 = 0;
  }
  else {
    v10 = [[APSProtocolMessage alloc] initWithCommand:11];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:11];
  [(APSProtocolMessage *)v10 appendOneByteItem:8 byte:a3];
  [(APNSPackEncoder *)self->_encoderWrapper addInt8WithAttributeId:8 number:a3 isIndexable:0];
  if (v8)
  {
    [(APSProtocolMessage *)v10 appendItem:4 data:v8];
    -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:](self->_encoderWrapper, "addInt32WithAttributeId:number:isIndexable:", 4, *(unsigned int *)[v8 bytes], 0);
  }
  if (v9)
  {
    [(APSProtocolMessage *)v10 appendItem:1 data:v9];
    [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:1 data:v9 isIndexable:1];
  }
  if (self->_isPackedFormat) {
    id v11 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v11 = [(APSProtocolMessage *)v10 copyMessageData];
  }
  v12 = v11;
  v13 = +[APSLog protocolParser];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    id v16 = [v9 debugDescription];
    if (v8) {
      int v17 = *(_DWORD *)[v8 bytes];
    }
    else {
      int v17 = 0;
    }
    int v18 = 134219010;
    unint64_t v19 = identifier;
    __int16 v20 = 2112;
    uint64_t v21 = v16;
    __int16 v22 = 2048;
    int64_t v23 = a3;
    __int16 v24 = 1024;
    int v25 = v17;
    __int16 v26 = 2048;
    id v27 = [v12 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "P%04llu <out:msgAck> token: %@ status: %lld messageID: %u  -- data.len: %llu", (uint8_t *)&v18, 0x30u);
  }
  return v12;
}

- (id)copyMessageTracingAckWithTopicHash:(id)a3 status:(int)a4 tracingUUID:(id)a5 token:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (self->_isPackedFormat) {
    v13 = 0;
  }
  else {
    v13 = [[APSProtocolMessage alloc] initWithCommand:27];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:27];
  [(APSProtocolMessage *)v13 appendItem:1 data:v10];
  [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:1 data:v10 isIndexable:1];
  [(APSProtocolMessage *)v13 appendItem:2 data:v11];
  [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:2 data:v11 isIndexable:0];
  [(APSProtocolMessage *)v13 appendOneByteItem:3 byte:a4];
  [(APNSPackEncoder *)self->_encoderWrapper addInt8WithAttributeId:3 number:a4 isIndexable:0];
  if (v12)
  {
    [(APSProtocolMessage *)v13 appendItem:4 data:v12];
    [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:4 data:v12 isIndexable:1];
  }
  if (self->_isPackedFormat) {
    id v14 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v14 = [(APSProtocolMessage *)v13 copyMessageData];
  }
  id v15 = v14;
  id v16 = +[APSLog protocolParser];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    unint64_t v19 = [v12 debugDescription];
    int v20 = 134219266;
    unint64_t v21 = identifier;
    __int16 v22 = 2112;
    int64_t v23 = v19;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = a4;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2048;
    id v31 = [v15 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "P%04llu <out:msgTraceAck> token: %@ topicHash: %@d status: %lld tracingUUID: %@  -- data.len: %llu", (uint8_t *)&v20, 0x3Eu);
  }
  return v15;
}

- (id)copyMessageTransportAcknowledgeMessage
{
  if (self->_isPackedFormat) {
    objc_super v3 = 0;
  }
  else {
    objc_super v3 = [[APSProtocolMessage alloc] initWithCommand:21];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:21];
  if (self->_isPackedFormat) {
    id v4 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v4 = [(APSProtocolMessage *)v3 copyMessageData];
  }
  uint64_t v5 = v4;
  uint64_t v6 = +[APSLog protocolParser];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000C8E98((uint64_t)self, v5, v6);
  }

  return v5;
}

- (id)copyKeepAliveMessageWithMetadata:(id)a3
{
  id v4 = a3;
  if (self->_isPackedFormat) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [[APSProtocolMessage alloc] initWithCommand:12];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:12];
  uint64_t v6 = [v4 carrier];
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = [v4 carrier];
    [(APSProtocolMessage *)v5 appendItem:1 string:v8];

    encoderWrapper = self->_encoderWrapper;
    id v10 = [v4 carrier];
    [(APNSPackEncoder *)encoderWrapper addStringWithAttributId:1 string:v10 isIndexable:1];
  }
  id v11 = [v4 softwareVersion];
  id v12 = [v11 length];

  if (v12)
  {
    v13 = [v4 softwareVersion];
    [(APSProtocolMessage *)v5 appendItem:2 string:v13];

    id v14 = self->_encoderWrapper;
    id v15 = [v4 softwareVersion];
    [(APNSPackEncoder *)v14 addStringWithAttributId:2 string:v15 isIndexable:1];
  }
  id v16 = [v4 softwareBuild];
  id v17 = [v16 length];

  if (v17)
  {
    int v18 = [v4 softwareBuild];
    [(APSProtocolMessage *)v5 appendItem:3 string:v18];

    unint64_t v19 = self->_encoderWrapper;
    int v20 = [v4 softwareBuild];
    [(APNSPackEncoder *)v19 addStringWithAttributId:3 string:v20 isIndexable:1];
  }
  unint64_t v21 = [v4 hardwareVersion];
  id v22 = [v21 length];

  if (v22)
  {
    int64_t v23 = [v4 hardwareVersion];
    [(APSProtocolMessage *)v5 appendItem:4 string:v23];

    __int16 v24 = self->_encoderWrapper;
    id v25 = [v4 hardwareVersion];
    [(APNSPackEncoder *)v24 addStringWithAttributId:4 string:v25 isIndexable:1];
  }
  __int16 v26 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 keepAliveInterval]);
  uint64_t v27 = [v26 description];
  [(APSProtocolMessage *)v5 appendItem:5 string:v27];

  __int16 v28 = self->_encoderWrapper;
  id v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 keepAliveInterval]);
  __int16 v30 = [v29 description];
  [(APNSPackEncoder *)v28 addStringWithAttributId:5 string:v30 isIndexable:1];

  if ((int)[v4 delayedResponseInterval] >= 1)
  {
    id v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 delayedResponseInterval]);
    id v32 = [v31 description];
    [(APSProtocolMessage *)v5 appendItem:6 string:v32];

    id v33 = self->_encoderWrapper;
    uint64_t v34 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 delayedResponseInterval]);
    id v35 = [v34 description];
    [(APNSPackEncoder *)v33 addStringWithAttributId:6 string:v35 isIndexable:1];
  }
  if ([v4 usingServerStats])
  {
    [(APSProtocolMessage *)v5 appendTwoByteItem:8 bytes:1];
    [(APNSPackEncoder *)self->_encoderWrapper addInt16WithAttributeId:8 number:1 isIndexable:0];
  }
  id v36 = [v4 keepAliveState];

  if (v36)
  {
    id v37 = [v4 keepAliveState];
    -[APSProtocolMessage appendOneByteItem:byte:](v5, "appendOneByteItem:byte:", 9, [v37 state]);
    -[APSProtocolMessage appendOneByteItem:byte:](v5, "appendOneByteItem:byte:", 10, [v37 subState]);
    -[APNSPackEncoder addInt8WithAttributeId:number:isIndexable:](self->_encoderWrapper, "addInt8WithAttributeId:number:isIndexable:", 9, [v37 state], 0);
    -[APNSPackEncoder addInt8WithAttributeId:number:isIndexable:](self->_encoderWrapper, "addInt8WithAttributeId:number:isIndexable:", 10, [v37 subState], 0);
  }
  if (self->_isPackedFormat) {
    id v38 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v38 = [(APSProtocolMessage *)v5 copyMessageData];
  }
  v39 = v38;
  id v40 = +[APSLog protocolParser];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v43 = 134218498;
    unint64_t v44 = identifier;
    __int16 v45 = 2112;
    id v46 = v4;
    __int16 v47 = 2048;
    id v48 = [v39 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "P%04llu <out:ka> metadata: %@ -- data.len: %llu", (uint8_t *)&v43, 0x20u);
  }

  return v39;
}

- (id)copyMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (self->_isPackedFormat) {
    int v18 = 0;
  }
  else {
    int v18 = [[APSProtocolMessage alloc] initWithCommand:10];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:10];
  [(APSProtocolMessage *)v18 appendFourByteItem:4 bytes:a4];
  [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:4 number:a4 isIndexable:0];
  [(APSProtocolMessage *)v18 appendItem:1 data:v14];
  [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:1 data:v14 isIndexable:1];
  if (v16)
  {
    [(APSProtocolMessage *)v18 appendItem:2 data:v16];
    [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:2 data:v16 isIndexable:1];
  }
  [(APSProtocolMessage *)v18 appendItem:3 data:v15];
  encoderWrapper = self->_encoderWrapper;
  if (!v9)
  {
    [(APNSPackEncoder *)encoderWrapper addDataWithAttributeId:3 data:v15 isIndexable:0];
    if (!v17) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [(APNSPackEncoder *)encoderWrapper addBinaryPropertyListWithAttributeId:3 data:v15 isIndexable:0];
  if (v17)
  {
LABEL_10:
    -[APSProtocolMessage appendTwoByteItem:bytes:](v18, "appendTwoByteItem:bytes:", 25, (unsigned __int16)[v17 unsignedIntegerValue]);
    -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:](self->_encoderWrapper, "addInt16WithAttributeId:number:isIndexable:", 25, (unsigned __int16)[v17 unsignedIntegerValue], 0);
  }
LABEL_11:
  if (self->_isPackedFormat) {
    id v20 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v20 = [(APSProtocolMessage *)v18 copyMessageData];
  }
  unint64_t v21 = v20;
  id v22 = +[APSLog protocolParser];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    __int16 v24 = [v16 debugDescription];
    id v27 = [v15 length];
    if (v9) {
      CFStringRef v25 = @"YES";
    }
    else {
      CFStringRef v25 = @"NO";
    }
    id v26 = objc_msgSend(v21, "length", v27);
    *(_DWORD *)int buf = 134219522;
    unint64_t v31 = identifier;
    __int16 v32 = 2112;
    id v33 = v24;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2048;
    unint64_t v37 = a4;
    __int16 v38 = 2048;
    uint64_t v39 = v28;
    __int16 v40 = 2112;
    CFStringRef v41 = v25;
    __int16 v42 = 2048;
    id v43 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "P%04llu <out:msg> token: %@ topicHash: %@ messageID: %llu payload.len: %llu isPlistFormat: %@ -- data.len: %llu", buf, 0x48u);
  }
  return v21;
}

- (id)copyFlushMessageWithWantPaddingLength:(unint64_t)a3 paddingLength:(unint64_t)a4
{
  if (self->_isPackedFormat) {
    id v7 = 0;
  }
  else {
    id v7 = [[APSProtocolMessage alloc] initWithCommand:15];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:15];
  if (a3)
  {
    [(APSProtocolMessage *)v7 appendTwoByteItem:1 bytes:(unsigned __int16)a3];
    [(APNSPackEncoder *)self->_encoderWrapper addInt16WithAttributeId:1 number:(unsigned __int16)a3 isIndexable:0];
  }
  if (a4)
  {
    id v8 = objc_alloc_init((Class)NSMutableData);
    [v8 increaseLengthBy:a4];
    [(APSProtocolMessage *)v7 appendItem:2 data:v8];
    [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:2 data:v8 isIndexable:0];
  }
  if (self->_isPackedFormat) {
    id v9 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v9 = [(APSProtocolMessage *)v7 copyMessageData];
  }
  id v10 = v9;
  id v11 = +[APSLog protocolParser];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v14 = 134218752;
    unint64_t v15 = identifier;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 2048;
    id v21 = [v10 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "P%04llu <out:flush> wantLength: %llu paddingLength: %llu  -- data.len: %llu", (uint8_t *)&v14, 0x2Au);
  }

  return v10;
}

- (id)copyFlushResponseMessageWithPaddingLength:(unint64_t)a3
{
  if (self->_isPackedFormat) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [[APSProtocolMessage alloc] initWithCommand:16];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:16];
  if (a3)
  {
    id v6 = objc_alloc_init((Class)NSMutableData);
    [v6 increaseLengthBy:a3];
    [(APSProtocolMessage *)v5 appendItem:2 data:v6];
    [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:2 data:v6 isIndexable:0];
  }
  if (self->_isPackedFormat) {
    id v7 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v7 = [(APSProtocolMessage *)v5 copyMessageData];
  }
  id v8 = v7;
  id v9 = +[APSLog protocolParser];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v12 = 134218496;
    unint64_t v13 = identifier;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2048;
    id v17 = [v8 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "P%04llu <out:flushResp> paddingLength: %llu  -- data.len: %llu", (uint8_t *)&v12, 0x20u);
  }

  return v8;
}

- (id)copyTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if (self->_isPackedFormat) {
    id v17 = 0;
  }
  else {
    id v17 = [[APSProtocolMessage alloc] initWithCommand:17];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:17];
  if ((unint64_t)[v14 length] >= 0x14)
  {
    [(APSProtocolMessage *)v17 appendItem:2 data:v14];
    [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:2 data:v14 isIndexable:1];
    if (v15)
    {
      [(APSProtocolMessage *)v17 appendItem:1 data:v15];
      [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:1 data:v15 isIndexable:1];
    }
    if (v11)
    {
      [(APSProtocolMessage *)v17 appendTwoByteItem:3 bytes:v11];
      [(APNSPackEncoder *)self->_encoderWrapper addInt16WithAttributeId:3 number:v11 isIndexable:0];
    }
    if (a8)
    {
      [(APSProtocolMessage *)v17 appendTwoByteItem:4 bytes:(unsigned __int16)a8];
      [(APNSPackEncoder *)self->_encoderWrapper addInt16WithAttributeId:4 number:(unsigned __int16)a8 isIndexable:0];
    }
    if (v10)
    {
      [(APSProtocolMessage *)v17 appendFourByteItem:5 bytes:v10];
      [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:5 number:v10 isIndexable:0];
    }
    if (v16)
    {
      [(APSProtocolMessage *)v17 appendItem:6 data:v16];
      [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:6 data:v16 isIndexable:0];
    }
  }
  if (self->_isPackedFormat) {
    id v18 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v18 = [(APSProtocolMessage *)v17 copyMessageData];
  }
  unint64_t v19 = v18;
  __int16 v20 = +[APSLog protocolParser];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    id v22 = [v15 debugDescription];
    *(_DWORD *)int buf = 134219778;
    unint64_t v25 = identifier;
    __int16 v26 = 2112;
    id v27 = v22;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2048;
    uint64_t v31 = v11;
    __int16 v32 = 2048;
    uint64_t v33 = v10;
    __int16 v34 = 2048;
    id v35 = [v16 length];
    __int16 v36 = 2048;
    int64_t v37 = a8;
    __int16 v38 = 2048;
    id v39 = [v19 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "P%04llu <out:tokenGen> token: %@ topicHash: %@ appId: %llu expirationTTL: %llu vapidPublicKeyHash.len: %llu type: %lld  -- data.len: %llu", buf, 0x52u);
  }
  return v19;
}

- (id)copyPresenceTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a4;
  if (self->_isPackedFormat) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = [[APSProtocolMessage alloc] initWithCommand:32];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:32];
  [(APSProtocolMessage *)v13 appendFourByteItem:1 bytes:a3];
  [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:1 number:a3 isIndexable:0];
  if (v12)
  {
    [(APSProtocolMessage *)v13 appendItem:2 data:v12];
    [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:2 data:v12 isIndexable:0];
  }
  if (a5)
  {
    [(APSProtocolMessage *)v13 appendEightByteItem:3 bytes:a5];
    [(APNSPackEncoder *)self->_encoderWrapper addInt64WithAttributeId:3 number:a5 isIndexable:0];
  }
  [(APSProtocolMessage *)v13 appendFourByteItem:4 bytes:v8];
  [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:4 number:v8 isIndexable:0];
  if (a7)
  {
    [(APSProtocolMessage *)v13 appendEightByteItem:5 bytes:a7];
    [(APNSPackEncoder *)self->_encoderWrapper addInt64WithAttributeId:5 number:a7 isIndexable:0];
  }
  if (self->_isPackedFormat) {
    id v14 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v14 = [(APSProtocolMessage *)v13 copyMessageData];
  }
  id v15 = v14;
  id v16 = +[APSLog protocolParser];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    unint64_t v19 = [v12 debugDescription];
    int v20 = 134219522;
    unint64_t v21 = identifier;
    __int16 v22 = 2112;
    int64_t v23 = v19;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    __int16 v26 = 2048;
    unint64_t v27 = a5;
    __int16 v28 = 2048;
    uint64_t v29 = v8;
    __int16 v30 = 2048;
    unint64_t v31 = a7;
    __int16 v32 = 2048;
    id v33 = [v15 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "P%04llu <out:presenceTrackingReq> token: %@ messageId: %llu salt: %llu trackingFlag: %llu timestamp: %llu  -- data.len: %llu", (uint8_t *)&v20, 0x48u);
  }
  return v15;
}

- (id)copySetActiveIntervalMessageWithInterval:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->_isPackedFormat) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [[APSProtocolMessage alloc] initWithCommand:19];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:19];
  [(APSProtocolMessage *)v5 appendFourByteItem:1 bytes:v3];
  [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:1 number:v3 isIndexable:0];
  if (self->_isPackedFormat) {
    id v6 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v6 = [(APSProtocolMessage *)v5 copyMessageData];
  }
  id v7 = v6;
  uint64_t v8 = +[APSLog protocolParser];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v11 = 134218496;
    unint64_t v12 = identifier;
    __int16 v13 = 2048;
    uint64_t v14 = v3;
    __int16 v15 = 2048;
    id v16 = [v7 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "P%04llu <out:activeInt> activeInterval: %llu  -- data.len: %llu", (uint8_t *)&v11, 0x20u);
  }

  return v7;
}

- (id)copySetActiveState:(BOOL)a3 forInterval:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  if (self->_isPackedFormat) {
    id v7 = 0;
  }
  else {
    id v7 = [[APSProtocolMessage alloc] initWithCommand:20];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:20];
  if (v5) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [(APSProtocolMessage *)v7 appendOneByteItem:1 byte:v8];
  [(APNSPackEncoder *)self->_encoderWrapper addInt8WithAttributeId:1 number:v8 isIndexable:0];
  if (v5)
  {
    [(APSProtocolMessage *)v7 appendFourByteItem:2 bytes:v4];
    [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:2 number:v4 isIndexable:0];
  }
  if (self->_isPackedFormat) {
    id v9 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v9 = [(APSProtocolMessage *)v7 copyMessageData];
  }
  uint64_t v10 = v9;
  int v11 = +[APSLog protocolParser];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    if (v5) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    int v15 = 134218754;
    unint64_t v16 = identifier;
    __int16 v17 = 2048;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    CFStringRef v20 = v14;
    __int16 v21 = 2048;
    id v22 = [v10 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "P%04llu <out:activeState> interval: %llu isActive: %@  -- data.len: %llu", (uint8_t *)&v15, 0x2Au);
  }

  return v10;
}

- (id)copyTaskControlMessageWithInput:(id)a3 messageId:(unint64_t)a4
{
  id v6 = a3;
  if (self->_isPackedFormat) {
    id v7 = 0;
  }
  else {
    id v7 = [[APSProtocolMessage alloc] initWithCommand:24];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:24];
  [(APSProtocolMessage *)v7 appendFourByteItem:1 bytes:a4];
  [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:1 number:a4 isIndexable:0];
  [(APSProtocolMessage *)v7 appendItem:2 data:v6];
  [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:2 data:v6 isIndexable:0];
  if (self->_isPackedFormat) {
    id v8 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v8 = [(APSProtocolMessage *)v7 copyMessageData];
  }
  id v9 = v8;
  uint64_t v10 = +[APSLog protocolParser];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v13 = 134218752;
    unint64_t v14 = identifier;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    __int16 v17 = 2048;
    id v18 = [v6 length];
    __int16 v19 = 2048;
    id v20 = [v9 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "P%04llu <out:taskControl> messageId: %llu messageInput.len: %llu  -- data.len: %llu", (uint8_t *)&v13, 0x2Au);
  }

  return v9;
}

- (id)copyTaskNotificationMessageWithInput:(id)a3
{
  id v4 = a3;
  if (self->_isPackedFormat) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [[APSProtocolMessage alloc] initWithCommand:25];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:25];
  [(APSProtocolMessage *)v5 appendItem:2 data:v4];
  if (self->_isPackedFormat) {
    id v6 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v6 = [(APSProtocolMessage *)v5 copyMessageData];
  }
  id v7 = v6;
  id v8 = +[APSLog protocolParser];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v11 = 134218496;
    unint64_t v12 = identifier;
    __int16 v13 = 2048;
    id v14 = [v4 length];
    __int16 v15 = 2048;
    id v16 = [v7 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "P%04llu <out:taskNote> messageInput.len: %llu  -- data.len: %llu", (uint8_t *)&v11, 0x20u);
  }

  return v7;
}

- (id)copyPubSubChannelListWithInput:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if (self->_isPackedFormat) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = [[APSProtocolMessage alloc] initWithCommand:29];
  }
  [(APNSPackEncoder *)self->_encoderWrapper setCommand:29];
  [(APSProtocolMessage *)v10 appendFourByteItem:1 bytes:v5];
  [(APNSPackEncoder *)self->_encoderWrapper addInt32WithAttributeId:1 number:v5 isIndexable:0];
  [(APSProtocolMessage *)v10 appendItem:2 data:v8];
  [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:2 data:v8 isIndexable:0];
  [(APSProtocolMessage *)v10 appendItem:3 data:v9];
  [(APNSPackEncoder *)self->_encoderWrapper addDataWithAttributeId:3 data:v9 isIndexable:0];
  if (self->_isPackedFormat) {
    id v11 = [(APNSPackEncoder *)self->_encoderWrapper copyMessage];
  }
  else {
    id v11 = [(APSProtocolMessage *)v10 copyMessageData];
  }
  unint64_t v12 = v11;
  __int16 v13 = +[APSLog protocolParser];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    id v16 = [v9 debugDescription];
    int v17 = 134219010;
    unint64_t v18 = identifier;
    __int16 v19 = 2112;
    id v20 = v16;
    __int16 v21 = 2048;
    uint64_t v22 = v5;
    __int16 v23 = 2048;
    id v24 = [v8 length];
    __int16 v25 = 2048;
    id v26 = [v12 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "P%04llu <out:psChannelList> token: %@ messageID: %llu messageInput.len: %llu  -- data.len: %llu", (uint8_t *)&v17, 0x34u);
  }
  return v12;
}

- (void)APNSPackEncoder:(id)a3 receivedError:(int)a4
{
  if (self->_encoderWrapper == a3)
  {
    delegate = self->_delegate;
    id v6 = [a3 errorMessage];
    [(APSProtocolParserDelegate *)delegate protocolParser:self receiveAPNSPackError:v6];
  }
}

- (void)APNSPackDecoder:(id)a3 ReceivedError:(int)a4
{
  if (self->_decoderWrapper == a3)
  {
    delegate = self->_delegate;
    id v6 = [a3 errorMessage];
    [(APSProtocolParserDelegate *)delegate protocolParser:self receiveAPNSPackError:v6];
  }
}

- (BOOL)parseMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6
{
  id v10 = a3;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  if ([v10 length])
  {
    id v11 = v10;
    uint64_t v12 = *(unsigned __int8 *)[v11 bytes];
    if (v12 > 0x22 || ((1 << v12) & 0x763C5EF80) == 0)
    {
      unsigned int v27 = 0;
      *a5 = 1;
    }
    else
    {
      if (self->_isPackedFormat) {
        unsigned int v14 = [(APNSPackDecoder *)self->_decoderWrapper decodeMessage:v11 parser:self parameters:a4 isInvalid:a5 lengthParsed:a6];
      }
      else {
        unsigned int v14 = [(APSProtocolParser *)self _parseSerialMessage:v11 parameters:a4 isInvalid:a5 lengthParsed:a6];
      }
      unsigned int v27 = v14;
    }
    id v16 = +[APSLog protocolParser];
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

    if (v17)
    {
      if ((v12 - 7) > 0x1Bu) {
        CFStringRef v18 = @"invalid";
      }
      else {
        CFStringRef v18 = off_10012B240[(char)(v12 - 7)];
      }
      __int16 v19 = +[APSLog protocolParser];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        unint64_t identifier = self->_identifier;
        id v22 = [v11 length];
        unint64_t v23 = *a6;
        CFStringRef v24 = @"YES";
        id v25 = *a4;
        if (*a5) {
          CFStringRef v26 = @"YES";
        }
        else {
          CFStringRef v26 = @"NO";
        }
        *(_DWORD *)int buf = 134219778;
        if (!v27) {
          CFStringRef v24 = @"NO";
        }
        unint64_t v29 = identifier;
        __int16 v30 = 2112;
        CFStringRef v31 = v18;
        __int16 v32 = 2048;
        uint64_t v33 = v12;
        __int16 v34 = 2048;
        id v35 = v22;
        __int16 v36 = 2048;
        unint64_t v37 = v23;
        __int16 v38 = 2112;
        CFStringRef v39 = v26;
        __int16 v40 = 2112;
        CFStringRef v41 = v24;
        __int16 v42 = 2112;
        id v43 = v25;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "P%04llu <in:%@> command: %llu message.len: %llu lengthParsed: %llu isInvalid: %@ success: %@  -- parameters: %@", buf, 0x52u);
      }
    }
    BOOL v15 = v27;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_parseSerialMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = [v10 length];
  id v12 = v10;
  __int16 v13 = (unsigned __int8 *)[v12 bytes];
  unsigned int v14 = +[NSMutableDictionary dictionary];
  uint64_t v15 = *v13;
  id v16 = +[NSNumber numberWithUnsignedInteger:v15];
  [v14 setObject:v16 forKey:@"APSProtocolCommand"];

  if ((unint64_t)v11 < 5) {
    goto LABEL_4;
  }
  unsigned int v27 = a5;
  unsigned int v17 = *(_DWORD *)(v13 + 1);
  unsigned int v18 = bswap32(v17);
  if ((v18 & 0x80000000) != 0)
  {
LABEL_10:
    BOOL v20 = 0;
    *unsigned int v27 = 1;
    goto LABEL_13;
  }
  unint64_t v19 = v18 + 5;
  if ((unint64_t)v11 < v19)
  {
LABEL_4:
    BOOL v20 = 0;
    goto LABEL_13;
  }
  CFStringRef v26 = a6;
  if (v17)
  {
    uint64_t v21 = 5;
    while (1)
    {
      unint64_t v22 = v21 + 3 + (bswap32(*(unsigned __int16 *)&v13[v21 + 1]) >> 16);
      if (v22 > v19) {
        goto LABEL_10;
      }
      uint64_t v23 = v13[v21];
      CFStringRef v24 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v13[v21 + 3]);
      [(APSProtocolParser *)self setSerialItemInParameters:v14 commandID:v15 itemID:v23 itemData:v24];

      uint64_t v21 = v22;
      if (v22 >= v19) {
        goto LABEL_12;
      }
    }
  }
  unint64_t v22 = 5;
LABEL_12:
  *a4 = v14;
  *CFStringRef v26 = v22;
  BOOL v20 = 1;
LABEL_13:

  return v20;
}

- (void)setSerialNumberInParameters:(id)a3 commandID:(unint64_t)a4 itemID:(unint64_t)a5 Integer:(int64_t)a6
{
  id v9 = a3;
  switch(a4)
  {
    case 7uLL:
      if (a5 == 2)
      {
        id v10 = +[NSNumber numberWithUnsignedInteger:a6];
        CFStringRef v11 = @"APSProtocolPresenceStatus";
        goto LABEL_95;
      }
      goto LABEL_97;
    case 8uLL:
      switch(a5)
      {
        case 1uLL:
          if (a6 != (char)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedInteger:a6];
          CFStringRef v11 = @"APSProtocolConnectedResponse";
          break;
        case 4uLL:
          if (a6 != (__int16)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedInteger:(unsigned __int16)a6];
          CFStringRef v11 = @"APSProtocolMessageSize";
          break;
        case 6uLL:
          if (a6 != (int)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedLong:a6];
          id v12 = +[NSNumber numberWithBool:a6 & 1];
          [v9 setObject:v12 forKey:@"APSProtocolDualChannelSupport"];
          __int16 v13 = +[NSNumber numberWithBool:(a6 >> 1) & 1];
          [v9 setObject:v13 forKey:@"APSProtocolReportLastReversePushRTT"];
          unsigned int v14 = +[NSNumber numberWithBool:(a6 >> 2) & 1];
          [v9 setObject:v14 forKey:@"APSProtocolFilterOptimizationSupport"];

          CFStringRef v11 = @"APSProtocolCapabilities";
          break;
        case 7uLL:
          id v10 = +[NSNumber numberWithUnsignedLongLong:a6];
          CFStringRef v11 = @"APSProtocolServerTimeForBadNonce";
          goto LABEL_95;
        case 8uLL:
          if (a6 != (__int16)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedInteger:(unsigned __int16)a6];
          CFStringRef v11 = @"APSProtocolLargeMessageSize";
          break;
        case 0xAuLL:
          id v10 = +[NSNumber numberWithUnsignedLongLong:a6];
          CFStringRef v11 = @"APSProtocolServerTime";
          goto LABEL_95;
        case 0x10uLL:
          if (a6 != (__int16)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedLongLong:a6];
          CFStringRef v11 = @"APSProtocolMinKeepAliveInterval";
          break;
        case 0x11uLL:
          if (a6 != (__int16)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedLongLong:a6];
          CFStringRef v11 = @"APSProtocolExpectedKeepAliveInterval";
          break;
        case 0x12uLL:
          if (a6 != (__int16)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedLongLong:a6];
          CFStringRef v11 = @"APSProtocolMaxKeepAliveInterval";
          break;
        case 0x14uLL:
          if (a6 != (__int16)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)a6];
          CFStringRef v11 = @"APSProtocolExperimentIDKey";
          break;
        default:
          goto LABEL_97;
      }
      goto LABEL_95;
    case 9uLL:
      if (a5 == 3)
      {
        if (a6 != (char)a6) {
          goto LABEL_97;
        }
        id v10 = +[NSNumber numberWithUnsignedInteger:a6];
        CFStringRef v11 = @"APSProtocolFilterResponseStatusKey";
      }
      else
      {
        if (a5 != 2) {
          goto LABEL_97;
        }
        id v10 = +[NSNumber numberWithUnsignedLongLong:a6];
        CFStringRef v11 = @"APSProtocolFilterResponseVersionKey";
      }
      goto LABEL_95;
    case 0xAuLL:
      switch(a5)
      {
        case 4uLL:
          if (a6 != (int)a6) {
            goto LABEL_97;
          }
          int v15 = a6;
          id v10 = +[NSData dataWithBytes:&v15 length:4];
          CFStringRef v11 = @"APSProtocolMessageID";
          goto LABEL_95;
        case 5uLL:
          if (HIDWORD(a6)) {
            goto LABEL_97;
          }
          id v10 = +[NSDate dateWithTimeIntervalSince1970:(double)(unint64_t)a6];
          CFStringRef v11 = @"APSProtocolMessageExpiry";
          goto LABEL_95;
        case 6uLL:
          id v10 = +[NSNumber numberWithUnsignedLongLong:a6];
          CFStringRef v11 = @"APSProtocolMessageTimestamp";
          goto LABEL_95;
        case 7uLL:
        case 8uLL:
        case 0xAuLL:
        case 0xBuLL:
        case 0xCuLL:
          goto LABEL_97;
        case 9uLL:
          if (a6 != (char)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedInteger:a6];
          CFStringRef v11 = @"APSProtocolMessageStorageFlags";
          goto LABEL_95;
        case 0xDuLL:
          if (a6 != (char)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedInteger:a6];
          CFStringRef v11 = @"APSProtocolMessagePriority";
          goto LABEL_95;
        default:
          if (a5 != 26)
          {
            if (a5 == 28 && a6 == (__int16)a6)
            {
              id v10 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)a6];
              CFStringRef v11 = @"APSProtocolMessagePushType";
              goto LABEL_95;
            }
            goto LABEL_97;
          }
          if (a6 != (int)a6) {
            goto LABEL_97;
          }
          id v10 = +[NSNumber numberWithUnsignedLong:a6];
          CFStringRef v11 = @"APSProtocolMessageAPNFlags";
          break;
      }
      goto LABEL_95;
    case 0xBuLL:
      if (a5 == 6)
      {
        id v10 = +[NSNumber numberWithUnsignedLongLong:a6];
        CFStringRef v11 = @"APSProtocolAckTimestampKey";
        goto LABEL_95;
      }
      if (a5 == 8 && a6 == (char)a6)
      {
        id v10 = +[NSNumber numberWithUnsignedInteger:a6];
        CFStringRef v11 = @"APSProtocolDeliveryStatus";
        goto LABEL_95;
      }
      goto LABEL_97;
    case 0xDuLL:
      if (a5 != 2)
      {
        if (a5 == 1 && a6 == (char)a6)
        {
          id v10 = +[NSNumber numberWithUnsignedInteger:a6];
          CFStringRef v11 = @"APSProtocolKeepAliveResponse";
          goto LABEL_95;
        }
        goto LABEL_97;
      }
      if (a6 != (int)a6) {
        goto LABEL_97;
      }
      id v10 = +[NSNumber numberWithUnsignedInt:a6];
      CFStringRef v11 = @"APSProtocolKeepAliveDelayKeepAliveDurationKey";
      goto LABEL_95;
    case 0xFuLL:
      if (a5 != 1 || (unint64_t)(a6 + 0x8000) >> 16) {
        goto LABEL_97;
      }
      id v10 = +[NSNumber numberWithUnsignedInteger:(unsigned __int16)a6];
      CFStringRef v11 = @"APSProtocolFlushWantPadding";
      goto LABEL_95;
    case 0x12uLL:
      if (a5 != 4)
      {
        if (a5 == 1 && a6 == (char)a6)
        {
          id v10 = +[NSNumber numberWithInteger:a6];
          CFStringRef v11 = @"APSProtocolAppTokenGenerateResponse";
          goto LABEL_95;
        }
        goto LABEL_97;
      }
      if (a6 != (__int16)a6) {
        goto LABEL_97;
      }
      id v10 = +[NSNumber numberWithInteger:(unsigned __int16)a6];
      CFStringRef v11 = @"APSProtocolAppTokenGenerateResponseAppId";
      goto LABEL_95;
    case 0x18uLL:
    case 0x19uLL:
      if (a5 != 3)
      {
        if (a5 == 1 && a6 == (int)a6)
        {
          id v10 = +[NSNumber numberWithInteger:a6];
          CFStringRef v11 = @"APSProtocolTaskMessageId";
          goto LABEL_95;
        }
        goto LABEL_97;
      }
      if (a6 != (char)a6) {
        goto LABEL_97;
      }
      id v10 = +[NSNumber numberWithInteger:a6];
      CFStringRef v11 = @"APSProtocolTaskStatus";
      goto LABEL_95;
    case 0x1DuLL:
      switch(a5)
      {
        case 5uLL:
          break;
        case 4uLL:
          if (a6 == (char)a6)
          {
            id v10 = +[NSNumber numberWithInteger:a6];
            CFStringRef v11 = @"APSProtocolPubSubStatus";
            goto LABEL_95;
          }
          break;
        case 1uLL:
          if (a6 == (int)a6)
          {
            id v10 = +[NSNumber numberWithInteger:a6];
            CFStringRef v11 = @"APSProtocolPubSubMessageID";
            goto LABEL_95;
          }
          break;
        default:
          goto LABEL_97;
      }
      if (HIDWORD(a6)) {
        goto LABEL_97;
      }
      id v10 = +[NSNumber numberWithInteger:(int)a6];
      CFStringRef v11 = @"APSProtocolPubSubTimeout";
      goto LABEL_95;
    case 0x1EuLL:
      if (a5 == 4) {
        goto LABEL_50;
      }
      if (a5 != 1) {
        goto LABEL_97;
      }
      if (a6 == (int)a6)
      {
        id v10 = +[NSNumber numberWithInteger:a6];
        CFStringRef v11 = @"APSPtotocolPubsubUpdateMessageID";
      }
      else
      {
LABEL_50:
        id v10 = +[NSNumber numberWithUnsignedLongLong:a6];
        CFStringRef v11 = @"APSProtocolPubSubUpdateTimestamp";
      }
      goto LABEL_95;
    case 0x20uLL:
      if (a5 != 3)
      {
        if (a5 == 1 && a6 == (int)a6)
        {
          id v10 = +[NSNumber numberWithInteger:a6];
          CFStringRef v11 = @"APSProtocolPresenceActivityMessageIDKey";
          goto LABEL_95;
        }
        goto LABEL_97;
      }
      if (a6 != (char)a6) {
        goto LABEL_97;
      }
      id v10 = +[NSNumber numberWithInteger:a6];
      CFStringRef v11 = @"APSProtocolPresenceActivityStatusKey";
      goto LABEL_95;
    case 0x21uLL:
      if (a5 == 3)
      {
        if (a6 != (char)a6) {
          goto LABEL_97;
        }
        id v10 = +[NSNumber numberWithUnsignedInteger:a6];
        CFStringRef v11 = @"APSProtocolFilterUpdateStatusKey";
      }
      else
      {
        if (a5 != 2) {
          goto LABEL_97;
        }
        id v10 = +[NSNumber numberWithUnsignedLongLong:a6];
        CFStringRef v11 = @"APSProtocolFilterUpdateVersionKey";
      }
LABEL_95:
      if (v10)
      {
        [v9 setObject:v10 forKey:v11];
      }
LABEL_97:

      return;
    default:
      goto LABEL_97;
  }
}

- (void)setSerialItemInParameters:(id)a3 commandID:(unint64_t)a4 itemID:(unint64_t)a5 itemData:(id)a6
{
  id v17 = a3;
  id v9 = a6;
  id v10 = v9;
  switch(a4)
  {
    case 7uLL:
      if (a5 == 1)
      {
LABEL_3:
        id v11 = v9;
        CFStringRef v12 = @"APSProtocolToken";
        goto LABEL_102;
      }
      goto LABEL_104;
    case 8uLL:
      switch(a5)
      {
        case 1uLL:
          if ([v9 length] != (id)1) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolConnectedResponse";
          break;
        case 2uLL:
          goto LABEL_35;
        case 3uLL:
          goto LABEL_3;
        case 4uLL:
          if ([v9 length] != (id)2) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", bswap32(*(unsigned __int16 *)[v10 bytes]) >> 16);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolMessageSize";
          break;
        case 6uLL:
          if ([v9 length] != (id)4) {
            goto LABEL_104;
          }
          uint64_t v13 = bswap32(*(_DWORD *)[v10 bytes]);
          id v11 = +[NSNumber numberWithUnsignedLong:v13];
          unsigned int v14 = +[NSNumber numberWithBool:v13 & 1];
          [v17 setObject:v14 forKey:@"APSProtocolDualChannelSupport"];
          int v15 = +[NSNumber numberWithBool:(v13 >> 1) & 1];
          [v17 setObject:v15 forKey:@"APSProtocolReportLastReversePushRTT"];
          id v16 = +[NSNumber numberWithBool:(v13 >> 2) & 1];
          [v17 setObject:v16 forKey:@"APSProtocolFilterOptimizationSupport"];

          CFStringRef v12 = @"APSProtocolCapabilities";
          break;
        case 7uLL:
          if ([v9 length] != (id)8) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v10 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolServerTimeForBadNonce";
          break;
        case 8uLL:
          if ([v9 length] != (id)2) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", bswap32(*(unsigned __int16 *)[v10 bytes]) >> 16);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolLargeMessageSize";
          break;
        case 9uLL:
          goto LABEL_48;
        case 0xAuLL:
          if ([v9 length] != (id)8) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v10 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolServerTime";
          break;
        case 0xBuLL:
          id v11 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
          CFStringRef v12 = @"APSProtocolGeoRegion";
          goto LABEL_102;
        case 0x13uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolClientIPAddress";
          goto LABEL_102;
        default:
          goto LABEL_104;
      }
      goto LABEL_102;
    case 9uLL:
      switch(a5)
      {
        case 3uLL:
          if ([v9 length] != (id)1) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolFilterResponseStatusKey";
          break;
        case 2uLL:
          if ([v9 length] != (id)8) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v10 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolFilterResponseVersionKey";
          break;
        case 1uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolFilterResponseTokenKey";
          break;
        default:
          goto LABEL_104;
      }
      goto LABEL_102;
    case 0xAuLL:
      switch(a5)
      {
        case 1uLL:
          goto LABEL_3;
        case 2uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolTopicHash";
          goto LABEL_102;
        case 3uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolPayload";
          goto LABEL_102;
        case 4uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolMessageID";
          goto LABEL_102;
        case 5uLL:
          if ([v9 length] != (id)4) {
            goto LABEL_104;
          }
          +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)bswap32(*(_DWORD *)[v10 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolMessageExpiry";
          break;
        case 6uLL:
          if ([v9 length] != (id)8) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v10 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolMessageTimestamp";
          break;
        case 9uLL:
          if ([v9 length] != (id)1) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolMessageStorageFlags";
          break;
        case 0xDuLL:
          if ([v9 length] != (id)1) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolMessagePriority";
          break;
        case 0xFuLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolBaseToken";
          goto LABEL_102;
        case 0x15uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolMessageTracingUUID";
          goto LABEL_102;
        case 0x18uLL:
          id v11 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
          CFStringRef v12 = @"APSProtocolMessageCorrelationIdentifier";
          goto LABEL_102;
        case 0x1AuLL:
          if ([v9 length] != (id)4) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (int)bswap32(*(_DWORD *)[v10 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolMessageAPNFlags";
          break;
        case 0x1CuLL:
          if ([v9 length] != (id)2) {
            goto LABEL_104;
          }
          +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)[v10 bytes]) >> 16);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolMessagePushType";
          break;
        case 0x1DuLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolMessagePubSubInfo";
          goto LABEL_102;
        default:
          goto LABEL_104;
      }
      goto LABEL_102;
    case 0xBuLL:
      if (a5 != 6)
      {
        if (a5 == 8 && [v9 length] == (id)1)
        {
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolDeliveryStatus";
          goto LABEL_102;
        }
        goto LABEL_104;
      }
      if ([v9 length] != (id)8) {
        goto LABEL_104;
      }
      +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v10 bytes]));
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      CFStringRef v12 = @"APSProtocolAckTimestampKey";
      goto LABEL_102;
    case 0xDuLL:
      if (a5 != 1 || [v9 length] != (id)1) {
        goto LABEL_104;
      }
      +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      CFStringRef v12 = @"APSProtocolKeepAliveResponse";
      goto LABEL_102;
    case 0xEuLL:
      if (a5 != 1 || ![v9 length]) {
        goto LABEL_104;
      }
      id v11 = v10;
      CFStringRef v12 = @"APSProtocolDestination";
      goto LABEL_102;
    case 0xFuLL:
      if (a5 != 1 || [v9 length] != (id)2) {
        goto LABEL_104;
      }
      +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", bswap32(*(unsigned __int16 *)[v10 bytes]) >> 16);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      CFStringRef v12 = @"APSProtocolFlushWantPadding";
      goto LABEL_102;
    case 0x12uLL:
      switch(a5)
      {
        case 1uLL:
          if ([v9 length] != (id)1) {
            goto LABEL_104;
          }
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(unsigned __int8 *)[v10 bytes]);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolAppTokenGenerateResponse";
          break;
        case 2uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolAppTokenGenerateResponseToken";
          goto LABEL_102;
        case 3uLL:
          if ([v9 length] != (id)20 && objc_msgSend(v10, "length") != (id)32) {
            goto LABEL_104;
          }
          id v11 = v10;
          CFStringRef v12 = @"APSProtocolAppTokenGenerateResponseTopicHash";
          break;
        case 4uLL:
          if ([v9 length] != (id)2) {
            goto LABEL_104;
          }
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", bswap32(*(unsigned __int16 *)[v10 bytes]) >> 16);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolAppTokenGenerateResponseAppId";
          break;
        default:
          goto LABEL_104;
      }
      goto LABEL_102;
    case 0x17uLL:
      if (a5 == 9)
      {
LABEL_48:
        id v11 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
        CFStringRef v12 = @"APSProtocolRedirectReason";
      }
      else
      {
        if (a5 != 2) {
          goto LABEL_104;
        }
LABEL_35:
        id v11 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
        CFStringRef v12 = @"APSProtocolServerMetadata";
      }
      goto LABEL_102;
    case 0x18uLL:
      if (a5 != 2) {
        goto LABEL_104;
      }
      id v11 = v9;
      CFStringRef v12 = @"APSProtocolTaskControlPayload";
      goto LABEL_102;
    case 0x19uLL:
      if (a5 != 2) {
        goto LABEL_104;
      }
      id v11 = v9;
      CFStringRef v12 = @"APSProtocolTaskNotificationPayload";
      goto LABEL_102;
    case 0x1DuLL:
      switch(a5)
      {
        case 1uLL:
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", bswap32(*(_DWORD *)[v9 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolPubSubMessageID";
          goto LABEL_102;
        case 2uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolPubSubPayload";
          goto LABEL_102;
        case 3uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolPubSubToken";
          goto LABEL_102;
        case 4uLL:
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(unsigned __int8 *)[v9 bytes]);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolPubSubStatus";
          goto LABEL_102;
        case 5uLL:
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", bswap32(*(_DWORD *)[v9 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolPubSubTimeout";
          goto LABEL_102;
        default:
          goto LABEL_104;
      }
      goto LABEL_104;
    case 0x1EuLL:
      switch(a5)
      {
        case 1uLL:
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", bswap32(*(_DWORD *)[v9 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSPtotocolPubsubUpdateMessageID";
          goto LABEL_102;
        case 2uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolPubSubUpdatePayload";
          goto LABEL_102;
        case 3uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolPubSubUpdateToken";
          goto LABEL_102;
        case 4uLL:
          +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v9 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolPubSubUpdateTimestamp";
          goto LABEL_102;
        default:
          goto LABEL_104;
      }
      goto LABEL_104;
    case 0x20uLL:
      switch(a5)
      {
        case 1uLL:
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", bswap32(*(_DWORD *)[v9 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolPresenceActivityMessageIDKey";
          break;
        case 3uLL:
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(unsigned __int8 *)[v9 bytes]);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolPresenceActivityStatusKey";
          break;
        case 2uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolPresenceActivityPushTokenKey";
          break;
        default:
          goto LABEL_104;
      }
      goto LABEL_102;
    case 0x21uLL:
      switch(a5)
      {
        case 1uLL:
          id v11 = v9;
          CFStringRef v12 = @"APSProtocolFilterUpdateTokenKey";
          break;
        case 3uLL:
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(unsigned __int8 *)[v9 bytes]);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolFilterUpdateStatusKey";
          break;
        case 2uLL:
          +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v9 bytes]));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v12 = @"APSProtocolFilterUpdateVersionKey";
          break;
        default:
          goto LABEL_104;
      }
LABEL_102:
      if (v11)
      {
        [v17 setObject:v11 forKey:v12];
      }
LABEL_104:

      return;
    default:
      goto LABEL_104;
  }
}

- (void)setIsPackedFormat:(BOOL)a3
{
  self->_isPackedFormat = a3;
}

- (APNSPackEncoder)encoderWrapper
{
  return self->_encoderWrapper;
}

- (void)setEncoderWrapper:(id)a3
{
}

- (APNSPackDecoder)decoderWrapper
{
  return self->_decoderWrapper;
}

- (void)setDecoderWrapper:(id)a3
{
}

- (APSProtocolParserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_decoderWrapper, 0);
  objc_storeStrong((id *)&self->_encoderWrapper, 0);
}

@end