@interface AXPTranslatorResponse
+ (BOOL)supportsSecureCoding;
+ (id)allowedDecodableClasses;
+ (id)emptyResponse;
- (AXPTranslationObject)associatedNotificationObject;
- (AXPTranslationObject)associatedTranslationObject;
- (AXPTranslationObject)translationResponse;
- (AXPTranslatorResponse)initWithCoder:(id)a3;
- (BOOL)BOOLResponse;
- (NSArray)translationsResponse;
- (NSArray)treeDumpResponse;
- (NSObject)resultData;
- (NSString)treeDumpType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)associatedRequestType;
- (unint64_t)attribute;
- (unint64_t)error;
- (unint64_t)notification;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedNotificationObject:(id)a3;
- (void)setAssociatedRequestType:(unint64_t)a3;
- (void)setAssociatedTranslationObject:(id)a3;
- (void)setAttribute:(unint64_t)a3;
- (void)setError:(unint64_t)a3;
- (void)setNotification:(unint64_t)a3;
- (void)setResultData:(id)a3;
@end

@implementation AXPTranslatorResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)emptyResponse
{
  v2 = objc_opt_new();

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new();
  v6 = [(AXPTranslatorResponse *)self resultData];
  [v5 setResultData:v6];

  objc_msgSend(v5, "setError:", -[AXPTranslatorResponse error](self, "error"));
  objc_msgSend(v5, "setAttribute:", -[AXPTranslatorResponse attribute](self, "attribute"));
  objc_msgSend(v5, "setNotification:", -[AXPTranslatorResponse notification](self, "notification"));
  objc_msgSend(v5, "setAssociatedRequestType:", -[AXPTranslatorResponse associatedRequestType](self, "associatedRequestType"));
  v7 = [(AXPTranslatorResponse *)self associatedNotificationObject];
  v8 = (void *)[v7 copyWithZone:a3];
  [v5 setAssociatedNotificationObject:v8];

  v9 = [(AXPTranslatorResponse *)self associatedTranslationObject];
  v10 = (void *)[v9 copyWithZone:a3];
  [v5 setAssociatedTranslationObject:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXPTranslatorResponse *)self resultData];
  [v4 encodeObject:v5 forKey:@"resultData"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorResponse error](self, "error"), @"error");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorResponse attribute](self, "attribute"), @"attribute");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorResponse notification](self, "notification"), @"notification");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorResponse associatedRequestType](self, "associatedRequestType"), @"associatedRequestType");
  v6 = [(AXPTranslatorResponse *)self associatedNotificationObject];
  [v4 encodeObject:v6 forKey:@"associatedNotificationObject"];

  id v7 = [(AXPTranslatorResponse *)self associatedTranslationObject];
  [v4 encodeObject:v7 forKey:@"associatedTranslationObject"];
}

+ (id)allowedDecodableClasses
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__AXPTranslatorResponse_allowedDecodableClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedDecodableClasses_onceToken_1 != -1) {
    dispatch_once(&allowedDecodableClasses_onceToken_1, block);
  }
  v2 = (void *)allowedDecodableClasses_Allowed_1;

  return v2;
}

void __48__AXPTranslatorResponse_allowedDecodableClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = +[AXPTranslationObject allowedDecodableClasses];
  uint64_t v10 = [v12 setByAddingObjectsFromSet:v9];
  v11 = (void *)allowedDecodableClasses_Allowed_1;
  allowedDecodableClasses_Allowed_1 = v10;
}

- (AXPTranslatorResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (AXPTranslatorResponse *)objc_opt_new();
  uint64_t v6 = [(id)objc_opt_class() allowedDecodableClasses];
  uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"resultData"];
  [(AXPTranslatorResponse *)v5 setResultData:v7];

  -[AXPTranslatorResponse setError:](v5, "setError:", [v4 decodeIntegerForKey:@"error"]);
  -[AXPTranslatorResponse setAttribute:](v5, "setAttribute:", [v4 decodeIntegerForKey:@"attribute"]);
  -[AXPTranslatorResponse setNotification:](v5, "setNotification:", [v4 decodeIntegerForKey:@"notification"]);
  -[AXPTranslatorResponse setAssociatedRequestType:](v5, "setAssociatedRequestType:", [v4 decodeIntegerForKey:@"associatedRequestType"]);
  uint64_t v8 = [(id)objc_opt_class() allowedDecodableClasses];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"associatedNotificationObject"];
  [(AXPTranslatorResponse *)v5 setAssociatedNotificationObject:v9];

  uint64_t v10 = [(id)objc_opt_class() allowedDecodableClasses];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"associatedTranslationObject"];

  [(AXPTranslatorResponse *)v5 setAssociatedTranslationObject:v11];
  return v5;
}

