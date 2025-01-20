@interface AVTAvatarDescriptor
+ (BOOL)_canLoadDataRepresentationWithVersion:(unsigned __int16)a3 minimumCompatibleVersion:(unsigned __int16)a4 error:(id *)a5;
+ (BOOL)canLoadDataRepresentation:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_descriptorWithDictionaryRepresentation:(id)a3 error:(id *)a4;
+ (id)_dictionaryRepresentationFromDataRepresentation:(id)a3 error:(id *)a4;
+ (id)dataRepresentationFromUnsecureDataRepresentation:(id)a3 error:(id *)a4;
+ (id)descriptorWithDataRepresentation:(id)a3 error:(id *)a4;
+ (id)descriptorWithURL:(id)a3 error:(id *)a4;
+ (unsigned)classIdentifier;
+ (void)classIdentifier;
- (AVTAvatarDescriptor)initWithCoder:(id)a3;
- (AVTAvatarDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (void)encodeInDictionaryRepresentation:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVTAvatarDescriptor

- (id)dataRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:&unk_26C00C478 forKeyedSubscript:@"version"];
  [v3 setObject:&unk_26C00C478 forKeyedSubscript:@"minVersion"];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend((id)objc_opt_class(), "classIdentifier"));
  [v3 setObject:v4 forKeyedSubscript:@"class"];

  [(AVTAvatarDescriptor *)self encodeInDictionaryRepresentation:v3];
  v5 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:0];

  return v5;
}

+ (id)_dictionaryRepresentationFromDataRepresentation:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v19 = 0;
    v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:&v19];
    id v7 = v19;
    v8 = v7;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v6;
LABEL_13:

        goto LABEL_14;
      }
      if (a4)
      {
        v11 = (void *)MEMORY[0x263F087E8];
        uint64_t v20 = *MEMORY[0x263F08320];
        v21 = @"Recipe is invalid";
        v13 = NSDictionary;
        v14 = &v21;
        v15 = &v20;
        uint64_t v16 = 1;
        goto LABEL_11;
      }
    }
    else if (a4)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F08608];
      v22[0] = *MEMORY[0x263F08320];
      v22[1] = v12;
      v23[0] = @"Data is not a JSON object";
      v23[1] = v7;
      v13 = NSDictionary;
      v14 = (__CFString **)v23;
      v15 = v22;
      uint64_t v16 = 2;
LABEL_11:
      v17 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
      *a4 = [v11 errorWithDomain:@"AVTErrorDomain" code:3 userInfo:v17];
    }
    id v9 = 0;
    goto LABEL_13;
  }
  if (a4)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = @"There's no data to load";
    v8 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [v10 errorWithDomain:@"AVTErrorDomain" code:3 userInfo:v8];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  id v9 = 0;
LABEL_15:

  return v9;
}

+ (BOOL)_canLoadDataRepresentationWithVersion:(unsigned __int16)a3 minimumCompatibleVersion:(unsigned __int16)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  if (a3 <= 6u)
  {
    if (a5)
    {
      v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F08320];
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Recipe is too old (%d < %d)", a4, a3, 7);
      v16[0] = v7;
      v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v9 = v6;
      uint64_t v10 = 1;
LABEL_7:
      *a5 = [v9 errorWithDomain:@"AVTErrorDomain" code:v10 userInfo:v8];

      return 0;
    }
    return 0;
  }
  if (a4 >= 0xDu)
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F08320];
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Recipe is too new (%d > %d)", a4, 12);
      v14 = v7;
      v8 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v9 = v11;
      uint64_t v10 = 2;
      goto LABEL_7;
    }
    return 0;
  }
  return 1;
}

