@interface AFHomeAccessoryInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFHomeAccessoryInfo)init;
- (AFHomeAccessoryInfo)initWithBuilder:(id)a3;
- (AFHomeAccessoryInfo)initWithCoder:(id)a3;
- (AFHomeAccessoryInfo)initWithDictionaryRepresentation:(id)a3;
- (AFHomeAccessoryInfo)initWithUniqueIdentifier:(id)a3 loggingUniqueIdentifier:(id)a4 name:(id)a5 model:(id)a6 roomName:(id)a7 assistantIdentifier:(id)a8 isSpeaker:(BOOL)a9 hasActiveThirdPartyMusicSubscription:(BOOL)a10 manufacturer:(id)a11 categoryType:(id)a12 schemaCategoryType:(int64_t)a13;
- (BOOL)hasActiveThirdPartyMusicSubscription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpeaker;
- (NSString)assistantIdentifier;
- (NSString)categoryType;
- (NSString)description;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)roomName;
- (NSUUID)loggingUniqueIdentifier;
- (NSUUID)uniqueIdentifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)schemaCategoryType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFHomeAccessoryInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_loggingUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (int64_t)schemaCategoryType
{
  return self->_schemaCategoryType;
}

- (NSString)categoryType
{
  return self->_categoryType;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (BOOL)hasActiveThirdPartyMusicSubscription
{
  return self->_hasActiveThirdPartyMusicSubscription;
}

- (BOOL)isSpeaker
{
  return self->_isSpeaker;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)loggingUniqueIdentifier
{
  return self->_loggingUniqueIdentifier;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  loggingUniqueIdentifier = self->_loggingUniqueIdentifier;
  if (loggingUniqueIdentifier) {
    [v4 setObject:loggingUniqueIdentifier forKey:@"loggingUniqueIdentifier"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  model = self->_model;
  if (model) {
    [v4 setObject:model forKey:@"model"];
  }
  roomName = self->_roomName;
  if (roomName) {
    [v4 setObject:roomName forKey:@"roomName"];
  }
  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier) {
    [v4 setObject:assistantIdentifier forKey:@"assistantIdentifier"];
  }
  v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSpeaker];
  [v4 setObject:v11 forKey:@"isSpeaker"];

  v12 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hasActiveThirdPartyMusicSubscription];
  [v4 setObject:v12 forKey:@"hasActiveThirdPartyMusicSubscription"];

  manufacturer = self->_manufacturer;
  if (manufacturer) {
    [v4 setObject:manufacturer forKey:@"manufacturer"];
  }
  categoryType = self->_categoryType;
  if (categoryType) {
    [v4 setObject:categoryType forKey:@"categoryType"];
  }
  v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_schemaCategoryType];
  [v4 setObject:v15 forKey:@"schemaCategoryType"];

  v16 = (void *)[v4 copy];
  return v16;
}

