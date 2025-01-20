@interface ADPeerInfo
+ (id)_queue;
+ (id)locallyPairedPeerInfo;
+ (void)updateSharedInfoWithIdentifier:(id)a3 productType:(id)a4 buildVersion:(id)a5;
- (ADPeerInfo)initWithAFPeerInfo:(id)a3;
- (ADPeerInfo)initWithIDSIdentifer:(id)a3;
- (ADPeerInfo)initWithIDSIdentifer:(id)a3 productType:(id)a4 buildVersion:(id)a5 name:(id)a6;
- (ADPeerInfo)initWithUniqueIdentifer:(id)a3;
- (BOOL)isDeviceOwnedByCurrentUser;
- (BOOL)isEqual:(id)a3;
- (NSArray)airPlayRouteIdentifiers;
- (NSDictionary)dictionaryRepresentation;
- (NSString)aceVersion;
- (NSString)assistantIdentifier;
- (NSString)buildVersion;
- (NSString)homeKitAccessoryIdentifier;
- (NSString)idsDeviceUniqueIdentifier;
- (NSString)idsFirstRoutableDestination;
- (NSString)idsIdentifier;
- (NSString)mediaSystemIdentifier;
- (NSString)name;
- (NSString)productType;
- (NSString)rapportEffectiveIdentifier;
- (NSString)roomName;
- (NSString)userInterfaceIdiom;
- (id)afPeerInfo;
- (id)description;
- (unint64_t)hash;
- (unint64_t)preferredMessagingOptionsForCommands;
- (void)setAceVersion:(id)a3;
- (void)setAirPlayRouteIdentifiers:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setDeviceOwnedByCurrentUser:(BOOL)a3;
- (void)setHomeKitAccessoryIdentifier:(id)a3;
- (void)setIdsDeviceUniqueIdentifier:(id)a3;
- (void)setIdsFirstRoutableDestination:(id)a3;
- (void)setMediaSystemIdentifier:(id)a3;
- (void)setPreferredMessagingOptionsForCommands:(unint64_t)a3;
- (void)setRapportEffectiveIdentifier:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setUserInterfaceIdiom:(id)a3;
@end

