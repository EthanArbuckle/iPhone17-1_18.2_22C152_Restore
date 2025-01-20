@interface FMFHandle
+ (BOOL)supportsSecureCoding;
+ (id)familyHandleWithId:(id)a3 dsid:(id)a4;
+ (id)handleWithId:(id)a3;
+ (id)handleWithId:(id)a3 serverId:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamilyMember;
- (BOOL)isPending;
- (BOOL)isPhoneNumber;
- (BOOL)isSharingThroughGroupId:(id)a3;
- (BOOL)reachable;
- (FMFHandle)initWithCoder:(id)a3;
- (NSArray)aliasServerIds;
- (NSArray)invitationSentToIds;
- (NSDictionary)expiresByGroupId;
- (NSNumber)dsid;
- (NSNumber)favoriteOrder;
- (NSNumber)trackingTimestamp;
- (NSString)_idsCorrelationIdentifierInternal;
- (NSString)_prettyNameInternal;
- (NSString)hashedDSID;
- (NSString)identifier;
- (NSString)qualifiedIdentifier;
- (NSString)serverId;
- (id)IDSRecipientFromHandle:(id)a3;
- (id)cachedPrettyName;
- (id)comparisonIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)prettyName;
- (id)recordId;
- (id)sanitizePhoneNumber:(id)a3;
- (int64_t)idsStatus;
- (int64_t)prettyNameCompare:(id)a3;
- (unint64_t)hash;
- (void)abPreferencesDidChange;
- (void)addressBookDidChange;
- (void)clearFavoriteOrder;
- (void)correlationIdentifierForHandle:(id)a3 withCompletion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)idsCorrelationIdentifierWithCompletion:(id)a3;
- (void)prettyNameWithCompletion:(id)a3;
- (void)setAliasServerIds:(id)a3;
- (void)setDsid:(id)a3;
- (void)setExpiresByGroupId:(id)a3;
- (void)setFavoriteOrder:(id)a3;
- (void)setHashedDSID:(id)a3;
- (void)setICloudId:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsStatus:(int64_t)a3;
- (void)setInvitationSentToIds:(id)a3;
- (void)setIsFamilyMember:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setQualifiedIdentifier:(id)a3;
- (void)setReachable:(BOOL)a3;
- (void)setServerId:(id)a3;
- (void)setTrackingTimestamp:(id)a3;
- (void)set_idsCorrelationIdentifierInternal:(id)a3;
- (void)set_prettyNameInternal:(id)a3;
@end

@implementation FMFHandle

- (void)addressBookDidChange
{
  v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "resetting _prettyNameInternal due to addressBookDidChange", v4, 2u);
  }

  [(FMFHandle *)self set_prettyNameInternal:0];
}

- (void)abPreferencesDidChange
{
  v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "resetting _prettyNameInternal due to abPreferencesDidChange", v4, 2u);
  }

  [(FMFHandle *)self set_prettyNameInternal:0];
}

+ (id)handleWithId:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() handleWithId:v3 serverId:0];

  return v4;
}

+ (id)handleWithId:(id)a3 serverId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setIdentifier:v6];
  [v7 setQualifiedIdentifier:v6];

  [v7 setServerId:v5];
  [v7 setIdsStatus:-1];
  [v7 setReachable:0];
  v8 = NSNumber;
  v9 = [MEMORY[0x263EFF910] date];
  [v9 timeIntervalSince1970];
  v11 = [v8 numberWithDouble:floor(v10 * 1000.0)];

  [v7 setTrackingTimestamp:v11];
  if ([v7 isPhoneNumber])
  {
    v12 = [v7 identifier];
    v13 = [v7 sanitizePhoneNumber:v12];
    [v7 setIdentifier:v13];
  }

  return v7;
}

+ (id)familyHandleWithId:(id)a3 dsid:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() handleWithId:v6];

  [v7 setDsid:v5];
  [v7 setIsFamilyMember:1];

  return v7;
}

- (void)setServerId:(id)a3
{
}

- (void)setICloudId:(id)a3
{
  v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  id v6 = [v4 whitespaceAndNewlineCharacterSet];
  id v9 = [v5 stringByTrimmingCharactersInSet:v6];

  id v7 = [v9 lowercaseString];
  identifier = self->_identifier;
  self->_identifier = v7;
}

