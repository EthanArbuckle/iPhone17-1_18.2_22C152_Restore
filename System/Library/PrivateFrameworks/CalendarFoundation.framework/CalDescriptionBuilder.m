@interface CalDescriptionBuilder
- (BOOL)sortedByKey;
- (CalDescriptionBuilder)init;
- (CalDescriptionBuilder)initWithSuperclassDescription:(id)a3;
- (NSMutableDictionary)descriptionUnderConstruction;
- (NSString)keyDelimiter;
- (NSString)superclassDescription;
- (id)build;
- (id)description;
- (void)setDescriptionUnderConstruction:(id)a3;
- (void)setKey:(id)a3 withBoolean:(BOOL)a4;
- (void)setKey:(id)a3 withCGColor:(const CGColor *)a4;
- (void)setKey:(id)a3 withChar:(char)a4;
- (void)setKey:(id)a3 withCharArray:(const char *)a4;
- (void)setKey:(id)a3 withClass:(Class)a4;
- (void)setKey:(id)a3 withDouble:(double)a4;
- (void)setKey:(id)a3 withEnumNumericalValue:(int64_t)a4 andStringValue:(id)a5;
- (void)setKey:(id)a3 withFloat:(float)a4;
- (void)setKey:(id)a3 withInt:(int)a4;
- (void)setKey:(id)a3 withInteger:(int64_t)a4;
- (void)setKey:(id)a3 withLong:(int64_t)a4;
- (void)setKey:(id)a3 withLongLong:(int64_t)a4;
- (void)setKey:(id)a3 withObject:(id)a4;
- (void)setKey:(id)a3 withPointerAddress:(const void *)a4;
- (void)setKey:(id)a3 withSelector:(SEL)a4;
- (void)setKey:(id)a3 withShort:(signed __int16)a4;
- (void)setKey:(id)a3 withSize:(unint64_t)a4;
- (void)setKey:(id)a3 withUnsignedChar:(unsigned __int8)a4;
- (void)setKey:(id)a3 withUnsignedInt:(unsigned int)a4;
- (void)setKey:(id)a3 withUnsignedInteger:(unint64_t)a4;
- (void)setKey:(id)a3 withUnsignedLong:(unint64_t)a4;
- (void)setKey:(id)a3 withUnsignedLongLong:(unint64_t)a4;
- (void)setKey:(id)a3 withUnsignedShort:(unsigned __int16)a4;
- (void)setKeyDelimiter:(id)a3;
- (void)setSortedByKey:(BOOL)a3;
- (void)setSuperclassDescription:(id)a3;
@end

@implementation CalDescriptionBuilder

- (CalDescriptionBuilder)initWithSuperclassDescription:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CalDescriptionBuilder;
  v6 = [(CalDescriptionBuilder *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_superclassDescription, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    descriptionUnderConstruction = v7->_descriptionUnderConstruction;
    v7->_descriptionUnderConstruction = v8;

    v7->_sortedByKey = 1;
    keyDelimiter = v7->_keyDelimiter;
    v7->_keyDelimiter = (NSString *)@", ";
  }
  return v7;
}

- (void)setKey:(id)a3 withObject:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  v8 = v7;
  if (v6)
  {
    [v7 setObject:v6 forKey:v10];
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
    [v8 setObject:v9 forKey:v10];
  }
}

- (NSMutableDictionary)descriptionUnderConstruction
{
  return self->_descriptionUnderConstruction;
}

- (id)build
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  id v5 = [v4 allKeys];
  id v6 = [(CalDescriptionBuilder *)self superclassDescription];
  if (v6) {
    [v3 appendString:v6];
  }
  if ([(CalDescriptionBuilder *)self sortedByKey])
  {
    uint64_t v7 = [v5 sortedArrayUsingComparator:&__block_literal_global_40];

    id v5 = (void *)v7;
  }
  v8 = [(CalDescriptionBuilder *)self keyDelimiter];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __30__CalDescriptionBuilder_build__block_invoke_2;
  v16[3] = &unk_1E56CEDA8;
  id v17 = v4;
  id v18 = v6;
  id v9 = v3;
  id v19 = v9;
  v20 = v8;
  id v10 = v8;
  id v11 = v6;
  id v12 = v4;
  [v5 enumerateObjectsUsingBlock:v16];
  v13 = v20;
  id v14 = v9;

  return v14;
}

- (NSString)superclassDescription
{
  return self->_superclassDescription;
}

- (BOOL)sortedByKey
{
  return self->_sortedByKey;
}

- (NSString)keyDelimiter
{
  return self->_keyDelimiter;
}

