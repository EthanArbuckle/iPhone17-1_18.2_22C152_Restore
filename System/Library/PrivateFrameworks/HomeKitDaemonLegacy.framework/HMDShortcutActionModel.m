@interface HMDShortcutActionModel
+ (Class)backedObjectClass;
+ (id)properties;
- (void)loadModelWithActionInformation:(id)a3;
@end

@implementation HMDShortcutActionModel

+ (id)properties
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HMDShortcutActionModel;
  v2 = objc_msgSendSuper2(&v9, sel_properties);
  v3 = (void *)[v2 mutableCopy];

  v4 = NSStringFromSelector(sel_data);
  v10 = v4;
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v3 addEntriesFromDictionary:v6];

  v7 = (void *)[v3 copy];
  return v7;
}

+ (Class)backedObjectClass
{
  return (Class)objc_opt_class();
}

- (void)loadModelWithActionInformation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDShortcutActionModel;
  id v4 = a3;
  [(HMDActionModel *)&v6 loadModelWithActionInformation:v4];
  v5 = objc_msgSend(v4, "hmf_dataForKey:", *MEMORY[0x1E4F2E470], v6.receiver, v6.super_class);

  [(HMDShortcutActionModel *)self setData:v5];
}

@end