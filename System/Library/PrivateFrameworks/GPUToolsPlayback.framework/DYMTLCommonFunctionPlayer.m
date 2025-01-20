@interface DYMTLCommonFunctionPlayer
- (BOOL)_isPresentFunction;
- (BOOL)isFrameBoundary;
- (BOOL)shouldExecuteGraphicsFunction;
- (DYLayerManager)layerManager;
- (DYLayerManager)strongLayerManager;
- (id).cxx_construct;
- (id)layerForID:(unint64_t)a3;
- (void)executePlatformFunction;
- (void)setLayerManager:(id)a3;
@end

@implementation DYMTLCommonFunctionPlayer

- (DYLayerManager)strongLayerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerManager);
  return (DYLayerManager *)WeakRetained;
}

- (id)layerForID:(unint64_t)a3
{
  v5 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
  v6 = [v5 layerForID:a3];

  if (!v6)
  {
    v7 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
    v6 = objc_msgSend(v7, "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:", a3, 0, 0, 0.0, 0.0, 1.0, 1.0, 1.0);
  }
  id v8 = v6;

  return v8;
}

- (BOOL)_isPresentFunction
{
  int v2 = **(_DWORD **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F3F9A8]);
  return (v2 + 7158) < 3 || (v2 + 16359) < 2 || v2 == -16133;
}

- (BOOL)shouldExecuteGraphicsFunction
{
  if ([(DYMTLCommonFunctionPlayer *)self _isPresentFunction])
  {
    v3 = [(DYMTLFunctionPlayer *)self objectForKey:*(*(void ***)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F3F9A8]))[9]];
    v4 = [v3 layer];

    if (v4)
    {
      v5 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
      v6 = [v3 layer];
      [v5 prepareLayerForPresent:v6];

      v7 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
      [v7 applyLayersVisibility];
    }
  }
  return 1;
}

- (void)executePlatformFunction
{
  v81[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F3F9A8];
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.isa + v3);
  uint64_t v6 = v4 + 48;
  int v5 = *(_DWORD *)v4;
  if (*(int *)v4 > -7169)
  {
    switch(v5)
    {
      case -7168:
        id v66 = [(DYMTLCommonFunctionPlayer *)self layerForID:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0)];
        objc_msgSend(v66, "setPresentsWithTransaction:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned int>(*(uint64_t *)((char *)&self->super.super.super.isa + v3) + 72, 0) != 0);
        goto LABEL_10;
      case -7167:
        unint64_t v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0);
        v70 = (GPUTools::MTL *)&v69;
        id v18 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_drawableMap, &v69, (uint64_t)&std::piecewise_construct, (void **)&v70)[3];
        v19 = [v18 texture];
        DYMTLAddDrawableTextureDescriptor(v19);
        [(DYMTLFunctionPlayer *)self setObject:v19 forKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.isa + v3) + 24, 0)];

        return;
      case -7166:
LABEL_19:
        v10 = [(DYMTLCommonFunctionPlayer *)self layerForID:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0)];
        unint64_t v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.isa + v3) + 24, 0);
        v11 = (void *)MEMORY[0x253362620]();
        do
        {
          v12 = [v10 nextDrawable];
        }
        while (!v12);
        v70 = (GPUTools::MTL *)&v69;
        v13 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_drawableMap, &v69, (uint64_t)&std::piecewise_construct, (void **)&v70);
        objc_storeStrong(v13 + 3, v12);
        v70 = (GPUTools::MTL *)&v69;
        *((unsigned char *)std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_drawableRenderabilityStatusMap, &v69, (uint64_t)&std::piecewise_construct, (void **)&v70)+ 24) = 1;
        [(DYMTLFunctionPlayer *)self setObject:v12 forKey:v69];

        return;
      case -7165:
LABEL_16:
        id v66 = [(DYMTLCommonFunctionPlayer *)self layerForID:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0)];
        objc_msgSend(v66, "setPixelFormat:", GPUTools::FD::Argument::ViewAsScalarArray<MTLPixelFormat>(v4 + 72, 0));
        goto LABEL_10;
      case -7164:
        id v66 = [(DYMTLCommonFunctionPlayer *)self layerForID:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0)];
        v20.n64_u64[0] = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 0).n64_u64[0];
        v21.n64_u64[0] = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 1uLL).n64_u64[0];
        double v22 = *(double *)(MEMORY[0x263F001B0] + 8);
        if (*MEMORY[0x263F001B0] == v20.n64_f64[0] && v22 == v21.n64_f64[0])
        {
          objc_msgSend(v66, "bounds", *MEMORY[0x263F001B0], v21.n64_f64[0], v22);
          double v25 = v24;
          [v66 contentsScale];
          double v27 = v26;
          [v66 bounds];
          double v29 = v28;
          [v66 contentsScale];
          v20.n64_f64[0] = v25 * v27;
          v21.n64_f64[0] = v29 * v30;
        }
        objc_msgSend(v66, "setDrawableSize:", v20.n64_f64[0], v21.n64_f64[0], v22);
        goto LABEL_10;
      case -7163:
LABEL_22:
        v14 = [(DYMTLCommonFunctionPlayer *)self layerForID:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0)];
        if ((*(unsigned __int16 **)((char *)&self->super.super.super.isa + v3))[5] < 3u)
        {
          v17 = 0;
        }
        else
        {
          [(DYFunctionPlayer *)self processArguments];
          __p = 0;
          v78 = 0;
          uint64_t v79 = 0;
          *(_OWORD *)v71 = 0u;
          *(_OWORD *)v72 = 0u;
          long long v73 = 0u;
          *(_OWORD *)v74 = 0u;
          *(_OWORD *)v75 = 0u;
          long long v76 = 0u;
          GPUTools::MTL::Utils::MakeDYMTLDeviceDescriptor(**(GPUTools::MTL::Utils ***)((char *)&self->super.super._executePlatformSEL + (int)*MEMORY[0x263F3F970]), &v70, v15);
          if (SHIBYTE(v72[0]) >= 0) {
            v16 = v71;
          }
          else {
            v16 = (void **)v71[0];
          }
          v17 = [NSString stringWithUTF8String:v16];
          GPUTools::MTL::DispatchSetCaptureVersion(v70);
          if (__p)
          {
            v78 = __p;
            operator delete(__p);
          }
          if (SHIBYTE(v76) < 0) {
            operator delete(v75[1]);
          }
          if (SHIBYTE(v75[0]) < 0) {
            operator delete(v74[0]);
          }
          if (SHIBYTE(v73) < 0) {
            operator delete(v72[1]);
          }
          if (SHIBYTE(v72[0]) < 0) {
            operator delete(v71[0]);
          }
        }
        v65 = [(DYMTLFunctionPlayer *)self deviceForID:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v4 + 72, 0) withDeviceName:v17];
        [v14 setDevice:v65];

        return;
      case -7162:
        id v66 = [(DYMTLCommonFunctionPlayer *)self layerForID:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0)];
        double v31 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 0).n64_f64[0];
        double v32 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 1uLL).n64_f64[0];
        double v33 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 2uLL).n64_f64[0];
        double v34 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 3uLL).n64_f64[0];
        double v35 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 96, 0).n64_f64[0];
        v36 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
        objc_msgSend(v36, "updateLayer:contentRect:contentsScale:properties:", v66, 0, v31, v32, v33, v34, v35);

        goto LABEL_10;
      case -7161:
        unint64_t v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0);
        std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__erase_unique<unsigned long long>(&self->_drawableMap.__table_.__bucket_list_.__ptr_.__value_, &v69);
        [(DYMTLFunctionPlayer *)self removeObjectForKey:v69];
        v70 = (GPUTools::MTL *)&v69;
        *((unsigned char *)std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_drawableRenderabilityStatusMap, &v69, (uint64_t)&std::piecewise_construct, (void **)&v70)+ 24) = 0;
        return;
      case -7160:
        id v66 = [(DYMTLCommonFunctionPlayer *)self layerForID:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0)];
        objc_msgSend(v66, "setFramebufferOnly:", GPUTools::FD::Argument::ViewAsScalarArray<BOOL>(v4 + 72, 0));
        goto LABEL_10;
      case -7159:
        v37 = [(DYMTLCommonFunctionPlayer *)self layerForID:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0)];
        double v38 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 0).n64_f64[0];
        double v39 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 1uLL).n64_f64[0];
        double v40 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 2uLL).n64_f64[0];
        id v67 = (id)GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 3uLL).n64_u64[0];
        double v41 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 96, 0).n64_f64[0];
        unint64_t v42 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 120, 0).n64_u64[0];
        unint64_t v43 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 120, 1uLL).n64_u64[0];
        unint64_t v44 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 120, 2uLL).n64_u64[0];
        unint64_t v45 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 120, 3uLL).n64_u64[0];
        unint64_t v46 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v4 + 144, 0);
        uint64_t v47 = GPUTools::FD::Argument::ViewAsScalarArray<long long>(v4 + 168, 0);
        v80[0] = @"styleMask";
        v48 = [NSNumber numberWithUnsignedLongLong:v46];
        v80[1] = @"windowLevel";
        v81[0] = v48;
        v49 = [NSNumber numberWithLongLong:v47];
        v81[1] = v49;
        v50 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];

        v51 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
        objc_msgSend(v51, "updateLayer:contentRect:contentsScale:properties:windowRect:", v37, v50, v38, v39, v40, *(double *)&v67, v41, v42, v43, v44, v45);

        return;
      case -7158:
        unint64_t v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0);
        v70 = (GPUTools::MTL *)&v69;
        id v52 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_drawableMap, &v69, (uint64_t)&std::piecewise_construct, (void **)&v70)[3];
        if (v52)
        {
          v53 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
          v54 = [v52 layer];
          [v53 prepareLayerForPresent:v54];

          v55 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
          [v55 applyLayersVisibility];

          [v52 present];
        }
        goto LABEL_56;
      case -7157:
        unint64_t v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0);
        v70 = (GPUTools::MTL *)&v69;
        id v52 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_drawableMap, &v69, (uint64_t)&std::piecewise_construct, (void **)&v70)[3];
        if (v52)
        {
          v56 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
          v57 = [v52 layer];
          [v56 prepareLayerForPresent:v57];

          v58 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
          [v58 applyLayersVisibility];

          objc_msgSend(v52, "presentAtTime:", GPUTools::FD::Argument::ViewAsScalarArray<double>(*(uint64_t *)((char *)&self->super.super.super.isa + v3) + 72, 0).n64_f64[0]);
        }
        goto LABEL_56;
      case -7156:
        unint64_t v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0);
        v70 = (GPUTools::MTL *)&v69;
        id v52 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_drawableMap, &v69, (uint64_t)&std::piecewise_construct, (void **)&v70)[3];
        if (v52)
        {
          v59 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
          v60 = [v52 layer];
          [v59 prepareLayerForPresent:v60];

          v61 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
          [v61 applyLayersVisibility];

          objc_msgSend(v52, "presentAfterMinimumDuration:", GPUTools::FD::Argument::ViewAsScalarArray<double>(*(uint64_t *)((char *)&self->super.super.super.isa + v3) + 72, 0).n64_f64[0]);
        }
