@interface MTLBVHBuilder
+ (BOOL)useTemporalSplitsForDescriptor:(id)a3;
- (MTLBVHBuilder)init;
- (void)getCapacitiesForDescriptor:(id)a3 fragmentCapacity:(unint64_t *)a4 fragmentIndexCapacity:(unint64_t *)a5 innerNodeCapacity:(unint64_t *)a6 leafNodeCapacity:(unint64_t *)a7 primitiveDataCapacity:(unint64_t *)a8;
- (void)getCapacitiesForDescriptor:(id)a3 fragmentCapacity:(unint64_t *)a4 innerNodeCapacity:(unint64_t *)a5 leafNodeCapacity:(unint64_t *)a6;
- (void)getCapacitiesForDescriptor:(id)a3 fragmentCapacity:(unint64_t *)a4 innerNodeCapacity:(unint64_t *)a5 leafNodeCapacity:(unint64_t *)a6 primitiveDataCapacity:(unint64_t *)a7;
@end

@implementation MTLBVHBuilder

- (MTLBVHBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLBVHBuilder;
  return [(MTLBVHBuilder *)&v3 init];
}

- (void)getCapacitiesForDescriptor:(id)a3 fragmentCapacity:(unint64_t *)a4 innerNodeCapacity:(unint64_t *)a5 leafNodeCapacity:(unint64_t *)a6
{
  uint64_t v6 = 0;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:a3 fragmentCapacity:a4 innerNodeCapacity:a5 leafNodeCapacity:a6 primitiveDataCapacity:&v6];
}

+ (BOOL)useTemporalSplitsForDescriptor:(id)a3
{
  int v4 = [a3 useTemporalSplits];
  if (v4) {
    LOBYTE(v4) = (unint64_t)[a3 primitiveKeyframeCount] > 1;
  }
  return v4;
}

- (void)getCapacitiesForDescriptor:(id)a3 fragmentCapacity:(unint64_t *)a4 fragmentIndexCapacity:(unint64_t *)a5 innerNodeCapacity:(unint64_t *)a6 leafNodeCapacity:(unint64_t *)a7 primitiveDataCapacity:(unint64_t *)a8
{
  unint64_t v14 = [a3 fragmentCount];
  uint64_t v15 = [a3 primitiveDataSize];
  if (a8)
  {
    uint64_t v16 = v15;
    unint64_t v17 = ((8 * objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count") + 255) & 0xFFFFFFFFFFFFFF00) + v15;
    if (!v16) {
      unint64_t v17 = 0;
    }
    *a8 = v17;
  }
  double v18 = 1.0;
  if (objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count")
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "objectAtIndexedSubscript:", 0), "primitiveType")&& objc_msgSend(a3, "splitHeuristic") == 3)
  {
    [a3 splitCapacity];
    double v18 = v19;
  }
  unint64_t v20 = (unint64_t)(v18 * (double)v14);
  unint64_t v21 = v20;
  if (+[MTLBVHBuilder useTemporalSplitsForDescriptor:a3])
  {
    v20 *= [a3 primitiveKeyframeCount] - 1;
    unint64_t v21 = v20 * (1 << [a3 maxSubKeyframeTemporalSplits]);
  }
  if (a4) {
    *a4 = v20;
  }
  if (a5) {
    *a5 = v21;
  }
  unint64_t v22 = [a3 minPrimitivesPerLeaf];
  if ((v22 + v21 - 1) / v22 <= 1) {
    unint64_t v23 = 1;
  }
  else {
    unint64_t v23 = (v22 + v21 - 1) / v22;
  }
  if (a7) {
    *a7 = v23;
  }
  if (v21)
  {
    uint64_t v24 = [a3 branchingFactor];
    if ([a3 maxPrimitivesPerInnerNode])
    {
      unint64_t v25 = [a3 minPrimitivesPerInnerNode];
      unint64_t v26 = ((v25 + v21 - 1) / v25 * v24 + 2 * v24 - 5) / (2 * v24 - 2) + (v25 + v21 - 1) / v25;
      if (!a6) {
        return;
      }
    }
    else
    {
      unint64_t v26 = (2 * v24 - 2 + v24 * v23 - 3) / (2 * v24 - 2);
      if (!a6) {
        return;
      }
    }
  }
  else
  {
    unint64_t v26 = 0;
    if (!a6) {
      return;
    }
  }
  *a6 = v26;
}

- (void)getCapacitiesForDescriptor:(id)a3 fragmentCapacity:(unint64_t *)a4 innerNodeCapacity:(unint64_t *)a5 leafNodeCapacity:(unint64_t *)a6 primitiveDataCapacity:(unint64_t *)a7
{
  uint64_t v7 = 0;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:a3 fragmentCapacity:a4 fragmentIndexCapacity:&v7 innerNodeCapacity:a5 leafNodeCapacity:a6 primitiveDataCapacity:a7];
}

@end