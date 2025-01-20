@interface MLMultiArray
+ (BOOL)getShapeOfArrayOfSameLengthArrays:(id)a3 numberOfRows:(unint64_t *)a4 numberOfColumns:(unint64_t *)a5 error:(id *)a6;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateMultiArrays:(id)a3 forConcatenatingAlongAxis:(int64_t)a4 normalizedAxis:(unint64_t *)a5 reason:(id *)a6;
+ (BOOL)validateNestedArray:(id)a3 error:(id *)a4;
+ (MLMultiArray)multiArrayByConcatenatingMultiArrays:(NSArray *)multiArrays alongAxis:(NSInteger)axis dataType:(MLMultiArrayDataType)dataType;
+ (__CVBuffer)pixelBufferBGRA8FromMultiArrayCHW:(id)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5;
+ (__CVBuffer)pixelBufferGray16HalfFromMultiArrayHW:(id)a3 error:(id *)a4;
+ (__CVBuffer)pixelBufferGray8FromMultiArrayHW:(id)a3 error:(id *)a4;
+ (id)_multiArrayByConcatenatingMultiArrays:(id)a3 alongAxis:(int64_t)a4 dataType:(int64_t)a5;
+ (id)_shapeOfNestedArray:(id)a3 error:(id *)a4;
+ (id)doubleMatrixWithValues:(id)a3 error:(id *)a4;
+ (id)doubleMultiArrayWithCopyOfMultiArray:(id)a3;
+ (id)doubleMultiArrayWithShape:(id)a3 valueArray:(id)a4 error:(id *)a5;
+ (id)doubleVectorWithValues:(id)a3;
+ (id)float32MatrixWithValues:(id)a3 error:(id *)a4;
+ (id)multiArrayOwningBufferObjectOfPort:(e5rt_io_port *)a3 error:(id *)a4;
+ (id)newMultiArrayForState:(id)a3 strides:(id)a4 dtype:(int64_t)a5 error:(id *)a6;
+ (id)stringForDataType:(int64_t)a3;
+ (int)cppStorageOrder:(int64_t)a3;
- (BOOL)backingPixelBufferWasLocked;
- (BOOL)copyIntoMultiArray:(id)a3 error:(id *)a4;
- (BOOL)fillWithNumber:(id)a3;
- (BOOL)isContiguous;
- (BOOL)isContiguousInOrder:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMultiArray:(id)a3;
- (BOOL)renderTo32BGRAPixelBuffer:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5;
- (BOOL)renderToCVPixelBuffer:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5;
- (BOOL)renderToOneComponent16HalfPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)renderToOneComponent8PixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)setRangeWithRawData:(id)a3 destIndex:(unint64_t)a4 error:(id *)a5;
- (BOOL)vectorizeIntoMultiArray:(id)a3 storageOrder:(int64_t)a4 error:(id *)a5;
- (CVPixelBufferRef)pixelBuffer;
- (MLMultiArray)init;
- (MLMultiArray)initWithArray:(id)a3 dataType:(int64_t)a4;
- (MLMultiArray)initWithBytesNoCopy:(void *)a3 shape:(id)a4 dataType:(int64_t)a5 strides:(id)a6 deallocator:(id)a7 mutableShapedBufferProvider:(id)a8 error:(id *)a9;
- (MLMultiArray)initWithBytesNoCopy:(void *)a3 shape:(id)a4 dataType:(int64_t)a5 strides:(id)a6 mutableShapedBufferProvider:(id)a7;
- (MLMultiArray)initWithCoder:(id)a3;
- (MLMultiArray)initWithDataPointer:(void *)dataPointer shape:(NSArray *)shape dataType:(MLMultiArrayDataType)dataType strides:(NSArray *)strides deallocator:(void *)deallocator error:(NSError *)error;
- (MLMultiArray)initWithMultiArrayBuffer:(shared_ptr<CoreML:(id)a4 :MultiArrayBuffer>)a3 mutableShapedBufferProvider:;
- (MLMultiArray)initWithMultiArrayBuffer:(shared_ptr<CoreML::MultiArrayBuffer>)a3;
- (MLMultiArray)initWithPixelBuffer:(CVPixelBufferRef)pixelBuffer shape:(NSArray *)shape;
- (MLMultiArray)initWithPixelBuffer:(__CVBuffer *)a3 shape:(id)a4 strides:(id)a5;
- (MLMultiArray)initWithPixelBuffer:(__CVBuffer *)a3 shape:(id)a4 strides:(id)a5 mutableShapedBufferProvider:(id)a6;
- (MLMultiArray)initWithScalars:(id)a3 shape:(id)a4 dataType:(int64_t)a5;
- (MLMultiArray)initWithShape:(NSArray *)shape dataType:(MLMultiArrayDataType)dataType error:(NSError *)error;
- (MLMultiArray)initWithShape:(id)a3 dataType:(int64_t)a4 storageOrder:(int64_t)a5 bufferAlignment:(unint64_t)a6;
- (MLMultiArray)initWithShape:(id)a3 dataType:(int64_t)a4 storageOrder:(int64_t)a5 error:(id *)a6;
- (MLMultiArray)initWithShape:(id)a3 dataType:(int64_t)a4 strides:(id)a5;
- (MLMultiArrayDataType)dataType;
- (NSArray)shape;
- (NSArray)strides;
- (NSInteger)count;
- (NSNumber)objectAtIndexedSubscript:(NSInteger)idx;
- (NSNumber)objectForKeyedSubscript:(NSArray *)key;
- (const)bytes;
- (double)doublePointer;
- (float)float32Pointer;
- (id).cxx_construct;
- (id)description;
- (id)multiArrayViewExpandingDimensionsAtAxis:(int64_t)a3;
- (id)numberArray;
- (id)numberAtOffset:(unint64_t)a3;
- (id)sliceAtOrigin:(id)a3 shape:(id)a4 squeeze:(BOOL)a5 error:(id *)a6;
- (id)squeeze;
- (id)squeezeDimensions:(id)a3 error:(id *)a4;
- (uint64_t)initWithBytesNoCopy:(uint64_t)a1 shape:(uint64_t)a2 dataType:strides:deallocator:mutableShapedBufferProvider:error:;
- (unint64_t)numberOfBytesPerElement;
- (unint64_t)offsetForKeyedSubscript:(id)a3;
- (void)dataPointer;
- (void)encodeWithCoder:(id)a3;
- (void)getBytesWithHandler:(void *)handler;
- (void)getContiguousFirstMajorFloat32BufferWithHandler:(id)a3;
- (void)getMutableBytesWithHandler:(void *)handler;
- (void)initWithBytesNoCopy:(uint64_t)a1 shape:dataType:strides:deallocator:mutableShapedBufferProvider:error:;
- (void)multiArrayBuffer;
- (void)mutableBytes;
- (void)setNumber:(id)a3 atOffset:(unint64_t)a4;
- (void)setObject:(NSNumber *)obj atIndexedSubscript:(NSInteger)idx;
- (void)setObject:(NSNumber *)obj forKeyedSubscript:(NSArray *)key;
- (void)transferToMultiArray:(id)a3;
@end

@implementation MLMultiArray

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  value = self->_storageManager.__ptr_.__value_;
  self->_storageManager.__ptr_.__value_ = 0;
  if (value)
  {
    std::default_delete<StorageManager>::operator()[abi:ne180100]((uint64_t)value);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MLMultiArray)initWithCoder:(id)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 decodeIntForKey:@"dataType"];
  v6 = operator new(0x30uLL);
  uint64_t v7 = 0;
  uint64_t v8 = v5;
  _OWORD *v6 = xmmword_19EC7BC20;
  v6[1] = unk_19EC7BC30;
  v6[2] = xmmword_19EC7BC40;
  v9 = (char *)(v6 + 3);
  while (*((void *)v6 + v7) != v5)
  {
    if (++v7 == 6) {
      goto LABEL_6;
    }
  }
  v9 = (char *)v6 + 8 * v7;
LABEL_6:
  int64_t v10 = v9 - (char *)v6;
  operator delete(v6);
  if (v10 != 48)
  {
    size_t size = 0;
    id v13 = v4;
    v14 = (const void *)[v13 decodeBytesForKey:@"dataPointer" returnedLength:&size];
    if (!v14 || !size)
    {
      v15 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "Failed to unarchive dataPointer.", buf, 2u);
      }
      v12 = 0;
      goto LABEL_35;
    }
    v15 = [v13 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"shape"];
    v16 = [v13 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"strides"];
    if ([v15 count])
    {
      uint64_t v17 = [v15 count];
      if (v17 == [v16 count])
      {
        if (v18 == size)
        {
          if (![v13 decodeBoolForKey:@"isBackedByPixelBuffer"])
          {
            v25 = malloc_type_malloc(size, 0x92E080AFuLL);
            memcpy(v25, v14, size);
            self = [(MLMultiArray *)self initWithDataPointer:v25 shape:v15 dataType:v8 strides:v16 deallocator:&__block_literal_global_2415 error:0];
            v12 = self;
            goto LABEL_34;
          }
          if (v5 == 65552)
          {
            CVPixelBufferRef pixelBufferOut = 0;
            uint64_t v50 = *MEMORY[0x1E4F24D20];
            v51[0] = MEMORY[0x1E4F1CC08];
            CFDictionaryRef v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            uint64_t v49 = 1;
            uint64_t v40 = 0;
            v41 = &v40;
            uint64_t v42 = 0x2020000000;
            uint64_t v43 = 1;
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __30__MLMultiArray_initWithCoder___block_invoke;
            v36[3] = &unk_1E59A3DA8;
            v20 = v15;
            v37 = v20;
            v38 = buf;
            v39 = &v40;
            [v20 enumerateObjectsUsingBlock:v36];
            CVReturn v21 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(void *)(*(void *)&buf[8] + 24), v41[3], 0x4C303068u, v19, &pixelBufferOut);
            if (v21)
            {
              v22 = +[MLLogging coreChannel];
              if (os_log_type_enabled(&v22->super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v46 = 67109120;
                LODWORD(v47) = v21;
                _os_log_error_impl(&dword_19E58B000, &v22->super, OS_LOG_TYPE_ERROR, "CVPixelBufferCreate failed with error code: %d", v46, 8u);
              }
              v12 = 0;
            }
            else
            {
              v22 = [(MLMultiArray *)self initWithPixelBuffer:pixelBufferOut shape:v20];
              CVPixelBufferRelease(pixelBufferOut);
              v29 = [[MLMultiArray alloc] initWithDataPointer:v14 shape:v20 dataType:65552 strides:v16 deallocator:0 error:0];
              id v35 = 0;
              BOOL v30 = [(MLMultiArray *)v29 copyIntoMultiArray:v22 error:&v35];
              id v31 = v35;
              if (v30)
              {
                v12 = v22;
              }
              else
              {
                v32 = +[MLLogging coreChannel];
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v34 = [v31 code];
                  *(_DWORD *)v46 = 134217984;
                  uint64_t v47 = v34;
                  _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "copyIntoMultiArray failed decoding MLMultiArray backed by a CVPixelBuffer. Code: %ld", v46, 0xCu);
                }

                v12 = 0;
              }

              self = v22;
            }

            _Block_object_dispose(&v40, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_34;
          }
          v26 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v33 = +[MLMultiArrayUtils stringForDataType:v8];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v33;
            _os_log_error_impl(&dword_19E58B000, v26, OS_LOG_TYPE_ERROR, "Invalid dataType decoding MLMultiArray backed by a CVPixelBuffer. %@", buf, 0xCu);
          }
LABEL_33:
          v12 = 0;
LABEL_34:

LABEL_35:
          goto LABEL_36;
        }
        v23 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = size;
          _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "dataPointer should be a buffer of size %zu but the unarchived buffer has size of %zu.", buf, 0x16u);
        }
      }
      else
      {
        v23 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = [v15 count];
          uint64_t v28 = [v16 count];
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v28;
          _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "shape's dimensions (%tu) is different from strides' dimensions (%tu).", buf, 0x16u);
        }
      }
    }
    else
    {
      v23 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "shape's dimensions is zero.", buf, 2u);
      }
    }

    goto LABEL_33;
  }
  v11 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v5;
    _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "dataType %zd is not supported.", buf, 0xCu);
  }

  v12 = 0;
LABEL_36:

  return v12;
}

- (MLMultiArray)initWithShape:(id)a3 dataType:(int64_t)a4 storageOrder:(int64_t)a5 error:(id *)a6
{
  int v7 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MLMultiArray;
  v11 = [(MLMultiArray *)&v17 init];
  if (v11)
  {
    objc_storeStrong((id *)&v11->_shape, a3);
    int v12 = +[MLMultiArray cppStorageOrder:a5];
    id v13 = operator new(0x88uLL);
    v13[1] = 0;
    v13[2] = 0;
    *id v13 = &unk_1EF0DD7A0;
    CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)(v13 + 3), (unint64_t **)__p, v7, v12, 1uLL);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    operator new();
  }
  v14 = (MLMultiArray *)0;

  return v14;
}

+ (int)cppStorageOrder:(int64_t)a3
{
  return a3 != 0;
}

- (NSNumber)objectAtIndexedSubscript:(NSInteger)idx
{
  StorageManager::storage((StorageManager *)&v8, (uint64_t)self->_storageManager.__ptr_.__value_);
  uint64_t v5 = CoreML::MultiArrayBuffer::offsetForIndex(v8, idx);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  v6 = [(MLMultiArray *)self numberAtOffset:v5];

  return (NSNumber *)v6;
}

- (void)setObject:(NSNumber *)obj atIndexedSubscript:(NSInteger)idx
{
  int v7 = obj;
  StorageManager::mutableStorage((StorageManager *)&v8, (uint64_t)self->_storageManager.__ptr_.__value_);
  uint64_t v6 = CoreML::MultiArrayBuffer::offsetForIndex(v8, idx);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  [(MLMultiArray *)self setNumber:v7 atOffset:v6];
}

- (void)setNumber:(id)a3 atOffset:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__MLMultiArray_setNumber_atOffset___block_invoke;
  v8[3] = &unk_1E59A3AC8;
  id v9 = v6;
  unint64_t v10 = a4;
  v8[4] = self;
  id v7 = v6;
  [(MLMultiArray *)self getMutableBytesWithHandler:v8];
}

- (void)getMutableBytesWithHandler:(void *)handler
{
  id v4 = handler;
  StorageManager::mutableStorage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  uint64_t v5 = v10;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__MLMultiArray_ScopedBufferAccess__getMutableBytesWithHandler___block_invoke;
  v8[3] = &unk_1E59A3B60;
  id v6 = v4;
  v8[4] = self;
  id v9 = v6;
  id v7 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___ZN6CoreML16MultiArrayBuffer26getMutableBytesWithHandlerEU13block_pointerFvPvmE_block_invoke;
  v12[3] = &unk_1E59A3B38;
  id v13 = v7;
  CoreML::MultiArrayBuffer::getBytesWithHandler(v5, v12);

  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

void __63__MLMultiArray_ScopedBufferAccess__getMutableBytesWithHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) strides];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, a2, a3);
}

