@interface ATXIntentMetadataCacheKey
- (ATXIntentMetadataCacheKey)initWithIntent:(id)a3 includingParameterValues:(BOOL)a4 localeIdentifier:(id)a5;
- (ATXIntentMetadataCacheKey)initWithIntent:(id)a3 includingParameters:(BOOL)a4;
- (ATXIntentMetadataCacheKey)initWithIntent:(id)a3 includingParameters:(BOOL)a4 includingParameterValues:(BOOL)a5 localeIdentifier:(id)a6;
- (NSSet)nonNilParameters;
- (NSString)bundleId;
- (NSString)intentClassName;
- (NSString)localeIdentifier;
- (id)stringRepresentationForSerialization;
- (unint64_t)intentHash;
@end

@implementation ATXIntentMetadataCacheKey

- (ATXIntentMetadataCacheKey)initWithIntent:(id)a3 includingParameters:(BOOL)a4
{
  return [(ATXIntentMetadataCacheKey *)self initWithIntent:a3 includingParameters:a4 includingParameterValues:0 localeIdentifier:0];
}

- (ATXIntentMetadataCacheKey)initWithIntent:(id)a3 includingParameterValues:(BOOL)a4 localeIdentifier:(id)a5
{
  return [(ATXIntentMetadataCacheKey *)self initWithIntent:a3 includingParameters:a4 includingParameterValues:a4 localeIdentifier:a5];
}

- (ATXIntentMetadataCacheKey)initWithIntent:(id)a3 includingParameters:(BOOL)a4 includingParameterValues:(BOOL)a5 localeIdentifier:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXIntentMetadataCacheKey;
  v12 = [(ATXIntentMetadataCacheKey *)&v24 init];
  if (v12)
  {
    v13 = [v10 extensionBundleId];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v10 launchId];
    }
    v16 = v15;

    v17 = [v10 _className];
    if (![v16 length] || !objc_msgSend(v17, "length"))
    {

      v22 = 0;
      goto LABEL_17;
    }
    objc_storeStrong((id *)&v12->_bundleId, v16);
    objc_storeStrong((id *)&v12->_intentClassName, v17);
    if (v8)
    {
      uint64_t v18 = objc_msgSend(v10, "atx_nonNilParameters");
      nonNilParameters = v12->_nonNilParameters;
      v12->_nonNilParameters = (NSSet *)v18;
    }
    if (v7)
    {
      unint64_t v20 = objc_msgSend(v10, "atx_backingStoreDataHash");
      if (v20 <= 1) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = v20;
      }
      v12->_intentHash = v21;
    }
    objc_storeStrong((id *)&v12->_localeIdentifier, a6);
  }
  v22 = v12;
LABEL_17:

  return v22;
}

- (id)stringRepresentationForSerialization
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  intentClassName = self->_intentClassName;
  v22[0] = self->_bundleId;
  v22[1] = intentClassName;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v6 = (void *)[v3 initWithArray:v5];

  BOOL v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  nonNilParameters = self->_nonNilParameters;
  uint64_t v21 = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  id v10 = [(NSSet *)nonNilParameters sortedArrayUsingDescriptors:v9];

  uint64_t v11 = [v10 componentsJoinedByString:&stru_1F2740B58];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = &stru_1F2740B58;
  }
  v14 = v13;

  [v6 addObject:v14];
  if (self->_intentHash)
  {
    id v15 = [NSString alloc];
    v16 = [NSNumber numberWithUnsignedInteger:self->_intentHash];
    v17 = objc_msgSend(v15, "initWithFormat:", @"%lld", objc_msgSend(v16, "longLongValue"));

    [v6 addObject:v17];
    if (self->_localeIdentifier) {
      localeIdentifier = (__CFString *)self->_localeIdentifier;
    }
    else {
      localeIdentifier = &stru_1F2740B58;
    }
    [v6 addObject:localeIdentifier];
  }
  v19 = [v6 componentsJoinedByString:@"-"];

  return v19;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)intentClassName
{
  return self->_intentClassName;
}

- (NSSet)nonNilParameters
{
  return self->_nonNilParameters;
}

- (unint64_t)intentHash
{
  return self->_intentHash;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_nonNilParameters, 0);
  objc_storeStrong((id *)&self->_intentClassName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end