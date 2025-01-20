@interface GEORequestCounterInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEORequestCounterInfo)initWithCoder:(id)a3;
- (GEORequestCounterInfo)initWithDictionary:(id)a3;
- (NSArray)requestTypes;
- (NSDictionary)dictionaryRepresentation;
- (double)durationAverage;
- (double)durationAverageForType:(id)a3;
- (double)durationTotal;
- (double)durationTotalForType:(id)a3;
- (id)description;
- (id)nonZeroResultTypesForType:(id)a3;
- (unint64_t)numberOfRequestsForType:(id)a3 result:(unsigned __int8)a4;
- (unint64_t)recvBytes;
- (unint64_t)recvBytesForType:(id)a3;
- (unint64_t)usedInterfaces;
- (unint64_t)usedInterfacesForType:(id)a3;
- (unint64_t)xmitBytes;
- (unint64_t)xmitBytesForType:(id)a3;
- (void)_appendFormattedCSVStringTo:(id)a3 forAppId:(id)a4;
- (void)_appendFormattedStringTo:(id)a3;
- (void)_generateAggregateStatistics;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateRequestTypes:(id)a3;
@end

@implementation GEORequestCounterInfo

- (id)nonZeroResultTypesForType:(id)a3
{
  v5 = [MEMORY[0x1E4F1CA48] array];
  unsigned __int8 v6 = 0;
  do
  {
    unsigned int v7 = v6;
    if ([(GEORequestCounterInfo *)self numberOfRequestsForType:a3 result:v6])
    {
      v8 = [NSNumber numberWithUnsignedChar:v6];
      [v5 addObject:v8];
    }
    ++v6;
  }
  while (v7 < 4);
  v9 = (void *)[v5 copy];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORequestCounterInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORequestCounterInfo;
  v5 = [(GEORequestCounterInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestTypeStatistics = v5->_requestTypeStatistics;
    v5->_requestTypeStatistics = (NSDictionary *)v6;

    [(GEORequestCounterInfo *)v5 _generateAggregateStatistics];
  }

  return v5;
}

- (GEORequestCounterInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORequestCounterInfo;
  v5 = [(GEORequestCounterInfo *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"dict"];
    requestTypeStatistics = v5->_requestTypeStatistics;
    v5->_requestTypeStatistics = (NSDictionary *)v7;

    [(GEORequestCounterInfo *)v5 _generateAggregateStatistics];
  }

  return v5;
}

- (void)_generateAggregateStatistics
{
  requestTypeStatistics = self->_requestTypeStatistics;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__GEORequestCounterInfo__generateAggregateStatistics__block_invoke;
  v3[3] = &unk_1E53DA1E0;
  v3[4] = self;
  [(NSDictionary *)requestTypeStatistics enumerateKeysAndObjectsUsingBlock:v3];
}

void __53__GEORequestCounterInfo__generateAggregateStatistics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(void *)(*(void *)(a1 + 32) + 16) += [v4 bytesTransmitted];
  *(void *)(*(void *)(a1 + 32) + 24) += [v4 bytesReceived];
  *(void *)(*(void *)(a1 + 32) + 32) += [v4 durationUSecondsTotal];
  *(_DWORD *)(*(void *)(a1 + 32) + 40) += [v4 durationCount];
  uint64_t v5 = [v4 usedInterfaces];

  *(void *)(*(void *)(a1 + 32) + 48) |= v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSDictionary *)self->_requestTypeStatistics isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)xmitBytes
{
  return self->_bytesTransmitted;
}

- (unint64_t)xmitBytesForType:(id)a3
{
  requestTypeStatistics = self->_requestTypeStatistics;
  id v4 = [NSNumber numberWithInt:(a3.var1.var0 | a3.var0)];
  char v5 = [(NSDictionary *)requestTypeStatistics objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 bytesTransmitted];
  return v6;
}

- (unint64_t)recvBytes
{
  return self->_bytesReceived;
}

- (unint64_t)recvBytesForType:(id)a3
{
  requestTypeStatistics = self->_requestTypeStatistics;
  id v4 = [NSNumber numberWithInt:(a3.var1.var0 | a3.var0)];
  char v5 = [(NSDictionary *)requestTypeStatistics objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 bytesReceived];
  return v6;
}

- (double)durationTotal
{
  return (double)self->_durationUSeconds / 1000000.0;
}

