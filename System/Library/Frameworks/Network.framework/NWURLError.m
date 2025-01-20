@interface NWURLError
+ (NSDictionary)allUserInfoKeys;
- (NSData)downloadTaskResumeData;
- (NSError)underlyingError;
- (NSNumber)blockedTrackerFailure;
- (NSNumber)networkUnavailableReason;
- (NSNumber)privacyProxyFailure;
- (NSNumber)vpnInactiveFailure;
- (NSNumber)webSocketHandshakeFailureReason;
- (NSURL)failingURL;
- (NWURLError)initWithCoder:(id)a3;
- (OS_nw_path)path;
- (OS_nw_resolution_report)resolutionReport;
- (__SecTrust)peerTrust;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescription;
- (id)localizedFailureReason;
- (id)localizedRecoverySuggestion;
- (id)userInfo;
- (int64_t)translateCodeForError:(__CFError *)a3;
- (int64_t)translateDNSError:(int64_t)a3;
- (int64_t)translatePOSIXError:(int64_t)a3;
- (int64_t)translateTLSError:(int64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fillErrorForLoader:(id)a3 andTask:(id)a4;
- (void)initWithNWError:(void *)a3 forLoader:(void *)a4 andTask:;
- (void)setBlockedTrackerFailure:(id)a3;
- (void)setDownloadTaskResumeData:(id)a3;
- (void)setFailingURL:(id)a3;
- (void)setNetworkUnavailableReason:(id)a3;
- (void)setPath:(id)a3;
- (void)setPeerTrust:(__SecTrust *)a3;
- (void)setPrivacyProxyFailure:(id)a3;
- (void)setResolutionReport:(id)a3;
- (void)setUnderlyingError:(id)a3;
- (void)setVpnInactiveFailure:(id)a3;
- (void)setWebSocketHandshakeFailureReason:(id)a3;
@end

@implementation NWURLError

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadTaskResumeData, 0);
  objc_storeStrong((id *)&self->_resolutionReport, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_blockedTrackerFailure, 0);
  objc_storeStrong((id *)&self->_vpnInactiveFailure, 0);
  objc_storeStrong((id *)&self->_privacyProxyFailure, 0);
  objc_storeStrong((id *)&self->_webSocketHandshakeFailureReason, 0);
  objc_storeStrong((id *)&self->_networkUnavailableReason, 0);
  objc_storeStrong((id *)&self->_failingURL, 0);

  objc_storeStrong((id *)&self->_underlyingError, 0);
}

- (void)setDownloadTaskResumeData:(id)a3
{
}

- (NSData)downloadTaskResumeData
{
  return self->_downloadTaskResumeData;
}

- (void)setResolutionReport:(id)a3
{
}

- (OS_nw_resolution_report)resolutionReport
{
  return self->_resolutionReport;
}

- (void)setPath:(id)a3
{
}

- (OS_nw_path)path
{
  return self->_path;
}

- (void)setBlockedTrackerFailure:(id)a3
{
}

- (NSNumber)blockedTrackerFailure
{
  return self->_blockedTrackerFailure;
}

- (void)setVpnInactiveFailure:(id)a3
{
}

- (NSNumber)vpnInactiveFailure
{
  return self->_vpnInactiveFailure;
}

- (void)setPrivacyProxyFailure:(id)a3
{
}

- (NSNumber)privacyProxyFailure
{
  return self->_privacyProxyFailure;
}

- (void)setWebSocketHandshakeFailureReason:(id)a3
{
}

- (NSNumber)webSocketHandshakeFailureReason
{
  return self->_webSocketHandshakeFailureReason;
}

- (void)setNetworkUnavailableReason:(id)a3
{
}

- (NSNumber)networkUnavailableReason
{
  return self->_networkUnavailableReason;
}

- (__SecTrust)peerTrust
{
  return self->_peerTrust;
}

- (void)setFailingURL:(id)a3
{
}

- (NSURL)failingURL
{
  return self->_failingURL;
}

