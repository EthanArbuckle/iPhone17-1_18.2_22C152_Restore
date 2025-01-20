@interface AMDSimpleHash
+ (unsigned)getBase:(unsigned int)a3;
- (AMDSimpleHash)initWithCapacity:(unsigned int)a3;
- (BOOL)addForKey:(unint64_t)a3 theValue:(unint64_t)a4;
- (BOOL)getValueForKey:(unint64_t)a3 into:(unint64_t *)a4;
- (BOOL)removeKey:(unint64_t)a3 andSaveValueInto:(unint64_t *)a4;
- (NSData)keysStorage;
- (NSData)metadataStorage;
- (NSData)valuesStorage;
- (NSMutableDictionary)collisionMap;
- (char)metadata;
- (unint64_t)keys;
- (unint64_t)values;
- (unsigned)count;
- (unsigned)moduloBase;
- (unsigned)numEntries;
- (void)getAllKeysInto:(unint64_t *)a3;
- (void)removeAllKeys;
- (void)setCollisionMap:(id)a3;
- (void)setKeys:(unint64_t *)a3;
- (void)setKeysStorage:(id)a3;
- (void)setMetadata:(char *)a3;
- (void)setMetadataStorage:(id)a3;
- (void)setModuloBase:(unsigned int)a3;
- (void)setNumEntries:(unsigned int)a3;
- (void)setValues:(unint64_t *)a3;
- (void)setValuesStorage:(id)a3;
@end

@implementation AMDSimpleHash

- (AMDSimpleHash)initWithCapacity:(unsigned int)a3
{
  SEL v18 = a2;
  unsigned int v17 = a3;
  v19 = 0;
  v16.receiver = self;
  v16.super_class = (Class)AMDSimpleHash;
  v19 = [(AMDSimpleHash *)&v16 init];
  objc_storeStrong((id *)&v19, v19);
  uint64_t v3 = +[AMDSimpleHash getBase:v17];
  [(AMDSimpleHash *)v19 setModuloBase:v3];
  [(AMDSimpleHash *)v19 setNumEntries:0];
  unsigned int v15 = 8 * [(AMDSimpleHash *)v19 moduloBase];
  v4 = malloc_type_calloc([(AMDSimpleHash *)v19 moduloBase], 8uLL, 0x100004000313F17uLL);
  [(AMDSimpleHash *)v19 setKeys:v4];
  id v8 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:", -[AMDSimpleHash keys](v19, "keys"), v15);
  -[AMDSimpleHash setKeysStorage:](v19, "setKeysStorage:");

  v5 = malloc_type_malloc(v15, 0x26F29594uLL);
  [(AMDSimpleHash *)v19 setValues:v5];
  id v9 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:", -[AMDSimpleHash values](v19, "values"), v15);
  -[AMDSimpleHash setValuesStorage:](v19, "setValuesStorage:");

  v6 = malloc_type_calloc([(AMDSimpleHash *)v19 moduloBase], 1uLL, 0x100004077774924uLL);
  [(AMDSimpleHash *)v19 setMetadata:v6];
  v11 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v10 = [(AMDSimpleHash *)v19 metadata];
  id v12 = (id)objc_msgSend(v11, "dataWithBytesNoCopy:length:", v10, -[AMDSimpleHash moduloBase](v19, "moduloBase"));
  -[AMDSimpleHash setMetadataStorage:](v19, "setMetadataStorage:");

  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  -[AMDSimpleHash setCollisionMap:](v19, "setCollisionMap:");

  v14 = v19;
  objc_storeStrong((id *)&v19, 0);
  return v14;
}

- (BOOL)addForKey:(unint64_t)a3 theValue:(unint64_t)a4
{
  if (a3)
  {
    unsigned int v15 = a3 % [(AMDSimpleHash *)self moduloBase];
    char v14 = [(AMDSimpleHash *)self metadata][v15];
    if (v14)
    {
      if (v14 == 1)
      {
        uint64_t v10 = [(AMDSimpleHash *)self collisionMap];
        id v9 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AMDSimpleHash values](self, "values")[8 * v15]);
        id v8 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AMDSimpleHash keys](self, "keys")[8 * v15]);
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9);

        id v13 = [(AMDSimpleHash *)self collisionMap];
        id v12 = (id)[NSNumber numberWithUnsignedLongLong:a4];
        id v11 = (id)[NSNumber numberWithUnsignedLongLong:a3];
        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v12);

        [(AMDSimpleHash *)self metadata][v15] = 2;
      }
      else
      {
        v7 = [(AMDSimpleHash *)self collisionMap];
        id v6 = (id)[NSNumber numberWithUnsignedLongLong:a4];
        id v5 = (id)[NSNumber numberWithUnsignedLongLong:a3];
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v6);
      }
    }
    else
    {
      [(AMDSimpleHash *)self values][8 * v15] = a4;
      [(AMDSimpleHash *)self metadata][v15] = 1;
      [(AMDSimpleHash *)self keys][8 * v15] = a3;
    }
    [(AMDSimpleHash *)self setNumEntries:[(AMDSimpleHash *)self numEntries] + 1];
    char v19 = 1;
  }
  else
  {
    char v19 = 0;
  }
  return v19 & 1;
}

