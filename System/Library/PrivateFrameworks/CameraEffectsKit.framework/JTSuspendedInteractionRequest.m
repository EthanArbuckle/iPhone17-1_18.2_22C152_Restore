@interface JTSuspendedInteractionRequest
+ (id)requestWithTag:(id)a3 excludedViewControllers:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)excludedChildViewControllers;
- (NSString)tag;
- (unint64_t)hash;
- (void)setExcludedChildViewControllers:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation JTSuspendedInteractionRequest

+ (id)requestWithTag:(id)a3 excludedViewControllers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setTag:v6];

  [v7 setExcludedChildViewControllers:v5];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (JTSuspendedInteractionRequest *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(JTSuspendedInteractionRequest *)self tag];
      id v6 = [(JTSuspendedInteractionRequest *)v4 tag];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(JTSuspendedInteractionRequest *)self tag];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (NSArray)excludedChildViewControllers
{
  return self->_excludedChildViewControllers;
}

- (void)setExcludedChildViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedChildViewControllers, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end