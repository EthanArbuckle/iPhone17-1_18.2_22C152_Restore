@interface ARSCNFaceGeometry
+ (ARSCNFaceGeometry)faceGeometryWithDevice:(id)a3 eyesFilled:(BOOL)a4 mouthFilled:(BOOL)a5;
+ (ARSCNFaceGeometry)faceGeometryWithDevice:(id)device;
+ (ARSCNFaceGeometry)faceGeometryWithDevice:(id)device fillMesh:(BOOL)fillMesh;
- (MTLBuffer)normalBuffer;
- (MTLBuffer)textureBuffer;
- (MTLBuffer)vertexBuffer;
- (void)setNormalBuffer:(id)a3;
- (void)setTextureBuffer:(id)a3;
- (void)setVertexBuffer:(id)a3;
- (void)updateFromFaceGeometry:(ARFaceGeometry *)faceGeometry;
@end

@implementation ARSCNFaceGeometry

+ (ARSCNFaceGeometry)faceGeometryWithDevice:(id)a3 eyesFilled:(BOOL)a4 mouthFilled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v31[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([MEMORY[0x263F20EA0] isSupported])
  {
    id v8 = objc_alloc(MEMORY[0x263F20E90]);
    v9 = (void *)[v8 initWithBlendShapes:MEMORY[0x263EFFA78]];
    v30 = objc_msgSend(v7, "newBufferWithBytes:length:options:", objc_msgSend(v9, "vertices"), 16 * objc_msgSend(v9, "vertexCount"), 0);
    v29 = objc_msgSend(MEMORY[0x263F16A30], "geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:", v30, 30, *MEMORY[0x263F16B50], objc_msgSend(v9, "vertexCount"), 0, 16);
    v28 = objc_msgSend(v7, "newBufferWithBytes:length:options:", objc_msgSend(v9, "textureCoordinates"), 8 * objc_msgSend(v9, "textureCoordinateCount"), 0);
    v27 = objc_msgSend(MEMORY[0x263F16A30], "geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:", v28, 29, *MEMORY[0x263F16B40], objc_msgSend(v9, "textureCoordinateCount"), 0, 8);
    v26 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v9, "triangleIndices"), 6 * objc_msgSend(v9, "triangleCount"), 0);
    uint64_t v10 = objc_msgSend(MEMORY[0x263F16A28], "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", v26, 0, objc_msgSend(v9, "triangleCount"), 2);
    v11 = objc_msgSend(v7, "newBufferWithBytes:length:options:", objc_msgSend(v9, "normals"), 16 * objc_msgSend(v9, "normalCount"), 0);
    v12 = objc_msgSend(MEMORY[0x263F16A30], "geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:", v11, 30, *MEMORY[0x263F16B38], objc_msgSend(v9, "vertexCount"), 0, 16);
    v25 = (void *)v10;
    v13 = [MEMORY[0x263EFF980] arrayWithObject:v10];
    if (v6)
    {
      v14 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&ar_faceTriangleIndicesLeftEye length:132 freeWhenDone:0];
      v15 = [MEMORY[0x263F16A28] geometryElementWithData:v14 primitiveType:0 primitiveCount:22 bytesPerIndex:2];
      [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&ar_faceTriangleIndicesRightEye length:132 freeWhenDone:0];
      v17 = BOOL v16 = v5;
      v18 = [MEMORY[0x263F16A28] geometryElementWithData:v17 primitiveType:0 primitiveCount:22 bytesPerIndex:2];
      [v13 addObject:v15];
      [v13 addObject:v18];

      BOOL v5 = v16;
    }
    if (v5)
    {
      v19 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&ar_faceTriangleIndicesMouth length:204 freeWhenDone:0];
      v20 = [MEMORY[0x263F16A28] geometryElementWithData:v19 primitiveType:0 primitiveCount:34 bytesPerIndex:2];
      [v13 addObject:v20];
    }
    v31[0] = v29;
    v31[1] = v12;
    v31[2] = v27;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
    v22 = (void *)[v13 copy];
    v23 = +[SCNGeometry geometryWithSources:v21 elements:v22];

    [v23 setVertexBuffer:v30];
    [v23 setNormalBuffer:v11];
    [v23 setTextureBuffer:v28];
  }
  else
  {
    v23 = 0;
  }

  return (ARSCNFaceGeometry *)v23;
}

+ (ARSCNFaceGeometry)faceGeometryWithDevice:(id)device
{
  return (ARSCNFaceGeometry *)[a1 faceGeometryWithDevice:device eyesFilled:0 mouthFilled:0];
}

+ (ARSCNFaceGeometry)faceGeometryWithDevice:(id)device fillMesh:(BOOL)fillMesh
{
  return (ARSCNFaceGeometry *)[a1 faceGeometryWithDevice:device eyesFilled:fillMesh mouthFilled:fillMesh];
}

- (void)updateFromFaceGeometry:(ARFaceGeometry *)faceGeometry
{
  v4 = faceGeometry;
  [(ARFaceGeometry *)v4 vertexCount];
  kdebug_trace();
  id v5 = [(ARSCNFaceGeometry *)self vertexBuffer];
  memcpy((void *)[v5 contents], -[ARFaceGeometry vertices](v4, "vertices"), 16 * -[ARFaceGeometry vertexCount](v4, "vertexCount"));

  id v6 = [(ARSCNFaceGeometry *)self normalBuffer];
  id v7 = (void *)[v6 contents];
  id v8 = (const void *)[(ARFaceGeometry *)v4 normals];
  uint64_t v9 = [(ARFaceGeometry *)v4 normalCount];

  memcpy(v7, v8, 16 * v9);

  kdebug_trace();
}

- (MTLBuffer)vertexBuffer
{
  return self->_vertexBuffer;
}

- (MTLBuffer)normalBuffer
{
  return self->_normalBuffer;
}

- (MTLBuffer)textureBuffer
{
  return self->_textureBuffer;
}

- (void)setVertexBuffer:(id)a3
{
}

- (void)setNormalBuffer:(id)a3
{
}

- (void)setTextureBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureBuffer, 0);
  objc_storeStrong((id *)&self->_normalBuffer, 0);

  objc_storeStrong((id *)&self->_vertexBuffer, 0);
}

@end