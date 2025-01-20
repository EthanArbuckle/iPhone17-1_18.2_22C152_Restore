@interface MTRWebRTCTransportProviderClusterSolicitOfferResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRWebRTCTransportProviderClusterSolicitOfferResponseParams)init;
- (MTRWebRTCTransportProviderClusterSolicitOfferResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (NSNumber)audioStreamID;
- (NSNumber)deferredOffer;
- (NSNumber)videoStreamID;
- (NSNumber)webRTCSessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioStreamID:(id)a3;
- (void)setDeferredOffer:(id)a3;
- (void)setVideoStreamID:(id)a3;
- (void)setWebRTCSessionID:(id)a3;
@end

@implementation MTRWebRTCTransportProviderClusterSolicitOfferResponseParams

- (MTRWebRTCTransportProviderClusterSolicitOfferResponseParams)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRWebRTCTransportProviderClusterSolicitOfferResponseParams;
  v2 = [(MTRWebRTCTransportProviderClusterSolicitOfferResponseParams *)&v9 init];
  v3 = v2;
  if (v2)
  {
    webRTCSessionID = v2->_webRTCSessionID;
    v2->_webRTCSessionID = (NSNumber *)&unk_26F9C8548;

    deferredOffer = v3->_deferredOffer;
    v3->_deferredOffer = (NSNumber *)&unk_26F9C8548;

    videoStreamID = v3->_videoStreamID;
    v3->_videoStreamID = 0;

    audioStreamID = v3->_audioStreamID;
    v3->_audioStreamID = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWebRTCTransportProviderClusterSolicitOfferResponseParams);
  v7 = objc_msgSend_webRTCSessionID(self, v5, v6);
  objc_msgSend_setWebRTCSessionID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_deferredOffer(self, v9, v10);
  objc_msgSend_setDeferredOffer_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_videoStreamID(self, v13, v14);
  objc_msgSend_setVideoStreamID_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_audioStreamID(self, v17, v18);
  objc_msgSend_setAudioStreamID_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: webRTCSessionID:%@; deferredOffer:%@; videoStreamID:%@; audioStreamID:%@; >",
    v5,
    self->_webRTCSessionID,
    self->_deferredOffer,
    self->_videoStreamID,
  v7 = self->_audioStreamID);

  return v7;
}

- (MTRWebRTCTransportProviderClusterSolicitOfferResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MTRWebRTCTransportProviderClusterSolicitOfferResponseParams;
  v8 = [(MTRWebRTCTransportProviderClusterSolicitOfferResponseParams *)&v40 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 1363, 2, a4);
  if (v39)
  {
    sub_244CB3988((uint64_t)v38);
    sub_244CB39B8((uint64_t)v38, *((void *)v39 + 1), *((void *)v39 + 3));
    long long v36 = 0uLL;
    uint64_t v37 = 0;
    sub_244CB54B4((uint64_t)v38, 256, &v36);
    if (!v36)
    {
      __int16 v32 = 0;
      char v33 = 0;
      char v34 = 0;
      char v35 = 0;
      sub_244840914((uint64_t)&v32, (uint64_t)v38, (uint64_t)buf);
      long long v36 = *(_OWORD *)buf;
      uint64_t v37 = v44;
      if (!*(_DWORD *)buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&v32);
        long long v36 = *(_OWORD *)buf;
        uint64_t v37 = v44;
        if (!*(_DWORD *)buf)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    *(_OWORD *)buf = v36;
    uint64_t v44 = v37;
    v11 = sub_244CB7B34((const char **)buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    uint64_t v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = v13;
      uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v18;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v21 = v13;
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_244CC4DE0(0, 1);
    }
    if (a4)
    {
      uint64_t v41 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v42 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v42, &v41, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v39);
LABEL_16:

  return v30;
}

- (NSNumber)webRTCSessionID
{
  return self->_webRTCSessionID;
}

- (void)setWebRTCSessionID:(id)a3
{
}

- (NSNumber)deferredOffer
{
  return self->_deferredOffer;
}

- (void)setDeferredOffer:(id)a3
{
}

- (NSNumber)videoStreamID
{
  return self->_videoStreamID;
}

- (void)setVideoStreamID:(id)a3
{
}

- (NSNumber)audioStreamID
{
  return self->_audioStreamID;
}

- (void)setAudioStreamID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioStreamID, 0);
  objc_storeStrong((id *)&self->_videoStreamID, 0);
  objc_storeStrong((id *)&self->_deferredOffer, 0);

  objc_storeStrong((id *)&self->_webRTCSessionID, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedShort_(NSNumber, a3, *(unsigned __int16 *)a4);
  objc_msgSend_setWebRTCSessionID_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_numberWithBool_(NSNumber, v9, *((unsigned __int8 *)a4 + 2));
  objc_msgSend_setDeferredOffer_(self, v11, (uint64_t)v10);

  if (*((unsigned char *)a4 + 4) && sub_24471C2FC((unsigned char *)a4 + 4)[2])
  {
    v13 = NSNumber;
    uint64_t v14 = sub_24471C2FC((unsigned char *)a4 + 4);
    if (!v14[2]) {
      goto LABEL_12;
    }
    v16 = objc_msgSend_numberWithUnsignedShort_(v13, v15, *(unsigned __int16 *)v14);
    objc_msgSend_setVideoStreamID_(self, v17, (uint64_t)v16);
  }
  else
  {
    objc_msgSend_setVideoStreamID_(self, v12, 0);
  }
  int v20 = *((unsigned __int8 *)a4 + 10);
  v19 = (char *)a4 + 10;
  if (!v20 || !sub_24471C2FC(v19)[2])
  {
    result = (ChipError *)objc_msgSend_setAudioStreamID_(self, v18, 0);
    goto LABEL_11;
  }
  id v21 = NSNumber;
  v22 = sub_24471C2FC(v19);
  if (!v22[2]) {
LABEL_12:
  }
    sub_24479484C();
  v24 = objc_msgSend_numberWithUnsignedShort_(v21, v23, *(unsigned __int16 *)v22);
  objc_msgSend_setAudioStreamID_(self, v25, (uint64_t)v24);

LABEL_11:
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 34214;
  return result;
}

@end