@interface MTRCommissionableBrowserResultInterfaces
- (Optional<chip::Dnssd::CommonResolutionData>)resolutionData;
- (id).cxx_construct;
- (void)setResolutionData:(Optional<chip::Dnssd::CommonResolutionData>)a3;
@end

@implementation MTRCommissionableBrowserResultInterfaces

- (Optional<chip::Dnssd::CommonResolutionData>)resolutionData
{
  BOOL mHasValue = self->_resolutionData.mHasValue;
  *(unsigned char *)uint64_t v2 = mHasValue;
  if (mHasValue)
  {
    *(_DWORD *)(v2 + 8) = self[1].super.isa;
    long long v4 = *(_OWORD *)&self[8]._resolutionData.mHasValue;
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 112) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 120);
    *(_OWORD *)(v2 + 128) = v4;
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 144) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 152);
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 155) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 163);
    long long v5 = *(_OWORD *)&self[4]._resolutionData.mHasValue;
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 48) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 56);
    *(_OWORD *)(v2 + 64) = v5;
    long long v6 = *(_OWORD *)&self[6]._resolutionData.mHasValue;
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 80) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 88);
    *(_OWORD *)(v2 + 96) = v6;
    long long v7 = *(_OWORD *)&self[2]._resolutionData.mHasValue;
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 16) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 24);
    *(_OWORD *)(v2 + 32) = v7;
  }
  return (Optional<chip::Dnssd::CommonResolutionData>)self;
}

- (void)setResolutionData:(Optional<chip::Dnssd::CommonResolutionData>)a3
{
  int v3 = **(unsigned __int8 **)&a3.mHasValue;
  self->_resolutionData.BOOL mHasValue = v3;
  if (v3)
  {
    LODWORD(self[1].super.isa) = *(_DWORD *)(*(void *)&a3.mHasValue + 8);
    long long v4 = *(_OWORD *)(*(void *)&a3.mHasValue + 16);
    *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 40) = *(MTRCommissionableBrowserResultInterfaces *)(*(void *)&a3.mHasValue + 32);
    *(_OWORD *)&self[1]._resolutionData.BOOL mHasValue = v4;
    long long v5 = *(_OWORD *)(*(void *)&a3.mHasValue + 48);
    long long v6 = *(_OWORD *)(*(void *)&a3.mHasValue + 64);
    long long v7 = *(_OWORD *)(*(void *)&a3.mHasValue + 80);
    *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 104) = *(MTRCommissionableBrowserResultInterfaces *)(*(void *)&a3.mHasValue + 96);
    *(_OWORD *)&self[5]._resolutionData.BOOL mHasValue = v7;
    *(_OWORD *)&self[4]._resolutionData.BOOL mHasValue = v6;
    *(_OWORD *)&self[3]._resolutionData.BOOL mHasValue = v5;
    long long v8 = *(_OWORD *)(*(void *)&a3.mHasValue + 112);
    long long v9 = *(_OWORD *)(*(void *)&a3.mHasValue + 128);
    long long v10 = *(_OWORD *)(*(void *)&a3.mHasValue + 144);
    *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 163) = *(MTRCommissionableBrowserResultInterfaces *)(*(void *)&a3.mHasValue + 155);
    *(_OWORD *)&self[9]._resolutionData.BOOL mHasValue = v10;
    *(_OWORD *)&self[8]._resolutionData.BOOL mHasValue = v9;
    *(_OWORD *)&self[7]._resolutionData.BOOL mHasValue = v8;
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  return self;
}

@end