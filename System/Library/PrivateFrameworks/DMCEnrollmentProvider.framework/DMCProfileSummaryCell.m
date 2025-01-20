@interface DMCProfileSummaryCell
+ (id)cellIdentifier;
- (void)setProfile:(id)a3;
@end

@implementation DMCProfileSummaryCell

+ (id)cellIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setProfile:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(DMCProfileSummaryCell *)self setSelectionStyle:0];
  v5 = [MEMORY[0x263F1C780] cellConfiguration];
  v6 = [v4 friendlyName];
  [v5 setText:v6];

  v7 = +[DMCIconFactory largeGearIcon];
  [v5 setImage:v7];

  v8 = [v4 organization];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F086A0]);
    v10 = [v4 organization];
    uint64_t v14 = *MEMORY[0x263F81500];
    v11 = [MEMORY[0x263F1C550] DMCProfileSecondaryLabelColor];
    v15[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v13 = (void *)[v9 initWithString:v10 attributes:v12];
    [v5 setSecondaryAttributedText:v13];
  }
  [(DMCProfileSummaryCell *)self setContentConfiguration:v5];
}

@end