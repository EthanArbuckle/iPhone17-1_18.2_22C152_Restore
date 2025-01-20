@interface GEORequestCounterLogInfo
+ (BOOL)supportsSecureCoding;
+ (id)counterLogInfoWithDictionary:(id)a3;
- ($C4D369C9F02205611300857CFD58F739)requestType;
- (BOOL)isEqual:(id)a3;
- (GEORequestCounterLogInfo)initWithCoder:(id)a3;
- (GEORequestCounterLogInfo)initWithDictionary:(id)a3;
- (NSDate)end;
- (NSDate)start;
- (NSDictionary)dictionaryRepresentation;
- (NSString)appID;
- (NSString)requestTypeString;
- (NSString)resultString;
- (id)description;
- (unint64_t)recvBytes;
- (unint64_t)usedInterfaceTypes;
- (unint64_t)xmitBytes;
- (unsigned)result;
- (void)_appendFormattedCSVStringTo:(id)a3;
- (void)_appendFormattedStringTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEORequestCounterLogInfo

- (NSDate)start
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  v3 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"start"];
  [v3 doubleValue];
  v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v4;
}

- (unint64_t)recvBytes
{
  v2 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"recvB"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)_appendFormattedCSVStringTo:(id)a3
{
  v26[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"type"];
  unsigned int v6 = [v5 intValue];
  unint64_t v7 = 0;
  unsigned int v8 = 0;
  unsigned int v9 = (v6 >> 8) & 0x7F;
  v25 = v5;
  if (v9 <= 0xB)
  {
    int v10 = 1 << v9;
    if ((v10 & 0xAA) != 0)
    {
      unsigned int v8 = v6 & 0x7F00;
      unint64_t v7 = (unint64_t)v6 << 32;
    }
    else if ((v10 & 0xC05) != 0)
    {
      unint64_t v7 = 0;
      unsigned int v8 = v6;
    }
  }
  v11 = GEODataRequestKindAsString(v7 | v8);
  v12 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"result"];
  unsigned __int8 v13 = [v12 intValue] + 2;
  if (v13 > 7u) {
    v14 = @"Success";
  }
  else {
    v14 = off_1E53DA298[(char)v13];
  }
  v15 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"appID"];
  v26[0] = v15;
  v26[1] = v11;
  v26[2] = v14;
  v16 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"xmitB"];
  v26[3] = v16;
  v17 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"recvB"];
  v26[4] = v17;
  v18 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"start"];
  v26[5] = v18;
  v19 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"end"];
  v26[6] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];

  v21 = [v20 componentsJoinedByString:@", "];
  [v4 appendString:v21];

  unint64_t v22 = [(GEORequestCounterLogInfo *)self usedInterfaceTypes];
  for (uint64_t i = 0; i != 6; ++i)
  {
    if ((GEOAllRequestCounterInterfaceTypes[i] & v22) != 0) {
      v24 = @", Y";
    }
    else {
      v24 = @", N";
    }
    [v4 appendString:v24];
  }
  [v4 appendString:@"\n"];
}

