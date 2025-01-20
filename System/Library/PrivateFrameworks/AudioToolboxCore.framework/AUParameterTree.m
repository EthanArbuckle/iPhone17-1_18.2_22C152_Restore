@interface AUParameterTree
+ (AUParameter)createParameterWithIdentifier:(NSString *)identifier name:(NSString *)name address:(AUParameterAddress)address min:(AUValue)min max:(AUValue)max unit:(AudioUnitParameterUnit)unit unitName:(NSString *)unitName flags:(AudioUnitParameterOptions)flags valueStrings:(NSArray *)valueStrings dependentParameters:(NSArray *)dependentParameters;
+ (AUParameterGroup)createGroupFromTemplate:(AUParameterGroup *)templateGroup identifier:(NSString *)identifier name:(NSString *)name addressOffset:(AUParameterAddress)addressOffset;
+ (AUParameterGroup)createGroupTemplate:(NSArray *)children;
+ (AUParameterGroup)createGroupWithIdentifier:(NSString *)identifier name:(NSString *)name children:(NSArray *)children;
+ (AUParameterTree)createTreeWithChildren:(NSArray *)children;
+ (BOOL)supportsSecureCoding;
- (AUAudioUnit_XH)_auXH;
- (AUParameter)parameterWithAddress:(AUParameterAddress)address;
- (AUParameter)parameterWithID:(AudioUnitParameterID)paramID scope:(AudioUnitScope)scope element:(AudioUnitElement)element;
- (AUParameterTree)initWithChildren:(id)a3;
- (AUParameterTree)initWithCoder:(id)a3;
- (AURemoteParameterObserver)remoteObserverToken;
- (AURemoteParameterObserver)remoteRecorderToken;
- (NSXPCConnection)remoteParameterSynchronizerXPCConnection;
- (OS_dispatch_queue)observationQueue;
- (OS_dispatch_queue)valueAccessQueue;
- (id).cxx_construct;
- (int)_autoCreatedForV2AU;
- (int)numRecorders;
- (vector<AddressToParameter,)addrToParamIndex;
- (void)_checkInitTreeObservation;
- (void)_init2;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)observerController;
- (void)remoteSyncParameter:(unint64_t)a3 value:(float)a4 extOriginator:(unint64_t)a5 hostTime:(unint64_t)a6 eventType:(unsigned int)a7;
- (void)setAddrToParamIndex:()vector<AddressToParameter;
- (void)setNumRecorders:(int)a3;
- (void)setRemoteObserverToken:(AURemoteParameterObserver *)a3;
- (void)setRemoteParameterSynchronizerXPCConnection:(id)a3;
- (void)setRemoteRecorderToken:(AURemoteParameterObserver *)a3;
- (void)set_auXH:(id)a3;
- (void)set_autoCreatedForV2AU:(int)a3;
@end

@implementation AUParameterTree

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 22) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_addrToParamIndex = &self->_addrToParamIndex;
  std::vector<AddressToParameter>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_addrToParamIndex);
  objc_destroyWeak((id *)&self->_remoteParameterSynchronizerXPCConnection);
  objc_destroyWeak((id *)&self->__auXH);
  objc_storeStrong((id *)&self->_valueAccessQueue, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
  cntrl = self->_observerController.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setRemoteParameterSynchronizerXPCConnection:(id)a3
{
}

- (NSXPCConnection)remoteParameterSynchronizerXPCConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteParameterSynchronizerXPCConnection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setRemoteRecorderToken:(AURemoteParameterObserver *)a3
{
  self->_remoteRecorderToken = a3;
}

- (AURemoteParameterObserver)remoteRecorderToken
{
  return self->_remoteRecorderToken;
}

- (void)setRemoteObserverToken:(AURemoteParameterObserver *)a3
{
  self->_remoteObserverToken = a3;
}

- (AURemoteParameterObserver)remoteObserverToken
{
  return self->_remoteObserverToken;
}

- (void)setNumRecorders:(int)a3
{
  self->_numRecorders = a3;
}

- (int)numRecorders
{
  return self->_numRecorders;
}

- (void)set_auXH:(id)a3
{
}

- (AUAudioUnit_XH)_auXH
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__auXH);
  return (AUAudioUnit_XH *)WeakRetained;
}

- (OS_dispatch_queue)valueAccessQueue
{
  return self->_valueAccessQueue;
}

- (OS_dispatch_queue)observationQueue
{
  return self->_observationQueue;
}

- (void)set_autoCreatedForV2AU:(int)a3
{
  self->__autoCreatedForV2AU = a3;
}

- (int)_autoCreatedForV2AU
{
  return self->__autoCreatedForV2AU;
}

