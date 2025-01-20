@interface UIImage(MessageList)
+ (id)mf_imageForChevronType:()MessageList;
+ (id)mf_imageForSummarySymbolWithFont:()MessageList;
@end

@implementation UIImage(MessageList)

+ (id)mf_imageForChevronType:()MessageList
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", *MEMORY[0x1E4F35058], 9);
  v5 = &mf_imageForChevronType__singleChevron;
  v6 = (void *)mf_imageForChevronType__singleChevron;
  mf_imageForChevronType__singleChevron = v4;

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", *MEMORY[0x1E4F35060], 10);
  v8 = (void *)mf_imageForChevronType__chevronCircle;
  mf_imageForChevronType__chevronCircle = v7;

  if (a3 == 1) {
    goto LABEL_4;
  }
  if (a3 == 2)
  {
    v5 = &mf_imageForChevronType__chevronCircle;
LABEL_4:
    id v9 = (id)*v5;
    goto LABEL_6;
  }
  id v9 = 0;
LABEL_6:
  return v9;
}

+ (id)mf_imageForSummarySymbolWithFont:()MessageList
{
  v3 = [MEMORY[0x1E4FB1830] configurationWithFont:a3 scale:1];
  uint64_t v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"text.line.2.summary" withConfiguration:v3];
  v5 = [v4 imageWithRenderingMode:2];

  return v5;
}

@end