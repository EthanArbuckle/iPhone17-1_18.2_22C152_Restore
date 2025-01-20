@interface AMDSQLiteColumnSpec
+ (char)getTypeEnumFor:(id)a3;
- (AMDSQLiteColumnSpec)initWithDict:(id)a3 withName:(id)a4 error:(id *)a5;
- (BOOL)isNotNull;
- (BOOL)isRequired;
- (BOOL)notNull;
- (BOOL)unique;
- (NSObject)defaultValue;
- (NSString)alias;
- (NSString)derivationExpression;
- (NSString)name;
- (NSString)typeString;
- (char)dataType;
- (char)getType;
- (id)getCreateStatementPart;
- (id)getDefaultValue;
- (id)getName;
- (id)getSelectColumnExpression;
- (id)getSelectColumnName;
- (id)getTypeString;
- (void)setAlias:(id)a3;
- (void)setDataType:(char)a3;
- (void)setDefaultValue:(id)a3;
- (void)setDerivationExpression:(id)a3;
- (void)setName:(id)a3;
- (void)setNotNull:(BOOL)a3;
- (void)setTypeString:(id)a3;
- (void)setUnique:(BOOL)a3;
@end

@implementation AMDSQLiteColumnSpec

+ (char)getTypeEnumFor:(id)a3
{
  v10[5] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getTypeEnumFor__sqlDataTypeMap)
  {
    v9[0] = AMD_SQLITE_DATA_TYPE_BLOB;
    v10[0] = &unk_26BEC16E8;
    v9[1] = AMD_SQLITE_DATA_TYPE_FLOAT;
    v10[1] = &unk_26BEC1700;
    v9[2] = AMD_SQLITE_DATA_TYPE_INT;
    v10[2] = &unk_26BEC1718;
    v9[3] = AMD_SQLITE_DATA_TYPE_INT64;
    v10[3] = &unk_26BEC1730;
    v9[4] = AMD_SQLITE_DATA_TYPE_TEXT;
    v10[4] = &unk_26BEC1748;
    id v3 = (id)[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];
    v4 = (void *)getTypeEnumFor__sqlDataTypeMap;
    getTypeEnumFor__sqlDataTypeMap = (uint64_t)v3;
  }
  id v7 = (id)[(id)getTypeEnumFor__sqlDataTypeMap objectForKey:location[0]];
  if (v7) {
    char v6 = [v7 unsignedIntValue];
  }
  else {
    char v6 = 0;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)getCreateStatementPart
{
  v16 = self;
  v15[1] = (id)a2;
  v15[0] = &stru_26BEAC9D8;
  char v13 = 0;
  BOOL v12 = 0;
  if ([(AMDSQLiteColumnSpec *)v16 notNull])
  {
    v14 = [(AMDSQLiteColumnSpec *)v16 defaultValue];
    char v13 = 1;
    BOOL v12 = v14 != 0;
  }
  if (v13) {

  }
  if (v12)
  {
    v10 = NSString;
    v11 = [(AMDSQLiteColumnSpec *)v16 defaultValue];
    id v2 = (id)[v10 stringWithFormat:@" ON CONFLICT REPLACE DEFAULT '%@'", v11];
    id v3 = v15[0];
    v15[0] = v2;
  }
  char v6 = NSString;
  v8 = [(AMDSQLiteColumnSpec *)v16 name];
  id v7 = [(AMDSQLiteColumnSpec *)v16 typeString];
  if ([(AMDSQLiteColumnSpec *)v16 notNull]) {
    v4 = @" NOT NULL";
  }
  else {
    v4 = &stru_26BEAC9D8;
  }
  id v9 = (id)[v6 stringWithFormat:@"%@ %@%@%@", v8, v7, v4, v15[0]];

  objc_storeStrong(v15, 0);

  return v9;
}

- (id)getDefaultValue
{
  return [(AMDSQLiteColumnSpec *)self defaultValue];
}

- (id)getName
{
  return [(AMDSQLiteColumnSpec *)self name];
}