- (void)setAddrToParamIndex:()vector<AddressToParameter
{
  p_addrToParamIndex = &self->_addrToParamIndex;
  if (&self->_addrToParamIndex != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    uint64_t v6 = end - a3->__begin_;
    unint64_t v7 = v6 >> 4;
    uint64_t value = (uint64_t)self->_addrToParamIndex.__end_cap_.__value_;
    v9 = (id *)p_addrToParamIndex->__begin_;
    if (v6 >> 4 <= (unint64_t)((int64_t)(value - (unint64_t)p_addrToParamIndex->__begin_) >> 4))
    {
      unint64_t v19 = (self->_addrToParamIndex.__end_ - (AddressToParameter *)v9) >> 4;
      if (v19 >= v7)
      {
        v25 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<AddressToParameter *,AddressToParameter *,AddressToParameter *>((void **)a3->__begin_, (void **)a3->__end_, (id *)p_addrToParamIndex->__begin_);
        v26 = (id *)p_addrToParamIndex->__end_;
        if (v26 != v25)
        {
          do
          {
            v27 = v26 - 2;
            objc_destroyWeak(v26 - 1);
            v26 = v27;
          }
          while (v27 != v25);
        }
        p_addrToParamIndex->__end_ = (AddressToParameter *)v25;
      }
      else
      {
        v20 = (void **)((char *)begin + 16 * v19);
        std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<AddressToParameter *,AddressToParameter *,AddressToParameter *>((void **)a3->__begin_, v20, (id *)p_addrToParamIndex->__begin_);
        v21 = p_addrToParamIndex->__end_;
        while (v20 != (void **)end)
        {
          v22 = v20 + 1;
          v23 = *v20;
          v20 += 2;
          v24 = (id *)((char *)v21 + 8);
          *(void *)v21 = v23;
          v21 = (AddressToParameter *)((char *)v21 + 16);
          objc_copyWeak(v24, v22);
        }
        p_addrToParamIndex->__end_ = v21;
      }
    }
    else
    {
      if (v9)
      {
        v10 = self->_addrToParamIndex.__end_;
        v11 = (id *)p_addrToParamIndex->__begin_;
        if (v10 != (AddressToParameter *)v9)
        {
          do
          {
            v12 = (AddressToParameter *)((char *)v10 - 16);
            objc_destroyWeak((id *)v10 - 1);
            v10 = v12;
          }
          while (v12 != (AddressToParameter *)v9);
          v11 = (id *)p_addrToParamIndex->__begin_;
        }
        p_addrToParamIndex->__end_ = (AddressToParameter *)v9;
        operator delete(v11);
        uint64_t value = 0;
        p_addrToParamIndex->__begin_ = 0;
        p_addrToParamIndex->__end_ = 0;
        p_addrToParamIndex->__end_cap_.__value_ = 0;
      }
      if (v6 < 0) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v13 = value >> 3;
      if (value >> 3 <= v7) {
        uint64_t v13 = v6 >> 4;
      }
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      std::vector<std::shared_ptr<APComponent>>::__vallocate[abi:ne180100](p_addrToParamIndex, v14);
      v15 = p_addrToParamIndex->__end_;
      while (begin != end)
      {
        v16 = (id *)((char *)begin + 8);
        uint64_t v17 = *(void *)begin;
        begin = (AddressToParameter *)((char *)begin + 16);
        v18 = (id *)((char *)v15 + 8);
        *(void *)v15 = v17;
        v15 = (AddressToParameter *)((char *)v15 + 16);
        objc_copyWeak(v18, v16);
      }
      p_addrToParamIndex->__end_ = v15;
    }
  }
}

- (vector<AddressToParameter,)addrToParamIndex
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  end = self[7].__end_;
  uint64_t value = self[7].__end_cap_.__value_;
  if (value != end)
  {
    std::vector<std::shared_ptr<APComponent>>::__vallocate[abi:ne180100](retstr, (value - end) >> 4);
    uint64_t v6 = retstr->__end_;
    do
    {
      unint64_t v7 = (id *)((char *)end + 8);
      uint64_t v8 = *(void *)end;
      end = (AddressToParameter *)((char *)end + 16);
      v9 = (id *)((char *)v6 + 8);
      *(void *)uint64_t v6 = v8;
      uint64_t v6 = (AddressToParameter *)((char *)v6 + 16);
      objc_copyWeak(v9, v7);
    }
    while (end != value);
    retstr->__end_ = v6;
  }
  return self;
}

- (void)remoteSyncParameter:(unint64_t)a3 value:(float)a4 extOriginator:(unint64_t)a5 hostTime:(unint64_t)a6 eventType:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  int v9 = a5;
  id v12 = [(AUParameterTree *)self parameterWithAddress:a3];
  if (v12)
  {
    *(float *)&double v11 = a4;
    [v12 setValue:v9 & 0xFFFFFFFE | 1 extOriginator:a6 atHostTime:v7 eventType:v11];
  }
}

