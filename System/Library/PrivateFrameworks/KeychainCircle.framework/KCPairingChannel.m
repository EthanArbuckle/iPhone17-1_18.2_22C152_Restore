@interface KCPairingChannel
+ (BOOL)_isRetryableNSURLError:(id)a3;
+ (BOOL)isSupportedPlatform;
+ (BOOL)retryable:(id)a3;
+ (id)pairingChannelAcceptor:(id)a3;
+ (id)pairingChannelCompressData:(id)a3;
+ (id)pairingChannelDecompressData:(id)a3;
+ (id)pairingChannelInitiator:(id)a3;
- (BOOL)acceptorWillSendInitialSyncCredentials;
- (BOOL)acceptorWillSendPCSData;
- (BOOL)createTempPacketAndCheckSize:(id)a3 pcsItem:(id)a4 octagonData:(id)a5 keyForItem:(id)a6 error:(id *)a7;
- (BOOL)ensureControlChannel;
- (BOOL)fetchEpoch:(id)a3 error:(id *)a4;
- (BOOL)fetchPrepare:(id *)a3 application:(id)a4 error:(id *)a5;
- (BOOL)fetchVoucher:(id)a3 prepare:(id)a4 eventS:(id)a5 finishedPairing:(BOOL *)a6 maxCapability:(id)a7 error:(id *)a8;
- (BOOL)grabbedLockAssertion;
- (BOOL)initiator;
- (BOOL)initiatorExpectPCSData;
- (BOOL)isPacketSizeAcceptable:(id)a3 error:(id *)a4;
- (BOOL)join:(id *)a3 voucher:(id)a4 eventS:(id)a5 setupPairingChannelSignPost:(octagon_signpost_s)a6 finishPairing:(BOOL *)a7 error:(id *)a8;
- (BOOL)needInitialSync;
- (BOOL)populateKeychainForTestingWithNumberOfKeychainItems:(int)a3;
- (BOOL)populateKeychainWithLargeItemsForTestingWithCount:(int)a3;
- (BOOL)populateKeychainWithMixedLargeItemsForTestingWithCount:(int)a3;
- (BOOL)populateKeychainWithTooLargeItemsForTestingWithCount:(int)a3;
- (BOOL)sessionSupportsOctagon;
- (BOOL)sessionSupportsSOS;
- (BOOL)testFailOctagon;
- (BOOL)testFailSOS;
- (KCPairingChannelContext)peerVersionContext;
- (NSArray)allPCSItems;
- (NSNumber)ackNumber;
- (NSNumber)countOfReceivedItems;
- (NSNumber)countOfSentItems;
- (NSNumber)sizeOfPacket;
- (NSString)altDSID;
- (NSString)dsidForTest;
- (NSXPCConnection)connection;
- (OTControl)otControl;
- (OTControlArguments)controlArguments;
- (OTJoiningConfiguration)joiningConfiguration;
- (id)copySubsetFrom:(id)a3 begin:(unint64_t)a4 end:(unint64_t)a5;
- (id)createPacket:(id)a3 results:(id)a4 endSession:(BOOL)a5;
- (id)createTempPacket:(id)a3 pcsItem:(id)a4 octagonData:(id)a5 keyForItem:(id)a6;
- (id)evaluateResults:(void *)a3;
- (id)exchangePacket:(id)a3 complete:(BOOL *)a4 error:(id *)a5;
- (id)formNextPacket;
- (id)initAsInitiator:(BOOL)a3 version:(id)a4;
- (id)nextOctagonState;
- (id)nextState;
- (id)updateItem:(id)a3;
- (int)fetchCountOfReceivedItemsForTesting;
- (int)fetchCountOfSentItemsForTesting;
- (int)fetchPCSItems:(const void *)a3;
- (unint64_t)fetchNumberOfPCSKeychainItems;
- (unint64_t)fetchSizeOfPacketForTesting;
- (unint64_t)itemIndex;
- (unsigned)acceptorInitialSyncCredentialsFlags;
- (unsigned)counter;
- (void)acceptorFirstOctagonPacket:(id)a3 reply:(id)a4 complete:(id)a5;
- (void)acceptorFirstPacket:(id)a3 complete:(id)a4;
- (void)acceptorPCSDataPacket:(id)a3 complete:(id)a4;
- (void)acceptorSecondOctagonPacket:(id)a3 reply:(id)a4 complete:(id)a5;
- (void)acceptorSecondPacket:(id)a3 complete:(id)a4;
- (void)acceptorThirdPacket:(id)a3 complete:(id)a4;
- (void)acceptorWaitForAck:(id)a3 complete:(id)a4;
- (void)exchangePacket:(id)a3 complete:(id)a4;
- (void)initiatorCompleteSecondPacketOctagon:(id)a3 application:(id)a4 complete:(id)a5;
- (void)initiatorCompleteSecondPacketWithSOS:(id)a3 complete:(id)a4;
- (void)initiatorFirstPacket:(id)a3 complete:(id)a4;
- (void)initiatorFourthPacket:(id)a3 complete:(id)a4;
- (void)initiatorPCSDataPacket:(id)a3 complete:(id)a4;
- (void)initiatorSecondPacket:(id)a3 complete:(id)a4;
- (void)initiatorThirdPacket:(id)a3 complete:(id)a4;
- (void)oneStepTooMany:(id)a3 complete:(id)a4;
- (void)setAcceptorInitialSyncCredentialsFlags:(unsigned int)a3;
- (void)setAcceptorWillSendInitialSyncCredentials:(BOOL)a3;
- (void)setAcceptorWillSendPCSData:(BOOL)a3;
- (void)setAckNumber:(id)a3;
- (void)setAllPCSItems:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setControlArguments:(id)a3;
- (void)setCountOfReceivedItems:(id)a3;
- (void)setCountOfSentItems:(id)a3;
- (void)setCounter:(unsigned int)a3;
- (void)setDsidForTest:(id)a3;
- (void)setGrabbedLockAssertion:(BOOL)a3;
- (void)setInitiator:(BOOL)a3;
- (void)setInitiatorExpectPCSData:(BOOL)a3;
- (void)setItemIndex:(unint64_t)a3;
- (void)setJoiningConfiguration:(id)a3;
- (void)setNextOctagonState:(id)a3;
- (void)setNextState:(id)a3;
- (void)setNextStateError:(id)a3 complete:(id)a4;
- (void)setOtControl:(id)a3;
- (void)setPeerVersionContext:(id)a3;
- (void)setSessionSupportsOctagon:(BOOL)a3;
- (void)setSessionSupportsSOS:(BOOL)a3;
- (void)setSizeOfPacket:(id)a3;
- (void)setTestFailOctagon:(BOOL)a3;
- (void)setTestFailSOS:(BOOL)a3;
- (void)validateStart:(id)a3;
- (void)waitForOctagonUpgrade;
@end

@implementation KCPairingChannel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_controlArguments, 0);
  objc_storeStrong((id *)&self->_joiningConfiguration, 0);
  objc_storeStrong(&self->_nextState, 0);
  objc_storeStrong(&self->_nextOctagonState, 0);
  objc_storeStrong((id *)&self->_otControl, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sizeOfPacket, 0);
  objc_storeStrong((id *)&self->_countOfSentItems, 0);
  objc_storeStrong((id *)&self->_countOfReceivedItems, 0);
  objc_storeStrong((id *)&self->_allPCSItems, 0);
  objc_storeStrong((id *)&self->_ackNumber, 0);
  objc_storeStrong((id *)&self->_dsidForTest, 0);
  objc_storeStrong((id *)&self->_peerVersionContext, 0);
}

- (void)setSessionSupportsOctagon:(BOOL)a3
{
  self->_sessionSupportsOctagon = a3;
}

- (BOOL)sessionSupportsOctagon
{
  return self->_sessionSupportsOctagon;
}

- (void)setSessionSupportsSOS:(BOOL)a3
{
  self->_sessionSupportsSOS = a3;
}

- (BOOL)sessionSupportsSOS
{
  return self->_sessionSupportsSOS;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setTestFailOctagon:(BOOL)a3
{
  self->_testFailOctagon = a3;
}

- (BOOL)testFailOctagon
{
  return self->_testFailOctagon;
}

- (void)setTestFailSOS:(BOOL)a3
{
  self->_testFailSOS = a3;
}

- (BOOL)testFailSOS
{
  return self->_testFailSOS;
}

- (void)setControlArguments:(id)a3
{
}

- (OTControlArguments)controlArguments
{
  return self->_controlArguments;
}

- (void)setJoiningConfiguration:(id)a3
{
}

- (OTJoiningConfiguration)joiningConfiguration
{
  return self->_joiningConfiguration;
}

- (void)setNextState:(id)a3
{
}

- (id)nextState
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setNextOctagonState:(id)a3
{
}

- (id)nextOctagonState
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setOtControl:(id)a3
{
}

- (OTControl)otControl
{
  return (OTControl *)objc_getProperty(self, a2, 104, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSizeOfPacket:(id)a3
{
}

- (NSNumber)sizeOfPacket
{
  return self->_sizeOfPacket;
}

- (void)setCountOfSentItems:(id)a3
{
}

- (NSNumber)countOfSentItems
{
  return self->_countOfSentItems;
}

- (void)setCountOfReceivedItems:(id)a3
{
}

- (NSNumber)countOfReceivedItems
{
  return self->_countOfReceivedItems;
}

- (void)setGrabbedLockAssertion:(BOOL)a3
{
  self->_grabbedLockAssertion = a3;
}

- (BOOL)grabbedLockAssertion
{
  return self->_grabbedLockAssertion;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndex = a3;
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setAllPCSItems:(id)a3
{
}

- (NSArray)allPCSItems
{
  return self->_allPCSItems;
}

- (void)setAckNumber:(id)a3
{
}

- (NSNumber)ackNumber
{
  return self->_ackNumber;
}

- (void)setDsidForTest:(id)a3
{
}

- (NSString)dsidForTest
{
  return self->_dsidForTest;
}

- (void)setInitiatorExpectPCSData:(BOOL)a3
{
  self->_initiatorExpectPCSData = a3;
}

- (BOOL)initiatorExpectPCSData
{
  return self->_initiatorExpectPCSData;
}

- (void)setAcceptorWillSendPCSData:(BOOL)a3
{
  self->_acceptorWillSendPCSData = a3;
}

- (BOOL)acceptorWillSendPCSData
{
  return self->_acceptorWillSendPCSData;
}

- (void)setAcceptorInitialSyncCredentialsFlags:(unsigned int)a3
{
  self->_acceptorInitialSyncCredentialsFlags = a3;
}

- (unsigned)acceptorInitialSyncCredentialsFlags
{
  return self->_acceptorInitialSyncCredentialsFlags;
}

- (void)setAcceptorWillSendInitialSyncCredentials:(BOOL)a3
{
  self->_acceptorWillSendInitialSyncCredentials = a3;
}

- (BOOL)acceptorWillSendInitialSyncCredentials
{
  return self->_acceptorWillSendInitialSyncCredentials;
}

- (void)setCounter:(unsigned int)a3
{
  self->_counter = a3;
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setInitiator:(BOOL)a3
{
  self->_initiator = a3;
}

- (BOOL)initiator
{
  return self->_initiator;
}

- (void)setPeerVersionContext:(id)a3
{
}

- (KCPairingChannelContext)peerVersionContext
{
  return self->_peerVersionContext;
}

- (BOOL)needInitialSync
{
  return self->_needInitialSync;
}

- (unint64_t)fetchSizeOfPacketForTesting
{
  v2 = [(KCPairingChannel *)self sizeOfPacket];
  unint64_t v3 = (int)[v2 intValue];

  return v3;
}

- (unint64_t)fetchNumberOfPCSKeychainItems
{
  v13[8] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F171D8];
  uint64_t v3 = *MEMORY[0x263F17580];
  v12[0] = *MEMORY[0x263F171B8];
  v12[1] = v3;
  v13[0] = v2;
  v13[1] = MEMORY[0x263EFFA88];
  uint64_t v4 = *MEMORY[0x263F16E80];
  v12[2] = *MEMORY[0x263F170B0];
  v12[3] = v4;
  v13[2] = MEMORY[0x263EFFA88];
  v13[3] = @"com.apple.ProtectedCloudStorage";
  uint64_t v5 = *MEMORY[0x263F17400];
  v12[4] = *MEMORY[0x263F17088];
  v12[5] = v5;
  uint64_t v6 = *MEMORY[0x263F17408];
  v13[4] = @"123456";
  v13[5] = v6;
  uint64_t v7 = *MEMORY[0x263F17520];
  v12[6] = *MEMORY[0x263F17518];
  v12[7] = v7;
  v13[6] = MEMORY[0x263EFFA88];
  v13[7] = MEMORY[0x263EFFA88];
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:8];
  v11 = 0;
  SecItemCopyMatching(v8, (CFTypeRef *)&v11);
  unint64_t v9 = [v11 count];

  return v9;
}

- (BOOL)populateKeychainWithMixedLargeItemsForTestingWithCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v29[7] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:196608];
  uint64_t v5 = (const __SecRandom *)*MEMORY[0x263F17510];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, 0x30000uLL, (void *)[v6 mutableBytes]))
  {
    char v7 = 0;
  }
  else
  {
    id v8 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:0x100000];
    if (SecRandomCopyBytes(v5, 0x100000uLL, (void *)[v8 mutableBytes]))
    {
      char v7 = 0;
    }
    else if ((int)v3 < 1)
    {
      char v7 = 1;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v26 = *MEMORY[0x263F171B8];
      uint64_t v25 = *MEMORY[0x263F171D8];
      uint64_t v24 = *MEMORY[0x263F17580];
      uint64_t v23 = *MEMORY[0x263F170B0];
      uint64_t v22 = *MEMORY[0x263F16E80];
      uint64_t v21 = *MEMORY[0x263F17088];
      char v7 = 1;
      uint64_t v20 = *MEMORY[0x263F16ED8];
      uint64_t v19 = *MEMORY[0x263F175A8];
      do
      {
        if (v9) {
          v10 = v6;
        }
        else {
          v10 = v8;
        }
        uint64_t v11 = v3;
        id v12 = v10;
        v28[0] = v26;
        v28[1] = v24;
        v29[0] = v25;
        v29[1] = MEMORY[0x263EFFA88];
        v29[2] = MEMORY[0x263EFFA88];
        v28[2] = v23;
        v28[3] = v22;
        v29[3] = @"com.apple.ProtectedCloudStorage";
        v29[4] = @"123456";
        v28[4] = v21;
        v28[5] = v20;
        v13 = NSString;
        v14 = [MEMORY[0x263F08C38] UUID];
        v15 = [v14 UUIDString];
        v16 = [v13 stringWithFormat:@"%@-%d", v15, v9];
        v28[6] = v19;
        v29[5] = v16;
        v29[6] = v12;
        CFDictionaryRef v17 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:7];

        CFTypeRef result = 0;
        v7 &= SecItemAdd(v17, &result) == 0;

        uint64_t v3 = v11;
        uint64_t v9 = (v9 + 1);
      }
      while (v11 != v9);
    }
  }
  return v7;
}

- (BOOL)populateKeychainWithTooLargeItemsForTestingWithCount:(int)a3
{
  v26[7] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:0x100000];
  uint64_t v5 = (const __SecRandom *)*MEMORY[0x263F17510];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, 0x100000uLL, (void *)[v6 mutableBytes]))
  {
    char v7 = 0;
  }
  else if (a3 < 1)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v23 = *MEMORY[0x263F171B8];
    uint64_t v22 = *MEMORY[0x263F171D8];
    uint64_t v21 = *MEMORY[0x263F17580];
    uint64_t v20 = *MEMORY[0x263F170B0];
    uint64_t v19 = *MEMORY[0x263F16E80];
    uint64_t v18 = *MEMORY[0x263F17088];
    char v7 = 1;
    uint64_t v17 = *MEMORY[0x263F16ED8];
    uint64_t v9 = *MEMORY[0x263F175A8];
    uint64_t v10 = MEMORY[0x263EFFA88];
    do
    {
      v25[0] = v23;
      v25[1] = v21;
      v26[0] = v22;
      v26[1] = v10;
      v25[2] = v20;
      v25[3] = v19;
      v26[2] = v10;
      v26[3] = @"com.apple.ProtectedCloudStorage";
      v26[4] = @"123456";
      v25[4] = v18;
      v25[5] = v17;
      uint64_t v11 = NSString;
      id v12 = [MEMORY[0x263F08C38] UUID];
      v13 = [v12 UUIDString];
      v14 = [v11 stringWithFormat:@"%@-%d", v13, v8];
      v25[6] = v9;
      v26[5] = v14;
      v26[6] = v6;
      CFDictionaryRef v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:7];

      CFTypeRef result = 0;
      v7 &= SecItemAdd(v15, &result) == 0;

      uint64_t v8 = (v8 + 1);
    }
    while (a3 != v8);
  }

  return v7;
}

- (BOOL)populateKeychainWithLargeItemsForTestingWithCount:(int)a3
{
  v26[7] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:203161];
  uint64_t v5 = (const __SecRandom *)*MEMORY[0x263F17510];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, 0x31999uLL, (void *)[v6 mutableBytes]))
  {
    char v7 = 0;
  }
  else if (a3 < 1)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v23 = *MEMORY[0x263F171B8];
    uint64_t v22 = *MEMORY[0x263F171D8];
    uint64_t v21 = *MEMORY[0x263F17580];
    uint64_t v20 = *MEMORY[0x263F170B0];
    uint64_t v19 = *MEMORY[0x263F16E80];
    uint64_t v18 = *MEMORY[0x263F17088];
    char v7 = 1;
    uint64_t v17 = *MEMORY[0x263F16ED8];
    uint64_t v9 = *MEMORY[0x263F175A8];
    uint64_t v10 = MEMORY[0x263EFFA88];
    do
    {
      v25[0] = v23;
      v25[1] = v21;
      v26[0] = v22;
      v26[1] = v10;
      v25[2] = v20;
      v25[3] = v19;
      v26[2] = v10;
      v26[3] = @"com.apple.ProtectedCloudStorage";
      v26[4] = @"123456";
      v25[4] = v18;
      v25[5] = v17;
      uint64_t v11 = NSString;
      id v12 = [MEMORY[0x263F08C38] UUID];
      v13 = [v12 UUIDString];
      v14 = [v11 stringWithFormat:@"%@-%d", v13, v8];
      v25[6] = v9;
      v26[5] = v14;
      v26[6] = v6;
      CFDictionaryRef v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:7];

      CFTypeRef result = 0;
      v7 &= SecItemAdd(v15, &result) == 0;

      uint64_t v8 = (v8 + 1);
    }
    while (a3 != v8);
  }

  return v7;
}

- (BOOL)populateKeychainForTestingWithNumberOfKeychainItems:(int)a3
{
  v24[7] = *MEMORY[0x263EF8340];
  if (a3 < 1) {
    return 1;
  }
  uint64_t v4 = 0;
  uint64_t v21 = *MEMORY[0x263F171B8];
  uint64_t v20 = *MEMORY[0x263F171D8];
  uint64_t v19 = *MEMORY[0x263F17580];
  uint64_t v18 = *MEMORY[0x263F170B0];
  uint64_t v17 = *MEMORY[0x263F16E80];
  uint64_t v16 = *MEMORY[0x263F17088];
  char v5 = 1;
  uint64_t v15 = *MEMORY[0x263F16ED8];
  uint64_t v6 = *MEMORY[0x263F175A8];
  uint64_t v7 = MEMORY[0x263EFFA88];
  do
  {
    v23[0] = v21;
    v23[1] = v19;
    v24[0] = v20;
    v24[1] = v7;
    v23[2] = v18;
    v23[3] = v17;
    v24[2] = v7;
    v24[3] = @"com.apple.ProtectedCloudStorage";
    v24[4] = @"123456";
    v23[4] = v16;
    v23[5] = v15;
    uint64_t v8 = NSString;
    uint64_t v9 = [MEMORY[0x263F08C38] UUID];
    uint64_t v10 = [v9 UUIDString];
    uint64_t v11 = [v8 stringWithFormat:@"%@-%d", v10, v4];
    v24[5] = v11;
    v23[6] = v6;
    id v12 = [@"zesty" dataUsingEncoding:4];
    v24[6] = v12;
    CFDictionaryRef v13 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7];

    CFTypeRef result = 0;
    v5 &= SecItemAdd(v13, &result) == 0;

    uint64_t v4 = (v4 + 1);
  }
  while (a3 != v4);
  return v5;
}

- (int)fetchCountOfSentItemsForTesting
{
  uint64_t v2 = [(KCPairingChannel *)self countOfSentItems];
  int v3 = [v2 intValue];

  return v3;
}

- (int)fetchCountOfReceivedItemsForTesting
{
  uint64_t v2 = [(KCPairingChannel *)self countOfReceivedItems];
  int v3 = [v2 intValue];

  return v3;
}

- (id)exchangePacket:(id)a3 complete:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__KCPairingChannel_exchangePacket_complete_error___block_invoke;
  v13[3] = &unk_264314A40;
  uint64_t v16 = &v18;
  uint64_t v17 = a4;
  uint64_t v15 = &v24;
  uint64_t v10 = v9;
  v14 = v10;
  [(KCPairingChannel *)self exchangePacket:v8 complete:v13];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v19[5];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __50__KCPairingChannel_exchangePacket_complete_error___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  **(unsigned char **)(a1 + 56) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)exchangePacket:(id)a3 complete:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v21 = [(KCPairingChannel *)self counter];
    _os_log_impl(&dword_218274000, v8, OS_LOG_TYPE_DEFAULT, "Exchange packet: %u", buf, 8u);
  }

  [(KCPairingChannel *)self setCounter:[(KCPairingChannel *)self counter] + 1];
  if (!v6)
  {
    id v12 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = [(id)objc_opt_class() pairingChannelDecompressData:v6];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    id v19 = 0;
    uint64_t v11 = [MEMORY[0x263F08AC0] propertyListWithData:v9 options:512 format:0 error:&v19];
    if (v11)
    {
      id v12 = (void *)v11;

LABEL_8:
      id v13 = [(KCPairingChannel *)self nextState];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __44__KCPairingChannel_exchangePacket_complete___block_invoke;
      v17[3] = &unk_264314A18;
      v17[4] = self;
      id v18 = v7;
      ((void (**)(void, void *, void *))v13)[2](v13, v12, v17);

      goto LABEL_15;
    }
    id v15 = v19;
    uint64_t v16 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218274000, v16, OS_LOG_TYPE_DEFAULT, "failed to deserialize", buf, 2u);
    }

    (*((void (**)(id, uint64_t, void, id))v7 + 2))(v7, 1, 0, v15);
  }
  else
  {
    id v14 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218274000, v14, OS_LOG_TYPE_DEFAULT, "failed to decompress", buf, 2u);
    }

    (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, 1, 0, 0);
  }
