@interface CKDateLabel
- (NSString)textForOverride;
- (id)_dateString;
- (id)text;
- (void)setDate:(id)a3;
- (void)setTextForOverride:(id)a3;
@end

@implementation CKDateLabel

- (void)setDate:(id)a3
{
  if (self->_textForOverride) {
    -[UIDateLabel setDate:](&v4, sel_setDate_, 0, v3.receiver, v3.super_class, self, CKDateLabel);
  }
  else {
    -[UIDateLabel setDate:](&v3, sel_setDate_, a3, self, CKDateLabel, v4.receiver, v4.super_class);
  }
}

- (id)_dateString
{
  textForOverride = self->_textForOverride;
  if (textForOverride)
  {
    objc_super v3 = textForOverride;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKDateLabel;
    objc_super v3 = [(UIDateLabel *)&v5 _dateString];
  }

  return v3;
}

- (id)text
{
  textForOverride = self->_textForOverride;
  if (textForOverride)
  {
    objc_super v3 = textForOverride;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKDateLabel;
    objc_super v3 = [(UIDateLabel *)&v5 text];
  }

  return v3;
}

- (void)setTextForOverride:(id)a3
{
  objc_super v4 = (NSString *)a3;
  if (v4) {
    [(CKDateLabel *)self setDate:0];
  }
  textForOverride = self->_textForOverride;
  self->_textForOverride = v4;
}

- (NSString)textForOverride
{
  return self->_textForOverride;
}

- (void).cxx_destruct
{
}

@end