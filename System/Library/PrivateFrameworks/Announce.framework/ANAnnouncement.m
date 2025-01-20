@interface ANAnnouncement
+ (BOOL)supportsSecureCoding;
+ (id)messageDataFromMessage:(id)a3;
+ (id)messageFromData:(id)a3 data:(id)a4;
+ (id)messageWithoutDataFromMessage:(id)a3;
+ (unint64_t)sourceFromString:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmStartTime;
- (ANAnnouncement)init;
- (ANAnnouncement)initWithCoder:(id)a3;
- (ANAnnouncement)initWithMessage:(id)a3;
- (ANLocation)location;
- (ANParticipant)announcer;
- (ANSender)sender;
- (BOOL)hasPlayed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRelayRequest;
- (BOOL)isRelayType;
- (BOOL)isRelayed;
- (BOOL)updateWithContentsOfAnnouncement:(id)a3;
- (NSArray)dataItems;
- (NSArray)listeners;
- (NSData)fileData;
- (NSDate)creationTimestamp;
- (NSDate)playbackDeadline;
- (NSDate)receiptTimestamp;
- (NSDictionary)metadata;
- (NSString)description;
- (NSString)filePath;
- (NSString)groupID;
- (NSString)identifier;
- (NSString)messageVersion;
- (NSString)transcriptionText;
- (id)_generateGroupID;
- (id)_stringForAction:(unint64_t)a3;
- (id)_stringForDataType:(unint64_t)a3;
- (id)_uuidFromUUIDs:(id)a3;
- (id)copy;
- (id)message;
- (id)messageForCompanion;
- (int)deviceClass;
- (int)productType;
- (unint64_t)action;
- (unint64_t)hash;
- (unint64_t)machStartTime;
- (unint64_t)productTypeOverride;
- (unint64_t)source;
- (unint64_t)statusFlags;
- (void)encodeWithCoder:(id)a3;
- (void)processAudioTranscription:(id)a3;
- (void)removeAudioFileDataItems;
- (void)setAction:(unint64_t)a3;
- (void)setAnnouncer:(id)a3;
- (void)setCmStartTime:(id *)a3;
- (void)setCreationTimestamp:(id)a3;
- (void)setDataItems:(id)a3;
- (void)setDeviceClass:(int)a3;
- (void)setFilePath:(id)a3;
- (void)setListeners:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMachStartTime:(unint64_t)a3;
- (void)setMessageVersion:(id)a3;
- (void)setPlaybackDeadline:(id)a3;
- (void)setProductType:(int)a3;
- (void)setProductTypeOverride:(unint64_t)a3;
- (void)setSender:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setStatusFlags:(unint64_t)a3;
- (void)setTranscriptionText:(id)a3;
@end

@implementation ANAnnouncement

