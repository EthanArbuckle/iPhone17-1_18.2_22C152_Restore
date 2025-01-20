@interface TwoNetsStyleTransfer
+ (BOOL)supportsANE;
- (TwoNetsStyleTransfer)init;
- (__IOSurface)executeSyncWithImage:(__CVBuffer *)a3 smallImage:(__CVBuffer *)a4;
- (id).cxx_construct;
- (int)heightBig;
- (int)heightSmall;
- (int)load:(id)a3 outputName:(id)a4;
- (int)widthBig;
- (int)widthSmall;
- (void)dealloc;
@end

@implementation TwoNetsStyleTransfer

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0uLL;
  *((void *)self + 7) = 0;
  *((void *)self + 46) = 0x3F8000003DA3D70ALL;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((void *)self + 35) = 0x3E99999A00000000;
  *((void *)self + 36) = 0;
  *((_DWORD *)self + 78) = 0;
  *((_DWORD *)self + 91) = 960;
  *((_DWORD *)self + 94) = 0;
  *((unsigned char *)self + 404) = 0;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 296) = xmmword_192DCA2A0;
  *(_OWORD *)((char *)self + 316) = xmmword_192DCA2B0;
  *(_OWORD *)((char *)self + 332) = xmmword_192DCA2C0;
  *(_OWORD *)((char *)self + 348) = xmmword_192DCA2D0;
  *(_OWORD *)((char *)self + 380) = xmmword_192DCA2E0;
  *(void *)((char *)self + 396) = 0x3F8000003F79999ALL;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anon_110[120], 0);
  if (*((char *)&self->current_postprocessing_settings.name.__r_.var1 + 3) < 0) {
    operator delete((void *)self->current_postprocessing_settings.name.__r_.__value_.var0.__l.__size_);
  }
  if (self->current_postprocessing_settings.name.__r_.__value_.var0.__s.__data_[7] < 0) {
    operator delete((void *)self->dim_data2__small[4]);
  }
  if (*((char *)&self->output_layer_name.__r_.__value_.var0.__l + 23) < 0)
  {
    data = self->output_layer_name.__r_.__value_.var0.__l.__data_;
    operator delete(data);
  }
}

- (__IOSurface)executeSyncWithImage:(__CVBuffer *)a3 smallImage:(__CVBuffer *)a4
{
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v34, (_opaque_pthread_mutex_t *)a2);
  p_output_layer_name = &self->output_layer_name;
  if (*((char *)&self->output_layer_name.__r_.__value_.var0.__l + 23) < 0) {
    p_output_layer_name = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_output_layer_name->__r_.__value_.var0.__l.__data_;
  }
  espresso_network_bind_buffer((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)p_output_layer_name, (uint64_t)v33, 0x20000, 0x10000, 0x80000);
  CVPixelBufferLockBaseAddress(a3, 0);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  plan = (uint64_t *)self->net.plan;
  uint64_t v13 = *(void *)&self->net.network_index;
  v32[0] = BaseAddress;
  v32[1] = Height;
  v32[2] = Width;
  v32[3] = BytesPerRow;
  if (espresso_network_bind_input_vimagebuffer_bgra8(plan, v13, (uint64_t)"data0", 0, (uint64_t)v32, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "input binding for data0 failed.");
    goto LABEL_11;
  }
  v14 = (uint64_t *)self->net.plan;
  uint64_t v15 = *(void *)&self->net.network_index;
  v31[0] = BaseAddress;
  v31[1] = Height;
  v31[2] = Width;
  v31[3] = BytesPerRow;
  if (espresso_network_bind_input_vimagebuffer_bgra8(v14, v15, (uint64_t)"data2", 0, (uint64_t)v31, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "input binding for data2 failed.");
LABEL_11:
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  CVPixelBufferLockBaseAddress(a4, 0);
  size_t v16 = CVPixelBufferGetWidth(a4);
  size_t v17 = CVPixelBufferGetHeight(a4);
  size_t v18 = CVPixelBufferGetBytesPerRow(a4);
  v19 = CVPixelBufferGetBaseAddress(a4);
  v20 = (uint64_t *)self->net.plan;
  uint64_t v21 = *(void *)&self->net.network_index;
  v30[0] = v19;
  v30[1] = v17;
  v30[2] = v16;
  v30[3] = v18;
  if (espresso_network_bind_input_vimagebuffer_bgra8(v20, v21, (uint64_t)"data0__small", 0, (uint64_t)v30, 0))
  {
    v28 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v28, "input binding for data0__small failed.");
    goto LABEL_15;
  }
  v22 = (uint64_t *)self->net.plan;
  uint64_t v23 = *(void *)&self->net.network_index;
  v29[0] = v19;
  v29[1] = v17;
  v29[2] = v16;
  v29[3] = v18;
  if (espresso_network_bind_input_vimagebuffer_bgra8(v22, v23, (uint64_t)"data2__small", 0, (uint64_t)v29, 0))
  {
    v28 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v28, "input binding for data2__small failed.");
    goto LABEL_15;
  }
  int v24 = espresso_plan_execute_sync((uint64_t *)self->plan);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  CVPixelBufferUnlockBaseAddress(a4, 0);
  if (v24)
  {
    v28 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v28, "plan execution failed...");
