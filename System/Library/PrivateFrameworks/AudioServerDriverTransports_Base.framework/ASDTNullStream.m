@interface ASDTNullStream
- (BOOL)changePhysicalFormat:(id)a3;
- (NSMutableData)streamBuffer;
- (char)ioBuffer;
- (id)updateClientPositionBlock;
- (unint64_t)clientPosition;
- (unsigned)ioBufferSize;
- (void)configureStreamBuffer;
- (void)setClientPosition:(unint64_t)a3;
- (void)setPhysicalFormat:(id)a3;
- (void)setStreamBuffer:(id)a3;
- (void)startStream;
- (void)stopStream;
@end

@implementation ASDTNullStream

- (char)ioBuffer
{
  id v2 = [(ASDTNullStream *)self streamBuffer];
  v3 = (char *)[v2 mutableBytes];

  return v3;
}

- (unsigned)ioBufferSize
{
  id v2 = [(ASDTNullStream *)self streamBuffer];
  unsigned int v3 = [v2 length];

  return v3;
}

- (id)updateClientPositionBlock
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__ASDTNullStream_updateClientPositionBlock__block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_v16__0Q8l;
  aBlock[4] = &self->_clientPosition;
  id v2 = _Block_copy(aBlock);
  return v2;
}

uint64_t __43__ASDTNullStream_updateClientPositionBlock__block_invoke(uint64_t result, uint64_t a2)
{
  **(void **)(result + 32) = a2;
  return result;
}

- (void)configureStreamBuffer
{
  [(ASDTNullStream *)self setStreamBuffer:0];
  id v10 = [(ASDStream *)self physicalFormat];
  [v10 sampleRate];
  if (v3 != 0.0)
  {
    v4 = [(ASDStream *)self physicalFormat];
    int v5 = [v4 bytesPerFrame];

    if (!v5) {
      return;
    }
    id v11 = [(ASDStream *)self physicalFormat];
    [v11 sampleRate];
    double v7 = v6;
    v8 = [(ASDStream *)self physicalFormat];
    uint64_t v9 = [v8 bytesPerFrame] * (v7 * 300.0 / 1000.0);

    id v10 = [MEMORY[0x263EFF990] dataWithLength:v9];
    -[ASDTNullStream setStreamBuffer:](self, "setStreamBuffer:");
  }
}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v4 = a3;
  int v5 = [(ASDStream *)self physicalFormat];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    double v7 = [(ASDTStream *)self device];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__ASDTNullStream_changePhysicalFormat___block_invoke;
    v9[3] = &unk_265243E00;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    [v7 requestConfigurationChange:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return 1;
}

void __39__ASDTNullStream_changePhysicalFormat___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPhysicalFormat:v2];

  id v13 = objc_loadWeakRetained(v3);
  id v4 = [v13 device];
  [v4 samplingRate];
  double v6 = v5;
  [*(id *)(a1 + 32) sampleRate];
  double v8 = v7;

  if (v6 != v8)
  {
    [*(id *)(a1 + 32) sampleRate];
    double v10 = v9;
    id v14 = objc_loadWeakRetained(v3);
    id v11 = [v14 device];
    [v11 setSamplingRate:v10];
  }
}

- (void)setPhysicalFormat:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ASDTNullStream;
  [(ASDTStream *)&v5 setPhysicalFormat:v4];
  [(ASDTNullStream *)self configureStreamBuffer];
}

- (void)startStream
{
  [(ASDTStream *)self clearBuffer];
  v3.receiver = self;
  v3.super_class = (Class)ASDTNullStream;
  [(ASDStream *)&v3 startStream];
  [(ASDStream *)self setIsActive:1];
}

- (void)stopStream
{
  [(ASDStream *)self setIsActive:0];
  v3.receiver = self;
  v3.super_class = (Class)ASDTNullStream;
  [(ASDStream *)&v3 stopStream];
}

- (NSMutableData)streamBuffer
{
  return self->_streamBuffer;
}

- (void)setStreamBuffer:(id)a3
{
}

- (unint64_t)clientPosition
{
  return self->_clientPosition;
}

- (void)setClientPosition:(unint64_t)a3
{
  self->_clientPosition = a3;
}

- (void).cxx_destruct
{
}

@end