@interface LiveFSServiceUserClient
- (LiveFSServiceUserClient)init;
- (int)clearMetaBlocks:(int)a3 ranges:(FSKit_Meta_BlockRange_s *)a4 rangesCount:(int)a5 wait:(int)a6;
- (int)closeFileDescriptorForKernel:(int)a3;
- (int)flushMeta:(int)a3 wait:(int)a4;
- (int)flushMetaBlocks:(int)a3 ranges:(FSKit_Meta_BlockRange_s *)a4 rangesCount:(int)a5 wait:(int)a6;
- (int)openFileDescriptorForKernel:(int)a3 flags:(int)a4;
- (int)purgeMetaBlocks:(int)a3 ranges:(FSKit_Meta_BlockRange_s *)a4 rangesCount:(int)a5;
- (int)readMeta:(int)a3 buffer:(void *)a4 offset:(int64_t)a5 length:(unint64_t)a6;
- (int)readMetaWithRA:(int)a3 buffer:(void *)a4 offset:(int64_t)a5 length:(unint64_t)a6 raList:(FSKit_Meta_Readahead_s *)a7 raListCount:(int)a8;
- (int)writeMeta:(int)a3 buffer:(const void *)a4 offset:(int64_t)a5 length:(unint64_t)a6;
- (int)writeMetaAsync:(int)a3 buffer:(const void *)a4 offset:(int64_t)a5 length:(unint64_t)a6;
- (int)writeMetaDelayed:(int)a3 buffer:(const void *)a4 offset:(int64_t)a5 length:(unint64_t)a6;
- (int)writeMetaSubBlock:(int)a3 offset:(int64_t)a4 length:(unint64_t)a5 subBlockBuffer:(const void *)a6 subBlockOffset:(int64_t)a7 subBlockLength:(unint64_t)a8;
- (unsigned)createVolumePort;
- (unsigned)getVolumePort;
@end

@implementation LiveFSServiceUserClient

- (LiveFSServiceUserClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)LiveFSServiceUserClient;
  result = [(LiveFSUserClient *)&v3 init];
  if (result) {
    *(&result->super.ourPort + 1) = 0;
  }
  return result;
}

- (int)openFileDescriptorForKernel:(int)a3 flags:(int)a4
{
  kern_return_t v7;
  NSObject *v8;
  size_t outputStructCnt;
  uint8_t buf[4];
  kern_return_t v12;
  _DWORD inputStruct[2];
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x263EF8340];
  outputStructCnt = 0;
  v7 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v7)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
    v45 = 0;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v25 = 0u;
    v24 = 0u;
    v23 = 0u;
    v22 = 0u;
    v21 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
    inputStruct[0] = a3;
    inputStruct[1] = a4;
    v7 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x1Bu, inputStruct, 8uLL, 0, &outputStructCnt);
    if (v7)
    {
      v8 = livefs_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v12 = v7;
        _os_log_impl(&dword_23AB0B000, v8, OS_LOG_TYPE_DEFAULT, "open_kernel_fd returned %d", buf, 8u);
      }
    }
  }
  return v7;
}

- (int)closeFileDescriptorForKernel:(int)a3
{
  kern_return_t v5;
  NSObject *v6;
  size_t outputStructCnt;
  uint8_t buf[4];
  kern_return_t v10;
  _OWORD inputStruct[65];
  uint64_t v12;

  v12 = *MEMORY[0x263EF8340];
  outputStructCnt = 0;
  v5 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v5)
  {
    memset(inputStruct, 0, 512);
    LODWORD(inputStruct[0]) = a3;
    v5 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x1Cu, inputStruct, 4uLL, 0, &outputStructCnt);
    if (v5)
    {
      v6 = livefs_std_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v10 = v5;
        _os_log_impl(&dword_23AB0B000, v6, OS_LOG_TYPE_DEFAULT, "close_kernel_fd returned %d", buf, 8u);
      }
    }
  }
  return v5;
}

