@interface BUBufferedReadChannel
- (BOOL)isStreamOutputDone;
- (BOOL)isValid;
- (BUBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5;
- (BUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6;
- (BUReadChannel)sourceReadChannel;
- (BUStreamReadChannel)streamReadChannel;
- (NSArray)blockInfos;
- (NSError)sourceReadChannelError;
- (OS_dispatch_data)currentStreamOutputData;
- (OS_dispatch_queue)readQueue;
- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5;
- (id)streamReadChannelBlock;
- (id)streamReadChannelSourceHandler;
- (int64_t)sourceOffset;
- (int64_t)streamOutputOffset;
- (unint64_t)sourceLength;
- (unint64_t)sourceReadBufferSize;
- (unint64_t)streamOutputLength;
- (unint64_t)streamOutputOutstandingLength;
- (void)_close;
- (void)_closeStreamReadChannel;
- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)_resetStreamReadChannelIfNeededForOffset:(int64_t)a3 length:(unint64_t)a4;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)dealloc;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readWithHandler:(id)a3;
- (void)setBlockInfos:(id)a3;
- (void)setCurrentStreamOutputData:(id)a3;
- (void)setLowWater:(unint64_t)a3;
- (void)setReadQueue:(id)a3;
- (void)setSourceLength:(unint64_t)a3;
- (void)setSourceOffset:(int64_t)a3;
- (void)setSourceReadBufferSize:(unint64_t)a3;
- (void)setSourceReadChannel:(id)a3;
- (void)setSourceReadChannelError:(id)a3;
- (void)setStreamOutputDone:(BOOL)a3;
- (void)setStreamOutputLength:(unint64_t)a3;
- (void)setStreamOutputOffset:(int64_t)a3;
- (void)setStreamOutputOutstandingLength:(unint64_t)a3;
- (void)setStreamReadChannel:(id)a3;
- (void)setStreamReadChannelBlock:(id)a3;
- (void)setStreamReadChannelSourceHandler:(id)a3;
@end

@implementation BUBufferedReadChannel

