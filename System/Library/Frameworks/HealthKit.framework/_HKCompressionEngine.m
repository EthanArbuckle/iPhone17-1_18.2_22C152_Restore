@interface _HKCompressionEngine
+ (id)processDataWithFunction:(int64_t)a3 algorithm:(int64_t)a4 content:(id)a5 progressBlock:(id)a6;
- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)stream;
- (BOOL)_initializeStream;
- (BOOL)_processIncomingData:(const void *)a3 length:(unint64_t)a4 flags:(int)a5;
- (NSMutableData)destinationBuffer;
- (NSMutableData)sinkContent;
- (_HKCompressionEngine)initWithFunction:(int64_t)a3 algorithm:(int64_t)a4 destination:(id)a5;
- (_HKStreamingDestination)destination;
- (int)algorithm;
- (int)operation;
- (unint64_t)_deliverDestinationContent;
- (void)_decodeEngineFunction:(int64_t)a3 algorithm:(int64_t)a4;
- (void)_gatherReadSinkContent:(id)a3;
- (void)dealloc;
- (void)setAlgorithm:(int)a3;
- (void)setDestination:(id)a3;
- (void)setDestinationBuffer:(id)a3;
- (void)setOperation:(int)a3;
- (void)setStream:(id *)a3;
- (void)sourceContentFinished;
- (void)writeSourceContent:(id)a3;
@end

@implementation _HKCompressionEngine

+ (id)processDataWithFunction:(int64_t)a3 algorithm:(int64_t)a4 content:(id)a5 progressBlock:(id)a6
{
  id v9 = a5;
  v10 = (void (**)(id, void))a6;
  v11 = [[_HKCompressionEngine alloc] initWithFunction:a3 algorithm:a4 destination:0];
  unint64_t v12 = [v9 length];
  id v13 = v9;
  uint64_t v14 = [v13 bytes];
  if (v12)
  {
    uint64_t v15 = v14;
    unint64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = v12 - v16 >= 0x10000 ? 0x10000 : v12 - v16;
      if (![(_HKCompressionEngine *)v11 _processIncomingData:v15 + v16 length:v17 flags:0])break; {
      v16 += v17;
      }
      if (v10) {
        v10[2](v10, v16);
      }
      if (v16 >= v12) {
        goto LABEL_10;
      }
    }
    v18 = 0;
  }
  else
  {
LABEL_10:
    [(_HKCompressionEngine *)v11 sourceContentFinished];
    v18 = [(_HKCompressionEngine *)v11 sinkContent];
  }

  return v18;
}

- (_HKCompressionEngine)initWithFunction:(int64_t)a3 algorithm:(int64_t)a4 destination:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HKCompressionEngine;
  id v9 = [(_HKCompressionEngine *)&v15 init];
  v10 = v9;
  if (v9)
  {
    sinkContent = v9->_sinkContent;
    v9->_sinkContent = 0;

    [(_HKCompressionEngine *)v10 _decodeEngineFunction:a3 algorithm:a4];
    objc_storeWeak((id *)&v10->_destination, v8);
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:0x10000];
    destinationBuffer = v10->_destinationBuffer;
    v10->_destinationBuffer = (NSMutableData *)v12;

    if (![(_HKCompressionEngine *)v10 _initializeStream])
    {

      v10 = 0;
    }
  }

  return v10;
}

- (void)writeSourceContent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  [(_HKCompressionEngine *)self _processIncomingData:v5 length:v6 flags:0];
}

- (void)sourceContentFinished
{
  [(_HKCompressionEngine *)self _processIncomingData:0 length:0 flags:1];
  p_destination = &self->_destination;
  id WeakRetained = objc_loadWeakRetained((id *)p_destination);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_destination);
    [v5 sinkContentFinished];
  }
}

- (void)dealloc
{
  compression_stream_destroy((compression_stream *)self->_stream);
  free(self->_stream);
  self->_stream = 0;
  v3.receiver = self;
  v3.super_class = (Class)_HKCompressionEngine;
  [(_HKCompressionEngine *)&v3 dealloc];
}

