@interface MTRThreadNetworkDiagnosticsClusterNeighborTableStruct
- (MTRThreadNetworkDiagnosticsClusterNeighborTableStruct)init;
- (NSNumber)age;
- (NSNumber)averageRssi;
- (NSNumber)extAddress;
- (NSNumber)frameErrorRate;
- (NSNumber)fullNetworkData;
- (NSNumber)fullThreadDevice;
- (NSNumber)isChild;
- (NSNumber)lastRssi;
- (NSNumber)linkFrameCounter;
- (NSNumber)lqi;
- (NSNumber)messageErrorRate;
- (NSNumber)mleFrameCounter;
- (NSNumber)rloc16;
- (NSNumber)rxOnWhenIdle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAge:(NSNumber *)age;
- (void)setAverageRssi:(NSNumber *)averageRssi;
- (void)setExtAddress:(NSNumber *)extAddress;
- (void)setFrameErrorRate:(NSNumber *)frameErrorRate;
- (void)setFullNetworkData:(NSNumber *)fullNetworkData;
- (void)setFullThreadDevice:(NSNumber *)fullThreadDevice;
- (void)setIsChild:(NSNumber *)isChild;
- (void)setLastRssi:(NSNumber *)lastRssi;
- (void)setLinkFrameCounter:(NSNumber *)linkFrameCounter;
- (void)setLqi:(NSNumber *)lqi;
- (void)setMessageErrorRate:(NSNumber *)messageErrorRate;
- (void)setMleFrameCounter:(NSNumber *)mleFrameCounter;
- (void)setRloc16:(NSNumber *)rloc16;
- (void)setRxOnWhenIdle:(NSNumber *)rxOnWhenIdle;
@end

@implementation MTRThreadNetworkDiagnosticsClusterNeighborTableStruct

- (MTRThreadNetworkDiagnosticsClusterNeighborTableStruct)init
{
  v19.receiver = self;
  v19.super_class = (Class)MTRThreadNetworkDiagnosticsClusterNeighborTableStruct;
  v2 = [(MTRThreadNetworkDiagnosticsClusterNeighborTableStruct *)&v19 init];
  v3 = v2;
  if (v2)
  {
    extAddress = v2->_extAddress;
    v2->_extAddress = (NSNumber *)&unk_26F9C8620;

    age = v3->_age;
    v3->_age = (NSNumber *)&unk_26F9C8620;

    rloc16 = v3->_rloc16;
    v3->_rloc16 = (NSNumber *)&unk_26F9C8620;

    linkFrameCounter = v3->_linkFrameCounter;
    v3->_linkFrameCounter = (NSNumber *)&unk_26F9C8620;

    mleFrameCounter = v3->_mleFrameCounter;
    v3->_mleFrameCounter = (NSNumber *)&unk_26F9C8620;

    lqi = v3->_lqi;
    v3->_lqi = (NSNumber *)&unk_26F9C8620;

    averageRssi = v3->_averageRssi;
    v3->_averageRssi = 0;

    lastRssi = v3->_lastRssi;
    v3->_lastRssi = 0;

    frameErrorRate = v3->_frameErrorRate;
    v3->_frameErrorRate = (NSNumber *)&unk_26F9C8620;

    messageErrorRate = v3->_messageErrorRate;
    v3->_messageErrorRate = (NSNumber *)&unk_26F9C8620;

    rxOnWhenIdle = v3->_rxOnWhenIdle;
    v3->_rxOnWhenIdle = (NSNumber *)&unk_26F9C8620;

    fullThreadDevice = v3->_fullThreadDevice;
    v3->_fullThreadDevice = (NSNumber *)&unk_26F9C8620;

    fullNetworkData = v3->_fullNetworkData;
    v3->_fullNetworkData = (NSNumber *)&unk_26F9C8620;

    isChild = v3->_isChild;
    v3->_isChild = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterNeighborTableStruct);
  v7 = objc_msgSend_extAddress(self, v5, v6);
  objc_msgSend_setExtAddress_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_age(self, v9, v10);
  objc_msgSend_setAge_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_rloc16(self, v13, v14);
  objc_msgSend_setRloc16_(v4, v16, (uint64_t)v15);

  objc_super v19 = objc_msgSend_linkFrameCounter(self, v17, v18);
  objc_msgSend_setLinkFrameCounter_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_mleFrameCounter(self, v21, v22);
  objc_msgSend_setMleFrameCounter_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_lqi(self, v25, v26);
  objc_msgSend_setLqi_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_averageRssi(self, v29, v30);
  objc_msgSend_setAverageRssi_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_lastRssi(self, v33, v34);
  objc_msgSend_setLastRssi_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_frameErrorRate(self, v37, v38);
  objc_msgSend_setFrameErrorRate_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_messageErrorRate(self, v41, v42);
  objc_msgSend_setMessageErrorRate_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_rxOnWhenIdle(self, v45, v46);
  objc_msgSend_setRxOnWhenIdle_(v4, v48, (uint64_t)v47);

  v51 = objc_msgSend_fullThreadDevice(self, v49, v50);
  objc_msgSend_setFullThreadDevice_(v4, v52, (uint64_t)v51);

  v55 = objc_msgSend_fullNetworkData(self, v53, v54);
  objc_msgSend_setFullNetworkData_(v4, v56, (uint64_t)v55);

  v59 = objc_msgSend_isChild(self, v57, v58);
  objc_msgSend_setIsChild_(v4, v60, (uint64_t)v59);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: extAddress:%@; age:%@; rloc16:%@; linkFrameCounter:%@; mleFrameCounter:%@; lqi:%@; averageRssi:%@; lastRssi:%@; frameErrorRate:%@; messageErrorRate:%@; rxOnWhenIdle:%@; fullThreadDevice:%@; fullNetworkData:%@; isChild:%@; >",
    v5,
    self->_extAddress,
    self->_age,
    self->_rloc16,
    self->_linkFrameCounter,
    self->_mleFrameCounter,
    self->_lqi,
    self->_averageRssi,
    self->_lastRssi,
    self->_frameErrorRate,
    self->_messageErrorRate,
    self->_rxOnWhenIdle,
    self->_fullThreadDevice,
    self->_fullNetworkData,
  v7 = self->_isChild);

  return v7;
}

