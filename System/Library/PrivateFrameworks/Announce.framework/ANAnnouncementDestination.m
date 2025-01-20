@interface ANAnnouncementDestination
+ (ANAnnouncementDestination)destinationWithHomeIdentifier:(id)a3;
+ (ANAnnouncementDestination)destinationWithHomeIdentifier:(id)a3 zoneIdentifiers:(id)a4 roomIdentifiers:(id)a5;
+ (ANAnnouncementDestination)destinationWithHomeName:(id)a3;
+ (ANAnnouncementDestination)destinationWithHomeName:(id)a3 zoneNames:(id)a4 roomNames:(id)a5;
+ (ANAnnouncementDestination)destinationWithReplyToAnnouncementIdentifier:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)stringFromAnnouncementDestinationType:(unint64_t)a3;
- (ANAnnouncement)announcement;
- (ANAnnouncementDestination)init;
- (ANAnnouncementDestination)initWithCoder:(id)a3;
- (BOOL)replyToSender;
- (NSArray)roomObjects;
- (NSArray)zoneObjects;
- (NSString)announcementIdentifier;
- (id)description;
- (id)homeObject;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAnnouncement:(id)a3;
- (void)setAnnouncementIdentifier:(id)a3;
- (void)setHomeObject:(id)a3;
- (void)setReplyToSender:(BOOL)a3;
- (void)setRoomObjects:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setZoneObjects:(id)a3;
@end

@implementation ANAnnouncementDestination

- (ANAnnouncementDestination)init
{
  v3.receiver = self;
  v3.super_class = (Class)ANAnnouncementDestination;
  return [(ANAnnouncementDestination *)&v3 init];
}

+ (ANAnnouncementDestination)destinationWithHomeName:(id)a3
{
  return +[ANAnnouncementDestination destinationWithHomeName:a3 zoneNames:MEMORY[0x263EFFA68] roomNames:MEMORY[0x263EFFA68]];
}

+ (ANAnnouncementDestination)destinationWithHomeName:(id)a3 zoneNames:(id)a4 roomNames:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setType:0];
  [v10 setHomeObject:v9];

  [v10 setZoneObjects:v8];
  [v10 setRoomObjects:v7];

  return (ANAnnouncementDestination *)v10;
}

+ (ANAnnouncementDestination)destinationWithHomeIdentifier:(id)a3
{
  return +[ANAnnouncementDestination destinationWithHomeIdentifier:a3 zoneIdentifiers:MEMORY[0x263EFFA68] roomIdentifiers:MEMORY[0x263EFFA68]];
}

+ (ANAnnouncementDestination)destinationWithHomeIdentifier:(id)a3 zoneIdentifiers:(id)a4 roomIdentifiers:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setType:1];
  [v10 setHomeObject:v9];

  [v10 setZoneObjects:v8];
  [v10 setRoomObjects:v7];

  return (ANAnnouncementDestination *)v10;
}

+ (ANAnnouncementDestination)destinationWithReplyToAnnouncementIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setType:2];
  [v4 setHomeObject:&stru_26D2D46B0];
  uint64_t v5 = MEMORY[0x263EFFA68];
  [v4 setZoneObjects:MEMORY[0x263EFFA68]];
  [v4 setRoomObjects:v5];
  [v4 setAnnouncementIdentifier:v3];

  return (ANAnnouncementDestination *)v4;
}

- (id)description
{
  id v3 = NSString;
  unint64_t v4 = [(ANAnnouncementDestination *)self type];
  uint64_t v5 = +[ANAnnouncementDestination stringFromAnnouncementDestinationType:[(ANAnnouncementDestination *)self type]];
  v6 = [(ANAnnouncementDestination *)self homeObject];
  id v7 = [(ANAnnouncementDestination *)self zoneObjects];
  id v8 = [(ANAnnouncementDestination *)self roomObjects];
  id v9 = [(ANAnnouncementDestination *)self announcementIdentifier];
  v10 = [v3 stringWithFormat:@"Type = [%lu - %@], Home = %@, Zones = %@, Rooms = %@, Replying to AnnouncementID = %@, Replying to Sender = %d", v4, v5, v6, v7, v8, v9, -[ANAnnouncementDestination replyToSender](self, "replyToSender")];

  return v10;
}

