@interface MTLStructMemberInternal
- (BOOL)isEqual:(id)a3;
- (BOOL)isMemberLayoutThreadSafeWith:(id)a3;
- (MTLStructMemberInternal)initWithName:(id)a3 offset:(unint64_t)a4 dataType:(unint64_t)a5 pixelFormat:(unint64_t)a6 aluType:(unint64_t)a7 indirectArgumentIndex:(unint64_t)a8 render_target:(unint64_t)a9 raster_order_group:(unint64_t)a10 details:(id)a11;
- (id)arrayType;
- (id)dataTypeDescription;
- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4;
- (id)indirectArgumentType;
- (id)name;
- (id)pointerType;
- (id)structType;
- (id)textureReferenceType;
- (unint64_t)aluType;
- (unint64_t)argumentIndex;
- (unint64_t)dataType;
- (unint64_t)indirectArgumentIndex;
- (unint64_t)offset;
- (unint64_t)pixelFormat;
- (unint64_t)raster_order_group;
- (unint64_t)render_target;
- (void)dealloc;
- (void)setOffset:(unint64_t)a3;
@end

@implementation MTLStructMemberInternal

- (unint64_t)offset
{
  return self->_offset;
}

- (id)indirectArgumentType
{
  return self->_details;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLStructMemberInternal;
  [(MTLStructMemberInternal *)&v3 dealloc];
}

- (MTLStructMemberInternal)initWithName:(id)a3 offset:(unint64_t)a4 dataType:(unint64_t)a5 pixelFormat:(unint64_t)a6 aluType:(unint64_t)a7 indirectArgumentIndex:(unint64_t)a8 render_target:(unint64_t)a9 raster_order_group:(unint64_t)a10 details:(id)a11
{
  v20.receiver = self;
  v20.super_class = (Class)MTLStructMemberInternal;
  unint64_t v21 = a5;
  v17 = [(MTLStructMemberInternal *)&v20 init];
  v17->_name = (NSString *)[a3 copy];
  v17->_offset = a4;
  *((_WORD *)v17 + 12) = a5;
  v17->_pixelFormat = a6;
  v17->_aluType = a7;
  v17->_argumentIndex = a8;
  v17->_render_target = a9;
  v17->_raster_order_group = a10;
  if (a5 == 57)
  {
    v17->_typeInfo = (MTLType *)newDataTypeDescriptionForIndirectArgument(a11, (uint64_t *)&v21);
    *((_WORD *)v17 + 12) = v21;
    v18 = &OBJC_IVAR___MTLStructMemberInternal__details;
  }
  else
  {
    v18 = &OBJC_IVAR___MTLStructMemberInternal__typeInfo;
  }
  *(Class *)((char *)&v17->super.super.isa + *v18) = (Class)a11;
  return v17;
}

- (id)name
{
  return self->_name;
}

- (unint64_t)argumentIndex
{
  return self->_argumentIndex;
}

- (unint64_t)indirectArgumentIndex
{
  return self->_argumentIndex;
}

- (unint64_t)dataType
{
  return *((unsigned __int16 *)self + 12);
}

- (id)arrayType
{
  if (*((_WORD *)self + 12) == 2) {
    return self->_typeInfo;
  }
  else {
    return 0;
  }
}

- (id)structType
{
  if (*((_WORD *)self + 12) == 1) {
    return self->_typeInfo;
  }
  else {
    return 0;
  }
}

- (id)dataTypeDescription
{
  return self->_typeInfo;
}

