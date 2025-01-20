@interface PHCloudInvitation
+ (id)fetchType;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
- (BOOL)isMine;
- (Class)changeRequestClass;
- (NSArray)inviteeEmails;
- (NSArray)inviteePhones;
- (NSDate)inviteeSubscriptionDate;
- (NSNumber)inviteeEmailKey;
- (NSString)albumGUID;
- (NSString)cloudGUID;
- (NSString)invitationStateDescription;
- (NSString)inviteeFirstName;
- (NSString)inviteeFullName;
- (NSString)inviteeHashedPersonID;
- (NSString)inviteeLastName;
- (PHCloudInvitation)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (id)inviteeDisplayNameIncludingEmail:(BOOL)a3;
- (id)personInfoManager;
- (int)invitationState;
- (int)invitationStateLocal;
@end

@implementation PHCloudInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_inviteeSubscriptionDate, 0);
  objc_storeStrong((id *)&self->_inviteeFullName, 0);
  objc_storeStrong((id *)&self->_inviteeLastName, 0);

  objc_storeStrong((id *)&self->_inviteeFirstName, 0);
}

- (NSString)inviteeHashedPersonID
{
  return self->_inviteeHashedPersonID;
}

- (NSNumber)inviteeEmailKey
{
  return self->_inviteeEmailKey;
}

- (int)invitationStateLocal
{
  return self->_invitationStateLocal;
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (NSDate)inviteeSubscriptionDate
{
  return self->_inviteeSubscriptionDate;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (NSString)inviteeFullName
{
  return self->_inviteeFullName;
}

- (NSString)inviteeLastName
{
  return self->_inviteeLastName;
}

- (NSString)inviteeFirstName
{
  return self->_inviteeFirstName;
}

- (int)invitationState
{
  return self->_invitationState;
}

- (NSString)invitationStateDescription
{
  [(PHCloudInvitation *)self invitationState];
  v3 = 0;
  switch(@"UNSUBSCRIBED")
  {
    case 0u:
    case 2u:
      break;
    case 1u:
      [(PHCloudInvitation *)self invitationStateLocal];
      goto LABEL_3;
    default:
LABEL_3:
      v3 = PLLocalizedFrameworkString();
      break;
  }

  return (NSString *)v3;
}

- (NSArray)inviteePhones
{
  v3 = [(PHCloudInvitation *)self personInfoManager];
  v4 = [(PHCloudInvitation *)self cloudGUID];
  v5 = [v3 phonesForInvitationRecordGUID:v4];

  return (NSArray *)v5;
}

- (NSArray)inviteeEmails
{
  v3 = [(PHCloudInvitation *)self personInfoManager];
  v4 = [(PHCloudInvitation *)self cloudGUID];
  v5 = [v3 emailsForInvitationRecordGUID:v4];

  return (NSArray *)v5;
}

- (id)personInfoManager
{
  v2 = [(PHObject *)self photoLibrary];
  v3 = [v2 photoLibraryBundle];
  v4 = [v3 personInfoManager];

  return v4;
}

- (id)inviteeDisplayNameIncludingEmail:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v5 = [(PHCloudInvitation *)self inviteeFirstName];
  v6 = [(PHCloudInvitation *)self inviteeLastName];
  v7 = [(PHCloudInvitation *)self inviteeFullName];
  v8 = [(PHCloudInvitation *)self inviteeEmails];
  v9 = [v8 firstObject];

  v10 = [(PHCloudInvitation *)self inviteePhones];
  if ([v7 length])
  {
    v11 = v7;
    goto LABEL_3;
  }
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    v11 = [NSString stringWithFormat:@"%@ %@", v5, v6];
    goto LABEL_3;
  }
  if ([v5 length])
  {
    v11 = v5;
    goto LABEL_3;
  }
  if ([v6 length])
  {
    v11 = v6;
LABEL_3:
    v12 = v11;
    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  if ([v9 length])
  {
    v12 = v9;
    goto LABEL_6;
  }
  if (v10 && [v10 count])
  {
    BOOL v21 = v3;
    v22 = v10;
    v23 = v6;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v12 = 0;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          if (v12)
          {
            uint64_t v20 = [(__CFString *)v12 stringByAppendingFormat:@" / %@", *(void *)(*((void *)&v24 + 1) + 8 * i)];

            v12 = (__CFString *)v20;
          }
          else
          {
            v12 = (__CFString *)*(id *)(*((void *)&v24 + 1) + 8 * i);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }
    else
    {
      v12 = 0;
    }

    v10 = v22;
    v6 = v23;
    if (!v21)
    {
LABEL_6:
      if (v12) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
LABEL_4:
    if ([v9 length])
    {
      uint64_t v13 = [(__CFString *)v12 stringByAppendingFormat:@" (%@)", v9];

      v12 = (__CFString *)v13;
    }
    goto LABEL_6;
  }
  if (v3)
  {
    v12 = 0;
    goto LABEL_4;
  }
LABEL_7:
  v12 = &stru_1EEAC1950;
LABEL_8:

  return v12;
}

- (PHCloudInvitation)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 objectForKeyedSubscript:@"uuid"];

  if (!v10)
  {
    v11 = PHFetchDictionaryAccessingMutableCopy(v8);
    v12 = [v11 objectForKeyedSubscript:@"cloudGUID"];
    [v11 setObject:v12 forKeyedSubscript:@"uuid"];

    id v8 = v11;
  }
  v30.receiver = self;
  v30.super_class = (Class)PHCloudInvitation;
  uint64_t v13 = [(PHObject *)&v30 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:v9];
  if (v13)
  {
    v14 = [v8 objectForKeyedSubscript:@"isMine"];
    v13->_isMine = [v14 BOOLValue];

    id v15 = [v8 objectForKeyedSubscript:@"invitationState"];
    v13->_invitationState = [v15 intValue];

    uint64_t v16 = [v8 objectForKeyedSubscript:@"invitationStateLocal"];
    v13->_invitationStateLocal = [v16 intValue];

    uint64_t v17 = [v8 objectForKeyedSubscript:@"inviteeFirstName"];
    inviteeFirstName = v13->_inviteeFirstName;
    v13->_inviteeFirstName = (NSString *)v17;

    uint64_t v19 = [v8 objectForKeyedSubscript:@"inviteeLastName"];
    inviteeLastName = v13->_inviteeLastName;
    v13->_inviteeLastName = (NSString *)v19;

    uint64_t v21 = [v8 objectForKeyedSubscript:@"inviteeFullName"];
    inviteeFullName = v13->_inviteeFullName;
    v13->_inviteeFullName = (NSString *)v21;

    uint64_t v23 = [v8 objectForKeyedSubscript:@"inviteeSubscriptionDate"];
    inviteeSubscriptionDate = v13->_inviteeSubscriptionDate;
    v13->_inviteeSubscriptionDate = (NSDate *)v23;

    v13->_inviteeEmailKey = (NSNumber *)(id)[v8 objectForKeyedSubscript:@"inviteeEmailKey"];
    v13->_inviteeHashedPersonID = (NSString *)(id)[v8 objectForKeyedSubscript:@"inviteeHashedPersonID"];
    uint64_t v25 = [v8 objectForKeyedSubscript:@"albumGUID"];
    albumGUID = v13->_albumGUID;
    v13->_albumGUID = (NSString *)v25;

    uint64_t v27 = [v8 objectForKeyedSubscript:@"cloudGUID"];
    cloudGUID = v13->_cloudGUID;
    v13->_cloudGUID = (NSString *)v27;
  }
  return v13;
}

