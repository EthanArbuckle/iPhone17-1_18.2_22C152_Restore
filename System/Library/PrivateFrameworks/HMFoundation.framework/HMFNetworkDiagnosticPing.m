@interface HMFNetworkDiagnosticPing
- (HMFNetworkDiagnosticPing)initWithDevice:(id)a3 delegate:(id)a4 queue:(id)a5;
- (HMFPromise)delayPromise;
- (HMFPromise)readPromise;
- (NSDate)pingStartDate;
- (__CFSocket)socket_ipv4;
- (__CFSocket)socket_ipv6;
- (double)runDuration;
- (id)_configure;
- (id)_sendData:(id)a3;
- (id)_sendData:(id)a3 address:(id)a4;
- (id)_sendPing:(id)a3;
- (id)addressIPV4;
- (id)addressIPV6;
- (id)delayFuture:(double)a3;
- (id)dumpReport;
- (id)run;
- (id)runWithDelay:(double)a3;
- (id)shortDescription;
- (id)workContext;
- (int)sockHandle_ipv4;
- (int)sockHandle_ipv6;
- (unsigned)identifier;
- (unsigned)sequenceNumber;
- (void)_readDataFromSocket:(__CFSocket *)a3;
- (void)setDelayPromise:(id)a3;
- (void)setIdentifier:(unsigned __int16)a3;
- (void)setPingStartDate:(id)a3;
- (void)setReadPromise:(id)a3;
- (void)setRunDuration:(double)a3;
- (void)setSequenceNumber:(unsigned __int16)a3;
- (void)setSockHandle_ipv4:(int)a3;
- (void)setSockHandle_ipv6:(int)a3;
- (void)setSocket_ipv4:(__CFSocket *)a3;
- (void)setSocket_ipv6:(__CFSocket *)a3;
- (void)stop;
- (void)stopWithError:(id)a3;
@end

@implementation HMFNetworkDiagnosticPing

- (HMFNetworkDiagnosticPing)initWithDevice:(id)a3 delegate:(id)a4 queue:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)HMFNetworkDiagnosticPing;
  v5 = [(HMFNetworkDiagnostic *)&v7 initWithDevice:a3 delegate:a4 queue:a5];
  if (v5)
  {
    v5->_identifier = arc4random();
    v5->_runDuration = -1.0;
    v5->_sockHandle_ipv4 = -1;
    v5->_sockHandle_ipv6 = -1;
  }
  return v5;
}

- (id)workContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HMFNetworkDiagnosticPing_workContext__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  if (_MergedGlobals_1_2 != -1) {
    dispatch_once(&_MergedGlobals_1_2, block);
  }
  return (id)qword_1EB4EEEB8;
}

void __39__HMFNetworkDiagnosticPing_workContext__block_invoke(uint64_t a1)
{
  v2 = [HMFDispatchContext alloc];
  id v5 = [*(id *)(a1 + 32) workQueue];
  uint64_t v3 = [(HMFDispatchContext *)v2 initWithQueue:v5];
  v4 = (void *)qword_1EB4EEEB8;
  qword_1EB4EEEB8 = v3;
}

- (id)addressIPV6
{
  v2 = [(HMFNetworkDiagnostic *)self device];
  uint64_t v3 = [v2 addresses];
  v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_34);

  return v4;
}

BOOL __39__HMFNetworkDiagnosticPing_addressIPV6__block_invoke(uint64_t a1, void *a2)
{
  return [a2 addressFamily] == 2;
}

- (id)addressIPV4
{
  v2 = [(HMFNetworkDiagnostic *)self device];
  uint64_t v3 = [v2 addresses];
  v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_3_1);

  return v4;
}

BOOL __39__HMFNetworkDiagnosticPing_addressIPV4__block_invoke(uint64_t a1, void *a2)
{
  return [a2 addressFamily] == 1;
}

- (id)shortDescription
{
  return (id)[NSString stringWithFormat:@"%@-%hu", objc_opt_class(), -[HMFNetworkDiagnosticPing identifier](self, "identifier")];
}

