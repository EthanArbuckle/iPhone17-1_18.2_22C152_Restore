@interface VNFgBgE5MLProcess
+ (id)multiArrayForOutput:(id)a3 inNamedObjects:(id)a4 fromFunctionDescriptor:(id)a5 error:(id *)a6;
- (NSArray)inputTensorNames;
- (NSArray)outputTensorNames;
- (NSString)inputImageName;
- (NSURL)modelURL;
- (VNFgBgE5MLProcess)initWithConfiguration:(id)a3;
- (id)newInputsForFunctionDescriptor:(id)a3 inputSurfaces:(id)a4 croppedPixelBuffer:(__CVBuffer *)a5 error:(id *)a6;
@end

@implementation VNFgBgE5MLProcess

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputImageName, 0);

  objc_storeStrong((id *)&self->_modelURL, 0);
}

- (NSArray)outputTensorNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)inputTensorNames
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)inputImageName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (id)newInputsForFunctionDescriptor:(id)a3 inputSurfaces:(id)a4 croppedPixelBuffer:(__CVBuffer *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4FB3ED8]);
  if (a5)
  {
    v12 = [v9 onlyInputImage];
    v13 = v12;
    if (v12)
    {
      v14 = [v12 name];
      char v15 = [v11 assignPixelBuffer:a5 toName:v14 error:a6];

      if (v15) {
        goto LABEL_4;
      }
    }
    else
    {
      if (!a6) {
        goto LABEL_12;
      }
      v23 = +[VNFgBgInstanceSegmenterError genericErrorImageDescription];
      *a6 = +[VNFgBgInstanceSegmenterError errorWithCode:-2 description:v23];
    }
LABEL_11:
    a6 = 0;
    goto LABEL_12;
  }
LABEL_4:
  unint64_t v16 = 0;
  while (1)
  {
    v17 = [v10 inputTensors];
    unint64_t v18 = [v17 count];

    if (v18 <= v16) {
      break;
    }
    v19 = [v10 inputTensors];
    v20 = [v19 objectAtIndexedSubscript:v16];

    uint64_t v21 = [v20 valueRef];
    v22 = [v20 name];
    LOBYTE(v21) = [v11 assignSurface:v21 toName:v22 error:a6];

    ++v16;
    if ((v21 & 1) == 0) {
      goto LABEL_11;
    }
  }
  a6 = (id *)v11;
LABEL_12:

  return a6;
}

- (VNFgBgE5MLProcess)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNFgBgE5MLProcess;
  v5 = [(VNFgBgE5MLProcess *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 modelURL];
    modelURL = v5->_modelURL;
    v5->_modelURL = (NSURL *)v6;

    uint64_t v8 = [v4 inputImageName];
    inputImageName = v5->_inputImageName;
    v5->_inputImageName = (NSString *)v8;

    uint64_t v10 = [v4 inputTensorNames];
    inputTensorNames = v5->_inputTensorNames;
    v5->_inputTensorNames = (NSArray *)v10;

    uint64_t v12 = [v4 outputTensorNames];
    outputTensorNames = v5->_outputTensorNames;
    v5->_outputTensorNames = (NSArray *)v12;
  }
  return v5;
}

+ (id)multiArrayForOutput:(id)a3 inNamedObjects:(id)a4 fromFunctionDescriptor:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v11 outputNamed:v9 error:a6];
  v13 = v12;
  if (v12)
  {
    v23 = [v12 shape];
    v14 = [v13 strides];
    uint64_t v15 = [v13 dataType];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3791;
    v33 = __Block_byref_object_dispose__3792;
    id v34 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__VNFgBgE5MLProcess_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke;
    aBlock[3] = &unk_1E5B1C340;
    uint64_t v28 = v15;
    id v16 = v23;
    id v25 = v16;
    id v17 = v14;
    id v26 = v17;
    v27 = &v29;
    unint64_t v18 = _Block_copy(aBlock);
    v19 = [v13 name];
    char v20 = [v10 accessReadOnlyDataForName:v19 usingBlock:v18 error:a6];

    if (v20) {
      id v21 = (id)v30[5];
    }
    else {
      id v21 = 0;
    }

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

uint64_t __85__VNFgBgE5MLProcess_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[v3 bytes];
  if (*(void *)(a1 + 56) == 65552)
  {
    v5 = malloc_type_calloc(2 * [v3 length], 1uLL, 0xF40C5F06uLL);
    unint64_t v6 = [v3 length];
    src.data = v4;
    src.height = 1;
    src.width = v6 >> 1;
    src.rowBytes = v6 & 0xFFFFFFFFFFFFFFFELL;
    dest.data = v5;
    dest.height = 1;
    dest.width = v6 >> 1;
    dest.rowBytes = 4 * (v6 >> 1);
    vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
  }
  else
  {
    v5 = malloc_type_calloc([v3 length], 1uLL, 0xE9B4EAB2uLL);
    memcpy(v4, v5, [v3 length]);
  }
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(objc_msgSend(*(id *)(a1 + 32), "sizes") + 8));
  v22[0] = v7;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(objc_msgSend(*(id *)(a1 + 32), "sizes") + 16));
  v22[1] = v8;
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(objc_msgSend(*(id *)(a1 + 32), "sizes") + 24));
  v22[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];

  id v11 = objc_msgSend(NSNumber, "numberWithLong:", *(void *)(objc_msgSend(*(id *)(a1 + 40), "byteOffsets") + 8) / 2);
  v21[0] = v11;
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithLong:", *(void *)(objc_msgSend(*(id *)(a1 + 40), "byteOffsets") + 16) / 2);
  v21[1] = v12;
  v13 = objc_msgSend(NSNumber, "numberWithLong:", *(void *)(objc_msgSend(*(id *)(a1 + 40), "byteOffsets") + 24) / 2);
  v21[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];

  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1E9A8]) initWithDataPointer:v5 shape:v10 dataType:65568 strides:v14 deallocator:&__block_literal_global_3795 error:0];
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  return 1;
}

void __85__VNFgBgE5MLProcess_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke_2(int a1, void *a2)
{
}

@end