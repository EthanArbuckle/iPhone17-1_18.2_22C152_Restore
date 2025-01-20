@interface _CPStruct
- (BOOL)getIntKeyFields:(id *)a3 forKey:(int)a4;
- (BOOL)getStringKeyFields:(id *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSDictionary)intKeyFields;
- (NSDictionary)stringKeyFields;
- (_CPStruct)initWithFacade:(id)a3;
- (unint64_t)hash;
- (void)setIntKeyFields:(id)a3;
- (void)setIntKeyFields:(id)a3 forKey:(int)a4;
- (void)setStringKeyFields:(id)a3;
- (void)setStringKeyFields:(id)a3 forKey:(id)a4;
- (void)writeTo:(id)a3;
@end

@implementation _CPStruct

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intKeyFields, 0);

  objc_storeStrong((id *)&self->_stringKeyFields, 0);
}

- (NSDictionary)intKeyFields
{
  return self->_intKeyFields;
}

- (NSDictionary)stringKeyFields
{
  return self->_stringKeyFields;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDictionary *)self->_stringKeyFields hash];
  return [(NSDictionary *)self->_intKeyFields hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_CPStruct *)self stringKeyFields];
  v6 = [v4 stringKeyFields];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_CPStruct *)self stringKeyFields];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_CPStruct *)self stringKeyFields];
    v10 = [v4 stringKeyFields];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_CPStruct *)self intKeyFields];
  v6 = [v4 intKeyFields];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_CPStruct *)self intKeyFields];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_CPStruct *)self intKeyFields];
    v15 = [v4 intKeyFields];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v5 = self->_stringKeyFields;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
        uint64_t v23 = 0;
        PBDataWriterPlaceMark();
        PBDataWriterWriteStringField();
        int v11 = [(NSDictionary *)self->_stringKeyFields objectForKeyedSubscript:v10];
        PBDataWriterWriteSubmessage();

        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_intKeyFields;
  uint64_t v13 = [(NSDictionary *)v12 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
        uint64_t v23 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v17, "intValue", (void)v19);
        PBDataWriterWriteInt32Field();
        v18 = [(NSDictionary *)self->_intKeyFields objectForKeyedSubscript:v17];
        PBDataWriterWriteSubmessage();

        PBDataWriterRecallMark();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSDictionary *)v12 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v14);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPStructReadFrom(self, (uint64_t)a3);
}

- (void)setIntKeyFields:(id)a3 forKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (!self->_intKeyFields)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    intKeyFields = self->_intKeyFields;
    self->_intKeyFields = v7;
  }
  uint64_t v9 = [NSNumber numberWithInt:v4];
  id v10 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NSDictionary *)self->_intKeyFields setObject:v10 forKey:v9];
  }
}

- (BOOL)getIntKeyFields:(id *)a3 forKey:(int)a4
{
  intKeyFields = self->_intKeyFields;
  id v6 = [NSNumber numberWithInt:*(void *)&a4];
  uint64_t v7 = [(NSDictionary *)intKeyFields objectForKeyedSubscript:v6];

  if (a3 && v7) {
    *a3 = v7;
  }

  return v7 != 0;
}

- (void)setIntKeyFields:(id)a3
{
  self->_intKeyFields = (NSDictionary *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (void)setStringKeyFields:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_stringKeyFields)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    stringKeyFields = self->_stringKeyFields;
    self->_stringKeyFields = v8;
  }
  id v10 = v7;
  id v11 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NSDictionary *)self->_stringKeyFields setObject:v11 forKey:v10];
    }
  }
}

- (BOOL)getStringKeyFields:(id *)a3 forKey:(id)a4
{
  v5 = [(NSDictionary *)self->_stringKeyFields objectForKeyedSubscript:a4];
  id v6 = v5;
  if (a3 && v5) {
    *a3 = v5;
  }

  return v6 != 0;
}

- (void)setStringKeyFields:(id)a3
{
  self->_stringKeyFields = (NSDictionary *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (_CPStruct)initWithFacade:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CPStruct *)self init];
  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v20 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
          uint64_t v12 = [_CPValue alloc];
          uint64_t v13 = [v6 objectForKeyedSubscript:v11];
          uint64_t v14 = [(_CPValue *)v12 initWithFacade:v13];

          if (v14)
          {
            if (![(_CPValue *)v14 whichKind])
            {
              if (PARLogHandleForCategory_onceToken_1603 != -1) {
                dispatch_once(&PARLogHandleForCategory_onceToken_1603, &__block_literal_global_1604);
              }
              uint64_t v15 = (void *)PARLogHandleForCategory_logHandles_2_1605;
              if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_1605, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v16 = v15;
                BOOL v17 = [v6 objectForKeyedSubscript:v11];
                *(_DWORD *)buf = 138412546;
                long long v26 = v11;
                __int16 v27 = 2112;
                v28 = v17;
                _os_log_debug_impl(&dword_19C7E7000, v16, OS_LOG_TYPE_DEBUG, "dictionary entry (%@,%@) could not be translated correctly.", buf, 0x16u);
              }
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(_CPStruct *)v5 setStringKeyFields:v14 forKey:v11];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                -[_CPStruct setIntKeyFields:forKey:](v5, "setIntKeyFields:forKey:", v14, [v11 intValue]);
              }
            }
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v8);
    }

    v18 = v5;
    id v4 = v20;
  }

  return v5;
}

@end