- (ANAnnouncement)init
{
  v13.receiver = self;
  v13.super_class = (Class)ANAnnouncement;
  v2 = [(ANAnnouncement *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_statusFlags = 0;
    v4 = [MEMORY[0x263F08C38] UUID];
    uint64_t v5 = [v4 UUIDString];
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v5;

    uint64_t v7 = objc_opt_new();
    announcer = v3->_announcer;
    v3->_announcer = (ANParticipant *)v7;

    messageVersion = v3->_messageVersion;
    v3->_messageVersion = (NSString *)@"1.0";

    v3->_action = 0;
    *(void *)&v3->_productType = 0;
    v3->_productTypeOverride = 0;
    v3->_deviceClass = +[ANDevice deviceClass];
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    creationTimestamp = v3->_creationTimestamp;
    v3->_creationTimestamp = (NSDate *)v10;

    v3->_source = 0;
  }
  return v3;
}

- (NSString)description
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  v4 = [(ANAnnouncement *)self listeners];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v6 = [(ANAnnouncement *)self listeners];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v37 + 1) + 8 * i) info];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x263EFF980];
  objc_super v13 = [(ANAnnouncement *)self dataItems];
  v14 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v15 = [(ANAnnouncement *)self dataItems];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v33 + 1) + 8 * j) info];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v17);
  }

  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v21 setObject:self->_messageVersion forKeyedSubscript:@"MessageVersion"];
  [v21 setObject:self->_filePath forKeyedSubscript:@"File"];
  v22 = [(ANParticipant *)self->_announcer info];
  [v21 setObject:v22 forKeyedSubscript:@"Announcer"];

  [v21 setObject:v5 forKeyedSubscript:@"Listeners"];
  [v21 setObject:self->_playbackDeadline forKeyedSubscript:@"PlaybackDeadline"];
  v23 = [(ANAnnouncement *)self _stringForAction:self->_action];
  [v21 setObject:v23 forKeyedSubscript:@"Action"];

  [v21 setObject:self->_identifier forKeyedSubscript:@"AnnouncementID"];
  [v21 setObject:self->_groupID forKeyedSubscript:@"GroupID"];
  [v21 setObject:self->_sender forKeyedSubscript:@"Sender"];
  v24 = [(ANLocation *)self->_location message];
  [v21 setObject:v24 forKeyedSubscript:@"Location"];

  v25 = [NSNumber numberWithLong:*(void *)&self->_productType];
  [v21 setObject:v25 forKeyedSubscript:@"ProductType"];

  v26 = [NSNumber numberWithUnsignedInteger:self->_productTypeOverride];
  [v21 setObject:v26 forKeyedSubscript:@"ProductTypeOverride"];

  v27 = [NSNumber numberWithInt:self->_deviceClass];
  [v21 setObject:v27 forKeyedSubscript:@"DeviceClass"];

  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSString length](self->_transcriptionText, "length"));
  [v21 setObject:v28 forKeyedSubscript:@"AudioTranscription"];

  v29 = [NSNumber numberWithUnsignedInteger:self->_statusFlags];
  [v21 setObject:v29 forKeyedSubscript:@"StatusFlags"];

  [v21 setObject:v14 forKeyedSubscript:@"DataItems"];
  [v21 setObject:self->_creationTimestamp forKeyedSubscript:@"CreationTimestamp"];
  v30 = [NSNumber numberWithUnsignedInteger:self->_source];
  [v21 setObject:v30 forKeyedSubscript:@"Source"];

  v31 = [v21 description];

  return (NSString *)v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 identifier];
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [(ANAnnouncement *)self identifier];
  uint64_t v9 = [v5 identifier];
  char v10 = [v8 isEqual:v9];

  if (v10) {
    BOOL v11 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v11 = 0;

  return v11;
}