- (void)_appendFormattedStringTo:(id)a3
{
  id v4 = a3;
  v5 = [(GEORequestCounterLogInfo *)self requestTypeString];
  unsigned int v6 = [(GEORequestCounterLogInfo *)self appID];
  id v7 = v5;
  id v8 = v4;
  [v8 appendString:&stru_1ED51F370];
  [v8 appendString:&stru_1ED51F370];
  [v8 appendString:v7];
  uint64_t v9 = [&stru_1ED51F370 length];
  uint64_t v10 = [&stru_1ED51F370 length] + v9;
  uint64_t v11 = [v7 length];

  uint64_t v12 = v10 + v11 + [@" " length];
  uint64_t v13 = [v6 length];
  if ((unint64_t)(v12 + v13) <= 0x3C) {
    uint64_t v14 = 60 - (v12 + v13);
  }
  else {
    uint64_t v14 = 0;
  }
  v15 = [&stru_1ED51F370 stringByPaddingToLength:v14 withString:@" " startingAtIndex:0];
  [v8 appendString:v15];

  [v8 appendString:@" "];
  [v8 appendString:v6];
  [v8 appendString:@"\n"];

  v16 = [&stru_1ED51F370 stringByPaddingToLength:60 withString:@"-" startingAtIndex:0];
  [v8 appendString:v16];

  [v8 appendString:@"\n"];
  v17 = _byteFormatter();
  v18 = objc_msgSend(v17, "stringFromByteCount:", -[GEORequestCounterLogInfo xmitBytes](self, "xmitBytes"));

  v19 = _byteFormatter();
  v20 = objc_msgSend(v19, "stringFromByteCount:", -[GEORequestCounterLogInfo recvBytes](self, "recvBytes"));

  v56 = [(GEORequestCounterLogInfo *)self start];
  v55 = [(GEORequestCounterLogInfo *)self end];
  [v55 timeIntervalSinceDate:v56];
  unint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%.03fs", fmax(v21, 0.0));
  v54 = GEORequestCounterInterfaceTypesToStrings([(GEORequestCounterLogInfo *)self usedInterfaceTypes]);
  id v57 = [v54 componentsJoinedByString:@", "];
  v23 = [(GEORequestCounterLogInfo *)self resultString];
  id v24 = v18;
  id v25 = v8;
  [v25 appendString:&stru_1ED51F370];
  [v25 appendString:@"Xmit: "];
  [v25 appendString:v24];
  uint64_t v26 = [&stru_1ED51F370 length];
  uint64_t v27 = [@"Xmit: " length] + v26;
  uint64_t v28 = [v24 length];

  uint64_t v29 = v27 + v28;
  uint64_t v30 = [@" " length];
  unint64_t v31 = v29 + v30 + [v23 length];
  BOOL v32 = v31 <= 0x3C;
  unint64_t v33 = 60 - v31;
  if (v32) {
    unint64_t v34 = v33;
  }
  else {
    unint64_t v34 = 0;
  }
  v35 = [&stru_1ED51F370 stringByPaddingToLength:v34 withString:@" " startingAtIndex:0];
  [v25 appendString:v35];

  [v25 appendString:@" "];
  [v25 appendString:v23];
  [v25 appendString:@"\n"];

  id v36 = v22;
  id v37 = v20;
  id v38 = v25;
  [v38 appendString:&stru_1ED51F370];
  [v38 appendString:@"Recv: "];
  [v38 appendString:v37];
  uint64_t v39 = [&stru_1ED51F370 length];
  uint64_t v40 = [@"Recv: " length] + v39;
  uint64_t v41 = [v37 length];

  uint64_t v42 = v40 + v41 + [@" " length];
  uint64_t v43 = [v36 length];
  if ((unint64_t)(v42 + v43) <= 0x3C) {
    uint64_t v44 = 60 - (v42 + v43);
  }
  else {
    uint64_t v44 = 0;
  }
  v45 = [&stru_1ED51F370 stringByPaddingToLength:v44 withString:@" " startingAtIndex:0];
  [v38 appendString:v45];

  [v38 appendString:@" "];
  [v38 appendString:v36];

  [v38 appendString:@"\n"];
  id v46 = v57;
  id v58 = v38;
  [v58 appendString:&stru_1ED51F370];
  [v58 appendString:@"Used Interfaces: "];
  [v58 appendString:&stru_1ED51F370];
  uint64_t v47 = [&stru_1ED51F370 length];
  uint64_t v48 = [@"Used Interfaces: " length] + v47;
  uint64_t v49 = [&stru_1ED51F370 length];
  uint64_t v50 = v48 + v49 + [&stru_1ED51F370 length];
  uint64_t v51 = [v46 length];
  if ((unint64_t)(v50 + v51) <= 0x3C) {
    uint64_t v52 = 60 - (v50 + v51);
  }
  else {
    uint64_t v52 = 0;
  }
  v53 = [&stru_1ED51F370 stringByPaddingToLength:v52 withString:@" " startingAtIndex:0];
  [v58 appendString:v53];

  [v58 appendString:&stru_1ED51F370];
  [v58 appendString:v46];

  [v58 appendString:@"\n"];
  [v58 appendString:@"\n"];
}

- (unint64_t)xmitBytes
{
  v2 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"xmitB"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

+ (id)counterLogInfoWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[GEORequestCounterLogInfo alloc] initWithDictionary:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORequestCounterLogInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORequestCounterLogInfo;
  v5 = [(GEORequestCounterLogInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v6;
  }
  return v5;
}

- (GEORequestCounterLogInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEORequestCounterLogInfo;
  v5 = [(GEORequestCounterLogInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    objc_super v9 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v10 = [v4 decodeDictionaryWithKeysOfClasses:v9 objectsOfClasses:v8 forKey:@"dict"];
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSDictionary *)self->_dict isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (NSString)appID
{
  return (NSString *)[(NSDictionary *)self->_dict objectForKeyedSubscript:@"appID"];
}

- ($C4D369C9F02205611300857CFD58F739)requestType
{
  v2 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"type"];
  unsigned int v3 = [v2 intValue];
  unsigned int v4 = (v3 >> 8) & 0x7F;
  if (v4 > 0xB)
  {
    unsigned int v8 = 0;
    unint64_t v9 = 0;
  }
  else
  {
    int v5 = 1 << v4;
    if ((v5 & 0xC05) != 0) {
      unsigned int v6 = v3;
    }
    else {
      unsigned int v6 = 0;
    }
    BOOL v7 = (v5 & 0xAA) == 0;
    if ((v5 & 0xAA) != 0) {
      unsigned int v8 = v3 & 0x7F00;
    }
    else {
      unsigned int v8 = v6;
    }
    if (v7) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = (unint64_t)v3 << 32;
    }
  }
  $C4D369C9F02205611300857CFD58F739 v10 = ($C4D369C9F02205611300857CFD58F739)(v9 | v8);

  return v10;
}

- (NSString)requestTypeString
{
  $C4D369C9F02205611300857CFD58F739 v2 = [(GEORequestCounterLogInfo *)self requestType];

  return (NSString *)GEODataRequestKindAsString(*(void *)&v2);
}

- (unsigned)result
{
  $C4D369C9F02205611300857CFD58F739 v2 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"result"];
  unsigned __int8 v3 = [v2 unsignedIntValue];

  return v3;
}

- (NSString)resultString
{
  unsigned __int8 v2 = [(GEORequestCounterLogInfo *)self result] + 2;
  if (v2 > 7u) {
    return (NSString *)@"Success";
  }
  else {
    return &off_1E53DA298[(char)v2]->isa;
  }
}

- (NSDate)end
{
  unsigned __int8 v2 = (void *)MEMORY[0x1E4F1C9C8];
  unsigned __int8 v3 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"end"];
  [v3 doubleValue];
  unsigned int v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v4;
}

- (unint64_t)usedInterfaceTypes
{
  unsigned __int8 v2 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"iface"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dict;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@-%p : %@", objc_opt_class(), self, self->_dict];
}

- (void).cxx_destruct
{
}

@end