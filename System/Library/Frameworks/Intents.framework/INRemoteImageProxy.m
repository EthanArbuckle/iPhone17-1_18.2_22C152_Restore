@interface INRemoteImageProxy
+ (BOOL)supportsSecureCoding;
+ (id)proxyImageSynchronously:(id)a3 usingService:(id)a4 error:(id *)a5;
+ (id)requestProxyByStoringImage:(id)a3 qualityOfService:(unsigned int)a4 scaled:(BOOL)a5 storeType:(unint64_t)a6 error:(id *)a7;
+ (void)requestProxyByStoringImage:(id)a3 qualityOfService:(unsigned int)a4 scaled:(BOOL)a5 storeType:(unint64_t)a6 completion:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (INRemoteImageProxy)initWithCoder:(id)a3;
- (NSString)_proxyIdentifier;
- (NSString)_storageServiceIdentifier;
- (id)_URLRepresentation;
- (id)_copyWithSubclass:(Class)a3;
- (id)_dictionaryRepresentation;
- (id)_identifier;
- (id)_initWithURLRepresentation:(id)a3;
- (id)retrieveProxiedImageSynchronouslyUsingService:(id)a3 error:(id *)a4;
- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5;
- (void)_retrieveFilePathWithCompletion:(id)a3;
- (void)_retrieveImageDataWithReply:(id)a3;
- (void)_setProxyIdentifier:(id)a3;
- (void)_setStorageServiceIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)filePathFromService:(id)a3 reply:(id)a4;
- (void)purgeStoredImageWithCompletion:(id)a3;
- (void)unproxyImageFromService:(id)a3 reply:(id)a4;
@end

@implementation INRemoteImageProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyIdentifier, 0);

  objc_storeStrong((id *)&self->_storageServiceIdentifier, 0);
}

- (void)_setProxyIdentifier:(id)a3
{
}

- (NSString)_proxyIdentifier
{
  return self->_proxyIdentifier;
}

- (void)_setStorageServiceIdentifier:(id)a3
{
}

- (NSString)_storageServiceIdentifier
{
  return self->_storageServiceIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INRemoteImageProxy;
  id v4 = a3;
  [(INImage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_storageServiceIdentifier, @"_storageServiceIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_proxyIdentifier forKey:@"_proxyIdentifier"];
}

- (INRemoteImageProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INRemoteImageProxy;
  objc_super v5 = [(INImage *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_storageServiceIdentifier"];
    [(INRemoteImageProxy *)v5 _setStorageServiceIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxyIdentifier"];
    [(INRemoteImageProxy *)v5 _setProxyIdentifier:v7];
  }
  return v5;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"proxyIdentifier";
  proxyIdentifier = self->_proxyIdentifier;
  id v4 = proxyIdentifier;
  if (!proxyIdentifier)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"storageServiceIdentifier";
  v10[0] = v4;
  storageServiceIdentifier = self->_storageServiceIdentifier;
  v6 = storageServiceIdentifier;
  if (!storageServiceIdentifier)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (storageServiceIdentifier)
  {
    if (proxyIdentifier) {
      goto LABEL_7;
    }
  }
  else
  {

    if (proxyIdentifier) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (void)_retrieveImageDataWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = +[INImageServiceRegistry sharedInstance];
    v6 = [v5 imageStorageServiceForServiceIdentifier:self->_storageServiceIdentifier];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__INRemoteImageProxy__retrieveImageDataWithReply___block_invoke;
    v7[3] = &unk_1E551BC00;
    id v8 = v4;
    [(INRemoteImageProxy *)self unproxyImageFromService:v6 reply:v7];
  }
}

uint64_t __50__INRemoteImageProxy__retrieveImageDataWithReply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    return (*(uint64_t (**)(void, void))(v3 + 16))(*(void *)(a1 + 32), 0);
  }
  else {
    return [a2 _retrieveImageDataWithReply:v3];
  }
}

- (id)retrieveProxiedImageSynchronouslyUsingService:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 serviceIdentifier];
  id v8 = [(INRemoteImageProxy *)self _storageServiceIdentifier];
  if ([v7 isEqualToString:v8])
  {
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(INRemoteImageProxy *)self _proxyIdentifier];
      v11 = [v6 retrieveImageSynchronouslyForIdentifier:v10 error:a4];

      goto LABEL_8;
    }
  }
  else
  {
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:6004 userInfo:0];
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_8:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v11.receiver = self,
        v11.super_class = (Class)INRemoteImageProxy,
        [(INImage *)&v11 isEqual:v4]))
  {
    objc_super v5 = [(INRemoteImageProxy *)self _proxyIdentifier];
    id v6 = [v4 _proxyIdentifier];
    if ([v5 isEqualToString:v6])
    {
      v7 = [(INRemoteImageProxy *)self _storageServiceIdentifier];
      id v8 = [v4 _storageServiceIdentifier];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)_copyWithSubclass:(Class)a3
{
  v11.receiver = self;
  v11.super_class = (Class)INRemoteImageProxy;
  id v4 = [(INImage *)&v11 _copyWithSubclass:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(INRemoteImageProxy *)self _proxyIdentifier];
    [v5 _setProxyIdentifier:v6];

    v7 = [(INRemoteImageProxy *)self _storageServiceIdentifier];
    [v5 _setStorageServiceIdentifier:v7];
  }
  else
  {
    id v5 = 0;
  }
  if (v5) {
    id v8 = v5;
  }
  else {
    id v8 = v4;
  }
  id v9 = v8;

  return v9;
}

