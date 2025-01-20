@interface IDSBAASigner
+ (BOOL)isBAAHTTPResponseCode:(int64_t)a3;
+ (BOOL)shouldRetryError:(id)a3;
- (BOOL)isBAAProtocolHeader:(id)a3;
- (BOOL)isDeviceIdentitySupported;
- (BOOL)isVirtualMachine;
- (IDSBAASigner)initWithQueue:(id)a3;
- (OS_dispatch_queue)baaQueue;
- (OS_dispatch_queue)queue;
- (id)alternateICloudSigningPayloadForData:(id)a3 currentTimestampInMs:(unint64_t *)a4;
- (id)baaCertTTLInMinutesFromServerBag;
- (id)baaFetchTimeoutFromServerBag;
- (id)errorStringForNSError:(id)a3;
- (id)errorStringForNSErrorWithoutUnderlyingError:(id)a3;
- (id)errorStringForSingingResult:(id)a3;
- (id)headersBySigningData:(id)a3 baaSigningResult:(id)a4 baaCert:(id)a5 intermediateRootCert:(id)a6;
- (id)hostErrorStringForSingingResult:(id)a3;
- (id)icloudBAAVersion;
- (id)icloudSignData:(id)a3 withKey:(__SecKey *)a4 error:(id *)a5;
- (id)icloudSigningPayloadForData:(id)a3 withAltPayload:(id)a4;
- (id)isBAASupportedHeaderValue;
- (id)legacySignData:(id)a3 withKey:(__SecKey *)a4 signingTimestamp:(id *)a5 error:(id *)a6;
- (void)fetchBAAIdentityIfNeededWithCompletion:(id)a3;
- (void)headersBySigningData:(id)a3 serverTimestamp:(id)a4 topic:(id)a5 completion:(id)a6;
- (void)headersBySigningDataNoXPC:(id)a3 serverTimestamp:(id)a4 completion:(id)a5;
- (void)headersBySigningDataXPC:(id)a3 serverTimestamp:(id)a4 topic:(id)a5 completion:(id)a6;
- (void)purgeBAACertForTopic:(id)a3;
- (void)purgeBAACertForTopic:(id)a3 completion:(id)a4;
- (void)purgeBAACertNoXPCWithCompletion:(id)a3;
- (void)purgeBAACertXPCForTopic:(id)a3 completion:(id)a4;
- (void)signData:(id)a3 withKey:(__SecKey *)a4 completion:(id)a5;
@end

@implementation IDSBAASigner

- (IDSBAASigner)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSBAASigner;
  v6 = [(IDSBAASigner *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.IDS.IDSBAASigner.BAA", v8);
    baaQueue = v7->_baaQueue;
    v7->_baaQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)headersBySigningData:(id)a3 serverTimestamp:(id)a4 topic:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [(IDSBAASigner *)self queue];
  dispatch_assert_queue_V2(v14);

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = sub_1919A15E0;
  v20 = &unk_1E572BB60;
  v21 = self;
  id v22 = v11;
  id v15 = v11;
  v16 = (void *)MEMORY[0x192FE03B0](&v17);
  if (_IDSRunningInDaemon()) {
    -[IDSBAASigner headersBySigningDataNoXPC:serverTimestamp:completion:](self, "headersBySigningDataNoXPC:serverTimestamp:completion:", v13, v12, v16, v17, v18, v19, v20, v21, v22);
  }
  else {
    -[IDSBAASigner headersBySigningDataXPC:serverTimestamp:topic:completion:](self, "headersBySigningDataXPC:serverTimestamp:topic:completion:", v13, v12, v10, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)headersBySigningDataXPC:(id)a3 serverTimestamp:(id)a4 topic:(id)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(IDSBAASigner *)self queue];
  dispatch_assert_queue_V2(v14);

  id v15 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "XPCing BAA sign {topic: %@, serverTimestamp: %@, data: %@}", buf, 0x20u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1919A18CC;
  v20[3] = &unk_1E572BB88;
  id v21 = v12;
  id v22 = v10;
  id v23 = v11;
  id v24 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  id v19 = v12;
  +[IDSXPCDaemonController performDaemonControllerTask:v20];
}

- (void)headersBySigningDataNoXPC:(id)a3 serverTimestamp:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IDSBAASigner *)self queue];
  dispatch_assert_queue_V2(v11);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1919A1B0C;
  v15[3] = &unk_1E572BBD8;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IDSBAASigner *)self fetchBAAIdentityIfNeededWithCompletion:v15];
}

