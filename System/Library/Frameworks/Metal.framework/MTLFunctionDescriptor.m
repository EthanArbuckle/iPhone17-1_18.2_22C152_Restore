@interface MTLFunctionDescriptor
+ (MTLFunctionDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLFunctionDescriptor)functionDescriptor;
- ($2772B1D07D29A72E8557B2574C0AE5C1)hashStableWithFunction:(SEL)a3;
- (BOOL)applyFunctionConstants;
- (BOOL)isEqual:(id)a3;
- (MTLFunctionConstantValues)constantValues;
- (MTLFunctionDescriptor)init;
- (MTLFunctionOptions)options;
- (NSArray)binaryArchives;
- (NSString)name;
- (NSString)specializedName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)pluginData;
- (id)privateFunctions;
- (unint64_t)hash;
- (unint64_t)pipelineOptions;
- (void)dealloc;
- (void)setApplyFunctionConstants:(BOOL)a3;
- (void)setBinaryArchives:(NSArray *)binaryArchives;
- (void)setConstantValues:(MTLFunctionConstantValues *)constantValues;
- (void)setName:(NSString *)name;
- (void)setOptions:(MTLFunctionOptions)options;
- (void)setPipelineOptions:(unint64_t)a3;
- (void)setPluginData:(id)a3;
- (void)setPrivateFunctions:(id)a3;
- (void)setSpecializedName:(NSString *)specializedName;
@end

@implementation MTLFunctionDescriptor

+ (MTLFunctionDescriptor)functionDescriptor
{
  v2 = objc_alloc_init(MTLFunctionDescriptor);

  return v2;
}

- (MTLFunctionDescriptor)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionDescriptor;
  v2 = [(MTLFunctionDescriptor *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_private.applyFunctionConstants = 1;
    v2->_private.privateFunctions = (NSArray *)objc_opt_new();
  }
  return v3;
}

- (void)setName:(NSString *)name
{
  if (name)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v10 = @"name is not a NSString.";
    unint64_t v11 = 1;
    uint64_t v12 = 117;
  }
  else
  {
    v10 = @"name must not be nil.";
    unint64_t v11 = 0;
    uint64_t v12 = 114;
  }
  MTLReportFailure(v11, "-[MTLFunctionDescriptor setName:]", v12, (uint64_t)v10, v3, v4, v5, v6, v13);
LABEL_3:
  v9 = self->_private.name;
  if (v9 != name)
  {

    self->_private.name = (NSString *)[(NSString *)name copy];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionDescriptor;
  [(MTLFunctionDescriptor *)&v3 dealloc];
}

- (void)setConstantValues:(MTLFunctionConstantValues *)constantValues
{
  if (constantValues)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLFunctionDescriptor setConstantValues:]", 153, @"constantValues is not a MTLFunctionConstantValues.", v5, v6, v7, v8, v10);
    }
  }
  v9 = self->_private.constantValues;
  if (v9 != constantValues)
  {

    self->_private.constantValues = (MTLFunctionConstantValues *)[(MTLFunctionConstantValues *)constantValues copy];
  }
}

- (NSString)specializedName
{
  return self->_private.specializedName;
}

- (unint64_t)pipelineOptions
{
  return self->_pipelineOptions;
}

- (MTLFunctionOptions)options
{
  return self->_private.options;
}

- (NSArray)binaryArchives
{
  return self->_private.binaryArchives;
}

- (MTLFunctionConstantValues)constantValues
{
  return self->_private.constantValues;
}

- (id)privateFunctions
{
  return self->_private.privateFunctions;
}

- (BOOL)applyFunctionConstants
{
  return self->_private.applyFunctionConstants;
}

- (NSString)name
{
  return self->_private.name;
}