- (BOOL)isValid
{
  return self->_proxyIdentifier && self->_storageServiceIdentifier != 0;
}

- (void)unproxyImageFromService:(id)a3 reply:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(INRemoteImageProxy *)self isValid])
    {
      if (v6)
      {
        id v8 = (void *)INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          id v9 = v8;
          v10 = [(INImage *)self _description];
          *(_DWORD *)buf = 136315650;
          v28 = "-[INRemoteImageProxy unproxyImageFromService:reply:]";
          __int16 v29 = 2112;
          id v30 = v6;
          __int16 v31 = 2112;
          v32 = v10;
          _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s Attempting to retrieve image from storage service %@ for proxy %@", buf, 0x20u);
        }
        proxyIdentifier = self->_proxyIdentifier;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __52__INRemoteImageProxy_unproxyImageFromService_reply___block_invoke;
        v22[3] = &unk_1E551BBB0;
        id v24 = v7;
        v22[4] = self;
        id v23 = v6;
        [v23 retrieveImageWithIdentifier:proxyIdentifier completion:v22];

        v12 = v24;
        goto LABEL_10;
      }
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28228];
      v20 = NSString;
      v12 = [(INImage *)self _description];
      v15 = [v20 stringWithFormat:@"No storage service available for image proxy: %@", v12];
      v26 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v17 = v19;
      uint64_t v18 = 6001;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28228];
      v14 = NSString;
      v12 = [(INImage *)self _description];
      v15 = [v14 stringWithFormat:@"Image proxy %@ is invalid", v12];
      v34[0] = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      v17 = v13;
      uint64_t v18 = 6006;
    }
    v21 = [v17 errorWithDomain:@"IntentsErrorDomain" code:v18 userInfo:v16];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v21);

LABEL_10:
  }
}

void __52__INRemoteImageProxy_unproxyImageFromService_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_8:
    v7();
    goto LABEL_9;
  }
  if (![v5 isEqual:*(void *)(a1 + 32)])
  {
    [v6 _imageSize];
    double v17 = v16;
    double v19 = v18;
    v20 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v21 = NSNumber;
      v22 = v20;
      id v23 = [v21 numberWithDouble:v17];
      id v24 = [NSNumber numberWithDouble:v19];
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v27 = "-[INRemoteImageProxy unproxyImageFromService:reply:]_block_invoke";
      __int16 v28 = 2112;
      __int16 v29 = v6;
      __int16 v30 = 2112;
      __int16 v31 = v23;
      __int16 v32 = 2112;
      uint64_t v33 = v24;
      __int16 v34 = 2112;
      uint64_t v35 = v25;
      _os_log_impl(&dword_18CB2F000, v22, OS_LOG_TYPE_INFO, "%s Retrieved image %@ of size {%@, %@} from storage service %@", buf, 0x34u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_8;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v36 = *MEMORY[0x1E4F28228];
  v10 = NSString;
  objc_super v11 = [*(id *)(a1 + 32) _description];
  v12 = [v6 _description];
  v13 = [v10 stringWithFormat:@"Image proxy %@ proxied itself: %@", v11, v12];
  v37[0] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  v15 = [v9 errorWithDomain:@"IntentsErrorDomain" code:6005 userInfo:v14];
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v15);

LABEL_9:
}

