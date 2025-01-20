@interface DDSearchWebAction
- (BOOL)canBePerformedByOpeningURL;
- (DDSearchWebAction)initWithQueryString:(id)a3 range:(_NSRange)a4 context:(id)a5;
- (id)iconName;
- (id)localizedName;
- (void)performFromView:(id)a3;
@end

@implementation DDSearchWebAction

- (id)localizedName
{
  return DDLocalizedString(@"Search Web");
}

- (id)iconName
{
  return @"magnifyingglass.circle";
}

- (void)performFromView:(id)a3
{
  a3;
  if (self->super.super._result)
  {
    DDResultGetMatchedString();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    query = self->_query;
    if (!query) {
      goto LABEL_6;
    }
    v4 = query;
  }
  v6 = v4;
  DDPerformWebSearchFromQuery(v4);

LABEL_6:
  MEMORY[0x1F41817F8]();
}

- (BOOL)canBePerformedByOpeningURL
{
  return 0;
}

- (void).cxx_destruct
{
}

- (DDSearchWebAction)initWithQueryString:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  objc_msgSend(a3, "substringWithRange:", location, length);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  query = self->_query;
  self->_query = v10;

  v12 = [(DDAction *)self initWithURL:0 result:0 context:v9];
  return v12;
}

@end