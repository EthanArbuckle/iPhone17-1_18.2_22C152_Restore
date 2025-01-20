@interface AVMutableTimedMetadataGroup
- (AVMutableTimedMetadataGroup)initWithItems:(id)a3 timeRange:(id *)a4;
- (CMTimeRange)timeRange;
- (NSArray)items;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setItems:(NSArray *)items;
- (void)setTimeRange:(CMTimeRange *)timeRange;
@end

@implementation AVMutableTimedMetadataGroup

- (AVMutableTimedMetadataGroup)initWithItems:(id)a3 timeRange:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVMutableTimedMetadataGroup;
  long long v4 = *(_OWORD *)&a4->var0.var3;
  v8[0] = *(_OWORD *)&a4->var0.var0;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a4->var1.var1;
  v5 = [(AVTimedMetadataGroup *)&v9 initWithItems:a3 timeRange:v8];
  v6 = v5;
  if (v5) {
    v5->_mutablePriv = [(AVTimedMetadataGroup *)v5 _timedMetadataGroupInternal];
  }
  return v6;
}

- (CMTimeRange)timeRange
{
  epoch = (_OWORD *)self->start.epoch;
  long long v4 = epoch[2];
  *(_OWORD *)&retstr->start.value = epoch[1];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = epoch[3];
  return self;
}

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  mutablePriv = self->_mutablePriv;
  long long v5 = *(_OWORD *)&timeRange->start.epoch;
  long long v4 = *(_OWORD *)&timeRange->duration.timescale;
  *(_OWORD *)&mutablePriv->timeRange.start.value = *(_OWORD *)&timeRange->start.value;
  *(_OWORD *)&mutablePriv->timeRange.start.epoch = v5;
  *(_OWORD *)&mutablePriv->timeRange.duration.timescale = v4;
}

- (NSArray)items
{
  return self->_mutablePriv->items;
}

- (void)setItems:(NSArray *)items
{
  if (items) {
    v3 = items;
  }
  else {
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  long long v4 = self->_mutablePriv->items;
  if (v4 != v3)
  {

    self->_mutablePriv->items = (NSArray *)[(NSArray *)v3 copy];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v4 = [AVTimedMetadataGroup alloc];
  long long v5 = [(AVMutableTimedMetadataGroup *)self items];
  if (self) {
    [(AVMutableTimedMetadataGroup *)self timeRange];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  return [(AVTimedMetadataGroup *)v4 initWithItems:v5 timeRange:v7];
}

@end