- (AFHomeAccessoryInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"uniqueIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v33 = v6;
    }
    else {
      id v33 = 0;
    }

    v8 = [v5 objectForKey:@"loggingUniqueIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v32 = v8;
    }
    else {
      id v32 = 0;
    }

    v9 = [v5 objectForKey:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v31 = v9;
    }
    else {
      id v31 = 0;
    }

    v10 = [v5 objectForKey:@"model"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = v10;
    }
    else {
      id v30 = 0;
    }

    v11 = [v5 objectForKey:@"roomName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v11;
    }
    else {
      id v29 = 0;
    }

    v12 = [v5 objectForKey:@"assistantIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v5 objectForKey:@"isSpeaker"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    char v16 = [v15 BOOLValue];
    v17 = [v5 objectForKey:@"hasActiveThirdPartyMusicSubscription"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    char v19 = [v18 BOOLValue];
    v20 = [v5 objectForKey:@"manufacturer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    v22 = [v5 objectForKey:@"categoryType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    v24 = [v5 objectForKey:@"schemaCategoryType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }

    uint64_t v26 = [v25 integerValue];
    BYTE1(v28) = v19;
    LOBYTE(v28) = v16;
    self = -[AFHomeAccessoryInfo initWithUniqueIdentifier:loggingUniqueIdentifier:name:model:roomName:assistantIdentifier:isSpeaker:hasActiveThirdPartyMusicSubscription:manufacturer:categoryType:schemaCategoryType:](self, "initWithUniqueIdentifier:loggingUniqueIdentifier:name:model:roomName:assistantIdentifier:isSpeaker:hasActiveThirdPartyMusicSubscription:manufacturer:categoryType:schemaCategoryType:", v33, v32, v31, v30, v29, v13, v28, v21, v23, v26);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:uniqueIdentifier forKey:@"AFHomeAccessoryInfo::uniqueIdentifier"];
  [v5 encodeObject:self->_loggingUniqueIdentifier forKey:@"AFHomeAccessoryInfo::loggingUniqueIdentifier"];
  [v5 encodeObject:self->_name forKey:@"AFHomeAccessoryInfo::name"];
  [v5 encodeObject:self->_model forKey:@"AFHomeAccessoryInfo::model"];
  [v5 encodeObject:self->_roomName forKey:@"AFHomeAccessoryInfo::roomName"];
  [v5 encodeObject:self->_assistantIdentifier forKey:@"AFHomeAccessoryInfo::assistantIdentifier"];
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSpeaker];
  [v5 encodeObject:v6 forKey:@"AFHomeAccessoryInfo::isSpeaker"];

  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hasActiveThirdPartyMusicSubscription];
  [v5 encodeObject:v7 forKey:@"AFHomeAccessoryInfo::hasActiveThirdPartyMusicSubscription"];

  [v5 encodeObject:self->_manufacturer forKey:@"AFHomeAccessoryInfo::manufacturer"];
  [v5 encodeObject:self->_categoryType forKey:@"AFHomeAccessoryInfo::categoryType"];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_schemaCategoryType];
  [v5 encodeObject:v8 forKey:@"AFHomeAccessoryInfo::schemaCategoryType"];
}

