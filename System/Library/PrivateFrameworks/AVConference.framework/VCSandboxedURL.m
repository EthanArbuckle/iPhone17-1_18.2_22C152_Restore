@interface VCSandboxedURL
+ (BOOL)supportsSecureCoding;
+ (id)deserialize:(id)a3;
+ (id)stringFromAccessType:(unsigned __int8)a3;
- (BOOL)issueSandboxExtensionForPath:(id)a3;
- (VCSandboxedURL)initWithCoder:(id)a3;
- (VCSandboxedURL)initWithURL:(id)a3 accessType:(unsigned __int8)a4;
- (const)extensionClass;
- (id)consumeToken;
- (id)description;
- (id)serialize;
- (void)consumeToken;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)serialize;
@end

@implementation VCSandboxedURL

- (const)extensionClass
{
  int accessType = self->_accessType;
  if (accessType == 2)
  {
    v5 = (const char **)MEMORY[0x1E4F14008];
    return *v5;
  }
  if (accessType == 1)
  {
    v5 = (const char **)MEMORY[0x1E4F14000];
    return *v5;
  }
  if (self->_accessType) {
    return 0;
  }
  result = 0;
  self->_tokenConsumed = 1;
  return result;
}

- (BOOL)issueSandboxExtensionForPath:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v5 = [(VCSandboxedURL *)self extensionClass];
  if (!v5) {
    goto LABEL_15;
  }
  [a3 UTF8String];
  uint64_t v6 = sandbox_extension_issue_file();
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSandboxedURL issueSandboxExtensionForPath:]();
      }
    }
    v5 = 0;
    goto LABEL_24;
  }
  v5 = (char *)v6;
  v7 = (NSString *)[[NSString alloc] initWithUTF8String:v6];
  self->_urlToken = v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSandboxedURL issueSandboxExtensionForPath:](v20);
      }
    }
LABEL_24:
    BOOL v18 = 0;
    goto LABEL_16;
  }
  if ((VCSandboxedURL *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_15;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    urlToken = self->_urlToken;
    int v21 = 136316162;
    uint64_t v22 = v9;
    __int16 v23 = 2080;
    v24 = "-[VCSandboxedURL issueSandboxExtensionForPath:]";
    __int16 v25 = 1024;
    int v26 = 64;
    __int16 v27 = 2112;
    v28 = (__CFString *)urlToken;
    __int16 v29 = 2112;
    v30 = a3;
    v12 = " [%s] %s:%d Successfully issued token=%@ for path=%@";
    v13 = v10;
    uint32_t v14 = 48;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v8 = (__CFString *)[(VCSandboxedURL *)self performSelector:sel_logPrefix];
    }
    else {
      v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_15;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v17 = self->_urlToken;
    int v21 = 136316674;
    uint64_t v22 = v15;
    __int16 v23 = 2080;
    v24 = "-[VCSandboxedURL issueSandboxExtensionForPath:]";
    __int16 v25 = 1024;
    int v26 = 64;
    __int16 v27 = 2112;
    v28 = v8;
    __int16 v29 = 2048;
    v30 = self;
    __int16 v31 = 2112;
    v32 = v17;
    __int16 v33 = 2112;
    id v34 = a3;
    v12 = " [%s] %s:%d %@(%p) Successfully issued token=%@ for path=%@";
    v13 = v16;
    uint32_t v14 = 68;
  }
  _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v21, v14);
LABEL_15:
  BOOL v18 = 1;
LABEL_16:
  free(v5);
  return v18;
}

