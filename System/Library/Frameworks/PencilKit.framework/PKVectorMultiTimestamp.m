@interface PKVectorMultiTimestamp
- (BOOL)isEqual:(id)a3;
- (NSArray)timestamps;
- (PKVectorMultiTimestamp)initWithArchive:(const void *)a3 andCapacity:(unint64_t)a4;
- (PKVectorMultiTimestamp)initWithCapacity:(unint64_t)a3;
- (PKVectorMultiTimestamp)initWithData:(id)a3 andCapacity:(unint64_t)a4;
- (PKVectorMultiTimestamp)initWithTimestamps:(id)a3;
- (id)clockElementForUUID:(id)a3 atIndex:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serialize;
- (id)sortedUUIDs;
- (unint64_t)clockForUUID:(id)a3 atIndex:(unint64_t)a4;
- (unint64_t)compareTo:(id)a3;
- (unint64_t)hash;
- (void)mergeWithTimestamp:(id)a3;
- (void)saveToArchive:(void *)a3;
- (void)setClock:(unint64_t)a3 forUUID:(id)a4 atIndex:(unint64_t)a5;
- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5 atIndex:(unint64_t)a6;
@end

@implementation PKVectorMultiTimestamp

- (PKVectorMultiTimestamp)initWithData:(id)a3 andCapacity:(unint64_t)a4
{
  v11 = &unk_1F1FB04A0;
  memset(v12, 0, sizeof(v12));
  id v6 = a3;
  v7 = (const unsigned __int8 *)[v6 bytes];
  [v6 length];
  PB::Reader::Reader((PB::Reader *)buf, v7);
  LODWORD(v7) = unk_1F1FB04B0(&v11, buf);

  if (v7)
  {
    self = [(PKVectorMultiTimestamp *)self initWithArchive:&v11 andCapacity:a4];
    v8 = self;
  }
  else
  {
    v9 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_ERROR, "PKVectorMultiTimestamp protobuf corrupt.", buf, 2u);
    }

    v8 = 0;
  }
  v11 = &unk_1F1FB04A0;
  *(void *)buf = v12;
  std::vector<std::unique_ptr<drawing::Stroke>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  PB::Base::~Base((PB::Base *)&v11);

  return v8;
}

- (PKVectorMultiTimestamp)initWithArchive:(const void *)a3 andCapacity:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = [(PKVectorMultiTimestamp *)self initWithCapacity:a4];
  v7 = v6;
  if (!v6)
  {
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  v8 = v6;
  uint64_t v9 = *((void *)a3 + 2) - *((void *)a3 + 1);
  if (v9)
  {
    uint64_t v10 = 0;
    if ((unint64_t)(v9 >> 3) <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v9 >> 3;
    }
    while (1)
    {
      v12 = *(void **)(*((void *)a3 + 1) + 8 * v10);
      uint64_t v13 = v12[4];
      if (!v13 || *(void *)(v13 + 8) != 16) {
        break;
      }
      os_log_t v14 = (os_log_t)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:*(void *)v12[4]];
      uint64_t v16 = v12[1];
      uint64_t v15 = v12[2];
      uint64_t v17 = (v15 - v16) >> 3;
      if (v17 != a4)
      {
        v21 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v24 = 134218240;
          uint64_t v25 = v17;
          __int16 v26 = 2048;
          unint64_t v27 = a4;
          _os_log_error_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_ERROR, "PKVectorMultiTimestamp requires the same number of clocks as capacity %zu != %ld.", (uint8_t *)&v24, 0x16u);
        }

        goto LABEL_19;
      }
      if (v15 != v16)
      {
        unint64_t v18 = 0;
        unsigned int v19 = 1;
        do
        {
          uint64_t v20 = *(void *)(v12[1] + 8 * v18);
          -[PKVectorMultiTimestamp setClock:subclock:forUUID:atIndex:](v7, "setClock:subclock:forUUID:atIndex:", *(unsigned int *)(v20 + 8), *(unsigned int *)(v20 + 12), v14);
          unint64_t v18 = v19++;
        }
        while (v18 < a4);
      }

      if (++v10 == v11)
      {
        v8 = v7;
        goto LABEL_21;
      }
    }
    os_log_t v14 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_ERROR, "PKVectorMultiTimestamp clock requires uuids.", (uint8_t *)&v24, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
LABEL_21:
  v22 = v8;

  return v22;
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  id obj = [(PKVectorMultiTimestamp *)self sortedUUIDs];
  if ([obj countByEnumeratingWithState:v4 objects:v5 count:16]) {
    PB::PtrVector<legacy_drawing::VectorTimestampClock>::emplace_back<>();
  }
}