- (void)setUnderlyingError:(id)a3
{
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (int64_t)translatePOSIXError:(int64_t)a3
{
  int64_t result = -1;
  switch(a3)
  {
    case 13:
    case 49:
    case 51:
    case 59:
    case 61:
    case 64:
    case 65:
      int64_t result = -1004;
      break;
    case 22:
      int64_t result = -1000;
      break;
    case 32:
    case 35:
    case 40:
    case 52:
    case 53:
    case 54:
    case 57:
    case 60:
    case 96:
    case 100:
      int64_t result = -1005;
      break;
    case 39:
      int64_t result = -1010;
      break;
    case 41:
    case 42:
      int64_t result = -1011;
      break;
    case 43:
      int64_t result = -1002;
      break;
    case 46:
      int64_t result = -1008;
      break;
    case 50:
      int64_t result = -1009;
      break;
    case 79:
      int64_t result = -1016;
      break;
    case 80:
      int64_t result = -1013;
      break;
    case 89:
      int64_t result = -999;
      break;
    case 91:
      int64_t result = -1014;
      break;
    case 92:
      int64_t result = -1015;
      break;
    case 94:
      int64_t result = -1017;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)translateTLSError:(int64_t)a3
{
  if ((unint64_t)(a3 + 9853) > 0x2E) {
    return -1200;
  }
  else {
    return *((void *)&unk_183E232A0 + a3 + 9853);
  }
}

- (int64_t)translateDNSError:(int64_t)a3
{
  int64_t v3 = -1006;
  if (a3 == -65568) {
    int64_t v3 = -1001;
  }
  if (a3 == -65554) {
    int64_t v3 = -1003;
  }
  if (a3 == -65538) {
    return -1003;
  }
  else {
    return v3;
  }
}

- (int64_t)translateCodeForError:(__CFError *)a3
{
  CFIndex Code = CFErrorGetCode(a3);
  CFErrorDomain Domain = CFErrorGetDomain(a3);
  if (CFEqual(Domain, @"kNWErrorDomainDNS") && Code >= -65792 && Code <= -65537)
  {
    return [(NWURLError *)self translateDNSError:Code];
  }
  else
  {
    CFErrorDomain v8 = CFErrorGetDomain(a3);
    if (CFEqual(v8, @"NSOSStatusErrorDomain") && Code >= -9899 && Code <= -9800)
    {
      return [(NWURLError *)self translateTLSError:Code];
    }
    else
    {
      CFErrorDomain v9 = CFErrorGetDomain(a3);
      if (CFEqual(v9, @"NSPOSIXErrorDomain"))
      {
        return [(NWURLError *)self translatePOSIXError:Code];
      }
      else
      {
        return -1;
      }
    }
  }
}

- (void)fillErrorForLoader:(id)a3 andTask:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v7 = [v16 underlyingConnection];
      if (v7)
      {
        CFErrorDomain v8 = v7;
        nw_path_t v9 = nw_connection_copy_current_path(v7);
        if (v9)
        {
          [(NWURLError *)self setPath:v9];
          v10 = v9;
          int isa_high = HIDWORD(v10[47].isa);

          switch(isa_high)
          {
            case 5:
              v12 = &unk_1ECF96D68;
              goto LABEL_10;
            case 26:
              v12 = &unk_1ECF96D80;
              goto LABEL_10;
            case 27:
              v12 = &unk_1ECF96D50;
LABEL_10:
              [(NWURLError *)self setNetworkUnavailableReason:v12];
              break;
            case 30:
              [(NWURLError *)self setVpnInactiveFailure:MEMORY[0x1E4F1CC38]];
              break;
            default:
              break;
          }
        }
        if (nw_connection_get_privacy_stance(v8) == 3) {
          [(NWURLError *)self setPrivacyProxyFailure:MEMORY[0x1E4F1CC38]];
        }
        if (nw_connection_failed_due_to_blocked_tracker(v8)) {
          [(NWURLError *)self setBlockedTrackerFailure:MEMORY[0x1E4F1CC38]];
        }
        id v13 = nw_connection_copy_failed_resolution_report(v8);
        [(NWURLError *)self setResolutionReport:v13];
      }
    }
  }
  if (v6)
  {
    v14 = [v6 currentRequest];
    v15 = [v14 URL];
    [(NWURLError *)self setFailingURL:v15];

    -[NWURLError setPeerTrust:](self, "setPeerTrust:", [v6 secTrust]);
  }
}

- (void)setPeerTrust:(__SecTrust *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  peerTrust = self->_peerTrust;
  if (peerTrust) {
    CFRelease(peerTrust);
  }
  self->_peerTrust = a3;
}

- (id)localizedRecoverySuggestion
{
  uint64_t v2 = [(NWURLError *)self code];

  return (id)MEMORY[0x1F40D56E8](v2);
}

