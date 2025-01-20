@interface AVCAudioPowerSpectrumChannel
+ (BOOL)supportsSecureCoding;
- (AVCAudioPowerSpectrumChannel)init;
- (AVCAudioPowerSpectrumChannel)initWithCoder:(id)a3;
- (NSArray)bins;
- (void)applyChannelBins:(_VCAudioPowerSpectrumEntry *)a3 binCount:(unsigned int)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVCAudioPowerSpectrumChannel

- (AVCAudioPowerSpectrumChannel)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)AVCAudioPowerSpectrumChannel;
  v2 = [(AVCAudioPowerSpectrumChannel *)&v4 init];
  if (v2) {
    v2->_bins = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCAudioPowerSpectrumChannel;
  [(AVCAudioPowerSpectrumChannel *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
}

- (AVCAudioPowerSpectrumChannel)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)AVCAudioPowerSpectrumChannel;
  uint64_t v4 = [(AVCAudioPowerSpectrumChannel *)&v6 init];
  if (v4) {
    v4->_bins = (NSMutableArray *)(id)[a3 decodeObjectForKey:@"bins"];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)bins
{
  return &self->_bins->super;
}

- (void)applyChannelBins:(_VCAudioPowerSpectrumEntry *)a3 binCount:(unsigned int)a4
{
  if (a4)
  {
    unint64_t v6 = 0;
    unint64_t v7 = a4;
    do
    {
      if ([(NSMutableArray *)self->_bins count] <= v6)
      {
        v8 = objc_alloc_init(AVCAudioPowerSpectrumBin);
        [(NSMutableArray *)self->_bins addObject:v8];
      }
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:", v6++), "assign:", a3++);
    }
    while (v7 != v6);
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ([(NSMutableArray *)self->_bins count] > v7)
  {
    unint64_t v9 = [(NSMutableArray *)self->_bins count] - v7;
    bins = self->_bins;
    -[NSMutableArray removeObjectsInRange:](bins, "removeObjectsInRange:", v7, v9);
  }
}

@end