- (void)filePathFromService:(id)a3 reply:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (![(INRemoteImageProxy *)self isValid])
  {
    objc_super v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v12 = NSString;
    id v10 = [(INImage *)self _description];
    id v9 = [v12 stringWithFormat:@"Image proxy %@ is invalid", v10];
    v23[0] = v9;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v14 = v11;
    uint64_t v15 = 6006;
LABEL_6:
    double v18 = [v14 errorWithDomain:@"IntentsErrorDomain" code:v15 userInfo:v13];
    v7[2](v7, 0, v18);

    goto LABEL_7;
  }
  if (!v6)
  {
    double v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    double v17 = NSString;
    id v10 = [(INImage *)self _description];
    id v9 = [v17 stringWithFormat:@"No storage service available for image proxy: %@", v10];
    v21 = v9;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v14 = v16;
    uint64_t v15 = 6001;
    goto LABEL_6;
  }
  proxyIdentifier = self->_proxyIdentifier;
  id v19 = 0;
  id v9 = [v6 filePathForImageWithIdentifier:proxyIdentifier error:&v19];
  id v10 = v19;
  ((void (**)(id, void *, void *))v7)[2](v7, v9, v10);
LABEL_7:
}

- (void)purgeStoredImageWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[INImageServiceRegistry sharedInstance];
  id v6 = [v5 imageStorageServiceForServiceIdentifier:self->_storageServiceIdentifier];

  if (v6)
  {
    id v7 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v7;
      id v9 = [(INImage *)self _description];
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "-[INRemoteImageProxy purgeStoredImageWithCompletion:]";
      __int16 v16 = 2112;
      double v17 = v6;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s Attempting to purge image from storage service %@ for proxy %@", buf, 0x20u);
    }
    proxyIdentifier = self->_proxyIdentifier;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__INRemoteImageProxy_purgeStoredImageWithCompletion___block_invoke;
    v11[3] = &unk_1E551AE60;
    id v13 = v4;
    v11[4] = self;
    id v12 = v6;
    [v12 purgeImageWithIdentifier:proxyIdentifier completion:v11];
  }
}

void __53__INRemoteImageProxy_purgeStoredImageWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
LABEL_8:
      v5();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _setProxyIdentifier:0];
    [*(id *)(a1 + 32) _setStorageServiceIdentifier:0];
    id v6 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = v6;
      id v10 = [v7 _description];
      int v12 = 136315650;
      id v13 = "-[INRemoteImageProxy purgeStoredImageWithCompletion:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      double v17 = v10;
      _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s Purged stored image from storage service %@ for remote image proxy %@", (uint8_t *)&v12, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v5 = *(void (**)(void))(v11 + 16);
      goto LABEL_8;
    }
  }
}

- (id)_identifier
{
  v2 = [(INRemoteImageProxy *)self _URLRepresentation];
  id v3 = [v2 absoluteString];

  return v3;
}

- (id)_URLRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v3 setScheme:@"intents-remote-image-proxy"];
  uint64_t v4 = [(INRemoteImageProxy *)self _proxyIdentifier];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = [MEMORY[0x1E4F290C8] queryItemWithName:@"proxyIdentifier" value:v4];
    [v5 addObject:v6];
  }
  else
  {
    id v5 = 0;
  }
  id v7 = [(INRemoteImageProxy *)self _storageServiceIdentifier];
  if (v7)
  {
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v8 = [MEMORY[0x1E4F290C8] queryItemWithName:@"storageServiceIdentifier" value:v7];
    [v5 addObject:v8];
  }
  [v3 setQueryItems:v5];
  id v9 = [v3 URL];

  return v9;
}

- (id)_initWithURLRepresentation:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v6 = 0;
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
  id v5 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:0];
  id v6 = v5;
  if (!v5) {
    goto LABEL_20;
  }
  id v7 = [v5 scheme];
  int v8 = [v7 isEqualToString:@"intents-remote-image-proxy"];

  if (!v8) {
    goto LABEL_20;
  }
  v29.receiver = self;
  v29.super_class = (Class)INRemoteImageProxy;
  id v9 = [(INImage *)&v29 _initWithIdentifier:0];
  if (!v9) {
    goto LABEL_18;
  }
  id v23 = v6;
  id v24 = v4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = [v6 queryItems];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      __int16 v16 = [v15 name];
      int v17 = [v16 isEqualToString:@"proxyIdentifier"];

      if (v17)
      {
        uint64_t v18 = [v15 value];
        [v9 _setProxyIdentifier:v18];
      }
      else
      {
        id v19 = [v15 name];
        int v20 = [v19 isEqualToString:@"storageServiceIdentifier"];

        if (!v20) {
          continue;
        }
        uint64_t v18 = [v15 value];
        [v9 _setStorageServiceIdentifier:v18];
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  }
  while (v12);