- (NSNumber)extAddress
{
  return self->_extAddress;
}

- (void)setExtAddress:(NSNumber *)extAddress
{
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(NSNumber *)age
{
}

- (NSNumber)rloc16
{
  return self->_rloc16;
}

- (void)setRloc16:(NSNumber *)rloc16
{
}

- (NSNumber)linkFrameCounter
{
  return self->_linkFrameCounter;
}

- (void)setLinkFrameCounter:(NSNumber *)linkFrameCounter
{
}

- (NSNumber)mleFrameCounter
{
  return self->_mleFrameCounter;
}

- (void)setMleFrameCounter:(NSNumber *)mleFrameCounter
{
}

- (NSNumber)lqi
{
  return self->_lqi;
}

- (void)setLqi:(NSNumber *)lqi
{
}

- (NSNumber)averageRssi
{
  return self->_averageRssi;
}

- (void)setAverageRssi:(NSNumber *)averageRssi
{
}

- (NSNumber)lastRssi
{
  return self->_lastRssi;
}

- (void)setLastRssi:(NSNumber *)lastRssi
{
}

- (NSNumber)frameErrorRate
{
  return self->_frameErrorRate;
}

- (void)setFrameErrorRate:(NSNumber *)frameErrorRate
{
}

- (NSNumber)messageErrorRate
{
  return self->_messageErrorRate;
}

- (void)setMessageErrorRate:(NSNumber *)messageErrorRate
{
}

- (NSNumber)rxOnWhenIdle
{
  return self->_rxOnWhenIdle;
}

- (void)setRxOnWhenIdle:(NSNumber *)rxOnWhenIdle
{
}

- (NSNumber)fullThreadDevice
{
  return self->_fullThreadDevice;
}

- (void)setFullThreadDevice:(NSNumber *)fullThreadDevice
{
}

- (NSNumber)fullNetworkData
{
  return self->_fullNetworkData;
}

- (void)setFullNetworkData:(NSNumber *)fullNetworkData
{
}

- (NSNumber)isChild
{
  return self->_isChild;
}

- (void)setIsChild:(NSNumber *)isChild
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isChild, 0);
  objc_storeStrong((id *)&self->_fullNetworkData, 0);
  objc_storeStrong((id *)&self->_fullThreadDevice, 0);
  objc_storeStrong((id *)&self->_rxOnWhenIdle, 0);
  objc_storeStrong((id *)&self->_messageErrorRate, 0);
  objc_storeStrong((id *)&self->_frameErrorRate, 0);
  objc_storeStrong((id *)&self->_lastRssi, 0);
  objc_storeStrong((id *)&self->_averageRssi, 0);
  objc_storeStrong((id *)&self->_lqi, 0);
  objc_storeStrong((id *)&self->_mleFrameCounter, 0);
  objc_storeStrong((id *)&self->_linkFrameCounter, 0);
  objc_storeStrong((id *)&self->_rloc16, 0);
  objc_storeStrong((id *)&self->_age, 0);

  objc_storeStrong((id *)&self->_extAddress, 0);
}

@end