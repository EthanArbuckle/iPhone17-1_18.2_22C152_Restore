@interface SCNMutableGeometry
- (id)mutableGeometrySourcesForSemantic:(id)a3;
- (void)mutateGeometrySourcesWithSemantics:(id)a3 usingBlock:(id)a4;
@end

@implementation SCNMutableGeometry

- (id)mutableGeometrySourcesForSemantic:(id)a3
{
  char v4 = SCNGeometrySourceSemanticToMeshSourceSemantic(a3);
  v5 = [(SCNGeometry *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t Mesh = C3DGeometryGetMesh((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (!Mesh)
  {
    v9 = 0;
    if (!v6) {
      return v9;
    }
    goto LABEL_5;
  }
  uint64_t v8 = Mesh;
  v9 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__SCNMutableGeometry_mutableGeometrySourcesForSemantic___block_invoke;
  v11[3] = &unk_2640091D0;
  char v12 = v4;
  v11[4] = v9;
  v11[5] = v8;
  C3DMeshApplySources(v8, 0, (uint64_t)v11);
  if (v6) {
LABEL_5:
  }
    C3DSceneUnlock(v6);
  return v9;
}

void __56__SCNMutableGeometry_mutableGeometrySourcesForSemantic___block_invoke(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (*(unsigned __int8 *)(a1 + 48) == a3)
  {
    uint64_t OriginalSourceMutable = a2;
    if ((C3DMeshSourceIsMutable(a2) & 1) == 0) {
      uint64_t OriginalSourceMutable = C3DMeshMakeOriginalSourceMutable(*(void *)(a1 + 40), OriginalSourceMutable);
    }
    v5 = [[SCNGeometrySource alloc] initWithMeshSource:OriginalSourceMutable];
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)mutateGeometrySourcesWithSemantics:(id)a3 usingBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v7 = (void *)[MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(a3);
        }
        id v12 = [(SCNMutableGeometry *)self mutableGeometrySourcesForSemantic:*(void *)(*((void *)&v16 + 1) + 8 * v11)];
        if (v12) {
          [v7 addObjectsFromArray:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  v13 = [(SCNGeometry *)self sceneRef];
  uint64_t v14 = (uint64_t)v13;
  if (v13) {
    C3DSceneLock((uint64_t)v13);
  }
  if ((*((unsigned int (**)(id, void *))a4 + 2))(a4, v7))
  {
    uint64_t Mesh = C3DGeometryGetMesh((uint64_t)[(SCNGeometry *)self geometryRef]);
    C3DMeshDidMutate(Mesh);
  }
  if (v14) {
    C3DSceneUnlock(v14);
  }
}

@end