- (BUBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5
{
  return (BUBufferedReadChannel *)MEMORY[0x270F9A6D0](self, sel_initWithReadChannel_sourceReadBufferSize_blockInfos_streamReadChannelBlock_, a3);
}

- (BUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)BUBufferedReadChannel;
  v14 = [(BUBufferedReadChannel *)&v25 init];
  v15 = v14;
  if (v14)
  {
    if (a4 && v11 && v13)
    {
      dispatch_queue_t v16 = dispatch_queue_create("BUBufferedReadChannel.Read", 0);
      readQueue = v15->_readQueue;
      v15->_readQueue = (OS_dispatch_queue *)v16;

      dispatch_queue_set_specific((dispatch_queue_t)v15->_readQueue, (const void *)qword_267D29788, (void *)qword_267D29788, 0);
      objc_storeStrong((id *)&v15->_sourceReadChannel, a3);
      v15->_sourceReadBufferSize = a4;
      v15->_sourceOffset = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v20 = objc_msgSend_copy(v12, v18, v19);
      blockInfos = v15->_blockInfos;
      v15->_blockInfos = (NSArray *)v20;

      uint64_t v22 = MEMORY[0x223C22A70](v13);
      id streamReadChannelBlock = v15->_streamReadChannelBlock;
      v15->_id streamReadChannelBlock = (id)v22;

      v15->_streamOutputOffset = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {

      v15 = 0;
    }
  }

  return v15;
}

- (void)dealloc
{
  objc_msgSend__close(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUBufferedReadChannel;
  [(BUBufferedReadChannel *)&v4 dealloc];
}

- (void)close
{
  v3 = (void *)qword_267D29788;
  if (dispatch_get_specific((const void *)qword_267D29788) == v3)
  {
    objc_msgSend__close(self, v4, v5);
  }
  else
  {
    readQueue = self->_readQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E1E8968;
    block[3] = &unk_26449D948;
    block[4] = self;
    dispatch_sync(readQueue, block);
  }
}

- (void)_close
{
  objc_msgSend__closeStreamReadChannel(self, a2, v2);
  objc_msgSend_close(self->_sourceReadChannel, v4, v5);
  sourceReadChannel = self->_sourceReadChannel;
  self->_sourceReadChannel = 0;

  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = 0;
}

- (void)_closeStreamReadChannel
{
  objc_msgSend_close(self->_streamReadChannel, a2, v2);
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = 0;
}

- (void)_resetStreamReadChannelIfNeededForOffset:(int64_t)a3 length:(unint64_t)a4
{
  int64_t v5 = a3;
  uint64_t v70 = *MEMORY[0x263EF8340];
  int64_t streamOutputOffset = self->_streamOutputOffset;
  if (streamOutputOffset <= a3)
  {
    unint64_t streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
    unint64_t v9 = streamOutputOutstandingLength + streamOutputOffset;
    if (streamOutputOutstandingLength == -1 || v9 > a3) {
      return;
    }
  }
  objc_msgSend__closeStreamReadChannel(self, a2, a3);
  *(_OWORD *)&self->_sourceOffset = xmmword_21E1F6C90;
  *(_OWORD *)&self->_int64_t streamOutputOffset = xmmword_21E1F6C90;
  self->_streamOutputLength = 0;
  uint64_t v13 = objc_msgSend_count(self->_blockInfos, v11, v12);
  if (!v13)
  {
    uint64_t v22 = 0;
    goto LABEL_27;
  }
  uint64_t v14 = v13;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obj = self->_blockInfos;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v65, v69, 16);
  if (!v16)
  {
    uint64_t v22 = 0;
    goto LABEL_26;
  }
  uint64_t v19 = v16;
  int64_t v20 = 0;
  unint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v63 = *(void *)v66;
  do
  {
    uint64_t v23 = 0;
    do
    {
      if (*(void *)v66 != v63) {
        objc_enumerationMutation(obj);
      }
      v24 = *(void **)(*((void *)&v65 + 1) + 8 * v23);
      v20 += objc_msgSend_decodedLength(v24, v17, v18);
      if (v21)
      {
        objc_msgSend_addObject_(v22, v25, (uint64_t)v24);
        self->_sourceLength += objc_msgSend_encodedLength(v24, v27, v28);
        v21 += objc_msgSend_decodedLength(v24, v29, v30);
        unint64_t v33 = self->_streamOutputOutstandingLength + objc_msgSend_decodedLength(v24, v31, v32);
      }
      else
      {
        if (v20 <= v5)
        {
          self->_sourceOffset += objc_msgSend_encodedLength(v24, v25, v26);
          unint64_t v21 = 0;
          self->_streamOutputOffset += objc_msgSend_decodedLength(v24, v49, v50);
          goto LABEL_17;
        }
        id v34 = objc_alloc(MEMORY[0x263EFF980]);
        uint64_t v36 = objc_msgSend_initWithCapacity_(v34, v35, v14);
        v37 = v22;
        int64_t v38 = v5;
        unint64_t v39 = a4;
        v40 = (void *)v36;

        objc_msgSend_addObject_(v40, v41, (uint64_t)v24);
        self->_sourceLength = objc_msgSend_encodedLength(v24, v42, v43);
        unint64_t v21 = objc_msgSend_decodedLength(v24, v44, v45);
        unint64_t v33 = objc_msgSend_decodedLength(v24, v46, v47);
        v48 = v40;
        a4 = v39;
        int64_t v5 = v38;
        uint64_t v22 = v48;
      }
      self->_unint64_t streamOutputOutstandingLength = v33;
      if (v21 > a4) {
        goto LABEL_26;
      }
LABEL_17:
      if (!--v14)
      {
        self->_sourceLength = -1;
        self->_unint64_t streamOutputOutstandingLength = -1;
      }
      ++v23;
    }
    while (v19 != v23);
    uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v65, v69, 16);
    uint64_t v19 = v51;
  }
  while (v51);
LABEL_26:

LABEL_27:
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  self->_streamOutputDone = 0;
  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = 0;

  id streamReadChannelBlock = (void (**)(id, void *, void *))self->_streamReadChannelBlock;
  v55 = [BUBufferedReadChannelHelper alloc];
  Channel = objc_msgSend_initWithBufferedReadChannel_(v55, v56, (uint64_t)self);
  streamReadChannelBlock[2](streamReadChannelBlock, Channel, v22);
  v58 = (BUStreamReadChannel *)objc_claimAutoreleasedReturnValue();
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = v58;

  v60 = self->_streamReadChannel;
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = sub_21E1E8D44;
  v64[3] = &unk_26449E3E8;
  v64[4] = self;
  objc_msgSend_readWithHandler_(v60, v61, (uint64_t)v64);
}

