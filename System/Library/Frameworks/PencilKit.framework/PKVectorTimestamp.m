@interface PKVectorTimestamp
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PKVectorTimestamp)init;
- (PKVectorTimestamp)initWithArchive:(const void *)a3;
- (PKVectorTimestamp)initWithCoder:(id)a3;
- (PKVectorTimestamp)initWithData:(id)a3;
- (id)allUUIDs;
- (id)clockElementForUUID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serialize;
- (id)shortDescription;
- (id)sortedUUIDs;
- (int64_t)compareClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5;
- (unint64_t)clockForUUID:(id)a3;
- (unint64_t)compareTo:(id)a3;
- (unint64_t)hash;
- (unint64_t)subclockForUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)incrementClockForUUID:(id)a3;
- (void)mergeWithTimestamp:(id)a3;
- (void)saveToArchive:(void *)a3;
- (void)setClock:(unint64_t)a3 forUUID:(id)a4;
- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5;
- (void)unionClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5;
@end

@implementation PKVectorTimestamp

- (void).cxx_destruct
{
}

- (PKVectorTimestamp)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKVectorTimestamp;
  v2 = [(PKVectorTimestamp *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clock = v2->_clock;
    v2->_clock = v3;
  }
  return v2;
}

- (PKVectorTimestamp)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [[PKVectorMultiTimestamp alloc] initWithData:v4 andCapacity:1];
  objc_super v6 = [(PKVectorMultiTimestamp *)v5 timestamps];
  v7 = [v6 objectAtIndexedSubscript:0];

  return v7;
}

- (PKVectorTimestamp)initWithArchive:(const void *)a3
{
  id v4 = [[PKVectorMultiTimestamp alloc] initWithArchive:a3 andCapacity:1];
  v5 = [(PKVectorMultiTimestamp *)v4 timestamps];
  objc_super v6 = [v5 objectAtIndexedSubscript:0];

  return v6;
}

- (void)saveToArchive:(void *)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v5 = [PKVectorMultiTimestamp alloc];
  v8[0] = self;
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v7 = [(PKVectorMultiTimestamp *)v5 initWithTimestamps:v6];

  [(PKVectorMultiTimestamp *)v7 saveToArchive:a3];
}

- (id)serialize
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [PKVectorMultiTimestamp alloc];
  v8[0] = self;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5 = [(PKVectorMultiTimestamp *)v3 initWithTimestamps:v4];

  objc_super v6 = [(PKVectorMultiTimestamp *)v5 serialize];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PKVectorTimestamp);
  [(PKVectorTimestamp *)v4 mergeWithTimestamp:self];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PKVectorTimestamp *)self compareTo:v4] == 0;

  return v5;
}

- (BOOL)isEmpty
{
  return [(NSMutableDictionary *)self->_clock count] == 0;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_clock count];
}

- (id)clockElementForUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_clock objectForKeyedSubscript:a3];
}

- (unint64_t)clockForUUID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_clock objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 clock];

  return v4;
}

- (unint64_t)subclockForUUID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_clock objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 subclock];

  return v4;
}

- (void)setClock:(unint64_t)a3 forUUID:(id)a4
{
  clock = self->_clock;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)clock objectForKeyedSubscript:v7];
  if (!v8) {
    v8 = objc_alloc_init(PKVectorTimestampElement);
  }
  v9 = v8;
  [(PKVectorTimestampElement *)v8 setClock:a3];
  [(NSMutableDictionary *)self->_clock setObject:v9 forKey:v7];
}

- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5
{
  id v8 = a5;
  v9 = objc_alloc_init(PKVectorTimestampElement);
  [(PKVectorTimestampElement *)v9 setClock:a3];
  [(PKVectorTimestampElement *)v9 setSubclock:a4];
  [(NSMutableDictionary *)self->_clock setObject:v9 forKey:v8];
}

- (void)unionClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5
{
  id v8 = a5;
  if (-[PKVectorTimestamp compareClock:subclock:forUUID:](self, "compareClock:subclock:forUUID:", a3, a4) == -1) {
    [(PKVectorTimestamp *)self setClock:a3 subclock:a4 forUUID:v8];
  }
}

