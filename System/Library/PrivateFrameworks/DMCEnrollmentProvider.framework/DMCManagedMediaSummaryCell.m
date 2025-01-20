@interface DMCManagedMediaSummaryCell
- (void)_setText:(id)a3 image:(id)a4;
- (void)setManagedApp:(id)a3;
- (void)setManagedBook:(id)a3;
@end

@implementation DMCManagedMediaSummaryCell

- (void)setManagedBook:(id)a3
{
  id v5 = [a3 friendlyName];
  v4 = +[DMCApplicationProxy bookIconForVariant:1];
  [(DMCManagedMediaSummaryCell *)self _setText:v5 image:v4];
}

- (void)setManagedApp:(id)a3
{
  id v4 = a3;
  id v6 = [v4 name];
  id v5 = [v4 iconForVariant:1];

  [(DMCManagedMediaSummaryCell *)self _setText:v6 image:v5];
}

- (void)_setText:(id)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(DMCManagedMediaSummaryCell *)self setSelectionStyle:0];
  id v8 = [MEMORY[0x263F1C780] cellConfiguration];
  [v8 setText:v7];

  [v8 setImage:v6];
  [(DMCManagedMediaSummaryCell *)self setContentConfiguration:v8];
}

@end