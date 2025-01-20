@interface HMParsedEventTopic
- (BOOL)isIndexTopic;
- (HMParsedEventTopic)initWithTopic:(id)a3;
- (NSString)accessorySettingKeyPath;
- (NSString)mediaGroupSettingKeyPath;
- (NSString)mediaSystemSettingKeyPath;
- (NSString)originalTopic;
- (NSString)topicSuffix;
- (NSUUID)accessoryUUID;
- (NSUUID)homeUUID;
- (NSUUID)mediaGroupUUID;
- (NSUUID)mediaSystemUUID;
- (NSUUID)userUUID;
- (id)asAccessorySettingTopic;
- (id)asAccessoryTopic;
- (id)asHomeEventTopic;
- (id)asIndexAccessoryTopic;
- (id)asIndexHomeTopic;
- (id)asMediaGroupSettingTopic;
- (id)asMediaSystemSettingTopic;
- (id)description;
- (unint64_t)accessoryEventTopicSuffixID;
- (unint64_t)homeEventTopicSuffixID;
- (void)setAccessorySettingKeyPath:(id)a3;
- (void)setAccessoryUUID:(id)a3;
- (void)setHomeUUID:(id)a3;
- (void)setIsIndexTopic:(BOOL)a3;
- (void)setMediaGroupSettingKeyPath:(id)a3;
- (void)setMediaGroupUUID:(id)a3;
- (void)setMediaSystemSettingKeyPath:(id)a3;
- (void)setMediaSystemUUID:(id)a3;
- (void)setTopicSuffix:(id)a3;
- (void)setUserUUID:(id)a3;
@end

@implementation HMParsedEventTopic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaGroupSettingKeyPath, 0);
  objc_storeStrong((id *)&self->_mediaGroupUUID, 0);
  objc_storeStrong((id *)&self->_mediaSystemSettingKeyPath, 0);
  objc_storeStrong((id *)&self->_mediaSystemUUID, 0);
  objc_storeStrong((id *)&self->_accessorySettingKeyPath, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_topicSuffix, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);

  objc_storeStrong((id *)&self->_originalTopic, 0);
}

- (void)setMediaGroupSettingKeyPath:(id)a3
{
}

- (NSString)mediaGroupSettingKeyPath
{
  return self->_mediaGroupSettingKeyPath;
}

- (void)setMediaGroupUUID:(id)a3
{
}

- (NSUUID)mediaGroupUUID
{
  return self->_mediaGroupUUID;
}

- (void)setMediaSystemSettingKeyPath:(id)a3
{
}

- (NSString)mediaSystemSettingKeyPath
{
  return self->_mediaSystemSettingKeyPath;
}

- (void)setMediaSystemUUID:(id)a3
{
}

- (NSUUID)mediaSystemUUID
{
  return self->_mediaSystemUUID;
}

- (void)setAccessorySettingKeyPath:(id)a3
{
}

- (NSString)accessorySettingKeyPath
{
  return self->_accessorySettingKeyPath;
}

- (void)setUserUUID:(id)a3
{
}

- (NSUUID)userUUID
{
  return self->_userUUID;
}

- (void)setIsIndexTopic:(BOOL)a3
{
  self->_isIndexTopic = a3;
}

- (BOOL)isIndexTopic
{
  return self->_isIndexTopic;
}

- (void)setTopicSuffix:(id)a3
{
}

- (NSString)topicSuffix
{
  return self->_topicSuffix;
}

- (void)setAccessoryUUID:(id)a3
{
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setHomeUUID:(id)a3
{
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (NSString)originalTopic
{
  return self->_originalTopic;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(HMParsedEventTopic *)self homeUUID];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"-";
  }
  uint64_t v7 = [(HMParsedEventTopic *)self accessoryUUID];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"-";
  }
  uint64_t v10 = [(HMParsedEventTopic *)self topicSuffix];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"-";
  }
  v13 = [v3 stringWithFormat:@"<HMParsedEventTopic homeUUID: %@ accessoryUUID: %@ topicSuffix: %@>", v6, v9, v12];

  return v13;
}

