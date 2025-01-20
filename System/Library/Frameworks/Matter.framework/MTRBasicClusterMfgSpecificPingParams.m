@interface MTRBasicClusterMfgSpecificPingParams
- (MTRBasicClusterMfgSpecificPingParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRBasicClusterMfgSpecificPingParams

- (MTRBasicClusterMfgSpecificPingParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRBasicClusterMfgSpecificPingParams;
  v2 = [(MTRBasicClusterMfgSpecificPingParams *)&v7 init];
  v3 = v2;
  if (v2)
  {
    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRBasicClusterMfgSpecificPingParams);
  objc_super v7 = objc_msgSend_timedInvokeTimeoutMs(self, v5, v6);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_serverSideProcessingTimeout(self, v9, v10);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v6 = objc_msgSend_stringWithFormat_(v2, v5, @"<%@: >", v4);

  return v6;
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);

  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
}

- (id)_encodeAsDataValue:(id *)a3
{
  if (a3)
  {
    LODWORD(v5) = 3;
    *((void *)&v5 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP"
                           "/zap-generated/MTRCommandPayloadsObjc.mm";
    int v6 = 40968;
    sub_244B26908((uint64_t)MTRError, &v5);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end