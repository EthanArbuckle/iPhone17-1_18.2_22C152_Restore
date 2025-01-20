@interface SVSTextAnimator
- (NSString)text;
- (UILabel)label1;
- (UILabel)label2;
- (unint64_t)displayEndIndex;
- (void)_update;
- (void)setDisplayEndIndex:(unint64_t)a3;
- (void)setLabel1:(id)a3;
- (void)setLabel2:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SVSTextAnimator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label2, 0);
  objc_storeStrong((id *)&self->_label1, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_activeLabel, 0);
}

- (NSString)text
{
  return self->_text;
}

- (void)setLabel2:(id)a3
{
}

- (UILabel)label2
{
  return self->_label2;
}

- (void)setLabel1:(id)a3
{
}

- (UILabel)label1
{
  return self->_label1;
}

- (unint64_t)displayEndIndex
{
  return self->_displayEndIndex;
}

- (void)_update
{
  if (!self->_busy)
  {
    v3 = [(NSMutableArray *)self->_changes firstObject];
    v4 = v3;
    if (v3)
    {
      v5 = [v3 unsignedIntegerValue];
      [(NSMutableArray *)self->_changes removeObjectAtIndex:0];
      v6 = self->_activeLabel;
      label1 = self->_label1;
      if (v6 == label1) {
        label1 = self->_label2;
      }
      v8 = label1;
      v9 = [(NSMutableAttributedString *)self->_attributedText length];
      -[NSMutableAttributedString removeAttribute:range:](self->_attributedText, "removeAttribute:range:", NSForegroundColorAttributeName, 0, v9);
      if (v9 < v5) {
        v5 = v9;
      }
      attributedText = self->_attributedText;
      v11 = +[UIColor systemBlueColor];
      -[NSMutableAttributedString addAttribute:value:range:](attributedText, "addAttribute:value:range:", NSForegroundColorAttributeName, v11, 0, v5);

      v12 = self->_attributedText;
      v13 = +[UIColor clearColor];
      -[NSMutableAttributedString addAttribute:value:range:](v12, "addAttribute:value:range:", NSForegroundColorAttributeName, v13, v5, v9 - v5);

      [(UILabel *)v8 setAttributedText:self->_attributedText];
      self->_busy = 1;
      [(UILabel *)v8 setAlpha:0.0];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100136D00;
      v22[3] = &unk_1001A1BD8;
      v23 = v8;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100136D0C;
      v18[3] = &unk_1001A1870;
      v14 = v23;
      v19 = v14;
      v20 = v6;
      v21 = self;
      v15 = v6;
      +[UIView animateWithDuration:2 delay:v22 options:v18 animations:0.08 completion:0.0];
      activeLabel = self->_activeLabel;
      self->_activeLabel = v14;
      v17 = v14;
    }
  }
}

- (void)setText:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_text, a3);
  id v15 = v5;
  if (v15)
  {
    v6 = (NSMutableAttributedString *)[objc_alloc((Class)NSMutableAttributedString) initWithString:v15];
    attributedText = self->_attributedText;
    self->_attributedText = v6;

    id v8 = [v15 length];
    v9 = [(UILabel *)self->_label1 font];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = +[UIFont systemFontOfSize:15.0];
    }
    v12 = v11;

    -[NSMutableAttributedString addAttribute:value:range:](self->_attributedText, "addAttribute:value:range:", NSFontAttributeName, v12, 0, v8);
    v13 = self->_attributedText;
    v14 = +[UIColor clearColor];
    -[NSMutableAttributedString addAttribute:value:range:](v13, "addAttribute:value:range:", NSForegroundColorAttributeName, v14, 0, v8);

    [(UILabel *)self->_label1 setAlpha:0.0];
    [(UILabel *)self->_label1 setAttributedText:self->_attributedText];
    [(UILabel *)self->_label1 setHidden:0];
    [(UILabel *)self->_label2 setAlpha:0.0];
    [(UILabel *)self->_label2 setAttributedText:self->_attributedText];
    [(UILabel *)self->_label2 setHidden:0];
    objc_storeStrong((id *)&self->_activeLabel, self->_label1);
  }
  else
  {
    [(UILabel *)self->_label1 setText:&stru_1001A1DC0];
    [(UILabel *)self->_label2 setText:&stru_1001A1DC0];
  }
}

- (void)setDisplayEndIndex:(unint64_t)a3
{
  self->_displayEndIndex = a3;
  changes = self->_changes;
  if (!changes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_changes;
    self->_changes = v6;

    changes = self->_changes;
  }
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableArray *)changes addObject:v8];

  [(SVSTextAnimator *)self _update];
}

@end