@interface FBKInformationCell
+ (id)reuseIdentifier;
- (FBKQuestion)question;
- (NSString)itemIdentifier;
- (void)awakeFromNib;
- (void)setItemIdentifier:(id)a3;
- (void)setQuestion:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation FBKInformationCell

+ (id)reuseIdentifier
{
  return @"FBKInformationCell";
}

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)FBKInformationCell;
  [(FBKInformationCell *)&v4 awakeFromNib];
  v3 = [(FBKInformationCell *)self textLabel];
  [v3 setAdjustsFontForContentSizeCategory:1];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)FBKInformationCell;
  [(FBKInformationCell *)&v4 setSelected:a3 animated:a4];
}

- (void)setQuestion:(id)a3
{
  id v5 = a3;
  if ([v5 answerType] == 6)
  {
    objc_storeStrong((id *)&self->_question, a3);
    v6 = [v5 text];
    v7 = [(FBKInformationCell *)self textLabel];
    [v7 setText:v6];
  }
  else
  {
    v8 = +[FBKLog appHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FBKInformationCell setQuestion:](v5, v8);
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

- (void)setQuestion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 ID];
  int v4 = 134217984;
  uint64_t v5 = [v3 integerValue];
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Tried to load Information Cell with a non-information type question, question id: %ld", (uint8_t *)&v4, 0xCu);
}

@end