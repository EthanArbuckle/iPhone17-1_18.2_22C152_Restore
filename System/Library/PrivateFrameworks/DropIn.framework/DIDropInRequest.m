@interface DIDropInRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DIDropInRequest)initWithCoder:(id)a3;
- (DIDropInRequest)initWithDevice:(id)a3;
- (DIDropInRequest)initWithHandle:(id)a3 connectionManager:(id)a4;
- (DIHandle)handle;
- (DIXPCConnectionManager)connectionManager;
- (NSUUID)existingSessionIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConnectionManager:(id)a3;
- (void)setExistingSessionIdentifier:(id)a3;
- (void)setHandle:(id)a3;
@end

@implementation DIDropInRequest

- (DIDropInRequest)initWithDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DILogHandleDropInRequest();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    v14 = &stru_26FF62CC0;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Creating Request with device %@", (uint8_t *)&v13, 0x16u);
  }

  v6 = [v4 homeKitIdentifier];
  if (v6)
  {
    v7 = [v4 homeKitIdentifier];
    v8 = [v7 UUIDString];
  }
  else
  {
    v8 = &stru_26FF62CC0;
  }

  v9 = [[DIHandle alloc] initWithType:0 value:v8];
  v10 = [v4 connectionManager];
  v11 = [(DIDropInRequest *)self initWithHandle:v9 connectionManager:v10];

  return v11;
}

- (DIDropInRequest)initWithHandle:(id)a3 connectionManager:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DIDropInRequest;
  v9 = [(DIDropInRequest *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handle, a3);
    objc_storeWeak((id *)&v10->_connectionManager, v8);
  }
  v11 = DILogHandleDropInRequest();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v15 = &stru_26FF62CC0;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_24D00D000, v11, OS_LOG_TYPE_DEFAULT, "%@Created Request %@", buf, 0x16u);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DIDropInRequest *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(DIDropInRequest *)self handle];
      id v7 = [(DIDropInRequest *)v5 handle];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(DIDropInRequest *)self handle];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DIDropInRequest *)self handle];
  v6 = [v3 stringWithFormat:@"<%@: %p> Handle = [%@]", v4, self, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DIDropInRequest *)self handle];
  [v4 encodeObject:v5 forKey:@"Handle"];

  id v6 = [(DIDropInRequest *)self existingSessionIdentifier];
  [v4 encodeObject:v6 forKey:@"ExistingSessionIdentifier"];
}

- (DIDropInRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DIDropInRequest *)self init];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Handle"];
  if (v6)
  {
    [(DIDropInRequest *)v5 setHandle:v6];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExistingSessionIdentifier"];
    [(DIDropInRequest *)v5 setExistingSessionIdentifier:v7];

LABEL_4:
    id v6 = v5;
  }

  return v6;
}

- (DIHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (DIXPCConnectionManager)connectionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionManager);
  return (DIXPCConnectionManager *)WeakRetained;
}

- (void)setConnectionManager:(id)a3
{
}

- (NSUUID)existingSessionIdentifier
{
  return self->_existingSessionIdentifier;
}

- (void)setExistingSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingSessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end