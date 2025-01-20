@interface GKPlayerActivitySpecialItemInternal
+ (id)constantToTypeMap;
+ (id)secureCodedPropertyKeys;
+ (id)typeToConstantMap;
- (GKPlayerActivitySpecialItemInternal)initWithDictionary:(id)a3;
- (NSDate)timeStamp;
- (NSString)alternateMessage;
- (NSString)instrumentationKey;
- (NSString)message;
- (NSString)sfSymbol;
- (id)description;
- (int64_t)activityType;
- (void)setActivityType:(int64_t)a3;
- (void)setAlternateMessage:(id)a3;
- (void)setInstrumentationKey:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSfSymbol:(id)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation GKPlayerActivitySpecialItemInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_226 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_226, &__block_literal_global_228);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_225;

  return v2;
}

void __62__GKPlayerActivitySpecialItemInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"activityType";
  v3[0] = objc_opt_class();
  v2[1] = @"message";
  v3[1] = objc_opt_class();
  v2[2] = @"alternateMessage";
  v3[2] = objc_opt_class();
  v2[3] = @"sfSymbol";
  v3[3] = objc_opt_class();
  v2[4] = @"timeStamp";
  v3[4] = objc_opt_class();
  v2[5] = @"instrumentationKey";
  v3[5] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_225;
  secureCodedPropertyKeys_sSecureCodedKeys_225 = v0;
}

- (GKPlayerActivitySpecialItemInternal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GKPlayerActivitySpecialItemInternal;
  v5 = [(GKPlayerActivitySpecialItemInternal *)&v18 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1C9C8];
    v7 = [v4 objectForKeyedSubscript:@"timestamp"];
    v8 = [v6 _gkDateFromServerTimestamp:v7];
    [(GKPlayerActivitySpecialItemInternal *)v5 setTimeStamp:v8];

    v9 = [v4 objectForKeyedSubscript:@"message"];
    [(GKPlayerActivitySpecialItemInternal *)v5 setMessage:v9];

    v10 = [v4 objectForKeyedSubscript:@"alternate-message"];
    [(GKPlayerActivitySpecialItemInternal *)v5 setAlternateMessage:v10];

    v11 = +[GKPlayerActivitySpecialItemInternal constantToTypeMap];
    v12 = [v4 objectForKeyedSubscript:@"type"];
    v13 = [v11 objectForKeyedSubscript:v12];

    if (v13) {
      uint64_t v14 = [v13 integerValue];
    }
    else {
      uint64_t v14 = 0;
    }
    [(GKPlayerActivitySpecialItemInternal *)v5 setActivityType:v14];
    v15 = [v4 objectForKeyedSubscript:@"symbol"];
    [(GKPlayerActivitySpecialItemInternal *)v5 setSfSymbol:v15];

    v16 = [v4 objectForKeyedSubscript:@"instKey"];
    [(GKPlayerActivitySpecialItemInternal *)v5 setInstrumentationKey:v16];
  }
  return v5;
}

+ (id)typeToConstantMap
{
  if (typeToConstantMap_onceToken_239 != -1) {
    dispatch_once(&typeToConstantMap_onceToken_239, &__block_literal_global_242);
  }
  v2 = (void *)typeToConstantMap_typeToConstMap_240;

  return v2;
}

void __56__GKPlayerActivitySpecialItemInternal_typeToConstantMap__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = &unk_1F1E7EBD0;
  v3[0] = @"ADD_FRIENDS";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)typeToConstantMap_typeToConstMap_240;
  typeToConstantMap_typeToConstMap_240 = v0;
}

+ (id)constantToTypeMap
{
  if (constantToTypeMap_onceToken_243 != -1) {
    dispatch_once(&constantToTypeMap_onceToken_243, &__block_literal_global_246);
  }
  v2 = (void *)constantToTypeMap_constToTypeMap_244;

  return v2;
}

void __56__GKPlayerActivitySpecialItemInternal_constantToTypeMap__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"ADD_FRIENDS";
  v3[0] = &unk_1F1E7EBD0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)constantToTypeMap_constToTypeMap_244;
  constantToTypeMap_constToTypeMap_244 = v0;
}

- (id)description
{
  v13 = self;
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKPlayerActivitySpecialItemInternal activityType](self, "activityType"));
  v6 = [(GKPlayerActivitySpecialItemInternal *)self message];
  v7 = [(GKPlayerActivitySpecialItemInternal *)self alternateMessage];
  v8 = [(GKPlayerActivitySpecialItemInternal *)self sfSymbol];
  v9 = [(GKPlayerActivitySpecialItemInternal *)self timeStamp];
  v10 = [(GKPlayerActivitySpecialItemInternal *)self instrumentationKey];
  v11 = [v3 stringWithFormat:@"<%@ %p>: {\n            \tactivityType: %@ \n            \tmessage: %@ \n            \talternateMessage: %@ \n            \tsfSymbol: %@ \n            \ttimestamp: %@ \n            \tinstrumentationKey: %@ \n            }", v4, &v13, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)alternateMessage
{
  return self->_alternateMessage;
}

- (void)setAlternateMessage:(id)a3
{
}

- (NSString)sfSymbol
{
  return self->_sfSymbol;
}

- (void)setSfSymbol:(id)a3
{
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (NSString)instrumentationKey
{
  return self->_instrumentationKey;
}

- (void)setInstrumentationKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationKey, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_sfSymbol, 0);
  objc_storeStrong((id *)&self->_alternateMessage, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end