- (double)durationTotalForType:(id)a3
{
  requestTypeStatistics = self->_requestTypeStatistics;
  id v4 = [NSNumber numberWithInt:(a3.var1.var0 | a3.var0)];
  char v5 = [(NSDictionary *)requestTypeStatistics objectForKeyedSubscript:v4];

  double v6 = (double)[v5 durationUSecondsTotal] / 1000000.0;
  return v6;
}

- (double)durationAverage
{
  return (double)self->_durationUSeconds / (double)self->_durationCount / 1000000.0;
}

- (double)durationAverageForType:(id)a3
{
  requestTypeStatistics = self->_requestTypeStatistics;
  id v4 = [NSNumber numberWithInt:(a3.var1.var0 | a3.var0)];
  char v5 = [(NSDictionary *)requestTypeStatistics objectForKeyedSubscript:v4];

  double v6 = (double)[v5 durationUSecondsTotal];
  double v7 = v6 / (double)(int)[v5 durationCount] / 1000000.0;

  return v7;
}

- (unint64_t)usedInterfaces
{
  return self->_usedInterfaces;
}

- (unint64_t)usedInterfacesForType:(id)a3
{
  requestTypeStatistics = self->_requestTypeStatistics;
  id v4 = [NSNumber numberWithInt:(a3.var1.var0 | a3.var0)];
  char v5 = [(NSDictionary *)requestTypeStatistics objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 usedInterfaces];
  return v6;
}

- (NSArray)requestTypes
{
  v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_243];
  id v4 = [(NSDictionary *)self->_requestTypeStatistics allKeys];
  char v5 = [v4 filteredArrayUsingPredicate:v3];

  return (NSArray *)v5;
}

uint64_t __37__GEORequestCounterInfo_requestTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)enumerateRequestTypes:(id)a3
{
  id v4 = a3;
  char v5 = [(GEORequestCounterInfo *)self requestTypes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__GEORequestCounterInfo_enumerateRequestTypes___block_invoke;
  v7[3] = &unk_1E53DA228;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __47__GEORequestCounterInfo_enumerateRequestTypes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  unsigned int v6 = [a2 intValue];
  LODWORD(v7) = v6 & 0x7F00;
  unsigned int v8 = (v6 >> 8) & 0x7F;
  int v9 = 1 << (BYTE1(v6) & 0x7F);
  if ((v9 & 0xC05) != 0) {
    unsigned int v10 = v6;
  }
  else {
    unsigned int v10 = 0;
  }
  if ((v9 & 0xAA) != 0)
  {
    unint64_t v11 = (unint64_t)v6 << 32;
  }
  else
  {
    LODWORD(v7) = v10;
    unint64_t v11 = 0;
  }
  if (v8 <= 0xB) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v8 <= 0xB) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = 0;
  }
  v13 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v5 + 16);

  return v13(v5, v12 | v7, a4);
}

