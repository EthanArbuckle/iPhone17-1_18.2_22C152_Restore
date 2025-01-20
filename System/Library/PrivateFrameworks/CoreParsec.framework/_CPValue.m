@interface _CPValue
- (BOOL)BOOL_value;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bytes_value;
- (NSString)string_value;
- (_CPListValue)list_value;
- (_CPStruct)struct_value;
- (_CPValue)initWithFacade:(id)a3;
- (double)number_value;
- (int)null_value;
- (unint64_t)hash;
- (unint64_t)whichKind;
- (void)clearKind;
- (void)setBool_value:(BOOL)a3;
- (void)setBytes_value:(id)a3;
- (void)setList_value:(id)a3;
- (void)setNull_value:(int)a3;
- (void)setNumber_value:(double)a3;
- (void)setString_value:(id)a3;
- (void)setStruct_value:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytes_value, 0);
  objc_storeStrong((id *)&self->_list_value, 0);
  objc_storeStrong((id *)&self->_struct_value, 0);

  objc_storeStrong((id *)&self->_string_value, 0);
}

- (unint64_t)whichKind
{
  return self->_whichKind;
}

- (unint64_t)hash
{
  double number_value = self->_number_value;
  uint64_t v4 = 2654435761 * self->_null_value;
  double v5 = -number_value;
  if (number_value >= 0.0) {
    double v5 = self->_number_value;
  }
  long double v6 = round(v5);
  unint64_t v7 = (unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL);
  NSUInteger v8 = [(NSString *)self->_string_value hash];
  uint64_t v9 = 2654435761 * self->_BOOL_value;
  unint64_t v10 = [(_CPStruct *)self->_struct_value hash];
  unint64_t v11 = [(_CPListValue *)self->_list_value hash];
  return v8 ^ v4 ^ v9 ^ v10 ^ v11 ^ [(NSData *)self->_bytes_value hash] ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  int null_value = self->_null_value;
  if (null_value != objc_msgSend(v4, "null_value")) {
    goto LABEL_25;
  }
  double number_value = self->_number_value;
  objc_msgSend(v4, "number_value");
  if (number_value != v7) {
    goto LABEL_25;
  }
  NSUInteger v8 = [(_CPValue *)self string_value];
  uint64_t v9 = objc_msgSend(v4, "string_value");
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_24;
  }
  uint64_t v10 = [(_CPValue *)self string_value];
  if (v10)
  {
    unint64_t v11 = (void *)v10;
    v12 = [(_CPValue *)self string_value];
    v13 = objc_msgSend(v4, "string_value");
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  int BOOL_value = self->_BOOL_value;
  if (BOOL_value != objc_msgSend(v4, "BOOL_value")) {
    goto LABEL_25;
  }
  NSUInteger v8 = [(_CPValue *)self struct_value];
  uint64_t v9 = objc_msgSend(v4, "struct_value");
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_24;
  }
  uint64_t v16 = [(_CPValue *)self struct_value];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(_CPValue *)self struct_value];
    v19 = objc_msgSend(v4, "struct_value");
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  NSUInteger v8 = [(_CPValue *)self list_value];
  uint64_t v9 = objc_msgSend(v4, "list_value");
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_24;
  }
  uint64_t v21 = [(_CPValue *)self list_value];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(_CPValue *)self list_value];
    v24 = objc_msgSend(v4, "list_value");
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  NSUInteger v8 = [(_CPValue *)self bytes_value];
  uint64_t v9 = objc_msgSend(v4, "bytes_value");
  if ((v8 == 0) == (v9 != 0))
  {
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v26 = [(_CPValue *)self bytes_value];
  if (!v26)
  {

LABEL_28:
    BOOL v31 = 1;
    goto LABEL_26;
  }
  v27 = (void *)v26;
  v28 = [(_CPValue *)self bytes_value];
  v29 = objc_msgSend(v4, "bytes_value");
  char v30 = [v28 isEqual:v29];

  if (v30) {
    goto LABEL_28;
  }
LABEL_25:
  BOOL v31 = 0;
LABEL_26:

  return v31;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  if ([(_CPValue *)self null_value]) {
    PBDataWriterWriteInt32Field();
  }
  [(_CPValue *)self number_value];
  if (v4 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  double v5 = [(_CPValue *)self string_value];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPValue *)self BOOL_value]) {
    PBDataWriterWriteBOOLField();
  }
  long double v6 = [(_CPValue *)self struct_value];

  if (v6)
  {
    double v7 = [(_CPValue *)self struct_value];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v8 = [(_CPValue *)self list_value];

  if (v8)
  {
    uint64_t v9 = [(_CPValue *)self list_value];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v10 = [(_CPValue *)self bytes_value];

  unint64_t v11 = v12;
  if (v10)
  {
    PBDataWriterWriteDataField();
    unint64_t v11 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPValueReadFrom(self, (uint64_t)a3);
}

- (NSData)bytes_value
{
  if (self->_whichKind == 7) {
    v2 = self->_bytes_value;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setBytes_value:(id)a3
{
  id v7 = a3;
  [(_CPValue *)self clearKind];
  unint64_t v4 = 7;
  if (!v7) {
    unint64_t v4 = 0;
  }
  self->_whichKind = v4;
  double v5 = (NSData *)[v7 copy];
  bytes_value = self->_bytes_value;
  self->_bytes_value = v5;
}

- (_CPListValue)list_value
{
  if (self->_whichKind == 6) {
    v2 = self->_list_value;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setList_value:(id)a3
{
  unint64_t v4 = (_CPListValue *)a3;
  [(_CPValue *)self clearKind];
  unint64_t v5 = 6;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichKind = v5;
  list_value = self->_list_value;
  self->_list_value = v4;
}

- (_CPStruct)struct_value
{
  if (self->_whichKind == 5) {
    v2 = self->_struct_value;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setStruct_value:(id)a3
{
  unint64_t v4 = (_CPStruct *)a3;
  [(_CPValue *)self clearKind];
  unint64_t v5 = 5;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichKind = v5;
  struct_value = self->_struct_value;
  self->_struct_value = v4;
}

- (BOOL)BOOL_value
{
  return self->_whichKind == 4 && self->_BOOL_value;
}

- (void)setBool_value:(BOOL)a3
{
  self->_whichKind = 4;
  self->_int BOOL_value = a3;
}

- (NSString)string_value
{
  if (self->_whichKind == 3) {
    v2 = self->_string_value;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setString_value:(id)a3
{
  id v7 = a3;
  [(_CPValue *)self clearKind];
  unint64_t v4 = 3;
  if (!v7) {
    unint64_t v4 = 0;
  }
  self->_whichKind = v4;
  unint64_t v5 = (NSString *)[v7 copy];
  string_value = self->_string_value;
  self->_string_value = v5;
}

- (double)number_value
{
  double result = 0.0;
  if (self->_whichKind == 2) {
    return self->_number_value;
  }
  return result;
}

- (void)setNumber_value:(double)a3
{
  self->_whichKind = 2;
  self->_double number_value = a3;
}

- (int)null_value
{
  if (self->_whichKind == 1) {
    return self->_null_value;
  }
  else {
    return 0;
  }
}

- (void)setNull_value:(int)a3
{
  self->_whichKind = 1;
  self->_int null_value = a3;
}

- (void)clearKind
{
  self->_whichKind = 0;
  self->_int null_value = 0;
  self->_double number_value = 0.0;
  string_value = self->_string_value;
  self->_string_value = 0;

  self->_int BOOL_value = 0;
  struct_value = self->_struct_value;
  self->_struct_value = 0;

  list_value = self->_list_value;
  self->_list_value = 0;

  bytes_value = self->_bytes_value;
  self->_bytes_value = 0;
}

- (_CPValue)initWithFacade:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_CPValue *)self init];
  if (v5)
  {
    if (v4
      && ([MEMORY[0x1E4F1CA98] null],
          long double v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v4 isEqual:v6],
          v6,
          !v7))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v4;
        uint64_t v9 = [[_CPStruct alloc] initWithFacade:v8];

        [(_CPValue *)v5 setStruct_value:v9];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v4;
          uint64_t v9 = [[_CPListValue alloc] initWithFacade:v10];

          [(_CPValue *)v5 setList_value:v9];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(_CPValue *)v5 setString_value:v4];
            goto LABEL_10;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = (_CPStruct *)v4;
            if (!strcmp((const char *)[(_CPStruct *)v9 objCType], "B"))
            {
              [(_CPValue *)v5 setBool_value:[(_CPStruct *)v9 BOOLValue]];
            }
            else
            {
              [(_CPStruct *)v9 doubleValue];
              -[_CPValue setNumber_value:](v5, "setNumber_value:");
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(_CPValue *)v5 setBytes_value:v4];
              goto LABEL_10;
            }
            PARLogHandleForCategory();
            uint64_t v9 = (_CPStruct *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_DEBUG))
            {
              int v14 = 138412290;
              id v15 = (id)objc_opt_class();
              id v13 = v15;
              _os_log_debug_impl(&dword_19C7E7000, &v9->super.super, OS_LOG_TYPE_DEBUG, "Don't know how to encode %@ as a _CPValue", (uint8_t *)&v14, 0xCu);
            }
          }
        }
      }
    }
    else
    {
      [(_CPValue *)v5 setNull_value:0];
    }
LABEL_10:
    unint64_t v11 = v5;
  }

  return v5;
}

@end