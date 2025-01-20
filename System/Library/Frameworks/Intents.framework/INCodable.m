@interface INCodable
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)_BOOLValueForAttribute:(id)a3;
- (BOOL)_isAttribute:(id)a3 equalTo:(id)a4;
- (BOOL)_isStringAttribute:(id)a3 equalTo:(id)a4;
- (BOOL)_readFrom:(id)a3 error:(id *)a4;
- (BOOL)_writeTo:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidKey:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INCodable)initWithCodableDescription:(id)a3 data:(id)a4;
- (INCodable)initWithCoder:(id)a3;
- (INCodableDescription)_objectDescription;
- (NSMutableDictionary)customValueForKeyDictionary;
- (double)_doubleValueForAttribute:(id)a3;
- (float)_floatValueForAttribute:(id)a3;
- (id)_copyWithZone:(_NSZone *)a3 error:(id *)a4;
- (id)_dataWithError:(id *)a3;
- (id)_dictionaryRepresentationWithNullValues:(BOOL)a3;
- (id)_initWithCodableDescription:(id)a3 data:(id)a4 error:(id *)a5;
- (id)_nonNilAttributes;
- (id)_nonNilRepeatedAttributes;
- (id)_valueForAttribute:(id)a3;
- (id)_valueForAttribute:(id)a3 ofClass:(Class)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)dictionaryRepresentation;
- (id)valueForPropertyNamed:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int)_int32ValueForAttribute:(id)a3;
- (int64_t)_int64ValueForAttribute:(id)a3;
- (unint64_t)_UInt64ValueForAttribute:(id)a3;
- (unint64_t)hash;
- (unsigned)_UInt32ValueForAttribute:(id)a3;
- (void)_setData:(id)a3 error:(id *)a4;
- (void)_setEmptyArrayForNonNilRepeatedAttributes:(id)a3;
- (void)_setObject:(id)a3 forAttribute:(id)a4;
- (void)_setObjectDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomValueForKeyDictionary:(id)a3;
- (void)setNilValueForAllKeys;
- (void)setValue:(id)a3 forPropertyNamed:(id)a4;
- (void)writeTo:(id)a3;
@end

@implementation INCodable

uint64_t __28__INCodable__writeTo_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)_writeTo:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(INCodable *)self _objectDescription];
  v8 = [v7 attributes];
  v9 = [v8 allKeys];
  v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_73];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __28__INCodable__writeTo_error___block_invoke_2;
  v36[3] = &unk_1E551B0A0;
  v38 = a4;
  id v11 = v6;
  id v37 = v11;
  v12 = (void *)MEMORY[0x192F984C0](v36);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __28__INCodable__writeTo_error___block_invoke_3;
  v32[3] = &unk_1E551B0C8;
  v32[4] = self;
  id v13 = v12;
  id v34 = v13;
  v35 = a4;
  id v14 = v11;
  id v33 = v14;
  v15 = (unsigned int (**)(void, void, void))MEMORY[0x192F984C0](v32);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v10;
  uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    id v26 = v14;
    uint64_t v18 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v21 = [(INCodable *)self _objectDescription];
        v22 = [v21 attributes];
        v23 = [v22 objectForKey:v20];

        if (v23 && !((unsigned int (**)(void, void *, uint64_t))v15)[2](v15, v23, v20))
        {

          BOOL v24 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    BOOL v24 = 1;
LABEL_12:
    id v14 = v26;
  }
  else
  {
    BOOL v24 = 1;
  }

  return v24;
}

- (void)setValue:(id)a3 forPropertyNamed:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v6, "if_stringByLowercasingFirstCharacter");
  if (![(INCodable *)self isValidKey:v7])
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    id v11 = [NSString stringWithFormat:@"'%@' is not a valid attribute", v7];
    id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

    objc_exception_throw(v12);
  }
  customValueForKeyDictionary = self->_customValueForKeyDictionary;
  if (v13) {
    [(NSMutableDictionary *)customValueForKeyDictionary setObject:v13 forKeyedSubscript:v7];
  }
  else {
    [(NSMutableDictionary *)customValueForKeyDictionary removeObjectForKey:v7];
  }
}

- (BOOL)isValidKey:(id)a3
{
  id v4 = a3;
  v5 = [(INCodable *)self _objectDescription];
  id v6 = objc_msgSend(v4, "if_stringByLowercasingFirstCharacter");

  v7 = [v5 attributeByName:v6];
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (INCodableDescription)_objectDescription
{
  return self->_objectDescription;
}

- (id)valueForPropertyNamed:(id)a3
{
  customValueForKeyDictionary = self->_customValueForKeyDictionary;
  id v4 = objc_msgSend(a3, "if_stringByLowercasingFirstCharacter");
  v5 = [(NSMutableDictionary *)customValueForKeyDictionary objectForKeyedSubscript:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customValueForKeyDictionary, 0);

  objc_storeStrong((id *)&self->_objectDescription, 0);
}

- (id)_copyWithZone:(_NSZone *)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v7 = [(INCodable *)self _nonNilRepeatedAttributes];
  id v19 = 0;
  v8 = [(INCodable *)self _dataWithError:&v19];
  id v9 = v19;
  if (v9)
  {
    uint64_t v10 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[INCodable _copyWithZone:error:]";
      __int16 v22 = 2112;
      v23 = self;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_error_impl(&dword_18CB2F000, v10, OS_LOG_TYPE_ERROR, "%s Failed to copy INCodable %@ due to data error: %@", buf, 0x20u);
    }
    id v11 = 0;
    id v12 = 0;
    *a4 = v9;
  }
  else
  {
    id v13 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    id v14 = [(INCodable *)self _objectDescription];
    id v18 = 0;
    v15 = (void *)[v13 _initWithCodableDescription:v14 data:v8 error:&v18];
    id v11 = v18;

    [v15 _setEmptyArrayForNonNilRepeatedAttributes:v7];
    if (v11)
    {
      uint64_t v16 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[INCodable _copyWithZone:error:]";
        __int16 v22 = 2112;
        v23 = self;
        __int16 v24 = 2112;
        id v25 = v11;
        _os_log_error_impl(&dword_18CB2F000, v16, OS_LOG_TYPE_ERROR, "%s Failed to copy INCodable %@ due to initialization error: %@", buf, 0x20u);
      }
      id v12 = 0;
      *a4 = v11;
    }
    else
    {
      id v12 = v15;
    }
  }
  return v12;
}

