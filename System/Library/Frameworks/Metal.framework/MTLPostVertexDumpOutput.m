@interface MTLPostVertexDumpOutput
- (BOOL)isEqual:(id)a3;
- (MTLPostVertexDumpOutput)initWithAirMDType:(id)a3 dataType:(unint64_t)a4 pixelFormat:(unint64_t)a5 aluType:(unint64_t)a6 name:(id)a7 offset:(unint64_t)a8;
- (NSString)airMDType;
- (NSString)name;
- (id)description;
- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4;
- (unint64_t)aluType;
- (unint64_t)dataType;
- (unint64_t)offset;
- (unint64_t)pixelFormat;
- (void)dealloc;
@end

@implementation MTLPostVertexDumpOutput

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLPostVertexDumpOutput;
  [(MTLPostVertexDumpOutput *)&v3 dealloc];
}

- (MTLPostVertexDumpOutput)initWithAirMDType:(id)a3 dataType:(unint64_t)a4 pixelFormat:(unint64_t)a5 aluType:(unint64_t)a6 name:(id)a7 offset:(unint64_t)a8
{
  v18.receiver = self;
  v18.super_class = (Class)MTLPostVertexDumpOutput;
  v14 = [(MTLPostVertexDumpOutput *)&v18 init];
  v14->_airMDType = (NSString *)a3;
  id v15 = a3;
  v14->_dataType = a4;
  v14->_pixelFormat = a5;
  v14->_aluType = a6;
  v14->_name = (NSString *)a7;
  id v16 = a7;
  v14->_offset = a8;
  return v14;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  v14[18] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)MTLPostVertexDumpOutput;
  id v7 = [(MTLPostVertexDumpOutput *)&v13 description];
  v14[0] = v5;
  v14[1] = @"airMDType =";
  airMDType = (__CFString *)self->_airMDType;
  unint64_t dataType = self->_dataType;
  if (!airMDType) {
    airMDType = @"<none>";
  }
  v14[2] = airMDType;
  v14[3] = v5;
  v14[4] = @"dataType =";
  v14[5] = MTLDataTypeString(dataType);
  v14[6] = v5;
  v14[7] = @"pixelFormat =";
  v14[8] = [NSString stringWithUTF8String:MTLPixelFormatGetName(self->_pixelFormat)];
  v14[9] = v5;
  v14[10] = @"aluType =";
  v14[11] = MTLDataTypeString(self->_aluType);
  v14[12] = v5;
  name = (__CFString *)self->_name;
  unint64_t offset = self->_offset;
  if (!name) {
    name = @"<none>";
  }
  v14[13] = @"name =";
  v14[14] = name;
  v14[15] = v5;
  v14[16] = @"offset =";
  v14[17] = [NSNumber numberWithUnsignedInteger:offset];
  return (id)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 18), "componentsJoinedByString:", @" "];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(MTLPostVertexDumpOutput *)self formattedDescription:0 withPrintedTypes:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_2;
  }
  int v6 = objc_msgSend((id)objc_msgSend(a3, "airMDType"), "isEqualToString:", self->_airMDType);
  if (!v6) {
    return v6;
  }
  if ([a3 dataType] == self->_dataType && objc_msgSend(a3, "pixelFormat") == self->_pixelFormat)
  {
    int v6 = objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", self->_name);
    if (v6) {
      LOBYTE(v6) = [a3 offset] == self->_offset;
    }
  }
  else
  {
LABEL_2:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (NSString)airMDType
{
  return self->_airMDType;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)aluType
{
  return self->_aluType;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)offset
{
  return self->_offset;
}

@end