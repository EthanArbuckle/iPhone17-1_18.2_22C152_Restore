@interface _ANEModel
+ (BOOL)supportsSecureCoding;
+ (id)correctFileURLFormat:(id)a3;
+ (id)modelAtURL:(id)a3 key:(id)a4;
+ (id)modelAtURL:(id)a3 key:(id)a4 modelAttributes:(id)a5;
+ (id)modelAtURLWithCacheURLIdentifier:(id)a3 key:(id)a4 cacheURLIdentifier:(id)a5;
+ (id)modelAtURLWithSourceURL:(id)a3 sourceURL:(id)a4 key:(id)a5 cacheURLIdentifier:(id)a6;
+ (id)modelAtURLWithSourceURL:(id)a3 sourceURL:(id)a4 key:(id)a5 identifierSource:(int64_t)a6 cacheURLIdentifier:(id)a7;
+ (id)modelWithCacheURLIdentifier:(id)a3;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToModel:(id)a3;
- (NSDictionary)modelAttributes;
- (NSString)cacheURLIdentifier;
- (NSString)key;
- (NSURL)modelURL;
- (NSURL)sourceURL;
- (NSUUID)UUID;
- (_ANEModel)init;
- (_ANEModel)initWithCoder:(id)a3;
- (_ANEModel)initWithModelAtURL:(id)a3 key:(id)a4 identifierSource:(int64_t)a5 cacheURLIdentifier:(id)a6 modelAttributes:(id)a7 standardizeURL:(BOOL)a8;
- (_ANEModel)initWithModelAtURL:(id)a3 sourceURL:(id)a4 UUID:(id)a5 key:(id)a6 identifierSource:(int64_t)a7 cacheURLIdentifier:(id)a8 modelAttributes:(id)a9 standardizeURL:(BOOL)a10 string_id:(unint64_t)a11 generateNewStringId:(BOOL)a12;
- (_ANEModel)initWithModelIdentifier:(id)a3;
- (_ANEProgramForEvaluation)program;
- (_ANEProgramIOSurfacesMapper)mapper;
- (char)queueDepth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getCacheURLIdentifier;
- (id)getUUID;
- (id)inputSymbolIndicesForProcedureIndex:(unsigned int)a3;
- (id)outputSymbolIndicesForProcedureIndex:(unsigned int)a3;
- (id)procedureInfoForProcedureIndex:(unsigned int)a3;
- (id)shallowCopy;
- (id)symbolIndicesForProcedureIndex:(unsigned int)a3 indexArrayKey:(id)a4;
- (int64_t)identifierSource;
- (os_unfair_lock_s)l;
- (unint64_t)hash;
- (unint64_t)intermediateBufferHandle;
- (unint64_t)programHandle;
- (unint64_t)state;
- (unint64_t)string_id;
- (unsigned)perfStatsMask;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)resetOnUnload;
- (void)setCacheURLIdentifier:(id)a3;
- (void)setIntermediateBufferHandle:(unint64_t)a3;
- (void)setL:(os_unfair_lock_s)a3;
- (void)setMapper:(id)a3;
- (void)setModelAttributes:(id)a3;
- (void)setPerfStatsMask:(unsigned int)a3;
- (void)setProgram:(id)a3;
- (void)setProgramHandle:(unint64_t)a3;
- (void)setQueueDepth:(char)a3;
- (void)setState:(unint64_t)a3;
- (void)setString_id:(unint64_t)a3;
- (void)updateModelAttributes:(id)a3 state:(unint64_t)a4;
- (void)updateModelAttributes:(id)a3 state:(unint64_t)a4 programHandle:(unint64_t)a5 intermediateBufferHandle:(unint64_t)a6 queueDepth:(char)a7;
@end

@implementation _ANEModel

- (id)getCacheURLIdentifier
{
  return self->_cacheURLIdentifier;
}

- (unsigned)perfStatsMask
{
  return self->_perfStatsMask;
}

- (NSDictionary)modelAttributes
{
  return self->_modelAttributes;
}

+ (id)modelAtURL:(id)a3 key:(id)a4
{
  return (id)[a1 modelAtURL:a3 key:a4 modelAttributes:MEMORY[0x1E4F1CC08]];
}