- (void)purgeBAACertForTopic:(id)a3
{
}

- (void)purgeBAACertForTopic:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (_IDSRunningInDaemon()) {
    [(IDSBAASigner *)self purgeBAACertNoXPCWithCompletion:v6];
  }
  else {
    [(IDSBAASigner *)self purgeBAACertXPCForTopic:v7 completion:v6];
  }
}

- (void)purgeBAACertXPCForTopic:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919A21DC;
  v9[3] = &unk_1E5729FE8;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  +[IDSXPCDaemonController performDaemonControllerTask:v9];
}

- (void)purgeBAACertNoXPCWithCompletion:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1E92DE2D0 != -1) {
    dispatch_once(&qword_1E92DE2D0, &unk_1EE2466E8);
  }
  if (!qword_1E92DE2D8)
  {
    id v5 = (void **)MEMORY[0x192FDF3F0]("kMAOptionsBAAKeychainLabel", @"DeviceIdentity");
    if (v5) {
      id v6 = *v5;
    }
    else {
      id v6 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DE2D8, v6);
  }
  uint64_t v7 = qword_1E92DE2E0;
  if (!qword_1E92DE2E0)
  {
    id v8 = (void **)MEMORY[0x192FDF3F0]("kMAOptionsBAADeleteExistingKeysAndCerts", @"DeviceIdentity");
    if (v8) {
      id v9 = *v8;
    }
    else {
      id v9 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DE2E0, v9);
    uint64_t v7 = qword_1E92DE2E0;
  }
  if (off_1E92DE2C8 && qword_1E92DE2D8 && v7)
  {
    v22[0] = qword_1E92DE2D8;
    v22[1] = v7;
    v23[0] = @"com.apple.IDS";
    v23[1] = MEMORY[0x1E4F1CC38];
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v11 = (void (*)(void *, NSObject *, void *))off_1E92DE2C8;
    id v12 = [(IDSBAASigner *)self baaQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1919A256C;
    v20[3] = &unk_1E572BC00;
    id v21 = v4;
    v11(v12, v10, v20);
  }
  else
  {
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
    id v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_191A36E90(v10, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (BOOL)isDeviceIdentitySupported
{
  if (qword_1E92DE210 != -1) {
    dispatch_once(&qword_1E92DE210, &unk_1EE2459C8);
  }
  v2 = (uint64_t (*)(void))off_1E92DE208;
  if (off_1E92DE208)
  {
    LOBYTE(v2) = v2();
  }
  return (char)v2;
}

- (void)fetchBAAIdentityIfNeededWithCompletion:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IDSBAASigner *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(IDSBAASigner *)self isDeviceIdentitySupported])
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = sub_191918730;
    v36[4] = sub_1919185B8;
    id v37 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = sub_191918730;
    v34[4] = sub_1919185B8;
    id v35 = 0;
    uint64_t v6 = [(IDSBAASigner *)self baaCertTTLInMinutesFromServerBag];
    uint64_t v7 = (void *)v6;
    id v8 = &unk_1EE28B640;
    if (v6) {
      id v8 = (void *)v6;
    }
    id v9 = v8;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1919A2A8C;
    v28[3] = &unk_1E572BC78;
    id v10 = v9;
    id v29 = v10;
    id v30 = self;
    uint64_t v31 = v38;
    v32 = v36;
    v33 = v34;
    id v11 = (void *)MEMORY[0x192FE03B0](v28);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = sub_1919A3270;
    id v22 = &unk_1E572BCC8;
    id v23 = self;
    v25 = v38;
    id v26 = v36;
    __int16 v27 = v34;
    id v24 = v4;
    id v12 = (void *)MEMORY[0x192FE03B0](&v19);
    uint64_t v13 = [(IDSBAASigner *)self baaFetchTimeoutFromServerBag];
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 doubleValue];
      double v16 = v15;
    }
    else
    {
      double v16 = 60.0;
    }
    uint64_t v18 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v40 = v16;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "Starting device identity fetch task with timeout {timeoutInSeconds: %f}", buf, 0xCu);
    }

    dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    im_dispatch_async_with_timeout();

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v36, 8);

    _Block_object_dispose(v38, 8);
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSBAASignerErrorDomain" code:8 userInfo:0];
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v17);
  }
}