LABEL_15:
}

void __44__KCPairingChannel_exchangePacket_complete___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = 0;
    uint64_t v11 = 0;
    goto LABEL_16;
  }
  id v21 = 0;
  id v8 = [MEMORY[0x263F08AC0] dataWithPropertyList:v6 format:200 options:0 error:&v21];
  id v9 = v21;
  uint64_t v10 = v9;
  if (v7 && !v8)
  {
    uint64_t v11 = 0;
    id v12 = v7;
    id v7 = v9;
LABEL_13:

    goto LABEL_15;
  }
  if (!v8)
  {
    uint64_t v11 = 0;
    goto LABEL_15;
  }
  uint64_t v11 = [(id)objc_opt_class() pairingChannelCompressData:v8];
  if (v11)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = "initiator";
    if (!*(unsigned char *)(v13 + 9)) {
      id v14 = "acceptor";
    }
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.ckks.pairing.packet-size.%s.%u", v14, *(unsigned int *)(v13 + 20));
    uint64_t v20 = (void *)MEMORY[0x263F16D68];
    uint64_t v24 = *MEMORY[0x263F16DC8];
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
    v25[0] = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [v20 sendEvent:v12 event:v16];

    uint64_t v17 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v11 length];
      *(_DWORD *)buf = 134217984;
      v23[0] = v18;
      _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "pairing packet size %lu", buf, 0xCu);
    }

    goto LABEL_13;
  }
LABEL_15:

LABEL_16:
  id v19 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v23[0]) = v8 != 0;
    WORD2(v23[0]) = 2112;
    *(void *)((char *)v23 + 6) = v7;
    _os_log_impl(&dword_218274000, v19, OS_LOG_TYPE_DEFAULT, "Exchange packet complete data: %{BOOL}d: %@", buf, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)validateStart:(id)a3
{
  id v4 = a3;
  if ([(KCPairingChannel *)self initiator])
  {
    char v5 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__KCPairingChannel_validateStart___block_invoke_3;
    block[3] = &unk_2643149F0;
    id v6 = &v13;
    id v13 = v4;
    id v7 = v4;
    dispatch_async(v5, block);
  }
  else
  {
    id v8 = [(KCPairingChannel *)self connection];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __34__KCPairingChannel_validateStart___block_invoke;
    v16[3] = &unk_2643149A0;
    id v6 = (id *)&v17;
    id v9 = v4;
    uint64_t v17 = v9;
    uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __34__KCPairingChannel_validateStart___block_invoke_2;
    v14[3] = &unk_2643149C8;
    id v15 = v9;
    uint64_t v11 = v9;
    [v10 stashedCredentialPublicKey:v14];

    char v5 = v15;
  }
}

uint64_t __34__KCPairingChannel_validateStart___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __34__KCPairingChannel_validateStart___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

uint64_t __34__KCPairingChannel_validateStart___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)ensureControlChannel
{
  int v3 = [(KCPairingChannel *)self connection];

  if (v3) {
    return 1;
  }
  char v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97B6B0];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.securityd.sos" options:0];
  [(KCPairingChannel *)self setConnection:v6];

  id v7 = [(KCPairingChannel *)self connection];
  BOOL v4 = v7 != 0;

  if (v7)
  {
    id v8 = [(KCPairingChannel *)self connection];
    [v8 setRemoteObjectInterface:v5];

    id v9 = [(KCPairingChannel *)self connection];
    [v9 resume];
  }
  return v4;
}

- (void)acceptorWaitForAck:(id)a3 complete:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v6 = a4;
  id v7 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "acceptor received ACK from initiator", buf, 2u);
  }

  id v8 = [v36 objectForKeyedSubscript:@"o"];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    uint64_t v17 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "pairing: no octagon data, ending session", buf, 2u);
    }

    uint64_t v18 = [AAFAnalyticsEventSecurity alloc];
    id v19 = [(KCPairingChannel *)self peerVersionContext];
    uint64_t v20 = [v19 altDSID];
    id v21 = [(KCPairingChannel *)self peerVersionContext];
    uint64_t v22 = [v21 flowID];
    id v23 = [(KCPairingChannel *)self peerVersionContext];
    uint64_t v24 = [v23 deviceSessionID];
    LOBYTE(v34) = 1;
    uint64_t v10 = [(AAFAnalyticsEventSecurity *)v18 initWithKeychainCircleMetrics:0 altDSID:v20 flowID:v22 deviceSessionID:v24 eventName:@"com.apple.security.pairingEmptyOctagonPayload" testsAreEnabled:metricsAreEnabled canSendMetrics:v34 category:&unk_26C975FC0];

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v10 success:0 error:0];
    (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, 1, 0, 0);
  }
  else
  {
    uint64_t v10 = [v36 objectForKeyedSubscript:@"o"];
    v35 = [(AAFAnalyticsEventSecurity *)v10 objectForKeyedSubscript:@"k"];
    uint64_t v11 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_impl(&dword_218274000, v11, OS_LOG_TYPE_DEFAULT, "Received ack number: %@", buf, 0xCu);
    }

    id v12 = [(KCPairingChannel *)self ackNumber];
    int v13 = [v35 isEqualToNumber:v12];

    if (v13)
    {
      unint64_t v14 = [(KCPairingChannel *)self itemIndex];
      id v15 = [(KCPairingChannel *)self allPCSItems];
      LODWORD(v14) = v14 < [v15 count];

      if (v14)
      {
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __48__KCPairingChannel_acceptorWaitForAck_complete___block_invoke;
        v37[3] = &unk_2643146D0;
        objc_copyWeak(&v38, (id *)buf);
        [(KCPairingChannel *)self setNextState:v37];
        uint64_t v16 = [(KCPairingChannel *)self formNextPacket];
        (*((void (**)(id, void, void *, void))v6 + 2))(v6, 0, v16, 0);

        objc_destroyWeak(&v38);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [(KCPairingChannel *)self setAllPCSItems:0];
        (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, 1, 0, 0);
      }
    }
    else
    {
      uint64_t v25 = secLogObjForScope("pairing");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218274000, v25, OS_LOG_TYPE_DEFAULT, "Did not receive expected ack number, re-attempting PCS key transfer", buf, 2u);
      }

      uint64_t v26 = [AAFAnalyticsEventSecurity alloc];
      v27 = [(KCPairingChannel *)self peerVersionContext];
      v28 = [v27 altDSID];
      id v29 = [(KCPairingChannel *)self peerVersionContext];
      v30 = [v29 flowID];
      v31 = [(KCPairingChannel *)self peerVersionContext];
      v32 = [v31 deviceSessionID];
      LOBYTE(v34) = 1;
      v33 = [(AAFAnalyticsEventSecurity *)v26 initWithKeychainCircleMetrics:0 altDSID:v28 flowID:v30 deviceSessionID:v32 eventName:@"com.apple.security.pairingEmptyAckPayload" testsAreEnabled:metricsAreEnabled canSendMetrics:v34 category:&unk_26C975FC0];

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v33 success:0 error:0];
      [(KCPairingChannel *)self acceptorPCSDataPacket:MEMORY[0x263EFFA78] complete:v6];
    }
  }
}

void __48__KCPairingChannel_acceptorWaitForAck_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorWaitForAck:v6 complete:v5];
}

- (id)formNextPacket
{
  unint64_t v3 = [(KCPairingChannel *)self itemIndex] + 200;
  BOOL v4 = [(KCPairingChannel *)self allPCSItems];
  unint64_t v5 = [v4 count];

  if (v3 < v5)
  {
    unint64_t v7 = [(KCPairingChannel *)self itemIndex] + 200;
  }
  else
  {
    id v6 = [(KCPairingChannel *)self allPCSItems];
    unint64_t v7 = [v6 count];
  }
  BOOL v8 = v3 >= v5;
  BOOL v9 = [(KCPairingChannel *)self allPCSItems];
  id v10 = [(KCPairingChannel *)self copySubsetFrom:v9 begin:[(KCPairingChannel *)self itemIndex] end:v7];

  uint64_t v11 = NSNumber;
  id v12 = [(KCPairingChannel *)self ackNumber];
  int v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "integerValue") + 1);
  unint64_t v14 = [(KCPairingChannel *)self createPacket:v13 results:v10 endSession:v8];

  return v14;
}

- (void)acceptorPCSDataPacket:(id)a3 complete:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  unint64_t v7 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "acceptor packet will include pcs data", buf, 2u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __51__KCPairingChannel_acceptorPCSDataPacket_complete___block_invoke;
  v29[3] = &unk_2643146D0;
  location = &v30;
  objc_copyWeak(&v30, (id *)buf);
  [(KCPairingChannel *)self setNextState:v29];
  CFTypeRef cf = 0;
  int v8 = [(KCPairingChannel *)self fetchPCSItems:&cf];
  if (v8 || !cf)
  {
    uint64_t v11 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_218274000, v11, OS_LOG_TYPE_DEFAULT, "pairing: fetched no results, ending session", v27, 2u);
    }

    id v12 = [AAFAnalyticsEventSecurity alloc];
    int v13 = [(KCPairingChannel *)self peerVersionContext];
    unint64_t v14 = [v13 altDSID];
    id v15 = [(KCPairingChannel *)self peerVersionContext];
    uint64_t v16 = [v15 flowID];
    uint64_t v17 = [(KCPairingChannel *)self peerVersionContext];
    uint64_t v18 = [v17 deviceSessionID];
    LOBYTE(v24) = 1;
    BOOL v9 = [(AAFAnalyticsEventSecurity *)v12 initWithKeychainCircleMetrics:0, v14, v16, v18, @"com.apple.security.pairingFailedFetchPCSItems", metricsAreEnabled, v24, &unk_26C975FC0, v25, &v30 altDSID flowID deviceSessionID eventName testsAreEnabled canSendMetrics category];

    id v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v8 description:@"SecItemCopyMatching: failed to fetch pcs data from the keychain"];
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v9 success:0 error:v19];

    [(KCPairingChannel *)self setAckNumber:&unk_26C975F90];
    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    id v21 = [MEMORY[0x263EFF9A0] dictionary];
    [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"e"];
    uint64_t v22 = [(KCPairingChannel *)self ackNumber];
    [v21 setObject:v22 forKeyedSubscript:@"n"];

    [v20 setObject:v21 forKeyedSubscript:@"o"];
    CFTypeRef v23 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v23);
    }
    (*((void (**)(id, void, void *, void))v6 + 2))(v6, 0, v20, 0);
  }
  else
  {
    -[KCPairingChannel evaluateResults:](self, "evaluateResults:");
    BOOL v9 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue();
    CFTypeRef v10 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v10);
    }
    (*((void (**)(id, void, AAFAnalyticsEventSecurity *, void))v6 + 2))(v6, 0, v9, 0);
  }

  objc_destroyWeak(location);
  objc_destroyWeak((id *)buf);
}

void __51__KCPairingChannel_acceptorPCSDataPacket_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorWaitForAck:v6 complete:v5];
}

- (int)fetchPCSItems:(const void *)a3
{
  v26[8] = *MEMORY[0x263EF8340];
  id v5 = [(KCPairingChannel *)self dsidForTest];

  if (v5)
  {
    id v6 = [(KCPairingChannel *)self dsidForTest];
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2050000000;
    unint64_t v7 = (void *)getACAccountStoreClass_softClass;
    uint64_t v24 = getACAccountStoreClass_softClass;
    if (!getACAccountStoreClass_softClass)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __getACAccountStoreClass_block_invoke;
      v20[3] = &unk_2643150C8;
      v20[4] = &v21;
      __getACAccountStoreClass_block_invoke((uint64_t)v20);
      unint64_t v7 = (void *)v22[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v21, 8);
    BOOL v9 = [v8 defaultStore];
    CFTypeRef v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
    id v6 = objc_msgSend(v10, "aa_personID");
  }
  uint64_t v11 = *MEMORY[0x263F171D8];
  uint64_t v12 = *MEMORY[0x263F17580];
  v25[0] = *MEMORY[0x263F171B8];
  v25[1] = v12;
  v26[0] = v11;
  v26[1] = MEMORY[0x263EFFA88];
  uint64_t v13 = *MEMORY[0x263F16E80];
  void v25[2] = *MEMORY[0x263F170B0];
  v25[3] = v13;
  v26[2] = MEMORY[0x263EFFA88];
  v26[3] = @"com.apple.ProtectedCloudStorage";
  uint64_t v14 = *MEMORY[0x263F17400];
  v25[4] = *MEMORY[0x263F17088];
  v25[5] = v14;
  uint64_t v15 = *MEMORY[0x263F17408];
  v26[4] = v6;
  v26[5] = v15;
  uint64_t v16 = *MEMORY[0x263F17520];
  v25[6] = *MEMORY[0x263F17518];
  void v25[7] = v16;
  v26[6] = MEMORY[0x263EFFA88];
  v26[7] = MEMORY[0x263EFFA88];
  CFDictionaryRef v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:8];
  OSStatus v18 = SecItemCopyMatching(v17, a3);

  return v18;
}

- (id)evaluateResults:(void *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFTypeID v5 = CFGetTypeID(a3);
  if (v5 == CFArrayGetTypeID())
  {
    id v6 = a3;
    [(KCPairingChannel *)self setAllPCSItems:v6];
    if ((unint64_t)[v6 count] < 0xC9)
    {
      id v8 = [(KCPairingChannel *)self createPacket:&unk_26C975F90 results:v6 endSession:1];
    }
    else
    {
      id v7 = [(KCPairingChannel *)self copySubsetFrom:v6 begin:0 end:200];

      id v8 = [(KCPairingChannel *)self createPacket:&unk_26C975F90 results:v7 endSession:0];
    }
  }
  else
  {
    BOOL v9 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      CFTypeID v12 = CFGetTypeID(a3);
      _os_log_impl(&dword_218274000, v9, OS_LOG_TYPE_DEFAULT, "acceptorPCSDataPacket: received unexpected return type from SecItemCopyMatching, typeID: %lu", (uint8_t *)&v11, 0xCu);
    }

    id v8 = [(KCPairingChannel *)self createPacket:&unk_26C975F90 results:0 endSession:1];
  }
  return v8;
}

- (id)copySubsetFrom:(id)a3 begin:(unint64_t)a4 end:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [MEMORY[0x263EFF980] array];
  unint64_t v9 = a4 - a5;
  if (a4 < a5)
  {
    uint64_t v10 = 0;
    do
    {
      int v11 = [v7 objectAtIndexedSubscript:a4 + v10];
      [v8 setObject:v11 atIndexedSubscript:v10];

      ++v10;
    }
    while (v9 + v10);
  }

  return v8;
}

- (id)createPacket:(id)a3 results:(id)a4 endSession:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v42 = self;
  [(KCPairingChannel *)self setCountOfSentItems:&unk_26C975F78];
  id v38 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  int v11 = v10;
  if (v5) {
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"e"];
  }
  v39 = v8;
  [(KCPairingChannel *)self setAckNumber:v8];
  CFTypeID v12 = [(KCPairingChannel *)self ackNumber];
  [v11 setObject:v12 forKeyedSubscript:@"n"];

  uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v9;
  uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (!v14)
  {
    uint64_t v43 = 0;
    goto LABEL_33;
  }
  uint64_t v15 = v14;
  uint64_t v43 = 0;
  uint64_t v40 = *(void *)v46;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v46 != v40) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = v43 + i;
      OSStatus v18 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      id v19 = (void *)MEMORY[0x21D4660B0]();
      uint64_t v20 = [NSString stringWithFormat:@"%@+%ld", @"pcsdata", v43 + i];
      uint64_t v21 = (void *)[v18 mutableCopy];
      uint64_t v22 = [(KCPairingChannel *)v42 updateItem:v21];

      id v44 = 0;
      uint64_t v23 = v11;
      BOOL v24 = [(KCPairingChannel *)v42 createTempPacketAndCheckSize:v13 pcsItem:v22 octagonData:v11 keyForItem:v20 error:&v44];
      id v25 = v44;
      uint64_t v26 = v25;
      if (v24 && v25 == 0)
      {
        [v13 setObject:v22 forKeyedSubscript:v20];
        goto LABEL_21;
      }
      if (v24)
      {
        id v30 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = (uint64_t)v26;
          v31 = "pairing: failed to compress packet. will not add anymore items, error: %@";
          v32 = v30;
          uint32_t v33 = 12;
LABEL_29:
          _os_log_impl(&dword_218274000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
        }
LABEL_30:
        int v11 = v23;

        [v23 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"e"];
LABEL_32:

        uint64_t v43 = v17;
        goto LABEL_33;
      }
      if ([v13 count])
      {
        id v30 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v31 = "pairing: temp packet size is too large for the channel. will not add anymore items";
          v32 = v30;
          uint32_t v33 = 2;
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      v28 = secLogObjForScope("pairing");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = (uint64_t)v22;
        _os_log_impl(&dword_218274000, v28, OS_LOG_TYPE_DEFAULT, "item by itself is too large for the pairing channel: %@", buf, 0xCu);
      }

      if ((unint64_t)[obj count] < 2)
      {
        uint64_t v17 = v43 + i;
        int v11 = v23;
        goto LABEL_32;
      }
      id v29 = secLogObjForScope("pairing");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218274000, v29, OS_LOG_TYPE_DEFAULT, "will attempt to add more items to the packet", buf, 2u);
      }

LABEL_21:
      int v11 = v23;
    }
    v43 += i;
    uint64_t v15 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_33:

  uint64_t v34 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = [v13 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v50 = v35;
    __int16 v51 = 2112;
    v52 = v13;
    _os_log_impl(&dword_218274000, v34, OS_LOG_TYPE_DEFAULT, "acceptor will send initiator (%lu) items: %@", buf, 0x16u);
  }

  [(KCPairingChannel *)v42 setItemIndex:[(KCPairingChannel *)v42 itemIndex] + v43];
  id v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  [(KCPairingChannel *)v42 setCountOfSentItems:v36];

  [v11 setObject:v13 forKeyedSubscript:@"a"];
  [v38 setObject:v11 forKeyedSubscript:@"o"];

  return v38;
}

- (BOOL)createTempPacketAndCheckSize:(id)a3 pcsItem:(id)a4 octagonData:(id)a5 keyForItem:(id)a6 error:(id *)a7
{
  id v9 = [(KCPairingChannel *)self createTempPacket:a3 pcsItem:a4 octagonData:a5 keyForItem:a6];
  LOBYTE(a7) = [(KCPairingChannel *)self isPacketSizeAcceptable:v9 error:a7];

  return (char)a7;
}

- (id)createTempPacket:(id)a3 pcsItem:(id)a4 octagonData:(id)a5 keyForItem:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  CFTypeID v12 = (void *)[a3 mutableCopy];
  [v12 setObject:v11 forKeyedSubscript:v9];

  uint64_t v13 = (void *)[v10 mutableCopy];
  [v13 setObject:v12 forKeyedSubscript:@"a"];
  uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
  [v14 setObject:v13 forKeyedSubscript:@"o"];

  return v14;
}

- (BOOL)isPacketSizeAcceptable:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v15 = 0;
  id v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:&v15];
  id v7 = v15;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    CFTypeID v12 = [(id)objc_opt_class() pairingChannelCompressData:v6];
    if ((unint64_t)[v12 length] > 0x320C8)
    {
      BOOL v11 = 0;
    }
    else
    {
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
      [(KCPairingChannel *)self setSizeOfPacket:v13];

      BOOL v11 = 1;
    }
  }
  else
  {
    id v10 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v8;
      _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "pairing: failed to serialize temp packet: %@", buf, 0xCu);
    }

    BOOL v11 = 0;
    CFTypeID v12 = 0;
    if (a4) {
      *a4 = v8;
    }
  }

  return v11;
}

- (id)updateItem:(id)a3
{
  id v3 = a3;
  [v3 setObject:0 forKeyedSubscript:*MEMORY[0x263F16E70]];
  [v3 setObject:*MEMORY[0x263F171D8] forKeyedSubscript:*MEMORY[0x263F171B8]];
  return v3;
}

- (void)acceptorThirdPacket:(id)a3 complete:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v6 = a4;
  id v7 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "acceptor packet 3", buf, 2u);
  }

  *(void *)buf = 0;
  v53 = buf;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  id v8 = _OctagonSignpostLogSystem();
  uint64_t v9 = _OctagonSignpostCreate();
  uint64_t v38 = v10;
  os_signpost_id_t v11 = v9;

  CFTypeID v12 = _OctagonSignpostLogSystem();
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v56 = 0;
    _os_signpost_emit_with_name_impl(&dword_218274000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PairingChannelAcceptorMessage3", " enableTelemetry=YES ", v56, 2u);
  }

  uint64_t v14 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v56 = 134217984;
    os_signpost_id_t v57 = v11;
    _os_log_impl(&dword_218274000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorMessage3  enableTelemetry=YES ", v56, 0xCu);
  }

  id v15 = [AAFAnalyticsEventSecurity alloc];
  uint64_t v16 = [(KCPairingChannel *)self peerVersionContext];
  uint64_t v17 = [v16 altDSID];
  uint64_t v18 = [(KCPairingChannel *)self peerVersionContext];
  id v19 = [v18 flowID];
  uint64_t v20 = [(KCPairingChannel *)self peerVersionContext];
  uint64_t v21 = [v20 deviceSessionID];
  LOBYTE(v33) = 1;
  uint64_t v22 = [(AAFAnalyticsEventSecurity *)v15 initWithKeychainCircleMetrics:0 altDSID:v17 flowID:v19 deviceSessionID:v21 eventName:@"com.apple.security.acceptorCreatesPacket5" testsAreEnabled:metricsAreEnabled canSendMetrics:v33 category:&unk_26C975FC0];

  unsigned int v34 = [(KCPairingChannel *)self acceptorInitialSyncCredentialsFlags];
  v37 = [(KCPairingChannel *)self connection];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke;
  v46[3] = &unk_264314860;
  os_signpost_id_t v50 = v11;
  uint64_t v51 = v38;
  v49 = buf;
  uint64_t v23 = v22;
  long long v47 = v23;
  id v24 = v6;
  id v48 = v24;
  id v36 = [v37 remoteObjectProxyWithErrorHandler:v46];
  id v25 = [(KCPairingChannel *)self peerVersionContext];
  uint64_t v26 = [v25 altDSID];
  v27 = [(KCPairingChannel *)self peerVersionContext];
  v28 = [v27 flowID];
  id v29 = [(KCPairingChannel *)self peerVersionContext];
  id v30 = [v29 deviceSessionID];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_280;
  v39[3] = &unk_264314978;
  uint64_t v43 = buf;
  os_signpost_id_t v44 = v11;
  uint64_t v45 = v38;
  v31 = v23;
  uint64_t v40 = v31;
  v41 = self;
  id v32 = v24;
  id v42 = v32;
  [v36 initialSyncCredentials:v34 altDSID:v26 flowID:v28 deviceSessionID:v30 canSendMetrics:1 complete:v39];

  _Block_object_dispose(buf, 8);
}