- (INCodable)initWithCodableDescription:(id)a3 data:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v15 = 0;
  id v8 = [(INCodable *)self _initWithCodableDescription:v6 data:v7 error:&v15];
  id v9 = v15;
  id v10 = v8;
  id v11 = v10;
  if (v9)
  {
    id v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = "-[INCodable initWithCodableDescription:data:]";
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s Failed to init INCodable with description %@ and data %@ due to error: %@", buf, 0x2Au);
    }
    id v13 = 0;
  }
  else
  {
    id v13 = (INCodable *)v10;
  }

  return v13;
}

- (id)_initWithCodableDescription:(id)a3 data:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)INCodable;
  id v11 = [(INCodable *)&v18 init];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    customValueForKeyDictionary = v11->_customValueForKeyDictionary;
    v11->_customValueForKeyDictionary = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->_objectDescription, a3);
    id v17 = 0;
    [(INCodable *)v11 _setData:v10 error:&v17];
    id v14 = v17;
    id v15 = v14;
    if (v14)
    {
      if (a5) {
        *a5 = v14;
      }

      id v11 = 0;
    }
  }
  return v11;
}

- (void)_setData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([v7 length])
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v7];
    [(INCodable *)self _readFrom:v6 error:a4];
  }
  else
  {
    [(NSMutableDictionary *)self->_customValueForKeyDictionary removeAllObjects];
  }
}

- (BOOL)_readFrom:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __29__INCodable__readFrom_error___block_invoke;
  v39[3] = &unk_1E551B030;
  v39[4] = self;
  uint64_t v26 = (void *)MEMORY[0x192F984C0](v39);
  while ([v6 hasMoreData])
  {
    unsigned int v38 = 0;
    char v37 = 0;
    [v6 readTag:&v38 type:&v37];
    if (*((unsigned char *)v6 + (int)*MEMORY[0x1E4F940C8]) || v37 == 4) {
      break;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __29__INCodable__readFrom_error___block_invoke_2;
    v31[3] = &unk_1E551B058;
    id v32 = v7;
    v36 = a4;
    id v33 = v6;
    id v9 = v26;
    id v34 = self;
    id v35 = v9;
    id v10 = (unsigned int (**)(void, void))MEMORY[0x192F984C0](v31);
    id v11 = [(INCodable *)self _objectDescription];
    uint64_t v12 = [v11 attributes];
    id v13 = [NSNumber numberWithUnsignedInt:v38];
    id v14 = [v12 objectForKey:v13];

    if (v14 && !((unsigned int (**)(void, void *))v10)[2](v10, v14))
    {

      LOBYTE(v24) = 0;
      goto LABEL_21;
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = [v7 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v21 = [v7 objectForKeyedSubscript:v20];
        __int16 v22 = v21;
        if (v21)
        {
          id v23 = (void *)[v21 copy];
          [(INCodable *)self setValue:v23 forPropertyNamed:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v40 count:16];
    }
    while (v17);
  }

  int v24 = [v6 hasError] ^ 1;
LABEL_21:

  return v24;
}

uint64_t __29__INCodable__readFrom_error___block_invoke_2(uint64_t a1, void *a2)
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [v3 propertyName];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (![v3 modifier] && !v6)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = *(void **)(a1 + 32);
    id v8 = [v3 propertyName];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v3;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    id v16 = v10;

    uint64_t v17 = [v16 valueTransformer];
    id v12 = v16;
    if (v12
      && (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), v12, (isKindOfClass & 1) != 0))
    {
      id v19 = v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      id v21 = v20;

      __int16 v22 = [v21 codableDescription];

      if (v22)
      {
        id v23 = [[INCodable alloc] initWithCodableDescription:v22 data:0];
LABEL_26:
        id v24 = v23;

        if (!PBReaderPlaceMark() || ![v24 readFrom:*(void *)(a1 + 40)]) {
          goto LABEL_33;
        }
LABEL_27:
        if (v17)
        {
          uint64_t v27 = [v17 reverseTransformedValue:v24];

          id v24 = (id)v27;
        }
        PBReaderRecallMark();
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        long long v28 = *(void **)(a1 + 64);
        if (!v28 || !*v28) {
          int v29 = 0;
        }
        else {
LABEL_33:
        }
          int v29 = 1;
LABEL_34:

        if (!v29)
        {
LABEL_54:
          uint64_t v43 = [*(id *)(a1 + 40) hasError] ^ 1;
          goto LABEL_55;
        }
        goto LABEL_45;
      }
      if (*(void *)(a1 + 64))
      {
        v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v56 = *MEMORY[0x1E4F28228];
        uint64_t v40 = NSString;
        id v24 = [v19 typeName];
        uint64_t v41 = [v40 stringWithFormat:@"Unknown codable description for custom type: %@", v24];
        v57[0] = v41;
        int v29 = 1;
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
        **(void **)(a1 + 64) = [v39 errorWithDomain:@"IntentsErrorDomain" code:8001 userInfo:v42];

        goto LABEL_34;
      }
    }
    else
    {
      if (v17)
      {
        id v24 = objc_alloc_init((Class)[(id)objc_opt_class() reverseTransformedValueClass]);
        goto LABEL_27;
      }
      id v25 = [v12 typeName];
      Class v26 = NSClassFromString(v25);
      LODWORD(v26) = [(objc_class *)v26 isSubclassOfClass:objc_opt_class()];

      if (v26)
      {
        __int16 v22 = [v12 typeName];
        id v23 = (INCodable *)objc_alloc_init(NSClassFromString(v22));
        goto LABEL_26;
      }
      if (*(void *)(a1 + 64))
      {
        id v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v54 = *MEMORY[0x1E4F28228];
        v36 = NSString;
        id v24 = [v12 typeName];
        char v37 = [v36 stringWithFormat:@"Unknown type %@", v24];
        v55 = v37;
        int v29 = 1;
        unsigned int v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        **(void **)(a1 + 64) = [v35 errorWithDomain:@"IntentsErrorDomain" code:8001 userInfo:v38];

        goto LABEL_34;
      }
    }

LABEL_44:
    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = *(void **)(a1 + 48);
    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "readInt32"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v11 _setObject:v12 forAttribute:v3];