- (unint64_t)intermediateBufferHandle
{
  return self->_intermediateBufferHandle;
}

- (_ANEModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceurl"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifierSource"];
  uint64_t v10 = [v9 integerValue];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string_id"];
  uint64_t v12 = [v11 unsignedLongLongValue];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  v14 = +[_ANELog common];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[_ANEModel initWithCoder:]();
  }

  LOBYTE(v18) = 0;
  LOBYTE(v17) = 0;
  v15 = [(_ANEModel *)self initWithModelAtURL:v5 sourceURL:v6 UUID:v7 key:v8 identifierSource:v10 cacheURLIdentifier:v13 modelAttributes:MEMORY[0x1E4F1CC08] standardizeURL:v17 string_id:v12 generateNewStringId:v18];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_ANEModel *)self modelURL];
  [v4 encodeObject:v5 forKey:@"url"];

  v6 = [(_ANEModel *)self sourceURL];
  [v4 encodeObject:v6 forKey:@"sourceurl"];

  v7 = [(_ANEModel *)self UUID];
  [v4 encodeObject:v7 forKey:@"uuid"];

  v8 = [(_ANEModel *)self key];
  [v4 encodeObject:v8 forKey:@"key"];

  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[_ANEModel identifierSource](self, "identifierSource"));
  [v4 encodeObject:v9 forKey:@"identifierSource"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_ANEModel string_id](self, "string_id"));
  [v4 encodeObject:v10 forKey:@"string_id"];

  v11 = [(_ANEModel *)self cacheURLIdentifier];
  [v4 encodeObject:v11 forKey:@"identifier"];

  uint64_t v12 = +[_ANELog common];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[_ANEModel encodeWithCoder:]();
  }
}

- (NSString)key
{
  return self->_key;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (int64_t)identifierSource
{
  return self->_identifierSource;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)cacheURLIdentifier
{
  return self->_cacheURLIdentifier;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (unint64_t)string_id
{
  return self->_string_id;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

- (id)getUUID
{
  return self->_UUID;
}

+ (id)modelAtURL:(id)a3 key:(id)a4 modelAttributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = +[_ANEModel correctFileURLFormat:a3];
  v11 = (void *)[objc_alloc((Class)a1) initWithModelAtURL:v10 key:v9 identifierSource:1 cacheURLIdentifier:0 modelAttributes:v8 standardizeURL:1];

  return v11;
}

- (_ANEModel)initWithModelAtURL:(id)a3 key:(id)a4 identifierSource:(int64_t)a5 cacheURLIdentifier:(id)a6 modelAttributes:(id)a7 standardizeURL:(BOOL)a8
{
  v14 = (void *)MEMORY[0x1E4F29128];
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  v19 = [v14 UUID];
  LOBYTE(v23) = 1;
  LOBYTE(v22) = a8;
  v20 = [(_ANEModel *)self initWithModelAtURL:v18 sourceURL:0 UUID:v19 key:v17 identifierSource:a5 cacheURLIdentifier:v16 modelAttributes:v15 standardizeURL:v22 string_id:0 generateNewStringId:v23];

  return v20;
}

+ (id)correctFileURLFormat:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 scheme];

    if (v6)
    {
      v7 = v5;
      if ([v5 isFileURL]) {
        goto LABEL_14;
      }
      id v8 = +[_ANELog common];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[_ANEModel correctFileURLFormat:]();
      }
      v7 = v5;
    }
    else
    {
      id v9 = +[_ANELog common];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = NSStringFromSelector(a2);
        int v13 = 138412546;
        v14 = v10;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_1DB8AB000, v9, OS_LOG_TYPE_INFO, "%@: modelURL=%@ doesn't have scheme", (uint8_t *)&v13, 0x16u);
      }
      v11 = (void *)MEMORY[0x1E4F1CB10];
      id v8 = [v5 path];
      v7 = [v11 fileURLWithPath:v8];
    }
  }
  else
  {
    id v8 = +[_ANELog common];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[_ANEModel correctFileURLFormat:](v8);
    }
    v7 = 0;
  }

LABEL_14:
  return v7;
}