- (AUParameterTree)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AUParameterTree;
  v5 = [(AUParameterGroup *)&v7 initWithCoder:v4];
  if (v5)
  {
    -[AUParameterTree set_autoCreatedForV2AU:](v5, "set_autoCreatedForV2AU:", [v4 decodeIntForKey:@"autov2"]);
    [(AUParameterTree *)v5 _init2];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AUParameterTree;
  [(AUParameterGroup *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", -[AUParameterTree _autoCreatedForV2AU](self, "_autoCreatedForV2AU"), @"autov2");
}

- (void)observerController
{
  return self->_observerController.__ptr_;
}

- (void)_checkInitTreeObservation
{
  if (!self->_observerController.__ptr_)
  {
    v2 = self;
    operator new();
  }
}

- (AUParameter)parameterWithID:(AudioUnitParameterID)paramID scope:(AudioUnitScope)scope element:(AudioUnitElement)element
{
  if (self->__autoCreatedForV2AU)
  {
    objc_super v5 = [(AUParameterTree *)self parameterWithAddress:(*(void *)&scope << 61) | ((unint64_t)(element & 0x1FFFFFFF) << 32) | paramID];
  }
  else
  {
    objc_super v5 = 0;
  }
  return (AUParameter *)v5;
}

- (AUParameter)parameterWithAddress:(AUParameterAddress)address
{
  begin = self->_addrToParamIndex.__begin_;
  end = self->_addrToParamIndex.__end_;
  if (end != begin)
  {
    unint64_t v5 = (end - begin) >> 4;
    do
    {
      unint64_t v6 = v5 >> 1;
      objc_super v7 = (AUParameterAddress *)((char *)begin + 16 * (v5 >> 1));
      AUParameterAddress v9 = *v7;
      uint64_t v8 = (AddressToParameter *)(v7 + 2);
      v5 += ~(v5 >> 1);
      if (v9 < address) {
        begin = v8;
      }
      else {
        unint64_t v5 = v6;
      }
    }
    while (v5);
  }
  if (begin == end || *(void *)begin != address) {
    id WeakRetained = 0;
  }
  else {
    id WeakRetained = objc_loadWeakRetained((id *)begin + 1);
  }
  return (AUParameter *)WeakRetained;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AUParameterTree;
  [(AUParameterGroup *)&v2 dealloc];
}

- (AUParameterTree)initWithChildren:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUParameterTree;
  unint64_t v5 = [(AUParameterGroup *)&v8 initWithID:&stru_1EDFA53D0 name:&stru_1EDFA53D0 children:v4];
  unint64_t v6 = v5;
  if (v5) {
    [(AUParameterTree *)v5 _init2];
  }

  return v6;
}

- (void)_init2
{
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __25__AUParameterTree__init2__block_invoke;
  v19[3] = &unk_1E5687B38;
  v19[4] = self;
  [(AUParameterNode *)self _walkTree:0 callback:v19];
  p_addrToParamIndex = &self->_addrToParamIndex;
  begin = (id *)self->_addrToParamIndex.__begin_;
  end = (id *)self->_addrToParamIndex.__end_;
  unint64_t v6 = 126 - 2 * __clz(((char *)end - (char *)begin) >> 4);
  if (end == begin) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,AddressToParameter *,false>(begin, end, v7, 1);
  objc_super v8 = p_addrToParamIndex->__begin_;
  AUParameterAddress v9 = self->_addrToParamIndex.__end_;
  if (p_addrToParamIndex->__begin_ != v9)
  {
    uint64_t v10 = -1;
    do
    {
      uint64_t v11 = *(void *)v8;
      if (*(void *)v8 == v10)
      {
        v16 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"2 or more parameters share the same address: 0x%llx", v10);
        id v18 = [v16 exceptionWithName:@"AUInvalidNodeInfoException" reason:v17 userInfo:0];

        objc_exception_throw(v18);
      }
      objc_super v8 = (AddressToParameter *)((char *)v8 + 16);
      uint64_t v10 = v11;
    }
    while (v8 != v9);
  }
  id v12 = (OS_dispatch_queue *)dispatch_queue_create("AUParameterTree.observationQueue", 0);
  observationQueue = self->_observationQueue;
  self->_observationQueue = v12;

  unint64_t v14 = (OS_dispatch_queue *)dispatch_queue_create("AUParameterTree.valueAccessQueue", 0);
  valueAccessQueue = self->_valueAccessQueue;
  self->_valueAccessQueue = v14;

  dispatch_queue_set_specific((dispatch_queue_t)self->_valueAccessQueue, &current_queue_key, self->_valueAccessQueue, 0);
}

