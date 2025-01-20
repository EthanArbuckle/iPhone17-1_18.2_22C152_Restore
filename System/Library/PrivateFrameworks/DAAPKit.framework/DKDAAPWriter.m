@interface DKDAAPWriter
- (DKDAAPWriter)initWithStream:(id)a3;
- (NSError)error;
- (NSMutableArray)containerStack;
- (NSOutputStream)outputStream;
- (unint64_t)state;
- (void)_performWriteWithBuffer:(id)a3;
- (void)_writeDataToOutputStream:(id)a3;
- (void)close;
- (void)endContainerWithCode:(unsigned int)a3;
- (void)startContainerWithCode:(unsigned int)a3;
- (void)writeBytes:(char *)a3 ofLength:(unsigned int)a4 withCode:(unsigned int)a5;
- (void)writeCString:(const char *)a3 withCode:(unsigned int)a4;
- (void)writeContainerData:(id)a3;
- (void)writeData:(id)a3 withCode:(unsigned int)a4;
- (void)writeSInt16:(signed __int16)a3 withCode:(unsigned int)a4;
- (void)writeSInt32:(int)a3 withCode:(unsigned int)a4;
- (void)writeSInt64:(int64_t)a3 withCode:(unsigned int)a4;
- (void)writeSInt8:(char)a3 withCode:(unsigned int)a4;
- (void)writeString:(id)a3 withCode:(unsigned int)a4;
- (void)writeUInt16:(unsigned __int16)a3 withCode:(unsigned int)a4;
- (void)writeUInt32:(unsigned int)a3 withCode:(unsigned int)a4;
- (void)writeUInt64:(unint64_t)a3 withCode:(unsigned int)a4;
- (void)writeUInt8:(unsigned __int8)a3 withCode:(unsigned int)a4;
@end

@implementation DKDAAPWriter

- (void)close
{
  if (self->_state == 2)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"DKDAAPWriter.m" lineNumber:70 description:@"Cannot close a writer that has already been closed"];
  }
  while ([(NSMutableArray *)self->_containerStack count])
  {
    v5 = [(NSMutableArray *)self->_containerStack firstObject];
    -[DKDAAPWriter endContainerWithCode:](self, "endContainerWithCode:", [v5 code]);
  }
  v6 = [(DKDAAPWriter *)self outputStream];
  [v6 close];

  if (self->_state == 1) {
    self->_state = 2;
  }
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerStack, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (DKDAAPWriter)initWithStream:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DKDAAPWriter;
  v6 = [(DKDAAPWriter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputStream, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    containerStack = v7->_containerStack;
    v7->_containerStack = (NSMutableArray *)v8;

    v7->_state = 0;
  }

  return v7;
}

- (void)writeUInt32:(unsigned int)a3 withCode:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeUInt32_withCode___block_invoke;
  v4[3] = &__block_descriptor_40_e23_v16__0__NSMutableData_8l;
  unsigned int v5 = a4;
  unsigned int v6 = a3;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v4];
}

- (void)_performWriteWithBuffer:(id)a3
{
  containerStack = self->_containerStack;
  unsigned int v5 = (void (**)(id, id))a3;
  unsigned int v6 = [(NSMutableArray *)containerStack firstObject];
  v7 = [v6 childData];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF990] data];
  }
  id v12 = v9;

  v5[2](v5, v12);
  v10 = [(NSMutableArray *)self->_containerStack firstObject];
  id v11 = [v10 childData];

  if (v12 != v11) {
    [(DKDAAPWriter *)self _writeDataToOutputStream:v12];
  }
}

void __37__DKDAAPWriter_writeUInt32_withCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x4000000;
  id v3 = a2;
  [v3 appendBytes:v5 length:8];
  unsigned int v4 = bswap32(*(_DWORD *)(a1 + 36));
  [v3 appendBytes:&v4 length:4];
}

- (void)_writeDataToOutputStream:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t state = self->_state;
  if (state)
  {
    if (state != 1)
    {
      v18 = [MEMORY[0x263F08690] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"DKDAAPWriter.m" lineNumber:230 description:@"Attempting to write to an output stream that is not open."];
    }
  }
  else
  {
    [(NSOutputStream *)self->_outputStream open];
    self->_unint64_t state = 1;
  }
  while (1)
  {
    outputStream = self->_outputStream;
    id v8 = v5;
    unint64_t v9 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", [v8 bytes], objc_msgSend(v8, "length"));
    if (v9 == [v8 length]) {
      break;
    }
    if (!v9)
    {
      v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F07F80];
      v20[0] = @"Encountered EOF while writing to output stream.";
      id v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v12 = [v10 errorWithDomain:@"DKDAAPWriterErrorDomain" code:2 userInfo:v11];
      error = self->_error;
      self->_error = v12;

      self->_unint64_t state = 3;
      break;
    }
    if (v9 == -1)
    {
      v14 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"Failed to write to output stream." forKey:*MEMORY[0x263F07F80]];
      v15 = [(NSOutputStream *)self->_outputStream streamError];
      if (v15) {
        [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08608]];
      }
      v16 = [MEMORY[0x263F087E8] errorWithDomain:@"DKDAAPWriterErrorDomain" code:1 userInfo:v14];
      v17 = self->_error;
      self->_error = v16;

      self->_unint64_t state = 3;
      break;
    }
    if (v9 < [v8 length])
    {
      objc_msgSend(v8, "subdataWithRange:", v9, objc_msgSend(v8, "length") - v9);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
}

