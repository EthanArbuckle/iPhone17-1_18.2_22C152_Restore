@interface BAURLDownload
+ (BOOL)supportsSecureCoding;
- (BAURLDownload)init;
- (BAURLDownload)initWithCoder:(id)a3;
- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier;
- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority;
- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request essential:(BOOL)essential fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority;
- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier;
- (NSURLRequest)request;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setRequest:(id)a3;
- (void)syncTo:(id)a3;
@end

@implementation BAURLDownload

- (void)syncTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Non BAURLDownload passed to syncTo for BAURLDownload" userInfo:0];
    [v5 raise];
  }
  v6 = [v4 request];
  [(BAURLDownload *)self setRequest:v6];

  v7.receiver = self;
  v7.super_class = (Class)BAURLDownload;
  [(BADownload *)&v7 syncTo:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAURLDownload)init
{
  result = (BAURLDownload *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    id v4 = "BAURLDownload cannot be constructed using -init.";
    _os_log_fault_impl(&dword_226E14000, &_os_log_internal, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BAURLDownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier
{
  return [(BAURLDownload *)self initWithIdentifier:identifier request:request essential:0 fileSize:fileSize applicationGroupIdentifier:applicationGroupIdentifier priority:0];
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request essential:(BOOL)essential fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority
{
  BOOL v11 = essential;
  v14 = identifier;
  v15 = request;
  v16 = applicationGroupIdentifier;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (void *)MEMORY[0x263EFF940];
    uint64_t v23 = *MEMORY[0x263EFF4A0];
    v24 = @"request must be a URLRequest.";
    goto LABEL_7;
  }
  v17 = [(NSURLRequest *)v15 URL];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v22 = (void *)MEMORY[0x263EFF940];
    uint64_t v23 = *MEMORY[0x263EFF4A0];
    v24 = @"request must have a valid URL.";
    goto LABEL_7;
  }
  v19 = [(NSURLRequest *)v15 URL];
  v20 = [v19 scheme];
  uint64_t v21 = [v20 caseInsensitiveCompare:@"https"];

  if (v21)
  {
    v22 = (void *)MEMORY[0x263EFF940];
    uint64_t v23 = *MEMORY[0x263EFF4A0];
    v24 = @"request can only download over HTTPS.";
LABEL_7:
    v25 = [v22 exceptionWithName:v23 reason:v24 userInfo:0];
    [v25 raise];

    v26 = 0;
    goto LABEL_8;
  }
  if (([(id)objc_opt_class() supportsSecureCoding] & 1) == 0)
  {
    v22 = (void *)MEMORY[0x263EFF940];
    uint64_t v23 = *MEMORY[0x263EFF4A0];
    v24 = @"request must be secure coding compliant.";
    goto LABEL_7;
  }
  if (!v14)
  {
    v28 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"identifier can not be nil" userInfo:0];
    [v28 raise];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"identifier must be a string." userInfo:0];
    [v29 raise];
  }
  v32.receiver = self;
  v32.super_class = (Class)BAURLDownload;
  id v30 = [(BADownload *)&v32 initPrivatelyWithApplicationGroupIdentifier:v16];
  v31 = v30;
  if (v30)
  {
    [v30 setRequest:v15];
    [v31 setIdentifier:v14];
    [v31 setNecessity:v11];
    [v31 setPriority:priority];
    -[BADownload setClientSpecifiedFileSize:](v31, fileSize);
  }
  self = v31;
  v26 = self;
LABEL_8:

  return v26;
}

- (BAURLDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BAURLDownload;
  v5 = [(BADownload *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request"];
    [(BAURLDownload *)v5 setRequest:v6];
  }
  return v5;
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier
{
  return [(BAURLDownload *)self initWithIdentifier:identifier request:request essential:0 fileSize:0 applicationGroupIdentifier:applicationGroupIdentifier priority:0];
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority
{
  return [(BAURLDownload *)self initWithIdentifier:identifier request:request essential:0 fileSize:0 applicationGroupIdentifier:applicationGroupIdentifier priority:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BAURLDownload;
  id v4 = [(BADownload *)&v7 copyWithZone:a3];
  v5 = [(BAURLDownload *)self request];
  [v4 setRequest:v5];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BAURLDownload *)self request];
  [v4 encodeObject:v5 forKey:@"request"];

  v6.receiver = self;
  v6.super_class = (Class)BAURLDownload;
  [(BADownload *)&v6 encodeWithCoder:v4];
}

- (id)debugDescription
{
  v8.receiver = self;
  v8.super_class = (Class)BAURLDownload;
  int v3 = [(BADownload *)&v8 debugDescription];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(BAURLDownload *)self request];
  objc_super v6 = [v5 URL];
  [v4 appendFormat:@"URL: %@\n", v6];

  return v4;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end