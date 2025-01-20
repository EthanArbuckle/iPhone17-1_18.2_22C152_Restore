@interface REMeshSkinningPartDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)packedInfluence;
- (BOOL)simplifiedPackedInfluence;
- (BOOL)validateWithPayloadSize:(const void *)a3 skeletonCount:(unint64_t)a4 vertexCount:(unint64_t)a5 simplifiedVertexCount:(unint64_t)a6 error:(id *)a7;
- (REAttributeDescriptor)influenceEndIndices;
- (REAttributeDescriptor)simplifiedInfluenceEndIndices;
- (REAttributeDescriptor)simplifiedSkinningInfluences;
- (REAttributeDescriptor)skinningInfluences;
- (REMeshSkinningPartDescriptor)initWithAttributeDescriptor:(const void *)a3 payloadBuilder:(void *)a4;
- (REMeshSkinningPartDescriptor)initWithCoder:(id)a3;
- (REMeshSkinningPartDescriptor)initWithSkeletonIndexAndInfluences:(unsigned int)a3 packedInfluence:(BOOL)a4 simplifiedPackedInfluence:(BOOL)a5 influencePerVertex:(unsigned __int8)a6 simplifiedInfluencePerVertex:(unsigned __int8)a7 skinningInfluences:(id)a8 influenceEndIndices:(id)a9 simplifiedSkinningInfluences:(id)a10 simplifiedInfluenceEndIndices:(id)a11;
- (unint64_t)estimateContainerSize;
- (unsigned)influencePerVertex;
- (unsigned)simplifiedInfluencePerVertex;
- (unsigned)skeletonIndex;
- (void)addToSkinningModelBuilder:(void *)a3 payloadBuffers:(const void *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMeshSkinningPartDescriptor

- (REMeshSkinningPartDescriptor)initWithAttributeDescriptor:(const void *)a3 payloadBuilder:(void *)a4
{
  unint64_t v13 = 0xA7268F0C3B45D55ELL;
  v7 = v14 = "skinningInfluences";
  re::StringID::destroyString((re::StringID *)&v13);
  unint64_t v13 = 0xF98D22D8F2059642;
  v8 = v14 = "influenceEndIndices";
  re::StringID::destroyString((re::StringID *)&v13);
  unint64_t v13 = 0x9E5069BE2D47B84ELL;
  v9 = v14 = "simplifiedSkinningInfluences";
  re::StringID::destroyString((re::StringID *)&v13);
  unint64_t v13 = 0xE79E9E6540401152;
  v10 = v14 = "simplifiedInfluenceEndIndices";
  re::StringID::destroyString((re::StringID *)&v13);
  v11 = [(REMeshSkinningPartDescriptor *)self initWithSkeletonIndexAndInfluences:*(unsigned int *)a3 packedInfluence:*((unsigned __int8 *)a3 + 4) simplifiedPackedInfluence:*((unsigned __int8 *)a3 + 5) influencePerVertex:*((unsigned __int8 *)a3 + 6) simplifiedInfluencePerVertex:*((unsigned __int8 *)a3 + 7) skinningInfluences:v7 influenceEndIndices:v8 simplifiedSkinningInfluences:v9 simplifiedInfluenceEndIndices:v10];

  return v11;
}

- (void)addToSkinningModelBuilder:(void *)a3 payloadBuffers:(const void *)a4
{
  int v40 = 0;
  memset(v39, 0, sizeof(v39));
  uint64_t v41 = 0x7FFFFFFFLL;
  v7 = [(REMeshSkinningPartDescriptor *)self skinningInfluences];

  if (v7)
  {
    *(void *)&v38.var0 = 0xA7268F0C3B45D55ELL;
    v38.var1 = "skinningInfluences";
    v8 = (void *)*((void *)a4 + 5);
    v9 = [(REMeshSkinningPartDescriptor *)self skinningInfluences];
    int v10 = [v9 payloadOffset];
    v11 = [(REMeshSkinningPartDescriptor *)self skinningInfluences];
    int v12 = [v11 bufferSize];
    id v13 = v8;
    id v35 = v13;
    int v36 = v10;
    int v37 = v12;
    re::HashTable<re::StringID,re::BufferSlice,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::addNew((uint64_t)v39, &v38, (uint64_t)&v35);
    if (v13) {

    }
    re::StringID::destroyString((re::StringID *)&v38);
  }
  v14 = [(REMeshSkinningPartDescriptor *)self influenceEndIndices];

  if (v14)
  {
    *(void *)&v38.var0 = 0xF98D22D8F2059642;
    v38.var1 = "influenceEndIndices";
    v15 = (void *)*((void *)a4 + 5);
    v16 = [(REMeshSkinningPartDescriptor *)self influenceEndIndices];
    int v17 = [v16 payloadOffset];
    v18 = [(REMeshSkinningPartDescriptor *)self influenceEndIndices];
    int v19 = [v18 bufferSize];
    id v20 = v15;
    id v35 = v20;
    int v36 = v17;
    int v37 = v19;
    re::HashTable<re::StringID,re::BufferSlice,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::addNew((uint64_t)v39, &v38, (uint64_t)&v35);
    if (v20) {

    }
    re::StringID::destroyString((re::StringID *)&v38);
  }
  v21 = [(REMeshSkinningPartDescriptor *)self simplifiedSkinningInfluences];

  if (v21)
  {
    *(void *)&v38.var0 = 0x9E5069BE2D47B84ELL;
    v38.var1 = "simplifiedSkinningInfluences";
    v22 = (void *)*((void *)a4 + 5);
    v23 = [(REMeshSkinningPartDescriptor *)self simplifiedSkinningInfluences];
    int v24 = [v23 payloadOffset];
    v25 = [(REMeshSkinningPartDescriptor *)self simplifiedSkinningInfluences];
    int v26 = [v25 bufferSize];
    id v27 = v22;
    id v35 = v27;
    int v36 = v24;
    int v37 = v26;
    re::HashTable<re::StringID,re::BufferSlice,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::addNew((uint64_t)v39, &v38, (uint64_t)&v35);
    if (v27) {

    }
    re::StringID::destroyString((re::StringID *)&v38);
  }
  v28 = [(REMeshSkinningPartDescriptor *)self simplifiedInfluenceEndIndices];

  if (v28)
  {
    *(void *)&v38.var0 = 0xE79E9E6540401152;
    v38.var1 = "simplifiedInfluenceEndIndices";
    v29 = (void *)*((void *)a4 + 5);
    v30 = [(REMeshSkinningPartDescriptor *)self simplifiedInfluenceEndIndices];
    int v31 = [v30 payloadOffset];
    v32 = [(REMeshSkinningPartDescriptor *)self simplifiedInfluenceEndIndices];
    int v33 = [v32 bufferSize];
    id v34 = v29;
    id v35 = v34;
    int v36 = v31;
    int v37 = v33;
    re::HashTable<re::StringID,re::BufferSlice,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::addNew((uint64_t)v39, &v38, (uint64_t)&v35);
    if (v34) {

    }
    re::StringID::destroyString((re::StringID *)&v38);
  }
  re::SkinningModelBuilder::addSkinnedMeshPartData((uint64_t)a3, [(REMeshSkinningPartDescriptor *)self skeletonIndex], [(REMeshSkinningPartDescriptor *)self packedInfluence], [(REMeshSkinningPartDescriptor *)self influencePerVertex], [(REMeshSkinningPartDescriptor *)self simplifiedPackedInfluence], [(REMeshSkinningPartDescriptor *)self simplifiedInfluencePerVertex], (uint64_t)v39);
  re::HashTable<re::StringID,re::BufferSlice,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::deinit((uint64_t *)v39);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshSkinningPartDescriptor)initWithSkeletonIndexAndInfluences:(unsigned int)a3 packedInfluence:(BOOL)a4 simplifiedPackedInfluence:(BOOL)a5 influencePerVertex:(unsigned __int8)a6 simplifiedInfluencePerVertex:(unsigned __int8)a7 skinningInfluences:(id)a8 influenceEndIndices:(id)a9 simplifiedSkinningInfluences:(id)a10 simplifiedInfluenceEndIndices:(id)a11
{
  id v24 = a8;
  id v23 = a9;
  id v16 = a10;
  id v17 = a11;
  v25.receiver = self;
  v25.super_class = (Class)REMeshSkinningPartDescriptor;
  v18 = [(REMeshSkinningPartDescriptor *)&v25 init];
  int v19 = v18;
  if (v18)
  {
    v18->_skeletonIndex = a3;
    v18->_packedInfluence = a4;
    v18->_influencePerVertex = a6;
    objc_storeStrong((id *)&v18->_skinningInfluences, a8);
    objc_storeStrong((id *)&v19->_influenceEndIndices, a9);
    v19->_simplifiedPackedInfluence = a5;
    v19->_simplifiedInfluencePerVertex = a7;
    objc_storeStrong((id *)&v19->_simplifiedSkinningInfluences, a10);
    objc_storeStrong((id *)&v19->_simplifiedInfluenceEndIndices, a11);
  }

  return v19;
}

- (REMeshSkinningPartDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"skeletonIndex"];
  self->_skeletonIndex = v5;
  self->_packedInfluence = [v4 decodeBoolForKey:@"packedInfluence"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"influencePerVertex"];
  self->_influencePerVertex = v6;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"skinningInfluences"];
  skinningInfluences = self->_skinningInfluences;
  self->_skinningInfluences = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"influenceEndIndices"];
  influenceEndIndices = self->_influenceEndIndices;
  self->_influenceEndIndices = v9;

  self->_simplifiedPackedInfluence = [v4 decodeBoolForKey:@"simplifiedPackedInfluence"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"simplifiedInfluencePerVertex"];
  self->_simplifiedInfluencePerVertex = v11;
  if (HIDWORD(v5)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = (v11 | (unint64_t)v6) > 0xFF;
  }
  int v13 = v12;
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simplifiedSkinningInfluences"];
  simplifiedSkinningInfluences = self->_simplifiedSkinningInfluences;
  self->_simplifiedSkinningInfluences = v14;

  id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simplifiedInfluenceEndIndices"];
  simplifiedInfluenceEndIndices = self->_simplifiedInfluenceEndIndices;
  self->_simplifiedInfluenceEndIndices = v16;

  if (v13) {
    int v19 = {;
  }
    [v4 failWithError:v19];

    id v20 = 0;
  }
  else
  {
    id v20 = self;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_skeletonIndex forKey:@"skeletonIndex"];
  [v4 encodeBool:self->_packedInfluence forKey:@"packedInfluence"];
  [v4 encodeInt:self->_influencePerVertex forKey:@"influencePerVertex"];
  [v4 encodeObject:self->_skinningInfluences forKey:@"skinningInfluences"];
  [v4 encodeObject:self->_influenceEndIndices forKey:@"influenceEndIndices"];
  [v4 encodeBool:self->_simplifiedPackedInfluence forKey:@"simplifiedPackedInfluence"];
  [v4 encodeInt:self->_simplifiedInfluencePerVertex forKey:@"simplifiedInfluencePerVertex"];
  [v4 encodeObject:self->_simplifiedSkinningInfluences forKey:@"simplifiedSkinningInfluences"];
  [v4 encodeObject:self->_simplifiedInfluenceEndIndices forKey:@"simplifiedInfluenceEndIndices"];
}

