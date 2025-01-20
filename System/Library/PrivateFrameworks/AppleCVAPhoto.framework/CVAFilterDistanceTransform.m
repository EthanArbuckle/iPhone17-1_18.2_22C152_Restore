@interface CVAFilterDistanceTransform
- (CVAFilterDistanceTransform)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 textureSize:(id *)a6 error:(id *)a7;
- (NSString)label;
- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5;
@end

@implementation CVAFilterDistanceTransform

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_distanceTransformKernel, 0);
  objc_storeStrong((id *)&self->_closestSitesKernel, 0);
  objc_storeStrong((id *)&self->_closestSites, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 width];
  if (v12 != [(MTLTexture *)self->_closestSites width]
    || (uint64_t v13 = [v10 height], v13 != -[MTLTexture height](self->_closestSites, "height")))
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"CVAFilterDistanceTransform.mm" lineNumber:73 description:@"sourceTexture dimensions do not match"];
  }
  uint64_t v14 = [v11 width];
  if (v14 != [(MTLTexture *)self->_closestSites width]
    || (uint64_t v15 = [v11 height], v15 != -[MTLTexture height](self->_closestSites, "height")))
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"CVAFilterDistanceTransform.mm" lineNumber:75 description:@"destinationTexture dimensions do not match"];
  }
  if ([v10 pixelFormat] != 13)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"CVAFilterDistanceTransform.mm" lineNumber:76 description:@"sourceTexture pixel format should be R8Uint"];
  }
  if ([v11 pixelFormat] != 25)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"CVAFilterDistanceTransform.mm" lineNumber:78 description:@"destinationTexture pixel format should be R16Float"];
  }
  uint64_t v16 = [v10 width];
  uint64_t v17 = [v10 height];
  v18 = [v9 computeCommandEncoder];
  [v18 setLabel:@"_closestSitesKernel"];
  [v18 setComputePipelineState:self->_closestSitesKernel];
  [v18 setTexture:v10 atIndex:0];
  [v18 setTexture:self->_closestSites atIndex:1];
  unint64_t v19 = (unint64_t)(v16 + 15) >> 4;
  unint64_t v20 = (unint64_t)(v17 + 15) >> 4;
  v31[0] = v19;
  v31[1] = v20;
  v31[2] = 1;
  uint64_t v30 = 1;
  long long v29 = xmmword_1BA86C930;
  [v18 dispatchThreadgroups:v31 threadsPerThreadgroup:&v29];
  [v18 endEncoding];
  v21 = [v9 computeCommandEncoder];

  [v21 setLabel:@"_distanceTransformKernel"];
  [v21 setComputePipelineState:self->_distanceTransformKernel];
  [v21 setTexture:self->_closestSites atIndex:0];
  [v21 setTexture:v11 atIndex:1];
  v28[0] = v19;
  v28[1] = v20;
  v28[2] = 1;
  uint64_t v27 = 1;
  long long v26 = xmmword_1BA86C930;
  [v21 dispatchThreadgroups:v28 threadsPerThreadgroup:&v26];
  [v21 endEncoding];
}

- (CVAFilterDistanceTransform)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 textureSize:(id *)a6 error:(id *)a7
{
  id v14 = a3;
  id v15 = a4;
  id v24 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CVAFilterDistanceTransform;
  uint64_t v16 = [(CVAFilterDistanceTransform *)&v25 init];
  if (!v14)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:v16 file:@"CVAFilterDistanceTransform.mm" lineNumber:35 description:@"device is nil"];

    if (v15) {
      goto LABEL_3;
    }
LABEL_10:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:v16 file:@"CVAFilterDistanceTransform.mm" lineNumber:36 description:@"library is nil"];

    goto LABEL_3;
  }
  if (!v15) {
    goto LABEL_10;
  }
LABEL_3:
  label = v16->_label;
  v16->_label = (NSString *)@"CVAFilterDistanceTransform";

  objc_storeStrong((id *)&v16->_device, a3);
  objc_storeStrong((id *)&v16->_library, a4);
  objc_storeStrong((id *)&v16->_pipelineLibrary, a5);
  uint64_t v18 = sub_1BA862650(v16->_device, 24, a6->var0, a6->var1, 0, a7);
  closestSites = v16->_closestSites;
  v16->_closestSites = (MTLTexture *)v18;

  if (v16->_closestSites
    && (sub_1BA8328CC((void **)&v16->_closestSitesKernel, v16->_library, v16->_pipelineLibrary, v16->_device, @"distanceTransformProximalSites", a7, 0), v16->_closestSitesKernel)&& (sub_1BA8328CC((void **)&v16->_distanceTransformKernel, v16->_library, v16->_pipelineLibrary, v16->_device, @"distanceTransformFromProximalSites", a7, 0), v16->_distanceTransformKernel))
  {
    unint64_t v20 = v16;
  }
  else
  {
    unint64_t v20 = 0;
  }

  return v20;
}

@end