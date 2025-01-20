@interface AAFPlistSerializer
- (id)_dataFromDictionary:(id)a3 error:(id *)a4;
- (id)_dictionaryFromObject:(id)a3 error:(id *)a4;
- (id)mediaTypes;
@end

@implementation AAFPlistSerializer

- (id)mediaTypes
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"application/x-plist";
  v4[1] = @"application/x-apple-plist";
  v4[2] = @"text/plist";
  v4[3] = @"application/xml";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

- (id)_dictionaryFromObject:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:a4];
}

- (id)_dataFromDictionary:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:100 options:0 error:a4];
}

@end