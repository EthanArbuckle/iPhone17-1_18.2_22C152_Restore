@interface _ASWebsiteNameDictionary
+ (id)sanitizedDataFromDeserializedData:(id)a3;
- (NSString)description;
- (_ASWebsiteNameDictionary)initWithSnapshotData:(id)a3 error:(id *)a4;
- (id)snapshotData;
- (id)websiteNameForDomain:(id)a3;
@end

@implementation _ASWebsiteNameDictionary

- (_ASWebsiteNameDictionary)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ASWebsiteNameDictionary;
  v6 = [(_ASWebsiteNameDictionary *)&v14 init];
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = objc_opt_class();
    v10 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:24 error:0];
    uint64_t v11 = [v9 sanitizedDataFromDeserializedData:v10];
    websiteNameDictionary = v7->_websiteNameDictionary;
    v7->_websiteNameDictionary = (NSDictionary *)v11;

    if (v7->_websiteNameDictionary) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }

  return v8;
}

+ (id)sanitizedDataFromDeserializedData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 1;
    id v4 = v3;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62___ASWebsiteNameDictionary_sanitizedDataFromDeserializedData___block_invoke;
    v8[3] = &unk_264395DE8;
    v8[4] = &v9;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
    if (*((unsigned char *)v10 + 24)) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)websiteNameForDomain:(id)a3
{
  id v3 = [(NSDictionary *)self->_websiteNameDictionary objectForKeyedSubscript:a3];

  return v3;
}

- (id)snapshotData
{
  return (id)[MEMORY[0x263F08900] dataWithJSONObject:self->_websiteNameDictionary options:0 error:0];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; count(websiteNameDictionary) = %ld>",
    v5,
    self,
  id v6 = [(NSDictionary *)self->_websiteNameDictionary count]);

  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

@end