- (AFHomeAccessoryInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  char v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::uniqueIdentifier"];
  id v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::loggingUniqueIdentifier"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::name"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::model"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::roomName"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::assistantIdentifier"];
  id v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::isSpeaker"];
  char v9 = [v8 BOOLValue];

  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::hasActiveThirdPartyMusicSubscription"];
  LOBYTE(v8) = [v10 BOOLValue];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::manufacturer"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::categoryType"];
  id v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessoryInfo::schemaCategoryType"];

  uint64_t v14 = [v13 integerValue];
  BYTE1(v17) = (_BYTE)v8;
  LOBYTE(v17) = v9;
  id v15 = -[AFHomeAccessoryInfo initWithUniqueIdentifier:loggingUniqueIdentifier:name:model:roomName:assistantIdentifier:isSpeaker:hasActiveThirdPartyMusicSubscription:manufacturer:categoryType:schemaCategoryType:](self, "initWithUniqueIdentifier:loggingUniqueIdentifier:name:model:roomName:assistantIdentifier:isSpeaker:hasActiveThirdPartyMusicSubscription:manufacturer:categoryType:schemaCategoryType:", v19, v18, v4, v5, v6, v7, v17, v11, v12, v14);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFHomeAccessoryInfo *)a3;
  if (self == v4)
  {
    BOOL v25 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL isSpeaker = self->_isSpeaker;
      if (isSpeaker == [(AFHomeAccessoryInfo *)v5 isSpeaker]
        && (BOOL hasActiveThirdPartyMusicSubscription = self->_hasActiveThirdPartyMusicSubscription,
            hasActiveThirdPartyMusicSubscription == [(AFHomeAccessoryInfo *)v5 hasActiveThirdPartyMusicSubscription])&& (int64_t schemaCategoryType = self->_schemaCategoryType, schemaCategoryType == [(AFHomeAccessoryInfo *)v5 schemaCategoryType]))
      {
        char v9 = [(AFHomeAccessoryInfo *)v5 uniqueIdentifier];
        uniqueIdentifier = self->_uniqueIdentifier;
        if (uniqueIdentifier == v9 || [(NSUUID *)uniqueIdentifier isEqual:v9])
        {
          v11 = [(AFHomeAccessoryInfo *)v5 loggingUniqueIdentifier];
          loggingUniqueIdentifier = self->_loggingUniqueIdentifier;
          if (loggingUniqueIdentifier == v11
            || [(NSUUID *)loggingUniqueIdentifier isEqual:v11])
          {
            id v13 = [(AFHomeAccessoryInfo *)v5 name];
            name = self->_name;
            if (name == v13 || [(NSString *)name isEqual:v13])
            {
              id v15 = [(AFHomeAccessoryInfo *)v5 model];
              model = self->_model;
              if (model == v15 || [(NSString *)model isEqual:v15])
              {
                uint64_t v17 = [(AFHomeAccessoryInfo *)v5 roomName];
                roomName = self->_roomName;
                if (roomName == v17 || [(NSString *)roomName isEqual:v17])
                {
                  char v19 = [(AFHomeAccessoryInfo *)v5 assistantIdentifier];
                  assistantIdentifier = self->_assistantIdentifier;
                  if (assistantIdentifier == v19
                    || [(NSString *)assistantIdentifier isEqual:v19])
                  {
                    id v21 = [(AFHomeAccessoryInfo *)v5 manufacturer];
                    manufacturer = self->_manufacturer;
                    if (manufacturer == v21 || [(NSString *)manufacturer isEqual:v21])
                    {
                      v27 = v21;
                      id v23 = [(AFHomeAccessoryInfo *)v5 categoryType];
                      categoryType = self->_categoryType;
                      BOOL v25 = categoryType == v23 || [(NSString *)categoryType isEqual:v23];

                      id v21 = v27;
                    }
                    else
                    {
                      BOOL v25 = 0;
                    }
                  }
                  else
                  {
                    BOOL v25 = 0;
                  }
                }
                else
                {
                  BOOL v25 = 0;
                }
              }
              else
              {
                BOOL v25 = 0;
              }
            }
            else
            {
              BOOL v25 = 0;
            }
          }
          else
          {
            BOOL v25 = 0;
          }
        }
        else
        {
          BOOL v25 = 0;
        }
      }
      else
      {
        BOOL v25 = 0;
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }

  return v25;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_uniqueIdentifier hash];
  uint64_t v4 = [(NSUUID *)self->_loggingUniqueIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_name hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_model hash];
  NSUInteger v7 = [(NSString *)self->_roomName hash];
  NSUInteger v8 = v6 ^ v7 ^ [(NSString *)self->_assistantIdentifier hash];
  char v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSpeaker];
  uint64_t v10 = [v9 hash];
  v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hasActiveThirdPartyMusicSubscription];
  uint64_t v12 = v8 ^ v10 ^ [v11 hash];
  NSUInteger v13 = [(NSString *)self->_manufacturer hash];
  NSUInteger v14 = v13 ^ [(NSString *)self->_categoryType hash];
  id v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_schemaCategoryType];
  unint64_t v16 = v12 ^ v14 ^ [v15 hash];

  return v16;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)AFHomeAccessoryInfo;
  uint64_t v5 = [(AFHomeAccessoryInfo *)&v11 description];
  NSUInteger v6 = (void *)v5;
  NSUInteger v7 = @"YES";
  if (self->_isSpeaker) {
    NSUInteger v8 = @"YES";
  }
  else {
    NSUInteger v8 = @"NO";
  }
  if (!self->_hasActiveThirdPartyMusicSubscription) {
    NSUInteger v7 = @"NO";
  }
  char v9 = (void *)[v4 initWithFormat:@"%@ {uniqueIdentifier = %@, loggingUniqueIdentifier = %@, name = %@, model = %@, roomName = %@, assistantIdentifier = %@, isSpeaker = %@, hasActiveThirdPartyMusicSubscription = %@, manufacturer = %@, categoryType = %@, schemaCategoryType = %lld}", v5, *(_OWORD *)&self->_uniqueIdentifier, *(_OWORD *)&self->_name, self->_roomName, self->_assistantIdentifier, v8, v7, self->_manufacturer, self->_categoryType, self->_schemaCategoryType];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(AFHomeAccessoryInfo *)self _descriptionWithIndent:0];
}