- (NSMutableArray)containerStack
{
  return self->_containerStack;
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)writeContainerData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__DKDAAPWriter_writeContainerData___block_invoke;
  v6[3] = &unk_2642231A8;
  id v7 = v4;
  id v5 = v4;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v6];
}

uint64_t __35__DKDAAPWriter_writeContainerData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appendData:*(void *)(a1 + 32)];
}

- (void)writeBytes:(char *)a3 ofLength:(unsigned int)a4 withCode:(unsigned int)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __45__DKDAAPWriter_writeBytes_ofLength_withCode___block_invoke;
  v5[3] = &__block_descriptor_48_e23_v16__0__NSMutableData_8l;
  unsigned int v6 = a5;
  unsigned int v7 = a4;
  v5[4] = a3;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v5];
}

void __45__DKDAAPWriter_writeBytes_ofLength_withCode___block_invoke(int8x8_t *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int8x8_t v4 = vrev32_s8(a1[5]);
  id v3 = a2;
  [v3 appendBytes:&v4 length:8];
  objc_msgSend(v3, "appendBytes:length:", *(void *)&a1[4], a1[5].u32[1], *(void *)&v4, v5);
}

- (void)writeCString:(const char *)a3 withCode:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__DKDAAPWriter_writeCString_withCode___block_invoke;
  v4[3] = &__block_descriptor_44_e23_v16__0__NSMutableData_8l;
  void v4[4] = a3;
  unsigned int v5 = a4;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v4];
}

void __38__DKDAAPWriter_writeCString_withCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  size_t v4 = strlen(*(const char **)(a1 + 32));
  v6[0] = bswap32(*(_DWORD *)(a1 + 40));
  v6[1] = bswap32(v4);
  id v5 = a2;
  [v5 appendBytes:v6 length:8];
  [v5 appendBytes:*(void *)(a1 + 32) length:v4];
}

- (void)writeString:(id)a3 withCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  if (![(NSMutableArray *)self->_containerStack count])
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"DKDAAPWriter.m" lineNumber:185 description:@"Cannot write data (currently not in any container)"];
  }
  id v9 = v7;
  -[DKDAAPWriter writeCString:withCode:](self, "writeCString:withCode:", [v9 cStringUsingEncoding:4], v4);
}

- (void)writeSInt64:(int64_t)a3 withCode:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeSInt64_withCode___block_invoke;
  v4[3] = &__block_descriptor_44_e23_v16__0__NSMutableData_8l;
  unsigned int v5 = a4;
  void v4[4] = a3;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v4];
}

void __37__DKDAAPWriter_writeSInt64_withCode___block_invoke(unsigned int *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v6[0] = bswap32(a1[10]);
  v6[1] = 0x8000000;
  id v3 = a2;
  [v3 appendBytes:v6 length:8];
  unsigned int v4 = bswap32(a1[8]);
  v5[0] = bswap32(a1[9]);
  v5[1] = v4;
  [v3 appendBytes:v5 length:8];
}

- (void)writeUInt64:(unint64_t)a3 withCode:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeUInt64_withCode___block_invoke;
  v4[3] = &__block_descriptor_44_e23_v16__0__NSMutableData_8l;
  unsigned int v5 = a4;
  void v4[4] = a3;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v4];
}

void __37__DKDAAPWriter_writeUInt64_withCode___block_invoke(unsigned int *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v6[0] = bswap32(a1[10]);
  v6[1] = 0x8000000;
  id v3 = a2;
  [v3 appendBytes:v6 length:8];
  unsigned int v4 = bswap32(a1[8]);
  v5[0] = bswap32(a1[9]);
  v5[1] = v4;
  [v3 appendBytes:v5 length:8];
}

- (void)writeSInt32:(int)a3 withCode:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeSInt32_withCode___block_invoke;
  v4[3] = &__block_descriptor_40_e23_v16__0__NSMutableData_8l;
  unsigned int v5 = a4;
  int v6 = a3;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v4];
}

