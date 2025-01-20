@interface ASDSelectorValue
+ (id)withValue:(unsigned int)a3;
+ (id)withValue:(unsigned int)a3 andName:(id)a4;
+ (id)withValue:(unsigned int)a3 andName:(id)a4 selected:(BOOL)a5;
+ (id)withValue:(unsigned int)a3 name:(id)a4 andKind:(unsigned int)a5;
+ (id)withValue:(unsigned int)a3 name:(id)a4 andKind:(unsigned int)a5 selected:(BOOL)a6;
- (ASDSelectorValue)initWithValue:(unsigned int)a3 name:(id)a4 andKind:(unsigned int)a5 selected:(BOOL)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)prevSelected;
- (BOOL)selected;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (unsigned)kind;
- (unsigned)value;
- (void)setKind:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setPrevSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setValue:(unsigned int)a3;
@end

@implementation ASDSelectorValue

- (ASDSelectorValue)initWithValue:(unsigned int)a3 name:(id)a4 andKind:(unsigned int)a5 selected:(BOOL)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASDSelectorValue;
  v12 = [(ASDSelectorValue *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_value = a3;
    objc_storeStrong((id *)&v12->_name, a4);
    v13->_kind = a5;
    v13->_selected = a6;
  }

  return v13;
}

+ (id)withValue:(unsigned int)a3 name:(id)a4 andKind:(unsigned int)a5 selected:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  v10 = [[ASDSelectorValue alloc] initWithValue:v8 name:v9 andKind:v7 selected:v6];

  return v10;
}

+ (id)withValue:(unsigned int)a3 name:(id)a4 andKind:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  uint64_t v8 = [[ASDSelectorValue alloc] initWithValue:v6 name:v7 andKind:v5 selected:0];

  return v8;
}

+ (id)withValue:(unsigned int)a3 andName:(id)a4 selected:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  uint64_t v8 = [[ASDSelectorValue alloc] initWithValue:v6 name:v7 andKind:0 selected:v5];

  return v8;
}

+ (id)withValue:(unsigned int)a3 andName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v6 = [[ASDSelectorValue alloc] initWithValue:v4 name:v5 andKind:0 selected:0];

  return v6;
}

+ (id)withValue:(unsigned int)a3
{
  v3 = [[ASDSelectorValue alloc] initWithValue:*(void *)&a3 name:0 andKind:0 selected:0];
  return v3;
}

- (unint64_t)hash
{
  return [(ASDSelectorValue *)self value];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ASDSelectorValue *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = [(ASDSelectorValue *)v4 value];
      BOOL v6 = v5 == [(ASDSelectorValue *)self value];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(ASDSelectorValue *)self value];
  if ((int)[(ASDSelectorValue *)self value] < 0x20000000
    || (int)[(ASDSelectorValue *)self value] > 2130706431)
  {
    uint64_t v5 = 32;
  }
  else
  {
    uint64_t v5 = ((int)[(ASDSelectorValue *)self value] >> 24);
  }
  if ((int)([(ASDSelectorValue *)self value] << 8) < 0x20000000
    || (int)([(ASDSelectorValue *)self value] << 8) > 2130706431)
  {
    uint64_t v6 = 32;
  }
  else
  {
    uint64_t v6 = ((int)([(ASDSelectorValue *)self value] << 8) >> 24);
  }
  if ((int)([(ASDSelectorValue *)self value] << 16) < 0x20000000
    || (int)([(ASDSelectorValue *)self value] << 16) > 2130706431)
  {
    uint64_t v7 = 32;
  }
  else
  {
    uint64_t v7 = ((__int16)[(ASDSelectorValue *)self value] >> 8);
  }
  if ((int)([(ASDSelectorValue *)self value] << 24) < 520093697
    || [(ASDSelectorValue *)self value] == 127)
  {
    uint64_t v8 = 32;
  }
  else
  {
    uint64_t v8 = (char)[(ASDSelectorValue *)self value];
  }
  id v9 = [(ASDSelectorValue *)self name];
  uint64_t v10 = [(ASDSelectorValue *)self kind];
  if ((int)[(ASDSelectorValue *)self kind] < 0x20000000
    || (int)[(ASDSelectorValue *)self kind] > 2130706431)
  {
    uint64_t v11 = 32;
  }
  else
  {
    uint64_t v11 = ((int)[(ASDSelectorValue *)self kind] >> 24);
  }
  uint64_t v21 = v11;
  if ((int)([(ASDSelectorValue *)self kind] << 8) < 0x20000000
    || (int)([(ASDSelectorValue *)self kind] << 8) > 2130706431)
  {
    uint64_t v12 = 32;
  }
  else
  {
    uint64_t v12 = ((int)([(ASDSelectorValue *)self kind] << 8) >> 24);
  }
  uint64_t v22 = v4;
  v20 = v3;
  if ((int)([(ASDSelectorValue *)self kind] << 16) < 0x20000000
    || (int)([(ASDSelectorValue *)self kind] << 16) > 2130706431)
  {
    uint64_t v13 = 32;
  }
  else
  {
    uint64_t v13 = ((__int16)[(ASDSelectorValue *)self kind] >> 8);
  }
  uint64_t v14 = v5;
  if ((int)([(ASDSelectorValue *)self kind] << 24) < 520093697
    || [(ASDSelectorValue *)self kind] == 127)
  {
    uint64_t v15 = 32;
  }
  else
  {
    uint64_t v15 = (char)[(ASDSelectorValue *)self kind];
  }
  BOOL v16 = [(ASDSelectorValue *)self selected];
  v17 = "";
  if (v16) {
    v17 = ", selected";
  }
  v18 = [v20 stringWithFormat:@"value: %x (%c%c%c%c), name: \"%@\", kind: %x (%c%c%c%c)%s", v22, v14, v6, v7, v8, v9, v10, v21, v12, v13, v15, v17];

  return v18;
}

- (unsigned)value
{
  return self->_value;
}

- (void)setValue:(unsigned int)a3
{
  self->_value = a3;
}

- (unsigned)kind
{
  return self->_kind;
}

- (void)setKind:(unsigned int)a3
{
  self->_kind = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)prevSelected
{
  return self->_prevSelected;
}

- (void)setPrevSelected:(BOOL)a3
{
  self->_prevSelected = a3;
}

- (void).cxx_destruct
{
}

@end