LABEL_53:

    goto LABEL_54;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v3;
    switch([v12 type])
    {
      case 0:
        id v13 = NSNumber;
        id v14 = *(void **)(a1 + 48);
        [*(id *)(a1 + 40) readDouble];
        uint64_t v15 = objc_msgSend(v13, "numberWithDouble:");
        goto LABEL_52;
      case 1:
        v44 = NSNumber;
        id v14 = *(void **)(a1 + 48);
        [*(id *)(a1 + 40) readFloat];
        uint64_t v15 = objc_msgSend(v44, "numberWithFloat:");
        goto LABEL_52;
      case 2:
        id v14 = *(void **)(a1 + 48);
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "readInt32"));
        goto LABEL_52;
      case 3:
        id v14 = *(void **)(a1 + 48);
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "readInt64"));
        goto LABEL_52;
      case 4:
        id v14 = *(void **)(a1 + 48);
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "readUint32"));
        goto LABEL_52;
      case 5:
        id v14 = *(void **)(a1 + 48);
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "readUint64"));
        goto LABEL_52;
      case 6:
        id v14 = *(void **)(a1 + 48);
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "readBOOL"));
LABEL_52:
        v45 = (void *)v15;
        [v14 _setObject:v15 forAttribute:v12];

        goto LABEL_53;
      case 7:
        uint64_t v47 = *(void *)(a1 + 56);
        v48 = [*(id *)(a1 + 40) readString];
        v49 = objc_msgSend(v48, "_intents_decodeFromProto");
        (*(void (**)(uint64_t, void *, id, void *, void))(v47 + 16))(v47, v49, v12, v6, *(void *)(a1 + 64));

        goto LABEL_58;
      case 8:
        uint64_t v50 = *(void *)(a1 + 56);
        v48 = [*(id *)(a1 + 40) readData];
        (*(void (**)(uint64_t, void *, id, void *, void))(v50 + 16))(v50, v48, v12, v6, *(void *)(a1 + 64));
LABEL_58:

        v51 = *(void **)(a1 + 64);
        if (!v51 || !*v51) {
          goto LABEL_53;
        }
        goto LABEL_44;
      default:
        goto LABEL_53;
    }
  }
  if (*(void *)(a1 + 64))
  {
    long long v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28228];
    long long v31 = NSString;
    id v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v33 = [v31 stringWithFormat:@"Unsupported attribute type: %@", v12];
    v53 = v33;
    id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    **(void **)(a1 + 64) = [v30 errorWithDomain:@"IntentsErrorDomain" code:8001 userInfo:v34];

    goto LABEL_44;
  }
LABEL_45:
  uint64_t v43 = 0;
LABEL_55:

  return v43;
}

uint64_t __28__INCodable__writeTo_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    if ([v7 modifier])
    {
      id v8 = [*(id *)(a1 + 32) _valueForAttribute:v7];
      if (v8 && !(*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
      {
LABEL_5:

        goto LABEL_25;
      }
    }
    else
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v8 = [*(id *)(a1 + 32) _valueForAttribute:v7 ofClass:objc_opt_class()];
      uint64_t v15 = [v8 countByEnumeratingWithState:&v69 objects:v81 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v70;
LABEL_16:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v70 != v17) {
            objc_enumerationMutation(v8);
          }
          if (!(*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))()) {
            goto LABEL_5;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v8 countByEnumeratingWithState:&v69 objects:v81 count:16];
            if (v16) {
              goto LABEL_16;
            }
            break;
          }
        }
      }
    }

    goto LABEL_69;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 modifier])
    {
      objc_msgSend(*(id *)(a1 + 40), "writeInt32:forTag:", objc_msgSend(*(id *)(a1 + 32), "_int32ValueForAttribute:", v5), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_69;
    }
    if (!*(void *)(a1 + 56)) {
      goto LABEL_32;
    }
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v79 = *MEMORY[0x1E4F28228];
    id v9 = [NSString stringWithFormat:@"Repeated modifier is not supported for enum attributes"];
    id v80 = v9;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    **(void **)(a1 + 56) = [v24 errorWithDomain:@"IntentsErrorDomain" code:8001 userInfo:v25];

    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!*(void *)(a1 + 56))
    {
LABEL_32:
      uint64_t v31 = 0;
      goto LABEL_70;
    }
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v73 = *MEMORY[0x1E4F28228];
    uint64_t v20 = NSString;
    id v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v22 = [v20 stringWithFormat:@"Unsupported attribute type: %@", v7];
    v74 = v22;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    **(void **)(a1 + 56) = [v19 errorWithDomain:@"IntentsErrorDomain" code:8001 userInfo:v23];

