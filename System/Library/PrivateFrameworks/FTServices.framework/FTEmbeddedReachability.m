@interface FTEmbeddedReachability
+ (id)reachabilityForInternetConnection;
+ (id)reachabilityForLocalWiFi;
+ (id)reachabilityWithAddress:(const sockaddr_in *)a3;
+ (id)reachabilityWithHostName:(id)a3;
- (BOOL)connectionRequired;
- (int64_t)currentReachabilityStatus;
- (int64_t)localWiFiStatusForFlags:(unsigned int)a3;
- (int64_t)networkStatusForFlags:(unsigned int)a3;
- (void)dealloc;
@end

@implementation FTEmbeddedReachability

- (void)dealloc
{
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
  {
    CFRelease(reachabilityRef);
    self->reachabilityRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FTEmbeddedReachability;
  [(FTEmbeddedReachability *)&v4 dealloc];
}

+ (id)reachabilityWithHostName:(id)a3
{
  id v4 = a3;
  if (qword_1E9739590 != -1) {
    dispatch_once(&qword_1E9739590, &unk_1EFE078E0);
  }
  v5 = (uint64_t (*)(void, uint64_t))off_1E9739588;
  id v6 = v4;
  uint64_t v9 = objc_msgSend_UTF8String(v6, v7, v8);
  uint64_t v10 = v5(0, v9);
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = objc_alloc_init((Class)a1);
    v13 = v12;
    if (v12)
    {
      *((void *)v12 + 2) = v11;
      *((unsigned char *)v12 + 8) = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  if (qword_1EB47C780 != -1) {
    dispatch_once(&qword_1EB47C780, &unk_1EFE07A00);
  }
  v5 = (void *)off_1EB47C778(*MEMORY[0x1E4F1CF80], a3);
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
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[1] = 0;
  v4[0] = 528;
  v2 = objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v4);

  return v2;
}

+ (id)reachabilityForLocalWiFi
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[1] = 0;
  v4[0] = 0xFEA900000210;
  objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v4);
  v2 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    v2[8] = 1;
  }

  return v2;
}

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  sub_1A7BD6B9C(a3, (uint64_t)"networkStatusForFlags");
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

- (BOOL)connectionRequired
{
  if (!self->reachabilityRef)
  {
    id v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"FTEmbeddedReachability.m", 190, @"connectionRequired called with NULL reachabilityRef");
  }
  if (qword_1E97395A0 != -1) {
    dispatch_once(&qword_1E97395A0, &unk_1EFE079C0);
  }
  int v8 = -1431655766;
  return off_1E9739598(self->reachabilityRef, &v8) && (v8 & 4) != 0;
}

- (int64_t)currentReachabilityStatus
{
  if (!self->reachabilityRef)
  {
    v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"FTEmbeddedReachability.m", 199, @"currentNetworkStatus called with NULL reachabilityRef");
  }
  if (qword_1EB47C790 != -1) {
    dispatch_once(&qword_1EB47C790, &unk_1EFE079E0);
  }
  unsigned int v9 = -1431655766;
  if (!off_1EB47C788(self->reachabilityRef, &v9)) {
    return 0;
  }
  if (self->localWiFiRef) {
    return objc_msgSend_localWiFiStatusForFlags_(self, v4, v9);
  }
  return objc_msgSend_networkStatusForFlags_(self, v4, v9);
}

@end