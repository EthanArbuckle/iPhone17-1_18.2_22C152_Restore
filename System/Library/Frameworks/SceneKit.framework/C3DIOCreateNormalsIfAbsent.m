@interface C3DIOCreateNormalsIfAbsent
@end

@implementation C3DIOCreateNormalsIfAbsent

uint64_t ___C3DIOCreateNormalsIfAbsent_block_invoke(uint64_t a1, uint64_t a2)
{
  Geometry = (__C3DGeometry *)C3DNodeGetGeometry(a2);
  if (Geometry)
  {
    uint64_t v3 = (uint64_t)Geometry;
    if (!C3DGeometryOsdGetWantsGPUSubdivision(Geometry))
    {
      uint64_t Mesh = C3DGeometryGetMesh(v3);
      if (Mesh)
      {
        uint64_t v5 = Mesh;
        if (!C3DMeshGetNormalSource(Mesh, 0))
        {
          if (C3DMeshGetPositionSource(v5, 0))
          {
            uint64_t v6 = C3DCreateNormalsWithMesh(v5, 0, 0);
            if (v6)
            {
              v7 = (const void *)v6;
              unsigned __int8 ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex(v5, 0, 0);
              C3DMeshSetSourceWithInputSet(v5, v7, 0, ChannelForSourceWithSemanticAtIndex);
              CFRelease(v7);
            }
          }
        }
      }
    }
  }
  return 0;
}

@end