- (unint64_t)hash
{
  v2 = [(ANAnnouncement *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copy
{
  unint64_t v3 = objc_opt_new();
  uint64_t v4 = [(ANAnnouncement *)self identifier];
  uint64_t v5 = (void *)v3[2];
  v3[2] = v4;

  uint64_t v6 = [(ANAnnouncement *)self messageVersion];
  [v3 setMessageVersion:v6];

  uint64_t v7 = [(ANAnnouncement *)self announcer];
  uint64_t v8 = (void *)[v7 copy];
  [v3 setAnnouncer:v8];

  uint64_t v9 = [(ANAnnouncement *)self listeners];
  char v10 = (void *)[v9 copy];
  [v3 setListeners:v10];

  BOOL v11 = [(ANAnnouncement *)self playbackDeadline];
  [v3 setPlaybackDeadline:v11];

  objc_msgSend(v3, "setAction:", -[ANAnnouncement action](self, "action"));
  uint64_t v12 = [(ANAnnouncement *)self groupID];
  objc_super v13 = (void *)v3[3];
  v3[3] = v12;

  objc_msgSend(v3, "setProductType:", -[ANAnnouncement productType](self, "productType"));
  objc_msgSend(v3, "setProductTypeOverride:", -[ANAnnouncement productTypeOverride](self, "productTypeOverride"));
  objc_msgSend(v3, "setDeviceClass:", -[ANAnnouncement deviceClass](self, "deviceClass"));
  v14 = [(ANAnnouncement *)self location];
  v15 = (void *)[v14 copy];
  [v3 setLocation:v15];

  uint64_t v16 = [(ANAnnouncement *)self transcriptionText];
  [v3 setTranscriptionText:v16];

  uint64_t v17 = [(ANAnnouncement *)self dataItems];
  uint64_t v18 = (void *)[v17 copy];
  [v3 setDataItems:v18];

  v19 = [(ANAnnouncement *)self creationTimestamp];
  v20 = (void *)[v19 copy];
  [v3 setCreationTimestamp:v20];

  objc_msgSend(v3, "setSource:", -[ANAnnouncement source](self, "source"));
  uint64_t v21 = [(ANAnnouncement *)self receiptTimestamp];
  v22 = (void *)v3[18];
  v3[18] = v21;

  [(ANAnnouncement *)self cmStartTime];
  long long v24 = v26;
  uint64_t v25 = v27;
  [v3 setCmStartTime:&v24];
  objc_msgSend(v3, "setMachStartTime:", -[ANAnnouncement machStartTime](self, "machStartTime"));
  return v3;
}

- (NSData)fileData
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(ANAnnouncement *)self dataItems];
  unint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 type] == 1)
        {
          unint64_t v3 = [v6 data];
          goto LABEL_11;
        }
      }
      unint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (NSData *)v3;
}

- (BOOL)isRelayType
{
  return [(ANAnnouncement *)self action] - 2 < 4;
}