- (id)delayFuture:(double)a3
{
  if (a3 <= 0.0)
  {
    objc_super v7 = +[HMFFuture futureWithNoValue];
  }
  else
  {
    p_delayPromise = &self->_delayPromise;
    delayPromise = self->_delayPromise;
    self->_delayPromise = 0;

    objc_super v7 = +[HMFFuture futureWithPromise:p_delayPromise];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__HMFNetworkDiagnosticPing_delayFuture___block_invoke;
    block[3] = &unk_1E5957698;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
  return v7;
}

void __40__HMFNetworkDiagnosticPing_delayFuture___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delayPromise];
  [v1 fulfillWithNoValue];
}

- (id)runWithDelay:(double)a3
{
  id v5 = [(HMFNetworkDiagnosticPing *)self workContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke;
  v8[3] = &unk_1E59581C0;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  v6 = +[HMFFuture inContext:v5 perform:v8];

  return v6;
}

uint64_t __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isStarted]) {
    return 1;
  }
  [*(id *)(a1 + 32) setStarted:1];
  uint64_t v3 = [*(id *)(a1 + 32) pingDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) pingDelegate];
    v6 = *(void **)(a1 + 32);
    objc_super v7 = [v6 device];
    [v5 diagnostic:v6 didStartWithDevice:v7];
  }
  id v8 = *(id *)(a1 + 32);
  v9 = [v8 device];
  v10 = NSString;
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v8, "identifier"));
  v12 = +[HMFSystemInfo systemInfo];
  v13 = [v12 name];
  v29 = [v10 stringWithFormat:@"ID: %@ -> Source: %@", v11, v13];

  v14 = NSString;
  v15 = [v9 addresses];
  v16 = [v15 firstObject];
  v17 = [v16 addressString];
  v18 = [v9 serviceInfo];
  v19 = [v18 deviceID];
  v20 = [v9 host];
  v21 = [v14 stringWithFormat:@"Target: %@/%@/%@", v17, v19, v20];

  v22 = [NSString stringWithFormat:@"%@ -> %@", v29, v21];
  v23 = [v22 dataUsingEncoding:4];

  v24 = [*(id *)(a1 + 32) delayFuture:*(double *)(a1 + 40)];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_2;
  v30[3] = &unk_1E5958170;
  v30[4] = *(void *)(a1 + 32);
  id v25 = v23;
  id v31 = v25;
  id v26 = [v24 then:v30];
  if (!v26) {
    _HMFPreconditionFailure(@"future");
  }
  v27 = v26;
  uint64_t v2 = 3;

  return v2;
}

uint64_t __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) _sendPing:*(void *)(a1 + 40)];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_3;
  v10[3] = &unk_1E59585D8;
  v10[4] = *(void *)(a1 + 32);
  id v5 = [v4 recover:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_4;
  v9[3] = &unk_1E5957FB8;
  v9[4] = *(void *)(a1 + 32);
  id v6 = [v5 finally:v9];
  if (!v6) {
    _HMFPreconditionFailure(@"future");
  }
  objc_super v7 = v6;

  return 3;
}

uint64_t __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) stopWithError:v3];
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    [MEMORY[0x1E4F28C58] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_4(uint64_t a1)
{
  return 1;
}

- (id)run
{
  return [(HMFNetworkDiagnosticPing *)self runWithDelay:0.0];
}

- (id)_sendPing:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFNetworkDiagnosticPing *)self _configure];
  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__HMFNetworkDiagnosticPing__sendPing___block_invoke;
  v10[3] = &unk_1E5958170;
  v10[4] = self;
  id v11 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__HMFNetworkDiagnosticPing__sendPing___block_invoke_2;
  v9[3] = &unk_1E59585D8;
  id v6 = v4;
  objc_super v7 = [v5 then:v10 orRecover:v9];

  return v7;
}

uint64_t __38__HMFNetworkDiagnosticPing__sendPing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _sendData:*(void *)(a1 + 40)];
  if (!v4) {
    _HMFPreconditionFailure(@"future");
  }
  id v5 = v4;

  return 3;
}

