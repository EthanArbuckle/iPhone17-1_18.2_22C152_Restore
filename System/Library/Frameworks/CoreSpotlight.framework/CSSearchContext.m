@interface CSSearchContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CSSearchContext)initWithCoder:(id)a3;
- (CSSearchContext)initWithQueryID:(unint64_t)a3 userQuery:(id)a4 maxItemsCount:(unint64_t)a5 keyboardLanguage:(id)a6 preferredLanguages:(id)a7;
- (CSSearchContext)initWithQueryID:(unint64_t)a3 userQuery:(id)a4 maxItemsCount:(unint64_t)a5 keyboardLanguage:(id)a6 preferredLanguages:(id)a7 markedText:(id)a8 markedTextStart:(unint64_t)a9;
- (CSSearchContext)initWithXPCDictionary:(id)a3;
- (NSArray)preferredLanguages;
- (NSString)keyboardLanguage;
- (NSString)markedText;
- (NSString)userQuery;
- (OS_xpc_object)xpc_dictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)markedTextStart;
- (unint64_t)maxItemsCount;
- (unint64_t)queryID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSSearchContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CSSearchContext)initWithQueryID:(unint64_t)a3 userQuery:(id)a4 maxItemsCount:(unint64_t)a5 keyboardLanguage:(id)a6 preferredLanguages:(id)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CSSearchContext;
  v16 = [(CSSearchContext *)&v20 init];
  v17 = v16;
  if (v16)
  {
    v16->_queryID = a3;
    objc_storeStrong((id *)&v16->_userQuery, a4);
    v17->_maxItemsCount = a5;
    objc_storeStrong((id *)&v17->_keyboardLanguage, a6);
    objc_storeStrong((id *)&v17->_preferredLanguages, a7);
    markedText = v17->_markedText;
    v17->_markedText = 0;

    v17->_markedTextStart = 0;
  }

  return v17;
}

- (CSSearchContext)initWithQueryID:(unint64_t)a3 userQuery:(id)a4 maxItemsCount:(unint64_t)a5 keyboardLanguage:(id)a6 preferredLanguages:(id)a7 markedText:(id)a8 markedTextStart:(unint64_t)a9
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)CSSearchContext;
  v19 = [(CSSearchContext *)&v23 init];
  objc_super v20 = v19;
  if (v19)
  {
    v19->_queryID = a3;
    objc_storeStrong((id *)&v19->_userQuery, a4);
    v20->_maxItemsCount = a5;
    objc_storeStrong((id *)&v20->_keyboardLanguage, a6);
    objc_storeStrong((id *)&v20->_preferredLanguages, a7);
    objc_storeStrong((id *)&v20->_markedText, a8);
    v20->_markedTextStart = a9;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt64:self->_queryID forKey:@"qid"];
  [v5 encodeObject:self->_userQuery forKey:@"uq"];
  [v5 encodeInt64:self->_maxItemsCount forKey:@"mc"];
  [v5 encodeObject:self->_keyboardLanguage forKey:@"kl"];
  [v5 encodeObject:self->_preferredLanguages forKey:@"pl"];
  markedText = self->_markedText;
  if (markedText)
  {
    [v5 encodeObject:markedText forKey:@"mt"];
    [v5 encodeInt64:self->_markedTextStart forKey:@"mts"];
  }
}

- (CSSearchContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CSSearchContext;
  id v5 = [(CSSearchContext *)&v18 init];
  if (v5)
  {
    v5->_queryID = [v4 decodeIntegerForKey:@"qid"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uq"];
    userQuery = v5->_userQuery;
    v5->_userQuery = (NSString *)v6;

    v5->_maxItemsCount = [v4 decodeIntegerForKey:@"mc"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kl"];
    keyboardLanguage = v5->_keyboardLanguage;
    v5->_keyboardLanguage = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"pl"];
    preferredLanguages = v5->_preferredLanguages;
    v5->_preferredLanguages = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mt"];
    markedText = v5->_markedText;
    v5->_markedText = (NSString *)v15;

    v5->_markedTextStart = [v4 decodeIntegerForKey:@"mts"];
  }

  return v5;
}

- (OS_xpc_object)xpc_dictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "qid", self->_queryID);
  id v4 = [(NSString *)self->_userQuery UTF8String];
  if (v4) {
    xpc_dictionary_set_string(v3, "uq", v4);
  }
  xpc_dictionary_set_uint64(v3, "mc", self->_maxItemsCount);
  keyboardLanguage = self->_keyboardLanguage;
  if (keyboardLanguage) {
    xpc_dictionary_set_string(v3, "kl", [(NSString *)keyboardLanguage UTF8String]);
  }
  if ([(NSArray *)self->_preferredLanguages count]) {
    +[CSXPCConnection dictionary:v3 setStringArray:self->_preferredLanguages forKey:"pl"];
  }
  markedText = self->_markedText;
  if (markedText)
  {
    xpc_dictionary_set_string(v3, "mt", [(NSString *)markedText UTF8String]);
    xpc_dictionary_set_uint64(v3, "mts", self->_markedTextStart);
  }

  return (OS_xpc_object *)v3;
}

- (CSSearchContext)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (uint64_t uint64 = xpc_dictionary_get_uint64(v4, "qid")) != 0)
  {
    uint64_t v7 = uint64;
    v20.receiver = self;
    v20.super_class = (Class)CSSearchContext;
    uint64_t v8 = [(CSSearchContext *)&v20 init];
    v9 = v8;
    if (v8)
    {
      v8->_queryID = v7;
      v10 = +[CSXPCConnection copyNSStringForKey:"uq" fromXPCDictionary:v5];
      userQuery = v9->_userQuery;
      v9->_userQuery = v10;

      v9->_maxItemsCount = xpc_dictionary_get_uint64(v5, "mc");
      v12 = +[CSXPCConnection copyNSStringForKey:"kl" fromXPCDictionary:v5];
      keyboardLanguage = v9->_keyboardLanguage;
      v9->_keyboardLanguage = v12;

      id v14 = xpc_dictionary_get_value(v5, "pl");
      uint64_t v15 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v14];
      preferredLanguages = v9->_preferredLanguages;
      v9->_preferredLanguages = v15;

      id v17 = +[CSXPCConnection copyNSStringForKey:"mt" fromXPCDictionary:v5];
      markedText = v9->_markedText;
      v9->_markedText = v17;

      if (v9->_markedText) {
        v9->_markedTextStart = xpc_dictionary_get_uint64(v5, "mts");
      }
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [[CSSearchContext alloc] initWithQueryID:self->_queryID userQuery:self->_userQuery maxItemsCount:self->_maxItemsCount keyboardLanguage:self->_keyboardLanguage preferredLanguages:self->_preferredLanguages markedText:self->_markedText markedTextStart:self->_markedTextStart];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t queryID = self->_queryID;
    BOOL v6 = queryID == [v4 queryID];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_queryID;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %llu <%@>", objc_opt_class(), self, self->_queryID, self->_userQuery];
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (NSString)userQuery
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)maxItemsCount
{
  return self->_maxItemsCount;
}

- (NSString)keyboardLanguage
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)markedText
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)markedTextStart
{
  return self->_markedTextStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);

  objc_storeStrong((id *)&self->_userQuery, 0);
}

@end