- (unint64_t)numberOfRequestsForType:(id)a3 result:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  requestTypeStatistics = self->_requestTypeStatistics;
  unsigned int v6 = [NSNumber numberWithInt:(a3.var1.var0 | a3.var0)];
  uint64_t v7 = [(NSDictionary *)requestTypeStatistics objectForKeyedSubscript:v6];

  unint64_t v8 = [v7 countForResult:v4];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)dictionaryRepresentation
{
  v54[5] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v53[0] = @"xmit";
  unint64_t v4 = 0x1E4F28000uLL;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[GEORequestCounterInfo xmitBytes](self, "xmitBytes"));
  v54[0] = v5;
  v53[1] = @"recv";
  unsigned int v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[GEORequestCounterInfo recvBytes](self, "recvBytes"));
  v54[1] = v6;
  v53[2] = @"durationTotal";
  uint64_t v7 = NSNumber;
  [(GEORequestCounterInfo *)self durationTotal];
  unint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  v54[2] = v8;
  v53[3] = @"durationAverage";
  int v9 = NSNumber;
  [(GEORequestCounterInfo *)self durationAverage];
  unsigned int v10 = objc_msgSend(v9, "numberWithDouble:");
  v54[3] = v10;
  v53[4] = @"usedInterfaces";
  uint64_t v11 = GEORequestCounterInterfaceTypesToStrings([(GEORequestCounterInfo *)self usedInterfaces]);
  unint64_t v12 = (void *)v11;
  uint64_t v13 = MEMORY[0x1E4F1CBF0];
  if (v11) {
    uint64_t v13 = v11;
  }
  v54[4] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:5];
  id v42 = v3;
  [v3 addEntriesFromDictionary:v14];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obj = self->_requestTypeStatistics;
  uint64_t v43 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v43)
  {
    uint64_t v41 = *(void *)v47;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v47 != v41) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v46 + 1) + 8 * v15);
        v17 = [MEMORY[0x1E4F1CA60] dictionary];
        unsigned int v18 = [v16 intValue];
        unint64_t v19 = 0;
        unsigned int v20 = 0;
        unsigned int v21 = (v18 >> 8) & 0x7F;
        uint64_t v45 = v15;
        if (v21 <= 0xB)
        {
          int v22 = 1 << v21;
          if ((v22 & 0xAA) != 0)
          {
            unsigned int v20 = v18 & 0x7F00;
            unint64_t v19 = (unint64_t)v18 << 32;
          }
          else if ((v22 & 0xC05) != 0)
          {
            unint64_t v19 = 0;
            unsigned int v20 = v18;
          }
        }
        uint64_t v23 = v19 | v20;
        v44 = GEODataRequestKindAsString(v23);
        v50[0] = @"xmit";
        v24 = objc_msgSend(*(id *)(v4 + 3792), "numberWithUnsignedInteger:", -[GEORequestCounterInfo xmitBytesForType:](self, "xmitBytesForType:", v23));
        v51[0] = v24;
        v50[1] = @"recv";
        unint64_t v25 = v4;
        v26 = objc_msgSend(*(id *)(v4 + 3792), "numberWithUnsignedInteger:", -[GEORequestCounterInfo recvBytesForType:](self, "recvBytesForType:", v23));
        v51[1] = v26;
        v50[2] = @"durationTotal";
        v27 = *(void **)(v25 + 3792);
        [(GEORequestCounterInfo *)self durationTotalForType:v23];
        v28 = objc_msgSend(v27, "numberWithDouble:");
        v51[2] = v28;
        v50[3] = @"durationAverage";
        v29 = *(void **)(v25 + 3792);
        [(GEORequestCounterInfo *)self durationAverageForType:v23];
        v30 = objc_msgSend(v29, "numberWithDouble:");
        v51[3] = v30;
        v50[4] = @"usedInterfaces";
        uint64_t v31 = GEORequestCounterInterfaceTypesToStrings([(GEORequestCounterInfo *)self usedInterfacesForType:v23]);
        v32 = (void *)v31;
        uint64_t v33 = MEMORY[0x1E4F1CBF0];
        if (v31) {
          uint64_t v33 = v31;
        }
        v51[4] = v33;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:5];
        [v17 addEntriesFromDictionary:v34];

        unint64_t v4 = v25;
        unsigned __int8 v35 = 0;
        do
        {
          v36 = @"Success";
          if ((v35 - 1) <= 3u) {
            v36 = off_1E53DA2D8[(char)v35 - 1];
          }
          unsigned int v37 = v35;
          v38 = objc_msgSend(*(id *)(v25 + 3792), "numberWithUnsignedInteger:", -[GEORequestCounterInfo numberOfRequestsForType:result:](self, "numberOfRequestsForType:result:", v23, v35));
          [v17 setObject:v38 forKeyedSubscript:v36];

          ++v35;
        }
        while (v37 < 4);
        [v42 setObject:v17 forKeyedSubscript:v44];

        uint64_t v15 = v45 + 1;
      }
      while (v45 + 1 != v43);
      uint64_t v43 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v43);
  }

  return (NSDictionary *)v42;
}

