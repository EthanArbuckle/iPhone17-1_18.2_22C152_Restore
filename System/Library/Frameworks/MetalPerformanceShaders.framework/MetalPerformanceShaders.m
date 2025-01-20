BOOL MPSSupportsMTLDevice(id device)
{
  if (device) {
    MPSDevice::GetMPSDevice();
  }
  return (char)device;
}

id MPSGetPreferredDevice(MPSDeviceOptions options)
{
  if (options > 3) {
    return 0;
  }
  block[7] = v1;
  block[8] = v2;
  v4 = &qword_26776E1F0[options];
  uint64_t v6 = v4[4];
  v5 = v4 + 4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A0DEBC;
  block[3] = &unk_264185EF0;
  block[4] = options;
  if (v6 != -1) {
    dispatch_once(v5, block);
  }
  return (id)qword_26776E1F0[options];
}

id sub_210A0DEBC(uint64_t a1)
{
  id result = MTLCreateSystemDefaultDevice();
  qword_26776E1F0[*(void *)(a1 + 32)] = result;
  return result;
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void MPSAutoCache::PrefetchHeapSize()
{
  while (1)
    ;
}

void MPSAutoCache::SetHeapCacheDuration()
{
  while (1)
    ;
}

void MPSDevice::GetMPSDevice()
{
  while (1)
    ;
}