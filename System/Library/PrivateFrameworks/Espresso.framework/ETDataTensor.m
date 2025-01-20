@interface ETDataTensor
- (ETDataTensor)initWithBlobContainer:(shared_ptr<Espresso:(BOOL)a4 :abstract_blob_container>)a3 directBind:;
- (ETDataTensor)initWithBlobContainer:(shared_ptr<Espresso::abstract_blob_container>)a3;
- (ETDataTensor)initWithCVPixelBuffer:(__CVBuffer *)a3 imageParameters:(id)a4 error:(id *)a5;
- (ETDataTensor)initWithData:(void *)a3 type:(unint64_t)a4 shape:(id)a5 strides:(id)a6;
- (NSArray)dataArray;
- (NSArray)shape;
- (NSArray)strides;
- (NSNumber)maxNumberOfElements;
- (float_buffer_t)float_buffer;
- (id).cxx_construct;
- (id)description;
- (shared_ptr<Espresso::blob<float,)blob;
- (unint64_t)type;
- (vImage_Buffer)imageBuffer;
- (vector<std::shared_ptr<unsigned)allocatedImageData;
- (void)dataPointer;
- (void)setAllocatedImageData:(vector<std:(std::allocator<std::shared_ptr<unsigned char>>> *)a3 :shared_ptr<unsigned)char>;
- (void)setBlob:()shared_ptr<Espresso:(4>>)a3 :blob<float;
- (void)setDataArray:(id)a3;
- (void)setDataPointer:(void *)a3;
- (void)setFloat_buffer:(float_buffer_t *)a3;
- (void)setImageBuffer:(vImage_Buffer *)a3;
- (void)setMaxNumberOfElements:(id)a3;
- (void)setShape:(id)a3;
- (void)setStrides:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation ETDataTensor

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

- (void).cxx_destruct
{
  p_allocatedImageData = &self->_allocatedImageData;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_allocatedImageData);
  cntrl = self->_blob.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_maxNumberOfElements, 0);
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_shape, 0);

  objc_storeStrong((id *)&self->_dataArray, 0);
}

- (void)setBlob:()shared_ptr<Espresso:(4>>)a3 :blob<float
{
}

- (shared_ptr<Espresso::blob<float,)blob
{
  objc_copyCppObjectAtomic(v2, &self->_blob, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__53);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setFloat_buffer:(float_buffer_t *)a3
{
}

- (float_buffer_t)float_buffer
{
  objc_copyStruct(retstr, &self->_float_buffer, 24, 1, 0);
  return result;
}

- (void)setAllocatedImageData:(vector<std:(std::allocator<std::shared_ptr<unsigned char>>> *)a3 :shared_ptr<unsigned)char>
{
}

- (vector<std::shared_ptr<unsigned)allocatedImageData
{
  objc_copyCppObjectAtomic(retstr, &self->_allocatedImageData, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__11932);
  return result;
}

- (void)setImageBuffer:(vImage_Buffer *)a3
{
}

- (vImage_Buffer)imageBuffer
{
  objc_copyStruct(retstr, &self->_imageBuffer, 32, 1, 0);
  return result;
}

- (NSNumber)maxNumberOfElements
{
  return self->_maxNumberOfElements;
}

- (void)setStrides:(id)a3
{
}

- (NSArray)strides
{
  return self->_strides;
}

- (void)setShape:(id)a3
{
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setDataArray:(id)a3
{
}

- (void)setDataPointer:(void *)a3
{
  self->_dataPointer = a3;
}

- (NSArray)dataArray
{
  [(ETDataTensor *)self float_buffer];
  if (v8)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_float_buffer.size];
    if (self->_float_buffer.size)
    {
      unint64_t v5 = 0;
      do
      {
        *(float *)&double v4 = self->_float_buffer.ptr[v5];
        v6 = [NSNumber numberWithFloat:v4];
        [v3 setObject:v6 atIndexedSubscript:v5];

        ++v5;
      }
      while (self->_float_buffer.size > v5);
    }
  }
  else
  {
    [(ETDataTensor *)self blob];
    v3 = 0;
    if (v9) {
      nitro::nitro_function::nitro_function(v9);
    }
  }

  return (NSArray *)v3;
}