- (void)_appendFormattedStringTo:(id)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _byteFormatter();
  unsigned int v6 = objc_msgSend(v5, "stringFromByteCount:", -[GEORequestCounterInfo xmitBytes](self, "xmitBytes"));

  uint64_t v7 = _byteFormatter();
  unint64_t v8 = objc_msgSend(v7, "stringFromByteCount:", -[GEORequestCounterInfo recvBytes](self, "recvBytes"));

  int v9 = NSString;
  [(GEORequestCounterInfo *)self durationTotal];
  uint64_t v11 = objc_msgSend(v9, "stringWithFormat:", @"%.03fs", v10);
  unint64_t v12 = NSString;
  [(GEORequestCounterInfo *)self durationAverage];
  v14 = objc_msgSend(v12, "stringWithFormat:", @"%.03fs", v13);
  v120 = GEORequestCounterInterfaceTypesToStrings([(GEORequestCounterInfo *)self usedInterfaces]);
  v118 = [v120 componentsJoinedByString:@", "];
  id v15 = v11;
  id v16 = v6;
  id v17 = v4;
  [v17 appendString:@"  "];
  [v17 appendString:@"Xmit: "];
  [v17 appendString:v16];
  uint64_t v18 = [@"  " length];
  uint64_t v19 = [@"Xmit: " length] + v18;
  uint64_t v20 = [v16 length];

  uint64_t v21 = v19 + v20 + [@" Total: " length];
  uint64_t v22 = [v15 length];
  if ((unint64_t)(v21 + v22) <= 0x3C) {
    uint64_t v23 = 60 - (v21 + v22);
  }
  else {
    uint64_t v23 = 0;
  }
  v24 = [&stru_1ED51F370 stringByPaddingToLength:v23 withString:@" " startingAtIndex:0];
  [v17 appendString:v24];

  [v17 appendString:@" Total: "];
  [v17 appendString:v15];

  [v17 appendString:@"\n"];
  id v25 = v14;
  id v26 = v8;
  id v27 = v17;
  [v27 appendString:@"  "];
  [v27 appendString:@"Recv: "];
  [v27 appendString:v26];
  uint64_t v28 = [@"  " length];
  uint64_t v29 = [@"Recv: " length] + v28;
  uint64_t v30 = [v26 length];

  uint64_t v31 = v29 + v30 + [@" Average: " length];
  uint64_t v32 = [v25 length];
  if ((unint64_t)(v31 + v32) <= 0x3C) {
    uint64_t v33 = 60 - (v31 + v32);
  }
  else {
    uint64_t v33 = 0;
  }
  v34 = [&stru_1ED51F370 stringByPaddingToLength:v33 withString:@" " startingAtIndex:0];
  [v27 appendString:v34];

  [v27 appendString:@" Average: "];
  [v27 appendString:v25];

  [v27 appendString:@"\n"];
  id v35 = v118;
  id v36 = v27;
  [v36 appendString:@"  "];
  [v36 appendString:@"Used Interfaces: "];
  [v36 appendString:&stru_1ED51F370];
  uint64_t v37 = [@"  " length];
  uint64_t v38 = [@"Used Interfaces: " length] + v37;
  uint64_t v39 = [&stru_1ED51F370 length];
  uint64_t v40 = v38 + v39 + [&stru_1ED51F370 length];
  uint64_t v41 = [v35 length];
  if ((unint64_t)(v40 + v41) <= 0x3C) {
    uint64_t v42 = 60 - (v40 + v41);
  }
  else {
    uint64_t v42 = 0;
  }
  uint64_t v43 = [&stru_1ED51F370 stringByPaddingToLength:v42 withString:@" " startingAtIndex:0];
  [v36 appendString:v43];

  [v36 appendString:&stru_1ED51F370];
  [v36 appendString:v35];

  [v36 appendString:@"\n"];
  v108 = v36;

  v121 = self;
  v44 = [(NSDictionary *)self->_requestTypeStatistics allKeys];
  uint64_t v45 = [v44 sortedArrayUsingSelector:sel_compare_];

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id obj = v45;
  uint64_t v109 = [obj countByEnumeratingWithState:&v122 objects:v126 count:16];
  if (v109)
  {
    uint64_t v107 = *(void *)v123;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v123 != v107) {
          objc_enumerationMutation(obj);
        }
        unsigned int v47 = [*(id *)(*((void *)&v122 + 1) + 8 * v46) intValue];
        unint64_t v48 = 0;
        unsigned int v49 = 0;
        unsigned int v50 = (v47 >> 8) & 0x7F;
        uint64_t v119 = v46;
        if (v50 <= 0xB)
        {
          int v51 = 1 << v50;
          if ((v51 & 0xAA) != 0)
          {
            unsigned int v49 = v47 & 0x7F00;
            unint64_t v48 = (unint64_t)v47 << 32;
          }
          else if ((v51 & 0xC05) != 0)
          {
            unint64_t v48 = 0;
            unsigned int v49 = v47;
          }
        }
        uint64_t v52 = v48 | v49;
        v53 = GEODataRequestKindAsString(v52);
        [v108 appendString:@"\n"];
        [v108 appendString:@"  "];
        [v108 appendString:v53];
        [v108 appendString:@"\n"];
        [v108 appendString:@"  "];
        v117 = v53;
        v54 = objc_msgSend(&stru_1ED51F370, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v53, "length") + 1, @"-", 0);
        [v108 appendString:v54];

        [v108 appendString:@"\n"];
        v55 = _byteFormatter();
        v56 = objc_msgSend(v55, "stringFromByteCount:", -[GEORequestCounterInfo xmitBytesForType:](v121, "xmitBytesForType:", v52));

        v57 = _byteFormatter();
        v113 = objc_msgSend(v57, "stringFromByteCount:", -[GEORequestCounterInfo recvBytesForType:](v121, "recvBytesForType:", v52));

        v58 = NSString;
        [(GEORequestCounterInfo *)v121 durationTotalForType:v52];
        v60 = objc_msgSend(v58, "stringWithFormat:", @"%.03fs", v59);
        v61 = NSString;
        [(GEORequestCounterInfo *)v121 durationAverageForType:v52];
        v63 = objc_msgSend(v61, "stringWithFormat:", @"%.03fs", v62);
        v116 = GEORequestCounterInterfaceTypesToStrings([(GEORequestCounterInfo *)v121 usedInterfacesForType:v52]);
        v110 = [v116 componentsJoinedByString:@", "];
        id v64 = v60;
        id v65 = v56;
        id v66 = v108;
        [v66 appendString:@"  "];
        [v66 appendString:@"Xmit: "];
        [v66 appendString:v65];
        uint64_t v67 = [@"  " length];
        uint64_t v68 = [@"Xmit: " length] + v67;
        uint64_t v69 = [v65 length];

        uint64_t v70 = v68 + [@" Total: " length] + v69;
        uint64_t v71 = [v64 length];
        if ((unint64_t)(v70 + v71) <= 0x3C) {
          uint64_t v72 = 60 - (v70 + v71);
        }
        else {
          uint64_t v72 = 0;
        }
        v73 = [&stru_1ED51F370 stringByPaddingToLength:v72 withString:@" " startingAtIndex:0];
        [v66 appendString:v73];

        [v66 appendString:@" Total: "];
        [v66 appendString:v64];
        v115 = v64;

        [v66 appendString:@"\n"];
        id v74 = v63;
        id v75 = v113;
        id v76 = v66;
        [v76 appendString:@"  "];
        [v76 appendString:@"Recv: "];
        [v76 appendString:v75];
        uint64_t v77 = [@"  " length];
        uint64_t v78 = [@"Recv: " length] + v77;
        uint64_t v79 = [v75 length];
        v114 = v75;

        uint64_t v80 = v78 + [@" Average: " length] + v79;
        uint64_t v81 = [v74 length];
        if ((unint64_t)(v80 + v81) <= 0x3C) {
          uint64_t v82 = 60 - (v80 + v81);
        }
        else {
          uint64_t v82 = 0;
        }
        v83 = [&stru_1ED51F370 stringByPaddingToLength:v82 withString:@" " startingAtIndex:0];
        [v76 appendString:v83];

        [v76 appendString:@" Average: "];
        [v76 appendString:v74];
        v112 = v74;

        [v76 appendString:@"\n"];
        id v84 = v110;
        id v85 = v76;
        [v85 appendString:@"  "];
        [v85 appendString:@"Used Interfaces: "];
        [v85 appendString:&stru_1ED51F370];
        uint64_t v86 = [@"  " length];
        uint64_t v87 = [@"Used Interfaces: " length] + v86;
        uint64_t v88 = [&stru_1ED51F370 length];
        uint64_t v89 = v87 + v88 + [&stru_1ED51F370 length];
        uint64_t v90 = [v84 length];
        if ((unint64_t)(v89 + v90) <= 0x3C) {
          uint64_t v91 = 60 - (v89 + v90);
        }
        else {
          uint64_t v91 = 0;
        }
        v92 = [&stru_1ED51F370 stringByPaddingToLength:v91 withString:@" " startingAtIndex:0];
        [v85 appendString:v92];

        [v85 appendString:&stru_1ED51F370];
        [v85 appendString:v84];
        v111 = v84;

        [v85 appendString:@"\n"];
        unsigned __int8 v93 = 0;
        do
        {
          unsigned int v94 = v93;
          uint64_t v95 = [(GEORequestCounterInfo *)v121 numberOfRequestsForType:v52 result:v93];
          if (v95)
          {
            v96 = @"Success";
            if ((v93 - 1) <= 3u) {
              v96 = off_1E53DA2D8[(char)v93 - 1];
            }
            v97 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v95);
            id v98 = v85;
            [v98 appendString:@"    "];
            [v98 appendString:@"- "];
            [v98 appendString:v96];
            uint64_t v99 = [@"    " length];
            uint64_t v100 = [@"- " length] + v99;
            uint64_t v101 = [(__CFString *)v96 length];
            uint64_t v102 = v100 + v101 + [@". " length];
            uint64_t v103 = [v97 length];
            if ((unint64_t)(v102 + v103) <= 0x3C) {
              uint64_t v104 = 60 - (v102 + v103);
            }
            else {
              uint64_t v104 = 0;
            }
            v105 = [&stru_1ED51F370 stringByPaddingToLength:v104 withString:@"." startingAtIndex:0];
            [v98 appendString:v105];

            [v98 appendString:@". "];
            [v98 appendString:v97];
            [v98 appendString:@"\n"];
          }
          ++v93;
        }
        while (v94 < 4);

        uint64_t v46 = v119 + 1;
      }
      while (v119 + 1 != v109);
      uint64_t v109 = [obj countByEnumeratingWithState:&v122 objects:v126 count:16];
    }
    while (v109);
  }
}