- (BOOL)validateWithPayloadSize:(const void *)a3 skeletonCount:(unint64_t)a4 vertexCount:(unint64_t)a5 simplifiedVertexCount:(unint64_t)a6 error:(id *)a7
{
  if (self->_skeletonIndex >= a4) {
    goto LABEL_28;
  }
  skinningInfluences = self->_skinningInfluences;
  if (!skinningInfluences)
  {
    int v19 = @"REMeshSkinningPartDescriptor: is missing skinningInfuences";
    goto LABEL_12;
  }
  BOOL v13 = [(REAttributeDescriptor *)skinningInfluences validateWithPayloadSize:*((void *)a3 + 5) error:a7];
  if (v13)
  {
    influenceEndIndices = self->_influenceEndIndices;
    if (!influenceEndIndices
      || (BOOL v13 = [(REAttributeDescriptor *)influenceEndIndices validateWithPayloadSize:*((void *)a3 + 5) error:a7]))
    {
      BOOL packedInfluence = self->_packedInfluence;
      id v16 = [(REMeshSkinningPartDescriptor *)self skinningInfluences];
      unint64_t v17 = [v16 bufferSize];

      if (self->_influencePerVertex)
      {
        char v18 = 2;
        if (!packedInfluence) {
          char v18 = 3;
        }
        if (v17 >> v18 != self->_influencePerVertex * a5)
        {
          int v19 = @"REMeshSkinningPartDescriptor: incorrect influence count";
LABEL_12:
          LOBYTE(v13) = 0;
          return v13;
        }
      }
      else
      {
        id v20 = [(REMeshSkinningPartDescriptor *)self influenceEndIndices];

        if (!v20)
        {
          int v19 = @"REMeshSkinningPartDescriptor: is missing influenceEndIndices";
          goto LABEL_12;
        }
        v21 = [(REMeshSkinningPartDescriptor *)self influenceEndIndices];
        unint64_t v22 = [v21 bufferSize];

        if (a5 != v22 >> 2)
        {
          int v19 = @"REMeshSkinningPartDescriptor: incorrect number of influenceEndIndices";
          goto LABEL_12;
        }
      }
      simplifiedSkinningInfluences = self->_simplifiedSkinningInfluences;
      if (!simplifiedSkinningInfluences)
      {
LABEL_28:
        LOBYTE(v13) = 1;
        return v13;
      }
      BOOL v13 = [(REAttributeDescriptor *)simplifiedSkinningInfluences validateWithPayloadSize:*((void *)a3 + 5) error:a7];
      if (v13)
      {
        simplifiedInfluenceEndIndices = self->_simplifiedInfluenceEndIndices;
        if (!simplifiedInfluenceEndIndices
          || (BOOL v13 = -[REAttributeDescriptor validateWithPayloadSize:error:](simplifiedInfluenceEndIndices, "validateWithPayloadSize:error:", *(void *)re::FixedInlineArray<unsigned long,8ul>::operator[]((uint64_t)a3, 5uLL), a7)))
        {
          BOOL simplifiedPackedInfluence = self->_simplifiedPackedInfluence;
          int v26 = [(REMeshSkinningPartDescriptor *)self simplifiedSkinningInfluences];
          unint64_t v27 = [v26 bufferSize];

          if (self->_simplifiedInfluencePerVertex)
          {
            char v28 = 2;
            if (!simplifiedPackedInfluence) {
              char v28 = 3;
            }
            if (v27 >> v28 != self->_simplifiedInfluencePerVertex * a6)
            {
              int v19 = @"REMeshSkinningPartDescriptor: incorrect simplified influence count";
              goto LABEL_12;
            }
          }
          else
          {
            v29 = [(REMeshSkinningPartDescriptor *)self simplifiedInfluenceEndIndices];

            if (!v29)
            {
              int v19 = @"REMeshSkinningPartDescriptor: is missing simplifiedInfluenceEndIndices";
              goto LABEL_12;
            }
            v30 = [(REMeshSkinningPartDescriptor *)self simplifiedInfluenceEndIndices];
            unint64_t v31 = [v30 bufferSize];

            if (a6 != v31 >> 2)
            {
              int v19 = @"REMeshSkinningPartDescriptor: incorrect number of simplifiedInfluenceEndIndices";
              goto LABEL_12;
            }
          }
          goto LABEL_28;
        }
      }
    }
  }
  return v13;
}

