@interface PARAsyncCard
+ (BOOL)supportsSecureCoding;
+ (id)cardWithTitle:(id)a3 url:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7;
+ (id)cardWithTitle:(id)a3 url:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7 clientQueryId:(unint64_t)a8;
- (PARAsyncCard)initWithCoder:(id)a3;
- (double)scale;
- (unint64_t)clientQueryId;
- (void)encodeWithCoder:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation PARAsyncCard

- (unint64_t)clientQueryId
{
  return self->_clientQueryId;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PARAsyncCard;
  id v4 = a3;
  [(PARAsyncCard *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_scale", self->_scale, v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_clientQueryId forKey:@"_clientQueryId"];
}

- (PARAsyncCard)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PARAsyncCard;
  objc_super v5 = [(PARAsyncCard *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_scale"];
    v5->_scale = v6;
    v5->_clientQueryId = [v4 decodeInt64ForKey:@"_clientQueryId"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)cardWithTitle:(id)a3 url:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7 clientQueryId:(unint64_t)a8
{
  id result = (id)[a1 cardWithTitle:a3 url:a4 session:a5 scale:a7 queryId:a6];
  if (result) {
    *((void *)result + 25) = a8;
  }
  return result;
}

+ (id)cardWithTitle:(id)a3 url:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7
{
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc_init(PARAsyncCard);
  [(PARAsyncCard *)v12 setType:2];
  [(PARAsyncCard *)v12 setSource:1];
  [(PARAsyncCard *)v12 setTitle:v11];

  v13 = (void *)[v10 copy];
  [(PARAsyncCard *)v12 setUrlValue:v13];

  [(PARAsyncCard *)v12 setQueryId:a7];
  v12->_scale = a6;

  return v12;
}

@end