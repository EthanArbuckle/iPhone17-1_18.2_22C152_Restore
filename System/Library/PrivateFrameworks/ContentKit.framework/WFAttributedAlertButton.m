@interface WFAttributedAlertButton
+ (id)buttonWithAttributedTitle:(id)a3 label:(id)a4 selected:(BOOL)a5 style:(int64_t)a6 handler:(id)a7;
- (NSAttributedString)attributedTitle;
- (NSString)label;
@end

@implementation WFAttributedAlertButton

+ (id)buttonWithAttributedTitle:(id)a3 label:(id)a4 selected:(BOOL)a5 style:(int64_t)a6 handler:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  v14 = [a1 buttonWithTitle:v13 subtitle:0 selected:v9 style:a6 handler:a7];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    v16 = (void *)v14[10];
    v14[10] = v15;

    uint64_t v17 = [v13 copy];
    v18 = (void *)v14[11];
    v14[11] = v17;

    v19 = v14;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

- (NSString)label
{
  return self->_label;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

@end