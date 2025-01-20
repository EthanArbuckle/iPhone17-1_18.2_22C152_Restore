@interface SFSpeechProfileContainer
+ (BOOL)supportsSecureCoding;
+ (id)defaultContainer;
- (NSString)loggableUserId;
- (NSString)personaId;
- (NSString)userId;
- (NSURL)url;
- (SFSpeechProfileContainer)initWithCoder:(id)a3;
- (SFSpeechProfileContainer)initWithPersona:(id)a3;
- (SFSpeechProfileContainer)initWithURL:(id)a3 personaId:(id)a4 userId:(id)a5 loggableUserId:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFSpeechProfileContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggableUserId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_personaId, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (NSString)loggableUserId
{
  return self->_loggableUserId;
}

- (NSString)userId
{
  return self->_userId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSURL)url
{
  return self->_url;
}

- (SFSpeechProfileContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFSpeechProfileContainer;
  v5 = [(SFSpeechProfileContainer *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaId"];
    personaId = v5->_personaId;
    v5->_personaId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userId"];
    userId = v5->_userId;
    v5->_userId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loggableUserId"];
    loggableUserId = v5->_loggableUserId;
    v5->_loggableUserId = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_personaId forKey:@"personaId"];
  [v5 encodeObject:self->_userId forKey:@"userId"];
  [v5 encodeObject:self->_loggableUserId forKey:@"loggableUserId"];
}

- (SFSpeechProfileContainer)initWithURL:(id)a3 personaId:(id)a4 userId:(id)a5 loggableUserId:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SFSpeechProfileContainer;
  objc_super v15 = [(SFSpeechProfileContainer *)&v25 init];
  v16 = v15;
  if (!v15)
  {
LABEL_7:
    v18 = v16;
    goto LABEL_8;
  }
  if (v11)
  {
    objc_storeStrong((id *)&v15->_url, a3);
    goto LABEL_5;
  }
  if (v12)
  {
LABEL_5:
    objc_storeStrong((id *)&v16->_personaId, a4);
    objc_storeStrong((id *)&v16->_userId, a5);
    objc_storeStrong((id *)&v16->_loggableUserId, a6);
    v17 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
    {
      url = v16->_url;
      personaId = v16->_personaId;
      userId = v16->_userId;
      loggableUserId = v16->_loggableUserId;
      *(_DWORD *)buf = 136316162;
      v27 = "-[SFSpeechProfileContainer initWithURL:personaId:userId:loggableUserId:]";
      __int16 v28 = 2112;
      v29 = url;
      __int16 v30 = 2112;
      v31 = personaId;
      __int16 v32 = 2112;
      v33 = userId;
      __int16 v34 = 2112;
      v35 = loggableUserId;
      _os_log_debug_impl(&dword_1B709D000, v17, OS_LOG_TYPE_DEBUG, "%s MUX: Created container with url: %@, personaId: %@, userId: %@, loggableUserId: %@", buf, 0x34u);
    }
    goto LABEL_7;
  }
  v20 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[SFSpeechProfileContainer initWithURL:personaId:userId:loggableUserId:]";
    _os_log_error_impl(&dword_1B709D000, v20, OS_LOG_TYPE_ERROR, "%s MUX: Failed to resolve container, url and personaId cannot both be nil.", buf, 0xCu);
  }
  v18 = 0;
LABEL_8:

  return v18;
}

- (SFSpeechProfileContainer)initWithPersona:(id)a3
{
  return [(SFSpeechProfileContainer *)self initWithURL:0 personaId:a3 userId:0 loggableUserId:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultContainer
{
  v2 = [SFSpeechProfileContainer alloc];
  v3 = SFSpeechProfileRootDirectoryURL();
  id v4 = [(SFSpeechProfileContainer *)v2 initWithURL:v3 personaId:0 userId:@"00000000-0000-0000-0000-000000000000" loggableUserId:@"00000000-0000-0000-0000-000000000000"];

  return v4;
}

@end