- (AFHomeAccessoryInfo)initWithUniqueIdentifier:(id)a3 loggingUniqueIdentifier:(id)a4 name:(id)a5 model:(id)a6 roomName:(id)a7 assistantIdentifier:(id)a8 isSpeaker:(BOOL)a9 hasActiveThirdPartyMusicSubscription:(BOOL)a10 manufacturer:(id)a11 categoryType:(id)a12 schemaCategoryType:(int64_t)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a11;
  id v25 = a12;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __204__AFHomeAccessoryInfo_initWithUniqueIdentifier_loggingUniqueIdentifier_name_model_roomName_assistantIdentifier_isSpeaker_hasActiveThirdPartyMusicSubscription_manufacturer_categoryType_schemaCategoryType___block_invoke;
  v37[3] = &unk_1E59276F0;
  id v38 = v18;
  id v39 = v19;
  id v40 = v20;
  id v41 = v21;
  id v42 = v22;
  id v43 = v23;
  BOOL v47 = a9;
  BOOL v48 = a10;
  id v44 = v24;
  id v45 = v25;
  int64_t v46 = a13;
  id v26 = v25;
  id v27 = v24;
  id v28 = v23;
  id v29 = v22;
  id v30 = v21;
  id v31 = v20;
  id v32 = v19;
  id v33 = v18;
  v34 = [(AFHomeAccessoryInfo *)self initWithBuilder:v37];

  return v34;
}

void __204__AFHomeAccessoryInfo_initWithUniqueIdentifier_loggingUniqueIdentifier_name_model_roomName_assistantIdentifier_isSpeaker_hasActiveThirdPartyMusicSubscription_manufacturer_categoryType_schemaCategoryType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setUniqueIdentifier:v3];
  [v4 setLoggingUniqueIdentifier:*(void *)(a1 + 40)];
  [v4 setName:*(void *)(a1 + 48)];
  [v4 setModel:*(void *)(a1 + 56)];
  [v4 setRoomName:*(void *)(a1 + 64)];
  [v4 setAssistantIdentifier:*(void *)(a1 + 72)];
  [v4 setIsSpeaker:*(unsigned __int8 *)(a1 + 104)];
  [v4 setHasActiveThirdPartyMusicSubscription:*(unsigned __int8 *)(a1 + 105)];
  [v4 setManufacturer:*(void *)(a1 + 80)];
  [v4 setCategoryType:*(void *)(a1 + 88)];
  [v4 setSchemaCategoryType:*(void *)(a1 + 96)];
}

- (AFHomeAccessoryInfo)init
{
  return [(AFHomeAccessoryInfo *)self initWithBuilder:0];
}