uint64_t __38__HMFNetworkDiagnosticPing__sendPing___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A87A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_super v7 = HMFGetLogIdentifier(v5);
    int v12 = 138543618;
    v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure with error: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v8 = v3;
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    [MEMORY[0x1E4F28C58] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (void)stopWithError:(id)a3
{
  id v10 = a3;
  if ([(HMFNetworkDiagnosticPing *)self sockHandle_ipv4] != -1)
  {
    close([(HMFNetworkDiagnosticPing *)self sockHandle_ipv4]);
    [(HMFNetworkDiagnosticPing *)self setSockHandle_ipv4:0xFFFFFFFFLL];
  }
  if ([(HMFNetworkDiagnosticPing *)self sockHandle_ipv6] != -1)
  {
    close([(HMFNetworkDiagnosticPing *)self sockHandle_ipv6]);
    [(HMFNetworkDiagnosticPing *)self setSockHandle_ipv6:0xFFFFFFFFLL];
  }
  if ([(HMFNetworkDiagnosticPing *)self socket_ipv4])
  {
    CFSocketInvalidate([(HMFNetworkDiagnosticPing *)self socket_ipv4]);
    [(HMFNetworkDiagnosticPing *)self setSocket_ipv4:0];
  }
  if ([(HMFNetworkDiagnosticPing *)self socket_ipv6])
  {
    CFSocketInvalidate([(HMFNetworkDiagnosticPing *)self socket_ipv6]);
    [(HMFNetworkDiagnosticPing *)self setSocket_ipv6:0];
  }
  id v4 = [(HMFNetworkDiagnostic *)self device];
  [v4 invalidate];

  if ([(HMFNetworkDiagnostic *)self isStarted])
  {
    id v5 = [(HMFNetworkDiagnosticPing *)self pingDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      if (v10)
      {
        id v7 = v10;
      }
      else
      {
        id v8 = [(HMFNetworkDiagnosticPing *)self readPromise];
        if (v8)
        {
          id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:14];
        }
        else
        {
          id v7 = 0;
        }
      }
      v9 = [(HMFNetworkDiagnosticPing *)self pingDelegate];
      [v9 diagnostic:self didCompleteWithError:v7];
    }
  }
  [(HMFNetworkDiagnostic *)self setStarted:0];
}

- (void)stop
{
}

