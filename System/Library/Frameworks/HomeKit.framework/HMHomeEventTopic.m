@interface HMHomeEventTopic
+ (id)topicFromSuffixID:(unint64_t)a3 homeUUID:(id)a4;
+ (unint64_t)suffixIDFromTopicSuffix:(id)a3;
@end

@implementation HMHomeEventTopic

+ (id)topicFromSuffixID:(unint64_t)a3 homeUUID:(id)a4
{
  id v5 = a4;
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
  v7 = [&unk_1EEF08240 objectForKeyedSubscript:v6];
  if (v7)
  {
    v8 = NSString;
    v9 = [v5 UUIDString];
    v10 = [v8 stringWithFormat:@"home.%@.%@", v9, v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (unint64_t)suffixIDFromTopicSuffix:(id)a3
{
  v3 = [&unk_1EEF08218 objectForKeyedSubscript:a3];
  v4 = [v3 objectForKeyedSubscript:@"topicID"];

  if (v4) {
    unint64_t v5 = [v4 unsignedLongLongValue];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

@end