@implementation ADPeerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceVersion, 0);
  objc_storeStrong((id *)&self->_userInterfaceIdiom, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_airPlayRouteIdentifiers, 0);
  objc_storeStrong((id *)&self->_idsFirstRoutableDestination, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_idsDeviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (void)setAceVersion:(id)a3
{
}

- (NSString)aceVersion
{
  return self->_aceVersion;
}

- (void)setUserInterfaceIdiom:(id)a3
{
}

- (NSString)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setPreferredMessagingOptionsForCommands:(unint64_t)a3
{
  self->_preferredMessagingOptionsForCommands = a3;
}

- (unint64_t)preferredMessagingOptionsForCommands
{
  return self->_preferredMessagingOptionsForCommands;
}

- (void)setRoomName:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setMediaSystemIdentifier:(id)a3
{
}

- (NSString)mediaSystemIdentifier
{
  return self->_mediaSystemIdentifier;
}

- (void)setHomeKitAccessoryIdentifier:(id)a3
{
}

- (NSString)homeKitAccessoryIdentifier
{
  return self->_homeKitAccessoryIdentifier;
}

- (void)setRapportEffectiveIdentifier:(id)a3
{
}

- (NSString)rapportEffectiveIdentifier
{
  return self->_rapportEffectiveIdentifier;
}

- (void)setAirPlayRouteIdentifiers:(id)a3
{
}

- (NSArray)airPlayRouteIdentifiers
{
  return self->_airPlayRouteIdentifiers;
}

- (void)setIdsFirstRoutableDestination:(id)a3
{
}

- (NSString)idsFirstRoutableDestination
{
  return self->_idsFirstRoutableDestination;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (void)setDeviceOwnedByCurrentUser:(BOOL)a3
{
  self->_deviceOwnedByCurrentUser = a3;
}

- (BOOL)isDeviceOwnedByCurrentUser
{
  return self->_deviceOwnedByCurrentUser;
}

- (void)setIdsDeviceUniqueIdentifier:(id)a3
{
}

- (NSString)idsDeviceUniqueIdentifier
{
  return self->_idsDeviceUniqueIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ADPeerInfo *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ADPeerInfo *)v5 idsIdentifier];
      idsIdentifier = self->_idsIdentifier;
      if (idsIdentifier == v6)
      {
        v9 = [(ADPeerInfo *)v5 productType];
      }
      else
      {
        if (!idsIdentifier)
        {
          v9 = [(ADPeerInfo *)v5 productType];
          goto LABEL_15;
        }
        unsigned int v8 = [(NSString *)idsIdentifier isEqualToString:v6];
        v9 = [(ADPeerInfo *)v5 productType];
        if (!v8) {
          goto LABEL_15;
        }
      }
      productType = self->_productType;
      if (productType == v9)
      {
        v13 = [(ADPeerInfo *)v5 buildVersion];
LABEL_20:
        buildVersion = self->_buildVersion;
        if (buildVersion == v13)
        {
          unsigned __int8 v10 = 1;
          goto LABEL_17;
        }
        if (buildVersion)
        {
          unsigned __int8 v10 = [(NSString *)buildVersion isEqualToString:v13];
          goto LABEL_17;
        }
LABEL_16:
        unsigned __int8 v10 = 0;
LABEL_17:

        goto LABEL_18;
      }
      if (productType)
      {
        unsigned int v12 = [(NSString *)productType isEqualToString:v9];
        v13 = [(ADPeerInfo *)v5 buildVersion];
        if (!v12) {
          goto LABEL_16;
        }
        goto LABEL_20;
      }
LABEL_15:
      v13 = [(ADPeerInfo *)v5 buildVersion];
      goto LABEL_16;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  return [(NSString *)self->_idsIdentifier hash];
}

- (id)afPeerInfo
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10035DDD8;
  v4[3] = &unk_10050DB08;
  v4[4] = self;
  id v2 = +[AFPeerInfo newWithBuilder:v4];
  return v2;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = v3;
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier) {
    [v3 setObject:idsIdentifier forKey:@"idsIdentifier"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"productType"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v4 setObject:buildVersion forKey:@"buildVersion"];
  }
  return (NSDictionary *)v4;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v7.receiver = self;
  v7.super_class = (Class)ADPeerInfo;
  v4 = [(ADPeerInfo *)&v7 description];
  id v5 = [v3 initWithFormat:@"%@ idsIdentifier: %@ productType: %@ buildVersion: %@ name: %@", v4, self->_idsIdentifier, self->_productType, self->_buildVersion, self->_name];

  return v5;
}

