@interface ASDStreamDSPConfiguration
- (ASDDSPConfiguration)hardwareDSP;
- (ASDStreamDSPConfiguration)initWithDictionary:(id)a3 resourcePath:(id)a4;
@end

@implementation ASDStreamDSPConfiguration

- (ASDStreamDSPConfiguration)initWithDictionary:(id)a3 resourcePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ASDStreamDSPConfiguration;
  v8 = [(ASDStreamDSPConfiguration *)&v21 init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"Hardware"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[ASDDSPConfiguration alloc] initWithArray:v9 resourcePath:v7];
      hardwareDSP = v8->_hardwareDSP;
      v8->_hardwareDSP = v10;

      if (!v8->_hardwareDSP)
      {
        BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v12) {
          -[ASDStreamDSPConfiguration initWithDictionary:resourcePath:](v12, v13, v14, v15, v16, v17, v18, v19);
        }

        v8 = 0;
      }
    }
  }
  return v8;
}

- (ASDDSPConfiguration)hardwareDSP
{
  return self->_hardwareDSP;
}

- (void).cxx_destruct
{
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end