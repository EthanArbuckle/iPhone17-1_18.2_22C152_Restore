@interface ANAnnouncementContext
+ (BOOL)supportsSecureCoding;
+ (id)contextFromDictionary:(id)a3;
+ (id)contextFromUserInfo:(id)a3;
- (ANAnnouncementContext)initWithCoder:(id)a3;
- (ANAnnouncementContext)initWithDictionary:(id)a3;
- (BOOL)announcerIsAccessory;
- (BOOL)isEqualToContext:(id)a3;
- (BOOL)played;
- (NSDictionary)contextDictionary;
- (NSDictionary)rooms;
- (NSDictionary)zones;
- (NSNumber)audioFileDuration;
- (NSString)announcementAudioPath;
- (NSString)announcementID;
- (NSString)announcerID;
- (NSString)announcerName;
- (NSString)announcerUserID;
- (NSString)announcerUserUniqueID;
- (NSString)groupID;
- (NSString)homeID;
- (NSString)homeName;
- (NSString)serviceType;
- (NSString)subtitle;
- (NSString)transcriptionText;
- (NSURL)announcementAudioURL;
- (id)description;
- (int)deviceClass;
- (int)productType;
- (unint64_t)productTypeOverride;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANAnnouncementContext

- (ANAnnouncementContext)initWithDictionary:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)ANAnnouncementContext;
  v5 = [(ANAnnouncementContext *)&v70 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"AnnouncementID"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_announcementID, v8);

    uint64_t v9 = [v4 objectForKeyedSubscript:@"GroupID"];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_groupID, v11);

    uint64_t v12 = [v4 objectForKeyedSubscript:@"AnnouncerID"];
    v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_announcerID, v14);

    uint64_t v15 = [v4 objectForKeyedSubscript:@"AnnouncerName"];
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_announcerName, v17);

    uint64_t v18 = [v4 objectForKeyedSubscript:@"AnnouncerUserID"];
    v19 = (void *)v18;
    if (v18) {
      v20 = (__CFString *)v18;
    }
    else {
      v20 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_announcerUserID, v20);

    uint64_t v21 = [v4 objectForKeyedSubscript:@"AnnouncerUserUniqueID"];
    v22 = (void *)v21;
    if (v21) {
      v23 = (__CFString *)v21;
    }
    else {
      v23 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_announcerUserUniqueID, v23);

    v24 = [v4 objectForKeyedSubscript:@"AnnouncerIsAccessory"];
    v25 = v24;
    if (v24) {
      LOBYTE(v24) = [v24 BOOLValue];
    }
    v5->_announcerIsAccessory = (char)v24;
    uint64_t v26 = [v4 objectForKeyedSubscript:@"HomeName"];
    v27 = (void *)v26;
    if (v26) {
      v28 = (__CFString *)v26;
    }
    else {
      v28 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_homeName, v28);

    uint64_t v29 = [v4 objectForKeyedSubscript:@"HomeID"];
    v30 = (void *)v29;
    if (v29) {
      v31 = (__CFString *)v29;
    }
    else {
      v31 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_homeID, v31);

    v32 = [v4 objectForKeyedSubscript:@"ProductType"];
    if (v32)
    {
      v33 = [v4 objectForKeyedSubscript:@"ProductType"];
      *(void *)&v5->_productType = [v33 integerValue];
    }
    else
    {
      *(void *)&v5->_productType = -1;
    }

    v34 = [v4 objectForKeyedSubscript:@"ProductTypeOverride"];
    if (v34)
    {
      v35 = [v4 objectForKeyedSubscript:@"ProductTypeOverride"];
      v5->_productTypeOverride = [v35 unsignedIntegerValue];
    }
    else
    {
      v5->_productTypeOverride = 0;
    }

    uint64_t v36 = [v4 objectForKeyedSubscript:@"ServiceType"];
    v37 = (void *)v36;
    if (v36) {
      v38 = (__CFString *)v36;
    }
    else {
      v38 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_serviceType, v38);

    v39 = [v4 objectForKeyedSubscript:@"DeviceClass"];
    if (v39)
    {
      v40 = [v4 objectForKeyedSubscript:@"DeviceClass"];
      v5->_deviceClass = [v40 integerValue];
    }
    else
    {
      v5->_deviceClass = -1;
    }

    uint64_t v41 = [v4 objectForKeyedSubscript:@"Rooms"];
    v42 = (void *)v41;
    v43 = (void *)MEMORY[0x263EFFA78];
    if (v41) {
      v44 = (void *)v41;
    }
    else {
      v44 = (void *)MEMORY[0x263EFFA78];
    }
    objc_storeStrong((id *)&v5->_rooms, v44);

    uint64_t v45 = [v4 objectForKeyedSubscript:@"Zones"];
    v46 = (void *)v45;
    if (v45) {
      v47 = (void *)v45;
    }
    else {
      v47 = v43;
    }
    objc_storeStrong((id *)&v5->_zones, v47);

    uint64_t v48 = [v4 objectForKeyedSubscript:@"AudioFilePath"];
    v49 = (void *)v48;
    if (v48) {
      v50 = (__CFString *)v48;
    }
    else {
      v50 = &stru_26D2D46B0;
    }
    v51 = v50;

    uint64_t v52 = [objc_alloc(NSURL) initFileURLWithPath:v51];
    announcementAudioURL = v5->_announcementAudioURL;
    v5->_announcementAudioURL = (NSURL *)v52;

    objc_storeStrong((id *)&v5->_announcementAudioPath, v50);
    [(NSURL *)v5->_announcementAudioURL audioDuration];
    if (v54 != -1.0)
    {
      *(float *)&double v54 = v54;
      uint64_t v55 = [NSNumber numberWithFloat:v54];
      audioFileDuration = v5->_audioFileDuration;
      v5->_audioFileDuration = (NSNumber *)v55;
    }
    uint64_t v57 = [v4 objectForKeyedSubscript:@"Subtitle"];
    v58 = (void *)v57;
    if (v57) {
      v59 = (__CFString *)v57;
    }
    else {
      v59 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_subtitle, v59);

    uint64_t v60 = [v4 objectForKeyedSubscript:@"TranscriptionText"];
    v61 = (void *)v60;
    if (v60) {
      v62 = (__CFString *)v60;
    }
    else {
      v62 = &stru_26D2D46B0;
    }
    objc_storeStrong((id *)&v5->_transcriptionText, v62);

    v63 = [v4 objectForKeyedSubscript:@"Played"];
    if (v63)
    {
      v64 = [v4 objectForKeyedSubscript:@"Played"];
      v5->_played = [v64 BOOLValue];
    }
    else
    {
      v5->_played = 0;
    }

    v65 = ANLogHandleAnnouncementContext();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v5->_announcementAudioURL;
      *(_DWORD *)buf = 138412546;
      v72 = &stru_26D2D46B0;
      __int16 v73 = 2112;
      v74 = v66;
      _os_log_impl(&dword_220FAA000, v65, OS_LOG_TYPE_DEFAULT, "%@Announcement Context URL: %@", buf, 0x16u);
    }

    v67 = ANLogHandleAnnouncementContext();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      announcementAudioPath = v5->_announcementAudioPath;
      *(_DWORD *)buf = 138412546;
      v72 = &stru_26D2D46B0;
      __int16 v73 = 2112;
      v74 = (NSURL *)announcementAudioPath;
      _os_log_impl(&dword_220FAA000, v67, OS_LOG_TYPE_DEFAULT, "%@Announcement Context File Path: %@", buf, 0x16u);
    }
  }
  return v5;
}