- (void)_appendFormattedCSVStringTo:(id)a3 forAppId:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = a4;
  uint64_t v7 = [(NSDictionary *)self->_requestTypeStatistics allKeys];
  unint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v8;
  uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(obj);
        }
        unsigned int v10 = [*(id *)(*((void *)&v40 + 1) + 8 * v9) intValue];
        unint64_t v11 = 0;
        unsigned int v12 = 0;
        unsigned int v13 = (v10 >> 8) & 0x7F;
        uint64_t v37 = v9;
        if (v13 <= 0xB)
        {
          int v14 = 1 << v13;
          if ((v14 & 0xAA) != 0)
          {
            unsigned int v12 = v10 & 0x7F00;
            unint64_t v11 = (unint64_t)v10 << 32;
          }
          else if ((v14 & 0xC05) != 0)
          {
            unint64_t v11 = 0;
            unsigned int v12 = v10;
          }
        }
        uint64_t v15 = v11 | v12;
        uint64_t v39 = GEODataRequestKindAsString(v15);
        uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", -[GEORequestCounterInfo xmitBytesForType:](self, "xmitBytesForType:", v15));
        uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", -[GEORequestCounterInfo recvBytesForType:](self, "recvBytesForType:", v15));
        id v17 = NSString;
        [(GEORequestCounterInfo *)self durationTotalForType:v15];
        uint64_t v19 = objc_msgSend(v17, "stringWithFormat:", @"%.06f", v18);
        uint64_t v20 = NSString;
        [(GEORequestCounterInfo *)self durationAverageForType:v15];
        uint64_t v22 = objc_msgSend(v20, "stringWithFormat:", @"%.06f", v21);
        v44[0] = v32;
        v44[1] = v39;
        v44[2] = v38;
        v44[3] = v16;
        id v35 = (void *)v19;
        id v36 = (void *)v16;
        v44[4] = v19;
        v44[5] = v22;
        v34 = (void *)v22;
        uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:6];
        v24 = [v23 componentsJoinedByString:@", "];
        [v6 appendString:v24];

        int v25 = 0;
        do
        {
          unsigned int v26 = v25;
          [v6 appendFormat:@", %llu", -[GEORequestCounterInfo numberOfRequestsForType:result:](self, "numberOfRequestsForType:result:", v15, v25++)];
        }
        while (v26 < 4);
        unint64_t v27 = [(GEORequestCounterInfo *)self usedInterfacesForType:v15];
        for (uint64_t i = 0; i != 6; ++i)
        {
          if ((GEOAllRequestCounterInterfaceTypes[i] & v27) != 0) {
            uint64_t v29 = @", Y";
          }
          else {
            uint64_t v29 = @", N";
          }
          [v6 appendString:v29];
        }
        [v6 appendString:@"\n"];

        uint64_t v9 = v37 + 1;
      }
      while (v37 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v33);
  }
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)GEORequestCounterInfo;
  id v4 = [(GEORequestCounterInfo *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: %@", v4, self->_requestTypeStatistics];

  return v5;
}

- (void).cxx_destruct
{
}

@end