- (BOOL)replyToSender
{
  return self->_replyToSender;
}

- (void)setReplyToSender:(BOOL)a3
{
  self->_replyToSender = a3;
}

+ (id)stringFromAnnouncementDestinationType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_264587380[a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[ANAnnouncementDestination type](self, "type"));
  [v5 encodeObject:v6 forKey:@"Type"];

  id v7 = [(ANAnnouncementDestination *)self homeObject];
  [v5 encodeObject:v7 forKey:@"Home"];

  id v8 = [(ANAnnouncementDestination *)self zoneObjects];
  [v5 encodeObject:v8 forKey:@"Zones"];

  id v9 = [(ANAnnouncementDestination *)self roomObjects];
  [v5 encodeObject:v9 forKey:@"Rooms"];

  v10 = [(ANAnnouncementDestination *)self announcementIdentifier];
  [v5 encodeObject:v10 forKey:@"AnnouncementIdentifier"];

  objc_msgSend(NSNumber, "numberWithBool:", -[ANAnnouncementDestination replyToSender](self, "replyToSender"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v11 forKey:@"ReplyToSender"];
}

- (ANAnnouncementDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ANAnnouncementDestination;
  id v5 = [(ANAnnouncementDestination *)&v29 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Type"];
    id v7 = v6;
    if (v6) {
      v5->_type = [v6 unsignedIntValue];
    }
    unint64_t v8 = [(ANAnnouncementDestination *)v5 type];
    if (v8 == 2)
    {
      id homeObject = v5->_homeObject;
      v5->_id homeObject = &stru_26D2D46B0;

      zoneObjects = v5->_zoneObjects;
      id v11 = (NSArray *)MEMORY[0x263EFFA68];
      v5->_zoneObjects = (NSArray *)MEMORY[0x263EFFA68];

      roomObjects = v5->_roomObjects;
      v5->_roomObjects = v11;
    }
    else
    {
      if (v8 > 1)
      {

        v27 = 0;
        goto LABEL_17;
      }
      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Home"];
      id v14 = v5->_homeObject;
      v5->_id homeObject = (id)v13;

      v15 = (void *)MEMORY[0x263EFFA08];
      uint64_t v16 = objc_opt_class();
      roomObjects = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
      uint64_t v17 = [v4 decodeObjectOfClasses:roomObjects forKey:@"Zones"];
      v18 = (void *)v17;
      v19 = (void *)MEMORY[0x263EFFA68];
      if (v17) {
        v20 = (void *)v17;
      }
      else {
        v20 = (void *)MEMORY[0x263EFFA68];
      }
      objc_storeStrong((id *)&v5->_zoneObjects, v20);

      uint64_t v21 = [v4 decodeObjectOfClasses:roomObjects forKey:@"Rooms"];
      v22 = (void *)v21;
      if (v21) {
        v23 = (void *)v21;
      }
      else {
        v23 = v19;
      }
      objc_storeStrong((id *)&v5->_roomObjects, v23);
    }
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnnouncementIdentifier"];
    announcementIdentifier = v5->_announcementIdentifier;
    v5->_announcementIdentifier = (NSString *)v24;

    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReplyToSender"];
    v5->_replyToSender = [v26 BOOLValue];
  }
  v27 = v5;
LABEL_17:

  return v27;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (id)homeObject
{
  return self->_homeObject;
}

- (void)setHomeObject:(id)a3
{
}

- (NSArray)zoneObjects
{
  return self->_zoneObjects;
}

- (void)setZoneObjects:(id)a3
{
}

- (NSArray)roomObjects
{
  return self->_roomObjects;
}

- (void)setRoomObjects:(id)a3
{
}

- (NSString)announcementIdentifier
{
  return self->_announcementIdentifier;
}

- (void)setAnnouncementIdentifier:(id)a3
{
}

- (ANAnnouncement)announcement
{
  return self->_announcement;
}

- (void)setAnnouncement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announcement, 0);
  objc_storeStrong((id *)&self->_announcementIdentifier, 0);
  objc_storeStrong((id *)&self->_roomObjects, 0);
  objc_storeStrong((id *)&self->_zoneObjects, 0);

  objc_storeStrong(&self->_homeObject, 0);
}

@end