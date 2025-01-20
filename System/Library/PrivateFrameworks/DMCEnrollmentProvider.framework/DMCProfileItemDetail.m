@interface DMCProfileItemDetail
+ (id)itemDetailWithTitle:(id)a3 detail:(id)a4;
- (DMCProfileItemDetail)initWithTitle:(id)a3 detail:(id)a4 trustText:(id)a5;
- (NSAttributedString)trustText;
- (NSString)detail;
- (NSString)title;
@end

@implementation DMCProfileItemDetail

+ (id)itemDetailWithTitle:(id)a3 detail:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[DMCProfileItemDetail alloc] initWithTitle:v6 detail:v5 trustText:0];

  return v7;
}

- (DMCProfileItemDetail)initWithTitle:(id)a3 detail:(id)a4 trustText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DMCProfileItemDetail;
  v12 = [(DMCProfileItemDetail *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_detail, a4);
    objc_storeStrong((id *)&v13->_trustText, a5);
  }

  return v13;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detail
{
  return self->_detail;
}

- (NSAttributedString)trustText
{
  return self->_trustText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustText, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end