uint64_t __35__MLMultiArray_setNumber_atOffset___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = [*(id *)(a1 + 32) numberOfBytesPerElement];
  unint64_t v7 = *(void *)(a1 + 48);
  if (!is_mul_ok(v6, v7) || v6 * v7 >= a3) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Could not store NSNumber at offset %zu because it is beyond the end of the multi array.", *(void *)(a1 + 48));
  }
  uint64_t result = [*(id *)(a1 + 32) dataType];
  if (result > 65599)
  {
    if (result == 65600)
    {
      uint64_t result = [*(id *)(a1 + 40) doubleValue];
      *(void *)(a2 + 8 * *(void *)(a1 + 48)) = v15;
    }
    else if (result == 131104)
    {
      uint64_t result = [*(id *)(a1 + 40) intValue];
      *(_DWORD *)(a2 + 4 * *(void *)(a1 + 48)) = result;
    }
  }
  else if (result == 65552)
  {
    uint64_t result = [*(id *)(a1 + 40) floatValue];
    __asm { FCVT            H0, S0 }
    *(_WORD *)(a2 + 2 * *(void *)(a1 + 48)) = _S0;
  }
  else if (result == 65568)
  {
    uint64_t result = [*(id *)(a1 + 40) floatValue];
    *(_DWORD *)(a2 + 4 * *(void *)(a1 + 48)) = v9;
  }
  return result;
}

- (unint64_t)numberOfBytesPerElement
{
  StorageManager::storage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  int v2 = *(_DWORD *)(v4 + 72);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return (unsigned __int16)v2 >> 3;
}

- (MLMultiArrayDataType)dataType
{
  StorageManager::storage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  int v2 = *(_DWORD *)(v4 + 72);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  MLMultiArrayDataType result = MLMultiArrayDataTypeFloat16;
  if (v2 != 65552)
  {
    if (v2 == 65600)
    {
      return 65600;
    }
    else if (v2 == 131104)
    {
      return 131104;
    }
    else
    {
      return 65568;
    }
  }
  return result;
}

- (NSArray)strides
{
  value = self->_storageManager.__ptr_.__value_;
  if (*((void *)value + 3) && (unsigned __int8 v3 = atomic_load((unsigned __int8 *)value), (v3 & 1) != 0))
  {
    uint64_t v5 = (os_unfair_lock_s *)((char *)value + 4);
    os_unfair_lock_lock((os_unfair_lock_t)value + 1);
    id v4 = *((id *)value + 4);
    os_unfair_lock_unlock(v5);
  }
  else
  {
    id v4 = *((id *)value + 4);
  }

  return (NSArray *)v4;
}

- (MLMultiArray)initWithBytesNoCopy:(void *)a3 shape:(id)a4 dataType:(int64_t)a5 strides:(id)a6 deallocator:(id)a7 mutableShapedBufferProvider:(id)a8 error:(id *)a9
{
  v22[3] = *(void **)MEMORY[0x1E4F143B8];
  id v19 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)MLMultiArray;
  objc_super v17 = [(MLMultiArray *)&v21 init];
  if (v17)
  {
    MEMORY[0x19F3C29E0]();
    objc_storeStrong((id *)&v17->_shape, a4);
    _Block_copy(v15);
    operator new();
  }

  return 0;
}

- (void)initWithBytesNoCopy:(uint64_t)a1 shape:dataType:strides:deallocator:mutableShapedBufferProvider:error:
{
  std::__shared_weak_count::~__shared_weak_count((std::__shared_weak_count *)a1);

  JUMPOUT(0x19F3C1920);
}

{
  uint64_t vars8;

  std::__shared_weak_count::~__shared_weak_count((std::__shared_weak_count *)a1);
}

void __31__MLMultiArray_numberAtOffset___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = [*(id *)(a1 + 32) numberOfBytesPerElement];
  unint64_t v7 = *(void *)(a1 + 48);
  if (!is_mul_ok(v6, v7) || v6 * v7 >= a3) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Could not fetch NSNumber at offset %zu because it is beyond the end of the multi array.", *(void *)(a1 + 48));
  }
  uint64_t v8 = [*(id *)(a1 + 32) dataType];
  if (v8 > 65599)
  {
    if (v8 == 65600)
    {
      uint64_t v11 = [NSNumber numberWithDouble:*(double *)(a2 + 8 * *(void *)(a1 + 48))];
    }
    else
    {
      if (v8 != 131104) {
        return;
      }
      uint64_t v11 = [NSNumber numberWithInt:*(unsigned int *)(a2 + 4 * *(void *)(a1 + 48))];
    }
  }
  else
  {
    if (v8 == 65552)
    {
      uint64_t v10 = NSNumber;
      _H0 = *(_WORD *)(a2 + 2 * *(void *)(a1 + 48));
      __asm { FCVT            S0, H0 }
    }
    else
    {
      if (v8 != 65568) {
        return;
      }
      uint64_t v10 = NSNumber;
      LODWORD(_D0) = *(_DWORD *)(a2 + 4 * *(void *)(a1 + 48));
    }
    uint64_t v11 = [v10 numberWithFloat:_D0];
  }
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v11;
}

- (id)numberAtOffset:(unint64_t)a3
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__2458;
  uint64_t v10 = __Block_byref_object_dispose__2459;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__MLMultiArray_numberAtOffset___block_invoke;
  v5[3] = &unk_1E59A53B8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(MLMultiArray *)self getBytesWithHandler:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getBytesWithHandler:(void *)handler
{
  id v4 = handler;
  StorageManager::storage((StorageManager *)&v9, (uint64_t)self->_storageManager.__ptr_.__value_);
  uint64_t v5 = v9;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MLMultiArray_ScopedBufferAccess__getBytesWithHandler___block_invoke;
  v7[3] = &unk_1E59A3B38;
  id v6 = v4;
  id v8 = v6;
  CoreML::MultiArrayBuffer::getBytesWithHandler(v5, v7);

  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

uint64_t __56__MLMultiArray_ScopedBufferAccess__getBytesWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MLMultiArray)initWithDataPointer:(void *)dataPointer shape:(NSArray *)shape dataType:(MLMultiArrayDataType)dataType strides:(NSArray *)strides deallocator:(void *)deallocator error:(NSError *)error
{
  return [(MLMultiArray *)self initWithBytesNoCopy:dataPointer shape:shape dataType:dataType strides:strides deallocator:deallocator mutableShapedBufferProvider:0 error:error];
}

- (NSArray)shape
{
  return self->_shape;
}

- (BOOL)copyIntoMultiArray:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (uint64_t *)a3;
  uint64_t v7 = kdebug_trace();
  id v8 = (void *)MEMORY[0x19F3C29E0](v7);
  StorageManager::storage((StorageManager *)&v19, (uint64_t)self->_storageManager.__ptr_.__value_);
  StorageManager::mutableStorage((StorageManager *)&v17, v6[1]);
  char v9 = CoreML::MultiArrayBuffer::copyInto(v19, v17);
  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Unable to copy %@ into %@", buf, 0x16u);
    }

    int v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    id v13 = [NSString stringWithFormat:@"Unable to copy %@ into %@", self, v6];
    v22 = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v10 = [v12 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v14];
  }
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (a4) {
    char v15 = v9;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
    *a4 = v10;
  }

  kdebug_trace();
  return v9;
}

- (MLMultiArray)initWithShape:(NSArray *)shape dataType:(MLMultiArrayDataType)dataType error:(NSError *)error
{
  return [(MLMultiArray *)self initWithShape:shape dataType:dataType storageOrder:0 error:error];
}

+ (id)multiArrayOwningBufferObjectOfPort:(e5rt_io_port *)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  uint64_t v5 = e5rt_io_port_retain_tensor_desc();
  if (v5)
  {
    id v6 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = e5rt_get_last_error_message();
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v5;
      _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
    }

    if (a4)
    {
      uint64_t v7 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), v5];
      *a4 = +[MLModelErrorUtils errorWithCode:1 underlyingError:v7 format:@"Unable to create a multi-array feature value because ML Program didn't report the shape and other properties."];

LABEL_11:
      a4 = 0;
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v8 = e5rt_io_port_retain_buffer_object();
    if (v8)
    {
      char v9 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = e5rt_get_last_error_message();
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v8;
        _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      if (a4)
      {
        uint64_t v10 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), v8];
        *a4 = +[MLModelErrorUtils errorWithCode:1 underlyingError:v10 format:@"Unable to create a multi-array feature value because ML Program didn't output the buffer object."];

        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v11 = MLE5DataPointerOfBufferObject();
      IOSurfaceRef buffer = 0;
      if (!MLE5TypeOfBufferObject())
      {
        uint64_t iosurface = e5rt_buffer_object_get_iosurface();
        if (iosurface)
        {
          id v19 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = e5rt_get_last_error_message();
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = iosurface;
            _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Failed to get IOSurface backing of the buffer object. E5RT: %s (%d)", buf, 0x12u);
          }

          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Failed to get IOSurface backing of the buffer object. E5RT: %s (%d)", e5rt_get_last_error_message(), iosurface);
        }
      }
      IOSurfaceRef buffer = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v25 = v22;
      int v12 = [MLMultiArray alloc];
      id v13 = MLE5MultiArrayShapeForTensor();
      uint64_t v14 = MLE5MultiArrayDataTypeForTensor();
      char v15 = MLE5MultiArrayStridesForTensor();
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__MLMultiArray_MLE5Utils__multiArrayOwningBufferObjectOfPort_error___block_invoke;
      v20[3] = &unk_1E59A3AA0;
      v20[4] = buf;
      v20[5] = 0;
      a4 = [(MLMultiArray *)v12 initWithDataPointer:v11 shape:v13 dataType:v14 strides:v15 deallocator:v20 error:a4];

      if (a4) {
        id v16 = a4;
      }

      _Block_object_dispose(buf, 8);
    }
  }
  e5rt_tensor_desc_release();

  return a4;
}

uint64_t __68__MLMultiArray_MLE5Utils__multiArrayOwningBufferObjectOfPort_error___block_invoke(uint64_t a1)
{
  v1 = *(__IOSurface **)(a1 + 40);
  if (v1) {
    IOSurfaceDecrementUseCount(v1);
  }

  return e5rt_buffer_object_release();
}

void __30__MLMultiArray_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3 + 1 == [*(id *)(a1 + 32) count])
  {
    uint64_t v5 = [v8 unsignedIntValue];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    unsigned int v7 = [v8 unsignedIntValue];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void *)(v6 + 24) * v7;
  }
  *(void *)(v6 + 24) = v5;
}

void __30__MLMultiArray_initWithCoder___block_invoke_102(int a1, void *a2)
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[MLMultiArray dataType](self, "dataType"), @"dataType");
  uint64_t v5 = [(MLMultiArray *)self shape];
  [v4 encodeObject:v5 forKey:@"shape"];

  uint64_t v6 = [(MLMultiArray *)self strides];
  [v4 encodeObject:v6 forKey:@"strides"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MLMultiArray pixelBuffer](self, "pixelBuffer") != 0, @"isBackedByPixelBuffer");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__MLMultiArray_encodeWithCoder___block_invoke;
  v8[3] = &unk_1E59A3AF0;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [(MLMultiArray *)self getBytesWithHandler:v8];
}

uint64_t __32__MLMultiArray_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) shape];
  id v7 = [*(id *)(a1 + 32) strides];

  if (v8 > a3) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"The buffer is %zd bytes but it is smaller than the expected length (%zu bytes). This is a programming error.", a3, v8);
  }
  id v9 = *(void **)(a1 + 40);

  return [v9 encodeBytes:a2 length:a3 forKey:@"dataPointer"];
}

- (id)description
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = objc_msgSend((id)objc_opt_class(), "stringForDataType:", -[MLMultiArray dataType](self, "dataType"));
  [v3 appendString:v4];

  uint64_t v18 = [(MLMultiArray *)self shape];
  [v3 appendString:@" "];
  uint64_t v5 = [v18 componentsJoinedByString:@" × "];
  [v3 appendString:v5];

  if ([v18 count] == 1)
  {
    [v3 appendFormat:@" vector\n"];
    [v3 appendString:@"["];
    for (NSInteger i = 0; i < [(MLMultiArray *)self count]; ++i)
    {
      id v7 = [(MLMultiArray *)self objectAtIndexedSubscript:i];
      [v3 appendFormat:@"%@", v7];

      if (i + 1 < [(MLMultiArray *)self count]) {
        [v3 appendString:@","];
      }
    }
    [v3 appendString:@"]"];
  }
  else if ([v18 count] == 2)
  {
    [v3 appendString:@" matrix\n"];
    [v3 appendString:@"["];
    unint64_t v8 = [v18 objectAtIndexedSubscript:0];
    unint64_t v19 = [v8 unsignedIntegerValue];

    id v9 = [v18 objectAtIndexedSubscript:1];
    unint64_t v10 = [v9 unsignedIntegerValue];

    if (v19)
    {
      uint64_t v11 = 0;
      do
      {
        if (v10)
        {
          uint64_t v12 = 0;
          do
          {
            if (v11 && !v12) {
              [v3 appendString:@" "];
            }
            id v13 = [NSNumber numberWithUnsignedInteger:v11];
            v20[0] = v13;
            uint64_t v14 = [NSNumber numberWithUnsignedInteger:v12];
            v20[1] = v14;
            char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
            id v16 = [(MLMultiArray *)self objectForKeyedSubscript:v15];
            [v3 appendFormat:@"%@", v16];

            if (++v12 < v10) {
              [v3 appendString:@","];
            }
          }
          while (v10 != v12);
        }
        if (++v11 < v19) {
          [v3 appendString:@";\n"];
        }
      }
      while (v11 != v19);
    }
    [v3 appendString:@"]"];
  }
  else
  {
    [v3 appendFormat:@" array"];
  }

  return v3;
}

- (CVPixelBufferRef)pixelBuffer
{
  if ([(MLMultiArray *)self backingPixelBufferWasLocked])
  {
    id v3 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v6) = 0;
      _os_log_debug_impl(&dword_19E58B000, v3, OS_LOG_TYPE_DEBUG, "Pixel buffer backing MLMultiArray is locked until this MultiArray is deallocated (or storage swapped) due to usage of deprecated dataPointer or bytes properties. Please use getBytesWithHandler instead.", (uint8_t *)&v6, 2u);
    }
  }
  StorageManager::storage((StorageManager *)&v6, (uint64_t)self->_storageManager.__ptr_.__value_);
  id v4 = *(__CVBuffer **)(v6 + 96);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return v4;
}