+ (id)contextFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[ANAnnouncementContext alloc] initWithDictionary:v3];

  return v4;
}

+ (id)contextFromUserInfo:(id)a3
{
  id v3 = a3;
  id v4 = [[ANAnnouncementContext alloc] initWithUserInfo:v3];

  return v4;
}

- (id)description
{
  v2 = [(ANAnnouncementContext *)self contextDictionary];
  id v3 = [v2 description];

  return v3;
}

- (NSDictionary)contextDictionary
{
  id v3 = objc_opt_new();
  id v4 = [(ANAnnouncementContext *)self announcementID];
  [v3 setObject:v4 forKeyedSubscript:@"AnnouncementID"];

  v5 = [(ANAnnouncementContext *)self groupID];
  [v3 setObject:v5 forKeyedSubscript:@"GroupID"];

  uint64_t v6 = [(ANAnnouncementContext *)self announcerID];
  [v3 setObject:v6 forKeyedSubscript:@"AnnouncerID"];

  v7 = [(ANAnnouncementContext *)self announcerUserUniqueID];
  [v3 setObject:v7 forKeyedSubscript:@"AnnouncerUserUniqueID"];

  v8 = [(ANAnnouncementContext *)self announcerName];
  [v3 setObject:v8 forKeyedSubscript:@"AnnouncerName"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ANAnnouncementContext announcerIsAccessory](self, "announcerIsAccessory"));
  [v3 setObject:v9 forKeyedSubscript:@"AnnouncerIsAccessory"];

  v10 = [(ANAnnouncementContext *)self homeName];
  [v3 setObject:v10 forKeyedSubscript:@"HomeName"];

  v11 = [(ANAnnouncementContext *)self homeID];
  [v3 setObject:v11 forKeyedSubscript:@"HomeID"];

  uint64_t v12 = [(ANAnnouncementContext *)self rooms];
  [v3 setObject:v12 forKeyedSubscript:@"Rooms"];

  v13 = [(ANAnnouncementContext *)self zones];
  [v3 setObject:v13 forKeyedSubscript:@"Zones"];

  v14 = [(ANAnnouncementContext *)self announcementAudioPath];
  [v3 setObject:v14 forKeyedSubscript:@"AudioFilePath"];

  uint64_t v15 = [(ANAnnouncementContext *)self announcementAudioURL];
  [v3 setObject:v15 forKeyedSubscript:@"AudioFileURL"];

  v16 = [(ANAnnouncementContext *)self audioFileDuration];
  [v3 setObject:v16 forKeyedSubscript:@"AudioFileDuration"];

  v17 = [(ANAnnouncementContext *)self announcerUserID];
  [v3 setObject:v17 forKeyedSubscript:@"AnnouncerUserID"];

  uint64_t v18 = [(ANAnnouncementContext *)self subtitle];
  [v3 setObject:v18 forKeyedSubscript:@"Subtitle"];

  v19 = objc_msgSend(NSNumber, "numberWithLong:", -[ANAnnouncementContext productType](self, "productType"));
  [v3 setObject:v19 forKeyedSubscript:@"ProductType"];

  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ANAnnouncementContext productTypeOverride](self, "productTypeOverride"));
  [v3 setObject:v20 forKeyedSubscript:@"ProductTypeOverride"];

  uint64_t v21 = [(ANAnnouncementContext *)self serviceType];
  [v3 setObject:v21 forKeyedSubscript:@"ServiceType"];

  v22 = objc_msgSend(NSNumber, "numberWithInt:", -[ANAnnouncementContext deviceClass](self, "deviceClass"));
  [v3 setObject:v22 forKeyedSubscript:@"DeviceClass"];

  v23 = [(ANAnnouncementContext *)self transcriptionText];
  [v3 setObject:v23 forKeyedSubscript:@"TranscriptionText"];

  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[ANAnnouncementContext played](self, "played"));
  [v3 setObject:v24 forKeyedSubscript:@"Played"];

  v25 = (void *)[v3 copy];

  return (NSDictionary *)v25;
}