void __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  BOOL v5 = _OctagonSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[7];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v11 = 67240192;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl(&dword_218274000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelAcceptorMessage3", " OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage3}d ", (uint8_t *)&v11, 8u);
  }

  uint64_t v9 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    int v10 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v12 = a1[7];
    __int16 v13 = 2048;
    double v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v15 = 1026;
    int v16 = v10;
    _os_log_impl(&dword_218274000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage3  OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage3}d ", (uint8_t *)&v11, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:0 error:v3];
  (*(void (**)(void))(a1[5] + 16))();
}

void __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_280(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  int v8 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = [v5 count];
    *(_WORD *)&uint8_t buf[8] = 2112;
    *(void *)&buf[10] = v6;
    _os_log_impl(&dword_218274000, v8, OS_LOG_TYPE_DEFAULT, "acceptor initialSyncCredentials complete: items %u: %@", buf, 0x12u);
  }

  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:@"d"];
  }
  uint64_t v9 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v9, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 3", buf, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  int v11 = _OctagonSignpostLogSystem();
  uint64_t v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 64);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&uint8_t buf[4] = v14;
    _os_signpost_emit_with_name_impl(&dword_218274000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PairingChannelAcceptorMessage3", " OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage3}d ", buf, 8u);
  }

  __int16 v15 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    int v16 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(void *)&uint8_t buf[4] = *(void *)(a1 + 64);
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v21 = 1026;
    int v22 = v16;
    _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage3  OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage3}d ", buf, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 32) success:v6 != 0 error:v6];
  if (CloudServicesLibraryCore()
    && getSecureBackupIsGuitarfishEnabledSymbolLoc()
    && soft_SecureBackupIsGuitarfishEnabled()
    && [*(id *)(a1 + 40) acceptorWillSendPCSData])
  {
    uint64_t v17 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "acceptor will send PCS data", buf, 2u);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_281;
    v18[3] = &unk_2643146D0;
    objc_copyWeak(&v19, (id *)buf);
    [*(id *)(a1 + 40) setNextState:v18];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_281(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorPCSDataPacket:v6 complete:v5];
}

- (void)acceptorSecondOctagonPacket:(id)a3 reply:(id)a4 complete:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v41 = a4;
  id v9 = a5;
  int v10 = [AAFAnalyticsEventSecurity alloc];
  int v11 = [(KCPairingChannel *)self peerVersionContext];
  uint64_t v12 = [v11 altDSID];
  os_signpost_id_t v13 = [(KCPairingChannel *)self peerVersionContext];
  int v14 = [v13 flowID];
  __int16 v15 = [(KCPairingChannel *)self peerVersionContext];
  int v16 = [v15 deviceSessionID];
  LOBYTE(v37) = 1;
  uint64_t v17 = [(AAFAnalyticsEventSecurity *)v10 initWithKeychainCircleMetrics:0 altDSID:v12 flowID:v14 deviceSessionID:v16 eventName:@"com.apple.security.acceptorCreatesVoucher" testsAreEnabled:metricsAreEnabled canSendMetrics:v37 category:&unk_26C975FC0];

  uint64_t v18 = [v8 objectForKeyedSubscript:@"o"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = [[OTPairingMessage alloc] initWithData:v18];
    if ([(OTPairingMessage *)v19 hasPrepare])
    {
      uint64_t v38 = v18;
      uint64_t v20 = [(OTPairingMessage *)v19 prepare];
      unsigned __int8 v43 = 0;
      __int16 v21 = [(KCPairingChannel *)self peerVersionContext];
      int v22 = [v21 capability];

      if (v22)
      {
        uint64_t v23 = [(KCPairingChannel *)self peerVersionContext];
        id v24 = [v23 capability];
      }
      else
      {
        id v24 = @"full";
      }
      id v39 = v9;
      id v40 = v8;
      v27 = secLogObjForScope((const char *)pairingScope);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = (uint64_t)v24;
        _os_log_impl(&dword_218274000, v27, OS_LOG_TYPE_DEFAULT, "acceptor channel max capability set to %@", buf, 0xCu);
      }

      id v28 = 0;
      int v29 = 0;
      while (1)
      {
        id v30 = secLogObjForScope((const char *)pairingScope);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = v29 + 1;
          _os_log_impl(&dword_218274000, v30, OS_LOG_TYPE_DEFAULT, "Attempt %d fetching voucher", buf, 8u);
        }

        id v42 = 0;
        BOOL v31 = [(KCPairingChannel *)self fetchVoucher:v41 prepare:v20 eventS:v17 finishedPairing:&v43 maxCapability:v24 error:&v42];
        id v28 = v42;
        if (v31)
        {
          id v9 = v39;
          (*((void (**)(id, void, id, void))v39 + 2))(v39, v43, v41, 0);
          goto LABEL_29;
        }
        if (!+[KCPairingChannel retryable:v28]) {
          break;
        }
        id v32 = secLogObjForScope((const char *)pairingScope);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = v29 + 2;
          _os_log_impl(&dword_218274000, v32, OS_LOG_TYPE_DEFAULT, "Attempt %d retrying fetching voucher", buf, 8u);
        }
        ++v29;

        if (v29 >= vouchMaxRetry)
        {
          uint64_t v33 = secLogObjForScope("SecError");
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = vouchMaxRetry;
          unsigned int v34 = "pairing: failed to fetch voucher %d times, bailing.";
          id v35 = v33;
          uint32_t v36 = 8;
          goto LABEL_27;
        }
      }
      uint64_t v33 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v45 = pairingScope;
      __int16 v46 = 1024;
      int v47 = v29 + 1;
      __int16 v48 = 2112;
      id v49 = v28;
      unsigned int v34 = "%s Attempt %d failed fetching voucher: %@";
      id v35 = v33;
      uint32_t v36 = 28;
LABEL_27:
      _os_log_impl(&dword_218274000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
LABEL_28:

      id v9 = v39;
      (*((void (**)(id, uint64_t, void, id))v39 + 2))(v39, 1, 0, v28);
LABEL_29:
      uint64_t v18 = v38;

      id v8 = v40;
    }
    else
    {
      uint64_t v26 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218274000, v26, OS_LOG_TYPE_DEFAULT, "ot-pairing: acceptorSecondOctagonPacket: no octagon message", buf, 2u);
      }

      uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
      [(KCPairingChannel *)self setNextStateError:v20 complete:v9];
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v17 success:0 error:v20];
    }
  }
  else
  {
    id v25 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218274000, v25, OS_LOG_TYPE_DEFAULT, "acceptorSecondOctagonPacket octagon data missing", buf, 2u);
    }

    id v19 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
    [(KCPairingChannel *)self setNextStateError:v19 complete:v9];
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v17 success:0 error:v19];
  }
}

- (BOOL)fetchVoucher:(id)a3 prepare:(id)a4 eventS:(id)a5 finishedPairing:(BOOL *)a6 maxCapability:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v30 = a7;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy_;
  id v42 = __Block_byref_object_dispose_;
  id v43 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v28 = [(KCPairingChannel *)self otControl];
  uint64_t v26 = [(KCPairingChannel *)self controlArguments];
  id v25 = [(KCPairingChannel *)self joiningConfiguration];
  id v24 = [v13 peerID];
  uint64_t v23 = [v13 permanentInfo];
  __int16 v15 = [v13 permanentInfoSig];
  int v16 = [v13 stableInfo];
  uint64_t v17 = [v13 stableInfoSig];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke;
  v31[3] = &unk_264314950;
  v31[4] = self;
  id v22 = v14;
  id v32 = v22;
  unsigned int v34 = &v38;
  objc_copyWeak(v36, &location);
  id v21 = v12;
  id v33 = v21;
  id v35 = &v44;
  v36[1] = a6;
  [v28 rpcVoucherWithArguments:v26 configuration:v25 peerID:v24 permanentInfo:v23 permanentInfoSig:v15 stableInfo:v16 stableInfoSig:v17 maxCapability:v30 reply:v31];

  if (a8)
  {
    uint64_t v18 = (void *)v39[5];
    if (v18) {
      *a8 = v18;
    }
  }
  char v19 = *((unsigned char *)v45 + 24);

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v19;
}

void __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 || [*(id *)(a1 + 32) testFailOctagon])
  {
    int v10 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [*(id *)(a1 + 32) counter];
      *(_DWORD *)buf = 67109120;
      int v38 = v11;
      _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "error acceptor handling octagon packet %d", buf, 8u);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:0 error:v9];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = v9;
    id v14 = *(OTPairingMessage **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
    goto LABEL_6;
  }
  __int16 v15 = secLogObjForScope((const char *)pairingScope);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [*(id *)(a1 + 32) counter];
    *(_DWORD *)buf = 67109120;
    int v38 = v16;
    _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "acceptor handled octagon packet %d", buf, 8u);
  }

  if (SOSCCIsSOSTrustAndSyncingEnabled()
    && [*(id *)(a1 + 32) acceptorWillSendInitialSyncCredentials])
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke_276;
    v35[3] = &unk_2643146D0;
    uint64_t v17 = &v36;
    objc_copyWeak(&v36, (id *)(a1 + 72));
    [*(id *)(a1 + 32) setNextState:v35];
    char v18 = 0;
  }
  else
  {
    if (!CloudServicesLibraryCore()
      || !getSecureBackupIsGuitarfishEnabledSymbolLoc()
      || !soft_SecureBackupIsGuitarfishEnabled()
      || ![*(id *)(a1 + 32) acceptorWillSendPCSData])
    {
      char v18 = 1;
      goto LABEL_21;
    }
    char v19 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218274000, v19, OS_LOG_TYPE_DEFAULT, "acceptor will send PCS data", buf, 2u);
    }

    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    id v32 = __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke_277;
    id v33 = &unk_2643146D0;
    uint64_t v17 = &v34;
    objc_copyWeak(&v34, (id *)(a1 + 72));
    [*(id *)(a1 + 32) setNextState:&v30];
    char v18 = 1;
  }
  objc_destroyWeak(v17);
LABEL_21:
  id v14 = objc_alloc_init(OTPairingMessage);
  uint64_t v20 = objc_alloc_init(OTSupportSOSMessage);
  [(OTPairingMessage *)v14 setSupportsSOS:v20];

  id v21 = objc_alloc_init(OTSupportOctagonMessage);
  [(OTPairingMessage *)v14 setSupportsOctagon:v21];

  id v22 = objc_alloc_init(OTSponsorToApplicantRound2M2);
  [(OTPairingMessage *)v14 setVoucher:v22];

  uint64_t v23 = [(OTPairingMessage *)v14 voucher];
  [v23 setVoucher:v7];

  id v24 = [(OTPairingMessage *)v14 voucher];
  [v24 setVoucherSignature:v8];

  if (SOSCCIsSOSTrustAndSyncingEnabled()) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = 2;
  }
  uint64_t v26 = [(OTPairingMessage *)v14 supportsSOS];
  [v26 setSupported:v25];

  v27 = [(OTPairingMessage *)v14 supportsOctagon];
  [v27 setSupported:1];

  if ([*(id *)(a1 + 32) acceptorWillSendInitialSyncCredentials]) {
    objc_msgSend(*(id *)(a1 + 32), "setAcceptorInitialSyncCredentialsFlags:", objc_msgSend(*(id *)(a1 + 32), "acceptorInitialSyncCredentialsFlags") & 0xFFFFFFFCLL);
  }
  id v28 = [(OTPairingMessage *)v14 data];
  [*(id *)(a1 + 48) setObject:v28 forKeyedSubscript:@"o"];

  int v29 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v29, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 2", buf, 2u);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:1 error:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  if (CloudServicesLibraryCore()
    && getSecureBackupIsGuitarfishEnabledSymbolLoc()
    && soft_SecureBackupIsGuitarfishEnabled()
    && [*(id *)(a1 + 32) acceptorWillSendPCSData])
  {
    **(unsigned char **)(a1 + 80) = 0;
  }
  else
  {
    **(unsigned char **)(a1 + 80) = v18;
  }
LABEL_6:
}

void __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke_276(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorThirdPacket:v6 complete:v5];
}

void __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke_277(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorPCSDataPacket:v6 complete:v5];
}

- (void)acceptorSecondPacket:(id)a3 complete:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v45 = a3;
  id v44 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  [(KCPairingChannel *)self setNextStateError:0 complete:0];
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  char v72 = 0;
  id v6 = _OctagonSignpostLogSystem();
  uint64_t v7 = _OctagonSignpostCreate();
  id v42 = v8;
  id v9 = (char *)v7;

  int v10 = _OctagonSignpostLogSystem();
  int v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_218274000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "PairingChannelAcceptorMessage2", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  uint64_t v12 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_218274000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorMessage2  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  id v13 = [AAFAnalyticsEventSecurity alloc];
  id v14 = [(KCPairingChannel *)self peerVersionContext];
  __int16 v15 = [v14 altDSID];
  int v16 = [(KCPairingChannel *)self peerVersionContext];
  uint64_t v17 = [v16 flowID];
  char v18 = [(KCPairingChannel *)self peerVersionContext];
  char v19 = [v18 deviceSessionID];
  LOBYTE(v36) = 1;
  id v43 = [(AAFAnalyticsEventSecurity *)v13 initWithKeychainCircleMetrics:0 altDSID:v15 flowID:v17 deviceSessionID:v19 eventName:@"com.apple.security.acceptorCreatesPacket4" testsAreEnabled:metricsAreEnabled canSendMetrics:v36 category:&unk_26C975FC0];

  uint64_t v20 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_218274000, v20, OS_LOG_TYPE_DEFAULT, "acceptor packet 2", (uint8_t *)&buf, 2u);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v77 = 0x3032000000;
  v78 = __Block_byref_object_copy_;
  v79 = __Block_byref_object_dispose_;
  id v80 = (id)0xAAAAAAAAAAAAAAAALL;
  id v80 = [MEMORY[0x263EFF9A0] dictionary];
  id v21 = [v45 objectForKeyedSubscript:@"p"];
  if ([(KCPairingChannel *)self sessionSupportsSOS]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x2020000000;
    char v70 = 0;
    id v22 = _OctagonSignpostLogSystem();
    uint64_t v23 = _OctagonSignpostCreate();
    id v41 = v24;
    uint64_t v25 = (char *)v23;

    uint64_t v26 = _OctagonSignpostLogSystem();
    v27 = v26;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)v74 = 0;
      _os_signpost_emit_with_name_impl(&dword_218274000, v27, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v25, "PairingChannelAcceptorCircleJoiningBlob", " enableTelemetry=YES ", v74, 2u);
    }

    id v28 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v74 = 134217984;
      v75 = v25;
      _os_log_impl(&dword_218274000, v28, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorCircleJoiningBlob  enableTelemetry=YES ", v74, 0xCu);
    }

    uint64_t v40 = [(KCPairingChannel *)self connection];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke;
    v60[3] = &unk_264314720;
    v65 = v25;
    v66 = v41;
    v67 = v9;
    v68 = v42;
    v63 = v69;
    v64 = v71;
    int v29 = v43;
    v61 = v29;
    id v30 = v44;
    id v62 = v30;
    int v38 = [v40 remoteObjectProxyWithErrorHandler:v60];
    uint64_t v39 = [(KCPairingChannel *)self peerVersionContext];
    uint64_t v37 = [v39 altDSID];
    uint64_t v31 = [(KCPairingChannel *)self peerVersionContext];
    id v32 = [v31 flowID];
    id v33 = [(KCPairingChannel *)self peerVersionContext];
    id v34 = [v33 deviceSessionID];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_272;
    v52[3] = &unk_264314928;
    v59[1] = v25;
    v59[2] = v41;
    v56 = v69;
    v52[4] = self;
    p_long long buf = &buf;
    id v53 = v45;
    uint64_t v58 = v71;
    v59[3] = v9;
    v59[4] = v42;
    uint64_t v54 = v29;
    id v55 = v30;
    objc_copyWeak(v59, &location);
    [v38 circleJoiningBlob:v37 flowID:v32 deviceSessionID:v34 canSendMetrics:1 applicant:v21 complete:v52];

    objc_destroyWeak(v59);
    _Block_object_dispose(v69, 8);
  }
  else if ([(KCPairingChannel *)self sessionSupportsOctagon])
  {
    uint64_t v35 = *(void *)(*((void *)&buf + 1) + 40);
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_275;
    v46[3] = &unk_264314748;
    id v49 = v71;
    uint64_t v50 = v9;
    uint64_t v51 = v42;
    char v47 = v43;
    id v48 = v44;
    [(KCPairingChannel *)self acceptorSecondOctagonPacket:v45 reply:v35 complete:v46];
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v71, 8);
  objc_destroyWeak(&location);
}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  id v5 = _OctagonSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl(&dword_218274000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelAcceptorCircleJoiningBlob", " OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob}d ", (uint8_t *)&v19, 8u);
  }

  id v9 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[8];
    int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v19 = 134218496;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v11;
    _os_log_impl(&dword_218274000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorCircleJoiningBlob  OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob}d ", (uint8_t *)&v19, 0x1Cu);
  }

  uint64_t v12 = _OctagonSignpostGetNanoseconds();
  id v13 = _OctagonSignpostLogSystem();
  id v14 = v13;
  os_signpost_id_t v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v16 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
    int v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl(&dword_218274000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PairingChannelAcceptorMessage2", " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218496;
    int v18 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v20 = a1[10];
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)v12 / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v18;
    _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v19, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:0 error:v3];
  (*(void (**)(void))(a1[5] + 16))();
}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_272(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = v6;
  if (v5 && !v6) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  id v9 = _OctagonSignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 96);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    *(_DWORD *)long long buf = 67240192;
    *(_DWORD *)id v48 = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorCircleJoiningBlob", " OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob}d ", buf, 8u);
  }

  id v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 96);
    int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    *(_DWORD *)long long buf = 134218496;
    *(void *)id v48 = v14;
    *(_WORD *)&v48[8] = 2048;
    *(double *)&v48[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v49 = 1026;
    int v50 = v15;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorCircleJoiningBlob  OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob}d ", buf, 0x1Cu);
  }

  if (v5)
  {
    int v16 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [*(id *)(a1 + 32) acceptorWillSendInitialSyncCredentials];
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)id v48 = v17;
      *(_WORD *)&v48[4] = 2112;
      *(void *)&v48[6] = v7;
      _os_log_impl(&dword_218274000, v16, OS_LOG_TYPE_DEFAULT, "acceptor pairing complete (will send: %{BOOL}d): %@", buf, 0x12u);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v5 forKeyedSubscript:@"b"];
  }
  if ([*(id *)(a1 + 32) sessionSupportsOctagon])
  {
    int v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_273;
    v42[3] = &unk_264314748;
    uint64_t v45 = *(void *)(a1 + 80);
    long long v46 = *(_OWORD *)(a1 + 112);
    id v43 = *(id *)(a1 + 48);
    id v44 = *(id *)(a1 + 56);
    [v18 acceptorSecondOctagonPacket:v19 reply:v20 complete:v42];

    __int16 v21 = v43;
  }
  else
  {
    double v22 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218274000, v22, OS_LOG_TYPE_DEFAULT, "posting kSOSCCCircleOctagonKeysChangedNotification", buf, 2u);
    }

    notify_post((const char *)*MEMORY[0x263F16E08]);
    if ([*(id *)(a1 + 32) acceptorWillSendInitialSyncCredentials])
    {
      uint64_t v37 = MEMORY[0x263EF8330];
      uint64_t v38 = 3221225472;
      uint64_t v39 = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_274;
      uint64_t v40 = &unk_2643146D0;
      objc_copyWeak(&v41, (id *)(a1 + 88));
      [*(id *)(a1 + 32) setNextState:&v37];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      uint64_t v23 = _OctagonSignpostGetNanoseconds();
      int v24 = _OctagonSignpostLogSystem();
      uint64_t v25 = v24;
      os_signpost_id_t v26 = *(void *)(a1 + 112);
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        int v27 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)id v48 = v27;
        _os_signpost_emit_with_name_impl(&dword_218274000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PairingChannelAcceptorMessage2", " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", buf, 8u);
      }

      id v28 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v29 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(void *)id v48 = *(void *)(a1 + 112);
        *(_WORD *)&v48[8] = 2048;
        *(double *)&v48[10] = (double)(unint64_t)v23 / 1000000000.0;
        __int16 v49 = 1026;
        int v50 = v29;
        _os_log_impl(&dword_218274000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(void *)(a1 + 48), 1, 0, v37, v38, v39, v40);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      objc_destroyWeak(&v41);
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      uint64_t v30 = _OctagonSignpostGetNanoseconds();
      uint64_t v31 = _OctagonSignpostLogSystem();
      id v32 = v31;
      os_signpost_id_t v33 = *(void *)(a1 + 112);
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        int v34 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)id v48 = v34;
        _os_signpost_emit_with_name_impl(&dword_218274000, v32, OS_SIGNPOST_INTERVAL_END, v33, "PairingChannelAcceptorMessage2", " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", buf, 8u);
      }

      uint64_t v35 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v36 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(void *)id v48 = *(void *)(a1 + 112);
        *(_WORD *)&v48[8] = 2048;
        *(double *)&v48[10] = (double)(unint64_t)v30 / 1000000000.0;
        __int16 v49 = 1026;
        int v50 = v36;
        _os_log_impl(&dword_218274000, v35, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 48) success:1 error:0];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    __int16 v21 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218274000, v21, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 2", buf, 2u);
    }
  }
}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_275(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  id v9 = _OctagonSignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorMessage2", " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v15, 8u);
  }

  id v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) error:v6];
  (*(void (**)(void))(a1[5] + 16))();
}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_273(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  id v9 = _OctagonSignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorMessage2", " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v15, 8u);
  }

  id v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) error:v6];
  (*(void (**)(void))(a1[5] + 16))();
}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_274(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorThirdPacket:v6 complete:v5];
}