LABEL_17:

  id v6 = v23;
  id v4 = v24;
LABEL_18:
  self = (INRemoteImageProxy *)v9;
  v21 = self;
LABEL_21:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)proxyImageSynchronously:(id)a3 usingService:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v8 storeImageSynchronously:v7 error:a5];
  }
  else
  {
    id v9 = 0;
  }
  if (![v9 length])
  {
    if (!a5 || !*a5)
    {
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:6002 userInfo:0];
      *a5 = v10;
      if (!v10) {
        goto LABEL_12;
      }
    }
LABEL_11:
    id v11 = 0;
    goto LABEL_13;
  }
  if (a5 && *a5) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v12 = [INRemoteImageProxy alloc];
  uint64_t v13 = [v7 _identifier];
  id v11 = [(INImage *)v12 _initWithIdentifier:v13];

  [v11 _setProxyIdentifier:v9];
  __int16 v14 = [v8 serviceIdentifier];
  [v11 _setStorageServiceIdentifier:v14];

LABEL_13:

  return v11;
}

+ (id)requestProxyByStoringImage:(id)a3 qualityOfService:(unsigned int)a4 scaled:(BOOL)a5 storeType:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (v11)
  {
    unsigned int v44 = a4;
    BOOL v45 = v9;
    v46 = a7;
    uint64_t v12 = +[INImageServiceRegistry sharedInstance];
    uint64_t v13 = [v12 imageStorageServices];

    __int16 v14 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = v14;
      __int16 v16 = [v11 description];
      *(_DWORD *)buf = 136315650;
      v57 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:]";
      __int16 v58 = 2112;
      id v59 = v13;
      __int16 v60 = 2112;
      id v61 = v16;
      _os_log_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_INFO, "%s Evaluating storage services %@ for image %@", buf, 0x20u);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v13;
    uint64_t v17 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v50;
LABEL_6:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v49 + 1) + 8 * v20);
        int v22 = [v21 canStoreImage:v11];
        id v23 = (void *)INSiriLogContextIntents;
        BOOL v24 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO);
        if (v22) {
          break;
        }
        if (v24)
        {
          long long v25 = v23;
          long long v26 = [v11 description];
          *(_DWORD *)buf = 136315394;
          v57 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:]";
          __int16 v58 = 2112;
          id v59 = v26;
          _os_log_impl(&dword_18CB2F000, v25, OS_LOG_TYPE_INFO, "%s Storage service cannot store image %@", buf, 0x16u);
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
          if (v18) {
            goto LABEL_6;
          }
          goto LABEL_14;
        }
      }
      if (v24)
      {
        long long v28 = v23;
        objc_super v29 = [v11 description];
        *(_DWORD *)buf = 136315650;
        v57 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:]";
        __int16 v58 = 2112;
        id v59 = v21;
        __int16 v60 = 2112;
        id v61 = v29;
        _os_log_impl(&dword_18CB2F000, v28, OS_LOG_TYPE_INFO, "%s Found preferred storage service %@ for image %@", buf, 0x20u);
      }
      id v30 = v21;

      long long v27 = v46;
      if (v30)
      {
        uint64_t v31 = (void *)INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          __int16 v32 = v31;
          uint64_t v33 = [v11 description];
          *(_DWORD *)buf = 136315650;
          v57 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:]";
          __int16 v58 = 2112;
          id v59 = v33;
          __int16 v60 = 2112;
          id v61 = v30;
          _os_log_impl(&dword_18CB2F000, v32, OS_LOG_TYPE_INFO, "%s Attempting to store image %@ with storage service %@", buf, 0x20u);
        }
        id v48 = 0;
        __int16 v34 = [v30 storeImage:v11 scaled:v45 qualityOfService:v44 storeType:a6 error:&v48];
        id v35 = v48;
        uint64_t v36 = v35;
        if (v35)
        {
          id v37 = 0;
          if (v46) {
            id *v46 = v35;
          }
        }
        else
        {
          v39 = [INRemoteImageProxy alloc];
          v40 = [v11 _identifier];
          id v37 = [(INImage *)v39 _initWithIdentifier:v40];

          [v37 _setProxyIdentifier:v34];
          v41 = [v30 serviceIdentifier];
          [v37 _setStorageServiceIdentifier:v41];

          objc_msgSend(v37, "_setRenderingMode:", objc_msgSend(v11, "_renderingMode"));
          v42 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v57 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:]";
            __int16 v58 = 2112;
            id v59 = v37;
            __int16 v60 = 2112;
            id v61 = v11;
            _os_log_impl(&dword_18CB2F000, v42, OS_LOG_TYPE_INFO, "%s Created remote image proxy %@ for image %@", buf, 0x20u);
          }
        }

        goto LABEL_30;
      }
    }
    else
    {
LABEL_14:

      long long v27 = v46;
    }
    if (v27)
    {
      v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      id v30 = [NSString stringWithFormat:@"No storage service was able to store image %@", v11];
      id v54 = v30;
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      [v38 errorWithDomain:@"IntentsErrorDomain" code:6001 userInfo:v36];
      id v37 = 0;
      id *v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
    }
    else
    {
      id v37 = 0;
    }
  }
  else
  {
    id v37 = 0;
  }

  return v37;
}

