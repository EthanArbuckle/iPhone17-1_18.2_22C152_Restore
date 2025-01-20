@interface AKAuthorizationTwoLineTableViewCell
- (AKAuthorizationTwoLineTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_setup;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation AKAuthorizationTwoLineTableViewCell

- (AKAuthorizationTwoLineTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationTwoLineTableViewCell;
  v4 = [(AKAuthorizationTwoLineTableViewCell *)&v7 initWithStyle:3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(AKAuthorizationTwoLineTableViewCell *)v4 _setup];
  }
  return v5;
}

- (void)_setup
{
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  [(AKAuthorizationTwoLineTableViewCell *)self setBackgroundColor:v3];

  [(AKAuthorizationTwoLineTableViewCell *)self setSelectionStyle:1];
  v4 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F43870], 0x8000);
  v5 = [(AKAuthorizationTwoLineTableViewCell *)self detailTextLabel];
  [v5 setFont:v4];

  id v7 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v6 = [(AKAuthorizationTwoLineTableViewCell *)self detailTextLabel];
  [v6 setTextColor:v7];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationTwoLineTableViewCell;
  [(AKAuthorizationTwoLineTableViewCell *)&v4 setSelected:a3 animated:a4];
}

@end