- (void)acceptorFirstOctagonPacket:(id)a3 reply:(id)a4 complete:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a3 objectForKeyedSubscript:@"o"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v22 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v23 = "acceptorFirstOctagonPacket octagon data missing";
LABEL_17:
      _os_log_impl(&dword_218274000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    }
LABEL_18:

    id v14 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
    [(KCPairingChannel *)self setNextStateError:v14 complete:v9];
    goto LABEL_24;
  }
  os_signpost_id_t v11 = [v10 objectForKeyedSubscript:@"v"];
  int v12 = [v11 isEqualToString:@"O"];

  if (!v12)
  {
    double v22 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v23 = "acceptorFirstOctagonPacket 'v' contents wrong";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  int v13 = 0;
  id v14 = 0;
  while (1)
  {
    int v15 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v26) = v13 + 1;
      _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "Attempt %d fetching epoch", buf, 8u);
    }

    id v24 = 0;
    BOOL v16 = [(KCPairingChannel *)self fetchEpoch:v8 error:&v24];
    id v14 = v24;
    if (v16)
    {
      (*((void (**)(id, void, id, void))v9 + 2))(v9, 0, v8, 0);
      goto LABEL_24;
    }
    if (!+[KCPairingChannel retryable:v14]) {
      break;
    }
    __int16 v17 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v26) = v13 + 2;
      _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "Attempt %d retrying fetching epoch", buf, 8u);
    }
    ++v13;

    if (v13 >= epochMaxRetry)
    {
      double v18 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v26) = epochMaxRetry;
      __int16 v19 = "pairing: failed to fetch epoch %d times, bailing.";
      int v20 = v18;
      uint32_t v21 = 8;
      goto LABEL_22;
    }
  }
  double v18 = secLogObjForScope("SecError");
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_23;
  }
  *(_DWORD *)long long buf = 136315650;
  uint64_t v26 = pairingScope;
  __int16 v27 = 1024;
  int v28 = v13 + 1;
  __int16 v29 = 2112;
  id v30 = v14;
  __int16 v19 = "%s: Attempt %d failed fetching epoch: %@";
  int v20 = v18;
  uint32_t v21 = 28;
LABEL_22:
  _os_log_impl(&dword_218274000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_23:

  (*((void (**)(id, uint64_t, void, id))v9 + 2))(v9, 1, 0, v14);
LABEL_24:
}

- (BOOL)fetchEpoch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint32_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  id v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = [(KCPairingChannel *)self otControl];
  id v8 = [(KCPairingChannel *)self controlArguments];
  id v9 = [(KCPairingChannel *)self joiningConfiguration];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__KCPairingChannel_fetchEpoch_error___block_invoke;
  v14[3] = &unk_264314900;
  void v14[4] = self;
  BOOL v16 = &v20;
  objc_copyWeak(&v18, &location);
  id v10 = v6;
  id v15 = v10;
  __int16 v17 = &v26;
  [v7 rpcEpochWithArguments:v8 configuration:v9 reply:v14];

  if (a4)
  {
    os_signpost_id_t v11 = (void *)v21[5];
    if (v11) {
      *a4 = v11;
    }
  }
  char v12 = *((unsigned char *)v27 + 24);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

void __37__KCPairingChannel_fetchEpoch_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v26 = a2;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "acceptor rpcEpochWithArguments: %ld (%@)", buf, 0x16u);
  }

  if (v6 || [*(id *)(a1 + 32) testFailOctagon])
  {
    id v8 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [*(id *)(a1 + 32) counter];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v26) = v9;
      _os_log_impl(&dword_218274000, v8, OS_LOG_TYPE_DEFAULT, "error acceptor handling packet %d", buf, 8u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    id v10 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [*(id *)(a1 + 32) counter];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v26) = v11;
      _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "acceptor handled packet %d", buf, 8u);
    }

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    void v23[2] = __37__KCPairingChannel_fetchEpoch_error___block_invoke_269;
    v23[3] = &unk_2643146D0;
    objc_copyWeak(&v24, (id *)(a1 + 64));
    [*(id *)(a1 + 32) setNextState:v23];
    char v12 = objc_alloc_init(OTPairingMessage);
    int v13 = objc_alloc_init(OTSupportSOSMessage);
    [(OTPairingMessage *)v12 setSupportsSOS:v13];

    id v14 = objc_alloc_init(OTSupportOctagonMessage);
    [(OTPairingMessage *)v12 setSupportsOctagon:v14];

    id v15 = objc_alloc_init(OTSponsorToApplicantRound1M2);
    [(OTPairingMessage *)v12 setEpoch:v15];

    BOOL v16 = [(OTPairingMessage *)v12 epoch];
    [v16 setEpoch:a2];

    LODWORD(v16) = SOSCCIsSOSTrustAndSyncingEnabled();
    __int16 v17 = [(OTPairingMessage *)v12 supportsSOS];
    id v18 = v17;
    if (v16) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 2;
    }
    [v17 setSupported:v19];

    uint64_t v20 = [(OTPairingMessage *)v12 supportsOctagon];
    [v20 setSupported:1];

    uint32_t v21 = [(OTPairingMessage *)v12 data];
    [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:@"o"];

    uint64_t v22 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218274000, v22, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 1", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    objc_destroyWeak(&v24);
  }
}

void __37__KCPairingChannel_fetchEpoch_error___block_invoke_269(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorSecondPacket:v6 complete:v5];
}

- (void)acceptorFirstPacket:(id)a3 complete:(id)a4
{
  v122[1] = *MEMORY[0x263EF8340];
  id v80 = a3;
  v79 = (void (**)(id, uint64_t, void, void *))a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v6 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_218274000, v6, OS_LOG_TYPE_DEFAULT, "acceptor packet 1", buf, 2u);
  }

  [(KCPairingChannel *)self setNextStateError:0 complete:0];
  if ([(KCPairingChannel *)self sessionSupportsSOS]
    && [(KCPairingChannel *)self sessionSupportsOctagon])
  {
    uint64_t v7 = 3;
  }
  else if ([(KCPairingChannel *)self sessionSupportsOctagon])
  {
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = [(KCPairingChannel *)self sessionSupportsSOS];
  }
  id v8 = [AAFAnalyticsEventSecurity alloc];
  v121 = @"supportedTrustSystem";
  int v9 = [NSNumber numberWithInteger:v7];
  v122[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v122 forKeys:&v121 count:1];
  int v11 = [(KCPairingChannel *)self peerVersionContext];
  char v12 = [v11 altDSID];
  int v13 = [(KCPairingChannel *)self peerVersionContext];
  id v14 = [v13 flowID];
  id v15 = [(KCPairingChannel *)self peerVersionContext];
  BOOL v16 = [v15 deviceSessionID];
  LOBYTE(v70) = 1;
  __int16 v17 = [(AAFAnalyticsEventSecurity *)v8 initWithKeychainCircleMetrics:v10 altDSID:v12 flowID:v14 deviceSessionID:v16 eventName:@"com.apple.security.acceptorCreatesPacket2" testsAreEnabled:metricsAreEnabled canSendMetrics:v70 category:&unk_26C975FC0];

  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  char v113 = 0;
  id v18 = _OctagonSignpostLogSystem();
  uint64_t v19 = (char *)_OctagonSignpostCreate();
  uint32_t v21 = v20;

  uint64_t v22 = _OctagonSignpostLogSystem();
  uint64_t v23 = v22;
  unint64_t v24 = (unint64_t)(v19 - 1);
  if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218274000, v23, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v19, "PairingChannelAcceptorMessage1", " enableTelemetry=YES ", buf, 2u);
  }

  id v25 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v19;
    _os_log_impl(&dword_218274000, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorMessage1  enableTelemetry=YES ", buf, 0xCu);
  }

  if ([(KCPairingChannel *)self sessionSupportsSOS]
    && ![(KCPairingChannel *)self ensureControlChannel])
  {
    id v42 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218274000, v42, OS_LOG_TYPE_DEFAULT, "unable to establish a channel to sos control", buf, 2u);
    }

    id v31 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:1 userInfo:0];
    [(KCPairingChannel *)self setNextStateError:v31 complete:v79];
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v17 success:0 error:v31];
    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    id v44 = _OctagonSignpostLogSystem();
    uint64_t v45 = v44;
    if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      int v46 = *((unsigned __int8 *)v111 + 24);
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v46;
      _os_signpost_emit_with_name_impl(&dword_218274000, v45, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v19, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 8u);
    }

    int v36 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      int v47 = *((unsigned __int8 *)v111 + 24);
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
      *(_WORD *)&unsigned char buf[22] = 1026;
      LODWORD(v118) = v47;
      _os_log_impl(&dword_218274000, v36, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 0x1Cu);
    }
  }
  else
  {
    if ([(KCPairingChannel *)self sessionSupportsSOS])
    {
      uint64_t v26 = [v80 objectForKeyedSubscript:@"d"];
      BOOL v27 = v26 == 0;

      if (!v27)
      {
        id v28 = secLogObjForScope("pairing");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_218274000, v28, OS_LOG_TYPE_DEFAULT, "acceptor initialSyncCredentials requested", buf, 2u);
        }

        [(KCPairingChannel *)self setAcceptorWillSendInitialSyncCredentials:1];
        [(KCPairingChannel *)self setAcceptorInitialSyncCredentialsFlags:11];
      }
    }
    uint64_t v29 = [v80 objectForKeyedSubscript:@"o"];
    BOOL v30 = v29 == 0;

    if (v30)
    {
      uint64_t v35 = secLogObjForScope("pairing");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_218274000, v35, OS_LOG_TYPE_DEFAULT, "initiator didn't send a octagon packet, so skipping all octagon flows", buf, 2u);
      }

      [(KCPairingChannel *)self setSessionSupportsOctagon:0];
      goto LABEL_33;
    }
    id v31 = [v80 objectForKeyedSubscript:@"o"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (CloudServicesLibraryCore())
      {
        if (getSecureBackupIsGuitarfishEnabledSymbolLoc())
        {
          if (soft_SecureBackupIsGuitarfishEnabled())
          {
            id v32 = [v31 objectForKeyedSubscript:@"s"];
            if (v32)
            {
              os_signpost_id_t v33 = [v31 objectForKeyedSubscript:@"s"];
              int v34 = [v33 isEqualToNumber:MEMORY[0x263EFFA88]];

              if (v34) {
                [(KCPairingChannel *)self setAcceptorWillSendPCSData:1];
              }
            }
          }
        }
      }

LABEL_33:
      id v31 = objc_alloc_init(MEMORY[0x263F16D58]);
      int v36 = [MEMORY[0x263EFF9A0] dictionary];
      if (CloudServicesLibraryCore()
        && getSecureBackupIsGuitarfishEnabledSymbolLoc()
        && soft_SecureBackupIsGuitarfishEnabled()
        && [(KCPairingChannel *)self acceptorWillSendPCSData])
      {
        [v36 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"y"];
      }
      uint64_t v106 = 0;
      v107 = &v106;
      uint64_t v108 = 0x2020000000;
      uint64_t v109 = 1;
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v118 = __Block_byref_object_copy_;
      v119 = __Block_byref_object_dispose_;
      id v120 = 0;
      uint64_t v37 = [(KCPairingChannel *)self otControl];
      uint64_t v38 = [(KCPairingChannel *)self controlArguments];
      v105[0] = MEMORY[0x263EF8330];
      v105[1] = 3221225472;
      v105[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke;
      v105[3] = &unk_2643148B0;
      v105[4] = &v106;
      v105[5] = buf;
      [v37 fetchTrustStatus:v38 configuration:v31 reply:v105];

      if (v107[3])
      {
        uint64_t v39 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v115 = 0;
          _os_log_impl(&dword_218274000, v39, OS_LOG_TYPE_DEFAULT, "pairing: device is not trusted, stopping the pairing flow", v115, 2u);
        }

        uint64_t v40 = *(void **)(*(void *)&buf[8] + 40);
        id v41 = v40;
        if (!v40)
        {
          id v41 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain, 8, @"device cannot support pairing, not trusted in Octagon" code description];
        }
        v79[2](v79, 1, 0, v41);
        if (!v40) {
      }
        }
      else if (*(void *)(*(void *)&buf[8] + 40))
      {
        int v50 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v51 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v115 = 138412290;
          *(void *)&v115[4] = v51;
          _os_log_impl(&dword_218274000, v50, OS_LOG_TYPE_DEFAULT, "pairing: failed to check trust status: %@", v115, 0xCu);
        }

        v79[2](v79, 1, 0, *(void **)(*(void *)&buf[8] + 40));
      }
      else if ([(KCPairingChannel *)self sessionSupportsSOS])
      {
        v52 = _OctagonSignpostLogSystem();
        uint64_t v53 = _OctagonSignpostCreate();
        v78 = v54;
        id v55 = (char *)v53;

        v56 = _OctagonSignpostLogSystem();
        os_signpost_id_t v57 = v56;
        if ((unint64_t)(v55 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
        {
          *(_WORD *)v115 = 0;
          _os_signpost_emit_with_name_impl(&dword_218274000, v57, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v55, "PairingChannelAcceptorFetchStashCredential", " enableTelemetry=YES ", v115, 2u);
        }

        uint64_t v58 = _OctagonSignpostLogSystem();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v115 = 134217984;
          *(void *)&v115[4] = v55;
          _os_log_impl(&dword_218274000, v58, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorFetchStashCredential  enableTelemetry=YES ", v115, 0xCu);
        }

        *(void *)v115 = 0;
        *(void *)&v115[8] = v115;
        *(void *)&v115[16] = 0x2020000000;
        LOBYTE(v116) = 0;
        uint64_t v77 = [(KCPairingChannel *)self connection];
        v96[0] = MEMORY[0x263EF8330];
        v96[1] = 3221225472;
        v96[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_263;
        v96[3] = &unk_264314720;
        v101 = v55;
        v102 = v78;
        v103 = v19;
        v104 = v21;
        v99 = v115;
        v100 = &v110;
        v74 = v17;
        v97 = v74;
        v73 = v79;
        id v98 = v73;
        v75 = [v77 remoteObjectProxyWithErrorHandler:v96];
        v59 = [(KCPairingChannel *)self peerVersionContext];
        char v72 = [v59 altDSID];
        v76 = [(KCPairingChannel *)self peerVersionContext];
        v71 = [v76 flowID];
        v60 = [(KCPairingChannel *)self peerVersionContext];
        v61 = [v60 deviceSessionID];
        v87[0] = MEMORY[0x263EF8330];
        v87[1] = 3221225472;
        v87[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_264;
        v87[3] = &unk_2643148D8;
        v93 = v115;
        v95[1] = v55;
        v95[2] = v78;
        v88 = v36;
        v89 = self;
        id v90 = v80;
        v94 = &v110;
        v95[3] = v19;
        v95[4] = v21;
        v91 = v74;
        v92 = v73;
        objc_copyWeak(v95, &location);
        [v75 validatedStashedAccountCredential:v72 flowID:v71 deviceSessionID:v61 canSendMetrics:1 complete:v87];

        objc_destroyWeak(v95);
        _Block_object_dispose(v115, 8);
      }
      else if ([(KCPairingChannel *)self sessionSupportsOctagon])
      {
        v81[0] = MEMORY[0x263EF8330];
        v81[1] = 3221225472;
        v81[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_268;
        v81[3] = &unk_264314748;
        v84 = &v110;
        v85 = v19;
        v86 = v21;
        v82 = v17;
        v83 = v79;
        [(KCPairingChannel *)self acceptorFirstOctagonPacket:v80 reply:v36 complete:v81];
      }
      else
      {
        id v62 = secLogObjForScope("pairing");
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v115 = 0;
          _os_log_impl(&dword_218274000, v62, OS_LOG_TYPE_DEFAULT, "acceptor neither of octagon nor SOS", v115, 2u);
        }

        v63 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:6 userInfo:0];
        [(KCPairingChannel *)self setNextStateError:v63 complete:v79];
        uint64_t v64 = _OctagonSignpostGetNanoseconds();
        v65 = _OctagonSignpostLogSystem();
        v66 = v65;
        if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
        {
          int v67 = *((unsigned __int8 *)v111 + 24);
          *(_DWORD *)v115 = 67240192;
          *(_DWORD *)&v115[4] = v67;
          _os_signpost_emit_with_name_impl(&dword_218274000, v66, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v19, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", v115, 8u);
        }

        v68 = _OctagonSignpostLogSystem();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v115 = 134218496;
          int v69 = *((unsigned __int8 *)v111 + 24);
          *(void *)&v115[4] = v19;
          *(_WORD *)&v115[12] = 2048;
          *(double *)&v115[14] = (double)(unint64_t)v64 / 1000000000.0;
          *(_WORD *)&v115[22] = 1026;
          int v116 = v69;
          _os_log_impl(&dword_218274000, v68, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", v115, 0x1Cu);
        }

        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v17 success:0 error:v63];
      }
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v106, 8);
      goto LABEL_79;
    }
    id v48 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218274000, v48, OS_LOG_TYPE_DEFAULT, "acceptorFirstPacket: expected NSDictionary type", buf, 2u);
    }

    if (_os_feature_enabled_impl())
    {
      __int16 v49 = (void *)[objc_alloc(MEMORY[0x263F16D78]) initTapToRadar:@"Encountered unexpected packet format while proximity pairing" description:@"The source device expected an NSDictionary payload but received an unexpected packet format. Please include a sysdiagnose of both this device and the device signing in." radar:@"137694941"];
      [v49 trigger];
    }
    int v36 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:9 userInfo:0];
    [(KCPairingChannel *)self setNextStateError:v36 complete:v79];
  }