- (id)localizedFailureReason
{
  uint64_t v2 = [(NWURLError *)self code];

  return (id)MEMORY[0x1F40D56E0](v2);
}

- (id)localizedDescription
{
  [(NWURLError *)self code];
  int64_t v3 = [(NWURLError *)self failingURL];
  v4 = [v3 host];
  v5 = (void *)_CFNetworkErrorCopyLocalizedDescriptionWithHostname();

  return v5;
}

- (void)dealloc
{
  [(NWURLError *)self setPeerTrust:0];
  v3.receiver = self;
  v3.super_class = (Class)NWURLError;
  [(NWURLError *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NWURLError allocWithZone:a3];
  uint64_t v5 = [(NWURLError *)self code];
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x1E4F289A0];
    v18.receiver = v4;
    v18.super_class = (Class)NWURLError;
    v4 = [(NWURLError *)&v18 initWithDomain:v6 code:v5 userInfo:0];
  }
  v7 = [(NWURLError *)self underlyingError];
  [(NWURLError *)v4 setUnderlyingError:v7];

  CFErrorDomain v8 = [(NWURLError *)self failingURL];
  [(NWURLError *)v4 setFailingURL:v8];

  [(NWURLError *)v4 setPeerTrust:[(NWURLError *)self peerTrust]];
  nw_path_t v9 = [(NWURLError *)self networkUnavailableReason];
  [(NWURLError *)v4 setNetworkUnavailableReason:v9];

  v10 = [(NWURLError *)self webSocketHandshakeFailureReason];
  [(NWURLError *)v4 setWebSocketHandshakeFailureReason:v10];

  v11 = [(NWURLError *)self privacyProxyFailure];
  [(NWURLError *)v4 setPrivacyProxyFailure:v11];

  v12 = [(NWURLError *)self path];
  [(NWURLError *)v4 setPath:v12];

  id v13 = [(NWURLError *)self vpnInactiveFailure];
  [(NWURLError *)v4 setVpnInactiveFailure:v13];

  v14 = [(NWURLError *)self blockedTrackerFailure];
  [(NWURLError *)v4 setBlockedTrackerFailure:v14];

  v15 = [(NWURLError *)self resolutionReport];
  [(NWURLError *)v4 setResolutionReport:v15];

  id v16 = [(NWURLError *)self downloadTaskResumeData];
  [(NWURLError *)v4 setDownloadTaskResumeData:v16];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NWURLError code](self, "code"), @"NSCode");
  uint64_t v5 = [(NWURLError *)self underlyingError];
  [v4 encodeObject:v5 forKey:@"underlyingError"];

  uint64_t v6 = [(NWURLError *)self failingURL];
  [v4 encodeObject:v6 forKey:@"failingURL"];

  v7 = [(NWURLError *)self networkUnavailableReason];
  [v4 encodeObject:v7 forKey:@"networkUnavailableReason"];

  CFErrorDomain v8 = [(NWURLError *)self webSocketHandshakeFailureReason];
  [v4 encodeObject:v8 forKey:@"webSocketHandshakeFailureReason"];

  nw_path_t v9 = [(NWURLError *)self privacyProxyFailure];
  [v4 encodeObject:v9 forKey:@"privacyProxyFailure"];

  v10 = [(NWURLError *)self vpnInactiveFailure];
  [v4 encodeObject:v10 forKey:@"vpnInactiveFailure"];

  v11 = [(NWURLError *)self blockedTrackerFailure];
  [v4 encodeObject:v11 forKey:@"blockedTrackerFailure"];

  id v12 = [(NWURLError *)self downloadTaskResumeData];
  [v4 encodeObject:v12 forKey:@"downloadTaskResumeData"];
}

- (NWURLError)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"NSCode"];
  if (self)
  {
    uint64_t v6 = *MEMORY[0x1E4F289A0];
    v16.receiver = self;
    v16.super_class = (Class)NWURLError;
    self = [(NWURLError *)&v16 initWithDomain:v6 code:v5 userInfo:0];
    if (self)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingError"];
      [(NWURLError *)self setUnderlyingError:v7];

      CFErrorDomain v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"failingURL"];
      [(NWURLError *)self setFailingURL:v8];

      nw_path_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkUnavailableReason"];
      [(NWURLError *)self setNetworkUnavailableReason:v9];

      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webSocketHandshakeFailureReason"];
      [(NWURLError *)self setWebSocketHandshakeFailureReason:v10];

      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyProxyFailure"];
      [(NWURLError *)self setPrivacyProxyFailure:v11];

      id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vpnInactiveFailure"];
      [(NWURLError *)self setVpnInactiveFailure:v12];

      id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blockedTrackerFailure"];
      [(NWURLError *)self setBlockedTrackerFailure:v13];

      v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadTaskResumeData"];
      [(NWURLError *)self setDownloadTaskResumeData:v14];
    }
  }

  return self;
}

