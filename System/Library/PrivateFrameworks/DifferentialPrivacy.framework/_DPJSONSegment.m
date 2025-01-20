@interface _DPJSONSegment
- (NSArray)records;
- (NSDictionary)parameterDictionary;
- (NSString)key;
- (NSString)serverAlgorithmString;
- (_DPJSONSegment)init;
- (_DPJSONSegment)initWithKey:(id)a3 serverAlgorithmString:(id)a4 parameterDictionary:(id)a5 records:(id)a6;
- (id)fixDoubleValuesInDictionary:(id)a3;
- (id)jsonSegmentString;
- (id)parameterStringFrom:(id)a3;
@end

@implementation _DPJSONSegment

- (_DPJSONSegment)init
{
  return 0;
}

- (_DPJSONSegment)initWithKey:(id)a3 serverAlgorithmString:(id)a4 parameterDictionary:(id)a5 records:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_DPJSONSegment;
  v15 = [(_DPJSONSegment *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_key, a3);
    objc_storeStrong((id *)&v16->_serverAlgorithmString, a4);
    objc_storeStrong((id *)&v16->_records, a6);
    objc_storeStrong((id *)&v16->_parameterDictionary, a5);
  }

  return v16;
}

- (id)parameterStringFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 isEqualToDictionary:MEMORY[0x1E4F1CC08]] & 1) == 0)
  {
    v7 = [(_DPJSONSegment *)self fixDoubleValuesInDictionary:v5];
    v8 = (void *)MEMORY[0x1E019F810]();
    v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:0];
    v6 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fixDoubleValuesInDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v16);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v11 doubleValue];
          if (floor(v12) != v12)
          {
            id v13 = objc_msgSend(MEMORY[0x1E4F28C28], "numberWithDouble:");
            [v4 setObject:v13 forKey:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v14 = (void *)[v4 copy];
  return v14;
}

- (id)jsonSegmentString
{
  context = (void *)MEMORY[0x1E019F810](self, a2);
  id v3 = [(_DPJSONSegment *)self parameterStringFrom:self->_parameterDictionary];
  id v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"{\n\"algorithm\": \"%@\",\n\"key\": \"%@\",\n", self->_serverAlgorithmString, self->_key];
  id v5 = v4;
  if (v3) {
    [v4 appendFormat:@"\"parameters\": %@,\n", v3];
  }
  [v5 appendString:@"\"records\": [\n"];
  uint64_t v6 = (void *)[&stru_1F3681BE0 mutableCopy];
  if ([(NSArray *)self->_records count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = (void *)MEMORY[0x1E019F810]();
      v9 = [(NSArray *)self->_records objectAtIndexedSubscript:v7];
      uint64_t v10 = [v9 jsonString];
      [v6 appendString:v10];

      if (v7 >= [(NSArray *)self->_records count] - 1) {
        id v11 = @"\n";
      }
      else {
        id v11 = @",\n";
      }
      [v6 appendString:v11];

      ++v7;
    }
    while (v7 < [(NSArray *)self->_records count]);
  }
  double v12 = [NSString stringWithFormat:@"%@%@%@", v5, v6, @"]\n}"];

  return v12;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)serverAlgorithmString
{
  return self->_serverAlgorithmString;
}

- (NSArray)records
{
  return self->_records;
}

- (NSDictionary)parameterDictionary
{
  return self->_parameterDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterDictionary, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_serverAlgorithmString, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end