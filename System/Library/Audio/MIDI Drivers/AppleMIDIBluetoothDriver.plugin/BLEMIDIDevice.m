@interface BLEMIDIDevice
- (BLEMIDIDataReceiver)dataReceiver;
- (BLEMIDIDevice)init;
- (BLEMIDIDevice)initWithPeripheral:(id)a3 mtu:(unsigned int)a4;
- (CBPeripheral)peripheral;
- (NSString)uuid;
- (id).cxx_construct;
- (int)usage;
- (shared_ptr<BLEIOBuffer>)bufferAtIndex:(unsigned __int8)a3;
- (shared_ptr<BLEIOBuffer>)centralBuffer;
- (unsigned)advanceBuffer;
- (unsigned)dev;
- (unsigned)inEndpoint;
- (unsigned)mtu;
- (unsigned)nextBufferIndex;
- (unsigned)outEndpoint;
- (unsigned)recycleBuffer;
- (void)createBuffers;
- (void)dealloc;
- (void)setCentralBuffer:(shared_ptr<BLEIOBuffer>)a3;
- (void)setDataReceiver:(id)a3;
- (void)setDev:(unsigned int)a3;
- (void)setInEndpoint:(unsigned int)a3;
- (void)setMtu:(unsigned int)a3;
- (void)setNextBufferIndex:(unsigned __int8)a3;
- (void)setOutEndpoint:(unsigned int)a3;
- (void)setPeripheral:(id)a3;
- (void)setUsage:(int)a3;
- (void)setUuid:(id)a3;
@end

@implementation BLEMIDIDevice

- (BLEMIDIDevice)init
{
}

- (void)createBuffers
{
  v2 = self;
  if (self->peripheral) {
    sub_331C((uint64_t)&v3, (uint64_t *)&v2);
  }
  sub_331C((uint64_t)&v3, (uint64_t *)&v2);
}

- (BLEMIDIDevice)initWithPeripheral:(id)a3 mtu:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BLEMIDIDevice;
  v6 = [(BLEMIDIDevice *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->mtu = 0;
    *(_WORD *)&v6->nextBufferIndex = 0;
    [(BLEMIDIDevice *)v6 setPeripheral:a3];
    if (a4) {
      uint64_t v8 = a4;
    }
    else {
      uint64_t v8 = 20;
    }
    [(BLEMIDIDevice *)v7 setMtu:v8];
  }
  return v7;
}

- (void)dealloc
{
  peripheral = self->peripheral;
  if (peripheral) {

  }
  dataReceiver = self->dataReceiver;
  if (dataReceiver) {

  }
  uuid = self->uuid;
  if (uuid) {

  }
  v6.receiver = self;
  v6.super_class = (Class)BLEMIDIDevice;
  [(BLEMIDIDevice *)&v6 dealloc];
}

- (void)setMtu:(unsigned int)a3
{
  if (self->mtu != a3)
  {
    sub_31D4((uint64_t *)&self->localPeripheralBuffers);
    if (self->centralBuffer.__ptr_)
    {
      cntrl = self->centralBuffer.__cntrl_;
      self->centralBuffer.__ptr_ = 0;
      self->centralBuffer.__cntrl_ = 0;
      if (cntrl) {
        sub_35A8((std::__shared_weak_count *)cntrl);
      }
    }
    self->mtu = a3;
    [(BLEMIDIDevice *)self createBuffers];
  }
}

- (shared_ptr<BLEIOBuffer>)bufferAtIndex:(unsigned __int8)a3
{
  begin = self->localPeripheralBuffers.__begin_;
  if (a3 >= (unint64_t)(((char *)self->localPeripheralBuffers.__end_ - (char *)begin) >> 4))
  {
    *char v3 = 0;
    v3[1] = 0;
  }
  else
  {
    long long v5 = begin[a3];
    *(_OWORD *)char v3 = v5;
    if (*((void *)&v5 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v5 + 1) + 8), 1uLL, memory_order_relaxed);
    }
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (BLEIOBuffer *)self;
  return result;
}

