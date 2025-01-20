@interface AUAudioUnitBus
- (AUAudioChannelCount)maximumChannelCount;
- (AUAudioUnit)ownerAudioUnit;
- (AUAudioUnitBus)initWithFormat:(AVAudioFormat *)format error:(NSError *)outError;
- (AUAudioUnitBusType)busType;
- (AVAudioFormat)format;
- (BOOL)isEnabled;
- (BOOL)setFormat:(AVAudioFormat *)format error:(NSError *)outError;
- (BOOL)shouldAllocateBuffer;
- (NSArray)supportedChannelCounts;
- (NSArray)supportedChannelLayoutTags;
- (NSString)name;
- (NSTimeInterval)contextPresentationLatency;
- (NSUInteger)index;
- (id).cxx_construct;
- (vector<BusPropertyObserver,)observers;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)dealloc;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5;
- (void)setBusType:(int64_t)a3;
- (void)setContextPresentationLatency:(NSTimeInterval)contextPresentationLatency;
- (void)setEnabled:(BOOL)enabled;
- (void)setIndex:(unint64_t)a3;
- (void)setMaximumChannelCount:(AUAudioChannelCount)maximumChannelCount;
- (void)setName:(NSString *)name;
- (void)setObservers:()vector<BusPropertyObserver;
- (void)setOwnerAudioUnit:(id)a3;
- (void)setShouldAllocateBuffer:(BOOL)shouldAllocateBuffer;
- (void)setSupportedChannelCounts:(NSArray *)supportedChannelCounts;
@end

@implementation AUAudioUnitBus

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_observers = &self->_observers;
  std::vector<BusPropertyObserver>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_observers);
  objc_storeStrong((id *)&self->_supportedChannelLayoutTags, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_supportedChannelCounts, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

- (void)setObservers:()vector<BusPropertyObserver
{
  p_observers = &self->_observers;
  if (p_observers != a3) {
    std::vector<BusPropertyObserver>::__assign_with_size[abi:ne180100]<BusPropertyObserver*,BusPropertyObserver*>((uint64_t)p_observers, (id *)a3->__begin_, (id *)a3->__end_, (a3->__end_ - a3->__begin_) >> 5);
  }
}

- (vector<BusPropertyObserver,)observers
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<BusPropertyObserver, std::allocator<BusPropertyObserver>> *)std::vector<BusPropertyObserver>::__init_with_size[abi:ne180100]<BusPropertyObserver*,BusPropertyObserver*>((id *)&retstr->__begin_, (id *)self->_observers.__begin_, (id *)self->_observers.__end_, (self->_observers.__end_- self->_observers.__begin_) >> 5);
}

- (void)setContextPresentationLatency:(NSTimeInterval)contextPresentationLatency
{
  self->_contextPresentationLatency = contextPresentationLatency;
}

- (NSTimeInterval)contextPresentationLatency
{
  return self->_contextPresentationLatency;
}

- (NSArray)supportedChannelLayoutTags
{
  return self->_supportedChannelLayoutTags;
}

- (AUAudioUnit)ownerAudioUnit
{
  return self->_ownerAudioUnit;
}

- (AUAudioUnitBusType)busType
{
  return self->_busType;
}

- (NSUInteger)index
{
  return self->_index;
}

- (void)setName:(NSString *)name
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setShouldAllocateBuffer:(BOOL)shouldAllocateBuffer
{
  self->_shouldAllocateBuffer = shouldAllocateBuffer;
}