LABEL_25:
    goto LABEL_32;
  }
  id v9 = v5;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EDBA7738, &unk_1EDBA7750, 0);
  if (![v9 modifier])
  {
    id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "type"));
    char v12 = [v10 containsObject:v11];

    if ((v12 & 1) == 0)
    {
      if (*(void *)(a1 + 56))
      {
        Class v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v77 = *MEMORY[0x1E4F28228];
        uint64_t v27 = NSString;
        long long v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "type"));
        int v29 = [v27 stringWithFormat:@"Repeated modifier is not supported for scalar attributes with type %@", v28];
        v78 = v29;
        long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        **(void **)(a1 + 56) = [v26 errorWithDomain:@"IntentsErrorDomain" code:8001 userInfo:v30];
      }
LABEL_31:

      goto LABEL_32;
    }
  }
  switch([v9 type])
  {
    case 0:
      id v13 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) _doubleValueForAttribute:v9];
      objc_msgSend(v13, "writeDouble:forTag:", objc_msgSend(v6, "unsignedIntValue"), v14);
      goto LABEL_68;
    case 1:
      id v32 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) _floatValueForAttribute:v9];
      int v34 = v33;
      uint64_t v35 = [v6 unsignedIntValue];
      LODWORD(v36) = v34;
      [v32 writeFloat:v35 forTag:v36];
      goto LABEL_68;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "writeInt32:forTag:", objc_msgSend(*(id *)(a1 + 32), "_int32ValueForAttribute:", v9), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_68;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "writeInt64:forTag:", (int)objc_msgSend(*(id *)(a1 + 32), "_int32ValueForAttribute:", v9), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_68;
    case 4:
      objc_msgSend(*(id *)(a1 + 40), "writeUint32:forTag:", objc_msgSend(*(id *)(a1 + 32), "_UInt32ValueForAttribute:", v9), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_68;
    case 5:
      objc_msgSend(*(id *)(a1 + 40), "writeUint64:forTag:", objc_msgSend(*(id *)(a1 + 32), "_UInt64ValueForAttribute:", v9), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_68;
    case 6:
      objc_msgSend(*(id *)(a1 + 40), "writeBOOL:forTag:", objc_msgSend(*(id *)(a1 + 32), "_BOOLValueForAttribute:", v9), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_68;
    case 7:
      if ([v9 modifier])
      {
        char v37 = [*(id *)(a1 + 32) _valueForAttribute:v9 ofClass:objc_opt_class()];
        unsigned int v38 = objc_msgSend(v37, "_intents_encodeForProto");

        if (v38) {
          objc_msgSend(*(id *)(a1 + 40), "writeString:forTag:", v38, objc_msgSend(v6, "unsignedIntValue"));
        }
      }
      else
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        unsigned int v38 = [*(id *)(a1 + 32) _valueForAttribute:v9 ofClass:objc_opt_class()];
        uint64_t v39 = [v38 countByEnumeratingWithState:&v65 objects:v76 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          v59 = v10;
          v60 = v9;
          uint64_t v41 = *(void *)v66;
          while (1)
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v66 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              if (v43)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v51 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v52 = *MEMORY[0x1E4F1C3B8];
                  v53 = NSString;
                  uint64_t v54 = [v60 propertyName];
                  goto LABEL_73;
                }
              }
              v44 = objc_msgSend(v43, "_intents_encodeForProto");
              if (v44) {
                objc_msgSend(*(id *)(a1 + 40), "writeString:forTag:", v44, objc_msgSend(v6, "unsignedIntValue"));
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v65 objects:v76 count:16];
            if (!v40)
            {
LABEL_66:

              goto LABEL_69;
            }
          }
        }
      }
      break;
    case 8:
      if ([v9 modifier])
      {
        unsigned int v38 = [*(id *)(a1 + 32) _valueForAttribute:v9 ofClass:objc_opt_class()];
        if (v38) {
          objc_msgSend(*(id *)(a1 + 40), "writeData:forTag:", v38, objc_msgSend(v6, "unsignedIntValue"));
        }
      }
      else
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        unsigned int v38 = [*(id *)(a1 + 32) _valueForAttribute:v9 ofClass:objc_opt_class()];
        uint64_t v45 = [v38 countByEnumeratingWithState:&v61 objects:v75 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          v59 = v10;
          v60 = v9;
          uint64_t v47 = *(void *)v62;
          while (1)
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v62 != v47) {
                objc_enumerationMutation(v38);
              }
              uint64_t v49 = *(void *)(*((void *)&v61 + 1) + 8 * j);
              if (v49)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v51 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v52 = *MEMORY[0x1E4F1C3B8];
                  v53 = NSString;
                  uint64_t v54 = [v9 propertyName];
LABEL_73:
                  v55 = (objc_class *)objc_opt_class();
                  uint64_t v56 = NSStringFromClass(v55);
                  v57 = [v53 stringWithFormat:@"Property '%@' is not a valid NSArray<%@ *> subclass", v54, v56, v59];
                  id v58 = [v51 exceptionWithName:v52 reason:v57 userInfo:0];

                  objc_exception_throw(v58);
                }
              }
              objc_msgSend(*(id *)(a1 + 40), "writeData:forTag:", v49, objc_msgSend(v6, "unsignedIntValue"));
            }
            uint64_t v46 = [v38 countByEnumeratingWithState:&v61 objects:v75 count:16];
            if (!v46) {
              goto LABEL_66;
            }
          }
        }
      }
      break;
    default:
      goto LABEL_68;
  }

LABEL_68:
LABEL_69:
  uint64_t v31 = 1;
