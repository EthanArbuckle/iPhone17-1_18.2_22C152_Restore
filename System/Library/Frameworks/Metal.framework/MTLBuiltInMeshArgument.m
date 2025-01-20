@interface MTLBuiltInMeshArgument
- (BOOL)isEqual:(id)a3;
- (MTLBuiltInMeshArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 active:(BOOL)a6 index:(unint64_t)a7 dataType:(unint64_t)a8 builtInType:(unint64_t)a9 meshVertexStructType:(id)a10 meshPrimitiveStructType:(id)a11 meshVertexCount:(unsigned __int16)a12 meshPrimitiveCount:(unsigned __int16)a13 meshTopologyType:(unint64_t)a14;
- (id)formattedDescription:(unint64_t)a3;
- (id)meshPrimitiveStruct;
- (id)meshVertexStruct;
- (unint64_t)builtInDataType;
- (unint64_t)builtInType;
- (unint64_t)meshPrimitiveCount;
- (unint64_t)meshTopologyType;
- (unint64_t)meshVertexCount;
- (void)dealloc;
@end

@implementation MTLBuiltInMeshArgument

- (MTLBuiltInMeshArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 active:(BOOL)a6 index:(unint64_t)a7 dataType:(unint64_t)a8 builtInType:(unint64_t)a9 meshVertexStructType:(id)a10 meshPrimitiveStructType:(id)a11 meshVertexCount:(unsigned __int16)a12 meshPrimitiveCount:(unsigned __int16)a13 meshTopologyType:(unint64_t)a14
{
  unsigned __int16 v14 = a8;
  v17.receiver = self;
  v17.super_class = (Class)MTLBuiltInMeshArgument;
  v15 = [(MTLBindingInternal *)&v17 initWithName:a3 type:a4 access:a5 index:a7 active:a6 arrayLength:1];
  v15->_builtInType = a9;
  v15->_builtInDataType = v14;
  v15->_meshVertexStruct = (MTLStructTypeInternal *)a10;
  v15->_meshPrimitiveStruct = (MTLStructTypeInternal *)a11;
  v15->_meshVertexCount = a12;
  v15->_meshPrimitiveCount = a13;
  v15->_meshTopologyType = a14;
  return v15;
}

- (unint64_t)builtInDataType
{
  return self->_builtInDataType;
}

- (unint64_t)builtInType
{
  return self->_builtInType;
}

- (id)formattedDescription:(unint64_t)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3 + 4;
  uint64_t v6 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v20 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)MTLBuiltInMeshArgument;
  id v7 = [(MTLBindingInternal *)&v21 formattedDescription:a3];
  v27[0] = v6;
  v27[1] = @"BuiltInArgumentType =";
  v27[2] = MTLBuiltInArgumentTypeString(self->_builtInType);
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 3), "componentsJoinedByString:", @" ");
  v26[0] = v6;
  v26[1] = @"MeshVertexStructMembers =";
  meshVertexStruct = self->_meshVertexStruct;
  if (meshVertexStruct) {
    v10 = (__CFString *)[(MTLStructTypeInternal *)meshVertexStruct formattedDescription:v5];
  }
  else {
    v10 = @"nil";
  }
  v26[2] = v10;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v26, 3), "componentsJoinedByString:", @" ");
  v25[0] = v6;
  v25[1] = @"MeshPrimitiveStructMembers =";
  meshPrimitiveStruct = self->_meshPrimitiveStruct;
  if (meshPrimitiveStruct) {
    v13 = (__CFString *)[(MTLStructTypeInternal *)meshPrimitiveStruct formattedDescription:v5];
  }
  else {
    v13 = @"nil";
  }
  v25[2] = v13;
  uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 3), "componentsJoinedByString:", @" ");
  v24[0] = v6;
  v24[1] = @"MeshVertexCount =";
  v24[2] = [NSNumber numberWithUnsignedShort:self->_meshVertexCount];
  uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 3), "componentsJoinedByString:", @" ");
  v23[0] = v6;
  v23[1] = @"MeshPrimitiveCount =";
  v23[2] = [NSNumber numberWithUnsignedShort:self->_meshPrimitiveCount];
  uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 3), "componentsJoinedByString:", @" ");
  v22[0] = v6;
  v22[1] = @"MeshTopologyType =";
  unint64_t meshTopologyType = (__int16)self->_meshTopologyType;
  if (meshTopologyType > 3) {
    v18 = @"Unknown";
  }
  else {
    v18 = off_1E5220228[meshTopologyType];
  }
  v22[2] = v18;
  return (id)[v20 stringWithFormat:@"%@%@%@%@%@%@%@", v7, v8, v11, v14, v15, v16, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 3), "componentsJoinedByString:", @" "];
}

- (void)dealloc
{
  self->_meshVertexStruct = 0;
  self->_meshPrimitiveStruct = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLBuiltInMeshArgument;
  [(MTLBindingInternal *)&v3 dealloc];
}

- (unint64_t)meshVertexCount
{
  return self->_meshVertexCount;
}

- (unint64_t)meshPrimitiveCount
{
  return self->_meshPrimitiveCount;
}

- (unint64_t)meshTopologyType
{
  return self->_meshTopologyType;
}

- (id)meshVertexStruct
{
  return self->_meshVertexStruct;
}

- (id)meshPrimitiveStruct
{
  return self->_meshPrimitiveStruct;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_builtInType == *((unsigned __int16 *)a3 + 84)
      && self->_builtInDataType == *((unsigned __int16 *)a3 + 85)
      && self->_meshVertexCount == *((unsigned __int16 *)a3 + 86)
      && self->_meshPrimitiveCount == *((unsigned __int16 *)a3 + 87)
      && self->_meshTopologyType == *((unsigned __int16 *)a3 + 88))
    {
      BOOL v5 = [(MTLStructTypeInternal *)self->_meshVertexStruct isEqual:*((void *)a3 + 23)];
      if (v5)
      {
        BOOL v5 = [(MTLStructTypeInternal *)self->_meshPrimitiveStruct isEqual:*((void *)a3 + 24)];
        if (v5)
        {
          v7.receiver = self;
          v7.super_class = (Class)MTLBuiltInMeshArgument;
          LOBYTE(v5) = [(MTLBindingInternal *)&v7 isEqual:a3];
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

@end