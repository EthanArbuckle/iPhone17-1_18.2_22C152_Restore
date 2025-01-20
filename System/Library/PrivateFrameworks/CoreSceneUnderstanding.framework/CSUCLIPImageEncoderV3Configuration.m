@interface CSUCLIPImageEncoderV3Configuration
+ (id)CLIPImageEncoderV3ConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)availableRevisions;
+ (int64_t)_resolvedRevision:(int64_t)a3;
- (CSUPixelBufferDescriptor)inputPixelBufferDescriptor;
- (MLComputeDeviceProtocol)computeDevice;
- (NSString)espressoNetworkPath;
- (NSString)imageEmbeddingTensorName;
- (NSString)inputImageTensorName;
- (id)initCLIPImageEncoderV3ConfigurationForRevision:(int64_t)a3 espressoNetPath:(id)a4 inputImageTensorName:(id)a5 inputImageDimension:(unint64_t)a6 inputImageBytesPerRowAlignment:(unint64_t)a7 imageEmbeddingTensorName:(id)a8;
- (int)espressoExecutionEngine;
- (int64_t)revision;
- (void)setComputeDevice:(id)a3;
@end

@implementation CSUCLIPImageEncoderV3Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (id)CLIPImageEncoderV3ConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  v12 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  if (objc_msgSend__resolvedRevision_(a1, v13, a3, v14, v15) == 1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v16, @"SceneNet_v5.13.0_8wiqmpbbig_fe1.3_sc3.3_sa2.4_ae2.4_so2.4_od1.5_fp1.5_en0.2", @"espresso.net", @"scenenet_v5_model/SceneNet_v5.13.0_8wiqmpbbig_fe1.3_sc3.3_sa2.4_ae2.4_so2.4_od1.5_fp1.5_en0.2");
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    id v19 = objc_alloc((Class)a1);
    inited = objc_msgSend_initCLIPImageEncoderV3ConfigurationForRevision_espressoNetPath_inputImageTensorName_inputImageDimension_inputImageBytesPerRowAlignment_imageEmbeddingTensorName_(v19, v20, 1, (uint64_t)a4, @"image", 360, 4096, @"inner/sceneprint");
  }
  else
  {
    if (a4)
    {
      v22 = NSString;
      v23 = objc_msgSend_numberWithInteger_(NSNumber, v16, a3, v17, v18);
      v27 = objc_msgSend_stringWithFormat_(v22, v24, @"Unsupported CLIPImageEncoderV3 revision %@", v25, v26, v23);
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v28, (uint64_t)v27, v29, v30);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
    inited = 0;
  }

  return inited;
}

- (id)initCLIPImageEncoderV3ConfigurationForRevision:(int64_t)a3 espressoNetPath:(id)a4 inputImageTensorName:(id)a5 inputImageDimension:(unint64_t)a6 inputImageBytesPerRowAlignment:(unint64_t)a7 imageEmbeddingTensorName:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  v55.receiver = self;
  v55.super_class = (Class)CSUCLIPImageEncoderV3Configuration;
  uint64_t v17 = [(CSUCLIPImageEncoderV3Configuration *)&v55 init];
  v22 = v17;
  if (v17)
  {
    v17->_revision = a3;
    uint64_t v23 = objc_msgSend_copy(v14, v18, v19, v20, v21);
    espressoNetworkPath = v22->_espressoNetworkPath;
    v22->_espressoNetworkPath = (NSString *)v23;

    uint64_t v29 = objc_msgSend_copy(v15, v25, v26, v27, v28);
    inputImageTensorName = v22->_inputImageTensorName;
    v22->_inputImageTensorName = (NSString *)v29;

    uint64_t v35 = objc_msgSend_copy(v16, v31, v32, v33, v34);
    imageEmbeddingTensorName = v22->_imageEmbeddingTensorName;
    v22->_imageEmbeddingTensorName = (NSString *)v35;

    v37 = objc_alloc_init(CSUPixelBufferDescriptor);
    inputPixelBufferDescriptor = v22->_inputPixelBufferDescriptor;
    v22->_inputPixelBufferDescriptor = v37;

    objc_msgSend_setWidth_(v22->_inputPixelBufferDescriptor, v39, a6, v40, v41);
    objc_msgSend_setHeight_(v22->_inputPixelBufferDescriptor, v42, a6, v43, v44);
    objc_msgSend_setPixelFormat_(v22->_inputPixelBufferDescriptor, v45, 1111970369, v46, v47);
    objc_msgSend_setBytesPerRowAlignment_(v22->_inputPixelBufferDescriptor, v48, a7, v49, v50);
    objc_msgSend_setIsIOSurfaceBacked_(v22->_inputPixelBufferDescriptor, v51, 1, v52, v53);
  }

  return v22;
}

+ (id)availableRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

- (int)espressoExecutionEngine
{
  uint64_t v5 = objc_msgSend_computeDevice(self, a2, v2, v3, v4);
  int v6 = sub_24C689C00(v5);

  return v6;
}

- (CSUPixelBufferDescriptor)inputPixelBufferDescriptor
{
  return self->_inputPixelBufferDescriptor;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)espressoNetworkPath
{
  return self->_espressoNetworkPath;
}

- (NSString)inputImageTensorName
{
  return self->_inputImageTensorName;
}

- (NSString)imageEmbeddingTensorName
{
  return self->_imageEmbeddingTensorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageEmbeddingTensorName, 0);
  objc_storeStrong((id *)&self->_inputImageTensorName, 0);
  objc_storeStrong((id *)&self->_espressoNetworkPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
  objc_storeStrong((id *)&self->_inputPixelBufferDescriptor, 0);
}

@end