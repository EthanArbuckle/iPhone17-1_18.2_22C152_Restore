@interface HDHealthRecordClinicalType
+ (id)nameForClinicalType:(int64_t)a3;
+ (void)enumerateClinicalTypesUsingBlock:(id)a3;
- (Class)medicalRecordClass;
- (HDHealthRecordClinicalType)initWithClinicalType:(int64_t)a3;
- (HDHealthRecordClinicalType)initWithClinicalTypeName:(id)a3;
- (NSString)name;
- (int64_t)type;
@end

@implementation HDHealthRecordClinicalType

- (HDHealthRecordClinicalType)initWithClinicalType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordClinicalType;
  v4 = [(HDHealthRecordClinicalType *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    uint64_t v6 = [(id)objc_opt_class() nameForClinicalType:a3];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (HDHealthRecordClinicalType)initWithClinicalTypeName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDHealthRecordClinicalType.m", 57, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  if ([v5 isEqualToString:@"allergy"])
  {
    uint64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"clinicalNote"])
  {
    uint64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"condition"])
  {
    uint64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"coverage"])
  {
    uint64_t v6 = 3;
  }
  else if ([v5 isEqualToString:@"immunization"])
  {
    uint64_t v6 = 4;
  }
  else if ([v5 isEqualToString:@"medicationDispense"])
  {
    uint64_t v6 = 5;
  }
  else if ([v5 isEqualToString:@"medicationOrder"])
  {
    uint64_t v6 = 6;
  }
  else if ([v5 isEqualToString:@"medicationStatement"])
  {
    uint64_t v6 = 7;
  }
  else if ([v5 isEqualToString:@"observation"])
  {
    uint64_t v6 = 8;
  }
  else if ([v5 isEqualToString:@"panel"])
  {
    uint64_t v6 = 9;
  }
  else if ([v5 isEqualToString:@"patient"])
  {
    uint64_t v6 = 10;
  }
  else
  {
    if (![v5 isEqualToString:@"procedure"])
    {
      v12 = 0;
      goto LABEL_30;
    }
    uint64_t v6 = 11;
  }
  v14.receiver = self;
  v14.super_class = (Class)HDHealthRecordClinicalType;
  v8 = [(HDHealthRecordClinicalType *)&v14 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_type = v6;
    uint64_t v10 = [v5 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;
  }
  self = v9;
  v12 = self;
LABEL_30:

  return v12;
}

- (Class)medicalRecordClass
{
  switch(self->_type)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xALL:
    case 0xBLL:
      v2 = objc_opt_class();
      break;
    default:
      uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HDHealthRecordClinicalType.m", 161, @"Invalid type: %ld", self->_type);

      break;
  }
  return (Class)v2;
}

+ (id)nameForClinicalType:(int64_t)a3
{
  if ((unint64_t)a3 < 0xC) {
    return off_264BD9B78[a3];
  }
  v7 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDHealthRecordClinicalType.m", 219, @"Invalid type: %ld", a3);

  return result;
}

+ (void)enumerateClinicalTypesUsingBlock:(id)a3
{
  v3 = (void (**)(id, void, char *))a3;
  char v4 = 0;
  v3[2](v3, 0, &v4);
  if (!v4)
  {
    v3[2](v3, 1, &v4);
    if (!v4)
    {
      v3[2](v3, 2, &v4);
      if (!v4)
      {
        v3[2](v3, 3, &v4);
        if (!v4)
        {
          v3[2](v3, 4, &v4);
          if (!v4)
          {
            v3[2](v3, 5, &v4);
            if (!v4)
            {
              v3[2](v3, 6, &v4);
              if (!v4)
              {
                v3[2](v3, 7, &v4);
                if (!v4)
                {
                  v3[2](v3, 8, &v4);
                  if (!v4)
                  {
                    v3[2](v3, 9, &v4);
                    if (!v4)
                    {
                      v3[2](v3, 10, &v4);
                      if (!v4) {
                        v3[2](v3, 11, &v4);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end