void __25__AUParameterTree__init2__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (([v4 isGroup] & 1) == 0)
  {
    id v5 = v4;
    uint64_t v26 = [v5 address];
    objc_initWeak(&v27, v5);
    unint64_t v6 = (id **)(*(void *)(a1 + 32) + 176);
    unint64_t v8 = *(void *)(*(void *)(a1 + 32) + 184);
    unint64_t v7 = *(void *)(*(void *)(a1 + 32) + 192);
    if (v8 >= v7)
    {
      uint64_t v10 = (uint64_t)(v8 - (void)*v6) >> 4;
      unint64_t v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 60) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v7 - (void)*v6;
      if (v12 >> 3 > v11) {
        unint64_t v11 = v12 >> 3;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13) {
        unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<applesauce::CF::StringRef,applesauce::CF::StringRef>>>(v13);
      }
      else {
        uint64_t v14 = 0;
      }
      unint64_t v15 = v13 + 16 * v10;
      unint64_t v16 = v13 + 16 * v14;
      *(void *)unint64_t v15 = v26;
      unint64_t v9 = v15 + 16;
      objc_copyWeak((id *)(v15 + 8), &v27);
      id v18 = *v6;
      uint64_t v17 = v6[1];
      if (v17 == *v6)
      {
        *unint64_t v6 = (id *)v15;
        v6[1] = (id *)v9;
        v6[2] = (id *)v16;
        if (!v17) {
          goto LABEL_21;
        }
      }
      else
      {
        unint64_t v25 = v16;
        unint64_t v19 = v17 - 1;
        v20 = (id *)(v15 - 8);
        do
        {
          v21 = v19 - 1;
          *(v20 - 1) = *(v19 - 1);
          v22 = v20 - 1;
          objc_moveWeak(v20, v19);
          v19 -= 2;
          v20 -= 2;
        }
        while (v21 != v18);
        v23 = *v6;
        uint64_t v17 = v6[1];
        *unint64_t v6 = v22;
        v6[1] = (id *)v9;
        v6[2] = (id *)v25;
        if (v17 != v23)
        {
          do
          {
            v24 = v17 - 2;
            objc_destroyWeak(v17 - 1);
            uint64_t v17 = v24;
          }
          while (v24 != v23);
          uint64_t v17 = v23;
        }
        if (!v17) {
          goto LABEL_21;
        }
      }
      operator delete(v17);
    }
    else
    {
      *(void *)unint64_t v8 = v26;
      unint64_t v9 = v8 + 16;
      objc_copyWeak((id *)(v8 + 8), &v27);
    }
LABEL_21:
    v6[1] = (id *)v9;
    objc_destroyWeak(&v27);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (AUParameterTree)createTreeWithChildren:(NSArray *)children
{
  v3 = children;
  id v4 = [[AUParameterTree alloc] initWithChildren:v3];

  return v4;
}

+ (AUParameterGroup)createGroupFromTemplate:(AUParameterGroup *)templateGroup identifier:(NSString *)identifier name:(NSString *)name addressOffset:(AUParameterAddress)addressOffset
{
  unint64_t v9 = templateGroup;
  uint64_t v10 = identifier;
  unint64_t v11 = name;
  uint64_t v12 = [[AUParameterGroup alloc] initWithTemplate:v9 identifier:v10 name:v11 addressOffset:addressOffset];

  return v12;
}

+ (AUParameterGroup)createGroupTemplate:(NSArray *)children
{
  v3 = children;
  id v4 = [[AUParameterGroup alloc] initWithChildren:v3];

  return v4;
}

+ (AUParameterGroup)createGroupWithIdentifier:(NSString *)identifier name:(NSString *)name children:(NSArray *)children
{
  unint64_t v7 = identifier;
  unint64_t v8 = name;
  unint64_t v9 = children;
  uint64_t v10 = [[AUParameterGroup alloc] initWithID:v7 name:v8 children:v9];

  return v10;
}

+ (AUParameter)createParameterWithIdentifier:(NSString *)identifier name:(NSString *)name address:(AUParameterAddress)address min:(AUValue)min max:(AUValue)max unit:(AudioUnitParameterUnit)unit unitName:(NSString *)unitName flags:(AudioUnitParameterOptions)flags valueStrings:(NSArray *)valueStrings dependentParameters:(NSArray *)dependentParameters
{
  uint64_t v12 = *(void *)&flags;
  uint64_t v14 = *(void *)&unit;
  unint64_t v19 = identifier;
  v20 = name;
  v21 = unitName;
  v22 = valueStrings;
  v23 = dependentParameters;
  v24 = [AUParameter alloc];
  *(AUValue *)&double v25 = min;
  *(AUValue *)&double v26 = max;
  id v27 = [(AUParameter *)v24 initWithID:v19 name:v20 address:address min:v14 max:v21 unit:v12 unitName:v25 flags:v26 valueStrings:v22 dependentParameters:v23];

  return v27;
}

@end