- (Class)changeRequestClass
{
  return 0;
}

+ (id)fetchType
{
  v2 = @"PHCloudInvitation";
  return @"PHCloudInvitation";
}

+ (id)managedEntityName
{
  return @"CloudSharedAlbumInvitationRecord";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PHCloudInvitation_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_22002 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_22002, block);
  }
  BOOL v3 = (void *)propertiesToFetchWithHint__array_22003;

  return v3;
}

void __47__PHCloudInvitation_propertiesToFetchWithHint___block_invoke()
{
  v4[12] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v0 setName:@"objectID"];
  v1 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v0 setExpression:v1];

  [v0 setExpressionResultType:2000];
  v4[0] = v0;
  v4[1] = @"albumGUID";
  v4[2] = @"cloudGUID";
  v4[3] = @"invitationState";
  v4[4] = @"invitationStateLocal";
  v4[5] = @"inviteeEmailKey";
  v4[6] = @"inviteeFirstName";
  v4[7] = @"inviteeFullName";
  v4[8] = @"inviteeHashedPersonID";
  v4[9] = @"inviteeLastName";
  v4[10] = @"inviteeSubscriptionDate";
  v4[11] = @"isMine";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:12];
  BOOL v3 = (void *)propertiesToFetchWithHint__array_22003;
  propertiesToFetchWithHint__array_22003 = v2;
}

@end