- (BOOL)shouldAllocateBuffer
{
  return self->_shouldAllocateBuffer;
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  id v8 = a3;
  id v9 = a4;
  begin = self->_observers.__begin_;
  self->_removingObserverWithContext = 1;
  for (i = self->_observers.__end_; begin != i; i = self->_observers.__end_)
  {
    id WeakRetained = objc_loadWeakRetained((id *)begin);
    if (WeakRetained == v8 && [*((id *)begin + 1) isEqualToString:v9])
    {
      v13 = (void *)*((void *)begin + 3);

      if (v13 == a5)
      {
        v14 = (id *)std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<BusPropertyObserver *,BusPropertyObserver *,BusPropertyObserver *>((id *)begin + 4, (id *)self->_observers.__end_, (uint64_t)begin);
        std::vector<BusPropertyObserver>::__base_destruct_at_end[abi:ne180100]((uint64_t)&self->_observers, v14);
        v15.receiver = self;
        v15.super_class = (Class)AUAudioUnitBus;
        [(AUAudioUnitBus *)&v15 removeObserver:v8 forKeyPath:v9 context:a5];
        break;
      }
    }
    else
    {
    }
    begin = (BusPropertyObserver *)((char *)begin + 32);
  }
  self->_removingObserverWithContext = 0;
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_removingObserverWithContext)
  {
    v14.receiver = self;
    v14.super_class = (Class)AUAudioUnitBus;
    [(AUAudioUnitBus *)&v14 removeObserver:v6 forKeyPath:v7];
  }
  else
  {
    begin = self->_observers.__begin_;
    for (i = self->_observers.__end_; begin != i; i = self->_observers.__end_)
    {
      id WeakRetained = objc_loadWeakRetained((id *)begin);
      if (WeakRetained == v6)
      {
        int v11 = [*((id *)begin + 1) isEqualToString:v7];

        if (v11)
        {
          v12 = (id *)std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<BusPropertyObserver *,BusPropertyObserver *,BusPropertyObserver *>((id *)begin + 4, (id *)self->_observers.__end_, (uint64_t)begin);
          std::vector<BusPropertyObserver>::__base_destruct_at_end[abi:ne180100]((uint64_t)&self->_observers, v12);
          v13.receiver = self;
          v13.super_class = (Class)AUAudioUnitBus;
          [(AUAudioUnitBus *)&v13 removeObserver:v6 forKeyPath:v7];
          break;
        }
      }
      else
      {
      }
      begin = (BusPropertyObserver *)((char *)begin + 32);
    }
  }
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  objc_initWeak(&location, v10);
  id v12 = v11;
  id v17 = v12;
  *(void *)&long long v18 = a5;
  *((void *)&v18 + 1) = a6;
  end = self->_observers.__end_;
  if (end >= self->_observers.__end_cap_.__value_)
  {
    objc_super v14 = (BusPropertyObserver *)std::vector<BusPropertyObserver>::__push_back_slow_path<BusPropertyObserver const&>((unint64_t *)&self->_observers, (uint64_t)&location);
  }
  else
  {
    objc_copyWeak((id *)self->_observers.__end_, &location);
    *((void *)end + 1) = v17;
    *((_OWORD *)end + 1) = v18;
    objc_super v14 = (BusPropertyObserver *)((char *)end + 32);
  }
  self->_observers.__end_ = v14;
  v15.receiver = self;
  v15.super_class = (Class)AUAudioUnitBus;
  [(AUAudioUnitBus *)&v15 addObserver:v10 forKeyPath:v12 options:a5 context:a6];

  objc_destroyWeak(&location);
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    [(AUAudioUnitBus *)self willChangeValueForKey:@"enabled"];
    self->_enabled = enabled;
    [(AUAudioUnitBus *)self didChangeValueForKey:@"enabled"];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)setFormat:(AVAudioFormat *)format error:(NSError *)outError
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = format;
  if ([(AVAudioFormat *)v7 commonFormat] == AVAudioPCMFormatFloat32
    && (![(AVAudioFormat *)v7 isInterleaved] || [(AVAudioFormat *)v7 channelCount] <= 1)
    && [(AVAudioFormat *)v7 channelCount]
    && (!self->_maximumChannelCount || [(AVAudioFormat *)v7 channelCount] <= self->_maximumChannelCount))
  {
    supportedChannelCounts = self->_supportedChannelCounts;
    if (supportedChannelCounts)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = supportedChannelCounts;
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "unsignedIntegerValue", (void)v18);
            if (v15 == [(AVAudioFormat *)v7 channelCount])
            {

              goto LABEL_23;
            }
          }
          uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      if (!outError) {
        goto LABEL_10;
      }