- (BOOL)isRelayed
{
  return ([(ANAnnouncement *)self action] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isRelayRequest
{
  return ([(ANAnnouncement *)self action] & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)hasPlayed
{
  return ([(ANAnnouncement *)self statusFlags] & 3) != 0;
}

- (BOOL)updateWithContentsOfAnnouncement:(id)a3
{
  id v7 = a3;
  long long v8 = [(ANAnnouncement *)self announcer];
  long long v9 = [v8 homeKitID];
  if (v9
    && ([(ANAnnouncement *)self announcer],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 homeKitID],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 length]))
  {

    BOOL v10 = 0;
  }
  else
  {
    long long v11 = [v7 announcer];
    uint64_t v5 = [v11 homeKitID];

    if (v9)
    {
    }
    if (!v5)
    {
      BOOL v10 = 0;
      goto LABEL_10;
    }
    long long v8 = [v7 announcer];
    long long v9 = [v8 homeKitID];
    uint64_t v4 = [(ANAnnouncement *)self announcer];
    [v4 setHomeKitID:v9];
    BOOL v10 = 1;
  }

LABEL_10:
  uint64_t v12 = [(ANAnnouncement *)self announcer];
  uint64_t v13 = [v12 userID];
  if (v13)
  {
    uint64_t v4 = [(ANAnnouncement *)self announcer];
    uint64_t v5 = [v4 userID];
    if ([v5 length])
    {

LABEL_17:
      goto LABEL_18;
    }
  }
  v14 = [v7 announcer];
  v15 = [v14 userID];

  if (v13)
  {
  }
  if (v15)
  {
    uint64_t v12 = [v7 announcer];
    uint64_t v13 = [v12 userID];
    uint64_t v4 = [(ANAnnouncement *)self announcer];
    [v4 setUserID:v13];
    BOOL v10 = 1;
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v16 = [(ANAnnouncement *)self transcriptionText];
  if (v16)
  {
    uint64_t v13 = [(ANAnnouncement *)self transcriptionText];
    if ([v13 length])
    {

LABEL_25:
      goto LABEL_26;
    }
  }
  uint64_t v4 = [v7 transcriptionText];

  if (v16)
  {
  }
  if (v4)
  {
    uint64_t v16 = [v7 transcriptionText];
    [(ANAnnouncement *)self setTranscriptionText:v16];
    BOOL v10 = 1;
    goto LABEL_25;
  }
LABEL_26:
  uint64_t v17 = [(ANAnnouncement *)self announcer];
  uint64_t v18 = [v17 name];
  if (v18)
  {
    uint64_t v4 = [(ANAnnouncement *)self announcer];
    uint64_t v5 = [v4 name];
    if ([v5 length])
    {

LABEL_33:
      goto LABEL_34;
    }
  }
  v19 = [v7 announcer];
  v20 = [v19 name];

  if (v18)
  {
  }
  if (v20)
  {
    uint64_t v17 = [v7 announcer];
    uint64_t v18 = [v17 name];
    uint64_t v4 = [(ANAnnouncement *)self announcer];
    [v4 setName:v18];
    BOOL v10 = 1;
    goto LABEL_33;
  }
LABEL_34:

  return v10;
}

- (void)removeAudioFileDataItems
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(ANAnnouncement *)self dataItems];
  uint64_t v4 = (void *)[v3 mutableCopy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(ANAnnouncement *)self dataItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 type] == 1) {
          [v4 removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  long long v11 = (void *)[v4 copy];
  [(ANAnnouncement *)self setDataItems:v11];
}

+ (unint64_t)sourceFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.siri.SiriAnnounceExtensions.AnnounceIntentExtension"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"com.apple.Home"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"com.apple.NanoHome"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"com.apple.assistant.assistantd"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"com.apple.SoundBoard"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"com.apple.SiriHeadlessService"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"com.apple.Home.HomeUtilNotification"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"com.apple.Home.HomeControlService"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"com.apple.homehubd"])
  {
    unint64_t v4 = 9;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (ANAnnouncement)initWithMessage:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)ANAnnouncement;
  uint64_t v5 = [(ANAnnouncement *)&v59 init];
  if (!v5)
  {
LABEL_28:
    v45 = v5;
    goto LABEL_29;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"MessageVersion"];
  uint64_t v7 = v6;
  if (v6 && [v6 isEqualToString:@"1.0"])
  {
    objc_storeStrong((id *)&v5->_messageVersion, v7);
    uint64_t v8 = [v4 objectForKeyedSubscript:@"Action"];
    long long v9 = v8;
    if (v8) {
      v5->_action = [v8 unsignedIntegerValue];
    }
    BOOL v10 = [v4 objectForKeyedSubscript:@"ProductType"];
    long long v11 = v10;
    if (v10) {
      *(void *)&v5->_productType = [v10 unsignedIntValue];
    }
    long long v12 = [v4 objectForKeyedSubscript:@"ProductTypeOverride"];
    long long v13 = v12;
    if (v12) {
      v5->_productTypeOverride = [v12 unsignedIntegerValue];
    }
    v52 = v13;
    v53 = v11;
    v54 = v9;
    long long v14 = [v4 objectForKeyedSubscript:@"DeviceClass"];
    long long v15 = v14;
    if (v14) {
      v5->_deviceClass = [v14 integerValue];
    }
    v51 = v15;
    uint64_t v16 = [v4 objectForKeyedSubscript:@"PlaybackDeadline"];
    playbackDeadline = v5->_playbackDeadline;
    v5->_playbackDeadline = (NSDate *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"AnnouncementID"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"GroupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v20;

    v50 = [v4 objectForKeyedSubscript:@"Announcer"];
    v22 = [[ANParticipant alloc] initWithMessage:v50];
    announcer = v5->_announcer;
    v5->_announcer = v22;

    long long v24 = [v4 objectForKeyedSubscript:@"Listeners"];
    uint64_t v25 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v24, "count"));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v26 = v24;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v56 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[ANParticipant alloc] initWithMessage:*(void *)(*((void *)&v55 + 1) + 8 * i)];
          [v25 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v28);
    }

    if ([v25 count]) {
      objc_storeStrong((id *)&v5->_listeners, v25);
    }
    v32 = [v4 objectForKeyedSubscript:@"Location"];
    long long v33 = [[ANLocation alloc] initWithMessage:v32];
    location = v5->_location;
    v5->_location = v33;

    long long v35 = [v4 objectForKeyedSubscript:@"DataItems"];
    uint64_t v36 = +[ANAnnouncementDataItem strictSecureDecodeFromData:v35];
    dataItems = v5->_dataItems;
    v5->_dataItems = (NSArray *)v36;

    uint64_t v38 = [v4 objectForKeyedSubscript:@"File"];
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v38;

    uint64_t v40 = [v4 objectForKeyedSubscript:@"CreationTimestamp"];
    creationTimestamp = v5->_creationTimestamp;
    v5->_creationTimestamp = (NSDate *)v40;

    v42 = [v4 objectForKeyedSubscript:@"ReceiptTimestamp"];
    uint64_t v43 = v42;
    if (v42)
    {
      v44 = v42;
    }
    else
    {
      v44 = [MEMORY[0x263EFF910] date];
    }
    receiptTimestamp = v5->_receiptTimestamp;
    v5->_receiptTimestamp = v44;

    v5->_statusFlags = 0;
    v47 = [v4 objectForKeyedSubscript:@"Source"];
    v48 = v47;
    if (v47) {
      v5->_source = [v47 unsignedIntegerValue];
    }

    goto LABEL_28;
  }

  v45 = 0;