- (void)setStreamReadChannelSourceHandler:(id)a3
{
  self->_id streamReadChannelSourceHandler = (id)MEMORY[0x223C22A70](a3, a2);

  MEMORY[0x270F9A758]();
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  readQueue = self->_readQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E1E8F58;
  v11[3] = &unk_26449E410;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(readQueue, v11);
}

- (void)readWithHandler:(id)a3
{
}

- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = (void (**)(id, BOOL, void *, void))a5;
  unint64_t v9 = (a3 & (a3 >> 63)) + a4;
  int64_t v10 = a3 & ~(a3 >> 63);
  objc_msgSend__resetStreamReadChannelIfNeededForOffset_length_(self, v11, v10, v9);
  char v32 = 0;
  int64_t v13 = objc_msgSend__currentDataIntersectionWithOffset_length_isReadDone_(self, v12, v10, v9, &v32);
  v15 = v13;
  if (v13)
  {
    size_t size = dispatch_data_get_size(v13);
    v10 += size;
    v9 -= size;
    BOOL v17 = v32 != 0;
  }
  else
  {
    if (!v32) {
      goto LABEL_7;
    }
    BOOL v17 = 1;
  }
  v8[2](v8, v17, v15, 0);
  if (v32)
  {
    dispatch_resume((dispatch_object_t)self->_readQueue);
    goto LABEL_13;
  }
LABEL_7:
  objc_msgSend__resetStreamReadChannelIfNeededForOffset_length_(self, v14, v10, v9);
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  unint64_t streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
  unint64_t streamOutputLength = self->_streamOutputLength;
  self->_streamOutputOffset += streamOutputLength;
  if (streamOutputOutstandingLength != -1) {
    self->_unint64_t streamOutputOutstandingLength = streamOutputOutstandingLength - streamOutputLength;
  }
  self->_unint64_t streamOutputLength = 0;
  sourceReadChannel = self->_sourceReadChannel;
  int64_t sourceOffset = self->_sourceOffset;
  if (self->_sourceLength >= self->_sourceReadBufferSize) {
    unint64_t sourceReadBufferSize = self->_sourceReadBufferSize;
  }
  else {
    unint64_t sourceReadBufferSize = self->_sourceLength;
  }
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_21E1E9220;
  v25[3] = &unk_26449E438;
  v25[4] = self;
  uint64_t v26 = v8;
  v27 = v31;
  unint64_t v28 = sourceReadBufferSize;
  int64_t v29 = v10;
  unint64_t v30 = v9;
  objc_msgSend_readFromOffset_length_handler_(sourceReadChannel, v24, sourceOffset, sourceReadBufferSize, v25);

  _Block_object_dispose(v31, 8);
LABEL_13:
}

- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5
{
  if (__CFADD__(a3, a4)) {
    unint64_t v7 = -1;
  }
  else {
    unint64_t v7 = a3 + a4;
  }
  int64_t streamOutputOffset = self->_streamOutputOffset;
  if (streamOutputOffset <= a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = self->_streamOutputOffset;
  }
  unint64_t streamOutputLength = self->_streamOutputLength;
  unint64_t v11 = streamOutputLength + streamOutputOffset;
  if (v7 >= streamOutputLength + streamOutputOffset) {
    unint64_t v12 = streamOutputLength + streamOutputOffset;
  }
  else {
    unint64_t v12 = v7;
  }
  size_t v13 = v12 - v9;
  if (v12 <= v9)
  {
    dispatch_data_t subrange = 0;
    if (!a5) {
      goto LABEL_18;
    }
LABEL_14:
    char isStreamOutputDone = objc_msgSend_isStreamOutputDone(self, a2, v13);
    if (v7 <= v11) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = isStreamOutputDone;
    }
    *a5 = v16;
    goto LABEL_18;
  }
  dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)self->_currentStreamOutputData, v9 - streamOutputOffset, v13);
  if (a5) {
    goto LABEL_14;
  }
