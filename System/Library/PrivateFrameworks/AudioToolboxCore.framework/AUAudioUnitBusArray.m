@interface AUAudioUnitBusArray
- (AUAudioUnit)ownerAudioUnit;
- (AUAudioUnitBus)objectAtIndexedSubscript:(NSUInteger)index;
- (AUAudioUnitBusArray)init;
- (AUAudioUnitBusArray)initWithAudioUnit:(AUAudioUnit *)owner busType:(AUAudioUnitBusType)busType;
- (AUAudioUnitBusArray)initWithAudioUnit:(AUAudioUnit *)owner busType:(AUAudioUnitBusType)busType busses:(NSArray *)busArray;
- (AUAudioUnitBusType)busType;
- (BOOL)isCountChangeable;
- (BOOL)setBusCount:(NSUInteger)count error:(NSError *)outError;
- (NSUInteger)count;
- (id).cxx_construct;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (vector<BusPropertyObserver,)observers;
- (void)addObserverToAllBusses:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
- (void)dealloc;
- (void)indexBusses;
- (void)removeObserverFromAllBusses:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context;
- (void)replaceBusses:(NSArray *)busArray;
- (void)setObservers:()vector<BusPropertyObserver;
@end

@implementation AUAudioUnitBusArray

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_observers = &self->_observers;
  std::vector<BusPropertyObserver>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_observers);
  objc_storeStrong((id *)&self->_busses, 0);
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

- (AUAudioUnitBusType)busType
{
  return self->_busType;
}

- (AUAudioUnit)ownerAudioUnit
{
  return self->_ownerAudioUnit;
}

- (BOOL)isCountChangeable
{
  return self->_countChangeable;
}

- (void)replaceBusses:(NSArray *)busArray
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = busArray;
  NSUInteger v5 = [(AUAudioUnitBusArray *)self count];
  uint64_t v6 = [(NSArray *)v4 count];
  if (self->_busType == 1) {
    v7 = @"inputBusses";
  }
  else {
    v7 = @"outputBusses";
  }
  v22 = v7;
  if (v5 != v6) {
    [(AUAudioUnit *)self->_ownerAudioUnit willChangeValueForKey:v22];
  }
  begin = self->_observers.__begin_;
  end = self->_observers.__end_;
  while (begin != end)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v10 = self->_busses;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v28;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v10);
          }
          BusPropertyObserver::remove(begin, *(AUAudioUnitBus **)(*((void *)&v27 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    begin = (BusPropertyObserver *)((char *)begin + 32);
  }
  v14 = (NSMutableArray *)[(NSArray *)v4 mutableCopy];
  busses = self->_busses;
  self->_busses = v14;

  v16 = self->_observers.__begin_;
  v17 = self->_observers.__end_;
  while (v16 != v17)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v18 = self->_busses;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v24;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v18);
          }
          BusPropertyObserver::add(v16, *(AUAudioUnitBus **)(*((void *)&v23 + 1) + 8 * v21++));
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v19);
    }

    v16 = (BusPropertyObserver *)((char *)v16 + 32);
  }
  [(AUAudioUnitBusArray *)self indexBusses];
  if (v5 != v6) {
    [(AUAudioUnit *)self->_ownerAudioUnit didChangeValueForKey:v22];
  }
}

- (void)indexBusses
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_busses;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setIndex:", v5 + i, (void)v9);
        [v8 setBusType:self->_busType];
        [v8 setOwnerAudioUnit:self->_ownerAudioUnit];
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      v5 += i;
    }
    while (v4);
  }
}