LABEL_29:

  return v45;
}

- (id)message
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(ANAnnouncement *)self _generateGroupID];
  groupID = self->_groupID;
  self->_groupID = v3;

  dataItems = self->_dataItems;
  id v21 = 0;
  uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:dataItems requiringSecureCoding:0 error:&v21];
  id v7 = v21;
  if (v7)
  {
    uint64_t v8 = ANLogHandleAnnouncement();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      long long v9 = [(ANAnnouncement *)self identifier];
      *(_DWORD *)buf = 138412546;
      v23 = &stru_26D2D46B0;
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      _os_log_impl(&dword_220FAA000, v8, OS_LOG_TYPE_ERROR, "%@Failed to archive data for Announcement %@", buf, 0x16u);
    }
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v10 setObject:self->_messageVersion forKeyedSubscript:@"MessageVersion"];
  [v10 setObject:v6 forKeyedSubscript:@"DataItems"];
  long long v11 = [(ANParticipant *)self->_announcer message];
  [v10 setObject:v11 forKeyedSubscript:@"Announcer"];

  [v10 setObject:self->_playbackDeadline forKeyedSubscript:@"PlaybackDeadline"];
  long long v12 = [NSNumber numberWithUnsignedInteger:self->_action];
  [v10 setObject:v12 forKeyedSubscript:@"Action"];

  [v10 setObject:self->_identifier forKeyedSubscript:@"AnnouncementID"];
  long long v13 = [(ANAnnouncement *)self groupID];
  [v10 setObject:v13 forKeyedSubscript:@"GroupID"];

  long long v14 = [NSNumber numberWithLong:*(void *)&self->_productType];
  [v10 setObject:v14 forKeyedSubscript:@"ProductType"];

  long long v15 = [NSNumber numberWithUnsignedInteger:self->_productTypeOverride];
  [v10 setObject:v15 forKeyedSubscript:@"ProductTypeOverride"];

  uint64_t v16 = [NSNumber numberWithInt:self->_deviceClass];
  [v10 setObject:v16 forKeyedSubscript:@"DeviceClass"];

  uint64_t v17 = [(ANLocation *)self->_location message];
  [v10 setObject:v17 forKeyedSubscript:@"Location"];

  [v10 setObject:self->_transcriptionText forKeyedSubscript:@"AudioTranscription"];
  [v10 setObject:self->_creationTimestamp forKeyedSubscript:@"CreationTimestamp"];
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:self->_source];
  [v10 setObject:v18 forKeyedSubscript:@"Source"];

  v19 = (void *)[v10 copy];

  return v19;
}

