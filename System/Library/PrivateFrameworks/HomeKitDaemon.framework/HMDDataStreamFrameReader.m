@interface HMDDataStreamFrameReader
+ (id)logCategory;
- (BOOL)hasCompleteFrame;
- (BOOL)hasFailed;
- (BOOL)hasPartialData;
- (HMDDataStreamFrameReader)init;
- (id)popRawFrame;
- (unint64_t)_getCurrentFrameSize;
- (unint64_t)bytesNeededForCurrentFrame;
- (void)_readFrameHeaderIfPossible;
- (void)pushFrameData:(id)a3;
- (void)reset;
@end

@implementation HMDDataStreamFrameReader

- (void).cxx_destruct
{
}

- (id)popRawFrame
{
  if ([(HMDDataStreamFrameReader *)self hasCompleteFrame])
  {
    size_t v3 = [(HMDDataStreamFrameReader *)self _getCurrentFrameSize];
    dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)self->_partialFrame, 0, v3);
    partialFrame = self->_partialFrame;
    size_t size = dispatch_data_get_size(partialFrame);
    size_t v7 = size - v3;
    if (size == v3)
    {
      [(HMDDataStreamFrameReader *)self reset];
    }
    else
    {
      dispatch_data_t v8 = dispatch_data_create_subrange(partialFrame, v3, v7);
      [(HMDDataStreamFrameReader *)self reset];
      [(HMDDataStreamFrameReader *)self pushFrameData:v8];
    }
  }
  else
  {
    dispatch_data_t subrange = 0;
  }
  return subrange;
}

- (void)reset
{
  partialFrame = self->_partialFrame;
  self->_partialFrame = 0;

  *(_WORD *)&self->_headerInfoRead = 0;
}

- (void)_readFrameHeaderIfPossible
{
  if (!self->_headerInfoRead)
  {
    p_currentframeType = &self->_currentframeType;
    p_payloadLength = &self->_payloadLength;
    BOOL v5 = +[HMDDataStreamMessageCoder readHeaderFromPartialData:self->_partialFrame frameType:&self->_currentframeType payloadLength:&self->_payloadLength];
    self->_headerInfoRead = v5;
    if (v5)
    {
      if (*p_payloadLength - 1048572 <= 0xFFFFFFFFFFEFFFFFLL)
      {
        partialFrame = self->_partialFrame;
        self->_partialFrame = 0;

        self->_streamFailed = 1;
      }
      if (*p_currentframeType - 1 >= 3)
      {
        size_t v7 = self->_partialFrame;
        self->_partialFrame = 0;

        self->_streamFailed = 1;
      }
    }
  }
}

- (void)pushFrameData:(id)a3
{
  data2 = a3;
  if (![(HMDDataStreamFrameReader *)self hasFailed])
  {
    partialFrame = self->_partialFrame;
    if (partialFrame) {
      concat = (OS_dispatch_data *)dispatch_data_create_concat(partialFrame, data2);
    }
    else {
      concat = data2;
    }
    v6 = self->_partialFrame;
    self->_partialFrame = concat;

    [(HMDDataStreamFrameReader *)self _readFrameHeaderIfPossible];
  }
}

- (unint64_t)bytesNeededForCurrentFrame
{
  if ([(HMDDataStreamFrameReader *)self hasFailed]) {
    return 0;
  }
  partialFrame = self->_partialFrame;
  if (!partialFrame) {
    return 4;
  }
  size_t size = dispatch_data_get_size(partialFrame);
  size_t v6 = size;
  if (!self->_headerInfoRead) {
    return 4 - size;
  }
  unint64_t v7 = [(HMDDataStreamFrameReader *)self _getCurrentFrameSize];
  if (v7 >= v6) {
    return v7 - v6;
  }
  else {
    return 0;
  }
}

- (unint64_t)_getCurrentFrameSize
{
  if (self->_currentframeType - 1 > 2) {
    return 0;
  }
  else {
    return self->_payloadLength + qword_2303E3DE0[(self->_currentframeType - 1)];
  }
}

- (BOOL)hasPartialData
{
  return self->_partialFrame
      && [(HMDDataStreamFrameReader *)self bytesNeededForCurrentFrame] != 0;
}

- (BOOL)hasCompleteFrame
{
  return ![(HMDDataStreamFrameReader *)self hasFailed]
      && [(HMDDataStreamFrameReader *)self bytesNeededForCurrentFrame] == 0;
}

- (BOOL)hasFailed
{
  return self->_streamFailed;
}

- (HMDDataStreamFrameReader)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDDataStreamFrameReader;
  result = [(HMDDataStreamFrameReader *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_headerInfoRead = 0;
    result->_payloadLength = 0;
    result->_currentframeType = 0;
  }
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_52180 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_52180, &__block_literal_global_52181);
  }
  v2 = (void *)logCategory__hmf_once_v1_52182;
  return v2;
}

void __39__HMDDataStreamFrameReader_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_52182;
  logCategory__hmf_once_v1_52182 = v0;
}

@end