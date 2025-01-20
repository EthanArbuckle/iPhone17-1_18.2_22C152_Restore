@interface MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents
- (MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents)init;
- (NSNumber)activeTimestampPresent;
- (NSNumber)channelMaskPresent;
- (NSNumber)channelPresent;
- (NSNumber)delayPresent;
- (NSNumber)extendedPanIdPresent;
- (NSNumber)masterKeyPresent;
- (NSNumber)meshLocalPrefixPresent;
- (NSNumber)networkNamePresent;
- (NSNumber)panIdPresent;
- (NSNumber)pendingTimestampPresent;
- (NSNumber)pskcPresent;
- (NSNumber)securityPolicyPresent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActiveTimestampPresent:(NSNumber *)activeTimestampPresent;
- (void)setChannelMaskPresent:(NSNumber *)channelMaskPresent;
- (void)setChannelPresent:(NSNumber *)channelPresent;
- (void)setDelayPresent:(NSNumber *)delayPresent;
- (void)setExtendedPanIdPresent:(NSNumber *)extendedPanIdPresent;
- (void)setMasterKeyPresent:(NSNumber *)masterKeyPresent;
- (void)setMeshLocalPrefixPresent:(NSNumber *)meshLocalPrefixPresent;
- (void)setNetworkNamePresent:(NSNumber *)networkNamePresent;
- (void)setPanIdPresent:(NSNumber *)panIdPresent;
- (void)setPendingTimestampPresent:(NSNumber *)pendingTimestampPresent;
- (void)setPskcPresent:(NSNumber *)pskcPresent;
- (void)setSecurityPolicyPresent:(NSNumber *)securityPolicyPresent;
@end

@implementation MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents

- (MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents;
  v2 = [(MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents *)&v17 init];
  v3 = v2;
  if (v2)
  {
    activeTimestampPresent = v2->_activeTimestampPresent;
    v2->_activeTimestampPresent = (NSNumber *)&unk_26F9C8620;

    pendingTimestampPresent = v3->_pendingTimestampPresent;
    v3->_pendingTimestampPresent = (NSNumber *)&unk_26F9C8620;

    masterKeyPresent = v3->_masterKeyPresent;
    v3->_masterKeyPresent = (NSNumber *)&unk_26F9C8620;

    networkNamePresent = v3->_networkNamePresent;
    v3->_networkNamePresent = (NSNumber *)&unk_26F9C8620;

    extendedPanIdPresent = v3->_extendedPanIdPresent;
    v3->_extendedPanIdPresent = (NSNumber *)&unk_26F9C8620;

    meshLocalPrefixPresent = v3->_meshLocalPrefixPresent;
    v3->_meshLocalPrefixPresent = (NSNumber *)&unk_26F9C8620;

    delayPresent = v3->_delayPresent;
    v3->_delayPresent = (NSNumber *)&unk_26F9C8620;

    panIdPresent = v3->_panIdPresent;
    v3->_panIdPresent = (NSNumber *)&unk_26F9C8620;

    channelPresent = v3->_channelPresent;
    v3->_channelPresent = (NSNumber *)&unk_26F9C8620;

    pskcPresent = v3->_pskcPresent;
    v3->_pskcPresent = (NSNumber *)&unk_26F9C8620;

    securityPolicyPresent = v3->_securityPolicyPresent;
    v3->_securityPolicyPresent = (NSNumber *)&unk_26F9C8620;

    channelMaskPresent = v3->_channelMaskPresent;
    v3->_channelMaskPresent = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents);
  v7 = objc_msgSend_activeTimestampPresent(self, v5, v6);
  objc_msgSend_setActiveTimestampPresent_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_pendingTimestampPresent(self, v9, v10);
  objc_msgSend_setPendingTimestampPresent_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_masterKeyPresent(self, v13, v14);
  objc_msgSend_setMasterKeyPresent_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_networkNamePresent(self, v17, v18);
  objc_msgSend_setNetworkNamePresent_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_extendedPanIdPresent(self, v21, v22);
  objc_msgSend_setExtendedPanIdPresent_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_meshLocalPrefixPresent(self, v25, v26);
  objc_msgSend_setMeshLocalPrefixPresent_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_delayPresent(self, v29, v30);
  objc_msgSend_setDelayPresent_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_panIdPresent(self, v33, v34);
  objc_msgSend_setPanIdPresent_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_channelPresent(self, v37, v38);
  objc_msgSend_setChannelPresent_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_pskcPresent(self, v41, v42);
  objc_msgSend_setPskcPresent_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_securityPolicyPresent(self, v45, v46);
  objc_msgSend_setSecurityPolicyPresent_(v4, v48, (uint64_t)v47);

  v51 = objc_msgSend_channelMaskPresent(self, v49, v50);
  objc_msgSend_setChannelMaskPresent_(v4, v52, (uint64_t)v51);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: activeTimestampPresent:%@; pendingTimestampPresent:%@; masterKeyPresent:%@; networkNamePresent:%@; extendedPanIdPresent:%@; meshLocalPrefixPresent:%@; delayPresent:%@; panIdPresent:%@; channelPresent:%@; pskcPresent:%@; securityPolicyPresent:%@; channelMaskPresent:%@; >",
    v5,
    self->_activeTimestampPresent,
    self->_pendingTimestampPresent,
    self->_masterKeyPresent,
    self->_networkNamePresent,
    self->_extendedPanIdPresent,
    self->_meshLocalPrefixPresent,
    self->_delayPresent,
    self->_panIdPresent,
    self->_channelPresent,
    self->_pskcPresent,
    self->_securityPolicyPresent,
  v7 = self->_channelMaskPresent);

  return v7;
}