- (id)dumpReport
{
  id v3 = [(HMFNetworkDiagnostic *)self device];
  id v4 = [v3 addresses];
  v67 = objc_msgSend(v4, "na_map:", &__block_literal_global_17_0);

  id v5 = [(HMFNetworkDiagnostic *)self device];
  char v6 = [v5 serviceInfo];

  id v7 = NSString;
  id v8 = [v6 serviceType];
  v9 = [v7 stringWithFormat:@"%@\t\t", v8];

  if (([v6 isHAP] & 1) == 0 && (objc_msgSend(v6, "isAirPlay") & 1) == 0)
  {
    id v10 = NSString;
    id v11 = [v6 serviceType];
    uint64_t v12 = [v10 stringWithFormat:@"%@\t", v11];

    v9 = (void *)v12;
  }
  BOOL v13 = HMFIsCustomerBuild();
  v62 = NSString;
  uint64_t v14 = [v6 deviceID];
  id v15 = (void *)v14;
  uint64_t v16 = @"??:??:??:??:??:??";
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  v61 = v16;
  uint64_t v17 = [v6 category];
  uint64_t v18 = v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"-";
  }
  v60 = v19;
  uint64_t v20 = [v6 stateNumber];
  v64 = (void *)v20;
  if (v20) {
    v21 = (__CFString *)v20;
  }
  else {
    v21 = @"-";
  }
  v59 = v21;
  uint64_t v22 = [v6 configNumber];
  v63 = (void *)v22;
  if (v22) {
    v23 = (__CFString *)v22;
  }
  else {
    v23 = @"-";
  }
  v58 = v23;
  uint64_t v24 = [v6 statusFlag];
  id v25 = (void *)v24;
  if (v24) {
    id v26 = (__CFString *)v24;
  }
  else {
    id v26 = @"-";
  }
  [(HMFNetworkDiagnosticPing *)self runDuration];
  double v28 = v27;
  v65 = (void *)v18;
  if (v13)
  {
    if (v27 < 0.0)
    {
      v66 = @"-";
    }
    else
    {
      v29 = NSString;
      [(HMFNetworkDiagnosticPing *)self runDuration];
      objc_msgSend(v29, "stringWithFormat:", @"%.3fs", v30);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v33 = [v67 count];
    if (v33)
    {
      v34 = [v67 componentsJoinedByString:@","];
    }
    else
    {
      v34 = @"(N/A)";
    }
    v50 = NSNumber;
    v51 = [(HMFNetworkDiagnostic *)self device];
    v52 = objc_msgSend(v50, "numberWithUnsignedShort:", objc_msgSend(v51, "port"));
    v46 = [v62 stringWithFormat:@"%@%@\t%@\t\t%@\t%@\t%@\t%@\t\t (%@) / (%@) / %@ / %@\n", v9, v61, v60, v59, v58, v26, v66, @"<private>", @"<private>", v34, v52];

    if (v33) {
    v48 = v65;
    }
    v47 = v67;
    if (v28 < 0.0) {
      goto LABEL_39;
    }
LABEL_38:

    goto LABEL_39;
  }
  v57 = v9;
  v55 = v26;
  if (v27 < 0.0)
  {
    v66 = @"-";
  }
  else
  {
    id v31 = NSString;
    [(HMFNetworkDiagnosticPing *)self runDuration];
    objc_msgSend(v31, "stringWithFormat:", @"%.3fs", v32);
    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v35 = [v6 model];
  v36 = (void *)v35;
  v37 = @"(N/A)";
  if (v35) {
    v38 = (__CFString *)v35;
  }
  else {
    v38 = @"(N/A)";
  }
  v54 = v38;
  uint64_t v39 = [v6 serviceName];
  v40 = (void *)v39;
  if (v39) {
    v41 = (__CFString *)v39;
  }
  else {
    v41 = @"(N/A)";
  }
  uint64_t v42 = [v67 count];
  v56 = v15;
  if (v42)
  {
    v37 = [v67 componentsJoinedByString:@","];
  }
  v43 = NSNumber;
  v44 = [(HMFNetworkDiagnostic *)self device];
  v45 = objc_msgSend(v43, "numberWithUnsignedShort:", objc_msgSend(v44, "port"));
  v53 = v41;
  v9 = v57;
  v46 = [v62 stringWithFormat:@"%@%@\t%@\t\t%@\t%@\t%@\t%@\t\t (%@) / (%@) / %@ / %@\n", v57, v61, v60, v59, v58, v55, v66, v54, v53, v37, v45];

  if (v42) {
  v47 = v67;
  }
  id v15 = v56;
  v48 = v65;
  if (v28 >= 0.0) {
    goto LABEL_38;
  }
LABEL_39:

  return v46;
}

uint64_t __38__HMFNetworkDiagnosticPing_dumpReport__block_invoke(uint64_t a1, void *a2)
{
  return [a2 addressString];
}

- (id)_configure
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMFNetworkDiagnosticPing *)self addressIPV4];
  if (v3)
  {
  }
  else
  {
    id v4 = [(HMFNetworkDiagnosticPing *)self addressIPV6];

    if (!v4)
    {
      v9 = (void *)MEMORY[0x19F3A87A0]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier(v10);
        BOOL v13 = [(HMFNetworkDiagnostic *)v10 device];
        uint64_t v14 = [v13 shortDescription];
        LODWORD(v19.version) = 138543618;
        *(CFIndex *)((char *)&v19.version + 4) = (CFIndex)v12;
        WORD2(v19.info) = 2114;
        *(void **)((char *)&v19.info + 6) = v14;
        _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_ERROR, "%{public}@No valid address for device: %{public}@", (uint8_t *)&v19, 0x16u);
      }
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = 4;
      goto LABEL_15;
    }
  }
  id v5 = [(HMFNetworkDiagnosticPing *)self addressIPV4];

  if (v5) {
    [(HMFNetworkDiagnosticPing *)self setSockHandle_ipv4:socket(2, 2, 1)];
  }
  char v6 = [(HMFNetworkDiagnosticPing *)self addressIPV6];

  if (v6) {
    [(HMFNetworkDiagnosticPing *)self setSockHandle_ipv6:socket(30, 2, 58)];
  }
  v19.version = 0;
  v19.info = self;
  memset(&v19.retain, 0, 24);
  [(HMFNetworkDiagnosticPing *)self setSocket_ipv4:create_socket([(HMFNetworkDiagnosticPing *)self sockHandle_ipv4], &v19)];
  CFSocketNativeHandle v7 = [(HMFNetworkDiagnosticPing *)self sockHandle_ipv6];
  v19.version = 0;
  v19.info = self;
  memset(&v19.retain, 0, 24);
  [(HMFNetworkDiagnosticPing *)self setSocket_ipv6:create_socket(v7, &v19)];
  if ([(HMFNetworkDiagnosticPing *)self socket_ipv4]
    || [(HMFNetworkDiagnosticPing *)self socket_ipv6])
  {
    id v8 = +[HMFFuture futureWithNoValue];
    goto LABEL_16;
  }
  id v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v16 = 15;
