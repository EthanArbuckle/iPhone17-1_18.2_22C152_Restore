@interface _MTLFunction
- (MTLDebugInstrumentationData)debugInstrumentationData;
- (MTLDevice)device;
- (MTLFunctionHandle)functionHandle;
- (NSArray)importedLibraries;
- (NSArray)importedSymbols;
- (NSDictionary)functionConstantsDictionary;
- (NSString)description;
- (NSString)name;
- (NSString)unpackedFilePath;
- (_MTLFunction)initWithName:(id)a3 type:(unint64_t)a4 libraryData:(void *)a5 device:(id)a6;
- (const)bitCodeHash;
- (const)functionConstantSpecializationHash;
- (id)bitcodeData;
- (id)formattedDescription:(unint64_t)a3;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 functionReflection:(id)a5;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5;
- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4;
- (id)reflectionWithOptions:(unint64_t)a3;
- (id)reflectionWithOptions:(unint64_t)a3 binaryArchives:(id)a4;
- (id)reflectionWithOptions:(unint64_t)a3 pipelineLibrary:(id)a4;
- (id)vendorPrivate;
- (unint64_t)bitCodeFileSize;
- (unint64_t)functionType;
- (unint64_t)options;
- (unsigned)functionRef;
- (unsigned)requiredLLVMVersion;
- (void)dealloc;
- (void)libraryData;
- (void)reflectionWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)setDebugInstrumentationData:(id)a3;
- (void)setUnpackedFilePath:(id)a3;
- (void)setVendorPrivate:(id)a3;
@end

@implementation _MTLFunction

- (id)vendorPrivate
{
  return self->_vendorPrivate;
}

- (void)libraryData
{
  return self->_libraryData;
}

- (void)dealloc
{
  self->_device = 0;
  self->_vendorPrivate = 0;

  self->_name = 0;
  self->_vertexAttributes = 0;

  self->_arguments = 0;
  self->_returnType = 0;
  libraryData = self->_libraryData;
  if (libraryData)
  {
    (*(void (**)(void *))(*(void *)libraryData + 24))(libraryData);
    self->_libraryData = 0;
  }

  self->_unpackedFilePath = 0;
  debugInstrumentationData = self->_debugInstrumentationData;
  if (debugInstrumentationData) {

  }
  v5.receiver = self;
  v5.super_class = (Class)_MTLFunction;
  [(_MTLObjectWithLabel *)&v5 dealloc];
}

- (void)setVendorPrivate:(id)a3
{
  id v5 = a3;

  self->_vendorPrivate = a3;
}

- (MTLDevice)device
{
  return self->_device;
}