- (BOOL)backingPixelBufferWasLocked
{
  StorageManager::storage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  int v2 = *(unsigned __int8 *)(v4 + 104);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2 != 0;
}

- (NSInteger)count
{
  StorageManager::storage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  NSInteger v2 = *(void *)(v4 + 80);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (void)dataPointer
{
  StorageManager::mutableStorage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v6, v4);
  NSInteger v2 = v6;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (void)setObject:(NSNumber *)obj forKeyedSubscript:(NSArray *)key
{
  id v9 = obj;
  uint64_t v6 = key;
  uint64_t v7 = [(NSArray *)v6 count];
  StorageManager::mutableStorage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  uint64_t v8 = (uint64_t)(*(void *)(v10 + 32) - *(void *)(v10 + 24)) >> 3;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v7 == v8) {
    [(MLMultiArray *)self setNumber:v9 atOffset:[(MLMultiArray *)self offsetForKeyedSubscript:v6]];
  }
}

- (NSNumber)objectForKeyedSubscript:(NSArray *)key
{
  uint64_t v4 = key;
  uint64_t v5 = [(NSArray *)v4 count];
  double v6 = StorageManager::storage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  uint64_t v7 = (uint64_t)(*(void *)(v10 + 32) - *(void *)(v10 + 24)) >> 3;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v5 == v7)
  {
    uint64_t v8 = -[MLMultiArray numberAtOffset:](self, "numberAtOffset:", -[MLMultiArray offsetForKeyedSubscript:](self, "offsetForKeyedSubscript:", v4, v6));
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (NSNumber *)v8;
}

- (unint64_t)offsetForKeyedSubscript:(id)a3
{
  uint64_t v27 = self;
  id v3 = a3;
  BOOL v30 = 0;
  id v31 = 0;
  unint64_t v32 = 0;
  std::vector<long long>::reserve((void **)&v30, [v3 count]);
  unint64_t v4 = 0;
  unint64_t v5 = v32;
  double v6 = v30;
  while (v4 < objc_msgSend(v3, "count", v27))
  {
    uint64_t v7 = [v3 objectAtIndexedSubscript:v4];
    uint64_t v8 = [v7 integerValue];
    uint64_t v9 = v8;
    uint64_t v10 = v31;
    if ((unint64_t)v31 >= v5)
    {
      uint64_t v12 = v31 - v6;
      unint64_t v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 61)
      {
        unint64_t v32 = v5;
        BOOL v30 = v6;
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      }
      if ((uint64_t)(v5 - (void)v6) >> 2 > v13) {
        unint64_t v13 = (uint64_t)(v5 - (void)v6) >> 2;
      }
      if (v5 - (unint64_t)v6 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14) {
        unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v14);
      }
      else {
        uint64_t v15 = 0;
      }
      id v16 = (uint64_t *)(v14 + 8 * v12);
      uint64_t *v16 = v9;
      uint64_t v11 = v16 + 1;
      while (v10 != v6)
      {
        uint64_t v17 = *--v10;
        *--id v16 = v17;
      }
      unint64_t v5 = v14 + 8 * v15;
      if (v6) {
        operator delete(v6);
      }
      double v6 = v16;
    }
    else
    {
      *id v31 = v8;
      uint64_t v11 = v10 + 1;
    }
    id v31 = v11;

    ++v4;
  }
  unint64_t v32 = v5;
  BOOL v30 = v6;
  StorageManager::storage((StorageManager *)&v28, (uint64_t)v27->_storageManager.__ptr_.__value_);
  uint64_t v18 = v28;
  v36 = 0;
  unint64_t v37 = 0;
  uint64_t v38 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v36, *(const void **)(v28 + 48), *(void *)(v28 + 56), (uint64_t)(*(void *)(v28 + 56) - *(void *)(v28 + 48)) >> 3);
  __p = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, *(const void **)(v18 + 24), *(void *)(v18 + 32), (uint64_t)(*(void *)(v18 + 32) - *(void *)(v18 + 24)) >> 3);
  unint64_t v19 = 0;
  v20 = v36;
  if (v6 < v31 && (unint64_t)v36 < v37)
  {
    unint64_t v19 = 0;
    uint64_t v21 = (char *)(v6 + 1);
    uint64_t v22 = (char *)v36 + 8;
    uint64_t v23 = __p;
    do
    {
      uint64_t v24 = *((void *)v21 - 1);
      if (v24 < 0) {
        v24 += *v23;
      }
      v19 += *((void *)v22 - 1) * v24;
      if (v21 >= (char *)v31) {
        break;
      }
      ++v23;
      v21 += 8;
      BOOL v25 = (unint64_t)v22 >= v37;
      v22 += 8;
    }
    while (!v25);
  }
  if (__p)
  {
    uint64_t v34 = __p;
    operator delete(__p);
    v20 = v36;
  }
  if (v20)
  {
    unint64_t v37 = (unint64_t)v20;
    operator delete(v20);
  }
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  if (v6)
  {
    id v31 = v6;
    operator delete(v6);
  }

  return v19;
}

- (MLMultiArray)initWithPixelBuffer:(CVPixelBufferRef)pixelBuffer shape:(NSArray *)shape
{
  double v6 = shape;
  if (!pixelBuffer) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"pixelBuffer must not be NULL."];
  }
  if (CVPixelBufferGetPixelFormatType(pixelBuffer) != 1278226536)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"The pixel format type must be kCVPixelFormatType_OneComponent16Half. (%c%c%c%c is specified.)", HIBYTE(PixelFormatType), BYTE2(PixelFormatType), BYTE1(PixelFormatType), PixelFormatType);
  }
  if (!CVPixelBufferGetIOSurface(pixelBuffer)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The pixel buffer must use IOSurface."];
  }
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 1;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 1;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __42__MLMultiArray_initWithPixelBuffer_shape___block_invoke;
  v29[3] = &unk_1E59A3DA8;
  uint64_t v8 = v6;
  BOOL v30 = v8;
  id v31 = &v37;
  unint64_t v32 = &v33;
  [(NSArray *)v8 enumerateObjectsUsingBlock:v29];
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  uint64_t v10 = v34[3];
  if (Width != v10) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"The shape's last dimension (%zu) doesn't match the pixel buffer's width (%zu)", v10, CVPixelBufferGetWidth(pixelBuffer));
  }
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  if (Height != v38[3])
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    unint64_t v13 = [(NSArray *)v8 componentsJoinedByString:@","];
    [v12 raise:*MEMORY[0x1E4F1C3C8], @"The product of dimensions in the shape ([%@]) except last one must match the pixel buffer's height (%zu)", v13, CVPixelBufferGetHeight(pixelBuffer) format];
  }
  unint64_t v14 = (std::__shared_weak_count *)operator new(0x88uLL);
  v14->__shared_owners_ = 0;
  v14->__shared_weak_owners_ = 0;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF0DD7A0;
  std::vector<unsigned long>::vector(&v41, (v28 - (unsigned char *)__p) >> 3);
  uint64_t v15 = v41;
  id v16 = v42;
  if (v42 != (unsigned char *)v41)
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    unint64_t v19 = (v42 - (unsigned char *)v41) >> 3;
    do
    {
      uint64_t v20 = v19 + v17;
      uint64_t v21 = v19 + v17 - 1;
      if (v18)
      {
        if (v20 + 1 == v19)
        {
          size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
          uint64_t v15 = v41;
          v41[v21] = BytesPerRow >> 1;
          id v16 = v42;
        }
        else
        {
          v15[v21] = *((void *)__p + v20) * v15[v20];
        }
      }
      else
      {
        v15[v21] = 1;
      }
      ++v18;
      unint64_t v19 = (v16 - (unsigned char *)v15) >> 3;
      --v17;
    }
    while (v18 < v19);
  }
  CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)&v14[1], pixelBuffer, (uint64_t)&__p, (uint64_t)&v41);
  if (v41)
  {
    uint64_t v42 = v41;
    operator delete(v41);
  }
  if (__p)
  {
    uint64_t v28 = __p;
    operator delete(__p);
  }
  BOOL v25 = v14 + 1;
  uint64_t v26 = v14;
  atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v23 = [(MLMultiArray *)self initWithMultiArrayBuffer:&v25];
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v14);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

void __42__MLMultiArray_initWithPixelBuffer_shape___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3 + 1 >= (unint64_t)[*(id *)(a1 + 32) count])
  {
    uint64_t v7 = [v8 unsignedIntValue];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  else
  {
    unsigned int v5 = [v8 unsignedIntValue];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void *)(v6 + 24) * v5;
  }
  *(void *)(v6 + 24) = v7;
}

- (MLMultiArray)initWithMultiArrayBuffer:(shared_ptr<CoreML:(id)a4 :MultiArrayBuffer>)a3 mutableShapedBufferProvider:
{
  var0 = a3.var0;
  uint64_t v6 = a3.var1;
  v11.receiver = self;
  v11.super_class = (Class)MLMultiArray;
  uint64_t v7 = [(MLMultiArray *)&v11 init];
  if (v7) {
    uint64_t v8 = {;
  }
    shape = v7->_shape;
    v7->_shape = (NSArray *)v8;

    operator new();
  }

  return 0;
}

- (MLMultiArray)initWithMultiArrayBuffer:(shared_ptr<CoreML::MultiArrayBuffer>)a3
{
  id v3 = (std::__shared_weak_count *)*((void *)a3.var0 + 1);
  uint64_t v6 = *(void *)a3.var0;
  uint64_t v7 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v4 = [(MLMultiArray *)self initWithMultiArrayBuffer:&v6 mutableShapedBufferProvider:0];
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return v4;
}

- (uint64_t)initWithBytesNoCopy:(uint64_t)a1 shape:(uint64_t)a2 dataType:strides:deallocator:mutableShapedBufferProvider:error:
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"Z105-[MLMultiArray initWithBytesNoCopy:shape:dataType:strides:deallocator:mutableShapedBufferProvider:error:]E3$_0"))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

- (MLMultiArray)initWithShape:(id)a3 dataType:(int64_t)a4 strides:(id)a5
{
  int v6 = a4;
  v16[7] = *(void **)MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MLMultiArray;
  objc_super v11 = [(MLMultiArray *)&v15 init];
  if (v11)
  {
    objc_storeStrong((id *)&v11->_shape, a3);
    uint64_t v12 = operator new(0x88uLL);
    v12[1] = 0;
    v12[2] = 0;
    void *v12 = &unk_1EF0DD7A0;
    CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)(v12 + 3), (uint64_t)v16, (uint64_t)__p, v6, 1uLL);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v16[0])
    {
      v16[1] = v16[0];
      operator delete(v16[0]);
    }
    operator new();
  }

  return 0;
}

- (MLMultiArray)init
{
  id v3 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_19E58B000, v3, OS_LOG_TYPE_FAULT, "The default initializer of MLMultiArray will be removed soon. Please don't use.", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)MLMultiArray;
  return [(MLMultiArray *)&v5 init];
}

+ (id)stringForDataType:(int64_t)a3
{
  id v3 = @"Float16";
  if (a3 == 65568) {
    id v3 = @"Float32";
  }
  if (a3 == 65600) {
    id v3 = @"Double";
  }
  if (a3 == 131104) {
    return @"Int32";
  }
  else {
    return v3;
  }
}

- (id)multiArrayViewExpandingDimensionsAtAxis:(int64_t)a3
{
  id v3 = [[MLMultiArrayView alloc] initExpandingDimensionsOfMultiArray:self axis:a3];

  return v3;
}

- (id)squeezeDimensions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[MLMultiArrayView alloc] initSqueezingMultiArray:self dimensions:v6 error:a4];

  return v7;
}

- (id)squeeze
{
  id v2 = [[MLMultiArrayView alloc] initSqueezingMultiArray:self dimensions:0 error:0];

  return v2;
}

- (id)sliceAtOrigin:(id)a3 shape:(id)a4 squeeze:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [[MLMultiArrayView alloc] initSlicingMultiArray:self origin:v10 shape:v11 squeeze:v7 error:a6];

  return v12;
}

- (void)multiArrayBuffer
{
  StorageManager::mutableStorage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  id v2 = v4;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (MLMultiArray)initWithPixelBuffer:(__CVBuffer *)a3 shape:(id)a4 strides:(id)a5 mutableShapedBufferProvider:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v33 = a4;
  id v9 = a5;
  id v34 = a6;
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"pixelBuffer must not be NULL."];
  }
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226536)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    id v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      uint64_t v12 = HIBYTE(PixelFormatType);
      *(_DWORD *)&uint8_t buf[4] = HIBYTE(PixelFormatType);
      uint64_t v13 = BYTE2(PixelFormatType);
      *(_WORD *)&buf[8] = 1024;
      uint64_t v15 = BYTE1(PixelFormatType);
      uint64_t v14 = PixelFormatType;
      *(_DWORD *)&buf[10] = BYTE2(PixelFormatType);
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&uint8_t buf[16] = BYTE1(PixelFormatType);
      *(_WORD *)&buf[20] = 1024;
      int v41 = PixelFormatType;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "The pixel format type must be kCVPixelFormatType_OneComponent16Half. (%c%c%c%c is specified.)", buf, 0x1Au);
    }
    else
    {
      uint64_t v12 = HIBYTE(PixelFormatType);
      uint64_t v13 = BYTE2(PixelFormatType);
      uint64_t v14 = PixelFormatType;
      uint64_t v15 = BYTE1(PixelFormatType);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"The pixel format type must be kCVPixelFormatType_OneComponent16Half. (%c%c%c%c is specified.)", v12, v13, v15, v14);
  }
  if (!CVPixelBufferGetIOSurface(a3))
  {
    id v16 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "The pixel buffer must use IOSurface.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The pixel buffer must use IOSurface."];
  }
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t v20 = [MLMultiArrayBufferLayout alloc];
  uint64_t v21 = [NSNumber numberWithUnsignedLong:Height];
  v39[0] = v21;
  uint64_t v22 = [NSNumber numberWithUnsignedLong:Width];
  v39[1] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  uint64_t v24 = [NSNumber numberWithUnsignedLong:BytesPerRow >> 1];
  v38[0] = v24;
  v38[1] = &unk_1EF11A028;
  BOOL v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  uint64_t v26 = [(MLMultiArrayBufferLayout *)v20 initWithShape:v23 strides:v25];

  uint64_t v27 = [[MLMultiArrayBufferLayout alloc] initWithShape:v33 strides:v9];
  if (![(MLMultiArrayBufferLayout *)v27 isSubspaceOfBufferLayout:v26])
  {
    uint64_t v28 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v27;
      _os_log_error_impl(&dword_19E58B000, v28, OS_LOG_TYPE_ERROR, "The pixel buffer's buffer layout (%@) cannot support the requested MLMultiArray buffer layout (%@).", buf, 0x16u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The pixel buffer's buffer layout (%@) cannot support the requested MLMultiArray buffer layout (%@).", v26, v27 format];
  }
  CoreML::numericVectorFromObjC<unsigned long>((uint64_t)buf, v33);
  CoreML::numericVectorFromObjC<unsigned long>((uint64_t)__p, v9);
  v29 = (std::__shared_weak_count *)operator new(0x88uLL);
  v29->__shared_owners_ = 0;
  v29->__shared_weak_owners_ = 0;
  v29->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF0DD7A0;
  CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)&v29[1], a3, (uint64_t)buf, (uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
  uint64_t v35 = v29 + 1;
  uint64_t v36 = v29;
  atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
  BOOL v30 = [(MLMultiArray *)self initWithMultiArrayBuffer:&v35 mutableShapedBufferProvider:v34];
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v29);

  return v30;
}