- (void)setCacheURLIdentifier:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    int v7 = [v5 containsString:@".."];
    id v8 = +[_ANELog common];
    cacheURLIdentifier = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[_ANEModel setCacheURLIdentifier:]();
      }

      if ([(NSString *)self->_cacheURLIdentifier isEqualToString:v6])
      {
        cacheURLIdentifier = +[_ANELog common];
        if (os_log_type_enabled(cacheURLIdentifier, OS_LOG_TYPE_DEBUG)) {
          -[_ANEModel setCacheURLIdentifier:](a2);
        }
      }
      else
      {
        uint64_t v10 = (NSString *)[v6 copy];
        cacheURLIdentifier = self->_cacheURLIdentifier;
        self->_cacheURLIdentifier = v10;
      }
    }
  }
}

- (_ANEModel)initWithModelAtURL:(id)a3 sourceURL:(id)a4 UUID:(id)a5 key:(id)a6 identifierSource:(int64_t)a7 cacheURLIdentifier:(id)a8 modelAttributes:(id)a9 standardizeURL:(BOOL)a10 string_id:(unint64_t)a11 generateNewStringId:(BOOL)a12
{
  id v40 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  id v23 = a9;
  if ([v22 containsString:@".."])
  {
    v24 = +[_ANELog common];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:]();
    }
LABEL_12:

    v25 = 0;
    goto LABEL_13;
  }
  if (a7 == 3 && !v22)
  {
    v24 = +[_ANELog common];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:](a2);
    }
    goto LABEL_12;
  }
  if (!v19 && a7 == 2)
  {
    v24 = +[_ANELog common];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:](a2);
    }
    goto LABEL_12;
  }
  v41.receiver = self;
  v41.super_class = (Class)_ANEModel;
  v27 = [(_ANEModel *)&v41 init];
  v28 = v27;
  if (v27)
  {
    v27->_l._os_unfair_lock_opaque = 0;
    if (a10)
    {
      uint64_t v29 = [v40 URLByStandardizingPath];
      modelURL = v28->_modelURL;
      v28->_modelURL = (NSURL *)v29;

      v31 = [v19 URLByStandardizingPath];
    }
    else
    {
      objc_storeStrong((id *)&v27->_modelURL, a3);
      v31 = (NSURL *)v19;
    }
    sourceURL = v28->_sourceURL;
    v28->_sourceURL = v31;

    uint64_t v33 = [v21 copy];
    key = v28->_key;
    v28->_key = (NSString *)v33;

    v28->_identifierSource = a7;
    uint64_t v35 = [v22 copy];
    cacheURLIdentifier = v28->_cacheURLIdentifier;
    v28->_cacheURLIdentifier = (NSString *)v35;

    objc_storeStrong((id *)&v28->_modelAttributes, a9);
    v28->_state = 1;
    objc_storeStrong((id *)&v28->_UUID, a5);
    if (a12)
    {
      id v37 = [v40 path];
      [v37 UTF8String];
      v28->_string_id = kdebug_trace_string();

      if (v28->_string_id == -1)
      {
        v38 = +[_ANELog common];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.4(a2);
        }
      }
    }
    else
    {
      v28->_string_id = a11;
    }
  }
  self = v28;
  v25 = self;
LABEL_13:

  return v25;
}

- (void)setProgram:(id)a3
{
}

- (void)setMapper:(id)a3
{
}

- (void)updateModelAttributes:(id)a3 state:(unint64_t)a4 programHandle:(unint64_t)a5 intermediateBufferHandle:(unint64_t)a6 queueDepth:(char)a7
{
  uint64_t v7 = a7;
  p_l = &self->_l;
  id v13 = a3;
  os_unfair_lock_lock(p_l);
  [(_ANEModel *)self setModelAttributes:v13];

  [(_ANEModel *)self setState:a4];
  [(_ANEModel *)self setProgramHandle:a5];
  [(_ANEModel *)self setIntermediateBufferHandle:a6];
  [(_ANEModel *)self setQueueDepth:v7];
  os_unfair_lock_unlock(p_l);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)setQueueDepth:(char)a3
{
  self->_queueDepth = a3;
}

- (void)setProgramHandle:(unint64_t)a3
{
  self->_programHandle = a3;
}

- (void)setModelAttributes:(id)a3
{
}

