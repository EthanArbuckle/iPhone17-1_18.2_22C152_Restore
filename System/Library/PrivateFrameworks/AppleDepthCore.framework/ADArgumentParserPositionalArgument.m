@interface ADArgumentParserPositionalArgument
+ (id)enumArgument:(SEL)a3 description:(id)a4 conversionDictionary:(id)a5;
+ (id)floatArgument:(SEL)a3 description:(id)a4;
+ (id)integerArgument:(SEL)a3 description:(id)a4;
+ (id)stringArgument:(SEL)a3 description:(id)a4;
- (ADArgumentParserPositionalArgument)initWithName:(SEL)a3 description:(id)a4 type:(unint64_t)a5 conversionDictionary:(id)a6;
- (BOOL)setPropertyFromMap:()map<std:()docopt:()std:(std:(docopt:(id)a4 :value>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :value :string toCommand:;
- (NSDictionary)conversionDictionary;
- (NSString)descriptionString;
- (NSString)name;
- (id)fullUsage;
- (id)legalValuesString;
- (id)shortUsage;
- (id)value;
- (unint64_t)type;
@end

@implementation ADArgumentParserPositionalArgument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionDictionary, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDictionary)conversionDictionary
{
  return self->_conversionDictionary;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (id)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)setPropertyFromMap:()map<std:()docopt:()std:(std:(docopt:(id)a4 :value>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :value :string toCommand:
{
  id v6 = a4;
  v7 = [NSString stringWithFormat:@"<%@>", self->_name];
  std::map<std::string,docopt::value>::map[abi:ne180100](v14, a3);
  getDocoptValueFromMap(v7, (uint64_t)v14, &v15);
  std::__tree<std::__value_type<std::string,docopt::value>,std::__map_value_compare<std::string,std::__value_type<std::string,docopt::value>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,docopt::value>>>::destroy(v14[1]);

  name = self->_name;
  unint64_t type = self->_type;
  int v12 = v15;
  switch(v15)
  {
    case 1:
      __p.__r_.__value_.__s.__data_[0] = v16.__r_.__value_.__s.__data_[0];
      break;
    case 2:
      __p.__r_.__value_.__r.__words[0] = v16.__r_.__value_.__r.__words[0];
      break;
    case 3:
      if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v16;
      }
      break;
    case 4:
      memset(&__p, 0, sizeof(__p));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&__p, (long long *)v16.__r_.__value_.__l.__data_, (long long *)v16.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16.__r_.__value_.__l.__size_ - v16.__r_.__value_.__r.__words[0]) >> 3));
      break;
    default:
      break;
  }
  char v10 = setProperty(v6, name, type, (uint64_t)&v12, self->_conversionDictionary);
  if (v12 == 4)
  {
    p_p = &__p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
  }
  else if (v12 == 3 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v15 == 4)
  {
    p_p = &v16;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
  }
  else if (v15 == 3 && SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v16.__r_.__value_.__l.__data_);
  }

  return v10;
}

- (id)fullUsage
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = [(ADArgumentParserPositionalArgument *)self name];
  v5 = (void *)[v4 mutableCopy];

  [v5 rightPaddToLength:45];
  id v6 = [(ADArgumentParserPositionalArgument *)self descriptionString];
  [v3 appendFormat:@"%@%@", v5, v6];

  v7 = [(ADArgumentParserPositionalArgument *)self legalValuesString];

  if (v7)
  {
    v8 = [(ADArgumentParserPositionalArgument *)self legalValuesString];
    [v3 appendString:v8];
  }

  return v3;
}

- (id)shortUsage
{
  unint64_t v3 = [(ADArgumentParserPositionalArgument *)self type] - 5;
  v4 = NSString;
  uint64_t v5 = [(ADArgumentParserPositionalArgument *)self name];
  id v6 = (void *)v5;
  if (v3 > 2) {
    [v4 stringWithFormat:@"<%@>", v5];
  }
  else {
  v7 = [v4 stringWithFormat:@"<%@...>", v5];
  }

  return v7;
}

- (id)legalValuesString
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263F089D8] string];
  v4 = [(ADArgumentParserPositionalArgument *)self conversionDictionary];
  if (v4
    && ([(ADArgumentParserPositionalArgument *)self conversionDictionary],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    objc_msgSend(v3, "appendString:", @" (");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v7 = [(ADArgumentParserPositionalArgument *)self conversionDictionary];
    v8 = [v7 allKeys];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          [v3 appendFormat:@"%@|", *(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
    [v3 appendString:@""]);
    id v12 = v3;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (ADArgumentParserPositionalArgument)initWithName:(SEL)a3 description:(id)a4 type:(unint64_t)a5 conversionDictionary:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ADArgumentParserPositionalArgument;
  v13 = [(ADArgumentParserPositionalArgument *)&v17 init];
  if (v13)
  {
    uint64_t v14 = NSStringFromSelector(a3);
    name = v13->_name;
    v13->_name = (NSString *)v14;

    objc_storeStrong((id *)&v13->_descriptionString, a4);
    v13->_unint64_t type = a5;
    objc_storeStrong((id *)&v13->_conversionDictionary, a6);
  }

  return v13;
}

+ (id)floatArgument:(SEL)a3 description:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [[ADArgumentParserPositionalArgument alloc] initWithName:a3 description:v5 type:3 conversionDictionary:0];

  return v6;
}

+ (id)integerArgument:(SEL)a3 description:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [[ADArgumentParserPositionalArgument alloc] initWithName:a3 description:v5 type:2 conversionDictionary:0];

  return v6;
}

+ (id)stringArgument:(SEL)a3 description:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [[ADArgumentParserPositionalArgument alloc] initWithName:a3 description:v5 type:4 conversionDictionary:0];

  return v6;
}

+ (id)enumArgument:(SEL)a3 description:(id)a4 conversionDictionary:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [[ADArgumentParserPositionalArgument alloc] initWithName:a3 description:v7 type:0 conversionDictionary:v8];

  return v9;
}

@end