@interface MTLFunctionConstantValuesInternal
- (BOOL)isEqual:(id)a3;
- (MTLFunctionConstantValuesInternal)init;
- (const)constantValueWithFunctionConstant:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newConstantScriptForFunction:(id)a3 name:(id)a4 specializedName:(id)a5 errorMessage:(id *)a6;
- (id)newIndexedConstantArray;
- (id)newNamedConstantArray;
- (unint64_t)hash;
- (void)dealloc;
- (void)reset;
- (void)serializedConstantDataForFunction:(id)a3 dataSize:(unint64_t *)a4 errorMessage:(id *)a5;
- (void)setConstantValue:(const void *)a3 type:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setConstantValue:(const void *)a3 type:(unint64_t)a4 withName:(id)a5;
- (void)setConstantValues:(const void *)a3 type:(unint64_t)a4 withRange:(_NSRange)a5;
@end

@implementation MTLFunctionConstantValuesInternal

- (void)reset
{
  constantStorage = (void **)self->_constantStorage;
  if (constantStorage)
  {
    std::__tree<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>>>::destroy((uint64_t)(constantStorage + 3), constantStorage[4]);
    std::__tree<std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::__map_value_compare<std::string,std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,MTLConstantStorage::ConstantData>>>::destroy((uint64_t)constantStorage, constantStorage[1]);
    MEMORY[0x18530C140](constantStorage, 0x1020C404C310C12);
  }
  operator new();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 8);
    if (v4)
    {
      std::__tree<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>>>::destroy(v4 + 24, *(void **)(v4 + 32));
      std::__tree<std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::__map_value_compare<std::string,std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,MTLConstantStorage::ConstantData>>>::destroy(v4, *(void **)(v4 + 8));
      MEMORY[0x18530C140](v4, 0x1020C404C310C12);
    }
    operator new();
  }
  return 0;
}

- (MTLFunctionConstantValuesInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionConstantValuesInternal;
  if ([(MTLFunctionConstantValuesInternal *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  constantStorage = (void **)self->_constantStorage;
  if (constantStorage)
  {
    std::__tree<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>>>::destroy((uint64_t)(constantStorage + 3), constantStorage[4]);
    std::__tree<std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::__map_value_compare<std::string,std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,MTLConstantStorage::ConstantData>>>::destroy((uint64_t)constantStorage, constantStorage[1]);
    MEMORY[0x18530C140](constantStorage, 0x1020C404C310C12);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLFunctionConstantValuesInternal;
  [(MTLFunctionConstantValuesInternal *)&v4 dealloc];
}

- (id)newConstantScriptForFunction:(id)a3 name:(id)a4 specializedName:(id)a5 errorMessage:(id *)a6
{
  return MTLConstantStorage::constantAirScriptForFunction((MTLConstantStorage *)self->_constantStorage, (_MTLFunction *)a3, (NSString *)a4, (NSString *)a5, (NSString **)a6);
}

- (void)serializedConstantDataForFunction:(id)a3 dataSize:(unint64_t *)a4 errorMessage:(id *)a5
{
  return MTLConstantStorage::serializedConstantDataForFunction((MTLConstantStorage *)self->_constantStorage, (_MTLFunction *)a3, a4, (NSString **)a5);
}

- (void)setConstantValue:(const void *)a3 type:(unint64_t)a4 withName:(id)a5
{
  constantStorage = (MTLConstantStorage *)self->_constantStorage;
  v8 = (const char *)[a5 UTF8String];

  MTLConstantStorage::setConstantData(constantStorage, v8, a4, a3);
}

- (void)setConstantValues:(const void *)a3 type:(unint64_t)a4 withRange:(_NSRange)a5
{
  NSUInteger location = a5.location;
  NSUInteger v9 = a5.location + a5.length;
  if (a5.location + a5.length > 0x10000) {
    MTLReportFailure(0, "-[MTLFunctionConstantValuesInternal setConstantValues:type:withRange:]", 745, @"Constant index (%lu) must be smaller thank %u", a5.location, a5.length, v5, v6, v9 - 1);
  }
  if (MTLDataTypeGetComponentCount(a4) == 3)
  {
    uint64_t ComponentType = MTLDataTypeGetComponentType(a4);
    _MTLConstantDataSize(ComponentType);
  }
  else
  {
    _MTLConstantDataSize(a4);
  }
  if (location < v9)
  {
    _MTLConstantDataSize(a4);
    operator new[]();
  }
}

- (void)setConstantValue:(const void *)a3 type:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (a5 >= 0x10000) {
    MTLReportFailure(0, "-[MTLFunctionConstantValuesInternal setConstantValue:type:atIndex:]", 736, @"Constant index (%lu) must be smaller than %u", a5, v5, v6, v7, a5);
  }
  _MTLConstantDataSize(a4);
  operator new[]();
}

- (unint64_t)hash
{
  return MTLConstantStorage::hashData((MTLConstantStorage *)self->_constantStorage);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    return 0;
  }
  constantStorage = self->_constantStorage;
  v8 = (unsigned __int8 **)*((void *)a3 + 1);

  return MTLConstantStorage::isEqual(constantStorage, v8);
}

- (id)newNamedConstantArray
{
  return MTLConstantStorage::newNamedConstantArray((MTLConstantStorage *)self->_constantStorage);
}

- (id)newIndexedConstantArray
{
  return MTLConstantStorage::newIndexedConstantArray((MTLConstantStorage *)self->_constantStorage);
}

- (id)description
{
  v12[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(MTLFunctionConstantValuesInternal *)self newNamedConstantArray];
  objc_super v4 = [(MTLFunctionConstantValuesInternal *)self newIndexedConstantArray];
  uint64_t v5 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MTLFunctionConstantValuesInternal;
  id v6 = [(MTLFunctionConstantValuesInternal *)&v10 description];
  v11[0] = @"named constants";
  uint64_t v7 = arrayDescription(v3);
  v11[1] = @"index constants";
  v12[0] = v7;
  v12[1] = arrayDescription(v4);
  v8 = (void *)[v5 stringWithFormat:@"%@\n%@", v6, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, v11, 2)];

  return v8;
}

- (const)constantValueWithFunctionConstant:(id)a3
{
  result = MTLConstantStorage::findConstantValue((MTLConstantStorage *)self->_constantStorage, (MTLFunctionConstant *)a3);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(unsigned __int8 *)result;
    if ([a3 type] == v6) {
      return (const void *)*((void *)v5 + 1);
    }
    else {
      return 0;
    }
  }
  return result;
}

@end