- (BOOL)isSharingThroughGroupId:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [(FMFHandle *)self expiresByGroupId];
  id v7 = [v6 allKeys];
  v8 = [v4 setWithArray:v7];

  LOBYTE(v6) = [v8 containsObject:v5];
  return (char)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(FMFHandle *)self identifier];
  [v4 setIdentifier:v5];

  id v6 = [(FMFHandle *)self serverId];
  [v4 setServerId:v6];

  id v7 = [(FMFHandle *)self expiresByGroupId];
  [v4 setExpiresByGroupId:v7];

  v8 = [(FMFHandle *)self trackingTimestamp];
  [v4 setTrackingTimestamp:v8];

  id v9 = [(FMFHandle *)self hashedDSID];
  [v4 setHashedDSID:v9];

  double v10 = [(FMFHandle *)self favoriteOrder];
  [v4 setFavoriteOrder:v10];

  objc_msgSend(v4, "setIdsStatus:", -[FMFHandle idsStatus](self, "idsStatus"));
  objc_msgSend(v4, "setReachable:", -[FMFHandle reachable](self, "reachable"));
  v11 = [(FMFHandle *)self qualifiedIdentifier];
  [v4 setQualifiedIdentifier:v11];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFHandle *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(FMFHandle *)self serverId];
  [v4 encodeObject:v6 forKey:@"serverId"];

  id v7 = [(FMFHandle *)self dsid];
  [v4 encodeObject:v7 forKey:@"dsid"];

  v8 = [(FMFHandle *)self expiresByGroupId];
  [v4 encodeObject:v8 forKey:@"expiresByGroupId"];

  id v9 = [(FMFHandle *)self trackingTimestamp];
  [v4 encodeObject:v9 forKey:@"trackingTimestamp"];

  double v10 = [(FMFHandle *)self hashedDSID];
  [v4 encodeObject:v10 forKey:@"hashedDSID"];

  v11 = [(FMFHandle *)self favoriteOrder];
  [v4 encodeObject:v11 forKey:@"favoriteOrder"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[FMFHandle idsStatus](self, "idsStatus"), @"idsStatus");
  objc_msgSend(v4, "encodeBool:forKey:", -[FMFHandle reachable](self, "reachable"), @"reachable");
  id v12 = [(FMFHandle *)self qualifiedIdentifier];
  [v4 encodeObject:v12 forKey:@"qualifiedIdentifier"];
}

- (FMFHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (FMFHandle *)objc_alloc_init((Class)objc_opt_class());
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [(FMFHandle *)v5 setIdentifier:v6];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverId"];
  [(FMFHandle *)v5 setServerId:v7];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
  [(FMFHandle *)v5 setDsid:v8];

  id v9 = [v4 decodePropertyListForKey:@"expiresByGroupId"];
  [(FMFHandle *)v5 setExpiresByGroupId:v9];

  double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingTimestamp"];
  [(FMFHandle *)v5 setTrackingTimestamp:v10];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashedDSID"];
  [(FMFHandle *)v5 setHashedDSID:v11];

  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"favoriteOrder"];
  [(FMFHandle *)v5 setFavoriteOrder:v12];

  -[FMFHandle setIdsStatus:](v5, "setIdsStatus:", [v4 decodeIntegerForKey:@"idsStatus"]);
  -[FMFHandle setReachable:](v5, "setReachable:", [v4 decodeBoolForKey:@"reachable"]);
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"qualifiedIdentifier"];

  [(FMFHandle *)v5 setQualifiedIdentifier:v13];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(FMFHandle *)self comparisonIdentifier];
    id v7 = [v5 comparisonIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)comparisonIdentifier
{
  v2 = [(FMFHandle *)self identifier];
  id v3 = [v2 lowercaseString];

  return v3;
}

- (unint64_t)hash
{
  v2 = [(FMFHandle *)self comparisonIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(FMFHandle *)self identifier];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FMFHandle *)self identifier];
  id v6 = [v3 stringWithFormat:@"<%@ %p [%@]>", v4, self, v5];

  return v6;
}

