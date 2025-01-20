@interface FATField
+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6;
+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6 keyField:(id)a7 valueField:(id)a8;
+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6 structClass:(Class)a7;
+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6 valueField:(id)a7;
+ (id)nameForFatFieldType:(unsigned int)a3;
- (BOOL)optional;
- (Class)structClass;
- (FATField)keyField;
- (FATField)valueField;
- (NSString)name;
- (id)description;
- (unsigned)index;
- (unsigned)type;
- (void)setIndex:(unsigned int)a3;
- (void)setKeyField:(id)a3;
- (void)setName:(id)a3;
- (void)setOptional:(BOOL)a3;
- (void)setStructClass:(Class)a3;
- (void)setType:(unsigned int)a3;
- (void)setValueField:(id)a3;
@end

@implementation FATField

+ (id)nameForFatFieldType:(unsigned int)a3
{
  if (a3 - 1 > 0xF) {
    return @"unknown!";
  }
  else {
    return off_264E592A0[a3 - 1];
  }
}

+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6 keyField:(id)a7 valueField:(id)a8
{
  BOOL v10 = a5;
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  id v14 = a7;
  v15 = [a1 fieldWithIndex:v12 type:v11 optional:v10 name:a6 valueField:a8];
  [v15 setKeyField:v14];

  return v15;
}

+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6 valueField:(id)a7
{
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  v13 = [a1 fieldWithIndex:v10 type:v9 optional:v8 name:a6];
  [v13 setValueField:v12];

  return v13;
}

+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6 structClass:(Class)a7
{
  BOOL v8 = [a1 fieldWithIndex:*(void *)&a3 type:*(void *)&a4 optional:a5 name:a6];
  [v8 setStructClass:a7];
  return v8;
}

+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6
{
  BOOL v6 = a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  [v10 setIndex:v8];
  [v10 setType:v7];
  [v10 setOptional:v6];
  [v10 setName:v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyField, 0);
  objc_storeStrong((id *)&self->_valueField, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setKeyField:(id)a3
{
}

- (FATField)keyField
{
  return self->_keyField;
}

- (void)setValueField:(id)a3
{
}

- (FATField)valueField
{
  return self->_valueField;
}

- (void)setStructClass:(Class)a3
{
  self->_structClass = a3;
}

- (Class)structClass
{
  return self->_structClass;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (BOOL)optional
{
  return self->_optional;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  [v3 appendString:@"<"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  objc_msgSend(v3, "appendFormat:", @": %p;", self);
  objc_msgSend(v3, "appendFormat:", @" index = %i; ", -[FATField index](self, "index"));
  objc_msgSend(v3, "appendFormat:", @" type = %i; ", -[FATField type](self, "type"));
  BOOL v6 = [(FATField *)self optional];
  uint64_t v7 = @"NO";
  if (v6) {
    uint64_t v7 = @"YES";
  }
  [v3 appendFormat:@" optional = %@; ", v7];
  uint64_t v8 = [(FATField *)self name];
  [v3 appendFormat:@" name = %@; ", v8];

  if ([(FATField *)self type] == 12)
  {
    id v9 = NSStringFromClass([(FATField *)self structClass]);
    [v3 appendFormat:@" structClass = %@; ", v9];
LABEL_9:

    goto LABEL_10;
  }
  if ([(FATField *)self type] == 14
    || [(FATField *)self type] == 15
    || [(FATField *)self type] == 13)
  {
    id v9 = [(FATField *)self valueField];
    [v3 appendFormat:@" valueField = %@; ", v9];
    goto LABEL_9;
  }
LABEL_10:
  if ([(FATField *)self type] == 13)
  {
    id v10 = [(FATField *)self keyField];
    [v3 appendFormat:@" keyField = %@; ", v10];
  }
  [v3 appendString:@">"];
  return v3;
}

@end