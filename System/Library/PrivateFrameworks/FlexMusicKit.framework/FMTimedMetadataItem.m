@interface FMTimedMetadataItem
- ($8FD227B00C0D8A9415DDD8F6F23225DE)timeRange;
- (FMTimedMetadataItem)initWithIdentifier:(id)a3 name:(id)a4 timeRange:(id *)a5 values:(id)a6;
- (NSDictionary)values;
- (NSString)identifier;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)adjustDurationTo:(id *)a3;
@end

@implementation FMTimedMetadataItem

- (FMTimedMetadataItem)initWithIdentifier:(id)a3 name:(id)a4 timeRange:(id *)a5 values:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)FMTimedMetadataItem;
  v14 = [(FMTimedMetadataItem *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_name, a4);
    long long v16 = *(_OWORD *)&a5->var0.var0;
    long long v17 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&v15->_timeRange.start.epoch = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&v15->_timeRange.duration.timescale = v17;
    *(_OWORD *)&v15->_timeRange.start.value = v16;
    objc_storeStrong((id *)&v15->_values, a6);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  uint64_t v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_identifier(self, v15, v16, v17, v18);
  v20 = *(void **)(v14 + 8);
  *(void *)(v14 + 8) = v19;

  uint64_t v25 = objc_msgSend_name(self, v21, v22, v23, v24);
  v26 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = v25;

  objc_msgSend_timeRange(self, v27, v28, v29, v30);
  long long v32 = v41;
  long long v31 = v42;
  *(_OWORD *)(v14 + 32) = v40;
  *(_OWORD *)(v14 + 48) = v32;
  *(_OWORD *)(v14 + 64) = v31;
  uint64_t v37 = objc_msgSend_values(self, v33, v34, v35, v36);
  v38 = *(void **)(v14 + 24);
  *(void *)(v14 + 24) = v37;

  return (id)v14;
}

- (void)adjustDurationTo:(id *)a3
{
  CMTime start = (CMTime)self->_timeRange.start;
  CMTime v5 = *(CMTime *)a3;
  CMTimeRangeMake(&v7, &start, &v5);
  long long v4 = *(_OWORD *)&v7.start.epoch;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&v7.start.value;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&v7.duration.timescale;
}

- (id)description
{
  v6 = NSString;
  CMTimeRange v7 = objc_msgSend_name(self, a2, v2, v3, v4);
  objc_msgSend_timeRange(self, v8, v9, v10, v11);
  CMTime time = v28;
  Float64 Seconds = CMTimeGetSeconds(&time);
  v21 = objc_msgSend_values(self, v13, v14, v15, v16);
  if (v21)
  {
    uint64_t v22 = objc_msgSend_values(self, v17, v18, v19, v20);
    v26 = objc_msgSend_stringWithFormat_(v6, v23, @"%@ (%1.2f) - %@", v24, v25, v7, *(void *)&Seconds, v22);
  }
  else
  {
    v26 = objc_msgSend_stringWithFormat_(v6, v17, @"%@ (%1.2f) - %@", v19, v20, v7, *(void *)&Seconds, &stru_26C7FED08);
  }

  return v26;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- ($8FD227B00C0D8A9415DDD8F6F23225DE)timeRange
{
  objc_copyStruct(retstr, &self->_timeRange, 48, 1, 0);
  return result;
}

- (NSDictionary)values
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end