LABEL_21:
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10868 userInfo:0];
      *outError = v16;

      goto LABEL_9;
    }
LABEL_23:
    if (self->_format != v7)
    {
      ownerAudioUnit = self->_ownerAudioUnit;
      if (ownerAudioUnit
        && ![(AUAudioUnit *)ownerAudioUnit shouldChangeToFormat:v7 forBus:self])
      {
        if (!outError) {
          goto LABEL_10;
        }
        goto LABEL_21;
      }
      [(AUAudioUnitBus *)self willChangeValueForKey:@"format"];
      objc_storeStrong((id *)&self->_format, format);
      [(AUAudioUnitBus *)self didChangeValueForKey:@"format"];
    }
    LOBYTE(outError) = 1;
    goto LABEL_10;
  }
  if (outError)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10868 userInfo:0];
    *outError = v8;

LABEL_9:
    LOBYTE(outError) = 0;
  }
LABEL_10:

  return (char)outError;
}

- (void)setMaximumChannelCount:(AUAudioChannelCount)maximumChannelCount
{
  if (self->_maximumChannelCount != maximumChannelCount)
  {
    [(AUAudioUnitBus *)self willChangeValueForKey:@"maximumChannelCount"];
    self->_maximumChannelCount = maximumChannelCount;
    [(AUAudioUnitBus *)self didChangeValueForKey:@"maximumChannelCount"];
  }
}

- (AUAudioChannelCount)maximumChannelCount
{
  return self->_maximumChannelCount;
}

- (NSArray)supportedChannelCounts
{
  return self->_supportedChannelCounts;
}

- (void)setSupportedChannelCounts:(NSArray *)supportedChannelCounts
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = supportedChannelCounts;
  if (self->_supportedChannelCounts != v5)
  {
    [(AUAudioUnitBus *)self willChangeValueForKey:@"supportedChannelCounts"];
    objc_storeStrong((id *)&self->_supportedChannelCounts, supportedChannelCounts);

    [(AUAudioUnitBus *)self didChangeValueForKey:@"supportedChannelCounts"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_supportedChannelCounts;
    uint64_t v7 = 0;
    uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (void)v13);
          if (v7 <= v11) {
            uint64_t v7 = v11;
          }
          else {
            uint64_t v7 = v7;
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(AUAudioUnitBus *)self setMaximumChannelCount:v7];
    if (![(AUAudioUnitBus *)self setFormat:self->_format error:0])
    {
      format = self->_format;
      self->_format = 0;
    }
  }
}

- (void)setOwnerAudioUnit:(id)a3
{
  self->_ownerAudioUnit = (AUAudioUnit *)a3;
}

- (void)setBusType:(int64_t)a3
{
  self->_busType = a3;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void)dealloc
{
  begin = self->_observers.__begin_;
  end = self->_observers.__end_;
  while (begin != end)
  {
    BusPropertyObserver::remove(begin, self);
    begin = (BusPropertyObserver *)((char *)begin + 32);
  }
  name = self->_name;
  self->_name = 0;

  format = self->_format;
  self->_format = 0;

  supportedChannelLayoutTags = self->_supportedChannelLayoutTags;
  self->_supportedChannelLayoutTags = 0;

  supportedChannelCounts = self->_supportedChannelCounts;
  self->_supportedChannelCounts = 0;

  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitBus;
  [(AUAudioUnitBus *)&v9 dealloc];
}

- (AUAudioUnitBus)initWithFormat:(AVAudioFormat *)format error:(NSError *)outError
{
  id v6 = format;
  v11.receiver = self;
  v11.super_class = (Class)AUAudioUnitBus;
  uint64_t v7 = [(AUAudioUnitBus *)&v11 init];
  uint64_t v8 = v7;
  if (v7
    && (v7->_maximumChannelCount = -1,
        v7->_shouldAllocateBuffer = 1,
        [(AUAudioUnitBus *)v7 setFormat:v6 error:outError]))
  {
    objc_super v9 = v8;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

@end