- (id)userInfo
{
  objc_super v3 = objc_alloc_init(NWURLErrorUserInfoDictionary);
  [(NWURLErrorUserInfoDictionary *)v3 setError:self];

  return v3;
}

+ (NSDictionary)allUserInfoKeys
{
  if (allUserInfoKeys_onceToken[0] != -1) {
    dispatch_once(allUserInfoKeys_onceToken, &__block_literal_global_78493);
  }
  uint64_t v2 = (void *)allUserInfoKeys_keys;

  return (NSDictionary *)v2;
}

void __29__NWURLError_allUserInfoKeys__block_invoke()
{
  v17[14] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F28568];
  v15 = NSStringFromSelector(sel_localizedDescription);
  v17[0] = v15;
  v16[1] = *MEMORY[0x1E4F28588];
  v14 = NSStringFromSelector(sel_localizedFailureReason);
  v17[1] = v14;
  v16[2] = *MEMORY[0x1E4F285A0];
  id v13 = NSStringFromSelector(sel_localizedRecoverySuggestion);
  v17[2] = v13;
  v16[3] = *MEMORY[0x1E4F28A50];
  id v12 = NSStringFromSelector(sel_underlyingError);
  v17[3] = v12;
  v16[4] = *MEMORY[0x1E4F289B0];
  v0 = NSStringFromSelector(sel_failingURL);
  v17[4] = v0;
  v16[5] = *MEMORY[0x1E4F289B8];
  v1 = NSStringFromSelector(sel_peerTrust);
  v17[5] = v1;
  v16[6] = *MEMORY[0x1E4F289D8];
  uint64_t v2 = NSStringFromSelector(sel_networkUnavailableReason);
  v17[6] = v2;
  v16[7] = *MEMORY[0x1E4F18E80];
  objc_super v3 = NSStringFromSelector(sel_webSocketHandshakeFailureReason);
  v17[7] = v3;
  v16[8] = *MEMORY[0x1E4F18E70];
  id v4 = NSStringFromSelector(sel_privacyProxyFailure);
  v17[8] = v4;
  v16[9] = *MEMORY[0x1E4F18E60];
  uint64_t v5 = NSStringFromSelector(sel_path);
  v17[9] = v5;
  v16[10] = *MEMORY[0x1E4F18E78];
  uint64_t v6 = NSStringFromSelector(sel_vpnInactiveFailure);
  v17[10] = v6;
  v16[11] = *MEMORY[0x1E4F18E58];
  v7 = NSStringFromSelector(sel_blockedTrackerFailure);
  v17[11] = v7;
  v16[12] = *MEMORY[0x1E4F18E68];
  CFErrorDomain v8 = NSStringFromSelector(sel_resolutionReport);
  v17[12] = v8;
  v16[13] = *MEMORY[0x1E4F18CE0];
  nw_path_t v9 = NSStringFromSelector(sel_downloadTaskResumeData);
  v17[13] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:14];
  v11 = (void *)allUserInfoKeys_keys;
  allUserInfoKeys_keys = v10;
}

- (void)initWithNWError:(void *)a3 forLoader:(void *)a4 andTask:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    nw_path_t v9 = a2;
    CFErrorRef v10 = nw_error_copy_cf_error(v9);
    if (v10)
    {
      CFErrorRef v11 = v10;
      uint64_t v12 = [a1 translateCodeForError:v10];
      uint64_t v13 = *MEMORY[0x1E4F289A0];
      v16.receiver = a1;
      v16.super_class = (Class)NWURLError;
      id v14 = objc_msgSendSuper2(&v16, sel_initWithDomain_code_userInfo_, v13, v12, 0);
      if (v14)
      {
        a1 = v14;
        [v14 setUnderlyingError:v11];

        [a1 fillErrorForLoader:v7 andTask:v8];
        goto LABEL_8;
      }
      CFRelease(v11);
    }
    else
    {
    }
    a1 = 0;
  }
LABEL_8:

  return a1;
}

@end