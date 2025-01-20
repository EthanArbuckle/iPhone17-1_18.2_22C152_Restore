@interface ProgramAddressTableCollector
- (ProgramAddressTableCollector)init;
- (id).cxx_construct;
- (id)binaries;
- (id)initForHarvestingBinaries;
- (id)mappings;
- (void)addBinaries:(id)a3;
- (void)addBinaryMapping:(id)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5 forIndex:(unsigned int)a6;
- (void)addOtherEncoderFunctionIndex:(unint64_t)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5 forType:(id)a6;
- (void)addProgramAddressTable:(id)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5;
- (void)addSampledCallFunctionIndex:(unint64_t)a3;
- (void)addSampledCallFunctionIndex:(unint64_t)a3 forIndex:(unsigned int)a4 forEncoder:(unsigned int)a5 atEncoderIndex:(unsigned int)a6 forType:(id)a7;
- (void)dealloc;
@end

@implementation ProgramAddressTableCollector

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_addresses);
  objc_storeStrong((id *)&self->_functionIndices, 0);
  objc_storeStrong((id *)&self->_binaries, 0);
  objc_storeStrong((id *)&self->_mappings, 0);

  objc_storeStrong((id *)&self->_binaryTypes, 0);
}

- (id)binaries
{
  if ((dword_77313C & 0x200) != 0) {
    id v2 = [(NSMutableDictionary *)self->_binaries copy];
  }
  else {
    id v2 = &__NSDictionary0__struct;
  }

  return v2;
}

- (id)mappings
{
  if ((dword_77313C & 0x200) != 0) {
    id v2 = [(NSMutableArray *)self->_mappings copy];
  }
  else {
    id v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)addOtherEncoderFunctionIndex:(unint64_t)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5 forType:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  v14[0] = @"mappedAddress";
  v14[1] = @"mappedSize";
  mappings = self->_mappings;
  v14[2] = @"binaryUniqueId";
  v14[3] = @"index";
  v15[0] = &off_759BE8;
  v15[1] = &off_759BE8;
  v15[2] = @"0";
  v15[3] = &off_759BE8;
  v15[4] = v9;
  v14[4] = @"type";
  v14[5] = @"encID";
  v11 = +[NSNumber numberWithUnsignedInt:v7];
  v15[5] = v11;
  v14[6] = @"encIndex";
  v12 = +[NSNumber numberWithUnsignedInt:v6];
  v15[6] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:7];
  [(NSMutableArray *)mappings addObject:v13];
}

- (void)addSampledCallFunctionIndex:(unint64_t)a3 forIndex:(unsigned int)a4 forEncoder:(unsigned int)a5 atEncoderIndex:(unsigned int)a6 forType:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  id v12 = a7;
  functionIndices = self->_functionIndices;
  v14 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableArray *)functionIndices addObject:v14];

  mappings = self->_mappings;
  v22[0] = @"mappedAddress";
  v22[1] = @"mappedSize";
  v23[0] = &off_759BE8;
  v23[1] = &off_759BE8;
  v22[2] = @"binaryUniqueId";
  v22[3] = @"type";
  v23[2] = @"0";
  v23[3] = v12;
  v22[4] = @"encID";
  v16 = +[NSNumber numberWithUnsignedInt:v8];
  v23[4] = v16;
  v22[5] = @"encIndex";
  v17 = +[NSNumber numberWithUnsignedInt:v7];
  v23[5] = v17;
  v22[6] = @"index";
  v18 = +[NSNumber numberWithUnsignedInt:v9];
  v23[6] = v18;
  v22[7] = @"drawCallIndex";
  v19 = +[NSNumber numberWithUnsignedInt:self->_drawCallIndex];
  v23[7] = v19;
  v22[8] = @"drawFunctionIndex";
  v20 = [(NSMutableArray *)self->_functionIndices objectAtIndexedSubscript:self->_drawCallIndex];
  v23[8] = v20;
  v21 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:9];
  [(NSMutableArray *)mappings addObject:v21];

  ++self->_drawCallIndex;
}

- (void)addSampledCallFunctionIndex:(unint64_t)a3
{
  functionIndices = self->_functionIndices;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  -[NSMutableArray addObject:](functionIndices, "addObject:");
}

- (void)addProgramAddressTable:(id)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v16 = a3;
  if (v16 && (dword_77313C & 0x200) != 0)
  {
    uint64_t v8 = [v16 encoderInternalBinaries];
    [(ProgramAddressTableCollector *)self addBinaries:v8];

    uint64_t v9 = [v16 binaryMappingsEncoderInternal];
    [(ProgramAddressTableCollector *)self addBinaryMapping:v9 forEncoder:v6 atEncoderIndex:v5 forIndex:0xFFFFFFFFLL];

    unsigned int v10 = 0;
    uint64_t v11 = v6 << 32;
    while (1)
    {
      id v12 = [v16 binaryMappingsPerInvocation];
      id v13 = [v12 count];

      if ((unint64_t)v13 <= v10) {
        break;
      }
      v14 = [v16 binaryMappingsPerInvocation];
      v15 = [v14 objectAtIndexedSubscript:v10];

      if ([v15 count])
      {
        if (!std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>(&self->_addresses.__table_.__bucket_list_.__ptr_.__value_, v11 | v10))
        {
          [(ProgramAddressTableCollector *)self addBinaryMapping:v15 forEncoder:v6 atEncoderIndex:v5 forIndex:v10];
          ++self->_drawCallIndex;
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&self->_addresses, v11 | v10, v11 | v10);
        }
      }

      ++v10;
    }
  }
}

