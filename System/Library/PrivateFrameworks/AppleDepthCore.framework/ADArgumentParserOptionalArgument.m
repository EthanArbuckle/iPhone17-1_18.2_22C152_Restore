@interface ADArgumentParserOptionalArgument
+ (id)BOOLOption:(SEL)a3 shortName:(char)a4 description:(id)a5;
+ (id)enumOption:(SEL)a3 shortName:(char)a4 defaultValue:(unint64_t)a5 description:(id)a6 conversionDictionary:(id)a7;
+ (id)floatArrayOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6;
+ (id)floatOption:(SEL)a3 shortName:(char)a4 defaultValue:(float)a5 description:(id)a6;
+ (id)integerArrayOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6;
+ (id)integerOption:(SEL)a3 shortName:(char)a4 defaultValue:(int64_t)a5 description:(id)a6;
+ (id)stringArrayOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6;
+ (id)stringOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6;
- (ADArgumentParserOptionalArgument)initWithName:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6 type:(unint64_t)a7 conversionDictionary:(id)a8;
- (BOOL)setPropertyFromMap:()map<std:()docopt:()std:(std:(docopt:(id)a4 :value>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :value :string toCommand:;
- (NSDictionary)conversionDictionary;
- (NSString)descriptionString;
- (NSString)name;
- (char)shortName;
- (id)defaultValueString;
- (id)fullUsage;
- (id)legalValuesString;
- (id)shortUsage;
- (id)value;
- (unint64_t)type;
@end

@implementation ADArgumentParserOptionalArgument

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

- (char)shortName
{
  return self->_shortName;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)setPropertyFromMap:()map<std:()docopt:()std:(std:(docopt:(id)a4 :value>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :value :string toCommand:
{
  id v6 = a4;
  v7 = [NSString stringWithFormat:@"--%@", self->_name];
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
  if ([(ADArgumentParserOptionalArgument *)self shortName])
  {
    switch([(ADArgumentParserOptionalArgument *)self type])
    {
      case 0uLL:
        int v4 = [(ADArgumentParserOptionalArgument *)self shortName];
        v5 = @"-%c <enum>, ";
        goto LABEL_8;
      case 1uLL:
        int v4 = [(ADArgumentParserOptionalArgument *)self shortName];
        v5 = @"-%c, ";
        goto LABEL_8;
      case 2uLL:
      case 5uLL:
        int v4 = [(ADArgumentParserOptionalArgument *)self shortName];
        v5 = @"-%c <int>, ";
        goto LABEL_8;
      case 3uLL:
      case 6uLL:
        int v4 = [(ADArgumentParserOptionalArgument *)self shortName];
        v5 = @"-%c <float>, ";
        goto LABEL_8;
      case 4uLL:
      case 7uLL:
        int v4 = [(ADArgumentParserOptionalArgument *)self shortName];
        v5 = @"-%c <string>, ";
LABEL_8:
        objc_msgSend(v3, "appendFormat:", v5, v4);
        break;
      default:
        int v13 = 154;
        goto LABEL_24;
    }
  }
  switch([(ADArgumentParserOptionalArgument *)self type])
  {
    case 0uLL:
      id v6 = [(ADArgumentParserOptionalArgument *)self name];
      [v3 appendFormat:@"--%@ <enum>", v6];
      goto LABEL_15;
    case 1uLL:
      id v6 = [(ADArgumentParserOptionalArgument *)self name];
      [v3 appendFormat:@"--%@", v6];
      goto LABEL_15;
    case 2uLL:
    case 5uLL:
      id v6 = [(ADArgumentParserOptionalArgument *)self name];
      [v3 appendFormat:@"--%@ <int>", v6];
      goto LABEL_15;
    case 3uLL:
    case 6uLL:
      id v6 = [(ADArgumentParserOptionalArgument *)self name];
      [v3 appendFormat:@"--%@ <float>", v6];
      goto LABEL_15;
    case 4uLL:
    case 7uLL:
      id v6 = [(ADArgumentParserOptionalArgument *)self name];
      [v3 appendFormat:@"--%@ <string>", v6];
LABEL_15:

      [v3 rightPaddToLength:45];
      v7 = [(ADArgumentParserOptionalArgument *)self descriptionString];
      [v3 appendString:v7];

      v8 = [(ADArgumentParserOptionalArgument *)self legalValuesString];

      if (v8)
      {
        v9 = [(ADArgumentParserOptionalArgument *)self legalValuesString];
        [v3 appendString:v9];
      }
      char v10 = [(ADArgumentParserOptionalArgument *)self defaultValueString];

      if (v10)
      {
        v11 = [(ADArgumentParserOptionalArgument *)self defaultValueString];
        [v3 appendFormat:@" [default: %@]", v11];
      }
      return v3;
    default:
      int v13 = 179;
      break;
  }
LABEL_24:
  __assert_rtn("-[ADArgumentParserOptionalArgument fullUsage]", "ADArgumentParserOptionalArgument.mm", v13, "0");
}

- (id)shortUsage
{
  switch([(ADArgumentParserOptionalArgument *)self type])
  {
    case 0uLL:
      v3 = NSString;
      int v4 = [(ADArgumentParserOptionalArgument *)self name];
      uint64_t v5 = [v3 stringWithFormat:@"[--%@ <enum>]", v4];
      break;
    case 1uLL:
      id v6 = NSString;
      int v4 = [(ADArgumentParserOptionalArgument *)self name];
      uint64_t v5 = [v6 stringWithFormat:@"[--%@]", v4];
      break;
    case 2uLL:
      v7 = NSString;
      int v4 = [(ADArgumentParserOptionalArgument *)self name];
      uint64_t v5 = [v7 stringWithFormat:@"[--%@ <int>]", v4];
      break;
    case 3uLL:
      v8 = NSString;
      int v4 = [(ADArgumentParserOptionalArgument *)self name];
      uint64_t v5 = [v8 stringWithFormat:@"[--%@ <float>]", v4];
      break;
    case 4uLL:
      v9 = NSString;
      int v4 = [(ADArgumentParserOptionalArgument *)self name];
      uint64_t v5 = [v9 stringWithFormat:@"[--%@ <string>]", v4];
      break;
    case 5uLL:
      char v10 = NSString;
      int v4 = [(ADArgumentParserOptionalArgument *)self name];
      uint64_t v5 = [v10 stringWithFormat:@"[--%@ <int>]...", v4];
      break;
    case 6uLL:
      int v12 = NSString;
      int v4 = [(ADArgumentParserOptionalArgument *)self name];
      uint64_t v5 = [v12 stringWithFormat:@"[--%@ <float>]...", v4];
      break;
    case 7uLL:
      v11 = NSString;
      int v4 = [(ADArgumentParserOptionalArgument *)self name];
      uint64_t v5 = [v11 stringWithFormat:@"[--%@ <string>]...", v4];
      break;
    default:
      __assert_rtn("-[ADArgumentParserOptionalArgument shortUsage]", "ADArgumentParserOptionalArgument.mm", 114, "0");
  }
  int v13 = (void *)v5;

  return v13;
}

- (id)defaultValueString
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if ([(ADArgumentParserOptionalArgument *)self type] - 5 > 2)
  {
    if ([(ADArgumentParserOptionalArgument *)self type])
    {
      char v10 = NSString;
      v11 = [(ADArgumentParserOptionalArgument *)self value];
      id v9 = [v10 stringWithFormat:@"%@", v11];
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      int v12 = [(ADArgumentParserOptionalArgument *)self conversionDictionary];
      int v13 = [v12 allKeys];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v18 = [(ADArgumentParserOptionalArgument *)self conversionDictionary];
            v19 = [v18 objectForKeyedSubscript:v17];
            v20 = [(ADArgumentParserOptionalArgument *)self value];
            char v21 = [v19 isEqual:v20];

            if (v21)
            {
              id v9 = v17;

              goto LABEL_24;
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      v22 = NSString;
      v23 = [(ADArgumentParserOptionalArgument *)self value];
      id v9 = [v22 stringWithFormat:@"%@", v23];
    }
  }
  else
  {
    v3 = [(ADArgumentParserOptionalArgument *)self value];
    if ([v3 count])
    {
      int v4 = [MEMORY[0x263F089D8] string];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v6; ++j)
          {
            if (*(void *)v30 != v7) {
              objc_enumerationMutation(v5);
            }
            [v4 appendFormat:@"%@ ", *(void *)(*((void *)&v29 + 1) + 8 * j)];
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v6);
      }

      objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = 0;
    }
  }
LABEL_24:

  return v9;
}

- (id)legalValuesString
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  int v4 = [(ADArgumentParserOptionalArgument *)self conversionDictionary];
  if (v4
    && ([(ADArgumentParserOptionalArgument *)self conversionDictionary],
        id v5 = objc_claimAutoreleasedReturnValue(),
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
    uint64_t v7 = [(ADArgumentParserOptionalArgument *)self conversionDictionary];
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

- (ADArgumentParserOptionalArgument)initWithName:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6 type:(unint64_t)a7 conversionDictionary:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  v22.receiver = self;
  v22.super_class = (Class)ADArgumentParserOptionalArgument;
  long long v17 = [(ADArgumentParserOptionalArgument *)&v22 init];
  if (v17)
  {
    uint64_t v18 = NSStringFromSelector(a3);
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_shortName = a4;
    objc_storeStrong(&v17->_value, a5);
    objc_storeStrong((id *)&v17->_descriptionString, a6);
    v17->_unint64_t type = a7;
    objc_storeStrong((id *)&v17->_conversionDictionary, a8);
  }

  return v17;
}

+ (id)floatArrayOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = [[ADArgumentParserOptionalArgument alloc] initWithName:a3 shortName:v7 defaultValue:v9 description:v10 type:6 conversionDictionary:0];

  return v11;
}

+ (id)integerArrayOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = [[ADArgumentParserOptionalArgument alloc] initWithName:a3 shortName:v7 defaultValue:v9 description:v10 type:5 conversionDictionary:0];

  return v11;
}

+ (id)stringArrayOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = [[ADArgumentParserOptionalArgument alloc] initWithName:a3 shortName:v7 defaultValue:v9 description:v10 type:7 conversionDictionary:0];

  return v11;
}

