@interface JFXARMetadataMediaReaderItem
- ($70930193D4F448A53BB9343C0237EB5F)timeRange;
- (JFXARMetadata)arMetadata;
- (JFXARMetadataMediaReaderItem)initWithARMetadata:(id)a3 timeRange:(id *)a4;
@end

@implementation JFXARMetadataMediaReaderItem

- (JFXARMetadataMediaReaderItem)initWithARMetadata:(id)a3 timeRange:(id *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)JFXARMetadataMediaReaderItem;
  v8 = [(JFXARMetadataMediaReaderItem *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_arMetadata, a3);
    long long v10 = *(_OWORD *)&a4->var0.var0;
    long long v11 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v9->_timeRange.start.epoch = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v9->_timeRange.duration.timescale = v11;
    *(_OWORD *)&v9->_timeRange.start.value = v10;
  }

  return v9;
}

- (JFXARMetadata)arMetadata
{
  return self->_arMetadata;
}

- ($70930193D4F448A53BB9343C0237EB5F)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var0;
  return self;
}

- (void).cxx_destruct
{
}

@end