+ (BOOL)canLoadDataRepresentation:(id)a3
{
  v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v9 = 0;
    id v5 = objc_msgSend(v4, "avt_objectForKey:ofClass:didFail:error:", @"minVersion", objc_opt_class(), &v9, 0);
    v6 = objc_msgSend(v4, "avt_objectForKey:ofClass:didFail:error:", @"version", objc_opt_class(), &v9, 0);
    char v7 = 0;
    if (!v9) {
      char v7 = objc_msgSend(a1, "_canLoadDataRepresentationWithVersion:minimumCompatibleVersion:error:", (unsigned __int16)objc_msgSend(v6, "intValue"), (unsigned __int16)objc_msgSend(v5, "intValue"), 0);
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)_descriptorWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  char v14 = 0;
  v6 = objc_msgSend(v5, "avt_objectForKey:ofClass:didFail:error:", @"minVersion", objc_opt_class(), &v14, a4);
  char v7 = objc_msgSend(v5, "avt_objectForKey:ofClass:didFail:error:", @"version", objc_opt_class(), &v14, a4);
  if (!v14
    && objc_msgSend((id)objc_opt_class(), "_canLoadDataRepresentationWithVersion:minimumCompatibleVersion:error:", (unsigned __int16)objc_msgSend(v7, "intValue"), (unsigned __int16)objc_msgSend(v6, "intValue"), a4))
  {
    v8 = objc_msgSend(v5, "avt_objectForKey:ofClass:didFail:error:", @"class", objc_opt_class(), &v14, a4);
    char v9 = v8;
    if (v14)
    {
LABEL_5:
      uint64_t v10 = 0;
LABEL_17:

      goto LABEL_8;
    }
    int v12 = [v8 intValue];
    if (v12 == 1)
    {
      uint64_t v13 = off_26401EC58;
    }
    else
    {
      if (v12 != 2) {
        goto LABEL_5;
      }
      uint64_t v13 = off_26401ECD0;
    }
    uint64_t v10 = (void *)[objc_alloc(*v13) initWithDictionaryRepresentation:v5 error:a4];
    goto LABEL_17;
  }
  uint64_t v10 = 0;
LABEL_8:

LABEL_9:
  return v10;
}

+ (id)descriptorWithURL:(id)a3 error:(id *)a4
{
  v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3 options:1 error:a4];
  if (v6)
  {
    char v7 = [a1 descriptorWithDataRepresentation:v6 error:a4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)descriptorWithDataRepresentation:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(a1, "_dictionaryRepresentationFromDataRepresentation:error:", a3);
  char v7 = [a1 _descriptorWithDictionaryRepresentation:v6 error:a4];

  return v7;
}

+ (id)dataRepresentationFromUnsecureDataRepresentation:(id)a3 error:(id *)a4
{
  v4 = [a1 descriptorWithDataRepresentation:a3 error:a4];
  id v5 = [v4 dataRepresentation];

  return v5;
}

+ (unsigned)classIdentifier
{
  v2 = avt_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    +[AVTAvatarDescriptor classIdentifier];
  }

  return 0;
}

- (void)encodeInDictionaryRepresentation:(id)a3
{
  uint64_t v3 = avt_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[AVTAvatarDescriptor encodeInDictionaryRepresentation:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (AVTAvatarDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v5 = avt_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[AVTAvatarDescriptor initWithDictionaryRepresentation:error:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = avt_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[AVTAvatarDescriptor copyWithZone:](v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  [v3 encodeInteger:12 forKey:@"version"];
  [v3 encodeInteger:12 forKey:@"minVersion"];
}

- (AVTAvatarDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"version"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"minVersion"];

  if (v5 > 6)
  {
    if (v6 < 13)
    {
      uint64_t v8 = self;
      goto LABEL_9;
    }
    uint64_t v7 = avt_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AVTAvatarDescriptor initWithCoder:]();
    }
  }
  else
  {
    uint64_t v7 = avt_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AVTAvatarDescriptor initWithCoder:]();
    }
  }

  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

+ (void)classIdentifier
{
}

- (void)encodeInDictionaryRepresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_3();
  int v2 = 7;
  _os_log_error_impl(&dword_20B819000, v0, OS_LOG_TYPE_ERROR, "Error: Recipe is too old (%u < %d)", v1, 0xEu);
}

- (void)initWithCoder:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_3();
  int v2 = 12;
  _os_log_error_impl(&dword_20B819000, v0, OS_LOG_TYPE_ERROR, "Error: Recipe is too new (%u > %d)", v1, 0xEu);
}

@end