- (id)messageForCompanion
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [(ANAnnouncement *)self message];
  uint64_t v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(ANParticipant *)self->_announcer messageForCompanion];
  [v5 setObject:v6 forKeyedSubscript:@"Announcer"];

  id v7 = (void *)[v5 copy];

  return v7;
}

- (NSDictionary)metadata
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [(ANAnnouncement *)self message];
  uint64_t v5 = [v3 dictionaryWithDictionary:v4];

  [v5 setObject:self->_filePath forKeyedSubscript:@"File"];
  [v5 setObject:self->_receiptTimestamp forKeyedSubscript:@"ReceiptTimestamp"];
  [v5 setObject:0 forKeyedSubscript:@"DataItems"];
  uint64_t v6 = (void *)[v5 copy];

  return (NSDictionary *)v6;
}

+ (id)messageWithoutDataFromMessage:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];
  [v3 setObject:0 forKeyedSubscript:@"DataItems"];
  id v4 = (void *)[v3 copy];

  return v4;
}

+ (id)messageFromData:(id)a3 data:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)[a3 mutableCopy];
  [v6 setObject:v5 forKeyedSubscript:@"DataItems"];

  id v7 = (void *)[v6 copy];

  return v7;
}

+ (id)messageDataFromMessage:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"DataItems"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  messageVersion = self->_messageVersion;
  id v5 = a3;
  [v5 encodeObject:messageVersion forKey:@"MessageVersion"];
  [v5 encodeObject:self->_filePath forKey:@"File"];
  [v5 encodeObject:self->_announcer forKey:@"Announcer"];
  [v5 encodeObject:self->_listeners forKey:@"Listeners"];
  [v5 encodeObject:self->_playbackDeadline forKey:@"PlaybackDeadline"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_action];
  [v5 encodeObject:v6 forKey:@"Action"];

  [v5 encodeObject:self->_identifier forKey:@"AnnouncementID"];
  [v5 encodeObject:self->_groupID forKey:@"GroupID"];
  [v5 encodeObject:self->_sender forKey:@"Sender"];
  [v5 encodeObject:self->_location forKey:@"Location"];
  id v7 = [NSNumber numberWithLong:*(void *)&self->_productType];
  [v5 encodeObject:v7 forKey:@"ProductType"];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_productTypeOverride];
  [v5 encodeObject:v8 forKey:@"ProductTypeOverride"];

  long long v9 = [NSNumber numberWithInt:self->_deviceClass];
  [v5 encodeObject:v9 forKey:@"DeviceClass"];

  [v5 encodeObject:self->_transcriptionText forKey:@"AudioTranscription"];
  id v10 = [NSNumber numberWithUnsignedInteger:self->_statusFlags];
  [v5 encodeObject:v10 forKey:@"StatusFlags"];

  [v5 encodeObject:self->_dataItems forKey:@"DataItems"];
  id v11 = [NSNumber numberWithUnsignedInteger:self->_source];
  [v5 encodeObject:v11 forKey:@"Source"];
}

