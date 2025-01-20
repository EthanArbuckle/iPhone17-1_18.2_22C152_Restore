@interface CUNetLinkEndpoint
- ($9D4F243E34B80324A1B90A38B57CFE16)ipAddr;
- (BOOL)isClient;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)stateChangedHandler;
- (int)state;
- (void)setIpAddr:(id *)a3;
- (void)setStateChangedHandler:(id)a3;
@end

@implementation CUNetLinkEndpoint

- (void).cxx_destruct
{
}

- (void)setStateChangedHandler:(id)a3
{
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (int)state
{
  return self->_state;
}

- (BOOL)isClient
{
  return self->_client;
}

- (void)setIpAddr:(id *)a3
{
  sockaddr var0 = a3->var0;
  *(in6_addr *)((char *)&self->_ipAddr.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_ipAddr.sa = var0;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)ipAddr
{
  retstr->sockaddr var0 = (sockaddr)self->var2.sin6_addr;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self->var2.sin6_addr + 12);
  return self;
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v75 = 0;
  NSAppendPrintF(&v75, (uint64_t)"CUNetLinkEndpoint %##a", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)&self->_ipAddr);
  v16 = v75;
  CFMutableStringRef v74 = v16;
  uint64_t state = self->_state;
  if (state > 3) {
    v18 = "?";
  }
  else {
    v18 = off_1E55BED38[state];
  }
  NSAppendPrintF(&v74, (uint64_t)", St %s", v10, v11, v12, v13, v14, v15, (uint64_t)v18);
  v19 = v74;

  CFMutableStringRef v73 = v19;
  NSAppendPrintF(&v73, (uint64_t)", StCh %u", v20, v21, v22, v23, v24, v25, self->_stateChanges);
  v26 = v73;

  if (self->_expiredTicks)
  {
    CFMutableStringRef v72 = v26;
    uint64_t v33 = mach_absolute_time();
    unint64_t v65 = UpTicksToSeconds(v33 - self->_expiredTicks);
    v34 = &v72;
    NSAppendPrintF(&v72, (uint64_t)", Expired %llu secs ago", v35, v36, v37, v38, v39, v40, v65);
  }
  else
  {
    CFMutableStringRef v71 = v26;
    v34 = &v71;
    NSAppendPrintF(&v71, (uint64_t)", Expired No", v27, v28, v29, v30, v31, v32, v64);
  }
  v41 = *v34;

  v70.tv_sec = 0;
  *(void *)&v70.tv_usec = 0;
  gettimeofday(&v70, 0);
  CFMutableStringRef v69 = v41;
  NSAppendPrintF(&v69, (uint64_t)", Expire %lld", v42, v43, v44, v45, v46, v47, self->_expireTime - v70.tv_sec);
  v48 = v69;

  CFMutableStringRef v68 = v48;
  NSAppendPrintF(&v68, (uint64_t)", Probes %u", v49, v50, v51, v52, v53, v54, self->_seqNum);
  v55 = v68;

  if (a3 <= 20)
  {
    CFMutableStringRef v67 = v55;
    NSAppendPrintF(&v67, (uint64_t)"\n", v56, v57, v58, v59, v60, v61, v66);
    v62 = v67;

    v55 = v62;
  }
  return v55;
}

- (id)description
{
  return [(CUNetLinkEndpoint *)self descriptionWithLevel:50];
}

@end