- (id)baaCertTTLInMinutesFromServerBag
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"absinthe-baa-cert-ttl-minutes"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)baaFetchTimeoutFromServerBag
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"absinthe-baa-timeout"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)signData:(id)a3 withKey:(__SecKey *)a4 completion:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, IDSBAASigningResult *))a5;
  if (!a4)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 5;
    goto LABEL_5;
  }
  id v10 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  int v11 = [v10 isUnderFirstDataProtectionLock];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 7;
LABEL_5:
    id v14 = [v12 errorWithDomain:@"IDSBAASignerErrorDomain" code:v13 userInfo:0];
    double v15 = [[IDSBAASigningResult alloc] initWithResultData:0 timestamp:0 error:v14];
    v9[2](v9, v15);

    goto LABEL_6;
  }
  id v14 = [v8 sha256Digest];

  if (v14)
  {
    id v58 = 0;
    id v59 = 0;
    double v16 = [(IDSBAASigner *)self legacySignData:v8 withKey:a4 signingTimestamp:&v59 error:&v58];
    id v17 = v59;
    id v14 = v58;
  }
  else
  {
    id v17 = 0;
    double v16 = 0;
  }
  if (_os_feature_enabled_impl())
  {
    id v35 = v17;
    uint64_t v57 = 0;
    id v18 = [(IDSBAASigner *)self alternateICloudSigningPayloadForData:v8 currentTimestampInMs:&v57];
    uint64_t v19 = [v8 requestBody];

    uint64_t v20 = v18;
    if (v19)
    {
      uint64_t v20 = [(IDSBAASigner *)self icloudSigningPayloadForData:v8 withAltPayload:v18];
    }
    v34 = v16;
    id v21 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v20;
      _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "BAA signer payload %@", buf, 0xCu);
    }

    id v22 = [v18 dataUsingEncoding:4];
    uint64_t v23 = [v22 SHA256Data];

    id v24 = [v20 dataUsingEncoding:4];
    v25 = [v24 SHA256Data];

    id v56 = 0;
    v36 = v25;
    v39 = [(IDSBAASigner *)self icloudSignData:v25 withKey:a4 error:&v56];
    id v37 = (void *)v23;
    id v38 = v56;
    id v55 = 0;
    id v26 = [(IDSBAASigner *)self icloudSignData:v23 withKey:a4 error:&v55];
    id v27 = v55;
    if ([(IDSBAASigner *)self isVirtualMachine])
    {
      id v28 = [(IDSBAASigner *)self baaQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1919A3AF0;
      block[3] = &unk_1E572BD38;
      uint64_t v41 = v25;
      id v42 = v37;
      v43 = self;
      v53 = v9;
      id v29 = v34;
      id v44 = v34;
      id v30 = v35;
      id v45 = v35;
      id v46 = v14;
      uint64_t v54 = v57;
      id v47 = v20;
      id v48 = v18;
      id v49 = v39;
      id v50 = v26;
      id v51 = v38;
      id v52 = v27;
      dispatch_async(v28, block);

      uint64_t v31 = v41;
    }
    else
    {
      v33 = [IDSBAASigningResult alloc];
      id v29 = v34;
      id v30 = v35;
      uint64_t v31 = [(IDSBAASigningResult *)v33 initWithResultData:v34 timestamp:v35 error:v14 currentTimestampInMs:v57 icloudDigest:v20 icloudAltDigest:v18 icloudResultData:v39 icloudAltResultData:v26 icloudError:v38 icloudAltError:v27];
      v9[2](v9, v31);
    }
  }
  else
  {
    v32 = [[IDSBAASigningResult alloc] initWithResultData:v16 timestamp:v17 error:v14];
    v9[2](v9, v32);
  }
LABEL_6:
}

