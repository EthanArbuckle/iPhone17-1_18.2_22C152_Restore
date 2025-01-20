@interface UIImagePickerController(MessageUI)
+ (id)mf_systemImagePickerWithSourceType:()MessageUI;
@end

@implementation UIImagePickerController(MessageUI)

+ (id)mf_systemImagePickerWithSourceType:()MessageUI
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1828]);
  [v4 setSourceType:a3];
  v5 = [MEMORY[0x1E4FB1828] availableMediaTypesForSourceType:a3];
  [v4 setMediaTypes:v5];

  [v4 setAllowsEditing:0];
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v7 = [v4 _properties];
  v8 = (void *)[v6 initWithDictionary:v7];

  uint64_t v9 = *MEMORY[0x1E4F1CFD0];
  [v8 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4FB3278]];
  [v8 setObject:v9 forKey:*MEMORY[0x1E4FB31E8]];
  [v8 setObject:*MEMORY[0x1E4F15738] forKey:*MEMORY[0x1E4FB3270]];
  [v4 _setProperties:v8];
  [v4 _setImagePickerSavingOptions:6];
  [v4 _setConvertAutoloopsToGIF:1];

  return v4;
}

@end