LABEL_79:

  _Block_object_dispose(&v110, 8);
  objc_destroyWeak(&location);
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4, int a5, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_263(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  id v5 = _OctagonSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl(&dword_218274000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelAcceptorFetchStashCredential", " OctagonSignpostNamePairingChannelAcceptorFetchStashCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorFetchStashCredential}d ", (uint8_t *)&v19, 8u);
  }

  int v9 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[8];
    int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v19 = 134218496;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v11;
    _os_log_impl(&dword_218274000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorFetchStashCredential  OctagonSignpostNamePairingChannelAcceptorFetchStashCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorFetchStashCredential}d ", (uint8_t *)&v19, 0x1Cu);
  }

  uint64_t v12 = _OctagonSignpostGetNanoseconds();
  int v13 = _OctagonSignpostLogSystem();
  id v14 = v13;
  os_signpost_id_t v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v16 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
    int v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl(&dword_218274000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v19, 8u);
  }

  __int16 v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218496;
    int v18 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v20 = a1[10];
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)v12 / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v18;
    _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v19, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:0 error:v3];
  (*(void (**)(void))(a1[5] + 16))();
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_264(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)v52 = v5 != 0;
    *(_WORD *)&v52[4] = 2112;
    *(void *)&v52[6] = v6;
    _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "acceptor validatedStashedAccountCredential: %{BOOL}d (%@)", buf, 0x12u);
  }

  if (v5 && !v6) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  int v9 = _OctagonSignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 96);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    *(_DWORD *)long long buf = 67240192;
    *(_DWORD *)v52 = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorFetchStashCredential", " OctagonSignpostNamePairingChannelAcceptorFetchStashCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorFetchStashCredential}d ", buf, 8u);
  }

  int v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 96);
    int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    *(_DWORD *)long long buf = 134218496;
    *(void *)v52 = v14;
    *(_WORD *)&v52[8] = 2048;
    *(double *)&v52[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v53 = 1026;
    int v54 = v15;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorFetchStashCredential  OctagonSignpostNamePairingChannelAcceptorFetchStashCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorFetchStashCredential}d ", buf, 0x1Cu);
  }

  if (v5)
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"c"];
    if ([*(id *)(a1 + 40) acceptorWillSendInitialSyncCredentials]) {
      [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"d"];
    }
    if ([*(id *)(a1 + 40) sessionSupportsOctagon])
    {
      __int16 v17 = *(void **)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v18 = *(void *)(a1 + 32);
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_265;
      v46[3] = &unk_264314748;
      uint64_t v49 = *(void *)(a1 + 80);
      long long v50 = *(_OWORD *)(a1 + 112);
      id v47 = *(id *)(a1 + 56);
      id v48 = *(id *)(a1 + 64);
      [v17 acceptorFirstOctagonPacket:v16 reply:v18 complete:v46];
    }
    else
    {
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_266;
      v44[3] = &unk_2643146D0;
      objc_copyWeak(&v45, (id *)(a1 + 88));
      [*(id *)(a1 + 40) setNextState:v44];
      id v28 = secLogObjForScope("pairing");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_218274000, v28, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 1", buf, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      uint64_t v29 = _OctagonSignpostGetNanoseconds();
      BOOL v30 = _OctagonSignpostLogSystem();
      id v31 = v30;
      os_signpost_id_t v32 = *(void *)(a1 + 112);
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        int v33 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)v52 = v33;
        _os_signpost_emit_with_name_impl(&dword_218274000, v31, OS_SIGNPOST_INTERVAL_END, v32, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 8u);
      }

      int v34 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v35 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(void *)v52 = *(void *)(a1 + 112);
        *(_WORD *)&v52[8] = 2048;
        *(double *)&v52[10] = (double)(unint64_t)v29 / 1000000000.0;
        __int16 v53 = 1026;
        int v54 = v35;
        _os_log_impl(&dword_218274000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 56) success:1 error:0];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      objc_destroyWeak(&v45);
    }
  }
  else if ([*(id *)(a1 + 40) sessionSupportsOctagon] {
         && ![*(id *)(a1 + 40) testFailSOS])
  }
  {
    if ([*(id *)(a1 + 40) sessionSupportsOctagon])
    {
      uint64_t v37 = *(void **)(a1 + 40);
      uint64_t v36 = *(void *)(a1 + 48);
      uint64_t v38 = *(void *)(a1 + 32);
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_267;
      v39[3] = &unk_264314748;
      uint64_t v42 = *(void *)(a1 + 80);
      long long v43 = *(_OWORD *)(a1 + 112);
      id v40 = *(id *)(a1 + 56);
      id v41 = *(id *)(a1 + 64);
      [v37 acceptorFirstOctagonPacket:v36 reply:v38 complete:v39];
    }
  }
  else
  {
    int v19 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)v52 = v6;
      _os_log_impl(&dword_218274000, v19, OS_LOG_TYPE_DEFAULT, "acceptor doesn't have a stashed credential: %@", buf, 0xCu);
    }

    uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:7 userInfo:0];
    [*(id *)(a1 + 40) setNextStateError:v20 complete:*(void *)(a1 + 64)];
    uint64_t v21 = _OctagonSignpostGetNanoseconds();
    double v22 = _OctagonSignpostLogSystem();
    __int16 v23 = v22;
    os_signpost_id_t v24 = *(void *)(a1 + 112);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v25 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)v52 = v25;
      _os_signpost_emit_with_name_impl(&dword_218274000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 8u);
    }

    uint64_t v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      int v27 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      *(void *)v52 = *(void *)(a1 + 112);
      *(_WORD *)&v52[8] = 2048;
      *(double *)&v52[10] = (double)(unint64_t)v21 / 1000000000.0;
      __int16 v53 = 1026;
      int v54 = v27;
      _os_log_impl(&dword_218274000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 56) success:0 error:v20];
  }
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_268(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  int v9 = _OctagonSignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 8u);
  }

  int v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) error:v6];
  (*(void (**)(void))(a1[5] + 16))();
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_265(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  int v9 = _OctagonSignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 8u);
  }

  int v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) error:v6];
  (*(void (**)(void))(a1[5] + 16))();
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_266(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorSecondPacket:v6 complete:v5];
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_267(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  int v9 = _OctagonSignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 8u);
  }

  int v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) error:v6];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)initiatorPCSDataPacket:(id)a3 complete:(id)a4
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v82 = a3;
  id v81 = a4;
  id v5 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_218274000, v5, OS_LOG_TYPE_DEFAULT, "initiator will import PCS data", buf, 2u);
  }

  [(KCPairingChannel *)self setCountOfReceivedItems:&unk_26C975F78];
  id v6 = [v82 objectForKeyedSubscript:@"o"];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    uint64_t v49 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218274000, v49, OS_LOG_TYPE_DEFAULT, "pairing: no octagon data, ending session", buf, 2u);
    }

    if ([(KCPairingChannel *)self grabbedLockAssertion])
    {
      CFTypeRef result = 0;
      if (!SecAKSKeybagDropLockAssertion(0, &result))
      {
        long long v50 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          CFTypeRef v122 = result;
          _os_log_impl(&dword_218274000, v50, OS_LOG_TYPE_DEFAULT, "pairing: Failed to drop AKS lock assertion: %@", buf, 0xCu);
        }
      }
      CFTypeRef v51 = result;
      if (result)
      {
        CFTypeRef result = 0;
        CFRelease(v51);
      }
      [(KCPairingChannel *)self setGrabbedLockAssertion:0];
    }
    v52 = [AAFAnalyticsEventSecurity alloc];
    __int16 v53 = [(KCPairingChannel *)self peerVersionContext];
    int v54 = [v53 altDSID];
    uint64_t v55 = [(KCPairingChannel *)self peerVersionContext];
    v56 = [v55 flowID];
    os_signpost_id_t v57 = [(KCPairingChannel *)self peerVersionContext];
    uint64_t v58 = [v57 deviceSessionID];
    LOBYTE(v78) = 1;
    v83 = [(AAFAnalyticsEventSecurity *)v52 initWithKeychainCircleMetrics:0 altDSID:v54 flowID:v56 deviceSessionID:v58 eventName:@"com.apple.security.pairingDidNotReceivePCSData" testsAreEnabled:metricsAreEnabled canSendMetrics:v78 category:&unk_26C975FC0];

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v83 success:0 error:0];
    (*((void (**)(id, uint64_t, void, void))v81 + 2))(v81, 1, 0, 0);
  }
  else
  {
    v83 = [v82 objectForKeyedSubscript:@"o"];
    v79 = [(AAFAnalyticsEventSecurity *)v83 objectForKeyedSubscript:@"e"];
    v96 = [(AAFAnalyticsEventSecurity *)v83 objectForKeyedSubscript:@"a"];
    id v80 = [(AAFAnalyticsEventSecurity *)v83 objectForKeyedSubscript:@"n"];
    int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v96, "count"));
    [(KCPairingChannel *)self setCountOfReceivedItems:v8];

    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id obj = [v96 allKeys];
    uint64_t v97 = [obj countByEnumeratingWithState:&v105 objects:v120 count:16];
    if (v97)
    {
      unsigned int v93 = 0;
      unsigned int v98 = 0;
      uint64_t v95 = *(void *)v106;
      uint64_t v94 = *MEMORY[0x263F171B8];
      uint64_t v91 = *MEMORY[0x263F170A8];
      uint64_t v92 = *MEMORY[0x263F170B0];
      uint64_t v89 = *MEMORY[0x263F16ED8];
      uint64_t v90 = *MEMORY[0x263F16E80];
      uint64_t v88 = *MEMORY[0x263F17088];
      uint64_t v87 = *MEMORY[0x263F17018];
      uint64_t v86 = *MEMORY[0x263F17580];
      uint64_t v85 = *MEMORY[0x263F08410];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v106 != v95)
          {
            uint64_t v10 = v9;
            objc_enumerationMutation(obj);
            uint64_t v9 = v10;
          }
          uint64_t v101 = v9;
          os_signpost_id_t v11 = *(const void **)(*((void *)&v105 + 1) + 8 * v9);
          context = (void *)MEMORY[0x21D4660B0]();
          int v12 = secLogObjForScope("pairing");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            CFTypeRef v122 = v11;
            _os_log_impl(&dword_218274000, v12, OS_LOG_TYPE_DEFAULT, "adding keychain entry key: %@", buf, 0xCu);
          }

          CFDictionaryRef v13 = [v96 objectForKeyedSubscript:v11];
          CFTypeRef result = 0;
          int v14 = secLogObjForScope("pairing");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            CFTypeRef v122 = v13;
            _os_log_impl(&dword_218274000, v14, OS_LOG_TYPE_DEFAULT, "adding keychain entry data %@", buf, 0xCu);
          }

          OSStatus v15 = SecItemAdd(v13, &result);
          OSStatus v16 = v15;
          if (v15 == -25299)
          {
            id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            __int16 v19 = [(__CFDictionary *)v13 objectForKeyedSubscript:v94];
            [v18 setObject:v19 forKeyedSubscript:v94];

            int v20 = [(__CFDictionary *)v13 objectForKeyedSubscript:v92];
            [v18 setObject:v20 forKeyedSubscript:v92];

            uint64_t v21 = [(__CFDictionary *)v13 objectForKeyedSubscript:v91];
            [v18 setObject:v21 forKeyedSubscript:v91];

            double v22 = [(__CFDictionary *)v13 objectForKeyedSubscript:v90];
            [v18 setObject:v22 forKeyedSubscript:v90];

            __int16 v23 = [(__CFDictionary *)v13 objectForKeyedSubscript:v89];
            [v18 setObject:v23 forKeyedSubscript:v89];

            os_signpost_id_t v24 = [(__CFDictionary *)v13 objectForKeyedSubscript:v88];
            [v18 setObject:v24 forKeyedSubscript:v88];

            int v25 = [(__CFDictionary *)v13 objectForKeyedSubscript:v87];
            [v18 setObject:v25 forKeyedSubscript:v87];

            uint64_t v26 = [(__CFDictionary *)v13 objectForKeyedSubscript:v86];
            [v18 setObject:v26 forKeyedSubscript:v86];

            CFDictionaryRef attributesToUpdate = (CFDictionaryRef)[(__CFDictionary *)v13 mutableCopy];
            [(__CFDictionary *)attributesToUpdate setObject:0 forKeyedSubscript:v94];
            OSStatus v27 = SecItemUpdate((CFDictionaryRef)v18, attributesToUpdate);
            if (v27)
            {
              id v28 = [AAFAnalyticsEventSecurity alloc];
              uint64_t v29 = [(KCPairingChannel *)self peerVersionContext];
              BOOL v30 = [v29 altDSID];
              id v31 = [(KCPairingChannel *)self peerVersionContext];
              os_signpost_id_t v32 = [v31 flowID];
              int v33 = [(KCPairingChannel *)self peerVersionContext];
              int v34 = [v33 deviceSessionID];
              LOBYTE(v78) = 1;
              int v35 = [(AAFAnalyticsEventSecurity *)v28 initWithKeychainCircleMetrics:0 altDSID:v30 flowID:v32 deviceSessionID:v34 eventName:@"com.apple.security.pairingFailedToUpdateItemInKeychain" testsAreEnabled:metricsAreEnabled canSendMetrics:v78 category:&unk_26C975FC0];

              uint64_t v36 = [MEMORY[0x263F087E8] errorWithDomain:v85 code:v27 description:@"SecItemUpdate: failed to update PCS item in the keychain"];
              +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v35 success:0 error:v36];

              uint64_t v37 = secLogObjForScope("SecError");
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 67109120;
                LODWORD(v122) = v27;
                _os_log_impl(&dword_218274000, v37, OS_LOG_TYPE_DEFAULT, "pairing, SecItemUpdate failed %d", buf, 8u);
              }

              ++v98;
            }
            else
            {
              id v48 = secLogObjForScope("pairing");
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                CFTypeRef v122 = v13;
                _os_log_impl(&dword_218274000, v48, OS_LOG_TYPE_DEFAULT, "successfully updated pcs item: %@", buf, 0xCu);
              }

              ++v93;
            }
          }
          else if (v15)
          {
            uint64_t v38 = [AAFAnalyticsEventSecurity alloc];
            uint64_t v39 = [(KCPairingChannel *)self peerVersionContext];
            id v40 = [v39 altDSID];
            id v41 = [(KCPairingChannel *)self peerVersionContext];
            uint64_t v42 = [v41 flowID];
            long long v43 = [(KCPairingChannel *)self peerVersionContext];
            id v44 = [v43 deviceSessionID];
            LOBYTE(v78) = 1;
            id v45 = [(AAFAnalyticsEventSecurity *)v38 initWithKeychainCircleMetrics:0 altDSID:v40 flowID:v42 deviceSessionID:v44 eventName:@"com.apple.security.pairingFailedToAddItemToKeychain" testsAreEnabled:metricsAreEnabled canSendMetrics:v78 category:&unk_26C975FC0];

            int v46 = [MEMORY[0x263F087E8] errorWithDomain:v85 code:v16 description:@"SecItemAdd: failed to add PCS item to the keychain"];
            +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v45 success:0 error:v46];

            id v47 = secLogObjForScope("SecError");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 67109120;
              LODWORD(v122) = v16;
              _os_log_impl(&dword_218274000, v47, OS_LOG_TYPE_DEFAULT, "pairing: failed to add PCS item: %d", buf, 8u);
            }

            ++v98;
          }
          else
          {
            __int16 v17 = secLogObjForScope("pairing");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              CFTypeRef v122 = v13;
              _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "successfully added pcs item: %@", buf, 0xCu);
            }

            ++v93;
          }

          uint64_t v9 = v101 + 1;
        }
        while (v97 != v101 + 1);
        uint64_t v97 = [obj countByEnumeratingWithState:&v105 objects:v120 count:16];
      }
      while (v97);
    }
    else
    {
      unsigned int v93 = 0;
      unsigned int v98 = 0;
    }

    v59 = [AAFAnalyticsEventSecurity alloc];
    v118[0] = @"pairingSuccessfulImportCount";
    v60 = [NSNumber numberWithInt:v93];
    v118[1] = @"pairingFailedImportCount";
    v119[0] = v60;
    v61 = [NSNumber numberWithInt:v98];
    v119[1] = v61;
    id v62 = [NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:2];
    v63 = [(KCPairingChannel *)self peerVersionContext];
    uint64_t v64 = [v63 altDSID];
    v65 = [(KCPairingChannel *)self peerVersionContext];
    v66 = [v65 flowID];
    int v67 = [(KCPairingChannel *)self peerVersionContext];
    v68 = [v67 deviceSessionID];
    LOBYTE(v78) = 1;
    int v69 = [(AAFAnalyticsEventSecurity *)v59 initWithKeychainCircleMetrics:v62 altDSID:v64 flowID:v66 deviceSessionID:v68 eventName:@"com.apple.security.pairingImportKeychainResults" testsAreEnabled:metricsAreEnabled canSendMetrics:v78 category:&unk_26C975FC0];

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v69 success:v98 != 0 error:0];
    if ([v79 isEqualToNumber:MEMORY[0x263EFFA88]])
    {
      if ([(KCPairingChannel *)self grabbedLockAssertion])
      {
        CFTypeRef result = 0;
        if (!SecAKSKeybagDropLockAssertion(0, &result))
        {
          uint64_t v70 = secLogObjForScope("SecError");
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            CFTypeRef v122 = result;
            _os_log_impl(&dword_218274000, v70, OS_LOG_TYPE_DEFAULT, "pairing: Failed to drop AKS lock assertion: %@", buf, 0xCu);
          }
        }
        CFTypeRef v71 = result;
        if (result)
        {
          CFTypeRef result = 0;
          CFRelease(v71);
        }
        [(KCPairingChannel *)self setGrabbedLockAssertion:0];
      }
      char v72 = secLogObjForScope("pairing");
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFTypeRef v122 = v80;
        _os_log_impl(&dword_218274000, v72, OS_LOG_TYPE_DEFAULT, "Sending ack %@", buf, 0xCu);
      }

      v114 = @"k";
      v115 = v80;
      int v116 = @"o";
      v73 = [NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      v117 = v73;
      v74 = [NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      (*((void (**)(id, uint64_t, void *, void))v81 + 2))(v81, 1, v74, 0);
    }
    else
    {
      CFTypeRef result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)&result, self);
      v103[0] = MEMORY[0x263EF8330];
      v103[1] = 3221225472;
      v103[2] = __52__KCPairingChannel_initiatorPCSDataPacket_complete___block_invoke;
      v103[3] = &unk_2643146D0;
      objc_copyWeak(&v104, (id *)&result);
      [(KCPairingChannel *)self setNextState:v103];
      v75 = secLogObjForScope("pairing");
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFTypeRef v122 = v80;
        _os_log_impl(&dword_218274000, v75, OS_LOG_TYPE_DEFAULT, "Sending ack %@", buf, 0xCu);
      }

      uint64_t v110 = @"k";
      v111 = v80;
      uint64_t v112 = @"o";
      v76 = [NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
      char v113 = v76;
      uint64_t v77 = [NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
      (*((void (**)(id, void, void *, void))v81 + 2))(v81, 0, v77, 0);

      objc_destroyWeak(&v104);
      objc_destroyWeak((id *)&result);
    }
  }
}

void __52__KCPairingChannel_initiatorPCSDataPacket_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorPCSDataPacket:v6 complete:v5];
}

- (void)initiatorFourthPacket:(id)a3 complete:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v41 = a4;
  id v5 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_218274000, v5, OS_LOG_TYPE_DEFAULT, "initiator packet 4", buf, 2u);
  }

  *(void *)long long buf = 0;
  v60 = buf;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  id v6 = _OctagonSignpostLogSystem();
  os_signpost_id_t v7 = _OctagonSignpostCreate();
  uint64_t v9 = v8;

  uint64_t v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v65 = 0;
    _os_signpost_emit_with_name_impl(&dword_218274000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PairingChannelInitiatorMessage4", " enableTelemetry=YES ", v65, 2u);
  }

  int v12 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v65 = 134217984;
    *(void *)&v65[4] = v7;
    _os_log_impl(&dword_218274000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorMessage4  enableTelemetry=YES ", v65, 0xCu);
  }

  CFDictionaryRef v13 = [AAFAnalyticsEventSecurity alloc];
  int v14 = [(KCPairingChannel *)self peerVersionContext];
  OSStatus v15 = [v14 altDSID];
  OSStatus v16 = [(KCPairingChannel *)self peerVersionContext];
  __int16 v17 = [v16 flowID];
  id v18 = [(KCPairingChannel *)self peerVersionContext];
  __int16 v19 = [v18 deviceSessionID];
  LOBYTE(v40) = 1;
  int v20 = [(AAFAnalyticsEventSecurity *)v13 initWithKeychainCircleMetrics:0 altDSID:v15 flowID:v17 deviceSessionID:v19 eventName:@"com.apple.security.initiatorImportsInitialSyncData" testsAreEnabled:metricsAreEnabled canSendMetrics:v40 category:&unk_26C975FC0];

  [(KCPairingChannel *)self setNextStateError:0 complete:0];
  uint64_t v21 = [v42 objectForKeyedSubscript:@"d"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v63 = @"numberOfKeychainItemsAdded";
    double v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
    uint64_t v64 = v22;
    __int16 v23 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    [(AAFAnalyticsEventSecurity *)v20 addMetrics:v23];

    os_signpost_id_t v24 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v21 count];
      *(_DWORD *)v65 = 134217984;
      *(void *)&v65[4] = v25;
      _os_log_impl(&dword_218274000, v24, OS_LOG_TYPE_DEFAULT, "importing %lu items", v65, 0xCu);
    }

    uint64_t v26 = [(KCPairingChannel *)self connection];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_236;
    v50[3] = &unk_264314860;
    os_signpost_id_t v54 = v7;
    uint64_t v55 = v9;
    __int16 v53 = buf;
    OSStatus v27 = v20;
    CFTypeRef v51 = v27;
    id v28 = v41;
    id v52 = v28;
    uint64_t v29 = [v26 remoteObjectProxyWithErrorHandler:v50];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_237;
    v44[3] = &unk_264314888;
    void v44[4] = self;
    id v47 = buf;
    os_signpost_id_t v48 = v7;
    uint64_t v49 = v9;
    id v45 = v27;
    id v46 = v28;
    [v29 importInitialSyncCredentials:v21 complete:v44];
  }
  else
  {
    BOOL v30 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v65 = 0;
      _os_log_impl(&dword_218274000, v30, OS_LOG_TYPE_DEFAULT, "initiator no items to import", v65, 2u);
    }

    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    os_signpost_id_t v32 = _OctagonSignpostLogSystem();
    int v33 = v32;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      int v34 = v60[24];
      *(_DWORD *)v65 = 67240192;
      *(_DWORD *)&v65[4] = v34;
      _os_signpost_emit_with_name_impl(&dword_218274000, v33, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelInitiatorMessage4", " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", v65, 8u);
    }

    int v35 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v65 = 134218496;
      int v36 = v60[24];
      *(void *)&v65[4] = v7;
      __int16 v66 = 2048;
      double v67 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      __int16 v68 = 1026;
      int v69 = v36;
      _os_log_impl(&dword_218274000, v35, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", v65, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v20 success:1 error:0];
    if (CloudServicesLibraryCore()
      && getSecureBackupIsGuitarfishEnabledSymbolLoc()
      && soft_SecureBackupIsGuitarfishEnabled()
      && [(KCPairingChannel *)self initiatorExpectPCSData])
    {
      uint64_t v37 = secLogObjForScope("pairing");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_218274000, v37, OS_LOG_TYPE_DEFAULT, "initiator will wait for PCS data", v65, 2u);
      }

      CFTypeRef v58 = 0;
      if (SecAKSKeybagHoldLockAssertion(0, 600, &v58))
      {
        [(KCPairingChannel *)self setGrabbedLockAssertion:1];
      }
      else
      {
        uint64_t v38 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v65 = 138412290;
          *(void *)&v65[4] = v58;
          _os_log_impl(&dword_218274000, v38, OS_LOG_TYPE_DEFAULT, "pairing: Unable to acquire AKS lock assertion: %@", v65, 0xCu);
        }
      }
      CFTypeRef v39 = v58;
      if (v58)
      {
        CFTypeRef v58 = 0;
        CFRelease(v39);
      }
      *(void *)v65 = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)v65, self);
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke;
      v56[3] = &unk_2643146D0;
      objc_copyWeak(&v57, (id *)v65);
      [(KCPairingChannel *)self setNextState:v56];
      objc_destroyWeak(&v57);
      objc_destroyWeak((id *)v65);
    }
    else
    {
      (*((void (**)(id, uint64_t, void, void))v41 + 2))(v41, 1, 0, 0);
    }
  }

  _Block_object_dispose(buf, 8);
}

void __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorPCSDataPacket:v6 complete:v5];
}

void __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_236(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  id v5 = _OctagonSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[7];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v11 = 67240192;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl(&dword_218274000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelInitiatorMessage4", " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", (uint8_t *)&v11, 8u);
  }

  uint64_t v9 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    int v10 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v12 = a1[7];
    __int16 v13 = 2048;
    double v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v15 = 1026;
    int v16 = v10;
    _os_log_impl(&dword_218274000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", (uint8_t *)&v11, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:0 error:v3];
  (*(void (**)(void))(a1[5] + 16))();
}

void __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_237(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)uint64_t v29 = a2;
    *(_WORD *)&void v29[4] = 2112;
    *(void *)&v29[6] = v5;
    _os_log_impl(&dword_218274000, v6, OS_LOG_TYPE_DEFAULT, "initiator importInitialSyncCredentials: %{BOOL}d: %@", buf, 0x12u);
  }

  if (a2) {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  }
  if (CloudServicesLibraryCore()
    && getSecureBackupIsGuitarfishEnabledSymbolLoc()
    && soft_SecureBackupIsGuitarfishEnabled()
    && [*(id *)(a1 + 32) initiatorExpectPCSData])
  {
    os_signpost_id_t v7 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "initiator will wait for PCS data", buf, 2u);
    }

    CFTypeRef cf = 0;
    if (SecAKSKeybagHoldLockAssertion(0, 600, &cf))
    {
      [*(id *)(a1 + 32) setGrabbedLockAssertion:1];
    }
    else
    {
      __int16 v15 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)uint64_t v29 = cf;
        _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "pairing: Unable to acquire AKS lock assertion: %@", buf, 0xCu);
      }
    }
    CFTypeRef v16 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v16);
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, *(id *)(a1 + 32));
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_238;
    v24[3] = &unk_2643146D0;
    objc_copyWeak(&v25, &location);
    [*(id *)(a1 + 32) setNextState:v24];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    id v18 = _OctagonSignpostLogSystem();
    __int16 v19 = v18;
    os_signpost_id_t v20 = *(void *)(a1 + 64);
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)uint64_t v29 = v21;
      _os_signpost_emit_with_name_impl(&dword_218274000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PairingChannelInitiatorMessage4", " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", buf, 8u);
    }

    double v22 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      int v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(void *)uint64_t v29 = *(void *)(a1 + 64);
      *(_WORD *)&v29[8] = 2048;
      *(double *)&v29[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
      __int16 v30 = 1026;
      int v31 = v23;
      _os_log_impl(&dword_218274000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:a2 error:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v8 = _OctagonSignpostGetNanoseconds();
    uint64_t v9 = _OctagonSignpostLogSystem();
    int v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 64);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)uint64_t v29 = v12;
      _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelInitiatorMessage4", " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", buf, 8u);
    }

    __int16 v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(void *)uint64_t v29 = *(void *)(a1 + 64);
      *(_WORD *)&v29[8] = 2048;
      *(double *)&v29[10] = (double)(unint64_t)v8 / 1000000000.0;
      __int16 v30 = 1026;
      int v31 = v14;
      _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:a2 error:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_238(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorPCSDataPacket:v6 complete:v5];
}