- (unsigned)createVolumePort
{
  kern_return_t v3;
  kern_return_t v4;
  NSObject *v5;
  unsigned int result;
  size_t outputStructCnt;
  uint8_t buf[4];
  kern_return_t v9;
  _OWORD outputStruct[65];
  uint64_t v11;

  v11 = *MEMORY[0x263EF8340];
  outputStructCnt = 4;
  if (![(LiveFSUserClient *)self checkUserClientPort])
  {
    memset(outputStruct, 0, 512);
    objc_super v3 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x1Du, 0, 0, outputStruct, &outputStructCnt);
    if (!v3)
    {
      result = outputStruct[0];
      goto LABEL_7;
    }
    v4 = v3;
    v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v4;
      _os_log_impl(&dword_23AB0B000, v5, OS_LOG_TYPE_DEFAULT, "create_volume_port returned %d", buf, 8u);
    }
  }
  result = 0;
LABEL_7:
  *(&self->super.ourPort + 1) = result;
  return result;
}

- (unsigned)getVolumePort
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = *(&v2->super.ourPort + 1);
  if (v3 + 1 <= 1) {
    unsigned int v3 = [(LiveFSServiceUserClient *)v2 createVolumePort];
  }
  objc_sync_exit(v2);

  return v3;
}

- (int)writeMeta:(int)a3 buffer:(const void *)a4 offset:(int64_t)a5 length:(unint64_t)a6
{
  kern_return_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t outputStructCnt;
  long long inputStruct;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  uint64_t v54;

  v54 = *MEMORY[0x263EF8340];
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  inputStruct = 0u;
  v23 = 0u;
  outputStructCnt = 0;
  if (a3 < 0 || !a4 || a5 < 0 || a6 - 1048577 <= 0xFFFFFFFFFFEFFFFFLL)
  {
    v11 = -536870206;
    v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[LiveFSServiceUserClient writeMeta:buffer:offset:length:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_11;
  }
  v11 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v11)
  {
    LODWORD(inputStruct) = a3;
    *((void *)&inputStruct + 1) = a4;
    *(void *)&v23 = a5;
    *((void *)&v23 + 1) = a6;
    v11 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x20u, &inputStruct, 0x20uLL, 0, &outputStructCnt);
    if (v11)
    {
      v12 = livefs_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[LiveFSServiceUserClient writeMeta:buffer:offset:length:]();
      }
LABEL_11:
    }
  }
  return v11;
}

- (int)writeMetaAsync:(int)a3 buffer:(const void *)a4 offset:(int64_t)a5 length:(unint64_t)a6
{
  kern_return_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t outputStructCnt;
  long long inputStruct;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  uint64_t v54;

  v54 = *MEMORY[0x263EF8340];
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  inputStruct = 0u;
  v23 = 0u;
  outputStructCnt = 0;
  if (a3 < 0 || !a4 || a5 < 0 || a6 - 1048577 <= 0xFFFFFFFFFFEFFFFFLL)
  {
    v11 = -536870206;
    v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[LiveFSServiceUserClient writeMetaAsync:buffer:offset:length:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_11;
  }
  v11 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v11)
  {
    LODWORD(inputStruct) = a3;
    *((void *)&inputStruct + 1) = a4;
    *(void *)&v23 = a5;
    *((void *)&v23 + 1) = a6;
    v11 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x21u, &inputStruct, 0x20uLL, 0, &outputStructCnt);
    if (v11)
    {
      v12 = livefs_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[LiveFSServiceUserClient writeMetaAsync:buffer:offset:length:]();
      }
LABEL_11:
    }
  }
  return v11;
}

- (int)writeMetaDelayed:(int)a3 buffer:(const void *)a4 offset:(int64_t)a5 length:(unint64_t)a6
{
  kern_return_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t outputStructCnt;
  long long inputStruct;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  uint64_t v54;

  v54 = *MEMORY[0x263EF8340];
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  inputStruct = 0u;
  v23 = 0u;
  outputStructCnt = 0;
  if (a3 < 0 || !a4 || a5 < 0 || a6 - 1048577 <= 0xFFFFFFFFFFEFFFFFLL)
  {
    v11 = -536870206;
    v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[LiveFSServiceUserClient writeMetaDelayed:buffer:offset:length:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_11;
  }
  v11 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v11)
  {
    LODWORD(inputStruct) = a3;
    *((void *)&inputStruct + 1) = a4;
    *(void *)&v23 = a5;
    *((void *)&v23 + 1) = a6;
    v11 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x22u, &inputStruct, 0x20uLL, 0, &outputStructCnt);
    if (v11)
    {
      v12 = livefs_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[LiveFSServiceUserClient writeMetaDelayed:buffer:offset:length:]();
      }
LABEL_11:
    }
  }
  return v11;
}