- (MLMultiArray)initWithPixelBuffer:(__CVBuffer *)a3 shape:(id)a4 strides:(id)a5
{
  return [(MLMultiArray *)self initWithPixelBuffer:a3 shape:a4 strides:a5 mutableShapedBufferProvider:0];
}

- (MLMultiArray)initWithScalars:(id)a3 shape:(id)a4 dataType:(int64_t)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x19F3C29E0]();
  if (![v9 count])
  {
    id v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "shape is nil or empty.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"shape is nil or empty."];
  }
  std::allocate_shared[abi:ne180100]<CoreML::MultiArrayBuffer,std::allocator<CoreML::MultiArrayBuffer>,std::vector<unsigned long> &,CoreML::ScalarType &,CoreML::StorageOrder &,int,void>(&v36, (unint64_t **)__p, a5, +[MLMultiArray cppStorageOrder:0], 1);
  uint64_t v12 = [v8 count];
  uint64_t v13 = v36;
  if (v12 != *(void *)(v36 + 80))
  {
    uint64_t v14 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v25 = [v9 componentsJoinedByString:@" x "];
      uint64_t v26 = *(void *)(v13 + 80);
      uint64_t v27 = [v8 count];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v26;
      *(_WORD *)&unsigned char buf[22] = 2048;
      uint64_t v40 = (void *)v27;
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
    id v16 = [v9 componentsJoinedByString:@" x "];
    uint64_t v17 = *(void *)(v13 + 80);
    uint64_t v18 = [v8 count];
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3321888768;
  v30[2] = __68__MLMultiArray_PrivateConstruction__initWithScalars_shape_dataType___block_invoke;
  v30[3] = &unk_1EF0DE330;
  unint64_t v19 = v37;
  uint64_t v33 = v13;
  id v34 = v37;
  if (v37) {
    atomic_fetch_add_explicit(&v37->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v20 = v9;
  id v31 = v20;
  id v21 = v8;
  id v32 = v21;
  int64_t v35 = a5;
  uint64_t v22 = v30;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___ZN6CoreML16MultiArrayBuffer26getMutableBytesWithHandlerEU13block_pointerFvPvmE_block_invoke;
  uint64_t v40 = &unk_1E59A3B38;
  id v41 = v22;
  CoreML::MultiArrayBuffer::getBytesWithHandler(v13, buf);

  uint64_t v28 = v13;
  v29 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v23 = [(MLMultiArray *)self initWithMultiArrayBuffer:&v28];
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }

  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v23;
}

void __68__MLMultiArray_PrivateConstruction__initWithScalars_shape_dataType___block_invoke(uint64_t a1, NSArray *a2, void *a3)
{
  CoreML::numericArrayToObjC<std::vector<unsigned long>,unsigned long>((void *)(*(void *)(a1 + 48) + 48));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [[MLMultiArrayBufferLayout alloc] initWithShape:*(void *)(a1 + 32) strides:v8];
}

- (MLMultiArray)initWithArray:(id)a3 dataType:(int64_t)a4
{
  id v6 = a3;
  MLMultiArrayDataType v7 = (void *)MEMORY[0x19F3C29E0]();
  id v32 = 0;
  id v8 = [(id)objc_opt_class() _shapeOfNestedArray:v6 error:&v32];
  id v9 = v32;
  id v10 = v9;
  if (!v8)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    unint64_t v19 = [v9 localizedDescription];
    id v20 = [v18 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];

    objc_exception_throw(v20);
  }
  std::allocate_shared[abi:ne180100]<CoreML::MultiArrayBuffer,std::allocator<CoreML::MultiArrayBuffer>,std::vector<unsigned long> &,CoreML::ScalarType &,CoreML::StorageOrder &,int,void>(&v29, (unint64_t **)__p, a4, +[MLMultiArray cppStorageOrder:0], 1);
  uint64_t v12 = v29;
  id v11 = v30;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3321888768;
  v23[2] = __60__MLMultiArray_PrivateConstruction__initWithArray_dataType___block_invoke;
  v23[3] = &unk_1EF0DE330;
  uint64_t v26 = v29;
  uint64_t v27 = v30;
  if (v30) {
    atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v13 = v8;
  id v24 = v13;
  id v14 = v6;
  id v25 = v14;
  int64_t v28 = a4;
  uint64_t v15 = v23;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = ___ZN6CoreML16MultiArrayBuffer26getMutableBytesWithHandlerEU13block_pointerFvPvmE_block_invoke;
  v33[3] = &unk_1E59A3B38;
  id v34 = v15;
  CoreML::MultiArrayBuffer::getBytesWithHandler(v12, v33);

  uint64_t v21 = v12;
  uint64_t v22 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v16 = [(MLMultiArray *)self initWithMultiArrayBuffer:&v21];
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }

  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v16;
}

void __60__MLMultiArray_PrivateConstruction__initWithArray_dataType___block_invoke(uint64_t a1, NSArray *a2, void *a3)
{
  CoreML::numericArrayToObjC<std::vector<unsigned long>,unsigned long>((void *)(*(void *)(a1 + 48) + 48));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [[MLMultiArrayBufferLayout alloc] initWithShape:*(void *)(a1 + 32) strides:v8];
}

- (MLMultiArray)initWithBytesNoCopy:(void *)a3 shape:(id)a4 dataType:(int64_t)a5 strides:(id)a6 mutableShapedBufferProvider:(id)a7
{
  return [(MLMultiArray *)self initWithBytesNoCopy:a3 shape:a4 dataType:a5 strides:a6 deallocator:0 mutableShapedBufferProvider:a7 error:0];
}

- (MLMultiArray)initWithShape:(id)a3 dataType:(int64_t)a4 storageOrder:(int64_t)a5 bufferAlignment:(unint64_t)a6
{
  int v8 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MLMultiArray;
  uint64_t v12 = [(MLMultiArray *)&v18 init];
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shape, a3);
    int v13 = +[MLMultiArray cppStorageOrder:a5];
    id v14 = operator new(0x88uLL);
    v14[1] = 0;
    v14[2] = 0;
    void *v14 = &unk_1EF0DD7A0;
    CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)(v14 + 3), (unint64_t **)__p, v8, v13, a6);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    operator new();
  }
  uint64_t v15 = (MLMultiArray *)0;

  return v15;
}

- (id)numberArray
{
  id v2 = [[MLMultiArrayAsNSArrayWrapper alloc] initWrappingMultiArray:self];

  return v2;
}

- (BOOL)setRangeWithRawData:(id)a3 destIndex:(unint64_t)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  StorageManager::mutableStorage((StorageManager *)&v31, (uint64_t)self->_storageManager.__ptr_.__value_);
  uint64_t v9 = [v8 count];
  if ((uint64_t)(v9 + a4) <= [(MLMultiArray *)self count])
  {
    uint64_t v14 = v31;
    if (*(void *)(v31 + 32) - *(void *)(v31 + 24) == 8)
    {
      uint64_t v15 = **(void **)(v31 + 48);
      uint64_t v16 = CoreML::MultiArrayBuffer::offsetForIndex(v31, a4);
      int v17 = *(_DWORD *)(v14 + 72);
      CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)v28, v14);
      uint64_t v18 = *(void *)v28;
      if (v29) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v29);
      }
      uint64_t v19 = (char *)operator new(8uLL);
      *(void *)uint64_t v19 = v9;
      uint64_t v29 = (std::__shared_weak_count *)(v19 + 8);
      BOOL v30 = v19 + 8;
      *(void *)int64_t v28 = v19;
      *(void *)operator new(8uLL) = v15;
      CoreML::MultiArrayBuffer::MultiArrayBuffer(buf, v18 + v16 * ((unsigned __int16)v17 >> 3));
    }
    id v20 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [NSNumber numberWithUnsignedLong:(uint64_t)(*(void *)(v14 + 32) - *(void *)(v14 + 24)) >> 3];
      *(_DWORD *)buf = 138412290;
      id v34 = v27;
      _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "setRangeWithRawData: non-contiguous %@d destination unsupported", buf, 0xCu);
    }
    if (a5)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      uint64_t v22 = NSString;
      uint64_t v23 = [NSNumber numberWithUnsignedLong:(uint64_t)(*(void *)(v14 + 32) - *(void *)(v14 + 24)) >> 3];
      id v24 = [v22 stringWithFormat:@"setRangeWithRawData: non-contiguous %@d destination unsupported", v23];
      uint64_t v36 = v24;
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      *a5 = [v21 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v25];
    }
  }
  else
  {
    id v10 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "setRangeWithRawData: range out of bounds.", buf, 2u);
    }

    if (a5)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      uint64_t v12 = [NSString stringWithFormat:@"setRangeWithRawData: range out of bounds."];
      v38[0] = v12;
      int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      *a5 = [v11 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v13];
    }
  }
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }

  return 0;
}

- (BOOL)fillWithNumber:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MLMultiArray_Filling__fillWithNumber___block_invoke;
  v7[3] = &unk_1E59A3C90;
  void v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  [(MLMultiArray *)self getMutableBytesWithHandler:v7];

  return 1;
}

void __40__MLMultiArray_Filling__fillWithNumber___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v34 = a4;
  id v6 = [MLMultiArrayBufferLayout alloc];
  MLMultiArrayDataType v7 = [*(id *)(a1 + 32) shape];
  id v8 = [(MLMultiArrayBufferLayout *)v6 initWithShape:v7 strides:v34];

  uint64_t v9 = [(MLMultiArrayBufferLayout *)v8 count];
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i < v9; i += v35)
    {
      uint64_t v35 = 0;
      uint64_t v11 = -[MLMultiArrayBufferLayout offsetOfScalarAtIndex:contiguousScalars:](v8, "offsetOfScalarAtIndex:contiguousScalars:", i, &v35, v34);
      uint64_t v12 = [*(id *)(a1 + 32) dataType];
      if (v12 > 65599)
      {
        if (v12 == 65600)
        {
          uint64_t v30 = v35;
          [*(id *)(a1 + 40) doubleValue];
          if (v30 >= 1)
          {
            id v32 = (void *)(a2 + 8 * v11);
            unint64_t v33 = v30 + 1;
            do
            {
              *v32++ = v31;
              --v33;
            }
            while (v33 > 1);
          }
        }
        else if (v12 == 131104)
        {
          uint64_t v17 = v35;
          int v18 = [*(id *)(a1 + 40) intValue];
          if (v17 >= 1)
          {
            uint64_t v19 = (_DWORD *)(a2 + 4 * v11);
            unint64_t v20 = v17 + 1;
            do
            {
              *v19++ = v18;
              --v20;
            }
            while (v20 > 1);
          }
        }
      }
      else if (v12 == 65552)
      {
        uint64_t v21 = v35;
        [*(id *)(a1 + 40) floatValue];
        if (v21 >= 1)
        {
          __asm { FCVT            H0, S0 }
          int64_t v28 = (_WORD *)(a2 + 2 * v11);
          unint64_t v29 = v21 + 1;
          do
          {
            *v28++ = _H0;
            --v29;
          }
          while (v29 > 1);
        }
      }
      else if (v12 == 65568)
      {
        uint64_t v13 = v35;
        [*(id *)(a1 + 40) floatValue];
        if (v13 >= 1)
        {
          uint64_t v15 = (_DWORD *)(a2 + 4 * v11);
          unint64_t v16 = v13 + 1;
          do
          {
            *v15++ = v14;
            --v16;
          }
          while (v16 > 1);
        }
      }
    }
  }
}

- (BOOL)vectorizeIntoMultiArray:(id)a3 storageOrder:(int64_t)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = (uint64_t *)a3;
  uint64_t v9 = kdebug_trace();
  id v10 = (void *)MEMORY[0x19F3C29E0](v9);
  StorageManager::storage((StorageManager *)&v21, (uint64_t)self->_storageManager.__ptr_.__value_);
  StorageManager::mutableStorage((StorageManager *)&v19, v8[1]);
  char v11 = CoreML::MultiArrayBuffer::vectorizeInto(v21, v19, +[MLMultiArray cppStorageOrder:a4]);
  if (v11)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = self;
      __int16 v27 = 2112;
      int64_t v28 = v8;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Unable to vectorize %@ into %@", buf, 0x16u);
    }

    int v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v15 = [NSString stringWithFormat:@"Unable to vectorize %@ into %@", self, v8];
    id v24 = v15;
    unint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v12 = [v14 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v16];
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (a5) {
    char v17 = v11;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0) {
    *a5 = v12;
  }

  kdebug_trace();
  return v11;
}

- (void)transferToMultiArray:(id)a3
{
}