LABEL_15:
    __cxa_throw(v28, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  v25 = (__IOSurface *)v33[0];
  self->dim_data2__small[3] = v33[0];
  pthread_mutex_locker::~pthread_mutex_locker(&v34);
  return v25;
}

- (void)dealloc
{
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v5, (_opaque_pthread_mutex_t *)a2);
  plan = self->plan;
  if (plan) {
    espresso_plan_destroy((std::string::size_type)plan);
  }
  espresso_context_destroy((void *)self->ctx);
  pthread_mutex_locker::~pthread_mutex_locker(&v5);
  v4.receiver = self;
  v4.super_class = (Class)TwoNetsStyleTransfer;
  [(TwoNetsStyleTransfer *)&v4 dealloc];
}

- (int)heightBig
{
  return self->output_layer_name.var0;
}

- (int)heightSmall
{
  return self->dim_data0[4];
}

- (int)widthBig
{
  return self->output_layer_name.__r_.var0;
}

- (int)widthSmall
{
  return self->dim_data0[3];
}

- (int)load:(id)a3 outputName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v17, v9);
  id v10 = v8;
  MEMORY[0x192FF0F50](&self->output_layer_name, [v10 UTF8String]);
  objc_storeStrong((id *)&self->_anon_110[120], a3);
  plan = self->plan;
  if (plan) {
    espresso_plan_destroy((std::string::size_type)plan);
  }
  ctx = self->ctx;
  if (ctx) {
    espresso_context_destroy(ctx);
  }
  context = (void *)espresso_create_context(0x2717u, -1);
  self->ctx = context;
  espresso_context_set_low_precision_accumulation((uint64_t **)context, 1);
  v14 = (unsigned char *)espresso_create_plan((void *)self->ctx, 0);
  self->plan = v14;
  if (v14)
  {
    int blob_dimensions = espresso_plan_add_network(v14, (char *)[v7 UTF8String], 65552, (uint64_t)&self->net);
    if (!blob_dimensions)
    {
      int blob_dimensions = espresso_plan_build((uint64_t *)self->plan);
      if (!blob_dimensions)
      {
        int blob_dimensions = espresso_network_query_blob_dimensions((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data0", (uint64_t)&self->output_layer_name.__r_.var0);
        if (!blob_dimensions)
        {
          int blob_dimensions = espresso_network_query_blob_dimensions((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data2", (uint64_t)&self->dim_data0__small[3]);
          if (!blob_dimensions)
          {
            int blob_dimensions = espresso_network_query_blob_dimensions((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data0__small", (uint64_t)&self->dim_data0[3]);
            if (!blob_dimensions)
            {
              int blob_dimensions = espresso_network_query_blob_dimensions((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data2__small", (uint64_t)&self->dim_data2[3]);
              if (!blob_dimensions)
              {
                if (*(void *)&self->output_layer_name.__r_.var0 == self->dim_data0__small[3]
                  && self->output_layer_name.var0 == self->dim_data0__small[4]
                  && self->dim_data0[0] == self->dim_data2[0]
                  && self->dim_data0[1] == self->dim_data2[1]
                  && self->dim_data0[2] == self->dim_data2[2]
                  && self->dim_data0[3] == self->dim_data2[3]
                  && self->dim_data0[4] == self->dim_data2[4]
                  && self->dim_data0__small[0] == self->dim_data2__small[0])
                {
                  int blob_dimensions = -7;
                  if (self->dim_data0__small[1] == self->dim_data2__small[1])
                  {
                    if (self->dim_data0__small[2] == self->dim_data2__small[2]) {
                      int blob_dimensions = 0;
                    }
                    else {
                      int blob_dimensions = -7;
                    }
                  }
                }
                else
                {
                  int blob_dimensions = -7;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    int blob_dimensions = -1;
  }
  pthread_mutex_locker::~pthread_mutex_locker(&v17);

  return blob_dimensions;
}

- (TwoNetsStyleTransfer)init
{
  v9.receiver = self;
  v9.super_class = (Class)TwoNetsStyleTransfer;
  v2 = [(TwoNetsStyleTransfer *)&v9 init];
  BOOL v3 = Espresso::hardware::supports_platform(10006);
  if (!v3)
  {
    v6 = Espresso::espresso_os_log_subsystem((Espresso *)v3, v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1920CB000, v6, OS_LOG_TYPE_ERROR, "Hardware does not support ANE_RUNTIME - cannot use TwoNetsStyleTransfer", v8, 2u);
    }

    goto LABEL_7;
  }
  if (!v2)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v5 = v2;
LABEL_8:

  return v5;
}

+ (BOOL)supportsANE
{
  return Espresso::hardware::supports_platform(10006);
}

@end