- (void)addBinaryMapping:(id)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5 forIndex:(unsigned int)a6
{
  id v34 = a3;
  unsigned int v7 = 0;
  uint64_t v8 = &send_ptr;
  while (1)
  {
    unsigned int v9 = v7;
    if ((unint64_t)[v34 count] <= v7) {
      break;
    }
    unsigned int v10 = [v34 objectAtIndexedSubscript:v7];
    uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%016llx", [v10 binaryUniqueId]);
    if (v11)
    {
      v32 = v10;
      uint64_t v12 = [(NSMutableDictionary *)self->_binaryTypes objectForKeyedSubscript:v11];
      CFStringRef v13 = @"unknown";
      if (v12) {
        CFStringRef v13 = (const __CFString *)v12;
      }
      v33 = (__CFString *)v13;
      mappings = self->_mappings;
      v35[0] = @"mappedAddress";
      uint64_t v36 = [v8[211] numberWithUnsignedLongLong:[v10 mappedAddress]];
      v35[1] = @"mappedSize";
      v31 = (void *)v36;
      uint64_t v37 = [v8[211] numberWithUnsignedLongLong:[v10 mappedSize]];
      v38 = v11;
      v35[2] = @"binaryUniqueId";
      v35[3] = @"type";
      v39 = v33;
      v35[4] = @"encID";
      v30 = (void *)v37;
      uint64_t v40 = [v8[211] numberWithUnsignedInt:a4];
      v35[5] = @"encIndex";
      v29 = (void *)v40;
      v28 = [v8[211] numberWithUnsignedInt:a5];
      v41 = v28;
      v35[6] = @"index";
      v15 = [v8[211] numberWithUnsignedInt:a6];
      v42 = v15;
      v35[7] = @"drawCallIndex";
      id v16 = v8;
      v17 = [v8[211] numberWithUnsignedInt:self->_drawCallIndex];
      v43 = v17;
      v35[8] = @"drawFunctionIndex";
      unint64_t drawCallIndex = self->_drawCallIndex;
      id v19 = [(NSMutableArray *)self->_functionIndices count];
      v20 = &off_759BD0;
      if ((unint64_t)v19 > drawCallIndex)
      {
        v27 = [(NSMutableArray *)self->_functionIndices objectAtIndexedSubscript:self->_drawCallIndex];
        v20 = v27;
      }
      v21 = self;
      v44 = v20;
      v22 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:v35 count:9];
      [(NSMutableArray *)mappings addObject:v22];
      BOOL v23 = (unint64_t)v19 > drawCallIndex;

      self = v21;
      uint64_t v8 = v16;
      unsigned int v10 = v32;
      if (v23) {
    }
      }
    unsigned int v7 = v9 + 1;
  }
}

- (void)addBinaries:(id)a3
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v5 = 0;
      id v18 = v4;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v25 + 1) + 8 * v5);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        unsigned int v7 = [obj objectForKeyedSubscript:v6];
        uint64_t v20 = v5;
        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v22;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v7);
              }
              uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%016llx", [v11 uniqueIdentifier]);
              [(NSMutableDictionary *)self->_binaryTypes setObject:v6 forKeyedSubscript:v12];
              binaries = self->_binaries;
              if (binaries)
              {
                v14 = [(NSMutableDictionary *)binaries objectForKeyedSubscript:v12];
                BOOL v15 = v14 == 0;

                if (v15)
                {
                  id v16 = [v11 binary];
                  [(NSMutableDictionary *)self->_binaries setObject:v16 forKeyedSubscript:v12];
                }
              }
            }
            id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v20 + 1;
      }
      while ((id)(v20 + 1) != v18);
      id v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v4);
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ProgramAddressTableCollector;
  [(ProgramAddressTableCollector *)&v2 dealloc];
}

- (id)initForHarvestingBinaries
{
  v12.receiver = self;
  v12.super_class = (Class)ProgramAddressTableCollector;
  objc_super v2 = [(ProgramAddressTableCollector *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    binaryTypes = v2->_binaryTypes;
    v2->_binaryTypes = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableArray array];
    mappings = v2->_mappings;
    v2->_mappings = (NSMutableArray *)v5;

    v2->_unint64_t drawCallIndex = 0;
    uint64_t v7 = objc_opt_new();
    binaries = v2->_binaries;
    v2->_binaries = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    functionIndices = v2->_functionIndices;
    v2->_functionIndices = (NSMutableArray *)v9;
  }
  return v2;
}

- (ProgramAddressTableCollector)init
{
  v12.receiver = self;
  v12.super_class = (Class)ProgramAddressTableCollector;
  objc_super v2 = [(ProgramAddressTableCollector *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    binaryTypes = v2->_binaryTypes;
    v2->_binaryTypes = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableArray array];
    mappings = v2->_mappings;
    v2->_mappings = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    binaries = v2->_binaries;
    v2->_binaries = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    functionIndices = v2->_functionIndices;
    v2->_functionIndices = (NSMutableArray *)v9;

    v2->_unint64_t drawCallIndex = 0;
  }
  return v2;
}

@end