- (AFHomeAccessoryInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFHomeAccessoryInfoMutation *))a3;
  v33.receiver = self;
  v33.super_class = (Class)AFHomeAccessoryInfo;
  uint64_t v5 = [(AFHomeAccessoryInfo *)&v33 init];
  NSUInteger v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFHomeAccessoryInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFHomeAccessoryInfoMutation *)v7 isDirty])
    {
      NSUInteger v8 = [(_AFHomeAccessoryInfoMutation *)v7 getUniqueIdentifier];
      uint64_t v9 = [v8 copy];
      uniqueIdentifier = v6->_uniqueIdentifier;
      v6->_uniqueIdentifier = (NSUUID *)v9;

      objc_super v11 = [(_AFHomeAccessoryInfoMutation *)v7 getLoggingUniqueIdentifier];
      uint64_t v12 = [v11 copy];
      loggingUniqueIdentifier = v6->_loggingUniqueIdentifier;
      v6->_loggingUniqueIdentifier = (NSUUID *)v12;

      NSUInteger v14 = [(_AFHomeAccessoryInfoMutation *)v7 getName];
      uint64_t v15 = [v14 copy];
      name = v6->_name;
      v6->_name = (NSString *)v15;

      uint64_t v17 = [(_AFHomeAccessoryInfoMutation *)v7 getModel];
      uint64_t v18 = [v17 copy];
      model = v6->_model;
      v6->_model = (NSString *)v18;

      id v20 = [(_AFHomeAccessoryInfoMutation *)v7 getRoomName];
      uint64_t v21 = [v20 copy];
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v21;

      id v23 = [(_AFHomeAccessoryInfoMutation *)v7 getAssistantIdentifier];
      uint64_t v24 = [v23 copy];
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v24;

      v6->_BOOL isSpeaker = [(_AFHomeAccessoryInfoMutation *)v7 getIsSpeaker];
      v6->_BOOL hasActiveThirdPartyMusicSubscription = [(_AFHomeAccessoryInfoMutation *)v7 getHasActiveThirdPartyMusicSubscription];
      id v26 = [(_AFHomeAccessoryInfoMutation *)v7 getManufacturer];
      uint64_t v27 = [v26 copy];
      manufacturer = v6->_manufacturer;
      v6->_manufacturer = (NSString *)v27;

      id v29 = [(_AFHomeAccessoryInfoMutation *)v7 getCategoryType];
      uint64_t v30 = [v29 copy];
      categoryType = v6->_categoryType;
      v6->_categoryType = (NSString *)v30;

      v6->_int64_t schemaCategoryType = [(_AFHomeAccessoryInfoMutation *)v7 getSchemaCategoryType];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFHomeAccessoryInfoMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFHomeAccessoryInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFHomeAccessoryInfoMutation *)v5 isDirty])
    {
      NSUInteger v6 = objc_alloc_init(AFHomeAccessoryInfo);
      NSUInteger v7 = [(_AFHomeAccessoryInfoMutation *)v5 getUniqueIdentifier];
      uint64_t v8 = [v7 copy];
      uniqueIdentifier = v6->_uniqueIdentifier;
      v6->_uniqueIdentifier = (NSUUID *)v8;

      uint64_t v10 = [(_AFHomeAccessoryInfoMutation *)v5 getLoggingUniqueIdentifier];
      uint64_t v11 = [v10 copy];
      loggingUniqueIdentifier = v6->_loggingUniqueIdentifier;
      v6->_loggingUniqueIdentifier = (NSUUID *)v11;

      NSUInteger v13 = [(_AFHomeAccessoryInfoMutation *)v5 getName];
      uint64_t v14 = [v13 copy];
      name = v6->_name;
      v6->_name = (NSString *)v14;

      unint64_t v16 = [(_AFHomeAccessoryInfoMutation *)v5 getModel];
      uint64_t v17 = [v16 copy];
      model = v6->_model;
      v6->_model = (NSString *)v17;

      id v19 = [(_AFHomeAccessoryInfoMutation *)v5 getRoomName];
      uint64_t v20 = [v19 copy];
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v20;

      id v22 = [(_AFHomeAccessoryInfoMutation *)v5 getAssistantIdentifier];
      uint64_t v23 = [v22 copy];
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v23;

      v6->_BOOL isSpeaker = [(_AFHomeAccessoryInfoMutation *)v5 getIsSpeaker];
      v6->_BOOL hasActiveThirdPartyMusicSubscription = [(_AFHomeAccessoryInfoMutation *)v5 getHasActiveThirdPartyMusicSubscription];
      id v25 = [(_AFHomeAccessoryInfoMutation *)v5 getManufacturer];
      uint64_t v26 = [v25 copy];
      manufacturer = v6->_manufacturer;
      v6->_manufacturer = (NSString *)v26;

      id v28 = [(_AFHomeAccessoryInfoMutation *)v5 getCategoryType];
      uint64_t v29 = [v28 copy];
      categoryType = v6->_categoryType;
      v6->_categoryType = (NSString *)v29;

      v6->_int64_t schemaCategoryType = [(_AFHomeAccessoryInfoMutation *)v5 getSchemaCategoryType];
    }
    else
    {
      NSUInteger v6 = (AFHomeAccessoryInfo *)[(AFHomeAccessoryInfo *)self copy];
    }
  }
  else
  {
    NSUInteger v6 = (AFHomeAccessoryInfo *)[(AFHomeAccessoryInfo *)self copy];
  }

  return v6;
}

@end