LABEL_15:
  uint64_t v17 = [v15 hmfErrorWithCode:v16];
  id v8 = +[HMFFuture futureWithError:v17];

LABEL_16:
  return v8;
}

- (id)_sendData:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFNetworkDiagnosticPing *)self addressIPV4];
  char v6 = [(HMFNetworkDiagnosticPing *)self _sendData:v4 address:v5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__HMFNetworkDiagnosticPing__sendData___block_invoke_2;
  v13[3] = &unk_1E59585D8;
  v13[4] = self;
  CFSocketNativeHandle v7 = [v6 then:&__block_literal_global_47_0 orRecover:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__HMFNetworkDiagnosticPing__sendData___block_invoke_48;
  v11[3] = &unk_1E5958600;
  v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  v9 = [v7 finally:v11];

  return v9;
}

uint64_t __38__HMFNetworkDiagnosticPing__sendData___block_invoke()
{
  return 1;
}

uint64_t __38__HMFNetworkDiagnosticPing__sendData___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A87A0]();
  id v5 = *(id *)(a1 + 32);
  char v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    CFSocketNativeHandle v7 = HMFGetLogIdentifier(v5);
    id v8 = [*(id *)(a1 + 32) addressIPV4];
    int v10 = 138543874;
    id v11 = v7;
    __int16 v12 = 2114;
    BOOL v13 = v8;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to send data via address: %{public}@ with error: %{public}@", (uint8_t *)&v10, 0x20u);
  }

  return 1;
}

uint64_t __38__HMFNetworkDiagnosticPing__sendData___block_invoke_48(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 addressIPV6];
  id v4 = [v1 _sendData:v2 address:v3];
  if (!v4) {
    _HMFPreconditionFailure(@"future");
  }
  id v5 = v4;

  return 3;
}

- (id)_sendData:(id)a3 address:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    v62 = +[HMFFuture futureWithNoValue];
    goto LABEL_42;
  }
  if ([v7 addressFamily] == 1)
  {
    v9 = [(HMFNetworkDiagnosticPing *)self socket_ipv4];
    if (v9) {
      goto LABEL_4;
    }
LABEL_29:
    v63 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    v62 = +[HMFFuture futureWithError:v63];

    goto LABEL_42;
  }
  v9 = [(HMFNetworkDiagnosticPing *)self socket_ipv6];
  if (!v9) {
    goto LABEL_29;
  }
