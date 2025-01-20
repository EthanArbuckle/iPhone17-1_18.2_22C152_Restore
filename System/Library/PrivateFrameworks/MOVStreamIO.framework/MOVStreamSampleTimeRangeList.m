@interface MOVStreamSampleTimeRangeList
- ($69C59A32909E13F94AB58097350E6BB9)timeRange;
- ($69C59A32909E13F94AB58097350E6BB9)timeRangeAtIndex:(SEL)a3;
- (BOOL)containsTimeRange:(id *)a3;
- (MOVStreamSampleTimeRangeList)init;
- (MOVStreamSampleTimeRangeList)initWithTimeRange:(id *)a3;
- (MOVStreamSampleTimeRangeList)initWithTimeRanges:(const void *)a3;
- (NSArray)cached_ranges;
- (NSString)name;
- (id).cxx_construct;
- (int64_t)indexOfTimeRangeAtTime:(id *)a3;
- (void)setName:(id)a3;
@end

@implementation MOVStreamSampleTimeRangeList

- (MOVStreamSampleTimeRangeList)initWithTimeRanges:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MOVStreamSampleTimeRangeList;
  v4 = [(MOVStreamSampleTimeRangeList *)&v8 init];
  p_ranges = (char *)&v4->_ranges;
  if (v4) {
    BOOL v6 = p_ranges == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    std::vector<CMTimeRange>::__assign_with_size[abi:ne180100]<CMTimeRange*,CMTimeRange*>(p_ranges, *(char **)a3, *((void *)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4));
  }
  return v4;
}

- (MOVStreamSampleTimeRangeList)initWithTimeRange:(id *)a3
{
  v5 = operator new(0x30uLL);
  v10 = v5 + 3;
  v11 = v5 + 3;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  _OWORD *v5 = *(_OWORD *)&a3->var0.var0;
  v5[1] = v6;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  __p = v5;
  v7 = [(MOVStreamSampleTimeRangeList *)self initWithTimeRanges:&__p];
  if (__p)
  {
    v10 = __p;
    operator delete(__p);
  }
  return v7;
}

