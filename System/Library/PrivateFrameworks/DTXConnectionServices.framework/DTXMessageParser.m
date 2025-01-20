@interface DTXMessageParser
- (DTXMessageParser)initWithMessageHandler:(id)a3 andParseExceptionHandler:(id)a4;
- (id)parsingComplete;
- (void)_messageParsedWithHeader:(DTXMessageHeader *)a3 bytes:(const void *)a4 length:(unint64_t)a5 destructor:(id)a6;
- (void)dealloc;
- (void)parseIncomingBytes:(const char *)a3 length:(unint64_t)a4;
- (void)replaceCompressor:(id)a3;
@end

@implementation DTXMessageParser

- (DTXMessageParser)initWithMessageHandler:(id)a3 andParseExceptionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DTXMessageParser;
  v8 = [(DTXMessageParser *)&v23 init];
  v11 = v8;
  if (v8)
  {
    if (v6)
    {
      uint64_t BlockCompressor = [DTXBlockCompressorFactory createBlockCompressor:v9 withBlock:v10];
      compressor = v11->_compressor;
      v11->_compressor = (DTXBlockCompressor *)BlockCompressor;

      uint64_t v14 = MEMORY[0x230F36B10](v7);
      id exceptionHandler = v11->_exceptionHandler;
      v11->_id exceptionHandler = (id)v14;

      uint64_t v16 = MEMORY[0x230F36B10](v6);
      id parsedMessageHandler = v11->_parsedMessageHandler;
      v11->_id parsedMessageHandler = (id)v16;

      uint64_t v18 = objc_opt_new();
      fragmentedBuffersByIdentifier = v11->_fragmentedBuffersByIdentifier;
      v11->_fragmentedBuffersByIdentifier = (NSMutableDictionary *)v18;

      dispatch_queue_t v20 = dispatch_queue_create("DTXMessage parsing queue", 0);
      parsingQueue = v11->_parsingQueue;
      v11->_parsingQueue = (OS_dispatch_queue *)v20;
    }
    else
    {
      parsingQueue = v8;
      v11 = 0;
    }
  }
  return v11;
}

- (void)dealloc
{
  parsingBuffer = (char *)self->_parsingBuffer;
  if (parsingBuffer)
  {
    free(parsingBuffer);
    self->_parsingBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DTXMessageParser;
  [(DTXMessageParser *)&v4 dealloc];
}

- (void)_messageParsedWithHeader:(DTXMessageHeader *)a3 bytes:(const void *)a4 length:(unint64_t)a5 destructor:(id)a6
{
  id v19 = a6;
  uint64_t v10 = (void *)MEMORY[0x230F368A0]();
  v11 = [DTXMessage alloc];
  v13 = [v11 initWithSerializedForm:v12 length:(uint64_t)a4 destructor:a5 compressor:v19];
  v15 = v13;
  if (v13)
  {
    [v13 setExpectsReply:*((_DWORD *)&a3->var5 + 3) & 1];
    [v15 setIdentifier:a3->var5.var0];
    [v15 setChannelCode:a3->var5.var2];
    [v15 setConversationIndex:a3->var5.var1];
    (*((void (**)(void))self->_parsedMessageHandler + 2))();
  }
}

- (void)parseIncomingBytes:(const char *)a3 length:(unint64_t)a4
{
  if (a3 && a4)
  {
    parsingQueue = self->_parsingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22AF49640;
    block[3] = &unk_264883B90;
    block[4] = self;
    block[5] = a4;
    block[6] = a3;
    dispatch_sync(parsingQueue, block);
  }
  else
  {
    id v5 = (id)[self a2:(uint64_t)a3 a4:a4];
  }
}

- (id)parsingComplete
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_22AF49D94;
  uint64_t v10 = sub_22AF49DA4;
  id v11 = 0;
  parsingQueue = self->_parsingQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22AF49DAC;
  v5[3] = &unk_2648839B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(parsingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)replaceCompressor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressor, 0);
  objc_storeStrong((id *)&self->_fragmentedBuffersByIdentifier, 0);
  objc_storeStrong((id *)&self->_parsingQueue, 0);
  objc_storeStrong(&self->_parsedMessageHandler, 0);

  objc_storeStrong(&self->_exceptionHandler, 0);
}

@end