+ (id)floatOption:(SEL)a3 shortName:(char)a4 defaultValue:(float)a5 description:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a6;
  id v10 = [ADArgumentParserOptionalArgument alloc];
  *(float *)&double v11 = a5;
  id v12 = [NSNumber numberWithFloat:v11];
  int v13 = [(ADArgumentParserOptionalArgument *)v10 initWithName:a3 shortName:v7 defaultValue:v12 description:v9 type:3 conversionDictionary:0];

  return v13;
}

+ (id)integerOption:(SEL)a3 shortName:(char)a4 defaultValue:(int64_t)a5 description:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a6;
  id v10 = [ADArgumentParserOptionalArgument alloc];
  double v11 = [NSNumber numberWithInteger:a5];
  id v12 = [(ADArgumentParserOptionalArgument *)v10 initWithName:a3 shortName:v7 defaultValue:v11 description:v9 type:2 conversionDictionary:0];

  return v12;
}

+ (id)stringOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a5;
  id v10 = a6;
  double v11 = [[ADArgumentParserOptionalArgument alloc] initWithName:a3 shortName:v7 defaultValue:v9 description:v10 type:4 conversionDictionary:0];

  return v11;
}

+ (id)BOOLOption:(SEL)a3 shortName:(char)a4 description:(id)a5
{
  uint64_t v5 = a4;
  id v7 = a5;
  v8 = [[ADArgumentParserOptionalArgument alloc] initWithName:a3 shortName:v5 defaultValue:@"false" description:v7 type:1 conversionDictionary:0];

  return v8;
}

+ (id)enumOption:(SEL)a3 shortName:(char)a4 defaultValue:(unint64_t)a5 description:(id)a6 conversionDictionary:(id)a7
{
  uint64_t v9 = a4;
  id v11 = a6;
  id v12 = a7;
  int v13 = [ADArgumentParserOptionalArgument alloc];
  id v14 = [NSNumber numberWithUnsignedInteger:a5];
  id v15 = [(ADArgumentParserOptionalArgument *)v13 initWithName:a3 shortName:v9 defaultValue:v14 description:v11 type:0 conversionDictionary:v12];

  return v15;
}

@end