- (void)setIntermediateBufferHandle:(unint64_t)a3
{
  self->_intermediateBufferHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURLIdentifier, 0);
  objc_storeStrong((id *)&self->_mapper, 0);
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_modelAttributes, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (void)dealloc
{
  self->_state = 5;
  unint64_t v4 = kdebug_trace_string();
  self->_string_id = v4;
  if (v4 == -1)
  {
    id v5 = +[_ANELog common];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.4(a2);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)_ANEModel;
  [(_ANEModel *)&v6 dealloc];
}

+ (id)new
{
  return 0;
}

- (_ANEModel)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_super v6 = [(_ANEModel *)self modelURL];
  uint64_t v7 = [v3 stringWithFormat:@"%@: { modelURL=%@ : ", v5, v6];

  id v8 = NSString;
  id v9 = [(_ANEModel *)self sourceURL];
  uint64_t v10 = [v8 stringWithFormat:@"sourceURL=%@ : ", v9];
  v11 = [v7 stringByAppendingString:v10];

  uint64_t v12 = NSString;
  id v13 = [(_ANEModel *)self UUID];
  v14 = [v13 UUIDString];
  __int16 v15 = [v12 stringWithFormat:@"UUID UUIDString=%@ : ", v14];
  id v16 = [v11 stringByAppendingString:v15];

  uint64_t v17 = NSString;
  id v18 = [(_ANEModel *)self UUID];
  id v19 = [v17 stringWithFormat:@"UUID=%@ : ", v18];
  id v20 = [v16 stringByAppendingString:v19];

  id v21 = NSString;
  id v22 = [(_ANEModel *)self key];
  id v23 = [v21 stringWithFormat:@"key=%@ : ", v22];
  v24 = [v20 stringByAppendingString:v23];

  v25 = objc_msgSend(NSString, "stringWithFormat:", @"identifierSource=%u : ", -[_ANEModel identifierSource](self, "identifierSource"));
  v26 = [v24 stringByAppendingString:v25];

  v27 = NSString;
  v28 = [(_ANEModel *)self getCacheURLIdentifier];
  uint64_t v29 = [v27 stringWithFormat:@"cacheURLIdentifier=%@ : ", v28];
  v30 = [v26 stringByAppendingString:v29];

  v31 = objc_msgSend(NSString, "stringWithFormat:", @"string_id=0x%08llx : ", -[_ANEModel string_id](self, "string_id"));
  v32 = [v30 stringByAppendingString:v31];

  uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"string_id=%llu : ", -[_ANEModel string_id](self, "string_id"));
  v34 = [v32 stringByAppendingString:v33];

  uint64_t v35 = NSString;
  v36 = [(_ANEModel *)self program];
  id v37 = [v35 stringWithFormat:@"program=%@ : ", v36];
  v38 = [v34 stringByAppendingString:v37];

  v39 = objc_msgSend(NSString, "stringWithFormat:", @"state=%lu : ", -[_ANEModel state](self, "state"));
  id v40 = [v38 stringByAppendingString:v39];

  objc_super v41 = objc_msgSend(NSString, "stringWithFormat:", @"programHandle=%llu :", -[_ANEModel programHandle](self, "programHandle"));
  v42 = [v40 stringByAppendingString:v41];

  v43 = objc_msgSend(NSString, "stringWithFormat:", @"intermediateBufferHandle=%llu : ", -[_ANEModel intermediateBufferHandle](self, "intermediateBufferHandle"));
  v44 = [v42 stringByAppendingString:v43];

  v45 = objc_msgSend(NSString, "stringWithFormat:", @"queueDepth=%d : ", -[_ANEModel queueDepth](self, "queueDepth"));
  v46 = [v44 stringByAppendingString:v45];

  v47 = NSString;
  v48 = [(_ANEModel *)self modelAttributes];
  v49 = [v47 stringWithFormat:@"attr=%@ : ", v48];
  v50 = [v46 stringByAppendingString:v49];

  v51 = objc_msgSend(NSString, "stringWithFormat:", @"perfStatsMask=%u }", -[_ANEModel perfStatsMask](self, "perfStatsMask"));
  v52 = [v50 stringByAppendingString:v51];

  return v52;
}

