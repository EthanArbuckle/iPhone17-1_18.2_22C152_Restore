@interface FBAInformationCell
+ (id)reuseIdentifier;
- (FBKQuestion)question;
- (NSString)itemIdentifier;
- (void)awakeFromNib;
- (void)setItemIdentifier:(id)a3;
- (void)setQuestion:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation FBAInformationCell

+ (id)reuseIdentifier
{
  return @"FBAInformationCell";
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)FBAInformationCell;
  [(FBAInformationCell *)&v2 awakeFromNib];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)FBAInformationCell;
  [(FBAInformationCell *)&v4 setSelected:a3 animated:a4];
}

- (void)setQuestion:(id)a3
{
  id v5 = a3;
  if ([v5 answerType] == (id)6)
  {
    objc_storeStrong((id *)&self->_question, a3);
    v6 = [v5 text];
    v7 = [(FBAInformationCell *)self textLabel];
    [v7 setText:v6];
  }
  else
  {
    v8 = +[FBALog appHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000A6528(v5, v8);
    }
  }
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (FBKQuestion)question
{
  return self->_question;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_question, 0);

  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end