- (id)textureReferenceType
{
  id result = self->_typeInfo;
  if (result)
  {
    if ([result dataType] == 58) {
      return self->_typeInfo;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)pointerType
{
  id result = self->_typeInfo;
  if (result)
  {
    if ([result dataType] == 60) {
      return self->_typeInfo;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (BOOL)isMemberLayoutThreadSafeWith:(id)a3
{
  uint64_t v20 = [a3 aluType];
  unint64_t aluType = self->_aluType;
  uint64_t v6 = [a3 dataType];
  uint64_t v7 = *((unsigned __int16 *)self + 12);
  uint64_t v8 = [a3 offset];
  unint64_t offset = self->_offset;
  uint64_t v10 = [a3 pixelFormat];
  unint64_t pixelFormat = self->_pixelFormat;
  uint64_t v12 = [a3 arrayType];
  id v13 = [(MTLStructMemberInternal *)self arrayType];
  BOOL v14 = v12 != 0;
  BOOL v15 = v12 == 0;
  if (v13) {
    BOOL v15 = 1;
  }
  else {
    BOOL v14 = 1;
  }
  int v16 = v14 && v15;
  if (v10 != pixelFormat) {
    int v16 = 0;
  }
  if (v8 != offset) {
    int v16 = 0;
  }
  if (v6 != v7) {
    int v16 = 0;
  }
  if (v20 == aluType) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  if (v12 && v13) {
    v17 &= [v13 isArrayLayoutThreadSafeWith:v12];
  }
  if (-[MTLStructMemberInternal structType](self, "structType") && [a3 structType])
  {
    return v17 & objc_msgSend(-[MTLStructMemberInternal structType](self, "structType"), "isStructLayoutThreadSafeWith:", objc_msgSend(a3, "structType"));
  }
  else
  {
    id v18 = [(MTLStructMemberInternal *)self structType];
    if (v18 != (id)[a3 structType]) {
      LOBYTE(v17) = 0;
    }
  }
  return v17;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  v15[15] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3 + 4;
  uint64_t v7 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v8 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)MTLStructMemberInternal;
  id v9 = [(MTLStructMemberInternal *)&v14 description];
  name = self->_name;
  v15[0] = v7;
  v15[1] = @"Name =";
  v15[2] = name;
  v15[3] = v7;
  v15[4] = @"Offset =";
  v15[5] = [NSNumber numberWithUnsignedInteger:self->_offset];
  v15[6] = v7;
  v15[7] = @"DataType =";
  v15[8] = MTLDataTypeString(*((unsigned __int16 *)self + 12));
  v15[9] = v7;
  v15[10] = @"ArgumentIndex =";
  v15[11] = [NSNumber numberWithUnsignedInteger:self->_argumentIndex];
  v15[12] = v7;
  v15[13] = @"TypeInfo =";
  typeInfo = self->_typeInfo;
  if (typeInfo) {
    uint64_t v12 = (__CFString *)[(MTLType *)typeInfo formattedDescription:v6 withPrintedTypes:a4];
  }
  else {
    uint64_t v12 = @" nil";
  }
  v15[14] = v12;
  return (id)[v8 stringWithFormat:@"%@%@", v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 15), "componentsJoinedByString:", @" "];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)a3 + 1))
  {
    int v6 = -[NSString isEqualToString:](name, "isEqualToString:");
    if (!v6) {
      return v6;
    }
  }
  if (self->_offset != *((void *)a3 + 2) || *((unsigned __int16 *)self + 12) != *((unsigned __int16 *)a3 + 12)) {
    goto LABEL_17;
  }
  unint64_t details = (unint64_t)self->_details;
  if (details | *((void *)a3 + 4))
  {
    int v6 = objc_msgSend((id)details, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  if (self->_pixelFormat != *((void *)a3 + 5)
    || self->_aluType != *((void *)a3 + 6)
    || self->_argumentIndex != *((void *)a3 + 7)
    || self->_render_target != *((void *)a3 + 8)
    || self->_raster_order_group != *((void *)a3 + 9))
  {
LABEL_17:
    LOBYTE(v6) = 0;
    return v6;
  }
  typeInfo = self->_typeInfo;
  if (!((unint64_t)typeInfo | *((void *)a3 + 10)) || (int v6 = -[MTLType isEqual:](typeInfo, "isEqual:")) != 0) {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)aluType
{
  return self->_aluType;
}

- (unint64_t)render_target
{
  return self->_render_target;
}

- (unint64_t)raster_order_group
{
  return self->_raster_order_group;
}

@end