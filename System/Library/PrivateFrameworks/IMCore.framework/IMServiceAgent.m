@interface IMServiceAgent
+ (id)imageNameForStatus:(unint64_t)a3;
+ (id)imageURLForStatus:(unint64_t)a3;
+ (id)notificationCenter;
+ (id)sharedAgent;
+ (int64_t)serviceAgentCapabilities;
+ (void)forgetStatusImageAppearance;
- (NSArray)myAvailableMessages;
- (NSArray)myAwayMessages;
- (NSDictionary)currentAVChatInfo;
- (id)myPictureData;
- (id)notificationCenter;
- (id)serviceWithName:(id)a3;
- (id)serviceWithNameNonBlocking:(id)a3;
- (unint64_t)requestAudioReflectorStart;
- (unint64_t)requestAudioReflectorStop;
- (unint64_t)requestVideoStillForPerson:(id)a3;
- (unint64_t)vcCapabilities;
@end

@implementation IMServiceAgent

+ (id)notificationCenter
{
  return 0;
}

+ (int64_t)serviceAgentCapabilities
{
  return 0;
}

+ (id)sharedAgent
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(IMServiceAgentImpl, sel_sharedAgent);
}

+ (id)imageURLForStatus:(unint64_t)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, unint64_t))MEMORY[0x1F4181798])(IMServiceAgentImpl, sel_imageURLForStatus_, a3);
}

+ (id)imageNameForStatus:(unint64_t)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, unint64_t))MEMORY[0x1F4181798])(IMServiceAgentImpl, sel_imageNameForStatus_, a3);
}

+ (void)forgetStatusImageAppearance
{
  objc_msgSend_forgetStatusImageAppearance(IMServiceAgentImpl, a2, v2, v3);
}

- (id)serviceWithName:(id)a3
{
  return 0;
}

- (id)serviceWithNameNonBlocking:(id)a3
{
  return 0;
}

- (id)notificationCenter
{
  return 0;
}

- (NSArray)myAvailableMessages
{
  return 0;
}

- (NSArray)myAwayMessages
{
  return 0;
}

- (NSDictionary)currentAVChatInfo
{
  return 0;
}

- (unint64_t)requestAudioReflectorStart
{
  return 0;
}

- (unint64_t)requestAudioReflectorStop
{
  return 0;
}

- (unint64_t)requestVideoStillForPerson:(id)a3
{
  return 0;
}

- (unint64_t)vcCapabilities
{
  return 0;
}

- (id)myPictureData
{
  v4 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  v8 = objc_msgSend_bestAccountForStatus(v4, v5, v6, v7);
  v12 = objc_msgSend_myPictureData(v8, v9, v10, v11);

  return v12;
}

@end