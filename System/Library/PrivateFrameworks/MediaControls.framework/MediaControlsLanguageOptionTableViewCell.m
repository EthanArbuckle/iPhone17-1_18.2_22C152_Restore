@interface MediaControlsLanguageOptionTableViewCell
- (MediaControlsLanguageOptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation MediaControlsLanguageOptionTableViewCell

- (MediaControlsLanguageOptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MediaControlsLanguageOptionTableViewCell;
  v4 = [(MPAVClippingTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(MediaControlsLanguageOptionTableViewCell *)v4 setBackgroundColor:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(MediaControlsLanguageOptionTableViewCell *)v4 setSelectedBackgroundView:v6];

    v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    v8 = [(MediaControlsLanguageOptionTableViewCell *)v4 selectedBackgroundView];
    [v8 setBackgroundColor:v7];

    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v10 = [(MediaControlsLanguageOptionTableViewCell *)v4 textLabel];
    [v10 setFont:v9];
  }
  return v4;
}

@end