LABEL_70:

  return v31;
}

void __29__INCodable__readFrom_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if ([v10 modifier])
  {
    [*(id *)(a1 + 32) _setObject:v9 forAttribute:v10];
  }
  else if (v9)
  {
    [v11 addObject:v9];
  }
  else if (a5)
  {
    char v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    id v13 = NSString;
    double v14 = [v10 propertyName];
    uint64_t v15 = [v13 stringWithFormat:@"Value for property '%@' can't be nil", v14];
    v18[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a5 = [v12 errorWithDomain:@"IntentsErrorDomain" code:8001 userInfo:v16];
  }
}

- (void)_setObject:(id)a3 forAttribute:(id)a4
{
  id v6 = a3;
  id v7 = [a4 propertyName];
  [(INCodable *)self setValue:v6 forPropertyNamed:v7];
}

- (id)_valueForAttribute:(id)a3 ofClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(INCodable *)self _valueForAttribute:v6];
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    id v11 = NSString;
    char v12 = [v6 propertyName];
    id v13 = NSStringFromClass(a4);
    double v14 = [v11 stringWithFormat:@"Property '%@' is not a valid %@ subclass", v12, v13];
    id v15 = [v9 exceptionWithName:v10 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }

  return v7;
}

- (id)_valueForAttribute:(id)a3
{
  customValueForKeyDictionary = self->_customValueForKeyDictionary;
  id v4 = [a3 propertyName];
  id v5 = objc_msgSend(v4, "if_stringByLowercasingFirstCharacter");
  id v6 = [(NSMutableDictionary *)customValueForKeyDictionary objectForKeyedSubscript:v5];

  return v6;
}

uint64_t __28__INCodable__writeTo_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 valueTransformer];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 transformedValue:v8];

    id v8 = (id)v12;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    [v9 unsignedIntValue];
    PBDataWriterWriteSubmessage();
  }
  else if (*(void *)(a1 + 40))
  {
    double v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    id v15 = NSString;
    v17 = uint64_t v16 = [v7 propertyName];
    v21[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    **(void **)(a1 + 40) = [v14 errorWithDomain:@"IntentsErrorDomain" code:8001 userInfo:v18];
  }
  return isKindOfClass & 1;
}

- (void)_setEmptyArrayForNonNilRepeatedAttributes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ([(INCodable *)self isValidKey:v10])
        {
          id v11 = [(INCodable *)self valueForPropertyNamed:v10];
          if (v11)
          {
          }
          else
          {
            uint64_t v12 = [(INCodable *)self _objectDescription];
            id v13 = [v12 attributeByName:v10];
            uint64_t v14 = [v13 modifier];

            if (!v14) {
              [(INCodable *)self setValue:v8 forPropertyNamed:v10];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (BOOL)readFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  BOOL v3 = [(INCodable *)self _readFrom:a3 error:&v12];
  id v4 = v12;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 debugDescription];
    uint64_t v7 = [(__CFString *)v6 length];
    uint64_t v8 = @"INCodable data reading failed";
    if (v7) {
      uint64_t v8 = v6;
    }
    id v9 = v8;
    uint64_t v10 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[INCodable readFrom:]";
      __int16 v15 = 2112;
      long long v16 = v9;
      _os_log_error_impl(&dword_18CB2F000, v10, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    BOOL v3 = 0;
  }

  return v3;
}

- (id)_nonNilRepeatedAttributes
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(INCodable *)self _objectDescription];
  uint64_t v5 = [v4 attributes];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v11 propertyName];
        char v13 = [v12 hasPrefix:@"_"];

        if ((v13 & 1) == 0)
        {
          uint64_t v14 = [(INCodable *)self _valueForAttribute:v11];
          if (v14 && ![v11 modifier])
          {
            __int16 v15 = [v11 propertyName];
            [v3 addObject:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v3;
}

- (id)_dataWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F94098]);
  [(INCodable *)self _writeTo:v5 error:a3];
  uint64_t v6 = [v5 immutableData];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INCodable)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  char v13 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  uint64_t v14 = objc_msgSend(v3, "if_decodeBytesNoCopyForKey:", @"codableDescriptionBytes");
  if (v14
    || ([v3 decodeObjectOfClass:objc_opt_class() forKey:@"codableDescriptionData"],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v29 = 0;
    __int16 v15 = objc_msgSend(MEMORY[0x1E4F28DC0], "_in_safeUnarchivedObjectOfClasses:fromData:error:", v13, v14, &v29);
    id v16 = v29;
    if (v16)
    {
      long long v17 = v16;
      [v3 failWithError:v16];
      long long v18 = 0;
      long long v19 = self;
      goto LABEL_12;
    }
  }
  else
  {
    __int16 v15 = [v3 decodeObjectOfClasses:v13 forKey:@"_objectDescription"];
  }
  long long v17 = objc_msgSend(v3, "if_decodeBytesNoCopyForKey:", @"bytes");
  if (!v17)
  {
    long long v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  }
  long long v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  id v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
  id v24 = [v3 decodeObjectOfClasses:v23 forKey:@"_nonNilRepeatedAttributes"];

  id v28 = 0;
  long long v19 = [(INCodable *)self _initWithCodableDescription:v15 data:v17 error:&v28];
  id v25 = v28;
  [(INCodable *)v19 _setEmptyArrayForNonNilRepeatedAttributes:v24];
  if (v25)
  {
    [v3 failWithError:v25];
    long long v18 = 0;
  }
  else
  {
    long long v18 = v19;
  }

LABEL_12:
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  id v3 = [(INCodable *)self _copyWithZone:a3 error:&v8];
  id v4 = v8;
  if (v4)
  {
    uint64_t v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "-[INCodable copyWithZone:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_ERROR, "%s Failed to copy due to error %@", buf, 0x16u);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  [(INCodable *)self _writeTo:a3 error:&v10];
  id v3 = v10;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 debugDescription];
    id v6 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = v6;
      uint64_t v8 = [(__CFString *)v5 length];
      uint64_t v9 = @"INCodable data writing failed";
      if (v8) {
        uint64_t v9 = v5;
      }
      *(_DWORD *)buf = 136315394;
      id v12 = "-[INCodable writeTo:]";
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      _os_log_fault_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_FAULT, "%s INCodable writeTo failed: %{public}@", buf, 0x16u);
    }
  }
}

