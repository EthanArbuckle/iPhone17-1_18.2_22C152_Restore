@interface HMCollectionSetting
+ (id)defaultItemValueClasses;
- (BOOL)isKindOfClass:(Class)a3;
- (NSSet)itemValueClasses;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation HMCollectionSetting

- (void).cxx_destruct
{
}

- (NSSet)itemValueClasses
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = [(HMSetting *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  unint64_t v11 = [v10 countByEnumeratingWithState:a3 objects:a4 count:a5];
  return v11;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMCollectionSetting;
  return -[HMCollectionSetting isKindOfClass:](&v5, sel_isKindOfClass_) || objc_opt_class() == (void)a3;
}

+ (id)defaultItemValueClasses
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

@end