@interface _GCDevicePhysicalInputElement
+ (unsigned)updateContextSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToElement:(id)a3;
- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5;
- (BOOL)update:(void *)a3 forMouseEvent:(id *)a4 withTimestamp:(double)a5;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (NSSet)aliases;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)sfSymbolsName;
- (_GCDevicePhysicalInputElement)init;
- (_GCDevicePhysicalInputElement)initWithParameters:(id)a3;
- (_GCDevicePhysicalInputElement)initWithTemplate:(id)a3 context:(id)a4;
- (id)symbol;
- (uint64_t)_localizedName;
- (uint64_t)_setLocalizedName:(uint64_t)result;
- (uint64_t)_setSymbol:(uint64_t)result;
- (uint64_t)_symbol;
- (unint64_t)hash;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
@end

@implementation _GCDevicePhysicalInputElement

- (_GCDevicePhysicalInputElement)init
{
  return self;
}

- (_GCDevicePhysicalInputElement)initWithParameters:(id)a3
{
  v5 = a3;
  id v6 = v5;
  if (!v5 || !v5[1])
  {
    v17 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputElement.m", 35, @"Invalid parameter not satisfying: %s", "parameters.identifier != nil");
  }
  v20.receiver = self;
  v20.super_class = (Class)_GCDevicePhysicalInputElement;
  v7 = [(_GCDevicePhysicalInputView *)&v20 initWithParameters:v6];
  if (v6)
  {
    id v8 = *((id *)v6 + 1);
    uint64_t v9 = [v8 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v11 = (void *)*((void *)v6 + 2);
  }
  else
  {
    uint64_t v18 = [0 copy];
    v19 = v7->_identifier;
    v7->_identifier = (NSString *)v18;

    v11 = 0;
  }
  id v12 = v11;
  v13 = (void *)[v12 copy];
  v14 = v13;
  if (!v13) {
    v14 = objc_opt_new();
  }
  objc_storeStrong((id *)&v7->_aliases, v14);
  if (!v13) {

  }
  if (v6)
  {
    -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)v7, *((void *)v6 + 3), (uint64_t)&v7->_localizedNameSlot, 771);
    uint64_t v15 = *((void *)v6 + 4);
  }
  else
  {
    -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)v7, 0, (uint64_t)&v7->_localizedNameSlot, 771);
    uint64_t v15 = 0;
  }
  -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)v7, v15, (uint64_t)&v7->_symbolSlot, 771);

  return v7;
}

- (uint64_t)_setLocalizedName:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](result, a2, result + 24, 771);
  }
  return result;
}

- (uint64_t)_setSymbol:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](result, a2, result + 32, 771);
  }
  return result;
}

- (_GCDevicePhysicalInputElement)initWithTemplate:(id)a3 context:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_GCDevicePhysicalInputElement;
  id v5 = a4;
  id v6 = a3;
  v7 = [(_GCDevicePhysicalInputView *)&v14 initWithTemplate:v6 context:v5];
  uint64_t v8 = objc_msgSend(v6, "identifier", v14.receiver, v14.super_class);
  identifier = v7->_identifier;
  v7->_identifier = (NSString *)v8;

  uint64_t v10 = [v6 aliases];
  aliases = v7->_aliases;
  v7->_aliases = (NSSet *)v10;

  v7->_localizedNameSlot = [v5 view:v7 allocateObjectSlot:1 withCopyOfValueFromView:v6 slot:v6[3]];
  uint64_t v12 = [v5 view:v7 allocateObjectSlot:1 withCopyOfValueFromView:v6 slot:v6[4]];

  v7->_symbolSlot = v12;
  return v7;
}

+ (unsigned)updateContextSize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_GCDevicePhysicalInputElement;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputView update:forUsages:with:](&v18, sel_update_forUsages_with_);
  unsigned int v10 = MyUpdateContext_Offset_10;
  if (MyUpdateContext_Offset_10 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_10 = v10;
    if ((v6 & 2) == 0) {
      return v9;
    }
  }
  else if ((v6 & 2) == 0)
  {
    return v9;
  }
  uint64_t v11 = v10;
  uint64_t v12 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)a5);
  if (self) {
    char v13 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)self, (uint64_t)v12, (uint64_t)&self->_localizedNameSlot, 771);
  }
  else {
    char v13 = 0;
  }
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFE | v13;

  objc_super v14 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)a5);
  if (self)
  {
    int v15 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)self, (uint64_t)v14, (uint64_t)&self->_symbolSlot, 771);
    if (v15) {
      char v16 = 2;
    }
    else {
      char v16 = 0;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
    char v16 = 0;
  }
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFD | v16;
  v9 |= v13 | v15;

  return v9;
}

