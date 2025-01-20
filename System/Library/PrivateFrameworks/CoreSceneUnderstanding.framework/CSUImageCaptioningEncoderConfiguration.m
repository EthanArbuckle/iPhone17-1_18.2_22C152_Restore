@interface CSUImageCaptioningEncoderConfiguration
+ (id)CSUImageCaptioningEncoderConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)availableRevisions;
+ (id)createCSUImageCaptioningEncoderConfigurationWithConfigPath:(id)a3 error:(id *)a4;
+ (id)createCSUImageCaptioningEncoderConfigurationWithEspressoPath:(id)a3 andNetworkParams:(id)a4 error:(id *)a5;
+ (int64_t)_resolvedRevision:(int64_t)a3;
- (CSUPixelBufferDescriptor)inputPixelBufferDescriptor;
- (MLComputeDeviceProtocol)computeDevice;
- (NSString)encoderNetworkPath;
- (NSString)imageEmbeddingTensorName;
- (NSString)inputImageTensorName;
- (id)initImageCaptioningEncoderConfigurationForRevision:(int64_t)a3 espressoNetPath:(id)a4 inputImageTensorName:(id)a5 inputImageDimension:(unint64_t)a6 inputImageBytesPerRowAlignment:(unint64_t)a7 imageEmbeddingTensorName:(id)a8;
- (int)espressoExecutionEngine;
- (int64_t)revision;
- (void)setComputeDevice:(id)a3;
- (void)setEspressoExecutionEngine:(int)a3;
@end

@implementation CSUImageCaptioningEncoderConfiguration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = a3;
  }
  if (a3 == -1) {
    return 1;
  }
  else {
    return v3;
  }
}

+ (id)CSUImageCaptioningEncoderConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  v12 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  if (objc_msgSend__resolvedRevision_(a1, v13, a3, v14, v15) == 1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v16, @"ImageCaptioning-ax_v1.0.0_encoder", @"espresso.net", @"ImageCaptioning-ax_v1.0.0");
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    id v19 = objc_alloc((Class)a1);
    inited = objc_msgSend_initImageCaptioningEncoderConfigurationForRevision_espressoNetPath_inputImageTensorName_inputImageDimension_inputImageBytesPerRowAlignment_imageEmbeddingTensorName_(v19, v20, 1, (uint64_t)a4, @"image/Placeholder:0", 448, 4096, @"att_feats");
  }
  else
  {
    if (a4)
    {
      v22 = NSString;
      v23 = objc_msgSend_numberWithInteger_(NSNumber, v16, a3, v17, v18);
      v27 = objc_msgSend_stringWithFormat_(v22, v24, @"Unsupported captioning image encoder revision %@", v25, v26, v23);
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v28, (uint64_t)v27, v29, v30);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
    inited = 0;
  }

  return inited;
}

+ (id)createCSUImageCaptioningEncoderConfigurationWithConfigPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  *a4 = 0;
  uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_fileExistsAtPath_(v11, v12, (uint64_t)v6, v13, v14);
  id v19 = objc_msgSend_stringWithFormat_(NSString, v16, @"encoder config file does not exist at path %@", v17, v18, v6);
  char v21 = objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v20, v15, (uint64_t)a4, (uint64_t)v19);

  if ((v21 & 1) == 0)
  {
    v56 = 0;
    goto LABEL_11;
  }
  uint64_t v25 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v22, (uint64_t)v6, v23, v24);
  if ((objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v26, v25 != 0, (uint64_t)a4, @"encoder config path could not be read!") & 1) == 0)
  {
    v28 = 0;
LABEL_9:
    v56 = 0;
    goto LABEL_10;
  }
  v28 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v27, (uint64_t)v25, 0, (uint64_t)a4);
  if (!objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v29, *a4 == 0, (uint64_t)a4, @"encoder config path could not be read!"))goto LABEL_9; {
  v36 = objc_msgSend_valueForKey_(v28, v30, @"encoderNetworkPath", v31, v32);
  }
  if (!v36) {
    goto LABEL_9;
  }
  v37 = objc_msgSend_valueForKey_(v28, v33, @"encoderNetworkParams", v34, v35);

  if (!v37) {
    goto LABEL_9;
  }
  v42 = objc_msgSend_stringByDeletingLastPathComponent(v6, v38, v39, v40, v41);
  v46 = objc_msgSend_objectForKeyedSubscript_(v28, v43, @"encoderNetworkPath", v44, v45);
  v50 = objc_msgSend_stringByAppendingPathComponent_(v42, v47, (uint64_t)v46, v48, v49);

  v54 = objc_msgSend_objectForKeyedSubscript_(v28, v51, @"encoderNetworkParams", v52, v53);
  v56 = objc_msgSend_createCSUImageCaptioningEncoderConfigurationWithEspressoPath_andNetworkParams_error_(a1, v55, (uint64_t)v50, (uint64_t)v54, (uint64_t)a4);

LABEL_10:
LABEL_11:

  return v56;
}

