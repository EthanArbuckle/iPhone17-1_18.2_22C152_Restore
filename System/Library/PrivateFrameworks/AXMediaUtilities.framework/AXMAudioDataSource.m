@interface AXMAudioDataSource
- (AXMAudioDataSource)init;
- (AXMAudioDataSource)initWithName:(id)a3 sampleRate:(double)a4 circular:(BOOL)a5;
- (BOOL)isCircular;
- (NSString)name;
- (double)level;
- (double)sampleRate;
- (id)description;
- (unint64_t)currentSampleIndex;
- (unint64_t)length;
- (void)dealloc;
- (void)normalizeAudio;
- (void)sampleBuffer;
- (void)setCircular:(BOOL)a3;
- (void)setCurrentSampleIndex:(unint64_t)a3;
- (void)setLength:(unint64_t)a3;
- (void)setLevel:(double)a3;
- (void)setName:(id)a3;
@end

@implementation AXMAudioDataSource

- (AXMAudioDataSource)init
{
  return [(AXMAudioDataSource *)self initWithName:0 sampleRate:1 circular:44100.0];
}

- (AXMAudioDataSource)initWithName:(id)a3 sampleRate:(double)a4 circular:(BOOL)a5
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXMAudioDataSource;
  v8 = [(AXMAudioDataSource *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v8->_sampleRate = a4;
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  sampleBuffer = (void **)self->_sampleBuffer;
  if (sampleBuffer)
  {
    v4 = *sampleBuffer;
    if (*sampleBuffer)
    {
      sampleBuffer[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1BA9A0B70](sampleBuffer, 0x10C402FEFCB83);
  }
  v5.receiver = self;
  v5.super_class = (Class)AXMAudioDataSource;
  [(AXMAudioDataSource *)&v5 dealloc];
}

- (void)setCurrentSampleIndex:(unint64_t)a3
{
  if (![(AXMAudioDataSource *)self isCircular]) {
    goto LABEL_10;
  }
  unint64_t currentSampleIndex = self->_currentSampleIndex;
  if (currentSampleIndex <= a3)
  {
    if (currentSampleIndex >= a3) {
      goto LABEL_10;
    }
    v8 = (void *)(*(void *)[(AXMAudioDataSource *)self sampleBuffer] + 4 * self->_currentSampleIndex);
    uint64_t v9 = *(void *)[(AXMAudioDataSource *)self sampleBuffer] + 4 * a3 - (void)v8;
    if (v9 < 1) {
      goto LABEL_10;
    }
LABEL_9:
    bzero(v8, 4 * (((unint64_t)v9 >> 2) - ((unint64_t)v9 > 3)) + 4);
    goto LABEL_10;
  }
  v6 = (void *)(*(void *)[(AXMAudioDataSource *)self sampleBuffer] + 4 * self->_currentSampleIndex);
  uint64_t v7 = *(void *)([(AXMAudioDataSource *)self sampleBuffer] + 8) - (void)v6;
  if (v7 >= 1) {
    bzero(v6, 4 * (((unint64_t)v7 >> 2) - ((unint64_t)v7 > 3)) + 4);
  }
  v8 = *(void **)[(AXMAudioDataSource *)self sampleBuffer];
  uint64_t v9 = *(void *)[(AXMAudioDataSource *)self sampleBuffer] + 4 * a3 - (void)v8;
  if (v9 > 0) {
    goto LABEL_9;
  }
LABEL_10:
  self->_unint64_t currentSampleIndex = a3;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
  *((void *)self->_sampleBuffer + 1) = *(void *)self->_sampleBuffer;
  std::vector<int>::resize((std::vector<int> *)self->_sampleBuffer, a3);
}

- (void)setLevel:(double)a3
{
  self->_level = fmax(fmin(a3, 1.0), 0.0);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(AXMAudioDataSource *)self name];
  v6 = [v3 stringWithFormat:@"<%@ %p name=%@ circular=%d currentSample=%lu length=%lu>", v4, self, v5, -[AXMAudioDataSource isCircular](self, "isCircular"), -[AXMAudioDataSource currentSampleIndex](self, "currentSampleIndex"), -[AXMAudioDataSource length](self, "length")];

  return v6;
}

- (void)normalizeAudio
{
  v3 = [(AXMAudioDataSource *)self sampleBuffer];
  if ([(AXMAudioDataSource *)self length])
  {
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      if (*(_DWORD *)(*v3 + 4 * v4) > v5) {
        int v5 = *(_DWORD *)(*v3 + 4 * v4);
      }
      ++v4;
    }
    while (v4 < [(AXMAudioDataSource *)self length]);
    double v6 = (double)v5;
  }
  else
  {
    double v6 = 0.0;
  }
  if ([(AXMAudioDataSource *)self length])
  {
    unint64_t v7 = 0;
    double v8 = v6 / 32500.0;
    do
    {
      *(_DWORD *)(*v3 + 4 * v7) = (int)((double)*(int *)(*v3 + 4 * v7) / v8);
      ++v7;
    }
    while (v7 < [(AXMAudioDataSource *)self length]);
  }
}

- (void)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)currentSampleIndex
{
  return self->_currentSampleIndex;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (void)setCircular:(BOOL)a3
{
  self->_circular = a3;
}

- (double)level
{
  return self->_level;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void).cxx_destruct
{
}

@end