- (id)_nonNilAttributes
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = [MEMORY[0x1E4F1CA80] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(INCodable *)self _objectDescription];
  id v4 = [v3 attributes];
  uint64_t v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        __int16 v11 = [v10 propertyName];
        char v12 = [v11 hasPrefix:@"_"];

        if ((v12 & 1) == 0)
        {
          __int16 v13 = [(INCodable *)self _valueForAttribute:v10];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if ((INObjectIsConsideredNil(v13, isKindOfClass & 1) & 1) == 0)
          {
            uint64_t v15 = [v10 propertyName];
            [v17 addObject:v15];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v17;
}

- (void)setCustomValueForKeyDictionary:(id)a3
{
}

- (NSMutableDictionary)customValueForKeyDictionary
{
  return self->_customValueForKeyDictionary;
}

- (void)_setObjectDescription:(id)a3
{
}

- (BOOL)_BOOLValueForAttribute:(id)a3
{
  id v3 = [(INCodable *)self _valueForAttribute:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)_UInt64ValueForAttribute:(id)a3
{
  id v3 = [(INCodable *)self _valueForAttribute:a3];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unsigned)_UInt32ValueForAttribute:(id)a3
{
  id v3 = [(INCodable *)self _valueForAttribute:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (int64_t)_int64ValueForAttribute:(id)a3
{
  id v3 = [(INCodable *)self _valueForAttribute:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (int)_int32ValueForAttribute:(id)a3
{
  id v3 = [(INCodable *)self _valueForAttribute:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (float)_floatValueForAttribute:(id)a3
{
  id v3 = [(INCodable *)self _valueForAttribute:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (double)_doubleValueForAttribute:(id)a3
{
  id v3 = [(INCodable *)self _valueForAttribute:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)_isStringAttribute:(id)a3 equalTo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(INCodable *)self _valueForAttribute:v7 ofClass:objc_opt_class()];
  uint64_t v9 = [v6 _valueForAttribute:v7 ofClass:objc_opt_class()];

  if (v8 | v9)
  {
    if (v8) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      char v11 = 0;
    }
    else {
      char v11 = [(id)v8 isEqualToString:v9];
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)_isAttribute:(id)a3 equalTo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(INCodable *)self _valueForAttribute:v7];
  uint64_t v9 = [v6 _valueForAttribute:v7];

  if (v8 | v9)
  {
    char v10 = 0;
    if (v8 && v9) {
      char v10 = [(id)v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  double v5 = [(INCodable *)self _dataWithError:&v12];
  id v6 = v12;
  if (v6)
  {
    [v4 failWithError:v6];
  }
  else
  {
    id v7 = [(INCodable *)self _nonNilRepeatedAttributes];
    [v4 encodeObject:v7 forKey:@"_nonNilRepeatedAttributes"];

    objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v5, @"bytes");
    objectDescription = self->_objectDescription;
    id v11 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:objectDescription requiringSecureCoding:1 error:&v11];
    id v10 = v11;
    if (v10) {
      [v4 failWithError:v10];
    }
    else {
      objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v9, @"codableDescriptionBytes");
    }
  }
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v17 = 0;
  uint64_t v8 = [(INCodable *)self _dataWithError:&v17];
  id v9 = v17;
  if (v9)
  {
    id v10 = v9;
    if (a4)
    {
LABEL_3:
      id v10 = v10;
      id v11 = 0;
      *a4 = v10;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, @"bytes");
  objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", -[INCodableDescription codableDescriptionType](self->_objectDescription, "codableDescriptionType"), @"descType");
  id v12 = [(INCodable *)self _nonNilRepeatedAttributes];
  __int16 v13 = [v12 allObjects];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v13, @"_nonNilRepeatedAttributes");

  objectDescription = self->_objectDescription;
  id v16 = 0;
  objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", objectDescription, @"codableDescriptionBytes", v6, &v16);
  id v10 = v16;
  if (v10)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v11 = 0;
    goto LABEL_8;
  }
  id v11 = (void *)[v7 copy];
LABEL_8:

  return v11;
}

- (id)dictionaryRepresentation
{
  return [(INCodable *)self _dictionaryRepresentationWithNullValues:1];
}

- (id)_dictionaryRepresentationWithNullValues:(BOOL)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = [(INCodable *)self _objectDescription];
  id v7 = [v6 attributes];
  uint64_t v8 = [v7 allValues];

  uint64_t v35 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v41;
    id v32 = v5;
    BOOL v31 = a3;
    id v29 = v8;
    long long v30 = self;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v8);
        }
        id v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v11 = [v10 propertyName];
        char v12 = [v11 hasPrefix:@"_"];

        if ((v12 & 1) == 0)
        {
          __int16 v13 = [v10 propertyName];
          uint64_t v14 = [(INCodable *)self valueForPropertyNamed:v13];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = [v14 dictionaryRepresentation];
            goto LABEL_21;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = v14;
            id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v18 = v16;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v37;
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v37 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v23 = *(void **)(*((void *)&v36 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v24 = [v23 dictionaryRepresentation];
                    [v17 addObject:v24];
                  }
                  else
                  {
                    [v17 addObject:v23];
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
              }
              while (v20);
            }

            uint64_t v15 = [v17 copy];
            id v5 = v32;
            a3 = v31;
            uint64_t v8 = v29;
            self = v30;
LABEL_21:

            uint64_t v14 = (void *)v15;
          }
          if (a3 || v14)
          {
            uint64_t v25 = (uint64_t)v14;
            if (!v14)
            {
              uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
              int v33 = (void *)v25;
            }
            Class v26 = [v10 propertyName];
            [v5 setObject:v25 forKey:v26];

            if (!v14) {
          }
            }

          continue;
        }
      }
      uint64_t v35 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v35);
  }

  uint64_t v27 = (void *)[v5 copy];

  return v27;
}

