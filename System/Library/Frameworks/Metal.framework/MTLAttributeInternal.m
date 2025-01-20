@interface MTLAttributeInternal
- (BOOL)isActive;
- (BOOL)isPatchControlPointData;
- (BOOL)isPatchData;
- (MTLAttributeInternal)initWithName:(id)a3 attributeIndex:(unint64_t)a4 attributeType:(unint64_t)a5 flags:(MTLAttributeFlags)a6;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)name;
- (unint64_t)attributeIndex;
- (unint64_t)attributeType;
- (void)dealloc;
- (void)setAttributeType:(unint64_t)a3;
@end

@implementation MTLAttributeInternal

- (MTLAttributeInternal)initWithName:(id)a3 attributeIndex:(unint64_t)a4 attributeType:(unint64_t)a5 flags:(MTLAttributeFlags)a6
{
  unsigned __int8 var1 = a6.var0.var1;
  v13.receiver = self;
  v13.super_class = (Class)MTLAttributeInternal;
  v10 = [(MTLAttributeInternal *)&v13 init];
  v10->_name = (NSString *)a3;
  id v11 = a3;
  v10->_attributeIndex = a4;
  v10->_attributeType = a5;
  v10->_flags = var1;
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAttributeInternal;
  [(MTLAttributeInternal *)&v3 dealloc];
}

- (BOOL)isActive
{
  return self->_flags & 1;
}

- (void)setAttributeType:(unint64_t)a3
{
  self->_attributeType = a3;
}

- (BOOL)isPatchData
{
  return (self->_flags >> 1) & 1;
}

- (BOOL)isPatchControlPointData
{
  return (self->_flags >> 2) & 1;
}

- (id)formattedDescription:(unint64_t)a3
{
  v10[18] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)MTLAttributeInternal;
  id v6 = [(MTLAttributeInternal *)&v9 description];
  v10[0] = v4;
  v10[1] = @"name =";
  name = (__CFString *)self->_name;
  if (!name) {
    name = @"<none>";
  }
  v10[2] = name;
  v10[3] = v4;
  v10[4] = @"attributeIndex =";
  v10[5] = [NSNumber numberWithUnsignedInteger:self->_attributeIndex];
  v10[6] = v4;
  v10[7] = @"attributeType =";
  v10[8] = MTLDataTypeString(self->_attributeType);
  v10[9] = v4;
  v10[10] = @"active =";
  v10[11] = [NSNumber numberWithUnsignedChar:self->_flags & 1];
  v10[12] = v4;
  v10[13] = @"isPatchData =";
  v10[14] = [NSNumber numberWithUnsignedChar:(self->_flags >> 1) & 1];
  v10[15] = v4;
  v10[16] = @"isPatchControlPointData =";
  v10[17] = [NSNumber numberWithUnsignedChar:(self->_flags >> 2) & 1];
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 18), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLAttributeInternal *)self formattedDescription:0];
}

- (id)name
{
  return self->_name;
}

- (unint64_t)attributeIndex
{
  return self->_attributeIndex;
}

- (unint64_t)attributeType
{
  return self->_attributeType;
}

@end