- (id)legacySignData:(id)a3 withKey:(__SecKey *)a4 signingTimestamp:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSince1970];
  double v12 = v11;

  uint64_t v13 = [v9 serverTimestamp];

  if (v13)
  {
    id v14 = [v9 serverTimestamp];
    [v14 doubleValue];
    double v12 = v15 / 1000.0;
  }
  double v16 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", (unint64_t)(v12 * 1000.0));
  unint64_t v27 = bswap64((unint64_t)(v12 * 1000.0));
  id v17 = [v9 sha256Digest];
  id v18 = (void *)[v17 mutableCopy];

  [v18 appendBytes:&v27 length:8];
  CFErrorRef error = 0;
  CFStringRef v19 = (const __CFString *)*MEMORY[0x1E4F3BA70];
  CFDataRef v20 = (const __CFData *)[v18 copy];
  CFDataRef v21 = SecKeyCreateSignature(a4, v19, v20, &error);

  if (v21)
  {
    id v22 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "Successfully signed legacy baa data in baa signer", buf, 2u);
    }
    CFErrorRef v23 = 0;
  }
  else
  {
    CFErrorRef v23 = error;
    id v22 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_191A36FBC();
    }
  }

  if (a6) {
    *a6 = v23;
  }
  if (a5) {
    *a5 = v16;
  }

  return v21;
}

- (id)icloudSignData:(id)a3 withKey:(__SecKey *)a4 error:(id *)a5
{
  CFErrorRef error = 0;
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F3BA70];
  CFDataRef v8 = (const __CFData *)[a3 copy];
  CFDataRef v9 = SecKeyCreateSignature(a4, v7, v8, &error);

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Successfully signed baa data in baa signer", v13, 2u);
    }
    CFErrorRef v11 = 0;
  }
  else
  {
    CFErrorRef v11 = error;
    id v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_191A37030();
    }
  }

  if (a5) {
    *a5 = v11;
  }

  return v9;
}

- (id)icloudSigningPayloadForData:(id)a3 withAltPayload:(id)a4
{
  id v5 = NSString;
  id v6 = a4;
  CFStringRef v7 = [a3 requestBody];
  CFDataRef v8 = [v7 SHA256Data];
  CFDataRef v9 = objc_msgSend(v8, "__imHexString");
  id v10 = [v9 lowercaseString];
  CFErrorRef v11 = [v5 stringWithFormat:@"%@%@", v10, v6];

  return v11;
}

- (id)alternateICloudSigningPayloadForData:(id)a3 currentTimestampInMs:(unint64_t *)a4
{
  id v6 = a3;
  CFStringRef v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSince1970];
  double v9 = v8;

  id v10 = [v6 serverTimestamp];

  if (v10)
  {
    CFErrorRef v11 = [v6 serverTimestamp];
    unint64_t v12 = [v11 unsignedLongLongValue];

    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unint64_t v12 = (unint64_t)(v9 * 1000.0);
  if (a4) {
LABEL_3:
  }
    *a4 = v12;
LABEL_4:
  uint64_t v13 = NSString;
  id v14 = [NSNumber numberWithUnsignedLongLong:v12];
  double v15 = [(IDSBAASigner *)self icloudBAAVersion];
  double v16 = [v13 stringWithFormat:@"|%@=%@|%@=%@", @"x-apple-baa-time", v14, @"x-apple-baa-version", v15];

  return v16;
}

- (id)isBAASupportedHeaderValue
{
  if ([(IDSBAASigner *)self isDeviceIdentitySupported]) {
    v2 = @"1";
  }
  else {
    v2 = @"0";
  }

  return v2;
}

- (BOOL)isBAAProtocolHeader:(id)a3
{
  id v3 = a3;
  if (qword_1E92DE200 != -1) {
    dispatch_once(&qword_1E92DE200, &unk_1EE245A48);
  }
  if ([(id)qword_1E92DE1F8 containsObject:v3]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasPrefix:@"x-apple-baa"];
  }

  return v4;
}

+ (BOOL)shouldRetryError:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  if (v3
    && ([v3 domain],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"IDSBAASignerErrorDomain"],
        v5,
        v6))
  {
    unint64_t v7 = [v4 code];
    if (v7 <= 8) {
      unsigned int v8 = (0x12u >> v7) & 1;
    }
    else {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (BOOL)isBAAHTTPResponseCode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFCLL) == 440;
}

