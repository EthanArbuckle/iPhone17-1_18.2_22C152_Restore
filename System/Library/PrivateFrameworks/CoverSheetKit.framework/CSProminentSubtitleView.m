@interface CSProminentSubtitleView
+ (unint64_t)elementType;
- (BOOL)_usesCompactDate;
- (CSProminentSubtitleDateView)compactDateView;
- (CSProminentSubtitleDateView)dateView;
- (CSProminentSubtitleView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5;
- (void)layoutSubviews;
- (void)setCompactDateView:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateView:(id)a3;
@end

@implementation CSProminentSubtitleView

- (CSProminentSubtitleView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CSProminentSubtitleView;
  v11 = [(CSProminentTextElementView *)&v17 initWithDate:v8 font:v9 textColor:v10];
  if (v11)
  {
    v12 = [[CSProminentSubtitleDateView alloc] initWithDate:v8 font:v9 textColor:v10];
    dateView = v11->_dateView;
    v11->_dateView = v12;

    v14 = [[CSProminentSubtitleDateView alloc] initWithDate:v8 font:v9 textColor:v10];
    compactDateView = v11->_compactDateView;
    v11->_compactDateView = v14;
  }
  return v11;
}

+ (unint64_t)elementType
{
  return 2;
}

- (void)setDate:(id)a3
{
  dateView = self->_dateView;
  id v5 = a3;
  [(CSProminentSubtitleDateView *)dateView setDate:v5];
  [(CSProminentSubtitleDateView *)self->_compactDateView setDate:v5];
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CSProminentSubtitleView;
  [(CSProminentTextElementView *)&v2 layoutSubviews];
}

- (BOOL)_usesCompactDate
{
  return 0;
}

- (CSProminentSubtitleDateView)dateView
{
  return self->_dateView;
}

- (void)setDateView:(id)a3
{
}

- (CSProminentSubtitleDateView)compactDateView
{
  return self->_compactDateView;
}

- (void)setCompactDateView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactDateView, 0);

  objc_storeStrong((id *)&self->_dateView, 0);
}

@end