- (NSNumber)activeTimestampPresent
{
  return self->_activeTimestampPresent;
}

- (void)setActiveTimestampPresent:(NSNumber *)activeTimestampPresent
{
}

- (NSNumber)pendingTimestampPresent
{
  return self->_pendingTimestampPresent;
}

- (void)setPendingTimestampPresent:(NSNumber *)pendingTimestampPresent
{
}

- (NSNumber)masterKeyPresent
{
  return self->_masterKeyPresent;
}

- (void)setMasterKeyPresent:(NSNumber *)masterKeyPresent
{
}

- (NSNumber)networkNamePresent
{
  return self->_networkNamePresent;
}

- (void)setNetworkNamePresent:(NSNumber *)networkNamePresent
{
}

- (NSNumber)extendedPanIdPresent
{
  return self->_extendedPanIdPresent;
}

- (void)setExtendedPanIdPresent:(NSNumber *)extendedPanIdPresent
{
}

- (NSNumber)meshLocalPrefixPresent
{
  return self->_meshLocalPrefixPresent;
}

- (void)setMeshLocalPrefixPresent:(NSNumber *)meshLocalPrefixPresent
{
}

- (NSNumber)delayPresent
{
  return self->_delayPresent;
}

- (void)setDelayPresent:(NSNumber *)delayPresent
{
}

- (NSNumber)panIdPresent
{
  return self->_panIdPresent;
}

- (void)setPanIdPresent:(NSNumber *)panIdPresent
{
}

- (NSNumber)channelPresent
{
  return self->_channelPresent;
}

- (void)setChannelPresent:(NSNumber *)channelPresent
{
}

- (NSNumber)pskcPresent
{
  return self->_pskcPresent;
}

- (void)setPskcPresent:(NSNumber *)pskcPresent
{
}

- (NSNumber)securityPolicyPresent
{
  return self->_securityPolicyPresent;
}

- (void)setSecurityPolicyPresent:(NSNumber *)securityPolicyPresent
{
}

- (NSNumber)channelMaskPresent
{
  return self->_channelMaskPresent;
}

- (void)setChannelMaskPresent:(NSNumber *)channelMaskPresent
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelMaskPresent, 0);
  objc_storeStrong((id *)&self->_securityPolicyPresent, 0);
  objc_storeStrong((id *)&self->_pskcPresent, 0);
  objc_storeStrong((id *)&self->_channelPresent, 0);
  objc_storeStrong((id *)&self->_panIdPresent, 0);
  objc_storeStrong((id *)&self->_delayPresent, 0);
  objc_storeStrong((id *)&self->_meshLocalPrefixPresent, 0);
  objc_storeStrong((id *)&self->_extendedPanIdPresent, 0);
  objc_storeStrong((id *)&self->_networkNamePresent, 0);
  objc_storeStrong((id *)&self->_masterKeyPresent, 0);
  objc_storeStrong((id *)&self->_pendingTimestampPresent, 0);

  objc_storeStrong((id *)&self->_activeTimestampPresent, 0);
}

@end