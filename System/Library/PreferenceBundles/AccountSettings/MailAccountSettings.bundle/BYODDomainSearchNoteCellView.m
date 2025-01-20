@interface BYODDomainSearchNoteCellView
+ (id)log;
- (BYODDomainSearchNoteCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSDictionary)boldAttr;
- (NSDictionary)normalAttr;
- (UILabel)noteLabel;
- (void)setBoldAttr:(id)a3;
- (void)setNormalAttr:(id)a3;
- (void)setNote:(id)a3;
- (void)setNoteLabel:(id)a3;
- (void)setNoteWithDomain:(id)a3;
@end

@implementation BYODDomainSearchNoteCellView

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4457C;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7438 != -1) {
    dispatch_once(&qword_D7438, block);
  }
  v2 = (void *)qword_D7430;

  return v2;
}

- (BYODDomainSearchNoteCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v36.receiver = self;
  v36.super_class = (Class)BYODDomainSearchNoteCellView;
  v7 = [(BYODDomainSearchNoteCellView *)&v36 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    NSAttributedStringKey v39 = NSFontAttributeName;
    +[UIFont systemMinimumFontSize];
    v8 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    v40 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    boldAttr = v7->_boldAttr;
    v7->_boldAttr = (NSDictionary *)v9;

    NSAttributedStringKey v37 = NSFontAttributeName;
    +[UIFont systemMinimumFontSize];
    v11 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    v38 = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    normalAttr = v7->_normalAttr;
    v7->_normalAttr = (NSDictionary *)v12;

    v14 = +[UIColor systemBackgroundColor];
    [(BYODDomainSearchNoteCellView *)v7 setBackgroundColor:v14];

    [(BYODDomainSearchNoteCellView *)v7 setSelectionStyle:0];
    uint64_t v15 = [(BYODDomainSearchNoteCellView *)v7 textLabel];
    noteLabel = v7->_noteLabel;
    v7->_noteLabel = (UILabel *)v15;

    v17 = v7->_noteLabel;
    v18 = +[UIColor systemGrayColor];
    [(UILabel *)v17 setTextColor:v18];

    [(UILabel *)v7->_noteLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_noteLabel setLineBreakMode:0];
    [(UILabel *)v7->_noteLabel setNumberOfLines:0];
    v19 = [(UILabel *)v7->_noteLabel topAnchor];
    v20 = [(BYODDomainSearchNoteCellView *)v7 contentView];
    v21 = [v20 topAnchor];
    v22 = [v19 constraintEqualToAnchor:v21 constant:4.0];
    [v22 setActive:1];

    v23 = [(UILabel *)v7->_noteLabel bottomAnchor];
    v24 = [(BYODDomainSearchNoteCellView *)v7 contentView];
    v25 = [v24 bottomAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:-20.0];
    [v26 setActive:1];

    v27 = [(UILabel *)v7->_noteLabel leadingAnchor];
    v28 = [(BYODDomainSearchNoteCellView *)v7 contentView];
    v29 = [v28 leadingAnchor];
    v30 = [v27 constraintEqualToAnchor:v29 constant:-30.0];
    [v30 setActive:1];

    v31 = [(UILabel *)v7->_noteLabel trailingAnchor];
    v32 = [(BYODDomainSearchNoteCellView *)v7 contentView];
    v33 = [v32 trailingAnchor];
    v34 = [v31 constraintEqualToAnchor:v33 constant:-41.0];
    [v34 setActive:1];
  }
  return v7;
}

- (void)setNoteWithDomain:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"BYOD_PURCHASE_SEARCH_NAME_UNAVAILABLE" value:&stru_B9F70 table:@"AccountPreferences"];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4);

    id v8 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v7 attributes:self->_normalAttr];
    uint64_t v9 = [v8 mutableString];
    id v10 = [v9 rangeOfString:v4];
    uint64_t v12 = v11;

    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v8, "addAttributes:range:", self->_boldAttr, v10, v12);
    }
    [(UILabel *)self->_noteLabel setAttributedText:v8];
  }
  else
  {
    v13 = +[BYODDomainSearchNoteCellView log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Cannot set domainName null", buf, 2u);
    }
  }
}

- (void)setNote:(id)a3
{
  id v5 = a3;
  id v4 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v5 attributes:self->_normalAttr];
  [(UILabel *)self->_noteLabel setAttributedText:v4];
}

- (UILabel)noteLabel
{
  return self->_noteLabel;
}

- (void)setNoteLabel:(id)a3
{
}

- (NSDictionary)normalAttr
{
  return self->_normalAttr;
}

- (void)setNormalAttr:(id)a3
{
}

- (NSDictionary)boldAttr
{
  return self->_boldAttr;
}

- (void)setBoldAttr:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boldAttr, 0);
  objc_storeStrong((id *)&self->_normalAttr, 0);

  objc_storeStrong((id *)&self->_noteLabel, 0);
}

@end