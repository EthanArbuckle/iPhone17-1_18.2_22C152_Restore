@interface FKSuggestionsWalletOrderAttachment
+ (id)readContentsOfOrderAtURL:(id)a3 error:(id *)a4;
- (FKSuggestionsWalletOrderAttachment)initWithURL:(id)a3 data:(id)a4 fqoid:(id)a5 state:(unint64_t)a6;
- (NSData)data;
- (NSString)fullyQualifiedOrderIdentifier;
- (NSURL)url;
- (unint64_t)orderState;
- (void)setOrderState:(unint64_t)a3;
@end

@implementation FKSuggestionsWalletOrderAttachment

- (FKSuggestionsWalletOrderAttachment)initWithURL:(id)a3 data:(id)a4 fqoid:(id)a5 state:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)FKSuggestionsWalletOrderAttachment;
  v13 = [(FKSuggestionsWalletOrderAttachment *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    url = v13->_url;
    v13->_url = (NSURL *)v14;

    uint64_t v16 = [v11 copy];
    data = v13->_data;
    v13->_data = (NSData *)v16;

    uint64_t v18 = [v12 copy];
    fullyQualifiedOrderIdentifier = v13->_fullyQualifiedOrderIdentifier;
    v13->_fullyQualifiedOrderIdentifier = (NSString *)v18;

    v13->_orderState = a6;
  }

  return v13;
}

+ (id)readContentsOfOrderAtURL:(id)a3 error:(id *)a4
{
  v4 = +[SuggestionsWalletOrderAttachment readContentsOfOrderAt:a3 error:a4];
  v5 = [FKSuggestionsWalletOrderAttachment alloc];
  v6 = [v4 url];
  v7 = [v4 data];
  v8 = [v4 fqoid];
  unint64_t v9 = [v4 state];
  if (v9 > 3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_24395EA88[v9];
  }
  id v11 = [(FKSuggestionsWalletOrderAttachment *)v5 initWithURL:v6 data:v7 fqoid:v8 state:v10];

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)fullyQualifiedOrderIdentifier
{
  return self->_fullyQualifiedOrderIdentifier;
}

- (unint64_t)orderState
{
  return self->_orderState;
}

- (void)setOrderState:(unint64_t)a3
{
  self->_orderState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullyQualifiedOrderIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end