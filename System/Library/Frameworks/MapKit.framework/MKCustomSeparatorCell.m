@interface MKCustomSeparatorCell
- (CGRect)_separatorFrame;
- (MKCustomSeparatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)leadingSeparatorInset;
- (double)leftSeparatorInset;
- (double)rightSeparatorInset;
- (double)trailingSeparatorInset;
- (void)_updateSeparatorInset;
- (void)setLeadingSeparatorInset:(double)a3;
- (void)setLeftSeparatorInset:(double)a3;
- (void)setRightSeparatorInset:(double)a3;
- (void)setTrailingSeparatorInset:(double)a3;
@end

@implementation MKCustomSeparatorCell

- (MKCustomSeparatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MKCustomSeparatorCell;
  v4 = [(MKCustomSeparatorCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(MKCustomSeparatorCell *)v4 _updateSeparatorInset];
  }
  return v5;
}

- (CGRect)_separatorFrame
{
  if ([(MKCustomSeparatorCell *)self isSeparatorHidden])
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MKCustomSeparatorCell;
    [(MKTableViewCell *)&v17 _separatorFrame];
    double v3 = v7;
    double v6 = v8;
    [(MKCustomSeparatorCell *)self leftSeparatorInset];
    double v4 = v9;
    [(MKCustomSeparatorCell *)self bounds];
    double Width = CGRectGetWidth(v18);
    [(MKCustomSeparatorCell *)self leftSeparatorInset];
    double v12 = Width - v11;
    [(MKCustomSeparatorCell *)self rightSeparatorInset];
    double v5 = v12 - v13;
  }
  double v14 = v4;
  double v15 = v3;
  double v16 = v6;
  result.size.height = v16;
  result.size.width = v5;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_updateSeparatorInset
{
  [(MKCustomSeparatorCell *)self leftSeparatorInset];
  double v4 = v3;
  [(MKCustomSeparatorCell *)self rightSeparatorInset];

  -[MKCustomSeparatorCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v4, 0.0, v5);
}

- (void)setLeftSeparatorInset:(double)a3
{
  if (self->_leftSeparatorInset != a3)
  {
    self->_leftSeparatorInset = a3;
    [(MKCustomSeparatorCell *)self _updateSeparatorInset];
  }
}

- (void)setRightSeparatorInset:(double)a3
{
  if (self->_rightSeparatorInset != a3)
  {
    self->_rightSeparatorInset = a3;
    [(MKCustomSeparatorCell *)self _updateSeparatorInset];
  }
}

- (void)setLeadingSeparatorInset:(double)a3
{
  if (MKApplicationLayoutDirectionIsRightToLeft())
  {
    [(MKCustomSeparatorCell *)self setRightSeparatorInset:a3];
  }
  else
  {
    [(MKCustomSeparatorCell *)self setLeftSeparatorInset:a3];
  }
}

- (double)leadingSeparatorInset
{
  if (MKApplicationLayoutDirectionIsRightToLeft())
  {
    [(MKCustomSeparatorCell *)self rightSeparatorInset];
  }
  else
  {
    [(MKCustomSeparatorCell *)self leftSeparatorInset];
  }
  return result;
}

- (void)setTrailingSeparatorInset:(double)a3
{
  if (MKApplicationLayoutDirectionIsRightToLeft())
  {
    [(MKCustomSeparatorCell *)self setLeftSeparatorInset:a3];
  }
  else
  {
    [(MKCustomSeparatorCell *)self setRightSeparatorInset:a3];
  }
}

- (double)trailingSeparatorInset
{
  if (MKApplicationLayoutDirectionIsRightToLeft())
  {
    [(MKCustomSeparatorCell *)self leftSeparatorInset];
  }
  else
  {
    [(MKCustomSeparatorCell *)self rightSeparatorInset];
  }
  return result;
}

- (double)leftSeparatorInset
{
  return self->_leftSeparatorInset;
}

- (double)rightSeparatorInset
{
  return self->_rightSeparatorInset;
}

@end