@interface BRKAccelerationBufferedFileWriter
- (void)_lock_close;
- (void)_lock_writeX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6;
- (void)close;
- (void)writeX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6;
@end

@implementation BRKAccelerationBufferedFileWriter

- (void)writeX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__BRKAccelerationBufferedFileWriter_writeX_y_z_timestamp___block_invoke;
  v6[3] = &unk_264BF6F38;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  *(double *)&v6[6] = a4;
  *(double *)&v6[7] = a5;
  *(double *)&v6[8] = a6;
  [(BRKWriter *)self performWithLock:v6];
}

uint64_t __58__BRKAccelerationBufferedFileWriter_writeX_y_z_timestamp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_writeX:y:z:timestamp:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_lock_writeX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6
{
  v19[4] = *MEMORY[0x263EF8340];
  if (!self->_values)
  {
    v11 = [MEMORY[0x263EFF980] array];
    values = self->_values;
    self->_values = v11;
  }
  v18[0] = @"timestamp";
  v13 = [NSNumber numberWithDouble:a6];
  v19[0] = v13;
  v18[1] = @"x";
  v14 = [NSNumber numberWithDouble:a3];
  v19[1] = v14;
  v18[2] = @"y";
  v15 = [NSNumber numberWithDouble:a4];
  v19[2] = v15;
  v18[3] = @"z";
  v16 = [NSNumber numberWithDouble:a5];
  v19[3] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];

  [(NSMutableArray *)self->_values addObject:v17];
}

- (void)close
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__BRKAccelerationBufferedFileWriter_close__block_invoke;
  v2[3] = &unk_264BF6EF0;
  v2[4] = self;
  [(BRKWriter *)self performWithLock:v2];
}

uint64_t __42__BRKAccelerationBufferedFileWriter_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_close");
}

- (void)_lock_close
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (self->_values)
  {
    v3 = [BRKAccelerationFileWriter alloc];
    v4 = [(BRKWriter *)self path];
    v5 = [(BRKWriter *)v3 initWithPath:v4];

    [(BRKAccelerationFileWriter *)v5 openWithDataCount:[(NSMutableArray *)self->_values count]];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v24 = self;
    obj = self->_values;
    uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v11 = [v10 objectForKeyedSubscript:@"timestamp"];
          [v11 doubleValue];
          double v13 = v12;

          v14 = [v10 objectForKeyedSubscript:@"x"];
          [v14 doubleValue];
          double v16 = v15;

          v17 = [v10 objectForKeyedSubscript:@"y"];
          [v17 doubleValue];
          double v19 = v18;

          v20 = [v10 objectForKeyedSubscript:@"z"];
          [v20 doubleValue];
          double v22 = v21;

          [(BRKAccelerationFileWriter *)v5 writeX:v16 y:v19 z:v22 timestamp:v13];
        }
        uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v7);
    }

    [(BRKAccelerationFileWriter *)v5 close];
    values = v24->_values;
    v24->_values = 0;
  }
}

- (void).cxx_destruct
{
}

@end