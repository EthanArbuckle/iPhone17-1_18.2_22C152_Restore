@interface AAFJsonSerializer
- (id)_dataFromDictionary:(id)a3 error:(id *)a4;
- (id)_dictionaryFromObject:(id)a3 error:(id *)a4;
- (id)mediaTypes;
@end

@implementation AAFJsonSerializer

- (id)mediaTypes
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"application/json";
  v4[1] = @"text/x-json";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)_dictionaryFromObject:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:a4];
}

- (id)_dataFromDictionary:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v5])
  {
    a4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:1 error:a4];
  }
  else if (a4)
  {
    v6 = [NSString stringWithFormat:@"JSON cannot be formed from dictionary: %@", v5];
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a4 = [v7 errorWithDomain:@"AAFSerializationError" code:-701 userInfo:v8];

    a4 = 0;
  }

  return a4;
}

@end