LABEL_4:
  CFSocketRef v74 = v9;
  uint64_t v10 = [v8 addressFamily];
  if (v10 == 1) {
    int v11 = 8;
  }
  else {
    int v11 = -128;
  }
  LODWORD(v72) = v11;
  id v73 = [v8 dataUsingEncoding:1];
  unsigned int v12 = [(HMFNetworkDiagnosticPing *)self identifier];
  unsigned int v13 = [(HMFNetworkDiagnosticPing *)self sequenceNumber];
  id v75 = v6;
  id v14 = v6;
  id v15 = v14;
  if ((unint64_t)[v14 length] <= 0x37)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA58] dataWithCapacity:56];
    uint64_t v17 = v16;
    if (v14) {
      [v16 appendData:v14];
    }
    uint64_t v18 = [v14 length];
    uint64_t v19 = 56 - v18;
    MEMORY[0x1F4188790](v18, v20, v21);
    v23 = (char *)&v70 - v22;
    RandomBytes();
    uint64_t v24 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:v19];
    [v17 appendData:v24];

    id v15 = (void *)[v17 copy];
  }
  id v25 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v15, "length") + 8);
  if (!v25) {
    __assert_rtn("pingPacketWithType", "HMFNetworkDiagnosticPing.m", 448, "packet");
  }
  id v26 = v25;
  uint64_t v27 = [v26 mutableBytes];
  *(unsigned char *)uint64_t v27 = (_BYTE)v72;
  *(unsigned char *)(v27 + 1) = 0;
  *(_WORD *)(v27 + 2) = 0;
  *(_WORD *)(v27 + 4) = __rev16(v12);
  *(_WORD *)(v27 + 6) = __rev16(v13);
  id v28 = v15;
  memcpy((void *)(v27 + 8), (const void *)[v28 bytes], objc_msgSend(v28, "length"));
  if (v10 != 1) {
    goto LABEL_19;
  }
  id v29 = v26;
  uint64_t v30 = (unsigned __int16 *)[v29 bytes];
  unint64_t v31 = [v29 length];
  if (v31 < 2)
  {
    int v32 = 0;
    if (!v31) {
      goto LABEL_18;
    }
  }
  else
  {
    int v32 = 0;
    do
    {
      int v33 = *v30++;
      v32 += v33;
      v31 -= 2;
    }
    while (v31 > 1);
    if (!v31) {
      goto LABEL_18;
    }
  }
  v32 += *(unsigned __int8 *)v30;
LABEL_18:
  *(_WORD *)(v27 + 2) = ~(HIWORD(v32) + v32 + (((v32 >> 16) + (unsigned __int16)v32) >> 16));
LABEL_19:

  v34 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
  uint64_t v35 = (void *)MEMORY[0x19F3A87A0]();
  v36 = self;
  v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    v38 = HMFGetLogIdentifier(v36);
    uint64_t v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "length"));
    v40 = [(HMFNetworkDiagnostic *)v36 device];
    v41 = [v40 shortDescription];
    *(_DWORD *)buf = 138544130;
    id v77 = v38;
    __int16 v78 = 2112;
    v79 = v39;
    __int16 v80 = 2112;
    v81 = v34;
    __int16 v82 = 2114;
    v83 = v41;
    _os_log_impl(&dword_19D57B000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Sending data (%@: %@) to device: %{public}@", buf, 0x2Au);
  }
  [(HMFNetworkDiagnosticPing *)v36 setReadPromise:0];
  uint64_t v42 = [MEMORY[0x1E4F1C9C8] date];
  [(HMFNetworkDiagnosticPing *)v36 setPingStartDate:v42];

  LODWORD(v42) = CFSocketGetNative(v74);
  id v43 = v26;
  v44 = (const void *)[v43 bytes];
  size_t v45 = [v43 length];
  id v46 = v73;
  v47 = (const sockaddr *)[v46 bytes];
  CFSocketRef v74 = (CFSocketRef)v46;
  ssize_t v48 = sendto((int)v42, v44, v45, 0, v47, [v46 length]);
  uint64_t v49 = [v43 length];
  if (v48 == -1) {
    uint64_t v50 = 6;
  }
  else {
    uint64_t v50 = 15;
  }
  v51 = [MEMORY[0x1E4F1C9C8] now];
  v52 = [(HMFNetworkDiagnosticPing *)v36 pingStartDate];
  [v51 timeIntervalSinceDate:v52];
  uint64_t v54 = v53;

  v55 = (void *)MEMORY[0x19F3A87A0]();
  v56 = v36;
  v57 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    v70 = v55;
    v72 = v34;
    HMFGetLogIdentifier(v56);
    id v73 = (id)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "length"));
    v59 = [(HMFNetworkDiagnostic *)v56 device];
    v60 = [v59 shortDescription];
    uint64_t v71 = v50;
    if (v48 == v49)
    {
      v61 = 0;
    }
    else
    {
      v61 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:v50];
    }
    *(_DWORD *)buf = 138544386;
    id v77 = v73;
    __int16 v78 = 2112;
    v79 = v58;
    __int16 v80 = 2114;
    v81 = v60;
    __int16 v82 = 2114;
    v83 = v61;
    __int16 v84 = 2048;
    uint64_t v85 = v54;
    _os_log_impl(&dword_19D57B000, v57, OS_LOG_TYPE_INFO, "%{public}@Sent data (%@) to device: %{public}@ with error: %{public}@. Duration: %.3fs", buf, 0x34u);
    if (v48 != v49) {

    }
    uint64_t v50 = v71;
    v34 = v72;
    v55 = v70;
  }

  int v64 = [(HMFNetworkDiagnosticPing *)v56 sequenceNumber];
  int v65 = v64 + 1;
  uint64_t v66 = (unsigned __int16)(v64 + 1);
  [(HMFNetworkDiagnosticPing *)v56 setSequenceNumber:v66];
  if (v66 != v65) {
    [(HMFNetworkDiagnosticPing *)v56 setSequenceNumber:0];
  }
  if (v48 == v49)
  {
    v67 = +[HMFFuture futureWithPromise:&v56->_readPromise];
    [v67 timeout:1.0];
  }
  else
  {
    v67 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:v50];
    +[HMFFuture futureWithError:v67];
  v62 = };
  CFSocketRef v68 = v74;

  id v6 = v75;
