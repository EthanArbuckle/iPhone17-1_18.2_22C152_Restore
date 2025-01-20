@interface AKTextualLinkButton
+ (id)buttonWithText:(id)a3 fontSize:(double)a4 target:(id)a5 action:(SEL)a6;
@end

@implementation AKTextualLinkButton

+ (id)buttonWithText:(id)a3 fontSize:(double)a4 target:(id)a5 action:(SEL)a6
{
  id v9 = a3;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  v12 = v11;
  if (v9) {
    [v11 setTitle:v9 forState:0];
  }
  if (a4 > 0.0)
  {
    v13 = [v12 titleLabel];
    v14 = [v13 font];

    v15 = [v14 fontWithSize:a4];
    v16 = [v12 titleLabel];
    [v16 setFont:v15];
  }
  if (a6) {
    [v12 addTarget:v10 action:a6 forControlEvents:64];
  }
  [v12 sizeToFit];

  return v12;
}

@end