- (unint64_t)estimateContainerSize
{
  v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = class_getInstanceSize(v3) + 16;
  skinningInfluences = self->_skinningInfluences;
  if (skinningInfluences) {
    v4 += [(REAttributeDescriptor *)skinningInfluences estimateContainerSize];
  }
  influenceEndIndices = self->_influenceEndIndices;
  if (influenceEndIndices) {
    v4 += [(REAttributeDescriptor *)influenceEndIndices estimateContainerSize];
  }
  simplifiedSkinningInfluences = self->_simplifiedSkinningInfluences;
  if (simplifiedSkinningInfluences) {
    v4 += [(REAttributeDescriptor *)simplifiedSkinningInfluences estimateContainerSize];
  }
  simplifiedInfluenceEndIndices = self->_simplifiedInfluenceEndIndices;
  if (simplifiedInfluenceEndIndices) {
    v4 += [(REAttributeDescriptor *)simplifiedInfluenceEndIndices estimateContainerSize];
  }
  return v4;
}

- (BOOL)packedInfluence
{
  return self->_packedInfluence;
}

- (BOOL)simplifiedPackedInfluence
{
  return self->_simplifiedPackedInfluence;
}

- (unsigned)influencePerVertex
{
  return self->_influencePerVertex;
}

- (unsigned)simplifiedInfluencePerVertex
{
  return self->_simplifiedInfluencePerVertex;
}

- (unsigned)skeletonIndex
{
  return self->_skeletonIndex;
}

- (REAttributeDescriptor)skinningInfluences
{
  return self->_skinningInfluences;
}

- (REAttributeDescriptor)influenceEndIndices
{
  return self->_influenceEndIndices;
}

- (REAttributeDescriptor)simplifiedSkinningInfluences
{
  return self->_simplifiedSkinningInfluences;
}

- (REAttributeDescriptor)simplifiedInfluenceEndIndices
{
  return self->_simplifiedInfluenceEndIndices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simplifiedInfluenceEndIndices, 0);
  objc_storeStrong((id *)&self->_simplifiedSkinningInfluences, 0);
  objc_storeStrong((id *)&self->_influenceEndIndices, 0);
  objc_storeStrong((id *)&self->_skinningInfluences, 0);
}

@end