- (unint64_t)hash
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = [(INCodable *)self _objectDescription];
  id v4 = [v3 attributes];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v33;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [(INCodable *)self _valueForAttribute:v11];
          v8 ^= [v12 hash];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v8 ^= 2654435761 * [(INCodable *)self _int32ValueForAttribute:v11];
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v25 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v26 = *MEMORY[0x1E4F1C3B8];
            uint64_t v27 = NSString;
            id v28 = (objc_class *)objc_opt_class();
            id v29 = NSStringFromClass(v28);
            long long v30 = [v27 stringWithFormat:@"Unsupported attribute type: %@", v29];
            id v31 = [v25 exceptionWithName:v26 reason:v30 userInfo:0];

            objc_exception_throw(v31);
          }
          id v12 = v11;
          switch([v12 type])
          {
            case 0:
              [(INCodable *)self _doubleValueForAttribute:v12];
              double v15 = -v14;
              if (v14 >= 0.0) {
                double v15 = v14;
              }
              goto LABEL_18;
            case 1:
              [(INCodable *)self _floatValueForAttribute:v12];
              double v15 = v16;
              if (v16 < 0.0) {
                double v15 = -v16;
              }
LABEL_18:
              long double v17 = floor(v15 + 0.5);
              double v18 = (v15 - v17) * 1.84467441e19;
              double v19 = fmod(v17, 1.84467441e19);
              unint64_t v20 = 2654435761u * (unint64_t)v19;
              unint64_t v21 = v20 + (unint64_t)v18;
              if (v18 <= 0.0) {
                unint64_t v21 = 2654435761u * (unint64_t)v19;
              }
              uint64_t v22 = v20 - (unint64_t)fabs(v18);
              if (v18 >= 0.0) {
                uint64_t v22 = v21;
              }
              goto LABEL_31;
            case 2:
              uint64_t v22 = 2654435761 * [(INCodable *)self _int32ValueForAttribute:v12];
              goto LABEL_31;
            case 3:
              int64_t v23 = [(INCodable *)self _int64ValueForAttribute:v12];
              goto LABEL_27;
            case 4:
              uint64_t v22 = 2654435761 * [(INCodable *)self _UInt32ValueForAttribute:v12];
              goto LABEL_31;
            case 5:
              int64_t v23 = [(INCodable *)self _UInt64ValueForAttribute:v12];
LABEL_27:
              uint64_t v22 = 2654435761 * v23;
              goto LABEL_31;
            case 6:
              if ([(INCodable *)self _BOOLValueForAttribute:v12]) {
                uint64_t v22 = 2654435761;
              }
              else {
                uint64_t v22 = 0;
              }
LABEL_31:
              v8 ^= v22;
              break;
            case 7:
            case 8:
              __int16 v13 = [(INCodable *)self _valueForAttribute:v12];
              v8 ^= [v13 hash];

              break;
            default:
              break;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (!v7) {
        goto LABEL_37;
      }
    }
  }
  unint64_t v8 = 0;
LABEL_37:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v27 = 0;
    goto LABEL_48;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = [(INCodable *)self _objectDescription];
  uint64_t v6 = [v5 attributes];
  uint64_t v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v8)
  {
LABEL_43:
    BOOL v27 = 1;
    goto LABEL_47;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v37;
LABEL_4:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v37 != v10) {
      objc_enumerationMutation(v7);
    }
    id v12 = *(void **)(*((void *)&v36 + 1) + 8 * v11);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    if (![(INCodable *)self _isAttribute:v12 equalTo:v4]) {
      goto LABEL_46;
    }
