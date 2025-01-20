@interface HMDMediaStreamConfig
- (unsigned)deviceLocalSSRC;
- (void)addToDescription:(id)a3;
- (void)setDeviceLocalSSRC:(unsigned int)a3;
@end

@implementation HMDMediaStreamConfig

- (void)setDeviceLocalSSRC:(unsigned int)a3
{
  self->_deviceLocalSSRC = a3;
}

- (unsigned)deviceLocalSSRC
{
  return self->_deviceLocalSSRC;
}

- (void)addToDescription:(id)a3
{
  id v4 = a3;
  [v4 appendFormat:@"\n"];
  objc_msgSend(v4, "appendFormat:", @"direction             = %tu\n", -[AVCMediaStreamConfig direction](self, "direction"));
  v5 = [(AVCMediaStreamConfig *)self localAddress];
  v6 = [v5 ip];
  [v4 appendFormat:@"localAddress.ip       = %@\n", v6];

  v7 = [(AVCMediaStreamConfig *)self localAddress];
  objc_msgSend(v4, "appendFormat:", @"localAddress.port     = %hu\n", objc_msgSend(v7, "port"));

  v8 = [(AVCMediaStreamConfig *)self remoteAddress];
  v9 = [v8 ip];
  [v4 appendFormat:@"remoteAddress.ip      = %@\n", v9];

  v10 = [(AVCMediaStreamConfig *)self remoteAddress];
  [v10 isIPv6];
  v11 = HMFBooleanToString();
  [v4 appendFormat:@"remoteAddress.ipv6    = %@\n", v11];

  v12 = [(AVCMediaStreamConfig *)self remoteAddress];
  objc_msgSend(v4, "appendFormat:", @"remoteAddress.port    = %hu\n", objc_msgSend(v12, "port"));

  objc_msgSend(v4, "appendFormat:", @"txPayloadType         = %tu\n", -[AVCMediaStreamConfig txPayloadType](self, "txPayloadType"));
  objc_msgSend(v4, "appendFormat:", @"rxPayloadType         = %tu\n", -[AVCMediaStreamConfig rxPayloadType](self, "rxPayloadType"));
  int64_t v13 = [(AVCMediaStreamConfig *)self SRTPCipherSuite];
  unint64_t v14 = [(AVCMediaStreamConfig *)self SRTPCipherSuite];
  if (v14 > 5) {
    v15 = @"Unknown AVC Video resolution";
  }
  else {
    v15 = off_1E6A0D928[v14];
  }
  v16 = v15;
  [v4 appendFormat:@"SRTPCipherSuite       = %tu, %@\n", v13, v16];

  int64_t v17 = [(AVCMediaStreamConfig *)self SRTCPCipherSuite];
  unint64_t v18 = [(AVCMediaStreamConfig *)self SRTCPCipherSuite];
  if (v18 > 5) {
    v19 = @"Unknown AVC Video resolution";
  }
  else {
    v19 = off_1E6A0D928[v18];
  }
  v20 = v19;
  [v4 appendFormat:@"SRTCPCipherSuite      = %tu, %@\n", v17, v20];

  v21 = [(AVCMediaStreamConfig *)self sendMasterKey];
  [v4 appendFormat:@"sendMasterKey         = %@\n", v21];

  v22 = [(AVCMediaStreamConfig *)self receiveMasterKey];
  [v4 appendFormat:@"receiveMasterKey      = %@\n", v22];

  [(AVCMediaStreamConfig *)self isRTCPEnabled];
  v23 = HMFEnabledStatusToString();
  [v4 appendFormat:@"rtcpEnabled           = %@\n", v23];

  [(AVCMediaStreamConfig *)self rtcpSendInterval];
  objc_msgSend(v4, "appendFormat:", @"rtcpSendInterval      = %lf\n", v24);
  [(AVCMediaStreamConfig *)self isRTCPTimeOutEnabled];
  v25 = HMFEnabledStatusToString();
  [v4 appendFormat:@"rtcpTimeOutEnabled    = %@\n", v25];

  [(AVCMediaStreamConfig *)self rtcpTimeOutInterval];
  objc_msgSend(v4, "appendFormat:", @"rtcpTimeOutInterval   = %lf\n", v26);
  [(AVCMediaStreamConfig *)self isRTPTimeOutEnabled];
  v27 = HMFEnabledStatusToString();
  [v4 appendFormat:@"rtpTimeOutEnabled     = %@\n", v27];

  [(AVCMediaStreamConfig *)self rtpTimeOutInterval];
  objc_msgSend(v4, "appendFormat:", @"rtpTimeOutInterval    = %lf\n", v28);
  objc_msgSend(v4, "appendFormat:", @"rtcpRemotePort        = %hu\n", -[AVCMediaStreamConfig rtcpRemotePort](self, "rtcpRemotePort"));
  objc_msgSend(v4, "appendFormat:", @"remoteSSRC            = %lu\n", -[AVCMediaStreamConfig remoteSSRC](self, "remoteSSRC"));
  objc_msgSend(v4, "appendFormat:", @"deviceLocalSSRC       = %u\n", -[HMDMediaStreamConfig deviceLocalSSRC](self, "deviceLocalSSRC"));
  [(AVCMediaStreamConfig *)self isRateAdaptationEnabled];
  HMFEnabledStatusToString();
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  [v4 appendFormat:@"rateAdaptationEnabled = %@\n", v29];
}

@end