+ (MTLFunctionDescriptor)allocWithZone:(_NSZone *)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTLFunctionDescriptor;
  return (MTLFunctionDescriptor *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (void)setBinaryArchives:(NSArray *)binaryArchives
{
  objc_super v3 = self->_private.binaryArchives;
  if (v3 != binaryArchives)
  {

    self->_private.binaryArchives = (NSArray *)[(NSArray *)binaryArchives copy];
  }
}

- (void)setSpecializedName:(NSString *)specializedName
{
  if (specializedName)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLFunctionDescriptor setSpecializedName:]", 135, @"specializedName is not a NSString.", v5, v6, v7, v8, v10);
    }
  }
  v9 = self->_private.specializedName;
  if (v9 != specializedName)
  {

    self->_private.specializedName = (NSString *)[(NSString *)specializedName copy];
  }
}

- (void)setPrivateFunctions:(id)a3
{
  privateFunctions = self->_private.privateFunctions;
  if (privateFunctions != a3)
  {

    self->_private.privateFunctions = (NSArray *)[a3 copy];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    *(void *)(v5 + 8) = [(NSString *)self->_private.name copyWithZone:a3];
    *(void *)(v5 + 16) = [(NSString *)self->_private.specializedName copyWithZone:a3];
    id v6 = [(MTLFunctionConstantValues *)self->_private.constantValues copyWithZone:a3];
    *(void *)(v5 + 24) = self->_private.options;
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = [(NSArray *)self->_private.binaryArchives copy];
    *(unsigned char *)(v5 + 48) = self->_private.applyFunctionConstants;
    *(void *)(v5 + 56) = [(NSArray *)self->_private.privateFunctions copy];
    [(id)v5 setPipelineOptions:self->_pipelineOptions];
    [(id)v5 setPluginData:self->_pluginData];
  }
  return (id)v5;
}

- (void)setOptions:(MTLFunctionOptions)options
{
  self->_private.options = options;
}

- (unint64_t)hash
{
  bzero(v6, 0x38uLL);
  v6[0] = [(NSString *)self->_private.name hash];
  v6[1] = [(NSString *)self->_private.specializedName hash];
  uint64_t v3 = [(MTLFunctionConstantValues *)self->_private.constantValues hash];
  unint64_t options = self->_private.options;
  v6[2] = v3;
  v6[3] = options;
  v6[4] = MTLHashArray(self->_private.binaryArchives, 1, 0);
  BOOL applyFunctionConstants = self->_private.applyFunctionConstants;
  v6[5] = MTLHashArray(self->_private.privateFunctions, 1, 1);
  return _MTLHashState((int *)v6, 0x38uLL);
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)hashStableWithFunction:(SEL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  bzero(data, 0x10uLL);
  data[0] = [(NSString *)self->_private.name hash];
  data[1] = [(NSString *)self->_private.specializedName hash];
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, data, 0x10u);
  constantValues = self->_private.constantValues;
  if (constantValues)
  {
    *(void *)&v20[0] = 0;
    id v17 = 0;
    uint64_t v8 = (void *)[(MTLFunctionConstantValues *)constantValues serializedConstantDataForFunction:a4 dataSize:v20 errorMessage:&v17];
    if (v8)
    {
      v9 = v8;
      CC_SHA256_Update(&c, v8, v20[0]);
      free(v9);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[MTLFunctionDescriptor hashStableWithFunction:]();
    }
  }
  privateFunctions = self->_private.privateFunctions;
  if (privateFunctions && [(NSArray *)privateFunctions count])
  {
    CC_SHA256_Update(&c, "privateFunctions", 0x10u);
    unint64_t v11 = (_OWORD *)objc_msgSend(-[NSArray objectAtIndexedSubscript:](privateFunctions, "objectAtIndexedSubscript:", 0), "bitCodeHash");
    long long v12 = v11[1];
    v20[0] = *v11;
    v20[1] = v12;
    if ([(NSArray *)privateFunctions count] >= 2)
    {
      unint64_t v13 = 1;
      do
      {
        uint64_t v14 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](privateFunctions, "objectAtIndexedSubscript:", v13), "bitCodeHash");
        for (uint64_t i = 0; i != 32; i += 8)
          *(void *)((char *)v20 + i) ^= *(void *)(v14 + i);
        unint64_t v13 = (v13 + 1);
      }
      while ([(NSArray *)privateFunctions count] > v13);
    }
    CC_SHA256_Update(&c, v20, 0x20u);
  }
  return ($2772B1D07D29A72E8557B2574C0AE5C1 *)CC_SHA256_Final(retstr->var0, &c);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    goto LABEL_3;
  }
  name = self->_private.name;
  if (name == *((NSString **)a3 + 1) || (int v6 = -[NSString isEqual:](name, "isEqual:")) != 0)
  {
    specializedName = self->_private.specializedName;
    if (specializedName == *((NSString **)a3 + 2) || (int v6 = -[NSString isEqual:](specializedName, "isEqual:")) != 0)
    {
      constantValues = self->_private.constantValues;
      if (constantValues == *((MTLFunctionConstantValues **)a3 + 4)
        || (int v6 = -[MTLFunctionConstantValues isEqual:](constantValues, "isEqual:")) != 0)
      {
        if (self->_private.options != *((void *)a3 + 3)) {
          goto LABEL_3;
        }
        int v10 = MTLCompareArray(self->_private.binaryArchives, *((void **)a3 + 5), 1, 0);
        LOBYTE(v6) = 0;
        if (!v10) {
          return v6;
        }
        if (self->_private.applyFunctionConstants != *((unsigned __int8 *)a3 + 48))
        {
LABEL_3:
          LOBYTE(v6) = 0;
          return v6;
        }
        privateFunctions = self->_private.privateFunctions;
        long long v12 = (void *)*((void *)a3 + 7);
        LOBYTE(v6) = MTLCompareArray(privateFunctions, v12, 1, 1);
      }
    }
  }
  return v6;
}

