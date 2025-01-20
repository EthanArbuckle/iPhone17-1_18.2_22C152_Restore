@interface INCustomObject
+ (BOOL)supportsSecureCoding;
- (BOOL)_isValidKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (INCodable)_backingStore;
- (INCodableDescription)codableDescription;
- (INCustomObject)initWithCoder:(id)a3;
- (INCustomObject)initWithIntent:(id)a3 parameterName:(id)a4 reference:(id)a5;
- (INCustomObject)initWithObject:(id)a3 codableDescription:(id)a4;
- (id)_initWithCodableDescription:(id)a3;
- (id)valueForProperty:(id)a3;
- (unint64_t)hash;
- (void)_setBackingStore:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCustomObject

- (id)_initWithCodableDescription:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INCustomObject;
  v5 = [(INObject *)&v9 initWithIdentifier:0 displayString:&stru_1EDA6DB28];
  if (v5)
  {
    v6 = [[INCodable alloc] initWithCodableDescription:v4 data:0];
    backingStore = v5->_backingStore;
    v5->_backingStore = v6;
  }
  return v5;
}

- (id)valueForProperty:(id)a3
{
  return [(INCodable *)self->_backingStore valueForPropertyNamed:a3];
}

- (void).cxx_destruct
{
}

- (INCustomObject)initWithObject:(id)a3 codableDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  objc_super v9 = [v6 displayString];
  v10 = [v6 pronunciationHint];
  v17.receiver = self;
  v17.super_class = (Class)INCustomObject;
  v11 = [(INObject *)&v17 initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  if (v11)
  {
    v12 = [[INCodable alloc] initWithCodableDescription:v7 data:0];
    backingStore = v11->_backingStore;
    v11->_backingStore = v12;

    v14 = [v6 subtitleString];
    [(INObject *)v11 setSubtitleString:v14];

    v15 = [v6 displayImage];
    [(INObject *)v11 setDisplayImage:v15];
  }
  return v11;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  return 1;
}

- (void)_setBackingStore:(id)a3
{
}

- (INCodable)_backingStore
{
  return self->_backingStore;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCustomObject;
  id v4 = a3;
  [(INObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_backingStore, @"_backingStore", v5.receiver, v5.super_class);
}

- (INCustomObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INCustomObject;
  objc_super v5 = [(INObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];
    backingStore = v5->_backingStore;
    v5->_backingStore = (INCodable *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INCustomObject;
  if ([(INObject *)&v10 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    backingStore = self->_backingStore;
    if (!backingStore)
    {
      uint64_t v6 = [v4 _backingStore];

      if (!v6)
      {
        char v8 = 1;
        goto LABEL_8;
      }
      backingStore = self->_backingStore;
    }
    id v7 = [v4 _backingStore];
    char v8 = [(INCodable *)backingStore isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }
LABEL_8:

  return v8;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)INCustomObject;
  unint64_t v3 = [(INObject *)&v5 hash];
  return [(INCodable *)self->_backingStore hash] ^ v3;
}

- (BOOL)_isValidKey:(id)a3
{
  return [(INCodable *)self->_backingStore isValidKey:a3];
}

- (INCodableDescription)codableDescription
{
  return [(INCodable *)self->_backingStore _objectDescription];
}

- (INCustomObject)initWithIntent:(id)a3 parameterName:(id)a4 reference:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [[INObject alloc] initWithIdentifier:0 displayString:&stru_1EDA6DB28];
  objc_super v10 = [v8 _codableDescription];

  v11 = [v10 attributeByName:v7];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  v14 = [v13 codableDescription];

  v15 = [(INCustomObject *)self initWithObject:v9 codableDescription:v14];
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end