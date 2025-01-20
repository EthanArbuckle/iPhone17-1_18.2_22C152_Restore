@interface MCLURLRequestRewriteRule
+ (id)urlRequestRewriteRuleWithMatchPattern:(id)a3 block:(id)a4;
- (MCLURLRequestRewriteRule)initWithMatchExpression:(id)a3 block:(id)a4;
- (NSRegularExpression)matchPattern;
- (NSString)name;
- (float)priority;
- (void)rewriteURLRequest:(id)a3;
- (void)setName:(id)a3;
- (void)setPriority:(float)a3;
@end

@implementation MCLURLRequestRewriteRule

- (MCLURLRequestRewriteRule)initWithMatchExpression:(id)a3 block:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)MCLURLRequestRewriteRule;
  v13 = [(MCLURLRequestRewriteRule *)&v10 init];
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)&v13->_matchPattern, location[0]);
    v5 = _Block_copy(v11);
    id block = v13->_block;
    v13->_id block = v5;
  }
  v8 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

+ (id)urlRequestRewriteRuleWithMatchPattern:(id)a3 block:(id)a4
{
  Class v14 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = 0;
  id v9 = 0;
  id v8 = (id)[MEMORY[0x263F08AE8] regularExpressionWithPattern:location[0] options:1 error:&v9];
  objc_storeStrong(&v11, v9);
  id v10 = v8;
  if (v11)
  {
    NSLog(&cfstr_ErrorCompiling.isa, v11);
    objc_storeStrong(&v11, 0);
  }
  id v4 = [v14 alloc];
  id v6 = (id)[v4 initWithMatchExpression:v10 block:v12];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)rewriteURLRequest:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_block) {
    (*((void (**)(void))v4->_block + 2))();
  }
  objc_storeStrong(location, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (NSRegularExpression)matchPattern
{
  return self->_matchPattern;
}

- (void).cxx_destruct
{
}

@end