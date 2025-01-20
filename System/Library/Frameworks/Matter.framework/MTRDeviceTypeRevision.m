@interface MTRDeviceTypeRevision
- (BOOL)isEqual:(id)a3;
- (MTRDeviceTypeRevision)initWithDeviceTypeID:(id)a3 revision:(id)a4;
- (NSNumber)deviceTypeID;
- (NSNumber)deviceTypeRevision;
- (unint64_t)hash;
@end

@implementation MTRDeviceTypeRevision

- (MTRDeviceTypeRevision)initWithDeviceTypeID:(id)a3 revision:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v10 = objc_msgSend_unsignedLongLongValue(v6, v8, v9);
  unint64_t v13 = v10;
  if (HIDWORD(v10))
  {
    v22 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v13;
      _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_ERROR, "MTRDeviceTypeRevision provided too-large device type ID: 0x%llx", buf, 0xCu);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_18;
    }
LABEL_17:
    sub_244CC4DE0(0, 1);
LABEL_18:
    v21 = 0;
    goto LABEL_19;
  }
  if ((v10 & 0xFFFF0000) > 0xFFFE0000 || (v10 & 0xC000) == 0xC000)
  {
    v23 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v13;
      _os_log_impl(&dword_2446BD000, v23, OS_LOG_TYPE_ERROR, "MTRDeviceTypeRevision provided invalid device type ID: 0x%x", buf, 8u);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  uint64_t v16 = objc_msgSend_unsignedLongLongValue(v7, v11, v12);
  if ((unint64_t)(v16 - 1) >= 0xFFFF)
  {
    v24 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v16;
      _os_log_impl(&dword_2446BD000, v24, OS_LOG_TYPE_ERROR, "MTRDeviceTypeRevision provided invalid device type revision: 0x%llx", buf, 0xCu);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v17 = objc_msgSend_copy(v6, v14, v15);
  v20 = objc_msgSend_copy(v7, v18, v19);
  self = sub_244857FD4((id *)&self->super.isa, v17, v20);

  v21 = self;
LABEL_19:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    deviceTypeID = self->_deviceTypeID;
    v11 = objc_msgSend_deviceTypeID(v7, v9, v10);
    if (objc_msgSend_isEqual_(deviceTypeID, v12, (uint64_t)v11))
    {
      deviceTypeRevision = self->_deviceTypeRevision;
      uint64_t v16 = objc_msgSend_deviceTypeRevision(v7, v13, v14);
      char isEqual = objc_msgSend_isEqual_(deviceTypeRevision, v17, (uint64_t)v16);
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_unsignedLongValue(self->_deviceTypeID, a2, v2);
  return v4 ^ objc_msgSend_unsignedShortValue(self->_deviceTypeRevision, v5, v6);
}

- (NSNumber)deviceTypeID
{
  return self->_deviceTypeID;
}

- (NSNumber)deviceTypeRevision
{
  return self->_deviceTypeRevision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceTypeRevision, 0);

  objc_storeStrong((id *)&self->_deviceTypeID, 0);
}

@end