- (float)float32Pointer
{
  StorageManager::mutableStorage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v6, v4);
  id v2 = v6;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (double)doublePointer
{
  StorageManager::mutableStorage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v6, v4);
  id v2 = v6;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (BOOL)isEqualToMultiArray:(id)a3
{
  id v5 = (uint64_t *)a3;
  StorageManager::storage((StorageManager *)&v29, (uint64_t)self->_storageManager.__ptr_.__value_);
  uint64_t v6 = v29;
  StorageManager::storage((StorageManager *)&v27, v5[1]);
  uint64_t v7 = v27;
  int v8 = *(_DWORD *)(v27 + 72);
  if (v8 != *(_DWORD *)(v6 + 72))
  {
    BOOL v3 = 0;
    goto LABEL_44;
  }
  if (v8 > 65599)
  {
    if (v8 != 131104)
    {
      if (v8 != 65600) {
        goto LABEL_44;
      }
      v54 = 0;
      v55 = 0;
      uint64_t v56 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v54, *(const void **)(v6 + 24), *(void *)(v6 + 32), (uint64_t)(*(void *)(v6 + 32) - *(void *)(v6 + 24)) >> 3);
      v51 = 0;
      v52 = 0;
      uint64_t v53 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v51, *(const void **)(v7 + 24), *(void *)(v7 + 32), (uint64_t)(*(void *)(v7 + 32) - *(void *)(v7 + 24)) >> 3);
      int v14 = v54;
      uint64_t v15 = v55;
      char v11 = v51;
      if (v55 - (unsigned char *)v54 == v52 - v51)
      {
        if (!memcmp(v54, v51, v55 - (unsigned char *)v54))
        {
          if (v15 != v14)
          {
            __int16 v16 = *(_WORD *)(v6 + 88);
            if ((v16 & 3) != 0)
            {
              __int16 v17 = (v16 & 1) != 0 ? 1 : 2;
              if (((unsigned __int16)v17 & *(_WORD *)(v7 + 88)) != 0)
              {
                uint64_t v35 = 0;
                uint64_t v36 = &v35;
                uint64_t v37 = 0x2000000000;
                char v38 = 1;
                uint64_t v42 = MEMORY[0x1E4F143A8];
                uint64_t v43 = 0x40000000;
                v44 = ___ZN6CoreMLL14equalalityTestIdEEbRKNS_16MultiArrayBufferES3__block_invoke;
                v45 = &unk_1E59A4760;
                v46 = &v35;
                uint64_t v47 = v7;
                CoreML::MultiArrayBuffer::getBytesWithHandler(v6, &v42);
                goto LABEL_56;
              }
            }
            CoreML::MultiArrayIterator<double>::MultiArrayIterator((uint64_t)&v42, v6, 0, 1);
            CoreML::MultiArrayIterator<double>::MultiArrayIterator((uint64_t)&v35, v6, 1, 0);
            CoreML::MultiArrayIterator<double>::MultiArrayIterator((uint64_t)v31, v7, 0, 1);
            while (v48 != v39)
            {
              BOOL v3 = *v48 == *v32;
              if (*v48 != *v32) {
                goto LABEL_75;
              }
              CoreML::MultiArrayIterator<double>::operator++((uint64_t)&v42);
              CoreML::MultiArrayIterator<double>::operator++((uint64_t)v31);
            }
            goto LABEL_74;
          }
          goto LABEL_57;
        }
LABEL_37:
        BOOL v3 = 0;
        goto LABEL_38;
      }
LABEL_40:
      BOOL v3 = 0;
      if (!v11) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
    v54 = 0;
    v55 = 0;
    uint64_t v56 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v54, *(const void **)(v6 + 24), *(void *)(v6 + 32), (uint64_t)(*(void *)(v6 + 32) - *(void *)(v6 + 24)) >> 3);
    v51 = 0;
    v52 = 0;
    uint64_t v53 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v51, *(const void **)(v7 + 24), *(void *)(v7 + 32), (uint64_t)(*(void *)(v7 + 32) - *(void *)(v7 + 24)) >> 3);
    uint64_t v22 = v54;
    uint64_t v23 = v55;
    char v11 = v51;
    if (v55 - (unsigned char *)v54 != v52 - v51) {
      goto LABEL_40;
    }
    if (memcmp(v54, v51, v55 - (unsigned char *)v54)) {
      goto LABEL_37;
    }
    if (v23 == v22) {
      goto LABEL_57;
    }
    __int16 v25 = *(_WORD *)(v6 + 88);
    if ((v25 & 3) != 0)
    {
      __int16 v26 = (v25 & 1) != 0 ? 1 : 2;
      if (((unsigned __int16)v26 & *(_WORD *)(v7 + 88)) != 0)
      {
        uint64_t v35 = 0;
        uint64_t v36 = &v35;
        uint64_t v37 = 0x2000000000;
        char v38 = 1;
        uint64_t v42 = MEMORY[0x1E4F143A8];
        uint64_t v43 = 0x40000000;
        v44 = ___ZN6CoreMLL14equalalityTestIiEEbRKNS_16MultiArrayBufferES3__block_invoke;
        v45 = &unk_1E59A4800;
        v46 = &v35;
        uint64_t v47 = v7;
        CoreML::MultiArrayBuffer::getBytesWithHandler(v6, &v42);
        goto LABEL_56;
      }
    }
    CoreML::MultiArrayIterator<int>::MultiArrayIterator((uint64_t)&v42, v6, 0, 1);
    CoreML::MultiArrayIterator<int>::MultiArrayIterator((uint64_t)&v35, v6, 1, 0);
    CoreML::MultiArrayIterator<int>::MultiArrayIterator((uint64_t)v31, v7, 0, 1);
    while (v48 != v39)
    {
      BOOL v3 = *(_DWORD *)v48 == *(_DWORD *)v32;
      if (*(_DWORD *)v48 != *(_DWORD *)v32) {
        goto LABEL_75;
      }
      CoreML::MultiArrayIterator<float>::operator++((uint64_t)&v42);
      CoreML::MultiArrayIterator<float>::operator++((uint64_t)v31);
    }
  }
  else
  {
    if (v8 != 65552)
    {
      if (v8 != 65568) {
        goto LABEL_44;
      }
      v54 = 0;
      v55 = 0;
      uint64_t v56 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v54, *(const void **)(v6 + 24), *(void *)(v6 + 32), (uint64_t)(*(void *)(v6 + 32) - *(void *)(v6 + 24)) >> 3);
      v51 = 0;
      v52 = 0;
      uint64_t v53 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v51, *(const void **)(v7 + 24), *(void *)(v7 + 32), (uint64_t)(*(void *)(v7 + 32) - *(void *)(v7 + 24)) >> 3);
      uint64_t v9 = v54;
      id v10 = v55;
      char v11 = v51;
      if (v55 - (unsigned char *)v54 == v52 - v51)
      {
        if (!memcmp(v54, v51, v55 - (unsigned char *)v54))
        {
          if (v10 != v9)
          {
            __int16 v12 = *(_WORD *)(v6 + 88);
            if ((v12 & 3) != 0)
            {
              __int16 v13 = (v12 & 1) != 0 ? 1 : 2;
              if (((unsigned __int16)v13 & *(_WORD *)(v7 + 88)) != 0)
              {
                uint64_t v35 = 0;
                uint64_t v36 = &v35;
                uint64_t v37 = 0x2000000000;
                char v38 = 1;
                uint64_t v42 = MEMORY[0x1E4F143A8];
                uint64_t v43 = 0x40000000;
                v44 = ___ZN6CoreMLL14equalalityTestIfEEbRKNS_16MultiArrayBufferES3__block_invoke;
                v45 = &unk_1E59A47B0;
                v46 = &v35;
                uint64_t v47 = v7;
                CoreML::MultiArrayBuffer::getBytesWithHandler(v6, &v42);
LABEL_56:
                BOOL v3 = *((unsigned char *)v36 + 24) != 0;
                _Block_object_dispose(&v35, 8);
                goto LABEL_38;
              }
            }
            CoreML::MultiArrayIterator<float>::MultiArrayIterator((uint64_t)&v42, v6, 0, 1);
            CoreML::MultiArrayIterator<float>::MultiArrayIterator((uint64_t)&v35, v6, 1, 0);
            CoreML::MultiArrayIterator<float>::MultiArrayIterator((uint64_t)v31, v7, 0, 1);
            while (v48 != v39)
            {
              BOOL v3 = *(float *)v48 == *(float *)v32;
              if (*(float *)v48 != *(float *)v32) {
                goto LABEL_75;
              }
              CoreML::MultiArrayIterator<float>::operator++((uint64_t)&v42);
              CoreML::MultiArrayIterator<float>::operator++((uint64_t)v31);
            }
            goto LABEL_74;
          }
LABEL_57:
          BOOL v3 = 1;
          goto LABEL_38;
        }
        goto LABEL_37;
      }
      goto LABEL_40;
    }
    v54 = 0;
    v55 = 0;
    uint64_t v56 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v54, *(const void **)(v6 + 24), *(void *)(v6 + 32), (uint64_t)(*(void *)(v6 + 32) - *(void *)(v6 + 24)) >> 3);
    v51 = 0;
    v52 = 0;
    uint64_t v53 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v51, *(const void **)(v7 + 24), *(void *)(v7 + 32), (uint64_t)(*(void *)(v7 + 32) - *(void *)(v7 + 24)) >> 3);
    int v18 = v54;
    uint64_t v19 = v55;
    char v11 = v51;
    if (v55 - (unsigned char *)v54 != v52 - v51) {
      goto LABEL_40;
    }
    if (memcmp(v54, v51, v55 - (unsigned char *)v54)) {
      goto LABEL_37;
    }
    if (v19 == v18) {
      goto LABEL_57;
    }
    __int16 v20 = *(_WORD *)(v6 + 88);
    if ((v20 & 3) != 0)
    {
      __int16 v21 = (v20 & 1) != 0 ? 1 : 2;
      if (((unsigned __int16)v21 & *(_WORD *)(v7 + 88)) != 0)
      {
        uint64_t v35 = 0;
        uint64_t v36 = &v35;
        uint64_t v37 = 0x2000000000;
        char v38 = 1;
        uint64_t v42 = MEMORY[0x1E4F143A8];
        uint64_t v43 = 0x40000000;
        v44 = ___ZN6CoreMLL14equalalityTestIDF16_EEbRKNS_16MultiArrayBufferES3__block_invoke;
        v45 = &unk_1E59A4850;
        v46 = &v35;
        uint64_t v47 = v7;
        CoreML::MultiArrayBuffer::getBytesWithHandler(v6, &v42);
        goto LABEL_56;
      }
    }
    _ZN6CoreML18MultiArrayIteratorIDF16_EC2ERKNS_16MultiArrayBufferENS_12StorageOrderEb((uint64_t)&v42, v6, 0, 1);
    _ZN6CoreML18MultiArrayIteratorIDF16_EC2ERKNS_16MultiArrayBufferENS_12StorageOrderEb((uint64_t)&v35, v6, 1, 0);
    _ZN6CoreML18MultiArrayIteratorIDF16_EC2ERKNS_16MultiArrayBufferENS_12StorageOrderEb((uint64_t)v31, v7, 0, 1);
    while (v48 != v39)
    {
      BOOL v3 = *(short float *)v48 == *(short float *)v32;
      if (*(short float *)v48 != *(short float *)v32) {
        goto LABEL_75;
      }
      _ZN6CoreML18MultiArrayIteratorIDF16_EppEv((uint64_t)&v42);
      _ZN6CoreML18MultiArrayIteratorIDF16_EppEv((uint64_t)v31);
    }
  }
LABEL_74:
  BOOL v3 = 1;
LABEL_75:
  if (__p)
  {
    id v34 = __p;
    operator delete(__p);
  }
  CoreML::MultiArrayBuffer::~MultiArrayBuffer((CoreML::MultiArrayBuffer *)v31);
  if (v40)
  {
    id v41 = v40;
    operator delete(v40);
  }
  CoreML::MultiArrayBuffer::~MultiArrayBuffer((CoreML::MultiArrayBuffer *)&v35);
  if (v49)
  {
    uint64_t v50 = v49;
    operator delete(v49);
  }
  CoreML::MultiArrayBuffer::~MultiArrayBuffer((CoreML::MultiArrayBuffer *)&v42);
LABEL_38:
  char v11 = v51;
  if (v51)
  {
LABEL_41:
    v52 = v11;
    operator delete(v11);
  }
LABEL_42:
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
LABEL_44:
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MLMultiArray *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(MLMultiArray *)self isEqualToMultiArray:v4];
  }

  return v5;
}

- (BOOL)isContiguousInOrder:(int64_t)a3
{
  double v4 = StorageManager::storage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  uint64_t v5 = v10;
  int v6 = +[MLMultiArray cppStorageOrder:](MLMultiArray, "cppStorageOrder:", a3, v4);
  int v7 = *(unsigned __int16 *)(v5 + 88);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v6) {
    int v8 = 2;
  }
  else {
    int v8 = 1;
  }
  return (v8 & v7) != 0;
}

- (BOOL)isContiguous
{
  StorageManager::storage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  __int16 v2 = *(_WORD *)(v4 + 88);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return (v2 & 3) != 0;
}

- (const)bytes
{
  StorageManager::storage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v6, v4);
  __int16 v2 = v6;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (void)mutableBytes
{
  StorageManager::mutableStorage((StorageManager *)&v4, (uint64_t)self->_storageManager.__ptr_.__value_);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v6, v4);
  __int16 v2 = v6;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

+ (id)_shapeOfNestedArray:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__2458;
  __int16 v21 = __Block_byref_object_dispose__2459;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__MLMultiArray_PrivateConstruction___shapeOfNestedArray_error___block_invoke;
  v13[3] = &unk_1E59A3BB0;
  __int16 v16 = &v17;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  if (a4) {
    *a4 = (id) v18[5];
  }
  if (v18[5]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v8;
  }
  id v11 = v10;

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __63__MLMultiArray_PrivateConstruction___shapeOfNestedArray_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (![v7 count])
  {
    id v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v55 = a3;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Empty dimension was found at axis %tu.", buf, 0xCu);
    }

    __int16 v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v62 = *MEMORY[0x1E4F28568];
    __int16 v13 = objc_msgSend(NSString, "stringWithFormat:", @"Empty dimension was found at axis %tu.", a3);
    v63[0] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
    uint64_t v15 = [v12 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v14];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    goto LABEL_21;
  }
  if ([*(id *)(a1 + 32) count] == a3)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    [*(id *)(a1 + 32) setObject:v8 atIndexedSubscript:a3];

    id v9 = [v7 objectAtIndexedSubscript:0];
    [*(id *)(a1 + 40) setObject:objc_opt_class() atIndexedSubscript:a3];

    uint64_t v10 = [v7 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      int v18 = [v7 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v39 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v55 = a3;
          _os_log_error_impl(&dword_19E58B000, v39, OS_LOG_TYPE_ERROR, "The element type is neither NSArray nor NSNumber at axis %tu.", buf, 0xCu);
        }

        uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        id v41 = objc_msgSend(NSString, "stringWithFormat:", @"The element type is neither NSArray nor NSNumber at axis %tu.", a3);
        v61 = v41;
        uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        uint64_t v43 = [v40 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v42];
        uint64_t v44 = *(void *)(*(void *)(a1 + 48) + 8);
        v45 = *(void **)(v44 + 40);
        *(void *)(v44 + 40) = v43;

        goto LABEL_21;
      }
    }
  }
  __int16 v20 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v21 = [v20 unsignedIntegerValue];
  uint64_t v22 = [v7 count];

  if (v21 != v22)
  {
    uint64_t v30 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v46 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
      *(_DWORD *)buf = 134218496;
      uint64_t v55 = a3;
      __int16 v56 = 2048;
      uint64_t v57 = [v46 integerValue];
      __int16 v58 = 2048;
      uint64_t v59 = [v7 count];
      _os_log_error_impl(&dword_19E58B000, v30, OS_LOG_TYPE_ERROR, "Dimension mismatch at axis %tu; some have %tu element(s) but others have %tu element(s).",
        buf,
        0x20u);
    }
    uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    id v32 = NSString;
    unint64_t v33 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    objc_msgSend(v32, "stringWithFormat:", @"Dimension mismatch at axis %tu; some have %tu element(s) but others have %tu element(s).",
      a3,
      [v33 integerValue],
    id v34 = [v7 count]);
    uint64_t v53 = v34;
    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v36 = [v31 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v35];
    uint64_t v37 = *(void *)(*(void *)(a1 + 48) + 8);
    char v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;

