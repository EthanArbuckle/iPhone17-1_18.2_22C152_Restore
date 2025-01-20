@interface MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams)init;
- (NSData)metadataForNode;
- (NSNumber)announcementReason;
- (NSNumber)endpoint;
- (NSNumber)providerNodeID;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)vendorID;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAnnouncementReason:(NSNumber *)announcementReason;
- (void)setEndpoint:(NSNumber *)endpoint;
- (void)setMetadataForNode:(NSData *)metadataForNode;
- (void)setProviderNodeID:(NSNumber *)providerNodeID;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setVendorID:(NSNumber *)vendorID;
@end

@implementation MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams

- (MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams;
  v2 = [(MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams *)&v12 init];
  v3 = v2;
  if (v2)
  {
    providerNodeID = v2->_providerNodeID;
    v2->_providerNodeID = (NSNumber *)&unk_26F9C8548;

    vendorID = v3->_vendorID;
    v3->_vendorID = (NSNumber *)&unk_26F9C8548;

    announcementReason = v3->_announcementReason;
    v3->_announcementReason = (NSNumber *)&unk_26F9C8548;

    metadataForNode = v3->_metadataForNode;
    v3->_metadataForNode = 0;

    endpoint = v3->_endpoint;
    v3->_endpoint = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams);
  v7 = objc_msgSend_providerNodeID(self, v5, v6);
  objc_msgSend_setProviderNodeID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_vendorID(self, v9, v10);
  objc_msgSend_setVendorID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_announcementReason(self, v13, v14);
  objc_msgSend_setAnnouncementReason_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_metadataForNode(self, v17, v18);
  objc_msgSend_setMetadataForNode_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_endpoint(self, v21, v22);
  objc_msgSend_setEndpoint_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  providerNodeID = self->_providerNodeID;
  vendorID = self->_vendorID;
  announcementReason = self->_announcementReason;
  uint64_t v10 = objc_msgSend_base64EncodedStringWithOptions_(self->_metadataForNode, v9, 0);
  objc_msgSend_stringWithFormat_(v3, v11, @"<%@: providerNodeID:%@; vendorID:%@; announcementReason:%@; metadataForNode:%@; endpoint:%@; >",
    v5,
    providerNodeID,
    vendorID,
    announcementReason,
    v10,
  objc_super v12 = self->_endpoint);

  return v12;
}

- (NSNumber)providerNodeID
{
  return self->_providerNodeID;
}

- (void)setProviderNodeID:(NSNumber *)providerNodeID
{
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(NSNumber *)vendorID
{
}

- (NSNumber)announcementReason
{
  return self->_announcementReason;
}

- (void)setAnnouncementReason:(NSNumber *)announcementReason
{
}

- (NSData)metadataForNode
{
  return self->_metadataForNode;
}

- (void)setMetadataForNode:(NSData *)metadataForNode
{
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(NSNumber *)endpoint
{
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
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_metadataForNode, 0);
  objc_storeStrong((id *)&self->_announcementReason, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);

  objc_storeStrong((id *)&self->_providerNodeID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  uint64_t v44 = 0;
  __int16 v45 = 0;
  char v46 = 0;
  char v47 = 0;
  __int16 v49 = 0;
  v43[0] = 0;
  v43[1] = 0;
  v42 = v43;
  v7 = objc_msgSend_providerNodeID(self, a3, (uint64_t)a4);
  uint64_t v44 = objc_msgSend_unsignedLongLongValue(v7, v8, v9);

  objc_super v12 = objc_msgSend_vendorID(self, v10, v11);
  __int16 v45 = objc_msgSend_unsignedShortValue(v12, v13, v14);

  v17 = objc_msgSend_announcementReason(self, v15, v16);
  char v46 = objc_msgSend_unsignedCharValue(v17, v18, v19);

  uint64_t v22 = objc_msgSend_metadataForNode(self, v20, v21);

  if (v22)
  {
    char v47 = 1;
    long long v48 = 0uLL;
    objc_msgSend_metadataForNode(self, v23, v24);
    id v25 = objc_claimAutoreleasedReturnValue();
    uint64_t v28 = objc_msgSend_bytes(v25, v26, v27);
    uint64_t v31 = objc_msgSend_length(v25, v29, v30);
    sub_2446C1098(v36, v28, v31);

    long long v48 = *(_OWORD *)v36;
  }
  v32 = objc_msgSend_endpoint(self, v23, v24);
  __int16 v49 = objc_msgSend_unsignedShortValue(v32, v33, v34);

  sub_244CC8F5C(0x62FuLL, 0, &v41);
  if (v41)
  {
    sub_244CB62B8((uint64_t)v36);
    v38 = 0;
    v39 = 0;
    v37 = &unk_26F9536C8;
    char v40 = 0;
    sub_2447945A0((uint64_t)&v37, &v41, 0);
    sub_244CB6318((uint64_t)v36, (uint64_t)&v37, 0xFFFFFFFF, (uint64_t)v50);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2447FA544((uint64_t)&v44, v36, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v36, &v41, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v41);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v37 = &unk_26F9536C8;
    sub_244794634(&v39);
    sub_244794634(&v38);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 4977;
  }
  sub_244794634(&v41);
  return (ChipError *)sub_24479466C((uint64_t)&v42);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 5006;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end