- (id)getSelectColumnName
{
  v4 = [(AMDSQLiteColumnSpec *)self alias];
  char v7 = 0;
  char v5 = 0;
  if (v4)
  {
    v8 = [(AMDSQLiteColumnSpec *)self alias];
    char v7 = 1;
    id v2 = v8;
  }
  else
  {
    char v6 = [(AMDSQLiteColumnSpec *)self name];
    char v5 = 1;
    id v2 = v6;
  }
  v10 = v2;
  if (v5) {

  }
  if (v7) {

  }
  return v10;
}

- (id)getSelectColumnExpression
{
  id v2 = [(AMDSQLiteColumnSpec *)self derivationExpression];
  BOOL v11 = v2 != 0;

  if (v11)
  {
    char v6 = NSString;
    char v7 = [(AMDSQLiteColumnSpec *)self derivationExpression];
    v8 = [(AMDSQLiteColumnSpec *)self alias];
    char v14 = 0;
    char v12 = 0;
    if (v8)
    {
      v15 = [(AMDSQLiteColumnSpec *)self alias];
      char v14 = 1;
      char v5 = v15;
    }
    else
    {
      char v13 = [(AMDSQLiteColumnSpec *)self name];
      char v12 = 1;
      char v5 = v13;
    }
    v25 = (NSString *)(id)[v6 stringWithFormat:@"%@ AS %@", v7, v5];
    if (v12) {

    }
    if (v14) {
  }
    }
  else
  {
    v10 = [(AMDSQLiteColumnSpec *)self alias];
    char v22 = 0;
    char v20 = 0;
    char v18 = 0;
    char v16 = 0;
    if (v10)
    {
      id v9 = NSString;
      v23 = [(AMDSQLiteColumnSpec *)self name];
      char v22 = 1;
      v21 = [(AMDSQLiteColumnSpec *)self alias];
      char v20 = 1;
      id v19 = (id)[v9 stringWithFormat:@"%@ AS %@", v23, v21];
      char v18 = 1;
      id v3 = (NSString *)v19;
    }
    else
    {
      v17 = [(AMDSQLiteColumnSpec *)self name];
      char v16 = 1;
      id v3 = v17;
    }
    v25 = v3;
    if (v16) {

    }
    if (v18) {
    if (v20)
    }

    if (v22) {
  }
    }

  return v25;
}

- (char)getType
{
  return [(AMDSQLiteColumnSpec *)self dataType];
}

- (id)getTypeString
{
  return [(AMDSQLiteColumnSpec *)self typeString];
}

