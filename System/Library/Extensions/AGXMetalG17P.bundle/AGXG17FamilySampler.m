@interface AGXG17FamilySampler
- (AGXG17FamilySampler)initWithDevice:(id)a3 samplerDescriptor:(id)a4 driverDescriptor:(const void *)a5 initialQOSOverride:(unsigned int)a6;
- (id).cxx_construct;
- (unint64_t)resourceIndex;
- (unint64_t)uniqueIdentifier;
@end

@implementation AGXG17FamilySampler

- (id).cxx_construct
{
  *((_WORD *)self + 24) = 0;
  *(_OWORD *)((char *)self + 104) = 0uLL;
  *((void *)self + 12) = 0;
  *((_DWORD *)self + 36) = 0;
  *((void *)self + 19) = 0;
  *((unsigned char *)self + 160) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  if (!LODWORD(self[1].super._device) || LOBYTE(self[1].super._pixelFormat))
  {
    if ((*((char *)&self->_impl.desc.label.__r_.__value_.var0.__l + 23) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_10;
  }
  v3 = (os_unfair_lock_s *)(self[1].super._label + 5);
  os_unfair_lock_lock(v3);
  uint64_t v4 = *(void *)&p_impl[1].desc.lod_bias;
  uint64_t lod_min_clamp_low = LODWORD(p_impl[1].desc.lod_min_clamp);
  uint64_t v6 = *(void *)(v4 + 32);
  v7 = (int *)MEMORY[0x263F4B188];
  *(_DWORD *)(*(void *)(*(void *)(*(void *)(v4 + 24) + 8) + (int)*MEMORY[0x263F4B188] + 24)
            + 32 * lod_min_clamp_low) = v6;
  uint64_t v8 = v6;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(v4 + 32), (unint64_t *)&v8, (v6 & 0xFFFFFFFF00000000 | lod_min_clamp_low) + 0x100000000);
  if (v8 != v6)
  {
    uint64_t v9 = v8;
    do
    {
      *(_DWORD *)(*(void *)(*(void *)(*(void *)(v4 + 24) + 8) + *v7 + 24) + 32 * lod_min_clamp_low) = v8;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v4 + 32), (unint64_t *)&v9, (v8 & 0xFFFFFFFF00000000 | lod_min_clamp_low) + 0x100000000);
      BOOL v10 = v9 == v8;
      uint64_t v8 = v9;
    }
    while (!v10);
  }
  os_unfair_lock_unlock(v3);
  if (*((char *)&p_impl->desc.label.__r_.__value_.var0.__l + 23) < 0)
  {
LABEL_10:
    data = p_impl->desc.label.__r_.__value_.var0.__l.__data_;
    operator delete(data);
  }
}

- (unint64_t)resourceIndex
{
  return LODWORD(self[1].super._device);
}

- (unint64_t)uniqueIdentifier
{
  if (LODWORD(self[1].super._device)) {
    return LODWORD(self[1].super._device);
  }
  else {
    return (unint64_t)&self->_impl;
  }
}

- (AGXG17FamilySampler)initWithDevice:(id)a3 samplerDescriptor:(id)a4 driverDescriptor:(const void *)a5 initialQOSOverride:(unsigned int)a6
{
  v37.receiver = self;
  v37.super_class = (Class)AGXG17FamilySampler;
  v11 = -[_MTLSamplerState initWithDevice:samplerDescriptor:](&v37, sel_initWithDevice_samplerDescriptor_);
  if (v11)
  {
    AGX::SamplerGen3<AGX::HAL200::Classes,AGX::HAL200::Encoders>::SamplerGen3((uint64_t)v29, *((void *)a3 + 101), a4, (uint64_t)a5, a6);
    p_impl = &self->_impl;
    long long v13 = v29[1];
    *(_OWORD *)&p_impl->desc.ss.var0 = v29[0];
    *(_OWORD *)&p_impl->desc.lod_bias = v13;
    *(_OWORD *)&p_impl->desc.custom_border_color[3] = v29[2];
    p_label = (void **)&p_impl->desc.label;
    if (*((char *)&p_impl->desc.label.__r_.__value_.var0.__l + 23) < 0) {
      operator delete(*p_label);
    }
    *(_OWORD *)p_label = *(_OWORD *)__p;
    *((void *)&p_impl->desc.label.__r_.__value_.var0.__l + 2) = v31;
    HIBYTE(v31) = 0;
    LOBYTE(__p[0]) = 0;
    *(_OWORD *)&p_impl->desc.label.__r_.var0 = v32;
    *(void *)&p_impl[1].desc.ss.var0 = v33;
    float lod_min_clamp = p_impl[1].desc.lod_min_clamp;
    p_impl[1].desc.float lod_min_clamp = v34;
    float v34 = lod_min_clamp;
    v16 = *(os_unfair_lock_s **)&p_impl[1].desc.lod_bias;
    *(void *)&p_impl[1].desc.lod_bias = v35;
    v35 = v16;
    int v17 = LOBYTE(p_impl[1].desc.custom_border_color[1]);
    LOBYTE(p_impl[1].desc.custom_border_color[1]) = v36;
    char v36 = v17;
    if (lod_min_clamp != 0.0 && !v17)
    {
      v18 = v16 + 10;
      os_unfair_lock_lock(v16 + 10);
      v19 = v35;
      uint64_t v20 = LODWORD(v34);
      v21 = (atomic_ullong *)&v35[8];
      uint64_t v22 = *(void *)&v35[8]._os_unfair_lock_opaque;
      v23 = (int *)MEMORY[0x263F4B188];
      uint64_t v24 = 32 * LODWORD(v34);
      *(_DWORD *)(*(void *)(*(void *)(*(void *)&v35[6]._os_unfair_lock_opaque + 8)
                            + (int)*MEMORY[0x263F4B188]
                            + 24)
                + v24) = v22;
      uint64_t v25 = v22;
      atomic_compare_exchange_strong(v21, (unint64_t *)&v25, (v22 & 0xFFFFFFFF00000000 | v20) + 0x100000000);
      if (v25 != v22)
      {
        uint64_t v26 = v25;
        do
        {
          *(_DWORD *)(*(void *)(*(void *)(*(void *)&v19[6]._os_unfair_lock_opaque + 8) + *v23 + 24) + v24) = v25;
          atomic_compare_exchange_strong((atomic_ullong *volatile)&v19[8], (unint64_t *)&v26, (v25 & 0xFFFFFFFF00000000 | v20) + 0x100000000);
          BOOL v27 = v26 == v25;
          uint64_t v25 = v26;
        }
        while (!v27);
      }
      os_unfair_lock_unlock(v18);
      if (SHIBYTE(v31) < 0) {
        operator delete(__p[0]);
      }
    }
  }
  return v11;
}

@end