- (void)removeObserverFromAllBusses:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v8 = observer;
  long long v9 = keyPath;
  begin = self->_observers.__begin_;
  for (uint64_t i = self->_observers.__end_; begin != i; uint64_t i = self->_observers.__end_)
  {
    WeakRetained = objc_loadWeakRetained((id *)begin);
    if (WeakRetained == v8 && [*((id *)begin + 1) isEqualToString:v9])
    {
      uint64_t v13 = (void *)*((void *)begin + 3);

      if (v13 == context)
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v14 = self->_busses;
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v16 = v15;
        if (v15)
        {
          uint64_t v17 = *(void *)v21;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v21 != v17) {
                objc_enumerationMutation(v14);
              }
              BusPropertyObserver::remove(begin, *(AUAudioUnitBus **)(*((void *)&v20 + 1) + 8 * v18++));
            }
            while (v16 != v18);
            uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v16);
        }

        uint64_t v19 = (id *)std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<BusPropertyObserver *,BusPropertyObserver *,BusPropertyObserver *>((id *)begin + 4, (id *)self->_observers.__end_, (uint64_t)begin);
        std::vector<BusPropertyObserver>::__base_destruct_at_end[abi:ne180100]((uint64_t)&self->_observers, v19);
        break;
      }
    }
    else
    {
    }
    begin = (BusPropertyObserver *)((char *)begin + 32);
  }
}

- (void)addObserverToAllBusses:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v10 = keyPath;
  objc_initWeak(&location, observer);
  long long v11 = v10;
  long long v23 = v11;
  *(void *)&long long v24 = options;
  *((void *)&v24 + 1) = context;
  end = self->_observers.__end_;
  if (end >= self->_observers.__end_cap_.__value_)
  {
    uint64_t v13 = (BusPropertyObserver *)std::vector<BusPropertyObserver>::__push_back_slow_path<BusPropertyObserver const&>((unint64_t *)&self->_observers, (uint64_t)&location);
  }
  else
  {
    objc_copyWeak((id *)self->_observers.__end_, &location);
    *((void *)end + 1) = v23;
    *((_OWORD *)end + 1) = v24;
    uint64_t v13 = (BusPropertyObserver *)((char *)end + 32);
  }
  self->_observers.__end_ = v13;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = self->_busses;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v14);
        }
        BusPropertyObserver::add((BusPropertyObserver *)&location, *(AUAudioUnitBus **)(*((void *)&v18 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v15);
  }

  objc_destroyWeak(&location);
}

- (BOOL)setBusCount:(NSUInteger)count error:(NSError *)outError
{
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_busses countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (AUAudioUnitBus)objectAtIndexedSubscript:(NSUInteger)index
{
  return (AUAudioUnitBus *)[(NSMutableArray *)self->_busses objectAtIndexedSubscript:index];
}

- (NSUInteger)count
{
  return [(NSMutableArray *)self->_busses count];
}

- (void)dealloc
{
  busses = self->_busses;
  self->_busses = 0;

  v4.receiver = self;
  v4.super_class = (Class)AUAudioUnitBusArray;
  [(AUAudioUnitBusArray *)&v4 dealloc];
}

- (AUAudioUnitBusArray)initWithAudioUnit:(AUAudioUnit *)owner busType:(AUAudioUnitBusType)busType
{
  return [(AUAudioUnitBusArray *)self initWithAudioUnit:owner busType:busType busses:MEMORY[0x1E4F1CBF0]];
}

- (AUAudioUnitBusArray)initWithAudioUnit:(AUAudioUnit *)owner busType:(AUAudioUnitBusType)busType busses:(NSArray *)busArray
{
  v8 = owner;
  long long v9 = busArray;
  v15.receiver = self;
  v15.super_class = (Class)AUAudioUnitBusArray;
  long long v10 = [(AUAudioUnitBusArray *)&v15 init];
  long long v11 = v10;
  if (v10)
  {
    v10->_ownerAudioUnit = v8;
    v10->_busType = busType;
    if (v9)
    {
      uint64_t v12 = [(NSArray *)v9 mutableCopy];
      busses = v11->_busses;
      v11->_busses = (NSMutableArray *)v12;
    }
    else
    {
      busses = v10->_busses;
      v10->_busses = 0;
    }

    [(AUAudioUnitBusArray *)v11 indexBusses];
  }

  return v11;
}

- (AUAudioUnitBusArray)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  objc_super v4 = [NSString stringWithUTF8String:"-[AUAudioUnitBusArray init]"];
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"Don't call %@.", v4 format];

  return 0;
}

@end