- (id)headersBySigningData:(id)a3 baaSigningResult:(id)a4 baaCert:(id)a5 intermediateRootCert:(id)a6
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v58 = (void *)[v12 mutableCopy];
  [v58 appendData:v13];
  double v15 = [v10 sha256Digest];

  if (v15)
  {
    double v16 = [v10 sha256Digest];
    id v17 = [v16 base64EncodedStringWithOptions:0];

    id v18 = v10;
    if (v17)
    {
      CFDictionarySetValue(v14, @"baa-message", v17);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_191A37704();
    }

    CFStringRef v19 = NSString;
    CFDataRef v20 = [v11 resultData];
    CFDataRef v21 = [v20 base64EncodedStringWithOptions:0];
    id v22 = [v11 timestamp];
    CFErrorRef v23 = [v19 stringWithFormat:@"%@:%@", v21, v22];

    id v24 = v23;
    if (v24)
    {
      CFDictionarySetValue(v14, @"baa-signature", v24);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_191A3767C();
    }

    v25 = [v58 base64EncodedStringWithOptions:0];
    id v10 = v18;
    if (v25)
    {
      CFDictionarySetValue(v14, @"baa-certs", v25);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_191A375F4();
    }
  }
  if (_os_feature_enabled_impl())
  {
    id v26 = [(IDSBAASigner *)self icloudBAAVersion];
    unint64_t v27 = [v26 stringValue];

    if (v27)
    {
      CFDictionarySetValue(v14, @"x-apple-baa-version", v27);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_191A3756C();
    }

    if (v12 && v13)
    {
      v59[0] = v12;
      v59[1] = v13;
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
      id v29 = IDSPEMFormatCertificates();

      if (v29)
      {
        CFDictionarySetValue(v14, @"x-apple-baa-cert", v29);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_191A374E4();
      }
    }
    id v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "currentTimestampInMs"));
    uint64_t v31 = [v30 stringValue];

    if (v31) {
      CFDictionarySetValue(v14, @"x-apple-baa-time", v31);
    }

    v32 = [v11 icloudAltResultData];

    if (v32)
    {
      v33 = [v11 icloudAltResultData];
      v34 = [v33 base64EncodedStringWithOptions:0];

      if (v34)
      {
        CFDictionarySetValue(v14, @"x-apple-baa-sig-alt", v34);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_191A3745C();
      }
    }
    id v35 = [v11 icloudResultData];

    if (v35)
    {
      v36 = [v11 icloudResultData];
      id v37 = [v36 base64EncodedStringWithOptions:0];

      if (v37)
      {
        CFDictionarySetValue(v14, @"x-apple-baa-sig", v37);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_191A373D4();
      }
    }
    id v38 = [(IDSBAASigner *)self errorStringForSingingResult:v11];
    if ([v38 length])
    {
      id v39 = v38;
      if (v39)
      {
        CFDictionarySetValue(v14, @"x-apple-baa-error", v39);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_191A3734C();
      }
    }
    if ([(IDSBAASigner *)self isVirtualMachine])
    {
      double v40 = [v11 hostCertChain];

      if (v40)
      {
        id v41 = v10;
        id v42 = [v11 hostCertChain];
        v43 = IDSParseDERCertificatesFromChain();
        id v44 = IDSPEMFormatCertificates();

        id v45 = v44;
        if (v45)
        {
          CFDictionarySetValue(v14, @"x-apple-baa-host-cert", v45);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_191A372C4();
        }

        id v10 = v41;
      }
      id v46 = [v11 hostAltResultData];

      if (v46)
      {
        id v47 = [v11 hostAltResultData];
        id v48 = [v47 base64EncodedStringWithOptions:0];

        if (v48)
        {
          CFDictionarySetValue(v14, @"x-apple-baa-host-sig-alt", v48);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_191A3723C();
        }
      }
      id v57 = v10;
      id v49 = [v11 hostResultData];

      if (v49)
      {
        id v50 = [v11 hostResultData];
        id v51 = [v50 base64EncodedStringWithOptions:0];

        if (v51)
        {
          CFDictionarySetValue(v14, @"x-apple-baa-host-sig", v51);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_191A371B4();
        }
      }
      id v52 = [(IDSBAASigner *)self hostErrorStringForSingingResult:v11];
      if ([v52 length])
      {
        id v53 = v52;
        if (v53)
        {
          CFDictionarySetValue(v14, @"x-apple-baa-host-error", v53);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_191A3712C();
        }
      }
      id v10 = v57;
    }
    if ([(IDSBAASigner *)self isVirtualMachine]) {
      uint64_t v54 = @"2";
    }
    else {
      uint64_t v54 = @"1";
    }
    CFDictionarySetValue(v14, @"x-apple-i-device-type", v54);
    id v55 = [(IDSBAASigner *)self isBAASupportedHeaderValue];
    if (v55)
    {
      CFDictionarySetValue(v14, @"x-apple-baa-supported", v55);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_191A370A4();
    }
  }

  return v14;
}

