@interface MCLURLRewriteRule
+ (id)urlRewriteRuleFromHost:(id)a3 toHost:(id)a4 ignoreHosts:(id)a5;
- (MCLURLRewriteRule)initWithMatchPattern:(id)a3 replacePattern:(id)a4 replaceTemplate:(id)a5 ignoreHosts:(id)a6;
- (void)rewriteURLRequest:(id)a3;
@end

@implementation MCLURLRewriteRule

+ (id)urlRewriteRuleFromHost:(id)a3 toHost:(id)a4 ignoreHosts:(id)a5
{
  Class v36 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  id v33 = 0;
  objc_storeStrong(&v33, a5);
  id v5 = (id)[location[0] stringByReplacingOccurrencesOfString:@"." withString:@"\\."];
  id v6 = location[0];
  location[0] = v5;

  id v7 = (id)[location[0] stringByReplacingOccurrencesOfString:@"*" withString:@".*"];
  id v8 = location[0];
  location[0] = v7;

  id v9 = (id)[NSString stringWithFormat:@"(https?://)%@(/.*)", location[0]];
  id v10 = location[0];
  location[0] = v9;

  id v32 = 0;
  id v30 = 0;
  id v22 = (id)[MEMORY[0x263F08AE8] regularExpressionWithPattern:location[0] options:1 error:&v30];
  objc_storeStrong(&v32, v30);
  id v31 = v22;
  if (v32) {
    NSLog(&cfstr_ErrorCompiling.isa, v32);
  }
  id v11 = (id)[v34 stringByReplacingOccurrencesOfString:@"." withString:@"\\."];
  id v12 = v34;
  id v34 = v11;

  id v13 = (id)[NSString stringWithFormat:@"$1%@$2", v34];
  id v14 = v34;
  id v34 = v13;

  id v17 = objc_alloc(MEMORY[0x263EFF9C0]);
  id v29 = (id)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v33, "count"));
  id v18 = v33;
  uint64_t v23 = MEMORY[0x263EF8330];
  int v24 = -1073741824;
  int v25 = 0;
  v26 = __63__MCLURLRewriteRule_urlRewriteRuleFromHost_toHost_ignoreHosts___block_invoke;
  v27 = &unk_26485A788;
  id v28 = v29;
  [v18 enumerateObjectsUsingBlock:&v23];
  id v15 = [v36 alloc];
  id v19 = (id)[v15 initWithMatchPattern:v31 replacePattern:v31 replaceTemplate:v34 ignoreHosts:v29];
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v19;
}

void __63__MCLURLRewriteRule_urlRewriteRuleFromHost_toHost_ignoreHosts___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[2] = a3;
  v14[1] = a1;
  id v3 = (id)[location[0] stringByReplacingOccurrencesOfString:@"." withString:@"\\."];
  id v4 = location[0];
  location[0] = v3;

  id v5 = (id)[location[0] stringByReplacingOccurrencesOfString:@"*" withString:@".*"];
  id v6 = location[0];
  location[0] = v5;

  id v7 = (id)[NSString stringWithFormat:@".*%@.*", location[0]];
  id v8 = location[0];
  location[0] = v7;

  v14[0] = 0;
  id obj = 0;
  id v11 = (id)[MEMORY[0x263F08AE8] regularExpressionWithPattern:location[0] options:1 error:&obj];
  objc_storeStrong(v14, obj);
  id v13 = v11;
  if (v14[0]) {
    NSLog(&cfstr_ErrorCompiling.isa, v14[0]);
  }
  else {
    [a1[4] addObject:v13];
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  objc_storeStrong(location, 0);
}

- (MCLURLRewriteRule)initWithMatchPattern:(id)a3 replacePattern:(id)a4 replaceTemplate:(id)a5 ignoreHosts:(id)a6
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v17 = 0;
  objc_storeStrong(&v17, a6);
  id v6 = v21;
  v21 = 0;
  v16.receiver = v6;
  v16.super_class = (Class)MCLURLRewriteRule;
  v21 = [(MCLURLRequestRewriteRule *)&v16 initWithMatchExpression:location[0] block:0];
  objc_storeStrong((id *)&v21, v21);
  if (v21)
  {
    objc_storeStrong((id *)&v21->_replacePattern, v19);
    uint64_t v7 = [v18 copy];
    replaceTemplate = v21->_replaceTemplate;
    v21->_replaceTemplate = (NSString *)v7;

    uint64_t v9 = [v17 copy];
    ignoreHosts = v21->_ignoreHosts;
    v21->_ignoreHosts = (NSSet *)v9;
  }
  id v12 = v21;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v12;
}

- (void)rewriteURLRequest:(id)a3
{
  int v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[location[0] URL];
  id v23 = (id)[v6 absoluteString];

  uint64_t v3 = [v23 length];
  uint64_t v27 = 0;
  uint64_t v26 = v3;
  uint64_t v28 = 0;
  uint64_t v29 = v3;
  *(void *)&long long v22 = 0;
  *((void *)&v22 + 1) = v3;
  uint64_t v17 = 0;
  id v18 = &v17;
  int v19 = 0x20000000;
  int v20 = 32;
  char v21 = 0;
  ignoreHosts = v25->_ignoreHosts;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = __39__MCLURLRewriteRule_rewriteURLRequest___block_invoke;
  id v14 = &unk_26485A7B0;
  v15[0] = v23;
  long long v16 = v22;
  v15[1] = &v17;
  [(NSSet *)ignoreHosts enumerateObjectsUsingBlock:&v10];
  if (v18[3])
  {
    int v9 = 1;
  }
  else
  {
    id v4 = [(NSRegularExpression *)v25->_replacePattern stringByReplacingMatchesInString:v23 options:0 range:v22 withTemplate:v25->_replaceTemplate];
    id v5 = v23;
    id v23 = v4;

    id v8 = (id)[NSURL URLWithString:v23];
    if (v8) {
      [location[0] setURL:v8];
    }
    objc_storeStrong(&v8, 0);
    int v9 = 0;
  }
  objc_storeStrong(v15, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __39__MCLURLRewriteRule_rewriteURLRequest___block_invoke(void *a1, void *a2, BOOL *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v7 = a3;
  v6[1] = a1;
  v6[0] = (id)objc_msgSend(location[0], "firstMatchInString:options:range:", a1[4], 0, a1[6], a1[7]);
  BOOL v5 = 0;
  if (v6[0]) {
    BOOL v5 = [v6[0] range] != 0x7FFFFFFFFFFFFFFFLL;
  }
  *uint64_t v7 = v5;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end