- (int)writeMetaSubBlock:(int)a3 offset:(int64_t)a4 length:(unint64_t)a5 subBlockBuffer:(const void *)a6 subBlockOffset:(int64_t)a7 subBlockLength:(unint64_t)a8
{
  kern_return_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  size_t outputStructCnt;
  long long inputStruct;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  long long v60;
  long long v61;
  long long v62;
  long long v63;
  long long v64;
  uint64_t v65;

  v65 = *MEMORY[0x263EF8340];
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  inputStruct = 0u;
  v34 = 0u;
  outputStructCnt = 0;
  if (!a8 || a7 < 0 || !a6 || a3 < 0 || a4 < 0 || a5 - 1048577 <= 0xFFFFFFFFFFEFFFFFLL)
  {
    v14 = -536870206;
    v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(LiveFSServiceUserClient *)v15 writeMetaSubBlock:v24 offset:v25 length:v26 subBlockBuffer:v27 subBlockOffset:v28 subBlockLength:v29];
    }
    goto LABEL_13;
  }
  if (a7 < (unint64_t)a4 || a8 + a7 > a5 + a4)
  {
    v14 = -536870206;
    v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(LiveFSServiceUserClient *)v15 writeMetaSubBlock:v17 offset:v18 length:v19 subBlockBuffer:v20 subBlockOffset:v21 subBlockLength:v22];
    }
LABEL_13:

    return v14;
  }
  v14 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v14)
  {
    LODWORD(inputStruct) = a3;
    *((void *)&inputStruct + 1) = a4;
    *(void *)&v34 = a5;
    *((void *)&v34 + 1) = a6;
    *(void *)&v35 = a7;
    *((void *)&v35 + 1) = a8;
    v14 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x23u, &inputStruct, 0x30uLL, 0, &outputStructCnt);
    if (v14)
    {
      v15 = livefs_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[LiveFSServiceUserClient writeMetaSubBlock:offset:length:subBlockBuffer:subBlockOffset:subBlockLength:]();
      }
      goto LABEL_13;
    }
  }
  return v14;
}

- (int)readMeta:(int)a3 buffer:(void *)a4 offset:(int64_t)a5 length:(unint64_t)a6
{
  kern_return_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t outputStructCnt;
  long long inputStruct;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  uint64_t v54;

  v54 = *MEMORY[0x263EF8340];
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  inputStruct = 0u;
  v23 = 0u;
  outputStructCnt = 0;
  if (a3 < 0 || !a4 || a5 < 0 || a6 - 1048577 <= 0xFFFFFFFFFFEFFFFFLL)
  {
    v11 = -536870206;
    v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[LiveFSServiceUserClient readMeta:buffer:offset:length:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_11;
  }
  v11 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v11)
  {
    LODWORD(inputStruct) = a3;
    *((void *)&inputStruct + 1) = a4;
    *(void *)&v23 = a5;
    *((void *)&v23 + 1) = a6;
    v11 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x24u, &inputStruct, 0x20uLL, 0, &outputStructCnt);
    if (v11)
    {
      v12 = livefs_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[LiveFSServiceUserClient readMeta:buffer:offset:length:]();
      }
LABEL_11:
    }
  }
  return v11;
}

