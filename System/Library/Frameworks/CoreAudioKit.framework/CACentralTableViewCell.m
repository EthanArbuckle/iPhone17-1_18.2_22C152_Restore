@interface CACentralTableViewCell
- (CACentralTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)activityHConstraints;
- (NSArray)activityVConstraints;
- (NSArray)labelConstraints;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)connectionStatusLabel;
- (UILabel)deviceNameLabel;
- (UILabel)inputLabel;
- (UILabel)outputLabel;
- (UILabel)slashLabel;
- (void)createInitialConstraints;
- (void)dealloc;
- (void)setActivityHConstraints:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setActivityVConstraints:(id)a3;
- (void)setConnectionStatusLabel:(id)a3;
- (void)setDeviceNameLabel:(id)a3;
- (void)setInputLabel:(id)a3;
- (void)setLabelConstraints:(id)a3;
- (void)setOutputLabel:(id)a3;
- (void)setSlashLabel:(id)a3;
- (void)startIndicator;
- (void)stopIndicator;
- (void)updateConstraints;
@end

@implementation CACentralTableViewCell

- (CACentralTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CACentralTableViewCell;
  v4 = [(CACentralTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v4->_deviceNameLabel = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    -[UILabel setFont:](v4->_deviceNameLabel, "setFont:", [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]]);
    [(UILabel *)v4->_deviceNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_deviceNameLabel);
    v4->_connectionStatusLabel = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    -[UILabel setFont:](v4->_connectionStatusLabel, "setFont:", [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]]);
    [(UILabel *)v4->_connectionStatusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_connectionStatusLabel setEnabled:0];
    [(UILabel *)v4->_connectionStatusLabel setText:priv_getBTLELocalizedString(@"Not Connected", @"Not Connected")];
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_connectionStatusLabel);
    v4->_inputLabel = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    uint64_t v5 = *MEMORY[0x263F83588];
    -[UILabel setFont:](v4->_inputLabel, "setFont:", [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]]);
    [(UILabel *)v4->_inputLabel setEnabled:0];
    [(UILabel *)v4->_inputLabel setText:priv_getBTLELocalizedString(@"Input", @"Input")];
    [(UILabel *)v4->_inputLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_inputLabel);
    v4->_slashLabel = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    -[UILabel setFont:](v4->_slashLabel, "setFont:", [MEMORY[0x263F81708] preferredFontForTextStyle:v5]);
    [(UILabel *)v4->_slashLabel setEnabled:0];
    [(UILabel *)v4->_slashLabel setText:priv_getBTLELocalizedString(@"/", @"/")];
    [(UILabel *)v4->_slashLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_slashLabel);
    v4->_outputLabel = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    -[UILabel setFont:](v4->_outputLabel, "setFont:", [MEMORY[0x263F81708] preferredFontForTextStyle:v5]);
    [(UILabel *)v4->_outputLabel setEnabled:0];
    [(UILabel *)v4->_outputLabel setText:priv_getBTLELocalizedString(@"Output", @"Output")];
    [(UILabel *)v4->_outputLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_outputLabel);
    v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:2];
    v4->_activityIndicator = v6;
    [(UIActivityIndicatorView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v4->_activityIndicator setHidden:1];
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_activityIndicator);
    [(CACentralTableViewCell *)v4 createInitialConstraints];
  }
  return v4;
}