- (int64_t)prettyNameCompare:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFHandle *)self prettyName];
  id v6 = [v4 prettyName];

  int64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (id)prettyName
{
  unint64_t v3 = [(FMFHandle *)self _prettyNameInternal];

  if (v3)
  {
    id v4 = [(FMFHandle *)self _prettyNameInternal];
  }
  else
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__1;
    v22 = __Block_byref_object_dispose__1;
    id v23 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = +[FMFSession sharedInstance];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __23__FMFHandle_prettyName__block_invoke;
    v15[3] = &unk_263FE72B8;
    v17 = &v18;
    int64_t v7 = v5;
    v16 = v7;
    [v6 getPrettyNameForHandle:self completion:v15];

    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v7, v8))
    {
      id v9 = LogCategory_Daemon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_20AD87000, v9, OS_LOG_TYPE_DEFAULT, "timeOut prettyName", v14, 2u);
      }
    }
    double v10 = (void *)v19[5];
    if (!v10 || ![v10 length])
    {
      uint64_t v11 = [(FMFHandle *)self identifier];
      id v12 = (void *)v19[5];
      v19[5] = v11;
    }
    [(FMFHandle *)self set_prettyNameInternal:v19[5]];
    id v4 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }

  return v4;
}

void __23__FMFHandle_prettyName__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  if (!v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  int64_t v7 = *(NSObject **)(a1 + 32);
  if (v7) {
    dispatch_semaphore_signal(v7);
  }
}

- (id)cachedPrettyName
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    dispatch_semaphore_t v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"FMFHandle.m" lineNumber:223 description:@"This method should run on Main thread"];
  }

  return [(FMFHandle *)self _prettyNameInternal];
}

- (void)prettyNameWithCompletion:(id)a3
{
  dispatch_semaphore_t v5 = (void (**)(id, void *))a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"FMFHandle.m" lineNumber:229 description:@"This method should run on Main thread"];
  }
  id v6 = [(FMFHandle *)self _prettyNameInternal];

  if (v6)
  {
    int64_t v7 = [(FMFHandle *)self _prettyNameInternal];
    v5[2](v5, v7);
  }
  else
  {
    id v8 = +[FMFSession sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__FMFHandle_prettyNameWithCompletion___block_invoke;
    v10[3] = &unk_263FE70B8;
    v10[4] = self;
    uint64_t v11 = v5;
    [v8 getPrettyNameForHandle:self completion:v10];
  }
}

void __38__FMFHandle_prettyNameWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) identifier];
  }
  id v6 = v5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__FMFHandle_prettyNameWithCompletion___block_invoke_2;
  block[3] = &unk_263FE72E0;
  int64_t v7 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __38__FMFHandle_prettyNameWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_prettyNameInternal:", *(void *)(a1 + 40));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)idsCorrelationIdentifierWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(FMFHandle *)self _idsCorrelationIdentifierInternal];

  if (v5)
  {
    id v6 = [(FMFHandle *)self _idsCorrelationIdentifierInternal];
    v4[2](v4, v6);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__FMFHandle_idsCorrelationIdentifierWithCompletion___block_invoke;
    v7[3] = &unk_263FE7308;
    v7[4] = self;
    id v8 = v4;
    [(FMFHandle *)self correlationIdentifierForHandle:self withCompletion:v7];
  }
}

void __52__FMFHandle_idsCorrelationIdentifierWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "set_idsCorrelationIdentifierInternal:", v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)recordId
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  uint64_t v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = +[FMFSession sharedInstance];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __21__FMFHandle_recordId__block_invoke;
  v11[3] = &unk_263FE72B8;
  v13 = &v14;
  id v5 = v3;
  id v12 = v5;
  [v4 getRecordIdForHandle:self completion:v11];

  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    int64_t v7 = LogCategory_Daemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "timeOut recordId", v10, 2u);
    }
  }
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __21__FMFHandle_recordId__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = *(NSObject **)(a1 + 32);
  if (v4) {
    dispatch_semaphore_signal(v4);
  }
}

- (void)clearFavoriteOrder
{
}

- (BOOL)isPhoneNumber
{
  dispatch_semaphore_t v3 = [MEMORY[0x263F089C0] decimalDigitCharacterSet];
  [v3 addCharactersInString:@"+()-"];
  id v4 = [MEMORY[0x263F08708] controlCharacterSet];
  [v3 formUnionWithCharacterSet:v4];

  id v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  [v3 formUnionWithCharacterSet:v5];

  dispatch_time_t v6 = [(FMFHandle *)self identifier];
  int64_t v7 = [v6 componentsSeparatedByCharactersInSet:v3];
  id v8 = [v7 componentsJoinedByString:&stru_26BEE3E40];

  LOBYTE(v6) = [v8 length] == 0;
  return (char)v6;
}