- (AMDSQLiteColumnSpec)initWithDict:(id)a3 withName:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = 0;
  objc_storeStrong(&v41, a4);
  v40 = a5;
  id v5 = v43;
  id v43 = 0;
  v39.receiver = v5;
  v39.super_class = (Class)AMDSQLiteColumnSpec;
  id v43 = [(AMDSQLiteColumnSpec *)&v39 init];
  objc_storeStrong(&v43, v43);
  id v38 = &_os_log_internal;
  os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v46, (uint64_t)v41);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v38, v37, "SQLITE Loading schema for column '%@'", v46, 0xCu);
  }
  objc_storeStrong(&v38, 0);
  [v43 setName:v41];
  id v28 = (id)[location[0] objectForKey:AMD_SQLITE_TYPE];
  objc_msgSend(v43, "setTypeString:");

  id v6 = (id)[v43 typeString];
  BOOL v29 = v6 != 0;

  if (v29)
  {
    id v26 = (id)[v43 typeString];
    id v25 = (id)[v26 uppercaseString];
    objc_msgSend(v43, "setTypeString:");

    id v27 = (id)[v43 typeString];
    char v8 = +[AMDSQLiteColumnSpec getTypeEnumFor:](AMDSQLiteColumnSpec, "getTypeEnumFor:");
    [v43 setDataType:v8];

    if ((char)[v43 dataType] == 1)
    {
      [v43 setNotNull:0];
    }
    else
    {
      id v35 = (id)[location[0] objectForKey:AMD_SQLITE_NOT_NULL];
      if (v35) {
        BOOL v24 = [v35 intValue] != 0;
      }
      else {
        BOOL v24 = 0;
      }
      [v43 setNotNull:v24];
      objc_storeStrong(&v35, 0);
    }
    id v34 = (id)[location[0] objectForKey:AMD_SQLITE_UNIQUE];
    if (v34) {
      BOOL v23 = [v34 intValue] != 0;
    }
    else {
      BOOL v23 = 0;
    }
    [v43 setUnique:v23];
    [v43 setDefaultValue:0];
    id v33 = (id)[location[0] objectForKey:AMD_SQLITE_DEFAULT_VALUE];
    if (v33)
    {
      char v9 = [v43 dataType];
      if (v9)
      {
        uint64_t v11 = v9;
        char v10 = 1;
      }
      else
      {
        uint64_t v11 = 0;
        char v10 = 0;
      }
      if (v10)
      {
LABEL_26:
        id v14 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Bad data type"];
        id *v40 = v14;
        v44 = 0;
        int v36 = 1;
      }
      else
      {
        switch(v11)
        {
          case 0:
            goto LABEL_26;
          case 1:
            goto LABEL_27;
          case 2:
          case 3:
          case 4:
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_22;
            }
            id v12 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Not a numeric default"];
            id *v40 = v12;
            v44 = 0;
            int v36 = 1;
            break;
          case 5:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
LABEL_22:
              [v43 setDefaultValue:v33];
              goto LABEL_27;
            }
            id v13 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Not a string default"];
            id *v40 = v13;
            v44 = 0;
            int v36 = 1;
            break;
          default:
            JUMPOUT(0);
        }
      }
    }
    else
    {
LABEL_27:
      id v21 = (id)[location[0] objectForKey:AMD_SQLITE_ALIAS];
      objc_msgSend(v43, "setAlias:");

      id v22 = (id)[location[0] objectForKey:AMD_SQLITE_DERIVATION_EXP];
      objc_msgSend(v43, "setDerivationExpression:");

      id v32 = &_os_log_internal;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEBUG))
      {
        id v16 = v41;
        int v17 = (char)[v43 dataType];
        int v18 = [v43 notNull] & 1;
        id v20 = (id)[v43 defaultValue];
        id v19 = (id)[v43 derivationExpression];
        __os_log_helper_16_2_6_8_64_4_0_4_0_8_64_8_64_4_0((uint64_t)v45, (uint64_t)v16, v17, v18, (uint64_t)v20, (uint64_t)v19, [v43 unique] & 1);
        _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v32, OS_LOG_TYPE_DEBUG, "SQLITE Loaded schema for column '%@', type: %u, notNull: %u, default: %@, derivation: %@, unique:%u", v45, 0x32u);
      }
      objc_storeStrong(&v32, 0);
      v44 = (AMDSQLiteColumnSpec *)v43;
      int v36 = 1;
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    id v7 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"No data type"];
    id *v40 = v7;
    v44 = 0;
    int v36 = 1;
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v43, 0);
  return v44;
}

- (BOOL)isNotNull
{
  return [(AMDSQLiteColumnSpec *)self notNull];
}

- (BOOL)isRequired
{
  if (![(AMDSQLiteColumnSpec *)self notNull]) {
    return 0;
  }
  id v2 = [(AMDSQLiteColumnSpec *)self defaultValue];
  BOOL v5 = v2 == 0;

  return v5;
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
}

- (char)dataType
{
  return self->_dataType;
}

- (void)setDataType:(char)a3
{
  self->_dataType = a3;
}

- (NSObject)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (NSString)derivationExpression
{
  return self->_derivationExpression;
}

- (void)setDerivationExpression:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)notNull
{
  return self->_notNull;
}

- (void)setNotNull:(BOOL)a3
{
  self->_notNull = a3;
}

- (NSString)typeString
{
  return self->_typeString;
}

- (void)setTypeString:(id)a3
{
}

- (BOOL)unique
{
  return self->_unique;
}

- (void)setUnique:(BOOL)a3
{
  self->_unique = a3;
}

- (void).cxx_destruct
{
}

@end