- (unint64_t)homeEventTopicSuffixID
{
  v2 = [(HMParsedEventTopic *)self topicSuffix];
  unint64_t v3 = +[HMHomeEventTopic suffixIDFromTopicSuffix:v2];

  return v3;
}

- (unint64_t)accessoryEventTopicSuffixID
{
  v2 = [(HMParsedEventTopic *)self topicSuffix];
  unint64_t v3 = +[HMAccessoryEventTopic suffixIDFromTopicSuffix:v2];

  return v3;
}

- (id)asIndexAccessoryTopic
{
  if (![(HMParsedEventTopic *)self isIndexTopic]) {
    goto LABEL_5;
  }
  unint64_t v3 = [(HMParsedEventTopic *)self homeUUID];
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = v3;
  v5 = [(HMParsedEventTopic *)self accessoryUUID];

  if (v5) {
    unint64_t v3 = self;
  }
  else {
LABEL_5:
  }
    unint64_t v3 = 0;
LABEL_6:

  return v3;
}

- (id)asIndexHomeTopic
{
  if (![(HMParsedEventTopic *)self isIndexTopic]) {
    goto LABEL_4;
  }
  unint64_t v3 = [(HMParsedEventTopic *)self homeUUID];
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v4 = v3;
  v5 = [(HMParsedEventTopic *)self accessoryUUID];

  if (!v5) {
    unint64_t v3 = self;
  }
  else {
LABEL_4:
  }
    unint64_t v3 = 0;
LABEL_5:

  return v3;
}

- (id)asHomeEventTopic
{
  if ([(HMParsedEventTopic *)self isIndexTopic]) {
    goto LABEL_4;
  }
  unint64_t v3 = [(HMParsedEventTopic *)self homeUUID];
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v4 = v3;
  v5 = [(HMParsedEventTopic *)self accessoryUUID];

  if (v5) {
LABEL_4:
  }
    unint64_t v3 = 0;
  else {
    unint64_t v3 = self;
  }
LABEL_5:

  return v3;
}

- (id)asMediaGroupSettingTopic
{
  if (![(HMParsedEventTopic *)self isIndexTopic])
  {
    unint64_t v3 = [(HMParsedEventTopic *)self homeUUID];
    if (!v3) {
      goto LABEL_8;
    }
    uint64_t v4 = v3;
    uint64_t v5 = [(HMParsedEventTopic *)self mediaGroupUUID];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(HMParsedEventTopic *)self mediaGroupSettingKeyPath];

      if (v7)
      {
        unint64_t v3 = self;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  unint64_t v3 = 0;
LABEL_8:

  return v3;
}

- (id)asMediaSystemSettingTopic
{
  if (![(HMParsedEventTopic *)self isIndexTopic])
  {
    unint64_t v3 = [(HMParsedEventTopic *)self homeUUID];
    if (!v3) {
      goto LABEL_8;
    }
    uint64_t v4 = v3;
    uint64_t v5 = [(HMParsedEventTopic *)self mediaSystemUUID];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(HMParsedEventTopic *)self mediaSystemSettingKeyPath];

      if (v7)
      {
        unint64_t v3 = self;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  unint64_t v3 = 0;
LABEL_8:

  return v3;
}

- (id)asAccessorySettingTopic
{
  unint64_t v3 = [(HMParsedEventTopic *)self asAccessoryTopic];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(HMParsedEventTopic *)self accessorySettingKeyPath];

    if (v5) {
      unint64_t v3 = self;
    }
    else {
      unint64_t v3 = 0;
    }
  }

  return v3;
}

- (id)asAccessoryTopic
{
  if ([(HMParsedEventTopic *)self isIndexTopic]) {
    goto LABEL_2;
  }
  unint64_t v3 = [(HMParsedEventTopic *)self accessoryUUID];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(HMParsedEventTopic *)self homeUUID];

    if (!v5)
    {
LABEL_2:
      unint64_t v3 = 0;
      goto LABEL_6;
    }
    unint64_t v3 = self;
  }
LABEL_6:

  return v3;
}

- (HMParsedEventTopic)initWithTopic:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMParsedEventTopic;
  v6 = [(HMParsedEventTopic *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_originalTopic, a3);
  }

  return v7;
}

@end