LABEL_42:

  return v62;
}

- (void)_readDataFromSocket:(__CFSocket *)a3
{
  id v3 = (void *)MEMORY[0x1F4188790](self, a2, a3);
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  *(void *)&v49.sa_len = 0;
  *(void *)&v49.sa_data[6] = 0;
  socklen_t v40 = 16;
  CFSocketNativeHandle Native = CFSocketGetNative(v4);
  ssize_t v6 = recvfrom(Native, v50, 0xFFFFuLL, 0, &v49, &v40);
  if ((v6 & 0x8000000000000000) == 0)
  {
    ssize_t v7 = v6;
    id v8 = [MEMORY[0x1E4F1C9C8] now];
    v9 = [v3 pingStartDate];
    [v8 timeIntervalSinceDate:v9];
    double v11 = v10;

    unsigned int v12 = [MEMORY[0x1E4F1CA58] dataWithBytes:v50 length:v7];
    unsigned int v13 = [[HMFNetAddress alloc] initWithSocketAddress:&v49];
    if ([(HMFNetAddress *)v13 addressFamily] == 1)
    {
      int v14 = [v3 identifier];
      id v15 = v12;
      if ((unint64_t)[v15 length] < 0x1C
        || (id v16 = v15, v17 = (unsigned char *)[v16 bytes], (*v17 & 0xF0) != 0x40)
        || v17[9] != 1
        || (uint64_t v18 = 4 * (*v17 & 0xF), [v16 length] < (unint64_t)(v18 + 8)))
      {

        goto LABEL_36;
      }

      id v15 = v16;
      v34 = (unsigned __int16 *)([v15 mutableBytes] + v18);
      if (*(unsigned char *)v34 || *((unsigned char *)v34 + 1)) {
        goto LABEL_36;
      }
      int v35 = v34[1];
      v34[1] = 0;
      unint64_t v36 = [v15 length] - v18;
      if (v36 < 2)
      {
        int v37 = 0;
        v38 = v34;
      }
      else
      {
        int v37 = 0;
        v38 = v34;
        do
        {
          int v39 = *v38++;
          v37 += v39;
          v36 -= 2;
        }
        while (v36 > 1);
      }
      if (v36) {
        v37 += *(unsigned __int8 *)v38;
      }
      v34[1] = v35;
      if (v35 != (unsigned __int16)~(HIWORD(v37) + v37 + (((v37 >> 16) + (unsigned __int16)v37) >> 16))
        || v14 != bswap32(v34[2]) >> 16)
      {
        goto LABEL_36;
      }
      uint64_t v25 = 28;
    }
    else
    {
      if ([(HMFNetAddress *)v13 addressFamily] != 2)
      {
LABEL_37:

        return;
      }
      int v23 = [v3 identifier];
      id v15 = v12;
      if ((unint64_t)[v15 length] < 8
        || (id v15 = v15, v24 = (unsigned __int8 *)[v15 bytes], *v24 != 129)
        || v24[1]
        || v23 != bswap32(*((unsigned __int16 *)v24 + 2)) >> 16)
      {
LABEL_36:

        goto LABEL_37;
      }
      uint64_t v25 = 8;
    }
    objc_msgSend(v12, "replaceBytesInRange:withBytes:length:", 0, v25, 0, 0);

    id v15 = (id)[[NSString alloc] initWithData:v12 encoding:4];
    id v26 = (void *)MEMORY[0x19F3A87A0]();
    id v27 = v3;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v27);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = v15;
      if (!v15)
      {
        uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
      }
      unint64_t v31 = [v27 device];
      int v32 = [v31 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v42 = v29;
      __int16 v43 = 2112;
      v44 = v30;
      __int16 v45 = 2114;
      id v46 = v32;
      __int16 v47 = 2048;
      double v48 = v11;
      _os_log_impl(&dword_19D57B000, v28, OS_LOG_TYPE_INFO, "%{public}@Receive data (%@) from device: %{public}@. Duration: %.3fs", buf, 0x2Au);

      if (!v15) {
    }
      }

    [v27 setRunDuration:v11];
    int v33 = [v27 readPromise];
    [v33 fulfillWithNoValue];

    [v27 setReadPromise:0];
    goto LABEL_36;
  }
  uint64_t v19 = (void *)MEMORY[0x19F3A87A0]();
  id v20 = v3;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = HMFGetLogIdentifier(v20);
    *(_DWORD *)buf = 138543362;
    id v42 = v22;
    _os_log_impl(&dword_19D57B000, v21, OS_LOG_TYPE_ERROR, "%{public}@Receive invalid data", buf, 0xCu);
  }
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned __int16)a3
{
  self->_identifier = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned __int16)a3
{
  self->_sequenceNumber = a3;
}

