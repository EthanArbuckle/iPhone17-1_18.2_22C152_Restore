@interface IMDPLogsCollector
+ (id)_primaryAccountCountryCode;
+ (id)sharedInstance;
- (BOOL)logPrivatizedImageReceivedEvent:(BOOL)a3;
- (BOOL)logPrivatizedImageSentEvent:(BOOL)a3;
- (BOOL)logPrivatizedUIInteractionEvent:(unint64_t)a3;
- (IMDPLogsCollector)init;
- (_DPBitValueRecorder)privatizedImageReceivedRecorder;
- (_DPBitValueRecorder)privatizedImageSentRecorder;
- (_DPBitValueRecorder)privatizedUIInteractionRecorder;
- (void)setPrivatizedImageReceivedRecorder:(id)a3;
- (void)setPrivatizedImageSentRecorder:(id)a3;
- (void)setPrivatizedUIInteractionRecorder:(id)a3;
@end

@implementation IMDPLogsCollector

- (IMDPLogsCollector)init
{
  v21.receiver = self;
  v21.super_class = (Class)IMDPLogsCollector;
  v2 = [(IMDPLogsCollector *)&v21 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() _primaryAccountCountryCode];
    v4 = +[IMCommSafetySettingsManager sharedManager];
    int v5 = [v4 childIsYoungAgeGroup];
    v6 = @"ageGroup1";
    if (v5) {
      v6 = @"ageGroup0";
    }
    v7 = v6;

    if (v3)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F5F468]);
      v9 = [NSString stringWithFormat:@"com.apple.messages.CommunicationSafety.%@.%@.%@", @"PrivatizedUIInteraction", v7, v3];
      uint64_t v10 = [v8 initWithKey:v9];
      privatizedUIInteractionRecorder = v2->_privatizedUIInteractionRecorder;
      v2->_privatizedUIInteractionRecorder = (_DPBitValueRecorder *)v10;

      id v12 = objc_alloc(MEMORY[0x1E4F5F468]);
      v13 = [NSString stringWithFormat:@"com.apple.messages.CommunicationSafety.%@.%@.%@", @"PrivatizedImageReceived", v7, v3];
      uint64_t v14 = [v12 initWithKey:v13];
      privatizedImageReceivedRecorder = v2->_privatizedImageReceivedRecorder;
      v2->_privatizedImageReceivedRecorder = (_DPBitValueRecorder *)v14;

      id v16 = objc_alloc(MEMORY[0x1E4F5F468]);
      v17 = [NSString stringWithFormat:@"com.apple.messages.CommunicationSafety.%@.%@.%@", @"PrivatizedImageSent", v7, v3];
      uint64_t v18 = [v16 initWithKey:v17];
      privatizedImageSentRecorder = v2->_privatizedImageSentRecorder;
      v2->_privatizedImageSentRecorder = (_DPBitValueRecorder *)v18;
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1EB4A6708 != -1) {
    dispatch_once(&qword_1EB4A6708, &unk_1EF2BF720);
  }
  v2 = (void *)qword_1EB4A6670;

  return v2;
}

+ (id)_primaryAccountCountryCode
{
  v2 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v3 = [v2 primaryAuthKitAccount];
  if (v3)
  {
    v4 = [v2 appleIDCountryCodeForAccount:v3];
    int v5 = [v4 lowercaseString];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)logPrivatizedUIInteractionEvent:(unint64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v5 = +[IMCommSafetySettingsManager sharedManager];
  int v6 = [v5 checkSensitivePhotosAnalyticsEnabled];

  if (!v6) {
    return 0;
  }
  v7 = [(IMDPLogsCollector *)self privatizedUIInteractionRecorder];
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v13 = *MEMORY[0x1E4F5F4B8];
  uint64_t v14 = @"1";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  char v11 = [v7 record:v9 metadata:v10];

  return v11;
}

- (BOOL)logPrivatizedImageReceivedEvent:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  int v5 = +[IMCommSafetySettingsManager sharedManager];
  int v6 = [v5 checkSensitivePhotosAnalyticsEnabled];

  if (!v6) {
    return 0;
  }
  v7 = [(IMDPLogsCollector *)self privatizedImageReceivedRecorder];
  id v8 = [NSNumber numberWithBool:v3];
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v13 = *MEMORY[0x1E4F5F4B8];
  uint64_t v14 = @"1";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  char v11 = [v7 record:v9 metadata:v10];

  return v11;
}

- (BOOL)logPrivatizedImageSentEvent:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  int v5 = +[IMCommSafetySettingsManager sharedManager];
  int v6 = [v5 checkSensitivePhotosAnalyticsEnabled];

  if (!v6) {
    return 0;
  }
  v7 = [(IMDPLogsCollector *)self privatizedImageSentRecorder];
  id v8 = [NSNumber numberWithBool:v3];
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v13 = *MEMORY[0x1E4F5F4B8];
  uint64_t v14 = @"1";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  char v11 = [v7 record:v9 metadata:v10];

  return v11;
}

- (_DPBitValueRecorder)privatizedUIInteractionRecorder
{
  return self->_privatizedUIInteractionRecorder;
}

- (void)setPrivatizedUIInteractionRecorder:(id)a3
{
}

- (_DPBitValueRecorder)privatizedImageReceivedRecorder
{
  return self->_privatizedImageReceivedRecorder;
}

- (void)setPrivatizedImageReceivedRecorder:(id)a3
{
}

- (_DPBitValueRecorder)privatizedImageSentRecorder
{
  return self->_privatizedImageSentRecorder;
}

- (void)setPrivatizedImageSentRecorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privatizedImageSentRecorder, 0);
  objc_storeStrong((id *)&self->_privatizedImageReceivedRecorder, 0);

  objc_storeStrong((id *)&self->_privatizedUIInteractionRecorder, 0);
}

@end