@interface KGPropertyValue
+ (id)kgPropertiesWithMAProperties:(id)a3;
+ (id)kgPropertyValueWithMAPropertyValue:(id)a3;
- (KGPropertyTypeProtocol)kgPropertyValue;
- (id)description;
- (id)initForSubclasses;
- (unint64_t)dataType;
@end

@implementation KGPropertyValue

- (id)description
{
  v2 = [(KGPropertyValue *)self kgPropertyValue];
  v3 = [v2 description];

  return v3;
}

- (KGPropertyTypeProtocol)kgPropertyValue
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)dataType
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)initForSubclasses
{
  v3.receiver = self;
  v3.super_class = (Class)KGPropertyValue;
  return [(KGPropertyValue *)&v3 init];
}

+ (id)kgPropertiesWithMAProperties:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v16);
        uint64_t v12 = +[KGPropertyValue kgPropertyValueWithMAPropertyValue:v11];
        if (!v12)
        {

          id v14 = 0;
          goto LABEL_11;
        }
        v13 = (void *)v12;
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v14 = v4;
LABEL_11:

  return v14;
}

+ (id)kgPropertyValueWithMAPropertyValue:(id)a3
{
  id v3 = a3;
  switch([v3 kgPropertyType])
  {
    case 1:
      id v4 = v3;
      id v5 = [KGInt64PropertyValue alloc];
      uint64_t v6 = [v4 integerValue];
      goto LABEL_7;
    case 2:
      id v8 = v3;
      v9 = [KGDoublePropertyValue alloc];
      [v8 doubleValue];
      double v11 = v10;

      uint64_t v12 = [(KGDoublePropertyValue *)v9 initWithValue:v11];
      goto LABEL_8;
    case 3:
      id v13 = v3;
      uint64_t v7 = [[KGStringPropertyValue alloc] initWithValue:v13];

      break;
    case 4:
      id v4 = v3;
      id v5 = [KGUInt64PropertyValue alloc];
      uint64_t v6 = [v4 unsignedIntegerValue];
LABEL_7:
      uint64_t v14 = v6;

      uint64_t v12 = [(KGInt64PropertyValue *)v5 initWithValue:v14];
LABEL_8:
      uint64_t v7 = (KGStringPropertyValue *)v12;
      break;
    default:
      uint64_t v7 = 0;
      break;
  }

  return v7;
}

@end