- (MOVStreamSampleTimeRangeList)init
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v7 = 138543362;
    objc_super v8 = v5;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_ERROR, "❌ ERROR: Do not call -[%{public}@ init].", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (BOOL)containsTimeRange:(id *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  CMTimeValue v30 = *MEMORY[0x263F010C8];
  CMTimeFlags v4 = *(_DWORD *)(MEMORY[0x263F010C8] + 12);
  CMTimeScale v31 = *(_DWORD *)(MEMORY[0x263F010C8] + 8);
  CMTimeEpoch v5 = *(void *)(MEMORY[0x263F010C8] + 16);
  CMTimeValue v6 = *(void *)(MEMORY[0x263F010C8] + 24);
  CMTimeScale v7 = *(_DWORD *)(MEMORY[0x263F010C8] + 32);
  CMTimeFlags v8 = *(_DWORD *)(MEMORY[0x263F010C8] + 36);
  uint64_t v9 = *(void *)(MEMORY[0x263F010C8] + 40);
  begin = self->_ranges.__begin_;
  uint64_t v11 = self->_ranges.__end_ - begin;
  if (v11)
  {
    uint64_t v21 = *(void *)(MEMORY[0x263F010C8] + 40);
    CMTimeScale v22 = *(_DWORD *)(MEMORY[0x263F010C8] + 32);
    CMTimeValue v23 = *(void *)(MEMORY[0x263F010C8] + 24);
    CMTimeEpoch v24 = *(void *)(MEMORY[0x263F010C8] + 16);
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (v11 >> 4);
    do
    {
      v14 = (_OWORD *)((char *)begin + 48 * (v13 >> 1));
      long long v15 = *v14;
      long long v16 = v14[2];
      *(_OWORD *)&range.start.epoch = v14[1];
      *(_OWORD *)&range.duration.timescale = v16;
      *(_OWORD *)&range.start.value = v15;
      CMTimeRangeGetEnd(&time1, &range);
      CMTime time2 = (CMTime)a3->var0;
      int32_t v17 = CMTimeCompare(&time1, &time2);
      if (v17 < 0) {
        v13 += ~(v13 >> 1);
      }
      else {
        v13 >>= 1;
      }
      if (v17 < 0) {
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v14 + 3);
      }
    }
    while (v13);
    CMTimeValue v6 = v23;
    CMTimeEpoch v5 = v24;
    CMTimeScale v7 = v22;
    uint64_t v9 = v21;
    if (begin != self->_ranges.__end_)
    {
      CMTimeValue v18 = *(void *)begin;
      CMTimeFlags v4 = *((_DWORD *)begin + 3);
      CMTimeScale v31 = *((_DWORD *)begin + 2);
      CMTimeValue v30 = v18;
      CMTimeEpoch v5 = *((void *)begin + 2);
      CMTimeValue v6 = *((void *)begin + 3);
      CMTimeScale v7 = *((_DWORD *)begin + 8);
      CMTimeFlags v8 = *((_DWORD *)begin + 9);
      uint64_t v9 = *((void *)begin + 5);
    }
  }
  BOOL result = 0;
  if ((v4 & 1) != 0 && (v8 & 1) != 0 && !v9 && (v6 & 0x8000000000000000) == 0)
  {
    v26.start.value = v30;
    v26.start.timescale = v31;
    v26.start.flags = v4;
    v26.start.epoch = v5;
    v26.duration.value = v6;
    v26.duration.timescale = v7;
    v26.duration.flags = v8;
    v26.duration.epoch = 0;
    long long v20 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&otherRange.start.epoch = v20;
    *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
    return CMTimeRangeContainsTimeRange(&v26, &otherRange) != 0;
  }
  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRange
{
  uint64_t v4 = MEMORY[0x263F010C8];
  long long v5 = *(_OWORD *)(MEMORY[0x263F010C8] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x263F010C8];
  *(_OWORD *)&retstr->var0.int64_t var3 = v5;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v4 + 32);
  CMTimeScale v7 = *(long long **)&self->var0.var1;
  int64_t var3 = self->var0.var3;
  if ((long long *)var3 != v7)
  {
    long long v8 = *v7;
    long long v9 = v7[2];
    *(_OWORD *)&range.start.epoch = v7[1];
    *(_OWORD *)&range.duration.timescale = v9;
    *(_OWORD *)&range.start.value = v8;
    long long v10 = *(_OWORD *)(var3 - 48);
    long long v11 = *(_OWORD *)(var3 - 16);
    *(_OWORD *)&v13.start.epoch = *(_OWORD *)(var3 - 32);
    *(_OWORD *)&v13.duration.timescale = v11;
    *(_OWORD *)&v13.start.value = v10;
    self = ($69C59A32909E13F94AB58097350E6BB9 *)CMTimeRangeGetUnion(&v15, &range, &v13);
    long long v12 = *(_OWORD *)&v15.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v15.start.value;
    *(_OWORD *)&retstr->var0.int64_t var3 = v12;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v15.duration.timescale;
  }
  return self;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeAtIndex:(SEL)a3
{
  uint64_t v4 = *(void *)&self->var0.var1;
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((self->var0.var3 - v4) >> 4);
  CMTimeValue v6 = (_OWORD *)(v4 + 48 * a4);
  if (v5 <= a4) {
    CMTimeScale v7 = (_OWORD *)MEMORY[0x263F010C8];
  }
  else {
    CMTimeScale v7 = v6;
  }
  long long v8 = v7[1];
  *(_OWORD *)&retstr->var0.var0 = *v7;
  *(_OWORD *)&retstr->var0.int64_t var3 = v8;
  *(_OWORD *)&retstr->var1.var1 = v7[2];
  return self;
}