- (VCSandboxedURL)initWithURL:(id)a3 accessType:(unsigned __int8)a4
{
  v4 = self;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  self->_urlTokenHandle = -1;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSandboxedURL initWithURL:accessType:](v12);
      }
    }
    goto LABEL_23;
  }
  if (a4 >= 3u)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSandboxedURL initWithURL:accessType:](v13, a4);
      }
    }
    goto LABEL_23;
  }
  uint64_t v6 = [a3 path];
  v18.receiver = v4;
  v18.super_class = (Class)VCSandboxedURL;
  v7 = (VCSandboxedURL *)[(VCSandboxedURL *)&v18 initFileURLWithPath:v6];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSandboxedURL initWithURL:accessType:](v14);
      }
    }
    v4 = 0;
    goto LABEL_23;
  }
  v4 = v7;
  v7->_int accessType = a4;
  if (![(VCSandboxedURL *)v7 issueSandboxExtensionForPath:v6])
  {
LABEL_23:

    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    asprintf(&__str, "Issued token for instance=%s", (const char *)objc_msgSend(-[VCSandboxedURL description](v4, "description"), "UTF8String"));
    if (__str)
    {
      __lasts = 0;
      v8 = strtok_r(__str, "\n", &__lasts);
      uint64_t v9 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v20 = v10;
            __int16 v21 = 2080;
            uint64_t v22 = "-[VCSandboxedURL initWithURL:accessType:]";
            __int16 v23 = 1024;
            int v24 = 91;
            __int16 v25 = 2080;
            int v26 = "";
            __int16 v27 = 2080;
            v28 = v8;
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v8 = strtok_r(0, "\n", &__lasts);
      }
      while (v8);
      free(__str);
    }
  }
  return v4;
}

+ (id)stringFromAccessType:(unsigned __int8)a3
{
  if (a3 > 2u) {
    v3 = "Invalid";
  }
  else {
    v3 = off_1E6DB7220[(char)a3];
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s(%hhu)", v3, a3);
}

- (id)description
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v12.receiver = self;
  v12.super_class = (Class)VCSandboxedURL;
  id v6 = [(VCSandboxedURL *)&v12 description];
  id v7 = +[VCSandboxedURL stringFromAccessType:self->_accessType];
  v8 = "YES";
  if (self->_urlToken) {
    uint64_t v9 = "YES";
  }
  else {
    uint64_t v9 = "NO";
  }
  if (self->_deserialized) {
    uint64_t v10 = "YES";
  }
  else {
    uint64_t v10 = "NO";
  }
  if (!self->_tokenConsumed) {
    v8 = "NO";
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Bad usage: deserializer never consumed the token.", v2, v3, v4, v5, v6);
}

- (id)consumeToken
{
  uint64_t v2 = (char **)self;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)self + 65)) {
    goto LABEL_16;
  }
  if (!*((unsigned char *)self + 64))
  {
    if ((id)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSandboxedURL consumeToken]();
        }
      }
      goto LABEL_47;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = (__CFString *)[v2 performSelector:sel_logPrefix];
    }
    else {
      __int16 v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_47;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    int v37 = 136316162;
    uint64_t v38 = v26;
    __int16 v39 = 2080;
    v40 = "-[VCSandboxedURL consumeToken]";
    __int16 v41 = 1024;
    int v42 = 138;
    __int16 v43 = 2112;
    v44 = v23;
    __int16 v45 = 2048;
    v46 = v2;
    v28 = " [%s] %s:%d %@(%p) Bad usage: attempting to consume a non-deserialized URL, we are within the issuing process.";
LABEL_43:
    v30 = v27;
    uint32_t v31 = 48;
    goto LABEL_49;
  }
  uint64_t v3 = (__CFString **)((char *)self + 48);
  uint64_t v4 = (void *)*((void *)self + 6);
  if (!v4)
  {
    if ((char **)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSandboxedURL consumeToken]();
        }
      }
      goto LABEL_47;
    }
    if (objc_opt_respondsToSelector()) {
      int v24 = (__CFString *)[v2 performSelector:sel_logPrefix];
    }
    else {
      int v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_47;
    }
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    int v37 = 136316162;
    uint64_t v38 = v29;
    __int16 v39 = 2080;
    v40 = "-[VCSandboxedURL consumeToken]";
    __int16 v41 = 1024;
    int v42 = 139;
    __int16 v43 = 2112;
    v44 = v24;
    __int16 v45 = 2048;
    v46 = v2;
    v28 = " [%s] %s:%d %@(%p) No urlToken on instance";
    goto LABEL_43;
  }
  [v4 UTF8String];
  uint64_t v5 = sandbox_extension_consume();
  v2[7] = (char *)v5;
  uint64_t v6 = objc_opt_class();
  if (v5 == -1)
  {
    if ((char **)v6 == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSandboxedURL consumeToken]();
        }
      }
      goto LABEL_47;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v25 = (__CFString *)[v2 performSelector:sel_logPrefix];
    }
    else {
      __int16 v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v32 = VRTraceErrorLogLevelToCSTR(),
          __int16 v33 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_47:
      self = 0;
      goto LABEL_16;
    }
    id v34 = *v3;
    uint64_t v35 = __error();
    v36 = strerror(*v35);
    int v37 = 136316674;
    uint64_t v38 = v32;
    __int16 v39 = 2080;
    v40 = "-[VCSandboxedURL consumeToken]";
    __int16 v41 = 1024;
    int v42 = 142;
    __int16 v43 = 2112;
    v44 = v25;
    __int16 v45 = 2048;
    v46 = v2;
    __int16 v47 = 2112;
    v48 = v34;
    __int16 v49 = 2080;
    v50 = v36;
    v28 = " [%s] %s:%d %@(%p) Failed to consume token=%@, error=%s";
    v30 = v33;
    uint32_t v31 = 68;