+ (void)requestProxyByStoringImage:(id)a3 qualityOfService:(unsigned int)a4 scaled:(BOOL)a5 storeType:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  __int16 v14 = v13;
  if (v12)
  {
    double v15 = 0.5;
    __int16 v16 = INImageProxyInjectionQueue();
    double v17 = 5.0;
    if (((1 << a4) & 0x220200) == 0) {
      double v17 = 0.5;
    }
    if (a4 <= 0x15) {
      double v15 = v17;
    }
    uint64_t v18 = [INWatchdogTimer alloc];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __94__INRemoteImageProxy_requestProxyByStoringImage_qualityOfService_scaled_storeType_completion___block_invoke;
    v35[3] = &unk_1E5519ED0;
    double v38 = v15;
    id v19 = v12;
    id v36 = v19;
    id v20 = v14;
    id v37 = v20;
    v21 = [(INWatchdogTimer *)v18 initWithTimeoutInterval:v16 onQueue:v35 timeoutHandler:v15];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    long long v26 = __94__INRemoteImageProxy_requestProxyByStoringImage_qualityOfService_scaled_storeType_completion___block_invoke_18;
    long long v27 = &unk_1E5519EF8;
    id v31 = a1;
    unsigned int v33 = a4;
    BOOL v34 = a5;
    unint64_t v32 = a6;
    id v28 = v19;
    objc_super v29 = v21;
    id v30 = v20;
    int v22 = v21;
    dispatch_block_t v23 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, (dispatch_qos_class_t)a4, 0, &v24);
    dispatch_async(v16, v23);

    [(INWatchdogTimer *)v22 start];
  }
  else
  {
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
}

void __94__INRemoteImageProxy_requestProxyByStoringImage_qualityOfService_scaled_storeType_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  id v4 = [v2 stringWithFormat:@"Timing out after %@ seconds during proxy request for image %@", v3, *(void *)(a1 + 32)];

  id v5 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:completion:]_block_invoke";
    __int16 v14 = 2112;
    double v15 = v4;
    _os_log_error_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  id v11 = v4;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  BOOL v9 = [v7 errorWithDomain:@"IntentsErrorDomain" code:6007 userInfo:v8];
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v9);
}

void __94__INRemoteImageProxy_requestProxyByStoringImage_qualityOfService_scaled_storeType_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 72);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 76);
  id v5 = *(void **)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v10 = 0;
  id v7 = [v5 requestProxyByStoringImage:v2 qualityOfService:v3 scaled:v4 storeType:v6 error:&v10];
  id v8 = v10;
  if ([*(id *)(a1 + 40) cancelIfNotAlreadyCanceled])
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v7, v8);
    }
  }
}

- (void)_retrieveFilePathWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(INImageFilePersistence);
  [(INRemoteImageProxy *)self filePathFromService:v5 reply:v4];
}

- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(INImageFilePersistence);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__INRemoteImageProxy_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke;
  v15[3] = &unk_1E551BBB0;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(INRemoteImageProxy *)self unproxyImageFromService:v11 reply:v15];
}

uint64_t __104__INRemoteImageProxy_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke(void *a1, void *a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(double, double))(a1[6] + 16))(0.0, 0.0);
  }
  else {
    return [a2 _loadImageDataAndSizeWithHelper:a1[4] accessSpecifier:a1[5] completion:a1[6]];
  }
}

@end