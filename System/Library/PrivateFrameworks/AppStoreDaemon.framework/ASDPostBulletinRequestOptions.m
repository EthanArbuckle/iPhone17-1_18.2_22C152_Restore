@interface ASDPostBulletinRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDPostBulletinRequestOptions)initWithCoder:(id)a3;
- (NSDate)creationDate;
- (NSString)actionButtonTitle;
- (NSString)message;
- (NSString)recordID;
- (NSString)title;
- (NSURL)actionButtonURL;
- (NSURL)launchURL;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)destinations;
- (void)encodeWithCoder:(id)a3;
- (void)setActionButtonTitle:(id)a3;
- (void)setActionButtonURL:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDestinations:(unint64_t)a3;
- (void)setLaunchURL:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ASDPostBulletinRequestOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDPostBulletinRequestOptions allocWithZone:](ASDPostBulletinRequestOptions, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_actionButtonTitle copyWithZone:a3];
  actionButtonTitle = v5->_actionButtonTitle;
  v5->_actionButtonTitle = (NSString *)v6;

  uint64_t v8 = [(NSURL *)self->_actionButtonURL copyWithZone:a3];
  actionButtonURL = v5->_actionButtonURL;
  v5->_actionButtonURL = (NSURL *)v8;

  uint64_t v10 = [(NSDate *)self->_creationDate copyWithZone:a3];
  creationDate = v5->_creationDate;
  v5->_creationDate = (NSDate *)v10;

  v5->_destinations = self->_destinations;
  uint64_t v12 = [(NSURL *)self->_launchURL copyWithZone:a3];
  launchURL = v5->_launchURL;
  v5->_launchURL = (NSURL *)v12;

  uint64_t v14 = [(NSString *)self->_message copyWithZone:a3];
  message = v5->_message;
  v5->_message = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_recordID copyWithZone:a3];
  recordID = v5->_recordID;
  v5->_recordID = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v18;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPostBulletinRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDPostBulletinRequestOptions;
  v5 = [(ASDRequestOptions *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionButtonTitle"];
    actionButtonTitle = v5->_actionButtonTitle;
    v5->_actionButtonTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionButtonURL"];
    actionButtonURL = v5->_actionButtonURL;
    v5->_actionButtonURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    v5->_destinations = [v4 decodeIntegerForKey:@"destinations"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchURL"];
    launchURL = v5->_launchURL;
    v5->_launchURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordID"];
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDPostBulletinRequestOptions *)self actionButtonTitle];
  [v4 encodeObject:v5 forKey:@"actionButtonTitle"];

  uint64_t v6 = [(ASDPostBulletinRequestOptions *)self actionButtonURL];
  [v4 encodeObject:v6 forKey:@"actionButtonURL"];

  v7 = [(ASDPostBulletinRequestOptions *)self creationDate];
  [v4 encodeObject:v7 forKey:@"creationDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDPostBulletinRequestOptions destinations](self, "destinations"), @"destinations");
  uint64_t v8 = [(ASDPostBulletinRequestOptions *)self launchURL];
  [v4 encodeObject:v8 forKey:@"launchURL"];

  v9 = [(ASDPostBulletinRequestOptions *)self message];
  [v4 encodeObject:v9 forKey:@"message"];

  uint64_t v10 = [(ASDPostBulletinRequestOptions *)self recordID];
  [v4 encodeObject:v10 forKey:@"recordID"];

  id v11 = [(ASDPostBulletinRequestOptions *)self title];
  [v4 encodeObject:v11 forKey:@"title"];
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (void)setActionButtonTitle:(id)a3
{
}

- (NSURL)actionButtonURL
{
  return self->_actionButtonURL;
}

- (void)setActionButtonURL:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (unint64_t)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(unint64_t)a3
{
  self->_destinations = a3;
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_actionButtonURL, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
}

@end