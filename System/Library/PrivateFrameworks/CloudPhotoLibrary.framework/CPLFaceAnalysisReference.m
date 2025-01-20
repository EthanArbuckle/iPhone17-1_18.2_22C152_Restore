@interface CPLFaceAnalysisReference
- (NSArray)faces;
- (void)addFace:(id)a3;
- (void)setFaces:(id)a3;
@end

@implementation CPLFaceAnalysisReference

- (NSArray)faces
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(CPLFaceAnalysis *)self faceInstances];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(CPLFaceAnalysis *)self faceInstances];
    [v3 addObjectsFromArray:v6];
  }
  v7 = [(CPLFaceAnalysis *)self petFaceInstances];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [(CPLFaceAnalysis *)self petFaceInstances];
    [v3 addObjectsFromArray:v9];
  }
  v10 = [(CPLFaceAnalysis *)self torsoFaceInstances];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [(CPLFaceAnalysis *)self torsoFaceInstances];
    [v3 addObjectsFromArray:v12];
  }
  v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

- (void)addFace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 isPetDetectionType])
    {
      v6 = [(CPLFaceAnalysis *)self petFaceInstances];
    }
    else
    {
      if ([v5 isTorsoOnly]) {
        [(CPLFaceAnalysis *)self torsoFaceInstances];
      }
      else {
      v6 = [(CPLFaceAnalysis *)self faceInstances];
      }
    }
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "insertObject:atIndex:", v5, objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v6, "count"), 1024, &__block_literal_global_50));
    }
    else if ([v5 isPetDetectionType])
    {
      -[CPLFaceAnalysis addPetFaceInstances:](&v10, sel_addPetFaceInstances_, v5, v8.receiver, v8.super_class, v9.receiver, v9.super_class, self, CPLFaceAnalysisReference);
    }
    else if ([v5 isTorsoOnly])
    {
      -[CPLFaceAnalysis addTorsoFaceInstances:](&v9, sel_addTorsoFaceInstances_, v5, v8.receiver, v8.super_class, self, CPLFaceAnalysisReference, v10.receiver, v10.super_class);
    }
    else
    {
      -[CPLFaceAnalysis addFaceInstances:](&v8, sel_addFaceInstances_, v5, self, CPLFaceAnalysisReference, v9.receiver, v9.super_class, v10.receiver, v10.super_class);
    }
  }
}

uint64_t __36__CPLFaceAnalysisReference_addFace___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setFaces:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  [v4 sortUsingSelector:sel_compare_];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_6759];
  v6 = [v4 filteredArrayUsingPredicate:v5];

  v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_33_6760];
  objc_super v8 = [v4 filteredArrayUsingPredicate:v7];

  objc_super v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_35];
  objc_super v10 = [v4 filteredArrayUsingPredicate:v9];

  uint64_t v11 = [v6 count];
  if (v11) {
    v12 = (void *)[v6 mutableCopy];
  }
  else {
    v12 = 0;
  }
  v19.receiver = self;
  v19.super_class = (Class)CPLFaceAnalysisReference;
  [(CPLFaceAnalysis *)&v19 setFaceInstances:v12];
  if (v11) {

  }
  uint64_t v13 = [v8 count];
  if (v13) {
    v14 = (void *)[v8 mutableCopy];
  }
  else {
    v14 = 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)CPLFaceAnalysisReference;
  [(CPLFaceAnalysis *)&v18 setPetFaceInstances:v14];
  if (v13) {

  }
  uint64_t v15 = [v10 count];
  if (v15) {
    v16 = (void *)[v10 mutableCopy];
  }
  else {
    v16 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)CPLFaceAnalysisReference;
  [(CPLFaceAnalysis *)&v17 setTorsoFaceInstances:v16];
  if (v15) {
}
  }

uint64_t __37__CPLFaceAnalysisReference_setFaces___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isPetDetectionType]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isTorsoOnly];
  }

  return v3;
}

uint64_t __37__CPLFaceAnalysisReference_setFaces___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isPetDetectionType];
}

uint64_t __37__CPLFaceAnalysisReference_setFaces___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isPetDetectionType]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isTorsoOnly] ^ 1;
  }

  return v3;
}

@end