- (_ANEModel)initWithModelIdentifier:(id)a3
{
  return [(_ANEModel *)self initWithModelAtURL:0 key:0 identifierSource:3 cacheURLIdentifier:a3 modelAttributes:MEMORY[0x1E4F1CC08] standardizeURL:0];
}

+ (id)modelWithCacheURLIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithModelIdentifier:v4];

  return v5;
}

+ (id)modelAtURLWithCacheURLIdentifier:(id)a3 key:(id)a4 cacheURLIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = +[_ANEModel correctFileURLFormat:a3];
  id v11 = objc_alloc((Class)a1);
  uint64_t v12 = (void *)[v11 initWithModelAtURL:v10 key:v9 identifierSource:3 cacheURLIdentifier:v8 modelAttributes:MEMORY[0x1E4F1CC08] standardizeURL:1];

  return v12;
}

+ (id)modelAtURLWithSourceURL:(id)a3 sourceURL:(id)a4 key:(id)a5 cacheURLIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = +[_ANEModel correctFileURLFormat:a3];
  id v14 = objc_alloc((Class)a1);
  __int16 v15 = [MEMORY[0x1E4F29128] UUID];
  LOBYTE(v19) = 1;
  LOBYTE(v18) = 1;
  id v16 = objc_msgSend(v14, "initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:", v13, v12, v15, v11, 1, v10, MEMORY[0x1E4F1CC08], v18, 0, v19);

  return v16;
}

+ (id)modelAtURLWithSourceURL:(id)a3 sourceURL:(id)a4 key:(id)a5 identifierSource:(int64_t)a6 cacheURLIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  __int16 v15 = +[_ANEModel correctFileURLFormat:a3];
  id v16 = objc_alloc((Class)a1);
  uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
  LOBYTE(v21) = 1;
  LOBYTE(v20) = 1;
  uint64_t v18 = objc_msgSend(v16, "initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:", v15, v14, v17, v13, a6, v12, MEMORY[0x1E4F1CC08], v20, 0, v21);

  return v18;
}

- (void)updateModelAttributes:(id)a3 state:(unint64_t)a4
{
  p_l = &self->_l;
  id v7 = a3;
  os_unfair_lock_lock(p_l);
  [(_ANEModel *)self setModelAttributes:v7];

  [(_ANEModel *)self setState:a4];
  os_unfair_lock_unlock(p_l);
}

- (void)resetOnUnload
{
  p_l = &self->_l;
  os_unfair_lock_lock(&self->_l);
  [(_ANEModel *)self setModelAttributes:MEMORY[0x1E4F1CC08]];
  [(_ANEModel *)self setState:4];
  [(_ANEModel *)self setProgramHandle:0];
  [(_ANEModel *)self setIntermediateBufferHandle:0];
  [(_ANEModel *)self setQueueDepth:0];
  os_unfair_lock_unlock(p_l);
}

- (id)procedureInfoForProcedureIndex:(unsigned int)a3
{
  p_l = &self->_l;
  os_unfair_lock_lock(&self->_l);
  objc_super v6 = [(_ANEModel *)self modelAttributes];
  id v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(p_l);
  id v8 = [v7 objectForKeyedSubscript:kANEFModelDescriptionKey[0]];
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 objectForKeyedSubscript:kANEFModelProceduresArrayKey[0]];
  objc_opt_class();
  id v13 = v12;
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44___ANEModel_procedureInfoForProcedureIndex___block_invoke;
  v18[3] = &unk_1E6C1C1D0;
  unsigned int v19 = a3;
  v18[4] = &v20;
  [v15 enumerateObjectsUsingBlock:v18];
  id v16 = (void *)[(id)v21[5] copy];
  _Block_object_dispose(&v20, 8);

  return v16;
}

- (id)symbolIndicesForProcedureIndex:(unsigned int)a3 indexArrayKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [(_ANEModel *)self procedureInfoForProcedureIndex:v4];
  id v9 = [MEMORY[0x1E4F28E60] indexSet];
  if (v8)
  {
    id v10 = [v8 objectForKeyedSubscript:v7];
    objc_opt_class();
    id v11 = v10;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v9, "addIndex:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "unsignedIntegerValue", (void)v22));
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v14 = +[_ANELog common];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v28 = v21;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2112;
      v32 = self;
      __int16 v33 = 1024;
      int v34 = v4;
      _os_log_debug_impl(&dword_1DB8AB000, v14, OS_LOG_TYPE_DEBUG, "%@: model[%p]=%@ missing procedure info for index=%d", buf, 0x26u);
    }
  }

  unsigned int v19 = (void *)[v9 copy];
  return v19;
}