- (id)serialize
{
  v5 = (void (**)(void **, void ***))&unk_1F1FB04A0;
  memset(v6, 0, sizeof(v6));
  [(PKVectorMultiTimestamp *)self saveToArchive:&v5];
  PB::Writer::Writer((PB::Writer *)&v7);
  v5[3]((void **)&v5, &v7);
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v3 = (void *)[v2 initWithBytes:v8 length:(char *)v7 - v8];
  PB::Writer::~Writer((PB::Writer *)&v7);
  v5 = (void (**)(void **, void ***))&unk_1F1FB04A0;
  v7 = (void **)v6;
  std::vector<std::unique_ptr<drawing::Stroke>>::__destroy_vector::operator()[abi:ne180100](&v7);
  PB::Base::~Base((PB::Base *)&v5);

  return v3;
}

- (PKVectorMultiTimestamp)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKVectorMultiTimestamp;
  v4 = [(PKVectorMultiTimestamp *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    timestamps = v4->_timestamps;
    v4->_timestamps = (NSArray *)v5;

    if (a3)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = objc_alloc_init(PKVectorTimestamp);
        [(NSArray *)v4->_timestamps setObject:v8 atIndexedSubscript:v7];

        ++v7;
      }
      while (a3 != v7);
    }
  }
  return v4;
}

- (PKVectorMultiTimestamp)initWithTimestamps:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKVectorMultiTimestamp;
  uint64_t v5 = [(PKVectorMultiTimestamp *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSArray *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[PKVectorMultiTimestamp alloc] initWithCapacity:[(NSArray *)self->_timestamps count]];
  [(PKVectorMultiTimestamp *)v4 mergeWithTimestamp:self];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PKVectorMultiTimestamp *)self compareTo:v4] == 0;

  return v5;
}

- (unint64_t)hash
{
  id v2 = [(PKVectorMultiTimestamp *)self timestamps];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)clockElementForUUID:(id)a3 atIndex:(unint64_t)a4
{
  timestamps = self->_timestamps;
  id v6 = a3;
  uint64_t v7 = [(NSArray *)timestamps objectAtIndexedSubscript:a4];
  uint64_t v8 = [v7 clockElementForUUID:v6];

  return v8;
}

- (unint64_t)clockForUUID:(id)a3 atIndex:(unint64_t)a4
{
  timestamps = self->_timestamps;
  id v6 = a3;
  uint64_t v7 = [(NSArray *)timestamps objectAtIndexedSubscript:a4];
  unint64_t v8 = [v7 clockForUUID:v6];

  return v8;
}

- (void)setClock:(unint64_t)a3 forUUID:(id)a4 atIndex:(unint64_t)a5
{
  timestamps = self->_timestamps;
  id v8 = a4;
  id v9 = [(NSArray *)timestamps objectAtIndexedSubscript:a5];
  [v9 setClock:a3 forUUID:v8];
}

- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5 atIndex:(unint64_t)a6
{
  timestamps = self->_timestamps;
  id v10 = a5;
  id v11 = [(NSArray *)timestamps objectAtIndexedSubscript:a6];
  [v11 setClock:a3 subclock:a4 forUUID:v10];
}

- (id)sortedUUIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  NSUInteger v4 = [(NSArray *)self->_timestamps count];
  if (v4)
  {
    NSUInteger v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v7 = [(NSArray *)self->_timestamps objectAtIndexedSubscript:i];
      id v8 = [v7 allUUIDs];
      [v3 addObjectsFromArray:v8];
    }
  }
  id v9 = [v3 allObjects];
  id v10 = [v9 sortedArrayUsingSelector:sel_PK_compare_];

  return v10;
}

- (unint64_t)compareTo:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_timestamps count];
  if (v5)
  {
    NSUInteger v6 = v5;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      id v9 = [(NSArray *)self->_timestamps objectAtIndexedSubscript:v7];
      id v10 = [v4 timestamps];
      id v11 = [v10 objectAtIndexedSubscript:v7];
      v8 |= [v9 compareTo:v11];

      if (v8 == 5) {
        break;
      }
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)mergeWithTimestamp:(id)a3
{
  id v10 = a3;
  NSUInteger v4 = [(NSArray *)self->_timestamps count];
  if (v4)
  {
    NSUInteger v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v7 = [(NSArray *)self->_timestamps objectAtIndexedSubscript:i];
      unint64_t v8 = [v10 timestamps];
      id v9 = [v8 objectAtIndexedSubscript:i];
      [v7 mergeWithTimestamp:v9];
    }
  }
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  NSUInteger v4 = (objc_class *)objc_opt_class();
  NSUInteger v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p [", v5, self];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  NSUInteger v6 = self->_timestamps;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    id v10 = &stru_1F1FB2C00;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) shortDescription];
        [v3 appendFormat:@"%@(%@)", v10, v12, (void)v14];

        id v10 = @", ";
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v10 = @", ";
    }
    while (v8);
  }

  [v3 appendString:@"]>"];

  return v3;
}

- (NSArray)timestamps
{
  return self->_timestamps;
}

- (void).cxx_destruct
{
}

@end