- (id)sanitizePhoneNumber:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F089C0], "decimalDigitCharacterSet", a3);
  [v4 addCharactersInString:@"+"];
  id v5 = [MEMORY[0x263F08708] controlCharacterSet];
  [v4 formUnionWithCharacterSet:v5];

  dispatch_time_t v6 = [v4 invertedSet];
  int64_t v7 = [(FMFHandle *)self identifier];
  id v8 = [v7 componentsSeparatedByCharactersInSet:v6];
  id v9 = [v8 componentsJoinedByString:&stru_26BEE3E40];

  return v9;
}

- (void)correlationIdentifierForHandle:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMFHandle *)self IDSRecipientFromHandle:v6];
  id v9 = [MEMORY[0x263F4A058] sharedInstance];
  id v10 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v8, 0);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  id v20 = 0;
  uint64_t v11 = MEMORY[0x263EF83A0];
  id v12 = MEMORY[0x263EF83A0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__FMFHandle_correlationIdentifierForHandle_withCompletion___block_invoke;
  v15[3] = &unk_263FE7330;
  id v13 = v8;
  id v16 = v13;
  uint64_t v18 = v19;
  id v14 = v7;
  id v17 = v14;
  [v9 currentRemoteDevicesForDestinations:v10 service:@"com.apple.private.alloy.fmf" listenerID:@"com.apple.private.alloy.fmf" queue:v11 completionBlock:v15];

  _Block_object_dispose(v19, 8);
}

void __59__FMFHandle_correlationIdentifierForHandle_withCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = [a2 objectForKeyedSubscript:a1[4]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) senderCorrelationIdentifier];
        uint64_t v9 = *(void *)(a1[6] + 8);
        id v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (id)IDSRecipientFromHandle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FMFHandle *)self isPhoneNumber];
  uint64_t v6 = [v4 identifier];

  if (v5) {
    uint64_t v7 = IDSCopyIDForPhoneNumber();
  }
  else {
    uint64_t v7 = MEMORY[0x21052D750](v6);
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)serverId
{
  return self->_serverId;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (BOOL)isFamilyMember
{
  return self->_isFamilyMember;
}

- (void)setIsFamilyMember:(BOOL)a3
{
  self->_isFamilyMember = a3;
}

- (NSArray)aliasServerIds
{
  return self->_aliasServerIds;
}

- (void)setAliasServerIds:(id)a3
{
}

- (NSArray)invitationSentToIds
{
  return self->_invitationSentToIds;
}

- (void)setInvitationSentToIds:(id)a3
{
}

- (NSDictionary)expiresByGroupId
{
  return self->_expiresByGroupId;
}

- (void)setExpiresByGroupId:(id)a3
{
}

- (NSString)hashedDSID
{
  return self->_hashedDSID;
}

- (void)setHashedDSID:(id)a3
{
}

- (BOOL)isPending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (NSNumber)trackingTimestamp
{
  return self->_trackingTimestamp;
}

- (void)setTrackingTimestamp:(id)a3
{
}

- (NSNumber)favoriteOrder
{
  return self->_favoriteOrder;
}

- (void)setFavoriteOrder:(id)a3
{
}

- (NSString)_prettyNameInternal
{
  return self->__prettyNameInternal;
}

- (void)set_prettyNameInternal:(id)a3
{
}

- (int64_t)idsStatus
{
  return self->_idsStatus;
}

- (void)setIdsStatus:(int64_t)a3
{
  self->_idsStatus = a3;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (NSString)qualifiedIdentifier
{
  return self->_qualifiedIdentifier;
}

- (void)setQualifiedIdentifier:(id)a3
{
}

- (NSString)_idsCorrelationIdentifierInternal
{
  return self->__idsCorrelationIdentifierInternal;
}

- (void)set_idsCorrelationIdentifierInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__idsCorrelationIdentifierInternal, 0);
  objc_storeStrong((id *)&self->_qualifiedIdentifier, 0);
  objc_storeStrong((id *)&self->__prettyNameInternal, 0);
  objc_storeStrong((id *)&self->_favoriteOrder, 0);
  objc_storeStrong((id *)&self->_trackingTimestamp, 0);
  objc_storeStrong((id *)&self->_hashedDSID, 0);
  objc_storeStrong((id *)&self->_expiresByGroupId, 0);
  objc_storeStrong((id *)&self->_invitationSentToIds, 0);
  objc_storeStrong((id *)&self->_aliasServerIds, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_serverId, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end