@interface ATXNotificationsInterface
+ (BOOL)supportsSecureCoding;
+ (id)createArchivedMetadata:(id)a3 categoryId:(id)a4 title:(id)a5 subtitle:(id)a6 message:(id)a7 numSuppActions:(id)a8 feed:(unint64_t)a9;
+ (id)getBundleIdFromMetadata:(id)a3;
+ (id)getMessageFromMetadata:(id)a3;
+ (id)getNumSuppActionsFromMetadata:(id)a3;
+ (id)getSubtitleFromMetadata:(id)a3;
+ (id)getTimezoneFromMetadata:(id)a3;
+ (id)getTitleFromMetadata:(id)a3;
+ (id)getTopicFromMetadata:(id)a3;
+ (unint64_t)getFeedFromMetadata:(id)a3;
+ (void)stripContentInMetadata:(id)a3;
- (ATXNotificationsInterface)initWithCoder:(id)a3;
- (NSDate)publicationDate;
- (NSString)message;
- (NSString)sectionID;
- (NSString)subtitle;
- (NSString)title;
- (NSString)topic;
- (id)extractMetadata;
- (unint64_t)feed;
- (unint64_t)numSuppActions;
- (void)encodeWithCoder:(id)a3;
- (void)setFeed:(unint64_t)a3;
- (void)setMessage:(id)a3;
- (void)setNumSuppActions:(unint64_t)a3;
- (void)setPublicationDate:(id)a3;
- (void)setSectionID:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation ATXNotificationsInterface

- (id)extractMetadata
{
  v3 = [NSNumber numberWithUnsignedInteger:self->_numSuppActions];
  v4 = +[ATXNotificationsInterface createArchivedMetadata:self->_sectionID categoryId:self->_topic title:self->_title subtitle:self->_subtitle message:self->_message numSuppActions:v3 feed:self->_feed];

  return v4;
}

+ (id)createArchivedMetadata:(id)a3 categoryId:(id)a4 title:(id)a5 subtitle:(id)a6 message:(id)a7 numSuppActions:(id)a8 feed:(unint64_t)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = objc_opt_new();
  v21 = v20;
  if (v14) {
    [v20 setObject:v14 forKeyedSubscript:@"appName"];
  }
  if (v15) {
    [v21 setObject:v15 forKeyedSubscript:@"categoryID"];
  }
  if (v16) {
    [v21 setObject:v16 forKeyedSubscript:@"title"];
  }
  if (v17) {
    [v21 setObject:v17 forKeyedSubscript:@"subtitle"];
  }
  if (v18) {
    [v21 setObject:v18 forKeyedSubscript:@"message"];
  }
  if (v19) {
    [v21 setObject:v19 forKeyedSubscript:@"numSuppActions"];
  }
  v22 = [NSNumber numberWithUnsignedInteger:a9];
  [v21 setObject:v22 forKeyedSubscript:@"feed"];

  v23 = NSNumber;
  v24 = [MEMORY[0x263EFFA18] localTimeZone];
  v25 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "secondsFromGMT"));
  [v21 setObject:v25 forKeyedSubscript:@"tz"];

  return v21;
}

+ (void)stripContentInMetadata:(id)a3
{
  id v3 = a3;
  [v3 removeObjectForKey:@"title"];
  [v3 removeObjectForKey:@"subtitle"];
  [v3 removeObjectForKey:@"message"];
}

+ (id)getBundleIdFromMetadata:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"appName"];
  v4 = v3;
  if (!v3) {
    id v3 = @"unknown";
  }
  v5 = v3;

  return v5;
}

+ (id)getTopicFromMetadata:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"categoryID"];
  v4 = v3;
  if (!v3) {
    id v3 = @"unknown";
  }
  v5 = v3;

  return v5;
}

+ (id)getTitleFromMetadata:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"title"];
}

+ (id)getSubtitleFromMetadata:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"subtitle"];
}

+ (id)getMessageFromMetadata:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"message"];
}

+ (id)getNumSuppActionsFromMetadata:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"numSuppActions"];
  v4 = v3;
  if (!v3) {
    id v3 = &unk_26EFE93C8;
  }
  id v5 = v3;

  return v5;
}

+ (id)getTimezoneFromMetadata:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"tz"];
  if (v4
    && (id v5 = (void *)v4,
        [v3 objectForKeyedSubscript:@"tz"],
        v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    v8 = [v3 objectForKeyedSubscript:@"tz"];
  }
  else
  {
    v9 = NSNumber;
    v10 = [MEMORY[0x263EFFA18] localTimeZone];
    v8 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "secondsFromGMT"));
  }

  return v8;
}

+ (unint64_t)getFeedFromMetadata:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"feed"];
  uint64_t v4 = (void *)v3;
  id v5 = &unk_26EFE93C8;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  unint64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sectionID = self->_sectionID;
  id v5 = a3;
  [v5 encodeObject:sectionID forKey:@"appName"];
  [v5 encodeObject:self->_topic forKey:@"categoryID"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_message forKey:@"message"];
  [v5 encodeObject:self->_publicationDate forKey:@"pubdate"];
  [v5 encodeInteger:self->_numSuppActions forKey:@"numSuppActions"];
  [v5 encodeInteger:self->_feed forKey:@"feed"];
}

- (ATXNotificationsInterface)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ATXNotificationsInterface;
  id v5 = [(ATXNotificationsInterface *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appName"];
    sectionID = v5->_sectionID;
    v5->_sectionID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"categoryID"];
    topic = v5->_topic;
    v5->_topic = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pubdate"];
    publicationDate = v5->_publicationDate;
    v5->_publicationDate = (NSDate *)v16;

    v5->_numSuppActions = [v4 decodeIntegerForKey:@"numSuppActions"];
    v5->_feed = [v4 decodeIntegerForKey:@"feed"];
  }

  return v5;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSDate)publicationDate
{
  return self->_publicationDate;
}

- (void)setPublicationDate:(id)a3
{
}

- (unint64_t)numSuppActions
{
  return self->_numSuppActions;
}

- (void)setNumSuppActions:(unint64_t)a3
{
  self->_numSuppActions = a3;
}

- (unint64_t)feed
{
  return self->_feed;
}

- (void)setFeed:(unint64_t)a3
{
  self->_feed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicationDate, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_topic, 0);

  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end