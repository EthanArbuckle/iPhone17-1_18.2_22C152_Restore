@interface CAWindowServerVirtualDisplay
- (CAWindowServerVirtualDisplay)initWithOptions:(id)a3;
@end

@implementation CAWindowServerVirtualDisplay

- (CAWindowServerVirtualDisplay)initWithOptions:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (![a3 objectForKeyedSubscript:@"kCAVirtualDisplayWidth"]
    || ![a3 objectForKeyedSubscript:@"kCAVirtualDisplayHeight"])
  {
    NSLog(&cfstr_Kcavirtualdisp_4.isa);
    return 0;
  }
  int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"kCAVirtualDisplayWidth"), "unsignedIntegerValue");
  int v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"kCAVirtualDisplayHeight"), "unsignedIntegerValue");
  if ([a3 objectForKeyedSubscript:@"kCAVirtualDisplayUpdateRate"])
  {
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"kCAVirtualDisplayUpdateRate"), "doubleValue");
    if (v7 == 0.0) {
      double v8 = 0.0166666667;
    }
    else {
      double v8 = 1.0 / v7;
    }
  }
  else
  {
    double v8 = 0.0166666667;
  }
  v10 = (void *)[a3 objectForKeyedSubscript:@"kCAVirtualDisplayMinimumFrameDuration"];
  if (v10) {
    unsigned int v11 = [v10 unsignedIntValue];
  }
  else {
    unsigned int v11 = 1;
  }
  if ([a3 objectForKeyedSubscript:@"kCAVirtualDisplayPixelFormat"]) {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"kCAVirtualDisplayPixelFormat"), "unsignedIntegerValue");
  }
  else {
    uint64_t v12 = 1111970369;
  }
  int v13 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"kCAVirtualDisplayPixelFormatFollowsMode"), "BOOLValue");
  CFStringRef v14 = CFStringCreateWithFormat(0, 0, @"Virtual-%d", atomic_fetch_add(CA::WindowServer::VirtualDisplay::open(unsigned int,unsigned int,double,unsigned int,BOOL,unsigned int)::count, 1u));
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v16 = (CA::WindowServer::Display *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x64A0uLL, 0x743898A5uLL);
  if (!v16)
  {
    CFRelease(v14);
    return self;
  }
  uint64_t v17 = (uint64_t)v16;
  v18 = (char *)v16 + 25592;
  v19 = CA::WindowServer::Display::Display(v16, v14);
  *(void *)v19 = &unk_1ED0241B8;
  uint64_t v20 = 25536;
  do
  {
    uint64_t v21 = v17 + v20;
    *(_DWORD *)uint64_t v21 = 0;
    *(void *)(v21 + 8) = 0;
    v20 += 16;
  }
  while ((CA::WindowServer::Display *)(v21 + 16) != (CA::WindowServer::Display *)((char *)v19 + 25584));
  *(void *)(v17 + 25584) = 0;
  *(_DWORD *)v18 = 0;
  *(double *)(v17 + 25600) = v8;
  if (v11 <= 1) {
    unsigned int v22 = 1;
  }
  else {
    unsigned int v22 = v11;
  }
  *((_DWORD *)v18 + 4) = v22;
  *(double *)(v17 + 25616) = v8 / (double)v22;
  *((_DWORD *)v18 + 9) = v12;
  *(void *)(v17 + 25632) = 0;
  if (v13) {
    char v23 = 2;
  }
  else {
    char v23 = 0;
  }
  v18[48] = v18[48] & 0xFC | v23;
  *(_OWORD *)(v17 + 25648) = 0u;
  *(_OWORD *)(v17 + 25664) = 0u;
  *(void *)(v17 + 25680) = 0;
  *((_DWORD *)v18 + 24) = 1065353216;
  *((_DWORD *)v18 + 34) = 0;
  *(_OWORD *)(v17 + 25696) = 0u;
  if (CA::Render::fourcc_to_format((CA::Render *)v12) - 33 <= 2) {
    atomic_fetch_or((atomic_uint *volatile)(v17 + 624), 8u);
  }
  v41[0] = v5;
  v41[1] = v6;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)buffer = _Q0;
  CA::WindowServer::Display::set_size(v17, (uint64_t)v41, (uint64_t)v41, (double *)buffer, *(double *)&_Q0, v24, v25, v26, v27, v28, v29, v30);
  CFUUIDRef v36 = CFUUIDCreate(0);
  CFStringRef v37 = CFUUIDCreateString(0, v36);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  *(_OWORD *)buffer = 0u;
  if (CFStringGetCString(v37, buffer, 256, 0x8000100u)) {
    *(void *)(v17 + 25632) = strdup(buffer);
  }
  *(_WORD *)(v17 + 656) = *(_WORD *)(v17 + 656) & 0xE3FF | 0xC00;
  (*(void (**)(uint64_t, uint64_t))(*(void *)v17 + 2168))(v17, 2);
  CFRelease(v36);
  CFRelease(v37);
  os_unfair_lock_lock((os_unfair_lock_t)(v17 + 716));
  *(_WORD *)(*(void *)(v17 + 728) + 2) = 257;
  os_unfair_lock_unlock((os_unfair_lock_t)(v17 + 716));
  CFRelease(v14);
  v38 = (CA::WindowServer::Server *)(*(uint64_t (**)(uint64_t))(*(void *)v17 + 1624))(v17);
  if (!v38) {
    return 0;
  }
  v39 = v38;
  CA::WindowServer::Server::attach_contexts(v38);
  v40.receiver = self;
  v40.super_class = (Class)CAWindowServerVirtualDisplay;
  self = [(CAWindowServerDisplay *)&v40 _initWithCADisplayServer:v39];
  if (!self)
  {
    (**(void (***)(CA::WindowServer::Server *))v39)(v39);
    (*(void (**)(CA::WindowServer::Server *))(*(void *)v39 + 120))(v39);
  }
  return self;
}

@end