LABEL_21:
    *a4 = 1;
    goto LABEL_22;
  }
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __63__MLMultiArray_PrivateConstruction___shapeOfNestedArray_error___block_invoke_232;
  v47[3] = &unk_1E59A3B88;
  id v48 = *(id *)(a1 + 40);
  uint64_t v49 = a3;
  if ([v7 indexOfObjectPassingTest:v47] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v23 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v55 = a3;
      _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "Invalid element type at axis %tu.", buf, 0xCu);
    }

    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    __int16 v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid element type at axis %tu.", a3);
    v51 = v25;
    __int16 v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    uint64_t v27 = [v24 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v26];
    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    *a4 = 1;
  }

LABEL_22:
}

BOOL __63__MLMultiArray_PrivateConstruction___shapeOfNestedArray_error___block_invoke_232(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 40)];
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return (a1 & 1) == 0;
}

+ (BOOL)validateNestedArray:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3C29E0]();
  id v11 = 0;
  id v8 = [a1 _shapeOfNestedArray:v6 error:&v11];
  id v9 = v11;

  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8 != 0;
}

+ (id)float32MatrixWithValues:(id)a3 error:(id *)a4
{
  v37[2] = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  id v24 = a3;
  if (objc_msgSend(a1, "getShapeOfArrayOfSameLengthArrays:numberOfRows:numberOfColumns:error:"))
  {
    id v6 = [MLMultiArray alloc];
    id v7 = [NSNumber numberWithUnsignedInteger:v34];
    v37[0] = v7;
    id v8 = [NSNumber numberWithUnsignedInteger:v33];
    v37[1] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    uint64_t v10 = [(MLMultiArray *)v6 initWithShape:v9 dataType:65568 storageOrder:0 error:a4];

    if (v10)
    {
      id v11 = [(MLMultiArray *)v10 float32Pointer];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v12 = v24;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v35 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v26;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v26 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  [*(id *)(*((void *)&v25 + 1) + 8 * j) floatValue];
                  *(_DWORD *)v11++ = v21;
                }
                uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v35 count:16];
              }
              while (v18);
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v36 count:16];
        }
        while (v13);
      }

      uint64_t v22 = v10;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)doubleMatrixWithValues:(id)a3 error:(id *)a4
{
  v37[2] = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  id v24 = a3;
  if (objc_msgSend(a1, "getShapeOfArrayOfSameLengthArrays:numberOfRows:numberOfColumns:error:"))
  {
    id v6 = [MLMultiArray alloc];
    id v7 = [NSNumber numberWithUnsignedInteger:v34];
    v37[0] = v7;
    id v8 = [NSNumber numberWithUnsignedInteger:v33];
    v37[1] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    uint64_t v10 = [(MLMultiArray *)v6 initWithShape:v9 dataType:65600 storageOrder:0 error:a4];

    if (v10)
    {
      id v11 = [(MLMultiArray *)v10 doublePointer];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v12 = v24;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v35 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v26;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v26 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  [*(id *)(*((void *)&v25 + 1) + 8 * j) doubleValue];
                  *(void *)v11++ = v21;
                }
                uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v35 count:16];
              }
              while (v18);
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v36 count:16];
        }
        while (v13);
      }

      uint64_t v22 = v10;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)getShapeOfArrayOfSameLengthArrays:(id)a3 numberOfRows:(unint64_t *)a4 numberOfColumns:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  unint64_t v10 = [v9 count];
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__2458;
  uint64_t v18 = __Block_byref_object_dispose__2459;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__MLMultiArray_ConvenientConstruction__getShapeOfArrayOfSameLengthArrays_numberOfRows_numberOfColumns_error___block_invoke;
  v13[3] = &unk_1E59A3C40;
  void v13[4] = &v20;
  v13[5] = &v14;
  v13[6] = &v24;
  [v9 enumerateObjectsUsingBlock:v13];
  if (a4) {
    *a4 = v10;
  }
  if (a5) {
    *a5 = v21[3];
  }
  if (a6) {
    *a6 = (id) v15[5];
  }
  char v11 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __109__MLMultiArray_ConvenientConstruction__getShapeOfArrayOfSameLengthArrays_numberOfRows_numberOfColumns_error___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [v7 count];
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(a1[4] + 8);
  if (a3)
  {
    if (*(void *)(v10 + 24) != v8)
    {
      char v11 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(*(void *)(a1[4] + 8) + 24);
        *(_DWORD *)buf = 134218240;
        uint64_t v22 = v18;
        __int16 v23 = 2048;
        uint64_t v24 = v9;
        _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "The array of array is not a matrix: some row's length is %lu, but another row's length is %lu", buf, 0x16u);
      }

      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = [NSString stringWithFormat:@"The array of array is not a matrix: some row's length is %lu, but another row's length is %lu", *(void *)(*(void *)(a1[4] + 8) + 24), v9, *MEMORY[0x1E4F28568]];
      uint64_t v20 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v15 = [v12 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v14];
      uint64_t v16 = *(void *)(a1[5] + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {
    *(void *)(v10 + 24) = v8;
  }
}

+ (id)doubleMultiArrayWithShape:(id)a3 valueArray:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [[MLMultiArray alloc] initWithShape:v7 dataType:65600 error:a5];
  if (!v9)
  {
    a5 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = [v8 count];
  if (v10 == [(MLMultiArray *)v9 count])
  {
    if (![(MLMultiArray *)v9 isContiguousInOrder:0]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"-[MLMultiArray initWithShape:dataType:error:] was supposed to use first-major contiguous memory layout, but it doesn't." format];
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __83__MLMultiArray_ConvenientConstruction__doubleMultiArrayWithShape_valueArray_error___block_invoke;
    v21[3] = &unk_1E59A3BF8;
    id v22 = v8;
    [(MLMultiArray *)v9 getMutableBytesWithHandler:v21];
    a5 = v9;
    char v11 = v22;
    goto LABEL_11;
  }
  id v12 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[MLMultiArray count](v9, "count"));
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v19;
    __int16 v27 = 2112;
    long long v28 = v20;
    _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "value count (%@) does not match array count (%@)", buf, 0x16u);
  }
  if (a5)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v14 = NSString;
    char v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[MLMultiArray count](v9, "count"));
    uint64_t v16 = [v14 stringWithFormat:@"value count (%@) does not match array count (%@)", v11, v15];
    uint64_t v24 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    *a5 = [v13 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v17];

    a5 = 0;
LABEL_11:
  }
LABEL_12:

  return a5;
}

uint64_t __83__MLMultiArray_ConvenientConstruction__doubleMultiArrayWithShape_valueArray_error___block_invoke(uint64_t a1, uint64_t a2)
{
  __int16 v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__MLMultiArray_ConvenientConstruction__doubleMultiArrayWithShape_valueArray_error___block_invoke_2;
  v4[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
  v4[4] = a2;
  return [v2 enumerateObjectsUsingBlock:v4];
}

void __83__MLMultiArray_ConvenientConstruction__doubleMultiArrayWithShape_valueArray_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [v6 doubleValue];
  *(void *)(*(void *)(a1 + 32) + 8 * a3) = v5;
}

+ (id)doubleVectorWithValues:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MLMultiArray alloc];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v7 = [(MLMultiArray *)v4 initWithShape:v6 dataType:65600 error:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__MLMultiArray_ConvenientConstruction__doubleVectorWithValues___block_invoke;
  v10[3] = &unk_1E59A3BF8;
  id v8 = v3;
  id v11 = v8;
  [(MLMultiArray *)v7 getMutableBytesWithHandler:v10];

  return v7;
}

void __63__MLMultiArray_ConvenientConstruction__doubleVectorWithValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = [v6 objectAtIndexedSubscript:0];
  uint64_t v8 = [v7 unsignedIntegerValue];

  uint64_t v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__MLMultiArray_ConvenientConstruction__doubleVectorWithValues___block_invoke_2;
  v10[3] = &__block_descriptor_48_e25_v32__0__NSNumber_8Q16_B24l;
  void v10[4] = a2;
  v10[5] = v8;
  [v9 enumerateObjectsUsingBlock:v10];
}

void __63__MLMultiArray_ConvenientConstruction__doubleVectorWithValues___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [v6 doubleValue];
  *(void *)(*(void *)(a1 + 32) + 8 * *(void *)(a1 + 40) * a3) = v5;
}

+ (id)doubleMultiArrayWithCopyOfMultiArray:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 shape];
  id v7 = (void *)[v5 initWithShape:v6 dataType:65600 error:0];

  [v4 copyIntoMultiArray:v7 error:0];

  return v7;
}

+ (id)_multiArrayByConcatenatingMultiArrays:(id)a3 alongAxis:(int64_t)a4 dataType:(int64_t)a5
{
  int v70 = a5;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v80 = 0;
  uint64_t v81 = 0;
  LOBYTE(a4) = [a1 validateMultiArrays:v7 forConcatenatingAlongAxis:a4 normalizedAxis:&v81 reason:&v80];
  id v8 = v80;
  if ((a4 & 1) == 0)
  {
    id v65 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0];
    objc_exception_throw(v65);
  }
  v77 = 0;
  v78 = 0;
  unint64_t v79 = 0;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v73 objects:v93 count:16];
  if (!v9)
  {
LABEL_37:

    uint64_t v29 = v77;
    long long v28 = v78;
    long long v30 = operator new(0x88uLL);
    v30[1] = 0;
    v30[2] = 0;
    *long long v30 = &unk_1EF0DD7A0;
    uint64_t v31 = v81;
    v69 = v30;
    *((_OWORD *)v30 + 3) = 0u;
    v30 += 6;
    *((_OWORD *)v30 - 1) = 0u;
    *(v30 - 3) = &unk_1EF0DAF70;
    v71 = (char *)(v30 + 3);
    *((unsigned char *)v30 + 80) = 0;
    *((_OWORD *)v30 + 1) = 0u;
    *((_OWORD *)v30 + 2) = 0u;
    v68 = (char *)v30;
    if (v28 != v29)
    {
      uint64_t v32 = *(void *)v29;
      v86 = 0;
      uint64_t v87 = 0;
      uint64_t v88 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v86, *(const void **)(v32 + 24), *(void *)(v32 + 32), (uint64_t)(*(void *)(v32 + 32) - *(void *)(v32 + 24)) >> 3);
      uint64_t v82 = v31;
      __p = 0;
      v84 = 0;
      uint64_t v85 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v86, v87, (v87 - (uint64_t)v86) >> 3);
      uint64_t v33 = 0;
      uint64_t v34 = v29;
      while (1)
      {
        uint64_t v36 = *(void *)v34;
        uint64_t v35 = (std::__shared_weak_count *)*((void *)v34 + 1);
        if (v35) {
          atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v37 = *(void *)(v36 + 24);
        uint64_t v38 = (*(void *)(v36 + 32) - v37) >> 3;
        uint64_t v39 = __p;
        if (v38 != (v84 - (unsigned char *)__p) >> 3)
        {
          std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v91);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v92, (uint64_t)"The first multi array has a shape with size ", 44);
          v63 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v63, (uint64_t)" but another multi array's shape size is ", 41);
          std::ostream::operator<<();
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::stringbuf::str();
          std::logic_error::logic_error(exception, &v94);
          exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
          __cxa_throw(exception, (struct type_info *)off_1E59A3028, MEMORY[0x1E4FBA1E8]);
        }
        if (v84 != __p)
        {
          uint64_t v40 = v82;
          id v41 = *(void **)(v36 + 24);
          do
          {
            if (v40 && *v41 != *v39)
            {
              std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v91);
              uint64_t v53 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v92, (uint64_t)"The first multi array has a shape ", 34);
              CoreML::shapeToString((uint64_t)&v94, (uint64_t *)&__p);
              if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                v54 = &v94;
              }
              else {
                v54 = (std::string *)v94.__r_.__value_.__r.__words[0];
              }
              if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type size = HIBYTE(v94.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type size = v94.__r_.__value_.__l.__size_;
              }
              __int16 v56 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v53, (uint64_t)v54, size);
              uint64_t v57 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v56, (uint64_t)" but another multi array's shape is ", 36);
              CoreML::shapeToString((uint64_t)v89, (uint64_t *)(v36 + 24));
              if ((v90 & 0x80u) == 0) {
                __int16 v58 = v89;
              }
              else {
                __int16 v58 = (void **)v89[0];
              }
              if ((v90 & 0x80u) == 0) {
                uint64_t v59 = v90;
              }
              else {
                uint64_t v59 = (uint64_t)v89[1];
              }
              uint64_t v60 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v57, (uint64_t)v58, v59);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v60, (uint64_t)"; they cannot be concatenate along with axis: ",
                46);
              v61 = (void *)std::ostream::operator<<();
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v61, (uint64_t)".", 1);
              if ((char)v90 < 0) {
                operator delete(v89[0]);
              }
              if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v94.__r_.__value_.__l.__data_);
              }
              uint64_t v62 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
              std::stringbuf::str();
              std::logic_error::logic_error(v62, &v94);
              v62->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
              __cxa_throw(v62, (struct type_info *)off_1E59A3028, MEMORY[0x1E4FBA1E8]);
            }
            ++v39;
            ++v41;
            --v40;
            --v38;
          }
          while (v38);
        }
        uint64_t v42 = *(void *)(v37 + 8 * v82);
        if (v35) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v35);
        }
        v33 += v42;
        v34 += 16;
        if (v34 == v28)
        {
          if (__p)
          {
            v84 = __p;
            operator delete(__p);
          }
          std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v68, (char *)v86, v87, (v87 - (uint64_t)v86) >> 3);
          *(void *)(*(void *)v68 + 8 * v31) = v33;
          CoreML::MultiArrayBuffer::stridesForConiguousArray((unint64_t **)&v91, (unint64_t **)v68, 0);
          uint64_t v43 = *(void **)v71;
          if (*(void *)v71)
          {
            v69[10] = v43;
            operator delete(v43);
            *(void *)v71 = 0;
            *((void *)v71 + 1) = 0;
            *((void *)v71 + 2) = 0;
          }
          *(_OWORD *)(v69 + 9) = v91;
          v69[11] = v92[0];
          *((_DWORD *)v69 + 24) = v70;
          uint64_t v44 = (unint64_t *)v69[6];
          v45 = (unint64_t *)v69[7];
          unint64_t v46 = 1;
          if (v44 == v45)
          {
            v69[13] = 1;
            *((_WORD *)v69 + 56) = 5;
            v69[15] = 0;
          }
          else
          {
            uint64_t v47 = (unint64_t *)v69[6];
            do
            {
              unint64_t v48 = *v47++;
              unint64_t v49 = v46 * v48;
              if (is_mul_ok(v46, v48)) {
                unint64_t v46 = v49;
              }
              else {
                unint64_t v46 = -1;
              }
            }
            while (v47 != v45);
            v69[13] = v46;
            *((_WORD *)v69 + 56) = 5;
            v69[15] = 0;
            unint64_t v50 = 1;
            do
            {
              unint64_t v51 = *v44++;
              unint64_t v52 = v50 * v51;
              if (is_mul_ok(v50, v51)) {
                unint64_t v50 = v52;
              }
              else {
                unint64_t v50 = -1;
              }
            }
            while (v44 != v45);
          }
          operator new[]();
        }
      }
    }
    v66 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v66, "Nothing to concatenate.");
    v66->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
    __cxa_throw(v66, (struct type_info *)off_1E59A3028, MEMORY[0x1E4FBA1E8]);
  }
  uint64_t v10 = *(void *)v74;
