@interface HAPPGFrame
- (HAPPGFrame)initWithPPGProcessorOutput:(const void *)a3 rawPacket:(shared_ptr<const)std:()mimosa:()mimosa:()mimosa:()mimosa:()mimosa:(mimosa:(id)a5 :PacketV7>>)a4 :PacketV6 :PacketV5 :PacketV4 :PacketV3 :PacketV2 :variant<mimosa::PacketV1 bootDate:;
- (HAPPGTemperatureSample)temperatureSample;
- (NSArray)accelSamples;
- (NSArray)opticalSamples;
- (NSDate)startDate;
- (id).cxx_construct;
- (int64_t)timestamp;
- (unint64_t)usage;
@end

@implementation HAPPGFrame

- (HAPPGFrame)initWithPPGProcessorOutput:(const void *)a3 rawPacket:(shared_ptr<const)std:()mimosa:()mimosa:()mimosa:()mimosa:()mimosa:(mimosa:(id)a5 :PacketV7>>)a4 :PacketV6 :PacketV5 :PacketV4 :PacketV3 :PacketV2 :variant<mimosa::PacketV1 bootDate:
{
  cntrl = a4.__cntrl_;
  ptr = (void **)a4.__ptr_;
  v9 = a4.__cntrl_;
  v29.receiver = self;
  v29.super_class = (Class)HAPPGFrame;
  v10 = [(HAPPGFrame *)&v29 init];
  v11 = v10;
  v13 = *ptr;
  v12 = (atomic_ullong *)ptr[1];
  if (v12) {
    atomic_fetch_add_explicit(v12 + 1, 1uLL, memory_order_relaxed);
  }
  v14 = (std::__shared_weak_count *)v10->_rawPacket.__cntrl_;
  v11->_rawPacket.__ptr_ = v13;
  v11->_rawPacket.__cntrl_ = (__shared_weak_count *)v12;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  objc_storeStrong((id *)&v11->_startDate, cntrl);
  v15 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:(uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 6];
  uint64_t v16 = *(void *)a3;
  uint64_t v17 = *((void *)a3 + 1);
  if (*(void *)a3 != v17)
  {
    do
    {
      v18 = [[HAPPGOpticalSample alloc] initWithPPGProcessorOutputSignal:v16];
      [v15 addObject:v18];

      v16 += 64;
    }
    while (v16 != v17);
  }
  objc_storeStrong((id *)&v11->_opticalSamples, v15);
  v19 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 4) - *((void *)a3 + 3)) >> 3)];
  uint64_t v21 = *((void *)a3 + 3);
  for (uint64_t i = *((void *)a3 + 4); v21 != i; v21 += 24)
  {
    v22 = [HAPPGAccelSample alloc];
    LODWORD(v23) = *(_DWORD *)(v21 + 12);
    LODWORD(v24) = *(_DWORD *)(v21 + 16);
    LODWORD(v25) = *(_DWORD *)(v21 + 20);
    v26 = [(HAPPGAccelSample *)v22 initWithSamplingFrequency:*(unsigned __int16 *)(v21 + 8) timestamp:*(void *)v21 x:v23 y:v24 z:v25];
    [(NSArray *)v19 addObject:v26];
  }
  accelSamples = v11->_accelSamples;
  v11->_accelSamples = v19;

  return v11;
}

- (int64_t)timestamp
{
  uint64_t v2 = *((unsigned int *)self->_rawPacket.__ptr_ + 80);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  v5 = &v4;
  return ((uint64_t (*)(char **))off_26D4E3BC8[v2])(&v5);
}

- (unint64_t)usage
{
  uint64_t v2 = *((unsigned int *)self->_rawPacket.__ptr_ + 80);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  v5 = &v4;
  return ((uint64_t (*)(char **))off_26D4E3C00[v2])(&v5);
}

- (HAPPGTemperatureSample)temperatureSample
{
  uint64_t v2 = *((unsigned int *)self->_rawPacket.__ptr_ + 80);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  v6 = &v5;
  v3 = ((void (*)(char **))off_26D4E3C38[v2])(&v6);
  return (HAPPGTemperatureSample *)v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)opticalSamples
{
  return self->_opticalSamples;
}

- (NSArray)accelSamples
{
  return self->_accelSamples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelSamples, 0);
  objc_storeStrong((id *)&self->_opticalSamples, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  cntrl = self->_rawPacket.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end