- (ADPeerInfo)initWithAFPeerInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 idsIdentifier];
    objc_super v7 = [v5 productType];
    unsigned int v8 = [v5 buildVersion];
    v9 = [v5 name];
    unsigned __int8 v10 = [(ADPeerInfo *)self initWithIDSIdentifer:v6 productType:v7 buildVersion:v8 name:v9];

    if (v10)
    {
      v10->_deviceOwnedByCurrentUser = [v5 isDeviceOwnedByCurrentUser];
      v11 = [v5 idsDeviceUniqueIdentifier];
      unsigned int v12 = (NSString *)[v11 copy];
      idsDeviceUniqueIdentifier = v10->_idsDeviceUniqueIdentifier;
      v10->_idsDeviceUniqueIdentifier = v12;

      v14 = [v5 mediaSystemIdentifier];
      v15 = (NSString *)[v14 copy];
      mediaSystemIdentifier = v10->_mediaSystemIdentifier;
      v10->_mediaSystemIdentifier = v15;

      v17 = [v5 rapportEffectiveIdentifier];
      v18 = (NSString *)[v17 copy];
      rapportEffectiveIdentifier = v10->_rapportEffectiveIdentifier;
      v10->_rapportEffectiveIdentifier = v18;

      v20 = [v5 homeKitAccessoryIdentifier];
      v21 = (NSString *)[v20 copy];
      homeKitAccessoryIdentifier = v10->_homeKitAccessoryIdentifier;
      v10->_homeKitAccessoryIdentifier = v21;

      v23 = [v5 roomName];
      v24 = (NSString *)[v23 copy];
      roomName = v10->_roomName;
      v10->_roomName = v24;

      v26 = [v5 userInterfaceIdiom];
      v27 = (NSString *)[v26 copy];
      userInterfaceIdiom = v10->_userInterfaceIdiom;
      v10->_userInterfaceIdiom = v27;

      v29 = [v5 aceVersion];
      v30 = (NSString *)[v29 copy];
      aceVersion = v10->_aceVersion;
      v10->_aceVersion = v30;

      v32 = [v5 mediaRouteIdentifier];
      id v33 = [v32 copy];

      if (v33)
      {
        id v41 = v33;
        uint64_t v34 = +[NSArray arrayWithObjects:&v41 count:1];
        airPlayRouteIdentifiers = v10->_airPlayRouteIdentifiers;
        v10->_airPlayRouteIdentifiers = (NSArray *)v34;
      }
      else
      {
        airPlayRouteIdentifiers = v10->_airPlayRouteIdentifiers;
        v10->_airPlayRouteIdentifiers = 0;
      }

      v37 = [v5 assistantIdentifier];
      v38 = (NSString *)[v37 copy];
      assistantIdentifier = v10->_assistantIdentifier;
      v10->_assistantIdentifier = v38;
    }
    self = v10;
    v36 = self;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (ADPeerInfo)initWithUniqueIdentifer:(id)a3
{
  id v4 = +[NSString stringWithFormat:@"%@%@", @"device:", a3];
  id v5 = [(ADPeerInfo *)self initWithIDSIdentifer:v4];

  return v5;
}

- (ADPeerInfo)initWithIDSIdentifer:(id)a3
{
  return [(ADPeerInfo *)self initWithIDSIdentifer:a3 productType:0 buildVersion:0 name:0];
}

- (ADPeerInfo)initWithIDSIdentifer:(id)a3 productType:(id)a4 buildVersion:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ADPeerInfo;
  v14 = [(ADPeerInfo *)&v24 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    idsIdentifier = v14->_idsIdentifier;
    v14->_idsIdentifier = v15;

    v17 = (NSString *)[v11 copy];
    productType = v14->_productType;
    v14->_productType = v17;

    v19 = (NSString *)[v12 copy];
    buildVersion = v14->_buildVersion;
    v14->_buildVersion = v19;

    v21 = (NSString *)[v13 copy];
    name = v14->_name;
    v14->_name = v21;

    v14->_deviceOwnedByCurrentUser = 1;
  }

  return v14;
}

+ (void)updateSharedInfoWithIdentifier:(id)a3 productType:(id)a4 buildVersion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[ADPeerInfo alloc] initWithIDSIdentifer:v10 productType:v9 buildVersion:v8 name:0];

  id v12 = [a1 _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10035E554;
  block[3] = &unk_10050E138;
  v15 = v11;
  id v13 = v11;
  dispatch_async(v12, block);
}

+ (id)locallyPairedPeerInfo
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10035E674;
  id v10 = sub_10035E684;
  id v11 = 0;
  id v2 = [a1 _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10035E68C;
  block[3] = &unk_10050E318;
  void block[4] = &v6;
  dispatch_sync(v2, block);

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)_queue
{
  if (qword_100586488 != -1) {
    dispatch_once(&qword_100586488, &stru_10050DAE0);
  }
  id v2 = (void *)qword_100586480;
  return v2;
}

@end