LABEL_28:
    if (v9 == ++v11)
    {
      uint64_t v26 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
      uint64_t v9 = v26;
      if (!v26) {
        goto LABEL_43;
      }
      goto LABEL_4;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v13 = [(INCodable *)self _int32ValueForAttribute:v12];
    if (v13 != [v4 _int32ValueForAttribute:v12]) {
      goto LABEL_46;
    }
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3B8];
    id v31 = NSString;
    long long v32 = (objc_class *)objc_opt_class();
    long long v33 = NSStringFromClass(v32);
    long long v34 = [v31 stringWithFormat:@"Unsupported attribute type: %@", v33];
    id v35 = [v29 exceptionWithName:v30 reason:v34 userInfo:0];

    objc_exception_throw(v35);
  }
  id v14 = v12;
  switch([v14 type])
  {
    case -1:
      goto LABEL_45;
    case 0:
      [(INCodable *)self _doubleValueForAttribute:v14];
      double v16 = v15;
      [v4 _doubleValueForAttribute:v14];
      if (v16 != v17) {
        goto LABEL_45;
      }
      goto LABEL_27;
    case 1:
      [(INCodable *)self _floatValueForAttribute:v14];
      float v19 = v18;
      [v4 _floatValueForAttribute:v14];
      if (v19 != v20) {
        goto LABEL_45;
      }
      goto LABEL_27;
    case 2:
      int v21 = [(INCodable *)self _int32ValueForAttribute:v14];
      int v22 = [v4 _int32ValueForAttribute:v14];
      goto LABEL_26;
    case 3:
      int64_t v23 = [(INCodable *)self _int64ValueForAttribute:v14];
      uint64_t v24 = [v4 _int64ValueForAttribute:v14];
      goto LABEL_23;
    case 4:
      int v21 = [(INCodable *)self _UInt32ValueForAttribute:v14];
      int v22 = [v4 _UInt32ValueForAttribute:v14];
      goto LABEL_26;
    case 5:
      int64_t v23 = [(INCodable *)self _UInt64ValueForAttribute:v14];
      uint64_t v24 = [v4 _UInt64ValueForAttribute:v14];
LABEL_23:
      if (v23 != v24) {
        goto LABEL_45;
      }
      goto LABEL_27;
    case 6:
      int v21 = [(INCodable *)self _BOOLValueForAttribute:v14];
      int v22 = [v4 _BOOLValueForAttribute:v14];
LABEL_26:
      if (v21 == v22) {
        goto LABEL_27;
      }
      goto LABEL_45;
    case 7:
      uint64_t v25 = [v14 modifier];
      if ((unint64_t)(v25 - 1) < 2)
      {
        if (![(INCodable *)self _isStringAttribute:v14 equalTo:v4]) {
          goto LABEL_45;
        }
        goto LABEL_27;
      }
      if (v25) {
        goto LABEL_36;
      }
      goto LABEL_32;
    case 8:
      uint64_t v25 = [v14 modifier];
      if ((unint64_t)(v25 - 1) >= 2)
      {
        if (v25)
        {
LABEL_36:
          if (v25 == -1) {
            goto LABEL_45;
          }
        }
        else
        {
LABEL_32:
          if (![(INCodable *)self _isAttribute:v14 equalTo:v4]) {
            goto LABEL_45;
          }
        }
        goto LABEL_27;
      }
      if ([(INCodable *)self _isAttribute:v14 equalTo:v4])
      {
LABEL_27:

        goto LABEL_28;
      }
LABEL_45:

LABEL_46:
      BOOL v27 = 0;
LABEL_47:

LABEL_48:
      return v27;
    default:
      goto LABEL_27;
  }
}

- (id)data
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  v2 = [(INCodable *)self _dataWithError:&v12];
  id v3 = v12;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 debugDescription];
    uint64_t v6 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = v6;
      uint64_t v10 = [(__CFString *)v5 length];
      uint64_t v11 = @"INCodable data writing failed";
      if (v10) {
        uint64_t v11 = v5;
      }
      *(_DWORD *)buf = 136315394;
      id v14 = "-[INCodable data]";
      __int16 v15 = 2114;
      double v16 = v11;
      _os_log_fault_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_FAULT, "%s INCodable data failed: %{public}@", buf, 0x16u);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v2;
  }

  return v7;
}

- (void)setNilValueForAllKeys
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(INCodable *)self _objectDescription];
  id v5 = [v4 attributes];
  uint64_t v6 = [v5 allValues];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __34__INCodable_setNilValueForAllKeys__block_invoke;
  v20[3] = &unk_1E551AFE8;
  id v7 = v3;
  id v21 = v7;
  [v6 enumerateObjectsUsingBlock:v20];
  [(NSMutableDictionary *)self->_customValueForKeyDictionary removeObjectsForKeys:v7];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_70399];
  uint64_t v9 = [v6 filteredArrayUsingPredicate:v8];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "propertyName", (void)v16);
        [(INCodable *)self setValue:0 forPropertyNamed:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v12);
  }
}

void __34__INCodable_setNilValueForAllKeys__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v7 propertyName];
    char v4 = [v3 hasPrefix:@"_"];

    if ((v4 & 1) == 0)
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = [v7 propertyName];
      [v5 addObject:v6];
    }
  }
}

uint64_t __34__INCodable_setNilValueForAllKeys__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 propertyName];
  uint64_t v3 = [v2 hasPrefix:@"_"] ^ 1;

  return v3;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v5, "intents_safeObjectForKey:ofType:", @"bytes", objc_opt_class());
    id v7 = objc_msgSend(v5, "intents_safeObjectForKey:ofType:", @"_nonNilRepeatedAttributes", objc_opt_class());
    uint64_t v8 = objc_msgSend(v5, "intents_intForKey:", @"descType");
    id v9 = INCodableDescriptionClassFromType(v8);
    if (v9) {
      goto LABEL_3;
    }
    uint64_t v14 = NSString;
    long long v16 = v15 = [NSNumber numberWithInteger:v8];
    INIntentError(8001, v16, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
LABEL_3:
      id v22 = 0;
      id v10 = objc_msgSend(v9, "intents_widgetPlistRepresentableInDict:key:error:", v5, @"codableDescriptionBytes", &v22);
      id v11 = v22;
      if (v11)
      {
        id v12 = v11;
        if (a4)
        {
          id v12 = v11;
          id v13 = 0;
          *a4 = v12;
        }
        else
        {
          id v13 = 0;
        }
      }
      else
      {
        id v21 = 0;
        id v17 = [[INCodable alloc] _initWithCodableDescription:v10 data:v6 error:&v21];
        id v18 = v21;
        id v12 = v18;
        if (v18)
        {
          id v13 = 0;
          if (a4) {
            *a4 = v18;
          }
        }
        else
        {
          long long v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
          [v17 _setEmptyArrayForNonNilRepeatedAttributes:v19];

          id v13 = v17;
        }
      }
    }
    else if (a4)
    {
      id v12 = v12;
      id v13 = 0;
      *a4 = v12;
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end