- (int)readMetaWithRA:(int)a3 buffer:(void *)a4 offset:(int64_t)a5 length:(unint64_t)a6 raList:(FSKit_Meta_Readahead_s *)a7 raListCount:(int)a8
{
  kern_return_t v11;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  size_t outputStructCnt;
  long long inputStruct;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  uint64_t v57;

  v57 = *MEMORY[0x263EF8340];
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  inputStruct = 0u;
  v26 = 0u;
  outputStructCnt = 0;
  if (a3 < 0 || !a4 || a5 < 0 || a6 - 1048577 <= 0xFFFFFFFFFFEFFFFFLL)
  {
    v11 = -536870206;
    v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(LiveFSServiceUserClient *)v15 readMetaWithRA:v17 buffer:v18 offset:v19 length:v20 raList:v21 raListCount:v22];
    }
    goto LABEL_13;
  }
  v11 = -536870206;
  if (a7)
  {
    if ((a8 - 9) >= 0xFFFFFFF8)
    {
      v11 = [(LiveFSUserClient *)self checkUserClientPort];
      if (!v11)
      {
        LODWORD(inputStruct) = a3;
        *((void *)&inputStruct + 1) = a4;
        *(void *)&v26 = a5;
        *((void *)&v26 + 1) = a6;
        __memcpy_chk();
        LODWORD(v35) = a8;
        v11 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x25u, &inputStruct, 0xA8uLL, 0, &outputStructCnt);
        if (v11)
        {
          v15 = livefs_std_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[LiveFSServiceUserClient readMetaWithRA:buffer:offset:length:raList:raListCount:]();
          }
LABEL_13:
        }
      }
    }
  }
  return v11;
}

- (int)flushMeta:(int)a3 wait:(int)a4
{
  kern_return_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v17;
  _DWORD inputStruct[2];
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x263EF8340];
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  v50 = 0;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  v17 = 0;
  if (a3 < 0)
  {
    v7 = -536870206;
    v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[LiveFSServiceUserClient flushMeta:wait:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_8;
  }
  v7 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v7)
  {
    inputStruct[0] = a3;
    inputStruct[1] = a4;
    v7 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x26u, inputStruct, 8uLL, 0, &v17);
    if (v7)
    {
      v8 = livefs_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[LiveFSServiceUserClient flushMeta:wait:]();
      }
LABEL_8:
    }
  }
  return v7;
}

- (int)flushMetaBlocks:(int)a3 ranges:(FSKit_Meta_BlockRange_s *)a4 rangesCount:(int)a5 wait:(int)a6
{
  kern_return_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t outputStructCnt;
  _OWORD inputStruct[8];
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  uint64_t v46;

  v46 = *MEMORY[0x263EF8340];
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  memset(inputStruct, 0, sizeof(inputStruct));
  outputStructCnt = 0;
  if (a3 < 0 || !a4 || (a5 - 9) <= 0xFFFFFFF7)
  {
    v10 = -536870206;
    v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LiveFSServiceUserClient flushMetaBlocks:ranges:rangesCount:wait:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_10;
  }
  v10 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v10)
  {
    LODWORD(inputStruct[0]) = a3;
    __memcpy_chk();
    *((void *)&v22 + 1) = __PAIR64__(a6, a5);
    v10 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x27u, inputStruct, 0x90uLL, 0, &outputStructCnt);
    if (v10)
    {
      v11 = livefs_std_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[LiveFSServiceUserClient flushMetaBlocks:ranges:rangesCount:wait:]();
      }
LABEL_10:
    }
  }
  return v10;
}

- (int)clearMetaBlocks:(int)a3 ranges:(FSKit_Meta_BlockRange_s *)a4 rangesCount:(int)a5 wait:(int)a6
{
  kern_return_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t outputStructCnt;
  _OWORD inputStruct[8];
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  uint64_t v46;

  v46 = *MEMORY[0x263EF8340];
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  memset(inputStruct, 0, sizeof(inputStruct));
  outputStructCnt = 0;
  if (a3 < 0 || !a4 || (a5 - 9) <= 0xFFFFFFF7)
  {
    v10 = -536870206;
    v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LiveFSServiceUserClient clearMetaBlocks:ranges:rangesCount:wait:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_10;
  }
  v10 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v10)
  {
    LODWORD(inputStruct[0]) = a3;
    __memcpy_chk();
    *((void *)&v22 + 1) = __PAIR64__(a6, a5);
    v10 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x28u, inputStruct, 0x90uLL, 0, &outputStructCnt);
    if (v10)
    {
      v11 = livefs_std_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[LiveFSServiceUserClient clearMetaBlocks:ranges:rangesCount:wait:]();
      }