LABEL_49:
    _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v37, v31);
    goto LABEL_47;
  }
  if ((char **)v6 == v2)
  {
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    self = v2;
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      self = v2;
      if (v11)
      {
        objc_super v12 = *v3;
        uint64_t v13 = v2[7];
        int v37 = 136316162;
        uint64_t v38 = v9;
        __int16 v39 = 2080;
        v40 = "-[VCSandboxedURL consumeToken]";
        __int16 v41 = 1024;
        int v42 = 144;
        __int16 v43 = 2112;
        v44 = v12;
        __int16 v45 = 2048;
        v46 = (char **)v13;
        uint64_t v14 = " [%s] %s:%d Successfully consumed token=%@ yielding urlTokenHandle=%lld";
        uint64_t v15 = v10;
        uint32_t v16 = 48;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v37, v16);
        self = v2;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v7 = (__CFString *)[v2 performSelector:sel_logPrefix];
    }
    else {
      id v7 = &stru_1F3D3E450;
    }
    int v17 = VRTraceGetErrorLogLevelForModule();
    self = v2;
    if (v17 >= 6)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E4F47A50];
      BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      self = v2;
      if (v20)
      {
        __int16 v21 = v2[7];
        uint64_t v22 = *v3;
        int v37 = 136316674;
        uint64_t v38 = v18;
        __int16 v39 = 2080;
        v40 = "-[VCSandboxedURL consumeToken]";
        __int16 v41 = 1024;
        int v42 = 144;
        __int16 v43 = 2112;
        v44 = v7;
        __int16 v45 = 2048;
        v46 = v2;
        __int16 v47 = 2112;
        v48 = v22;
        __int16 v49 = 2048;
        v50 = v21;
        uint64_t v14 = " [%s] %s:%d %@(%p) Successfully consumed token=%@ yielding urlTokenHandle=%lld";
        uint64_t v15 = v19;
        uint32_t v16 = 68;
        goto LABEL_15;
      }
    }
  }
LABEL_16:
  *((unsigned char *)v2 + 65) = 1;
  return self;
}

