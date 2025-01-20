@interface CMAmbientPressureDataArray
- (CMAmbientPressureDataArray)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
@end

@implementation CMAmbientPressureDataArray

- (CMAmbientPressureDataArray)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v7 = [CLSensorRecorderSensorMeta alloc];
    v9 = objc_msgSend_initWithDataType_(v7, v8, 0xFFFFFFFFLL);
    v12 = (unsigned int *)objc_msgSend_bytes(a3, v10, v11);
    objc_msgSend_setDataSize_(v9, v13, bswap32(*v12));
    uint64_t v16 = objc_msgSend_bytes(a3, v14, v15);
    objc_msgSend_setTimestamp_(v9, v17, bswap64(*(void *)(v16 + 4)));
    uint64_t v20 = objc_msgSend_bytes(a3, v18, v19);
    objc_msgSend_setStartTime_(v9, v21, v22, *(double *)(v20 + 12));
    uint64_t v25 = objc_msgSend_bytes(a3, v23, v24) + 20;
    v28 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v26, v27);
    uint64_t v49 = v25;
    int v50 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    uint64_t v51 = 0;
    int v48 = 0;
    if (objc_msgSend_dataSize(v9, v29, v30))
    {
      unsigned int v31 = 0;
      do
      {
        v46[0] = 0;
        v46[1] = 0;
        int v47 = 0;
        sub_1905C021C((int *)&v49, &v48, (uint64_t)v46);
        v31 += v48;
        v32 = [CMRecordedPressureData alloc];
        uint64_t v35 = objc_msgSend_timestamp(v9, v33, v34);
        objc_msgSend_startTime(v9, v36, v37);
        v39 = objc_msgSend_initWithData_timestamp_walltime_identifier_(v32, v38, (uint64_t)v46, v35, 0);
        objc_msgSend_addObject_(v28, v40, (uint64_t)v39);
      }
      while (v31 < objc_msgSend_dataSize(v9, v41, v42));
    }

    id v43 = objc_alloc(MEMORY[0x1E4F1C978]);
    return (CMAmbientPressureDataArray *)objc_msgSend_initWithArray_(v43, v44, (uint64_t)v28);
  }
  else
  {

    return 0;
  }
}

@end