LABEL_4:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v74 != v10) {
      objc_enumerationMutation(obj);
    }
    *(double *)&long long v12 = StorageManager::storage((StorageManager *)&v91, *(void *)(*(void *)(*((void *)&v73 + 1) + 8 * v11) + 8));
    uint64_t v13 = v78;
    if ((unint64_t)v78 < v79)
    {
      *(void *)v78 = v91;
      uint64_t v14 = (std::__shared_weak_count *)*((void *)&v91 + 1);
      *((void *)v13 + 1) = *((void *)&v91 + 1);
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v15 = v13 + 16;
      goto LABEL_30;
    }
    uint64_t v16 = v77;
    uint64_t v17 = (v78 - v77) >> 4;
    unint64_t v18 = v17 + 1;
    if ((unint64_t)(v17 + 1) >> 60) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v19 = v79 - (void)v77;
    if ((uint64_t)(v79 - (void)v77) >> 3 > v18) {
      unint64_t v18 = v19 >> 3;
    }
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v20 = v18;
    }
    if (v20 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v21 = (char *)operator new(16 * v20);
    id v22 = &v21[16 * v17];
    long long v12 = v91;
    *(_OWORD *)id v22 = v91;
    if (*((void *)&v12 + 1))
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 1uLL, memory_order_relaxed);
      uint64_t v13 = v78;
    }
    uint64_t v23 = &v21[16 * v20];
    uint64_t v15 = v22 + 16;
    if (v13 == v16)
    {
      v77 = &v21[16 * v17];
      v78 = v22 + 16;
      unint64_t v79 = (unint64_t)v23;
      if (!v16) {
        goto LABEL_29;
      }
    }
    else
    {
      do
      {
        long long v24 = *((_OWORD *)v13 - 1);
        v13 -= 16;
        *(void *)&long long v12 = v24;
        *((_OWORD *)v22 - 1) = v24;
        v22 -= 16;
        *(void *)uint64_t v13 = 0;
        *((void *)v13 + 1) = 0;
      }
      while (v13 != v16);
      uint64_t v25 = v77;
      uint64_t v16 = v78;
      v77 = v22;
      v78 = v15;
      unint64_t v79 = (unint64_t)v23;
      if (v16 != v25)
      {
        do
        {
          uint64_t v26 = (std::__shared_weak_count *)*((void *)v16 - 1);
          if (v26) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v26);
          }
          v16 -= 16;
        }
        while (v16 != v25);
        uint64_t v16 = v25;
      }
      if (!v16) {
        goto LABEL_29;
      }
    }
    operator delete(v16);
LABEL_29:
    uint64_t v14 = (std::__shared_weak_count *)*((void *)&v91 + 1);
LABEL_30:
    v78 = v15;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    if (++v11 == v9)
    {
      uint64_t v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v93, 16, *(double *)&v12);
      uint64_t v9 = v27;
      if (!v27) {
        goto LABEL_37;
      }
      goto LABEL_4;
    }
  }
}

+ (MLMultiArray)multiArrayByConcatenatingMultiArrays:(NSArray *)multiArrays alongAxis:(NSInteger)axis dataType:(MLMultiArrayDataType)dataType
{
  id v8 = multiArrays;
  uint64_t v9 = (void *)MEMORY[0x19F3C29E0]();
  uint64_t v10 = [a1 _multiArrayByConcatenatingMultiArrays:v8 alongAxis:axis dataType:dataType];

  return (MLMultiArray *)v10;
}

+ (BOOL)validateMultiArrays:(id)a3 forConcatenatingAlongAxis:(int64_t)a4 normalizedAxis:(unint64_t *)a5 reason:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count])
  {
    uint64_t v9 = [v8 objectAtIndexedSubscript:0];
    uint64_t v10 = [v9 shape];

    id v29 = v10;
    uint64_t v11 = [v10 count];
    if (v11 < 0)
    {
      long long v12 = v10;
      if (a6)
      {
        uint64_t v17 = NSString;
        unint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        *a6 = [v17 stringWithFormat:@"The first input MLMultiArray has too many dimensions (%@)", v18];

        BOOL v16 = 0;
LABEL_33:
        long long v12 = v29;
        goto LABEL_34;
      }
    }
    else
    {
      long long v12 = v10;
      if (v11)
      {
        unint64_t v13 = (a4 % v11 + v11) % v11;
        uint64_t v39 = 0;
        uint64_t v40 = &v39;
        uint64_t v41 = 0x3032000000;
        uint64_t v42 = __Block_byref_object_copy__2458;
        uint64_t v43 = __Block_byref_object_dispose__2459;
        id v44 = 0;
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __99__MLMultiArray_Concatenating__validateMultiArrays_forConcatenatingAlongAxis_normalizedAxis_reason___block_invoke;
        v34[3] = &unk_1E59A3C68;
        id v35 = v10;
        uint64_t v36 = &v39;
        uint64_t v37 = v11;
        unint64_t v38 = v13;
        [v8 enumerateObjectsUsingBlock:v34];
        uint64_t v14 = (void *)v40[5];
        if (v14)
        {
          if (a6)
          {
            *a6 = v14;
            uint64_t v15 = (void *)v40[5];
            v40[5] = 0;
          }
LABEL_31:
          BOOL v16 = 0;
        }
        else
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v19 = v8;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v45 count:16];
          if (v20)
          {
            uint64_t v21 = 0;
            uint64_t v22 = *(void *)v31;
            while (2)
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v31 != v22) {
                  objc_enumerationMutation(v19);
                }
                long long v24 = [*(id *)(*((void *)&v30 + 1) + 8 * i) shape];
                uint64_t v25 = [v24 objectAtIndexedSubscript:v13];
                uint64_t v26 = [v25 unsignedIntegerValue];
                if (__CFADD__(v21, v26)) {
                  uint64_t v21 = -1;
                }
                else {
                  v21 += v26;
                }

                if (v21 == -1)
                {
                  if (a6) {
                    *a6 = @"The sum of the dimensions at the concatenating axis was too big and caused an integer overflow.";
                  }

                  goto LABEL_31;
                }
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v45 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

          if (a5) {
            *a5 = v13;
          }
          BOOL v16 = 1;
        }

        _Block_object_dispose(&v39, 8);
        goto LABEL_33;
      }
      if (a6)
      {
        BOOL v16 = 0;
        *a6 = @"MLMultiArray of rank-0 shape (scalar) doesn't support concatenation.";
LABEL_34:

        goto LABEL_35;
      }
    }
    BOOL v16 = 0;
    goto LABEL_34;
  }
  BOOL v16 = 0;
  if (a6) {
    *a6 = @"multiArrays shall not be empty.";
  }
LABEL_35:

  return v16;
}

void __99__MLMultiArray_Concatenating__validateMultiArrays_forConcatenatingAlongAxis_normalizedAxis_reason___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v26 = a2;
  id v7 = [v26 shape];
  uint64_t v8 = [v7 count];
  if (v8 == [*(id *)(a1 + 32) count])
  {
    if (!*(void *)(a1 + 48)) {
      goto LABEL_12;
    }
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v9];
      uint64_t v11 = [v10 integerValue];

      long long v12 = [v7 objectAtIndexedSubscript:v9];
      uint64_t v13 = [v12 integerValue];

      if (v13 < 0)
      {
        uint64_t v21 = NSString;
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:a3];
        BOOL v16 = [v7 componentsJoinedByString:@", "];
        uint64_t v17 = [NSNumber numberWithUnsignedInteger:v9];
        uint64_t v18 = [v21 stringWithFormat:@"%@-th input MLMultiArray has shape (%@), but %@-th dimension shall not be negative.", v15, v16, v17];
        goto LABEL_10;
      }
      if (v9 != *(void *)(a1 + 56) && v13 != v11) {
        break;
      }
      if ((unint64_t)++v9 >= *(void *)(a1 + 48)) {
        goto LABEL_12;
      }
    }
    uint64_t v22 = NSString;
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:a3];
    BOOL v16 = [v7 componentsJoinedByString:@", "];
    uint64_t v17 = [*(id *)(a1 + 32) componentsJoinedByString:@", "];
    uint64_t v20 = [NSNumber numberWithUnsignedInteger:v9];
    objc_msgSend(v22, "stringWithFormat:", @"%@-th input MLMultiArray has shape (%@) but the first input's shape is (%@); %@-th dimension doesn't match.",
      v15,
      v16,
      v17,
    uint64_t v23 = v20);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
  else
  {
    uint64_t v14 = NSString;
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:a3];
    BOOL v16 = [v7 componentsJoinedByString:@", "];
    uint64_t v17 = [*(id *)(a1 + 32) componentsJoinedByString:@", "];
    uint64_t v18 = [v14 stringWithFormat:@"%@-th input MLMultiArray has shape (%@), which is different from the first input's shape: (%@).", v15, v16, v17];
LABEL_10:
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

  *a4 = 1;
LABEL_12:
}

- (BOOL)renderToCVPixelBuffer:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 1278226488)
  {
    return [(MLMultiArray *)self renderToOneComponent8PixelBuffer:a3 error:a5];
  }
  else if (PixelFormatType == 1111970369)
  {
    return [(MLMultiArray *)self renderTo32BGRAPixelBuffer:a3 channelOrderIsBGR:v6 error:a5];
  }
  else
  {
    if (a5)
    {
      *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"pixel format type %c%c%c%c is not supported.", HIBYTE(PixelFormatType), BYTE2(PixelFormatType), BYTE1(PixelFormatType), PixelFormatType];
    }
    return 0;
  }
}

- (BOOL)renderTo32BGRAPixelBuffer:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(MLMultiArray *)self shape];
  if ((unint64_t)[v9 count] < 3)
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 3);
    BOOL v11 = [v10 unsignedIntegerValue] != 3;
  }
  uint64_t v12 = 0;
  while (v12 + 3 < (unint64_t)[v9 count])
  {
    uint64_t v13 = [v9 objectAtIndexedSubscript:v12];
    int v14 = [v13 intValue];

    ++v12;
    if (v14 != 1) {
      goto LABEL_9;
    }
  }
  if (v11)
  {
LABEL_9:
    if (a5)
    {
      uint64_t v15 = [v9 componentsJoinedByString:@", "];
      *a5 = +[MLModelErrorUtils genericErrorWithFormat:and any earlier dimensions must have a size of 1."" CFSTR(Invalid array shape [%@]];
    }
    goto LABEL_11;
  }
  uint64_t v18 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
  vImagePixelCount v19 = [v18 unsignedIntegerValue];

  uint64_t v20 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 2);
  vImagePixelCount v21 = [v20 unsignedIntegerValue];

  if (v19 == CVPixelBufferGetWidth(a3))
  {
    if (v21 == CVPixelBufferGetHeight(a3))
    {
      if ([(MLMultiArray *)self dataType] == MLMultiArrayDataTypeFloat32
        && [(MLMultiArray *)self isContiguousInOrder:0])
      {
        uint64_t v22 = self;
      }
      else
      {
        long long v33 = [MLMultiArray alloc];
        uint64_t v42 = &unk_1EF11A058;
        uint64_t v43 = [NSNumber numberWithUnsignedLong:v21];
        [NSNumber numberWithUnsignedLong:v19];
        v32 = long long v31 = (void *)v43;
        id v44 = v32;
        uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:3];
        id v39 = 0;
        uint64_t v22 = [(MLMultiArray *)v33 initWithShape:v24 dataType:65568 storageOrder:0 error:&v39];
        id v25 = v39;

        if (v25
          || (id v38 = 0,
              [(MLMultiArray *)self vectorizeIntoMultiArray:v22 storageOrder:0 error:&v38], (id v25 = v38) != 0))
        {
          if (a5)
          {
            *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Failed to create temporary buffer for conversion to image"];
          }

          goto LABEL_28;
        }
      }
      if (!CVPixelBufferLockBaseAddress(a3, 0))
      {
        uint64_t v22 = v22;
        uint64_t v26 = [(MLMultiArray *)v22 bytes];
        if (v6) {
          uint64_t v27 = (void *)(v26 + 8 * v21 * v19);
        }
        else {
          uint64_t v27 = (void *)v26;
        }
        red.data = v27;
        red.height = v21;
        red.width = v19;
        red.rowBytes = 4 * v19;
        green.data = (void *)(v26 + 4 * v21 * v19);
        green.height = v21;
        green.width = v19;
        green.rowBytes = 4 * v19;
        if (v6) {
          long long v28 = (void *)v26;
        }
        else {
          long long v28 = (void *)(v26 + 8 * v21 * v19);
        }
        blue.data = v28;
        blue.height = v21;
        blue.width = v19;
        blue.rowBytes = 4 * v19;
        dest.height = v21;
        dest.width = v19;
        dest.data = CVPixelBufferGetBaseAddress(a3);
        dest.rowBytes = CVPixelBufferGetBytesPerRow(a3);
        minFloat[0] = 0;
        minFloat[1] = 0;
        long long maxFloat = xmmword_19EC7B950;
        vImage_Error v29 = vImageConvert_PlanarFToBGRX8888(&blue, &green, &red, 0xFFu, &dest, (const float *)&maxFloat, (const float *)minFloat, 0);
        CVPixelBufferUnlockBaseAddress(a3, 0);
        BOOL v16 = v29 == 0;
        if (a5 && v29)
        {
          long long v30 = [NSNumber numberWithLong:v29];
          +[MLModelErrorUtils genericErrorWithFormat:@"Failed to convert planar to BGRAX888: Code=%@", v30];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_29;
      }
      if (a5)
      {
        +[MLModelErrorUtils genericErrorWithFormat:@"Failed to lock pixel buffer"];
        BOOL v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
LABEL_28:
      BOOL v16 = 0;
LABEL_29:

      goto LABEL_12;
    }
    if (a5)
    {
      id v23 = +[MLModelErrorUtils genericErrorWithFormat:@"Shape's height (%d) doesn't match the pixel buffer's height (%d)", v19, CVPixelBufferGetHeight(a3)];
      goto LABEL_22;
    }
LABEL_11:
    BOOL v16 = 0;
    goto LABEL_12;
  }
  if (!a5) {
    goto LABEL_11;
  }
  id v23 = +[MLModelErrorUtils genericErrorWithFormat:@"Shape's width (%d) doesn't match the pixel buffer's width (%d)", v19, CVPixelBufferGetWidth(a3)];
LABEL_22:
  BOOL v16 = 0;
  *a5 = v23;
LABEL_12:

  return v16;
}