- (id)serialize
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  __int16 v27 = 0;
  p_int accessType = &self->_accessType;
  if (self->_accessType - 1 >= 2)
  {
    if ((VCSandboxedURL *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          [(VCSandboxedURL *)v23 serialize];
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v22 = (__CFString *)[(VCSandboxedURL *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v22 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        __int16 v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = +[VCSandboxedURL stringFromAccessType:*p_accessType];
          *(_DWORD *)buf = 136316418;
          uint64_t v29 = v24;
          __int16 v30 = 2080;
          uint32_t v31 = "-[VCSandboxedURL serialize]";
          __int16 v32 = 1024;
          int v33 = 154;
          __int16 v34 = 2112;
          uint64_t v35 = (VCSandboxedURL *)v22;
          __int16 v36 = 2048;
          int v37 = self;
          __int16 v38 = 2112;
          __int16 v39 = v26;
          _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Can't serialize for configured accessType=%@", buf, 0x3Au);
        }
      }
    }
    return 0;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v27];
  if (v27)
  {
    if ((VCSandboxedURL *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_12;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      id v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v29 = v6;
      __int16 v30 = 2080;
      uint32_t v31 = "-[VCSandboxedURL serialize]";
      __int16 v32 = 1024;
      int v33 = 158;
      __int16 v34 = 2112;
      uint64_t v35 = self;
      __int16 v36 = 2112;
      int v37 = v27;
      v8 = " [%s] %s:%d Failed to serialize instance=%@, error=%@";
      uint64_t v9 = v7;
      uint32_t v10 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCSandboxedURL *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_12;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      objc_super v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v29 = v11;
      __int16 v30 = 2080;
      uint32_t v31 = "-[VCSandboxedURL serialize]";
      __int16 v32 = 1024;
      int v33 = 158;
      __int16 v34 = 2112;
      uint64_t v35 = (VCSandboxedURL *)v5;
      __int16 v36 = 2048;
      int v37 = self;
      __int16 v38 = 2112;
      __int16 v39 = self;
      __int16 v40 = 2112;
      __int16 v41 = v27;
      v8 = " [%s] %s:%d %@(%p) Failed to serialize instance=%@, error=%@";
      uint64_t v9 = v12;
      uint32_t v10 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
  }
LABEL_12:
  if ((VCSandboxedURL *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v29 = v14;
        __int16 v30 = 2080;
        uint32_t v31 = "-[VCSandboxedURL serialize]";
        __int16 v32 = 1024;
        int v33 = 161;
        __int16 v34 = 2112;
        uint64_t v35 = self;
        uint32_t v16 = " [%s] %s:%d Successfully serialized instance=%@";
        int v17 = v15;
        uint32_t v18 = 38;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCSandboxedURL *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      BOOL v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v29 = v19;
        __int16 v30 = 2080;
        uint32_t v31 = "-[VCSandboxedURL serialize]";
        __int16 v32 = 1024;
        int v33 = 161;
        __int16 v34 = 2112;
        uint64_t v35 = (VCSandboxedURL *)v13;
        __int16 v36 = 2048;
        int v37 = self;
        __int16 v38 = 2112;
        __int16 v39 = self;
        uint32_t v16 = " [%s] %s:%d %@(%p) Successfully serialized instance=%@";
        int v17 = v20;
        uint32_t v18 = 58;
        goto LABEL_22;
      }
    }
  }
  return v4;
}

+ (id)deserialize:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v4 = (__CFString *)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v24];
  uint64_t v5 = v24;
  id v6 = (id)objc_opt_class();
  if (v5)
  {
    if (v6 == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint32_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = v9;
      __int16 v27 = 2080;
      v28 = "+[VCSandboxedURL deserialize:]";
      __int16 v29 = 1024;
      int v30 = 171;
      __int16 v31 = 2112;
      __int16 v32 = v4;
      __int16 v33 = 2112;
      id v34 = v24;
      uint64_t v11 = " [%s] %s:%d Failed to deserialize instance=%@, error=%@";
      objc_super v12 = v10;
      uint32_t v13 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v7 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        id v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      v28 = "+[VCSandboxedURL deserialize:]";
      __int16 v29 = 1024;
      int v30 = 171;
      __int16 v31 = 2112;
      __int16 v32 = v7;
      __int16 v33 = 2048;
      id v34 = a1;
      __int16 v35 = 2112;
      __int16 v36 = v4;
      __int16 v37 = 2112;
      __int16 v38 = v24;
      uint64_t v11 = " [%s] %s:%d %@(%p) Failed to deserialize instance=%@, error=%@";
      objc_super v12 = v15;
      uint32_t v13 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return 0;
  }
  if (v6 == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint32_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v26 = v17;
        __int16 v27 = 2080;
        v28 = "+[VCSandboxedURL deserialize:]";
        __int16 v29 = 1024;
        int v30 = 175;
        __int16 v31 = 2112;
        __int16 v32 = v4;
        uint64_t v19 = " [%s] %s:%d Successfully deserialized instance=%@";
        BOOL v20 = v18;
        uint32_t v21 = 38;
LABEL_23:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v8 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v26 = v22;
        __int16 v27 = 2080;
        v28 = "+[VCSandboxedURL deserialize:]";
        __int16 v29 = 1024;
        int v30 = 175;
        __int16 v31 = 2112;
        __int16 v32 = v8;
        __int16 v33 = 2048;
        id v34 = a1;
        __int16 v35 = 2112;
        __int16 v36 = v4;
        uint64_t v19 = " [%s] %s:%d %@(%p) Successfully deserialized instance=%@";
        BOOL v20 = v23;
        uint32_t v21 = 58;
        goto LABEL_23;
      }
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_tokenConsumed)
  {
    if ((VCSandboxedURL *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSandboxedURL encodeWithCoder:](v6);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[(VCSandboxedURL *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int64_t urlTokenHandle = self->_urlTokenHandle;
          *(_DWORD *)buf = 136316418;
          uint64_t v12 = v7;
          __int16 v13 = 2080;
          uint64_t v14 = "-[VCSandboxedURL encodeWithCoder:]";
          __int16 v15 = 1024;
          int v16 = 203;
          __int16 v17 = 2112;
          uint32_t v18 = v4;
          __int16 v19 = 2048;
          BOOL v20 = self;
          __int16 v21 = 2048;
          int64_t v22 = urlTokenHandle;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Bad usage: attempting to encode with a tokenHandle=%lld, we are within the consuming process.", buf, 0x3Au);
        }
      }
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VCSandboxedURL;
    -[VCSandboxedURL encodeWithCoder:](&v10, sel_encodeWithCoder_);
    [a3 encodeBytes:&self->_accessType length:1 forKey:@"VCSandboxedURL_AccessType"];
    [a3 encodeObject:self->_urlToken forKey:@"VCSandboxedURL_URLToken"];
  }
}

