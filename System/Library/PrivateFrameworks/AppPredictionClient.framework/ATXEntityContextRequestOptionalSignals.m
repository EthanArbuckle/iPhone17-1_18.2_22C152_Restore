@interface ATXEntityContextRequestOptionalSignals
+ (BOOL)supportsSecureCoding;
- (ATXEntityContextRequestOptionalSignals)initWithCoder:(id)a3;
- (ATXEntityContextRequestOptionalSignals)initWithEntityID:(id)a3;
- (NSNumber)isAudioMessage;
- (NSNumber)isFromGroupMessage;
- (NSNumber)isFromMailingList;
- (NSNumber)isFromPinnedMessage;
- (NSNumber)isMentionedInGroup;
- (NSString)entityID;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityID:(id)a3;
- (void)setIsAudioMessage:(id)a3;
- (void)setIsFromGroupMessage:(id)a3;
- (void)setIsFromMailingList:(id)a3;
- (void)setIsFromPinnedMessage:(id)a3;
- (void)setIsMentionedInGroup:(id)a3;
@end

@implementation ATXEntityContextRequestOptionalSignals

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXEntityContextRequestOptionalSignals)initWithEntityID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXEntityContextRequestOptionalSignals;
  v5 = [(ATXEntityContextRequestOptionalSignals *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    entityID = v5->_entityID;
    v5->_entityID = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXEntityContextRequestOptionalSignals *)self entityID];
  [v4 encodeObject:v5 forKey:@"entityID"];

  uint64_t v6 = [(ATXEntityContextRequestOptionalSignals *)self isFromPinnedMessage];
  [v4 encodeObject:v6 forKey:@"isFromPinnedMessage"];

  v7 = [(ATXEntityContextRequestOptionalSignals *)self isFromGroupMessage];
  [v4 encodeObject:v7 forKey:@"isFromGroupMessage"];

  v8 = [(ATXEntityContextRequestOptionalSignals *)self isMentionedInGroup];
  [v4 encodeObject:v8 forKey:@"isMentionedInGroup"];

  objc_super v9 = [(ATXEntityContextRequestOptionalSignals *)self isAudioMessage];
  [v4 encodeObject:v9 forKey:@"isAudioMessage"];

  id v10 = [(ATXEntityContextRequestOptionalSignals *)self isFromMailingList];
  [v4 encodeObject:v10 forKey:@"isFromMailingList"];
}

- (ATXEntityContextRequestOptionalSignals)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ATXEntityContextRequestOptionalSignals;
  v5 = [(ATXEntityContextRequestOptionalSignals *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityID"];
    entityID = v5->_entityID;
    v5->_entityID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isFromPinnedMessage"];
    isFromPinnedMessage = v5->_isFromPinnedMessage;
    v5->_isFromPinnedMessage = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isFromGroupMessage"];
    isFromGroupMessage = v5->_isFromGroupMessage;
    v5->_isFromGroupMessage = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isMentionedInGroup"];
    isMentionedInGroup = v5->_isMentionedInGroup;
    v5->_isMentionedInGroup = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAudioMessage"];
    isAudioMessage = v5->_isAudioMessage;
    v5->_isAudioMessage = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isFromMailingList"];
    isFromMailingList = v5->_isFromMailingList;
    v5->_isFromMailingList = (NSNumber *)v16;

    v18 = v5;
  }

  return v5;
}

- (NSString)entityID
{
  return self->_entityID;
}

- (void)setEntityID:(id)a3
{
}

- (NSNumber)isFromPinnedMessage
{
  return self->_isFromPinnedMessage;
}

- (void)setIsFromPinnedMessage:(id)a3
{
}

- (NSNumber)isFromGroupMessage
{
  return self->_isFromGroupMessage;
}

- (void)setIsFromGroupMessage:(id)a3
{
}

- (NSNumber)isMentionedInGroup
{
  return self->_isMentionedInGroup;
}

- (void)setIsMentionedInGroup:(id)a3
{
}

- (NSNumber)isAudioMessage
{
  return self->_isAudioMessage;
}

- (void)setIsAudioMessage:(id)a3
{
}

- (NSNumber)isFromMailingList
{
  return self->_isFromMailingList;
}

- (void)setIsFromMailingList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isFromMailingList, 0);
  objc_storeStrong((id *)&self->_isAudioMessage, 0);
  objc_storeStrong((id *)&self->_isMentionedInGroup, 0);
  objc_storeStrong((id *)&self->_isFromGroupMessage, 0);
  objc_storeStrong((id *)&self->_isFromPinnedMessage, 0);

  objc_storeStrong((id *)&self->_entityID, 0);
}

@end