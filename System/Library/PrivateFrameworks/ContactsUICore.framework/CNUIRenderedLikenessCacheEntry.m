@interface CNUIRenderedLikenessCacheEntry
+ (id)entryWithObservable:(id)a3 token:(id)a4 contacts:(id)a5 scope:(id)a6;
- (CNCancelable)token;
- (CNObservable)imageObservable;
- (CNUILikenessRenderingScope)scope;
- (CNUIRenderedLikenessCacheEntry)initWithObservable:(id)a3 token:(id)a4 contacts:(id)a5 scope:(id)a6;
- (NSArray)contacts;
- (id)description;
@end

@implementation CNUIRenderedLikenessCacheEntry

- (CNObservable)imageObservable
{
  return self->_imageObservable;
}

+ (id)entryWithObservable:(id)a3 token:(id)a4 contacts:(id)a5 scope:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithObservable:v13 token:v12 contacts:v11 scope:v10];

  return v14;
}

- (CNUIRenderedLikenessCacheEntry)initWithObservable:(id)a3 token:(id)a4 contacts:(id)a5 scope:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNUIRenderedLikenessCacheEntry;
  v15 = [(CNUIRenderedLikenessCacheEntry *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_token, a4);
    objc_storeStrong((id *)&v16->_scope, a6);
    objc_storeStrong((id *)&v16->_contacts, a5);
    objc_storeStrong((id *)&v16->_imageObservable, a3);
    v17 = v16;
  }

  return v16;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  v4 = [(CNUIRenderedLikenessCacheEntry *)self contacts];
  v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_15);

  v6 = [v5 componentsJoinedByString:@","];
  id v7 = (id)[v3 appendName:@"contacts" object:v6];
  v8 = [(CNUIRenderedLikenessCacheEntry *)self scope];
  v9 = [v8 description];
  id v10 = (id)[v3 appendName:@"scope" object:v9];

  id v11 = [v3 build];

  return v11;
}

uint64_t __45__CNUIRenderedLikenessCacheEntry_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (CNCancelable)token
{
  return self->_token;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (CNUILikenessRenderingScope)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_imageObservable, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end