@interface VNRecognizeDocumentElementsRequestConfiguration
- (VNRecognizeDocumentElementsRequestConfiguration)initWithRequestClass:(Class)a3;
- (VNRecognizeDocumentElementsRequestElementConfiguration)documentElements;
- (VNRecognizeDocumentElementsRequestElementConfiguration)machineReadableCodeElements;
- (VNRecognizeDocumentElementsRequestElementConfiguration)textElements;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
@end

@implementation VNRecognizeDocumentElementsRequestConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machineReadableCodeElements, 0);
  objc_storeStrong((id *)&self->_textElements, 0);

  objc_storeStrong((id *)&self->_documentElements, 0);
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)machineReadableCodeElements
{
  return (VNRecognizeDocumentElementsRequestElementConfiguration *)objc_getProperty(self, a2, 168, 1);
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)textElements
{
  return (VNRecognizeDocumentElementsRequestElementConfiguration *)objc_getProperty(self, a2, 160, 1);
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)documentElements
{
  return (VNRecognizeDocumentElementsRequestElementConfiguration *)objc_getProperty(self, a2, 152, 1);
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  self->_imageCropAndScaleOption = a3;
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VNRecognizeDocumentElementsRequestConfiguration;
  v4 = [(VNImageBasedRequestConfiguration *)&v13 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    v4[18] = self->_imageCropAndScaleOption;
    uint64_t v6 = [(VNRecognizeDocumentElementsRequestElementConfiguration *)self->_documentElements copy];
    v7 = (void *)v5[19];
    v5[19] = v6;

    uint64_t v8 = [(VNRecognizeDocumentElementsRequestElementConfiguration *)self->_textElements copy];
    v9 = (void *)v5[20];
    v5[20] = v8;

    uint64_t v10 = [(VNRecognizeDocumentElementsRequestElementConfiguration *)self->_machineReadableCodeElements copy];
    v11 = (void *)v5[21];
    v5[21] = v10;
  }
  return v5;
}

- (VNRecognizeDocumentElementsRequestConfiguration)initWithRequestClass:(Class)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VNRecognizeDocumentElementsRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v12 initWithRequestClass:a3];
  v4 = v3;
  if (v3)
  {
    v3->_imageCropAndScaleOption = 2;
    v5 = +[VNRecognizeDocumentElementsRequestElementConfiguration newConfiguration];
    documentElements = v4->_documentElements;
    v4->_documentElements = v5;

    v7 = +[VNRecognizeDocumentElementsRequestElementConfiguration newConfiguration];
    textElements = v4->_textElements;
    v4->_textElements = v7;

    v9 = +[VNRecognizeDocumentElementsRequestElementConfiguration newConfiguration];
    machineReadableCodeElements = v4->_machineReadableCodeElements;
    v4->_machineReadableCodeElements = v9;
  }
  return v4;
}

@end