- (void)dataPointer
{
  [(ETDataTensor *)self float_buffer];
  if (v5) {
    return self->_float_buffer.ptr;
  }
  [(ETDataTensor *)self blob];
  if (v6) {
    nitro::nitro_function::nitro_function(v6);
  }
  return 0;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(ETDataTensor *)self dataArray];
  double v4 = [v3 description];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"\"" withString:&stru_1EE39BDB0];
  v6 = [v5 stringByReplacingOccurrencesOfString:@"\n    " withString:@" "];

  [(ETDataTensor *)self float_buffer];
  if (v14)
  {
    unint64_t size = self->_float_buffer.size;
  }
  else
  {
    [(ETDataTensor *)self blob];
    if (v15) {
      nitro::nitro_function::nitro_function(v15);
    }
    unint64_t size = 1;
  }
  uint64_t v8 = NSString;
  v9 = [(ETDataTensor *)self dataPointer];
  v10 = [(ETDataTensor *)self shape];
  v11 = [(ETDataTensor *)self strides];
  v12 = [v8 stringWithFormat:@"Tensor w/ data pointer: %p: data: %@. \nShape: %@, Strides: %@,Contiguous Size: %lu", v9, v6, v10, v11, size];

  return v12;
}

- (void)setMaxNumberOfElements:(id)a3
{
  self->_float_buffer.unint64_t size = [a3 unsignedIntegerValue];
}

- (ETDataTensor)initWithBlobContainer:(shared_ptr<Espresso::abstract_blob_container>)a3
{
  ptr = a3.__ptr_;
  uint64_t v5 = [ETDataTensor alloc];
  v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
  uint64_t v9 = *(void *)ptr;
  v10 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v7 = [(ETDataTensor *)v5 initWithBlobContainer:&v9 directBind:0];
  if (v10) {
    nitro::nitro_function::nitro_function(v10);
  }

  return v7;
}

- (ETDataTensor)initWithBlobContainer:(shared_ptr<Espresso:(BOOL)a4 :abstract_blob_container>)a3 directBind:
{
  int cntrl = (int)a3.__cntrl_;
  ptr = a3.__ptr_;
  v35[5] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)ETDataTensor;
  v6 = [(ETDataTensor *)&v34 init];
  if (!v6) {
    return v6;
  }
  v7 = *(unsigned int **)ptr;
  if (cntrl {
    && v7
  }
  {
    uint64_t v9 = v8;
    v10 = (std::__shared_weak_count *)*((void *)ptr + 1);
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v11 = (int *)*((void *)v9 + 20);
    if (v11)
    {
      v12 = (std::__shared_weak_count *)*((void *)v9 + 21);
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      v12 = 0;
    }
    if (v10) {
      nitro::nitro_function::nitro_function(v10);
    }
    v7 = *(unsigned int **)ptr;
    if (v11) {
      goto LABEL_19;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = (std::__shared_weak_count *)*((void *)ptr + 1);
  v32 = v7;
  v33 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::sync_copy_to_host(v30, &v32);
  uint64_t v14 = (std::__shared_weak_count *)*((void *)&v30[0] + 1);
  v11 = *(int **)&v30[0];
  v30[0] = 0uLL;
  if (v12)
  {
    nitro::nitro_function::nitro_function(v12);
    if (*((void *)&v30[0] + 1)) {
      nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v30[0] + 1));
    }
  }
  if (v33) {
    nitro::nitro_function::nitro_function(v33);
  }
  v7 = *(unsigned int **)ptr;
  v12 = v14;
LABEL_19:
  v15 = [NSNumber numberWithInt:v7[6]];
  v35[0] = v15;
  uint64_t v16 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)ptr + 20)];
  v35[1] = v16;
  v17 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)ptr + 16)];
  v35[2] = v17;
  v18 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)ptr + 12)];
  v35[3] = v18;
  v19 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)ptr + 8)];
  v35[4] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];

  uint64_t v21 = 0;
  memset(v30, 0, sizeof(v30));
  uint64_t v22 = 1;
  do
  {
    *((void *)v30 + v21) = (int)v22;
    v22 *= v11[v21++ + 2];
  }
  while (v21 != 4);
  uint64_t v31 = v22;
  v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  uint64_t v24 = 0;
  v25 = &v31;
  do
  {
    uint64_t v26 = *v25--;
    v27 = [NSNumber numberWithUnsignedLong:v26];
    [v23 setObject:v27 atIndexedSubscript:v24];

    ++v24;
  }
  while (v24 != 5);
  objc_storeStrong((id *)&v6->_shape, v20);
  objc_storeStrong((id *)&v6->_strides, v23);
  v6->_type = 2;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v28 = (std::__shared_weak_count *)v6->_blob.__cntrl_;
  v6->_blob.__ptr_ = v11;
  v6->_blob.__cntrl_ = (__shared_weak_count *)v12;
  if (v28) {
    nitro::nitro_function::nitro_function(v28);
  }

  if (v12) {
    nitro::nitro_function::nitro_function(v12);
  }
  return v6;
}

