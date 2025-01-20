@interface FBKInlineChoiceCell
+ (id)reuseIdentifier;
- (FBKQuestionChoice)choice;
- (NSString)itemIdentifier;
- (void)setChoice:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)showCheckmark:(BOOL)a3;
@end

@implementation FBKInlineChoiceCell

+ (id)reuseIdentifier
{
  return @"FBKInlineChoiceCell";
}

- (void)setChoice:(id)a3
{
  id v4 = a3;
  v5 = [(FBKInlineChoiceCell *)self choice];
  choice = self->_choice;
  self->_choice = v5;

  v7 = NSString;
  id v10 = [v4 title];

  v8 = [v7 stringWithFormat:@"%@", v10];
  v9 = [(FBKInlineChoiceCell *)self textLabel];
  [v9 setText:v8];
}

- (void)showCheckmark:(BOOL)a3
{
  if (a3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82828]);
    id v6 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark"];
    v5 = (void *)[v4 initWithImage:v6];
    [(FBKInlineChoiceCell *)self setAccessoryView:v5];
  }
  else
  {
    [(FBKInlineChoiceCell *)self setAccessoryView:0];
  }
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (FBKQuestionChoice)choice
{
  return self->_choice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choice, 0);

  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end