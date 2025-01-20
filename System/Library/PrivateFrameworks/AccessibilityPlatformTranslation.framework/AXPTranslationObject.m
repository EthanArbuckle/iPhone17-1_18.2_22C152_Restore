@interface AXPTranslationObject
+ (BOOL)supportsSecureCoding;
+ (id)allowedDecodableClasses;
+ (void)initialize;
- (AXPTranslationObject)init;
- (AXPTranslationObject)initWithCoder:(id)a3;
- (BOOL)didPopuldateAppInfo;
- (BOOL)isApplicationElement;
- (BOOL)isEqual:(id)a3;
- (NSData)rawElementData;
- (NSString)bridgeDelegateToken;
- (NSString)remoteDebugDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)remoteDescriptionBlock;
- (int)pid;
- (unint64_t)objectID;
- (void)encodeWithCoder:(id)a3;
- (void)init;
- (void)setBridgeDelegateToken:(id)a3;
- (void)setDidPopuldateAppInfo:(BOOL)a3;
- (void)setIsApplicationElement:(BOOL)a3;
- (void)setObjectID:(unint64_t)a3;
- (void)setPid:(int)a3;
- (void)setRawElementData:(id)a3;
- (void)setRemoteDebugDescription:(id)a3;
- (void)setRemoteDescriptionBlock:(id)a3;
@end

@implementation AXPTranslationObject

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_2);
  }
}

uint64_t __34__AXPTranslationObject_initialize__block_invoke()
{
  UniqueIdLock = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (AXPTranslationObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXPTranslationObject;
  v2 = [(AXPTranslationObject *)&v6 init];
  [(id)UniqueIdLock lock];
  uint64_t bytes = 0;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], 8uLL, &bytes))
  {
    v3 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AXPTranslationObject init](v3);
    }

    ++UniqueIDCount;
  }
  -[AXPTranslationObject setObjectID:](v2, "setObjectID:");
  [(id)UniqueIdLock unlock];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(AXPTranslationObject *)self objectID];
    BOOL v6 = v5 == [v4 objectID];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)remoteDebugDescription
{
  if (!self->_remoteDebugDescription)
  {
    remoteDescriptionBlock = (void (**)(id, AXPTranslationObject *))self->_remoteDescriptionBlock;
    if (remoteDescriptionBlock)
    {
      remoteDescriptionBlock[2](remoteDescriptionBlock, self);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = &stru_26E23E2B0;
    }
    remoteDebugDescription = self->_remoteDebugDescription;
    self->_remoteDebugDescription = &v4->isa;
  }
  BOOL v6 = self->_remoteDebugDescription;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[AXPTranslationObject allocWithZone:](AXPTranslationObject, "allocWithZone:") init];
  [(AXPTranslationObject *)v5 setObjectID:[(AXPTranslationObject *)self objectID]];
  [(AXPTranslationObject *)v5 setPid:[(AXPTranslationObject *)self pid]];
  [(AXPTranslationObject *)v5 setIsApplicationElement:[(AXPTranslationObject *)self isApplicationElement]];
  BOOL v6 = [(AXPTranslationObject *)self bridgeDelegateToken];
  v7 = (void *)[v6 copyWithZone:a3];
  [(AXPTranslationObject *)v5 setBridgeDelegateToken:v7];

  v8 = [(AXPTranslationObject *)self rawElementData];
  v9 = (void *)[v8 copyWithZone:a3];
  [(AXPTranslationObject *)v5 setRawElementData:v9];

  [(AXPTranslationObject *)v5 setDidPopuldateAppInfo:[(AXPTranslationObject *)self didPopuldateAppInfo]];
  return v5;
}

+ (id)allowedDecodableClasses
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__AXPTranslationObject_allowedDecodableClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedDecodableClasses_onceToken != -1) {
    dispatch_once(&allowedDecodableClasses_onceToken, block);
  }
  v2 = (void *)allowedDecodableClasses_Allowed;

  return v2;
}

uint64_t __47__AXPTranslationObject_allowedDecodableClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  allowedDecodableClasses_Allowed = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslationObject pid](self, "pid"), @"pid");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXPTranslationObject isApplicationElement](self, "isApplicationElement"), @"isApplicationElement");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXPTranslationObject didPopuldateAppInfo](self, "didPopuldateAppInfo"), @"didPopuldateAppInfo");
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AXPTranslationObject objectID](self, "objectID"));
  [v4 encodeObject:v5 forKey:@"objectID"];

  uint64_t v6 = [(AXPTranslationObject *)self bridgeDelegateToken];
  [v4 encodeObject:v6 forKey:@"bridgeDelegateToken"];

  id v7 = [(AXPTranslationObject *)self rawElementData];
  [v4 encodeObject:v7 forKey:@"rawElementData"];
}

- (AXPTranslationObject)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXPTranslationObject;
  id v3 = a3;
  id v4 = [(AXPTranslationObject *)&v9 init];
  -[AXPTranslationObject setPid:](v4, "setPid:", objc_msgSend(v3, "decodeIntForKey:", @"pid", v9.receiver, v9.super_class));
  -[AXPTranslationObject setIsApplicationElement:](v4, "setIsApplicationElement:", [v3 decodeBoolForKey:@"isApplicationElement"]);
  -[AXPTranslationObject setDidPopuldateAppInfo:](v4, "setDidPopuldateAppInfo:", [v3 decodeBoolForKey:@"didPopuldateAppInfo"]);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  -[AXPTranslationObject setObjectID:](v4, "setObjectID:", [v5 unsignedLongLongValue]);

  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bridgeDelegateToken"];
  [(AXPTranslationObject *)v4 setBridgeDelegateToken:v6];

  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"rawElementData"];

  [(AXPTranslationObject *)v4 setRawElementData:v7];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)AXPTranslationObject;
  id v4 = [(AXPTranslationObject *)&v9 description];
  unint64_t v5 = [(AXPTranslationObject *)self objectID];
  uint64_t v6 = [(AXPTranslationObject *)self remoteDebugDescription];
  id v7 = [v3 stringWithFormat:@"%@[%llu]: %@", v4, v5, v6];

  return v7;
}

- (unint64_t)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(unint64_t)a3
{
  self->_objectID = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)isApplicationElement
{
  return self->_isApplicationElement;
}

- (void)setIsApplicationElement:(BOOL)a3
{
  self->_isApplicationElement = a3;
}

- (void)setRemoteDebugDescription:(id)a3
{
}

- (NSString)bridgeDelegateToken
{
  return self->_bridgeDelegateToken;
}

- (void)setBridgeDelegateToken:(id)a3
{
}

- (NSData)rawElementData
{
  return self->_rawElementData;
}

- (void)setRawElementData:(id)a3
{
}

- (BOOL)didPopuldateAppInfo
{
  return self->_didPopuldateAppInfo;
}

- (void)setDidPopuldateAppInfo:(BOOL)a3
{
  self->_didPopuldateAppInfo = a3;
}

- (id)remoteDescriptionBlock
{
  return self->_remoteDescriptionBlock;
}

- (void)setRemoteDescriptionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteDescriptionBlock, 0);
  objc_storeStrong((id *)&self->_rawElementData, 0);
  objc_storeStrong((id *)&self->_bridgeDelegateToken, 0);

  objc_storeStrong((id *)&self->_remoteDebugDescription, 0);
}

- (void)init
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22E850000, log, OS_LOG_TYPE_ERROR, "Could not generate random number", v1, 2u);
}

@end