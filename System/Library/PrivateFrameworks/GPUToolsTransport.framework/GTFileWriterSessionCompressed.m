@interface GTFileWriterSessionCompressed
+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)_finalizeCompressedFileData:(id *)a3;
- (BOOL)_writeCompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)finish:(id *)a3;
- (GTFileWriterSessionCompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
- (void)writeFileData:(id)a3 completionHandler:(id)a4;
@end

@implementation GTFileWriterSessionCompressed

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithFileEntries:v12 relativeToURL:v11 options:v10 error:a6];

  return v13;
}

- (GTFileWriterSessionCompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)GTFileWriterSessionCompressed;
  v13 = [(GTFileWriterSessionCompressed *)&v21 init];
  if (!v13) {
    goto LABEL_6;
  }
  unint64_t v14 = [v12 compressionAlgorithm] - 1;
  compression_algorithm v15 = v14 > 4 ? 0 : dword_23C081140[v14];
  compression_stream_init((compression_stream *)(v13 + 8), COMPRESSION_STREAM_DECODE, v15);
  *((void *)v13 + 6) = malloc_type_malloc([v12 chunkSize], 0x269CC8DEuLL);
  uint64_t v16 = [v12 chunkSize];
  *((void *)v13 + 7) = v16;
  *((void *)v13 + 1) = *((void *)v13 + 6);
  *((void *)v13 + 2) = v16;
  uint64_t v17 = +[GTFileWriterSessionUncompressed sessionWithFileEntries:v10 relativeToURL:v11 options:v12 error:a6];
  v18 = (void *)*((void *)v13 + 8);
  *((void *)v13 + 8) = v17;

  if (!*((void *)v13 + 8))
  {
    compression_stream_destroy((compression_stream *)(v13 + 8));
    free(*((void **)v13 + 6));
    v19 = 0;
  }
  else
  {
LABEL_6:
    v19 = v13;
  }

  return v19;
}

- (void)writeFileData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = v6;
  uint64_t v9 = [v8 bytes];
  uint64_t v10 = [v8 length];

  id v12 = 0;
  [(GTFileWriterSessionCompressed *)self _writeCompressedFileData:v9 length:v10 error:&v12];
  id v11 = v12;
  v7[2](v7, v11);
}

- (BOOL)_writeCompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  decompressorOutput = self->_decompressorOutput;
  size_t decompressorOutputSize = self->_decompressorOutputSize;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__GTFileWriterSessionCompressed__writeCompressedFileData_length_error___block_invoke;
  v10[3] = &unk_264E28C00;
  v10[4] = self;
  return ProcessCompressionStream((compression_stream *)&self->_compressionStream, (const uint8_t *)a3, a4, (uint8_t *)decompressorOutput, decompressorOutputSize, (uint64_t)a5, v10);
}

uint64_t __71__GTFileWriterSessionCompressed__writeCompressedFileData_length_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) _writeUncompressedFileData:a2 length:a3 error:a4];
}

- (BOOL)finish:(id *)a3
{
  BOOL v5 = -[GTFileWriterSessionCompressed _finalizeCompressedFileData:](self, "_finalizeCompressedFileData:");
  compression_stream_destroy((compression_stream *)&self->_compressionStream);
  free(self->_decompressorOutput);
  self->_decompressorOutput = 0;
  self->_size_t decompressorOutputSize = 0;
  uncompressedSession = self->_uncompressedSession;
  id v11 = 0;
  BOOL v7 = [(GTFileWriterSessionUncompressed *)uncompressedSession finish:&v11];
  id v8 = v11;
  uint64_t v9 = v8;
  if (v5 && !v7)
  {
    LOBYTE(v5) = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v5;
}

- (BOOL)_finalizeCompressedFileData:(id *)a3
{
  decompressorOutput = self->_decompressorOutput;
  size_t decompressorOutputSize = self->_decompressorOutputSize;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__GTFileWriterSessionCompressed__finalizeCompressedFileData___block_invoke;
  v7[3] = &unk_264E28C00;
  v7[4] = self;
  return FinalizeCompressionStream((compression_stream *)&self->_compressionStream, (uint8_t *)decompressorOutput, decompressorOutputSize, (uint64_t)a3, v7);
}

uint64_t __61__GTFileWriterSessionCompressed__finalizeCompressedFileData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) _writeUncompressedFileData:a2 length:a3 error:a4];
}

- (void).cxx_destruct
{
}

@end