- (ETDataTensor)initWithCVPixelBuffer:(__CVBuffer *)a3 imageParameters:(id)a4 error:(id *)a5
{
  void (***v43)(uint64_t *__return_ptr, void);
  std::__shared_weak_count *v44;
  std::__shared_weak_count *v50;
  int *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  void *v63;
  std::__shared_weak_count *cntrl;
  void *v66;
  void *v67;
  std::__shared_weak_count *v68;
  id obj;
  _OWORD v70[2];
  uint64_t v71;
  void v72[5];
  std::__shared_weak_count *v73;
  vImage_Buffer v74;
  int v75;
  uint64_t v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  long long v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  int v87;
  uint64_t v88;
  std::__shared_weak_count *v89;
  uint8_t permuteMap[4];
  int height;
  int v92;
  uint64_t v93;
  int v94;
  long long v95;
  long long __p;
  uint64_t v97;
  uint64_t v98;
  std::__shared_weak_count *v99;
  void (***v100)(uint64_t *__return_ptr, void);
  std::__shared_weak_count *v101;
  long long v102;
  vImage_Buffer dest;
  objc_super v104;
  void v105[5];
  uint64_t v106;
  __CFString *v107;
  uint64_t v108;
  __CFString *v109;
  uint64_t v110;
  __CFString *v111;
  uint64_t v112;
  __CFString *v113;
  uint64_t v114;
  void v115[4];

  v115[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v104.receiver = self;
  v104.super_class = (Class)ETDataTensor;
  uint64_t v9 = [(ETDataTensor *)&v104 init];
  if (!v9)
  {
LABEL_55:
    v39 = v9;
    goto LABEL_56;
  }
  if (CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      v114 = *MEMORY[0x1E4F28568];
      v115[0] = @"Failed to lock pixel buffer";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:&v114 count:1];
      *a5 = [v10 errorWithDomain:@"EspressoError" code:1 userInfo:v11];
    }
    goto LABEL_24;
  }
  dest.width = CVPixelBufferGetWidth(a3);
  dest.height = CVPixelBufferGetHeight(a3);
  dest.rowBytes = CVPixelBufferGetBytesPerRow(a3);
  dest.data = CVPixelBufferGetBaseAddress(a3);
  if (v8)
  {
    v12 = [v8 objectForKeyedSubscript:@"scale"];
    if (!v12) {
      goto LABEL_20;
    }
    v13 = [v8 objectForKeyedSubscript:@"bias_r"];
    if (v13)
    {
      uint64_t v14 = [v8 objectForKeyedSubscript:@"bias_g"];
      if (v14)
      {
        v15 = [v8 objectForKeyedSubscript:@"bias_b"];
        if (v15)
        {
          uint64_t v16 = [v8 objectForKeyedSubscript:@"is_network_bgr"];
          BOOL v17 = v16 == 0;

          if (!v17)
          {
            v102 = 0uLL;
            v18 = [v8 objectForKeyedSubscript:@"scale"];
            [v18 floatValue];
            int v20 = v19;

            uint64_t v21 = [v8 objectForKeyedSubscript:@"bias_r"];
            [v21 floatValue];
            int v23 = v22;

            uint64_t v24 = [v8 objectForKeyedSubscript:@"bias_g"];
            [v24 floatValue];
            int v26 = v25;

            v27 = [v8 objectForKeyedSubscript:@"bias_b"];
            [v27 floatValue];
            int v29 = v28;

            v30 = [v8 objectForKeyedSubscript:@"is_network_bgr"];
            int v31 = [v30 BOOLValue];

            OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
            if (CVPixelBufferIsPlanar(a3))
            {
              if (a5)
              {
                v33 = (void *)MEMORY[0x1E4F28C58];
                v108 = *MEMORY[0x1E4F28568];
                v109 = @"CVPixelBuffer provided must be of an interleaved pixel format (must not be planar)";
                objc_super v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
                *a5 = [v33 errorWithDomain:@"EspressoError" code:1 userInfo:v34];
              }
              goto LABEL_23;
            }
            switch(PixelFormatType)
            {
              case 0x20u:
                *(_DWORD *)permuteMap = 66051;
                vImagePermuteChannels_ARGB8888(&dest, &dest, permuteMap, 0);
                break;
              case 0x42475241u:
                break;
              case 0x4C303038u:
                int v31 = 0;
                int v40 = 1;
                int v41 = 1;
                goto LABEL_31;
              default:
                if (a5)
                {
                  v66 = (void *)MEMORY[0x1E4F28C58];
                  v106 = *MEMORY[0x1E4F28568];
                  v107 = @"CVPixelBuffer must be one of: kCVPixelFormatType_OneComponent8, kCVPixelFormatType_32ARGB, kCVPixelFormatType_32BGRA";
                  v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
                  *a5 = [v66 errorWithDomain:@"EspressoError" code:1 userInfo:v67];
                }
                goto LABEL_23;
            }
            int v41 = 4;
            int v40 = 3;
LABEL_31:
            *(_DWORD *)permuteMap = 0;
            Espresso::create_context((int *)permuteMap, &v100);
            std::allocate_shared[abi:ne180100]<Espresso::blob_cpu,std::allocator<Espresso::blob_cpu>,std::shared_ptr<Espresso::abstract_context> &,Espresso::compute_path,void>(&v98, &v100, 0);
            v97 = 0;
            v95 = 0u;
            __p = 0u;
            *(_DWORD *)permuteMap = dest.width;
            height = dest.height;
            v93 = 0x100000001;
            v92 = v40;
            v94 = -1;
            uint64_t v42 = v98;
            v88 = 0;
            v89 = 0;
            (*(void (**)(uint64_t, uint8_t *, uint64_t *))(*(void *)v98 + 16))(v98, permuteMap, &v88);
            if (v89) {
              nitro::nitro_function::nitro_function(v89);
            }
            v44 = v99;
            v43 = v100;
            v72[0] = MEMORY[0x1E4F143A8];
            v72[1] = 3321888768;
            v72[2] = __60__ETDataTensor_initWithCVPixelBuffer_imageParameters_error___block_invoke;
            v72[3] = &__block_descriptor_164_ea8_32c46_ZTSNSt3__110shared_ptrIN8Espresso8blob_cpuEEE_e10_v16__0r_v8l;
            v72[4] = v42;
            v73 = v99;
            if (v99) {
              atomic_fetch_add_explicit(&v99->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            v74 = dest;
            v75 = v20;
            v76 = 0x100000000;
            v77 = v31;
            v78 = v23;
            v79 = v26;
            v80 = v29;
            v81 = 0;
            v82 = v102;
            __asm { FMOV            V0.2S, #1.0 }
            v83 = _D0;
            v84 = 0;
            v85 = 0;
            v87 = v41;
            v86 = 0;
            Espresso::abstract_context::compute_batch_sync(v43, v72);
            v51 = *(int **)(v42 + 160);
            v50 = *(std::__shared_weak_count **)(v42 + 168);
            if (v50) {
              atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            CVPixelBufferUnlockBaseAddress(a3, 1uLL);
            v52 = [NSNumber numberWithInt:*(unsigned int *)(v42 + 24)];
            v68 = v44;
            v105[0] = v52;
            v53 = [NSNumber numberWithInt:*(unsigned int *)(v42 + 20)];
            v105[1] = v53;
            v54 = [NSNumber numberWithInt:*(unsigned int *)(v42 + 16)];
            v105[2] = v54;
            v55 = [NSNumber numberWithInt:*(unsigned int *)(v42 + 12)];
            v105[3] = v55;
            v56 = [NSNumber numberWithInt:*(unsigned int *)(v42 + 8)];
            v105[4] = v56;
            obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:5];

            v57 = 0;
            memset(v70, 0, sizeof(v70));
            v58 = 1;
            do
            {
              *((void *)v70 + v57) = (int)v58;
              v58 *= v51[v57++ + 2];
            }
            while (v57 != 4);
            v71 = v58;
            v59 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
            v60 = 0;
            v61 = &v71;
            do
            {
              v62 = *v61--;
              v63 = [NSNumber numberWithUnsignedLong:v62];
              [v59 setObject:v63 atIndexedSubscript:v60];

              ++v60;
            }
            while (v60 != 5);
            objc_storeStrong((id *)&v9->_shape, obj);
            objc_storeStrong((id *)&v9->_strides, v59);
            v9->_type = 2;
            if (v50) {
              atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            int cntrl = (std::__shared_weak_count *)v9->_blob.__cntrl_;
            v9->_blob.__ptr_ = v51;
            v9->_blob.__cntrl_ = (__shared_weak_count *)v50;
            if (cntrl) {
              nitro::nitro_function::nitro_function(cntrl);
            }

            if (v50) {
              nitro::nitro_function::nitro_function(v50);
            }
            if (v73) {
              nitro::nitro_function::nitro_function(v73);
            }
            if ((void)__p)
            {
              *((void *)&__p + 1) = __p;
              operator delete((void *)__p);
            }
            if (v68) {
              nitro::nitro_function::nitro_function(v68);
            }
            if (v101) {
              nitro::nitro_function::nitro_function(v101);
            }
            goto LABEL_55;
          }
LABEL_20:
          if (a5)
          {
            v38 = (void *)MEMORY[0x1E4F28C58];
            v110 = *MEMORY[0x1E4F28568];
            v111 = @"Failed to find one or more of the following pre-processing params by key (each is required): scale, bias_r, bias_g, bias_b, network_wants_bgr.";
            v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
            v37 = [v38 errorWithDomain:@"EspressoError" code:1 userInfo:v36];
            goto LABEL_22;
          }
          goto LABEL_23;
        }
      }
    }

    goto LABEL_20;
  }
  if (a5)
  {
    v35 = (void *)MEMORY[0x1E4F28C58];
    v112 = *MEMORY[0x1E4F28568];
    v113 = @"Failed to find preprocessing parameters for image, must specify: scale, R,G,B biases, and whether the network's input is expecting BGR color interleaving.";
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
    v37 = [v35 errorWithDomain:@"EspressoError" code:1 userInfo:v36];
LABEL_22:
    *a5 = v37;
  }
LABEL_23:
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
LABEL_24:
  v39 = 0;
LABEL_56:

  return v39;
}

void __60__ETDataTensor_initWithCVPixelBuffer_imageParameters_error___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = *(int **)(a1 + 32);
  uint64_t v5 = operator new(0x20uLL);
  uint64_t v9 = v5 + 2;
  v10 = v5 + 2;
  long long v6 = *(_OWORD *)(a1 + 64);
  *uint64_t v5 = *(_OWORD *)(a1 + 48);
  v5[1] = v6;
  __p = v5;
  Espresso::fill_blob_with_images_batch_safe_v2(a2, v4, (const char ***)&__p, *(unsigned int *)(a1 + 160), v7, (__n128 *)(a1 + 80));
  if (__p)
  {
    uint64_t v9 = __p;
    operator delete(__p);
  }
}

- (ETDataTensor)initWithData:(void *)a3 type:(unint64_t)a4 shape:(id)a5 strides:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ETDataTensor;
  v13 = [(ETDataTensor *)&v26 init];
  uint64_t v14 = v13;
  if (!v13)
  {
LABEL_14:
    int v20 = v14;
    goto LABEL_15;
  }
  v13->_type = a4;
  objc_storeStrong((id *)&v13->_shape, a5);
  objc_storeStrong((id *)&v14->_strides, a6);
  if (a4 == 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v23;
      uint64_t v18 = 1;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v15);
          }
          v18 *= objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "unsignedIntegerValue", (void)v22);
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v16);
    }
    else
    {
      uint64_t v18 = 1;
    }

    v14->_float_buffer.ptr = (float *)a3;
    v14->_float_buffer.unint64_t size = v18;
    v14->_float_buffer.free_when_done = 0;
    goto LABEL_14;
  }
  int v20 = 0;
LABEL_15:

  return v20;
}

@end