- (id)inputSymbolIndicesForProcedureIndex:(unsigned int)a3
{
  return [(_ANEModel *)self symbolIndicesForProcedureIndex:*(void *)&a3 indexArrayKey:kANEFModelInputSymbolIndexArrayKey[0]];
}

- (id)outputSymbolIndicesForProcedureIndex:(unsigned int)a3
{
  return [(_ANEModel *)self symbolIndicesForProcedureIndex:*(void *)&a3 indexArrayKey:kANEFModelOutputSymbolIndexArrayKey[0]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[_ANELog common];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_ANEModel copyWithZone:](a2);
  }

  objc_super v6 = [(_ANEModel *)self cacheURLIdentifier];

  id v7 = objc_opt_class();
  if (v6)
  {
    id v8 = [(_ANEModel *)self cacheURLIdentifier];
    id v9 = [v7 modelWithCacheURLIdentifier:v8];
  }
  else
  {
    id v8 = [(_ANEModel *)self modelURL];
    id v10 = [(_ANEModel *)self key];
    id v11 = [(_ANEModel *)self modelAttributes];
    id v9 = [v7 modelAtURL:v8 key:v10 modelAttributes:v11];
  }
  return v9;
}

- (BOOL)isEqualToModel:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_30;
  }
  id v5 = [(_ANEModel *)self cacheURLIdentifier];
  if (v5)
  {
    int v6 = 0;
  }
  else
  {
    id v7 = [v4 cacheURLIdentifier];
    int v6 = v7 == 0;
  }
  id v8 = [(_ANEModel *)self modelURL];
  if (v8)
  {
    int v9 = 0;
  }
  else
  {
    id v10 = [v4 modelURL];
    int v9 = v10 == 0;
  }
  id v11 = [(_ANEModel *)self sourceURL];
  if (v11)
  {
    int v12 = 0;
  }
  else
  {
    id v13 = [v4 sourceURL];
    int v12 = v13 == 0;
  }
  id v14 = [(_ANEModel *)self key];
  if (v14)
  {
    char v15 = 0;
  }
  else
  {
    uint64_t v16 = [v4 key];
    char v15 = v16 == 0;
  }
  int64_t v17 = [(_ANEModel *)self identifierSource];
  uint64_t v18 = [v4 identifierSource];
  uint64_t v19 = [(_ANEModel *)self modelURL];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    uint64_t v21 = [v4 modelURL];

    if (v21)
    {
      long long v22 = [(_ANEModel *)self modelURL];
      long long v23 = [v4 modelURL];
      int v9 = [v22 isEqual:v23];
    }
  }
  uint64_t v24 = [(_ANEModel *)self sourceURL];
  if (v24)
  {
    long long v25 = (void *)v24;
    v26 = [v4 sourceURL];

    if (v26)
    {
      v27 = [(_ANEModel *)self sourceURL];
      v28 = [v4 sourceURL];
      int v12 = [v27 isEqual:v28];
    }
  }
  uint64_t v29 = [(_ANEModel *)self cacheURLIdentifier];
  if (v29)
  {
    v30 = (void *)v29;
    __int16 v31 = [v4 cacheURLIdentifier];

    if (v31)
    {
      v32 = [(_ANEModel *)self cacheURLIdentifier];
      __int16 v33 = [v4 cacheURLIdentifier];
      int v6 = [v32 isEqualToString:v33];
    }
  }
  uint64_t v34 = [(_ANEModel *)self key];
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    v36 = [v4 key];

    if (v36)
    {
      id v37 = [(_ANEModel *)self key];
      v38 = [v4 key];
      char v15 = [v37 isEqualToString:v38];
    }
  }
  if ((v9 & v12 & v6) == 1)
  {
    if (v17 == v18) {
      BOOL v39 = v15;
    }
    else {
      BOOL v39 = 0;
    }
  }
  else
  {
LABEL_30:
    BOOL v39 = 0;
  }

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_ANEModel *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_ANEModel *)self isEqualToModel:v5];

  return v6;
}