- (unsigned)advanceBuffer
{
  int nextBufferIndex = self->nextBufferIndex;
  if (!self->peripheral)
  {
    if (nextBufferIndex == 3) {
      LOBYTE(nextBufferIndex) = 0;
    }
    else {
      LOBYTE(nextBufferIndex) = nextBufferIndex + 1;
    }
    self->int nextBufferIndex = nextBufferIndex;
  }
  return nextBufferIndex;
}

- (unsigned)recycleBuffer
{
  unint64_t lastWroteBufferIndex = self->lastWroteBufferIndex;
  if (!self->peripheral)
  {
    begin = (char *)self->localPeripheralBuffers.__begin_;
    if (lastWroteBufferIndex >= ((char *)self->localPeripheralBuffers.__end_ - (char *)begin) >> 4) {
      sub_3220();
    }
    long long v5 = &begin[16 * lastWroteBufferIndex];
    uint64_t v7 = *(void *)v5;
    objc_super v6 = (std::__shared_weak_count *)*((void *)v5 + 1);
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    *(unsigned char *)(v7 + 44) = 0;
    bzero(*(void **)(v7 + 24), self->mtu);
    int v8 = self->lastWroteBufferIndex;
    if (v8 == 3) {
      unsigned __int8 v9 = 0;
    }
    else {
      unsigned __int8 v9 = v8 + 1;
    }
    self->unint64_t lastWroteBufferIndex = v9;
    if (atomic_fetch_add((atomic_uint *volatile)(v7 + 8), 0xFFFFFFFF) == 1) {
      (*(void (**)(uint64_t))(*(void *)v7 + 16))(v7);
    }
    if (v6) {
      sub_35A8(v6);
    }
  }
  return lastWroteBufferIndex;
}

- (CBPeripheral)peripheral
{
  return self->peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (unsigned)dev
{
  return self->dev;
}

- (void)setDev:(unsigned int)a3
{
  self->dev = a3;
}

- (unsigned)inEndpoint
{
  return self->inEndpoint;
}

- (void)setInEndpoint:(unsigned int)a3
{
  self->inEndpoint = a3;
}

- (unsigned)outEndpoint
{
  return self->outEndpoint;
}

- (void)setOutEndpoint:(unsigned int)a3
{
  self->outEndpoint = a3;
}

- (BLEMIDIDataReceiver)dataReceiver
{
  return self->dataReceiver;
}

- (void)setDataReceiver:(id)a3
{
}

- (int)usage
{
  return self->usage;
}

- (void)setUsage:(int)a3
{
  self->usage = a3;
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (shared_ptr<BLEIOBuffer>)centralBuffer
{
  cntrl = self->centralBuffer.__cntrl_;
  BLEMIDIDevice *v2 = self->centralBuffer.__ptr_;
  v2[1] = (BLEIOBuffer *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (BLEIOBuffer *)self;
  return result;
}

- (void)setCentralBuffer:(shared_ptr<BLEIOBuffer>)a3
{
  v4 = *(BLEIOBuffer **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->centralBuffer.__cntrl_;
  self->centralBuffer.__ptr_ = v4;
  self->centralBuffer.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    sub_35A8((std::__shared_weak_count *)cntrl);
  }
}

- (unsigned)nextBufferIndex
{
  return self->nextBufferIndex;
}

- (void)setNextBufferIndex:(unsigned __int8)a3
{
  self->int nextBufferIndex = a3;
}

- (unsigned)mtu
{
  return self->mtu;
}

- (void).cxx_destruct
{
  cntrl = self->centralBuffer.__cntrl_;
  if (cntrl) {
    sub_35A8((std::__shared_weak_count *)cntrl);
  }
  p_localPeripheralBuffers = &self->localPeripheralBuffers;
  sub_32C8((void ***)&p_localPeripheralBuffers);
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

@end