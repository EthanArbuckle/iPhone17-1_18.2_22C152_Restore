@interface ANAnnouncementResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithAnnouncementID:(id)a3 destination:(id)a4;
- (ANAnnouncementDestination)destination;
- (ANAnnouncementResult)initWithAnnouncementID:(id)a3 destination:(id)a4;
- (ANAnnouncementResult)initWithCoder:(id)a3;
- (NSString)deliveredAnnouncementID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANAnnouncementResult

- (ANAnnouncementResult)initWithAnnouncementID:(id)a3 destination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ANAnnouncementResult;
  v9 = [(ANAnnouncementResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deliveredAnnouncementID, a3);
    objc_storeStrong((id *)&v10->_destination, a4);
  }

  return v10;
}

+ (id)resultWithAnnouncementID:(id)a3 destination:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ANAnnouncementResult alloc] initWithAnnouncementID:v6 destination:v5];

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(ANAnnouncementResult *)self deliveredAnnouncementID];
  id v5 = [(ANAnnouncementResult *)self destination];
  id v6 = [v3 stringWithFormat:@"Delivered Announcement ID = %@, Destination = %@", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAnnouncementResult *)self deliveredAnnouncementID];
  [v4 encodeObject:v5 forKey:@"AnnouncmentID"];

  id v6 = [(ANAnnouncementResult *)self destination];
  [v4 encodeObject:v6 forKey:@"Destination"];
}

- (ANAnnouncementResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ANAnnouncementResult;
  id v5 = [(ANAnnouncementResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnnouncmentID"];
    deliveredAnnouncementID = v5->_deliveredAnnouncementID;
    v5->_deliveredAnnouncementID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Destination"];
    destination = v5->_destination;
    v5->_destination = (ANAnnouncementDestination *)v8;
  }
  return v5;
}

- (NSString)deliveredAnnouncementID
{
  return self->_deliveredAnnouncementID;
}

- (ANAnnouncementDestination)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_deliveredAnnouncementID, 0);
}

@end