- (id)errorStringForNSErrorWithoutUnderlyingError:(id)a3
{
  id v3 = a3;
  char v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (v5)
  {
    int v6 = [v3 localizedDescription];
    unint64_t v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":,"];
    unsigned int v8 = [v6 stringByRemovingCharactersFromSet:v7];

    double v9 = NSString;
    id v10 = [v3 domain];
    uint64_t v11 = [v3 code];

    id v12 = [v9 stringWithFormat:@"%@:%ld:%@", v10, v11, v8];
  }
  else
  {
    id v13 = NSString;
    unsigned int v8 = [v3 domain];
    uint64_t v14 = [v3 code];

    id v12 = [v13 stringWithFormat:@"%@:%ld", v8, v14];
  }

  return v12;
}

- (id)errorStringForNSError:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v22 = v4;
  if (v4)
  {
    id v5 = v4;
    int v6 = [(IDSBAASigner *)self errorStringForNSErrorWithoutUnderlyingError:v4];
    uint64_t v7 = [v5 underlyingErrors];
    if (v7)
    {
      unsigned int v8 = (void *)v7;
      do
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id obj = v8;
        uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          unsigned int v8 = 0;
          uint64_t v11 = *(void *)v25;
          do
          {
            uint64_t v12 = 0;
            id v13 = v6;
            do
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
              double v15 = NSString;
              double v16 = [(IDSBAASigner *)self errorStringForNSErrorWithoutUnderlyingError:v14];
              id v17 = [v15 stringWithFormat:@",%@", v16];
              int v6 = [(__CFString *)v13 stringByAppendingString:v17];

              uint64_t v18 = [v14 underlyingErrors];
              CFStringRef v19 = (void *)v18;
              if (v8)
              {
                uint64_t v20 = [v8 arrayByAddingObjectsFromArray:v18];

                unsigned int v8 = (void *)v20;
              }
              else
              {
                unsigned int v8 = (void *)v18;
              }
              ++v12;
              id v13 = v6;
            }
            while (v10 != v12);
            uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v10);
        }
        else
        {
          unsigned int v8 = 0;
        }
      }
      while (v8);
    }
  }
  else
  {
    int v6 = &stru_1EE2476E8;
  }

  return v6;
}

- (id)errorStringForSingingResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 icloudError];

  if (v5)
  {
    int v6 = [v4 icloudError];
    uint64_t v7 = [(IDSBAASigner *)self errorStringForNSError:v6];
    id v5 = [&stru_1EE2476E8 stringByAppendingString:v7];
  }
  unsigned int v8 = [v4 icloudAltError];

  if (v8)
  {
    if ([v5 length])
    {
      uint64_t v9 = [v5 stringByAppendingString:@","];
    }
    else
    {
      uint64_t v9 = &stru_1EE2476E8;
    }

    uint64_t v10 = [v4 icloudAltError];
    uint64_t v11 = [(IDSBAASigner *)self errorStringForNSError:v10];
    id v5 = [(__CFString *)v9 stringByAppendingString:v11];
  }

  return v5;
}

- (id)hostErrorStringForSingingResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 hostError];

  if (v5)
  {
    int v6 = [v4 hostError];
    uint64_t v7 = [(IDSBAASigner *)self errorStringForNSError:v6];
    id v5 = [&stru_1EE2476E8 stringByAppendingString:v7];
  }
  unsigned int v8 = [v4 hostAltError];

  if (v8)
  {
    if ([v5 length])
    {
      uint64_t v9 = [v5 stringByAppendingString:@","];
    }
    else
    {
      uint64_t v9 = &stru_1EE2476E8;
    }

    uint64_t v10 = [v4 hostAltError];
    uint64_t v11 = [(IDSBAASigner *)self errorStringForNSError:v10];
    id v5 = [(__CFString *)v9 stringByAppendingString:v11];
  }

  return v5;
}

- (BOOL)isVirtualMachine
{
  return MEMORY[0x1F4122CF0](self, a2);
}

- (id)icloudBAAVersion
{
  return &unk_1EE28B340;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)baaQueue
{
  return self->_baaQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baaQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end