void __37__DKDAAPWriter_writeSInt32_withCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x4000000;
  id v3 = a2;
  [v3 appendBytes:v5 length:8];
  unsigned int v4 = bswap32(*(_DWORD *)(a1 + 36));
  [v3 appendBytes:&v4 length:4];
}

- (void)writeSInt16:(signed __int16)a3 withCode:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeSInt16_withCode___block_invoke;
  v4[3] = &__block_descriptor_38_e23_v16__0__NSMutableData_8l;
  unsigned int v5 = a4;
  signed __int16 v6 = a3;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v4];
}

void __37__DKDAAPWriter_writeSInt16_withCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x2000000;
  id v3 = a2;
  [v3 appendBytes:v5 length:8];
  __int16 v4 = bswap32(*(unsigned __int16 *)(a1 + 36)) >> 16;
  [v3 appendBytes:&v4 length:2];
}

- (void)writeUInt16:(unsigned __int16)a3 withCode:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeUInt16_withCode___block_invoke;
  v4[3] = &__block_descriptor_38_e23_v16__0__NSMutableData_8l;
  unsigned int v5 = a4;
  unsigned __int16 v6 = a3;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v4];
}

void __37__DKDAAPWriter_writeUInt16_withCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x2000000;
  id v3 = a2;
  [v3 appendBytes:v5 length:8];
  __int16 v4 = bswap32(*(unsigned __int16 *)(a1 + 36)) >> 16;
  [v3 appendBytes:&v4 length:2];
}

- (void)writeSInt8:(char)a3 withCode:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__DKDAAPWriter_writeSInt8_withCode___block_invoke;
  v4[3] = &__block_descriptor_37_e23_v16__0__NSMutableData_8l;
  unsigned int v5 = a4;
  char v6 = a3;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v4];
}

void __36__DKDAAPWriter_writeSInt8_withCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x1000000;
  id v3 = a2;
  [v3 appendBytes:v5 length:8];
  char v4 = *(unsigned char *)(a1 + 36);
  [v3 appendBytes:&v4 length:1];
}

- (void)writeUInt8:(unsigned __int8)a3 withCode:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__DKDAAPWriter_writeUInt8_withCode___block_invoke;
  v4[3] = &__block_descriptor_37_e23_v16__0__NSMutableData_8l;
  unsigned int v5 = a4;
  unsigned __int8 v6 = a3;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v4];
}

void __36__DKDAAPWriter_writeUInt8_withCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x1000000;
  id v3 = a2;
  [v3 appendBytes:v5 length:8];
  char v4 = *(unsigned char *)(a1 + 36);
  [v3 appendBytes:&v4 length:1];
}

- (void)writeData:(id)a3 withCode:(unsigned int)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__DKDAAPWriter_writeData_withCode___block_invoke;
  v8[3] = &unk_2642230E0;
  unsigned int v10 = a4;
  id v9 = v6;
  id v7 = v6;
  [(DKDAAPWriter *)self _performWriteWithBuffer:v8];
}

void __35__DKDAAPWriter_writeData_withCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  LODWORD(v5) = bswap32(*(_DWORD *)(a1 + 40));
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  HIDWORD(v5) = bswap32(objc_msgSend(v3, "length", v5, v6));
  [v4 appendBytes:&v5 length:8];
  [v4 appendData:*(void *)(a1 + 32)];
}

- (void)endContainerWithCode:(unsigned int)a3
{
  if (![(NSMutableArray *)self->_containerStack count])
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"DKDAAPWriter.m" lineNumber:87 description:@"Cannot end a container (currently not in any container)"];
  }
  id v10 = [(NSMutableArray *)self->_containerStack firstObject];
  if ([v10 code] == a3)
  {
    [(NSMutableArray *)self->_containerStack removeObjectAtIndex:0];
    if ([(NSMutableArray *)self->_containerStack count])
    {
      uint64_t v6 = [v10 code];
      id v7 = [v10 childData];
      [(DKDAAPWriter *)self writeData:v7 withCode:v6];
    }
    else
    {
      id v8 = [v10 formattedOutputData];
      [(DKDAAPWriter *)self _writeDataToOutputStream:v8];
    }
  }
  else
  {
    NSLog(&cfstr_CannotEndACont_0.isa, [v10 code]);
  }
}

- (void)startContainerWithCode:(unsigned int)a3
{
  containerStack = self->_containerStack;
  id v4 = [[DKDAAPWriterContainer alloc] initWithCode:*(void *)&a3];
  [(NSMutableArray *)containerStack insertObject:v4 atIndex:0];
}

@end