- (NSString)name
{
  return self->_name;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5
{
  id v8 = [(_MTLFunction *)self reflectionWithOptions:3 binaryArchives:a5];

  return [(_MTLFunction *)self newArgumentEncoderWithBufferIndex:a3 reflection:a4 functionReflection:v8];
}

- (id)reflectionWithOptions:(unint64_t)a3 binaryArchives:(id)a4
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  uint64_t v16 = 0;
  v7 = (void *)[(MTLDevice *)self->_device compiler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53___MTLFunction_reflectionWithOptions_binaryArchives___block_invoke;
  v10[3] = &unk_1E52211C0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  [v7 reflectionWithFunction:self options:a3 sync:1 binaryArchives:a4 completionHandler:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 functionReflection:(id)a5
{
  if (!objc_msgSend((id)objc_msgSend(a5, "arguments"), "count")) {
    goto LABEL_6;
  }
  uint64_t v13 = 0;
  while (1)
  {
    v14 = objc_msgSend((id)objc_msgSend(a5, "arguments"), "objectAtIndexedSubscript:", v13);
    if (![v14 type] && objc_msgSend(v14, "index") == a3) {
      break;
    }
    if (++v13 >= (unint64_t)objc_msgSend((id)objc_msgSend(a5, "arguments"), "count")) {
      goto LABEL_6;
    }
  }
  id v17 = v14;
  if (v17)
  {
    v18 = v17;
    v19 = (void *)-[MTLDevice newIndirectArgumentBufferLayoutWithStructType:](self->_device, "newIndirectArgumentBufferLayoutWithStructType:", [v17 bufferStructType]);
    objc_msgSend(v19, "setStructType:withDevice:", objc_msgSend(v18, "bufferStructType"), self->_device);
    v15 = (void *)[(MTLDevice *)self->_device newArgumentEncoderWithLayout:v19];
    if (a4)
    {
      *a4 = v18;
      _MTLFixIABReflectionOffsetsWithLayout(v18, v19, self->_device);
    }

    id v20 = v18;
  }
  else
  {
LABEL_6:
    MTLReportFailure(0, "-[_MTLFunction newArgumentEncoderWithBufferIndex:reflection:functionReflection:]", 10288, @"bufferIndex %lu does not identify an argument buffer", v9, v10, v11, v12, a3);
    return 0;
  }
  return v15;
}

- (id)bitcodeData
{
  v2 = (void *)[(_MTLFunction *)self bitcodeDataInternal];

  return v2;
}

- (unint64_t)functionType
{
  return self->_functionType;
}

- (_MTLFunction)initWithName:(id)a3 type:(unint64_t)a4 libraryData:(void *)a5 device:(id)a6
{
  if (!a3)
  {
    id v17 = @"name must not be nil.";
    unint64_t v18 = 0;
    uint64_t v19 = 10000;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = @"name is not a NSString.";
    unint64_t v18 = 1;
    uint64_t v19 = 10003;
LABEL_10:
    MTLReportFailure(v18, "-[_MTLFunction initWithName:type:libraryData:device:]", v19, (uint64_t)v17, (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)v23.receiver);
    if (a6) {
      goto LABEL_4;
    }
LABEL_11:
    id v20 = @"device must not be nil.";
    unint64_t v21 = 0;
    uint64_t v22 = 10006;
    goto LABEL_13;
  }
  if (!a6) {
    goto LABEL_11;
  }
LABEL_4:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  id v20 = @"device is not a MTLDevice.";
  unint64_t v21 = 1;
  uint64_t v22 = 10009;
LABEL_13:
  MTLReportFailure(v21, "-[_MTLFunction initWithName:type:libraryData:device:]", v22, (uint64_t)v20, (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)v23.receiver);
LABEL_5:
  if (a4 - 1 >= 8) {
    MTLReportFailure(0, "validateMTLFunctionType", 9911, @"type is not a valid MTLFunctionType.", (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)v23.receiver);
  }
  v23.receiver = self;
  v23.super_class = (Class)_MTLFunction;
  uint64_t v13 = [(_MTLObjectWithLabel *)&v23 init];
  v13->_device = (MTLDevice *)a6;
  id v14 = a6;
  v13->_libraryData = a5;
  (*(void (**)(void *))(*(void *)a5 + 16))(a5);
  v13->_vendorPrivate = 0;
  v13->_functionType = a4;
  v13->_vertexAttributes = 0;
  v13->_returnType = 0;
  v13->_arguments = 0;
  v13->_name = (NSString *)a3;
  id v15 = a3;
  return v13;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3
{
  return [(_MTLFunction *)self newArgumentEncoderWithBufferIndex:a3 reflection:0 binaryArchives:0];
}

- (unsigned)functionRef
{
  return 0;
}

- (const)bitCodeHash
{
  MTLReportFailure(0, "-[_MTLFunction bitCodeHash]", 10052, @"Unreachable code", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)bitCodeFileSize
{
  MTLReportFailure(0, "-[_MTLFunction bitCodeFileSize]", 10058, @"Unreachable code", v2, v3, v4, v5, vars0);
  return 0;
}

- (unsigned)requiredLLVMVersion
{
  MTLReportFailure(0, "-[_MTLFunction requiredLLVMVersion]", 10065, @"Unreachable code", v2, v3, v4, v5, vars0);
  return 0;
}

- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4
{
  MTLReportFailure(0, "-[_MTLFunction newFunctionWithPluginData:bitcodeType:]", 10073, @"Unreachable code", v4, v5, v6, v7, vars0);
  return 0;
}

- (NSDictionary)functionConstantsDictionary
{
  MTLReportFailure(0, "-[_MTLFunction functionConstantsDictionary]", 10138, @"Unreachable code", v2, v3, v4, v5, vars0);
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  v22[12] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3 + 4;
  uint64_t v6 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v7 = [@"\n" stringByPaddingToLength:a3 + 5 withString:@" " startingAtIndex:0];
  id v8 = (void *)[(_MTLFunction *)self stageInputAttributes];
  if (v8)
  {
    uint64_t v9 = (void *)[v8 componentsJoinedByString:@" "];
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "newlineCharacterSet")), "componentsJoinedByString:", v7);
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)_MTLFunction;
  uint64_t v12 = [(_MTLFunction *)&v21 description];
  name = self->_name;
  v22[0] = v6;
  v22[1] = @"name =";
  if (name) {
    id v14 = (__CFString *)name;
  }
  else {
    id v14 = @"<none>";
  }
  v22[2] = v14;
  v22[3] = v6;
  v22[4] = @"device =";
  device = self->_device;
  if (device) {
    uint64_t v16 = (__CFString *)[(MTLDevice *)device formattedDescription:v5];
  }
  else {
    uint64_t v16 = @"<null>";
  }
  v22[5] = v16;
  v22[6] = v6;
  v22[7] = @"functionType =";
  unint64_t v17 = self->_functionType - 1;
  if (v17 > 7) {
    unint64_t v18 = @"Unknown";
  }
  else {
    unint64_t v18 = (__CFString *)*((void *)&off_1E5221760 + v17);
  }
  v22[8] = v18;
  v22[9] = v6;
  if (v10) {
    uint64_t v19 = (__CFString *)v10;
  }
  else {
    uint64_t v19 = @"<none>";
  }
  v22[10] = @"attributes:";
  v22[11] = v19;
  return (id)[v11 stringWithFormat:@"%@%@", v12, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 12), "componentsJoinedByString:", @" "];
}

- (NSString)description
{
  return (NSString *)[(_MTLFunction *)self formattedDescription:0];
}

- (id)reflectionWithOptions:(unint64_t)a3
{
  return [(_MTLFunction *)self reflectionWithOptions:a3 pipelineLibrary:0];
}

- (id)reflectionWithOptions:(unint64_t)a3 pipelineLibrary:(id)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  id v14 = __Block_byref_object_copy__10;
  id v15 = __Block_byref_object_dispose__10;
  uint64_t v16 = 0;
  uint64_t v7 = (void *)[(MTLDevice *)self->_device compiler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54___MTLFunction_reflectionWithOptions_pipelineLibrary___block_invoke;
  v10[3] = &unk_1E52211C0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  [v7 reflectionWithFunction:self options:a3 sync:1 pipelineLibrary:a4 completionHandler:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)reflectionWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = (void *)[(MTLDevice *)self->_device compiler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56___MTLFunction_reflectionWithOptions_completionHandler___block_invoke;
  v8[3] = &unk_1E52211E8;
  v8[5] = a4;
  v8[6] = a3;
  v8[4] = self;
  [v7 reflectionWithFunction:self options:a3 sync:0 completionHandler:v8];
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4
{
  return [(_MTLFunction *)self newArgumentEncoderWithBufferIndex:a3 reflection:a4 binaryArchives:0];
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4
{
  return [(_MTLFunction *)self newArgumentEncoderWithBufferIndex:a3 reflection:0 pipelineLibrary:a4];
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5
{
  id v8 = [(_MTLFunction *)self reflectionWithOptions:3 pipelineLibrary:a5];

  return [(_MTLFunction *)self newArgumentEncoderWithBufferIndex:a3 reflection:a4 functionReflection:v8];
}

- (const)functionConstantSpecializationHash
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)&self->_functionConstantSpecializationHash;
}

- (MTLFunctionHandle)functionHandle
{
  MTLReportFailure(0, "-[_MTLFunction functionHandle]", 10335, @"Driver needs to override this", v2, v3, v4, v5, vars0);
  return 0;
}

- (NSString)unpackedFilePath
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUnpackedFilePath:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return self->_debugInstrumentationData;
}

- (void)setDebugInstrumentationData:(id)a3
{
}

- (NSArray)importedSymbols
{
  return self->_importedSymbols;
}

- (NSArray)importedLibraries
{
  return self->_importedLibraries;
}

@end