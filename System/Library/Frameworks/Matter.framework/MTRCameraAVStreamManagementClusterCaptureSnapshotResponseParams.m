@interface MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams)init;
- (MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)resolution;
- (NSData)data;
- (NSNumber)imageCodec;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setData:(id)a3;
- (void)setImageCodec:(id)a3;
- (void)setResolution:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams

- (MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams;
  v4 = [(MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    data = v4->_data;
    v4->_data = (NSData *)v5;

    imageCodec = v4->_imageCodec;
    v4->_imageCodec = (NSNumber *)&unk_26F9C8548;

    uint64_t v8 = objc_opt_new();
    resolution = v4->_resolution;
    v4->_resolution = (MTRCameraAVStreamManagementClusterVideoResolutionStruct *)v8;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams);
  v7 = objc_msgSend_data(self, v5, v6);
  objc_msgSend_setData_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_imageCodec(self, v9, v10);
  objc_msgSend_setImageCodec_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_resolution(self, v13, v14);
  objc_msgSend_setResolution_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_data, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: data:%@; imageCodec:%@; resolution:%@; >",
    v5,
    v7,
    self->_imageCodec,
  v9 = self->_resolution);

  return v9;
}

- (MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams;
  uint64_t v8 = [(MTRCameraAVStreamManagementClusterCaptureSnapshotResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 1361, 12, a4);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      *(_DWORD *)((char *)&v42 + 2) = 0;
      long long buf = 0uLL;
      LOBYTE(v42) = 0;
      sub_24483EC88((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      long long v34 = v32;
      uint64_t v35 = v33;
      if (!v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        long long v34 = v32;
        uint64_t v35 = v33;
        if (!v32)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    long long buf = v34;
    uint64_t v42 = v35;
    objc_super v11 = sub_244CB7B34((const char **)&buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    uint64_t v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = v13;
      uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v21 = v13;
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_244CC4DE0(0, 1);
    }
    if (a4)
    {
      uint64_t v39 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v37);
LABEL_16:

  return v30;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSNumber)imageCodec
{
  return self->_imageCodec;
}

- (void)setImageCodec:(id)a3
{
}

- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)resolution
{
  return self->_resolution;
}

- (void)setResolution:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolution, 0);
  objc_storeStrong((id *)&self->_imageCodec, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a3, *(void *)a4, *((void *)a4 + 1));
  objc_msgSend_setData_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v9, *((unsigned __int8 *)a4 + 16));
  objc_msgSend_setImageCodec_(self, v11, (uint64_t)v10);

  v12 = objc_opt_new();
  objc_msgSend_setResolution_(self, v13, (uint64_t)v12);

  id v15 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v14, *((unsigned __int16 *)a4 + 9));
  uint64_t v18 = objc_msgSend_resolution(self, v16, v17);
  objc_msgSend_setWidth_(v18, v19, (uint64_t)v15);

  id v21 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v20, *((unsigned __int16 *)a4 + 10));
  v24 = objc_msgSend_resolution(self, v22, v23);
  objc_msgSend_setHeight_(v24, v25, (uint64_t)v21);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 33594;
  return result;
}

@end