- (id)shallowCopy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(_ANEModel *)self modelURL];
  id v5 = [(_ANEModel *)self sourceURL];
  BOOL v6 = [(_ANEModel *)self UUID];
  id v7 = [(_ANEModel *)self key];
  int64_t v8 = [(_ANEModel *)self identifierSource];
  int v9 = [(_ANEModel *)self cacheURLIdentifier];
  unint64_t v10 = [(_ANEModel *)self string_id];
  LOBYTE(v14) = 0;
  LOBYTE(v13) = 0;
  id v11 = objc_msgSend(v3, "initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:", v4, v5, v6, v7, v8, v9, MEMORY[0x1E4F1CC08], v13, v10, v14);

  return v11;
}

- (unint64_t)hash
{
  id v3 = [(_ANEModel *)self modelURL];
  uint64_t v4 = [v3 hash];
  id v5 = [(_ANEModel *)self sourceURL];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(_ANEModel *)self key];
  uint64_t v8 = [v7 hash];
  int v9 = [(_ANEModel *)self cacheURLIdentifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (void)setString_id:(unint64_t)a3
{
  self->_string_id = a3;
}

- (char)queueDepth
{
  return self->_queueDepth;
}

- (void)setPerfStatsMask:(unsigned int)a3
{
  self->_perfStatsMask = a3;
}

- (os_unfair_lock_s)l
{
  return self->_l;
}

- (void)setL:(os_unfair_lock_s)a3
{
  self->_l = a3;
}

- (_ANEProgramForEvaluation)program
{
  return self->_program;
}

- (unint64_t)state
{
  return self->_state;
}

- (_ANEProgramIOSurfacesMapper)mapper
{
  return self->_mapper;
}

- (void)initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:.cold.1()
{
  OUTLINED_FUNCTION_2();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1DB8AB000, v2, v3, "%@: cacheURLIdentifier(%@) contains .., hence invalid", v4, v5, v6, v7, v8);
}

- (void)initWithModelAtURL:(const char *)a1 sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v2, v3, "%@: identifierSource is _ANEModelCacheURLIdentifierSource but cacheURLIdentifier is nil", v4, v5, v6, v7, v8);
}

- (void)initWithModelAtURL:(const char *)a1 sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v2, v3, "%@: identifierSource is _ANEModelIdentifierSourceURLAndKey but sourceURL is nil", v4, v5, v6, v7, v8);
}

- (void)initWithModelAtURL:(const char *)a1 sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  __error();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1DB8AB000, v2, v3, "%@: kdebug_trace_string() failed errno=%d", v4, v5, v6, v7, v8);
}

- (void)setCacheURLIdentifier:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7(&dword_1DB8AB000, v2, v3, "%@: cacheURLIdentifier is set already!", v4, v5, v6, v7, v8);
}

- (void)setCacheURLIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_2();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_1DB8AB000, v0, OS_LOG_TYPE_DEBUG, "%@: cacheURLIdentifier=%@", v3, 0x16u);
}

+ (void)correctFileURLFormat:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "+[_ANEModel correctFileURLFormat:]";
  _os_log_debug_impl(&dword_1DB8AB000, log, OS_LOG_TYPE_DEBUG, "%s modelURL is nil", (uint8_t *)&v1, 0xCu);
}

+ (void)correctFileURLFormat:.cold.2()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = NSStringFromSelector(v1);
  int v9 = [v0 scheme];
  OUTLINED_FUNCTION_2_1(&dword_1DB8AB000, v3, v4, "%@: modelURL.scheme: %@", v5, v6, v7, v8, 2u);
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = NSStringFromSelector(v1);
  [v0 identifierSource];
  OUTLINED_FUNCTION_0_3(&dword_1DB8AB000, v3, v4, "%@: identifierSource=%u", v5, v6, v7, v8, 2u);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  SEL v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3(&dword_1DB8AB000, v2, v3, "%@: identifierSource=%u", v4, v5, v6, v7, v8);
}

- (void)copyWithZone:(const char *)a1 .cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7(&dword_1DB8AB000, v2, v3, "%@", v4, v5, v6, v7, v8);
}

@end