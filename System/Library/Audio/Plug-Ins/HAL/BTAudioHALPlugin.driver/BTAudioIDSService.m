@interface BTAudioIDSService
- (BOOL)compatibleAndConnected;
- (BOOL)compatibleAndNearby;
- (BOOL)deviceIsCompatible:(id)a3;
- (BOOL)isConnected;
- (BOOL)sendArbitrationMsg:(id)a3 forAddress:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)var0 :char_traits<char>;
- (BTAudioIDSService)init;
- (IDSService)mIdsService;
- (NSString)lastUsedIdentifierKey;
- (void)dealloc;
- (void)handleDidTakeOwnership:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (void)handleReconcileOwnershipRemoteOwns:()basic_string<char;
- (void)handleReconcileOwnershipRemoteReleased:()basic_string<char;
- (void)handleRequestOwnership:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (void)handleTakeOwnershipFailed:()basic_string<char;
- (void)handleUnsupportedArbitrationMsg:()basic_string<char;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setCompatibleAndConnected:(BOOL)a3;
- (void)setCompatibleAndNearby:(BOOL)a3;
- (void)setLastUsedIdentifierKey:(id)a3;
- (void)setMIdsService:(id)a3;
@end

@implementation BTAudioIDSService

- (BTAudioIDSService)init
{
  v6.receiver = self;
  v6.super_class = (Class)BTAudioIDSService;
  v2 = [(BTAudioIDSService *)&v6 init];
  if (v2)
  {
    global_queue = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1BB38;
    block[3] = &unk_8DC00;
    block[4] = v2;
    dispatch_async(global_queue, block);
  }
  return v2;
}

- (void)dealloc
{
  self->_lastUsedIdentifierKey = 0;
  self->_mIdsService = 0;
  v3.receiver = self;
  v3.super_class = (Class)BTAudioIDSService;
  [(BTAudioIDSService *)&v3 dealloc];
}

- (BOOL)isConnected
{
  BOOL v3 = [(BTAudioIDSService *)self compatibleAndNearby];
  if (v3)
  {
    LOBYTE(v3) = [(BTAudioIDSService *)self compatibleAndConnected];
  }
  return v3;
}

- (BOOL)deviceIsCompatible:(id)a3
{
  return (unint64_t)[a3 serviceMinCompatibilityVersion] > 2;
}