- (BOOL)getValueForKey:(unint64_t)a3 into:(unint64_t *)a4
{
  id v13 = self;
  SEL v12 = a2;
  unint64_t v11 = a3;
  uint64_t v10 = a4;
  unsigned int v9 = a3 % [(AMDSimpleHash *)self moduloBase];
  char v8 = 0;
  char v8 = [(AMDSimpleHash *)v13 metadata][v9];
  if (v8)
  {
    if (v8 == 1)
    {
      if ([(AMDSimpleHash *)v13 keys][8 * v9] == v11)
      {
        *uint64_t v10 = [(AMDSimpleHash *)v13 values][8 * v9];
        char v14 = 1;
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      id v6 = [(AMDSimpleHash *)v13 collisionMap];
      id v5 = (id)[NSNumber numberWithUnsignedLongLong:v11];
      id location = (id)-[NSMutableDictionary objectForKey:](v6, "objectForKey:");

      if (location)
      {
        *uint64_t v10 = [location longLongValue];
        char v14 = 1;
      }
      else
      {
        char v14 = 0;
      }
      objc_storeStrong(&location, 0);
    }
  }
  else
  {
    char v14 = 0;
  }
  return v14 & 1;
}

- (BOOL)removeKey:(unint64_t)a3 andSaveValueInto:(unint64_t *)a4
{
  char v14 = self;
  SEL v13 = a2;
  unint64_t v12 = a3;
  unint64_t v11 = a4;
  unsigned int v10 = a3 % [(AMDSimpleHash *)self moduloBase];
  char v9 = 0;
  char v9 = [(AMDSimpleHash *)v14 metadata][v10];
  if (v9)
  {
    if (v9 == 1)
    {
      if ([(AMDSimpleHash *)v14 keys][8 * v10] == v12)
      {
        [(AMDSimpleHash *)v14 metadata][v10] = 0;
        [(AMDSimpleHash *)v14 setNumEntries:[(AMDSimpleHash *)v14 numEntries] - 1];
        if (v11) {
          unint64_t *v11 = [(AMDSimpleHash *)v14 values][8 * v10];
        }
        char v15 = 1;
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      [(AMDSimpleHash *)v14 setNumEntries:[(AMDSimpleHash *)v14 numEntries] - 1];
      id v8 = (id)[NSNumber numberWithUnsignedLongLong:v12];
      id v6 = [(AMDSimpleHash *)v14 collisionMap];
      id location = (id)[(NSMutableDictionary *)v6 objectForKey:v8];

      if (location)
      {
        id v5 = [(AMDSimpleHash *)v14 collisionMap];
        [(NSMutableDictionary *)v5 removeObjectForKey:v8];

        if (v11) {
          unint64_t *v11 = [location longLongValue];
        }
        char v15 = 1;
      }
      else
      {
        char v15 = 0;
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v8, 0);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

- (void)removeAllKeys
{
  [(AMDSimpleHash *)self metadata];
  [(AMDSimpleHash *)self moduloBase];
  __memset_chk();
  [(AMDSimpleHash *)self keys];
  [(AMDSimpleHash *)self moduloBase];
  __memset_chk();
  v2 = [(AMDSimpleHash *)self collisionMap];
  [(NSMutableDictionary *)v2 removeAllObjects];

  [(AMDSimpleHash *)self setNumEntries:0];
}

- (unsigned)count
{
  return [(AMDSimpleHash *)self numEntries];
}

- (void)getAllKeysInto:(unint64_t *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v16 = self;
  SEL v15 = a2;
  char v14 = a3;
  for (signed int i = 0; i < [(AMDSimpleHash *)v16 moduloBase]; ++i)
  {
    char v12 = 0;
    char v12 = [(AMDSimpleHash *)v16 metadata][i];
    if (v12 == 1) {
      *v14++ = [(AMDSimpleHash *)v16 keys][8 * i];
    }
  }
  memset(__b, 0, sizeof(__b));
  obj = [(AMDSimpleHash *)v16 collisionMap];
  uint64_t v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v6);
      uint64_t v3 = [v11 longLongValue];
      *v14++ = v3;
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }
}

+ (unsigned)getBase:(unsigned int)a3
{
  for (unsigned int i = 0; i < numPrimes; ++i)
  {
    if (primes[i] >= 2 * a3) {
      return primes[i];
    }
  }
  return primes[numPrimes - 1];
}

- (unsigned)moduloBase
{
  return self->_moduloBase;
}

- (void)setModuloBase:(unsigned int)a3
{
  self->_moduloBase = a3;
}

- (NSMutableDictionary)collisionMap
{
  return self->_collisionMap;
}

- (void)setCollisionMap:(id)a3
{
}

- (unsigned)numEntries
{
  return self->_numEntries;
}

- (void)setNumEntries:(unsigned int)a3
{
  self->_numEntries = a3;
}

- (unint64_t)keys
{
  return self->_keys;
}

- (void)setKeys:(unint64_t *)a3
{
  self->_keys = a3;
}

- (NSData)keysStorage
{
  return self->_keysStorage;
}

- (void)setKeysStorage:(id)a3
{
}

- (unint64_t)values
{
  return self->_values;
}

- (void)setValues:(unint64_t *)a3
{
  self->_values = a3;
}

- (NSData)valuesStorage
{
  return self->_valuesStorage;
}

- (void)setValuesStorage:(id)a3
{
}

- (char)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(char *)a3
{
  self->_metadata = a3;
}

- (NSData)metadataStorage
{
  return self->_metadataStorage;
}

- (void)setMetadataStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end