- (void)_decodeEngineFunction:(int64_t)a3 algorithm:(int64_t)a4
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
  }
  self->_operation = v4;
LABEL_6:
  if ((unint64_t)a4 <= 3) {
    self->_algorithm = dword_19C3D3A70[a4];
  }
}

- (void)_gatherReadSinkContent:(id)a3
{
  id v4 = a3;
  sinkContent = self->_sinkContent;
  id v8 = v4;
  if (!sinkContent)
  {
    uint64_t v6 = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:0x10000];
    v7 = self->_sinkContent;
    self->_sinkContent = v6;

    id v4 = v8;
    sinkContent = self->_sinkContent;
  }
  [(NSMutableData *)sinkContent appendData:v4];
}

- (unint64_t)_deliverDestinationContent
{
  unint64_t var1 = self->_stream->var1;
  unint64_t v3 = 0x10000 - var1;
  if (var1 != 0x10000)
  {
    [(NSMutableData *)self->_destinationBuffer setLength:0x10000 - var1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_destination);

    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_destination);
      [v6 receiveSinkContent:self->_destinationBuffer];
    }
    else
    {
      [(_HKCompressionEngine *)self _gatherReadSinkContent:self->_destinationBuffer];
    }
    [(NSMutableData *)self->_destinationBuffer setLength:0x10000];
    self->_stream->var0 = (char *)[(NSMutableData *)self->_destinationBuffer mutableBytes];
    self->_stream->unint64_t var1 = 0x10000;
  }
  return v3;
}

- (BOOL)_initializeStream
{
  if (self->_stream)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_HKCompressionEngine.m", 159, @"Invalid parameter not satisfying: %@", @"_stream == nil" object file lineNumber description];
  }
  unint64_t v3 = ($D199E5C2C3D9BBBBA45D19FC310E2D7B *)malloc_type_malloc(0x28uLL, 0x10D00405C4BD7A1uLL);
  self->_stream = v3;
  v3->var0 = "";
  stream = self->_stream;
  stream->unint64_t var1 = 0;
  stream->var2 = "";
  id v5 = (compression_stream *)self->_stream;
  v5->src_size = 0;
  return compression_stream_init(v5, (compression_stream_operation)self->_operation, (compression_algorithm)self->_algorithm) == COMPRESSION_STATUS_OK;
}

- (BOOL)_processIncomingData:(const void *)a3 length:(unint64_t)a4 flags:(int)a5
{
  self->_stream->var0 = (char *)[(NSMutableData *)self->_destinationBuffer mutableBytes];
  stream = self->_stream;
  stream->unint64_t var1 = 0x10000;
  stream->var2 = (char *)a3;
  self->_stream->var3 = a4;
  if (!a4 && (a5 & 1) == 0) {
    return 1;
  }
  while (1)
  {
    while (1)
    {
      compression_status v10 = compression_stream_process((compression_stream *)self->_stream, a5);
      if (v10) {
        break;
      }
      if (!(self->_stream->var3 | [(_HKCompressionEngine *)self _deliverDestinationContent]))return 1; {
    }
      }
    if (v10 == COMPRESSION_STATUS_ERROR) {
      break;
    }
    if (v10 == COMPRESSION_STATUS_END)
    {
      [(_HKCompressionEngine *)self _deliverDestinationContent];
      return 1;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destination);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_destination);
    [v12 receiveSinkContent:0];
  }
  return 0;
}

- (NSMutableData)sinkContent
{
  return self->_sinkContent;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_operation = a3;
}

- (int)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(int)a3
{
  self->_algorithm = a3;
}

- (_HKStreamingDestination)destination
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destination);

  return (_HKStreamingDestination *)WeakRetained;
}

- (void)setDestination:(id)a3
{
}

- (NSMutableData)destinationBuffer
{
  return self->_destinationBuffer;
}

- (void)setDestinationBuffer:(id)a3
{
}

- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)stream
{
  return self->_stream;
}

- (void)setStream:(id *)a3
{
  self->_stream = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationBuffer, 0);
  objc_destroyWeak((id *)&self->_destination);

  objc_storeStrong((id *)&self->_sinkContent, 0);
}

@end