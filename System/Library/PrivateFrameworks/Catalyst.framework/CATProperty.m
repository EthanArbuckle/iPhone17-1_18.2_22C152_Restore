@interface CATProperty
+ (id)propertiesForClass:(Class)a3;
+ (id)propertiesForProtocol:(id)a3;
+ (void)initialize;
- (BOOL)isNonAtomic;
- (BOOL)isReadOnly;
- (BOOL)isWeakReference;
- (CATProperty)init;
- (CATProperty)initWithName:(const char *)a3 attributes:(const char *)a4;
- (Class)objectClass;
- (NSString)instanceVariableName;
- (NSString)name;
- (SEL)customGetterSelector;
- (SEL)customSetterSelector;
- (int64_t)association;
- (int64_t)type;
@end

@implementation CATProperty

+ (void)initialize
{
  if (initialize_once != -1) {
    dispatch_once(&initialize_once, &__block_literal_global_8);
  }
}

uint64_t __25__CATProperty_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)CATPropertyPropertiesByClassName;
  CATPropertyPropertiesByClassName = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  uint64_t v3 = CATPropertyPropertiesByProtocolName;
  CATPropertyPropertiesByProtocolName = (uint64_t)v2;

  return MEMORY[0x270F9A758](v2, v3);
}

+ (id)propertiesForClass:(Class)a3
{
  Superclass = a3;
  v18[1] = *MEMORY[0x263EF8340];
  v4 = NSStringFromClass(a3);
  v5 = [(id)CATPropertyPropertiesByClassName objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    do
    {
      unsigned int outCount = 0;
      v9 = class_copyPropertyList(Superclass, &outCount);
      if (outCount)
      {
        for (unint64_t i = 0; i < outCount; ++i)
        {
          v11 = v9[i];
          Name = property_getName(v11);
          v13 = [[CATProperty alloc] initWithName:Name attributes:property_getAttributes(v11)];
          [v8 addObject:v13];
        }
      }
      free(v9);
      Superclass = class_getSuperclass(Superclass);
    }
    while (Superclass);
    v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1 selector:sel_localizedStandardCompare_];
    v18[0] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    id v7 = [v8 sortedArrayUsingDescriptors:v15];

    [(id)CATPropertyPropertiesByClassName setObject:v7 forKey:v4];
  }

  return v7;
}

+ (id)propertiesForProtocol:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (Protocol *)a3;
  v4 = NSStringFromProtocol(v3);
  v5 = [(id)CATPropertyPropertiesByProtocolName objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    unsigned int outCount = 0;
    v9 = protocol_copyPropertyList(v3, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        v11 = v9[i];
        Name = property_getName(v11);
        v13 = [[CATProperty alloc] initWithName:Name attributes:property_getAttributes(v11)];
        [v8 addObject:v13];
      }
    }
    free(v9);
    v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1 selector:sel_localizedStandardCompare_];
    v18[0] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    id v7 = [v8 sortedArrayUsingDescriptors:v15];

    [(id)CATPropertyPropertiesByProtocolName setObject:v7 forKey:v4];
  }

  return v7;
}

- (CATProperty)initWithName:(const char *)a3 attributes:(const char *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"CATProperty.m", 109, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_68:
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"CATProperty.m", 110, @"Invalid parameter not satisfying: %@", @"attributes" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_68;
  }
LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)CATProperty;
  id v8 = [(CATProperty *)&v35 init];
  if (v8)
  {
    uint64_t v9 = [NSString stringWithUTF8String:a3];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v8->_association = 0;
    size_t v11 = strlen(a4);
    v12 = strcpy((char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
    v13 = strtok(v12, ",");
    if (v13)
    {
      v14 = v13;
      while (1)
      {
        int v15 = *v14;
        switch(*v14)
        {
          case 'G':
            SEL v16 = sel_registerName(v14 + 1);
            if (v16) {
              v17 = v16;
            }
            else {
              v17 = 0;
            }
            v8->_customGetterSelector = v17;
            goto LABEL_65;
          case 'H':
          case 'I':
          case 'J':
          case 'K':
          case 'L':
          case 'M':
          case 'O':
          case 'P':
          case 'Q':
          case 'U':
            goto LABEL_65;
          case 'N':
            v8->_nonAtomic = 1;
            goto LABEL_65;
          case 'R':
            v8->_readOnly = 1;
            goto LABEL_65;
          case 'S':
            SEL v18 = sel_registerName(v14 + 1);
            if (v18) {
              v19 = v18;
            }
            else {
              v19 = 0;
            }
            v8->_customSetterSelector = v19;
            goto LABEL_65;
          case 'T':
            unsigned int v20 = v14[1];
            if (v20 > 0x5A)
            {
              uint64_t v21 = 1;
              switch(v14[1])
              {
                case 'b':
                  uint64_t v21 = 22;
                  break;
                case 'c':
                  break;
                case 'd':
                  uint64_t v21 = 12;
                  break;
                case 'e':
                case 'g':
                case 'h':
                case 'j':
                case 'k':
                case 'm':
                case 'n':
                case 'o':
                case 'p':
                case 'r':
                case 't':
                case 'u':
                  goto LABEL_56;
                case 'f':
                  uint64_t v21 = 11;
                  break;
                case 'i':
                  uint64_t v21 = 2;
                  break;
                case 'l':
                  uint64_t v21 = 4;
                  break;
                case 'q':
                  uint64_t v21 = 5;
                  break;
                case 's':
                  uint64_t v21 = 3;
                  break;
                case 'v':
                  uint64_t v21 = 14;
                  break;
                default:
                  if (v20 == 91)
                  {
                    uint64_t v21 = 19;
                  }
                  else
                  {
                    if (v20 != 123) {
                      goto LABEL_56;
                    }
                    uint64_t v21 = 20;
                  }
                  break;
              }
            }
            else if (v14[1] > 0x48u)
            {
              if (v14[1] > 0x50u)
              {
                if (v20 == 81)
                {
                  uint64_t v21 = 10;
                }
                else
                {
                  if (v20 != 83)
                  {
LABEL_56:
                    BOOL v29 = v20 == 94;
                    uint64_t v30 = 23;
                    if (!v29) {
                      uint64_t v30 = 0;
                    }
                    v8->_type = v30;
                    goto LABEL_65;
                  }
                  uint64_t v21 = 8;
                }
              }
              else if (v20 == 73)
              {
                uint64_t v21 = 7;
              }
              else
              {
                if (v20 != 76) {
                  goto LABEL_56;
                }
                uint64_t v21 = 9;
              }
            }
            else
            {
              if (v14[1] > 0x39u)
              {
                switch(v14[1])
                {
                  case ':':
                    uint64_t v21 = 18;
                    goto LABEL_64;
                  case '@':
                    v8->_type = 16;
                    size_t v26 = strlen(v14);
                    size_t v27 = v26 - 4;
                    if (v26 > 4)
                    {
                      uint64_t v34 = (uint64_t)&v34;
                      v28 = strncpy((char *)&v34 - ((v26 + 12) & 0xFFFFFFFFFFFFFFF0), v14 + 3, v27);
                      v28[v27] = 0;
                      v8->_objectClass = objc_getClass(v28);
                    }
                    break;
                  case 'B':
                    uint64_t v21 = 13;
                    goto LABEL_64;
                  case 'C':
                    uint64_t v21 = 6;
                    goto LABEL_64;
                  default:
                    goto LABEL_56;
                }
                goto LABEL_65;
              }
              switch(v20)
              {
                case '#':
                  uint64_t v21 = 17;
                  break;
                case '(':
                  uint64_t v21 = 21;
                  break;
                case '*':
                  uint64_t v21 = 15;
                  break;
                default:
                  goto LABEL_56;
              }
            }
LABEL_64:
            v8->_type = v21;
LABEL_65:
            v14 = strtok(0, ",");
            if (!v14) {
              return v8;
            }
            break;
          case 'V':
            int v23 = v14[1];
            v22 = v14 + 1;
            if (v23)
            {
              uint64_t v24 = [[NSString alloc] initWithUTF8String:v22];
              instanceVariableName = v8->_instanceVariableName;
              v8->_instanceVariableName = (NSString *)v24;
            }
            goto LABEL_65;
          case 'W':
            v8->_weakReference = 1;
            goto LABEL_65;
          default:
            if (v15 == 38)
            {
              v8->_association = 1;
            }
            else if (v15 == 67)
            {
              v8->_association = 2;
            }
            goto LABEL_65;
        }
      }
    }
  }
  return v8;
}

- (CATProperty)init
{
  return [(CATProperty *)self initWithName:" attributes:"];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)instanceVariableName
{
  return self->_instanceVariableName;
}

- (int64_t)type
{
  return self->_type;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (BOOL)isNonAtomic
{
  return self->_nonAtomic;
}

- (int64_t)association
{
  return self->_association;
}

- (SEL)customGetterSelector
{
  if (self->_customGetterSelector) {
    return self->_customGetterSelector;
  }
  else {
    return 0;
  }
}

- (SEL)customSetterSelector
{
  if (self->_customSetterSelector) {
    return self->_customSetterSelector;
  }
  else {
    return 0;
  }
}

- (BOOL)isWeakReference
{
  return self->_weakReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceVariableName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end