@interface MOVStreamSampleTimeBuffer
- (BOOL)isEmpty;
- (MOVStreamSampleTimeBuffer)init;
- (MOVStreamSampleTimeBuffer)initWithCapacity:(unint64_t)a3;
- (NSString)name;
- (id).cxx_construct;
- (id)description;
- (id)timeline;
- (void)appendTime:(id *)a3;
- (void)setName:(id)a3;
@end

@implementation MOVStreamSampleTimeBuffer

- (MOVStreamSampleTimeBuffer)initWithCapacity:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MOVStreamSampleTimeBuffer;
  v4 = [(MOVStreamSampleTimeBuffer *)&v7 init];
  v5 = v4;
  if (v4) {
    std::vector<CMTime>::reserve((void **)&v4->_times.__begin_, 100 * (a3 / 0x64) + 100);
  }
  return v5;
}

- (MOVStreamSampleTimeBuffer)init
{
  return [(MOVStreamSampleTimeBuffer *)self initWithCapacity:100];
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:4];
  begin = self->_times.__begin_;
  end = self->_times.__end_;
  if (begin == end)
  {
    v9 = self->_times.__begin_;
  }
  else
  {
    unint64_t v6 = 1;
    do
    {
      if (v6 != 1)
      {
        [v3 appendString:@", "];
        if (v6 > 4) {
          break;
        }
      }
      CMTimeEpoch v7 = *((void *)begin + 2);
      *(_OWORD *)&time.value = *(_OWORD *)begin;
      time.epoch = v7;
      v8 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
      [v3 appendFormat:@"%@", v8];

      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
      ++v6;
    }
    while (begin != end);
    begin = self->_times.__begin_;
    v9 = self->_times.__end_;
  }
  v10 = [(MOVStreamSampleTimeBuffer *)self name];
  if ([v10 length])
  {
    v11 = NSString;
    v12 = [(MOVStreamSampleTimeBuffer *)self name];
    [v11 stringWithFormat:@" name=%@", v12];
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_26CB6A778;
  }

  v14 = (void *)MEMORY[0x263F089D8];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((v9 - begin) >> 3);
  v18 = [NSNumber numberWithUnsignedLong:v17];
  v19 = (void *)[v3 copy];
  v20 = [v14 stringWithFormat:@"<%@: %p%@ sampleCount=%@ samples=[%@", v16, self, v13, v18, v19];

  if (v17 < 5)
  {
    [v20 appendString:@"]>"];
  }
  else
  {
    v21 = [NSNumber numberWithUnsignedLong:v17 - 4];
    [v20 appendFormat:@"... and %@ more]>", v21];
  }
  v22 = (void *)[v20 copy];

  return v22;
}

- (void)appendTime:(id *)a3
{
  value = self->_times.__end_cap_.__value_;
  p_end_cap = &self->_times.__end_cap_;
  unint64_t v6 = value;
  v8 = p_end_cap[-1].__value_;
  if (v8 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    v12 = p_end_cap[-2].__value_;
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v12) >> 3);
    unint64_t v14 = v13 + 1;
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v6 - v12) >> 3);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x555555555555555) {
      unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTime>>((uint64_t)p_end_cap, v16);
    }
    else {
      unint64_t v17 = 0;
    }
    v18 = &v17[24 * v13];
    v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v17[24 * v16];
    long long v20 = *(_OWORD *)&a3->var0;
    *((void *)v18 + 2) = a3->var3;
    *(_OWORD *)v18 = v20;
    v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v18 + 24);
    begin = self->_times.__begin_;
    end = self->_times.__end_;
    if (end != begin)
    {
      do
      {
        long long v23 = *(_OWORD *)((char *)end - 24);
        *((void *)v18 - 1) = *((void *)end - 1);
        *(_OWORD *)(v18 - 24) = v23;
        v18 -= 24;
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 24);
      }
      while (end != begin);
      end = *p_value;
    }
    self->_times.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v18;
    self->_times.__end_ = v10;
    self->_times.__end_cap_.__value_ = v19;
    if (end) {
      operator delete(end);
    }
  }
  else
  {
    long long v9 = *(_OWORD *)&a3->var0;
    *((void *)v8 + 2) = a3->var3;
    *(_OWORD *)v8 = v9;
    v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v8 + 24);
  }
  self->_times.__end_ = v10;
}

- (id)timeline
{
  v2 = [[MOVStreamSampleTimeList alloc] initWithTimes:&self->_times];

  return v2;
}

- (BOOL)isEmpty
{
  return self->_times.__begin_ == self->_times.__end_;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  begin = self->_times.__begin_;
  if (begin)
  {
    self->_times.__end_ = begin;
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