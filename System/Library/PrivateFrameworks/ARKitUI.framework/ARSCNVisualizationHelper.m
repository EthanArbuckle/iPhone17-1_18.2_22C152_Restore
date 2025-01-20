@interface ARSCNVisualizationHelper
+ (id)createAxesNode:(double)a3;
+ (id)createGeometryForPointCloud:(id)a3;
+ (id)createMaterialWithTexture:(id)a3;
@end

@implementation ARSCNVisualizationHelper

+ (id)createMaterialWithTexture:(id)a3
{
  v3 = (void *)MEMORY[0x263F16A80];
  id v4 = a3;
  v5 = [v3 material];
  v6 = [v5 diffuse];
  [v6 setContents:v4];

  v7 = [MEMORY[0x263F1C550] blackColor];
  v8 = [v5 ambient];
  [v8 setContents:v7];

  [v5 setLightingModelName:*MEMORY[0x263F16B98]];
  [v5 setLocksAmbientWithDiffuse:1];

  return v5;
}

+ (id)createAxesNode:(double)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F1C550] redColor];
  v24 = +[ARSCNVisualizationHelper createMaterialWithTexture:v4];

  v5 = [MEMORY[0x263F169E8] boxWithWidth:a3 height:a3 / 50.0 length:a3 / 50.0 chamferRadius:a3 / 50.0 * 0.5];
  v27[0] = v24;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  [v5 setMaterials:v6];

  v7 = [MEMORY[0x263F16A98] nodeWithGeometry:v5];
  double v8 = a3 * 0.5;
  float v9 = a3 * 0.5;
  *(float *)&double v8 = v9;
  objc_msgSend(v7, "setPosition:", v8, 0.0, 0.0);
  v10 = [MEMORY[0x263F1C550] greenColor];
  v11 = +[ARSCNVisualizationHelper createMaterialWithTexture:v10];

  v12 = [MEMORY[0x263F169E8] boxWithWidth:a3 / 50.0 height:a3 length:a3 / 50.0 chamferRadius:a3 / 50.0 * 0.5];
  v26 = v11;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  [v12 setMaterials:v13];

  v14 = [MEMORY[0x263F16A98] nodeWithGeometry:v12];
  *(float *)&double v15 = v9;
  objc_msgSend(v14, "setPosition:", 0.0, v15, 0.0);
  v16 = [MEMORY[0x263F1C550] blueColor];
  v17 = +[ARSCNVisualizationHelper createMaterialWithTexture:v16];

  v18 = [MEMORY[0x263F169E8] boxWithWidth:a3 / 50.0 height:a3 / 50.0 length:a3 chamferRadius:a3 / 50.0 * 0.5];
  v25 = v17;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  [v18 setMaterials:v19];

  v20 = [MEMORY[0x263F16A98] nodeWithGeometry:v18];
  *(float *)&double v21 = v9;
  objc_msgSend(v20, "setPosition:", 0.0, 0.0, v21);
  v22 = [MEMORY[0x263F16A98] node];
  [v22 addChildNode:v7];
  [v22 addChildNode:v14];
  [v22 addChildNode:v20];

  return v22;
}

+ (id)createGeometryForPointCloud:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF8F8];
  id v4 = a3;
  v5 = objc_msgSend(v3, "dataWithBytes:length:", objc_msgSend(v4, "points"), 16 * objc_msgSend(v4, "count"));
  v6 = objc_msgSend(MEMORY[0x263F16A30], "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v5, *MEMORY[0x263F16B50], objc_msgSend(v4, "count"), 1, 3, 4, 0, 16);
  v7 = (void *)MEMORY[0x263F16A28];
  uint64_t v8 = [v4 count];

  float v9 = [v7 geometryElementWithData:0 primitiveType:3 primitiveCount:v8 bytesPerIndex:0];
  [v9 setPointSize:0.001];
  [v9 setMinimumPointScreenSpaceRadius:8.0];
  [v9 setMaximumPointScreenSpaceRadius:72.0];
  v10 = (void *)MEMORY[0x263F16A10];
  v18[0] = v6;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v17 = v9;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  v13 = [v10 geometryWithSources:v11 elements:v12];

  v14 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.800000012 blue:0.0 alpha:1.0];
  double v15 = +[ARSCNVisualizationHelper createMaterialWithTexture:v14];
  [v13 setFirstMaterial:v15];

  return v13;
}

@end