void __30__CalDescriptionBuilder_build__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (a3 || *(void *)(a1 + 40)) {
    [*(id *)(a1 + 48) appendFormat:@"%@%@: [%@]", *(void *)(a1 + 56), v7, v5];
  }
  else {
    [*(id *)(a1 + 48) appendFormat:@"%@: [%@]", v7, v5, v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyDelimiter, 0);
  objc_storeStrong((id *)&self->_superclassDescription, 0);

  objc_storeStrong((id *)&self->_descriptionUnderConstruction, 0);
}

uint64_t __30__CalDescriptionBuilder_build__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:");
}

- (CalDescriptionBuilder)init
{
  return [(CalDescriptionBuilder *)self initWithSuperclassDescription:0];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v11.receiver = self;
  v11.super_class = (Class)CalDescriptionBuilder;
  v4 = [(CalDescriptionBuilder *)&v11 description];
  [v3 appendFormat:@"[%@]", v4];
  id v5 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  uint64_t v6 = [v5 allKeys];
  [v3 appendFormat:@" Keys: [%@]", v6];

  id v7 = CalBooleanAsString([(CalDescriptionBuilder *)self sortedByKey]);
  [v3 appendFormat:@" Sorted by key: [%@]", v7];

  v8 = [(CalDescriptionBuilder *)self keyDelimiter];
  [v3 appendFormat:@" Key delimiter: [%@]", v8];

  id v9 = [(CalDescriptionBuilder *)self superclassDescription];
  [v3 appendFormat:@" Superclass description: [%@]", v9];

  return v3;
}

- (void)setKey:(id)a3 withEnumNumericalValue:(int64_t)a4 andStringValue:(id)a5
{
  id v15 = a5;
  v8 = (objc_class *)NSString;
  id v9 = a3;
  id v10 = [v8 alloc];
  if (v15) {
    uint64_t v11 = [v10 initWithFormat:@"%ld (%@)", a4, v15];
  }
  else {
    uint64_t v11 = objc_msgSend(v10, "initWithFormat:", @"%ld", a4, v14);
  }
  id v12 = (void *)v11;
  v13 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v13 setObject:v12 forKey:v9];
}

- (void)setKey:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CalBooleanAsString(v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v7 setObject:v8 forKey:v6];
}

- (void)setKey:(id)a3 withChar:(char)a4
{
  int v4 = a4;
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%c", v4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withCharArray:(const char *)a4
{
  id v6 = NSString;
  id v7 = a3;
  id v9 = [v6 stringWithUTF8String:a4];
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withDouble:(double)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%f", *(void *)&a4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withFloat:(float)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%f", a4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%d", v4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withInteger:(int64_t)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%ld", a4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withLong:(int64_t)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%ld", a4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withLongLong:(int64_t)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%lld", a4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withShort:(signed __int16)a4
{
  int v4 = a4;
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%hi", v4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withUnsignedChar:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%c", v4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withUnsignedInt:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%u", v4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withUnsignedInteger:(unint64_t)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%lu", a4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withUnsignedLong:(unint64_t)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%lu", a4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withUnsignedLongLong:(unint64_t)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%llu", a4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withUnsignedShort:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%hu", v4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withCGColor:(const CGColor *)a4
{
  id v12 = a3;
  size_t NumberOfComponents = CGColorGetNumberOfComponents(a4);
  Components = CGColorGetComponents(a4);
  for (i = [MEMORY[0x1E4F28E78] string];
  {
    uint64_t v9 = *(void *)Components++;
    objc_msgSend(i, "appendFormat:", @"%f", v9);
  }
  id v10 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  uint64_t v11 = (void *)[i copy];
  [v10 setObject:v11 forKey:v12];
}

- (void)setKey:(id)a3 withClass:(Class)a4
{
  id v6 = a3;
  [(CalDescriptionBuilder *)self setKey:v6 withCharArray:class_getName(a4)];
}

- (void)setKey:(id)a3 withPointerAddress:(const void *)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%p", a4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setKey:(id)a3 withSelector:(SEL)a4
{
  id v6 = a3;
  [(CalDescriptionBuilder *)self setKey:v6 withCharArray:sel_getName(a4)];
}

- (void)setKey:(id)a3 withSize:(unint64_t)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", @"%zd", a4);
  id v8 = [(CalDescriptionBuilder *)self descriptionUnderConstruction];
  [v8 setObject:v9 forKey:v7];
}

- (void)setDescriptionUnderConstruction:(id)a3
{
}

- (void)setSuperclassDescription:(id)a3
{
}

- (void)setSortedByKey:(BOOL)a3
{
  self->_sortedByKey = a3;
}

- (void)setKeyDelimiter:(id)a3
{
}

@end