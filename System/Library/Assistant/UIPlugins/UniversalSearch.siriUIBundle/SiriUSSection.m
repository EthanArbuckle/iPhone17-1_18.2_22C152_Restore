@interface SiriUSSection
- (NSArray)results;
- (NSString)title;
- (SAUIAppPunchOut)punchOut;
- (void)addResult:(id)a3;
- (void)setPunchOut:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SiriUSSection

- (void)addResult:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    results = self->_results;
    id v8 = v4;
    if (!results)
    {
      v6 = +[NSMutableArray array];
      v7 = self->_results;
      self->_results = v6;

      results = self->_results;
    }
    [(NSMutableArray *)results addObject:v8];
  }

  _objc_release_x1();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)results
{
  return &self->_results->super;
}

- (SAUIAppPunchOut)punchOut
{
  return self->_punchOut;
}

- (void)setPunchOut:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchOut, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

@end