- (uint64_t)_localizedName
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 24);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_symbol
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 32);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputElement;
  [(_GCDevicePhysicalInputView *)&v9 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_10;
  if (MyUpdateContext_Offset_10 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_10 = v6;
  }
  char v7 = *((unsigned char *)a3 + v6);
  if (v7)
  {
    uint64_t v8 = v6;
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"localizedName");
    char v7 = *((unsigned char *)a3 + v8);
  }
  if ((v7 & 2) != 0) {
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"sfSymbolsName");
  }
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputElement;
  [(_GCDevicePhysicalInputView *)&v9 postCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_10;
  if (MyUpdateContext_Offset_10 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_10 = v6;
  }
  char v7 = *((unsigned char *)a3 + v6);
  if (v7)
  {
    uint64_t v8 = v6;
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"localizedName");
    char v7 = *((unsigned char *)a3 + v8);
  }
  if ((v7 & 2) != 0) {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"sfSymbolsName");
  }
}

- (BOOL)isEqualToElement:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v7 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputElement.m", 111, @"Invalid parameter not satisfying: %s", "[otherElement isKindOfClass:_GCDevicePhysicalInputElement.class]");
    char v15 = 0;
    goto LABEL_20;
  }
  unsigned int v6 = objc_opt_class();
  if ([v6 isEqual:objc_opt_class()])
  {
    char v7 = [(_GCDevicePhysicalInputElement *)self identifier];
    uint64_t v8 = [v5 identifier];
    if (![v7 isEqual:v8])
    {
      char v15 = 0;
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    objc_super v9 = [(_GCDevicePhysicalInputElement *)self aliases];
    unsigned int v10 = [v5 aliases];
    if (![v9 isEqual:v10])
    {
      char v15 = 0;
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v11 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)self);
    uint64_t v12 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)v5);
    if (v11 != v12)
    {
      char v13 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)self);
      objc_super v14 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)v5);
      if (![v13 isEqual:v14])
      {
        char v15 = 0;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      v24 = v14;
      v25 = v13;
    }
    char v16 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)self);
    uint64_t v17 = -[_GCDevicePhysicalInputElement _symbol]((uint64_t)v5);
    if (v16 == (void *)v17)
    {

      char v15 = 1;
    }
    else
    {
      objc_super v18 = (void *)v17;
      v23 = v11;
      v19 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)self);
      v22 = v12;
      objc_super v20 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)v5);
      char v15 = [v19 isEqual:v20];

      uint64_t v12 = v22;
      uint64_t v11 = v23;
    }
    objc_super v14 = v24;
    char v13 = v25;
    if (v11 == v12) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  char v15 = 0;
LABEL_21:

  return v15;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(_GCDevicePhysicalInputElement *)self identifier];
    char v6 = [v5 isEqualToString:v4];
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v7 = -[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    uint64_t v8 = -[_GCDevicePhysicalInputView physicalInput]((uint64_t)v5);
    if (v7 | v8)
    {
      objc_super v9 = [(id)v7 physicalInput];
      uint64_t v10 = [(id)v8 physicalInput];
      uint64_t v11 = (void *)v10;
      if (v7 == v8 || v9 == (void *)v10)
      {
        uint64_t v12 = [(_GCDevicePhysicalInputElement *)self identifier];
        char v13 = [v5 identifier];
        char v6 = [v12 isEqualToString:v13];
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = [(_GCDevicePhysicalInputElement *)self isEqualToElement:v5];
    }

    goto LABEL_12;
  }
  char v6 = 0;
LABEL_13:

  return v6;
}

- (NSString)localizedName
{
  v2 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)self);

  return (NSString *)v2;
}

- (id)symbol
{
  v2 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)self);

  return v2;
}

- (NSString)sfSymbolsName
{
  v2 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)self);
  objc_super v3 = [v2 sfSymbolsName];

  return (NSString *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)aliases
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliases, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  return 0;
}

- (BOOL)update:(void *)a3 forMouseEvent:(id *)a4 withTimestamp:(double)a5
{
  return 0;
}

@end