- (BOOL)renderToOneComponent16HalfPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  id v7 = [(MLMultiArray *)self shape];
  char GrayImageDimensionsFromMultiArrayShape = getGrayImageDimensionsFromMultiArrayShape(v7, &v19, &v18, a4);

  if ((GrayImageDimensionsFromMultiArrayShape & 1) == 0) {
    return 0;
  }
  if (CVPixelBufferLockBaseAddress(a3, 0))
  {
    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:@"Failed to lock pixel buffer"];
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    return 0;
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__MLMultiArray_ImageUtils__renderToOneComponent16HalfPixelBuffer_error___block_invoke;
  v13[3] = &unk_1E59A3D08;
  v13[6] = v18;
  void v13[7] = a3;
  void v13[4] = &v14;
  v13[5] = v19;
  [(MLMultiArray *)self getContiguousFirstMajorFloat32BufferWithHandler:v13];
  CVPixelBufferUnlockBaseAddress(a3, 0);
  uint64_t v10 = v15[3];
  BOOL v9 = v10 == 0;
  if (a4 && v10)
  {
    BOOL v11 = objc_msgSend(NSNumber, "numberWithLong:");
    +[MLModelErrorUtils genericErrorWithFormat:@"Failed to convert planar to OneComponent8: Code=%@", v11];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v14, 8);
  return v9;
}

vImage_Error __72__MLMultiArray_ImageUtils__renderToOneComponent16HalfPixelBuffer_error___block_invoke(uint64_t a1, void *a2)
{
  src.data = a2;
  int8x16_t v3 = *(int8x16_t *)(a1 + 40);
  *(int8x16_t *)&src.height = vextq_s8(v3, v3, 8uLL);
  src.rowBytes = 4 * v3.i64[0];
  v5.data = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 56));
  *(int8x16_t *)&v5.height = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v5.rowBytes = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 56));
  vImage_Error result = vImageConvert_PlanarFtoPlanar16F(&src, &v5, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)renderToOneComponent8PixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  id v7 = [(MLMultiArray *)self shape];
  char GrayImageDimensionsFromMultiArrayShape = getGrayImageDimensionsFromMultiArrayShape(v7, &v19, &v18, a4);

  if ((GrayImageDimensionsFromMultiArrayShape & 1) == 0) {
    return 0;
  }
  if (CVPixelBufferLockBaseAddress(a3, 0))
  {
    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:@"Failed to lock pixel buffer"];
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    return 0;
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__MLMultiArray_ImageUtils__renderToOneComponent8PixelBuffer_error___block_invoke;
  v13[3] = &unk_1E59A3D08;
  v13[6] = v18;
  void v13[7] = a3;
  void v13[4] = &v14;
  v13[5] = v19;
  [(MLMultiArray *)self getContiguousFirstMajorFloat32BufferWithHandler:v13];
  CVPixelBufferUnlockBaseAddress(a3, 0);
  uint64_t v10 = v15[3];
  BOOL v9 = v10 == 0;
  if (a4 && v10)
  {
    BOOL v11 = objc_msgSend(NSNumber, "numberWithLong:");
    +[MLModelErrorUtils genericErrorWithFormat:@"Failed to convert planar to OneComponent8: Code=%@", v11];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v14, 8);
  return v9;
}

vImage_Error __67__MLMultiArray_ImageUtils__renderToOneComponent8PixelBuffer_error___block_invoke(uint64_t a1, void *a2)
{
  src.data = a2;
  int8x16_t v3 = *(int8x16_t *)(a1 + 40);
  *(int8x16_t *)&src.height = vextq_s8(v3, v3, 8uLL);
  src.rowBytes = 4 * v3.i64[0];
  v5.data = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 56));
  *(int8x16_t *)&v5.height = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v5.rowBytes = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 56));
  vImage_Error result = vImageConvert_PlanarFtoPlanar8(&src, &v5, 255.0, 0.0, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)getContiguousFirstMajorFloat32BufferWithHandler:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MLMultiArray *)self dataType] == MLMultiArrayDataTypeFloat32
    && [(MLMultiArray *)self isContiguousInOrder:0])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__MLMultiArray_ImageUtils__getContiguousFirstMajorFloat32BufferWithHandler___block_invoke;
    v11[3] = &unk_1E59A3CE0;
    uint64_t v12 = (MLMultiArray *)v4;
    [(MLMultiArray *)self getBytesWithHandler:v11];
    vImage_Buffer v5 = v12;
  }
  else
  {
    BOOL v6 = [MLMultiArray alloc];
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[MLMultiArray count](self, "count"));
    v13[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    vImage_Buffer v5 = [(MLMultiArray *)v6 initWithShape:v8 dataType:65568 error:0];

    [(MLMultiArray *)self vectorizeIntoMultiArray:v5 storageOrder:0 error:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__MLMultiArray_ImageUtils__getContiguousFirstMajorFloat32BufferWithHandler___block_invoke_2;
    v9[3] = &unk_1E59A3CE0;
    id v10 = v4;
    [(MLMultiArray *)v5 getBytesWithHandler:v9];
  }
}

uint64_t __76__MLMultiArray_ImageUtils__getContiguousFirstMajorFloat32BufferWithHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3 / 4);
}

uint64_t __76__MLMultiArray_ImageUtils__getContiguousFirstMajorFloat32BufferWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3 / 4);
}

+ (__CVBuffer)pixelBufferBGRA8FromMultiArrayCHW:(id)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 shape];
  if ((unint64_t)[v8 count] < 3)
  {
    BOOL v10 = 1;
  }
  else
  {
    BOOL v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 3);
    BOOL v10 = [v9 unsignedIntegerValue] != 3;
  }
  uint64_t v11 = 0;
  while (v11 + 3 < (unint64_t)[v8 count])
  {
    uint64_t v12 = [v8 objectAtIndexedSubscript:v11];
    int v13 = [v12 intValue];

    ++v11;
    if (v13 != 1) {
      goto LABEL_9;
    }
  }
  if (v10)
  {
LABEL_9:
    if (!a5) {
      goto LABEL_13;
    }
    uint64_t v14 = [v8 componentsJoinedByString:@", "];
    *a5 = +[MLModelErrorUtils genericErrorWithFormat:and any earlier dimensions must have a size of 1."" CFSTR(Invalid array shape [%@]];
    goto LABEL_11;
  }
  uint64_t v16 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);
  size_t v17 = [v16 unsignedIntegerValue];

  uint64_t v18 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 2);
  size_t v19 = [v18 unsignedIntegerValue];

  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v17, v19, 0x42475241u, 0, &pixelBufferOut))
  {
    if (a5)
    {
      uint64_t v14 = [NSNumber numberWithUnsignedLong:v17];
      uint64_t v20 = [NSNumber numberWithUnsignedLong:v19];
      *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Failed to create BGRA image %@ x %@", v14, v20];

LABEL_11:
LABEL_12:
      a5 = 0;
    }
  }
  else
  {
    char v21 = [v7 renderTo32BGRAPixelBuffer:pixelBufferOut channelOrderIsBGR:v6 error:a5];
    a5 = (id *)pixelBufferOut;
    if ((v21 & 1) == 0)
    {
      CVPixelBufferRelease(pixelBufferOut);
      goto LABEL_12;
    }
  }
LABEL_13:

  return (__CVBuffer *)a5;
}

+ (__CVBuffer)pixelBufferGray16HalfFromMultiArrayHW:(id)a3 error:(id *)a4
{
  id v5 = a3;
  size_t v13 = 0;
  size_t v14 = 0;
  BOOL v6 = [v5 shape];
  char GrayImageDimensionsFromMultiArrayShape = getGrayImageDimensionsFromMultiArrayShape(v6, (uint64_t *)&v14, (uint64_t *)&v13, a4);

  if ((GrayImageDimensionsFromMultiArrayShape & 1) == 0) {
    goto LABEL_7;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14, v13, 0x4C303068u, 0, &pixelBufferOut))
  {
    if (a4)
    {
      uint64_t v8 = [NSNumber numberWithUnsignedLong:v14];
      BOOL v9 = [NSNumber numberWithUnsignedLong:v13];
      *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"Failed to create BGRA image %@ x %@", v8, v9];

LABEL_7:
      a4 = 0;
    }
  }
  else
  {
    char v10 = [v5 renderToOneComponent16HalfPixelBuffer:pixelBufferOut error:a4];
    a4 = (id *)pixelBufferOut;
    if ((v10 & 1) == 0)
    {
      CVPixelBufferRelease(pixelBufferOut);
      goto LABEL_7;
    }
  }

  return (__CVBuffer *)a4;
}

+ (__CVBuffer)pixelBufferGray8FromMultiArrayHW:(id)a3 error:(id *)a4
{
  id v5 = a3;
  size_t v13 = 0;
  size_t v14 = 0;
  BOOL v6 = [v5 shape];
  char GrayImageDimensionsFromMultiArrayShape = getGrayImageDimensionsFromMultiArrayShape(v6, (uint64_t *)&v14, (uint64_t *)&v13, a4);

  if ((GrayImageDimensionsFromMultiArrayShape & 1) == 0) {
    goto LABEL_7;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14, v13, 0x4C303038u, 0, &pixelBufferOut))
  {
    if (a4)
    {
      uint64_t v8 = [NSNumber numberWithUnsignedLong:v14];
      BOOL v9 = [NSNumber numberWithUnsignedLong:v13];
      *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"Failed to create BGRA image %@ x %@", v8, v9];

LABEL_7:
      a4 = 0;
    }
  }
  else
  {
    char v10 = [v5 renderToOneComponent8PixelBuffer:pixelBufferOut error:a4];
    a4 = (id *)pixelBufferOut;
    if ((v10 & 1) == 0)
    {
      CVPixelBufferRelease(pixelBufferOut);
      goto LABEL_7;
    }
  }

  return (__CVBuffer *)a4;
}

+ (id)newMultiArrayForState:(id)a3 strides:(id)a4 dtype:(int64_t)a5 error:(id *)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v8 count] >= 2)
  {
    BOOL v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 2);
    uint64_t v10 = [v9 unsignedLongValue];
LABEL_5:
    uint64_t v11 = 2 * v10;

    goto LABEL_7;
  }
  if ([v8 count] == 1)
  {
    BOOL v9 = [v7 lastObject];
    uint64_t v10 = [v9 unsignedLongValue];
    goto LABEL_5;
  }
  uint64_t v11 = 2;
LABEL_7:
  if ([v7 count])
  {
    uint64_t v12 = [v7 lastObject];
    unint64_t v13 = [v12 unsignedLongValue];
  }
  else
  {
    unint64_t v13 = 1;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v51;
    unint64_t v17 = 1;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(id *)(*((void *)&v50 + 1) + 8 * i);
        unint64_t v17 = CoreML::SafeMultiplies<unsigned long>::operator()([v19 unsignedLongValue], v17);
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v15);
  }
  else
  {
    unint64_t v17 = 1;
  }

  uint64_t v20 = *MEMORY[0x1E4F2F128];
  v62[0] = @"CoreML State";
  uint64_t v21 = *MEMORY[0x1E4F2EFE0];
  v61[0] = v20;
  v61[1] = v21;
  uint64_t v22 = [NSNumber numberWithUnsignedLong:v11];
  uint64_t v23 = *MEMORY[0x1E4F2F150];
  v62[1] = v22;
  v62[2] = &unk_1EF11A358;
  uint64_t v24 = *MEMORY[0x1E4F2F2C0];
  v61[2] = v23;
  v61[3] = v24;
  id v25 = [NSNumber numberWithUnsignedLong:v13];
  v62[3] = v25;
  v61[4] = *MEMORY[0x1E4F2F0E8];
  uint64_t v26 = [NSNumber numberWithUnsignedLong:v17 / v13];
  v62[4] = v26;
  CFDictionaryRef v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:5];

  long long v28 = IOSurfaceCreate(v27);
  if (v28)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    *(void *)buf = v28;
    uint64_t v29 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v28, 0, &pixelBufferOut);
    CVPixelBufferRef v30 = pixelBufferOut;
    if (pixelBufferOut)
    {
      *(void *)__int16 v58 = pixelBufferOut;
      if ((unint64_t)[v8 count] < 2 || v11 == CVPixelBufferGetBytesPerRow(pixelBufferOut))
      {
        long long v31 = [[MLMultiArray alloc] initWithPixelBuffer:v30 shape:v14];
      }
      else
      {
        uint64_t v41 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v47 = 0;
          _os_log_error_impl(&dword_19E58B000, v41, OS_LOG_TYPE_ERROR, "Could not create pixel buffer for state with required bytes per row.", v47, 2u);
        }

        if (a6)
        {
          uint64_t v42 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v54 = *MEMORY[0x1E4F28568];
          uint64_t v43 = [NSString stringWithFormat:@"Could not create pixel buffer for state with required bytes per row."];
          uint64_t v55 = v43;
          id v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          *a6 = [v42 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v44];
        }
        long long v31 = 0;
      }
      std::unique_ptr<__CVBuffer,MLE5ObjectDeleter<__CVBuffer>>::reset[abi:ne180100]((__CVBuffer **)v58);
    }
    else
    {
      uint64_t v36 = v29;
      uint64_t v37 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int16 v58 = 67109120;
        *(_DWORD *)&v58[4] = v36;
        _os_log_error_impl(&dword_19E58B000, v37, OS_LOG_TYPE_ERROR, "Failed to make backing pixel buffer for state with error %i.", v58, 8u);
      }

      if (a6)
      {
        id v38 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        id v39 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to make backing pixel buffer for state with error %i.", v36);
        uint64_t v57 = v39;
        uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        *a6 = [v38 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v40];
      }
      long long v31 = 0;
    }
    std::unique_ptr<__IOSurface,MLE5ObjectDeleter<__IOSurface>>::reset[abi:ne180100]((const void **)buf);
  }
  else
  {
    long long v32 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "Failed to make backing IOSurface for state.", buf, 2u);
    }

    if (a6)
    {
      long long v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      uint64_t v34 = [NSString stringWithFormat:@"Failed to make backing IOSurface for state."];
      uint64_t v60 = v34;
      id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      *a6 = [v33 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v35];
    }
    long long v31 = 0;
  }

  return v31;
}

@end