- (int64_t)compareClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5
{
  id v7 = [(PKVectorTimestamp *)self clockElementForUUID:a5];
  if ([v7 clock] > a3) {
    goto LABEL_5;
  }
  if ([v7 clock] < a3)
  {
    int64_t v8 = -1;
    goto LABEL_6;
  }
  if ([v7 subclock] > a4)
  {
LABEL_5:
    int64_t v8 = 1;
    goto LABEL_6;
  }
  if ([v7 subclock] >= a4) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = -1;
  }
LABEL_6:

  return v8;
}

- (void)incrementClockForUUID:(id)a3
{
  id v4 = a3;
  [(PKVectorTimestamp *)self setClock:[(PKVectorTimestamp *)self clockForUUID:v4] + 1 forUUID:v4];
}

- (id)allUUIDs
{
  return (id)[(NSMutableDictionary *)self->_clock allKeys];
}

- (id)sortedUUIDs
{
  v2 = [(NSMutableDictionary *)self->_clock allKeys];
  v3 = [v2 sortedArrayUsingSelector:sel_PK_compare_];

  return v3;
}

- (unint64_t)compareTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F1CA80];
  objc_super v6 = [(PKVectorTimestamp *)self allUUIDs];
  id v7 = [v5 setWithArray:v6];

  int64_t v8 = [v4 allUUIDs];
  [v7 addObjectsFromArray:v8];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v10)
  {

    unint64_t v24 = 0;
    goto LABEL_22;
  }
  uint64_t v11 = v10;
  char v12 = 0;
  char v13 = 0;
  uint64_t v14 = *(void *)v28;
  id obj = v9;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v28 != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
      v17 = [(PKVectorTimestamp *)self clockElementForUUID:v16];
      v18 = [v4 clockElementForUUID:v16];
      unint64_t v19 = [v17 clock];
      if (v19 >= [v18 clock])
      {
        unint64_t v20 = [v17 clock];
        if (v20 > [v18 clock])
        {
          char v12 = 1;
          goto LABEL_12;
        }
        unint64_t v21 = [v17 subclock];
        if (v21 >= [v18 subclock])
        {
          unint64_t v22 = [v17 subclock];
          v12 |= v22 > [v18 subclock];
          goto LABEL_12;
        }
      }
      char v13 = 1;
LABEL_12:

      if (v13 & 1) != 0 && (v12)
      {
        char v13 = 1;
        id v9 = obj;
        uint64_t v23 = 4;
        goto LABEL_20;
      }
    }
    id v9 = obj;
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11) {
      continue;
    }
    break;
  }
  if (v12) {
    uint64_t v23 = 4;
  }
  else {
    uint64_t v23 = 0;
  }
LABEL_20:

  unint64_t v24 = v23 | v13 & 1;
LABEL_22:

  return v24;
}

- (void)mergeWithTimestamp:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [v4 allUUIDs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [(PKVectorTimestamp *)self clockElementForUUID:v9];
        uint64_t v11 = [v4 clockElementForUUID:v9];
        unint64_t v12 = [v10 clock];
        char v13 = v10;
        if (v12 <= [v11 clock])
        {
          uint64_t v14 = [v10 clock];
          if (v14 != [v11 clock]
            || (v15 = [v10 subclock], char v13 = v10, v15 <= objc_msgSend(v11, "subclock")))
          {
            char v13 = v11;
          }
        }
        -[PKVectorTimestamp setClock:subclock:forUUID:](self, "setClock:subclock:forUUID:", [v13 clock], objc_msgSend(v13, "subclock"), v9);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (id)shortDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(PKVectorTimestamp *)self sortedUUIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [(PKVectorTimestamp *)self clockElementForUUID:v9];
        if ([v3 length]) {
          [v3 appendString:@", "];
        }
        uint64_t v11 = objc_msgSend(v9, "PK_shortDescription");
        [v3 appendFormat:@"%@:%lu.%lu", v11, objc_msgSend(v10, "clock"), objc_msgSend(v10, "subclock")];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PKVectorTimestamp *)self shortDescription];
  [v3 appendFormat:@"<%@ %p %@>", v5, self, v6];

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(PKVectorTimestamp *)self serialize];
  if (v4) {
    [v5 encodeObject:v4 forKey:@"timestamp"];
  }
}

- (PKVectorTimestamp)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];

  if (v5) {
    uint64_t v6 = [(PKVectorTimestamp *)self initWithData:v5];
  }
  else {
    uint64_t v6 = [(PKVectorTimestamp *)self init];
  }
  uint64_t v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end