- (ANAnnouncement)initWithCoder:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)ANAnnouncement;
  id v5 = [(ANAnnouncement *)&v48 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MessageVersion"];
    messageVersion = v5->_messageVersion;
    v5->_messageVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Action"];
    long long v9 = v8;
    if (v8) {
      v5->_action = [v8 unsignedIntegerValue];
    }
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductType"];
    id v11 = v10;
    if (v10) {
      *(void *)&v5->_productType = [v10 integerValue];
    }
    v47 = v11;
    long long v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductTypeOverride"];
    long long v13 = v12;
    if (v12) {
      v5->_productTypeOverride = [v12 unsignedIntegerValue];
    }
    long long v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceClass"];
    long long v15 = v14;
    if (v14) {
      v5->_deviceClass = [v14 integerValue];
    }
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusFlags"];
    uint64_t v17 = v16;
    if (v16) {
      v5->_statusFlags = [v16 integerValue];
    }
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PlaybackDeadline"];
    playbackDeadline = v5->_playbackDeadline;
    v5->_playbackDeadline = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"File"];
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnnouncementID"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GroupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Announcer"];
    announcer = v5->_announcer;
    v5->_announcer = (ANParticipant *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Location"];
    location = v5->_location;
    v5->_location = (ANLocation *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Sender"];
    sender = v5->_sender;
    v5->_sender = (ANSender *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AudioTranscription"];
    transcriptionText = v5->_transcriptionText;
    v5->_transcriptionText = (NSString *)v32;

    long long v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Source"];
    long long v35 = v34;
    if (v34) {
      v5->_source = [v34 unsignedIntegerValue];
    }
    uint64_t v36 = (void *)MEMORY[0x263EFFA08];
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"Listeners"];
    listeners = v5->_listeners;
    v5->_listeners = (NSArray *)v39;

    v41 = (void *)MEMORY[0x263EFFA08];
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
    uint64_t v44 = [v4 decodeObjectOfClasses:v43 forKey:@"DataItems"];
    dataItems = v5->_dataItems;
    v5->_dataItems = (NSArray *)v44;
  }
  return v5;
}

- (id)_stringForAction:(unint64_t)a3
{
  if (a3 > 5) {
    return @"Unknown";
  }
  else {
    return off_264586E40[a3];
  }
}

- (id)_stringForDataType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_264586E70[a3];
  }
}

- (id)_generateGroupID
{
  id v3 = objc_opt_new();
  id v4 = [(ANAnnouncement *)self location];
  id v5 = [v4 homeUUID];

  if (v5) {
    [v3 addObject:v5];
  }
  uint64_t v6 = [(ANAnnouncement *)self location];
  id v7 = [v6 zoneUUIDs];

  if (v7) {
    [v3 addObjectsFromArray:v7];
  }
  uint64_t v8 = [(ANAnnouncement *)self location];
  long long v9 = [v8 roomUUIDs];

  if (v9) {
    [v3 addObjectsFromArray:v9];
  }
  id v10 = [(ANAnnouncement *)self _uuidFromUUIDs:v3];
  id v11 = [v10 UUIDString];

  return v11;
}

- (id)_uuidFromUUIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int8x16_t v17 = 0uLL;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        int8x16_t v15 = 0uLL;
        [v8 getUUIDBytes:&v15];
        int8x16_t v17 = veorq_s8(v17, v15);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
  long long v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v17];

  return v9;
}