- (AXPTranslationObject)translationResponse
{
  uint64_t v3 = [(AXPTranslatorResponse *)self resultData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(AXPTranslatorResponse *)self resultData];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (AXPTranslationObject *)v5;
}

- (NSArray)translationsResponse
{
  uint64_t v3 = [(AXPTranslatorResponse *)self resultData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v5 = [(AXPTranslatorResponse *)self resultData];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [(AXPTranslatorResponse *)self resultData];
  uint64_t v8 = [v7 indexesOfObjectsPassingTest:&__block_literal_global_3];
  uint64_t v9 = [v8 count];

  if (v6 == v9)
  {
    uint64_t v10 = [(AXPTranslatorResponse *)self resultData];
  }
  else
  {
LABEL_4:
    uint64_t v10 = 0;
  }

  return (NSArray *)v10;
}

uint64_t __45__AXPTranslatorResponse_translationsResponse__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)BOOLResponse
{
  uint64_t v3 = [(AXPTranslatorResponse *)self resultData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(AXPTranslatorResponse *)self resultData];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (NSString)treeDumpType
{
  uint64_t v3 = [(AXPTranslatorResponse *)self resultData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v5 = [(AXPTranslatorResponse *)self resultData];
  char v6 = [v5 objectForKey:@"treeDumpType"];

  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_5:
    char v6 = 0;
  }

  return (NSString *)v6;
}

- (NSArray)treeDumpResponse
{
  uint64_t v3 = [(AXPTranslatorResponse *)self resultData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v5 = [(AXPTranslatorResponse *)self resultData];
  char v6 = [v5 objectForKey:@"treeDump"];

  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_5:
    char v6 = 0;
  }

  return (NSArray *)v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)AXPTranslatorResponse;
  id v4 = [(AXPTranslatorResponse *)&v12 description];
  uint64_t v5 = [(AXPTranslatorResponse *)self resultData];
  char v6 = _AXPAttributeToString([(AXPTranslatorResponse *)self attribute]);
  uint64_t v7 = _AXPNotificationToString([(AXPTranslatorResponse *)self notification]);
  unint64_t v8 = [(AXPTranslatorResponse *)self associatedRequestType];
  uint64_t v9 = [(AXPTranslatorResponse *)self associatedTranslationObject];
  uint64_t v10 = [v3 stringWithFormat:@"%@: %@ [maybe attribute: %@] [maybe notification: %@] [maybe associatedRequestType: %d] [maybe associatedTranslationObj: %@]", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSObject)resultData
{
  return self->_resultData;
}

- (void)setResultData:(id)a3
{
}

- (unint64_t)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(unint64_t)a3
{
  self->_attribute = a3;
}

- (unint64_t)notification
{
  return self->_notification;
}

- (void)setNotification:(unint64_t)a3
{
  self->_notification = a3;
}

- (unint64_t)associatedRequestType
{
  return self->_associatedRequestType;
}

- (void)setAssociatedRequestType:(unint64_t)a3
{
  self->_associatedRequestType = a3;
}

- (AXPTranslationObject)associatedNotificationObject
{
  return self->_associatedNotificationObject;
}

- (void)setAssociatedNotificationObject:(id)a3
{
}

- (AXPTranslationObject)associatedTranslationObject
{
  return self->_associatedTranslationObject;
}

- (void)setAssociatedTranslationObject:(id)a3
{
}

- (unint64_t)error
{
  return self->_error;
}

- (void)setError:(unint64_t)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedTranslationObject, 0);
  objc_storeStrong((id *)&self->_associatedNotificationObject, 0);

  objc_storeStrong((id *)&self->_resultData, 0);
}

@end