- (void)initiatorThirdPacket:(id)a3 complete:(id)a4
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v82 = a3;
  id v80 = (void (**)(id, uint64_t, void, void *))a4;
  id v6 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_218274000, v6, OS_LOG_TYPE_DEFAULT, "initiator packet 3", (uint8_t *)&buf, 2u);
  }

  os_signpost_id_t v7 = _OctagonSignpostLogSystem();
  uint64_t v8 = _OctagonSignpostCreate();
  id v81 = v9;
  int v10 = (char *)v8;

  os_signpost_id_t v11 = _OctagonSignpostLogSystem();
  int v12 = v11;
  unint64_t v77 = (unint64_t)(v10 - 1);
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_218274000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "PairingChannelInitiatorMessage3", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  __int16 v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorMessage3  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  int v14 = [AAFAnalyticsEventSecurity alloc];
  __int16 v15 = [(KCPairingChannel *)self peerVersionContext];
  CFTypeRef v16 = [v15 altDSID];
  uint64_t v17 = [(KCPairingChannel *)self peerVersionContext];
  id v18 = [v17 flowID];
  __int16 v19 = [(KCPairingChannel *)self peerVersionContext];
  os_signpost_id_t v20 = [v19 deviceSessionID];
  LOBYTE(v71) = 1;
  v84 = [(AAFAnalyticsEventSecurity *)v14 initWithKeychainCircleMetrics:0 altDSID:v16 flowID:v18 deviceSessionID:v20 eventName:@"com.apple.security.initiatorJoinsTrustSystems" testsAreEnabled:metricsAreEnabled canSendMetrics:v71 category:&unk_26C975FC0];

  [(KCPairingChannel *)self setNextStateError:0 complete:0];
  v83 = [v82 objectForKeyedSubscript:@"b"];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v107 = 0x2020000000;
  char v108 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (v83 && SOSCCIsSOSTrustAndSyncingEnabled())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
      os_signpost_id_t v54 = _OctagonSignpostLogSystem();
      uint64_t v55 = v54;
      if (v77 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        int v56 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
        *(_DWORD *)long long v105 = 67240192;
        *(_DWORD *)&v105[4] = v56;
        _os_signpost_emit_with_name_impl(&dword_218274000, v55, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v10, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 8u);
      }

      id v57 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v105 = 134218496;
        int v58 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
        *(void *)&v105[4] = v10;
        *(_WORD *)&v105[12] = 2048;
        *(double *)&v105[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
        *(_WORD *)&v105[22] = 1026;
        *(_DWORD *)&v105[24] = v58;
        _os_log_impl(&dword_218274000, v57, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 0x1Cu);
      }

      v59 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:5 userInfo:0];
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v84 success:0 error:v59];
      v80[2](v80, 1, 0, v59);
      goto LABEL_61;
    }
    *(void *)long long v105 = 0;
    *(void *)&v105[8] = v105;
    *(void *)&v105[16] = 0x2020000000;
    v105[24] = 0;
    int v21 = _OctagonSignpostLogSystem();
    uint64_t v22 = _OctagonSignpostCreate();
    uint64_t v78 = v23;
    os_signpost_id_t v24 = (char *)v22;

    id v25 = _OctagonSignpostLogSystem();
    uint64_t v26 = v25;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v103 = 0;
      _os_signpost_emit_with_name_impl(&dword_218274000, v26, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v24, "PairingChannelInitiatorJoinSOS", " enableTelemetry=YES ", v103, 2u);
    }

    OSStatus v27 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v103 = 134217984;
      id v104 = v24;
      _os_log_impl(&dword_218274000, v27, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorJoinSOS  enableTelemetry=YES ", v103, 0xCu);
    }

    v75 = [(KCPairingChannel *)self connection];
    v93[0] = MEMORY[0x263EF8330];
    v93[1] = 3221225472;
    v93[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke;
    v93[3] = &unk_264314720;
    unsigned int v98 = v24;
    v99 = v78;
    v100 = v10;
    uint64_t v101 = v81;
    v96 = v105;
    p_long long buf = &buf;
    id v28 = v84;
    uint64_t v94 = v28;
    uint64_t v29 = v80;
    id v95 = v29;
    v73 = [v75 remoteObjectProxyWithErrorHandler:v93];
    v74 = [(KCPairingChannel *)self peerVersionContext];
    char v72 = [v74 altDSID];
    __int16 v30 = [(KCPairingChannel *)self peerVersionContext];
    int v31 = [v30 flowID];
    uint64_t v32 = [(KCPairingChannel *)self peerVersionContext];
    int v33 = [v32 deviceSessionID];
    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_232;
    v87[3] = &unk_264314838;
    uint64_t v90 = v105;
    void v87[4] = self;
    v92[2] = v78;
    v92[3] = v10;
    v92[4] = v81;
    v92[1] = v24;
    uint64_t v91 = &buf;
    uint64_t v88 = v28;
    uint64_t v89 = v29;
    objc_copyWeak(v92, &location);
    [v73 joinCircleWithBlob:v83 altDSID:v72 flowID:v31 deviceSessionID:v33 canSendMetrics:1 version:1 complete:v87];

    objc_destroyWeak(v92);
    _Block_object_dispose(v105, 8);
  }
  if ([(KCPairingChannel *)self sessionSupportsOctagon])
  {
    uint64_t v79 = [v82 objectForKeyedSubscript:@"o"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v43 = secLogObjForScope((const char *)pairingScope);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v105 = 0;
        _os_log_impl(&dword_218274000, v43, OS_LOG_TYPE_DEFAULT, "initiatorThirdPacket octagonData missing or wrong class", v105, 2u);
      }

      uint64_t v44 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
      [(KCPairingChannel *)self setNextStateError:v44 complete:v80];
      id v45 = (OTPairingMessage *)v44;
      uint64_t v46 = _OctagonSignpostGetNanoseconds();
      id v47 = _OctagonSignpostLogSystem();
      os_signpost_id_t v48 = v47;
      if (v77 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        int v49 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
        *(_DWORD *)long long v105 = 67240192;
        *(_DWORD *)&v105[4] = v49;
        _os_signpost_emit_with_name_impl(&dword_218274000, v48, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v10, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 8u);
      }

      long long v50 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v105 = 134218496;
        int v51 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
        *(void *)&v105[4] = v10;
        *(_WORD *)&v105[12] = 2048;
        *(double *)&v105[14] = (double)(unint64_t)v46 / 1000000000.0;
        *(_WORD *)&v105[22] = 1026;
        *(_DWORD *)&v105[24] = v51;
        _os_log_impl(&dword_218274000, v50, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 0x1Cu);
      }

      id v52 = v45;
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v84 success:0 error:v45];
      goto LABEL_60;
    }
    v76 = [[OTPairingMessage alloc] initWithData:v79];
    if (![(OTPairingMessage *)v76 hasVoucher])
    {
      v60 = secLogObjForScope((const char *)pairingScope);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v105 = 0;
        _os_log_impl(&dword_218274000, v60, OS_LOG_TYPE_DEFAULT, "initiatorThirdPacket pairingMessage has no voucher", v105, 2u);
      }

      int v34 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
      [(KCPairingChannel *)self setNextStateError:v34 complete:v80];
      uint64_t v61 = _OctagonSignpostGetNanoseconds();
      char v62 = _OctagonSignpostLogSystem();
      v63 = v62;
      if (v77 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
      {
        int v64 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
        *(_DWORD *)long long v105 = 67240192;
        *(_DWORD *)&v105[4] = v64;
        _os_signpost_emit_with_name_impl(&dword_218274000, v63, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v10, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 8u);
      }

      v65 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v105 = 134218496;
        int v66 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
        *(void *)&v105[4] = v10;
        *(_WORD *)&v105[12] = 2048;
        *(double *)&v105[14] = (double)(unint64_t)v61 / 1000000000.0;
        *(_WORD *)&v105[22] = 1026;
        *(_DWORD *)&v105[24] = v66;
        _os_log_impl(&dword_218274000, v65, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v84 success:0 error:v34];
      goto LABEL_59;
    }
    int v34 = [(OTPairingMessage *)v76 voucher];
    int v35 = 0;
    id v36 = 0;
    int v37 = 0;
    v103[0] = 0;
    while (1)
    {
      uint64_t v38 = secLogObjForScope((const char *)pairingScope);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v105 = 67109120;
        *(_DWORD *)&v105[4] = v37 + 1;
        _os_log_impl(&dword_218274000, v38, OS_LOG_TYPE_DEFAULT, "Attempt %d, calling join", v105, 8u);
      }

      id v85 = 0;
      id v86 = v35;
      BOOL v39 = -[KCPairingChannel join:voucher:eventS:setupPairingChannelSignPost:finishPairing:error:](self, "join:voucher:eventS:setupPairingChannelSignPost:finishPairing:error:", &v86, v34, v84, v10, v81, v103, &v85);
      id v40 = v86;

      id v36 = v85;
      if (v39) {
        break;
      }
      if (!+[KCPairingChannel retryable:v36])
      {
        uint64_t v70 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v105 = 136315650;
          *(void *)&v105[4] = pairingScope;
          *(_WORD *)&v105[12] = 1024;
          *(_DWORD *)&v105[14] = v37 + 1;
          *(_WORD *)&v105[18] = 2112;
          *(void *)&v105[20] = v36;
          _os_log_impl(&dword_218274000, v70, OS_LOG_TYPE_DEFAULT, "%s: Attempt %d failed join: %@", v105, 0x1Cu);
        }

        id v69 = 0;
        BOOL v68 = 1;
        id v67 = v36;
        goto LABEL_57;
      }
      id v41 = secLogObjForScope((const char *)pairingScope);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v105 = 67109120;
        *(_DWORD *)&v105[4] = v37 + 2;
        _os_log_impl(&dword_218274000, v41, OS_LOG_TYPE_DEFAULT, "Attempt %d retrying join", v105, 8u);
      }

      ++v37;
      int v35 = v40;
      if (v37 >= joinMaxRetry)
      {
        id v42 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v105 = 67109120;
          *(_DWORD *)&v105[4] = joinMaxRetry;
          _os_log_impl(&dword_218274000, v42, OS_LOG_TYPE_DEFAULT, "pairing: failed to join %d times, bailing.", v105, 8u);
        }

        v80[2](v80, 1, 0, v36);
LABEL_58:

LABEL_59:
        id v52 = v76;
LABEL_60:

        v59 = (void *)v79;
LABEL_61:

        goto LABEL_62;
      }
    }
    id v67 = 0;
    BOOL v68 = v103[0] != 0;
    id v69 = v40;
LABEL_57:
    ((void (**)(id, uint64_t, id, void *))v80)[2](v80, v68, v69, v67);
    goto LABEL_58;
  }
LABEL_62:
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  id v5 = _OctagonSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl(&dword_218274000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelInitiatorJoinSOS", " OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorJoinSOS}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v9 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[8];
    int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v19 = 134218496;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v11;
    _os_log_impl(&dword_218274000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorJoinSOS  OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorJoinSOS}d ", (uint8_t *)&v19, 0x1Cu);
  }

  uint64_t v12 = _OctagonSignpostGetNanoseconds();
  __int16 v13 = _OctagonSignpostLogSystem();
  int v14 = v13;
  os_signpost_id_t v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v16 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
    int v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl(&dword_218274000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218496;
    int v18 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v20 = a1[10];
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)v12 / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v18;
    _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", (uint8_t *)&v19, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:0 error:v3];
  (*(void (**)(void))(a1[5] + 16))();
}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_232(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5 && a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  os_signpost_id_t v7 = _OctagonSignpostLogSystem();
  int v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 80);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(_DWORD *)long long buf = 67240192;
    *(_DWORD *)int v58 = v10;
    _os_signpost_emit_with_name_impl(&dword_218274000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PairingChannelInitiatorJoinSOS", " OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorJoinSOS}d ", buf, 8u);
  }

  int v11 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 80);
    int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(_DWORD *)long long buf = 134218496;
    *(void *)int v58 = v12;
    *(_WORD *)&v58[8] = 2048;
    *(double *)&v58[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v59 = 1026;
    int v60 = v13;
    _os_log_impl(&dword_218274000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorJoinSOS  OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorJoinSOS}d ", buf, 0x1Cu);
  }

  if (v5 || [*(id *)(a1 + 32) testFailSOS])
  {
    int v14 = [*(id *)(a1 + 32) sessionSupportsOctagon];
    os_signpost_id_t v15 = secLogObjForScope("pairing");
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "failed to join circle with blob, continuing to handle octagon protocol", buf, 2u);
      }
    }
    else
    {
      if (v16)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "failed to join circle with blob", buf, 2u);
      }

      uint64_t v17 = _OctagonSignpostGetNanoseconds();
      int v18 = _OctagonSignpostLogSystem();
      int v19 = v18;
      os_signpost_id_t v20 = *(void *)(a1 + 96);
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)int v58 = v21;
        _os_signpost_emit_with_name_impl(&dword_218274000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      double v22 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(void *)int v58 = *(void *)(a1 + 96);
        *(_WORD *)&v58[8] = 2048;
        *(double *)&v58[10] = (double)(unint64_t)v17 / 1000000000.0;
        __int16 v59 = 1026;
        int v60 = v23;
        _os_log_impl(&dword_218274000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:0 error:v5];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else if ([*(id *)(a1 + 32) sessionSupportsOctagon])
  {
    int v24 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218274000, v24, OS_LOG_TYPE_DEFAULT, "initiator circle join complete", buf, 2u);
    }
  }
  else
  {
    if (([*(id *)(a1 + 32) sessionSupportsOctagon] & 1) == 0) {
      [*(id *)(a1 + 32) waitForOctagonUpgrade];
    }
    id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v26 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = WeakRetained[10];
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)int v58 = v27;
      *(_WORD *)&v58[4] = 2112;
      *(void *)&v58[6] = 0;
      _os_log_impl(&dword_218274000, v26, OS_LOG_TYPE_DEFAULT, "initiator circle join complete, more data: %{BOOL}d: %@", buf, 0x12u);
    }

    if (WeakRetained[10])
    {
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_233;
      v55[3] = &unk_2643146D0;
      objc_copyWeak(&v56, (id *)(a1 + 72));
      [WeakRetained setNextState:v55];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      uint64_t v28 = _OctagonSignpostGetNanoseconds();
      uint64_t v29 = _OctagonSignpostLogSystem();
      __int16 v30 = v29;
      os_signpost_id_t v31 = *(void *)(a1 + 96);
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        int v32 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)int v58 = v32;
        _os_signpost_emit_with_name_impl(&dword_218274000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      int v33 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v34 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(void *)int v58 = *(void *)(a1 + 96);
        *(_WORD *)&v58[8] = 2048;
        *(double *)&v58[10] = (double)(unint64_t)v28 / 1000000000.0;
        __int16 v59 = 1026;
        int v60 = v34;
        _os_log_impl(&dword_218274000, v33, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:1 error:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      objc_destroyWeak(&v56);
    }
    else if (CloudServicesLibraryCore() {
           && getSecureBackupIsGuitarfishEnabledSymbolLoc()
    }
           && soft_SecureBackupIsGuitarfishEnabled()
           && WeakRetained[12])
    {
      int v35 = secLogObjForScope("pairing");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_218274000, v35, OS_LOG_TYPE_DEFAULT, "initiator will wait for PCS data", buf, 2u);
      }

      CFTypeRef cf = 0;
      if (SecAKSKeybagHoldLockAssertion(0, 600, &cf))
      {
        [*(id *)(a1 + 32) setGrabbedLockAssertion:1];
      }
      else
      {
        long long v43 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)int v58 = cf;
          _os_log_impl(&dword_218274000, v43, OS_LOG_TYPE_DEFAULT, "pairing: Unable to acquire AKS lock assertion: %@", buf, 0xCu);
        }
      }
      CFTypeRef v44 = cf;
      if (cf)
      {
        CFTypeRef cf = 0;
        CFRelease(v44);
      }
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_234;
      v52[3] = &unk_2643146D0;
      objc_copyWeak(&v53, (id *)(a1 + 72));
      [*(id *)(a1 + 32) setNextState:v52];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      uint64_t v45 = _OctagonSignpostGetNanoseconds();
      uint64_t v46 = _OctagonSignpostLogSystem();
      id v47 = v46;
      os_signpost_id_t v48 = *(void *)(a1 + 96);
      if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        int v49 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)int v58 = v49;
        _os_signpost_emit_with_name_impl(&dword_218274000, v47, OS_SIGNPOST_INTERVAL_END, v48, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      long long v50 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v51 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(void *)int v58 = *(void *)(a1 + 96);
        *(_WORD *)&v58[8] = 2048;
        *(double *)&v58[10] = (double)(unint64_t)v45 / 1000000000.0;
        __int16 v59 = 1026;
        int v60 = v51;
        _os_log_impl(&dword_218274000, v50, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:a2 error:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      objc_destroyWeak(&v53);
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      uint64_t v36 = _OctagonSignpostGetNanoseconds();
      int v37 = _OctagonSignpostLogSystem();
      uint64_t v38 = v37;
      os_signpost_id_t v39 = *(void *)(a1 + 96);
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        int v40 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)int v58 = v40;
        _os_signpost_emit_with_name_impl(&dword_218274000, v38, OS_SIGNPOST_INTERVAL_END, v39, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      id v41 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v42 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(void *)int v58 = *(void *)(a1 + 96);
        *(_WORD *)&v58[8] = 2048;
        *(double *)&v58[10] = (double)(unint64_t)v36 / 1000000000.0;
        __int16 v59 = 1026;
        int v60 = v42;
        _os_log_impl(&dword_218274000, v41, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:1 error:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_233(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorFourthPacket:v6 complete:v5];
}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_234(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorPCSDataPacket:v6 complete:v5];
}

- (BOOL)join:(id *)a3 voucher:(id)a4 eventS:(id)a5 setupPairingChannelSignPost:(octagon_signpost_s)a6 finishPairing:(BOOL *)a7 error:(id *)a8
{
  var1 = (void *)a6.var1;
  var0 = (void *)a6.var0;
  id v11 = a4;
  id v12 = a5;
  uint64_t v47 = 0;
  os_signpost_id_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v41 = 0;
  int v42 = &v41;
  uint64_t v43 = 0x3032000000;
  CFTypeRef v44 = __Block_byref_object_copy_;
  uint64_t v45 = __Block_byref_object_dispose_;
  id v46 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy_;
  int v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  int v13 = [(KCPairingChannel *)self otControl];
  int v14 = [(KCPairingChannel *)self controlArguments];
  os_signpost_id_t v15 = [(KCPairingChannel *)self joiningConfiguration];
  BOOL v16 = [v11 voucher];
  uint64_t v17 = [v11 voucherSignature];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  void v25[2] = __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke;
  v25[3] = &unk_264314810;
  v31[1] = var0;
  v31[2] = var1;
  v25[4] = self;
  int v27 = v39;
  id v18 = v12;
  id v26 = v18;
  uint64_t v28 = &v41;
  uint64_t v29 = &v47;
  objc_copyWeak(v31, &location);
  __int16 v30 = &v33;
  v31[3] = a7;
  [v13 rpcJoinWithArguments:v14 configuration:v15 vouchData:v16 vouchSig:v17 reply:v25];

  if (a8)
  {
    int v19 = (void *)v42[5];
    if (v19) {
      *a8 = v19;
    }
  }
  if (a3) {
    *a3 = (id) v34[5];
  }
  char v20 = *((unsigned char *)v48 + 24);
  objc_destroyWeak(v31);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v20;
}

void __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3 || [*(id *)(a1 + 32) testFailOctagon])
  {
    BOOL v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [*(id *)(a1 + 32) counter];
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)id v52 = v5;
      *(_WORD *)&void v52[4] = 2112;
      *(void *)&v52[6] = v3;
      _os_log_impl(&dword_218274000, v4, OS_LOG_TYPE_DEFAULT, "ot-pairing: failed to create %d message: %@", buf, 0x12u);
    }

    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    os_signpost_id_t v7 = _OctagonSignpostLogSystem();
    int v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 88);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)id v52 = v10;
      _os_signpost_emit_with_name_impl(&dword_218274000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
    }

    id v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(void *)id v52 = *(void *)(a1 + 88);
      *(_WORD *)&v52[8] = 2048;
      *(double *)&v52[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
      __int16 v53 = 1026;
      int v54 = v12;
      _os_log_impl(&dword_218274000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:0 error:v3];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = v3;
    id WeakRetained = *(unsigned char **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }
  else
  {
    BOOL v16 = secLogObjForScope((const char *)pairingScope);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218274000, v16, OS_LOG_TYPE_DEFAULT, "initiatorThirdPacket successfully joined Octagon", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    if (SOSCCIsSOSTrustAndSyncingEnabled() && WeakRetained[10])
    {
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke_230;
      v49[3] = &unk_2643146D0;
      objc_copyWeak(&v50, (id *)(a1 + 80));
      [WeakRetained setNextState:v49];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v17 = _OctagonSignpostGetNanoseconds();
      id v18 = _OctagonSignpostLogSystem();
      int v19 = v18;
      os_signpost_id_t v20 = *(void *)(a1 + 88);
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)id v52 = v21;
        _os_signpost_emit_with_name_impl(&dword_218274000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      double v22 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(void *)id v52 = *(void *)(a1 + 88);
        *(_WORD *)&v52[8] = 2048;
        *(double *)&v52[10] = (double)(unint64_t)v17 / 1000000000.0;
        __int16 v53 = 1026;
        int v54 = v23;
        _os_log_impl(&dword_218274000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:1 error:0];
      uint64_t v24 = [MEMORY[0x263EFFA78] mutableCopy];
      uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
      id v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      **(unsigned char **)(a1 + 104) = 0;
      objc_destroyWeak(&v50);
    }
    else if (CloudServicesLibraryCore() {
           && getSecureBackupIsGuitarfishEnabledSymbolLoc()
    }
           && soft_SecureBackupIsGuitarfishEnabled()
           && WeakRetained[12])
    {
      CFTypeRef cf = 0;
      if (SecAKSKeybagHoldLockAssertion(0, 600, &cf))
      {
        [*(id *)(a1 + 32) setGrabbedLockAssertion:1];
      }
      else
      {
        int v34 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)id v52 = cf;
          _os_log_impl(&dword_218274000, v34, OS_LOG_TYPE_DEFAULT, "pairing: Unable to acquire AKS lock assertion: %@", buf, 0xCu);
        }
      }
      CFTypeRef v35 = cf;
      if (cf)
      {
        CFTypeRef cf = 0;
        CFRelease(v35);
      }
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke_231;
      v46[3] = &unk_2643146D0;
      objc_copyWeak(&v47, (id *)(a1 + 80));
      [WeakRetained setNextState:v46];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v36 = _OctagonSignpostGetNanoseconds();
      int v37 = _OctagonSignpostLogSystem();
      id v38 = v37;
      os_signpost_id_t v39 = *(void *)(a1 + 88);
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        int v40 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)id v52 = v40;
        _os_signpost_emit_with_name_impl(&dword_218274000, v38, OS_SIGNPOST_INTERVAL_END, v39, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      uint64_t v41 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v42 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(void *)id v52 = *(void *)(a1 + 88);
        *(_WORD *)&v52[8] = 2048;
        *(double *)&v52[10] = (double)(unint64_t)v36 / 1000000000.0;
        __int16 v53 = 1026;
        int v54 = v42;
        _os_log_impl(&dword_218274000, v41, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:1 error:0];
      uint64_t v43 = [MEMORY[0x263EFFA78] mutableCopy];
      uint64_t v44 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v45 = *(void **)(v44 + 40);
      *(void *)(v44 + 40) = v43;

      **(unsigned char **)(a1 + 104) = 0;
      objc_destroyWeak(&v47);
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v27 = _OctagonSignpostGetNanoseconds();
      uint64_t v28 = _OctagonSignpostLogSystem();
      uint64_t v29 = v28;
      os_signpost_id_t v30 = *(void *)(a1 + 88);
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        int v31 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)id v52 = v31;
        _os_signpost_emit_with_name_impl(&dword_218274000, v29, OS_SIGNPOST_INTERVAL_END, v30, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      int v32 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v33 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(void *)id v52 = *(void *)(a1 + 88);
        *(_WORD *)&v52[8] = 2048;
        *(double *)&v52[10] = (double)(unint64_t)v27 / 1000000000.0;
        __int16 v53 = 1026;
        int v54 = v33;
        _os_log_impl(&dword_218274000, v32, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:1 error:0];
      **(unsigned char **)(a1 + 104) = 1;
    }
  }
}

