@interface LSAppClipMetadata
+ (BOOL)supportsSecureCoding;
+ (LSAppClipMetadata)new;
- (BOOL)wantsEphemeralNotifications;
- (BOOL)wantsLocationConfirmation;
- (LSAppClipMetadata)init;
- (LSAppClipMetadata)initWithCoder:(id)a3;
- (NSArray)parentApplicationIdentifiers;
- (id)_initWithApplicationRecord:(id)a3 parentApplicationIdentifiers:(id)a4 appClipPlist:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSAppClipMetadata

+ (LSAppClipMetadata)new
{
}

- (LSAppClipMetadata)init
{
}

- (id)_initWithApplicationRecord:(id)a3 parentApplicationIdentifiers:(id)a4 appClipPlist:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)LSAppClipMetadata;
  v7 = [(LSAppClipMetadata *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [a4 copy];
    v9 = (void *)v8;
    if (v8) {
      v10 = (void *)v8;
    }
    else {
      v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v7->_parentApplicationIdentifiers, v10);

    uint64_t v11 = [a5 copy];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v7->_appClipPlist, v13);
  }
  return v7;
}

- (BOOL)wantsEphemeralNotifications
{
  v2 = [(NSDictionary *)self->_appClipPlist objectForKeyedSubscript:@"NSAppClipRequestEphemeralUserNotification"];
  if (_NSIsNSNumber()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)wantsLocationConfirmation
{
  v2 = [(NSDictionary *)self->_appClipPlist objectForKeyedSubscript:@"NSAppClipRequestLocationConfirmation"];
  if (_NSIsNSNumber()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_parentApplicationIdentifiers forKey:@"parentApplicationIdentifiers"];
  appClipPlist = self->_appClipPlist;

  [a3 encodeObject:appClipPlist forKey:@"appClipPlist"];
}

- (LSAppClipMetadata)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)LSAppClipMetadata;
  v4 = [(LSAppClipMetadata *)&v14 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), @"parentApplicationIdentifiers");
    v6 = (void *)v5;
    if (v5) {
      v7 = (void *)v5;
    }
    else {
      v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v4->_parentApplicationIdentifiers, v7);

    uint64_t v8 = objc_opt_class();
    v9 = XNSGetPropertyListClasses();
    uint64_t v10 = objc_msgSend(a3, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v8, v9, @"appClipPlist");
    uint64_t v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v4->_appClipPlist, v12);
  }
  return v4;
}

- (NSArray)parentApplicationIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentApplicationIdentifiers, 0);

  objc_storeStrong((id *)&self->_appClipPlist, 0);
}

@end