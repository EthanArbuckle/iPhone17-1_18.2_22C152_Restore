@interface BUReadChannelInputStreamAdapter
- (BOOL)canSeek;
- (BUReadChannel)readChannel;
- (BUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3;
- (OS_dispatch_data)leftoverData;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3;
- (void)setLeftoverData:(id)a3;
- (void)setOffset:(int64_t)a3;
- (void)setReadChannel:(id)a3;
@end

@implementation BUReadChannelInputStreamAdapter

- (BUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BUReadChannelInputStreamAdapter;
  v6 = [(BUReadChannelInputStreamAdapter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readChannel, a3);
    objc_storeStrong((id *)&v7->_leftoverData, MEMORY[0x263EF8388]);
  }

  return v7;
}

- (void)dealloc
{
  objc_msgSend_close(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUReadChannelInputStreamAdapter;
  [(BUReadChannelInputStreamAdapter *)&v4 dealloc];
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  unint64_t v49 = a4;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = a3;
  leftoverData = self->_leftoverData;
  size_t size = dispatch_data_get_size(leftoverData);
  unint64_t v8 = a4;
  if (size)
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = sub_21E1ED898;
    applier[3] = &unk_26449E578;
    applier[5] = &v46;
    applier[6] = v45;
    applier[4] = self;
    dispatch_data_apply(leftoverData, applier);
    if (v47[3])
    {
      objc_msgSend_setLeftoverData_(self, v9, MEMORY[0x263EF8388]);
    }
    else
    {
      v11 = objc_msgSend_leftoverData(self, v9, v10);
      uint64_t v12 = v47[3];
      size_t v13 = dispatch_data_get_size((dispatch_data_t)self->_leftoverData);
      dispatch_data_t subrange = dispatch_data_create_subrange(v11, a4 - v12, v13 - a4 - v12);
      objc_msgSend_setLeftoverData_(self, v15, (uint64_t)subrange);
    }
    unint64_t v8 = v47[3];
  }
  if (v8 && self->_readChannel)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = sub_21E1ED93C;
    v42 = sub_21E1ED94C;
    id v43 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    char v37 = 0;
    v16 = dispatch_group_create();
    dispatch_group_enter(v16);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_21E1ED954;
    v30[3] = &unk_26449E5C8;
    v32 = &v46;
    v33 = v45;
    v30[4] = self;
    v34 = &v38;
    v35 = v36;
    v17 = v16;
    v31 = v17;
    v18 = (void *)MEMORY[0x223C22A70](v30);
    v21 = objc_msgSend_readChannel(self, v19, v20);

    if (v21)
    {
      v24 = objc_msgSend_readChannel(self, v22, v23);
      objc_msgSend_readFromOffset_length_handler_(v24, v25, self->_offset, v47[3], v18);
    }
    else
    {
      dispatch_group_leave(v17);
    }
    dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v27 = v39[5];
    if (v27) {
      objc_msgSend_bu_raiseWithError_(MEMORY[0x263EFF940], v26, v27);
    }

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(&v38, 8);

    unint64_t v8 = v47[3];
  }
  unint64_t v28 = a4 - v8;
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v46, 8);
  return v28;
}

- (void)close
{
  objc_super v4 = objc_msgSend_readChannel(self, a2, v2);
  objc_msgSend_close(v4, v5, v6);

  MEMORY[0x270F9A6D0](self, sel_setReadChannel_, 0);
}

- (BOOL)canSeek
{
  v3 = objc_msgSend_readChannel(self, a2, v2);
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)seekToOffset:(int64_t)a3
{
  id v5 = objc_msgSend_readChannel(self, a2, a3);

  if (v5)
  {
    objc_msgSend_setOffset_(self, v6, a3);
    uint64_t v8 = MEMORY[0x263EF8388];
    objc_msgSend_setLeftoverData_(self, v7, v8);
  }
}

- (id)closeLocalStream
{
  return 0;
}

- (BUReadChannel)readChannel
{
  return self->_readChannel;
}

- (void)setReadChannel:(id)a3
{
}

- (OS_dispatch_data)leftoverData
{
  return self->_leftoverData;
}

- (void)setLeftoverData:(id)a3
{
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftoverData, 0);

  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end