LABEL_18:

  return subrange;
}

- (void)setLowWater:(unint64_t)a3
{
}

- (void)addBarrier:(id)a3
{
}

- (BOOL)isValid
{
  return ((uint64_t (*)(BUReadChannel *, char *))MEMORY[0x270F9A6D0])(self->_sourceReadChannel, sel_isValid);
}

- (id)streamReadChannelSourceHandler
{
  return self->_streamReadChannelSourceHandler;
}

- (OS_dispatch_queue)readQueue
{
  return self->_readQueue;
}

- (void)setReadQueue:(id)a3
{
}

- (BUReadChannel)sourceReadChannel
{
  return self->_sourceReadChannel;
}

- (void)setSourceReadChannel:(id)a3
{
}

- (unint64_t)sourceReadBufferSize
{
  return self->_sourceReadBufferSize;
}

- (void)setSourceReadBufferSize:(unint64_t)a3
{
  self->_unint64_t sourceReadBufferSize = a3;
}

- (int64_t)sourceOffset
{
  return self->_sourceOffset;
}

- (void)setSourceOffset:(int64_t)a3
{
  self->_int64_t sourceOffset = a3;
}

- (unint64_t)sourceLength
{
  return self->_sourceLength;
}

- (void)setSourceLength:(unint64_t)a3
{
  self->_sourceLength = a3;
}

- (NSError)sourceReadChannelError
{
  return self->_sourceReadChannelError;
}

- (void)setSourceReadChannelError:(id)a3
{
}

- (NSArray)blockInfos
{
  return self->_blockInfos;
}

- (void)setBlockInfos:(id)a3
{
}

- (id)streamReadChannelBlock
{
  return self->_streamReadChannelBlock;
}

- (void)setStreamReadChannelBlock:(id)a3
{
}

- (BUStreamReadChannel)streamReadChannel
{
  return self->_streamReadChannel;
}

- (void)setStreamReadChannel:(id)a3
{
}

- (BOOL)isStreamOutputDone
{
  return self->_streamOutputDone;
}

- (void)setStreamOutputDone:(BOOL)a3
{
  self->_streamOutputDone = a3;
}

- (int64_t)streamOutputOffset
{
  return self->_streamOutputOffset;
}

- (void)setStreamOutputOffset:(int64_t)a3
{
  self->_int64_t streamOutputOffset = a3;
}

- (unint64_t)streamOutputOutstandingLength
{
  return self->_streamOutputOutstandingLength;
}

- (void)setStreamOutputOutstandingLength:(unint64_t)a3
{
  self->_unint64_t streamOutputOutstandingLength = a3;
}

- (unint64_t)streamOutputLength
{
  return self->_streamOutputLength;
}

- (void)setStreamOutputLength:(unint64_t)a3
{
  self->_unint64_t streamOutputLength = a3;
}

- (OS_dispatch_data)currentStreamOutputData
{
  return self->_currentStreamOutputData;
}

- (void)setCurrentStreamOutputData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStreamOutputData, 0);
  objc_storeStrong((id *)&self->_streamReadChannel, 0);
  objc_storeStrong(&self->_streamReadChannelBlock, 0);
  objc_storeStrong((id *)&self->_blockInfos, 0);
  objc_storeStrong((id *)&self->_sourceReadChannelError, 0);
  objc_storeStrong((id *)&self->_sourceReadChannel, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);

  objc_storeStrong(&self->_streamReadChannelSourceHandler, 0);
}

@end