- (BOOL)isEqualToContext:(id)a3
{
  id v4 = a3;
  v5 = [(ANAnnouncementContext *)self announcementID];
  uint64_t v6 = [v4 announcementID];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(ANAnnouncementContext *)self groupID];
    v8 = [v4 groupID];
    if ([v7 isEqualToString:v8])
    {
      uint64_t v9 = [(ANAnnouncementContext *)self announcerID];
      v10 = [v4 announcerID];
      if ([v9 isEqualToString:v10])
      {
        v11 = [(ANAnnouncementContext *)self announcerName];
        uint64_t v12 = [v4 announcerName];
        if ([v11 isEqualToString:v12])
        {
          v59 = v12;
          v13 = [(ANAnnouncementContext *)self announcerUserID];
          uint64_t v57 = [v4 announcerUserID];
          v58 = v13;
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            v14 = [(ANAnnouncementContext *)self announcerUserUniqueID];
            uint64_t v55 = [v4 announcerUserUniqueID];
            v56 = v14;
            int v15 = objc_msgSend(v14, "isEqualToString:");
            uint64_t v12 = v59;
            if (v15)
            {
              double v54 = v11;
              int v16 = [(ANAnnouncementContext *)self announcerIsAccessory];
              if (v16 == [v4 announcerIsAccessory])
              {
                uint64_t v18 = [(ANAnnouncementContext *)self homeName];
                uint64_t v52 = [v4 homeName];
                v53 = v18;
                if (objc_msgSend(v18, "isEqualToString:"))
                {
                  v19 = [(ANAnnouncementContext *)self homeID];
                  v50 = [v4 homeID];
                  v51 = v19;
                  if (objc_msgSend(v19, "isEqualToString:")
                    && (uint64_t v20 = [(ANAnnouncementContext *)self productType],
                        v20 == [v4 productType])
                    && (unint64_t v21 = [(ANAnnouncementContext *)self productTypeOverride],
                        v21 == [v4 productTypeOverride]))
                  {
                    v22 = [(ANAnnouncementContext *)self serviceType];
                    uint64_t v48 = [v4 serviceType];
                    v49 = v22;
                    if (objc_msgSend(v22, "isEqualToString:")
                      && (int v23 = [(ANAnnouncementContext *)self deviceClass],
                          v23 == [v4 deviceClass]))
                    {
                      v24 = [(ANAnnouncementContext *)self rooms];
                      v47 = [v4 rooms];
                      if (objc_msgSend(v24, "isEqualToDictionary:"))
                      {
                        v25 = [(ANAnnouncementContext *)self zones];
                        uint64_t v45 = [v4 zones];
                        v46 = v25;
                        if (objc_msgSend(v25, "isEqualToDictionary:"))
                        {
                          uint64_t v26 = [(ANAnnouncementContext *)self announcementAudioURL];
                          v43 = [v4 announcementAudioURL];
                          v44 = v26;
                          if (objc_msgSend(v26, "isEqual:"))
                          {
                            v27 = [(ANAnnouncementContext *)self announcementAudioPath];
                            uint64_t v41 = [v4 announcementAudioPath];
                            v42 = v27;
                            if (objc_msgSend(v27, "isEqualToString:"))
                            {
                              v28 = [(ANAnnouncementContext *)self audioFileDuration];
                              v39 = [v4 audioFileDuration];
                              v40 = v28;
                              if (objc_msgSend(v28, "isEqualToNumber:"))
                              {
                                uint64_t v29 = [(ANAnnouncementContext *)self subtitle];
                                v37 = [v4 subtitle];
                                v38 = v29;
                                if (objc_msgSend(v29, "isEqualToString:"))
                                {
                                  uint64_t v30 = [(ANAnnouncementContext *)self transcriptionText];
                                  uint64_t v31 = [v4 transcriptionText];
                                  uint64_t v36 = (void *)v30;
                                  v32 = (void *)v30;
                                  v33 = (void *)v31;
                                  if (objc_msgSend(v32, "isEqualToString:"))
                                  {
                                    BOOL v34 = [(ANAnnouncementContext *)self played];
                                    int v17 = v34 ^ [v4 played] ^ 1;
                                  }
                                  else
                                  {
                                    LOBYTE(v17) = 0;
                                  }
                                }
                                else
                                {
                                  LOBYTE(v17) = 0;
                                }
                              }
                              else
                              {
                                LOBYTE(v17) = 0;
                              }
                            }
                            else
                            {
                              LOBYTE(v17) = 0;
                            }
                          }
                          else
                          {
                            LOBYTE(v17) = 0;
                          }
                        }
                        else
                        {
                          LOBYTE(v17) = 0;
                        }
                      }
                      else
                      {
                        LOBYTE(v17) = 0;
                      }

                      v11 = v54;
                      uint64_t v12 = v59;
                    }
                    else
                    {
                      LOBYTE(v17) = 0;
                      v11 = v54;
                    }
                  }
                  else
                  {
                    LOBYTE(v17) = 0;
                    v11 = v54;
                  }
                }
                else
                {
                  LOBYTE(v17) = 0;
                  v11 = v54;
                }
              }
              else
              {
                LOBYTE(v17) = 0;
                v11 = v54;
              }
            }
            else
            {
              LOBYTE(v17) = 0;
            }
          }
          else
          {
            LOBYTE(v17) = 0;
            uint64_t v12 = v59;
          }
        }
        else
        {
          LOBYTE(v17) = 0;
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ANAnnouncementContext *)self announcementID];
  [v4 encodeObject:v5 forKey:@"AnnouncementID"];

  uint64_t v6 = [(ANAnnouncementContext *)self groupID];
  [v4 encodeObject:v6 forKey:@"GroupID"];

  v7 = [(ANAnnouncementContext *)self announcerID];
  [v4 encodeObject:v7 forKey:@"AnnouncerID"];

  v8 = [(ANAnnouncementContext *)self announcerUserID];
  [v4 encodeObject:v8 forKey:@"AnnouncerUserID"];

  uint64_t v9 = [(ANAnnouncementContext *)self announcerUserUniqueID];
  [v4 encodeObject:v9 forKey:@"AnnouncerUserUniqueID"];

  v10 = [(ANAnnouncementContext *)self announcerName];
  [v4 encodeObject:v10 forKey:@"AnnouncerName"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ANAnnouncementContext announcerIsAccessory](self, "announcerIsAccessory"));
  [v4 encodeObject:v11 forKey:@"AnnouncerIsAccessory"];

  uint64_t v12 = [(ANAnnouncementContext *)self homeName];
  [v4 encodeObject:v12 forKey:@"HomeName"];

  v13 = [(ANAnnouncementContext *)self homeID];
  [v4 encodeObject:v13 forKey:@"HomeID"];

  v14 = [(ANAnnouncementContext *)self rooms];
  [v4 encodeObject:v14 forKey:@"Rooms"];

  int v15 = [(ANAnnouncementContext *)self zones];
  [v4 encodeObject:v15 forKey:@"Zones"];

  int v16 = [(ANAnnouncementContext *)self announcementAudioURL];
  [v4 encodeObject:v16 forKey:@"AudioFileURL"];

  int v17 = [(ANAnnouncementContext *)self announcementAudioPath];
  [v4 encodeObject:v17 forKey:@"AudioFilePath"];

  uint64_t v18 = [(ANAnnouncementContext *)self audioFileDuration];
  [v4 encodeObject:v18 forKey:@"AudioFileDuration"];

  v19 = [(ANAnnouncementContext *)self subtitle];
  [v4 encodeObject:v19 forKey:@"Subtitle"];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithLong:", -[ANAnnouncementContext productType](self, "productType"));
  [v4 encodeObject:v20 forKey:@"ProductType"];

  unint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ANAnnouncementContext productTypeOverride](self, "productTypeOverride"));
  [v4 encodeObject:v21 forKey:@"ProductTypeOverride"];

  v22 = [(ANAnnouncementContext *)self serviceType];
  [v4 encodeObject:v22 forKey:@"ServiceType"];

  int v23 = objc_msgSend(NSNumber, "numberWithInt:", -[ANAnnouncementContext deviceClass](self, "deviceClass"));
  [v4 encodeObject:v23 forKey:@"DeviceClass"];

  v24 = [(ANAnnouncementContext *)self transcriptionText];
  [v4 encodeObject:v24 forKey:@"TranscriptionText"];

  objc_msgSend(NSNumber, "numberWithBool:", -[ANAnnouncementContext played](self, "played"));
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v25 forKey:@"Played"];
}