- (id)formattedDescription:(unint64_t)a3
{
  v15[18] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v5 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)MTLFunctionDescriptor;
  id v6 = [(MTLFunctionDescriptor *)&v14 description];
  v15[0] = v4;
  v15[1] = @"name =";
  name = (__CFString *)self->_private.name;
  specializedName = self->_private.specializedName;
  if (!name) {
    name = @"<none>";
  }
  v15[2] = name;
  v15[3] = v4;
  if (specializedName) {
    v9 = (__CFString *)specializedName;
  }
  else {
    v9 = @"<none>";
  }
  v15[4] = @"specializedName =";
  v15[5] = v9;
  v15[6] = v4;
  v15[7] = @"constantValues =";
  constantValues = self->_private.constantValues;
  if (!constantValues) {
    constantValues = (MTLFunctionConstantValues *)[MEMORY[0x1E4F1CA98] null];
  }
  v15[8] = constantValues;
  v15[9] = v4;
  v15[10] = @"options =";
  v15[11] = [NSNumber numberWithInteger:self->_private.options];
  v15[12] = v4;
  v15[13] = @"binaryArchives =";
  binaryArchives = self->_private.binaryArchives;
  if (!binaryArchives) {
    binaryArchives = (NSArray *)[MEMORY[0x1E4F1CA98] null];
  }
  v15[14] = binaryArchives;
  v15[15] = v4;
  v15[16] = @"privateFunctions =";
  privateFunctions = self->_private.privateFunctions;
  if (!privateFunctions) {
    privateFunctions = (NSArray *)[MEMORY[0x1E4F1CA98] null];
  }
  v15[17] = privateFunctions;
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 18), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLFunctionDescriptor *)self formattedDescription:0];
}

- (void)setPipelineOptions:(unint64_t)a3
{
  self->_pipelineOptions = a3;
}

- (void)setPluginData:(id)a3
{
  pluginData = self->_pluginData;
  if (pluginData != a3)
  {

    self->_pluginData = (NSDictionary *)[a3 copy];
  }
}

- (id)pluginData
{
  return self->_pluginData;
}

- (void)setApplyFunctionConstants:(BOOL)a3
{
  self->_private.BOOL applyFunctionConstants = a3;
}

- (void)hashStableWithFunction:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create constant hash for function.", v0, 2u);
}

@end