- (double)runDuration
{
  return self->_runDuration;
}

- (void)setRunDuration:(double)a3
{
  self->_runDuration = a3;
}

- (int)sockHandle_ipv4
{
  return self->_sockHandle_ipv4;
}

- (void)setSockHandle_ipv4:(int)a3
{
  self->_sockHandle_ipCFSocketRef v4 = a3;
}

- (int)sockHandle_ipv6
{
  return self->_sockHandle_ipv6;
}

- (void)setSockHandle_ipv6:(int)a3
{
  self->_sockHandle_ipssize_t v6 = a3;
}

- (__CFSocket)socket_ipv4
{
  return self->_socket_ipv4;
}

- (void)setSocket_ipv4:(__CFSocket *)a3
{
  self->_socket_ipCFSocketRef v4 = a3;
}

- (__CFSocket)socket_ipv6
{
  return self->_socket_ipv6;
}

- (void)setSocket_ipv6:(__CFSocket *)a3
{
  self->_socket_ipssize_t v6 = a3;
}

- (NSDate)pingStartDate
{
  return self->_pingStartDate;
}

- (void)setPingStartDate:(id)a3
{
}

- (HMFPromise)readPromise
{
  return self->_readPromise;
}

- (void)setReadPromise:(id)a3
{
}

- (HMFPromise)delayPromise
{
  return self->_delayPromise;
}

- (void)setDelayPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayPromise, 0);
  objc_storeStrong((id *)&self->_readPromise, 0);
  objc_storeStrong((id *)&self->_pingStartDate, 0);
}

@end