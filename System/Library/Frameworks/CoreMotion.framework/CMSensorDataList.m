@interface CMSensorDataList
- (BOOL)_updatePointers;
- (CMSensorDataList)initWithIdentifier:(unint64_t)a3 andType:(int)a4;
- (id).cxx_construct;
- (id)initFrom:(double)a3 to:(double)a4 withType:(int)a5;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_updateCurrentBlockProperties;
- (void)dealloc;
@end

@implementation CMSensorDataList

- (CMSensorDataList)initWithIdentifier:(unint64_t)a3 andType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v16.receiver = self;
  v16.super_class = (Class)CMSensorDataList;
  v6 = [(CMSensorDataList *)&v16 init];
  if (v6)
  {
    v7 = objc_alloc_init(CMSensorRecorderInternal);
    v6->fProxy = v7;
    v6->fCurrentBlock = (CLSensorRecorderSensorMeta *)objc_msgSend_newMetaSinceID_forType_(v7, v8, a3, v4);
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v6->fCachedData = (NSMutableArray *)objc_msgSend_initWithCapacity_(v9, v10, 16);
    v6->fDataType = v4;
    if (!v6->fCurrentBlock
      || (objc_msgSend__updateCurrentBlockProperties(v6, v11, v12),
          v6->fCurrentIdentifier = v6->fCurrentBlockIdentifier,
          v6->fDataBuffer = 0,
          *(_OWORD *)&v6->fRetrievedDataBufferIdentifier = xmmword_190608F90,
          (objc_msgSend__updatePointers(v6, v13, v14) & 1) == 0))
    {

      return 0;
    }
  }
  return v6;
}