- (ANAnnouncementContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ANAnnouncementContext;
  v5 = [(ANAnnouncementContext *)&v47 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnnouncementID"];
    announcementID = v5->_announcementID;
    v5->_announcementID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GroupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnnouncerID"];
    announcerID = v5->_announcerID;
    v5->_announcerID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnnouncerName"];
    announcerName = v5->_announcerName;
    v5->_announcerName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnnouncerUserID"];
    announcerUserID = v5->_announcerUserID;
    v5->_announcerUserID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnnouncerUserUniqueID"];
    announcerUserUniqueID = v5->_announcerUserUniqueID;
    v5->_announcerUserUniqueID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnnouncerIsAccessory"];
    v5->_announcerIsAccessory = [v18 BOOLValue];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HomeName"];
    homeName = v5->_homeName;
    v5->_homeName = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HomeID"];
    homeID = v5->_homeID;
    v5->_homeID = (NSString *)v21;

    int v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    id v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"Rooms"];
    rooms = v5->_rooms;
    v5->_rooms = (NSDictionary *)v26;

    uint64_t v28 = [v4 decodeObjectOfClasses:v25 forKey:@"Zones"];
    zones = v5->_zones;
    v5->_zones = (NSDictionary *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AudioFileURL"];
    announcementAudioURL = v5->_announcementAudioURL;
    v5->_announcementAudioURL = (NSURL *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AudioFilePath"];
    announcementAudioPath = v5->_announcementAudioPath;
    v5->_announcementAudioPath = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AudioFileDuration"];
    audioFileDuration = v5->_audioFileDuration;
    v5->_audioFileDuration = (NSNumber *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v36;

    v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductType"];
    *(void *)&v5->_productType = [v38 unsignedIntValue];
    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductTypeOverride"];
    v5->_productTypeOverride = [v39 unsignedIntegerValue];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServiceType"];
    serviceType = v5->_serviceType;
    v5->_serviceType = (NSString *)v40;

    v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceClass"];
    v5->_deviceClass = [v42 integerValue];
    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TranscriptionText"];
    transcriptionText = v5->_transcriptionText;
    v5->_transcriptionText = (NSString *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Played"];
    v5->_played = [v45 BOOLValue];
  }
  return v5;
}

- (NSString)announcementID
{
  return self->_announcementID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSString)announcerID
{
  return self->_announcerID;
}

- (NSString)announcerName
{
  return self->_announcerName;
}

- (NSString)announcerUserUniqueID
{
  return self->_announcerUserUniqueID;
}

- (NSString)announcerUserID
{
  return self->_announcerUserID;
}

- (BOOL)announcerIsAccessory
{
  return self->_announcerIsAccessory;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (NSString)homeID
{
  return self->_homeID;
}

- (int)productType
{
  return *(void *)&self->_productType;
}

- (unint64_t)productTypeOverride
{
  return self->_productTypeOverride;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (NSDictionary)rooms
{
  return self->_rooms;
}

- (NSDictionary)zones
{
  return self->_zones;
}

- (NSURL)announcementAudioURL
{
  return self->_announcementAudioURL;
}

- (NSString)announcementAudioPath
{
  return self->_announcementAudioPath;
}

- (NSNumber)audioFileDuration
{
  return self->_audioFileDuration;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)transcriptionText
{
  return self->_transcriptionText;
}

- (BOOL)played
{
  return self->_played;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptionText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_audioFileDuration, 0);
  objc_storeStrong((id *)&self->_announcementAudioPath, 0);
  objc_storeStrong((id *)&self->_announcementAudioURL, 0);
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_rooms, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_announcerUserID, 0);
  objc_storeStrong((id *)&self->_announcerUserUniqueID, 0);
  objc_storeStrong((id *)&self->_announcerName, 0);
  objc_storeStrong((id *)&self->_announcerID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_announcementID, 0);
}

@end