@interface IMNetworkReachability
+ (id)reachabilityForInternetConnection;
+ (id)reachabilityForLocalWiFi;
+ (id)reachabilityWithAddress:(const sockaddr_in *)a3;
+ (id)reachabilityWithHostName:(id)a3;
- (int64_t)currentReachabilityStatus;
- (int64_t)localWiFiStatusForFlags:(unsigned int)a3;
- (int64_t)networkStatusForFlags:(unsigned int)a3;
- (void)dealloc;
@end

@implementation IMNetworkReachability

- (void)dealloc
{
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
  {
    CFRelease(reachabilityRef);
    self->reachabilityRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IMNetworkReachability;
  [(IMNetworkReachability *)&v4 dealloc];
}

+ (id)reachabilityWithHostName:(id)a3
{
  id v4 = a3;
  if (qword_1E92DB908 != -1) {
    dispatch_once(&qword_1E92DB908, &unk_1EE22FE18);
  }
  v5 = (uint64_t (*)(void, uint64_t))off_1E92DB900;
  id v6 = v4;
  uint64_t v10 = objc_msgSend_UTF8String(v6, v7, v8, v9);
  uint64_t v11 = v5(0, v10);
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = objc_alloc_init((Class)a1);
    v14 = v13;
    if (v13)
    {
      *((void *)v13 + 2) = v12;
      *((unsigned char *)v13 + 8) = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  if (qword_1E92DB020 != -1) {
    dispatch_once(&qword_1E92DB020, &unk_1EE230CB8);
  }
  v5 = (void *)off_1E92DACA0(*MEMORY[0x1E4F1CF80], a3);
  if (v5)
  {
    id v6 = v5;
    v5 = objc_alloc_init((Class)a1);
    if (v5)
    {
      v5[2] = v6;
      *((unsigned char *)v5 + 8) = 0;
    }
  }
  return v5;
}

+ (id)reachabilityForInternetConnection
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[1] = 0;
  v5[0] = 528;
  v3 = objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v5, v2);
  return v3;
}

+ (id)reachabilityForLocalWiFi
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[1] = 0;
  v5[0] = 0xFEA900000210;
  objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v5, v2);
  v3 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    v3[8] = 1;
  }
  return v3;
}

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  sub_1918D6758(a3, (uint64_t)"networkStatusForFlags");
  if ((a3 & 2) == 0) {
    return 0;
  }
  LODWORD(v5) = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0) {
    LODWORD(v5) = 0;
  }
  if ((a3 & 4) != 0) {
    int64_t v5 = v5;
  }
  else {
    int64_t v5 = 1;
  }
  if ((a3 & 0x40000) != 0) {
    return 2;
  }
  else {
    return v5;
  }
}

- (int64_t)currentReachabilityStatus
{
  if (!self->reachabilityRef)
  {
    uint64_t v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, @"IMNetworkAvailability.m", 195, @"currentNetworkStatus called with NULL reachabilityRef");
  }
  if (qword_1E92DACB0 != -1) {
    dispatch_once(&qword_1E92DACB0, &unk_1EE230358);
  }
  unsigned int v11 = -1431655766;
  if (!off_1E92DACA8(self->reachabilityRef, &v11)) {
    return 0;
  }
  if (self->localWiFiRef) {
    return objc_msgSend_localWiFiStatusForFlags_(self, v5, v11, v6);
  }
  return objc_msgSend_networkStatusForFlags_(self, v5, v11, v6);
}

@end