+ (id)createCSUImageCaptioningEncoderConfigurationWithEspressoPath:(id)a3 andNetworkParams:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  *a5 = 0;
  uint64_t v14 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_fileExistsAtPath_(v14, v15, (uint64_t)v8, v16, v17);
  v22 = objc_msgSend_stringWithFormat_(NSString, v19, @"encoder network file does not exist %@", v20, v21, v8);
  uint64_t v25 = objc_msgSend_CSUAssert_log_(CSUError, v23, v18, (uint64_t)v22, v24);
  objc_msgSend_errorFromErrors_And_(CSUError, v26, (uint64_t)v25, (uint64_t)*a5, v27);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  id v28 = *a5;
  uint64_t v32 = objc_msgSend_valueForKey_(v9, v29, @"inputImageTensorName", v30, v31);
  uint64_t v35 = objc_msgSend_CSUAssert_log_(CSUError, v33, v32 != 0, @"Name for input encoded features tensor for decoder not specified", v34);
  objc_msgSend_errorFromErrors_And_(CSUError, v36, (uint64_t)v28, (uint64_t)v35, v37);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  id v38 = *a5;
  v42 = objc_msgSend_valueForKey_(v9, v39, @"inputImageDimension", v40, v41);
  uint64_t v45 = objc_msgSend_CSUAssert_log_(CSUError, v43, v42 != 0, @"Name for input word IDs tensor for decoder not specified", v44);
  objc_msgSend_errorFromErrors_And_(CSUError, v46, (uint64_t)v38, (uint64_t)v45, v47);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  id v48 = *a5;
  uint64_t v52 = objc_msgSend_valueForKey_(v9, v49, @"imageEmbeddingTensorName", v50, v51);
  v55 = objc_msgSend_CSUAssert_log_(CSUError, v53, v52 != 0, @"Name for output words probability tensor for decoder not specified", v54);
  objc_msgSend_errorFromErrors_And_(CSUError, v56, (uint64_t)v48, (uint64_t)v55, v57);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  if (*a5)
  {
    inited = 0;
  }
  else
  {
    unsigned int hasSuffix = objc_msgSend_hasSuffix_(v8, v58, @".net", v59, v60);
    id v63 = objc_alloc((Class)a1);
    v67 = objc_msgSend_objectForKeyedSubscript_(v9, v64, @"inputImageTensorName", v65, v66);
    v71 = objc_msgSend_objectForKeyedSubscript_(v9, v68, @"inputImageDimension", v69, v70);
    uint64_t v76 = objc_msgSend_unsignedLongValue(v71, v72, v73, v74, v75);
    v80 = objc_msgSend_objectForKeyedSubscript_(v9, v77, @"imageEmbeddingTensorName", v78, v79);
    inited = objc_msgSend_initImageCaptioningEncoderConfigurationForRevision_espressoNetPath_inputImageTensorName_inputImageDimension_inputImageBytesPerRowAlignment_imageEmbeddingTensorName_(v63, v81, hasSuffix, (uint64_t)v8, (uint64_t)v67, v76, 4096, v80);
  }
  return inited;
}

- (id)initImageCaptioningEncoderConfigurationForRevision:(int64_t)a3 espressoNetPath:(id)a4 inputImageTensorName:(id)a5 inputImageDimension:(unint64_t)a6 inputImageBytesPerRowAlignment:(unint64_t)a7 imageEmbeddingTensorName:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  v55.receiver = self;
  v55.super_class = (Class)CSUImageCaptioningEncoderConfiguration;
  uint64_t v17 = [(CSUImageCaptioningEncoderConfiguration *)&v55 init];
  v22 = v17;
  if (v17)
  {
    v17->_revision = a3;
    uint64_t v23 = objc_msgSend_copy(v14, v18, v19, v20, v21);
    encoderNetworkPath = v22->_encoderNetworkPath;
    v22->_encoderNetworkPath = (NSString *)v23;

    uint64_t v29 = objc_msgSend_copy(v15, v25, v26, v27, v28);
    inputImageTensorName = v22->_inputImageTensorName;
    v22->_inputImageTensorName = (NSString *)v29;

    uint64_t v35 = objc_msgSend_copy(v16, v31, v32, v33, v34);
    imageEmbeddingTensorName = v22->_imageEmbeddingTensorName;
    v22->_imageEmbeddingTensorName = (NSString *)v35;

    v22->_espressoExecutionEngine = 0x7FFFFFFF;
    uint64_t v37 = objc_alloc_init(CSUPixelBufferDescriptor);
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
  int result = self->_espressoExecutionEngine;
  if (result == 0x7FFFFFFF)
  {
    v7 = objc_msgSend_computeDevice(self, a2, v2, v3, v4);
    self->_espressoExecutionEngine = sub_24C689C00(v7);

    return self->_espressoExecutionEngine;
  }
  return result;
}

- (void)setEspressoExecutionEngine:(int)a3
{
  self->_espressoExecutionEngine = a3;
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

- (NSString)encoderNetworkPath
{
  return self->_encoderNetworkPath;
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
  objc_storeStrong((id *)&self->_encoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
  objc_storeStrong((id *)&self->_inputPixelBufferDescriptor, 0);
}

@end