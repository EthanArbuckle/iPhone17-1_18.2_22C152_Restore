@interface _AFDataStoreEntry
- (_AFDataStoreEntry)initWithPropertyListRepresentation:(id)a3 error:(id *)p_isa;
- (_AFDataStoreEntry)initWithType:(int64_t)a3 value:(id)a4;
- (id)_propertyListStringForType;
- (id)_valueForPropertyListRepresentation:(id)a3 type:(int64_t)a4;
- (id)_valuePropertyListRepresentation;
- (id)propertyListRepresentation;
- (id)value;
- (int64_t)_typeForPropertyListString:(id)a3;
- (int64_t)type;
@end

@implementation _AFDataStoreEntry

- (void).cxx_destruct
{
}

- (id)value
{
  return self->_value;
}

- (int64_t)type
{
  return self->_type;
}

- (_AFDataStoreEntry)initWithPropertyListRepresentation:(id)a3 error:(id *)p_isa
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_alloc_init(AFDictionarySchema);
  v8 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v7 setObjectCoercion:v8 forKey:@"Version"];

  v9 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v7 setObjectCoercion:v9 forKey:@"Type"];

  v10 = [(AFDictionarySchema *)v7 coerceObject:v6 error:p_isa];
  v11 = [v10 objectForKey:@"Version"];
  uint64_t v12 = [v11 integerValue];

  if (v12 == 1)
  {
    v13 = [v10 objectForKey:@"Type"];
    int64_t v14 = [(_AFDataStoreEntry *)self _typeForPropertyListString:v13];

    v15 = [v10 objectForKey:@"Value"];
    v16 = [(_AFDataStoreEntry *)self _valueForPropertyListRepresentation:v15 type:v14];

    if (v16)
    {
      self = [(_AFDataStoreEntry *)self initWithType:v14 value:v16];
      p_isa = (id *)&self->super.isa;
    }
    else if (p_isa)
    {
      v18 = [NSString stringWithFormat:@"Unable to decode value for data store entry %@", v6];
      *p_isa = +[AFConversationError errorWithCode:300 localizedFailureReason:v18];

      p_isa = 0;
    }
  }
  else
  {
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[_AFDataStoreEntry initWithPropertyListRepresentation:error:]";
      __int16 v22 = 2050;
      uint64_t v23 = v12;
      _os_log_error_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_ERROR, "%s unable to deserialize property list with version %{public}ld; returning nil",
        buf,
        0x16u);
    }
    p_isa = 0;
  }

  return (_AFDataStoreEntry *)p_isa;
}

- (id)propertyListRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:&unk_1EEE97100 forKey:@"Version"];
  v4 = [(_AFDataStoreEntry *)self _propertyListStringForType];
  [v3 setObject:v4 forKey:@"Type"];

  v5 = [(_AFDataStoreEntry *)self _valuePropertyListRepresentation];
  [v3 setObject:v5 forKey:@"Value"];

  return v3;
}

- (id)_valueForPropertyListRepresentation:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    v7 = objc_alloc_init(AFImagePNGData);
    v8 = [v6 objectForKey:@"PNGData"];
    [(AFImagePNGData *)v7 setImageData:v8];

    v9 = [v6 objectForKey:@"Scale"];

    [v9 doubleValue];
    -[AFImagePNGData setScale:](v7, "setScale:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_valuePropertyListRepresentation
{
  id value = self->_value;
  if (self->_type == 1)
  {
    v3 = (void *)MEMORY[0x1E4F1CA60];
    id v4 = value;
    id v5 = [v3 dictionary];
    id v6 = [v4 imageData];
    [v5 setObject:v6 forKey:@"PNGData"];

    v7 = (void *)MEMORY[0x1E4F28ED0];
    [v4 scale];
    double v9 = v8;

    v10 = [v7 numberWithDouble:v9];
    [v5 setObject:v10 forKey:@"Scale"];
  }
  else
  {
    id v5 = value;
  }
  return v5;
}

- (int64_t)_typeForPropertyListString:(id)a3
{
  return [a3 isEqualToString:@"Image"];
}

- (id)_propertyListStringForType
{
  if ([(_AFDataStoreEntry *)self type]) {
    return @"Image";
  }
  else {
    return @"Unknown";
  }
}

- (_AFDataStoreEntry)initWithType:(int64_t)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_AFDataStoreEntry;
  double v8 = [(_AFDataStoreEntry *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

@end