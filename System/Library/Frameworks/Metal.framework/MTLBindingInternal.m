@interface MTLBindingInternal
- (BOOL)aliasImplicitImageBlock;
- (BOOL)isActive;
- (BOOL)isArgument;
- (BOOL)isDepthTexture;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsed;
- (BOOL)isVertexDescriptorBuffer;
- (MTLArgument)bufferIndirectArgumentType;
- (MTLBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 index:(unint64_t)a6 active:(BOOL)a7 arrayLength:(unint64_t)a8;
- (MTLBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 index:(unint64_t)a6 active:(BOOL)a7 arrayLength:(unint64_t)a8 typeDescription:(id)a9;
- (MTLPointerType)bufferPointerType;
- (MTLStructType)bufferStructType;
- (MTLStructType)structType;
- (MTLStructType)threadgroupMemoryStructType;
- (MTLStructTypeInternal)imageBlockMasterStructMembers;
- (MTLStructTypeInternal)meshPrimitiveStruct;
- (MTLStructTypeInternal)meshVertexStruct;
- (NSString)description;
- (NSString)name;
- (id)dataTypeDescription;
- (id)formattedDescription:(unint64_t)a3;
- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4;
- (int64_t)type;
- (unint64_t)access;
- (unint64_t)aliasImplicitImageBlockRenderTarget;
- (unint64_t)arrayLength;
- (unint64_t)bufferAlignment;
- (unint64_t)bufferDataSize;
- (unint64_t)bufferDataType;
- (unint64_t)builtInDataType;
- (unint64_t)builtInType;
- (unint64_t)imageBlockDataSize;
- (unint64_t)imageBlockKind;
- (unint64_t)index;
- (unint64_t)indirectConstantAlignment;
- (unint64_t)indirectConstantDataSize;
- (unint64_t)indirectConstantDataType;
- (unint64_t)meshPrimitiveCount;
- (unint64_t)meshTopologyType;
- (unint64_t)meshVertexCount;
- (unint64_t)objectPayloadAlignment;
- (unint64_t)objectPayloadDataSize;
- (unint64_t)textureDataType;
- (unint64_t)textureType;
- (unint64_t)threadgroupMemoryAlignment;
- (unint64_t)threadgroupMemoryDataSize;
- (unint64_t)threadgroupMemoryDataType;
- (void)dealloc;
- (void)setIsArgument:(BOOL)a3;
- (void)setIsUsed:(BOOL)a3;
@end

@implementation MTLBindingInternal

- (NSString)name
{
  return self->_name;
}

- (void)setIsArgument:(BOOL)a3
{
  self->_argument = a3;
}

- (MTLBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 index:(unint64_t)a6 active:(BOOL)a7 arrayLength:(unint64_t)a8
{
  v17.receiver = self;
  v17.super_class = (Class)MTLBindingInternal;
  v14 = [(MTLBindingInternal *)&v17 init];
  v14->_name = (NSString *)a3;
  id v15 = a3;
  v14->_type = a4;
  v14->_access = a5;
  v14->_index = a6;
  v14->_isUsed = a7;
  v14->_arrayLength = a8;
  v14->_typeInfo = 0;
  return v14;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLBindingInternal;
  [(MTLBindingInternal *)&v3 dealloc];
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)arrayLength
{
  return self->_arrayLength;
}

- (unint64_t)access
{
  return self->_access;
}

- (BOOL)isActive
{
  return self->_isUsed;
}

- (id)dataTypeDescription
{
  return self->_typeInfo;
}

- (MTLBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 index:(unint64_t)a6 active:(BOOL)a7 arrayLength:(unint64_t)a8 typeDescription:(id)a9
{
  v18.receiver = self;
  v18.super_class = (Class)MTLBindingInternal;
  id v15 = [(MTLBindingInternal *)&v18 init];
  v15->_name = (NSString *)a3;
  id v16 = a3;
  v15->_type = a4;
  v15->_access = a5;
  v15->_index = a6;
  v15->_isUsed = a7;
  v15->_arrayLength = a8;
  v15->_typeInfo = (MTLType *)a9;
  return v15;
}

- (MTLStructType)structType
{
  return 0;
}

- (BOOL)isDepthTexture
{
  MTLReportFailure(0, "-[MTLBindingInternal isDepthTexture]", 1685, @"Querying isDepthTexture on an argument that is not a texture", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)bufferAlignment
{
  MTLReportFailure(0, "-[MTLBindingInternal bufferAlignment]", 1691, @"Querying buffer alignment on an argument that is not a buffer", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)bufferDataSize
{
  MTLReportFailure(0, "-[MTLBindingInternal bufferDataSize]", 1697, @"Querying buffer data size on an argument that is not a buffer", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)bufferDataType
{
  MTLReportFailure(0, "-[MTLBindingInternal bufferDataType]", 1703, @"Querying buffer data type on an argument that is not a buffer", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)indirectConstantAlignment
{
  MTLReportFailure(0, "-[MTLBindingInternal indirectConstantAlignment]", 1709, @"Querying indirect constant alignment on an argument that is not an indirect constant", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)indirectConstantDataSize
{
  MTLReportFailure(0, "-[MTLBindingInternal indirectConstantDataSize]", 1715, @"Querying indirect constant data size on an argument that is not an indirect constant", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)indirectConstantDataType
{
  MTLReportFailure(0, "-[MTLBindingInternal indirectConstantDataType]", 1721, @"Querying indirect constant data type on an argument that is not an indirect constant", v2, v3, v4, v5, vars0);
  return 0;
}

- (MTLArgument)bufferIndirectArgumentType
{
  MTLReportFailure(0, "-[MTLBindingInternal bufferIndirectArgumentType]", 1727, @"Not supported at this point", v2, v3, v4, v5, vars0);
  return 0;
}

- (MTLStructType)bufferStructType
{
  MTLReportFailure(0, "-[MTLBindingInternal bufferStructType]", 1733, @"Querying buffer struct type on an argument that is not a buffer", v2, v3, v4, v5, vars0);
  return 0;
}

- (MTLPointerType)bufferPointerType
{
  return 0;
}

- (unint64_t)threadgroupMemoryAlignment
{
  MTLReportFailure(0, "-[MTLBindingInternal threadgroupMemoryAlignment]", 1741, @"Querying threadgroup memory alignment on an argument that is not a threadgroup memory", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)threadgroupMemoryDataSize
{
  MTLReportFailure(0, "-[MTLBindingInternal threadgroupMemoryDataSize]", 1747, @"Querying threadgroup memory data size on an argument that is not a threadgroup memory", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)textureType
{
  MTLReportFailure(0, "-[MTLBindingInternal textureType]", 1753, @"Querying texture type on an argument that is not a texture", v2, v3, v4, v5, vars0);
  return 2;
}

- (unint64_t)textureDataType
{
  MTLReportFailure(0, "-[MTLBindingInternal textureDataType]", 1759, @"Querying texture data type on an argument that is not a texture", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)objectPayloadAlignment
{
  MTLReportFailure(0, "-[MTLBindingInternal objectPayloadAlignment]", 1766, @"Querying object payload alignment on an argument that is not an object payload", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)objectPayloadDataSize
{
  MTLReportFailure(0, "-[MTLBindingInternal objectPayloadDataSize]", 1772, @"Querying object payload size on an argument that is not an object payload", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)meshVertexCount
{
  MTLReportFailure(0, "-[MTLBindingInternal meshVertexCount]", 1778, @"Querying mesh vertex count on an argument that is not a mesh argument.", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)meshPrimitiveCount
{
  MTLReportFailure(0, "-[MTLBindingInternal meshPrimitiveCount]", 1784, @"Querying mesh primitive count on an argument that is not a mesh argument", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)meshTopologyType
{
  MTLReportFailure(0, "-[MTLBindingInternal meshTopologyType]", 1790, @"Querying mesh topology on an argument that is not a mesh argument", v2, v3, v4, v5, vars0);
  return 0;
}

- (MTLStructTypeInternal)meshVertexStruct
{
  MTLReportFailure(0, "-[MTLBindingInternal meshVertexStruct]", 1796, @"Querying mesh vertex struct on an argument that is not a mesh argument", v2, v3, v4, v5, vars0);
  return 0;
}

- (MTLStructTypeInternal)meshPrimitiveStruct
{
  MTLReportFailure(0, "-[MTLBindingInternal meshPrimitiveStruct]", 1802, @"Querying mesh primitive struct on an argument that is not a mesh argument", v2, v3, v4, v5, vars0);
  return 0;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  v19[22] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3 + 4;
  uint64_t v7 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v8 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)MTLBindingInternal;
  v9 = [(MTLBindingInternal *)&v18 description];
  v19[0] = v7;
  v19[1] = @"Name =";
  name = (__CFString *)self->_name;
  if (!name) {
    name = @"<none>";
  }
  v19[2] = name;
  v19[3] = v7;
  v19[4] = @"Type =";
  switch(self->_type)
  {
    case 0x10:
      v11 = @"MTLBindingTypeImageblockData";
      break;
    case 0x11:
      v11 = @"MTLBindingTypeImageblock";
      break;
    case 0x12:
    case 0x13:
    case 0x14:
    case 0x15:
    case 0x16:
    case 0x17:
LABEL_9:
      v11 = @"Unknown";
      break;
    case 0x18:
      v11 = @"MTLBindingTypeVisibleFunctionTable";
      break;
    case 0x19:
      v11 = @"MTLBindingTypePrimitiveAccelerationStructure";
      break;
    case 0x1ALL:
      v11 = @"MTLBindingTypeInstanceAccelerationStructure";
      break;
    case 0x1BLL:
      v11 = @"MTLBindingTypeIntersectionFunctionTable";
      break;
    default:
      v11 = @"MTLBindingTypeBuffer";
      switch(self->_type)
      {
        case 0x10:
          goto LABEL_17;
        case 0x11:
          v11 = @"MTLBindingTypeThreadgroupMemory";
          break;
        case 0x12:
          v11 = @"MTLBindingTypeTexture";
          break;
        case 0x13:
          v11 = @"MTLBindingTypeSampler";
          break;
        default:
          if (self->_type != 50) {
            goto LABEL_9;
          }
          v11 = @"MTLBindingTypeObjectPayload";
          break;
      }
      break;
  }
LABEL_17:
  v19[5] = v11;
  v19[6] = v7;
  v19[7] = @"Access =";
  unint64_t access = self->_access;
  if (access > 2) {
    v13 = @"Unknown";
  }
  else {
    v13 = off_1E5221D88[access];
  }
  v19[8] = v13;
  v19[9] = v7;
  v19[10] = @"LocationIndex =";
  if (self->_index == 0xFFFFFFFF) {
    v14 = @"Non-Bindable";
  }
  else {
    v14 = (__CFString *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  }
  v19[11] = v14;
  v19[12] = v7;
  v19[13] = @"Used =";
  v19[14] = [NSNumber numberWithBool:self->_isUsed];
  v19[15] = v7;
  v19[16] = @"Argument =";
  v19[17] = [NSNumber numberWithBool:self->_argument];
  v19[18] = v7;
  v19[19] = @"ArrayLength =";
  v19[20] = [NSNumber numberWithUnsignedInteger:self->_arrayLength];
  typeInfo = self->_typeInfo;
  if (typeInfo) {
    id v16 = (__CFString *)[NSString stringWithFormat:@"%@ TypeInfo = %@", v7, -[MTLType formattedDescription:withPrintedTypes:](typeInfo, "formattedDescription:withPrintedTypes:", v6, a4)];
  }
  else {
    id v16 = &stru_1ECAC84A8;
  }
  v19[21] = v16;
  return (id)[v8 stringWithFormat:@"%@%@", v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 22), "componentsJoinedByString:", @" "];
}

- (id)formattedDescription:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(MTLBindingInternal *)self formattedDescription:a3 withPrintedTypes:v5];

  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(MTLBindingInternal *)self formattedDescription:0 withPrintedTypes:v3];

  return v4;
}

- (BOOL)isUsed
{
  return self->_isUsed;
}

- (void)setIsUsed:(BOOL)a3
{
  self->_isUsed = a3;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  int v5 = [(NSString *)self->_name isEqual:*((void *)a3 + 5)];
  if (!v5) {
    return v5;
  }
  if (self->_type != *((void *)a3 + 6)
    || self->_access != *((void *)a3 + 7)
    || self->_index != *((void *)a3 + 8)
    || self->_isUsed != *((unsigned __int8 *)a3 + 72)
    || self->_arrayLength != *((void *)a3 + 10))
  {
LABEL_11:
    LOBYTE(v5) = 0;
    return v5;
  }
  typeInfo = self->_typeInfo;
  if ((unint64_t)typeInfo | *((void *)a3 + 11))
  {
    LOBYTE(v5) = -[MTLType isEqual:](typeInfo, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isArgument
{
  return self->_argument;
}

- (unint64_t)builtInType
{
  return self->_builtInType;
}

- (unint64_t)builtInDataType
{
  return self->_builtInDataType;
}

- (unint64_t)imageBlockKind
{
  return self->_imageBlockKind;
}

- (unint64_t)imageBlockDataSize
{
  return self->_imageBlockDataSize;
}

- (MTLStructTypeInternal)imageBlockMasterStructMembers
{
  return (MTLStructTypeInternal *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)aliasImplicitImageBlock
{
  return self->_aliasImplicitImageBlock;
}

- (unint64_t)aliasImplicitImageBlockRenderTarget
{
  return self->_aliasImplicitImageBlockRenderTarget;
}

- (BOOL)isVertexDescriptorBuffer
{
  return self->_vertexDescriptorBuffer;
}

- (unint64_t)threadgroupMemoryDataType
{
  return self->_threadgroupMemoryDataType;
}

- (MTLStructType)threadgroupMemoryStructType
{
  return (MTLStructType *)objc_getProperty(self, a2, 160, 1);
}

@end