- (int64_t)indexOfTimeRangeAtTime:(id *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  memset(&v27, 0, sizeof(v27));
  CMTime start = *(CMTime *)a3;
  CMTimeMake(&duration, 1, 0x7FFFFFFF);
  CMTimeRangeMake(&v27, &start, &duration);
  CMTimeValue v31 = *MEMORY[0x263F010C8];
  CMTimeFlags v5 = *(_DWORD *)(MEMORY[0x263F010C8] + 12);
  CMTimeScale v32 = *(_DWORD *)(MEMORY[0x263F010C8] + 8);
  CMTimeEpoch v6 = *(void *)(MEMORY[0x263F010C8] + 16);
  CMTimeValue v7 = *(void *)(MEMORY[0x263F010C8] + 24);
  CMTimeScale v8 = *(_DWORD *)(MEMORY[0x263F010C8] + 32);
  CMTimeFlags v9 = *(_DWORD *)(MEMORY[0x263F010C8] + 36);
  uint64_t v10 = *(void *)(MEMORY[0x263F010C8] + 40);
  begin = self->_ranges.__begin_;
  end = self->_ranges.__end_;
  if (end != begin)
  {
    uint64_t v19 = *(void *)(MEMORY[0x263F010C8] + 40);
    CMTimeScale v20 = *(_DWORD *)(MEMORY[0x263F010C8] + 32);
    CMTimeValue v21 = *(void *)(MEMORY[0x263F010C8] + 24);
    CMTimeEpoch v22 = *(void *)(MEMORY[0x263F010C8] + 16);
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 4);
    do
    {
      v14 = (_OWORD *)((char *)begin + 48 * (v13 >> 1));
      long long v15 = *v14;
      long long v16 = v14[2];
      *(_OWORD *)&range.start.epoch = v14[1];
      *(_OWORD *)&range.duration.timescale = v16;
      *(_OWORD *)&range.start.value = v15;
      CMTimeRangeGetEnd(&time1, &range);
      CMTime time2 = v27.start;
      int32_t v17 = CMTimeCompare(&time1, &time2);
      if (v17 < 0) {
        v13 += ~(v13 >> 1);
      }
      else {
        v13 >>= 1;
      }
      if (v17 < 0) {
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v14 + 3);
      }
    }
    while (v13);
    end = begin;
    begin = self->_ranges.__end_;
    CMTimeValue v7 = v21;
    CMTimeEpoch v6 = v22;
    CMTimeScale v8 = v20;
    uint64_t v10 = v19;
  }
  if (begin != end)
  {
    CMTimeValue v31 = *(void *)end;
    CMTimeFlags v5 = *((_DWORD *)end + 3);
    CMTimeScale v32 = *((_DWORD *)end + 2);
    CMTimeEpoch v6 = *((void *)end + 2);
    CMTimeValue v7 = *((void *)end + 3);
    CMTimeScale v8 = *((_DWORD *)end + 8);
    CMTimeFlags v9 = *((_DWORD *)end + 9);
    uint64_t v10 = *((void *)end + 5);
  }
  if ((v5 & 1) == 0) {
    return -1;
  }
  int64_t result = -1;
  if ((v9 & 1) != 0 && !v10 && (v7 & 0x8000000000000000) == 0)
  {
    v24.start.value = v31;
    v24.start.timescale = v32;
    v24.start.flags = v5;
    v24.start.epoch = v6;
    v24.duration.value = v7;
    v24.duration.timescale = v8;
    v24.duration.flags = v9;
    v24.duration.epoch = 0;
    CMTime time = (CMTime)*a3;
    if (!CMTimeRangeContainsTime(&v24, &time)) {
      return -1;
    }
    return 0xAAAAAAAAAAAAAAABLL * ((end - self->_ranges.__begin_) >> 4);
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)cached_ranges
{
  return self->_cached_ranges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cached_ranges, 0);
  objc_storeStrong((id *)&self->_name, 0);
  begin = self->_ranges.__begin_;
  if (begin)
  {
    self->_ranges.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end