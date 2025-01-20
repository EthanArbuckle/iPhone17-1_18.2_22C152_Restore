@interface HMIFeedbackSession
+ (id)logCategory;
- (HMIFeedbackSession)init;
- (HMIHomeKitClient)homeKitClient;
- (NSOperationQueue)operationQueue;
- (NSString)feedbackServiceHost;
- (NSURLSession)session;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation HMIFeedbackSession

- (HMIFeedbackSession)init
{
  v17.receiver = self;
  v17.super_class = (Class)HMIFeedbackSession;
  v2 = [(HMIFeedbackSession *)&v17 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setName:@"HMIFeedback Queue"];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    v5 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v6 = (void *)MEMORY[0x263F08BF8];
    v7 = [(HMIFeedbackSession *)v2 operationQueue];
    uint64_t v8 = [v6 sessionWithConfiguration:v5 delegate:v2 delegateQueue:v7];
    session = v2->_session;
    v2->_session = (NSURLSession *)v8;

    v10 = [[HMIHomeKitClient alloc] initWithNoCaching];
    homeKitClient = v2->_homeKitClient;
    v2->_homeKitClient = v10;

    feedbackServiceHost = v2->_feedbackServiceHost;
    v2->_feedbackServiceHost = (NSString *)@"hkcvml.apple.com";

    if (+[HMIPreference isInternalInstall])
    {
      v13 = +[HMIPreference sharedInstance];
      int v14 = [v13 BOOLPreferenceForKey:@"useDevelopmentFeedbackService" defaultValue:0];

      if (v14)
      {
        v15 = v2->_feedbackServiceHost;
        v2->_feedbackServiceHost = (NSString *)@"hkcvml-dev.apple.com";
      }
    }
  }
  return v2;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  if (+[HMIPreference isInternalInstall])
  {
    v11 = +[HMIPreference sharedInstance];
    int v12 = [v11 BOOLPreferenceForKey:@"useDevelopmentFeedbackService" defaultValue:0];

    if (v12)
    {
      v13 = (void *)MEMORY[0x22A641C70]();
      int v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        objc_super v17 = [(HMIFeedbackSession *)v14 feedbackServiceHost];
        *(_DWORD *)buf = 138543618;
        v49 = v16;
        __int16 v50 = 2112;
        CFErrorRef v51 = v17;
        _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_INFO, "%{public}@Trusting host: %@ by default, not enforcing certificate pinning since user is donating videos to a dev server", buf, 0x16u);
      }
LABEL_16:
      v10[2](v10, 1, 0);
      goto LABEL_21;
    }
  }
  v18 = [v9 protectionSpace];
  v19 = [v18 host];
  v20 = [(HMIFeedbackSession *)self feedbackServiceHost];
  char v21 = [v19 isEqual:v20];

  v22 = (void *)MEMORY[0x22A641C70]();
  v23 = self;
  v24 = HMFGetOSLogHandle();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v25)
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v49 = v26;
      _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_INFO, "%{public}@Force Certificate Pinning", buf, 0xCu);
    }
    v27 = [v9 protectionSpace];
    v28 = [v27 authenticationMethod];
    int v29 = [v28 isEqualToString:*MEMORY[0x263F08560]];

    if (!v29) {
      goto LABEL_16;
    }
    v30 = [(HMIFeedbackSession *)v23 feedbackServiceHost];
    AppleSSLPinned = (const void *)SecPolicyCreateAppleSSLPinned();

    if (AppleSSLPinned)
    {
      v32 = [v9 protectionSpace];
      v33 = (__SecTrust *)[v32 serverTrust];

      OSStatus v34 = SecTrustSetPolicies(v33, AppleSSLPinned);
      CFRelease(AppleSSLPinned);
      if (v34)
      {
        v35 = (void *)MEMORY[0x22A641C70]();
        v36 = v23;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v49 = v38;
          __int16 v50 = 2048;
          CFErrorRef v51 = (CFErrorRef)v34;
          _os_log_impl(&dword_225DC6000, v37, OS_LOG_TYPE_ERROR, "%{public}@Error setting trust policies: %lu", buf, 0x16u);
        }
      }
      else
      {
        CFErrorRef error = 0;
        if (SecTrustEvaluateWithError(v33, &error))
        {
          v45 = [MEMORY[0x263F08BB8] credentialForTrust:v33];
          ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v45);

          goto LABEL_21;
        }
        if (!error) {
          goto LABEL_15;
        }
        v35 = (void *)MEMORY[0x22A641C70]();
        v36 = v23;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v49 = v46;
          __int16 v50 = 2112;
          CFErrorRef v51 = error;
          _os_log_impl(&dword_225DC6000, v37, OS_LOG_TYPE_ERROR, "%{public}@Invalid certificate: %@", buf, 0x16u);
        }
      }
    }
LABEL_15:
    v10[2](v10, 2, 0);
    goto LABEL_21;
  }
  if (v25)
  {
    v39 = HMFGetLogIdentifier();
    v40 = [v9 protectionSpace];
    v41 = [v40 host];
    *(_DWORD *)buf = 138543618;
    v49 = v39;
    __int16 v50 = 2112;
    CFErrorRef v51 = v41;
    _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_INFO, "%{public}@Trusting host: %@", buf, 0x16u);
  }
  v42 = (void *)MEMORY[0x263F08BB8];
  v43 = [v9 protectionSpace];
  v44 = objc_msgSend(v42, "credentialForTrust:", objc_msgSend(v43, "serverTrust"));
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v44);

LABEL_21:
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5 != -1) {
    dispatch_once(&logCategory__hmf_once_t5, &__block_literal_global_17);
  }
  v2 = (void *)logCategory__hmf_once_v6;
  return v2;
}

uint64_t __33__HMIFeedbackSession_logCategory__block_invoke()
{
  logCategory__hmf_once_v6 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

- (HMIHomeKitClient)homeKitClient
{
  return (HMIHomeKitClient *)objc_getProperty(self, a2, 8, 1);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)feedbackServiceHost
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackServiceHost, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_homeKitClient, 0);
}

@end