- (VCSandboxedURL)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)VCSandboxedURL;
  uint64_t v4 = -[VCSandboxedURL initWithCoder:](&v28, sel_initWithCoder_);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSandboxedURL initWithCoder:]();
      }
    }
    goto LABEL_62;
  }
  if (([a3 containsValueForKey:@"VCSandboxedURL_AccessType"] & 1) == 0)
  {
    if ((VCSandboxedURL *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSandboxedURL initWithCoder:].cold.5();
        }
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[(VCSandboxedURL *)v4 performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_62;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    int64_t v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v21;
    __int16 v31 = 2080;
    __int16 v32 = "-[VCSandboxedURL initWithCoder:]";
    __int16 v33 = 1024;
    int v34 = 216;
    __int16 v35 = 2112;
    __int16 v36 = v17;
    __int16 v37 = 2048;
    __int16 v38 = v4;
    uint64_t v23 = " [%s] %s:%d %@(%p) Failed to contain accessType";
    goto LABEL_64;
  }
  if (([a3 containsValueForKey:@"VCSandboxedURL_URLToken"] & 1) == 0)
  {
    if ((VCSandboxedURL *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSandboxedURL initWithCoder:].cold.4();
        }
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      uint32_t v18 = (__CFString *)[(VCSandboxedURL *)v4 performSelector:sel_logPrefix];
    }
    else {
      uint32_t v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_62;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    int64_t v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v24;
    __int16 v31 = 2080;
    __int16 v32 = "-[VCSandboxedURL initWithCoder:]";
    __int16 v33 = 1024;
    int v34 = 217;
    __int16 v35 = 2112;
    __int16 v36 = v18;
    __int16 v37 = 2048;
    __int16 v38 = v4;
    uint64_t v23 = " [%s] %s:%d %@(%p) Failed to contain urlToken";
    goto LABEL_64;
  }
  uint64_t v27 = 0;
  uint64_t v5 = (unsigned __int8 *)[a3 decodeBytesForKey:@"VCSandboxedURL_AccessType" returnedLength:&v27];
  if (v27 != 1)
  {
    if ((VCSandboxedURL *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSandboxedURL initWithCoder:]();
        }
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v19 = (__CFString *)[(VCSandboxedURL *)v4 performSelector:sel_logPrefix];
    }
    else {
      __int16 v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_62;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    int64_t v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v25;
    __int16 v31 = 2080;
    __int16 v32 = "-[VCSandboxedURL initWithCoder:]";
    __int16 v33 = 1024;
    int v34 = 220;
    __int16 v35 = 2112;
    __int16 v36 = v19;
    __int16 v37 = 2048;
    __int16 v38 = v4;
    uint64_t v23 = " [%s] %s:%d %@(%p) Failed to decode accessType";
    goto LABEL_64;
  }
  int v6 = *v5;
  v4->_int accessType = v6;
  if (!v6) {
    v4->_tokenConsumed = 1;
  }
  uint64_t v7 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"VCSandboxedURL_URLToken"];
  v4->_urlToken = v7;
  if (!v7)
  {
    if ((VCSandboxedURL *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSandboxedURL initWithCoder:]();
        }
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v20 = (__CFString *)[(VCSandboxedURL *)v4 performSelector:sel_logPrefix];
    }
    else {
      BOOL v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v26 = VRTraceErrorLogLevelToCSTR(),
          int64_t v22 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_62:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v26;
    __int16 v31 = 2080;
    __int16 v32 = "-[VCSandboxedURL initWithCoder:]";
    __int16 v33 = 1024;
    int v34 = 227;
    __int16 v35 = 2112;
    __int16 v36 = v20;
    __int16 v37 = 2048;
    __int16 v38 = v4;
    uint64_t v23 = " [%s] %s:%d %@(%p) Failed to decode urlToken";
LABEL_64:
    _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x30u);
    goto LABEL_62;
  }
  v4->_deserialized = 1;
  if ((VCSandboxedURL *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      objc_super v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v30 = v9;
        __int16 v31 = 2080;
        __int16 v32 = "-[VCSandboxedURL initWithCoder:]";
        __int16 v33 = 1024;
        int v34 = 231;
        __int16 v35 = 2112;
        __int16 v36 = v4;
        uint64_t v11 = " [%s] %s:%d Successfully deserialized instance=%@";
        uint64_t v12 = v10;
        uint32_t v13 = 38;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v8 = (__CFString *)[(VCSandboxedURL *)v4 performSelector:sel_logPrefix];
    }
    else {
      v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v30 = v14;
        __int16 v31 = 2080;
        __int16 v32 = "-[VCSandboxedURL initWithCoder:]";
        __int16 v33 = 1024;
        int v34 = 231;
        __int16 v35 = 2112;
        __int16 v36 = v8;
        __int16 v37 = 2048;
        __int16 v38 = v4;
        __int16 v39 = 2112;
        __int16 v40 = v4;
        uint64_t v11 = " [%s] %s:%d %@(%p) Successfully deserialized instance=%@";
        uint64_t v12 = v15;
        uint32_t v13 = 58;
        goto LABEL_18;
      }
    }
  }
  return v4;
}