void __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke_230(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorFourthPacket:v6 complete:v5];
}

void __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorPCSDataPacket:v6 complete:v5];
}

- (void)initiatorCompleteSecondPacketOctagon:(id)a3 application:(id)a4 complete:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, uint64_t, void, id))a5;
  id v11 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_218274000, v11, OS_LOG_TYPE_DEFAULT, "initiator complete second packet 2 with octagon", buf, 2u);
  }

  int v12 = [v8 objectForKeyedSubscript:@"o"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = 0;
    int v14 = 0;
    while (1)
    {

      os_signpost_id_t v15 = [MEMORY[0x263EFF9A0] dictionary];
      BOOL v16 = secLogObjForScope((const char *)pairingScope);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v26) = v14 + 1;
        _os_log_impl(&dword_218274000, v16, OS_LOG_TYPE_DEFAULT, "Attempt %d, calling fetchPrepare", buf, 8u);
      }

      id v23 = 0;
      id v24 = v15;
      BOOL v17 = [(KCPairingChannel *)self fetchPrepare:&v24 application:v9 error:&v23];
      id v18 = v24;

      id v13 = v23;
      if (v17) {
        break;
      }
      if (!+[KCPairingChannel retryable:v13])
      {
        double v22 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315650;
          uint64_t v26 = pairingScope;
          __int16 v27 = 1024;
          int v28 = v14 + 1;
          __int16 v29 = 2112;
          id v30 = v13;
          _os_log_impl(&dword_218274000, v22, OS_LOG_TYPE_DEFAULT, "%s: Attempt %d, failed fetching prepare %@", buf, 0x1Cu);
        }

        v10[2](v10, 1, 0, v13);
        goto LABEL_22;
      }
      int v19 = secLogObjForScope((const char *)pairingScope);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v26) = v14 + 2;
        _os_log_impl(&dword_218274000, v19, OS_LOG_TYPE_DEFAULT, "Attempt %d, retrying fetching prepare", buf, 8u);
      }
      ++v14;

      if (v14 >= prepareMaxRetry)
      {
        os_signpost_id_t v20 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 67109120;
          LODWORD(v26) = prepareMaxRetry;
          _os_log_impl(&dword_218274000, v20, OS_LOG_TYPE_DEFAULT, "pairing: failed to fetch prepare %d times, bailing.", buf, 8u);
        }

        v10[2](v10, 1, 0, v13);
        goto LABEL_23;
      }
    }
    ((void (**)(id, uint64_t, id, id))v10)[2](v10, 0, v18, 0);
LABEL_22:

    goto LABEL_23;
  }
  int v21 = secLogObjForScope((const char *)pairingScope);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_218274000, v21, OS_LOG_TYPE_DEFAULT, "initiatorCompleteSecondPacketOctagon octagonData missing or wrong class", buf, 2u);
  }

  id v13 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
  [(KCPairingChannel *)self setNextStateError:v13 complete:v10];
LABEL_23:
}

- (BOOL)fetchPrepare:(id *)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  int v32 = __Block_byref_object_copy_;
  int v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  __int16 v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  id v9 = [(KCPairingChannel *)self otControl];
  int v10 = [(KCPairingChannel *)self controlArguments];
  id v11 = [(KCPairingChannel *)self joiningConfiguration];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __51__KCPairingChannel_fetchPrepare_application_error___block_invoke;
  v17[3] = &unk_2643147E8;
  v17[4] = self;
  int v19 = &v29;
  os_signpost_id_t v20 = &v35;
  id v12 = v8;
  id v18 = v12;
  int v21 = &v23;
  objc_copyWeak(&v22, &location);
  [v9 rpcPrepareIdentityAsApplicantWithArguments:v10 configuration:v11 reply:v17];

  if (a3)
  {
    id v13 = (void *)v24[5];
    if (v13) {
      *a3 = v13;
    }
  }
  if (a5)
  {
    int v14 = (void *)v30[5];
    if (v14) {
      *a5 = v14;
    }
  }
  char v15 = *((unsigned char *)v36 + 24);
  objc_destroyWeak(&v22);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  objc_destroyWeak(&location);

  return v15;
}

void __51__KCPairingChannel_fetchPrepare_application_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v40 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v17 || [*(id *)(a1 + 32) testFailOctagon])
  {
    id v18 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [*(id *)(a1 + 32) counter];
      *(_DWORD *)long long buf = 67109378;
      int v48 = v19;
      __int16 v49 = 2112;
      id v50 = v17;
      _os_log_impl(&dword_218274000, v18, OS_LOG_TYPE_DEFAULT, "ot-pairing: failed to create %d message: %@", buf, 0x12u);
    }

    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    id v21 = v17;
    id v22 = *(OTPairingMessage **)(v20 + 40);
    *(void *)(v20 + 40) = v21;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v22 = objc_alloc_init(OTPairingMessage);
    uint64_t v23 = objc_alloc_init(OTSupportSOSMessage);
    [(OTPairingMessage *)v22 setSupportsSOS:v23];

    id v24 = objc_alloc_init(OTSupportOctagonMessage);
    [(OTPairingMessage *)v22 setSupportsOctagon:v24];

    uint64_t v25 = objc_alloc_init(OTApplicantToSponsorRound2M1);
    [(OTApplicantToSponsorRound2M1 *)v25 setPeerID:v40];
    [(OTApplicantToSponsorRound2M1 *)v25 setPermanentInfo:v13];
    [(OTApplicantToSponsorRound2M1 *)v25 setPermanentInfoSig:v14];
    [(OTApplicantToSponsorRound2M1 *)v25 setStableInfo:v15];
    [(OTApplicantToSponsorRound2M1 *)v25 setStableInfoSig:v16];
    if (SOSCCIsSOSTrustAndSyncingEnabled()) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 2;
    }
    __int16 v27 = [(OTPairingMessage *)v22 supportsSOS];
    [v27 setSupported:v26];

    id v28 = [(OTPairingMessage *)v22 supportsOctagon];
    [v28 setSupported:1];

    [(OTPairingMessage *)v22 setPrepare:v25];
    uint64_t v29 = *(void *)(a1 + 40);
    id v30 = secLogObjForScope((const char *)pairingScope);
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_218274000, v30, OS_LOG_TYPE_DEFAULT, "initiatorCompleteSecondPacketOctagon returning octagon and sos data", buf, 2u);
      }

      uint64_t v32 = *(void *)(a1 + 40);
      v45[0] = @"p";
      v45[1] = @"o";
      v46[0] = v32;
      int v33 = [(OTPairingMessage *)v22 data];
      v46[1] = v33;
      id v34 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
      uint64_t v35 = [v34 mutableCopy];
    }
    else
    {
      if (v31)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_218274000, v30, OS_LOG_TYPE_DEFAULT, "initiatorCompleteSecondPacketOctagon returning octagon data", buf, 2u);
      }

      uint64_t v43 = @"o";
      int v33 = [(OTPairingMessage *)v22 data];
      uint64_t v44 = v33;
      id v34 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      uint64_t v35 = [v34 mutableCopy];
    }
    uint64_t v36 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = v35;

    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __51__KCPairingChannel_fetchPrepare_application_error___block_invoke_226;
    v41[3] = &unk_2643146D0;
    char v38 = (id *)(a1 + 72);
    objc_copyWeak(&v42, v38);
    id WeakRetained = objc_loadWeakRetained(v38);
    [WeakRetained setNextState:v41];

    objc_destroyWeak(&v42);
  }
}

void __51__KCPairingChannel_fetchPrepare_application_error___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorThirdPacket:v6 complete:v5];
}

- (void)initiatorCompleteSecondPacketWithSOS:(id)a3 complete:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_218274000, v8, OS_LOG_TYPE_DEFAULT, "initiator complete second packet 2", buf, 2u);
  }

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  [(KCPairingChannel *)self setNextStateError:0 complete:0];
  *(void *)long long buf = 0;
  id v40 = buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  id v9 = _OctagonSignpostLogSystem();
  uint64_t v10 = _OctagonSignpostCreate();
  id v28 = v11;
  id v12 = (char *)v10;

  id v13 = _OctagonSignpostLogSystem();
  id v14 = v13;
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)uint64_t v44 = 0;
    _os_signpost_emit_with_name_impl(&dword_218274000, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v12, "PairingChannelInitiatorMakeSOSPeer", " enableTelemetry=YES ", v44, 2u);
  }

  id v15 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v44 = 134217984;
    uint64_t v45 = v12;
    _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorMakeSOSPeer  enableTelemetry=YES ", v44, 0xCu);
  }

  uint64_t v26 = v6;
  __int16 v27 = [(KCPairingChannel *)self connection];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke;
  v34[3] = &unk_264314798;
  uint64_t v37 = v12;
  char v38 = v28;
  uint64_t v36 = buf;
  id v16 = v7;
  id v35 = v16;
  uint64_t v25 = [v27 remoteObjectProxyWithErrorHandler:v34];
  id v17 = [(KCPairingChannel *)self peerVersionContext];
  id v18 = [v17 altDSID];
  int v19 = [(KCPairingChannel *)self peerVersionContext];
  uint64_t v20 = [v19 flowID];
  id v21 = [(KCPairingChannel *)self peerVersionContext];
  id v22 = [v21 deviceSessionID];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_219;
  v29[3] = &unk_2643147C0;
  v33[1] = v12;
  v33[2] = v28;
  uint64_t v32 = buf;
  void v29[4] = self;
  id v23 = v26;
  id v30 = v23;
  id v24 = v16;
  id v31 = v24;
  objc_copyWeak(v33, &location);
  [v25 myPeerInfo:v18 flowID:v20 deviceSessionID:v22 canSendMetrics:1 complete:v29];

  objc_destroyWeak(v33);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
}

void __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  id v5 = _OctagonSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
    int v11 = 67240192;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl(&dword_218274000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelInitiatorMakeSOSPeer", " OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer}d ", (uint8_t *)&v11, 8u);
  }

  id v9 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
    uint64_t v12 = a1[6];
    __int16 v13 = 2048;
    double v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v15 = 1026;
    int v16 = v10;
    _os_log_impl(&dword_218274000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMakeSOSPeer  OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer}d ", (uint8_t *)&v11, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = v6;
  if (v5 && !v6) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  id v9 = _OctagonSignpostLogSystem();
  int v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 72);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v25) = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelInitiatorMakeSOSPeer", " OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer}d ", buf, 8u);
  }

  __int16 v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v25 = *(void **)(a1 + 72);
    __int16 v26 = 2048;
    double v27 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v28 = 1026;
    int v29 = v14;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMakeSOSPeer  OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer}d ", buf, 0x1Cu);
  }

  if (v5 && ([*(id *)(a1 + 32) testFailSOS] & 1) == 0)
  {
    if (![*(id *)(a1 + 32) sessionSupportsOctagon])
    {
      uint64_t v16 = *(void *)(a1 + 48);
      id v22 = @"p";
      id v23 = v5;
      uint64_t v17 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      (*(void (**)(uint64_t, void, void *, void *))(v16 + 16))(v16, 0, v17, v7);

      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_220;
      v20[3] = &unk_2643146D0;
      id v18 = (id *)(a1 + 64);
      objc_copyWeak(&v21, v18);
      id WeakRetained = objc_loadWeakRetained(v18);
      [WeakRetained setNextState:v20];

      objc_destroyWeak(&v21);
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  if ([*(id *)(a1 + 32) sessionSupportsOctagon])
  {
LABEL_12:
    [*(id *)(a1 + 32) initiatorCompleteSecondPacketOctagon:*(void *)(a1 + 40) application:v5 complete:*(void *)(a1 + 48)];
    goto LABEL_18;
  }
  __int16 v15 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v25 = v7;
    _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "failed getting application: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_18:
}

void __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorThirdPacket:v6 complete:v5];
}

