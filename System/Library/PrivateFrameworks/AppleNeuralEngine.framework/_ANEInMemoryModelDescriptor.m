@interface _ANEInMemoryModelDescriptor
+ (_ANEInMemoryModelDescriptor)new;
+ (id)modelWithMILText:(id)a3 weights:(id)a4 optionsPlist:(id)a5;
+ (id)modelWithNetworkDescription:(id)a3 weights:(id)a4 optionsPlist:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInMemoryModelDescriptor:(id)a3;
- (BOOL)isMILModel;
- (NSData)networkText;
- (NSData)optionsPlist;
- (NSDictionary)weights;
- (NSString)networkTextHash;
- (NSString)optionsPlistHash;
- (NSString)weightsHash;
- (_ANEInMemoryModelDescriptor)init;
- (_ANEInMemoryModelDescriptor)initWithNetworkText:(id)a3 weights:(id)a4 optionsPlist:(id)a5 isMILModel:(BOOL)a6;
- (id)hexStringIdentifier;
- (unint64_t)hash;
@end

@implementation _ANEInMemoryModelDescriptor

+ (_ANEInMemoryModelDescriptor)new
{
  return 0;
}

- (_ANEInMemoryModelDescriptor)init
{
  return 0;
}

- (_ANEInMemoryModelDescriptor)initWithNetworkText:(id)a3 weights:(id)a4 optionsPlist:(id)a5 isMILModel:(BOOL)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11 && v12)
  {
    v49.receiver = self;
    v49.super_class = (Class)_ANEInMemoryModelDescriptor;
    self = [(_ANEInMemoryModelDescriptor *)&v49 init];
    if (self)
    {
      v41 = a2;
      BOOL v42 = a6;
      v43 = v13;
      id v44 = v11;
      v14 = (NSData *)[v11 copy];
      networkText = self->_networkText;
      self->_networkText = v14;

      v16 = +[_ANEHashEncoding hexStringForData:self->_networkText];
      networkTextHash = self->_networkTextHash;
      self->_networkTextHash = v16;

      objc_storeStrong((id *)&self->_weights, a4);
      v18 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      v19 = [v12 allKeys];
      v20 = [v19 sortedArrayUsingComparator:&__block_literal_global_7];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v46;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v46 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            v27 = [v12 objectForKeyedSubscript:v26];
            if (![v27 count])
            {
              v38 = +[_ANELog framework];
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                -[_ANEInMemoryModelDescriptor initWithNetworkText:weights:optionsPlist:isMILModel:](v41, v26, v38);
              }

              v36 = 0;
              id v13 = v43;
              id v11 = v44;
              goto LABEL_20;
            }
            v28 = [v27 allValues];
            v29 = [v28 firstObject];

            [v18 addObject:v29];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      v30 = +[_ANEHashEncoding hexStringForDataArray:v18];
      weightsHash = self->_weightsHash;
      self->_weightsHash = v30;

      id v13 = v43;
      v32 = (NSData *)[v43 copy];
      optionsPlist = self->_optionsPlist;
      self->_optionsPlist = v32;

      v34 = +[_ANEHashEncoding hexStringForData:self->_optionsPlist];
      optionsPlistHash = self->_optionsPlistHash;
      self->_optionsPlistHash = v34;

      self->_isMILModel = v42;
      id v11 = v44;
    }
    self = self;
    v36 = self;
  }
  else
  {
    v37 = +[_ANELog framework];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v40 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v52 = v40;
      __int16 v53 = 2112;
      id v54 = v11;
      __int16 v55 = 2112;
      id v56 = v12;
      __int16 v57 = 2112;
      id v58 = v13;
      _os_log_error_impl(&dword_1DB8AB000, v37, OS_LOG_TYPE_ERROR, "%@: Invalid arguments. networkText=%@ : weights=%@ : optionsPlist=%@", buf, 0x2Au);
    }
    v36 = 0;
  }
LABEL_20:

  return v36;
}

+ (id)modelWithNetworkDescription:(id)a3 weights:(id)a4 optionsPlist:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithNetworkText:v10 weights:v9 optionsPlist:v8 isMILModel:0];

  return v11;
}

+ (id)modelWithMILText:(id)a3 weights:(id)a4 optionsPlist:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithNetworkText:v10 weights:v9 optionsPlist:v8 isMILModel:1];

  return v11;
}

- (id)hexStringIdentifier
{
  v3 = NSString;
  v4 = [(_ANEInMemoryModelDescriptor *)self networkTextHash];
  v5 = [(_ANEInMemoryModelDescriptor *)self weightsHash];
  v6 = [(_ANEInMemoryModelDescriptor *)self optionsPlistHash];
  v7 = [v3 stringWithFormat:@"%@_%@_%@", v4, v5, v6];

  return v7;
}

- (BOOL)isEqualToInMemoryModelDescriptor:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(_ANEInMemoryModelDescriptor *)self networkTextHash];
  v6 = [v4 networkTextHash];
  char v7 = [v5 isEqual:v6];

  id v8 = [(_ANEInMemoryModelDescriptor *)self weightsHash];
  id v9 = [v4 weightsHash];
  char v10 = [v8 isEqual:v9];

  id v11 = [(_ANEInMemoryModelDescriptor *)self optionsPlistHash];
  id v12 = [v4 optionsPlistHash];

  LOBYTE(v4) = [v11 isEqual:v12];
  return v7 & v10 & v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_ANEInMemoryModelDescriptor *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_ANEInMemoryModelDescriptor *)self isEqualToInMemoryModelDescriptor:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_ANEInMemoryModelDescriptor *)self networkTextHash];
  uint64_t v4 = [v3 hash];
  v5 = [(_ANEInMemoryModelDescriptor *)self weightsHash];
  uint64_t v6 = [v5 hash] ^ v4;
  char v7 = [(_ANEInMemoryModelDescriptor *)self optionsPlistHash];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSString)networkTextHash
{
  return self->_networkTextHash;
}

- (NSString)weightsHash
{
  return self->_weightsHash;
}

- (NSString)optionsPlistHash
{
  return self->_optionsPlistHash;
}

- (NSData)networkText
{
  return self->_networkText;
}

- (NSDictionary)weights
{
  return self->_weights;
}

- (NSData)optionsPlist
{
  return self->_optionsPlist;
}

- (BOOL)isMILModel
{
  return self->_isMILModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsPlist, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_networkText, 0);
  objc_storeStrong((id *)&self->_optionsPlistHash, 0);
  objc_storeStrong((id *)&self->_weightsHash, 0);
  objc_storeStrong((id *)&self->_networkTextHash, 0);
}

- (void)initWithNetworkText:(NSObject *)a3 weights:optionsPlist:isMILModel:.cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  char v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1DB8AB000, a3, OS_LOG_TYPE_ERROR, "%@: Empty weights dictionary for index=%@", (uint8_t *)&v6, 0x16u);
}

@end