- (void)processAudioTranscription:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (processAudioTranscription__onceToken != -1) {
    dispatch_once(&processAudioTranscription__onceToken, &__block_literal_global);
  }
  if ([(id)processAudioTranscription__recognizer supportsOnDeviceRecognition])
  {
    id v5 = objc_alloc(MEMORY[0x263F17BA8]);
    uint64_t v6 = NSURL;
    id v7 = [(ANAnnouncement *)self filePath];
    uint64_t v8 = [v6 fileURLWithPath:v7];
    long long v9 = (void *)[v5 initWithURL:v8];

    [v9 setRequiresOnDeviceRecognition:1];
    [v9 setShouldReportPartialResults:0];
    id v10 = (void *)processAudioTranscription__recognizer;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__ANAnnouncement_processAudioTranscription___block_invoke_115;
    v13[3] = &unk_264586E20;
    v13[4] = self;
    id v14 = v4;
    id v11 = (id)[v10 recognitionTaskWithRequest:v9 resultHandler:v13];
  }
  else
  {
    long long v12 = ANLogHandleAnnouncement();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = &stru_26D2D46B0;
      _os_log_impl(&dword_220FAA000, v12, OS_LOG_TYPE_DEFAULT, "%@On device recognition not available, not processing", buf, 0xCu);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

uint64_t __44__ANAnnouncement_processAudioTranscription___block_invoke()
{
  processAudioTranscription__recognizer = (uint64_t)objc_alloc_init(MEMORY[0x263F17BA0]);

  return MEMORY[0x270F9A758]();
}

void __44__ANAnnouncement_processAudioTranscription___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = ANLogHandleAnnouncement();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 transcriptions];
    int v23 = 138412802;
    uint64_t v24 = &stru_26D2D46B0;
    __int16 v25 = 2048;
    uint64_t v26 = [v8 count];
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_220FAA000, v7, OS_LOG_TYPE_DEFAULT, "%@Received transcription result: (%lu transcriptions) %@", (uint8_t *)&v23, 0x20u);
  }
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = v9;
  if (v5)
  {
    id v11 = [NSString alloc];
    long long v12 = [v5 bestTranscription];
    long long v13 = [v12 formattedString];
    id v14 = (void *)[v11 initWithString:v13];
    [*(id *)(a1 + 32) setTranscriptionText:v14];

    int8x16_t v15 = [*(id *)(a1 + 32) transcriptionText];
    uint64_t v16 = [v15 dataUsingEncoding:4];

    uint64_t v17 = [[ANAnnouncementDataItem alloc] initWithData:v16 type:2];
    uint64_t v18 = (void *)MEMORY[0x263EFF980];
    v19 = [*(id *)(a1 + 32) dataItems];
    uint64_t v20 = [v18 arrayWithArray:v19];

    [v20 addObject:v17];
    id v21 = (void *)[v20 copy];
    [*(id *)(a1 + 32) setDataItems:v21];
  }
  uint64_t v22 = *(void *)(a1 + 40);
  if (v22) {
    (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v22, v10);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (ANLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (NSDate)playbackDeadline
{
  return self->_playbackDeadline;
}

- (void)setPlaybackDeadline:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[7];
  return self;
}

- (void)setCmStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_cmStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_cmStartTime.value = v3;
}

- (unint64_t)machStartTime
{
  return self->_machStartTime;
}

- (void)setMachStartTime:(unint64_t)a3
{
  self->_machStartTime = a3;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (ANSender)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (int)productType
{
  return *(void *)&self->_productType;
}

- (void)setProductType:(int)a3
{
  *(void *)&self->_productType = *(void *)&a3;
}

- (unint64_t)productTypeOverride
{
  return self->_productTypeOverride;
}

- (void)setProductTypeOverride:(unint64_t)a3
{
  self->_productTypeOverride = a3;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->_deviceClass = a3;
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (void)setStatusFlags:(unint64_t)a3
{
  self->_statusFlags = a3;
}

- (NSString)transcriptionText
{
  return self->_transcriptionText;
}

- (void)setTranscriptionText:(id)a3
{
}

- (ANParticipant)announcer
{
  return self->_announcer;
}

- (void)setAnnouncer:(id)a3
{
}

- (NSArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (NSString)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
}

- (NSArray)dataItems
{
  return self->_dataItems;
}

- (void)setDataItems:(id)a3
{
}

- (NSDate)receiptTimestamp
{
  return self->_receiptTimestamp;
}

- (NSDate)creationTimestamp
{
  return self->_creationTimestamp;
}

- (void)setCreationTimestamp:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationTimestamp, 0);
  objc_storeStrong((id *)&self->_receiptTimestamp, 0);
  objc_storeStrong((id *)&self->_dataItems, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_announcer, 0);
  objc_storeStrong((id *)&self->_transcriptionText, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_playbackDeadline, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end