- (BOOL)sendArbitrationMsg:(id)a3 forAddress:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)var0 :char_traits<char>
{
  v5 = v4;
  double Current = CFAbsoluteTimeGetCurrent();
  memset(&v48, 0, sizeof(v48));
  sub_BAF4(&v48, "");
  if (v5 && [a3 isEqualToString:@"RequestOwnership"]) {
    std::string::assign(&v48, (const std::string::value_type *)[v5 UTF8String]);
  }
  v10 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (NSDictionary *)objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    unsigned int v12 = [(BTAudioIDSService *)self isConnected];
    BOOL compatibleAndConnected = self->compatibleAndConnected;
    BOOL compatibleAndNearby = self->compatibleAndNearby;
    v15 = &v48;
    if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v15 = (std::string *)v48.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136447234;
    v54 = v11;
    __int16 v55 = 1024;
    *(_DWORD *)v56 = v12;
    *(_WORD *)&v56[4] = 1024;
    *(_DWORD *)&v56[6] = compatibleAndConnected;
    __int16 v57 = 1024;
    BOOL v58 = compatibleAndNearby;
    __int16 v59 = 2080;
    v60 = v15;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "sendArbitrationMsg arbitrationKey: %{public}s, isConnected: %d, connected: %d, nearby: %d, responseId: %s", buf, 0x28u);
  }
  if (![a3 isEqualToString:@"RequestOwnership"]
    || [(BTAudioIDSService *)self isConnected])
  {
    if ([a3 isEqualToString:@"RequestOwnership"]
      && [(BTAudioIDSService *)self isConnected])
    {
      uint64_t v16 = qword_A2350;
      if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
      {
        sub_B9AC(__dst, var0->var0.var0.var0.var1.var0, var0->var0.var0.var0.var1.var1);
      }
      else
      {
        *(_OWORD *)__dst = *(_OWORD *)var0->var0.var0.var0.var0.var0;
        uint64_t v45 = *((void *)&var0->var0.var0.var0.var1 + 2);
      }
      int v19 = sub_41BC8(v16, (uint64_t)__dst);
      char v20 = v19;
      if (SHIBYTE(v45) < 0)
      {
        operator delete(__dst[0]);
        if (v20) {
          goto LABEL_25;
        }
      }
      else if (v19)
      {
LABEL_25:
        v21 = qword_A1A80;
        if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Remote device is idle, handling successful ownership immediately and sending ownership msg with max timeout", buf, 2u);
        }
        if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
        {
          sub_B9AC(v42, var0->var0.var0.var0.var1.var0, var0->var0.var0.var0.var1.var1);
        }
        else
        {
          *(_OWORD *)v42 = *(_OWORD *)var0->var0.var0.var0.var0.var0;
          uint64_t v43 = *((void *)&var0->var0.var0.var0.var1 + 2);
        }
        [(BTAudioIDSService *)self handleDidTakeOwnership:v42 withResponseIdentifier:0];
        if (SHIBYTE(v43) < 0) {
          operator delete(v42[0]);
        }
        int v22 = 2;
LABEL_31:
        if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
          var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
        }
        v50 = +[NSString stringWithUTF8String:var0];
        id v51 = a3;
        CFStringRef v49 = @"kOwnershipDeviceAddr";
        v52 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
        v23 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        v24 = +[NSSet setWithObject:IDSDefaultPairedDevice];
        id v41 = 0;
        id v25 = +[NSMutableDictionary dictionary];
        LODWORD(v26) = 8.0;
        v27 = +[NSNumber numberWithFloat:v26];
        [v25 setValue:v27 forKey:IDSSendMessageOptionTimeoutKey];
        [v25 setValue:&__kCFBooleanTrue forKey:IDSSendMessageOptionFireAndForgetKey];
        [v25 setValue:&__kCFBooleanTrue forKey:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
        v28 = [(BTAudioIDSService *)self lastUsedIdentifierKey];
        [v25 setValue:v28 forKey:IDSSendMessageOptionQueueOneIdentifierKey];
        if ([a3 isEqualToString:@"RequestOwnership"]) {
          [v25 setValue:&__kCFBooleanTrue forKey:IDSSendMessageOptionExpectsPeerResponseKey];
        }
        else {
          [v25 setValue:v5 forKey:IDSSendMessageOptionPeerResponseIdentifierKey];
        }
        uint64_t v40 = 0;
        unsigned int v18 = [(IDSService *)self->_mIdsService sendMessage:v23 toDestinations:v24 priority:300 options:v25 identifier:&v40 error:&v41];
        [(BTAudioIDSService *)self setLastUsedIdentifierKey:v40];
        uint64_t v29 = qword_A1A80;
        BOOL v30 = os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          if (!v30) {
            goto LABEL_42;
          }
          v31 = [(BTAudioIDSService *)self lastUsedIdentifierKey];
          *(_DWORD *)buf = 138543618;
          v54 = v23;
          __int16 v55 = 2114;
          *(void *)v56 = v31;
          v32 = "Successfully sent msg %{public}@ with identifier %{public}@";
          v33 = v29;
          uint32_t v34 = 22;
        }
        else
        {
          if (!v30) {
            goto LABEL_42;
          }
          v35 = (NSDictionary *)objc_msgSend(objc_msgSend(v41, "description"), "UTF8String");
          *(_DWORD *)buf = 136446210;
          v54 = v35;
          v32 = "Msg send failed with error %{public}s";
          v33 = v29;
          uint32_t v34 = 12;
        }
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
LABEL_42:
        if ([a3 isEqualToString:@"RequestOwnership"])
        {
          int v36 = 1;
        }
        else if ([a3 isEqualToString:@"DidTakeOwnership"])
        {
          int v36 = 2;
        }
        else if ([a3 isEqualToString:@"ReconcileOwnershipRemoteOwns"])
        {
          int v36 = 4;
        }
        else if ([a3 isEqualToString:@"ReconcileOwnershipRemoteReleased"])
        {
          int v36 = 5;
        }
        else
        {
          int v36 = 0;
        }
        uint64_t v37 = *(void *)(qword_A2350 + 328);
        if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
          sub_B9AC(&v39, v48.__r_.__value_.__l.__data_, v48.__r_.__value_.__l.__size_);
        }
        else {
          std::string v39 = v48;
        }
        sub_1E470(v37, 2, 0, v36, (int)Current, (uint64_t *)&v39, v22);
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v39.__r_.__value_.__l.__data_);
        }
        goto LABEL_56;
      }
    }
    int v22 = 3;
    goto LABEL_31;
  }
  v17 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "We're not connected to a nearby device, returning success immediately", buf, 2u);
  }
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
  {
    sub_B9AC(__p, var0->var0.var0.var0.var1.var0, var0->var0.var0.var0.var1.var1);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)var0->var0.var0.var0.var0.var0;
    uint64_t v47 = *((void *)&var0->var0.var0.var0.var1 + 2);
  }
  [(BTAudioIDSService *)self handleDidTakeOwnership:__p withResponseIdentifier:0];
  if (SHIBYTE(v47) < 0) {
    operator delete(__p[0]);
  }
  LOBYTE(v18) = 1;