- (void)initiatorSecondPacket:(id)a3 complete:(id)a4
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v55 = a3;
  id v52 = a4;
  id v6 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_218274000, v6, OS_LOG_TYPE_DEFAULT, "initiator packet 2", buf, 2u);
  }

  *(void *)long long buf = 0;
  id v82 = buf;
  uint64_t v83 = 0x2020000000;
  char v84 = 0;
  os_signpost_id_t v7 = _OctagonSignpostLogSystem();
  uint64_t v8 = _OctagonSignpostCreate();
  uint64_t v50 = v9;
  os_signpost_id_t v10 = v8;

  os_signpost_id_t v11 = _OctagonSignpostLogSystem();
  int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v87) = 0;
    _os_signpost_emit_with_name_impl(&dword_218274000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PairingChannelInitiatorMessage2", " enableTelemetry=YES ", (uint8_t *)&v87, 2u);
  }

  __int16 v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v87) = 134217984;
    *(void *)((char *)&v87 + 4) = v10;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorMessage2  enableTelemetry=YES ", (uint8_t *)&v87, 0xCu);
  }

  os_signpost_id_t v54 = v10;
  int v14 = [AAFAnalyticsEventSecurity alloc];
  __int16 v15 = [(KCPairingChannel *)self peerVersionContext];
  uint64_t v16 = [v15 altDSID];
  uint64_t v17 = [(KCPairingChannel *)self peerVersionContext];
  id v18 = [v17 flowID];
  int v19 = [(KCPairingChannel *)self peerVersionContext];
  uint64_t v20 = [v19 deviceSessionID];
  LOBYTE(v45) = 1;
  uint64_t v51 = [(AAFAnalyticsEventSecurity *)v14 initWithKeychainCircleMetrics:0 altDSID:v16 flowID:v18 deviceSessionID:v20 eventName:@"com.apple.security.initiatorCreatesPacket3" testsAreEnabled:metricsAreEnabled canSendMetrics:v45 category:&unk_26C975FC0];

  __int16 v53 = [v55 objectForKeyedSubscript:@"o"];
  if (!v53)
  {
    id v21 = secLogObjForScope("pairing");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v87) = 0;
      _os_log_impl(&dword_218274000, v21, OS_LOG_TYPE_DEFAULT, "acceptor didn't send a octagon packet, so skipping all octagon flows", (uint8_t *)&v87, 2u);
    }

    [(KCPairingChannel *)self setSessionSupportsOctagon:0];
  }
  id v22 = [v55 objectForKeyedSubscript:@"c"];
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    id v23 = [v55 objectForKeyedSubscript:@"d"];
    BOOL v24 = v23 == 0;

    if (!v24)
    {
      uint64_t v25 = secLogObjForScope("pairing");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v87) = 0;
        _os_log_impl(&dword_218274000, v25, OS_LOG_TYPE_DEFAULT, "acceptor will send initial credentials", (uint8_t *)&v87, 2u);
      }

      [(KCPairingChannel *)self setAcceptorWillSendInitialSyncCredentials:1];
    }
  }
  if (CloudServicesLibraryCore())
  {
    if (getSecureBackupIsGuitarfishEnabledSymbolLoc())
    {
      if (soft_SecureBackupIsGuitarfishEnabled())
      {
        __int16 v26 = [v55 objectForKeyedSubscript:@"y"];
        if (v26)
        {
          double v27 = [v55 objectForKeyedSubscript:@"y"];
          int v28 = [v27 isEqualToNumber:MEMORY[0x263EFFA88]];

          if (v28)
          {
            int v29 = secLogObjForScope("pairing");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v87) = 0;
              _os_log_impl(&dword_218274000, v29, OS_LOG_TYPE_DEFAULT, "acceptor will send PCS data", (uint8_t *)&v87, 2u);
            }

            [(KCPairingChannel *)self setInitiatorExpectPCSData:1];
          }
        }
      }
    }
  }
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    *(void *)&long long v87 = 0;
    *((void *)&v87 + 1) = &v87;
    uint64_t v88 = 0x2020000000;
    char v89 = 0;
    uint64_t v30 = _OctagonSignpostLogSystem();
    uint64_t v31 = _OctagonSignpostCreate();
    uint64_t v49 = v32;
    os_signpost_id_t v33 = v31;

    id v34 = _OctagonSignpostLogSystem();
    id v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)id v85 = 0;
      _os_signpost_emit_with_name_impl(&dword_218274000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "PairingChannelInitiatorStashAccountCredential", " enableTelemetry=YES ", v85, 2u);
    }

    uint64_t v36 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v85 = 134217984;
      os_signpost_id_t v86 = v33;
      _os_log_impl(&dword_218274000, v36, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorStashAccountCredential  enableTelemetry=YES ", v85, 0xCu);
    }

    int v48 = v22;
    id v47 = [(KCPairingChannel *)self connection];
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke;
    v72[3] = &unk_264314720;
    os_signpost_id_t v77 = v33;
    uint64_t v78 = v49;
    os_signpost_id_t v79 = v54;
    uint64_t v80 = v50;
    v75 = &v87;
    v76 = buf;
    uint64_t v37 = v51;
    v73 = v37;
    id v38 = v52;
    id v74 = v38;
    uint64_t v46 = [v47 remoteObjectProxyWithErrorHandler:v72];
    os_signpost_id_t v39 = [(KCPairingChannel *)self peerVersionContext];
    id v40 = [v39 altDSID];
    uint64_t v41 = [(KCPairingChannel *)self peerVersionContext];
    char v42 = [v41 flowID];
    uint64_t v43 = [(KCPairingChannel *)self peerVersionContext];
    uint64_t v44 = [v43 deviceSessionID];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_213;
    v62[3] = &unk_264314770;
    int v66 = &v87;
    v62[4] = self;
    uint64_t v69 = v49;
    os_signpost_id_t v70 = v54;
    uint64_t v71 = v50;
    id v67 = buf;
    os_signpost_id_t v68 = v33;
    v63 = v37;
    id v65 = v38;
    id v64 = v55;
    [v46 stashAccountCredential:v48 altDSID:v40 flowID:v42 deviceSessionID:v44 canSendMetrics:1 complete:v62];

    id v22 = v48;
    _Block_object_dispose(&v87, 8);
  }
  else if ([(KCPairingChannel *)self sessionSupportsOctagon])
  {
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_218;
    v56[3] = &unk_264314748;
    __int16 v59 = buf;
    os_signpost_id_t v60 = v54;
    uint64_t v61 = v50;
    id v57 = v51;
    id v58 = v52;
    [(KCPairingChannel *)self initiatorCompleteSecondPacketOctagon:v55 application:0 complete:v56];
  }
  _Block_object_dispose(buf, 8);
}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  id v5 = _OctagonSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl(&dword_218274000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelInitiatorStashAccountCredential", " OctagonSignpostNamePairingChannelInitiatorStashAccountCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorStashAccountCredential}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v9 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[8];
    int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v19 = 134218496;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v11;
    _os_log_impl(&dword_218274000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorStashAccountCredential  OctagonSignpostNamePairingChannelInitiatorStashAccountCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorStashAccountCredential}d ", (uint8_t *)&v19, 0x1Cu);
  }

  uint64_t v12 = _OctagonSignpostGetNanoseconds();
  __int16 v13 = _OctagonSignpostLogSystem();
  int v14 = v13;
  os_signpost_id_t v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v16 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
    int v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl(&dword_218274000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PairingChannelInitiatorMessage2", " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218496;
    int v18 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v20 = a1[10];
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)v12 / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v18;
    _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v19, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:0 error:v3];
  (*(void (**)(void))(a1[5] + 16))();
}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_213(uint64_t a1, int a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5 && a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  os_signpost_id_t v7 = _OctagonSignpostLogSystem();
  int v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 80);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v38) = v10;
    _os_signpost_emit_with_name_impl(&dword_218274000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PairingChannelInitiatorStashAccountCredential", " OctagonSignpostNamePairingChannelInitiatorStashAccountCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorStashAccountCredential}d ", buf, 8u);
  }

  int v11 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void **)(a1 + 80);
    int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    *(_DWORD *)long long buf = 134218496;
    id v38 = v12;
    __int16 v39 = 2048;
    double v40 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v41 = 1026;
    int v42 = v13;
    _os_log_impl(&dword_218274000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorStashAccountCredential  OctagonSignpostNamePairingChannelInitiatorStashAccountCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorStashAccountCredential}d ", buf, 0x1Cu);
  }

  [*(id *)(a1 + 32) setNextStateError:0 complete:0];
  if (a2 && ![*(id *)(a1 + 32) testFailSOS])
  {
    uint64_t v25 = *(void *)(a1 + 48);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_216;
    v27[3] = &unk_264314748;
    uint64_t v30 = *(void *)(a1 + 72);
    long long v31 = *(_OWORD *)(a1 + 96);
    __int16 v26 = *(void **)(a1 + 32);
    id v28 = *(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 56);
    [v26 initiatorCompleteSecondPacketWithSOS:v25 complete:v27];

    uint64_t v17 = v28;
    goto LABEL_22;
  }
  int v14 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v38 = v5;
    _os_log_impl(&dword_218274000, v14, OS_LOG_TYPE_DEFAULT, "failed stash credentials: %@", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) sessionSupportsOctagon])
  {
    uint64_t v15 = *(void *)(a1 + 48);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_214;
    v32[3] = &unk_264314748;
    uint64_t v35 = *(void *)(a1 + 72);
    long long v36 = *(_OWORD *)(a1 + 96);
    int v16 = *(void **)(a1 + 32);
    id v33 = *(id *)(a1 + 40);
    id v34 = *(id *)(a1 + 56);
    [v16 initiatorCompleteSecondPacketOctagon:v15 application:0 complete:v32];

    uint64_t v17 = v33;
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v18 = _OctagonSignpostGetNanoseconds();
  int v19 = _OctagonSignpostLogSystem();
  uint64_t v20 = v19;
  os_signpost_id_t v21 = *(void *)(a1 + 96);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v38) = v22;
    _os_signpost_emit_with_name_impl(&dword_218274000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PairingChannelInitiatorMessage2", " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", buf, 8u);
  }

  __int16 v23 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218496;
    int v24 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    id v38 = *(id *)(a1 + 96);
    __int16 v39 = 2048;
    double v40 = (double)(unint64_t)v18 / 1000000000.0;
    __int16 v41 = 1026;
    int v42 = v24;
    _os_log_impl(&dword_218274000, v23, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", buf, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:*(void *)(a1 + 40) success:0 error:v5];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_23:
}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_218(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  os_signpost_id_t v9 = _OctagonSignpostLogSystem();
  int v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelInitiatorMessage2", " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 8u);
  }

  int v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) error:v6];
  (*(void (**)(void))(a1[5] + 16))();
}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_214(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  os_signpost_id_t v9 = _OctagonSignpostLogSystem();
  int v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelInitiatorMessage2", " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 8u);
  }

  int v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) error:v6];
  (*(void (**)(void))(a1[5] + 16))();
}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_216(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  os_signpost_id_t v9 = _OctagonSignpostLogSystem();
  int v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_218274000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelInitiatorMessage2", " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 8u);
  }

  int v13 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:a1[4] success:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) error:v6];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)initiatorFirstPacket:(id)a3 complete:(id)a4
{
  v84[1] = *MEMORY[0x263EF8340];
  id v49 = a3;
  id v51 = a4;
  id v6 = secLogObjForScope("pairing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_218274000, v6, OS_LOG_TYPE_DEFAULT, "initiator packet 1", buf, 2u);
  }

  id v7 = _OctagonSignpostLogSystem();
  uint64_t spid = _OctagonSignpostCreate();

  int v8 = _OctagonSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  unint64_t v50 = spid - 1;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218274000, v9, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PairingChannelInitiatorMessage1", " enableTelemetry=YES ", buf, 2u);
  }

  int v10 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = spid;
    _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorMessage1  enableTelemetry=YES ", buf, 0xCu);
  }

  if ([(KCPairingChannel *)self sessionSupportsSOS]
    && [(KCPairingChannel *)self sessionSupportsOctagon])
  {
    uint64_t v11 = 3;
  }
  else if ([(KCPairingChannel *)self sessionSupportsOctagon])
  {
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v11 = [(KCPairingChannel *)self sessionSupportsSOS];
  }
  int v12 = [AAFAnalyticsEventSecurity alloc];
  uint64_t v83 = @"supportedTrustSystem";
  int v13 = [NSNumber numberWithInteger:v11];
  v84[0] = v13;
  int v14 = [NSDictionary dictionaryWithObjects:v84 forKeys:&v83 count:1];
  int v15 = [(KCPairingChannel *)self peerVersionContext];
  uint64_t v16 = [v15 altDSID];
  __int16 v17 = [(KCPairingChannel *)self peerVersionContext];
  double v18 = [v17 flowID];
  __int16 v19 = [(KCPairingChannel *)self peerVersionContext];
  int v20 = [v19 deviceSessionID];
  LOBYTE(v48) = 1;
  uint64_t v21 = [(AAFAnalyticsEventSecurity *)v12 initWithKeychainCircleMetrics:v14 altDSID:v16 flowID:v18 deviceSessionID:v20 eventName:@"com.apple.security.initiatorCreatesPacket1" testsAreEnabled:metricsAreEnabled canSendMetrics:v48 category:&unk_26C975FC0];

  if (SOSCCIsSOSTrustAndSyncingEnabled()
    && ![(KCPairingChannel *)self ensureControlChannel])
  {
    long long v31 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:1 userInfo:0];
    [(KCPairingChannel *)self setNextStateError:v31 complete:v51];
    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    id v33 = _OctagonSignpostLogSystem();
    id v34 = v33;
    if (v50 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v33))
    {
      *(void *)long long buf = 67240192;
      _os_signpost_emit_with_name_impl(&dword_218274000, v34, OS_SIGNPOST_INTERVAL_END, spid, "PairingChannelInitiatorMessage1", " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 8u);
    }

    uint64_t v35 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      __int16 v79 = 2048;
      double v80 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      __int16 v81 = 1026;
      int v82 = 0;
      _os_log_impl(&dword_218274000, v35, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v21 success:0 error:v31];
  }
  else if ([(KCPairingChannel *)self sessionSupportsOctagon] {
         && [(KCPairingChannel *)self sessionSupportsSOS]
  }
         && ![(KCPairingChannel *)self testFailOctagon])
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke;
    v57[3] = &unk_2643146D0;
    objc_copyWeak(&v58, &location);
    [(KCPairingChannel *)self setNextState:v57];
    uint64_t v42 = _OctagonSignpostGetNanoseconds();
    uint64_t v43 = _OctagonSignpostLogSystem();
    uint64_t v44 = v43;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 1;
      _os_signpost_emit_with_name_impl(&dword_218274000, v44, OS_SIGNPOST_INTERVAL_END, spid, "PairingChannelInitiatorMessage1", " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 8u);
    }

    uint64_t v45 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      __int16 v79 = 2048;
      double v80 = (double)(unint64_t)v42 / 1000000000.0;
      __int16 v81 = 1026;
      int v82 = 1;
      _os_log_impl(&dword_218274000, v45, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v21 success:1 error:0];
    if (CloudServicesLibraryCore()
      && getSecureBackupIsGuitarfishEnabledSymbolLoc()
      && soft_SecureBackupIsGuitarfishEnabled())
    {
      v76[1] = @"o";
      v77[0] = MEMORY[0x263EFFA88];
      v75[1] = MEMORY[0x263EFFA88];
      v76[0] = @"d";
      v74[0] = @"v";
      v74[1] = @"s";
      v75[0] = @"O";
      uint64_t v46 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];
      v77[1] = v46;
      id v47 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
      (*((void (**)(id, void, void *, void))v51 + 2))(v51, 0, v47, 0);
    }
    else
    {
      v72[0] = @"d";
      v72[1] = @"o";
      v73[0] = MEMORY[0x263EFFA88];
      os_signpost_id_t v70 = @"v";
      uint64_t v71 = @"O";
      uint64_t v46 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      v73[1] = v46;
      id v47 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
      (*((void (**)(id, void, void *, void))v51 + 2))(v51, 0, v47, 0);
    }

    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);
  }
  else if ([(KCPairingChannel *)self sessionSupportsOctagon] {
         && [(KCPairingChannel *)self testFailOctagon])
  }
  {
    uint64_t v22 = _OctagonSignpostGetNanoseconds();
    __int16 v23 = _OctagonSignpostLogSystem();
    int v24 = v23;
    if (v50 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
    {
      *(void *)long long buf = 67240192;
      _os_signpost_emit_with_name_impl(&dword_218274000, v24, OS_SIGNPOST_INTERVAL_END, spid, "PairingChannelInitiatorMessage1", " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 8u);
    }

    uint64_t v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      __int16 v79 = 2048;
      double v80 = (double)(unint64_t)v22 / 1000000000.0;
      __int16 v81 = 1026;
      int v82 = 0;
      _os_log_impl(&dword_218274000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v21 success:1 error:0];
    (*((void (**)(id, uint64_t, void, void))v51 + 2))(v51, 1, 0, 0);
  }
  else if ([(KCPairingChannel *)self sessionSupportsOctagon] {
         && ![(KCPairingChannel *)self sessionSupportsSOS])
  }
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_211;
    v55[3] = &unk_2643146D0;
    objc_copyWeak(&v56, &location);
    [(KCPairingChannel *)self setNextState:v55];
    uint64_t v36 = _OctagonSignpostGetNanoseconds();
    uint64_t v37 = _OctagonSignpostLogSystem();
    id v38 = v37;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 1;
      _os_signpost_emit_with_name_impl(&dword_218274000, v38, OS_SIGNPOST_INTERVAL_END, spid, "PairingChannelInitiatorMessage1", " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 8u);
    }

    __int16 v39 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      __int16 v79 = 2048;
      double v80 = (double)(unint64_t)v36 / 1000000000.0;
      __int16 v81 = 1026;
      int v82 = 1;
      _os_log_impl(&dword_218274000, v39, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v21 success:1 error:0];
    if (CloudServicesLibraryCore()
      && getSecureBackupIsGuitarfishEnabledSymbolLoc()
      && soft_SecureBackupIsGuitarfishEnabled())
    {
      os_signpost_id_t v68 = @"o";
      v66[0] = @"v";
      v66[1] = @"s";
      v67[0] = @"O";
      v67[1] = MEMORY[0x263EFFA88];
      double v40 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
      uint64_t v69 = v40;
      __int16 v41 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      (*((void (**)(id, void, void *, void))v51 + 2))(v51, 0, v41, 0);
    }
    else
    {
      char v62 = @"v";
      v63 = @"O";
      id v64 = @"o";
      double v40 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      id v65 = v40;
      __int16 v41 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
      (*((void (**)(id, void, void *, void))v51 + 2))(v51, 0, v41, 0);
    }

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }
  else
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_212;
    v53[3] = &unk_2643146D0;
    objc_copyWeak(&v54, &location);
    [(KCPairingChannel *)self setNextState:v53];
    uint64_t v26 = _OctagonSignpostGetNanoseconds();
    double v27 = _OctagonSignpostLogSystem();
    id v28 = v27;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 1;
      _os_signpost_emit_with_name_impl(&dword_218274000, v28, OS_SIGNPOST_INTERVAL_END, spid, "PairingChannelInitiatorMessage1", " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 8u);
    }

    id v29 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      __int16 v79 = 2048;
      double v80 = (double)(unint64_t)v26 / 1000000000.0;
      __int16 v81 = 1026;
      int v82 = 1;
      _os_log_impl(&dword_218274000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v21 success:1 error:0];
    os_signpost_id_t v60 = @"d";
    uint64_t v61 = MEMORY[0x263EFFA88];
    uint64_t v30 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    (*((void (**)(id, void, void *, void))v51 + 2))(v51, 0, v30, 0);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }
}

void __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorSecondPacket:v6 complete:v5];
}

void __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorSecondPacket:v6 complete:v5];
}

void __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorSecondPacket:v6 complete:v5];
}

- (void)waitForOctagonUpgrade
{
  id v3 = [AAFAnalyticsEventSecurity alloc];
  BOOL v4 = [(KCPairingChannel *)self peerVersionContext];
  id v5 = [v4 altDSID];
  id v6 = [(KCPairingChannel *)self peerVersionContext];
  id v7 = [v6 flowID];
  int v8 = [(KCPairingChannel *)self peerVersionContext];
  os_signpost_id_t v9 = [v8 deviceSessionID];
  LOBYTE(v14) = 1;
  int v10 = [(AAFAnalyticsEventSecurity *)v3 initWithKeychainCircleMetrics:0 altDSID:v5 flowID:v7 deviceSessionID:v9 eventName:@"com.apple.security.initiatorWaitsForUpgrade" testsAreEnabled:metricsAreEnabled canSendMetrics:v14 category:&unk_26C975FC0];

  uint64_t v11 = [(KCPairingChannel *)self otControl];
  int v12 = [(KCPairingChannel *)self controlArguments];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __41__KCPairingChannel_waitForOctagonUpgrade__block_invoke;
  v15[3] = &unk_2643146F8;
  uint64_t v16 = v10;
  int v13 = v10;
  [v11 waitForOctagonUpgrade:v12 reply:v15];
}

void __41__KCPairingChannel_waitForOctagonUpgrade__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_218274000, v4, OS_LOG_TYPE_DEFAULT, "pairing: failed to upgrade initiator into Octagon: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 0;
    id v7 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 1;
    id v7 = 0;
  }
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v5 success:v6 error:v7];
}

- (void)setNextStateError:(id)a3 complete:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__KCPairingChannel_setNextStateError_complete___block_invoke;
  v9[3] = &unk_2643146D0;
  objc_copyWeak(&v10, &location);
  [(KCPairingChannel *)self setNextState:v9];
  if (v7)
  {
    if (v6)
    {
      int v8 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_218274000, v8, OS_LOG_TYPE_DEFAULT, "pairingchannel: failed pairing with: %@", buf, 0xCu);
      }
    }
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v6);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __47__KCPairingChannel_setNextStateError_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained oneStepTooMany:v6 complete:v5];
}

- (void)oneStepTooMany:(id)a3 complete:(id)a4
{
  id v4 = a4;
  id v5 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_218274000, v5, OS_LOG_TYPE_DEFAULT, "pairingchannel: one step too many", v7, 2u);
  }

  id v6 = [MEMORY[0x263F087E8] errorWithDomain:kKCPairingChannelErrorDomain code:2 userInfo:0];
  (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v6);
}

- (id)initAsInitiator:(BOOL)a3 version:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  if (+[KCPairingChannel isSupportedPlatform])
  {
    v42.receiver = self;
    v42.super_class = (Class)KCPairingChannel;
    int v8 = [(KCPairingChannel *)&v42 init];
    if (v8)
    {
      location[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(location, v8);
      v8->_initiator = v5;
      objc_storeStrong((id *)&v8->_peerVersionContext, a4);
      if (v8->_initiator)
      {
        id v9 = (id *)&v40;
        id v10 = v39;
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        uint64_t v11 = __44__KCPairingChannel_initAsInitiator_version___block_invoke;
      }
      else
      {
        id v9 = (id *)&v38;
        id v10 = v37;
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        uint64_t v11 = __44__KCPairingChannel_initAsInitiator_version___block_invoke_2;
      }
      v10[2] = v11;
      v10[3] = &unk_2643146D0;
      objc_copyWeak(v9, location);
      uint64_t v14 = MEMORY[0x21D4662A0](v10);
      id nextState = v8->_nextState;
      v8->_id nextState = (id)v14;

      objc_destroyWeak(v9);
      v8->_needInitialSync = 1;
      v8->_testFailSOS = 0;
      v8->_sessionSupportsSOS = SOSCCIsSOSTrustAndSyncingEnabled();
      v8->_sessionSupportsOctagon = 1;
      id v36 = 0;
      uint64_t v16 = [MEMORY[0x263F16D40] controlObject:1 error:&v36];
      id v17 = v36;
      otControl = v8->_otControl;
      v8->_otControl = (OTControl *)v16;

      if (v17)
      {
        __int16 v19 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v35 = 0;
          _os_log_impl(&dword_218274000, v19, OS_LOG_TYPE_DEFAULT, "could not stand up otcontrol connection", v35, 2u);
        }
      }
      id v20 = objc_alloc(MEMORY[0x263F16D50]);
      uint64_t v21 = *MEMORY[0x263F16D98];
      uint64_t v22 = [v7 uniqueDeviceID];
      __int16 v23 = [v7 uniqueClientID];
      int v24 = [MEMORY[0x263F08C38] UUID];
      uint64_t v25 = [v24 UUIDString];
      uint64_t v26 = [v20 initWithProtocolType:v21 uniqueDeviceID:v22 uniqueClientID:v23 pairingUUID:v25 epoch:0 isInitiator:v5];
      joiningConfiguration = v8->_joiningConfiguration;
      v8->_joiningConfiguration = (OTJoiningConfiguration *)v26;

      id v28 = objc_alloc(MEMORY[0x263F16D48]);
      id v29 = [v7 altDSID];
      uint64_t v30 = [v7 flowID];
      long long v31 = [v7 deviceSessionID];
      uint64_t v32 = [v28 initWithAltDSID:v29 flowID:v30 deviceSessionID:v31];
      controlArguments = v8->_controlArguments;
      v8->_controlArguments = (OTControlArguments *)v32;

      objc_destroyWeak(location);
    }
    self = v8;
    id v13 = self;
  }
  else
  {
    int v12 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_218274000, v12, OS_LOG_TYPE_DEFAULT, "platform not supported for pairing", (uint8_t *)location, 2u);
    }

    id v13 = 0;
  }

  return v13;
}

void __44__KCPairingChannel_initAsInitiator_version___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorFirstPacket:v6 complete:v5];
}

void __44__KCPairingChannel_initAsInitiator_version___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorFirstPacket:v6 complete:v5];
}

+ (id)pairingChannelDecompressData:(id)a3
{
  id v3 = a3;
  if (pairingChannelDecompressData__once != -1) {
    dispatch_once(&pairingChannelDecompressData__once, &__block_literal_global_201);
  }
  size_t v4 = [v3 length];
  id v5 = 0;
  while ((v4 & 0x8000000000000000) == 0)
  {
    v4 *= 2;
    id v6 = [MEMORY[0x263EFF990] dataWithLength:v4];

    id v5 = v6;
    id v7 = (uint8_t *)[v5 mutableBytes];
    id v8 = v3;
    id v9 = (const uint8_t *)[v8 bytes];
    size_t v10 = [v8 length];
    size_t v11 = compression_decode_buffer(v7, v4, v9, v10, (void *)[(id)pairingChannelDecompressData__scratch mutableBytes], COMPRESSION_LZFSE);
    if (!v11) {
      break;
    }
    if (v11 != v4)
    {
      [v5 setLength:v11];
      id v5 = v5;
      int v12 = v5;
      goto LABEL_9;
    }
  }
  int v12 = 0;
LABEL_9:

  return v12;
}

uint64_t __49__KCPairingChannel_pairingChannelDecompressData___block_invoke()
{
  pairingChannelDecompressData__scratch = [MEMORY[0x263EFF990] dataWithLength:compression_decode_scratch_buffer_size(COMPRESSION_LZFSE)];
  return MEMORY[0x270F9A758]();
}

+ (id)pairingChannelCompressData:(id)a3
{
  id v3 = a3;
  if (pairingChannelCompressData__once != -1) {
    dispatch_once(&pairingChannelCompressData__once, &__block_literal_global);
  }
  unint64_t v4 = [v3 length];
  if (v4 <= 0xFFFFFFFFFFFFFF9BLL)
  {
    id v6 = [MEMORY[0x263EFF990] dataWithLength:v4 + 100];
    id v7 = (uint8_t *)[v6 mutableBytes];
    size_t v8 = [v6 length];
    id v9 = v3;
    size_t v10 = (const uint8_t *)[v9 bytes];
    size_t v11 = [v9 length];
    size_t v12 = compression_encode_buffer(v7, v8, v10, v11, (void *)[(id)pairingChannelCompressData__scratch mutableBytes], COMPRESSION_LZFSE);
    if (v12)
    {
      [v6 setLength:v12];
      id v5 = v6;
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __47__KCPairingChannel_pairingChannelCompressData___block_invoke()
{
  pairingChannelCompressData__scratch = [MEMORY[0x263EFF990] dataWithLength:compression_encode_scratch_buffer_size(COMPRESSION_LZFSE)];
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isSupportedPlatform
{
  return 1;
}

+ (BOOL)retryable:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F07F70]] && objc_msgSend(v3, "code") == 4097)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 domain];
    if ([v6 isEqualToString:*MEMORY[0x263F16DA8]] && objc_msgSend(v3, "code") == 56
      || +[KCPairingChannel _isRetryableNSURLError:v3])
    {
      BOOL v5 = 1;
    }
    else
    {
      id v7 = [v3 userInfo];
      size_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F08608]];
      BOOL v5 = +[KCPairingChannel _isRetryableNSURLError:v8];
    }
  }

  return v5;
}

+ (BOOL)_isRetryableNSURLError:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F08570]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    if ((unint64_t)(v6 + 1009) <= 8) {
      unsigned int v7 = (0x111u >> (v6 - 15)) & 1;
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)pairingChannelAcceptor:(id)a3
{
  id v3 = a3;
  id v4 = [[KCPairingChannel alloc] initAsInitiator:0 version:v3];

  return v4;
}

+ (id)pairingChannelInitiator:(id)a3
{
  id v3 = a3;
  id v4 = [[KCPairingChannel alloc] initAsInitiator:1 version:v3];

  return v4;
}

@end