- (id)initFrom:(double)a3 to:(double)a4 withType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v23.receiver = self;
  v23.super_class = (Class)CMSensorDataList;
  v8 = [(CMSensorDataList *)&v23 init];
  if (v8)
  {
    id v9 = objc_alloc_init(CMSensorRecorderInternal);
    v8->fProxy = v9;
    v8->fMetaArray = (NSArray *)objc_msgSend_newMetaFrom_to_forType_(v9, v10, v5, a3, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v8->fCachedData = (NSMutableArray *)objc_msgSend_initWithCapacity_(v11, v12, 16);
    v8->fDataType = v5;
    fMetaArray = v8->fMetaArray;
    if (!fMetaArray
      || !objc_msgSend_count(fMetaArray, v13, v14)
      || (v8->fCurrentBlock = (CLSensorRecorderSensorMeta *)(id)objc_msgSend_objectAtIndexedSubscript_(v8->fMetaArray, v16, 0), objc_msgSend__updateCurrentBlockProperties(v8, v17, v18), unint64_t fCurrentBlockIdentifier = v8->fCurrentBlockIdentifier, v8->fCurrentIdentifier = fCurrentBlockIdentifier, v8->fStartingIdentifier = fCurrentBlockIdentifier, v8->fDataBuffer = 0, *(_OWORD *)&v8->fRetrievedDataBufferIdentifier = xmmword_190608F90, (objc_msgSend__updatePointers(v8, v20, v21) & 1) == 0))
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_msgSend_teardown(self->fProxy, v3, v4);
  v5.receiver = self;
  v5.super_class = (Class)CMSensorDataList;
  [(CMSensorDataList *)&v5 dealloc];
}

- (void)_updateCurrentBlockProperties
{
  self->unint64_t fCurrentBlockIdentifier = objc_msgSend_identifier(self->fCurrentBlock, a2, v2);
  self->fCurrentBlockDataIdentifier = objc_msgSend_dataIdentifier(self->fCurrentBlock, v4, v5);
  objc_msgSend_startTime(self->fCurrentBlock, v6, v7);
  self->fCurrentBlockStartTime = v8;
  self->fCurrentBlockTimestamp = objc_msgSend_timestamp(self->fCurrentBlock, v9, v10);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result = 0;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)self;
  if (a5 && self->fCurrentBlock)
  {
    unint64_t v10 = 0;
    while (1)
    {
      unint64_t fBlockOffset = self->fBlockOffset;
      if (fBlockOffset + objc_msgSend_offset(self->fCurrentBlock, a2, (uint64_t)a3) >= self->fDataBufferLength)
      {
        uint64_t v64 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
        unint64_t v65 = self->fBlockOffset;
        unint64_t fCurrentBlockIdentifier = self->fCurrentBlockIdentifier;
        v71 = (void *)v64;
        unsigned int v68 = objc_msgSend_offset(self->fCurrentBlock, v66, v67);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v71, v69, (uint64_t)a2, self, @"CMSensorRecorder.mm", 239, @"Unexpected ptr exceeding size of buffer, block id, %llu, block offset %llu, size, %zu", fCurrentBlockIdentifier, v65 + v68, self->fDataBufferLength);
      }
      unsigned int v76 = 0;
      int fDataType = self->fDataType;
      if (fDataType == 2) {
        break;
      }
      if (fDataType != 1)
      {
        if (fDataType)
        {
          v43 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, self, @"CMSensorRecorder.mm", 325, @"Unexpected sensor type!");
          goto LABEL_29;
        }
        float32x4_t v74 = 0uLL;
        LODWORD(v75) = 0;
        *(float *)&double v15 = sub_1905BFF68((int *)&self->fAccelUnpacker, &v76, (uint64_t)&v74);
        if (objc_msgSend_count(self->fCachedData, v16, v17, v15) > v10)
        {
          v19 = objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v18, v10);
          if (objc_msgSend_retainCount(v19, v20, v21) == 1) {
            goto LABEL_14;
          }
          objc_super v23 = CMRecordedAccelerometerData;
          goto LABEL_25;
        }
        v45 = CMRecordedAccelerometerData;
LABEL_21:
        id v46 = [v45 alloc];
        uint64_t v48 = objc_msgSend_initWithData_timestamp_walltime_identifier_(v46, v47, (uint64_t)&v74, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
        goto LABEL_23;
      }
      float32x4_t v74 = 0uLL;
      uint64_t v75 = 0;
      sub_1905C00CC((int *)&self->fGyroUnpacker, &v76, &v74);
      float32x4_t v72 = v74;
      uint64_t v73 = v75;
      if (objc_msgSend_count(self->fCachedData, v34, v35) > v10)
      {
        v37 = objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v36, v10);
        if (objc_msgSend_retainCount(v37, v38, v39) == 1)
        {
          v41 = objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v40, v10);
          objc_msgSend_resetWithData_timestamp_walltime_identifier_(v41, v42, (uint64_t)&v72, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
          goto LABEL_29;
        }
        v57 = [CMRecordedGyroData alloc];
        uint64_t v55 = objc_msgSend_initWithData_timestamp_walltime_identifier_(v57, v58, (uint64_t)&v72, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
        goto LABEL_27;
      }
      v50 = [CMRecordedGyroData alloc];
      uint64_t v48 = objc_msgSend_initWithData_timestamp_walltime_identifier_(v50, v51, (uint64_t)&v72, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
LABEL_23:
      v52 = (void *)v48;
      objc_msgSend_addObject_(self->fCachedData, v49, v48);
LABEL_28:

LABEL_29:
      a4[v10] = (id)objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v33, v10);
      unint64_t v59 = self->fBlockOffset + v76;
      self->unint64_t fBlockOffset = v59;
      if (v59 >= objc_msgSend_dataSize(self->fCurrentBlock, v60, v61))
      {
        ++self->fCurrentIdentifier;
        self->unint64_t fBlockOffset = 0;
      }
      if ((objc_msgSend__updatePointers(self, v62, v63) & 1) == 0) {
        return v10 + 1;
      }
      if (a5 == ++v10) {
        return a5;
      }
    }
    float32x4_t v74 = 0uLL;
    LODWORD(v75) = 0;
    *(float32x2_t *)&double v24 = sub_1905C021C((int *)&self->fPressureUnpacker, &v76, (uint64_t)&v74);
    if (objc_msgSend_count(self->fCachedData, v25, v26, v24) > v10)
    {
      v28 = objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v27, v10);
      if (objc_msgSend_retainCount(v28, v29, v30) == 1)
      {
LABEL_14:
        v31 = objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v22, v10);
        objc_msgSend_resetWithData_timestamp_walltime_identifier_(v31, v32, (uint64_t)&v74, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
        goto LABEL_29;
      }
      objc_super v23 = CMRecordedPressureData;
LABEL_25:
      id v53 = [v23 alloc];
      uint64_t v55 = objc_msgSend_initWithData_timestamp_walltime_identifier_(v53, v54, (uint64_t)&v74, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
LABEL_27:
      v52 = (void *)v55;
      objc_msgSend_setObject_atIndexedSubscript_(self->fCachedData, v56, v55, v10);
      goto LABEL_28;
    }
    v45 = CMRecordedPressureData;
    goto LABEL_21;
  }
  return result;
}