LABEL_56:
        v70 = (GPUTools::MTL *)&v69;
        *((unsigned char *)std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_drawableRenderabilityStatusMap, &v69, (uint64_t)&std::piecewise_construct, (void **)&v70)+ 24) = 0;

        return;
      case -7155:
        id v66 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
        objc_msgSend(v66, "setInterfaceOrientation:", GPUTools::FD::Argument::ViewAsScalarArray<int>(v4 + 72, 0));
        goto LABEL_10;
      default:
        switch(v5)
        {
          case -6656:
            goto LABEL_16;
          case -6655:
            goto LABEL_19;
          case -6654:
            goto LABEL_22;
          case -6653:
            id v66 = [(DYMTLCommonFunctionPlayer *)self layerForID:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0)];
            double v62 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 0).n64_f64[0];
            double v63 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 1uLL).n64_f64[0];
            v64 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
            objc_msgSend(v64, "updateLayer:contentRect:contentsScale:properties:windowRect:", v66, 0, 0.0, 0.0, v62, v63, 1.0, 0, 0, 0x4059000000000000, 0x4059000000000000);

            objc_msgSend(v66, "setDrawableSize:", v62, v63);
            [v66 setFramebufferOnly:0];
            goto LABEL_10;
          default:
            goto LABEL_17;
        }
    }
  }
  if (v5 == -8183)
  {
    v7 = COERCE_GPUTOOLS_MTL_(1.0);
    unint64_t v8 = 1.0;
    if (*(unsigned __int16 *)(v4 + 10) >= 4u)
    {
      v7 = (GPUTools::MTL *)GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 96, 0).n64_u64[0];
      unint64_t v8 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 120, 0).n64_u64[0];
    }
    v70 = v7;
    v71[0] = (void *)v8;
    v9 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
    objc_msgSend(v9, "setTransform:forLayerID:withScreenToLayerScale:", v4 + 72, GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0), &v70);
  }
  else
  {
    if (v5 == -8182)
    {
      id v66 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
      objc_msgSend(v66, "setPosition:forLayerID:", v4 + 72, GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
    }
    else
    {
      if (v5 != -8181)
      {
LABEL_17:
        v68.receiver = self;
        v68.super_class = (Class)DYMTLCommonFunctionPlayer;
        [(DYMTLFunctionPlayer *)&v68 executePlatformFunction];
        return;
      }
      id v66 = [(DYMTLCommonFunctionPlayer *)self strongLayerManager];
      objc_msgSend(v66, "setAnchorPoint:forLayerID:", v4 + 72, GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
    }
LABEL_10:
  }
}

- (BOOL)isFrameBoundary
{
  v3.receiver = self;
  v3.super_class = (Class)DYMTLCommonFunctionPlayer;
  return [(DYMTLFunctionPlayer *)&v3 isFrameBoundary];
}

- (DYLayerManager)layerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerManager);
  return (DYLayerManager *)WeakRetained;
}

- (void)setLayerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layerManager);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_drawableRenderabilityStatusMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_drawableMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 1592) = 0u;
  *(_OWORD *)((char *)self + 1608) = 0u;
  *((_DWORD *)self + 406) = 1065353216;
  *((_OWORD *)self + 102) = 0u;
  *((_OWORD *)self + 103) = 0u;
  *((_DWORD *)self + 416) = 1065353216;
  return self;
}

@end