- (void)issueSandboxExtensionForPath:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_11(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to issue token for path=%@, error=%s", v3, v4, v5, v6, 2u);
}

- (void)issueSandboxExtensionForPath:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v4) = 136315906;
  *(void *)((char *)&v4 + 4) = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  LODWORD(v6) = 63;
  WORD2(v6) = v1;
  HIWORD(v6) = v2;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Failed to allocate string for token=%s", (const char *)v4, *((const char **)&v4 + 1), v5, v6);
}

- (void)initWithURL:(uint64_t)a1 accessType:.cold.1(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_5_1();
  long long v4 = "-[VCSandboxedURL initWithURL:accessType:]";
  OUTLINED_FUNCTION_3();
  int v5 = 75;
  __int16 v6 = 2112;
  uint64_t v7 = 0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid url=%@", (uint8_t *)&v2, 0x26u);
}

- (void)initWithURL:(uint64_t)a1 accessType:(unsigned __int8)a2 .cold.2(uint64_t a1, unsigned __int8 a2)
{
  +[VCSandboxedURL stringFromAccessType:a2];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Invalid accessType=%@", v4, v5, v6, v7, 2u);
}

- (void)initWithURL:(uint64_t)a1 accessType:.cold.3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  LODWORD(v3) = 136315906;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)uint64_t v4 = "-[VCSandboxedURL initWithURL:accessType:]";
  OUTLINED_FUNCTION_3();
  LODWORD(v5) = 80;
  WORD2(v5) = 2112;
  *(void *)((char *)&v5 + 6) = v1;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to initialize instance for path=%@", (void)v3, DWORD2(v3), *(void *)&v4[2], v5, v6);
}

- (void)consumeToken
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_11(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to consume token=%@, error=%s", v3, v4, v5, v6, 2u);
}

- (void)serialize
{
  +[VCSandboxedURL stringFromAccessType:*a2];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Can't serialize for configured accessType=%@", v4, v5, v6, v7, 2u);
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v4) = 136315906;
  *(void *)((char *)&v4 + 4) = a1;
  WORD6(v4) = 2080;
  OUTLINED_FUNCTION_8();
  LODWORD(v6) = 203;
  WORD2(v6) = 2048;
  HIWORD(v6) = v1;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Bad usage: attempting to encode with a tokenHandle=%lld, we are within the consuming process.", (const char *)v4, *((const char **)&v4 + 1), v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode super instance", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode urlToken", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode accessType", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to contain urlToken", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to contain accessType", v2, v3, v4, v5, v6);
}

@end