- (BOOL)_updatePointers
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  fCurrentBlock = self->fCurrentBlock;
  if (fCurrentBlock && self->fCurrentIdentifier == self->fCurrentBlockIdentifier)
  {
    if (self->fRetrievedDataBufferIdentifier == self->fCurrentBlockDataIdentifier) {
      return 1;
    }
  }
  else
  {
    fMetaArray = self->fMetaArray;

    if (fMetaArray)
    {
      self->fCurrentBlock = 0;
      unint64_t v8 = self->fCurrentIdentifier - self->fStartingIdentifier;
      if (v8 >= objc_msgSend_count(self->fMetaArray, v6, v7))
      {
        BOOL result = 0;
        self->fCurrentBlock = 0;
        return result;
      }
      unint64_t v10 = (CLSensorRecorderSensorMeta *)(id)objc_msgSend_objectAtIndexedSubscript_(self->fMetaArray, v9, v8);
    }
    else
    {
      unint64_t v10 = (CLSensorRecorderSensorMeta *)objc_msgSend_newMetaByID_forType_(self->fProxy, v6, self->fCurrentIdentifier, self->fDataType);
    }
    self->fCurrentBlock = v10;
    objc_msgSend__updateCurrentBlockProperties(self, v11, v12);
    double v15 = self->fCurrentBlock;
    self->fCurrentIdentifier = self->fCurrentBlockIdentifier;
    if (!v15) {
      return 0;
    }
    if (self->fRetrievedDataBufferIdentifier == self->fCurrentBlockDataIdentifier)
    {
LABEL_15:
      int fDataType = self->fDataType;
      if (fDataType == 2)
      {
        fDataBufferPtr = self->fDataBufferPtr;
        self->fPressureUnpacker.fData = &fDataBufferPtr[objc_msgSend_offset(self->fCurrentBlock, v13, v14)];
        self->fPressureUnpacker.fBitsLeft = 0;
        self->fPressureUnpacker.fTimestampLastDelta = 0;
        *(void *)self->fPressureUnpacker.fSampleLast = 0;
        self->fPressureUnpacker.fTimestampLast = 0;
      }
      else if (fDataType == 1)
      {
        v28 = self->fDataBufferPtr;
        self->fGyroUnpacker.fData = &v28[objc_msgSend_offset(self->fCurrentBlock, v13, v14)];
        self->fGyroUnpacker.fBitsLeft = 0;
        *(_OWORD *)&self->fGyroUnpacker.fTimestampLast = 0u;
        *(_OWORD *)self->fGyroUnpacker.fSampleLast = 0u;
      }
      else if (fDataType)
      {
        v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, @"CMSensorRecorder.mm", 400, @"Unexpected sensor type!");
      }
      else
      {
        v22 = self->fDataBufferPtr;
        self->fAccelUnpacker.fData = &v22[objc_msgSend_offset(self->fCurrentBlock, v13, v14)];
        self->fAccelUnpacker.fBitsLeft = 0;
        self->fAccelUnpacker.fTimestampLastDelta = 0;
        *(void *)self->fAccelUnpacker.fSampleLast = 0;
        self->fAccelUnpacker.fTimestampLast = 0;
        self->fAccelUnpacker.fSampleLast[2] = 0;
      }
      return 1;
    }
  }

  uint64_t v17 = (OS_xpc_object *)objc_msgSend_newDataByID_metaID_forType_(self->fProxy, v16, self->fCurrentBlockDataIdentifier, self->fCurrentBlockIdentifier, self->fDataType);
  self->fDataBuffer = v17;
  if (v17)
  {
    bytes_ptr = (char *)xpc_data_get_bytes_ptr(v17);
    self->fDataBufferPtr = bytes_ptr;
    self->fRetrievedDataBufferIdentifier = self->fCurrentBlockDataIdentifier;
    if (!bytes_ptr)
    {
      v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, @"CMSensorRecorder.mm", 385, @"Data pointer returned should be valid");
    }
    self->fDataBufferLength = xpc_data_get_length(self->fDataBuffer);
    self->unint64_t fBlockOffset = 0;
    goto LABEL_15;
  }
  if (qword_1E929D908 != -1) {
    dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
  }
  double v24 = qword_1E929D910;
  if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v24, OS_LOG_TYPE_ERROR, "Unable to allocate buffer for sensor recorder.", buf, 2u);
  }
  int v25 = sub_1902D8400(115, 0);
  BOOL result = 0;
  if (v25)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    uint64_t v26 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMSensorDataList _updatePointers]", "CoreLocation: %s\n", v26);
    if (v26 != (char *)buf) {
      free(v26);
    }
    return 0;
  }
  return result;
}

- (id).cxx_construct
{
  *((void *)self + 14) = 0;
  *((_DWORD *)self + 30) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 16) = 0;
  *((_DWORD *)self + 38) = 0;
  *((void *)self + 20) = 0;
  *((_DWORD *)self + 42) = 0;
  *((void *)self + 29) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 28) = 0;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *(_OWORD *)((char *)self + 204) = 0u;
  return self;
}

@end