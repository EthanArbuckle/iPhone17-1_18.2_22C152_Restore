@interface MCUIApplicationCell
- (void)setApplication:(id)a3;
@end

@implementation MCUIApplicationCell

- (void)setApplication:(id)a3
{
  id v4 = a3;
  [(MCUIApplicationCell *)self setAccessoryType:0];
  [(MCUIApplicationCell *)self setSelectionStyle:0];
  id v8 = [MEMORY[0x1E4F42B58] valueCellConfiguration];
  v5 = [v4 name];
  [v8 setText:v5];

  v6 = [v4 iconForVariant:0];
  [v8 setImage:v6];

  v7 = [v4 misStateString];

  [v8 setSecondaryText:v7];
  [(MCUIApplicationCell *)self setContentConfiguration:v8];
}

@end