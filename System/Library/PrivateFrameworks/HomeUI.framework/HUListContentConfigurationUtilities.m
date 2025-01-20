@interface HUListContentConfigurationUtilities
+ (id)buttonStyleConfigurationForItem:(id)a3 isDestructive:(BOOL)a4;
+ (id)instructionsConfigurationForItem:(id)a3;
+ (id)labelConfiguration:(id)a3 forItem:(id)a4;
+ (id)labelDefaultConfigurationForItem:(id)a3;
+ (void)_setupCachedConfigurations;
@end

@implementation HUListContentConfigurationUtilities

+ (void)_setupCachedConfigurations
{
  if (_setupCachedConfigurations_onceToken != -1) {
    dispatch_once(&_setupCachedConfigurations_onceToken, &__block_literal_global_190);
  }
}

void __65__HUListContentConfigurationUtilities__setupCachedConfigurations__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F42B58] cellConfiguration];
  v1 = (void *)_MergedGlobals_631;
  _MergedGlobals_631 = v0;

  uint64_t v2 = [(id)_MergedGlobals_631 copy];
  v3 = (void *)qword_1EBA478F0;
  qword_1EBA478F0 = v2;
}

+ (id)buttonStyleConfigurationForItem:(id)a3 isDestructive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [(id)objc_opt_class() _setupCachedConfigurations];
  v6 = (void *)[(id)qword_1EBA478F0 copy];
  v7 = [v5 latestResults];

  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v6 setText:v8];

  if (v4) {
    [MEMORY[0x1E4F428B8] systemRedColor];
  }
  else {
  v9 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  }
  v10 = [v6 textProperties];
  [v10 setColor:v9];

  return v6;
}

+ (id)labelDefaultConfigurationForItem:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() _setupCachedConfigurations];
  BOOL v4 = objc_opt_class();
  id v5 = (void *)[(id)_MergedGlobals_631 copy];
  v6 = [v4 labelConfiguration:v5 forItem:v3];

  return v6;
}

+ (id)labelConfiguration:(id)a3 forItem:(id)a4
{
  id v5 = a3;
  v6 = [a4 latestResults];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v5 setText:v7];

  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  [v5 setSecondaryText:v8];

  v9 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v10 = [v5 secondaryTextProperties];
  [v10 setColor:v9];

  v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F689F8]];
  uint64_t v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68A00]];
  v13 = (void *)v12;
  if (v11)
  {
    [v5 setImage:v11];
  }
  else if (v12)
  {
    v14 = [MEMORY[0x1E4F42A80] systemImageNamed:v12];
    [v5 setImage:v14];
  }

  return v5;
}

+ (id)instructionsConfigurationForItem:(id)a3
{
  id v3 = a3;
  if (qword_1EBA47908 != -1) {
    dispatch_once(&qword_1EBA47908, &__block_literal_global_4_2);
  }
  BOOL v4 = [v3 latestResults];
  id v5 = [v4 objectForKeyedSubscript:@"instructionsStyle"];

  if (v5)
  {
    uint64_t v6 = [v5 integerValue];
  }
  else
  {
    NSLog(&cfstr_NoInstructions.isa);
    uint64_t v6 = -1;
  }
  v7 = [v3 latestResults];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v9 = [v3 latestResults];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];

  switch(v6)
  {
    case 0:
      uint64_t v12 = (void *)[(id)qword_1EBA478F8 copy];
      [v12 setText:v8];
      v13 = v12;
      goto LABEL_14;
    case 1:
      v11 = (void *)qword_1EBA47900;
      goto LABEL_11;
    case 2:
    case 3:
      v11 = (void *)qword_1EBA478F8;
LABEL_11:
      uint64_t v12 = (void *)[v11 copy];
      [v12 setText:v8];
      [v12 setSecondaryText:v10];
      break;
    case 4:
      uint64_t v12 = (void *)[(id)qword_1EBA478F8 copy];
      [v12 setText:v8];
      goto LABEL_15;
    case 5:
      v13 = (void *)[(id)qword_1EBA478F8 copy];
      uint64_t v12 = v13;
LABEL_14:
      [v13 setSecondaryText:v10];
LABEL_15:
      [v12 directionalLayoutMargins];
      double v15 = v14;
      [(id)qword_1EBA47900 directionalLayoutMargins];
      double v17 = v16;
      [v12 directionalLayoutMargins];
      double v19 = v18;
      [v12 directionalLayoutMargins];
      objc_msgSend(v12, "setDirectionalLayoutMargins:", v15, v17, v19);
      break;
    default:
      uint64_t v12 = 0;
      break;
  }

  return v12;
}

void __72__HUListContentConfigurationUtilities_instructionsConfigurationForItem___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F42B58] prominentInsetGroupedHeaderConfiguration];
  v1 = (void *)qword_1EBA478F8;
  qword_1EBA478F8 = v0;

  uint64_t v2 = [MEMORY[0x1E4F42B58] groupedHeaderConfiguration];
  id v3 = (void *)qword_1EBA47900;
  qword_1EBA47900 = v2;
}

@end