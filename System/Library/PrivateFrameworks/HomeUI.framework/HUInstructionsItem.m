@interface HUInstructionsItem
- (HUInstructionsItem)initWithStyle:(unint64_t)a3 title:(id)a4 description:(id)a5;
@end

@implementation HUInstructionsItem

- (HUInstructionsItem)initWithStyle:(unint64_t)a3 title:(id)a4 description:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v17 = @"instructionsStyle";
  v9 = NSNumber;
  id v10 = a4;
  v11 = [v9 numberWithUnsignedInteger:a3];
  v18[0] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v13 = (void *)[v12 mutableCopy];

  objc_msgSend(v13, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E4F68AB8]);
  if (v8) {
    [v13 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }
  v16.receiver = self;
  v16.super_class = (Class)HUInstructionsItem;
  v14 = [(HFStaticItem *)&v16 initWithResults:v13];

  return v14;
}

@end