- (void)createInitialConstraints
{
  v3 = _NSDictionaryOfVariableBindings(&cfstr_Devicenamelabe.isa, self->_deviceNameLabel, self->_connectionStatusLabel, self->_inputLabel, self->_slashLabel, self->_outputLabel, self->_activityIndicator, 0);
  -[CACentralTableViewCell setLabelConstraints:](self, "setLabelConstraints:", (id)[MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-20-[_deviceNameLabel]-[_connectionStatusLabel]-|" options:2048 metrics:0 views:v3]);
  objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "addConstraints:", -[CACentralTableViewCell labelConstraints](self, "labelConstraints"));
  -[CACentralTableViewCell setActivityHConstraints:](self, "setActivityHConstraints:", [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[_activityIndicator]-|" options:0 metrics:0 views:v3]);
  -[CACentralTableViewCell setActivityVConstraints:](self, "setActivityVConstraints:", [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-8-[_activityIndicator]" options:0 metrics:0 views:v3]);
  v4 = (void *)[(CACentralTableViewCell *)self contentView];
  objc_msgSend(v4, "addConstraints:", objc_msgSend(MEMORY[0x263F08938], "constraintsWithVisualFormat:options:metrics:views:", @"V:|-5-[_deviceNameLabel]-2-[_inputLabel]-5-|", 0, 0, v3));
  uint64_t v5 = (void *)[(CACentralTableViewCell *)self contentView];
  objc_msgSend(v5, "addConstraints:", objc_msgSend(MEMORY[0x263F08938], "constraintsWithVisualFormat:options:metrics:views:", @"H:|-20-[_inputLabel]-2-[_slashLabel]-2-[_outputLabel]", 2048, 0, v3));
  LODWORD(v6) = 1144766464;
  [(UILabel *)self->_connectionStatusLabel setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1132134400;
  [(UILabel *)self->_connectionStatusLabel setContentHuggingPriority:0 forAxis:v7];
  LODWORD(v8) = 1144750080;
  [(UILabel *)self->_deviceNameLabel setContentCompressionResistancePriority:0 forAxis:v8];
  deviceNameLabel = self->_deviceNameLabel;
  LODWORD(v10) = 1132068864;

  [(UILabel *)deviceNameLabel setContentHuggingPriority:0 forAxis:v10];
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)CACentralTableViewCell;
  [(CACentralTableViewCell *)&v4 updateConstraints];
  objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "removeConstraints:", -[CACentralTableViewCell labelConstraints](self, "labelConstraints"));
  v3 = _NSDictionaryOfVariableBindings(&cfstr_Devicenamelabe_0.isa, self->_deviceNameLabel, self->_connectionStatusLabel, self->_activityIndicator, 0);
  if ([(UIActivityIndicatorView *)self->_activityIndicator isHidden])
  {
    objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "removeConstraints:", -[CACentralTableViewCell activityHConstraints](self, "activityHConstraints"));
    objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "removeConstraints:", -[CACentralTableViewCell activityVConstraints](self, "activityVConstraints"));
    -[CACentralTableViewCell setLabelConstraints:](self, "setLabelConstraints:", [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-20-[_deviceNameLabel]-[_connectionStatusLabel]-|" options:2048 metrics:0 views:v3]);
  }
  else
  {
    -[CACentralTableViewCell setLabelConstraints:](self, "setLabelConstraints:", [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-20-[_deviceNameLabel]-[_connectionStatusLabel]-[_activityIndicator]-|" options:2048 metrics:0 views:v3]);
    -[CACentralTableViewCell setActivityHConstraints:](self, "setActivityHConstraints:", [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[_activityIndicator]-|" options:0 metrics:0 views:v3]);
    objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "addConstraints:", -[CACentralTableViewCell activityHConstraints](self, "activityHConstraints"));
    objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "addConstraints:", -[CACentralTableViewCell activityVConstraints](self, "activityVConstraints"));
  }
  objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "addConstraints:", -[CACentralTableViewCell labelConstraints](self, "labelConstraints"));
}

- (void)startIndicator
{
  if (![(UIActivityIndicatorView *)self->_activityIndicator isAnimating])
  {
    [(UIActivityIndicatorView *)self->_activityIndicator setHidden:0];
    [(CACentralTableViewCell *)self setNeedsUpdateConstraints];
    activityIndicator = self->_activityIndicator;
    [(UIActivityIndicatorView *)activityIndicator startAnimating];
  }
}

- (void)stopIndicator
{
  if ([(UIActivityIndicatorView *)self->_activityIndicator isAnimating])
  {
    [(UIActivityIndicatorView *)self->_activityIndicator setHidden:1];
    [(CACentralTableViewCell *)self setNeedsUpdateConstraints];
    activityIndicator = self->_activityIndicator;
    [(UIActivityIndicatorView *)activityIndicator stopAnimating];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CACentralTableViewCell;
  [(CACentralTableViewCell *)&v3 dealloc];
}

- (UILabel)deviceNameLabel
{
  return self->_deviceNameLabel;
}

- (void)setDeviceNameLabel:(id)a3
{
}

- (UILabel)connectionStatusLabel
{
  return self->_connectionStatusLabel;
}

- (void)setConnectionStatusLabel:(id)a3
{
}

- (UILabel)inputLabel
{
  return self->_inputLabel;
}

- (void)setInputLabel:(id)a3
{
}

- (UILabel)slashLabel
{
  return self->_slashLabel;
}

- (void)setSlashLabel:(id)a3
{
}

- (UILabel)outputLabel
{
  return self->_outputLabel;
}

- (void)setOutputLabel:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (NSArray)labelConstraints
{
  return self->_labelConstraints;
}

- (void)setLabelConstraints:(id)a3
{
}

- (NSArray)activityHConstraints
{
  return self->_activityHConstraints;
}

- (void)setActivityHConstraints:(id)a3
{
}

- (NSArray)activityVConstraints
{
  return self->_activityVConstraints;
}

- (void)setActivityVConstraints:(id)a3
{
}

@end