LABEL_10:
    }
  }
  return v10;
}

- (int)purgeMetaBlocks:(int)a3 ranges:(FSKit_Meta_BlockRange_s *)a4 rangesCount:(int)a5
{
  kern_return_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t outputStructCnt;
  _OWORD inputStruct[8];
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  uint64_t v44;

  v44 = *MEMORY[0x263EF8340];
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  memset(inputStruct, 0, sizeof(inputStruct));
  outputStructCnt = 0;
  if (a3 < 0 || !a4 || (a5 - 9) <= 0xFFFFFFF7)
  {
    v8 = -536870206;
    v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[LiveFSServiceUserClient purgeMetaBlocks:ranges:rangesCount:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_10;
  }
  v8 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v8)
  {
    LODWORD(inputStruct[0]) = a3;
    __memcpy_chk();
    DWORD2(v20) = a5;
    v8 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x29u, inputStruct, 0x90uLL, 0, &outputStructCnt);
    if (v8)
    {
      v9 = livefs_std_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[LiveFSServiceUserClient purgeMetaBlocks:ranges:rangesCount:]();
      }
LABEL_10:
    }
  }
  return v8;
}

- (void)writeMeta:(uint64_t)a3 buffer:(uint64_t)a4 offset:(uint64_t)a5 length:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeMeta:buffer:offset:length:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "write_meta returned %d", v2, v3, v4, v5, v6);
}

- (void)writeMetaAsync:(uint64_t)a3 buffer:(uint64_t)a4 offset:(uint64_t)a5 length:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeMetaAsync:buffer:offset:length:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "write_meta_async returned %d", v2, v3, v4, v5, v6);
}

- (void)writeMetaDelayed:(uint64_t)a3 buffer:(uint64_t)a4 offset:(uint64_t)a5 length:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeMetaDelayed:buffer:offset:length:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "write_meta_delayed returned %d", v2, v3, v4, v5, v6);
}

- (void)writeMetaSubBlock:(uint64_t)a3 offset:(uint64_t)a4 length:(uint64_t)a5 subBlockBuffer:(uint64_t)a6 subBlockOffset:(uint64_t)a7 subBlockLength:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeMetaSubBlock:(uint64_t)a3 offset:(uint64_t)a4 length:(uint64_t)a5 subBlockBuffer:(uint64_t)a6 subBlockOffset:(uint64_t)a7 subBlockLength:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeMetaSubBlock:offset:length:subBlockBuffer:subBlockOffset:subBlockLength:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "write_meta_subblock returned %d", v2, v3, v4, v5, v6);
}

- (void)readMeta:(uint64_t)a3 buffer:(uint64_t)a4 offset:(uint64_t)a5 length:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)readMeta:buffer:offset:length:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "read_meta returned %d", v2, v3, v4, v5, v6);
}

- (void)readMetaWithRA:(uint64_t)a3 buffer:(uint64_t)a4 offset:(uint64_t)a5 length:(uint64_t)a6 raList:(uint64_t)a7 raListCount:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)readMetaWithRA:buffer:offset:length:raList:raListCount:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "read_meta_with_ra returned %d", v2, v3, v4, v5, v6);
}

- (void)flushMeta:(uint64_t)a3 wait:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)flushMeta:wait:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "flush_meta returned %d", v2, v3, v4, v5, v6);
}

- (void)flushMetaBlocks:(uint64_t)a3 ranges:(uint64_t)a4 rangesCount:(uint64_t)a5 wait:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)flushMetaBlocks:ranges:rangesCount:wait:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "flush_meta_blocks returned %d", v2, v3, v4, v5, v6);
}

- (void)clearMetaBlocks:(uint64_t)a3 ranges:(uint64_t)a4 rangesCount:(uint64_t)a5 wait:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)clearMetaBlocks:ranges:rangesCount:wait:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "clear_meta_blocks returned %d", v2, v3, v4, v5, v6);
}

- (void)purgeMetaBlocks:(uint64_t)a3 ranges:(uint64_t)a4 rangesCount:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)purgeMetaBlocks:ranges:rangesCount:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "purge_meta_blocks returned %d", v2, v3, v4, v5, v6);
}

@end