LABEL_56:
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
  return v18;
}

- (void)handleRequestOwnership:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  v4 = v3;
  objc_super v6 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a3;
    if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0) {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136446210;
    unsigned int v12 = var0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Got ownership request for device %{public}s, relinquishing from this side", buf, 0xCu);
  }
  sub_5CAB4(13);
  v8 = (void *)qword_A2350;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    sub_B9AC(__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var0.var0.var0.var0.var0;
    uint64_t v10 = *((void *)&a3->var0.var0.var0.var1 + 2);
  }
  sub_41F58(v8, (uint64_t)__p, 0, 1, v4);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleDidTakeOwnership:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  v4 = v3;
  objc_super v6 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Ownership request was successful, reporting property change", buf, 2u);
  }
  sub_5CAB4(14);
  v7 = (void *)qword_A2350;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    sub_B9AC(__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var0.var0.var0.var0.var0;
    uint64_t v9 = *((void *)&a3->var0.var0.var0.var1 + 2);
  }
  sub_41F58(v7, (uint64_t)__p, 1, 0, v4);
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleTakeOwnershipFailed:()basic_string<char
{
  v4 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Ownership request failed, reporting property change", buf, 2u);
  }
  uint64_t v5 = qword_A2350;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    sub_B9AC(__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var0.var0.var0.var0.var0;
    uint64_t v7 = *((void *)&a3->var0.var0.var0.var1 + 2);
  }
  sub_42648(v5, (uint64_t)__p);
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleReconcileOwnershipRemoteOwns:()basic_string<char
{
  v4 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a3;
    if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0) {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = var0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Reconciling ownership, remote side owns device %{public}s because it is streaming, releasing from this side", buf, 0xCu);
  }
  objc_super v6 = (void *)qword_A2350;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    sub_B9AC(__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var0.var0.var0.var0.var0;
    uint64_t v8 = *((void *)&a3->var0.var0.var0.var1 + 2);
  }
  sub_41F58(v6, (uint64_t)__p, 0, 0, 0);
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleReconcileOwnershipRemoteReleased:()basic_string<char
{
  v4 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a3;
    if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0) {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = var0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Reconciling ownership, remote side has released ownership of device %{public}s, locally take ownership.", buf, 0xCu);
  }
  objc_super v6 = (void *)qword_A2350;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    sub_B9AC(__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var0.var0.var0.var0.var0;
    uint64_t v8 = *((void *)&a3->var0.var0.var0.var1 + 2);
  }
  sub_41F58(v6, (uint64_t)__p, 1, 0, 0);
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleUnsupportedArbitrationMsg:()basic_string<char
{
  v4 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
    }
    int v5 = 136446210;
    objc_super v6 = var0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Device %{public}s does not support previously sent arbitration message", (uint8_t *)&v5, 0xCu);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  v11 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = objc_msgSend(objc_msgSend(a6, "description"), "UTF8String");
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Received IDS message %{public}s from %{public}s", buf, 0x16u);
  }
  id v12 = objc_msgSend(objc_msgSend(a5, "allKeys"), "objectAtIndex:", 0);
  if (v12)
  {
    id v13 = [a5 valueForKey:v12];
    if (v13)
    {
      memset(buf, 0, sizeof(buf));
      sub_BAF4(buf, (char *)objc_msgSend(objc_msgSend(v13, "valueForKey:", @"kOwnershipDeviceAddr"), "UTF8String"));
      if ([v12 isEqualToString:@"RequestOwnership"])
      {
        id v14 = [a7 outgoingResponseIdentifier];
        if ((char)buf[23] < 0)
        {
          sub_B9AC(&__dst, *(void **)buf, *(unint64_t *)&buf[8]);
        }
        else
        {
          long long __dst = *(_OWORD *)buf;
          uint64_t v31 = *(void *)&buf[16];
        }
        [(BTAudioIDSService *)self handleRequestOwnership:&__dst withResponseIdentifier:v14];
        if ((SHIBYTE(v31) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&__dst;
      }
      else if ([v12 isEqualToString:@"DidTakeOwnership"])
      {
        id v15 = [a7 incomingResponseIdentifier];
        if ((char)buf[23] < 0)
        {
          sub_B9AC(&v28, *(void **)buf, *(unint64_t *)&buf[8]);
        }
        else
        {
          long long v28 = *(_OWORD *)buf;
          uint64_t v29 = *(void *)&buf[16];
        }
        [(BTAudioIDSService *)self handleDidTakeOwnership:&v28 withResponseIdentifier:v15];
        if ((SHIBYTE(v29) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v28;
      }
      else if ([v12 isEqualToString:@"TakeOwnershipFailed"])
      {
        if ((char)buf[23] < 0)
        {
          sub_B9AC(&v26, *(void **)buf, *(unint64_t *)&buf[8]);
        }
        else
        {
          long long v26 = *(_OWORD *)buf;
          uint64_t v27 = *(void *)&buf[16];
        }
        [(BTAudioIDSService *)self handleTakeOwnershipFailed:&v26];
        if ((SHIBYTE(v27) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v26;
      }
      else if ([v12 isEqualToString:@"ReconcileOwnershipRemoteOwns"])
      {
        if ((char)buf[23] < 0)
        {
          sub_B9AC(&v24, *(void **)buf, *(unint64_t *)&buf[8]);
        }
        else
        {
          long long v24 = *(_OWORD *)buf;
          uint64_t v25 = *(void *)&buf[16];
        }
        [(BTAudioIDSService *)self handleReconcileOwnershipRemoteOwns:&v24];
        if ((SHIBYTE(v25) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v24;
      }
      else if ([v12 isEqualToString:@"ReconcileOwnershipRemoteReleased"])
      {
        if ((char)buf[23] < 0)
        {
          sub_B9AC(&v22, *(void **)buf, *(unint64_t *)&buf[8]);
        }
        else
        {
          long long v22 = *(_OWORD *)buf;
          uint64_t v23 = *(void *)&buf[16];
        }
        [(BTAudioIDSService *)self handleReconcileOwnershipRemoteReleased:&v22];
        if ((SHIBYTE(v23) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v22;
      }
      else if ([v12 isEqualToString:@"UnsupportedArbitrationMsg"])
      {
        if ((char)buf[23] < 0)
        {
          sub_B9AC(&v20, *(void **)buf, *(unint64_t *)&buf[8]);
        }
        else
        {
          long long v20 = *(_OWORD *)buf;
          uint64_t v21 = *(void *)&buf[16];
        }
        [(BTAudioIDSService *)self handleUnsupportedArbitrationMsg:&v20];
        if ((SHIBYTE(v21) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v20;
      }
      else
      {
        v17 = qword_A1A80;
        if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_ERROR)) {
          sub_653FC((uint64_t)objc_msgSend(objc_msgSend(a5, "description"), "UTF8String"), v32, v17);
        }
        if ((char)buf[23] < 0)
        {
          sub_B9AC(&v18, *(void **)buf, *(unint64_t *)&buf[8]);
        }
        else
        {
          long long v18 = *(_OWORD *)buf;
          uint64_t v19 = *(void *)&buf[16];
        }
        [(BTAudioIDSService *)self sendArbitrationMsg:@"UnsupportedArbitrationMsg" forAddress:&v18 withResponseIdentifier:0];
        if ((SHIBYTE(v19) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v18;
      }
      operator delete(*p_dst);
LABEL_53:
      if ((char)buf[23] < 0) {
        operator delete(*(void **)buf);
      }
      return;
    }
    if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_ERROR)) {
      sub_65378(v12);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_ERROR))
  {
    sub_652F4(a5);
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  v4 = &byte_9992A[30422];
  int v5 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v31 = [a4 count];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Nearby devices changed to %lu", buf, 0xCu);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v26 objects:v44 count:16];
  if (v6)
  {
    id v8 = v6;
    int v9 = 0;
    uint64_t v10 = *(void *)v27;
    *(void *)&long long v7 = 136316674;
    long long v20 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(a4);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v13 = *((void *)v4 + 336);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = objc_msgSend(objc_msgSend(v12, "productName"), "UTF8String");
          id v23 = [v12 productBuildVersion];
          id v22 = objc_msgSend(objc_msgSend(v12, "service"), "UTF8String");
          id v14 = "true";
          if ([v12 isNearby]) {
            id v15 = "true";
          }
          else {
            id v15 = "false";
          }
          if (!objc_msgSend(v12, "isConnected", v20)) {
            id v14 = "false";
          }
          uint64_t v16 = v4;
          id v17 = [v12 serviceMinCompatibilityVersion];
          unsigned int v18 = [(BTAudioIDSService *)self deviceIsCompatible:v12];
          *(_DWORD *)buf = v20;
          uint64_t v19 = "will not";
          if (v18) {
            uint64_t v19 = "will";
          }
          id v31 = v24;
          __int16 v32 = 2112;
          id v33 = v23;
          __int16 v34 = 2080;
          id v35 = v22;
          __int16 v36 = 2080;
          uint64_t v37 = v15;
          __int16 v38 = 2080;
          std::string v39 = v14;
          __int16 v40 = 2048;
          id v41 = v17;
          v4 = v16;
          __int16 v42 = 2080;
          uint64_t v43 = v19;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Device %s %@ is registered on service %s. Nearby: %s Connected: %s. ServiceMincompatibilityVersion: %lu. Device %s arbitrate", buf, 0x48u);
        }
        if (-[BTAudioIDSService deviceIsCompatible:](self, "deviceIsCompatible:", v12, v20)) {
          v9 += [v12 isNearby];
        }
      }
      id v8 = [a4 countByEnumeratingWithState:&v26 objects:v44 count:16];
    }
    while (v8);
  }
  else
  {
    int v9 = 0;
  }
  [(BTAudioIDSService *)self setCompatibleAndNearby:v9 > 0];
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  v4 = &byte_9992A[30422];
  int v5 = qword_A1A80;
  if (os_log_type_enabled((os_log_t)qword_A1A80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v31 = [a4 count];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Connected devices changed to %lu", buf, 0xCu);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v26 objects:v44 count:16];
  if (v6)
  {
    id v8 = v6;
    int v9 = 0;
    uint64_t v10 = *(void *)v27;
    *(void *)&long long v7 = 136316674;
    long long v20 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(a4);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v13 = *((void *)v4 + 336);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = objc_msgSend(objc_msgSend(v12, "productName"), "UTF8String");
          id v23 = [v12 productBuildVersion];
          id v22 = objc_msgSend(objc_msgSend(v12, "service"), "UTF8String");
          id v14 = "true";
          if ([v12 isNearby]) {
            id v15 = "true";
          }
          else {
            id v15 = "false";
          }
          if (!objc_msgSend(v12, "isConnected", v20)) {
            id v14 = "false";
          }
          uint64_t v16 = v4;
          id v17 = [v12 serviceMinCompatibilityVersion];
          unsigned int v18 = [(BTAudioIDSService *)self deviceIsCompatible:v12];
          *(_DWORD *)buf = v20;
          uint64_t v19 = "will not";
          if (v18) {
            uint64_t v19 = "will";
          }
          id v31 = v24;
          __int16 v32 = 2112;
          id v33 = v23;
          __int16 v34 = 2080;
          id v35 = v22;
          __int16 v36 = 2080;
          uint64_t v37 = v15;
          __int16 v38 = 2080;
          std::string v39 = v14;
          __int16 v40 = 2048;
          id v41 = v17;
          v4 = v16;
          __int16 v42 = 2080;
          uint64_t v43 = v19;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Device %s %@ is registered on service %s. Nearby: %s Connected: %s. ServiceMincompatibilityVersion: %lu. Device %s arbitrate", buf, 0x48u);
        }
        if (-[BTAudioIDSService deviceIsCompatible:](self, "deviceIsCompatible:", v12, v20)) {
          v9 += [v12 isConnected];
        }
      }
      id v8 = [a4 countByEnumeratingWithState:&v26 objects:v44 count:16];
    }
    while (v8);
  }
  else
  {
    int v9 = 0;
  }
  [(BTAudioIDSService *)self setCompatibleAndConnected:v9 > 0];
}

- (BOOL)compatibleAndConnected
{
  return self->compatibleAndConnected;
}

- (void)setCompatibleAndConnected:(BOOL)a3
{
  self->BOOL compatibleAndConnected = a3;
}

- (BOOL)compatibleAndNearby
{
  return self->compatibleAndNearby;
}

- (void)setCompatibleAndNearby:(BOOL)a3
{
  self->BOOL compatibleAndNearby = a3;
}

- (IDSService)mIdsService
{
  return self->_mIdsService;
}

- (void)setMIdsService:(id)a3
{
}

- (NSString)lastUsedIdentifierKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastUsedIdentifierKey:(id)a3
{
}

@end