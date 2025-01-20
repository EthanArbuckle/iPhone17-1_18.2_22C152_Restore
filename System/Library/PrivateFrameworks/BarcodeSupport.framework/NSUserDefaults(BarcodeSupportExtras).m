@interface NSUserDefaults(BarcodeSupportExtras)
+ (id)bcs_barcodeSupportDefaults;
- (uint64_t)bcs_BOOLForKey:()BarcodeSupportExtras defaultValue:;
@end

@implementation NSUserDefaults(BarcodeSupportExtras)

+ (id)bcs_barcodeSupportDefaults
{
  if (bcs_barcodeSupportDefaults_onceToken != -1) {
    dispatch_once(&bcs_barcodeSupportDefaults_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)bcs_barcodeSupportDefaults_barcodeSupportDefaults;
  return v0;
}

- (uint64_t)bcs_BOOLForKey:()BarcodeSupportExtras defaultValue:
{
  v5 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

@end